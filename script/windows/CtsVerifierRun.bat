@echo off&setlocal  enabledelayedexpansion
@pushd C:\WINDOWS\system32
@mode con cols=100 lines=26
@cls
@color 1f
@title CTS Verifier�Զ����� %date%
cls
echo.
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo mshta vbscript:msgbox("���������Ƿ���������ɣ� ")(window.close) //����vbs�ű��Ի���
echo              δ��⵽�豸....
adb wait-for-device>nul
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo              ���ڰ�װ����APP....
adb install -r E:\android\AndroidStudioProjects\TestDemo\Uiautomator\CtsVerifier\app\build\outputs\apk\app-debug.apk
adb install -r E:\android\AndroidStudioProjects\TestDemo\Uiautomator\CtsVerifier\app\build\outputs\apk\app-debug-androidTest-unaligned.apk

goto mainui
:getphoneinfo
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo ����ֻ���Ϣ����ʾ������
adb shell cat /system/build.prop>phone.info
FOR /F "tokens=1,2 delims==" %%a in (phone.info) do (
    IF %%a == ro.build.display.id SET androidOS=%%b
    IF %%a == ro.product.model SET model=%%b
    IF %%a == ro.build.version.sdk SET sdkverision=%%b
)
del /a/f/q phone.info
if %sdkverision% geq 21 (goto android66) else (goto mainui)
:android66
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo           ��ǰ��ĿΪAndroid 5.0����ƽ̨
echo         ���ڼ��Ӧ���Ƿ��ȡȨ��....���Ե�
echo.
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.ReadyToTest com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
goto mainui
:mainui
adb wait-for-device>nul
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo           ��ѡ�������:
echo           1:AudioTest                  2: Camera                          3: CAR
echo           4: Clock                     5: Device Adminnistartion          6: Features
echo           7: Hardware                  8: Job Scheduler                   9: Location
echo          10: Managed Provisioning      11: NetWork                       12: Notifications
echo          13: Other                     14: Projection Tests              15: Security
echo          16: Sensors                   17: Streaming                     18: Test All item
echo.
echo ��ѡ�������1~18 ��q �˳�

echo.&echo.
set/p a=��������������Ϊ��
if %a%==1 goto audiotest
if %a%==2 goto cameratest
if %a%==3 goto cartest
if %a%==4 goto clocktest
if %a%==5 goto deviceadmin
if %a%==6 goto featurestest
if %a%==7 goto hardwretest
if %a%==8 goto jobscheduler
if %a%==9 goto locationtest
if %a%==10 goto managedprovisioning
if %a%==11 goto networktest
if %a%==12 goto notificationstest
if %a%==13 goto othertest
if %a%==14 goto projectiontest
if %a%==15 goto securitytest
if %a%==16 goto sensorstest
if %a%==17 goto streamingtest
if %a%==18 goto testall
if %a%==q goto exit

:audiotest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   �������� Audio Loopback Latency Test/Hifi Ultrasound Microphone/Speaker  Test δ���ڲ�������
echo.
adb wait-for-device>nul
echo   ��ʼ����
echo   -------------��AudioTest��-------------------
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.AudioTestCase com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto mainui
:cameratest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo          ��ѡ������
echo          21. Camera FOV Calibration        22. Camera Flashlight         23.Camera Formats
echo          24. Camera ITS Test               25. Camera Intents            26.Camera Orientation
echo          27. Camera ITS Test               28.  Test All Camera item 
echo.
echo ��ѡ�������1~18 ��q �˳�����������

echo.&echo.
set/p b=������������������Ϊ��
if %b%==21 goto camera_fov
if %b%==22 goto camera_flash
if %b%==23 goto camera_formats
if %b%==24 goto camera_iis
if %b%==25 goto camera_intents
if %b%==26 goto camera_orientation
if %b%==27 goto cameratest
if %b%==28 goto camera_all
if %b%==q goto mainui
:camera_fov
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Camera FOV Calibration  ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_Fov_Calibration com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto cameratest
:camera_flash
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Camera Flashlight  ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_Flashlight com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto cameratest
:camera_formats
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Camera Formats  ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_Formats com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto cameratest
:camera_iis
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Camera ITS Test  ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_ITS_Test com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto cameratest

