@interface NTPBTodaySectionConfig
- (BOOL)filterNonSubscribedInFavoritesOnlyMode;
- (BOOL)glanceable;
- (BOOL)hasArticleIDsTodaySectionConfig;
- (BOOL)hasArticleListTodaySectionConfig;
- (BOOL)hasBackgroundColorDark;
- (BOOL)hasBackgroundColorLight;
- (BOOL)hasBackgroundGradientColor;
- (BOOL)hasCachedResultCutoffTime;
- (BOOL)hasCompactName;
- (BOOL)hasFallbackOrder;
- (BOOL)hasFilterNonSubscribedInFavoritesOnlyMode;
- (BOOL)hasForYouTodaySectionConfig;
- (BOOL)hasGlanceable;
- (BOOL)hasGroupActionTitle;
- (BOOL)hasGroupActionUrl;
- (BOOL)hasGroupNameActionUrl;
- (BOOL)hasIdentifier;
- (BOOL)hasInterSectionFilteringOptions;
- (BOOL)hasIntraSectionFilteringOptions;
- (BOOL)hasItemsTodaySectionConfig;
- (BOOL)hasMaximumStoriesAllocation;
- (BOOL)hasMinimumStoriesAllocation;
- (BOOL)hasMutingTagID;
- (BOOL)hasName;
- (BOOL)hasNameColorDark;
- (BOOL)hasNameColorLight;
- (BOOL)hasPaywalledStoriesMaxCount;
- (BOOL)hasPersonalizationFeatureID;
- (BOOL)hasPersonalizedPresenceConfig;
- (BOOL)hasPersonalizedPresenceFeatureClickPrior;
- (BOOL)hasPersonalizedPresenceFeatureID;
- (BOOL)hasPersonalizedPresenceFeatureImpressionPrior;
- (BOOL)hasPersonalizedTodaySectionConfig;
- (BOOL)hasPresenceDeterminedByPersonalization;
- (BOOL)hasPromotionCriterion;
- (BOOL)hasReadArticlesFilterMethod;
- (BOOL)hasReferralBarName;
- (BOOL)hasSectionType;
- (BOOL)hasSeenArticlesFilterMethod;
- (BOOL)hasSeenArticlesMinimumTimeSinceFirstSeenToFilter;
- (BOOL)hasShownInFavoritesOnlyMode;
- (BOOL)hasSubidentifier;
- (BOOL)hasTagTodaySectionConfig;
- (BOOL)isEqual:(id)a3;
- (BOOL)presenceDeterminedByPersonalization;
- (BOOL)readFrom:(id)a3;
- (BOOL)shownInFavoritesOnlyMode;
- (NSString)backgroundColorDark;
- (NSString)backgroundColorLight;
- (NSString)backgroundGradientColor;
- (NSString)compactName;
- (NSString)groupActionTitle;
- (NSString)groupActionUrl;
- (NSString)groupNameActionUrl;
- (NSString)identifier;
- (NSString)mutingTagID;
- (NSString)name;
- (NSString)nameColorDark;
- (NSString)nameColorLight;
- (NSString)personalizationFeatureID;
- (NSString)personalizedPresenceFeatureID;
- (NSString)referralBarName;
- (NSString)subidentifier;
- (NTPBArticleIDsTodaySectionSpecificConfig)articleIDsTodaySectionConfig;
- (NTPBArticleListTodaySectionSpecificConfig)articleListTodaySectionConfig;
- (NTPBForYouTodaySectionSpecificConfig)forYouTodaySectionConfig;
- (NTPBItemsTodaySectionSpecificConfig)itemsTodaySectionConfig;
- (NTPBPersonalizedSectionPresenceConfig)personalizedPresenceConfig;
- (NTPBPersonalizedTodaySectionSpecificConfig)personalizedTodaySectionConfig;
- (NTPBTagTodaySectionSpecificConfig)tagTodaySectionConfig;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)promotionCriterion;
- (int)readArticlesFilterMethod;
- (int)sectionType;
- (int)seenArticlesFilterMethod;
- (unint64_t)cachedResultCutoffTime;
- (unint64_t)fallbackOrder;
- (unint64_t)hash;
- (unint64_t)interSectionFilteringOptions;
- (unint64_t)intraSectionFilteringOptions;
- (unint64_t)maximumStoriesAllocation;
- (unint64_t)minimumStoriesAllocation;
- (unint64_t)paywalledStoriesMaxCount;
- (unint64_t)personalizedPresenceFeatureClickPrior;
- (unint64_t)personalizedPresenceFeatureImpressionPrior;
- (unint64_t)queueMembershipAtIndex:(unint64_t)a3;
- (unint64_t)queueMemberships;
- (unint64_t)queueMembershipsCount;
- (unint64_t)seenArticlesMinimumTimeSinceFirstSeenToFilter;
- (void)addQueueMembership:(unint64_t)a3;
- (void)clearQueueMemberships;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setArticleIDsTodaySectionConfig:(id)a3;
- (void)setArticleListTodaySectionConfig:(id)a3;
- (void)setBackgroundColorDark:(id)a3;
- (void)setBackgroundColorLight:(id)a3;
- (void)setBackgroundGradientColor:(id)a3;
- (void)setCachedResultCutoffTime:(unint64_t)a3;
- (void)setCompactName:(id)a3;
- (void)setFallbackOrder:(unint64_t)a3;
- (void)setFilterNonSubscribedInFavoritesOnlyMode:(BOOL)a3;
- (void)setForYouTodaySectionConfig:(id)a3;
- (void)setGlanceable:(BOOL)a3;
- (void)setGroupActionTitle:(id)a3;
- (void)setGroupActionUrl:(id)a3;
- (void)setGroupNameActionUrl:(id)a3;
- (void)setHasCachedResultCutoffTime:(BOOL)a3;
- (void)setHasFallbackOrder:(BOOL)a3;
- (void)setHasFilterNonSubscribedInFavoritesOnlyMode:(BOOL)a3;
- (void)setHasGlanceable:(BOOL)a3;
- (void)setHasInterSectionFilteringOptions:(BOOL)a3;
- (void)setHasIntraSectionFilteringOptions:(BOOL)a3;
- (void)setHasMaximumStoriesAllocation:(BOOL)a3;
- (void)setHasMinimumStoriesAllocation:(BOOL)a3;
- (void)setHasPaywalledStoriesMaxCount:(BOOL)a3;
- (void)setHasPersonalizedPresenceFeatureClickPrior:(BOOL)a3;
- (void)setHasPersonalizedPresenceFeatureImpressionPrior:(BOOL)a3;
- (void)setHasPresenceDeterminedByPersonalization:(BOOL)a3;
- (void)setHasPromotionCriterion:(BOOL)a3;
- (void)setHasReadArticlesFilterMethod:(BOOL)a3;
- (void)setHasSectionType:(BOOL)a3;
- (void)setHasSeenArticlesFilterMethod:(BOOL)a3;
- (void)setHasSeenArticlesMinimumTimeSinceFirstSeenToFilter:(BOOL)a3;
- (void)setHasShownInFavoritesOnlyMode:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterSectionFilteringOptions:(unint64_t)a3;
- (void)setIntraSectionFilteringOptions:(unint64_t)a3;
- (void)setItemsTodaySectionConfig:(id)a3;
- (void)setMaximumStoriesAllocation:(unint64_t)a3;
- (void)setMinimumStoriesAllocation:(unint64_t)a3;
- (void)setMutingTagID:(id)a3;
- (void)setName:(id)a3;
- (void)setNameColorDark:(id)a3;
- (void)setNameColorLight:(id)a3;
- (void)setPaywalledStoriesMaxCount:(unint64_t)a3;
- (void)setPersonalizationFeatureID:(id)a3;
- (void)setPersonalizedPresenceConfig:(id)a3;
- (void)setPersonalizedPresenceFeatureClickPrior:(unint64_t)a3;
- (void)setPersonalizedPresenceFeatureID:(id)a3;
- (void)setPersonalizedPresenceFeatureImpressionPrior:(unint64_t)a3;
- (void)setPersonalizedTodaySectionConfig:(id)a3;
- (void)setPresenceDeterminedByPersonalization:(BOOL)a3;
- (void)setPromotionCriterion:(int)a3;
- (void)setQueueMemberships:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setReadArticlesFilterMethod:(int)a3;
- (void)setReferralBarName:(id)a3;
- (void)setSectionType:(int)a3;
- (void)setSeenArticlesFilterMethod:(int)a3;
- (void)setSeenArticlesMinimumTimeSinceFirstSeenToFilter:(unint64_t)a3;
- (void)setShownInFavoritesOnlyMode:(BOOL)a3;
- (void)setSubidentifier:(id)a3;
- (void)setTagTodaySectionConfig:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodaySectionConfig

