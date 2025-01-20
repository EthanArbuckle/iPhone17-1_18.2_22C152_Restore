@interface TransitPayFeatureDiscoveryMetadataStore
- (BOOL)_userHasBecomeLocalAndTipShouldDisplayInMarket:(unint64_t)a3 tipType:(int)a4 currentTip:(id)a5;
- (BOOL)shouldDisplayTipInMarket:(unint64_t)a3 tipType:(int)a4 sinkType:(int)a5;
- (TransitPayFeatureDiscoveryMetadataStore)initWithTouristStatus:(BOOL)a3;
- (id)_tipInfoForMarket:(unint64_t)a3 tipType:(int)a4;
- (void)_persistData;
- (void)handleManualTipDismissForMarket:(unint64_t)a3 tipType:(int)a4 sinkType:(int)a5;
- (void)handleTipDisplayForMarket:(unint64_t)a3 tipType:(int)a4 sinkType:(int)a5;
@end

@implementation TransitPayFeatureDiscoveryMetadataStore

- (TransitPayFeatureDiscoveryMetadataStore)initWithTouristStatus:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)TransitPayFeatureDiscoveryMetadataStore;
  v4 = [(TransitPayFeatureDiscoveryMetadataStore *)&v19 init];
  v5 = v4;
  if (v4)
  {
    v4->_isTourist = a3;
    v6 = +[NSUserDefaults standardUserDefaults];
    v7 = [v6 dictionaryForKey:@"__internal__TransitPayTipInfoKey"];
    v8 = (NSMutableDictionary *)[v7 mutableCopy];
    defaultsDictionary = v5->_defaultsDictionary;
    v5->_defaultsDictionary = v8;

    v10 = v5->_defaultsDictionary;
    if (!v10)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v12 = v5->_defaultsDictionary;
      v5->_defaultsDictionary = v11;

      v10 = v5->_defaultsDictionary;
    }
    v13 = [(NSMutableDictionary *)v10 objectForKey:@"TransitPayTipInfoDictionary"];
    v14 = (NSMutableDictionary *)[v13 mutableCopy];
    tipInfoDictionary = v5->_tipInfoDictionary;
    v5->_tipInfoDictionary = v14;

    if (!v5->_tipInfoDictionary)
    {
      v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v17 = v5->_tipInfoDictionary;
      v5->_tipInfoDictionary = v16;
    }
  }
  return v5;
}

- (BOOL)shouldDisplayTipInMarket:(unint64_t)a3 tipType:(int)a4 sinkType:(int)a5
{
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    if (a4 == 5)
    {
      v6 = sub_100021338();
      BOOL v7 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "No teardown logic for top-up tips", buf, 2u);
      }
      goto LABEL_29;
    }
    tipInfoDictionary = self->_tipInfoDictionary;
    v13 = +[NSString stringWithFormat:@"%llu", a3];
    v6 = [(NSMutableDictionary *)tipInfoDictionary objectForKey:v13];

    if (!v6)
    {
      objc_super v19 = sub_100021338();
      BOOL v7 = 1;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = objc_opt_class();
        id v21 = v20;
        v22 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        unint64_t v39 = (unint64_t)v20;
        __int16 v40 = 2112;
        v41 = v22;
        __int16 v42 = 2048;
        unint64_t v43 = a3;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ %@: This market: %llu has no tip data", buf, 0x20u);
      }
      goto LABEL_28;
    }
    v14 = v6;
    id v37 = 0;
    v15 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:&v37];
    id v16 = v37;
    if (v16)
    {
      v17 = sub_100021338();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = [v16 debugDescription];
        *(_DWORD *)buf = 138412290;
        unint64_t v39 = (unint64_t)v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "There was an error unarchiving the tip metadata: %@", buf, 0xCu);
      }
      objc_super v19 = 0;
    }
    else
    {
      objc_super v19 = v15;
    }

    if ([(TransitPayFeatureDiscoveryMetadataStore *)self _userHasBecomeLocalAndTipShouldDisplayInMarket:a3 tipType:v5 currentTip:v19])
    {
      v23 = sub_100021338();
      BOOL v7 = 1;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v39 = a3;
        v24 = "The user dismissed the open-loop tip when they were a tourist and are now being shown the closed-loop tip "
              "since they are a local in this market: %llu";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v24, buf, 0xCu);
      }
    }
    else
    {
      if (a5 == 4)
      {
        uint64_t v25 = [v19 dismissalDate];
        if (v25)
        {
          v26 = (void *)v25;
          v27 = [v19 dismissalDate];
          uint64_t UInteger = GEOConfigGetUInteger();
          id v29 = v27;
          id v30 = objc_alloc_init((Class)NSDateComponents);
          [v30 setDay:-UInteger];
          v31 = +[NSCalendar currentCalendar];
          v32 = +[NSDate now];
          v33 = [v31 dateByAddingComponents:v30 toDate:v32 options:0];

          id v34 = [v29 compare:v33];
          if (v34 == (id)-1)
          {
            v23 = sub_100021338();
            BOOL v7 = 1;
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
              goto LABEL_27;
            }
            *(_DWORD *)buf = 134217984;
            unint64_t v39 = a3;
            v24 = "The tip has been dismissed in this market, but it is now reappearing: %llu";
            goto LABEL_19;
          }
        }
      }
      v35 = [v19 dismissalDate];

      if (!v35)
      {
        BOOL v7 = 1;
        goto LABEL_28;
      }
      v23 = sub_100021338();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v39 = a3;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "The tip was either manually or automatically dismissed in this market: %llu", buf, 0xCu);
      }
      BOOL v7 = 0;
    }
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  v6 = sub_100021338();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Server gave us invalid market MUID: %llu", buf, 0xCu);
  }
  BOOL v7 = 0;
