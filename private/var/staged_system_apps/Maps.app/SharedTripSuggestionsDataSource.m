@interface SharedTripSuggestionsDataSource
+ (void)prefetchSuggestionsAndCapabilitiesWithContext:(id)a3;
- (BOOL)includeActiveContacts;
- (BOOL)isContactSearchItemAtIndexPath:(id)a3;
- (BOOL)isRefreshing;
- (BOOL)showsContactSearchItem;
- (NSArray)contactsForDisplay;
- (NSArray)initiallyActiveHandles;
- (NSOrderedSet)activeContacts;
- (NSOrderedSet)changedContacts;
- (NSOrderedSet)orderedSuggestions;
- (NSOrderedSet)wereActiveContacts;
- (SharedTripContactSearchItem)contactSearchItem;
- (SharedTripSuggestionsDataSource)initWithSoftCellCap:(unint64_t)a3 includeActiveContacts:(BOOL)a4;
- (SharedTripSuggestionsDataSourceDelegate)delegate;
- (UITableView)tableView;
- (UITableViewDiffableDataSource)tableViewDataSource;
- (id)_recommendedContactsForDisplay;
- (id)contactForItemIdentifier:(id)a3;
- (id)contactForItemIndexPath:(id)a3;
- (id)contactSearchItemIdentifier;
- (id)findChangedContactsWithNewActiveSet:(id)a3 previousActiveSet:(id)a4;
- (int64_t)contactSearchItemPosition;
- (unint64_t)sharingStateForContact:(id)a3;
- (unint64_t)softCap;
- (void)_refreshWithActiveContacts:(id)a3;
- (void)_updateFromCache;
- (void)abandon;
- (void)addTableView:(id)a3 cellProvider:(id)a4;
- (void)clearTableView;
- (void)dataDidUpdate;
- (void)dataDidUpdateAnimatingChanges:(BOOL)a3;
- (void)dataWillUpdate;
- (void)dealloc;
- (void)resetContactsForDisplayOrdering;
- (void)setActiveContacts:(id)a3;
- (void)setChangedContacts:(id)a3;
- (void)setContactSearchItem:(id)a3;
- (void)setContactSearchItemPosition:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIncludeActiveContacts:(BOOL)a3;
- (void)setInitiallyActiveHandles:(id)a3;
- (void)setOrderedSuggestions:(id)a3;
- (void)setShowContactSearchItem:(BOOL)a3;
- (void)setSoftCap:(unint64_t)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewDataSource:(id)a3;
- (void)setWereActiveContacts:(id)a3;
- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4;
- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4;
- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3;
- (void)suggestionsDidUpdateInCache:(id)a3;
- (void)suggestionsWillUpdateInCache:(id)a3;
- (void)toggleContact:(id)a3;
- (void)toggleContact:(id)a3 startSharingCompletion:(id)a4 stopSharingCompletion:(id)a5;
@end

@implementation SharedTripSuggestionsDataSource

+ (void)prefetchSuggestionsAndCapabilitiesWithContext:(id)a3
{
  id v3 = a3;
  if (MSPSharedTripSharingAvailable())
  {
    v4 = [v3 automaticSharingContacts];
    if ([v4 count])
    {
      v5 = sub_100576A9C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        id v15 = [v4 count];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SharedTripSuggestionsDataSource:prefetch will prefetch %lu autoshare contacts", buf, 0xCu);
      }

      v6 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
      [v6 requestCapabilityLevelsForContacts:v4];
    }
    v7 = [v3 routingToContacts];
    if (v7)
    {
      v8 = sub_100576A9C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = v7;
        if ([v9 count])
        {
          v10 = [v9 componentsJoinedByString:@", "];
          v11 = +[NSString stringWithFormat:@"<%p> [%@]", v9, v10];
        }
        else
        {
          v11 = +[NSString stringWithFormat:@"<%p> (empty)", v9];
        }

        *(_DWORD *)buf = 138412290;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SharedTripSuggestionsDataSource:prefetch will provide routingToContacts: %@", buf, 0xCu);
      }
    }
    v12 = sub_100576A9C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SharedTripSuggestionsDataSource:prefetch will now prefetch suggestions+capabilities", buf, 2u);
    }

    v13 = +[SharedTripSuggestionsCache sharedInstance];
    [v13 requestFreshSuggestionsWithSeedContacts:v7];
  }
  else
  {
    v4 = sub_100576A9C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource will not prefetch suggestions/capabilities, sharing not available", buf, 2u);
    }
  }
}

