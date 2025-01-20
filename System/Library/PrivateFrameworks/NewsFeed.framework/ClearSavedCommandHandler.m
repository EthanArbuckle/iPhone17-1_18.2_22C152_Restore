@interface ClearSavedCommandHandler
- (_TtC8NewsFeed24ClearSavedCommandHandler)init;
- (void)dealloc;
- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6;
@end

@implementation ClearSavedCommandHandler

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed24ClearSavedCommandHandler_readingList);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(ClearSavedCommandHandler *)&v6 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed24ClearSavedCommandHandler_sceneProvider);
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed24ClearSavedCommandHandler_commandCenter;
  sub_1C019B9B4((uint64_t)v3);
}

- (_TtC8NewsFeed24ClearSavedCommandHandler)init
{
  result = (_TtC8NewsFeed24ClearSavedCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  if (MEMORY[0x1C18C9C60]((char *)self + OBJC_IVAR____TtC8NewsFeed24ClearSavedCommandHandler_commandCenter, a2, a3, a4, a5, a6))
  {
    swift_getObjectType();
    uint64_t v8 = qword_1EB87B150;
    id v9 = a3;
    v10 = self;
    if (v8 != -1) {
      swift_once();
    }
    sub_1C007A828(0);
    sub_1C151AD4C();

    swift_unknownObjectRelease();
  }
}

@end