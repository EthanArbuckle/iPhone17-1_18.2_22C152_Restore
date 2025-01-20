@interface APPCNewsSupplementalContext
- (APPCNewsSupplementalContext)init;
- (NSArray)currentArticleSourceSections;
- (NSArray)feedMetadataCategories;
- (NSArray)feedMetadataKeywords;
- (NSArray)feedMetadataLanguages;
- (NSArray)groupContextAboveCategories;
- (NSArray)groupContextAboveKeywords;
- (NSArray)groupContextAboveLanguages;
- (NSArray)groupContextBelowCategories;
- (NSArray)groupContextBelowKeywords;
- (NSArray)groupContextBelowLanguages;
- (NSArray)groupContextCategories;
- (NSArray)groupContextKeywords;
- (NSArray)groupContextLanguages;
- (NSArray)nextArticleSourceSections;
- (NSArray)superFeedMetadata;
- (NSDictionary)anfComponentMetadata;
- (NSDictionary)currentArticlePublicationMetadata;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)nextArticlePublicationMetadata;
- (NSNumber)currentArticleIsSponsored;
- (NSNumber)currentArticleSourceContentProviderId;
- (NSNumber)feedMetadataContentProviderID;
- (NSNumber)groupContextAboveContentProviderId;
- (NSNumber)groupContextBelowContentProviderId;
- (NSNumber)groupContextContentProviderId;
- (NSNumber)isDraft;
- (NSNumber)nextArticleIsSponsored;
- (NSNumber)nextArticleSourceContentProviderId;
- (NSNumber)numOfArticlesSeenSinceLastInterstitial;
- (NSNumber)onboardStatus;
- (NSNumber)playerAspectRatio;
- (NSNumber)referralPublisherInventory;
- (NSString)advertisementType;
- (NSString)contentEnvironment;
- (NSString)creativeType;
- (NSString)currentArticleArticleId;
- (NSString)currentArticleRating;
- (NSString)currentArticleSourceChannel;
- (NSString)currentArticleSourceChannelRating;
- (NSString)currentIssueId;
- (NSString)feedMetadataChannelId;
- (NSString)feedMetadataRating;
- (NSString)feedMetadataSectionId;
- (NSString)feedMetadataTagId;
- (NSString)groupContextAboveChannelId;
- (NSString)groupContextAboveId;
- (NSString)groupContextAboveTagId;
- (NSString)groupContextAboveType;
- (NSString)groupContextBelowChannelId;
- (NSString)groupContextBelowId;
- (NSString)groupContextBelowTagId;
- (NSString)groupContextBelowType;
- (NSString)groupContextId;
- (NSString)groupContextType;
- (NSString)nextArticleArticleId;
- (NSString)nextArticleRating;
- (NSString)nextArticleSourceChannel;
- (NSString)nextArticleSourceChannelRating;
- (NSString)placement;
- (NSString)referralLocation;
- (NSString)subscriptionType;
- (id)copyWithZone:(void *)a3;
- (int64_t)currentIssueIsCurrent;
- (int64_t)currentIssueIsDraft;
- (int64_t)requestedAdType;
- (void)setAdvertisementType:(id)a3;
- (void)setAnfComponentMetadata:(id)a3;
- (void)setContentEnvironment:(id)a3;
- (void)setCreativeType:(id)a3;
- (void)setCurrentArticleArticleId:(id)a3;
- (void)setCurrentArticleIsSponsored:(id)a3;
- (void)setCurrentArticlePublicationMetadata:(id)a3;
- (void)setCurrentArticleRating:(id)a3;
- (void)setCurrentArticleSourceChannel:(id)a3;
- (void)setCurrentArticleSourceChannelRating:(id)a3;
- (void)setCurrentArticleSourceContentProviderId:(id)a3;
- (void)setCurrentArticleSourceSections:(id)a3;
- (void)setCurrentIssueId:(id)a3;
- (void)setCurrentIssueIsCurrent:(int64_t)a3;
- (void)setCurrentIssueIsDraft:(int64_t)a3;
- (void)setFeedMetadataCategories:(id)a3;
- (void)setFeedMetadataChannelId:(id)a3;
- (void)setFeedMetadataContentProviderID:(id)a3;
- (void)setFeedMetadataKeywords:(id)a3;
- (void)setFeedMetadataLanguages:(id)a3;
- (void)setFeedMetadataRating:(id)a3;
- (void)setFeedMetadataSectionId:(id)a3;
- (void)setFeedMetadataTagId:(id)a3;
- (void)setGroupContextAboveCategories:(id)a3;
- (void)setGroupContextAboveChannelId:(id)a3;
- (void)setGroupContextAboveContentProviderId:(id)a3;
- (void)setGroupContextAboveId:(id)a3;
- (void)setGroupContextAboveKeywords:(id)a3;
- (void)setGroupContextAboveLanguages:(id)a3;
- (void)setGroupContextAboveTagId:(id)a3;
- (void)setGroupContextAboveType:(id)a3;
- (void)setGroupContextBelowCategories:(id)a3;
- (void)setGroupContextBelowChannelId:(id)a3;
- (void)setGroupContextBelowContentProviderId:(id)a3;
- (void)setGroupContextBelowId:(id)a3;
- (void)setGroupContextBelowKeywords:(id)a3;
- (void)setGroupContextBelowLanguages:(id)a3;
- (void)setGroupContextBelowTagId:(id)a3;
- (void)setGroupContextBelowType:(id)a3;
- (void)setGroupContextCategories:(id)a3;
- (void)setGroupContextContentProviderId:(id)a3;
- (void)setGroupContextId:(id)a3;
- (void)setGroupContextKeywords:(id)a3;
- (void)setGroupContextLanguages:(id)a3;
- (void)setGroupContextType:(id)a3;
- (void)setIsDraft:(id)a3;
- (void)setNextArticleArticleId:(id)a3;
- (void)setNextArticleIsSponsored:(id)a3;
- (void)setNextArticlePublicationMetadata:(id)a3;
- (void)setNextArticleRating:(id)a3;
- (void)setNextArticleSourceChannel:(id)a3;
- (void)setNextArticleSourceChannelRating:(id)a3;
- (void)setNextArticleSourceContentProviderId:(id)a3;
- (void)setNextArticleSourceSections:(id)a3;
- (void)setNumOfArticlesSeenSinceLastInterstitial:(id)a3;
- (void)setPlacement:(id)a3;
- (void)setPlayerAspectRatio:(id)a3;
- (void)setReferralLocation:(id)a3;
- (void)setReferralPublisherInventory:(id)a3;
- (void)setRequestedAdType:(int64_t)a3;
- (void)setSubscriptionType:(id)a3;
- (void)setSuperFeedMetadata:(id)a3;
@end

