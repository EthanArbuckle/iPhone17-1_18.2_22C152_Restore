@interface SearchResultsDataProvider
- (ActionCoordination)actionCoordinator;
- (BOOL)_isItemVenue:(id)a3;
- (BOOL)active;
- (BOOL)hasInitialData;
- (BOOL)isInVenueBrowseMode;
- (BOOL)isLoading;
- (GEOObserverHashTable)observers;
- (GEORelatedSearchSuggestion)currentSuggestion;
- (NSArray)searchResults;
- (NSArray)suggestions;
- (NSString)errorString;
- (RelatedSearchSuggestion)relatedSuggestion;
- (SearchInfo)searchInfo;
- (SearchResultsDataProvider)init;
- (id)_identifierForMapItem:(id)a3;
- (id)_identifierForVenueCardItem:(id)a3;
- (id)_orderedCurrentSearchResults;
- (id)_searchSessionErrorString;
- (id)venueProviderForMapItem:(id)a3;
- (void)_notifyObservers;
- (void)_setSearchSession:(id)a3;
- (void)_updateAndNotifyObservers:(BOOL)a3;
- (void)_updateCurrentSearchSession;
- (void)addVenueProviderForMapItem:(id)a3;
- (void)dealloc;
- (void)downloadVenueInfoForMapItem:(id)a3;
- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5;
- (void)performSearchForSuggestion:(id)a3;
- (void)presentVenueWithVenueCardItem:(id)a3;
- (void)searchSessionManagerReceiveEVChargersUpdate:(id)a3;
- (void)searchSessionManagerSessionDidFail;
- (void)searchSessionManagerSessionDidInvalidate;
- (void)searchSessionManagerSessionDidReceiveUpdate;
- (void)searchSessionManagerSessionWillPerformSearch;
- (void)selectCategory:(id)a3 forVenueWithVenueIdentifier:(id)a4;
- (void)setActionCoordinator:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)venueCategoryContentDownloader:(id)a3 didChangeMapItem:(id)a4;
- (void)venueCategoryContentDownloader:(id)a3 didFailToFetchMapItemWithError:(id)a4;
- (void)venueCategoryContentDownloader:(id)a3 didReceiveAutoCompleteSubcategories:(id)a4 subcategoriesType:(int)a5;
- (void)venueCategoryContentDownloader:(id)a3 didReceiveSearchResults:(id)a4 shouldSwitchToBestFloor:(BOOL)a5;
- (void)venueCategoryContentDownloaderDidCancel:(id)a3;
- (void)venueCategoryContentDownloaderDidFail:(id)a3;
- (void)venueCategoryContentDownloaderDidStart:(id)a3;
@end

@implementation SearchResultsDataProvider

- (SearchResultsDataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)SearchResultsDataProvider;
  v2 = [(SearchResultsDataProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    venues = v2->_venues;
    v2->_venues = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setActionCoordinator:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_actionCoordinator);
    objc_super v6 = [v5 searchSessionManager];
    [v6 removeObserver:self];

    id v7 = objc_storeWeak((id *)&self->_actionCoordinator, obj);
    v8 = [obj searchSessionManager];
    [v8 addObserver:self];

    [(SearchResultsDataProvider *)self _updateCurrentSearchSession];
  }
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
  v4 = [WeakRetained searchSessionManager];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SearchResultsDataProvider;
  [(SearchResultsDataProvider *)&v5 dealloc];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (!a3) {
      [(NSMutableDictionary *)self->_venues removeAllObjects];
    }
  }
}

- (BOOL)_isItemVenue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 mapItem];
    BOOL v5 = [v4 _venueFeatureType] == (id)1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSArray)searchResults
{
  if ([(SearchResultsDataProvider *)self isInVenueBrowseMode])
  {
    id v3 = [(NSMutableDictionary *)self->_venues allValues];
    v4 = [v3 firstObject];

    BOOL v5 = [v4 venueCardItem];
    objc_super v6 = [v5 venueMapItem];

    if (v6)
    {
      id v7 = [[SearchResult alloc] initWithMapItem:v6];
      v10 = v7;
      v8 = +[NSArray arrayWithObjects:&v10 count:1];

      goto LABEL_6;
    }
  }
  v8 = self->_searchResults;
LABEL_6:

  return v8;
}

