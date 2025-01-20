@interface ShortcutsDataManager
- (_TtC7NewsUI220ShortcutsDataManager)init;
- (void)dealloc;
@end

@implementation ShortcutsDataManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (unint64_t *)(*__swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC7NewsUI220ShortcutsDataManager_shortcutsService), *(void *)&self->shortcutsService[OBJC_IVAR____TtC7NewsUI220ShortcutsDataManager_shortcutsService])+ OBJC_IVAR____TtC7NewsUI216ShortcutsService_observers);
  swift_beginAccess();
  unint64_t v5 = *v4;
  v7[2] = self;
  v7[3] = &off_1F3AD2D98;
  v6 = self;
  swift_bridgeObjectRetain();
  unint64_t *v4 = (unint64_t)sub_1DE9D939C((uint64_t (*)(uint64_t *))sub_1DFD3478C, v7, v5);

  swift_bridgeObjectRelease();
  v8.receiver = v6;
  v8.super_class = ObjectType;
  [(ShortcutsDataManager *)&v8 dealloc];
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI220ShortcutsDataManager_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220ShortcutsDataManager_shortcutsService);

  swift_release();
}

- (_TtC7NewsUI220ShortcutsDataManager)init
{
  result = (_TtC7NewsUI220ShortcutsDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end