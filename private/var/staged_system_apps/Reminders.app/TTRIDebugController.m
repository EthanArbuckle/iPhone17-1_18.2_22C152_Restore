@interface TTRIDebugController
- (_TtC9Reminders19TTRIDebugController)init;
@end

@implementation TTRIDebugController

- (_TtC9Reminders19TTRIDebugController)init
{
  uint64_t v3 = OBJC_IVAR____TtC9Reminders19TTRIDebugController_store;
  id v4 = objc_allocWithZone((Class)REMStore);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)[v4 init];

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for TTRIDebugController();
  return [(TTRIDebugController *)&v7 init];
}

- (void).cxx_destruct
{
}

@end