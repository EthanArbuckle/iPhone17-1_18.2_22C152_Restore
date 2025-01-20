@interface ShortcutsOnboardingManager
- (_TtC7NewsUI226ShortcutsOnboardingManager)init;
- (void)dealloc;
- (void)userInfoDidChangeShortcutsOnboardingState:(id)a3;
@end

@implementation ShortcutsOnboardingManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI226ShortcutsOnboardingManager_userInfo);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(ShortcutsOnboardingManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (_TtC7NewsUI226ShortcutsOnboardingManager)init
{
  result = (_TtC7NewsUI226ShortcutsOnboardingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)userInfoDidChangeShortcutsOnboardingState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DFD0BB20();
}

@end