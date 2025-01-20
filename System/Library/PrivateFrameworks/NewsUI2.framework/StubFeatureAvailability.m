@interface StubFeatureAvailability
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
- (void)setAllowCIPBestOffer:(BOOL)a3;
- (void)setAllowInAppMessages:(BOOL)a3;
- (void)setAllowPaidBundleViaOffer:(BOOL)a3;
- (void)setAllowSIWAOnMac:(BOOL)a3;
- (void)setAllowSharingAlways:(BOOL)a3;
- (void)setAppleMagazineContent:(BOOL)a3;
- (void)setArticleLinkBehaviorImprovementsEnabled:(BOOL)a3;
- (void)setDimNonSubscriberContentOffline:(BOOL)a3;
- (void)setEnableSponsoredSuperfeeds:(BOOL)a3;
- (void)setInterstellarEnabled:(BOOL)a3;
- (void)setModernLocalNewspaperEnabled:(BOOL)a3;
- (void)setNarrativeAudio:(BOOL)a3;
- (void)setOverrideSponsoredBannerBundleEligibility:(BOOL)a3;
- (void)setOverrideSponsoredSuperfeedEligibility:(BOOL)a3;
- (void)setPaidBundleViaOfferAvailability:(id)a3;
- (void)setPuzzlesEnabled:(BOOL)a3;
- (void)setPuzzlesGameCenterEnabled:(BOOL)a3;
- (void)setSportsNativeAdsEnabled:(BOOL)a3;
- (void)setUseContinueReading:(BOOL)a3;
- (void)setUseFeedDifferentiationMode:(BOOL)a3;
- (void)setUseFineGrainedNewsletterManagement:(BOOL)a3;
- (void)setUseMoreFromIssueEOA:(BOOL)a3;
- (void)setUseMoreToReadEOA:(BOOL)a3;
- (void)setUseMultipleNativeAds:(BOOL)a3;
- (void)setUseNewReportConcern:(BOOL)a3;
- (void)setUseNewsArticleSearch:(BOOL)a3;
- (void)setUseNotificationsV2:(BOOL)a3;
- (void)setUseOfflineMode:(BOOL)a3;
- (void)setUseWelcomeSeries:(BOOL)a3;
- (void)setWidgetUpsellFeaturesEnabled:(BOOL)a3;
@end

@implementation StubFeatureAvailability

- (BOOL)interstellarEnabled
{
  return self->interstellarEnabled[0];
}

- (void)setInterstellarEnabled:(BOOL)a3
{
  self->interstellarEnabled[0] = a3;
}

- (BOOL)appleMagazineContent
{
  return self->appleMagazineContent[0];
}

- (void)setAppleMagazineContent:(BOOL)a3
{
  self->appleMagazineContent[0] = a3;
}

- (BOOL)allowSharingAlways
{
  return self->allowSharingAlways[0];
}

- (void)setAllowSharingAlways:(BOOL)a3
{
  self->allowSharingAlways[0] = a3;
}

- (BOOL)narrativeAudio
{
  return self->narrativeAudio[0];
}

- (void)setNarrativeAudio:(BOOL)a3
{
  self->narrativeAudio[0] = a3;
}

- (BOOL)useContinueReading
{
  return self->useContinueReading[0];
}

- (void)setUseContinueReading:(BOOL)a3
{
  self->useContinueReading[0] = a3;
}

- (BOOL)useNewsArticleSearch
{
  return self->useNewsArticleSearch[0];
}

- (void)setUseNewsArticleSearch:(BOOL)a3
{
  self->useNewsArticleSearch[0] = a3;
}

- (BOOL)useNotificationsV2
{
  return self->useNotificationsV2[0];
}

- (void)setUseNotificationsV2:(BOOL)a3
{
  self->useNotificationsV2[0] = a3;
}

- (BOOL)useWelcomeSeries
{
  return self->useWelcomeSeries[0];
}

- (void)setUseWelcomeSeries:(BOOL)a3
{
  self->useWelcomeSeries[0] = a3;
}

- (BOOL)puzzlesEnabled
{
  return self->puzzlesEnabled[0];
}

- (void)setPuzzlesEnabled:(BOOL)a3
{
  self->puzzlesEnabled[0] = a3;
}

- (BOOL)puzzlesGameCenterEnabled
{
  return self->puzzlesGameCenterEnabled[0];
}

- (void)setPuzzlesGameCenterEnabled:(BOOL)a3
{
  self->puzzlesGameCenterEnabled[0] = a3;
}

- (BOOL)useOfflineMode
{
  return self->useOfflineMode[0];
}

- (void)setUseOfflineMode:(BOOL)a3
{
  self->useOfflineMode[0] = a3;
}

- (BOOL)dimNonSubscriberContentOffline
{
  return self->dimNonSubscriberContentOffline[0];
}

- (void)setDimNonSubscriberContentOffline:(BOOL)a3
{
  self->dimNonSubscriberContentOffline[0] = a3;
}

