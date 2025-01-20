@interface FeatureAvailability
- (BOOL)allowCIPBestOffer;
- (BOOL)allowInAppMessages;
- (BOOL)allowPaidBundleViaOffer;
- (BOOL)allowSIWAOnMac;
- (BOOL)allowSharingAlways;
- (BOOL)appleMagazineContent;
- (BOOL)articleLinkBehaviorImprovementsEnabled;
- (BOOL)dimNonSubscriberContentOffline;
- (BOOL)enableSponsoredSuperfeeds;
- (BOOL)improvedBlockingBehaviorEnabled;
- (BOOL)interstellarEnabled;
- (BOOL)modernLocalNewspaperEnabled;
- (BOOL)narrativeAudio;
- (BOOL)overrideSponsoredBannerBundleEligibility;
- (BOOL)overrideSponsoredSuperfeedEligibility;
- (BOOL)puzzlesEnabled;
- (BOOL)puzzlesGameCenterEnabled;
- (BOOL)sportsNativeAdsEnabled;
- (BOOL)useContinueReading;
- (BOOL)useFeedDifferentiationMode;
- (BOOL)useFineGrainedNewsletterManagement;
- (BOOL)useMoreFromIssueEOA;
- (BOOL)useMoreToReadEOA;
- (BOOL)useMultipleNativeAds;
- (BOOL)useNewReportConcern;
- (BOOL)useNewsArticleSearch;
- (BOOL)useNotificationsV2;
- (BOOL)useOfflineMode;
- (BOOL)useWelcomeSeries;
- (BOOL)widgetUpsellFeaturesEnabled;
- (_TtC16NewsSubscription26PaidBundleViaOfferSettings)paidBundleViaOfferAvailability;
- (void)addWithObserver:(id)a3;
- (void)removeWithObserver:(id)a3;
@end

@implementation FeatureAvailability

- (BOOL)puzzlesEnabled
{
  swift_retain();
  if (sub_1DEAD0FB0()) {
    unsigned __int8 v2 = sub_1DE945220();
  }
  else {
    unsigned __int8 v2 = 0;
  }
  swift_release();
  return v2 & 1;
}

- (BOOL)useOfflineMode
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEA37708);
}

- (_TtC16NewsSubscription26PaidBundleViaOfferSettings)paidBundleViaOfferAvailability
{
  swift_retain();
  sub_1DEAD0F88();
  sub_1DEAD0E98();
  sub_1DEAD0F10();
  sub_1DEAD0F60();
  sub_1DEAD0EE8();
  sub_1DEAD0EC0();
  sub_1DEAD0F38();
  sub_1DEAD0E70();
  id v2 = objc_allocWithZone((Class)sub_1DFDEF330());
  v3 = (void *)sub_1DFDEF320();
  swift_release();
  return (_TtC16NewsSubscription26PaidBundleViaOfferSettings *)v3;
}

- (BOOL)narrativeAudio
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEA377A8);
}

- (void)addWithObserver:(id)a3
{
}

- (BOOL)appleMagazineContent
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DE9682C8);
}

- (BOOL)interstellarEnabled
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E498);
}

- (BOOL)allowSharingAlways
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E780);
}

- (BOOL)useNewsArticleSearch
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E4EC);
}

- (BOOL)useNotificationsV2
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E6D8);
}

- (BOOL)allowInAppMessages
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E758);
}

- (BOOL)useContinueReading
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E5E4);
}

- (BOOL)puzzlesGameCenterEnabled
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E9C0);
}

- (BOOL)sportsNativeAdsEnabled
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E998);
}

- (BOOL)allowCIPBestOffer
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E9E8);
}

- (BOOL)allowPaidBundleViaOffer
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5EA10);
}

- (BOOL)allowSIWAOnMac
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5EA38);
}

- (BOOL)useFineGrainedNewsletterManagement
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5EA60);
}

- (BOOL)improvedBlockingBehaviorEnabled
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DE93778C);
}

- (BOOL)useFeedDifferentiationMode
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5ED40);
}

- (BOOL)widgetUpsellFeaturesEnabled
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5ED68);
}

- (BOOL)modernLocalNewspaperEnabled
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5EF78);
}

- (BOOL)articleLinkBehaviorImprovementsEnabled
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5EB58);
}

- (BOOL)useNewReportConcern
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E830);
}

- (BOOL)useMoreToReadEOA
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E850);
}

- (BOOL)useMoreFromIssueEOA
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E878);
}

- (BOOL)useMultipleNativeAds
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5E8A0);
}

- (BOOL)useWelcomeSeries
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5EE80);
}

- (BOOL)dimNonSubscriberContentOffline
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5ECD8);
}

- (BOOL)enableSponsoredSuperfeeds
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5ECB8);
}

- (BOOL)overrideSponsoredSuperfeedEligibility
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5ED00);
}

- (BOOL)overrideSponsoredBannerBundleEligibility
{
  return sub_1DEA37690((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1DEE5ED20);
}

- (void)removeWithObserver:(id)a3
{
}

@end