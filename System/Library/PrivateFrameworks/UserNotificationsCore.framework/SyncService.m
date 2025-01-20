@interface SyncService
- (_TtC21UserNotificationsCore11SyncService)init;
- (void)dealloc;
@end

@implementation SyncService

- (_TtC21UserNotificationsCore11SyncService)init
{
  SyncService.init()();
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21UserNotificationsCore11SyncService_queue_flushTimer))
  {
    swift_getObjectType();
    v4 = self;
    swift_unknownObjectRetain();
    sub_260A85150();
    swift_unknownObjectRelease();
  }
  else
  {
    v5 = self;
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(SyncService *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_26094056C((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore11SyncService_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end