@implementation APPCNewsSupplementalContext

- (NSString)advertisementType
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_advertisementType);
}

- (void)setAdvertisementType:(id)a3
{
}

- (NSDictionary)anfComponentMetadata
{
  v2 = self;
  unint64_t v3 = sub_1B5C80820();

  if (v3)
  {
    v4 = (void *)sub_1B5CB3310();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (void)setAnfComponentMetadata:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1B5CB3320();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_1B5C80D08(v4);
}

- (int64_t)requestedAdType
{
  v2 = self;
  int64_t v3 = sub_1B5C80FC4();

  return v3;
}

- (void)setRequestedAdType:(int64_t)a3
{
  uint64_t v4 = self;
  if (NewsRequestedAdType.rawValue.getter(a3) == 1162760014 && v5 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  char v6 = sub_1B5CB3CC0();
  swift_bridgeObjectRelease();
  if (v6) {
    goto LABEL_5;
  }
  uint64_t v7 = NewsRequestedAdType.rawValue.getter(a3);
LABEL_7:
  v9 = (uint64_t *)((char *)v4 + OBJC_IVAR___APPCNewsSupplementalContext_requestedAdTypeInternal);
  uint64_t *v9 = v7;
  v9[1] = v8;

  swift_bridgeObjectRelease();
}

- (NSString)creativeType
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_creativeType);
}

- (void)setCreativeType:(id)a3
{
}

- (NSString)currentArticleArticleId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleArticleId);
}

- (void)setCurrentArticleArticleId:(id)a3
{
}

- (NSString)nextArticleArticleId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleArticleId);
}

- (void)setNextArticleArticleId:(id)a3
{
}

- (NSNumber)currentArticleIsSponsored
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleIsSponsored);
}

- (void)setCurrentArticleIsSponsored:(id)a3
{
}

- (NSNumber)nextArticleIsSponsored
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleIsSponsored);
}

