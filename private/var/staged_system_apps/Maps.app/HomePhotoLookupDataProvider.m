@interface HomePhotoLookupDataProvider
- (BOOL)active;
- (BOOL)hasInitialData;
- (GEOObserverHashTable)observers;
- (HomePhotoLookupDataProvider)initWithSuggestionsDataProvider:(id)a3;
- (SuggestionsDataProvider)suggestionsDataProvider;
- (id)_lookupKeyForEntry:(id)a3;
- (int64_t)resultForSuggestionsEntry:(id)a3;
- (void)_performLookups;
- (void)_pruneOldResults;
- (void)_setResult:(id)a3 forEntry:(id)a4;
- (void)_startLookupForEntry:(id)a3;
- (void)_updateResults:(id)a3 notifyObservers:(BOOL)a4;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)setActive:(BOOL)a3;
@end

@implementation HomePhotoLookupDataProvider

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (HomePhotoLookupDataProvider)initWithSuggestionsDataProvider:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HomePhotoLookupDataProvider;
  v6 = [(HomePhotoLookupDataProvider *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestionsDataProvider, a3);
    v8 = [(SuggestionsDataProvider *)v7->_suggestionsDataProvider observers];
    [v8 registerObserver:v7];

    ratingRequestSuggestions = v7->_ratingRequestSuggestions;
    v7->_ratingRequestSuggestions = (NSDictionary *)&__NSDictionary0__struct;

    uint64_t v10 = +[NSMutableSet set];
    inProgressLookups = v7->_inProgressLookups;
    v7->_inProgressLookups = (NSMutableSet *)v10;

    results = v7->_results;
    v7->_results = (NSDictionary *)&__NSDictionary0__struct;
  }
  return v7;
}

- (BOOL)hasInitialData
{
  return 1;
}

- (void)_performLookups
{
  if (self->_active)
  {
    v3 = [(SuggestionsDataProvider *)self->_suggestionsDataProvider suggestions];
    v4 = +[NSMutableDictionary dictionary];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v11 = [(HomePhotoLookupDataProvider *)self _lookupKeyForEntry:v10];
          if (v11) {
            [v4 setObject:v10 forKeyedSubscript:v11];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    v12 = [(NSDictionary *)self->_ratingRequestSuggestions allKeys];
    v13 = +[NSSet setWithArray:v12];

    objc_super v14 = [v4 allKeys];
    v15 = +[NSSet setWithArray:v14];

    if (v13 != v15 && ([v13 isEqual:v15] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_ratingRequestSuggestions, v4);
      v16 = +[NSMutableSet setWithSet:v15];
      [v16 minusSet:v13];
      ratingRequestSuggestions = self->_ratingRequestSuggestions;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1006AB0B0;
      v18[3] = &unk_1012F49D0;
      v18[4] = self;
      [(NSDictionary *)ratingRequestSuggestions enumerateKeysAndObjectsUsingBlock:v18];
      [(HomePhotoLookupDataProvider *)self _pruneOldResults];
    }
  }
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      [(HomePhotoLookupDataProvider *)self _performLookups];
    }
  }
}

- (int64_t)resultForSuggestionsEntry:(id)a3
{
  id v4 = a3;
  id v5 = [(HomePhotoLookupDataProvider *)self _lookupKeyForEntry:v4];
  if (v5)
  {
    if ([(NSMutableSet *)self->_inProgressLookups containsObject:v5])
    {
      int64_t v6 = 0;
    }
    else
    {
      id v7 = [(NSDictionary *)self->_results objectForKeyedSubscript:v5];
      uint64_t v8 = v7;
      if (v7)
      {
        uint64_t v12 = 0;
        v13 = &v12;
        uint64_t v14 = 0x2020000000;
        uint64_t v15 = 0;
        v10[4] = &v12;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1006AAF9C;
        v11[3] = &unk_1012F49A8;
        v11[4] = &v12;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1006AAFDC;
        v10[3] = &unk_1012EAC00;
        [v7 withValue:v11 orError:v10];
        int64_t v6 = v13[3];
        _Block_object_dispose(&v12, 8);
      }
      else
      {
        int64_t v6 = 0;
      }
    }
  }
  else
  {
    int64_t v6 = 2;
  }

  return v6;
}