- (BOOL)hasInitialData
{
  return 1;
}

- (BOOL)isInVenueBrowseMode
{
  return ![(NSArray *)self->_searchResults count]
      && [(NSMutableDictionary *)self->_venues count] == (id)1;
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  BOOL v76 = a3;
  BOOL v5 = sub_1000AA148();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    searchSession = self->_searchSession;
    BOOL active = self->_active;
    *(_DWORD *)buf = 138412546;
    v79 = searchSession;
    __int16 v80 = 1024;
    LODWORD(v81) = active;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will notify observers for Search Session: %@, Active: %d", buf, 0x12u);
  }

  if (self->_active)
  {
    int isLoading = self->_isLoading;
    unsigned int v9 = [(SearchSession *)self->_searchSession isLoading];
    if (isLoading != v9) {
      self->_int isLoading = [(SearchSession *)self->_searchSession isLoading];
    }
    v10 = [(SearchSession *)self->_searchSession currentResultsSearchInfo];
    aSelector = a2;
    if ([(SearchInfo *)v10 singleResultMode])
    {
      v11 = [(SearchInfo *)v10 results];
      v12 = [v11 firstObject];
      unsigned int v13 = [(SearchResultsDataProvider *)self _isItemVenue:v12];

      v14 = [(SearchSession *)self->_searchSession suggestion];

      int v15 = (v14 == 0) & ~v13;
    }
    else
    {
      int v15 = 0;
    }
    if ([(SearchSession *)self->_searchSession isSpotlightPunchInSearch])
    {
      v16 = +[UIDevice currentDevice];
      id v17 = [v16 userInterfaceIdiom];

      if (v17 == (id)5) {
        int v15 = 0;
      }
    }
    if (v10 == self->_searchInfo)
    {
      int v67 = 0;
      int v68 = 1;
    }
    else
    {
      unsigned int v18 = -[SearchInfo isEqual:](v10, "isEqual:");
      int v67 = v18 ^ 1;
      if ((v18 | v15))
      {
        int v68 = v18;
      }
      else
      {
        objc_storeStrong((id *)&self->_searchInfo, v10);
        if (!self->_originalSearchInfo) {
          objc_storeStrong((id *)&self->_originalSearchInfo, v10);
        }
        int v68 = 0;
      }
    }
    v19 = [(SearchSession *)self->_searchSession lastError];
    if (v19)
    {
    }
    else if ([(SearchInfo *)v10 searchResultType] != 2)
    {
      v20 = 0;
      goto LABEL_23;
    }
    v20 = [(SearchResultsDataProvider *)self _searchSessionErrorString];
LABEL_23:
    errorString = self->_errorString;
    if (errorString == v20 || ([(NSString *)errorString isEqual:v20] & 1) != 0)
    {
      int v66 = 1;
    }
    else
    {
      objc_storeStrong((id *)&self->_errorString, v20);
      int v66 = 0;
    }
    v22 = [(SearchResultsDataProvider *)self _orderedCurrentSearchResults];
    v75 = v22;
    if (v22 == self->_searchResults)
    {
      int v64 = 0;
      unsigned int v24 = 1;
    }
    else
    {
      v23 = v22;
      unsigned int v24 = -[NSArray isEqual:](v22, "isEqual:");
      int v64 = v24 ^ 1;
      if (((v24 | v15) & 1) == 0)
      {
        v25 = (NSArray *)[(NSArray *)v23 copy];
        searchResults = self->_searchResults;
        self->_searchResults = v25;

        [(NSMutableDictionary *)self->_venues removeAllObjects];
        unsigned int v65 = 0;
LABEL_34:
        if ([(SearchInfo *)v10 hasRelatedSearchSuggestion])
        {
          v27 = [RelatedSearchSuggestion alloc];
          [(SearchInfo *)v10 resultDisplayHeader];
          v29 = v28 = v20;
          v30 = [(SearchInfo *)v10 substitutes];
          [(SearchInfo *)v10 dymSuggestionVisibleTime];
          v32 = [(RelatedSearchSuggestion *)v27 initWithResultDisplayHeader:v29 substitutes:v30 visibleTime:[(SearchInfo *)v10 showDymSuggestionCloseButton] showCloseButton:v31];
          relatedSuggestion = self->_relatedSuggestion;
          self->_relatedSuggestion = v32;

          v20 = v28;
        }
        v34 = [self->_originalSearchInfo suggestions];
        uint64_t v35 = [self->_originalSearchInfo defaultSuggestion];
        if (v35 && [v34 count])
        {
          uint64_t v92 = v35;
          v36 = +[NSArray arrayWithObjects:&v92 count:1];
          v77 = [v36 arrayByAddingObjectsFromArray:v34];

          uint64_t v37 = [(SearchSession *)self->_searchSession suggestion];
          v38 = (void *)v37;
          if (v37) {
            v39 = (void *)v37;
          }
          else {
            v39 = (void *)v35;
          }
          v40 = v39;
        }
        else
        {
          v77 = 0;
          v40 = 0;
        }
        v71 = v40;
        v72 = (void *)v35;
        if (v40 == self->_currentSuggestion
          || (-[GEORelatedSearchSuggestion isEqual:](v40, "isEqual:") & 1) != 0)
        {
          int v41 = 0;
        }
        else
        {
          objc_storeStrong((id *)&self->_currentSuggestion, v40);
          int v41 = 1;
        }
        int v74 = v15;
        v73 = v34;
        if (v77 == self->_suggestions || (-[NSArray isEqual:](v77, "isEqual:") & 1) != 0)
        {
          int v42 = 0;
        }
        else
        {
          v43 = (NSArray *)[(NSArray *)v77 copy];
          suggestions = self->_suggestions;
          self->_suggestions = v43;

          int v42 = 1;
        }
        v45 = sub_1000AA148();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v63 = v10;
          v47 = (SearchSession *)objc_claimAutoreleasedReturnValue();
          v48 = NSStringFromSelector(aSelector);
          unsigned int v62 = v9;
          int v49 = isLoading;
          unsigned int v50 = [(NSArray *)self->_searchResults count];
          v51 = sub_100097E28(v67);
          sub_100097E28(v64);
          v52 = SEL aSelectora = (SEL)v20;
          v53 = sub_100097E28(v41);
          v54 = sub_100097E28(v42);
          v55 = self->_errorString;
          *(_DWORD *)buf = 138414082;
          v79 = v47;
          __int16 v80 = 2112;
          v81 = v48;
          __int16 v82 = 1024;
          *(_DWORD *)v83 = v50;
          int isLoading = v49;
          unsigned int v9 = v62;
          *(_WORD *)&v83[4] = 2112;
          *(void *)&v83[6] = v51;
          __int16 v84 = 2112;
          v85 = v52;
          __int16 v86 = 2112;
          v87 = v53;
          __int16 v88 = 2112;
          v89 = v54;
          __int16 v90 = 2112;
          v91 = v55;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%@ %@, # searchResults = %d, searchInfoDidChange = %@, searchResultsDidChange = %@, currentSuggetionDidChange = %@, suggestionsDidChange = %@, Error String: %@", buf, 0x4Eu);

          v20 = (NSString *)aSelectora;
          v10 = v63;
        }

        if (isLoading == v9 && ((v74 | v68 & v66 & v65) & 1) != 0)
        {
          [(SearchResultsDataProvider *)self _notifyObservers];
          v56 = sub_1000AA148();
          v58 = v72;
          v57 = v73;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            sub_100097E28(0);
            v59 = (SearchSession *)objc_claimAutoreleasedReturnValue();
            v60 = sub_100097E28(v74);
            NSUInteger v61 = [(NSArray *)v75 count];
            *(_DWORD *)buf = 138412802;
            v79 = v59;
            __int16 v80 = 2112;
            v81 = v60;
            __int16 v82 = 2048;
            *(void *)v83 = v61;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "loadingDidChange : %@ ignoredSingleResult: %@ Search result count: %ld", buf, 0x20u);
          }
        }
        else
        {
          v58 = v72;
          v57 = v73;
          if (v76) {
            [(SearchResultsDataProvider *)self _notifyObservers];
          }
        }

        return;
      }
    }
    unsigned int v65 = v24;
    if (!self->_searchSession && [(SearchResultsDataProvider *)self isInVenueBrowseMode])
    {
      [(NSMutableDictionary *)self->_venues removeAllObjects];
      [(SearchResultsDataProvider *)self _notifyObservers];
    }
    goto LABEL_34;
  }
}

