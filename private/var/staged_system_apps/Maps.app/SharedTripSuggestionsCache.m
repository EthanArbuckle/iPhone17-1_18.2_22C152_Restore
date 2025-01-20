@interface SharedTripSuggestionsCache
+ (id)sharedInstance;
- (BOOL)isRefreshing;
- (NSArray)suggestedContacts;
- (NSArray)suggestedRecipients;
- (NSDictionary)recipientsByHandle;
- (SharedTripSuggestionsCache)init;
- (id)suggestions;
- (void)_prepareForSuggestionsIfNeeded;
- (void)_provideAbandonmentFeedback;
- (void)_provideFeedbackForContact:(id)a3;
- (void)_refreshFreshSuggestions:(id)a3;
- (void)addObserver:(id)a3;
- (void)provideAbandonmentFeedback;
- (void)provideFeedbackForContact:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requestFreshSuggestions;
- (void)requestFreshSuggestionsWithSeedContacts:(id)a3;
@end

@implementation SharedTripSuggestionsCache

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D89D88;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_1016111E0 != -1) {
    dispatch_once(&qword_1016111E0, block);
  }
  v2 = (void *)qword_1016111D8;

  return v2;
}

- (SharedTripSuggestionsCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)SharedTripSuggestionsCache;
  v2 = [(SharedTripSuggestionsCache *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.Maps.SharedTrip.SuggestionsCache.Requests", v4);
    requestQueue = v3->_requestQueue;
    v3->_requestQueue = (OS_dispatch_queue *)v5;

    v7 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___SharedTripSuggestionsCacheObserver queue:&_dispatch_main_q];
    observers = v3->_observers;
    v3->_observers = v7;
  }
  return v3;
}

- (void)_prepareForSuggestionsIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if (!self->_suggester || !self->_predictionContext)
  {
    v3 = sub_100576A9C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache instantiating suggester and context", v8, 2u);
    }

    v4 = (_PSMapsSuggester *)objc_alloc_init((Class)_PSMapsSuggester);
    suggester = self->_suggester;
    self->_suggester = v4;

    v6 = (_PSMapsPredictionContext *)objc_alloc_init((Class)_PSMapsPredictionContext);
    predictionContext = self->_predictionContext;
    self->_predictionContext = v6;

    [(_PSMapsPredictionContext *)self->_predictionContext setBundleID:MapsAppBundleId];
  }
}

- (id)suggestions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_suggestions;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSArray)suggestedContacts
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_suggestedContacts;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSDictionary)recipientsByHandle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_recipientsByHandle;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_100576A9C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = v4;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [v6 performSelector:"accessibilityIdentifier"];
      objc_super v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138412290;
    v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache add observer: %@", buf, 0xCu);
  }
  [(GEOObserverHashTable *)self->_observers registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_100576A9C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = v4;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [v6 performSelector:"accessibilityIdentifier"];
      objc_super v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138412290;
    v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache remove observer: %@", buf, 0xCu);
  }
  [(GEOObserverHashTable *)self->_observers unregisterObserver:v4];
}

- (BOOL)isRefreshing
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_requestInProgress;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)requestFreshSuggestions
{
}

- (void)requestFreshSuggestionsWithSeedContacts:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL requestInProgress = self->_requestInProgress;
  id v6 = self->_lastFreshRequestDate;
  os_unfair_lock_unlock(&self->_lock);
  if (!requestInProgress)
  {
    if (v6
      && ([(NSDate *)v6 timeIntervalSinceNow], double v8 = fabs(v7), GEOConfigGetDouble(), v8 < v9))
    {
      double v11 = v9;
      v12 = sub_100576A9C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int location = 134217984;
        double location_4 = v11 - v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache ignoring request for fresh suggestions, %fs until permitted", (uint8_t *)&location, 0xCu);
      }
    }
    else
    {
      os_unfair_lock_lock(&self->_lock);
      self->_BOOL requestInProgress = 1;
      os_unfair_lock_unlock(&self->_lock);
      objc_initWeak((id *)&location, self);
      requestQueue = self->_requestQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100D8A580;
      v13[3] = &unk_1012E6690;
      objc_copyWeak(&v15, (id *)&location);
      id v14 = v4;
      dispatch_async(requestQueue, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)&location);
    }
  }
}

