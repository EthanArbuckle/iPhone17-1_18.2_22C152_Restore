@interface ArticleToArticleSwipeTestCase
- (NSString)testName;
- (_TtC7NewsUI229ArticleToArticleSwipeTestCase)init;
- (double)timeoutInSeconds;
- (unint64_t)aggregate;
- (void)runTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation ArticleToArticleSwipeTestCase

- (NSString)testName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC7NewsUI229ArticleToArticleSwipeTestCase)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI229ArticleToArticleSwipeTestCase_testName);
  void *v4 = 0xD000000000000015;
  v4[1] = 0x80000001DFEBA9B0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI229ArticleToArticleSwipeTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI229ArticleToArticleSwipeTestCase_aggregate) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ArticleToArticleSwipeTestCase *)&v6 init];
}

- (double)timeoutInSeconds
{
  return 120.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC7NewsUI229ArticleToArticleSwipeTestCase_aggregate);
}

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1DFC88B18(v8, (uint64_t)sub_1DEABCF08, v7);

  swift_release();
}

- (void).cxx_destruct
{
}

@end