- (SharedTripSuggestionsDataSource)initWithSoftCellCap:(unint64_t)a3 includeActiveContacts:(BOOL)a4
{
  v18.receiver = self;
  v18.super_class = (Class)SharedTripSuggestionsDataSource;
  v6 = [(SharedTripSuggestionsDataSource *)&v18 init];
  v7 = v6;
  if (v6)
  {
    v6->_softCap = a3;
    v6->_includeActiveContacts = a4;
    id v8 = objc_alloc((Class)NSOrderedSet);
    id v9 = +[MSPSharedTripService sharedInstance];
    v10 = [v9 receivers];
    id v11 = [v8 initWithArray:v10];
    [(SharedTripSuggestionsDataSource *)v7 setActiveContacts:v11];

    v12 = [(SharedTripSuggestionsDataSource *)v7 activeContacts];
    v13 = sub_100099700(v12, &stru_101312558);
    [(SharedTripSuggestionsDataSource *)v7 setInitiallyActiveHandles:v13];

    v14 = +[MSPSharedTripService sharedInstance];
    [v14 addSendingObserver:v7];

    id v15 = +[SharedTripSuggestionsCache sharedInstance];
    [v15 addObserver:v7];

    [(SharedTripSuggestionsDataSource *)v7 _updateFromCache];
    v16 = +[SharedTripSuggestionsCache sharedInstance];
    [v16 requestFreshSuggestions];
  }
  return v7;
}

- (void)dealloc
{
  id v3 = +[SharedTripSuggestionsCache sharedInstance];
  [v3 removeObserver:self];

  v4 = +[MSPSharedTripService sharedInstance];
  [v4 removeSendingObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SharedTripSuggestionsDataSource;
  [(SharedTripSuggestionsDataSource *)&v5 dealloc];
}

- (void)setSoftCap:(unint64_t)a3
{
  if (self->_softCap != a3)
  {
    self->_softCap = a3;
    [(SharedTripSuggestionsDataSource *)self dataDidUpdateAnimatingChanges:0];
  }
}

- (void)_updateFromCache
{
  id v3 = sub_100576A9C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource updating from cached suggestions", v7, 2u);
  }

  v4 = +[SharedTripSuggestionsCache sharedInstance];
  objc_super v5 = [v4 suggestedContacts];

  v6 = +[NSOrderedSet orderedSetWithArray:v5];
  [(SharedTripSuggestionsDataSource *)self setOrderedSuggestions:v6];
}

- (void)addTableView:(id)a3 cellProvider:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(SharedTripSuggestionsDataSource *)self tableView];

  if (v7 != v11)
  {
    [(SharedTripSuggestionsDataSource *)self setTableView:v11];
    id v8 = objc_alloc((Class)UITableViewDiffableDataSource);
    id v9 = sub_1005B3760(v6);
    id v10 = [v8 initWithTableView:v11 cellProvider:v9];
    [(SharedTripSuggestionsDataSource *)self setTableViewDataSource:v10];

    [(SharedTripSuggestionsDataSource *)self dataDidUpdate];
  }
}

- (void)clearTableView
{
  [(SharedTripSuggestionsDataSource *)self setTableViewDataSource:0];

  [(SharedTripSuggestionsDataSource *)self setTableView:0];
}

- (BOOL)isRefreshing
{
  v2 = +[SharedTripSuggestionsCache sharedInstance];
  unsigned __int8 v3 = [v2 isRefreshing];

  return v3;
}

- (void)suggestionsWillUpdateInCache:(id)a3
{
  v4 = sub_100576A9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource notified cache updated", v5, 2u);
  }

  [(SharedTripSuggestionsDataSource *)self dataWillUpdate];
}

