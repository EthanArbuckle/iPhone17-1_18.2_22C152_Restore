@interface WBSSpotlightDonationEntityCorrelator
- (WBSSpotlightDonationEntityCorrelator)init;
- (id)initIfAvailable;
- (void)correlateBookmarkEntityForItem:(id)a3 withUUIDString:(id)a4;
- (void)correlateHistoryEntityForItem:(id)a3;
- (void)correlateTabEntityForItem:(id)a3;
@end

@implementation WBSSpotlightDonationEntityCorrelator

- (WBSSpotlightDonationEntityCorrelator)init
{
  v3.receiver = self;
  v3.super_class = (Class)WBSSpotlightDonationEntityCorrelator;
  return [(WBSSpotlightDonationEntityCorrelator *)&v3 init];
}

- (id)initIfAvailable
{
  if (MEMORY[0x1E4F23848])
  {
    return [(WBSSpotlightDonationEntityCorrelator *)self init];
  }
  else
  {
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
}

- (void)correlateHistoryEntityForItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B737A884(v4);
}

- (void)correlateBookmarkEntityForItem:(id)a3 withUUIDString:(id)a4
{
  sub_1B7383FC0();
  id v6 = a3;
  v7 = self;
  sub_1B737A9F8(v6);

  swift_bridgeObjectRelease();
}

- (void)correlateTabEntityForItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B737AB40(v4);
}

@end