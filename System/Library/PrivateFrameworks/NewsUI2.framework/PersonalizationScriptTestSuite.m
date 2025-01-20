@interface PersonalizationScriptTestSuite
- (_TtC7NewsUI230PersonalizationScriptTestSuite)init;
- (void)setupTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation PersonalizationScriptTestSuite

- (_TtC7NewsUI230PersonalizationScriptTestSuite)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SNTestSuite *)&v3 init];
}

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1DF57553C(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

@end