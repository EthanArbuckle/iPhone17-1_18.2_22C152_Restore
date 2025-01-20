@interface UnwantedTrackingUserNotificationDelegate
- (_TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate)init;
- (void)dealloc;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UnwantedTrackingUserNotificationDelegate

- (_TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate)init
{
  return (_TtC12searchpartyd40UnwantedTrackingUserNotificationDelegate *)sub_10001E3E8();
}

- (void)dealloc
{
  uint64_t v2 = qword_101637110;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100010324(v4, (uint64_t)qword_10170ED70);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "UnwantedTrackingUserNotificationDelegate: Deinit", v7, 2u);
    swift_slowDealloc();
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for UnwantedTrackingUserNotificationDelegate();
  [(UnwantedTrackingUserNotificationDelegate *)&v8 dealloc];
}

- (void).cxx_destruct
{
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  objc_super v8 = _Block_copy(a5);
  _Block_copy(v8);
  uint64_t v9 = qword_101637110;
  id v10 = a3;
  id v11 = a4;
  v16 = self;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100010324(v12, (uint64_t)qword_10170ED70);
  v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "UnwantedTrackingUserNotificationDelegate: willPresentNotification", v15, 2u);
    swift_slowDealloc();
  }

  (*((void (**)(void *, uint64_t))v8 + 2))(v8, 19);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  objc_super v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_10001FDD8(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

@end