- (void)dealloc
{
  [(NTPBTodaySectionConfig *)self setName:0];
  [(NTPBTodaySectionConfig *)self setIdentifier:0];
  [(NTPBTodaySectionConfig *)self setArticleListTodaySectionConfig:0];
  [(NTPBTodaySectionConfig *)self setForYouTodaySectionConfig:0];
  [(NTPBTodaySectionConfig *)self setArticleIDsTodaySectionConfig:0];
  [(NTPBTodaySectionConfig *)self setNameColorLight:0];
  [(NTPBTodaySectionConfig *)self setPersonalizedTodaySectionConfig:0];
  [(NTPBTodaySectionConfig *)self setPersonalizationFeatureID:0];
  [(NTPBTodaySectionConfig *)self setPersonalizedPresenceConfig:0];
  PBRepeatedUInt64Clear();
  [(NTPBTodaySectionConfig *)self setBackgroundGradientColor:0];
  [(NTPBTodaySectionConfig *)self setCompactName:0];
  [(NTPBTodaySectionConfig *)self setPersonalizedPresenceFeatureID:0];
  [(NTPBTodaySectionConfig *)self setReferralBarName:0];
  [(NTPBTodaySectionConfig *)self setGroupActionTitle:0];
  [(NTPBTodaySectionConfig *)self setGroupActionUrl:0];
  [(NTPBTodaySectionConfig *)self setItemsTodaySectionConfig:0];
  [(NTPBTodaySectionConfig *)self setNameColorDark:0];
  [(NTPBTodaySectionConfig *)self setTagTodaySectionConfig:0];
  [(NTPBTodaySectionConfig *)self setMutingTagID:0];
  [(NTPBTodaySectionConfig *)self setGroupNameActionUrl:0];
  [(NTPBTodaySectionConfig *)self setBackgroundColorLight:0];
  [(NTPBTodaySectionConfig *)self setBackgroundColorDark:0];
  [(NTPBTodaySectionConfig *)self setSubidentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfig;
  [(NTPBTodaySectionConfig *)&v3 dealloc];
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setFallbackOrder:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_fallbackOrder = a3;
}

- (void)setHasFallbackOrder:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasFallbackOrder
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)sectionType
{
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    return self->_sectionType;
  }
  else {
    return 0;
  }
}

- (void)setSectionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_sectionType = a3;
}

- (void)setHasSectionType:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSectionType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (unint64_t)cachedResultCutoffTime
{
  if (*(unsigned char *)&self->_has) {
    return self->_cachedResultCutoffTime;
  }
  else {
    return 86400;
  }
}

- (void)setCachedResultCutoffTime:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cachedResultCutoffTime = a3;
}

- (void)setHasCachedResultCutoffTime:(BOOL)a3
{
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCachedResultCutoffTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)readArticlesFilterMethod
{
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_readArticlesFilterMethod;
  }
  else {
    return 1;
  }
}

- (void)setReadArticlesFilterMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_readArticlesFilterMethod = a3;
}

- (void)setHasReadArticlesFilterMethod:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasReadArticlesFilterMethod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasArticleListTodaySectionConfig
{
  return self->_articleListTodaySectionConfig != 0;
}

- (BOOL)hasForYouTodaySectionConfig
{
  return self->_forYouTodaySectionConfig != 0;
}

- (void)setMinimumStoriesAllocation:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_minimumStoriesAllocation = a3;
}

- (void)setHasMinimumStoriesAllocation:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasMinimumStoriesAllocation
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMaximumStoriesAllocation:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_maximumStoriesAllocation = a3;
}

- (void)setHasMaximumStoriesAllocation:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasMaximumStoriesAllocation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIntraSectionFilteringOptions:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_intraSectionFilteringOptions = a3;
}

- (void)setHasIntraSectionFilteringOptions:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasIntraSectionFilteringOptions
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setInterSectionFilteringOptions:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_interSectionFilteringOptions = a3;
}

- (void)setHasInterSectionFilteringOptions:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasInterSectionFilteringOptions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)seenArticlesFilterMethod
{
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    return self->_seenArticlesFilterMethod;
  }
  else {
    return 1;
  }
}

- (void)setSeenArticlesFilterMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_seenArticlesFilterMethod = a3;
}

- (void)setHasSeenArticlesFilterMethod:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSeenArticlesFilterMethod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasArticleIDsTodaySectionConfig
{
  return self->_articleIDsTodaySectionConfig != 0;
}

- (void)setShownInFavoritesOnlyMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_shownInFavoritesOnlyMode = a3;
}

- (void)setHasShownInFavoritesOnlyMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasShownInFavoritesOnlyMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasNameColorLight
{
  return self->_nameColorLight != 0;
}

- (BOOL)hasPersonalizedTodaySectionConfig
{
  return self->_personalizedTodaySectionConfig != 0;
}

- (void)setSeenArticlesMinimumTimeSinceFirstSeenToFilter:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_seenArticlesMinimumTimeSinceFirstSeenToFilter = a3;
}

- (void)setHasSeenArticlesMinimumTimeSinceFirstSeenToFilter:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasSeenArticlesMinimumTimeSinceFirstSeenToFilter
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasPersonalizationFeatureID
{
  return self->_personalizationFeatureID != 0;
}

- (void)setPresenceDeterminedByPersonalization:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_presenceDeterminedByPersonalization = a3;
}

- (void)setHasPresenceDeterminedByPersonalization:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasPresenceDeterminedByPersonalization
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasPersonalizedPresenceConfig
{
  return self->_personalizedPresenceConfig != 0;
}

- (unint64_t)queueMembershipsCount
{
  return self->_queueMemberships.count;
}

- (unint64_t)queueMemberships
{
  return self->_queueMemberships.list;
}

- (void)clearQueueMemberships
{
}

- (void)addQueueMembership:(unint64_t)a3
{
}

- (unint64_t)queueMembershipAtIndex:(unint64_t)a3
{
  p_queueMemberships = &self->_queueMemberships;
  unint64_t count = self->_queueMemberships.count;
  if (count <= a3) {
    [(id)objc_msgSend(MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578], objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_queueMemberships->list[a3];
}

- (void)setQueueMemberships:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasBackgroundGradientColor
{
  return self->_backgroundGradientColor != 0;
}

- (void)setGlanceable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_glanceable = a3;
}

- (void)setHasGlanceable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasGlanceable
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasCompactName
{
  return self->_compactName != 0;
}

- (BOOL)hasPersonalizedPresenceFeatureID
{
  return self->_personalizedPresenceFeatureID != 0;
}

- (void)setPersonalizedPresenceFeatureImpressionPrior:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_personalizedPresenceFeatureImpressionPrior = a3;
}

- (void)setHasPersonalizedPresenceFeatureImpressionPrior:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPersonalizedPresenceFeatureImpressionPrior
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setPersonalizedPresenceFeatureClickPrior:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_personalizedPresenceFeatureClickPrior = a3;
}

- (void)setHasPersonalizedPresenceFeatureClickPrior:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasPersonalizedPresenceFeatureClickPrior
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasReferralBarName
{
  return self->_referralBarName != 0;
}

- (BOOL)hasGroupActionTitle
{
  return self->_groupActionTitle != 0;
}

- (BOOL)hasGroupActionUrl
{
  return self->_groupActionUrl != 0;
}

- (BOOL)hasItemsTodaySectionConfig
{
  return self->_itemsTodaySectionConfig != 0;
}

- (int)promotionCriterion
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    return self->_promotionCriterion;
  }
  else {
    return 0;
  }
}

- (void)setPromotionCriterion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_promotionCriterion = a3;
}

- (void)setHasPromotionCriterion:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPromotionCriterion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasNameColorDark
{
  return self->_nameColorDark != 0;
}

- (BOOL)hasTagTodaySectionConfig
{
  return self->_tagTodaySectionConfig != 0;
}

- (BOOL)hasMutingTagID
{
  return self->_mutingTagID != 0;
}

- (BOOL)hasGroupNameActionUrl
{
  return self->_groupNameActionUrl != 0;
}

- (BOOL)hasBackgroundColorLight
{
  return self->_backgroundColorLight != 0;
}

