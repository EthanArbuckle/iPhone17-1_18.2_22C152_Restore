@interface NTPBLanguageConfig
+ (Class)mediaSharingBlacklistedChannelIdsType;
+ (Class)onboardingTagIdsType;
+ (Class)preSubscribedFeedIdsType;
+ (Class)preSubscribedNotificationsChannelIdsType;
+ (Class)recommendedNotificationChannelsType;
- (BOOL)hasAppleEditorialChannelId;
- (BOOL)hasBreakingNewsChannelId;
- (BOOL)hasBriefingsTagId;
- (BOOL)hasCoverArticlesConfig;
- (BOOL)hasEditorialGemsSectionId;
- (BOOL)hasExploreArticleId;
- (BOOL)hasFeaturedStoriesTagId;
- (BOOL)hasForYouConfigId;
- (BOOL)hasHiddenFeedId;
- (BOOL)hasLanguageTag;
- (BOOL)hasMoreVideosChannelId;
- (BOOL)hasRootCategory;
- (BOOL)hasSavedStoriesTagId;
- (BOOL)hasShareVideoPlayerConfig;
- (BOOL)hasSpecialEventsChannelId;
- (BOOL)hasTopStoriesConfig;
- (BOOL)hasTopVideosChannelId;
- (BOOL)hasTrendingTagId;
- (BOOL)hasWidgetSectionConfigId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)mediaSharingBlacklistedChannelIds;
- (NSMutableArray)onboardingTagIds;
- (NSMutableArray)preSubscribedFeedIds;
- (NSMutableArray)preSubscribedNotificationsChannelIds;
- (NSMutableArray)recommendedNotificationChannels;
- (NSString)appleEditorialChannelId;
- (NSString)breakingNewsChannelId;
- (NSString)briefingsTagId;
- (NSString)editorialGemsSectionId;
- (NSString)exploreArticleId;
- (NSString)featuredStoriesTagId;
- (NSString)forYouConfigId;
- (NSString)hiddenFeedId;
- (NSString)languageTag;
- (NSString)moreVideosChannelId;
- (NSString)savedStoriesTagId;
- (NSString)specialEventsChannelId;
- (NSString)topVideosChannelId;
- (NSString)trendingTagId;
- (NSString)widgetSectionConfigId;
- (NTPBCategory)rootCategory;
- (NTPBCoverArticlesConfig)coverArticlesConfig;
- (NTPBTopStoriesConfig)topStoriesConfig;
- (NTPBVideoPlayerConfig)shareVideoPlayerConfig;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mediaSharingBlacklistedChannelIdsAtIndex:(unint64_t)a3;
- (id)onboardingTagIdsAtIndex:(unint64_t)a3;
- (id)preSubscribedFeedIdsAtIndex:(unint64_t)a3;
- (id)preSubscribedNotificationsChannelIdsAtIndex:(unint64_t)a3;
- (id)recommendedNotificationChannelsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mediaSharingBlacklistedChannelIdsCount;
- (unint64_t)onboardingTagIdsCount;
- (unint64_t)preSubscribedFeedIdsCount;
- (unint64_t)preSubscribedNotificationsChannelIdsCount;
- (unint64_t)recommendedNotificationChannelsCount;
- (void)addMediaSharingBlacklistedChannelIds:(id)a3;
- (void)addOnboardingTagIds:(id)a3;
- (void)addPreSubscribedFeedIds:(id)a3;
- (void)addPreSubscribedNotificationsChannelIds:(id)a3;
- (void)addRecommendedNotificationChannels:(id)a3;
- (void)clearMediaSharingBlacklistedChannelIds;
- (void)clearOnboardingTagIds;
- (void)clearPreSubscribedFeedIds;
- (void)clearPreSubscribedNotificationsChannelIds;
- (void)clearRecommendedNotificationChannels;
- (void)mergeFrom:(id)a3;
- (void)setAppleEditorialChannelId:(id)a3;
- (void)setBreakingNewsChannelId:(id)a3;
- (void)setBriefingsTagId:(id)a3;
- (void)setCoverArticlesConfig:(id)a3;
- (void)setEditorialGemsSectionId:(id)a3;
- (void)setExploreArticleId:(id)a3;
- (void)setFeaturedStoriesTagId:(id)a3;
- (void)setForYouConfigId:(id)a3;
- (void)setHiddenFeedId:(id)a3;
- (void)setLanguageTag:(id)a3;
- (void)setMediaSharingBlacklistedChannelIds:(id)a3;
- (void)setMoreVideosChannelId:(id)a3;
- (void)setOnboardingTagIds:(id)a3;
- (void)setPreSubscribedFeedIds:(id)a3;
- (void)setPreSubscribedNotificationsChannelIds:(id)a3;
- (void)setRecommendedNotificationChannels:(id)a3;
- (void)setRootCategory:(id)a3;
- (void)setSavedStoriesTagId:(id)a3;
- (void)setShareVideoPlayerConfig:(id)a3;
- (void)setSpecialEventsChannelId:(id)a3;
- (void)setTopStoriesConfig:(id)a3;
- (void)setTopVideosChannelId:(id)a3;
- (void)setTrendingTagId:(id)a3;
- (void)setWidgetSectionConfigId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBLanguageConfig

