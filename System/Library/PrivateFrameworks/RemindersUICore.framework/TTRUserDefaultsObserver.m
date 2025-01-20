@interface TTRUserDefaultsObserver
- (_TtC15RemindersUICore23TTRUserDefaultsObserver)init;
- (void)dealloc;
- (void)stopObserving;
@end

@implementation TTRUserDefaultsObserver

- (void)stopObserving
{
  uint64_t v2 = OBJC_IVAR____TtC15RemindersUICore23TTRUserDefaultsObserver_removed;
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore23TTRUserDefaultsObserver_removed) & 1) == 0)
  {
    v4 = self;
    sub_1B97BD000((uint64_t)v4);
    *((unsigned char *)&self->super.isa + v2) = 1;
  }
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC15RemindersUICore23TTRUserDefaultsObserver_removed;
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore23TTRUserDefaultsObserver_removed) == 1)
  {
    v5 = self;
  }
  else
  {
    sub_1B97BD000((uint64_t)self);
    *((unsigned char *)&self->super.isa + v4) = 1;
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(TTRUserDefaultsObserver *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore23TTRUserDefaultsObserver_userDefaults);
}

- (_TtC15RemindersUICore23TTRUserDefaultsObserver)init
{
  result = (_TtC15RemindersUICore23TTRUserDefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end