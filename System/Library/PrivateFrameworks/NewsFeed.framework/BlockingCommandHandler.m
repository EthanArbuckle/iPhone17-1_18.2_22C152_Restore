@interface BlockingCommandHandler
- (_TtC8NewsFeed22BlockingCommandHandler)init;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
@end

@implementation BlockingCommandHandler

- (_TtC8NewsFeed22BlockingCommandHandler)init
{
  result = (_TtC8NewsFeed22BlockingCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed22BlockingCommandHandler_subscriptionController));
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22BlockingCommandHandler_commandCenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22BlockingCommandHandler_sceneProvider);
  swift_unknownObjectRelease();
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  if (a4)
  {
    sub_1C151EFBC();
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a5) {
LABEL_3:
  }
    sub_1C151EFBC();
LABEL_4:
  if (a6) {
    sub_1C151EFBC();
  }
  if (a7) {
    sub_1C151EFBC();
  }
  id v13 = a3;
  v14 = self;
  if (MEMORY[0x1C18C9C60]((char *)v14 + OBJC_IVAR____TtC8NewsFeed22BlockingCommandHandler_commandCenter))
  {
    swift_getObjectType();
    if (qword_1EB87B188 != -1) {
      swift_once();
    }
    sub_1BFFB52BC();
    sub_1C151AD4C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end