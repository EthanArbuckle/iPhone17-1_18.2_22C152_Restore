@interface OpenWebArticleTestCase
- (NSString)testName;
- (_TtC7NewsUI222OpenWebArticleTestCase)init;
- (double)timeoutInSeconds;
- (unint64_t)aggregate;
- (void)runTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation OpenWebArticleTestCase

- (_TtC7NewsUI222OpenWebArticleTestCase)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC7NewsUI222OpenWebArticleTestCase_testName;
  strcpy((char *)self + OBJC_IVAR____TtC7NewsUI222OpenWebArticleTestCase_testName, "OpenWebArticle");
  v4[15] = -18;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI222OpenWebArticleTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI222OpenWebArticleTestCase_aggregate) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(OpenWebArticleTestCase *)&v6 init];
}

- (NSString)testName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)timeoutInSeconds
{
  return 120.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI222OpenWebArticleTestCase_aggregate);
}

- (void)runTestWithContext:(id)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  id v10 = objc_msgSend(v8, sel_application);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1DEABCF08;
  *(void *)(v11 + 24) = v7;
  v13[4] = sub_1DEB6CA7C;
  v13[5] = v11;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_1DE9744A8;
  v13[3] = &block_descriptor_38;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_ts_installCACommitCompletionBlock_, v12);
  _Block_release(v12);

  swift_release();
}

- (void).cxx_destruct
{
}

@end