:camera_intents
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Camera Intents ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_intents com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto cameratest
:camera_orientation
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Camera Orientation ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_Orientation com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto cameratest
:camera_video
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Camera Video  ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_Video com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto cameratest
:camera_all
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Camera ���в�����������������ִ��  ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_Fov_Calibration com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_Flashlight com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_Formats com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_ITS_Test com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_intents com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_Orientation com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CameraTestCase#Camera_Video com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto cameratest
:cartest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� CAR��������   ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.CARTestCase#Car_Dock_test com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto mainui
:clocktest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Clock��������   ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.ClockTestCase com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto mainui


:featurestest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Hardware/Software Feature Summary��������   ....

adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.FeaturesTestCase#Hardware_and_software_feature_summary com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto mainui

:deviceadmin
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo  test ��Device Administration-----Policy_Serialization_test��
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Device_Administration_TestCase#Policy_Serialization_test_before com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
adb reboot
adb wait-for-device>nul
ping -n 30 127.1>nul
echo ��unlock the screen��
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.UnLocked#unlocked_screen com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner

echo  test ��Device Administration-----Policy_Serialization_test set passed��
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Device_Administration_TestCase#Policy_Serialization_test com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
echo  test ��Device Administration-----Screen Lock Test��
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Device_Administration_TestCase#ScreenLockTest com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto mainui
:jobscheduler
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo  test ��Job Scheduler ��
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Job_Scheduler_TestCase#Job_Charging_Constraints_Test com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto mainui
:locationtest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo  test ��Location Mode Test��
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Location_TestCase#Location_mode_test com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto mainui

:managedprovisioning
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo  test ��Managed Provisioning Test��
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Managed_Provisioning_TestCase#Device_Owner_Provisioning com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
adb shell dpm set-device-owner 'com.android.cts.verifier/com.android.cts.verifier.managedprovisioning.DeviceAdminTestReceiver'
pause
goto mainui


:hardwretest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo              ��ģ����δ��Ӳ�����������������������˵�
pause
goto mainui

:networktest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo              ��ģ����δ��Ӳ�����������������������˵�
pause
goto mainui
:notificationstest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo              ��ģ����δ��Ӳ�����������������������˵�
pause
goto mainui

:streamingtest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo              ��ģ����δ��Ӳ�����������������������˵�
pause
goto mainui
:projectiontest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo-----------------------��ʼִ�� Projection 6��
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Projection_TestCase com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto mainui
:othertest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ����Other ��������   ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Other_TestCase com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner

echo  ------------------- ��Other Test��-------------------
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Security_TestCase com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto mainui
:sensorstest
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Hardware/Software Feature Summary��������   ....
echo  -------------------��SenSors Test��-------------------
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.SenSors_TestCase com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto mainui

:securitytest

cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
echo   ��ʼ���� Security TestCase��������   ....
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Security_TestCase#KeyChain_Storage_Test com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Security_TestCase#Keyguard_Password_Verification com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Security_TestCase#Lock_Bound_Keys_Test com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
adb shell am instrument -w -r   -e debug false -e class com.fxly.ctsverifier.testcase.Security_TestCase#SUID_File_Scanner com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner
pause
goto mainui

:testall
cls
echo              �q�����������������������������������������������������������������r
echo        �q������                    CTS Verifier�Զ�����                        �������r
echo        ��    �t�����������������������������������������������������������������s    ��
echo        ��                                                                            ��
echo        ��       �����ߣ�����                                                         ��
echo        ��                                                                            ��
echo        ��    �������                                                              ��
echo        ��                                                                            ��
echo        ��    1����������Ϊ��������                                                   ��
echo        ��    2����������Ϊ30����                                                     ��
echo        ��    3��Stay awake����Ϊ�رա�������ģʽ��                                   ��
echo        ��    4��Location����ΪĬ�Ͽ���                                               ��
echo        �t�����������������������������������������������������������������������������s
echo.
set a=CTS Verifier�Զ�����
set b=%time:~0,5%
set c=%date%

echo   ��ʼ���� ȫ����������   ....

adb shell am instrument -w -r   -e package com.fxly.ctsverifier -e debug false com.fxly.ctsverifier.test/android.support.test.runner.AndroidJUnitRunner

echo      ��������
set d=%time:~0,5%
set e=%date%
echo %c% ��ʼʱ�䣺%b% %a%  ��������ʱ�䣺%d% %e% 
pause
goto mainui
:report
set a=CTS Verifier�Զ�����
set b=%time:~0,5%
set c=%date%
echo      ����
echo %c% ʱ�䣺%b% %a%
pause
pause>>nul