- (void)setNextArticleIsSponsored:(id)a3
{
}

- (NSDictionary)currentArticlePublicationMetadata
{
  return (NSDictionary *)sub_1B5C81AC8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticlePublicationMetadata);
}

- (void)setCurrentArticlePublicationMetadata:(id)a3
{
}

- (NSDictionary)nextArticlePublicationMetadata
{
  return (NSDictionary *)sub_1B5C81AC8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticlePublicationMetadata);
}

- (void)setNextArticlePublicationMetadata:(id)a3
{
}

- (NSString)currentArticleRating
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleRating);
}

- (void)setCurrentArticleRating:(id)a3
{
}

- (NSString)nextArticleRating
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleRating);
}

- (void)setNextArticleRating:(id)a3
{
}

- (NSString)currentArticleSourceChannel
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceChannel);
}

- (void)setCurrentArticleSourceChannel:(id)a3
{
}

- (NSString)nextArticleSourceChannel
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceChannel);
}

- (void)setNextArticleSourceChannel:(id)a3
{
}

- (NSString)currentArticleSourceChannelRating
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceChannelRating);
}

- (void)setCurrentArticleSourceChannelRating:(id)a3
{
}

- (NSString)nextArticleSourceChannelRating
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceChannelRating);
}

- (void)setNextArticleSourceChannelRating:(id)a3
{
}

- (NSNumber)currentArticleSourceContentProviderId
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceContentProviderId);
}

- (void)setCurrentArticleSourceContentProviderId:(id)a3
{
}

- (NSNumber)nextArticleSourceContentProviderId
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceContentProviderId);
}

- (void)setNextArticleSourceContentProviderId:(id)a3
{
}

- (NSArray)currentArticleSourceSections
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceSections);
}

- (void)setCurrentArticleSourceSections:(id)a3
{
}

- (NSArray)nextArticleSourceSections
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceSections);
}

- (void)setNextArticleSourceSections:(id)a3
{
}

- (NSArray)feedMetadataCategories
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataCategories);
}

- (void)setFeedMetadataCategories:(id)a3
{
}

- (NSString)feedMetadataChannelId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataChannelId);
}

- (void)setFeedMetadataChannelId:(id)a3
{
}

- (NSString)feedMetadataTagId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataTagId);
}

- (void)setFeedMetadataTagId:(id)a3
{
}

- (NSNumber)feedMetadataContentProviderID
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataContentProviderID);
}

- (void)setFeedMetadataContentProviderID:(id)a3
{
}

- (NSArray)feedMetadataKeywords
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataKeywords);
}

- (void)setFeedMetadataKeywords:(id)a3
{
}

- (NSArray)feedMetadataLanguages
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataLanguages);
}

- (void)setFeedMetadataLanguages:(id)a3
{
}

- (NSString)feedMetadataRating
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataRating);
}

- (void)setFeedMetadataRating:(id)a3
{
}

- (NSString)feedMetadataSectionId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataSectionId);
}

- (void)setFeedMetadataSectionId:(id)a3
{
}

- (NSArray)groupContextCategories
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextCategories);
}

- (void)setGroupContextCategories:(id)a3
{
}

- (NSArray)groupContextAboveCategories
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveCategories);
}

- (void)setGroupContextAboveCategories:(id)a3
{
}

- (NSArray)groupContextBelowCategories
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowCategories);
}

- (void)setGroupContextBelowCategories:(id)a3
{
}

- (NSString)groupContextId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextId);
}

- (void)setGroupContextId:(id)a3
{
}

- (NSString)groupContextAboveId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveId);
}

- (void)setGroupContextAboveId:(id)a3
{
}

- (NSString)groupContextBelowId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowId);
}

- (void)setGroupContextBelowId:(id)a3
{
}

- (NSArray)groupContextKeywords
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextKeywords);
}

- (void)setGroupContextKeywords:(id)a3
{
}

- (NSArray)groupContextAboveKeywords
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveKeywords);
}

- (void)setGroupContextAboveKeywords:(id)a3
{
}

- (NSArray)groupContextBelowKeywords
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowKeywords);
}

- (void)setGroupContextBelowKeywords:(id)a3
{
}

- (NSArray)groupContextLanguages
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextLanguages);
}

- (void)setGroupContextLanguages:(id)a3
{
}

