@interface FTPersonalizationWidgetEventTracker
- (FCFileCoordinatedTodayPersonalizationUpdate)fileCoordinatedStore;
- (FTPersonalizationWidgetEventTracker)init;
- (NSMutableArray)events;
- (id)personalizationEventAtDate:(id)a3 withAction:(int)a4 headline:(id)a5 section:(id)a6 trackableWidgetState:(id)a7;
- (void)setEvents:(id)a3;
- (void)setFileCoordinatedStore:(id)a3;
- (void)submitEventsIfNeededWithCompletion:(id)a3;
- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5;
- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4;
@end

@implementation FTPersonalizationWidgetEventTracker

- (FTPersonalizationWidgetEventTracker)init
{
  v10.receiver = self;
  v10.super_class = (Class)FTPersonalizationWidgetEventTracker;
  v2 = [(FTPersonalizationWidgetEventTracker *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    events = v2->_events;
    v2->_events = (NSMutableArray *)v3;

    id v5 = objc_alloc((Class)FCFileCoordinatedTodayPersonalizationUpdate);
    v6 = FCURLForTodayPersonalizationUpdateStore();
    v7 = (FCFileCoordinatedTodayPersonalizationUpdate *)[v5 initWithFileURL:v6];
    fileCoordinatedStore = v2->_fileCoordinatedStore;
    v2->_fileCoordinatedStore = v7;
  }
  return v2;
}

- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 todayResults];
  v9 = v8;
  if (v8)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    objc_super v10 = [v8 sections];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100019EA0;
    v11[3] = &unk_1000FB9D0;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    v14 = v15;
    [v10 enumerateObjectsUsingBlock:v11];

    _Block_object_dispose(v15, 8);
  }
}

- (void)submitEventsIfNeededWithCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  id v5 = [(FTPersonalizationWidgetEventTracker *)self events];
  if ([v5 count])
  {
    id v6 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 addEvents:*(void *)(*((void *)&v16 + 1) + 8 * (void)v11)];
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    id v12 = [(FTPersonalizationWidgetEventTracker *)self fileCoordinatedStore];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001A264;
    v14[3] = &unk_1000FB9F8;
    v15 = v4;
    [v12 submitUpdate:v6 withCompletion:v14];

    id v13 = objc_opt_new();
    [(FTPersonalizationWidgetEventTracker *)self setEvents:v13];
  }
  else
  {
    v4[2](v4);
  }
}

- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 fc_NewsArticleID];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = sub_10001A468;
    v31 = sub_10001A478;
    id v32 = 0;
    v14 = [v10 todayResults];
    v15 = [v14 sections];
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_10001A480;
    v24 = &unk_1000FBA48;
    id v16 = v13;
    id v25 = v16;
    v26 = &v27;
    [v15 enumerateObjectsUsingBlock:&v21];

    uint64_t v17 = v28[5];
    if (v17)
    {
      long long v18 = [v10 sectionForItem:v28[5] inSectionIndex:v21 inSectionIndexTitle:v22 inSectionIndexTitles:v23 inSectionIndexTitlesForTableView:v24];
      long long v19 = [(FTPersonalizationWidgetEventTracker *)self personalizationEventAtDate:v8 withAction:2 headline:v17 section:v18 trackableWidgetState:v10];

      if (v19)
      {
        v20 = [(FTPersonalizationWidgetEventTracker *)self events];
        [v20 addObject:v19];
      }
    }

    _Block_object_dispose(&v27, 8);
  }
}

- (id)personalizationEventAtDate:(id)a3 withAction:(int)a4 headline:(id)a5 section:(id)a6 trackableWidgetState:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (!v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000CA2F4();
    if (v12) {
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000CA230();
  }
LABEL_6:
  if (!v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000CA16C();
    if (v14) {
      goto LABEL_11;
    }
  }
  else if (v14)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000CA0A8();
  }
LABEL_11:
  v15 = [v12 personalizationMetadata];

  if (v15)
  {
    id v16 = +[NTPBTodayPersonalizationEvent ft_eventWithDate:action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:](NTPBTodayPersonalizationEvent, "ft_eventWithDate:action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:", v11, v10, v12, v13, [v14 absoluteOrderOfItemInSection:v12], objc_msgSend(v14, "absoluteOrderOfItem:", v12), objc_msgSend(v14, "absoluteOrderOfSection:", v13));
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (FCFileCoordinatedTodayPersonalizationUpdate)fileCoordinatedStore
{
  return self->_fileCoordinatedStore;
}

- (void)setFileCoordinatedStore:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_fileCoordinatedStore, 0);
}

@end