- (void)suggestionsDidUpdateInCache:(id)a3
{
  v4 = sub_100576A9C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource notified cache updated", v5, 2u);
  }

  [(SharedTripSuggestionsDataSource *)self _updateFromCache];
  [(SharedTripSuggestionsDataSource *)self dataDidUpdate];
}

- (void)dataWillUpdate
{
  unsigned __int8 v3 = [(SharedTripSuggestionsDataSource *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SharedTripSuggestionsDataSource *)self delegate];
    [v5 suggestionsDataSourceWillUpdateContactsForDisplay:self];
  }
}

- (void)dataDidUpdate
{
}

- (void)dataDidUpdateAnimatingChanges:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SharedTripSuggestionsDataSource *)self tableViewDataSource];

  if (v5)
  {
    id v6 = [(SharedTripSuggestionsDataSource *)self contactsForDisplay];
    id v7 = +[NSDiffableDataSourceSnapshot _maps_singleSectionSnapshotWithIdentifiersForItems:v6];
    id v8 = [(SharedTripSuggestionsDataSource *)self changedContacts];
    id v9 = [v8 count];

    if (v9)
    {
      id v10 = [(SharedTripSuggestionsDataSource *)self changedContacts];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10098BDEC;
      v22[3] = &unk_101312580;
      v22[4] = self;
      id v11 = sub_100099700(v10, v22);

      [v7 reconfigureItemsWithIdentifiers:v11];
    }
    if ([(SharedTripSuggestionsDataSource *)self showsContactSearchItem])
    {
      v12 = [v7 sectionIdentifiers];
      v13 = [v12 firstObject];

      contactSearchItem = self->_contactSearchItem;
      v14 = contactSearchItem;
      id v15 = +[NSArray arrayWithObjects:&contactSearchItem count:1];
      id v16 = [v7 _maps_appendIdentifiersForSection:v14 items:v15];

      if (v13
        && (id)[(SharedTripSuggestionsDataSource *)self contactSearchItemPosition] == (id)2)
      {
        v17 = [(SharedTripSuggestionsDataSource *)self contactSearchItemIdentifier];
        [v7 moveSectionWithIdentifier:v17 beforeSectionWithIdentifier:v13];
      }
    }
    objc_super v18 = [(SharedTripSuggestionsDataSource *)self tableViewDataSource];
    [v18 applySnapshot:v7 animatingDifferences:v3];
  }
  v19 = sub_100576A9C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource data did update", v21, 2u);
  }

  v20 = [(SharedTripSuggestionsDataSource *)self delegate];
  [v20 suggestionsDataSourceDidUpdateContactsForDisplay:self];

  [(SharedTripSuggestionsDataSource *)self setChangedContacts:0];
}

- (BOOL)showsContactSearchItem
{
  if (!self->_showContactSearchItem) {
    return 0;
  }
  v2 = +[MSPSharedTripService sharedInstance];
  unsigned __int8 v3 = [v2 canAddReceivers];

  return v3;
}

- (void)setShowContactSearchItem:(BOOL)a3
{
  if (self->_showContactSearchItem != a3)
  {
    self->_showContactSearchItem = a3;
    if (a3)
    {
      char v4 = objc_alloc_init(SharedTripContactSearchItem);
      contactSearchItem = self->_contactSearchItem;
      self->_contactSearchItem = v4;
    }
    else
    {
      contactSearchItem = self->_contactSearchItem;
      self->_contactSearchItem = 0;
    }

    [(SharedTripSuggestionsDataSource *)self dataDidUpdate];
  }
}

- (id)contactSearchItemIdentifier
{
  contactSearchItem = self->_contactSearchItem;
  if (contactSearchItem)
  {
    contactSearchItem = sub_1000A4B98(contactSearchItem);
  }

  return contactSearchItem;
}

- (BOOL)isContactSearchItemAtIndexPath:(id)a3
{
  if (!self->_contactSearchItem) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(SharedTripSuggestionsDataSource *)self tableViewDataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v4];

  id v7 = [(SharedTripSuggestionsDataSource *)self contactSearchItemIdentifier];
  LOBYTE(v4) = [v6 isEqual:v7];

  return (char)v4;
}

- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_100576A9C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource notified didInvalidateWithError: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [(SharedTripSuggestionsDataSource *)self _refreshWithActiveContacts:&__NSArray0__struct];
}

- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3
{
  id v4 = a3;
  id v5 = sub_100576A9C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource notified didUpdateSendingAvailability", v7, 2u);
  }

  id v6 = [v4 receivers];

  [(SharedTripSuggestionsDataSource *)self _refreshWithActiveContacts:v6];
}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
  id v5 = a4;
  id v6 = sub_100576A9C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource notified didUpdateReceivers", v7, 2u);
  }

  [(SharedTripSuggestionsDataSource *)self _refreshWithActiveContacts:v5];
}

- (void)_refreshWithActiveContacts:(id)a3
{
  id v4 = a3;
  id v5 = [(SharedTripSuggestionsDataSource *)self activeContacts];
  id v6 = [v5 copy];
  [(SharedTripSuggestionsDataSource *)self setWereActiveContacts:v6];

  id v7 = [objc_alloc((Class)NSOrderedSet) initWithArray:v4];
  [(SharedTripSuggestionsDataSource *)self setActiveContacts:v7];
  id v8 = [(SharedTripSuggestionsDataSource *)self wereActiveContacts];
  id v9 = [(SharedTripSuggestionsDataSource *)self findChangedContactsWithNewActiveSet:v7 previousActiveSet:v8];
  [(SharedTripSuggestionsDataSource *)self setChangedContacts:v9];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = [(SharedTripSuggestionsDataSource *)self activeContacts];
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        if (![(NSArray *)self->_contactsForDisplay containsObject:*(void *)(*((void *)&v15 + 1) + 8 * i)])
        {
          [(SharedTripSuggestionsDataSource *)self resetContactsForDisplayOrdering];
          goto LABEL_11;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(SharedTripSuggestionsDataSource *)self dataDidUpdate];
}

- (id)findChangedContactsWithNewActiveSet:(id)a3 previousActiveSet:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSMutableOrderedSet orderedSetWithOrderedSet:v6];
  [v7 minusOrderedSet:v5];
  id v8 = +[NSMutableOrderedSet orderedSetWithOrderedSet:v5];

  [v8 minusOrderedSet:v6];
  id v9 = +[NSMutableOrderedSet orderedSetWithOrderedSet:v8];
  [v9 unionOrderedSet:v7];
  id v10 = sub_100576A9C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [v9 count];
    id v12 = [v8 valueForKeyPath:@"stringValue"];
    uint64_t v13 = [v7 valueForKeyPath:@"stringValue"];
    int v16 = 134218499;
    id v17 = v11;
    __int16 v18 = 2113;
    v19 = v12;
    __int16 v20 = 2113;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource found changed %lu contacts:\nremoved: %{private}@\nadded: %{private}@", (uint8_t *)&v16, 0x20u);
  }
  id v14 = [v9 copy];

  return v14;
}

- (id)_recommendedContactsForDisplay
{
  if ([(SharedTripSuggestionsDataSource *)self includeActiveContacts])
  {
    unsigned __int8 v3 = [(SharedTripSuggestionsDataSource *)self activeContacts];
    id v4 = [v3 mutableCopy];
  }
  else
  {
    id v4 = +[NSMutableOrderedSet orderedSet];
  }
  id v5 = [v4 count];
  if (v5 < (id)[(SharedTripSuggestionsDataSource *)self softCap])
  {
    id v6 = [(SharedTripSuggestionsDataSource *)self wereActiveContacts];
    id v7 = [v6 array];
    [v4 addObjectsFromArray:v7];

    id v8 = [(SharedTripSuggestionsDataSource *)self orderedSuggestions];
    id v9 = [v8 array];
    [v4 addObjectsFromArray:v9];

    id v10 = [v4 count];
    if (v10 > (id)[(SharedTripSuggestionsDataSource *)self softCap]) {
      [v4 removeObjectsInRange:[self softCap] count:[v4 count] - [self softCap]];
    }
  }
  if (![(SharedTripSuggestionsDataSource *)self includeActiveContacts])
  {
    id v11 = [(SharedTripSuggestionsDataSource *)self activeContacts];
    [v4 minusOrderedSet:v11];
  }

  return v4;
}