- (id)_lookupKeyForEntry:(id)a3
{
  id v3 = a3;
  if (+[RatingRequestHomeAvailability shouldShowRatingRequestSuggestionsOnProactiveTray](RatingRequestHomeAvailability, "shouldShowRatingRequestSuggestionsOnProactiveTray")&& ([v3 type] == (id)21 || GEOConfigGetBOOL()))
  {
    id v4 = [v3 MKMapItem];
    if (v4
      && +[MKPOIEnrichmentAvailibility shouldShowPhotosCallToActionForMapItem:v4])
    {
      id v5 = [v3 uniqueIdentifier];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_startLookupForEntry:(id)a3
{
  id v5 = a3;
  int64_t v6 = sub_1000AA148();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v28 = v7;
    __int16 v29 = 2112;
    v30 = v9;
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@%@", buf, 0x20u);
  }
  uint64_t v10 = [(HomePhotoLookupDataProvider *)self _lookupKeyForEntry:v5];
  if (v10)
  {
    if (([(NSMutableSet *)self->_inProgressLookups containsObject:v10] & 1) == 0)
    {
      v11 = [(NSDictionary *)self->_results valueForKey:v10];
      BOOL v12 = v11 == 0;

      if (v12)
      {
        [(NSMutableSet *)self->_inProgressLookups addObject:v10];
        objc_initWeak((id *)buf, self);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1006AB484;
        v24[3] = &unk_1012F49F8;
        objc_copyWeak(&v26, (id *)buf);
        id v13 = v5;
        id v25 = v13;
        uint64_t v14 = objc_retainBlock(v24);
        uint64_t v15 = [v13 MKMapItem];
        if (v15)
        {
          v16 = sub_100018584();
          v17 = [v16 oneUser];
          v18 = [v15 _geoMapItem];
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_1006AB5A4;
          v21[3] = &unk_1012F4A48;
          v23 = v14;
          id v22 = v15;
          [v17 hasVisitedMapItem:v18 handler:v21];

          long long v19 = v23;
        }
        else
        {
          long long v19 = +[NSError errorWithDomain:@"HomePhotoLookupDataProviderErrorDomain" code:1 userInfo:0];
          long long v20 = +[Result resultWithError:v19];
          ((void (*)(void *, void *))v14[2])(v14, v20);
        }
        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
    }
  }
}

- (void)_setResult:(id)a3 forEntry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = sub_1000AA148();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    BOOL v12 = NSStringFromSelector(a2);
    int v17 = 138413058;
    v18 = v10;
    __int16 v19 = 2112;
    long long v20 = v12;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@, result = %@, entry = %@", (uint8_t *)&v17, 0x2Au);
  }
  id v13 = [(HomePhotoLookupDataProvider *)self _lookupKeyForEntry:v8];
  if (v13)
  {
    if ([(NSMutableSet *)self->_inProgressLookups containsObject:v13])
    {
      uint64_t v14 = [(NSDictionary *)self->_results valueForKey:v13];

      if (!v14)
      {
        [(NSMutableSet *)self->_inProgressLookups removeObject:v13];
        uint64_t v15 = [(NSDictionary *)self->_ratingRequestSuggestions objectForKeyedSubscript:v13];

        if (v15)
        {
          v16 = +[NSMutableDictionary dictionaryWithDictionary:self->_results];
          [v16 setObject:v7 forKeyedSubscript:v13];
          [(HomePhotoLookupDataProvider *)self _updateResults:v16 notifyObservers:1];
        }
      }
    }
  }
}

- (void)_pruneOldResults
{
  id v3 = [(NSDictionary *)self->_results allKeys];
  id v4 = +[NSMutableSet setWithArray:v3];

  id v5 = [(NSDictionary *)self->_ratingRequestSuggestions allKeys];
  int64_t v6 = +[NSSet setWithArray:v5];
  [v4 minusSet:v6];

  if ([v4 count])
  {
    id v7 = +[NSMutableDictionary dictionaryWithDictionary:self->_results];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        BOOL v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 removeObjectForKey:*(void *)(*((void *)&v15 + 1) + 8 * (void)v12) v15];
          BOOL v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    id v13 = (NSDictionary *)[v7 copy];
    results = self->_results;
    self->_results = v13;
  }
}

- (void)_updateResults:(id)a3 notifyObservers:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v6 = (NSDictionary *)a3;
  id v7 = v6;
  if (self->_results != v6)
  {
    uint64_t v11 = v6;
    unsigned __int8 v8 = -[NSDictionary isEqual:](v6, "isEqual:");
    id v7 = v11;
    if ((v8 & 1) == 0)
    {
      id v9 = (NSDictionary *)[(NSDictionary *)v11 copy];
      results = self->_results;
      self->_results = v9;

      id v7 = v11;
      if (self->_active && v4)
      {
        [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
        id v7 = v11;
      }
    }
  }
}

- (BOOL)active
{
  return self->_active;
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return self->_suggestionsDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_inProgressLookups, 0);

  objc_storeStrong((id *)&self->_ratingRequestSuggestions, 0);
}

@end