- (BOOL)hasBackgroundColorDark
{
  return self->_backgroundColorDark != 0;
}

- (void)setFilterNonSubscribedInFavoritesOnlyMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_filterNonSubscribedInFavoritesOnlyMode = a3;
}

- (void)setHasFilterNonSubscribedInFavoritesOnlyMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasFilterNonSubscribedInFavoritesOnlyMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasSubidentifier
{
  return self->_subidentifier != 0;
}

- (void)setPaywalledStoriesMaxCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_paywalledStoriesMaxCount = a3;
}

- (void)setHasPaywalledStoriesMaxCount:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6B16843F4C906FC2411F1C1B7686D1C2)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasPaywalledStoriesMaxCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBTodaySectionConfig description](&v3, sel_description), -[NTPBTodaySectionConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKey:@"identifier"];
  }
  $6B16843F4C906FC2411F1C1B7686D1C2 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_fallbackOrder), @"fallback_order");
    $6B16843F4C906FC2411F1C1B7686D1C2 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_79;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_sectionType), @"section_type");
  $6B16843F4C906FC2411F1C1B7686D1C2 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_79:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_cachedResultCutoffTime), @"cached_result_cutoff_time");
  if ((*(_DWORD *)&self->_has & 0x800) != 0) {
LABEL_9:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_readArticlesFilterMethod), @"read_articles_filter_method");
LABEL_10:
  articleListTodaySectionConfig = self->_articleListTodaySectionConfig;
  if (articleListTodaySectionConfig) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBArticleListTodaySectionSpecificConfig dictionaryRepresentation](articleListTodaySectionConfig, "dictionaryRepresentation"), @"article_list_today_section_config");
  }
  forYouTodaySectionConfig = self->_forYouTodaySectionConfig;
  if (forYouTodaySectionConfig) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBForYouTodaySectionSpecificConfig dictionaryRepresentation](forYouTodaySectionConfig, "dictionaryRepresentation"), @"for_you_today_section_config");
  }
  $6B16843F4C906FC2411F1C1B7686D1C2 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x20) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_minimumStoriesAllocation), @"minimum_stories_allocation");
    $6B16843F4C906FC2411F1C1B7686D1C2 v10 = self->_has;
    if ((*(unsigned char *)&v10 & 0x10) == 0)
    {
LABEL_16:
      if ((*(unsigned char *)&v10 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_83;
    }
  }
  else if ((*(unsigned char *)&v10 & 0x10) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_maximumStoriesAllocation), @"maximum_stories_allocation");
  $6B16843F4C906FC2411F1C1B7686D1C2 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v10 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_intraSectionFilteringOptions), @"intra_section_filtering_options");
  $6B16843F4C906FC2411F1C1B7686D1C2 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v10 & 0x2000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_84:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_interSectionFilteringOptions), @"inter_section_filtering_options");
  if ((*(_DWORD *)&self->_has & 0x2000) != 0) {
LABEL_19:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_seenArticlesFilterMethod), @"seen_articles_filter_method");
LABEL_20:
  articleIDsTodaySectionConfig = self->_articleIDsTodaySectionConfig;
  if (articleIDsTodaySectionConfig) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBArticleIDsTodaySectionSpecificConfig dictionaryRepresentation](articleIDsTodaySectionConfig, "dictionaryRepresentation"), @"article_IDs_today_section_config");
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_shownInFavoritesOnlyMode), @"shown_in_favorites_only_mode");
  }
  nameColorLight = self->_nameColorLight;
  if (nameColorLight) {
    [v4 setObject:nameColorLight forKey:@"name_color_light"];
  }
  personalizedTodaySectionConfig = self->_personalizedTodaySectionConfig;
  if (personalizedTodaySectionConfig) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBPersonalizedTodaySectionSpecificConfig dictionaryRepresentation](personalizedTodaySectionConfig, "dictionaryRepresentation"), @"personalized_today_section_config");
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_seenArticlesMinimumTimeSinceFirstSeenToFilter), @"seen_articles_minimum_time_since_first_seen_to_filter");
  }
  personalizationFeatureID = self->_personalizationFeatureID;
  if (personalizationFeatureID) {
    [v4 setObject:personalizationFeatureID forKey:@"personalization_feature_ID"];
  }
  if (*((unsigned char *)&self->_has + 2)) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_presenceDeterminedByPersonalization), @"presence_determined_by_personalization");
  }
  personalizedPresenceConfig = self->_personalizedPresenceConfig;
  if (personalizedPresenceConfig) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBPersonalizedSectionPresenceConfig dictionaryRepresentation](personalizedPresenceConfig, "dictionaryRepresentation"), @"personalized_presence_config");
  }
  [v4 setObject:PBRepeatedUInt64NSArray() forKey:@"queue_membership"];
  backgroundGradientColor = self->_backgroundGradientColor;
  if (backgroundGradientColor) {
    [v4 setObject:backgroundGradientColor forKey:@"background_gradient_color"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_glanceable), @"glanceable");
  }
  compactName = self->_compactName;
  if (compactName) {
    [v4 setObject:compactName forKey:@"compact_name"];
  }
  personalizedPresenceFeatureID = self->_personalizedPresenceFeatureID;
  if (personalizedPresenceFeatureID) {
    [v4 setObject:personalizedPresenceFeatureID forKey:@"personalized_presence_feature_ID"];
  }
  $6B16843F4C906FC2411F1C1B7686D1C2 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x100) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_personalizedPresenceFeatureImpressionPrior), @"personalized_presence_feature_impression_prior");
    $6B16843F4C906FC2411F1C1B7686D1C2 v19 = self->_has;
  }
  if ((*(unsigned char *)&v19 & 0x80) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_personalizedPresenceFeatureClickPrior), @"personalized_presence_feature_click_prior");
  }
  referralBarName = self->_referralBarName;
  if (referralBarName) {
    [v4 setObject:referralBarName forKey:@"referral_bar_name"];
  }
  groupActionTitle = self->_groupActionTitle;
  if (groupActionTitle) {
    [v4 setObject:groupActionTitle forKey:@"group_action_title"];
  }
  groupActionUrl = self->_groupActionUrl;
  if (groupActionUrl) {
    [v4 setObject:groupActionUrl forKey:@"group_action_url"];
  }
  itemsTodaySectionConfig = self->_itemsTodaySectionConfig;
  if (itemsTodaySectionConfig) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBItemsTodaySectionSpecificConfig dictionaryRepresentation](itemsTodaySectionConfig, "dictionaryRepresentation"), @"items_today_section_config");
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_promotionCriterion), @"promotion_criterion");
  }
  nameColorDark = self->_nameColorDark;
  if (nameColorDark) {
    [v4 setObject:nameColorDark forKey:@"name_color_dark"];
  }
  tagTodaySectionConfig = self->_tagTodaySectionConfig;
  if (tagTodaySectionConfig) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBTagTodaySectionSpecificConfig dictionaryRepresentation](tagTodaySectionConfig, "dictionaryRepresentation"), @"tag_today_section_config");
  }
  mutingTagID = self->_mutingTagID;
  if (mutingTagID) {
    [v4 setObject:mutingTagID forKey:@"muting_tag_ID"];
  }
  groupNameActionUrl = self->_groupNameActionUrl;
  if (groupNameActionUrl) {
    [v4 setObject:groupNameActionUrl forKey:@"group_name_action_url"];
  }
  backgroundColorLight = self->_backgroundColorLight;
  if (backgroundColorLight) {
    [v4 setObject:backgroundColorLight forKey:@"background_color_light"];
  }
  backgroundColorDark = self->_backgroundColorDark;
  if (backgroundColorDark) {
    [v4 setObject:backgroundColorDark forKey:@"background_color_dark"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_filterNonSubscribedInFavoritesOnlyMode), @"filter_non_subscribed_in_favorites_only_mode");
  }
  subidentifier = self->_subidentifier;
  if (subidentifier) {
    [v4 setObject:subidentifier forKey:@"subidentifier"];
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_paywalledStoriesMaxCount), @"paywalled_stories_max_count");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodaySectionConfigReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  $6B16843F4C906FC2411F1C1B7686D1C2 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    $6B16843F4C906FC2411F1C1B7686D1C2 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_81;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  $6B16843F4C906FC2411F1C1B7686D1C2 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_81:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x800) != 0) {
LABEL_9:
  }
    PBDataWriterWriteInt32Field();