- (void)_notifyObservers
{
  id v3 = sub_1000AA148();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    observers = self->_observers;
    searchSession = self->_searchSession;
    BOOL active = self->_active;
    int v7 = 138412802;
    v8 = observers;
    __int16 v9 = 2112;
    v10 = searchSession;
    __int16 v11 = 1024;
    BOOL v12 = active;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Notifying observers : %@ for Search Session: %@, Active: %d", (uint8_t *)&v7, 0x1Cu);
  }

  if (self->_active) {
    [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
  }
}

- (void)searchSessionManagerReceiveEVChargersUpdate:(id)a3
{
}

- (id)_orderedCurrentSearchResults
{
  id v3 = [(SearchSession *)self->_searchSession currentResults];
  v4 = [(SearchSession *)self->_searchSession currentResultsSearchInfo];
  BOOL v5 = sub_100109E50();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v22 = 134218242;
    v23 = (SearchSession *)[v3 count];
    __int16 v24 = 2112;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[SearchResultsDataProvider] SearchResultsCount:%ld searchInfo: %@", (uint8_t *)&v22, 0x16u);
  }

  if (MapsFeature_IsEnabled_SearchAndDiscovery())
  {
    uint64_t v6 = [v4 searchSectionList];
    if (!v6) {
      goto LABEL_11;
    }
    int v7 = (void *)v6;
    v8 = [v4 searchSectionList];
    __int16 v9 = [v8 searchSections];
    id v10 = [v9 count];

    if (!v10)
    {
LABEL_11:
      id v17 = sub_100109E50();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        searchSession = self->_searchSession;
        int v22 = 138412290;
        v23 = searchSession;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[SearchResultsDataProvider] Search session is missing section list: %@. Using alphabetical ordering.", (uint8_t *)&v22, 0xCu);
      }

      unsigned int v13 = [[AlphabeticallyOrderedDataSource alloc] initWithAlphabeticallySortableObject:v3];
      v14 = sub_100109E50();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      int v15 = [(AlphabeticallyOrderedDataSource *)v13 orderedObjects];
      v19 = (SearchSession *)[(SearchSession *)v15 count];
      int v22 = 134217984;
      v23 = v19;
      v16 = "[SearchResultsDataProvider] AlphabeticallyOrderedDataSource objects count: %ld";
      goto LABEL_15;
    }
    __int16 v11 = [SearchListOrderedDataSource alloc];
    BOOL v12 = [v4 searchSectionList];
    unsigned int v13 = [(SearchListOrderedDataSource *)v11 initWithObjects:v3 searchSectionList:v12];

    v14 = sub_1000AA148();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [(AlphabeticallyOrderedDataSource *)v13 orderedObjects];
      int v22 = 138412290;
      v23 = v15;
      v16 = "[SearchResultsDataProvider] ListOrderedDataSource objects: %@)";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v22, 0xCu);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if ([v4 sortOrder] == (id)1)
  {
    unsigned int v13 = [[AlphabeticallyOrderedDataSource alloc] initWithAlphabeticallySortableObject:v3];
    v14 = sub_1000AA148();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [(AlphabeticallyOrderedDataSource *)v13 orderedObjects];
      int v22 = 138412290;
      v23 = v15;
      v16 = "[SearchResultsDataProvider] AlphabeticallyOrderedDataSource objects: %@)";
      goto LABEL_15;
    }
