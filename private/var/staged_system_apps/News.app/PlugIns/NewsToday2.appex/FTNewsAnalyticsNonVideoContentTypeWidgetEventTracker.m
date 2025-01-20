@interface FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker
- (FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker)init;
- (FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker)initWithSessionManager:(id)a3 userIDProvider:(id)a4;
- (NSDate)lastVisibleItemsChangeDate;
- (NSDate)widgetAppearanceDate;
- (NSMutableArray)lastVisibleItemsChangePairs;
- (NSMutableArray)outstandingItemExposureEvents;
- (NSSNewsAnalyticsEventAnnotator)eventAnnotator;
- (NSSNewsAnalyticsPBEventAccumulator)accumulator;
- (NSSNewsAnalyticsUserIDProvider)userIDProvider;
- (id)_newWidgetEngagementWithTrackableWidgetState:(id)a3;
- (id)_widgetEngagementEventAtDate:(id)a3 withEngagement:(id)a4 trackableWidgetState:(id)a5;
- (id)_widgetEngagementForHeadline:(id)a3 inSection:(id)a4 withTrackableWidgetState:(id)a5;
- (id)engagementWithBackgroundAtDate:(id)a3 withTargetURL:(id)a4 trackableWidgetState:(id)a5;
- (id)engagementWithBannerAtDate:(id)a3 withTargetURL:(id)a4 trackableWidgetState:(id)a5;
- (id)engagementWithEmbedTapTargetAtDate:(id)a3 withEmbedURL:(id)a4 targetURL:(id)a5 trackableWidgetState:(id)a6;
- (id)engagementWithHeaderAtDate:(id)a3 withTargetURL:(id)a4 trackableWidgetState:(id)a5;
- (id)engagementWithPlaceholderAtDate:(id)a3 withTargetURL:(id)a4 trackableWidgetState:(id)a5;
- (id)engagementWithRowAtDate:(id)a3 forHeadline:(id)a4 withTrackableWidgetState:(id)a5;
- (int)_pbDisplayModeWithDisplayMode:(unint64_t)a3;
- (int)_pbStackLocationWithStackLocation:(unint64_t)a3;
- (int)_pbWidgetTypeWithStackKind:(unint64_t)a3;
- (int)lastVisibleItemsChangeArticleCount;
- (unint64_t)itemExposuresSinceLastWidgetAppearance;
- (void)_annotateEvent:(id)a3 withTrackableWidgetState:(id)a4;
- (void)setEventAnnotator:(id)a3;
- (void)setItemExposuresSinceLastWidgetAppearance:(unint64_t)a3;
- (void)setLastVisibleItemsChangeArticleCount:(int)a3;
- (void)setLastVisibleItemsChangeDate:(id)a3;
- (void)setLastVisibleItemsChangePairs:(id)a3;
- (void)setOutstandingItemExposureEvents:(id)a3;
- (void)setWidgetAppearanceDate:(id)a3;
- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5;
@end

@implementation FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker

- (FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker init]";
    __int16 v7 = 2080;
    v8 = "FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker.m";
    __int16 v9 = 1024;
    int v10 = 72;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker)initWithSessionManager:(id)a3 userIDProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000E5918();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E5854();
  }
LABEL_6:
  v19.receiver = self;
  v19.super_class = (Class)FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker;
  v8 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)&v19 init];
  if (v8)
  {
    __int16 v9 = (NSSNewsAnalyticsEventAnnotator *)[objc_alloc((Class)NSSNewsAnalyticsEventAnnotator) initWithSessionManager:v6 userIDProvider:v7];
    eventAnnotator = v8->_eventAnnotator;
    v8->_eventAnnotator = v9;

    uint64_t v11 = objc_opt_new();
    lastVisibleItemsChangePairs = v8->_lastVisibleItemsChangePairs;
    v8->_lastVisibleItemsChangePairs = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    outstandingItemExposureEvents = v8->_outstandingItemExposureEvents;
    v8->_outstandingItemExposureEvents = (NSMutableArray *)v13;

    id v15 = [objc_alloc((Class)NSSNewsAnalyticsEnvelopeDescriptor) initWithContentType:3 contentTypeVersion:1 contentTypeMinorVersion:0 contentTypePatchVersion:0];
    v16 = (NSSNewsAnalyticsPBEventAccumulator *)[objc_alloc((Class)NSSNewsAnalyticsPBEventAccumulator) initWithEnvelopeDescriptor:v15 sessionManager:v6];
    accumulator = v8->_accumulator;
    v8->_accumulator = v16;

    objc_storeStrong((id *)&v8->_userIDProvider, a4);
  }

  return v8;
}

- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000E5AA0();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E59DC();
  }