LABEL_10:
  if (self->_articleListTodaySectionConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_forYouTodaySectionConfig) {
    PBDataWriterWriteSubmessage();
  }
  $6B16843F4C906FC2411F1C1B7686D1C2 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    $6B16843F4C906FC2411F1C1B7686D1C2 v5 = self->_has;
    if ((*(unsigned char *)&v5 & 0x10) == 0)
    {
LABEL_16:
      if ((*(unsigned char *)&v5 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_85;
    }
  }
  else if ((*(unsigned char *)&v5 & 0x10) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint64Field();
  $6B16843F4C906FC2411F1C1B7686D1C2 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v5 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint64Field();
  $6B16843F4C906FC2411F1C1B7686D1C2 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v5 & 0x2000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_86:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x2000) != 0) {
LABEL_19:
  }
    PBDataWriterWriteInt32Field();
LABEL_20:
  if (self->_articleIDsTodaySectionConfig) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_nameColorLight) {
    PBDataWriterWriteStringField();
  }
  if (self->_personalizedTodaySectionConfig) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_personalizationFeatureID) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 2)) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_personalizedPresenceConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_queueMemberships.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_queueMemberships.count);
  }
  if (self->_backgroundGradientColor) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_compactName) {
    PBDataWriterWriteStringField();
  }
  if (self->_personalizedPresenceFeatureID) {
    PBDataWriterWriteStringField();
  }
  $6B16843F4C906FC2411F1C1B7686D1C2 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    PBDataWriterWriteUint64Field();
    $6B16843F4C906FC2411F1C1B7686D1C2 v7 = self->_has;
  }
  if ((*(unsigned char *)&v7 & 0x80) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_referralBarName) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupActionTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupActionUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_itemsTodaySectionConfig) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_nameColorDark) {
    PBDataWriterWriteStringField();
  }
  if (self->_tagTodaySectionConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mutingTagID) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupNameActionUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_backgroundColorLight) {
    PBDataWriterWriteStringField();
  }
  if (self->_backgroundColorDark) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_subidentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 216) = [(NSString *)self->_name copyWithZone:a3];
  *(void *)(v5 + 192) = [(NSString *)self->_identifier copyWithZone:a3];
  $6B16843F4C906FC2411F1C1B7686D1C2 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    *(void *)(v5 + 40) = self->_fallbackOrder;
    *(_DWORD *)(v5 + 316) |= 2u;
    $6B16843F4C906FC2411F1C1B7686D1C2 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 288) = self->_sectionType;
  *(_DWORD *)(v5 + 316) |= 0x1000u;
  $6B16843F4C906FC2411F1C1B7686D1C2 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_33:
  *(void *)(v5 + 32) = self->_cachedResultCutoffTime;
  *(_DWORD *)(v5 + 316) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 276) = self->_readArticlesFilterMethod;
    *(_DWORD *)(v5 + 316) |= 0x800u;
  }
LABEL_6:

  *(void *)(v5 + 120) = [(NTPBArticleListTodaySectionSpecificConfig *)self->_articleListTodaySectionConfig copyWithZone:a3];
  *(void *)(v5 + 160) = [(NTPBForYouTodaySectionSpecificConfig *)self->_forYouTodaySectionConfig copyWithZone:a3];
  $6B16843F4C906FC2411F1C1B7686D1C2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) != 0)
  {
    *(void *)(v5 + 72) = self->_minimumStoriesAllocation;
    *(_DWORD *)(v5 + 316) |= 0x20u;
    $6B16843F4C906FC2411F1C1B7686D1C2 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 0x10) == 0)
    {
LABEL_8:
      if ((*(unsigned char *)&v7 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
    goto LABEL_8;
  }
  *(void *)(v5 + 64) = self->_maximumStoriesAllocation;
  *(_DWORD *)(v5 + 316) |= 0x10u;
  $6B16843F4C906FC2411F1C1B7686D1C2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(void *)(v5 + 56) = self->_intraSectionFilteringOptions;
  *(_DWORD *)(v5 + 316) |= 8u;
  $6B16843F4C906FC2411F1C1B7686D1C2 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_38:
  *(void *)(v5 + 48) = self->_interSectionFilteringOptions;
  *(_DWORD *)(v5 + 316) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 292) = self->_seenArticlesFilterMethod;
    *(_DWORD *)(v5 + 316) |= 0x2000u;
  }
