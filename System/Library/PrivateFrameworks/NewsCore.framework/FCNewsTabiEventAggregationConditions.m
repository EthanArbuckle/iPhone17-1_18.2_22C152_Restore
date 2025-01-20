@interface FCNewsTabiEventAggregationConditions
- (FCNewsTabiEventAggregationArticleDislikedConditions)articleDislikedConditions;
- (FCNewsTabiEventAggregationArticleLikedConditions)articleLikedConditions;
- (FCNewsTabiEventAggregationArticleReadConditions)articleReadConditions;
- (FCNewsTabiEventAggregationArticleSavedConditions)articleSavedConditions;
- (FCNewsTabiEventAggregationArticleSeenConditions)articleSeenConditions;
- (FCNewsTabiEventAggregationArticleSharedConditions)articleSharedConditions;
- (FCNewsTabiEventAggregationArticleUndislikedConditions)articleUndislikedConditions;
- (FCNewsTabiEventAggregationArticleUnlikedConditions)articleUnlikedConditions;
- (FCNewsTabiEventAggregationArticleUnsavedConditions)articleUnsavedConditions;
- (FCNewsTabiEventAggregationArticleVisitedConditions)articleVisitedConditions;
- (FCNewsTabiEventAggregationConditions)initWithDictionary:(id)a3;
- (FCNewsTabiEventAggregationNotificationVendedConditions)notificationVendedConditions;
- (FCNewsTabiEventAggregationTrackFinishedConditions)trackFinishedConditions;
- (FCNewsTabiEventAggregationTrackListenedConditions)trackListenedConditions;
- (FCNewsTabiEventAggregationTrackVisitedConditions)trackVisitedConditions;
- (id)description;
@end

@implementation FCNewsTabiEventAggregationConditions