- (void)_refreshFreshSuggestions:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  [(GEOObserverHashTable *)self->_observers suggestionsWillUpdateInCache:self];
  [(SharedTripSuggestionsCache *)self _prepareForSuggestionsIfNeeded];
  dispatch_queue_t v5 = +[NSDate date];
  [(_PSMapsPredictionContext *)self->_predictionContext setSuggestionDate:v5];

  uint64_t v6 = sub_100099700(v4, &stru_101323B40);
  v56 = v4;
  if (v4) {
    [(_PSMapsPredictionContext *)self->_predictionContext setSeedContactIdentifiers:v6];
  }
  v57 = (void *)v6;
  id v59 = objc_alloc_init((Class)NSMutableDictionary);
  id v58 = objc_alloc_init((Class)NSMutableArray);
  uint64_t UInteger = GEOConfigGetUInteger();
  double v8 = sub_100576A9C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = [(_PSMapsPredictionContext *)self->_predictionContext seedContactIdentifiers];
    *(_DWORD *)buf = 134218242;
    uint64_t v68 = UInteger;
    __int16 v69 = 2112;
    id v70 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SharedTripSuggestionsCache starting to fetch max %lu suggestions with seed contacts: %@", buf, 0x16u);
  }
  v55 = self;
  objc_super v10 = [(_PSMapsSuggester *)self->_suggester suggestionsFromContext:self->_predictionContext maxSuggestions:UInteger];
  double v11 = sub_100576A9C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v10 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v68 = (uint64_t)v12;
    __int16 v69 = 2112;
    id v70 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SharedTripSuggestionsCache %lu fetched suggestions: %@", buf, 0x16u);
  }

  v13 = +[MSPSharedTripService sharedInstance];
  id v14 = [v13 sharingIdentity];
  id v15 = [v14 aliases];

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v10;
  id v16 = v10;
  id v17 = [v16 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v63;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v63 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        v22 = [v21 groupName:obj];

        if (!v22)
        {
          v23 = [v21 recipients];
          v24 = [v23 firstObject];

          v25 = [v24 handle];
          uint64_t v26 = [v15 containsObject:v25];

          if ((v26 & 1) == 0)
          {
            v27 = [v24 handle];

            if (v27)
            {
              id v28 = objc_alloc((Class)MSPSharedTripContact);
              v29 = [v24 contact];
              v30 = [v24 handle];
              id v31 = [v28 initWithContact:v29 handle:v30];

              goto LABEL_23;
            }
            v60[0] = _NSConcreteStackBlock;
            v60[1] = 3221225472;
            v60[2] = sub_100D8AD44;
            v60[3] = &unk_101323B68;
            id v32 = v24;
            id v61 = v32;
            id v33 = [v57 indexOfObjectWithOptions:2 passingTest:v60];
            if (v33 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v34 = [v32 contact];
              v35 = +[MSPSharedTripContact contactsFromCNContact:v34];
              id v31 = [v35 firstObject];

              v36 = sub_100576A9C();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v68 = (uint64_t)v31;
                v37 = v36;
                v38 = "Recipient suggestion did not come with a handle; using first handle in contact page: %@";
                goto LABEL_21;
              }
            }
            else
            {
              id v31 = [v56 objectAtIndex:v33];
              v36 = sub_100576A9C();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v68 = (uint64_t)v31;
                v37 = v36;
                v38 = "Recipient suggestion did not come with a handle; using last seeded contact: %@";
LABEL_21:
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v38, buf, 0xCu);
              }
            }

            v29 = v61;
