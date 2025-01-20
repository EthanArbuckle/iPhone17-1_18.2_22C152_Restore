@interface AudioNotification
+ (void)sendLiveRecordingOffNotificationWithInterrupt:(unsigned __int8)a3;
+ (void)sendLiveRecordingOnNotification;
@end

@implementation AudioNotification

+ (void)sendLiveRecordingOnNotification
{
  if (byte_1000FEAF0 == 1)
  {
    byte_1000FEAF0 = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.SpeechRecognitionCore.liveRecordingOnFromInterrupt", 0, 0, 0);
    v3 = RXOSLog();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v8 = 0;
    v4 = "Sending LiveRecordingOnFromInterrupt notification";
    v5 = (uint8_t *)&v8;
  }
  else
  {
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v6, @"com.apple.SpeechRecognitionCore.liveRecordingOn", 0, 0, 0);
    v3 = RXOSLog();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v7 = 0;
    v4 = "Sending LiveRecordingOn notification";
    v5 = (uint8_t *)&v7;
  }
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
}

+ (void)sendLiveRecordingOffNotificationWithInterrupt:(unsigned __int8)a3
{
  if (a3)
  {
    byte_1000FEAF0 = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.SpeechRecognitionCore.liveRecordingOffFromInterrupt", 0, 0, 0);
    v4 = RXOSLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v9 = 0;
    v5 = "Sending LiveRecordingOffFromInterrupt notification";
    v6 = (uint8_t *)&v9;
  }
  else
  {
    __int16 v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v7, @"com.apple.SpeechRecognitionCore.liveRecordingOff", 0, 0, 0);
    v4 = RXOSLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v8 = 0;
    v5 = "Sending LiveRecordingOff notification";
    v6 = (uint8_t *)&v8;
  }
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
}

@end