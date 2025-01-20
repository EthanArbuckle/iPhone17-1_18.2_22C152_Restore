@interface FileEntitySpotlight.Fetcher
- (_TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher)init;
- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4;
- (void)collectionDidFinishGathering:(id)a3;
@end

@implementation FileEntitySpotlight.Fetcher

- (_TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher)init
{
  result = (_TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000A7258(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher_completionHandler));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCO5Files19FileEntitySpotlightP33_1F971BE10FE1F60F4C2B5C564BBBC7C17Fetcher_queryCollection);
}

- (void)collectionDidFinishGathering:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10030A70C(v4);
}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  id v4 = _Block_copy(a4);

  _Block_release(v4);
}

@end