- (NSArray)contactsForDisplay
{
  unsigned __int8 v3 = +[MSPSharedTripService sharedInstance];
  unsigned __int8 v4 = [v3 canAddReceivers];

  if (v4)
  {
    v23 = +[NSMutableArray array];
    v22 = [(SharedTripSuggestionsDataSource *)self _recommendedContactsForDisplay];
    id v5 = +[NSMutableOrderedSet orderedSetWithOrderedSet:](NSMutableOrderedSet, "orderedSetWithOrderedSet:");
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obj = self->_contactsForDisplay;
    id v6 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_10098C9F0;
          v25[3] = &unk_1013125A8;
          v25[4] = v10;
          id v11 = [v5 indexOfObjectPassingTest:v25];
          if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v12 = [v5 objectAtIndexedSubscript:v11];
            [v23 addObject:v12];

            [v5 removeObject:v10];
          }
        }
        id v7 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v7);
    }

    uint64_t v13 = [v5 array];
    id v14 = v23;
    [v23 addObjectsFromArray:v13];

    long long v15 = sub_100576A9C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = [v23 valueForKeyPath:@"stringValue"];
      *(_DWORD *)buf = 138477827;
      v31 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "SharedTripSuggestionsDataSource calculated contacts for display: %{private}@", buf, 0xCu);
    }
    id v17 = (NSArray *)[v23 copy];
    contactsForDisplay = self->_contactsForDisplay;
    self->_contactsForDisplay = v17;

    v19 = self->_contactsForDisplay;
  }
  else
  {
    __int16 v20 = sub_100576A9C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "SharedTripSuggestionsDataSource only showing active contacts, unable to add receivers at this time", buf, 2u);
    }

    id v14 = [(SharedTripSuggestionsDataSource *)self activeContacts];
    v19 = [v14 array];
  }

  return v19;
}

- (void)resetContactsForDisplayOrdering
{
  unsigned __int8 v3 = sub_100576A9C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource reset contacts for display", v5, 2u);
  }

  contactsForDisplay = self->_contactsForDisplay;
  self->_contactsForDisplay = (NSArray *)&__NSArray0__struct;
}

- (void)toggleContact:(id)a3
{
}

- (void)toggleContact:(id)a3 startSharingCompletion:(id)a4 stopSharingCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[MSPSharedTripService sharedInstance];
  unsigned int v12 = [v11 isSharingWithContact:v8];

  uint64_t v13 = sub_100576A9C();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14)
    {
      long long v15 = [v8 stringValue];
      *(_DWORD *)buf = 138477827;
      v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource toggle contact off: %{private}@", buf, 0xCu);
    }
    int v16 = +[MSPSharedTripService sharedInstance];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10098CDFC;
    v29[3] = &unk_1012E76C0;
    id v17 = &v30;
    id v30 = v10;
    [v16 stopSharingWithContact:v8 completion:v29];

    __int16 v18 = [(SharedTripSuggestionsDataSource *)self initiallyActiveHandles];
    id v19 = [v18 mutableCopy];

    __int16 v20 = [v8 stringValue];
    [v19 removeObject:v20];

    id v21 = [v19 copy];
    [(SharedTripSuggestionsDataSource *)self setInitiallyActiveHandles:v21];
  }
  else
  {
    if (v14)
    {
      v22 = [v8 stringValue];
      *(_DWORD *)buf = 138477827;
      v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource toggle contact on: %{private}@", buf, 0xCu);
    }
    v23 = +[MSPSharedTripService sharedInstance];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10098CE14;
    v26[3] = &unk_1013125D0;
    id v17 = &v27;
    id v24 = v8;
    id v27 = v24;
    id v28 = v9;
    [v23 startSharingWithContact:v24 completion:v26];

    v25 = +[SharedTripSuggestionsCache sharedInstance];
    [v25 provideFeedbackForContact:v24];

    id v19 = v28;
  }
}

- (void)abandon
{
  v2 = sub_100576A9C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unsigned __int8 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource abandon", v4, 2u);
  }

  unsigned __int8 v3 = +[SharedTripSuggestionsCache sharedInstance];
  [v3 provideAbandonmentFeedback];
}

