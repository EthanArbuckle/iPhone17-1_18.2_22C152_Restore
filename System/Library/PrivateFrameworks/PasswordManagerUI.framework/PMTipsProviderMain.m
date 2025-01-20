@interface PMTipsProviderMain
- (void)refreshTips;
@end

@implementation PMTipsProviderMain

- (void)refreshTips
{
  swift_beginAccess();
  swift_retain();
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_258D29B50(v2);
  swift_release();
  swift_bridgeObjectRelease();
}

@end