- (FCNewsTabiEventAggregationConditions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)FCNewsTabiEventAggregationConditions;
  v5 = [(FCNewsTabiEventAggregationConditions *)&v63 init];
  if (v5)
  {
    v6 = [FCNewsTabiEventAggregationArticleSeenConditions alloc];
    v7 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleSeenConditions", 0);
    uint64_t v8 = [(FCNewsTabiEventAggregationDurationEventConditions *)v6 initWithDictionary:v7];
    articleSeenConditions = v5->_articleSeenConditions;
    v5->_articleSeenConditions = (FCNewsTabiEventAggregationArticleSeenConditions *)v8;

    v10 = [FCNewsTabiEventAggregationArticleReadConditions alloc];
    v11 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleReadConditions", 0);
    uint64_t v12 = [(FCNewsTabiEventAggregationDurationEventConditions *)v10 initWithDictionary:v11];
    articleReadConditions = v5->_articleReadConditions;
    v5->_articleReadConditions = (FCNewsTabiEventAggregationArticleReadConditions *)v12;

    v14 = [FCNewsTabiEventAggregationTrackListenedConditions alloc];
    v15 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"trackListenedConditions", 0);
    uint64_t v16 = [(FCNewsTabiEventAggregationBaseEventConditions *)v14 initWithDictionary:v15];
    trackListenedConditions = v5->_trackListenedConditions;
    v5->_trackListenedConditions = (FCNewsTabiEventAggregationTrackListenedConditions *)v16;

    v18 = [FCNewsTabiEventAggregationArticleVisitedConditions alloc];
    v19 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleVisitedConditions", 0);
    uint64_t v20 = [(FCNewsTabiEventAggregationBaseEventConditions *)v18 initWithDictionary:v19];
    articleVisitedConditions = v5->_articleVisitedConditions;
    v5->_articleVisitedConditions = (FCNewsTabiEventAggregationArticleVisitedConditions *)v20;

    v22 = [FCNewsTabiEventAggregationArticleSharedConditions alloc];
    v23 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleSharedConditions", 0);
    uint64_t v24 = [(FCNewsTabiEventAggregationBaseEventConditions *)v22 initWithDictionary:v23];
    articleSharedConditions = v5->_articleSharedConditions;
    v5->_articleSharedConditions = (FCNewsTabiEventAggregationArticleSharedConditions *)v24;

    v26 = [FCNewsTabiEventAggregationArticleLikedConditions alloc];
    v27 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleLikedConditions", 0);
    uint64_t v28 = [(FCNewsTabiEventAggregationBaseEventConditions *)v26 initWithDictionary:v27];
    articleLikedConditions = v5->_articleLikedConditions;
    v5->_articleLikedConditions = (FCNewsTabiEventAggregationArticleLikedConditions *)v28;

    v30 = [FCNewsTabiEventAggregationArticleDislikedConditions alloc];
    v31 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleDislikedConditions", 0);
    uint64_t v32 = [(FCNewsTabiEventAggregationBaseEventConditions *)v30 initWithDictionary:v31];
    articleDislikedConditions = v5->_articleDislikedConditions;
    v5->_articleDislikedConditions = (FCNewsTabiEventAggregationArticleDislikedConditions *)v32;

    v34 = [FCNewsTabiEventAggregationArticleSavedConditions alloc];
    v35 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleSavedConditions", 0);
    uint64_t v36 = [(FCNewsTabiEventAggregationBaseEventConditions *)v34 initWithDictionary:v35];
    articleSavedConditions = v5->_articleSavedConditions;
    v5->_articleSavedConditions = (FCNewsTabiEventAggregationArticleSavedConditions *)v36;

    v38 = [FCNewsTabiEventAggregationTrackVisitedConditions alloc];
    v39 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"trackVisitedConditions", 0);
    uint64_t v40 = [(FCNewsTabiEventAggregationBaseEventConditions *)v38 initWithDictionary:v39];
    trackVisitedConditions = v5->_trackVisitedConditions;
    v5->_trackVisitedConditions = (FCNewsTabiEventAggregationTrackVisitedConditions *)v40;

    v42 = [FCNewsTabiEventAggregationTrackFinishedConditions alloc];
    v43 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"trackFinishedConditions", 0);
    uint64_t v44 = [(FCNewsTabiEventAggregationBaseEventConditions *)v42 initWithDictionary:v43];
    trackFinishedConditions = v5->_trackFinishedConditions;
    v5->_trackFinishedConditions = (FCNewsTabiEventAggregationTrackFinishedConditions *)v44;

    v46 = [FCNewsTabiEventAggregationArticleUnlikedConditions alloc];
    v47 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleUnlikedConditions", 0);
    uint64_t v48 = [(FCNewsTabiEventAggregationBaseEventConditions *)v46 initWithDictionary:v47];
    articleUnlikedConditions = v5->_articleUnlikedConditions;
    v5->_articleUnlikedConditions = (FCNewsTabiEventAggregationArticleUnlikedConditions *)v48;

    v50 = [FCNewsTabiEventAggregationArticleUndislikedConditions alloc];
    v51 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleUndislikedConditions", 0);
    uint64_t v52 = [(FCNewsTabiEventAggregationBaseEventConditions *)v50 initWithDictionary:v51];
    articleUndislikedConditions = v5->_articleUndislikedConditions;
    v5->_articleUndislikedConditions = (FCNewsTabiEventAggregationArticleUndislikedConditions *)v52;

    v54 = [FCNewsTabiEventAggregationArticleUnsavedConditions alloc];
    v55 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleUnsavedConditions", 0);
    uint64_t v56 = [(FCNewsTabiEventAggregationBaseEventConditions *)v54 initWithDictionary:v55];
    articleUnsavedConditions = v5->_articleUnsavedConditions;
    v5->_articleUnsavedConditions = (FCNewsTabiEventAggregationArticleUnsavedConditions *)v56;

    v58 = [FCNewsTabiEventAggregationNotificationVendedConditions alloc];
    v59 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"notificationVendedConditions", 0);
    uint64_t v60 = [(FCNewsTabiEventAggregationBaseEventConditions *)v58 initWithDictionary:v59];
    notificationVendedConditions = v5->_notificationVendedConditions;
    v5->_notificationVendedConditions = (FCNewsTabiEventAggregationNotificationVendedConditions *)v60;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsTabiEventAggregationConditions *)self articleSeenConditions];
  v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\tarticleSeenConditions: %@", v5];

  v6 = [(FCNewsTabiEventAggregationConditions *)self articleReadConditions];
  v7 = [v6 indentedDescription];
  [v3 appendFormat:@"\n\tarticleReadConditions: %@", v7];

  uint64_t v8 = [(FCNewsTabiEventAggregationConditions *)self trackListenedConditions];
  v9 = [v8 indentedDescription];
  [v3 appendFormat:@"\n\ttrackListenedConditions: %@", v9];

  v10 = [(FCNewsTabiEventAggregationConditions *)self articleVisitedConditions];
  v11 = [v10 indentedDescription];
  [v3 appendFormat:@"\n\tarticleVisitedConditions: %@", v11];

  uint64_t v12 = [(FCNewsTabiEventAggregationConditions *)self articleSharedConditions];
  v13 = [v12 indentedDescription];
  [v3 appendFormat:@"\n\tarticleSharedConditions: %@", v13];

  v14 = [(FCNewsTabiEventAggregationConditions *)self articleLikedConditions];
  v15 = [v14 indentedDescription];
  [v3 appendFormat:@"\n\tarticleLikedConditions: %@", v15];

  uint64_t v16 = [(FCNewsTabiEventAggregationConditions *)self articleDislikedConditions];
  v17 = [v16 indentedDescription];
  [v3 appendFormat:@"\n\tarticleDislikedConditions: %@", v17];

  v18 = [(FCNewsTabiEventAggregationConditions *)self articleSavedConditions];
  v19 = [v18 indentedDescription];
  [v3 appendFormat:@"\n\tarticleSavedConditions: %@", v19];

  uint64_t v20 = [(FCNewsTabiEventAggregationConditions *)self trackVisitedConditions];
  v21 = [v20 indentedDescription];
  [v3 appendFormat:@"\n\ttrackVisitedConditions: %@", v21];

  v22 = [(FCNewsTabiEventAggregationConditions *)self trackFinishedConditions];
  v23 = [v22 indentedDescription];
  [v3 appendFormat:@"\n\ttrackFinishedConditions: %@", v23];

  uint64_t v24 = [(FCNewsTabiEventAggregationConditions *)self articleUnlikedConditions];
  v25 = [v24 indentedDescription];
  [v3 appendFormat:@"\n\tarticleUnlikedConditions: %@", v25];

  v26 = [(FCNewsTabiEventAggregationConditions *)self articleUndislikedConditions];
  v27 = [v26 indentedDescription];
  [v3 appendFormat:@"\n\tarticleUndislikedConditions: %@", v27];

  uint64_t v28 = [(FCNewsTabiEventAggregationConditions *)self articleUnsavedConditions];
  v29 = [v28 indentedDescription];
  [v3 appendFormat:@"\n\tarticleUnsavedConditions: %@", v29];

  v30 = [(FCNewsTabiEventAggregationConditions *)self notificationVendedConditions];
  v31 = [v30 indentedDescription];
  [v3 appendFormat:@"\n\tnotificationVendedConditions: %@", v31];

  [v3 appendString:@"\n>"];
  return v3;
}

