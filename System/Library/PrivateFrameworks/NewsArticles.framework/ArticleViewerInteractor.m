@interface ArticleViewerInteractor
- (_TtC12NewsArticles23ArticleViewerInteractor)init;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
@end

@implementation ArticleViewerInteractor

- (_TtC12NewsArticles23ArticleViewerInteractor)init
{
  result = (_TtC12NewsArticles23ArticleViewerInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BF4A7CC8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_delegate);
  sub_1BF55481C((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_coordinator, (uint64_t (*)(void))sub_1BF55487C);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_blueprintProvider);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_pageBlueprintFactory);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_pageTracker);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_historyService);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles23ArticleViewerInteractor_offlineManager);
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  uint64_t v11 = (uint64_t)a5;
  if (a4)
  {
    sub_1BF7E3EE8();
    if (!v11) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a5) {
LABEL_3:
  }
    uint64_t v11 = sub_1BF7E3EE8();
LABEL_4:
  if (a6) {
    sub_1BF7E3EE8();
  }
  if (a7) {
    sub_1BF7E3EE8();
  }
  id v14 = a3;
  v15 = self;
  sub_1BF55475C(v11, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end