LABEL_16:

    id v20 = [(AlphabeticallyOrderedDataSource *)v13 orderedObjects];

    goto LABEL_18;
  }
  id v20 = v3;
LABEL_18:

  return v20;
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    BOOL v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (id)_searchSessionErrorString
{
  uint64_t v3 = MKCurrentNetworkConnectionFailureDiagnosis();
  if ((unint64_t)(v3 - 1) < 3)
  {
    v4 = +[NSBundle mainBundle];
    BOOL v5 = v4;
    CFStringRef v6 = @"NoSearchResults_NoNetworkConnection_Mac";
LABEL_6:
    v2 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

    goto LABEL_7;
  }
  if (v3 == 4 || !v3)
  {
    v4 = +[NSBundle mainBundle];
    BOOL v5 = v4;
    CFStringRef v6 = @"no_result_key";
    goto LABEL_6;
  }
LABEL_7:

  return v2;
}

- (id)_identifierForMapItem:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "_maps_isVenueOrBuilding")
    && ([v3 _venueInfo],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 venueIdentifier],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 _hasVenueID],
        v5,
        v4,
        v6))
  {
    int v7 = [v3 _venueInfo];
    v8 = [v7 venueIdentifier];
    __int16 v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 venueID]);
  }
  else
  {
    __int16 v9 = 0;
  }

  return v9;
}