- (BOOL)hasLanguageTag
{
  return self->_languageTag != 0;
}

- (BOOL)hasHiddenFeedId
{
  return self->_hiddenFeedId != 0;
}

- (BOOL)hasRootCategory
{
  return self->_rootCategory != 0;
}

- (void)clearPreSubscribedFeedIds
{
}

- (void)addPreSubscribedFeedIds:(id)a3
{
  id v4 = a3;
  preSubscribedFeedIds = self->_preSubscribedFeedIds;
  id v8 = v4;
  if (!preSubscribedFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_preSubscribedFeedIds;
    self->_preSubscribedFeedIds = v6;

    id v4 = v8;
    preSubscribedFeedIds = self->_preSubscribedFeedIds;
  }
  [(NSMutableArray *)preSubscribedFeedIds addObject:v4];
}

- (unint64_t)preSubscribedFeedIdsCount
{
  return [(NSMutableArray *)self->_preSubscribedFeedIds count];
}

- (id)preSubscribedFeedIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_preSubscribedFeedIds objectAtIndex:a3];
}

+ (Class)preSubscribedFeedIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearOnboardingTagIds
{
}

- (void)addOnboardingTagIds:(id)a3
{
  id v4 = a3;
  onboardingTagIds = self->_onboardingTagIds;
  id v8 = v4;
  if (!onboardingTagIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_onboardingTagIds;
    self->_onboardingTagIds = v6;

    id v4 = v8;
    onboardingTagIds = self->_onboardingTagIds;
  }
  [(NSMutableArray *)onboardingTagIds addObject:v4];
}

- (unint64_t)onboardingTagIdsCount
{
  return [(NSMutableArray *)self->_onboardingTagIds count];
}

- (id)onboardingTagIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_onboardingTagIds objectAtIndex:a3];
}

+ (Class)onboardingTagIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTopStoriesConfig
{
  return self->_topStoriesConfig != 0;
}

- (void)clearPreSubscribedNotificationsChannelIds
{
}

- (void)addPreSubscribedNotificationsChannelIds:(id)a3
{
  id v4 = a3;
  preSubscribedNotificationsChannelIds = self->_preSubscribedNotificationsChannelIds;
  id v8 = v4;
  if (!preSubscribedNotificationsChannelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_preSubscribedNotificationsChannelIds;
    self->_preSubscribedNotificationsChannelIds = v6;

    id v4 = v8;
    preSubscribedNotificationsChannelIds = self->_preSubscribedNotificationsChannelIds;
  }
  [(NSMutableArray *)preSubscribedNotificationsChannelIds addObject:v4];
}

- (unint64_t)preSubscribedNotificationsChannelIdsCount
{
  return [(NSMutableArray *)self->_preSubscribedNotificationsChannelIds count];
}

- (id)preSubscribedNotificationsChannelIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_preSubscribedNotificationsChannelIds objectAtIndex:a3];
}

+ (Class)preSubscribedNotificationsChannelIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearRecommendedNotificationChannels
{
}

- (void)addRecommendedNotificationChannels:(id)a3
{
  id v4 = a3;
  recommendedNotificationChannels = self->_recommendedNotificationChannels;
  id v8 = v4;
  if (!recommendedNotificationChannels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_recommendedNotificationChannels;
    self->_recommendedNotificationChannels = v6;

    id v4 = v8;
    recommendedNotificationChannels = self->_recommendedNotificationChannels;
  }
  [(NSMutableArray *)recommendedNotificationChannels addObject:v4];
}

- (unint64_t)recommendedNotificationChannelsCount
{
  return [(NSMutableArray *)self->_recommendedNotificationChannels count];
}

- (id)recommendedNotificationChannelsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_recommendedNotificationChannels objectAtIndex:a3];
}

+ (Class)recommendedNotificationChannelsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCoverArticlesConfig
{
  return self->_coverArticlesConfig != 0;
}

- (BOOL)hasAppleEditorialChannelId
{
  return self->_appleEditorialChannelId != 0;
}

- (BOOL)hasForYouConfigId
{
  return self->_forYouConfigId != 0;
}

- (BOOL)hasBriefingsTagId
{
  return self->_briefingsTagId != 0;
}

- (BOOL)hasTrendingTagId
{
  return self->_trendingTagId != 0;
}

- (BOOL)hasFeaturedStoriesTagId
{
  return self->_featuredStoriesTagId != 0;
}

- (BOOL)hasSavedStoriesTagId
{
  return self->_savedStoriesTagId != 0;
}

- (BOOL)hasWidgetSectionConfigId
{
  return self->_widgetSectionConfigId != 0;
}

- (BOOL)hasEditorialGemsSectionId
{
  return self->_editorialGemsSectionId != 0;
}

- (BOOL)hasExploreArticleId
{
  return self->_exploreArticleId != 0;
}

- (BOOL)hasBreakingNewsChannelId
{
  return self->_breakingNewsChannelId != 0;
}

- (void)clearMediaSharingBlacklistedChannelIds
{
}