LABEL_6:
  int v10 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self lastVisibleItemsChangeDate];
  uint64_t v11 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self outstandingItemExposureEvents];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10000DA78;
  v55[3] = &unk_100123B88;
  id v12 = v10;
  id v56 = v12;
  id v13 = v8;
  id v57 = v13;
  [v11 enumerateObjectsUsingBlock:v55];
  v14 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self accumulator];
  [v14 observeEvents:v11];

  -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker setItemExposuresSinceLastWidgetAppearance:](self, "setItemExposuresSinceLastWidgetAppearance:", (char *)[v11 count]+ -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker itemExposuresSinceLastWidgetAppearance](self, "itemExposuresSinceLastWidgetAppearance"));
  id v15 = [v9 visibleItems];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10000DAD8;
  v52[3] = &unk_100123BB0;
  v52[4] = self;
  id v16 = v9;
  id v53 = v16;
  id v17 = v15;
  id v54 = v17;
  v18 = [v17 fc_arrayByTransformingWithBlock:v52];
  id v19 = [v18 mutableCopy];
  [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self setOutstandingItemExposureEvents:v19];

  if (a4 == 4)
  {
    v20 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self widgetAppearanceDate];
    if (v20)
    {
      v21 = objc_opt_new();
      v22 = [v16 entryID];
      [v21 setEntryId:v22];

      id v23 = [v16 appearanceType];
      if ((unint64_t)v23 < 4) {
        uint64_t v24 = (v23 + 1);
      }
      else {
        uint64_t v24 = 0;
      }
      [v21 setWidgetAppearanceType:v24];
      [v21 setWidgetArticleCount:[self lastVisibleItemsChangeArticleCount]];
      [v21 setWidgetHeadlineExposureCount:[self itemExposuresSinceLastWidgetAppearance]];
      v25 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self lastVisibleItemsChangePairs];
      id v26 = [v25 mutableCopy];
      [v21 setWidgetSectionsArticleCountPairs:v26];

      v27 = [v16 contentID];
      [v21 setContentId:v27];

      [v21 setWidgetType:[self _pbWidgetTypeWithStackKind:[v16 stackKind]]];
      [v21 setWidgetExposureStackLocation:[self _pbStackLocationWithStackLocation:[v16 stackLocation]]];
      v28 = [v16 todayResults];
      v29 = [v28 banner];
      [v29 identifier];
      v30 = id v47 = v12;
      [v21 setBannerIdentifier:v30];

      v46 = objc_opt_new();
      [v46 setTodayWidgetExposure:v21];
      v31 = +[NTPBEvent nss_eventWithIdentifier];
      v32 = +[NSDate date];
      [v31 ft_setTemporalBoundsBySanitizingStartDate:v20 endDate:v32];

      v33 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self eventAnnotator];
      [v33 annotateEvent:v31 withOptions:47];

      [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self _annotateEvent:v31 withTrackableWidgetState:v16];
      [v31 setEventObject:v46];
      v34 = [v16 fetchInfoForVisibleResults];
      [v34 CTRByPersonalizationFeatureID];
      id v35 = v13;
      v37 = v36 = v20;
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_10000DD7C;
      v50[3] = &unk_100123BD8;
      id v51 = v21;
      id v38 = v21;
      [v37 enumerateKeysAndObjectsUsingBlock:v50];

      v39 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self accumulator];
      [v39 observeEvent:v31];

      v20 = v36;
      id v13 = v35;
      [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self setWidgetAppearanceDate:0];
      [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self setItemExposuresSinceLastWidgetAppearance:0];

      id v12 = v47;
    }
  }
  [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self setLastVisibleItemsChangeDate:v13];
  v40 = [v16 visibleSections];
  v41 = [v16 extentsOfSections:v40];

  v42 = [v16 visibleSections];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10000DE24;
  v48[3] = &unk_100123C00;
  id v49 = v41;
  id v43 = v41;
  v44 = [v42 fc_arrayByTransformingWithBlock:v48];
  id v45 = [v44 mutableCopy];
  [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self setLastVisibleItemsChangePairs:v45];

  -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker setLastVisibleItemsChangeArticleCount:](self, "setLastVisibleItemsChangeArticleCount:", [v17 count]);
}