LABEL_29:

  return v7;
}

- (void)handleManualTipDismissForMarket:(unint64_t)a3 tipType:(int)a4 sinkType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (a3)
  {
    if (v6 == 5)
    {
      v9 = sub_100021338();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v10 = "No teardown logic for top-up tips";
        v11 = v9;
        uint32_t v12 = 2;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
      }
    }
    else
    {
      v9 = [(TransitPayFeatureDiscoveryMetadataStore *)self _tipInfoForMarket:a3 tipType:v6];
      [v9 userDismissedInSink:v5];
      tipInfoDictionary = self->_tipInfoDictionary;
      id v20 = 0;
      v14 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v20];
      id v15 = v20;
      if (v15)
      {
        id v16 = sub_100021338();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = [v15 localizedDescription];
          *(_DWORD *)buf = 138412290;
          v22 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "There was an error archiving the tip metadata: %@", buf, 0xCu);
        }
        id v18 = 0;
      }
      else
      {
        id v18 = v14;
      }

      objc_super v19 = +[NSString stringWithFormat:@"%llu", a3];
      [(NSMutableDictionary *)tipInfoDictionary setObject:v18 forKey:v19];

      [(TransitPayFeatureDiscoveryMetadataStore *)self _persistData];
    }
  }
  else
  {
    v9 = sub_100021338();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v22 = 0;
      v10 = "Server gave us invalid market MUID: %llu";
      v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_7;
    }
  }
}

- (void)handleTipDisplayForMarket:(unint64_t)a3 tipType:(int)a4 sinkType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (a3)
  {
    if (v6 == 5)
    {
      v9 = sub_100021338();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v10 = "No teardown logic for top-up tips";
        v11 = v9;
        uint32_t v12 = 2;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
      }
    }
    else
    {
      v9 = [(TransitPayFeatureDiscoveryMetadataStore *)self _tipInfoForMarket:a3 tipType:v6];
      v13 = [v9 lastDisplayed];
      if (v13)
      {
        v14 = [v9 lastDisplayed];
        id v15 = objc_alloc_init((Class)NSDateComponents);
        [v15 setDay:-1];
        id v16 = +[NSCalendar currentCalendar];
        v17 = +[NSDate now];
        id v18 = [v16 dateByAddingComponents:v15 toDate:v17 options:0];

        BOOL v19 = [v14 compare:v18] == (id)-1;
      }
      else
      {
        BOOL v19 = 1;
      }

      if (v5 == 4 || v5 == 2 && v19)
      {
        id v20 = [v9 incrementDisplayCountForSink:v5];
        id v21 = sub_100021338();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          CFStringRef v22 = @"UNKNOWN SINK TYPE";
          if (v5 == 4) {
            CFStringRef v22 = @"SinkTypeRoutePlanning";
          }
          if (v5 == 2) {
            CFStringRef v23 = @"SinkTypeMapsHome";
          }
          else {
            CFStringRef v23 = v22;
          }
          v24 = [v9 lastDisplayed];
          *(_DWORD *)buf = 134218754;
          unint64_t v35 = a3;
          __int16 v36 = 2112;
          CFStringRef v37 = v23;
          __int16 v38 = 2112;
          unint64_t v39 = v24;
          __int16 v40 = 2112;
          v41 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Incremented tip displays in market: %llu for %@. Last tip display: %@. Current count: %@", buf, 0x2Au);
        }
        uint64_t UInteger = GEOConfigGetUInteger();
        if ((uint64_t)[v9 displayCountForSink:v5] >= UInteger) {
          [v9 userDismissedInSink:v5];
        }
        tipInfoDictionary = self->_tipInfoDictionary;
        id v33 = 0;
        v27 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v33];
        id v28 = v33;
        if (v28)
        {
          id v29 = sub_100021338();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            id v30 = [v28 localizedDescription];
            *(_DWORD *)buf = 138412290;
            unint64_t v35 = (unint64_t)v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "There was an error archiving the tip metadata: %@", buf, 0xCu);
          }
          id v31 = 0;
        }
        else
        {
          id v31 = v27;
        }

        v32 = +[NSString stringWithFormat:@"%llu", a3];
        [(NSMutableDictionary *)tipInfoDictionary setObject:v31 forKey:v32];

        [(TransitPayFeatureDiscoveryMetadataStore *)self _persistData];
      }
    }
  }
  else
  {
    v9 = sub_100021338();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v35 = 0;
      v10 = "Server gave us invalid market MUID: %llu";
      v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_7;
    }
  }
}