- (void)addMediaSharingBlacklistedChannelIds:(id)a3
{
  id v4 = a3;
  mediaSharingBlacklistedChannelIds = self->_mediaSharingBlacklistedChannelIds;
  id v8 = v4;
  if (!mediaSharingBlacklistedChannelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_mediaSharingBlacklistedChannelIds;
    self->_mediaSharingBlacklistedChannelIds = v6;

    id v4 = v8;
    mediaSharingBlacklistedChannelIds = self->_mediaSharingBlacklistedChannelIds;
  }
  [(NSMutableArray *)mediaSharingBlacklistedChannelIds addObject:v4];
}

- (unint64_t)mediaSharingBlacklistedChannelIdsCount
{
  return [(NSMutableArray *)self->_mediaSharingBlacklistedChannelIds count];
}

- (id)mediaSharingBlacklistedChannelIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_mediaSharingBlacklistedChannelIds objectAtIndex:a3];
}

+ (Class)mediaSharingBlacklistedChannelIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSpecialEventsChannelId
{
  return self->_specialEventsChannelId != 0;
}

- (BOOL)hasTopVideosChannelId
{
  return self->_topVideosChannelId != 0;
}

- (BOOL)hasMoreVideosChannelId
{
  return self->_moreVideosChannelId != 0;
}