- (id)engagementWithRowAtDate:(id)a3 forHeadline:(id)a4 withTrackableWidgetState:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)NTNewsSourceIdentifier;
  int v10 = [v8 fetchInfoForVisibleResults];
  uint64_t v11 = [v10 todaySourceIdentifier];
  LODWORD(v9) = [v9 isEqualToString:v11];

  if (v9
    && ([v7 analyticsElement], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    id v13 = [v8 sectionForItem:v7];
    v14 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self _widgetEngagementForHeadline:v7 inSection:v13 withTrackableWidgetState:v8];
    [v14 setWidgetEngagementType:1];
    id v15 = objc_opt_new();
    [v15 setWidgetEngagement:v14];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)engagementWithEmbedTapTargetAtDate:(id)a3 withEmbedURL:(id)a4 targetURL:(id)a5 trackableWidgetState:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)NTNewsSourceIdentifier;
  id v13 = [v11 fetchInfoForVisibleResults];
  v14 = [v13 todaySourceIdentifier];
  LODWORD(v12) = [v12 isEqualToString:v14];

  if (v12)
  {
    id v15 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self _newWidgetEngagementWithTrackableWidgetState:v11];
    [v15 setWidgetEngagementType:5];
    id v16 = [v9 absoluteString];
    [v15 setWebEmbedId:v16];

    id v17 = [v10 absoluteString];
    [v15 setEngagementTargetUrl:v17];

    [v15 setWidgetContentType:2];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)engagementWithHeaderAtDate:(id)a3 withTargetURL:(id)a4 trackableWidgetState:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)NTNewsSourceIdentifier;
  id v10 = [v8 fetchInfoForVisibleResults];
  id v11 = [v10 todaySourceIdentifier];
  LODWORD(v9) = [v9 isEqualToString:v11];

  if (v9)
  {
    id v12 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self _newWidgetEngagementWithTrackableWidgetState:v8];
    [v12 setWidgetEngagementType:9];
    id v13 = [v7 absoluteString];
    [v12 setEngagementTargetUrl:v13];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)engagementWithPlaceholderAtDate:(id)a3 withTargetURL:(id)a4 trackableWidgetState:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)NTNewsSourceIdentifier;
  id v10 = [v8 fetchInfoForVisibleResults];
  id v11 = [v10 todaySourceIdentifier];
  LODWORD(v9) = [v9 isEqualToString:v11];

  if (v9)
  {
    id v12 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self _newWidgetEngagementWithTrackableWidgetState:v8];
    [v12 setWidgetEngagementType:10];
    id v13 = [v7 absoluteString];
    [v12 setEngagementTargetUrl:v13];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)engagementWithBackgroundAtDate:(id)a3 withTargetURL:(id)a4 trackableWidgetState:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)NTNewsSourceIdentifier;
  id v10 = [v8 fetchInfoForVisibleResults];
  id v11 = [v10 todaySourceIdentifier];
  LODWORD(v9) = [v9 isEqualToString:v11];

  if (v9)
  {
    id v12 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self _newWidgetEngagementWithTrackableWidgetState:v8];
    [v12 setWidgetEngagementType:8];
    id v13 = [v7 absoluteString];
    [v12 setEngagementTargetUrl:v13];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)engagementWithBannerAtDate:(id)a3 withTargetURL:(id)a4 trackableWidgetState:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)NTNewsSourceIdentifier;
  id v10 = [v8 fetchInfoForVisibleResults];
  id v11 = [v10 todaySourceIdentifier];
  LODWORD(v9) = [v9 isEqualToString:v11];

  if (v9)
  {
    id v12 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self _newWidgetEngagementWithTrackableWidgetState:v8];
    [v12 setWidgetEngagementType:11];
    id v13 = [v7 absoluteString];
    [v12 setEngagementTargetUrl:v13];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_widgetEngagementEventAtDate:(id)a3 withEngagement:(id)a4 trackableWidgetState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000E5DB0();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E5CEC();
  }
LABEL_6:
  if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E5C28();
  }
  id v11 = objc_opt_new();
  [v11 setWidgetEngagement:v9];
  id v12 = +[NTPBEvent nss_eventWithIdentifier];
  [v12 nss_setStartDate:v8];
  id v13 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self eventAnnotator];
  [v13 annotateEvent:v12 withOptions:47];

  [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self _annotateEvent:v12 withTrackableWidgetState:v10];
  [v12 setGestureType:1];
  [v12 setEventObject:v11];

  return v12;
}

- (void)_annotateEvent:(id)a3 withTrackableWidgetState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000E5F38();
    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E5E74();
  }
LABEL_6:
  id v7 = [v6 fetchInfoForVisibleResults];
  id v8 = [v7 appConfigTreatmentID];

  if (v8) {
    [v5 setAppConfigTreatmentId:[v8 integerValue]];
  }
}

