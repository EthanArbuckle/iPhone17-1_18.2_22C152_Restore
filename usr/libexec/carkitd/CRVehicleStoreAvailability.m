@interface CRVehicleStoreAvailability
+ (BOOL)isVehicleStoreAvailable;
+ (id)notifydEventName;
+ (void)_updateUnlockedSinceBoot;
+ (void)handleAvailabilityEvent;
+ (void)registerForAvailabilityEvent;
@end

@implementation CRVehicleStoreAvailability

+ (void)_updateUnlockedSinceBoot
{
  int v2 = MKBDeviceUnlockedSinceBoot();
  int v3 = v2;
  if (!v2)
  {
    v4 = CarGeneralLogging();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "before first unlock", v5, 2u);
LABEL_9:
    LOBYTE(v3) = 0;
    goto LABEL_10;
  }
  if (v2 != 1)
  {
    v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006F7CC(v3, v4);
    }
    goto LABEL_9;
  }
  v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    LOBYTE(v3) = 1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "completed first unlock", buf, 2u);
  }
LABEL_10:

  byte_1000E3830 = v3;
}

+ (BOOL)isVehicleStoreAvailable
{
  if (byte_1000E3830) {
    return 1;
  }
  [a1 _updateUnlockedSinceBoot];
  return byte_1000E3830;
}

+ (void)registerForAvailabilityEvent
{
  int v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "waiting for first unlock", v6, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)sub_10000A5E4, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "Notification", "com.apple.mobile.keybagd.first_unlock");
  xpc_set_event();
}

+ (void)handleAvailabilityEvent
{
  [a1 _updateUnlockedSinceBoot];
  if ([a1 isVehicleStoreAvailable])
  {
    int v3 = CarGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "completed first unlock", v6, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, a1, @"com.apple.mobile.keybagd.first_unlock", 0);
    xpc_set_event();
    xpc_object_t v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:CRVehicleStoreAvailabilityDidChangeNotification object:0];
  }
}

+ (id)notifydEventName
{
  return @"com.apple.mobile.keybagd.first_unlock";
}

@end