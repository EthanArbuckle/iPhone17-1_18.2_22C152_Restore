@interface ShortcutsService
- (_TtC7NewsUI216ShortcutsService)init;
- (void)dealloc;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
@end

@implementation ShortcutsService

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI216ShortcutsService_subscriptionController);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  uint64_t v6 = *__swift_project_boxed_opaque_existential_1((Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC7NewsUI216ShortcutsService_favoritedShortcutService), *(void *)&v5->cacheManager[OBJC_IVAR____TtC7NewsUI216ShortcutsService_favoritedShortcutService]);
  v7 = v5;
  sub_1DED32CD0((uint64_t)v7, v6);

  v8.receiver = v7;
  v8.super_class = ObjectType;
  [(ShortcutsService *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216ShortcutsService_cacheManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216ShortcutsService_favoritedShortcutService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216ShortcutsService_headlineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216ShortcutsService_resourceService);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216ShortcutsService_tagSuggestionService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216ShortcutsService_issueService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216ShortcutsService_puzzleAccessProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216ShortcutsService_puzzleService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216ShortcutsService_sportsEventController);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216ShortcutsService_issueModelFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216ShortcutsService_headlineModelFactory);

  swift_bridgeObjectRelease();
}

- (_TtC7NewsUI216ShortcutsService)init
{
  result = (_TtC7NewsUI216ShortcutsService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  if (a4)
  {
    uint64_t v14 = sub_1DFDFE5D0();
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v14 = 0;
  if (a5) {
LABEL_3:
  }
    sub_1DFDFE5D0();
LABEL_4:
  if (a6) {
    sub_1DFDFE5D0();
  }
  if (a7) {
    sub_1DFDFE5D0();
  }
  id v15 = a3;
  v16 = self;
  sub_1DED356F0(v14, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end