- (id)_tipInfoForMarket:(unint64_t)a3 tipType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  tipInfoDictionary = self->_tipInfoDictionary;
  v8 = +[NSString stringWithFormat:@"%llu", a3];
  v9 = [(NSMutableDictionary *)tipInfoDictionary objectForKey:v8];

  if (v9)
  {
    id v10 = v9;
    id v18 = 0;
    v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v18];
    id v12 = v18;
    if (v12)
    {
      v13 = sub_100021338();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [v12 debugDescription];
        *(_DWORD *)buf = 138412290;
        unint64_t v20 = (unint64_t)v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "There was an error unarchiving the tip metadata: %@", buf, 0xCu);
      }
      id v15 = 0;
    }
    else
    {
      id v15 = v11;
    }
  }
  else
  {
    id v16 = sub_100021338();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v20 = a3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "This market: %llu has no tip data", buf, 0xCu);
    }

    id v15 = [[_TransitPayTipInteractionRecord alloc] initWithTipType:v4 isTourist:self->_isTourist];
  }

  return v15;
}

- (BOOL)_userHasBecomeLocalAndTipShouldDisplayInMarket:(unint64_t)a3 tipType:(int)a4 currentTip:(id)a5
{
  id v8 = a5;
  v9 = v8;
  BOOL v10 = v8 != 0;
  if (!v8)
  {
    BOOL v19 = sub_100021338();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/TransitPayFeatureDiscoveryMetadataStore.m";
      __int16 v25 = 1024;
      int v26 = 218;
      __int16 v27 = 2082;
      id v28 = "-[TransitPayFeatureDiscoveryMetadataStore _userHasBecomeLocalAndTipShouldDisplayInMarket:tipType:currentTip:]";
      __int16 v29 = 2082;
      id v30 = "nil == currentTip";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Current tip cannot be nil", buf, 0x26u);
    }

    GEOFindOrCreateLog();
    id v12 = (_TransitPayTipInteractionRecord *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/TransitPayFeatureDiscoveryMetadataStore.m";
      __int16 v25 = 1024;
      int v26 = 218;
      __int16 v27 = 2082;
      id v28 = "-[TransitPayFeatureDiscoveryMetadataStore _userHasBecomeLocalAndTipShouldDisplayInMarket:tipType:currentTip:]";
      __int16 v29 = 2082;
      id v30 = "nil == currentTip";
      _os_log_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Current tip cannot be nil", buf, 0x26u);
    }
    goto LABEL_18;
  }
  if (([v8 tipType] == 1 || objc_msgSend(v9, "tipType") == 2)
    && [v9 isTourist])
  {
    BOOL v11 = 0;
    if (a4 == 3 && !self->_isTourist)
    {
      id v12 = [[_TransitPayTipInteractionRecord alloc] initWithTipType:3 isTourist:self->_isTourist];
      tipInfoDictionary = self->_tipInfoDictionary;
      id v22 = 0;
      v14 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v22];
      id v15 = v22;
      if (v15)
      {
        id v16 = sub_100021338();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = [v15 localizedDescription];
          *(_DWORD *)buf = 138412290;
          v24 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "There was an error archiving the tip metadata: %@", buf, 0xCu);
        }
        id v18 = 0;
      }
      else
      {
        id v18 = v14;
      }

      unint64_t v20 = +[NSString stringWithFormat:@"%llu", a3];
      [(NSMutableDictionary *)tipInfoDictionary setObject:v18 forKey:v20];

      [(TransitPayFeatureDiscoveryMetadataStore *)self _persistData];
LABEL_18:

      BOOL v11 = v10;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_persistData
{
  defaultsDictionary = self->_defaultsDictionary;
  id v4 = [(NSMutableDictionary *)self->_tipInfoDictionary copy];
  [(NSMutableDictionary *)defaultsDictionary setObject:v4 forKey:@"TransitPayTipInfoDictionary"];

  id v6 = +[NSUserDefaults standardUserDefaults];
  id v5 = [(NSMutableDictionary *)self->_defaultsDictionary copy];
  [v6 setObject:v5 forKey:@"__internal__TransitPayTipInfoKey"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipInfoDictionary, 0);

  objc_storeStrong((id *)&self->_defaultsDictionary, 0);
}

@end