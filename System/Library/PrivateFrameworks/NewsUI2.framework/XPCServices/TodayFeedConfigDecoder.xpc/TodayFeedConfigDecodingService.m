@interface TodayFeedConfigDecodingService
- (_TtC22TodayFeedConfigDecoder30TodayFeedConfigDecodingService)init;
- (void)decodeTodayFeedConfigData:(id)a3 completion:(id)a4;
@end

@implementation TodayFeedConfigDecodingService

- (void)decodeTodayFeedConfigData:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void *, id, void))_Block_copy(a4);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = sub_10000A0B0();
  unint64_t v10 = v9;

  id v11 = sub_100004644();
  v6[2](v6, v11, 0);

  _Block_release(v6);
  sub_1000049B4(v8, v10);
}

- (_TtC22TodayFeedConfigDecoder30TodayFeedConfigDecodingService)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TodayFeedConfigDecodingService *)&v3 init];
}

@end