- (FCNewsTabiEventAggregationTrackVisitedConditions)trackVisitedConditions
{
  return self->_trackVisitedConditions;
}

- (FCNewsTabiEventAggregationTrackListenedConditions)trackListenedConditions
{
  return self->_trackListenedConditions;
}

- (FCNewsTabiEventAggregationTrackFinishedConditions)trackFinishedConditions
{
  return self->_trackFinishedConditions;
}

- (FCNewsTabiEventAggregationNotificationVendedConditions)notificationVendedConditions
{
  return self->_notificationVendedConditions;
}

- (FCNewsTabiEventAggregationArticleVisitedConditions)articleVisitedConditions
{
  return self->_articleVisitedConditions;
}

- (FCNewsTabiEventAggregationArticleUnsavedConditions)articleUnsavedConditions
{
  return self->_articleUnsavedConditions;
}

- (FCNewsTabiEventAggregationArticleUnlikedConditions)articleUnlikedConditions
{
  return self->_articleUnlikedConditions;
}

- (FCNewsTabiEventAggregationArticleUndislikedConditions)articleUndislikedConditions
{
  return self->_articleUndislikedConditions;
}

- (FCNewsTabiEventAggregationArticleSharedConditions)articleSharedConditions
{
  return self->_articleSharedConditions;
}

- (FCNewsTabiEventAggregationArticleSeenConditions)articleSeenConditions
{
  return self->_articleSeenConditions;
}

- (FCNewsTabiEventAggregationArticleSavedConditions)articleSavedConditions
{
  return self->_articleSavedConditions;
}

- (FCNewsTabiEventAggregationArticleReadConditions)articleReadConditions
{
  return self->_articleReadConditions;
}

- (FCNewsTabiEventAggregationArticleLikedConditions)articleLikedConditions
{
  return self->_articleLikedConditions;
}

- (FCNewsTabiEventAggregationArticleDislikedConditions)articleDislikedConditions
{
  return self->_articleDislikedConditions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationVendedConditions, 0);
  objc_storeStrong((id *)&self->_articleUnsavedConditions, 0);
  objc_storeStrong((id *)&self->_articleUndislikedConditions, 0);
  objc_storeStrong((id *)&self->_articleUnlikedConditions, 0);
  objc_storeStrong((id *)&self->_trackFinishedConditions, 0);
  objc_storeStrong((id *)&self->_trackListenedConditions, 0);
  objc_storeStrong((id *)&self->_trackVisitedConditions, 0);
  objc_storeStrong((id *)&self->_articleSavedConditions, 0);
  objc_storeStrong((id *)&self->_articleDislikedConditions, 0);
  objc_storeStrong((id *)&self->_articleLikedConditions, 0);
  objc_storeStrong((id *)&self->_articleSharedConditions, 0);
  objc_storeStrong((id *)&self->_articleVisitedConditions, 0);
  objc_storeStrong((id *)&self->_articleReadConditions, 0);
  objc_storeStrong((id *)&self->_articleSeenConditions, 0);
}

@end