- (NSArray)groupContextAboveLanguages
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveLanguages);
}

- (void)setGroupContextAboveLanguages:(id)a3
{
}

- (NSArray)groupContextBelowLanguages
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowLanguages);
}

- (void)setGroupContextBelowLanguages:(id)a3
{
}

- (NSString)groupContextAboveChannelId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveChannelId);
}

- (void)setGroupContextAboveChannelId:(id)a3
{
}

- (NSString)groupContextAboveTagId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveTagId);
}

- (void)setGroupContextAboveTagId:(id)a3
{
}

- (NSString)groupContextBelowChannelId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowChannelId);
}

- (void)setGroupContextBelowChannelId:(id)a3
{
}

- (NSString)groupContextBelowTagId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowTagId);
}

- (void)setGroupContextBelowTagId:(id)a3
{
}

- (NSNumber)groupContextContentProviderId
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextContentProviderId);
}

- (void)setGroupContextContentProviderId:(id)a3
{
}

- (NSNumber)groupContextAboveContentProviderId
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveContentProviderId);
}

- (void)setGroupContextAboveContentProviderId:(id)a3
{
}

- (NSNumber)groupContextBelowContentProviderId
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowContentProviderId);
}

- (void)setGroupContextBelowContentProviderId:(id)a3
{
}

- (NSString)groupContextType
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextType);
}

- (void)setGroupContextType:(id)a3
{
}

- (NSString)groupContextAboveType
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveType);
}

- (void)setGroupContextAboveType:(id)a3
{
}

- (NSString)groupContextBelowType
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowType);
}

- (void)setGroupContextBelowType:(id)a3
{
}

- (NSString)contentEnvironment
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_contentEnvironment);
}

- (void)setContentEnvironment:(id)a3
{
}

- (NSNumber)isDraft
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_isDraft);
}

- (void)setIsDraft:(id)a3
{
}

- (NSNumber)onboardStatus
{
  return (NSNumber *)0;
}

- (NSString)placement
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_placement);
}

- (void)setPlacement:(id)a3
{
}

- (NSString)referralLocation
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_referralLocation);
}

- (void)setReferralLocation:(id)a3
{
}

- (NSNumber)referralPublisherInventory
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_referralPublisherInventory);
}

- (void)setReferralPublisherInventory:(id)a3
{
}

- (NSNumber)numOfArticlesSeenSinceLastInterstitial
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_numOfArticlesSeenSinceLastInterstitial);
}

- (void)setNumOfArticlesSeenSinceLastInterstitial:(id)a3
{
}

- (NSNumber)playerAspectRatio
{
  return (NSNumber *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_playerAspectRatio);
}

- (void)setPlayerAspectRatio:(id)a3
{
}

- (NSString)subscriptionType
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_subscriptionType);
}

- (void)setSubscriptionType:(id)a3
{
}

- (NSString)currentIssueId
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentIssueId);
}

- (void)setCurrentIssueId:(id)a3
{
}

- (int64_t)currentIssueIsDraft
{
  return sub_1B5C83EAC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentIssueIsDraftInternal);
}

- (void)setCurrentIssueIsDraft:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1B5C83E24(a3);
}

- (int64_t)currentIssueIsCurrent
{
  return sub_1B5C83EAC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentIssueIsCurrentInternal);
}

- (void)setCurrentIssueIsCurrent:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1B5C83F84(a3);
}

- (NSArray)superFeedMetadata
{
  return (NSArray *)sub_1B5C84140((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_superFeedMetadata);
}

- (void)setSuperFeedMetadata:(id)a3
{
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = self;
  sub_1B5C84338();

  sub_1B5BFE044(&qword_1EB851640);
  int64_t v3 = (void *)sub_1B5CB3310();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (APPCNewsSupplementalContext)init
{
  return (APPCNewsSupplementalContext *)NewsSupplementalContext.init()();
}

- (id)copyWithZone:(void *)a3
{
  int64_t v3 = self;
  sub_1B5C85394(v6);

  sub_1B5BF6B08(v6, v6[3]);
  uint64_t v4 = (void *)sub_1B5CB3CB0();
  sub_1B5BF6B4C((uint64_t)v6);
  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceContentProviderId));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceContentProviderId));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveContentProviderId));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowContentProviderId));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___APPCNewsSupplementalContext_numOfArticlesSeenSinceLastInterstitial));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end