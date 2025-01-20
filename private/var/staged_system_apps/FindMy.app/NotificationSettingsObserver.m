@interface NotificationSettingsObserver
- (_TtC6FindMy28NotificationSettingsObserver)init;
- (void)dealloc;
- (void)sceneWillEnterForegroundWithNotification:(id)a3;
@end

@implementation NotificationSettingsObserver

- (_TtC6FindMy28NotificationSettingsObserver)init
{
  return (_TtC6FindMy28NotificationSettingsObserver *)sub_100425588();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "NotificationSettingsObserver: Deinit", v7, 2u);
    swift_slowDealloc();
  }

  sub_100425AF4();
  v8.receiver = v4;
  v8.super_class = ObjectType;
  [(NotificationSettingsObserver *)&v8 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy28NotificationSettingsObserver_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)sceneWillEnterForegroundWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  objc_super v8 = self;
  sub_100426158();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end