- (id)_identifierForVenueCardItem:(id)a3
{
  id v3 = a3;
  if ([v3 isVenueItem])
  {
    v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 venueID]);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)venueProviderForMapItem:(id)a3
{
  v4 = [(SearchResultsDataProvider *)self _identifierForMapItem:a3];
  if (v4)
  {
    BOOL v5 = [(NSMutableDictionary *)self->_venues objectForKeyedSubscript:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)downloadVenueInfoForMapItem:(id)a3
{
  id v5 = [(SearchResultsDataProvider *)self venueProviderForMapItem:a3];
  v4 = [(SearchResultsDataProvider *)self actionCoordinator];
  [v5 performSearchWithActionCoordination:v4];
}

- (void)addVenueProviderForMapItem:(id)a3
{
  id v10 = a3;
  v4 = -[SearchResultsDataProvider _identifierForMapItem:](self, "_identifierForMapItem:");
  id v5 = [(NSMutableDictionary *)self->_venues objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [[SearchResultVenueSubDataProvider alloc] initWithDelegate:self];
    [(NSMutableDictionary *)self->_venues setObject:v5 forKeyedSubscript:v4];
  }
  unsigned int v6 = [(SearchResultVenueSubDataProvider *)v5 venueCardItem];

  if (!v6)
  {
    int v7 = [v10 _browseCategories];
    v8 = [v7 firstObject];

    __int16 v9 = [[VenueSearchCardItem alloc] initWithMapItem:v10 searchCategory:v8];
    [(SearchResultVenueSubDataProvider *)v5 setVenueCardItem:v9];
  }
}

- (void)presentVenueWithVenueCardItem:(id)a3
{
  id v7 = a3;
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___VenueCategoryCardItem])
  {
    v4 = [(SearchResultsDataProvider *)self _identifierForVenueCardItem:v7];
    if (v4)
    {
      id v5 = [(NSMutableDictionary *)self->_venues objectForKeyedSubscript:v4];
      if (!v5)
      {
        id v5 = [[SearchResultVenueSubDataProvider alloc] initWithDelegate:self];
        [(NSMutableDictionary *)self->_venues setObject:v5 forKeyedSubscript:v4];
      }
    }
    else
    {
      id v5 = 0;
    }
    [(SearchResultVenueSubDataProvider *)v5 setVenueCardItem:v7];
    unsigned int v6 = [(SearchResultsDataProvider *)self actionCoordinator];
    [(SearchResultVenueSubDataProvider *)v5 performSearchWithActionCoordination:v6];
  }
  else
  {
    [v7 conformsToProtocol:&OBJC_PROTOCOL___VenueAutoCompleteCategoryCardItem];
  }
}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 venueCategoryItem];
  __int16 v11 = [v10 venueIdentifier];

  BOOL v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v11 venueID]);
  unsigned int v13 = v12;
  if (v12 && [v12 integerValue])
  {
    v14 = [(NSMutableDictionary *)self->_venues objectForKeyedSubscript:v13];
    int v15 = [v14 contentDownloader];
    if (v15)
    {
      v16 = [v8 venueCategoryItem];
      unsigned int v17 = [v16 isAutoCompleteCategory];

      if (v17) {
        [v15 searchDidReceiveAutoCompleteSubcategories:v9];
      }
      [v15 searchDidReceiveResults:v18];
    }
  }
}

