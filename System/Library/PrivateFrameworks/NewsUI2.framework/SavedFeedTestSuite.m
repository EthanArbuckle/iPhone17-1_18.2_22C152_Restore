@interface SavedFeedTestSuite
- (_TtC7NewsUI218SavedFeedTestSuite)init;
- (void)setupTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation SavedFeedTestSuite

- (_TtC7NewsUI218SavedFeedTestSuite)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SNTestSuite *)&v3 init];
}

- (void)setupTestWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1DF1A7668(v8, (uint64_t)sub_1DEABCF08, v7);

  swift_release();
}

@end