- (BOOL)articleLinkBehaviorImprovementsEnabled
{
  return self->articleLinkBehaviorImprovementsEnabled[0];
}

- (void)setArticleLinkBehaviorImprovementsEnabled:(BOOL)a3
{
  self->articleLinkBehaviorImprovementsEnabled[0] = a3;
}

- (_TtC16NewsSubscription26PaidBundleViaOfferSettings)paidBundleViaOfferAvailability
{
  return (_TtC16NewsSubscription26PaidBundleViaOfferSettings *)*(id *)self->paidBundleViaOfferAvailability;
}

- (void)setPaidBundleViaOfferAvailability:(id)a3
{
  id v4 = *(id *)self->paidBundleViaOfferAvailability;
  *(void *)self->paidBundleViaOfferAvailability = a3;
  id v3 = a3;
}

- (BOOL)enableSponsoredSuperfeeds
{
  return self->enableSponsoredSuperfeeds[0];
}

- (void)setEnableSponsoredSuperfeeds:(BOOL)a3
{
  self->enableSponsoredSuperfeeds[0] = a3;
}

- (BOOL)overrideSponsoredSuperfeedEligibility
{
  return self->overrideSponsoredSuperfeedEligibility[0];
}

- (void)setOverrideSponsoredSuperfeedEligibility:(BOOL)a3
{
  self->overrideSponsoredSuperfeedEligibility[0] = a3;
}

- (BOOL)overrideSponsoredBannerBundleEligibility
{
  return self->overrideSponsoredBannerBundleEligibility[0];
}

- (void)setOverrideSponsoredBannerBundleEligibility:(BOOL)a3
{
  self->overrideSponsoredBannerBundleEligibility[0] = a3;
}

- (BOOL)useNewReportConcern
{
  return self->useNewReportConcern[0];
}

- (void)setUseNewReportConcern:(BOOL)a3
{
  self->useNewReportConcern[0] = a3;
}

- (BOOL)useMoreToReadEOA
{
  return self->useMoreToReadEOA[0];
}

- (void)setUseMoreToReadEOA:(BOOL)a3
{
  self->useMoreToReadEOA[0] = a3;
}

- (BOOL)useMoreFromIssueEOA
{
  return self->useMoreFromIssueEOA[0];
}

- (void)setUseMoreFromIssueEOA:(BOOL)a3
{
  self->useMoreFromIssueEOA[0] = a3;
}

- (BOOL)useMultipleNativeAds
{
  return self->useMultipleNativeAds[0];
}

- (void)setUseMultipleNativeAds:(BOOL)a3
{
  self->useMultipleNativeAds[0] = a3;
}

- (BOOL)allowInAppMessages
{
  return self->allowInAppMessages[0];
}

- (void)setAllowInAppMessages:(BOOL)a3
{
  self->allowInAppMessages[0] = a3;
}

- (BOOL)allowCIPBestOffer
{
  return self->allowCIPBestOffer[0];
}

- (void)setAllowCIPBestOffer:(BOOL)a3
{
  self->allowCIPBestOffer[0] = a3;
}

- (BOOL)allowSIWAOnMac
{
  return self->allowSIWAOnMac[0];
}

- (void)setAllowSIWAOnMac:(BOOL)a3
{
  self->allowSIWAOnMac[0] = a3;
}

- (BOOL)sportsNativeAdsEnabled
{
  return self->sportsNativeAdsEnabled[0];
}

- (void)setSportsNativeAdsEnabled:(BOOL)a3
{
  self->sportsNativeAdsEnabled[0] = a3;
}

- (BOOL)allowPaidBundleViaOffer
{
  return self->allowPaidBundleViaOffer[0];
}

- (void)setAllowPaidBundleViaOffer:(BOOL)a3
{
  self->allowPaidBundleViaOffer[0] = a3;
}

- (BOOL)useFineGrainedNewsletterManagement
{
  return self->useFineGrainedNewsletterManagement[0];
}

- (void)setUseFineGrainedNewsletterManagement:(BOOL)a3
{
  self->useFineGrainedNewsletterManagement[0] = a3;
}

- (BOOL)improvedBlockingBehaviorEnabled
{
  return sub_1DFDFC020() & 1;
}

- (BOOL)useFeedDifferentiationMode
{
  return self->useFeedDifferentiationMode[0];
}

- (void)setUseFeedDifferentiationMode:(BOOL)a3
{
  self->useFeedDifferentiationMode[0] = a3;
}

- (BOOL)widgetUpsellFeaturesEnabled
{
  return self->widgetUpsellFeaturesEnabled[0];
}

- (void)setWidgetUpsellFeaturesEnabled:(BOOL)a3
{
  self->widgetUpsellFeaturesEnabled[0] = a3;
}

- (BOOL)modernLocalNewspaperEnabled
{
  return self->modernLocalNewspaperEnabled[0];
}

- (void)setModernLocalNewspaperEnabled:(BOOL)a3
{
  self->modernLocalNewspaperEnabled[0] = a3;
}

@end