- (void)selectCategory:(id)a3 forVenueWithVenueIdentifier:(id)a4
{
  id v6 = a3;
  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [a4 venueID]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(NSMutableDictionary *)self->_venues objectForKeyedSubscript:v9];
  [v7 setCurrentCategory:v6];

  id v8 = [(SearchResultsDataProvider *)self actionCoordinator];
  [v7 performSearchWithActionCoordination:v8];
}

- (void)performSearchForSuggestion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v8 = objc_alloc_init(SearchFieldItem);
    [(SearchFieldItem *)v8 setSuggestion:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
    [WeakRetained viewController:0 doSearchItem:v8 withUserInfo:0];

    [(SearchResultsDataProvider *)self _updateCurrentSearchSession];
    id v6 = +[MKMapService sharedService];
    id v7 = [v4 searchBarDisplayToken];

    [v6 captureUserAction:2020 onTarget:101 eventValue:v7];
  }
}

- (void)_updateCurrentSearchSession
{
  id v3 = [(SearchResultsDataProvider *)self actionCoordinator];
  id v4 = [v3 currentSearchSession];

  [(SearchResultsDataProvider *)self _setSearchSession:v4];
}

- (void)_setSearchSession:(id)a3
{
  id v4 = (SearchSession *)a3;
  id v5 = v4;
  if (self->_searchSession != v4 && (-[SearchSession isEqual:](v4, "isEqual:") & 1) == 0)
  {
    if ([(SearchSession *)v5 isInvalidated]) {
      id v6 = 0;
    }
    else {
      id v6 = v5;
    }
    searchSession = self->_searchSession;
    self->_searchSession = v6;

    originalSearchInfo = self->_originalSearchInfo;
    self->_originalSearchInfo = 0;

    relatedSuggestion = self->_relatedSuggestion;
    self->_relatedSuggestion = 0;
  }
  id v10 = sub_1000AA148();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = self->_searchSession;
    BOOL v12 = self->_originalSearchInfo;
    int v13 = 138412546;
    v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Updated Search Session : %@ Search Info: %@", (uint8_t *)&v13, 0x16u);
  }

  [(SearchResultsDataProvider *)self _updateAndNotifyObservers:1];
}

- (void)venueCategoryContentDownloaderDidStart:(id)a3
{
  id v4 = sub_1000AA148();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    id v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)venueCategoryContentDownloader:(id)a3 didChangeMapItem:(id)a4
{
  id v6 = a4;
  id v7 = sub_1000AA148();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = objc_opt_class();
    id v9 = v8;
    __int16 v10 = NSStringFromSelector(a2);
    int v18 = 138412546;
    v19 = v8;
    __int16 v20 = 2112;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v18, 0x16u);
  }
  __int16 v11 = [(SearchResultsDataProvider *)self _identifierForMapItem:v6];
  BOOL v12 = [(NSMutableDictionary *)self->_venues objectForKeyedSubscript:v11];
  int v13 = v12;
  if (v12)
  {
    v14 = [v12 venueCardItem];

    if (!v14)
    {
      __int16 v15 = [VenueSearchCardItem alloc];
      v16 = [v13 currentCategory];
      unsigned int v17 = [(VenueSearchCardItem *)v15 initWithMapItem:v6 searchCategory:v16];
      [v13 setVenueCardItem:v17];
    }
  }
}

