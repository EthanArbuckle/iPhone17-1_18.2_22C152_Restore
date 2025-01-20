@interface TodayFeedTestSuite
- (_TtC7NewsUI218TodayFeedTestSuite)init;
- (void)setupTestWithContext:(id)a3 completion:(id)a4;
@end

@implementation TodayFeedTestSuite

- (_TtC7NewsUI218TodayFeedTestSuite)init
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
  sub_1DEE6F4E8(v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

@end