- (id)_widgetEngagementForHeadline:(id)a3 inSection:(id)a4 withTrackableWidgetState:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 analyticsElement];

  if (v9)
  {
    id v10 = [v8 sectionForItem:v7];
    id v11 = [v8 visibleSections];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000E98C;
    v26[3] = &unk_100123C28;
    id v12 = v10;
    id v27 = v12;
    id v13 = [v11 fc_arrayByTransformingWithBlock:v26];

    v14 = [v7 analyticsElement];
    id v15 = [v14 articleID];

    id v16 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self _newWidgetEngagementWithTrackableWidgetState:v8];
    [v16 setArticleId:v15];
    id v17 = [v7 analyticsElement];
    v18 = [v17 channelID];
    [v16 setSourceChannelId:v18];

    id v19 = [v12 identifier];
    [v16 setWidgetSectionId:v19];

    v20 = [v12 subidentifier];
    [v16 setWidgetSectionSubid:v20];

    [v16 setWidgetSectionDisplayRank:[v8 absoluteOrderOfSection:v12]];
    [v16 setWidgetArticleRank:[v8 absoluteOrderOfItem:v7]];
    v21 = [v12 items];
    [v16 setWidgetArticleRankInSection:[v21 indexOfObject:v7]];

    [v16 setWidgetArticleCount:[v8 absoluteItemCountForCurrentDisplayMode]];
    v22 = [v12 items];
    [v16 setWidgetArticleCountInSection:[v22 count]];

    id v23 = [v13 copy];
    [v16 setOtherVisibleSections:v23];

    [v16 setWidgetContentType:0];
    uint64_t v24 = [v7 storyType];
    [v16 setStoryType:v24];

    if (![v7 itemType]) {
      [v16 setWidgetContentType:1];
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)_newWidgetEngagementWithTrackableWidgetState:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *)self userIDProvider];
  id v7 = [v6 userID];
  [v5 setWidgetUserId:v7];

  id v8 = [v4 fetchDate];
  [v8 timeIntervalSince1970];
  [v5 setContentFetchDate:(uint64_t)v9];

  [v5 setWidgetDisplayMode:[self _pbDisplayModeWithDisplayMode:[v4 activeDisplayMode]]];
  id v10 = [v4 contentID];
  [v5 setContentId:v10];

  [v5 setWidgetType:[self _pbWidgetTypeWithStackKind:[v4 stackKind]]];
  [v5 setWidgetExposureStackLocation:[self _pbStackLocationWithStackLocation:[v4 stackLocation]]];
  id v11 = [v4 entryID];

  [v5 setEntryId:v11];
  return v5;
}

- (int)_pbDisplayModeWithDisplayMode:(unint64_t)a3
{
  if (a3 - 1 < 7) {
    return a3;
  }
  else {
    return 0;
  }
}

- (int)_pbWidgetTypeWithStackKind:(unint64_t)a3
{
  if (a3 - 1 < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (int)_pbStackLocationWithStackLocation:(unint64_t)a3
{
  if (a3 - 1 < 5) {
    return a3;
  }
  else {
    return 0;
  }
}

- (NSSNewsAnalyticsPBEventAccumulator)accumulator
{
  return self->_accumulator;
}

- (NSSNewsAnalyticsEventAnnotator)eventAnnotator
{
  return self->_eventAnnotator;
}

- (void)setEventAnnotator:(id)a3
{
}

- (NSDate)widgetAppearanceDate
{
  return self->_widgetAppearanceDate;
}

- (void)setWidgetAppearanceDate:(id)a3
{
}

- (NSDate)lastVisibleItemsChangeDate
{
  return self->_lastVisibleItemsChangeDate;
}

- (void)setLastVisibleItemsChangeDate:(id)a3
{
}

- (NSMutableArray)lastVisibleItemsChangePairs
{
  return self->_lastVisibleItemsChangePairs;
}

- (void)setLastVisibleItemsChangePairs:(id)a3
{
}

- (int)lastVisibleItemsChangeArticleCount
{
  return self->_lastVisibleItemsChangeArticleCount;
}

- (void)setLastVisibleItemsChangeArticleCount:(int)a3
{
  self->_lastVisibleItemsChangeArticleCount = a3;
}

- (NSMutableArray)outstandingItemExposureEvents
{
  return self->_outstandingItemExposureEvents;
}

- (void)setOutstandingItemExposureEvents:(id)a3
{
}

- (unint64_t)itemExposuresSinceLastWidgetAppearance
{
  return self->_itemExposuresSinceLastWidgetAppearance;
}

- (void)setItemExposuresSinceLastWidgetAppearance:(unint64_t)a3
{
  self->_itemExposuresSinceLastWidgetAppearance = a3;
}

- (NSSNewsAnalyticsUserIDProvider)userIDProvider
{
  return self->_userIDProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIDProvider, 0);
  objc_storeStrong((id *)&self->_outstandingItemExposureEvents, 0);
  objc_storeStrong((id *)&self->_lastVisibleItemsChangePairs, 0);
  objc_storeStrong((id *)&self->_lastVisibleItemsChangeDate, 0);
  objc_storeStrong((id *)&self->_widgetAppearanceDate, 0);
  objc_storeStrong((id *)&self->_eventAnnotator, 0);

  objc_storeStrong((id *)&self->_accumulator, 0);
}

@end