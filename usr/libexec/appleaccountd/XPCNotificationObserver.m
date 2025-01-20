@interface XPCNotificationObserver
- (void)didChangeEnvironment;
@end

@implementation XPCNotificationObserver

- (void)didChangeEnvironment
{
  if (qword_100320B70 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007288(v0, (uint64_t)qword_10033E700);
  v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "XPC observer: didChangeEnvironment, resetting session cache.", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [self sharedSession];
  [v4 resetSessionCache];
}

@end