LABEL_12:

  *(void *)(v5 + 112) = [(NTPBArticleIDsTodaySectionSpecificConfig *)self->_articleIDsTodaySectionConfig copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *(unsigned char *)(v5 + 315) = self->_shownInFavoritesOnlyMode;
    *(_DWORD *)(v5 + 316) |= 0x20000u;
  }

  *(void *)(v5 + 232) = [(NSString *)self->_nameColorLight copyWithZone:a3];
  *(void *)(v5 + 264) = [(NTPBPersonalizedTodaySectionSpecificConfig *)self->_personalizedTodaySectionConfig copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    *(void *)(v5 + 104) = self->_seenArticlesMinimumTimeSinceFirstSeenToFilter;
    *(_DWORD *)(v5 + 316) |= 0x200u;
  }

  *(void *)(v5 + 240) = [(NSString *)self->_personalizationFeatureID copyWithZone:a3];
  if (*((unsigned char *)&self->_has + 2))
  {
    *(unsigned char *)(v5 + 314) = self->_presenceDeterminedByPersonalization;
    *(_DWORD *)(v5 + 316) |= 0x10000u;
  }

  *(void *)(v5 + 248) = [(NTPBPersonalizedSectionPresenceConfig *)self->_personalizedPresenceConfig copyWithZone:a3];
  PBRepeatedUInt64Copy();

  *(void *)(v5 + 144) = [(NSString *)self->_backgroundGradientColor copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 313) = self->_glanceable;
    *(_DWORD *)(v5 + 316) |= 0x8000u;
  }

  *(void *)(v5 + 152) = [(NSString *)self->_compactName copyWithZone:a3];
  *(void *)(v5 + 256) = [(NSString *)self->_personalizedPresenceFeatureID copyWithZone:a3];
  $6B16843F4C906FC2411F1C1B7686D1C2 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) != 0)
  {
    *(void *)(v5 + 96) = self->_personalizedPresenceFeatureImpressionPrior;
    *(_DWORD *)(v5 + 316) |= 0x100u;
    $6B16843F4C906FC2411F1C1B7686D1C2 v8 = self->_has;
  }
  if ((*(unsigned char *)&v8 & 0x80) != 0)
  {
    *(void *)(v5 + 88) = self->_personalizedPresenceFeatureClickPrior;
    *(_DWORD *)(v5 + 316) |= 0x80u;
  }

  *(void *)(v5 + 280) = [(NSString *)self->_referralBarName copyWithZone:a3];
  *(void *)(v5 + 168) = [(NSString *)self->_groupActionTitle copyWithZone:a3];

  *(void *)(v5 + 176) = [(NSString *)self->_groupActionUrl copyWithZone:a3];
  *(void *)(v5 + 200) = [(NTPBItemsTodaySectionSpecificConfig *)self->_itemsTodaySectionConfig copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    *(_DWORD *)(v5 + 272) = self->_promotionCriterion;
    *(_DWORD *)(v5 + 316) |= 0x400u;
  }

  *(void *)(v5 + 224) = [(NSString *)self->_nameColorDark copyWithZone:a3];
  *(void *)(v5 + 304) = [(NTPBTagTodaySectionSpecificConfig *)self->_tagTodaySectionConfig copyWithZone:a3];

  *(void *)(v5 + 208) = [(NSString *)self->_mutingTagID copyWithZone:a3];
  *(void *)(v5 + 184) = [(NSString *)self->_groupNameActionUrl copyWithZone:a3];

  *(void *)(v5 + 136) = [(NSString *)self->_backgroundColorLight copyWithZone:a3];
  *(void *)(v5 + 128) = [(NSString *)self->_backgroundColorDark copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 312) = self->_filterNonSubscribedInFavoritesOnlyMode;
    *(_DWORD *)(v5 + 316) |= 0x4000u;
  }

  *(void *)(v5 + 296) = [(NSString *)self->_subidentifier copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(void *)(v5 + 80) = self->_paywalledStoriesMaxCount;
    *(_DWORD *)(v5 + 316) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    name = self->_name;
    if (!((unint64_t)name | *((void *)a3 + 27)) || (int IsEqual = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      identifier = self->_identifier;
      if (!((unint64_t)identifier | *((void *)a3 + 24))
        || (int IsEqual = -[NSString isEqual:](identifier, "isEqual:")) != 0)
      {
        $6B16843F4C906FC2411F1C1B7686D1C2 has = self->_has;
        int v9 = *((_DWORD *)a3 + 79);
        if ((*(unsigned char *)&has & 2) != 0)
        {
          if ((v9 & 2) == 0 || self->_fallbackOrder != *((void *)a3 + 5)) {
            goto LABEL_62;
          }
        }
        else if ((v9 & 2) != 0)
        {
          goto LABEL_62;
        }
        if ((*(_WORD *)&has & 0x1000) != 0)
        {
          if ((v9 & 0x1000) == 0 || self->_sectionType != *((_DWORD *)a3 + 72)) {
            goto LABEL_62;
          }
        }
        else if ((v9 & 0x1000) != 0)
        {
          goto LABEL_62;
        }
        if (*(unsigned char *)&has)
        {
          if ((v9 & 1) == 0 || self->_cachedResultCutoffTime != *((void *)a3 + 4)) {
            goto LABEL_62;
          }
        }
        else if (v9)
        {
          goto LABEL_62;
        }
        if ((*(_WORD *)&has & 0x800) != 0)
        {
          if ((v9 & 0x800) == 0 || self->_readArticlesFilterMethod != *((_DWORD *)a3 + 69)) {
            goto LABEL_62;
          }
        }
        else if ((v9 & 0x800) != 0)
        {
          goto LABEL_62;
        }
        articleListTodaySectionConfig = self->_articleListTodaySectionConfig;
        if (!((unint64_t)articleListTodaySectionConfig | *((void *)a3 + 15))
          || (int IsEqual = -[NTPBArticleListTodaySectionSpecificConfig isEqual:](articleListTodaySectionConfig, "isEqual:")) != 0)
        {
          forYouTodaySectionConfig = self->_forYouTodaySectionConfig;
          if (!((unint64_t)forYouTodaySectionConfig | *((void *)a3 + 20))
            || (int IsEqual = -[NTPBForYouTodaySectionSpecificConfig isEqual:](forYouTodaySectionConfig, "isEqual:")) != 0)
          {
            $6B16843F4C906FC2411F1C1B7686D1C2 v12 = self->_has;
            int v13 = *((_DWORD *)a3 + 79);
            if ((*(unsigned char *)&v12 & 0x20) != 0)
            {
              if ((v13 & 0x20) == 0 || self->_minimumStoriesAllocation != *((void *)a3 + 9)) {
                goto LABEL_62;
              }
            }
            else if ((v13 & 0x20) != 0)
            {
              goto LABEL_62;
            }
            if ((*(unsigned char *)&v12 & 0x10) != 0)
            {
              if ((v13 & 0x10) == 0 || self->_maximumStoriesAllocation != *((void *)a3 + 8)) {
                goto LABEL_62;
              }
            }
            else if ((v13 & 0x10) != 0)
            {
              goto LABEL_62;
            }
            if ((*(unsigned char *)&v12 & 8) != 0)
            {
              if ((v13 & 8) == 0 || self->_intraSectionFilteringOptions != *((void *)a3 + 7)) {
                goto LABEL_62;
              }
            }
            else if ((v13 & 8) != 0)
            {
              goto LABEL_62;
            }
            if ((*(unsigned char *)&v12 & 4) != 0)
            {
              if ((v13 & 4) == 0 || self->_interSectionFilteringOptions != *((void *)a3 + 6)) {
                goto LABEL_62;
              }
            }
            else if ((v13 & 4) != 0)
            {
              goto LABEL_62;
            }
            if ((*(_WORD *)&v12 & 0x2000) != 0)
            {
              if ((v13 & 0x2000) == 0 || self->_seenArticlesFilterMethod != *((_DWORD *)a3 + 73)) {
                goto LABEL_62;
              }
            }
            else if ((v13 & 0x2000) != 0)
            {
              goto LABEL_62;
            }
            articleIDsTodaySectionConfig = self->_articleIDsTodaySectionConfig;
            if ((unint64_t)articleIDsTodaySectionConfig | *((void *)a3 + 14))
            {
              int IsEqual = -[NTPBArticleIDsTodaySectionSpecificConfig isEqual:](articleIDsTodaySectionConfig, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
              $6B16843F4C906FC2411F1C1B7686D1C2 v12 = self->_has;
            }
            int v15 = *((_DWORD *)a3 + 79);
            if ((*(_DWORD *)&v12 & 0x20000) != 0)
            {
              if ((v15 & 0x20000) == 0) {
                goto LABEL_62;
              }
              if (self->_shownInFavoritesOnlyMode)
              {
                if (!*((unsigned char *)a3 + 315)) {
                  goto LABEL_62;
                }
              }
              else if (*((unsigned char *)a3 + 315))
              {
                goto LABEL_62;
              }
            }
            else if ((v15 & 0x20000) != 0)
            {
              goto LABEL_62;
            }
            nameColorLight = self->_nameColorLight;
            if ((unint64_t)nameColorLight | *((void *)a3 + 29))
            {
              int IsEqual = -[NSString isEqual:](nameColorLight, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            personalizedTodaySectionConfig = self->_personalizedTodaySectionConfig;
            if ((unint64_t)personalizedTodaySectionConfig | *((void *)a3 + 33))
            {
              int IsEqual = -[NTPBPersonalizedTodaySectionSpecificConfig isEqual:](personalizedTodaySectionConfig, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            $6B16843F4C906FC2411F1C1B7686D1C2 v18 = self->_has;
            int v19 = *((_DWORD *)a3 + 79);
            if ((*(_WORD *)&v18 & 0x200) != 0)
            {
              if ((v19 & 0x200) == 0 || self->_seenArticlesMinimumTimeSinceFirstSeenToFilter != *((void *)a3 + 13)) {
                goto LABEL_62;
              }
            }
            else if ((v19 & 0x200) != 0)
            {
              goto LABEL_62;
            }
            personalizationFeatureID = self->_personalizationFeatureID;
            if ((unint64_t)personalizationFeatureID | *((void *)a3 + 30))
            {
              int IsEqual = -[NSString isEqual:](personalizationFeatureID, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
              $6B16843F4C906FC2411F1C1B7686D1C2 v18 = self->_has;
            }
            int v21 = *((_DWORD *)a3 + 79);
            if ((*(_DWORD *)&v18 & 0x10000) != 0)
            {
              if ((v21 & 0x10000) == 0) {
                goto LABEL_62;
              }
              if (self->_presenceDeterminedByPersonalization)
              {
                if (!*((unsigned char *)a3 + 314)) {
                  goto LABEL_62;
                }
              }
              else if (*((unsigned char *)a3 + 314))
              {
                goto LABEL_62;
              }
            }
            else if ((v21 & 0x10000) != 0)
            {
              goto LABEL_62;
            }
            personalizedPresenceConfig = self->_personalizedPresenceConfig;
            if ((unint64_t)personalizedPresenceConfig | *((void *)a3 + 31))
            {
              int IsEqual = -[NTPBPersonalizedSectionPresenceConfig isEqual:](personalizedPresenceConfig, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            int IsEqual = PBRepeatedUInt64IsEqual();
            if (!IsEqual) {
              return IsEqual;
            }
            backgroundGradientColor = self->_backgroundGradientColor;
            if ((unint64_t)backgroundGradientColor | *((void *)a3 + 18))
            {
              int IsEqual = -[NSString isEqual:](backgroundGradientColor, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            int v24 = *((_DWORD *)a3 + 79);
            if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
            {
              if ((v24 & 0x8000) == 0) {
                goto LABEL_62;
              }
              if (self->_glanceable)
              {
                if (!*((unsigned char *)a3 + 313)) {
                  goto LABEL_62;
                }
              }
              else if (*((unsigned char *)a3 + 313))
              {
                goto LABEL_62;
              }
            }
            else if ((v24 & 0x8000) != 0)
            {
              goto LABEL_62;
            }
            compactName = self->_compactName;
            if ((unint64_t)compactName | *((void *)a3 + 19))
            {
              int IsEqual = -[NSString isEqual:](compactName, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            personalizedPresenceFeatureID = self->_personalizedPresenceFeatureID;
            if ((unint64_t)personalizedPresenceFeatureID | *((void *)a3 + 32))
            {
              int IsEqual = -[NSString isEqual:](personalizedPresenceFeatureID, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            $6B16843F4C906FC2411F1C1B7686D1C2 v27 = self->_has;
            int v28 = *((_DWORD *)a3 + 79);
            if ((*(_WORD *)&v27 & 0x100) != 0)
            {
              if ((v28 & 0x100) == 0 || self->_personalizedPresenceFeatureImpressionPrior != *((void *)a3 + 12)) {
                goto LABEL_62;
              }
            }
            else if ((v28 & 0x100) != 0)
            {
              goto LABEL_62;
            }
            if ((*(unsigned char *)&v27 & 0x80) != 0)
            {
              if ((v28 & 0x80) == 0 || self->_personalizedPresenceFeatureClickPrior != *((void *)a3 + 11)) {
                goto LABEL_62;
              }
            }
            else if ((v28 & 0x80) != 0)
            {
              goto LABEL_62;
            }
            referralBarName = self->_referralBarName;
            if ((unint64_t)referralBarName | *((void *)a3 + 35))
            {
              int IsEqual = -[NSString isEqual:](referralBarName, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            groupActionTitle = self->_groupActionTitle;
            if ((unint64_t)groupActionTitle | *((void *)a3 + 21))
            {
              int IsEqual = -[NSString isEqual:](groupActionTitle, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            groupActionUrl = self->_groupActionUrl;
            if ((unint64_t)groupActionUrl | *((void *)a3 + 22))
            {
              int IsEqual = -[NSString isEqual:](groupActionUrl, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            itemsTodaySectionConfig = self->_itemsTodaySectionConfig;
            if ((unint64_t)itemsTodaySectionConfig | *((void *)a3 + 25))
            {
              int IsEqual = -[NTPBItemsTodaySectionSpecificConfig isEqual:](itemsTodaySectionConfig, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            int v33 = *((_DWORD *)a3 + 79);
            if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
            {
              if ((v33 & 0x400) == 0 || self->_promotionCriterion != *((_DWORD *)a3 + 68)) {
                goto LABEL_62;
              }
            }
            else if ((v33 & 0x400) != 0)
            {
              goto LABEL_62;
            }
            nameColorDark = self->_nameColorDark;
            if ((unint64_t)nameColorDark | *((void *)a3 + 28))
            {
              int IsEqual = -[NSString isEqual:](nameColorDark, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            tagTodaySectionConfig = self->_tagTodaySectionConfig;
            if ((unint64_t)tagTodaySectionConfig | *((void *)a3 + 38))
            {
              int IsEqual = -[NTPBTagTodaySectionSpecificConfig isEqual:](tagTodaySectionConfig, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            mutingTagID = self->_mutingTagID;
            if ((unint64_t)mutingTagID | *((void *)a3 + 26))
            {
              int IsEqual = -[NSString isEqual:](mutingTagID, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            groupNameActionUrl = self->_groupNameActionUrl;
            if ((unint64_t)groupNameActionUrl | *((void *)a3 + 23))
            {
              int IsEqual = -[NSString isEqual:](groupNameActionUrl, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            backgroundColorLight = self->_backgroundColorLight;
            if ((unint64_t)backgroundColorLight | *((void *)a3 + 17))
            {
              int IsEqual = -[NSString isEqual:](backgroundColorLight, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            backgroundColorDark = self->_backgroundColorDark;
            if ((unint64_t)backgroundColorDark | *((void *)a3 + 16))
            {
              int IsEqual = -[NSString isEqual:](backgroundColorDark, "isEqual:");
              if (!IsEqual) {
                return IsEqual;
              }
            }
            $6B16843F4C906FC2411F1C1B7686D1C2 v40 = self->_has;
            int v41 = *((_DWORD *)a3 + 79);
            if ((*(_WORD *)&v40 & 0x4000) != 0)
            {
              if ((v41 & 0x4000) != 0)
              {
                if (self->_filterNonSubscribedInFavoritesOnlyMode)
                {
                  if (!*((unsigned char *)a3 + 312)) {
                    goto LABEL_62;
                  }
                  goto LABEL_148;
                }
                if (!*((unsigned char *)a3 + 312))
                {
LABEL_148:
                  subidentifier = self->_subidentifier;
                  if ((unint64_t)subidentifier | *((void *)a3 + 37))
                  {
                    int IsEqual = -[NSString isEqual:](subidentifier, "isEqual:");
                    if (!IsEqual) {
                      return IsEqual;
                    }
                    $6B16843F4C906FC2411F1C1B7686D1C2 v40 = self->_has;
                  }
                  int v43 = *((_DWORD *)a3 + 79);
                  LOBYTE(IsEqual) = (v43 & 0x40) == 0;
                  if ((*(unsigned char *)&v40 & 0x40) == 0) {
                    return IsEqual;
                  }
                  if ((v43 & 0x40) == 0 || self->_paywalledStoriesMaxCount != *((void *)a3 + 10)) {
                    goto LABEL_62;
                  }
                  LOBYTE(IsEqual) = 1;
                  return IsEqual;
                }
              }
            }
            else if ((v41 & 0x4000) == 0)
            {
              goto LABEL_148;
            }
LABEL_62:
            LOBYTE(IsEqual) = 0;
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v49 = [(NSString *)self->_name hash];
  NSUInteger v48 = [(NSString *)self->_identifier hash];
  $6B16843F4C906FC2411F1C1B7686D1C2 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    unint64_t v47 = 2654435761u * self->_fallbackOrder;
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
LABEL_3:
      uint64_t v46 = 2654435761 * self->_sectionType;
      if (*(unsigned char *)&has) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v45 = 0;
      if ((*(_WORD *)&has & 0x800) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v47 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v46 = 0;
  if ((*(unsigned char *)&has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v45 = 2654435761u * self->_cachedResultCutoffTime;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_5:
    uint64_t v44 = 2654435761 * self->_readArticlesFilterMethod;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v44 = 0;
LABEL_10:
  unint64_t v43 = [(NTPBArticleListTodaySectionSpecificConfig *)self->_articleListTodaySectionConfig hash];
  unint64_t v42 = [(NTPBForYouTodaySectionSpecificConfig *)self->_forYouTodaySectionConfig hash];
  $6B16843F4C906FC2411F1C1B7686D1C2 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 0x20) != 0)
  {
    unint64_t v41 = 2654435761u * self->_minimumStoriesAllocation;
    if ((*(unsigned char *)&v4 & 0x10) != 0)
    {
LABEL_12:
      unint64_t v40 = 2654435761u * self->_maximumStoriesAllocation;
      if ((*(unsigned char *)&v4 & 8) != 0) {
        goto LABEL_13;
      }
      goto LABEL_18;
    }
  }
  else
  {
    unint64_t v41 = 0;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_12;
    }
  }
  unint64_t v40 = 0;
  if ((*(unsigned char *)&v4 & 8) != 0)
  {
LABEL_13:
    unint64_t v39 = 2654435761u * self->_intraSectionFilteringOptions;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_14;
    }
LABEL_19:
    unint64_t v38 = 0;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
LABEL_18:
  unint64_t v39 = 0;
  if ((*(unsigned char *)&v4 & 4) == 0) {
    goto LABEL_19;
  }
LABEL_14:
  unint64_t v38 = 2654435761u * self->_interSectionFilteringOptions;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v37 = 2654435761 * self->_seenArticlesFilterMethod;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v37 = 0;
LABEL_21:
  unint64_t v36 = [(NTPBArticleIDsTodaySectionSpecificConfig *)self->_articleIDsTodaySectionConfig hash];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    uint64_t v35 = 2654435761 * self->_shownInFavoritesOnlyMode;
  }
  else {
    uint64_t v35 = 0;
  }
  NSUInteger v34 = [(NSString *)self->_nameColorLight hash];
  unint64_t v33 = [(NTPBPersonalizedTodaySectionSpecificConfig *)self->_personalizedTodaySectionConfig hash];
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    unint64_t v32 = 2654435761u * self->_seenArticlesMinimumTimeSinceFirstSeenToFilter;
  }
  else {
    unint64_t v32 = 0;
  }
  NSUInteger v31 = [(NSString *)self->_personalizationFeatureID hash];
  if (*((unsigned char *)&self->_has + 2)) {
    uint64_t v30 = 2654435761 * self->_presenceDeterminedByPersonalization;
  }
  else {
    uint64_t v30 = 0;
  }
  unint64_t v29 = [(NTPBPersonalizedSectionPresenceConfig *)self->_personalizedPresenceConfig hash];
  uint64_t v28 = PBRepeatedUInt64Hash();
  NSUInteger v27 = [(NSString *)self->_backgroundGradientColor hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    uint64_t v26 = 2654435761 * self->_glanceable;
  }
  else {
    uint64_t v26 = 0;
  }
  NSUInteger v25 = [(NSString *)self->_compactName hash];
  NSUInteger v24 = [(NSString *)self->_personalizedPresenceFeatureID hash];
  $6B16843F4C906FC2411F1C1B7686D1C2 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) != 0)
  {
    unint64_t v23 = 2654435761u * self->_personalizedPresenceFeatureImpressionPrior;
    if ((*(unsigned char *)&v5 & 0x80) != 0) {
      goto LABEL_35;
    }
  }
  else
  {
    unint64_t v23 = 0;
    if ((*(unsigned char *)&v5 & 0x80) != 0)
    {
LABEL_35:
      unint64_t v22 = 2654435761u * self->_personalizedPresenceFeatureClickPrior;
      goto LABEL_38;
    }
  }
  unint64_t v22 = 0;
LABEL_38:
  NSUInteger v21 = [(NSString *)self->_referralBarName hash];
  NSUInteger v20 = [(NSString *)self->_groupActionTitle hash];
  NSUInteger v19 = [(NSString *)self->_groupActionUrl hash];
  unint64_t v18 = [(NTPBItemsTodaySectionSpecificConfig *)self->_itemsTodaySectionConfig hash];
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    NSUInteger v6 = [(NSString *)self->_nameColorDark hash];
  }
  else {
    NSUInteger v6 = [(NSString *)self->_nameColorDark hash];
  }
  NSUInteger v7 = v6;
  unint64_t v8 = [(NTPBTagTodaySectionSpecificConfig *)self->_tagTodaySectionConfig hash];
  NSUInteger v9 = [(NSString *)self->_mutingTagID hash];
  NSUInteger v10 = [(NSString *)self->_groupNameActionUrl hash];
  NSUInteger v11 = [(NSString *)self->_backgroundColorLight hash];
  NSUInteger v12 = [(NSString *)self->_backgroundColorDark hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    uint64_t v13 = 2654435761 * self->_filterNonSubscribedInFavoritesOnlyMode;
  }
  else {
    uint64_t v13 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_subidentifier hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    unint64_t v15 = 2654435761u * self->_paywalledStoriesMaxCount;
  }
  else {
    unint64_t v15 = 0;
  }
  return v48 ^ v49 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 27)) {
    -[NTPBTodaySectionConfig setName:](self, "setName:");
  }
  if (*((void *)a3 + 24)) {
    -[NTPBTodaySectionConfig setIdentifier:](self, "setIdentifier:");
  }
  int v5 = *((_DWORD *)a3 + 79);
  if ((v5 & 2) != 0)
  {
    self->_fallbackOrder = *((void *)a3 + 5);
    *(_DWORD *)&self->_has |= 2u;
    int v5 = *((_DWORD *)a3 + 79);
    if ((v5 & 0x1000) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((v5 & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  self->_sectionType = *((_DWORD *)a3 + 72);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)a3 + 79);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  self->_cachedResultCutoffTime = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)a3 + 79) & 0x800) != 0)
  {
LABEL_9:
    self->_readArticlesFilterMethod = *((_DWORD *)a3 + 69);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_10:
  articleListTodaySectionConfig = self->_articleListTodaySectionConfig;
  uint64_t v7 = *((void *)a3 + 15);
  if (articleListTodaySectionConfig)
  {
    if (v7) {
      -[NTPBArticleListTodaySectionSpecificConfig mergeFrom:](articleListTodaySectionConfig, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[NTPBTodaySectionConfig setArticleListTodaySectionConfig:](self, "setArticleListTodaySectionConfig:");
  }
  forYouTodaySectionConfig = self->_forYouTodaySectionConfig;
  uint64_t v9 = *((void *)a3 + 20);
  if (forYouTodaySectionConfig)
  {
    if (v9) {
      -[NTPBForYouTodaySectionSpecificConfig mergeFrom:](forYouTodaySectionConfig, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[NTPBTodaySectionConfig setForYouTodaySectionConfig:](self, "setForYouTodaySectionConfig:");
  }
  int v10 = *((_DWORD *)a3 + 79);
  if ((v10 & 0x20) != 0)
  {
    self->_minimumStoriesAllocation = *((void *)a3 + 9);
    *(_DWORD *)&self->_has |= 0x20u;
    int v10 = *((_DWORD *)a3 + 79);
    if ((v10 & 0x10) == 0)
    {
LABEL_26:
      if ((v10 & 8) == 0) {
        goto LABEL_27;
      }
      goto LABEL_35;
    }
  }
  else if ((v10 & 0x10) == 0)
  {
    goto LABEL_26;
  }
  self->_maximumStoriesAllocation = *((void *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x10u;
  int v10 = *((_DWORD *)a3 + 79);
  if ((v10 & 8) == 0)
  {
LABEL_27:
    if ((v10 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_intraSectionFilteringOptions = *((void *)a3 + 7);
  *(_DWORD *)&self->_has |= 8u;
  int v10 = *((_DWORD *)a3 + 79);
  if ((v10 & 4) == 0)
  {
LABEL_28:
    if ((v10 & 0x2000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_36:
  self->_interSectionFilteringOptions = *((void *)a3 + 6);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)a3 + 79) & 0x2000) != 0)
  {
LABEL_29:
    self->_seenArticlesFilterMethod = *((_DWORD *)a3 + 73);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_30:
  articleIDsTodaySectionConfig = self->_articleIDsTodaySectionConfig;
  uint64_t v12 = *((void *)a3 + 14);
  if (articleIDsTodaySectionConfig)
  {
    if (v12) {
      -[NTPBArticleIDsTodaySectionSpecificConfig mergeFrom:](articleIDsTodaySectionConfig, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[NTPBTodaySectionConfig setArticleIDsTodaySectionConfig:](self, "setArticleIDsTodaySectionConfig:");
  }
  if ((*((unsigned char *)a3 + 318) & 2) != 0)
  {
    self->_shownInFavoritesOnlyMode = *((unsigned char *)a3 + 315);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((void *)a3 + 29)) {
    -[NTPBTodaySectionConfig setNameColorLight:](self, "setNameColorLight:");
  }
  personalizedTodaySectionConfig = self->_personalizedTodaySectionConfig;
  uint64_t v14 = *((void *)a3 + 33);
  if (personalizedTodaySectionConfig)
  {
    if (v14) {
      -[NTPBPersonalizedTodaySectionSpecificConfig mergeFrom:](personalizedTodaySectionConfig, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[NTPBTodaySectionConfig setPersonalizedTodaySectionConfig:](self, "setPersonalizedTodaySectionConfig:");
  }
  if ((*((unsigned char *)a3 + 317) & 2) != 0)
  {
    self->_seenArticlesMinimumTimeSinceFirstSeenToFilter = *((void *)a3 + 13);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((void *)a3 + 30)) {
    -[NTPBTodaySectionConfig setPersonalizationFeatureID:](self, "setPersonalizationFeatureID:");
  }
  if (*((unsigned char *)a3 + 318))
  {
    self->_presenceDeterminedByPersonalization = *((unsigned char *)a3 + 314);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  personalizedPresenceConfig = self->_personalizedPresenceConfig;
  uint64_t v16 = *((void *)a3 + 31);
  if (personalizedPresenceConfig)
  {
    if (v16) {
      -[NTPBPersonalizedSectionPresenceConfig mergeFrom:](personalizedPresenceConfig, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[NTPBTodaySectionConfig setPersonalizedPresenceConfig:](self, "setPersonalizedPresenceConfig:");
  }
  uint64_t v17 = [a3 queueMembershipsCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t i = 0; i != v18; ++i)
      -[NTPBTodaySectionConfig addQueueMembership:](self, "addQueueMembership:", [a3 queueMembershipAtIndex:i]);
  }
  if (*((void *)a3 + 18)) {
    -[NTPBTodaySectionConfig setBackgroundGradientColor:](self, "setBackgroundGradientColor:");
  }
  if ((*((unsigned char *)a3 + 317) & 0x80) != 0)
  {
    self->_glanceable = *((unsigned char *)a3 + 313);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  if (*((void *)a3 + 19)) {
    -[NTPBTodaySectionConfig setCompactName:](self, "setCompactName:");
  }
  if (*((void *)a3 + 32)) {
    -[NTPBTodaySectionConfig setPersonalizedPresenceFeatureID:](self, "setPersonalizedPresenceFeatureID:");
  }
  int v20 = *((_DWORD *)a3 + 79);
  if ((v20 & 0x100) != 0)
  {
    self->_personalizedPresenceFeatureImpressionPrior = *((void *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x100u;
    int v20 = *((_DWORD *)a3 + 79);
  }
  if ((v20 & 0x80) != 0)
  {
    self->_personalizedPresenceFeatureClickPrior = *((void *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  if (*((void *)a3 + 35)) {
    -[NTPBTodaySectionConfig setReferralBarName:](self, "setReferralBarName:");
  }
  if (*((void *)a3 + 21)) {
    -[NTPBTodaySectionConfig setGroupActionTitle:](self, "setGroupActionTitle:");
  }
  if (*((void *)a3 + 22)) {
    -[NTPBTodaySectionConfig setGroupActionUrl:](self, "setGroupActionUrl:");
  }
  itemsTodaySectionConfig = self->_itemsTodaySectionConfig;
  uint64_t v22 = *((void *)a3 + 25);
  if (itemsTodaySectionConfig)
  {
    if (v22) {
      -[NTPBItemsTodaySectionSpecificConfig mergeFrom:](itemsTodaySectionConfig, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[NTPBTodaySectionConfig setItemsTodaySectionConfig:](self, "setItemsTodaySectionConfig:");
  }
  if ((*((unsigned char *)a3 + 317) & 4) != 0)
  {
    self->_promotionCriterion = *((_DWORD *)a3 + 68);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((void *)a3 + 28)) {
    -[NTPBTodaySectionConfig setNameColorDark:](self, "setNameColorDark:");
  }
  tagTodaySectionConfig = self->_tagTodaySectionConfig;
  uint64_t v24 = *((void *)a3 + 38);
  if (tagTodaySectionConfig)
  {
    if (v24) {
      -[NTPBTagTodaySectionSpecificConfig mergeFrom:](tagTodaySectionConfig, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[NTPBTodaySectionConfig setTagTodaySectionConfig:](self, "setTagTodaySectionConfig:");
  }
  if (*((void *)a3 + 26)) {
    -[NTPBTodaySectionConfig setMutingTagID:](self, "setMutingTagID:");
  }
  if (*((void *)a3 + 23)) {
    -[NTPBTodaySectionConfig setGroupNameActionUrl:](self, "setGroupNameActionUrl:");
  }
  if (*((void *)a3 + 17)) {
    -[NTPBTodaySectionConfig setBackgroundColorLight:](self, "setBackgroundColorLight:");
  }
  if (*((void *)a3 + 16)) {
    -[NTPBTodaySectionConfig setBackgroundColorDark:](self, "setBackgroundColorDark:");
  }
  if ((*((unsigned char *)a3 + 317) & 0x40) != 0)
  {
    self->_filterNonSubscribedInFavoritesOnlyMode = *((unsigned char *)a3 + 312);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((void *)a3 + 37)) {
    -[NTPBTodaySectionConfig setSubidentifier:](self, "setSubidentifier:");
  }
  if ((*((unsigned char *)a3 + 316) & 0x40) != 0)
  {
    self->_paywalledStoriesMaxCount = *((void *)a3 + 10);
    *(_DWORD *)&self->_has |= 0x40u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)fallbackOrder
{
  return self->_fallbackOrder;
}

- (NTPBArticleListTodaySectionSpecificConfig)articleListTodaySectionConfig
{
  return self->_articleListTodaySectionConfig;
}

- (void)setArticleListTodaySectionConfig:(id)a3
{
}

- (NTPBForYouTodaySectionSpecificConfig)forYouTodaySectionConfig
{
  return self->_forYouTodaySectionConfig;
}

- (void)setForYouTodaySectionConfig:(id)a3
{
}

- (unint64_t)minimumStoriesAllocation
{
  return self->_minimumStoriesAllocation;
}

- (unint64_t)maximumStoriesAllocation
{
  return self->_maximumStoriesAllocation;
}

- (unint64_t)intraSectionFilteringOptions
{
  return self->_intraSectionFilteringOptions;
}

- (unint64_t)interSectionFilteringOptions
{
  return self->_interSectionFilteringOptions;
}

- (NTPBArticleIDsTodaySectionSpecificConfig)articleIDsTodaySectionConfig
{
  return self->_articleIDsTodaySectionConfig;
}

- (void)setArticleIDsTodaySectionConfig:(id)a3
{
}

- (BOOL)shownInFavoritesOnlyMode
{
  return self->_shownInFavoritesOnlyMode;
}

- (NSString)nameColorLight
{
  return self->_nameColorLight;
}

- (void)setNameColorLight:(id)a3
{
}

- (NTPBPersonalizedTodaySectionSpecificConfig)personalizedTodaySectionConfig
{
  return self->_personalizedTodaySectionConfig;
}

- (void)setPersonalizedTodaySectionConfig:(id)a3
{
}

- (unint64_t)seenArticlesMinimumTimeSinceFirstSeenToFilter
{
  return self->_seenArticlesMinimumTimeSinceFirstSeenToFilter;
}

- (NSString)personalizationFeatureID
{
  return self->_personalizationFeatureID;
}

- (void)setPersonalizationFeatureID:(id)a3
{
}

- (BOOL)presenceDeterminedByPersonalization
{
  return self->_presenceDeterminedByPersonalization;
}

- (NTPBPersonalizedSectionPresenceConfig)personalizedPresenceConfig
{
  return self->_personalizedPresenceConfig;
}

- (void)setPersonalizedPresenceConfig:(id)a3
{
}

- (NSString)backgroundGradientColor
{
  return self->_backgroundGradientColor;
}

- (void)setBackgroundGradientColor:(id)a3
{
}

- (BOOL)glanceable
{
  return self->_glanceable;
}

- (NSString)compactName
{
  return self->_compactName;
}

- (void)setCompactName:(id)a3
{
}

- (NSString)personalizedPresenceFeatureID
{
  return self->_personalizedPresenceFeatureID;
}

- (void)setPersonalizedPresenceFeatureID:(id)a3
{
}

- (unint64_t)personalizedPresenceFeatureImpressionPrior
{
  return self->_personalizedPresenceFeatureImpressionPrior;
}

- (unint64_t)personalizedPresenceFeatureClickPrior
{
  return self->_personalizedPresenceFeatureClickPrior;
}

- (NSString)referralBarName
{
  return self->_referralBarName;
}

- (void)setReferralBarName:(id)a3
{
}

- (NSString)groupActionTitle
{
  return self->_groupActionTitle;
}

- (void)setGroupActionTitle:(id)a3
{
}

- (NSString)groupActionUrl
{
  return self->_groupActionUrl;
}

- (void)setGroupActionUrl:(id)a3
{
}

- (NTPBItemsTodaySectionSpecificConfig)itemsTodaySectionConfig
{
  return self->_itemsTodaySectionConfig;
}

- (void)setItemsTodaySectionConfig:(id)a3
{
}

- (NSString)nameColorDark
{
  return self->_nameColorDark;
}

- (void)setNameColorDark:(id)a3
{
}

- (NTPBTagTodaySectionSpecificConfig)tagTodaySectionConfig
{
  return self->_tagTodaySectionConfig;
}

- (void)setTagTodaySectionConfig:(id)a3
{
}

- (NSString)mutingTagID
{
  return self->_mutingTagID;
}

- (void)setMutingTagID:(id)a3
{
}

- (NSString)groupNameActionUrl
{
  return self->_groupNameActionUrl;
}

- (void)setGroupNameActionUrl:(id)a3
{
}

- (NSString)backgroundColorLight
{
  return self->_backgroundColorLight;
}

- (void)setBackgroundColorLight:(id)a3
{
}

- (NSString)backgroundColorDark
{
  return self->_backgroundColorDark;
}

- (void)setBackgroundColorDark:(id)a3
{
}

- (BOOL)filterNonSubscribedInFavoritesOnlyMode
{
  return self->_filterNonSubscribedInFavoritesOnlyMode;
}

- (NSString)subidentifier
{
  return self->_subidentifier;
}

- (void)setSubidentifier:(id)a3
{
}

- (unint64_t)paywalledStoriesMaxCount
{
  return self->_paywalledStoriesMaxCount;
}

@end