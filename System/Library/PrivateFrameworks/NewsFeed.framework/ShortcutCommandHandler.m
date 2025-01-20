@interface ShortcutCommandHandler
- (_TtC8NewsFeed22ShortcutCommandHandler)init;
- (void)dealloc;
- (void)shortcutList:(id)a3 didAddShortcuts:(id)a4 changedShortcuts:(id)a5 removedShortcuts:(id)a6;
@end

@implementation ShortcutCommandHandler

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed22ShortcutCommandHandler_shortcutList);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(ShortcutCommandHandler *)&v6 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22ShortcutCommandHandler_shortcutManager);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22ShortcutCommandHandler_featureAvailability);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed22ShortcutCommandHandler_commandCenter;
  sub_1C019B9B4((uint64_t)v3);
}

- (_TtC8NewsFeed22ShortcutCommandHandler)init
{
  result = (_TtC8NewsFeed22ShortcutCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)shortcutList:(id)a3 didAddShortcuts:(id)a4 changedShortcuts:(id)a5 removedShortcuts:(id)a6
{
  if (MEMORY[0x1C18C9C60]((char *)self + OBJC_IVAR____TtC8NewsFeed22ShortcutCommandHandler_commandCenter, a2, a3, a4, a5, a6))
  {
    swift_getObjectType();
    uint64_t v8 = qword_1EB885468;
    id v9 = a3;
    v10 = self;
    if (v8 != -1) {
      swift_once();
    }
    sub_1C151AD4C();

    swift_unknownObjectRelease();
  }
}

@end