LABEL_23:

            if (v31)
            {
              [v58 addObject:v31];
              v39 = [v31 handleForIDS];
              [v59 setObject:v24 forKeyedSubscript:v39];
            }
          }

          continue;
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v18);
  }

  v40 = sub_100576A9C();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v68 = (uint64_t)v58;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "SharedTripSuggestionsCache resolved suggested contacts: %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&v55->_lock);
  uint64_t v41 = +[NSDate date];
  lastFreshRequestDate = v55->_lastFreshRequestDate;
  v55->_lastFreshRequestDate = (NSDate *)v41;

  objc_storeStrong((id *)&v55->_suggestions, obj);
  v43 = (NSArray *)[v58 copy];
  suggestedContacts = v55->_suggestedContacts;
  v55->_suggestedContacts = v43;

  v45 = (NSDictionary *)[v59 copy];
  recipientsByHandle = v55->_recipientsByHandle;
  v55->_recipientsByHandle = v45;

  v55->_BOOL requestInProgress = 0;
  os_unfair_lock_unlock(&v55->_lock);
  id v47 = v58;
  unint64_t v48 = GEOConfigGetUInteger();
  v49 = v47;
  if ((unint64_t)[v47 count] > v48)
  {
    v49 = [v47 subarrayWithRange:0, v48];
  }
  v50 = sub_100576A9C();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    id v51 = [v49 count];
    id v52 = [v47 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v68 = (uint64_t)v51;
    __int16 v69 = 2048;
    id v70 = v52;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "SharedTripSuggestionsCache will request capabilities for %lu/%lu fetched suggestions", buf, 0x16u);
  }

  v53 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
  [v53 requestCapabilityLevelsForContacts:v49];

  [(GEOObserverHashTable *)v55->_observers suggestionsDidUpdateInCache:v55];
}

- (void)provideFeedbackForContact:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_requestQueue);
  objc_initWeak(&location, self);
  requestQueue = self->_requestQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D8AE88;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(requestQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_provideFeedbackForContact:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  recipientsByHandle = self->_recipientsByHandle;
  id v6 = [v4 handleForIDS];
  double v7 = [(NSDictionary *)recipientsByHandle objectForKeyedSubscript:v6];

  id v8 = sub_100576A9C();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache providing feedback: engagement with suggestion %@", (uint8_t *)&v16, 0xCu);
    }

    objc_super v10 = [v7 contact];
    double v11 = [v10 identifier];
    id v12 = [v7 handle];
    uint64_t v13 = +[_PSMapsFeedbackAction engagementWithSuggestionWithContactIdentifier:v11 handle:v12];
  }
  else
  {
    if (v9)
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache providing feedback: engagement with non suggestion %@", (uint8_t *)&v16, 0xCu);
    }

    objc_super v10 = [v4 contact];
    double v11 = [v10 identifier];
    id v12 = [v4 stringValue];
    uint64_t v13 = +[_PSMapsFeedbackAction engagementWithNonSuggestionWithContactIdentifier:v11 handle:v12];
  }
  id v14 = (void *)v13;

  id v15 = [objc_alloc((Class)_PSMapsFeedback) initWithFeedbackAction:v14 predictionContext:self->_predictionContext suggestions:self->_suggestions];
  [(_PSMapsSuggester *)self->_suggester provideMapsFeedback:v15];
}

- (void)provideAbandonmentFeedback
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_requestQueue);
  objc_initWeak(&location, self);
  requestQueue = self->_requestQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100D8B1A0;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(requestQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_provideAbandonmentFeedback
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  v3 = sub_100576A9C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsCache providing feedback: abandonment", v6, 2u);
  }

  id v4 = +[_PSMapsFeedbackAction abandonment];
  id v5 = [objc_alloc((Class)_PSMapsFeedback) initWithFeedbackAction:v4 predictionContext:self->_predictionContext suggestions:self->_suggestions];
  [(_PSMapsSuggester *)self->_suggester provideMapsFeedback:v5];
}

- (NSArray)suggestedRecipients
{
  return self->_suggestedRecipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedRecipients, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_predictionContext, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_lastFreshRequestDate, 0);
  objc_storeStrong((id *)&self->_recipientsByHandle, 0);
  objc_storeStrong((id *)&self->_suggestedContacts, 0);

  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end