- (BOOL)hasShareVideoPlayerConfig
{
  return self->_shareVideoPlayerConfig != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBLanguageConfig;
  id v4 = [(NTPBLanguageConfig *)&v8 description];
  v5 = [(NTPBLanguageConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  languageTag = self->_languageTag;
  if (languageTag) {
    [v3 setObject:languageTag forKey:@"language_tag"];
  }
  hiddenFeedId = self->_hiddenFeedId;
  if (hiddenFeedId) {
    [v4 setObject:hiddenFeedId forKey:@"hidden_feed_id"];
  }
  rootCategory = self->_rootCategory;
  if (rootCategory)
  {
    objc_super v8 = [(NTPBCategory *)rootCategory dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"root_category"];
  }
  preSubscribedFeedIds = self->_preSubscribedFeedIds;
  if (preSubscribedFeedIds) {
    [v4 setObject:preSubscribedFeedIds forKey:@"pre_subscribed_feed_ids"];
  }
  onboardingTagIds = self->_onboardingTagIds;
  if (onboardingTagIds) {
    [v4 setObject:onboardingTagIds forKey:@"onboarding_tag_ids"];
  }
  topStoriesConfig = self->_topStoriesConfig;
  if (topStoriesConfig)
  {
    v12 = [(NTPBTopStoriesConfig *)topStoriesConfig dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"top_stories_config"];
  }
  preSubscribedNotificationsChannelIds = self->_preSubscribedNotificationsChannelIds;
  if (preSubscribedNotificationsChannelIds) {
    [v4 setObject:preSubscribedNotificationsChannelIds forKey:@"pre_subscribed_notifications_channel_ids"];
  }
  if ([(NSMutableArray *)self->_recommendedNotificationChannels count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_recommendedNotificationChannels, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v15 = self->_recommendedNotificationChannels;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "dictionaryRepresentation", (void)v40);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"recommended_notification_channels"];
  }
  coverArticlesConfig = self->_coverArticlesConfig;
  if (coverArticlesConfig)
  {
    v22 = [(NTPBCoverArticlesConfig *)coverArticlesConfig dictionaryRepresentation];
    [v4 setObject:v22 forKey:@"cover_articles_config"];
  }
  appleEditorialChannelId = self->_appleEditorialChannelId;
  if (appleEditorialChannelId) {
    [v4 setObject:appleEditorialChannelId forKey:@"apple_editorial_channel_id"];
  }
  forYouConfigId = self->_forYouConfigId;
  if (forYouConfigId) {
    [v4 setObject:forYouConfigId forKey:@"for_you_config_id"];
  }
  briefingsTagId = self->_briefingsTagId;
  if (briefingsTagId) {
    [v4 setObject:briefingsTagId forKey:@"briefings_tag_id"];
  }
  trendingTagId = self->_trendingTagId;
  if (trendingTagId) {
    [v4 setObject:trendingTagId forKey:@"trending_tag_id"];
  }
  featuredStoriesTagId = self->_featuredStoriesTagId;
  if (featuredStoriesTagId) {
    [v4 setObject:featuredStoriesTagId forKey:@"featured_stories_tag_id"];
  }
  savedStoriesTagId = self->_savedStoriesTagId;
  if (savedStoriesTagId) {
    [v4 setObject:savedStoriesTagId forKey:@"saved_stories_tag_id"];
  }
  widgetSectionConfigId = self->_widgetSectionConfigId;
  if (widgetSectionConfigId) {
    [v4 setObject:widgetSectionConfigId forKey:@"widget_section_config_id"];
  }
  editorialGemsSectionId = self->_editorialGemsSectionId;
  if (editorialGemsSectionId) {
    [v4 setObject:editorialGemsSectionId forKey:@"editorial_gems_section_id"];
  }
  exploreArticleId = self->_exploreArticleId;
  if (exploreArticleId) {
    [v4 setObject:exploreArticleId forKey:@"explore_article_id"];
  }
  breakingNewsChannelId = self->_breakingNewsChannelId;
  if (breakingNewsChannelId) {
    [v4 setObject:breakingNewsChannelId forKey:@"breaking_news_channel_id"];
  }
  mediaSharingBlacklistedChannelIds = self->_mediaSharingBlacklistedChannelIds;
  if (mediaSharingBlacklistedChannelIds) {
    [v4 setObject:mediaSharingBlacklistedChannelIds forKey:@"media_sharing_blacklisted_channel_ids"];
  }
  specialEventsChannelId = self->_specialEventsChannelId;
  if (specialEventsChannelId) {
    [v4 setObject:specialEventsChannelId forKey:@"special_events_channel_id"];
  }
  topVideosChannelId = self->_topVideosChannelId;
  if (topVideosChannelId) {
    [v4 setObject:topVideosChannelId forKey:@"top_videos_channel_id"];
  }
  moreVideosChannelId = self->_moreVideosChannelId;
  if (moreVideosChannelId) {
    [v4 setObject:moreVideosChannelId forKey:@"more_videos_channel_id"];
  }
  shareVideoPlayerConfig = self->_shareVideoPlayerConfig;
  if (shareVideoPlayerConfig)
  {
    v38 = [(NTPBVideoPlayerConfig *)shareVideoPlayerConfig dictionaryRepresentation];
    [v4 setObject:v38 forKey:@"share_video_player_config"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLanguageConfigReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_languageTag) {
    PBDataWriterWriteStringField();
  }
  if (self->_hiddenFeedId) {
    PBDataWriterWriteStringField();
  }
  if (self->_rootCategory) {
    PBDataWriterWriteSubmessage();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v5 = self->_preSubscribedFeedIds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v10 = self->_onboardingTagIds;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  if (self->_topStoriesConfig) {
    PBDataWriterWriteSubmessage();
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v15 = self->_preSubscribedNotificationsChannelIds;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v20 = self->_recommendedNotificationChannels;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  if (self->_coverArticlesConfig) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appleEditorialChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_forYouConfigId) {
    PBDataWriterWriteStringField();
  }
  if (self->_briefingsTagId) {
    PBDataWriterWriteStringField();
  }
  if (self->_trendingTagId) {
    PBDataWriterWriteStringField();
  }
  if (self->_featuredStoriesTagId) {
    PBDataWriterWriteStringField();
  }
  if (self->_savedStoriesTagId) {
    PBDataWriterWriteStringField();
  }
  if (self->_widgetSectionConfigId) {
    PBDataWriterWriteStringField();
  }
  if (self->_editorialGemsSectionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_exploreArticleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_breakingNewsChannelId) {
    PBDataWriterWriteStringField();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v25 = self->_mediaSharingBlacklistedChannelIds;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteStringField();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }

  if (self->_specialEventsChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_topVideosChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_moreVideosChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_shareVideoPlayerConfig) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_languageTag copyWithZone:a3];
  uint64_t v7 = (void *)v5[10];
  v5[10] = v6;

  uint64_t v8 = [(NSString *)self->_hiddenFeedId copyWithZone:a3];
  uint64_t v9 = (void *)v5[9];
  v5[9] = v8;

  id v10 = [(NTPBCategory *)self->_rootCategory copyWithZone:a3];
  uint64_t v11 = (void *)v5[17];
  v5[17] = v10;

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v12 = self->_preSubscribedFeedIds;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v91 objects:v99 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v92;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v92 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v91 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addPreSubscribedFeedIds:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v91 objects:v99 count:16];
    }
    while (v14);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v18 = self->_onboardingTagIds;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v87 objects:v98 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v88;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v88 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v87 + 1) + 8 * v22) copyWithZone:a3];
        [v5 addOnboardingTagIds:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v87 objects:v98 count:16];
    }
    while (v20);
  }

  id v24 = [(NTPBTopStoriesConfig *)self->_topStoriesConfig copyWithZone:a3];
  v25 = (void *)v5[21];
  v5[21] = v24;

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v26 = self->_preSubscribedNotificationsChannelIds;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v83 objects:v97 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v84;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v84 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = (void *)[*(id *)(*((void *)&v83 + 1) + 8 * v30) copyWithZone:a3];
        [v5 addPreSubscribedNotificationsChannelIds:v31];

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v83 objects:v97 count:16];
    }
    while (v28);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v32 = self->_recommendedNotificationChannels;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v79 objects:v96 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v80;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v80 != v35) {
          objc_enumerationMutation(v32);
        }
        long long v37 = (void *)[*(id *)(*((void *)&v79 + 1) + 8 * v36) copyWithZone:a3];
        [v5 addRecommendedNotificationChannels:v37];

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v79 objects:v96 count:16];
    }
    while (v34);
  }

  id v38 = [(NTPBCoverArticlesConfig *)self->_coverArticlesConfig copyWithZone:a3];
  long long v39 = (void *)v5[4];
  v5[4] = v38;

  uint64_t v40 = [(NSString *)self->_appleEditorialChannelId copyWithZone:a3];
  long long v41 = (void *)v5[1];
  v5[1] = v40;

  uint64_t v42 = [(NSString *)self->_forYouConfigId copyWithZone:a3];
  long long v43 = (void *)v5[8];
  v5[8] = v42;

  uint64_t v44 = [(NSString *)self->_briefingsTagId copyWithZone:a3];
  long long v45 = (void *)v5[3];
  v5[3] = v44;

  uint64_t v46 = [(NSString *)self->_trendingTagId copyWithZone:a3];
  long long v47 = (void *)v5[23];
  v5[23] = v46;

  uint64_t v48 = [(NSString *)self->_featuredStoriesTagId copyWithZone:a3];
  long long v49 = (void *)v5[7];
  v5[7] = v48;

  uint64_t v50 = [(NSString *)self->_savedStoriesTagId copyWithZone:a3];
  v51 = (void *)v5[18];
  v5[18] = v50;

  uint64_t v52 = [(NSString *)self->_widgetSectionConfigId copyWithZone:a3];
  v53 = (void *)v5[24];
  v5[24] = v52;

  uint64_t v54 = [(NSString *)self->_editorialGemsSectionId copyWithZone:a3];
  uint64_t v55 = (void *)v5[5];
  v5[5] = v54;

  uint64_t v56 = [(NSString *)self->_exploreArticleId copyWithZone:a3];
  v57 = (void *)v5[6];
  v5[6] = v56;

  uint64_t v58 = [(NSString *)self->_breakingNewsChannelId copyWithZone:a3];
  v59 = (void *)v5[2];
  v5[2] = v58;

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v60 = self->_mediaSharingBlacklistedChannelIds;
  uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v75 objects:v95 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v76;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v76 != v63) {
          objc_enumerationMutation(v60);
        }
        v65 = objc_msgSend(*(id *)(*((void *)&v75 + 1) + 8 * v64), "copyWithZone:", a3, (void)v75);
        [v5 addMediaSharingBlacklistedChannelIds:v65];

        ++v64;
      }
      while (v62 != v64);
      uint64_t v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v75 objects:v95 count:16];
    }
    while (v62);
  }

  uint64_t v66 = [(NSString *)self->_specialEventsChannelId copyWithZone:a3];
  v67 = (void *)v5[20];
  v5[20] = v66;

  uint64_t v68 = [(NSString *)self->_topVideosChannelId copyWithZone:a3];
  v69 = (void *)v5[22];
  v5[22] = v68;

  uint64_t v70 = [(NSString *)self->_moreVideosChannelId copyWithZone:a3];
  v71 = (void *)v5[12];
  v5[12] = v70;

  id v72 = [(NTPBVideoPlayerConfig *)self->_shareVideoPlayerConfig copyWithZone:a3];
  v73 = (void *)v5[19];
  v5[19] = v72;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  languageTag = self->_languageTag;
  if ((unint64_t)languageTag | v4[10])
  {
    if (!-[NSString isEqual:](languageTag, "isEqual:")) {
      goto LABEL_50;
    }
  }
  hiddenFeedId = self->_hiddenFeedId;
  if ((unint64_t)hiddenFeedId | v4[9] && !-[NSString isEqual:](hiddenFeedId, "isEqual:")) {
    goto LABEL_50;
  }
  rootCategory = self->_rootCategory;
  if ((unint64_t)rootCategory | v4[17] && !-[NTPBCategory isEqual:](rootCategory, "isEqual:")) {
    goto LABEL_50;
  }
  preSubscribedFeedIds = self->_preSubscribedFeedIds;
  if ((unint64_t)preSubscribedFeedIds | v4[14]
    && !-[NSMutableArray isEqual:](preSubscribedFeedIds, "isEqual:"))
  {
    goto LABEL_50;
  }
  onboardingTagIds = self->_onboardingTagIds;
  if ((unint64_t)onboardingTagIds | v4[13]
    && !-[NSMutableArray isEqual:](onboardingTagIds, "isEqual:"))
  {
    goto LABEL_50;
  }
  topStoriesConfig = self->_topStoriesConfig;
  if ((unint64_t)topStoriesConfig | v4[21] && !-[NTPBTopStoriesConfig isEqual:](topStoriesConfig, "isEqual:")) {
    goto LABEL_50;
  }
  preSubscribedNotificationsChannelIds = self->_preSubscribedNotificationsChannelIds;
  if ((unint64_t)preSubscribedNotificationsChannelIds | v4[15]
    && !-[NSMutableArray isEqual:](preSubscribedNotificationsChannelIds, "isEqual:"))
  {
    goto LABEL_50;
  }
  recommendedNotificationChannels = self->_recommendedNotificationChannels;
  if ((unint64_t)recommendedNotificationChannels | v4[16]
    && !-[NSMutableArray isEqual:](recommendedNotificationChannels, "isEqual:"))
  {
    goto LABEL_50;
  }
  coverArticlesConfig = self->_coverArticlesConfig;
  if ((unint64_t)coverArticlesConfig | v4[4]
    && !-[NTPBCoverArticlesConfig isEqual:](coverArticlesConfig, "isEqual:"))
  {
    goto LABEL_50;
  }
  appleEditorialChannelId = self->_appleEditorialChannelId;
  if ((unint64_t)appleEditorialChannelId | v4[1]
    && !-[NSString isEqual:](appleEditorialChannelId, "isEqual:"))
  {
    goto LABEL_50;
  }
  forYouConfigId = self->_forYouConfigId;
  if ((unint64_t)forYouConfigId | v4[8] && !-[NSString isEqual:](forYouConfigId, "isEqual:")) {
    goto LABEL_50;
  }
  briefingsTagId = self->_briefingsTagId;
  if ((unint64_t)briefingsTagId | v4[3] && !-[NSString isEqual:](briefingsTagId, "isEqual:")) {
    goto LABEL_50;
  }
  trendingTagId = self->_trendingTagId;
  if ((unint64_t)trendingTagId | v4[23] && !-[NSString isEqual:](trendingTagId, "isEqual:")) {
    goto LABEL_50;
  }
  featuredStoriesTagId = self->_featuredStoriesTagId;
  if ((unint64_t)featuredStoriesTagId | v4[7]
    && !-[NSString isEqual:](featuredStoriesTagId, "isEqual:"))
  {
    goto LABEL_50;
  }
  savedStoriesTagId = self->_savedStoriesTagId;
  if ((unint64_t)savedStoriesTagId | v4[18]
    && !-[NSString isEqual:](savedStoriesTagId, "isEqual:"))
  {
    goto LABEL_50;
  }
  widgetSectionConfigId = self->_widgetSectionConfigId;
  if ((unint64_t)widgetSectionConfigId | v4[24]
    && !-[NSString isEqual:](widgetSectionConfigId, "isEqual:"))
  {
    goto LABEL_50;
  }
  if (((editorialGemsSectionId = self->_editorialGemsSectionId, !((unint64_t)editorialGemsSectionId | v4[5]))
     || -[NSString isEqual:](editorialGemsSectionId, "isEqual:"))
    && ((exploreArticleId = self->_exploreArticleId, !((unint64_t)exploreArticleId | v4[6]))
     || -[NSString isEqual:](exploreArticleId, "isEqual:"))
    && ((breakingNewsChannelId = self->_breakingNewsChannelId, !((unint64_t)breakingNewsChannelId | v4[2]))
     || -[NSString isEqual:](breakingNewsChannelId, "isEqual:"))
    && ((mediaSharingBlacklistedChannelIds = self->_mediaSharingBlacklistedChannelIds,
         !((unint64_t)mediaSharingBlacklistedChannelIds | v4[11]))
     || -[NSMutableArray isEqual:](mediaSharingBlacklistedChannelIds, "isEqual:"))
    && ((specialEventsChannelId = self->_specialEventsChannelId, !((unint64_t)specialEventsChannelId | v4[20]))
     || -[NSString isEqual:](specialEventsChannelId, "isEqual:"))
    && ((topVideosChannelId = self->_topVideosChannelId, !((unint64_t)topVideosChannelId | v4[22]))
     || -[NSString isEqual:](topVideosChannelId, "isEqual:"))
    && ((moreVideosChannelId = self->_moreVideosChannelId, !((unint64_t)moreVideosChannelId | v4[12]))
     || -[NSString isEqual:](moreVideosChannelId, "isEqual:")))
  {
    shareVideoPlayerConfig = self->_shareVideoPlayerConfig;
    if ((unint64_t)shareVideoPlayerConfig | v4[19]) {
      char v29 = -[NTPBVideoPlayerConfig isEqual:](shareVideoPlayerConfig, "isEqual:");
    }
    else {
      char v29 = 1;
    }
  }
  else
  {
LABEL_50:
    char v29 = 0;
  }

  return v29;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_languageTag hash];
  NSUInteger v4 = [(NSString *)self->_hiddenFeedId hash] ^ v3;
  unint64_t v5 = [(NTPBCategory *)self->_rootCategory hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_preSubscribedFeedIds hash];
  uint64_t v7 = [(NSMutableArray *)self->_onboardingTagIds hash];
  unint64_t v8 = v7 ^ [(NTPBTopStoriesConfig *)self->_topStoriesConfig hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_preSubscribedNotificationsChannelIds hash];
  uint64_t v10 = [(NSMutableArray *)self->_recommendedNotificationChannels hash];
  unint64_t v11 = v10 ^ [(NTPBCoverArticlesConfig *)self->_coverArticlesConfig hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_appleEditorialChannelId hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_forYouConfigId hash];
  NSUInteger v14 = [(NSString *)self->_briefingsTagId hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_trendingTagId hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_featuredStoriesTagId hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_savedStoriesTagId hash];
  NSUInteger v18 = v13 ^ v17 ^ [(NSString *)self->_widgetSectionConfigId hash];
  NSUInteger v19 = [(NSString *)self->_editorialGemsSectionId hash];
  NSUInteger v20 = v19 ^ [(NSString *)self->_exploreArticleId hash];
  NSUInteger v21 = v20 ^ [(NSString *)self->_breakingNewsChannelId hash];
  uint64_t v22 = v21 ^ [(NSMutableArray *)self->_mediaSharingBlacklistedChannelIds hash];
  NSUInteger v23 = v22 ^ [(NSString *)self->_specialEventsChannelId hash];
  NSUInteger v24 = v18 ^ v23 ^ [(NSString *)self->_topVideosChannelId hash];
  NSUInteger v25 = [(NSString *)self->_moreVideosChannelId hash];
  return v24 ^ v25 ^ [(NTPBVideoPlayerConfig *)self->_shareVideoPlayerConfig hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[NTPBLanguageConfig setLanguageTag:](self, "setLanguageTag:");
  }
  if (*((void *)v4 + 9)) {
    -[NTPBLanguageConfig setHiddenFeedId:](self, "setHiddenFeedId:");
  }
  rootCategory = self->_rootCategory;
  uint64_t v6 = *((void *)v4 + 17);
  if (rootCategory)
  {
    if (v6) {
      -[NTPBCategory mergeFrom:](rootCategory, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBLanguageConfig setRootCategory:](self, "setRootCategory:");
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v7 = *((id *)v4 + 14);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBLanguageConfig *)self addPreSubscribedFeedIds:*(void *)(*((void *)&v54 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v9);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v12 = *((id *)v4 + 13);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v51 != v15) {
          objc_enumerationMutation(v12);
        }
        [(NTPBLanguageConfig *)self addOnboardingTagIds:*(void *)(*((void *)&v50 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v14);
  }

  topStoriesConfig = self->_topStoriesConfig;
  uint64_t v18 = *((void *)v4 + 21);
  if (topStoriesConfig)
  {
    if (v18) {
      -[NTPBTopStoriesConfig mergeFrom:](topStoriesConfig, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[NTPBLanguageConfig setTopStoriesConfig:](self, "setTopStoriesConfig:");
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v19 = *((id *)v4 + 15);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v60 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(v19);
        }
        [(NTPBLanguageConfig *)self addPreSubscribedNotificationsChannelIds:*(void *)(*((void *)&v46 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v60 count:16];
    }
    while (v21);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v24 = *((id *)v4 + 16);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v59 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v43;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(v24);
        }
        [(NTPBLanguageConfig *)self addRecommendedNotificationChannels:*(void *)(*((void *)&v42 + 1) + 8 * m)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v59 count:16];
    }
    while (v26);
  }

  coverArticlesConfig = self->_coverArticlesConfig;
  uint64_t v30 = *((void *)v4 + 4);
  if (coverArticlesConfig)
  {
    if (v30) {
      -[NTPBCoverArticlesConfig mergeFrom:](coverArticlesConfig, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[NTPBLanguageConfig setCoverArticlesConfig:](self, "setCoverArticlesConfig:");
  }
  if (*((void *)v4 + 1)) {
    -[NTPBLanguageConfig setAppleEditorialChannelId:](self, "setAppleEditorialChannelId:");
  }
  if (*((void *)v4 + 8)) {
    -[NTPBLanguageConfig setForYouConfigId:](self, "setForYouConfigId:");
  }
  if (*((void *)v4 + 3)) {
    -[NTPBLanguageConfig setBriefingsTagId:](self, "setBriefingsTagId:");
  }
  if (*((void *)v4 + 23)) {
    -[NTPBLanguageConfig setTrendingTagId:](self, "setTrendingTagId:");
  }
  if (*((void *)v4 + 7)) {
    -[NTPBLanguageConfig setFeaturedStoriesTagId:](self, "setFeaturedStoriesTagId:");
  }
  if (*((void *)v4 + 18)) {
    -[NTPBLanguageConfig setSavedStoriesTagId:](self, "setSavedStoriesTagId:");
  }
  if (*((void *)v4 + 24)) {
    -[NTPBLanguageConfig setWidgetSectionConfigId:](self, "setWidgetSectionConfigId:");
  }
  if (*((void *)v4 + 5)) {
    -[NTPBLanguageConfig setEditorialGemsSectionId:](self, "setEditorialGemsSectionId:");
  }
  if (*((void *)v4 + 6)) {
    -[NTPBLanguageConfig setExploreArticleId:](self, "setExploreArticleId:");
  }
  if (*((void *)v4 + 2)) {
    -[NTPBLanguageConfig setBreakingNewsChannelId:](self, "setBreakingNewsChannelId:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v31 = *((id *)v4 + 11);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v38 objects:v58 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v39;
    do
    {
      for (uint64_t n = 0; n != v33; ++n)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v31);
        }
        -[NTPBLanguageConfig addMediaSharingBlacklistedChannelIds:](self, "addMediaSharingBlacklistedChannelIds:", *(void *)(*((void *)&v38 + 1) + 8 * n), (void)v38);
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v38 objects:v58 count:16];
    }
    while (v33);
  }

  if (*((void *)v4 + 20)) {
    -[NTPBLanguageConfig setSpecialEventsChannelId:](self, "setSpecialEventsChannelId:");
  }
  if (*((void *)v4 + 22)) {
    -[NTPBLanguageConfig setTopVideosChannelId:](self, "setTopVideosChannelId:");
  }
  if (*((void *)v4 + 12)) {
    -[NTPBLanguageConfig setMoreVideosChannelId:](self, "setMoreVideosChannelId:");
  }
  shareVideoPlayerConfig = self->_shareVideoPlayerConfig;
  uint64_t v37 = *((void *)v4 + 19);
  if (shareVideoPlayerConfig)
  {
    if (v37) {
      -[NTPBVideoPlayerConfig mergeFrom:](shareVideoPlayerConfig, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[NTPBLanguageConfig setShareVideoPlayerConfig:](self, "setShareVideoPlayerConfig:");
  }
}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void)setLanguageTag:(id)a3
{
}

- (NSString)hiddenFeedId
{
  return self->_hiddenFeedId;
}

- (void)setHiddenFeedId:(id)a3
{
}

- (NTPBCategory)rootCategory
{
  return self->_rootCategory;
}

- (void)setRootCategory:(id)a3
{
}

- (NSMutableArray)preSubscribedFeedIds
{
  return self->_preSubscribedFeedIds;
}

- (void)setPreSubscribedFeedIds:(id)a3
{
}

- (NSMutableArray)onboardingTagIds
{
  return self->_onboardingTagIds;
}

- (void)setOnboardingTagIds:(id)a3
{
}

- (NTPBTopStoriesConfig)topStoriesConfig
{
  return self->_topStoriesConfig;
}

- (void)setTopStoriesConfig:(id)a3
{
}

- (NSMutableArray)preSubscribedNotificationsChannelIds
{
  return self->_preSubscribedNotificationsChannelIds;
}

- (void)setPreSubscribedNotificationsChannelIds:(id)a3
{
}

- (NSMutableArray)recommendedNotificationChannels
{
  return self->_recommendedNotificationChannels;
}

- (void)setRecommendedNotificationChannels:(id)a3
{
}

- (NTPBCoverArticlesConfig)coverArticlesConfig
{
  return self->_coverArticlesConfig;
}

- (void)setCoverArticlesConfig:(id)a3
{
}

- (NSString)appleEditorialChannelId
{
  return self->_appleEditorialChannelId;
}

- (void)setAppleEditorialChannelId:(id)a3
{
}

- (NSString)forYouConfigId
{
  return self->_forYouConfigId;
}

- (void)setForYouConfigId:(id)a3
{
}

- (NSString)briefingsTagId
{
  return self->_briefingsTagId;
}

- (void)setBriefingsTagId:(id)a3
{
}

- (NSString)trendingTagId
{
  return self->_trendingTagId;
}

- (void)setTrendingTagId:(id)a3
{
}

- (NSString)featuredStoriesTagId
{
  return self->_featuredStoriesTagId;
}

- (void)setFeaturedStoriesTagId:(id)a3
{
}

- (NSString)savedStoriesTagId
{
  return self->_savedStoriesTagId;
}

- (void)setSavedStoriesTagId:(id)a3
{
}

- (NSString)widgetSectionConfigId
{
  return self->_widgetSectionConfigId;
}

- (void)setWidgetSectionConfigId:(id)a3
{
}

- (NSString)editorialGemsSectionId
{
  return self->_editorialGemsSectionId;
}

- (void)setEditorialGemsSectionId:(id)a3
{
}

- (NSString)exploreArticleId
{
  return self->_exploreArticleId;
}

- (void)setExploreArticleId:(id)a3
{
}

- (NSString)breakingNewsChannelId
{
  return self->_breakingNewsChannelId;
}

- (void)setBreakingNewsChannelId:(id)a3
{
}

- (NSMutableArray)mediaSharingBlacklistedChannelIds
{
  return self->_mediaSharingBlacklistedChannelIds;
}

- (void)setMediaSharingBlacklistedChannelIds:(id)a3
{
}

- (NSString)specialEventsChannelId
{
  return self->_specialEventsChannelId;
}

- (void)setSpecialEventsChannelId:(id)a3
{
}

- (NSString)topVideosChannelId
{
  return self->_topVideosChannelId;
}

- (void)setTopVideosChannelId:(id)a3
{
}

- (NSString)moreVideosChannelId
{
  return self->_moreVideosChannelId;
}

- (void)setMoreVideosChannelId:(id)a3
{
}

- (NTPBVideoPlayerConfig)shareVideoPlayerConfig
{
  return self->_shareVideoPlayerConfig;
}

- (void)setShareVideoPlayerConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSectionConfigId, 0);
  objc_storeStrong((id *)&self->_trendingTagId, 0);
  objc_storeStrong((id *)&self->_topVideosChannelId, 0);
  objc_storeStrong((id *)&self->_topStoriesConfig, 0);
  objc_storeStrong((id *)&self->_specialEventsChannelId, 0);
  objc_storeStrong((id *)&self->_shareVideoPlayerConfig, 0);
  objc_storeStrong((id *)&self->_savedStoriesTagId, 0);
  objc_storeStrong((id *)&self->_rootCategory, 0);
  objc_storeStrong((id *)&self->_recommendedNotificationChannels, 0);
  objc_storeStrong((id *)&self->_preSubscribedNotificationsChannelIds, 0);
  objc_storeStrong((id *)&self->_preSubscribedFeedIds, 0);
  objc_storeStrong((id *)&self->_onboardingTagIds, 0);
  objc_storeStrong((id *)&self->_moreVideosChannelId, 0);
  objc_storeStrong((id *)&self->_mediaSharingBlacklistedChannelIds, 0);
  objc_storeStrong((id *)&self->_languageTag, 0);
  objc_storeStrong((id *)&self->_hiddenFeedId, 0);
  objc_storeStrong((id *)&self->_forYouConfigId, 0);
  objc_storeStrong((id *)&self->_featuredStoriesTagId, 0);
  objc_storeStrong((id *)&self->_exploreArticleId, 0);
  objc_storeStrong((id *)&self->_editorialGemsSectionId, 0);
  objc_storeStrong((id *)&self->_coverArticlesConfig, 0);
  objc_storeStrong((id *)&self->_briefingsTagId, 0);
  objc_storeStrong((id *)&self->_breakingNewsChannelId, 0);

  objc_storeStrong((id *)&self->_appleEditorialChannelId, 0);
}

@end