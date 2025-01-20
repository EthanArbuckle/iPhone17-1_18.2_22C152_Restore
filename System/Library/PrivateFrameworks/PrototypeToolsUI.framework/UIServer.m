@interface UIServer
- (_TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer)init;
- (void)handlePrototypingEvent:(int64_t)a3;
- (void)launchForRemoteEditing;
@end

@implementation UIServer

- (void)handlePrototypingEvent:(int64_t)a3
{
  v4 = self;
  sub_10000C494(a3);
}

- (void)launchForRemoteEditing
{
  uint64_t v2 = qword_1000205E0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000E250(v4, (uint64_t)qword_1000208F0);
  oslog = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v5, "launchForRemoteEditing", v6, 2u);
    swift_slowDealloc();
  }
}

- (_TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer_domainServer;
  id v5 = objc_allocWithZone((Class)PTDomainServer);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)[v5 init];
  *(Class *)((char *)&v6->super.isa
           + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer____lazy_storage___editingServer) = 0;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  v7 = [(UIServer *)&v9 init];
  swift_release();
  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer_domainServer));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10prototypedP33_7D6121B4D28911B7760A4E8ABB7760C28UIServer____lazy_storage___editingServer);
}

@end