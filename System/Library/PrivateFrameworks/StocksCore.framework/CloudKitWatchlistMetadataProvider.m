@interface CloudKitWatchlistMetadataProvider
- (void)fetchMetadataForSymbols:(id)a3 completion:(id)a4;
@end

@implementation CloudKitWatchlistMetadataProvider

- (void)fetchMetadataForSymbols:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1AFFCB1C8();
  _Block_copy(v5);
  sub_1AFFC8E48();
  sub_1AFD8EE3C(v6, self, (void (**)(void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_release();

  swift_bridgeObjectRelease();
}

@end