- (void)venueCategoryContentDownloader:(id)a3 didFailToFetchMapItemWithError:(id)a4
{
  id v4 = a4;
  id v5 = sub_1000AA148();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ failed to download venue info with error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)venueCategoryContentDownloaderDidFail:(id)a3
{
  id v4 = sub_1000AA148();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    int v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    __int16 v9 = v5;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)venueCategoryContentDownloaderDidCancel:(id)a3
{
  id v4 = sub_1000AA148();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    int v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    __int16 v9 = v5;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)venueCategoryContentDownloader:(id)a3 didReceiveSearchResults:(id)a4 shouldSwitchToBestFloor:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = sub_1000AA148();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = objc_opt_class();
    id v12 = v11;
    int v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    __int16 v20 = v11;
    __int16 v21 = 2112;
    int v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);
  }
  if (v8)
  {
    venues = self->_venues;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1004837B0;
    v15[3] = &unk_1012EB8E0;
    id v16 = v8;
    id v17 = v9;
    int v18 = self;
    [(NSMutableDictionary *)venues enumerateKeysAndObjectsUsingBlock:v15];
  }
}

- (void)venueCategoryContentDownloader:(id)a3 didReceiveAutoCompleteSubcategories:(id)a4 subcategoriesType:(int)a5
{
  id v6 = sub_1000AA148();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = objc_opt_class();
    id v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v10 = 138412546;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    int v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)searchSessionManagerSessionDidFail
{
  id v3 = sub_1000AA148();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    searchSession = self->_searchSession;
    int v5 = 138412290;
    id v6 = searchSession;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Search Session did fail for session: %@", (uint8_t *)&v5, 0xCu);
  }

  [(SearchResultsDataProvider *)self _updateCurrentSearchSession];
}

- (void)searchSessionManagerSessionDidInvalidate
{
  id v3 = sub_1000AA148();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    searchSession = self->_searchSession;
    int v5 = 138412290;
    id v6 = searchSession;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Search Session did invalidate for session: %@", (uint8_t *)&v5, 0xCu);
  }

  [(SearchResultsDataProvider *)self _updateCurrentSearchSession];
}

- (void)searchSessionManagerSessionDidReceiveUpdate
{
  id v3 = sub_1000AA148();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    searchSession = self->_searchSession;
    int v5 = 138412290;
    id v6 = searchSession;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session did receive update for session: %@", (uint8_t *)&v5, 0xCu);
  }

  [(SearchResultsDataProvider *)self _updateCurrentSearchSession];
}

- (void)searchSessionManagerSessionWillPerformSearch
{
  id v3 = sub_1000AA148();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    searchSession = self->_searchSession;
    originalSearchInfo = self->_originalSearchInfo;
    int v6 = 138412546;
    int v7 = searchSession;
    __int16 v8 = 2112;
    id v9 = originalSearchInfo;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session will perform search: %@, original search info: %@", (uint8_t *)&v6, 0x16u);
  }

  [(SearchResultsDataProvider *)self _updateCurrentSearchSession];
}

- (BOOL)active
{
  return self->_active;
}

- (ActionCoordination)actionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  return (ActionCoordination *)WeakRetained;
}

- (SearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (GEORelatedSearchSuggestion)currentSuggestion
{
  return self->_currentSuggestion;
}

- (RelatedSearchSuggestion)relatedSuggestion
{
  return self->_relatedSuggestion;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_relatedSuggestion, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_originalSearchInfo, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_venues, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end