@interface ArticleToArticleSwipeTestSuite
- (_TtC7NewsUI230ArticleToArticleSwipeTestSuite)init;
- (void)setupTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation ArticleToArticleSwipeTestSuite

- (_TtC7NewsUI230ArticleToArticleSwipeTestSuite)init
{
  return (_TtC7NewsUI230ArticleToArticleSwipeTestSuite *)sub_1DE9569AC();
}

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1DF6E5AE0(v8, (uint64_t)sub_1DEABCF08, v7);

  swift_release();
}

- (void).cxx_destruct
{
  sub_1DE933434((uint64_t)self + OBJC_IVAR____TtC7NewsUI230ArticleToArticleSwipeTestSuite_scrollViewObserver, (unint64_t *)&unk_1EBABE490, (unint64_t *)&unk_1EBABE480, MEMORY[0x1E4FAA818]);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7NewsUI230ArticleToArticleSwipeTestSuite_scrollViewContentOffsetObserver));
  unint64_t v3 = *(unint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC7NewsUI230ArticleToArticleSwipeTestSuite_activity);
  sub_1DEAF0150(v3);
}

@end