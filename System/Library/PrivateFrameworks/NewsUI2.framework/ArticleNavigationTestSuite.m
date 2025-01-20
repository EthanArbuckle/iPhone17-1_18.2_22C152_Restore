@interface ArticleNavigationTestSuite
- (_TtC7NewsUI226ArticleNavigationTestSuite)init;
- (void)setupTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation ArticleNavigationTestSuite

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1DF081C10(v7, v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC7NewsUI226ArticleNavigationTestSuite)init
{
  result = (_TtC7NewsUI226ArticleNavigationTestSuite *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end