- (unint64_t)sharingStateForContact:(id)a3
{
  id v4 = a3;
  id v5 = +[MSPSharedTripService sharedInstance];
  unsigned int v6 = [v5 isSharingWithContact:v4];

  if (v6)
  {
    id v7 = [(SharedTripSuggestionsDataSource *)self activeContacts];
    if ([v7 containsObject:v4])
    {
      id v8 = [(SharedTripSuggestionsDataSource *)self initiallyActiveHandles];
      id v9 = [v4 stringValue];
      unsigned int v10 = [v8 containsObject:v9];

      if (v10) {
        unint64_t v11 = 2;
      }
      else {
        unint64_t v11 = 3;
      }
    }
    else
    {

      unint64_t v11 = 3;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (id)contactForItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  unsigned int v6 = [(SharedTripSuggestionsDataSource *)self activeContacts];

  if (v6)
  {
    id v7 = [(SharedTripSuggestionsDataSource *)self activeContacts];
    [v5 addObject:v7];
  }
  id v8 = [(SharedTripSuggestionsDataSource *)self wereActiveContacts];

  if (v8)
  {
    id v9 = [(SharedTripSuggestionsDataSource *)self wereActiveContacts];
    [v5 addObject:v9];
  }
  unsigned int v10 = [(SharedTripSuggestionsDataSource *)self orderedSuggestions];

  if (v10)
  {
    unint64_t v11 = [(SharedTripSuggestionsDataSource *)self orderedSuggestions];
    [v5 addObject:v11];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10098D280;
        v21[3] = &unk_1013125A8;
        id v22 = v4;
        id v18 = [v17 indexOfObjectPassingTest:v21];
        if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v19 = [v17 objectAtIndexedSubscript:v18];

          goto LABEL_17;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v19 = objc_alloc_init((Class)MSPSharedTripContact);
LABEL_17:

  return v19;
}

- (id)contactForItemIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SharedTripSuggestionsDataSource *)self tableViewDataSource];
  unsigned int v6 = [v5 itemIdentifierForIndexPath:v4];

  id v7 = [(SharedTripSuggestionsDataSource *)self contactForItemIdentifier:v6];

  return v7;
}

- (NSOrderedSet)changedContacts
{
  return self->_changedContacts;
}

- (void)setChangedContacts:(id)a3
{
}

- (int64_t)contactSearchItemPosition
{
  return self->_contactSearchItemPosition;
}

- (void)setContactSearchItemPosition:(int64_t)a3
{
  self->_contactSearchItemPosition = a3;
}

- (SharedTripSuggestionsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SharedTripSuggestionsDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)softCap
{
  return self->_softCap;
}

- (BOOL)includeActiveContacts
{
  return self->_includeActiveContacts;
}

- (void)setIncludeActiveContacts:(BOOL)a3
{
  self->_includeActiveContacts = a3;
}

- (NSOrderedSet)orderedSuggestions
{
  return self->_orderedSuggestions;
}

- (void)setOrderedSuggestions:(id)a3
{
}

- (NSOrderedSet)activeContacts
{
  return self->_activeContacts;
}

- (void)setActiveContacts:(id)a3
{
}

- (NSOrderedSet)wereActiveContacts
{
  return self->_wereActiveContacts;
}

- (void)setWereActiveContacts:(id)a3
{
}

- (NSArray)initiallyActiveHandles
{
  return self->_initiallyActiveHandles;
}

- (void)setInitiallyActiveHandles:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (UITableViewDiffableDataSource)tableViewDataSource
{
  return self->_tableViewDataSource;
}

- (void)setTableViewDataSource:(id)a3
{
}

- (SharedTripContactSearchItem)contactSearchItem
{
  return self->_contactSearchItem;
}

- (void)setContactSearchItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSearchItem, 0);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_initiallyActiveHandles, 0);
  objc_storeStrong((id *)&self->_wereActiveContacts, 0);
  objc_storeStrong((id *)&self->_activeContacts, 0);
  objc_storeStrong((id *)&self->_orderedSuggestions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_changedContacts, 0);

  objc_storeStrong((id *)&self->_contactsForDisplay, 0);
}

@end