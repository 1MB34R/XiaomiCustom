fastboot $* getvar product 2>&1 | grep -E "^product: *daisy$"
if [ $? -ne 0 ] ; then echo "error : Missmatching image and device"; exit 1; fi
CURRENT_ANTI_VER=1
version=`fastboot getvar rollback_ver 2>&1 | grep "rollback_ver:" | awk -F ": " '{print $2}'`
if [  "${version}"x == ""x ] ; then version=0 ; fi
if [ ${version} -gt ${CURRENT_ANTI_VER} ] ; then  echo "error : current device antirollback version is greater than this package" ; exit 1 ; fi
fastboot $* erase boot_a
if [ $? -ne 0 ] ; then echo "Erase boot_a error"; exit 1; fi
fastboot $* flash modem_a `dirname $0`/images/modem.img
if [ $? -ne 0 ] ; then echo "Flash modem_a error"; exit 1; fi
fastboot $* flash modem_b `dirname $0`/images/modem.img
if [ $? -ne 0 ] ; then echo "Flash modem_b error"; exit 1; fi	
fastboot $* flash sbl1_a `dirname $0`/images/sbl1.img
if [ $? -ne 0 ] ; then echo "Flash sbl1_a error"; exit 1; fi
fastboot $* flash sbl1_b `dirname $0`/images/sbl1.img
if [ $? -ne 0 ] ; then echo "Flash sbl1_b error"; exit 1; fi
fastboot $* flash rpm_a `dirname $0`/images/rpm.img
if [ $? -ne 0 ] ; then echo "Flash rpm_a error"; exit 1; fi
fastboot $* flash rpm_b `dirname $0`/images/rpm.img
if [ $? -ne 0 ] ; then echo "Flash rpm_b error"; exit 1; fi
fastboot $* flash tz_a `dirname $0`/images/tz.img
if [ $? -ne 0 ] ; then echo "Flash tz_a error"; exit 1; fi
fastboot $* flash tz_b `dirname $0`/images/tz.img
if [ $? -ne 0 ] ; then echo "Flash tz_b error"; exit 1; fi
fastboot $* flash devcfg_a `dirname $0`/images/devcfg.img
if [ $? -ne 0 ] ; then echo "Flash devcfg_a error"; exit 1; fi
fastboot $* flash devcfg_b `dirname $0`/images/devcfg.img
if [ $? -ne 0 ] ; then echo "Flash devcfg_b error"; exit 1; fi
fastboot $* flash dsp_a `dirname $0`/images/dsp.img
if [ $? -ne 0 ] ; then echo "Flash dsp_a error"; exit 1; fi
fastboot $* flash dsp_b `dirname $0`/images/dsp.img
if [ $? -ne 0 ] ; then echo "Flash dsp_b error"; exit 1; fi	
fastboot $* flash sec `dirname $0`/images/sec.dat
if [ $? -ne 0 ] ; then echo "Flash sec error"; exit 1; fi
fastboot $* flash splash `dirname $0`/images/splash.img
if [ $? -ne 0 ] ; then echo "Flash splash error"; exit 1; fi
fastboot $* flash aboot_a `dirname $0`/images/emmc_appsboot.mbn
if [ $? -ne 0 ] ; then echo "Flash aboot_a error"; exit 1; fi
fastboot $* flash aboot_b `dirname $0`/images/emmc_appsboot.mbn
if [ $? -ne 0 ] ; then echo "Flash aboot_b error"; exit 1; fi
fastboot $* flash boot_a `dirname $0`/images/boot.img
if [ $? -ne 0 ] ; then echo "Flash boot_a error"; exit 1; fi
fastboot $* flash boot_b `dirname $0`/images/boot.img
if [ $? -ne 0 ] ; then echo "Flash boot_b error"; exit 1; fi
fastboot $* flash system_a `dirname $0`/images/system.img
if [ $? -ne 0 ] ; then echo "Flash system_a error"; exit 1; fi
fastboot $* flash system_b `dirname $0`/images/system_other.img
if [ $? -ne 0 ] ; then echo "Flash system_b error"; exit 1; fi	
fastboot $* flash vendor_a `dirname $0`/images/vendor.img
if [ $? -ne 0 ] ; then echo "Flash vendor_a error"; exit 1; fi
fastboot $* flash vendor_b `dirname $0`/images/vendor.img
if [ $? -ne 0 ] ; then echo "Flash vendor_b error"; exit 1; fi
fastboot $* flash lksecapp `dirname $0`/images/lksecapp.img
if [ $? -ne 0 ] ; then echo "Flash lksecapp error"; exit 1; fi
fastboot $* flash lksecappbak `dirname $0`/images/lksecapp.img
if [ $? -ne 0 ] ; then echo "Flash lksecappbak error"; exit 1; fi
fastboot $* flash cmnlib_a `dirname $0`/images/cmnlib.img
if [ $? -ne 0 ] ; then echo "Flash cmnlib_a error"; exit 1; fi
fastboot $* flash cmnlib_b `dirname $0`/images/cmnlib.img
if [ $? -ne 0 ] ; then echo "Flash cmnlib_b error"; exit 1; fi
fastboot $* flash cmnlib64_a `dirname $0`/images/cmnlib64.img
if [ $? -ne 0 ] ; then echo "Flash cmnlib64_a error"; exit 1; fi
fastboot $* flash cmnlib64_b `dirname $0`/images/cmnlib64.img
if [ $? -ne 0 ] ; then echo "Flash cmnlib64_b error"; exit 1; fi
fastboot $* flash keymaster_a `dirname $0`/images/keymaster.img
if [ $? -ne 0 ] ; then echo "Flash keymaster_a error"; exit 1; fi
fastboot $* flash keymaster_b `dirname $0`/images/keymaster.img
if [ $? -ne 0 ] ; then echo "Flash keymaster_b error"; exit 1; fi
fastboot $* flash userdata `dirname $0`/images/userdata.img
if [ $? -ne 0 ] ; then echo "Flash userdata error"; exit 1; fi
fastboot $* set_active a
fastboot $* reboot
if [ $? -ne 0 ] ; then echo "Reboot error"; exit 1; fi
