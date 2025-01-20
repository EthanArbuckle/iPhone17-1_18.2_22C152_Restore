@interface MessageListSearchViewController
+ (OS_os_log)log;
- (BOOL)_shouldSearchCurrentMailboxOnly;
- (BOOL)_shouldUpdateSearchForOptions:(int64_t)a3;
- (BOOL)canGenerateTopHitsForSearchSuggestionsViewController:(id)a3;
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)enablePresentationAnimation;
- (BOOL)generateCannedSuggestions;
- (BOOL)hasSuggestions;
- (BOOL)inSearchSession;
- (BOOL)isSearchSuggestionsVisible;
- (BOOL)isSearchViewController;
- (BOOL)isSearching;
- (BOOL)isSearchingFooterVisible;
- (BOOL)suggestersGeneratedSuggestions;
- (CGRect)currentKeyboardOverlap;
- (CSSuggestion)suggestionForInitialSearch;
- (EFCancelable)searchProgressViewDisplayCancellable;
- (EFDebouncer)indexingStatusDebouncer;
- (EFPromise)localSearchInitialLoadPromise;
- (EFPromise)localSearchRemotePromise;
- (EFPromise)remoteSearchInitialLoadPromise;
- (EFPromise)remoteSearchServerPromise;
- (EMCollectionItemID)lastSelectedTopHitItemID;
- (EMCoreAnalyticsCollector)analyticsCollector;
- (EMSenderRepository)senderRepository;
- (MFSearchProgressView)searchProgressView;
- (MFSearchSuggestionsViewControllable)suggestionsViewController;
- (MFSearchTokenTransformer)searchTokenTransformer;
- (MUISearchRecentSuggester)recentSuggester;
- (MUISearchRequestID)suggestionsIdentifier;
- (MUISearchSuggestionsGenerator)suggestionsGenerator;
- (MessageListSearchViewController)initWithMainScene:(id)a3 mailboxes:(id)a4 accountsProvider:(id)a5 favoritesShortcutsProvider:(id)a6 contactStore:(id)a7;
- (NSArray)lastVisibleIndexPaths;
- (NSDictionary)indexStatistics;
- (NSMutableDictionary)searchActivityPayloadDictionary;
- (NSString)lastPhrase;
- (NSTimer)beginSearchTimer;
- (UIView)snapshotViewForDismissal;
- (id)SectionCategoryForSuggestion:(id)a3;
- (id)_additionalBarButtonItems;
- (id)_allExcludedMailboxes;
- (id)_currentEditingStringForSearchBar:(id)a3;
- (id)_excludedMailboxes;
- (id)_identifierForInstantAnswerItemID:(id)a3;
- (id)_identifierForTopHitItemID:(id)a3;
- (id)_localMailboxPredicate;
- (id)_objectFromSelectionInSearchTextField:(id)a3;
- (id)_parsecSuggestionForSuggestion:(id)a3;
- (id)_phraseManagerForPhrase:(id)a3;
- (id)_scopeIdentifierForPeopleSuggestions;
- (id)_scopeTitlesForSearchAtom:(id)a3;
- (id)_searchTapToRadarButtonItem;
- (id)categoryForSuggestion:(id)a3;
- (id)categoryForTokenKind:(int64_t)a3;
- (id)messageListDataSource:(id)a3 sectionDataSourceForSection:(id)a4 objectID:(id)a5 messageList:(id)a6;
- (id)navigationController;
- (id)searchBar;
- (id)searchScopeForSuggestionCategoryScope:(id)a3;
- (id)searchTextField:(id)a3 itemProviderForCopyingToken:(id)a4;
- (id)sectionDataSourceConfigurationWithIdentifier:(id)a3 section:(id)a4 messageList:(id)a5;
- (id)splitViewController;
- (id)targetViewControllerForAction:(SEL)a3 sender:(id)a4;
- (id)toolbarItems;
- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3;
- (id)viewForKeyboardAvoidance:(id)a3;
- (unint64_t)_computeBGSystemTaskFeatureCheckpoint;
- (unint64_t)_countOfSuggestionAtomsInSearchbar:(id)a3;
- (unint64_t)countOfAtomsInLastSearch;
- (unint64_t)searchStartAbsoluteTime;
- (void)_addSuggestionToRecentSuggester:(id)a3;
- (void)_beginSearchWithRepresentedObjectsForInitialSearch;
- (void)_configureLayoutListConfiguration:(id)a3 atSection:(int64_t)a4;
- (void)_endSearchSession;
- (void)_generateSuggestionsForPhrase:(id)a3;
- (void)_getDefaultPersonScopeIdentifier:(id *)a3 alternativeScopeIdentifier:(id *)a4;
- (void)_initializeSearchUserActivity;
- (void)_notePredicateUpdated:(int64_t)a3;
- (void)_preheatCoreSpotlightModel;
- (void)_prepareSnapshotViewForDismissal;
- (void)_reportSearchQueryStateForScopeChange;
- (void)_resetGlobalScopeTitles;
- (void)_sceneDidEnterBackground;
- (void)_scheduleIndexStateStatistics;
- (void)_searchTapToRadarButtonSelected:(id)a3;
- (void)_sendAnalyticsForIndexState:(id)a3;
- (void)_startSearchSession;
- (void)_updateFooter;
- (void)_updateIndexStatistics;
- (void)_updateIndexStatisticsIfNeeded;
- (void)_updateSearchBarUsingSuggestionToken:(id)a3;
- (void)_updateSearchingCompletionState;
- (void)beginSearchWithQueryString:(id)a3 scope:(id)a4;
- (void)beginSearchWithSuggestion:(id)a3 scope:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)didDismissSearchController:(id)a3;
- (void)globalSearchScopeChanged:(int64_t)a3;
- (void)invokeTapToRadar;
- (void)keyboardAvoidance:(id)a3 adjustForFrameOverlap:(CGRect)a4;
- (void)loadView;
- (void)messageListDataSource:(id)a3 didUpdateWithChange:(id)a4 section:(id)a5 animated:(BOOL)a6;
- (void)messageListSectionDataSource:(id)a3 collectionFinishedSearching:(id)a4 remote:(BOOL)a5;
- (void)redrawSearchBarWithSuggestion:(id)a3;
- (void)reloadDataSource;
- (void)removeObservers;
- (void)reportDidGoToCommittedSearch;
- (void)reportInstantAnswerButtonSelected:(id)a3 cardSectionID:(id)a4 command:(id)a5;
- (void)reportInstantAnswerCardSelected:(id)a3 cardSectionID:(id)a4;
- (void)reportMessageListResultsFetchedIsFinished:(BOOL)a3;
- (void)reportQueryClearedEvent:(int64_t)a3;
- (void)reportSearchDidBecomeActive;
- (void)reportSearchEndedEvent:(int64_t)a3;
- (void)reportSearchQueryStateWithTriggerEvent:(unint64_t)a3 searchType:(unint64_t)a4;
- (void)reportSearchViewAppeared:(BOOL)a3 currentMailboxScope:(BOOL)a4;
- (void)reportSearchWillTerminate;
- (void)reportSuggestionSelected:(id)a3;
- (void)reportSuggestionsFetched:(id)a3;
- (void)reportSuggestionsVisible:(id)a3;
- (void)reportTopHitSelected:(id)a3;
- (void)reportVisibleMessageListResultsAlwaysReportItems:(BOOL)a3;
- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchSuggestionsViewController:(id)a3 deleteRecentSuggestion:(id)a4;
- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 instantAnswerSuggestion:(id)a5 cardSectionID:(id)a6 command:(id)a7;
- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5;
- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5 indexInformation:(id)a6;
- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5 indexInformation:(id)a6 topHitSuggestion:(id)a7;
- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5 instantAnswerSuggestion:(id)a6 cardSectionID:(id)a7;
- (void)searchSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4;
- (void)searchTokenScopeChanged:(int64_t)a3;
- (void)setAnalyticsCollector:(id)a3;
- (void)setBeginSearchTimer:(id)a3;
- (void)setCountOfAtomsInLastSearch:(unint64_t)a3;
- (void)setCurrentKeyboardOverlap:(CGRect)a3;
- (void)setEnablePresentationAnimation:(BOOL)a3;
- (void)setGenerateCannedSuggestions:(BOOL)a3;
- (void)setInSearchSession:(BOOL)a3;
- (void)setIndexStatistics:(id)a3;
- (void)setIndexingStatusDebouncer:(id)a3;
- (void)setIsSearchingFooterVisible:(BOOL)a3;
- (void)setLastPhrase:(id)a3;
- (void)setLastSelectedTopHitItemID:(id)a3;
- (void)setLastVisibleIndexPaths:(id)a3;
- (void)setLocalSearchInitialLoadPromise:(id)a3;
- (void)setLocalSearchRemotePromise:(id)a3;
- (void)setRecentSuggester:(id)a3;
- (void)setRemoteSearchInitialLoadPromise:(id)a3;
- (void)setRemoteSearchServerPromise:(id)a3;
- (void)setSearchActivityPayloadDictionary:(id)a3;
- (void)setSearchProgressView:(id)a3;
- (void)setSearchProgressViewDisplayCancellable:(id)a3;
- (void)setSearchStartAbsoluteTime:(unint64_t)a3;
- (void)setSearchSuggestionsVisible:(BOOL)a3;
- (void)setSearchTokenTransformer:(id)a3;
- (void)setSearching:(BOOL)a3;
- (void)setSenderRepository:(id)a3;
- (void)setSnapshotViewForDismissal:(id)a3;
- (void)setSuggestersGeneratedSuggestions:(BOOL)a3;
- (void)setSuggestionForInitialSearch:(id)a3;
- (void)setSuggestionsGenerator:(id)a3;
- (void)setSuggestionsIdentifier:(id)a3;
- (void)setSuggestionsViewController:(id)a3;
- (void)setToolbarItems:(id)a3 animated:(BOOL)a4;
- (void)setUpAppSwitcherObserver;
- (void)suggestionsGenerator:(id)a3 didCompleteRequestID:(id)a4;
- (void)suggestionsGenerator:(id)a3 didProduceResult:(id)a4;
- (void)textFieldDidChangeSelection:(id)a3;
- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateUserActivityState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)waitForLocalAndRemoteSearchCompletion:(id)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation MessageListSearchViewController

- (void)_scheduleIndexStateStatistics
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100147408;
  v3[3] = &unk_100609898;
  objc_copyWeak(&v4, &location);
  v2 = objc_retainBlock(v3);
  ef_xpc_activity_register();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (MessageListSearchViewController)initWithMainScene:(id)a3 mailboxes:(id)a4 accountsProvider:(id)a5 favoritesShortcutsProvider:(id)a6 contactStore:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v28.receiver = self;
  v28.super_class = (Class)MessageListSearchViewController;
  v15 = [(MessageListViewController *)&v28 initWithMainScene:v11 mailboxes:v12 accountsProvider:v13 favoritesShortcutsProvider:0 contactStore:v14 diagnosticsHelper:0];
  v16 = v15;
  if (v15)
  {
    *(unsigned char *)&v15->_flags |= 8u;
    v17 = objc_alloc_init(MFSearchTokenTransformer);
    searchTokenTransformer = v16->_searchTokenTransformer;
    v16->_searchTokenTransformer = v17;

    v19 = [v11 daemonInterface];
    v20 = [v19 senderRepository];
    [(MessageListSearchViewController *)v16 setSenderRepository:v20];

    [(MessageListSearchViewController *)v16 _scheduleIndexStateStatistics];
    [(MessageListSearchViewController *)v16 setInSearchSession:0];
    [(MessageListSearchViewController *)v16 setDidNotifyExtendedLaunchTracker:1];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v16);
    id v21 = objc_alloc((Class)EFDebouncer);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10013E8EC;
    v25[3] = &unk_100607F68;
    objc_copyWeak(&v26, &location);
    v22 = (EFDebouncer *)[v21 initWithTimeInterval:0 scheduler:1 startAfter:v25 block:5.0];
    indexingStatusDebouncer = v16->_indexingStatusDebouncer;
    v16->_indexingStatusDebouncer = v22;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (BOOL)isSearchViewController
{
  return 1;
}

- (void)setSenderRepository:(id)a3
{
}

- (void)setInSearchSession:(BOOL)a3
{
  self->_inSearchSession = a3;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013E868;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006998F8 != -1) {
    dispatch_once(&qword_1006998F8, block);
  }
  v2 = (void *)qword_1006998F0;

  return (OS_os_log *)v2;
}

- (void)dealloc
{
  [(NSTimer *)self->_beginSearchTimer invalidate];
  [(MUISearchSuggestionsGenerator *)self->_suggestionsGenerator cancel];
  [(EFDebouncer *)self->_indexingStatusDebouncer cancel];
  v3 = [(MessageListSearchViewController *)self localSearchInitialLoadPromise];
  [v3 cancel];

  id v4 = [(MessageListSearchViewController *)self localSearchRemotePromise];
  [v4 cancel];

  v5 = [(MessageListSearchViewController *)self remoteSearchInitialLoadPromise];
  [v5 cancel];

  v6 = [(MessageListSearchViewController *)self remoteSearchServerPromise];
  [v6 cancel];

  v7.receiver = self;
  v7.super_class = (Class)MessageListSearchViewController;
  [(MessageListViewController *)&v7 dealloc];
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)MessageListSearchViewController;
  [(MessageListSearchViewController *)&v13 loadView];
  v3 = +[NSUserDefaults standardUserDefaults];
  if ([v3 BOOLForKey:kMUILocalMailboxSearchOnlyKey]) {
    char v4 = 2;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v4;

  v5 = +[CSSuggestion emptySuggestion];
  [(MessageListSearchViewController *)self setCurrentSuggestion:v5];

  id v6 = objc_alloc_init((Class)EMCoreAnalyticsCollector);
  [(MessageListSearchViewController *)self setAnalyticsCollector:v6];

  objc_super v7 = sub_10013EC40(self);
  id v8 = [objc_alloc((Class)MUISearchSuggestionsGenerator) initWithSuggesters:v7 delegate:self];
  [(MessageListSearchViewController *)self setSuggestionsGenerator:v8];

  v9 = [(MessageListViewController *)self scene];
  v10 = [_TtC10MobileMail31SearchSuggestionsViewController alloc];
  id v11 = [(MessageListSearchViewController *)self contactStore];
  id v12 = [(SearchSuggestionsViewController *)v10 initWithMailScene:v9 contactStore:v11 delegate:self];
  [(MessageListSearchViewController *)self setSuggestionsViewController:v12];

  [(MessageListSearchViewController *)self _updateIndexStatisticsIfNeeded];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MessageListSearchViewController;
  [(MessageListViewController *)&v4 viewDidLoad];
  v3 = [(MessageListSearchViewController *)self collectionView];
  [v3 setKeyboardDismissMode:1];
  [v3 setSelectionFollowsFocus:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MessageListSearchViewController;
  [(MessageListViewController *)&v7 viewDidAppear:a3];
  if (![(MessageListSearchViewController *)self isSearchSuggestionsVisible]) {
    [(MessageListSearchViewController *)self reportSearchDidBecomeActive];
  }
  if (_os_feature_enabled_impl())
  {
    objc_super v4 = [(MessageListViewController *)self indexStatus];

    if (v4)
    {
      unint64_t v5 = [(MessageListSearchViewController *)self _computeBGSystemTaskFeatureCheckpoint];
      id v6 = +[MessageListSearchViewController log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Reporting Search Indexer feature checkpoint: %ld", buf, 0xCu);
      }

      +[BGSystemTaskCheckpoints reportFeatureCheckpoint:v5 forFeature:302 error:0];
    }
  }
}

- (void)setIndexStatistics:(id)a3
{
  id v7 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  unint64_t v5 = (NSDictionary *)[v7 copy];
  indexStatistics = v4->_indexStatistics;
  v4->_indexStatistics = v5;

  objc_sync_exit(v4);
}

- (NSDictionary)indexStatistics
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_indexStatistics;
  objc_sync_exit(v2);

  return v3;
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)MessageListSearchViewController;
  [(MessageListSearchViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(MessageListSearchViewController *)self suggestionsViewController];
  objc_super v4 = [(MessageListSearchViewController *)self collectionView];
  [v4 layoutMargins];
  [v3 updateLayoutMargins:];
}

- (void)_configureLayoutListConfiguration:(id)a3 atSection:(int64_t)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MessageListSearchViewController;
  [(MessageListViewController *)&v18 _configureLayoutListConfiguration:v6 atSection:a4];
  id v7 = [(MessageListSearchViewController *)self dataSource];
  unsigned int v8 = [v7 isSection:MessageListSectionIndexedSearch atIndex:a4];
  unsigned int v9 = [v7 isSection:MessageListSectionServerSearch atIndex:a4];
  int v10 = _os_feature_enabled_impl();
  unsigned int v11 = [v7 shouldDisplaySupplementaryKind:UICollectionElementKindSectionHeader forSectionAtIndex:a4];
  uint64_t v12 = (uint64_t)[v7 shouldDisplaySupplementaryKind:UICollectionElementKindSectionFooter forSectionAtIndex:a4];
  [v6 setFooterMode:0];
  if (!v10) {
    goto LABEL_8;
  }
  if (v9)
  {
    [v6 setHeaderMode:v11];
    goto LABEL_8;
  }
  if (!v8)
  {
LABEL_8:
    if (v12) {
      goto LABEL_9;
    }
    goto LABEL_14;
  }
  if (v12)
  {
    objc_super v13 = [(MessageListViewController *)self indexStatus];
    unsigned int v14 = [v13 isVisible];

    if (v14) {
      [v6 setFooterMode:1];
    }
LABEL_9:
    v15 = [(MessageListSearchViewController *)self searchProgressView];
    if ([v15 isAnimating])
    {
      v16 = [(MessageListViewController *)self indexStatus];
      unsigned __int8 v17 = [v16 isVisible];

      if ((v17 & 1) == 0)
      {
        uint64_t v12 = 1;
        [v6 setFooterMode:1];
        goto LABEL_14;
      }
    }
    else
    {
    }
    uint64_t v12 = 0;
  }
LABEL_14:
  [(MessageListSearchViewController *)self setIsSearchingFooterVisible:v12];
}

- (void)willPresentSearchController:(id)a3
{
  id v5 = [(MessageListViewController *)self conversationViewController];
  [v5 setDelegate:self];

  [(MessageListSearchViewController *)self setGenerateCannedSuggestions:1];
  *(unsigned char *)&self->_flags &= ~0x10u;
  [(MessageListSearchViewController *)self setSearching:0];
  [(MessageListSearchViewController *)self _preheatCoreSpotlightModel];
  [(MessageListSearchViewController *)self _resetGlobalScopeTitles];
  [(MessageListSearchViewController *)self _startSearchSession];
  [(MessageListSearchViewController *)self setSnapshotViewForDismissal:0];
  [(MessageListSearchViewController *)self setEnablePresentationAnimation:1];
  objc_super v4 = [(MessageListSearchViewController *)self suggestionForInitialSearch];

  if (v4) {
    [(MessageListSearchViewController *)self _beginSearchWithRepresentedObjectsForInitialSearch];
  }
  id v6 = [(MessageListSearchViewController *)self userActivity];
  [v6 becomeCurrent];
}

- (void)_preheatCoreSpotlightModel
{
  v2 = +[MessageListViewController log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "In MessageListSearchViewController, call +[CSUserQuery prepare] to preheat models and resources for semantic search", v4, 2u);
  }

  NSFileProtectionType v5 = NSFileProtectionComplete;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];
  +[CSUserQuery prepareProtectionClasses:v3];
}

- (void)_startSearchSession
{
  v3 = +[MSParsecSearchSession sharedSession];
  [(MessageListViewController *)self setSession:v3];

  [(MessageListSearchViewController *)self _updateIndexStatisticsIfNeeded];
  [(MessageListSearchViewController *)self reportSearchViewAppeared:1 currentMailboxScope:(*(unsigned char *)&self->_flags >> 1) & 1];

  [(MessageListSearchViewController *)self setUpAppSwitcherObserver];
}

- (void)viewWillAppear:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)MessageListSearchViewController;
  [(MessageListViewController *)&v22 viewWillAppear:a3];
  objc_super v4 = +[MFKeyboardAvoidance sharedController];
  [v4 registerKeyboardAvoidable:self];

  [(MessageListSearchViewController *)self setLastSelectedTopHitItemID:0];
  if ([(MessageListSearchViewController *)self enablePresentationAnimation])
  {
    NSFileProtectionType v5 = [(MessageListSearchViewController *)self view];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    unsigned int v14 = [(MessageListSearchViewController *)self navigationController];
    v15 = [v14 navigationBar];
    [v15 frame];
    double v17 = v9 + v16;

    objc_super v18 = [(MessageListSearchViewController *)self view];
    [v18 setFrame:v7, v17, v11, v13];

    v19 = [(MessageListSearchViewController *)self transitionCoordinator];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10013F8A4;
    v21[3] = &unk_1006095F0;
    v21[4] = self;
    *(double *)&v21[5] = v7;
    *(double *)&v21[6] = v9;
    *(double *)&v21[7] = v11;
    *(double *)&v21[8] = v13;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10013F92C;
    v20[3] = &unk_100606048;
    v20[4] = self;
    [v19 animateAlongsideTransition:v21 completion:v20];

    [(MessageListSearchViewController *)self setEnablePresentationAnimation:0];
  }
}

- (void)willDismissSearchController:(id)a3
{
  [(MessageListSearchViewController *)self _prepareSnapshotViewForDismissal];
  [(MessageListSearchViewController *)self setGenerateCannedSuggestions:0];
  [(MessageListSearchViewController *)self _notePredicateUpdated:0];
  *(unsigned char *)&self->_flags &= ~0x10u;
  [(MessageListSearchViewController *)self setSearching:0];
  [(MessageListSearchViewController *)self setLastSelectedTopHitItemID:0];
  objc_super v4 = +[CSSuggestion emptySuggestion];
  [(MessageListSearchViewController *)self setCurrentSuggestion:v4];

  [(MessageListViewController *)self setCurrentUserTypedPhrase:0];
  id v5 = objc_alloc((Class)MessageListDataSourceUpdateRequest);
  v11[0] = MessageListSectionIndexedSearch;
  v11[1] = MessageListSectionServerSearch;
  double v6 = +[NSArray arrayWithObjects:v11 count:2];
  id v7 = [v5 initWithSectionUpdates:0 sectionsToRemove:v6 startsWithEmptySnapshot:1];

  double v8 = [(MessageListSearchViewController *)self dataSource];
  [v8 applyMessageListDataSourceUpdate:v7];

  [(MessageListSearchViewController *)self _endSearchSession];
  double v9 = [(MessageListSearchViewController *)self beginSearchTimer];
  [v9 invalidate];

  [(MessageListSearchViewController *)self setBeginSearchTimer:0];
  [(MessageListSearchViewController *)self setLocalSearchInitialLoadPromise:0];
  [(MessageListSearchViewController *)self setLocalSearchRemotePromise:0];
  [(MessageListSearchViewController *)self setRemoteSearchInitialLoadPromise:0];
  [(MessageListSearchViewController *)self setRemoteSearchServerPromise:0];
  double v10 = [(MessageListSearchViewController *)self userActivity];
  [v10 resignCurrent];
}

- (void)_endSearchSession
{
  [(MessageListSearchViewController *)self reportSearchEndedEvent:2];

  [(MessageListSearchViewController *)self removeObservers];
}

- (void)didDismissSearchController:(id)a3
{
}

- (void)setSnapshotViewForDismissal:(id)a3
{
  p_snapshotViewForDismissal = &self->_snapshotViewForDismissal;
  id v5 = (UIView *)a3;
  if (*p_snapshotViewForDismissal != v5)
  {
    [(UIView *)*p_snapshotViewForDismissal removeFromSuperview];
    objc_storeStrong((id *)p_snapshotViewForDismissal, a3);
  }
}

- (void)_prepareSnapshotViewForDismissal
{
  id v14 = [(MessageListSearchViewController *)self view];
  v3 = [v14 snapshotViewAfterScreenUpdates:0];
  [(MessageListSearchViewController *)self setSnapshotViewForDismissal:v3];

  id v15 = [(MessageListSearchViewController *)self view];
  [v15 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(MessageListSearchViewController *)self snapshotViewForDismissal];
  [v12 setFrame:v5, v7, v9, v11];

  id v16 = [(MessageListSearchViewController *)self view];
  double v13 = [(MessageListSearchViewController *)self snapshotViewForDismissal];
  [v16 addSubview:v13];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MessageListSearchViewController *)self setInSearchSession:0];
  v24.receiver = self;
  v24.super_class = (Class)MessageListSearchViewController;
  [(MessageListViewController *)&v24 viewWillDisappear:v3];
  double v5 = +[MFKeyboardAvoidance sharedController];
  [v5 unregisterKeyboardAvoidable:self];

  double v6 = [(MessageListSearchViewController *)self searchBar];
  [v6 resignFirstResponder];

  double v7 = [(MessageListSearchViewController *)self snapshotViewForDismissal];

  if (v7)
  {
    double v8 = [(MessageListSearchViewController *)self view];
    [v8 frame];
    uint64_t v10 = v9;
    double v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;

    double v17 = [(MessageListSearchViewController *)self navigationController];
    objc_super v18 = [v17 navigationBar];
    [v18 frame];
    double v20 = v12 + v19;

    id v21 = [(MessageListSearchViewController *)self transitionCoordinator];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100140004;
    v23[3] = &unk_1006095F0;
    v23[4] = self;
    v23[5] = v10;
    *(double *)&v23[6] = v20;
    v23[7] = v14;
    v23[8] = v16;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10014008C;
    v22[3] = &unk_1006095F0;
    v22[4] = self;
    v22[5] = v10;
    *(double *)&v22[6] = v12;
    v22[7] = v14;
    v22[8] = v16;
    [v21 animateAlongsideTransition:v23 completion:v22];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MessageListSearchViewController;
  [(MessageListSearchViewController *)&v5 willMoveToParentViewController:v4];
  if (!v4) {
    [(MessageListSearchViewController *)self _generateSuggestionsForPhrase:0];
  }
}

- (id)splitViewController
{
  v8.receiver = self;
  v8.super_class = (Class)MessageListSearchViewController;
  BOOL v3 = [(MessageListSearchViewController *)&v8 splitViewController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(MessageListSearchViewController *)self presentingViewController];
    id v5 = [v6 splitViewController];
  }

  return v5;
}

- (id)navigationController
{
  v8.receiver = self;
  v8.super_class = (Class)MessageListSearchViewController;
  BOOL v3 = [(MessageListSearchViewController *)&v8 navigationController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(MessageListSearchViewController *)self presentingViewController];
    id v5 = [v6 navigationController];
  }

  return v5;
}

- (id)targetViewControllerForAction:(SEL)a3 sender:(id)a4
{
  id v6 = a4;
  double v7 = [(MessageListSearchViewController *)self presentingViewController];
  objc_super v8 = [v7 targetViewControllerForAction:a3 sender:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MessageListSearchViewController;
    id v10 = [(MessageListSearchViewController *)&v13 targetViewControllerForAction:a3 sender:v6];
  }
  double v11 = v10;

  return v11;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [(MessageListSearchViewController *)self presentingViewController];
  [v6 setToolbarItems:v7 animated:v4];
}

- (id)toolbarItems
{
  v2 = [(MessageListSearchViewController *)self presentingViewController];
  BOOL v3 = [v2 toolbarItems];

  return v3;
}

- (id)searchBar
{
  v2 = [(MessageListSearchViewController *)self parentViewController];
  BOOL v3 = [v2 searchBar];

  return v3;
}

- (id)_currentEditingStringForSearchBar:(id)a3
{
  BOOL v4 = [(MessageListSearchViewController *)self searchBar];
  id v5 = [v4 text];

  id v6 = [(MessageListViewController *)self inputLanguages];
  id v7 = [v5 ef_stringByRemovingWhitespaceAndUnbalancedQuotesForLanguages:v6];

  return v7;
}

- (unint64_t)_countOfSuggestionAtomsInSearchbar:(id)a3
{
  BOOL v3 = [a3 representedSuggestionTokens];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (void)_resetGlobalScopeTitles
{
  BOOL v3 = [(MessageListSearchViewController *)self searchBar];
  id v4 = v3;
  if (*(unsigned char *)&self->_flags)
  {
    [v3 setScopeButtonTitles:0];
  }
  else
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"ALL_MAILBOXES" value:&stru_100619928 table:@"Main"];
    v10[0] = v6;
    id v7 = +[NSBundle mainBundle];
    objc_super v8 = [v7 localizedStringForKey:@"CURRENT_MAILBOX" value:&stru_100619928 table:@"Main"];
    v10[1] = v8;
    uint64_t v9 = +[NSArray arrayWithObjects:v10 count:2];
    [v4 setScopeButtonTitles:v9];

    [v4 setSelectedScopeButtonIndex:((unint64_t)*(unsigned char *)&self->_flags >> 1) & 1];
  }
}

- (void)globalSearchScopeChanged:(int64_t)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | (2 * (a3 == 1));
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:(*(unsigned char *)&self->_flags >> 1) & 1 forKey:kMUILocalMailboxSearchOnlyKey];

  [(MessageListSearchViewController *)self _reportSearchQueryStateForScopeChange];

  [(MessageListSearchViewController *)self _notePredicateUpdated:2];
}

- (void)searchTokenScopeChanged:(int64_t)a3
{
  id v5 = [(MessageListSearchViewController *)self searchBar];
  id v6 = [v5 searchTextField];
  id v7 = [(MessageListSearchViewController *)self _objectFromSelectionInSearchTextField:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    [v8 setSelectedScopeIndex:a3];
    uint64_t v9 = [(MessageListSearchViewController *)self currentSuggestion];
    id v10 = [v8 csToken];
    double v11 = +[CSSuggestion updatedSuggestionWithCurrentSuggestion:v9 token:v10 scopeSelection:a3];

    [(MessageListSearchViewController *)self redrawSearchBarWithSuggestion:v11];
    double v12 = +[MessageListSearchViewController log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v13 = [v11 userQueryString];
      uint64_t v14 = +[EFPrivacy partiallyRedactedStringForString:v13];
      uint64_t v15 = [v11 suggestionTokens];
      int v16 = 138412802;
      double v17 = v11;
      __int16 v18 = 2112;
      double v19 = v14;
      __int16 v20 = 2112;
      id v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Suggestion was updated. Reason: Scope changed. Suggestion: %@ UserQueryString: %@ SuggestionTokens: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  [(MessageListSearchViewController *)self _reportSearchQueryStateForScopeChange];
  [(MessageListSearchViewController *)self _notePredicateUpdated:2];
}

- (void)beginSearchWithQueryString:(id)a3 scope:(id)a4
{
  id v7 = a4;
  id v6 = +[CSSuggestion mui_suggestionForSpotlightQueryWithString:a3];
  [(MessageListSearchViewController *)self beginSearchWithSuggestion:v6 scope:v7];
}

- (void)beginSearchWithSuggestion:(id)a3 scope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MessageListSearchViewController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "beginSearchWithSuggestion suggestion=%@, scope=%@", (uint8_t *)&v12, 0x16u);
  }

  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF3 | 4;
  [(MessageListSearchViewController *)self setSuggestionForInitialSearch:v6];
  int64_t v9 = +[MFSearchScope indexFromScopeKey:v7];
  id v10 = [(MessageListSearchViewController *)self searchBar];
  [v10 setSelectedScopeButtonIndex:v9];

  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | (2 * (v9 == 1));
  double v11 = [(MessageListSearchViewController *)self searchController];
  LODWORD(v10) = [v11 isActive];

  if (v10) {
    [(MessageListSearchViewController *)self _beginSearchWithRepresentedObjectsForInitialSearch];
  }
}

- (void)_beginSearchWithRepresentedObjectsForInitialSearch
{
  [(MessageListSearchViewController *)self searchBar];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100140E64;
  block[3] = &unk_1006047A0;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  id v4 = [(MessageListSearchViewController *)self suggestionForInitialSearch];
  if (v4)
  {
    [(MessageListSearchViewController *)self redrawSearchBarWithSuggestion:v4];
    [(MessageListSearchViewController *)self _addSuggestionToRecentSuggester:v4];
  }
  [(MessageListSearchViewController *)self setSearchSuggestionsVisible:0];
  *(unsigned char *)&self->_flags |= 8u;
  [(MessageListSearchViewController *)self _notePredicateUpdated:1];
  [(MessageListSearchViewController *)self setSuggestionForInitialSearch:0];
}

- (id)_objectFromSelectionInSearchTextField:(id)a3
{
  id v3 = a3;
  id v4 = [v3 selectedTextRange];
  if (v4)
  {
    id v5 = [v3 tokensInRange:v4];
    if ([v5 count] == (id)1)
    {
      id v6 = [v5 firstObject];
      id v7 = [v6 representedObject];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_scopeTitlesForSearchAtom:(id)a3
{
  id v3 = [a3 suggestion];
  id v4 = [v3 category];
  id v5 = [v4 scopes];

  if ((unint64_t)[v5 count] < 2)
  {
    id v6 = &__NSArray0__struct;
  }
  else
  {
    id v6 = [v5 ef_map:&stru_100609630];
  }

  return v6;
}

- (void)_addSuggestionToRecentSuggester:(id)a3
{
  id v7 = a3;
  id v4 = [(MessageListSearchViewController *)self recentSuggester];
  id v5 = [v7 copy];
  id v6 = +[MUISearchAtomSuggestion suggestionFromSpotlightSuggestion:v5 shouldShowAvaters:0];
  [v4 addSuggestion:v6];
}

- (id)_allExcludedMailboxes
{
  id v3 = +[EMMailbox predicateForMailboxType:1];
  v21[0] = v3;
  id v4 = +[EMMailbox predicateForMailboxType:3];
  v21[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v21 count:2];
  id v6 = +[NSCompoundPredicate orPredicateWithSubpredicates:v5];

  id v7 = +[EFPromise promise];
  id v8 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v6 sortDescriptors:&__NSArray0__struct];
  int64_t v9 = [(MessageListSearchViewController *)self mailboxRepository];
  int v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  __int16 v18 = sub_1001413A4;
  double v19 = &unk_100608300;
  id v10 = v7;
  id v20 = v10;
  [v9 performQuery:v8 completionHandler:&v16];

  double v11 = [v10 future:v16, v17, v18, v19];
  int v12 = [v11 result:0];

  if (v12) {
    id v13 = v12;
  }
  else {
    id v13 = &__NSArray0__struct;
  }
  id v14 = v13;

  return v14;
}

- (id)_excludedMailboxes
{
  id v3 = [(MessageListSearchViewController *)self mailboxes];
  id v4 = [(MessageListSearchViewController *)self _allExcludedMailboxes];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001414AC;
  v8[3] = &unk_100604E08;
  id v5 = v3;
  id v9 = v5;
  id v6 = [v4 ef_filter:v8];

  return v6;
}

- (void)_getDefaultPersonScopeIdentifier:(id *)a3 alternativeScopeIdentifier:(id *)a4
{
  id v6 = [(MessageListSearchViewController *)self mailboxes];
  unsigned int v7 = [v6 ef_any:&stru_100609650];

  if (v7)
  {
    id v8 = MFSearchSuggestionPeopleCategoryToScope;
    id v9 = 0;
    *a3 = v8;
  }
  else
  {
    *a3 = MFSearchSuggestionPeopleCategoryFromScope;
    id v9 = MFSearchSuggestionPeopleCategoryToScope;
  }
  *a4 = v9;
}

- (id)_scopeIdentifierForPeopleSuggestions
{
  id v6 = 0;
  id v7 = 0;
  [(MessageListSearchViewController *)self _getDefaultPersonScopeIdentifier:&v7 alternativeScopeIdentifier:&v6];
  id v2 = v7;
  id v3 = v6;
  id v4 = v2;

  return v4;
}

- (id)_phraseManagerForPhrase:(id)a3
{
  id v4 = a3;
  if ([(MessageListSearchViewController *)self _shouldSearchCurrentMailboxOnly]
    && ([(MessageListSearchViewController *)self mailboxes],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        v6))
  {
    id v7 = [(MessageListSearchViewController *)self mailboxes];
    id v8 = +[SearchMailboxSuggestion suggestionForMailboxes:v7];

    id v9 = [v8 category];
    id v10 = [v9 indexOfScopeWithIdentifier:MFSearchSuggestionMailboxCategoryScope];

    double v11 = +[MUISearchScopedSuggestion scopedSuggestion:v8 selectedScopeIndex:v10];
    id v20 = v11;
    int v12 = +[NSArray arrayWithObjects:&v20 count:1];
  }
  else
  {
    int v12 = 0;
  }
  id v13 = +[VIPManager defaultInstance];
  id v14 = [(MessageListSearchViewController *)self currentSuggestion];
  id v15 = [(MessageListSearchViewController *)self _excludedMailboxes];
  int v16 = [(MessageListViewController *)self inputLanguages];
  uint64_t v17 = [(MessageListViewController *)self session];
  __int16 v18 = +[MFSearchSuggestionPhraseManager phraseManagerWithPhrase:selectedSuggestions:vipManager:updatedSuggestion:filterQuery:implicitSuggestions:excludedMailboxes:inputLanguages:feedbackQueryID:](MFSearchSuggestionPhraseManager, "phraseManagerWithPhrase:selectedSuggestions:vipManager:updatedSuggestion:filterQuery:implicitSuggestions:excludedMailboxes:inputLanguages:feedbackQueryID:", v4, 0, v13, v14, 0, v12, v15, v16, [v17 feedbackQueryID]);

  return v18;
}

- (void)_generateSuggestionsForPhrase:(id)a3
{
  id v12 = a3;
  id v4 = [(MessageListSearchViewController *)self suggestionsGenerator];
  id v5 = [(MessageListSearchViewController *)self suggestionsIdentifier];
  [v4 stopGeneratingSuggestionsWithIdentifier:v5];

  [(MessageListSearchViewController *)self setSuggestionsIdentifier:0];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    *(unsigned char *)&self->_flags &= ~4u;
  }
  id v6 = [(MessageListSearchViewController *)self _phraseManagerForPhrase:v12];
  id v7 = [(MessageListSearchViewController *)self lastPhrase];
  id v8 = [(MessageListSearchViewController *)self suggestionsViewController];
  if ([v12 length])
  {
    if (!v7
      || [v12 localizedStandardRangeOfString:v7]
      && [v7 localizedStandardRangeOfString:v12])
    {
      [v8 clearSuggestions];
      id v9 = v12;
    }
    else
    {
      [v8 beginUpdatingSuggestions];
      id v9 = v12;
    }
  }
  else
  {
    [v8 clearSuggestions];
    id v9 = 0;
  }
  [(MessageListSearchViewController *)self setLastPhrase:v9];
  if (v12)
  {
    id v10 = [(MessageListSearchViewController *)self suggestionsGenerator];
    double v11 = [v10 startGeneratingSuggestionsUsingPhraseManager:v6];
    [(MessageListSearchViewController *)self setSuggestionsIdentifier:v11];
  }
}

- (void)setGenerateCannedSuggestions:(BOOL)a3
{
  if (self->_generateCannedSuggestions != a3)
  {
    self->_generateCannedSuggestions = a3;
    if (a3 && (*(unsigned char *)&self->_flags & 8) != 0)
    {
      [(MessageListSearchViewController *)self _generateSuggestionsForPhrase:0];
      [(MessageListSearchViewController *)self setSearchSuggestionsVisible:1];
    }
  }
}

- (void)waitForLocalAndRemoteSearchCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[MessageListSearchViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting for local and remote search to complete", buf, 2u);
  }

  id v6 = [(MessageListSearchViewController *)self localSearchInitialLoadPromise];
  id v7 = [v6 future];

  id v8 = [(MessageListSearchViewController *)self localSearchRemotePromise];
  id v9 = [v8 future];

  id v10 = [(MessageListSearchViewController *)self remoteSearchInitialLoadPromise];
  double v11 = [v10 future];

  id v12 = [(MessageListSearchViewController *)self remoteSearchServerPromise];
  id v13 = [v12 future];

  if (v7 && v9 && v11 && v13)
  {
    v29[0] = v7;
    v29[1] = v9;
    v29[2] = v11;
    v29[3] = v13;
    id v14 = +[NSArray arrayWithObjects:v29 count:4];
    id v15 = +[EFFuture combine:v14];

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    int v16 = +[EFScheduler mainThreadScheduler];
    __int16 v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_100141EE8;
    id v21 = &unk_100609678;
    objc_copyWeak(&v27, (id *)buf);
    id v22 = v7;
    id v23 = v9;
    id v24 = v11;
    id v25 = v13;
    id v26 = v4;
    [v15 onScheduler:v16 addSuccessBlock:&v18];

    uint64_t v17 = +[EFScheduler mainThreadScheduler];
    [v15 onScheduler:v17 addFailureBlock:&stru_100609698];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)isSearchSuggestionsVisible
{
  id v2 = [(MFSearchSuggestionsViewControllable *)self->_suggestionsViewController parentViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasSuggestions
{
  id v2 = [(MessageListSearchViewController *)self suggestionsViewController];
  unsigned __int8 v3 = [v2 hasSuggestions];

  return v3;
}

- (void)setSearchSuggestionsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MessageListSearchViewController *)self isSearchSuggestionsVisible];
  if (v3 || !v5)
  {
    BOOL v9 = !v3;
    if (!(v9 | v5))
    {
      if (self->_suggestionsViewController)
      {
        id v10 = [(MessageListSearchViewController *)self collectionView];
        [v10 setScrollsToTop:0];

        [(MessageListSearchViewController *)self addChildViewController:self->_suggestionsViewController];
        double v11 = [(MFSearchSuggestionsViewControllable *)self->_suggestionsViewController observableScrollView];
        [(MessageListSearchViewController *)self setContentScrollView:v11 forEdge:5];

        id v12 = [(MFSearchSuggestionsViewControllable *)self->_suggestionsViewController view];
        [v12 setAutoresizingMask:18];

        id v13 = [(MessageListSearchViewController *)self view];
        [v13 bounds];
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        id v22 = [(MFSearchSuggestionsViewControllable *)self->_suggestionsViewController view];
        [v22 setFrame:v15, v17, v19, v21];

        id v23 = [(MessageListSearchViewController *)self view];
        id v24 = [(MFSearchSuggestionsViewControllable *)self->_suggestionsViewController view];
        [v23 addSubview:v24];

        [(MFSearchSuggestionsViewControllable *)self->_suggestionsViewController didMoveToParentViewController:self];
        [(MessageListViewController *)self updateBarButtons];
      }
      else
      {
        id v25 = +[MessageListSearchViewController log];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10045B850(v25);
        }
      }
      BOOL v9 = 0;
    }
  }
  else
  {
    id v6 = [(MessageListSearchViewController *)self collectionView];
    [v6 setScrollsToTop:1];

    [(MFSearchSuggestionsViewControllable *)self->_suggestionsViewController willMoveToParentViewController:0];
    id v7 = [(MFSearchSuggestionsViewControllable *)self->_suggestionsViewController viewIfLoaded];
    [v7 removeFromSuperview];

    [(MFSearchSuggestionsViewControllable *)self->_suggestionsViewController removeFromParentViewController];
    id v8 = [(MessageListSearchViewController *)self collectionView];
    [(MessageListSearchViewController *)self setContentScrollView:v8 forEdge:5];

    [(MessageListViewController *)self updateBarButtons];
    [(MessageListSearchViewController *)self setLastSelectedTopHitItemID:0];
    BOOL v9 = !v3;
  }
  id v26 = [(MessageListSearchViewController *)self searchBar];
  [v26 setShowsProgress:v9];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v21 = a3;
  id v22 = [v21 searchBar];
  id v4 = -[MessageListSearchViewController _currentEditingStringForSearchBar:](self, "_currentEditingStringForSearchBar:");
  id v5 = [v4 length];
  id v6 = +[MessageListSearchViewController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MessageListViewController *)self currentUserTypedPhrase];
    id v8 = +[EFPrivacy partiallyRedactedStringForString:v7];
    BOOL v9 = [(MessageListSearchViewController *)self currentSuggestion];
    id v10 = +[EMCSLoggingAdditions publicDescriptionForSuggestion:v9];
    double v11 = [(MessageListSearchViewController *)self currentSuggestion];
    id v12 = [v11 suggestionTokens];
    *(_DWORD *)buf = 138412802;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    objc_super v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Searching with userString: %@ suggestion: %@ suggestionTokens: %@", buf, 0x20u);
  }
  if (v5
    || ([(MessageListSearchViewController *)self currentSuggestion],
        id v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = objc_msgSend(v13, "mui_isEmpty"),
        v13,
        !v14))
  {
    BOOL v16 = 0;
  }
  else if ([(MessageListSearchViewController *)self inSearchSession])
  {
    double v15 = [(MessageListSearchViewController *)self lastPhrase];
    BOOL v16 = v15 != 0;
  }
  else
  {
    BOOL v16 = 1;
  }
  if (![(MessageListSearchViewController *)self inSearchSession]) {
    [(MessageListSearchViewController *)self setInSearchSession:1];
  }
  if (v5) {
    unsigned int v17 = [v4 isEqualToString:self->_lastPhrase] ^ 1;
  }
  else {
    unsigned int v17 = 0;
  }
  if ((v16 | v17) == 1)
  {
    unsigned __int8 v18 = [(MessageListSearchViewController *)self generateCannedSuggestions];
    if (v5) {
      char v19 = 1;
    }
    else {
      char v19 = v18;
    }
    if ((v19 & 1) == 0)
    {
      *(unsigned char *)&self->_flags |= 4u;
      [(MessageListSearchViewController *)self setSearchSuggestionsVisible:0];
    }
    [(MessageListSearchViewController *)self _generateSuggestionsForPhrase:v4];
  }
  if ([(MessageListSearchViewController *)self _shouldUpdateSearchForOptions:2])
  {
    double v20 = [(MessageListSearchViewController *)self _countOfSuggestionAtomsInSearchbar:v22];
    if (v20)
    {
      if ((void *)[(MessageListSearchViewController *)self countOfAtomsInLastSearch] != v20) {
        [(MessageListSearchViewController *)self _notePredicateUpdated:2];
      }
    }
  }
}

- (BOOL)_shouldUpdateSearchForOptions:(int64_t)a3
{
  if ([(MessageListSearchViewController *)self isSearchSuggestionsVisible]) {
    return 0;
  }
  if (a3 == 2) {
    return (*(unsigned char *)&self->_flags & 0x10) != 0;
  }
  return 0;
}

- (void)_notePredicateUpdated:(int64_t)a3
{
  [(MessageListSearchViewController *)self _updateIndexStatisticsIfNeeded];
  id v23 = [(MessageListSearchViewController *)self searchBar];
  *(unsigned char *)&self->_flags &= ~1u;
  unsigned int v5 = [(MessageListSearchViewController *)self _shouldUpdateSearchForOptions:a3];
  if (a3 == 1) {
    int v6 = 1;
  }
  else {
    int v6 = v5;
  }
  [(MessageListSearchViewController *)self setSearching:0];
  if ([(MessageListSearchViewController *)self _shouldSearchCurrentMailboxOnly])
  {
    id v7 = [(MessageListSearchViewController *)self mailboxes];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [(MessageListSearchViewController *)self searchPredicateForMailboxes:v7];
  BOOL v9 = +[MessageListSearchViewController log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    double v11 = NSStringFromBOOL();
    id v12 = NSStringFromBOOL();
    *(_DWORD *)buf = 134218754;
    int64_t v25 = a3;
    __int16 v26 = 2114;
    id v27 = v10;
    __int16 v28 = 2114;
    v29 = v11;
    __int16 v30 = 2114;
    v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "notePredicateUpdated options:%lu shouldUpdateSearch:%{public}@ shouldStartSearch:%{public}@ hasCriterion:%{public}@", buf, 0x2Au);
  }
  if (v8) {
    int v13 = v6;
  }
  else {
    int v13 = 0;
  }
  if (v13 == 1)
  {
    unsigned int v14 = [(MessageListSearchViewController *)self localSearchInitialLoadPromise];
    [v14 cancel];

    double v15 = [(MessageListSearchViewController *)self localSearchRemotePromise];
    [v15 cancel];

    BOOL v16 = [(MessageListSearchViewController *)self remoteSearchInitialLoadPromise];
    [v16 cancel];

    unsigned int v17 = [(MessageListSearchViewController *)self remoteSearchServerPromise];
    [v17 cancel];

    unsigned __int8 v18 = +[EFPromise promise];
    [(MessageListSearchViewController *)self setLocalSearchInitialLoadPromise:v18];

    char v19 = +[EFPromise promise];
    [(MessageListSearchViewController *)self setLocalSearchRemotePromise:v19];

    double v20 = +[EFPromise promise];
    [(MessageListSearchViewController *)self setRemoteSearchInitialLoadPromise:v20];

    id v21 = +[EFPromise promise];
    [(MessageListSearchViewController *)self setRemoteSearchServerPromise:v21];

    id v22 = +[MessageListSearchViewController log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v25 = (int64_t)self;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "noteCriterionUpdated startingSearch: %@", buf, 0xCu);
    }

    [(MessageListSearchViewController *)self reloadDataSourceWithSearchPredicate:v8];
    [(MessageListSearchViewController *)self setSearching:1];
    *(unsigned char *)&self->_flags |= 0x10u;
    [(MessageListSearchViewController *)self setSearchStartAbsoluteTime:mach_absolute_time()];
    [(MessageListSearchViewController *)self setCountOfAtomsInLastSearch:[(MessageListSearchViewController *)self _countOfSuggestionAtomsInSearchbar:v23]];
    [(MessageListSearchViewController *)self _initializeSearchUserActivity];
  }
  if ((*(unsigned char *)&self->_flags & 0x20) == 0) {
    [(MessageListSearchViewController *)self _resetGlobalScopeTitles];
  }
}

- (void)_initializeSearchUserActivity
{
  id v11 = [(MessageListSearchViewController *)self mailboxes];
  BOOL v3 = [(MessageListSearchViewController *)self accountRepository];
  id v4 = [v11 firstObject];
  unsigned int v5 = [v4 accountIdentifier];
  int v6 = [v3 accountForIdentifier:v5];

  id v7 = [(MessageListSearchViewController *)self searchActivityPayloadDictionary];
  id v8 = [(MessageListViewController *)self continuityMailboxActivityPayloadFromMailboxes:v11 account:v6 currentActivityPayload:v7];

  [(MessageListSearchViewController *)self setSearchActivityPayloadDictionary:0];
  if (v8)
  {
    id v9 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v8];
    [(MessageListSearchViewController *)self setSearchActivityPayloadDictionary:v9];

    id v10 = [(MessageListSearchViewController *)self searchActivityPayloadDictionary];
    [v10 setObject:MSMailActivityHandoffTypeSearch forKeyedSubscript:MSMailActivityHandoffTypeKey];
  }
}

- (void)reloadDataSource
{
}

- (void)updateUserActivityState:(id)a3
{
  id v5 = a3;
  id v4 = [(MessageListSearchViewController *)self searchActivityPayloadDictionary];
  [v5 setUserInfo:v4];
}

- (id)_localMailboxPredicate
{
  id v2 = [(MessageListSearchViewController *)self mailboxes];
  BOOL v3 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:v2];

  return v3;
}

- (BOOL)_shouldSearchCurrentMailboxOnly
{
  return (*(unsigned char *)&self->_flags & 3) == 2;
}

- (MFSearchProgressView)searchProgressView
{
  searchProgressView = self->_searchProgressView;
  if (!searchProgressView)
  {
    id v4 = (MFSearchProgressView *)objc_alloc_init((Class)MFSearchProgressView);
    id v5 = self->_searchProgressView;
    self->_searchProgressView = v4;

    [(MFSearchProgressView *)self->_searchProgressView setAutoresizingMask:2];
    searchProgressView = self->_searchProgressView;
  }

  return searchProgressView;
}

- (void)setSearching:(BOOL)a3
{
  if (self->_searching != a3)
  {
    BOOL v3 = a3;
    id v5 = +[MessageListSearchViewController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"No";
      if (v3) {
        CFStringRef v6 = @"Yes";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating searching to %@", (uint8_t *)&v7, 0xCu);
    }

    self->_searching = v3;
    [(MessageListSearchViewController *)self _updateFooter];
  }
}

- (void)_updateFooter
{
  unsigned int v3 = [(MessageListSearchViewController *)self isSearching];
  if (v3 != [(MessageListSearchViewController *)self isSearchingFooterVisible])
  {
    id v4 = [(MessageListSearchViewController *)self searchProgressViewDisplayCancellable];
    [v4 cancel];

    id v5 = +[MessageListSearchViewController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"remove";
      if (v3) {
        CFStringRef v6 = @"add";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating footer to %@ the searching label.", buf, 0xCu);
    }

    int v7 = [(MessageListSearchViewController *)self searchProgressView];
    CFStringRef v8 = v7;
    if (v3)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      if ([v8 isAnimating])
      {
        id v9 = +[MessageListSearchViewController log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Searching label currently exists and is animated, nothing to do here.", v21, 2u);
        }
      }
      else
      {
        id v10 = +[MessageListSearchViewController log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Queuing animation of 'searching...' label", v21, 2u);
        }

        id v11 = +[EFScheduler mainThreadScheduler];
        double v15 = _NSConcreteStackBlock;
        uint64_t v16 = 3221225472;
        unsigned int v17 = sub_100143444;
        unsigned __int8 v18 = &unk_100604C00;
        objc_copyWeak(&v20, (id *)buf);
        id v19 = v8;
        id v12 = [v11 afterDelay:&v15 performBlock:1.0];
        -[MessageListSearchViewController setSearchProgressViewDisplayCancellable:](self, "setSearchProgressViewDisplayCancellable:", v12, v15, v16, v17, v18);

        objc_destroyWeak(&v20);
      }
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [v7 setAnimating:0 fade:0];

      [(MessageListSearchViewController *)self setSearchProgressViewDisplayCancellable:0];
    }
    int v13 = [(MessageListSearchViewController *)self collectionView];
    unsigned int v14 = [v13 collectionViewLayout];
    [v14 invalidateLayout];
  }
}

- (void)_updateSearchingCompletionState
{
  unsigned int v3 = [(MessageListSearchViewController *)self localSearchInitialLoadPromise];
  id v4 = [v3 future];
  id v5 = [v4 resultIfAvailable];

  CFStringRef v6 = [(MessageListSearchViewController *)self localSearchRemotePromise];
  int v7 = [v6 future];
  CFStringRef v8 = [v7 resultIfAvailable];

  id v9 = [(MessageListSearchViewController *)self remoteSearchServerPromise];
  id v10 = [v9 future];
  id v11 = [v10 resultIfAvailable];

  id v12 = [(MessageListSearchViewController *)self remoteSearchServerPromise];
  int v13 = [v12 future];
  unsigned int v14 = [v13 resultIfAvailable];

  if (v5) {
    BOOL v15 = v8 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  BOOL v17 = v15 || v14 == 0 || v11 == 0;
  uint64_t v18 = !v17;
  if (!v17)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    void v21[2] = sub_100143778;
    v21[3] = &unk_1006047A0;
    v21[4] = self;
    id v19 = +[EFScheduler mainThreadScheduler];
    [v19 performBlock:v21];
  }
  id v20 = [(MessageListSearchViewController *)self lastSelectedTopHitItemID];

  if (!v20) {
    [(MessageListSearchViewController *)self reportMessageListResultsFetchedIsFinished:v18];
  }
}

- (void)messageListSectionDataSource:(id)a3 collectionFinishedSearching:(id)a4 remote:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 section];
  id v11 = +[MessageListSearchViewController log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134218754;
    id v19 = self;
    __int16 v20 = 2114;
    id v21 = v10;
    __int16 v22 = 1024;
    LODWORD(v23[0]) = v5;
    WORD2(v23[0]) = 2114;
    *(void *)((char *)v23 + 6) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%p: Did finish search with section %{public}@ remote=%{BOOL}d collection %{public}@ ", (uint8_t *)&v18, 0x26u);
  }

  id v12 = [(MessageListSearchViewController *)self dataSource];
  int v13 = [v12 messageListForSection:v10];
  unsigned __int8 v14 = [v13 isEqual:v9];

  if (v14)
  {
    if ([v10 isEqual:MessageListSectionIndexedSearch])
    {
      if (v5) {
        [(MessageListSearchViewController *)self localSearchRemotePromise];
      }
      else {
        [(MessageListSearchViewController *)self localSearchInitialLoadPromise];
      }
    }
    else
    {
      if (![v10 isEqual:MessageListSectionServerSearch]) {
        goto LABEL_16;
      }
      if (v5) {
        [(MessageListSearchViewController *)self remoteSearchServerPromise];
      }
      else {
        [(MessageListSearchViewController *)self remoteSearchInitialLoadPromise];
      }
    BOOL v15 = };
    uint64_t v16 = +[NSNull null];
    [v15 finishWithResult:v16];

LABEL_16:
    [(MessageListSearchViewController *)self _updateSearchingCompletionState];
    goto LABEL_17;
  }
  BOOL v17 = +[MessageListSearchViewController log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v18 = 134218498;
    id v19 = self;
    __int16 v20 = 2114;
    id v21 = v10;
    __int16 v22 = 2114;
    v23[0] = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%p: Attempting to update section %{public}@ with outdated collection %{public}@", (uint8_t *)&v18, 0x20u);
  }

LABEL_17:
}

- (void)searchSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4
{
  id v8 = a4;
  *(unsigned char *)&self->_flags |= 4u;
  BOOL v5 = [(MessageListSearchViewController *)self recentSuggester];
  [v5 addSuggestion:v8];

  CFStringRef v6 = [v8 spotlightSuggestion];
  [(MessageListSearchViewController *)self redrawSearchBarWithSuggestion:v6];

  int v7 = [(MessageListSearchViewController *)self _parsecSuggestionForSuggestion:v8];
  [(MessageListSearchViewController *)self reportSuggestionSelected:v7];
  [(MessageListSearchViewController *)self setSearchSuggestionsVisible:0];
  [(MessageListSearchViewController *)self _notePredicateUpdated:1];
  [(MessageListSearchViewController *)self reportSearchQueryStateWithTriggerEvent:8 searchType:3];
}

- (void)searchSuggestionsViewController:(id)a3 deleteRecentSuggestion:(id)a4
{
  id v6 = a4;
  BOOL v5 = [(MessageListSearchViewController *)self recentSuggester];
  [v5 deleteSuggestion:v6];
}

- (id)_parsecSuggestionForSuggestion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 category];
  id v6 = +[MUISearchSuggestionCategory topHitsCategory];

  if (v5 == v6)
  {
    id v19 = v4;
    __int16 v20 = [v19 itemID];
    id v21 = [(MessageListSearchViewController *)self _identifierForTopHitItemID:v20];

    __int16 v22 = [v19 mailRankingSignals];

    [v19 message];
    if (v22) {
      id v23 = {;
    }
      id v24 = [v23 date];
      int64_t v25 = [v19 mailRankingSignals];
      __int16 v26 = +[MSParsecSearchSessionTopHit topHitWithIdentifier:v21 date:v24 mailRankingSignals:v25];
    }
    else {
      id v23 = {;
    }
      id v24 = [v23 date];
      __int16 v26 = +[MSParsecSearchSessionTopHit resultWithIdentifier:v21 date:v24];
    }
    goto LABEL_11;
  }
  int v7 = [v4 category];
  id v8 = +[MUISearchSuggestionCategory instantAnswersCategory];

  if (v7 == v8)
  {
    id v19 = v4;
    id v27 = [v19 itemID];
    id v21 = [(MessageListSearchViewController *)self _identifierForInstantAnswerItemID:v27];

    __int16 v28 = [v19 instantAnswer];
    v29 = [v28 flightInfoIsLive];

    id v23 = [v19 message];
    id v24 = [v23 date];
    __int16 v30 = [v19 feedbackInlineCard];
    __int16 v26 = +[MSParsecSearchSessionInstantAnswer instantAnswerWithIdentifier:v21 date:v24 inlineCard:v30 isInstantAnswerUpdated:v29 != 0];

LABEL_11:
    goto LABEL_26;
  }
  id v9 = [v4 category];
  id v10 = +[MUISearchSuggestionCategory documentCategory];
  id v11 = v9;
  if (v9 == v10)
  {
LABEL_13:

    goto LABEL_14;
  }
  id v12 = [v4 category];
  int v13 = +[MUISearchSuggestionCategory locationCategory];
  if (v12 == v13)
  {

    id v11 = v10;
    goto LABEL_13;
  }
  unsigned __int8 v14 = [v4 category];
  BOOL v15 = +[MUISearchSuggestionCategory linkCategory];

  if (v14 == v15)
  {
LABEL_14:
    v44 = +[NSString stringWithFormat:@"%p", v4];
    id v18 = 0;
    goto LABEL_15;
  }
  id v16 = v4;
  BOOL v17 = [v16 atomTitle];
  v44 = +[NSString stringWithFormat:@"%@-%p", v17, v16];

  id v18 = [v16 option];
LABEL_15:
  v31 = +[EFPrivacy fullyRedactedStringForString:v44];
  v32 = [(MessageListSearchViewController *)self categoryForSuggestion:v4];
  id v33 = objc_alloc_init((Class)SFMailResultDetails);
  v34 = [v4 spotlightSuggestion];
  v35 = [v34 score];
  [v33 setSuggestionScore:v35];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v36 = [v4 spotlightSuggestion];
  v37 = [v36 suggestionDataSources];

  id v38 = [v37 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v46;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(v37);
        }
        unsigned int v41 = [*(id *)(*((void *)&v45 + 1) + 8 * i) integerValue] - 1;
        if (v41 >= 4) {
          uint64_t v42 = 0;
        }
        else {
          uint64_t v42 = dword_1005A8030[v41];
        }
        [v33 setDataSources:v42];
      }
      id v38 = [v37 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v38);
  }

  __int16 v26 = +[MSParsecSearchSessionSuggestion suggestionWithIdentifier:v31 category:v32 option:v18 resultDetails:v33];

LABEL_26:

  return v26;
}

- (void)redrawSearchBarWithSuggestion:(id)a3
{
  id v8 = a3;
  -[MessageListSearchViewController setCurrentSuggestion:](self, "setCurrentSuggestion:");
  id v4 = [v8 userQueryString];
  [(MessageListViewController *)self setCurrentUserTypedPhrase:v4];
  BOOL v5 = [v8 currentTokens];
  id v6 = [v5 ef_map:&stru_1006096D8];

  [(MessageListSearchViewController *)self setLastPhrase:v4];
  int v7 = [(MessageListSearchViewController *)self searchBar];
  [v7 replaceSearchBarWithTokens:v6 userQueryString:v4];
}

- (BOOL)canGenerateTopHitsForSearchSuggestionsViewController:(id)a3
{
  return 1;
}

- (void)_updateSearchBarUsingSuggestionToken:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MessageListSearchViewController *)self currentSuggestion];
  id v6 = [v5 userQueryString];
  int v7 = +[NSCharacterSet controlCharacterSet];
  id v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = +[CSSuggestion emptySuggestion];
  id v10 = [v4 csToken];
  __int16 v20 = v10;
  id v11 = +[NSArray arrayWithObjects:&v20 count:1];
  id v12 = +[CSSuggestion updatedSuggestionWithCurrentSuggestion:v9 userString:v8 tokens:v11];

  int v13 = [(MessageListSearchViewController *)self currentSuggestion];
  unsigned __int8 v14 = +[CSSuggestion mui_mergeCurrentSuggestion:v13 suggestion:v12];

  [(MessageListSearchViewController *)self redrawSearchBarWithSuggestion:v14];
  BOOL v15 = [v14 userQueryString];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v11 = [v14 userQueryString];
    BOOL v17 = [v11 length] != 0;
  }
  else
  {
    BOOL v17 = 0;
  }
  [(MessageListSearchViewController *)self setSearchSuggestionsVisible:v17];
  if (isKindOfClass) {

  }
  if ([(MessageListSearchViewController *)self isSearchSuggestionsVisible])
  {
    id v18 = [(MessageListSearchViewController *)self currentSuggestion];
    id v19 = [v18 userQueryString];
    [(MessageListSearchViewController *)self _generateSuggestionsForPhrase:v19];
  }
  else
  {
    [(MessageListSearchViewController *)self _notePredicateUpdated:2];
  }
}

- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5 indexInformation:(id)a6 topHitSuggestion:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  [(MessageListSearchViewController *)self reloadDataSourceWithMessageList:v11 section:MessageListSectionIndexedSearch];
  int v13 = [(MessageListSearchViewController *)self _identifierForTopHitItemID:v10];
  unsigned __int8 v14 = [v12 mailRankingSignals];

  if (v14)
  {
    BOOL v15 = [v12 message];
    id v16 = [v15 date];
    BOOL v17 = [v12 mailRankingSignals];
    id v18 = +[MSParsecSearchSessionTopHit topHitWithIdentifier:v13 date:v16 mailRankingSignals:v17];
  }
  else
  {
    BOOL v15 = [(MessageListSearchViewController *)self _identifierForTopHitItemID:v10];
    id v18 = +[MSParsecSearchSessionTopHit resultWithIdentifier:v15];
  }

  [(MessageListSearchViewController *)self reportTopHitSelected:v18];
  id v19 = +[MessageListSearchViewController log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134218498;
    int64_t v25 = self;
    __int16 v26 = 2114;
    id v27 = v10;
    __int16 v28 = 2048;
    id v29 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "searchSuggestionsController: %p, didSelectItemID: %{public}@, messageList: %p", (uint8_t *)&v24, 0x20u);
  }

  id v20 = [(MessageListSearchViewController *)self lastSelectedTopHitItemID];
  BOOL v21 = v20 == v10;

  if (!v21)
  {
    __int16 v22 = [(MessageListViewController *)self scene];
    unsigned int v23 = [v22 isInExpandedEnvironment];

    [(MessageListViewController *)self didSelectTopHitWithItemID:v10 messageList:v11 animated:v23 ^ 1];
    [(MessageListSearchViewController *)self setLastSelectedTopHitItemID:v10];
  }
}

- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5 indexInformation:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  [(MessageListSearchViewController *)self reloadDataSourceWithMessageList:v9 section:MessageListSectionIndexedSearch];
  id v10 = [(MessageListSearchViewController *)self _identifierForTopHitItemID:v8];
  id v11 = +[MSParsecSearchSessionTopHit resultWithIdentifier:v10];

  [(MessageListSearchViewController *)self reportTopHitSelected:v11];
  id v12 = +[MessageListSearchViewController log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218498;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v8;
    __int16 v21 = 2048;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "searchSuggestionsController: %p, didSelectItemID: %{public}@, messageList: %p", (uint8_t *)&v17, 0x20u);
  }

  id v13 = [(MessageListSearchViewController *)self lastSelectedTopHitItemID];
  BOOL v14 = v13 == v8;

  if (!v14)
  {
    BOOL v15 = [(MessageListViewController *)self scene];
    unsigned int v16 = [v15 isInExpandedEnvironment];

    [(MessageListViewController *)self didSelectTopHitWithItemID:v8 messageList:v9 animated:v16 ^ 1];
    [(MessageListSearchViewController *)self setLastSelectedTopHitItemID:v8];
  }
}

- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 instantAnswerSuggestion:(id)a5 cardSectionID:(id)a6 command:(id)a7
{
  id v20 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = [(MessageListSearchViewController *)self _identifierForInstantAnswerItemID:a4];
  BOOL v14 = [v20 instantAnswer];
  BOOL v15 = [v14 flightInfoIsLive];

  unsigned int v16 = [v20 message];
  int v17 = [v16 date];
  id v18 = [v20 feedbackInlineCard];
  __int16 v19 = +[MSParsecSearchSessionInstantAnswer instantAnswerWithIdentifier:v13 date:v17 inlineCard:v18 isInstantAnswerUpdated:v15 != 0];

  [(MessageListSearchViewController *)self reportInstantAnswerButtonSelected:v19 cardSectionID:v11 command:v12];
}

- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5 instantAnswerSuggestion:(id)a6 cardSectionID:(id)a7
{
  id v23 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  [(MessageListSearchViewController *)self reloadDataSourceWithMessageList:v11 section:MessageListSectionIndexedSearch];
  BOOL v14 = [(MessageListSearchViewController *)self _identifierForInstantAnswerItemID:v23];
  BOOL v15 = [v12 instantAnswer];
  unsigned int v16 = [v15 flightInfoIsLive];

  int v17 = [v12 message];
  id v18 = [v17 date];
  __int16 v19 = [v12 feedbackInlineCard];
  id v20 = +[MSParsecSearchSessionInstantAnswer instantAnswerWithIdentifier:v14 date:v18 inlineCard:v19 isInstantAnswerUpdated:v16 != 0];

  [(MessageListSearchViewController *)self reportInstantAnswerCardSelected:v20 cardSectionID:v13];
  __int16 v21 = [(MessageListViewController *)self scene];
  uint64_t v22 = [v21 isInExpandedEnvironment] ^ 1;

  [(MessageListViewController *)self didSelectTopHitWithItemID:v23 messageList:v11 animated:v22];
}

- (void)searchSuggestionsViewController:(id)a3 didSelectItemID:(id)a4 messageList:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  [(MessageListSearchViewController *)self reloadDataSourceWithMessageList:v7 section:MessageListSectionIndexedSearch];
  id v8 = [(MessageListViewController *)self scene];
  uint64_t v9 = [v8 isInExpandedEnvironment] ^ 1;

  [(MessageListViewController *)self didSelectTopHitWithItemID:v10 messageList:v7 animated:v9];
}

- (id)_identifierForTopHitItemID:(id)a3
{
  unsigned int v3 = +[NSString stringWithFormat:@"tophit:%@", a3];

  return v3;
}

- (id)_identifierForInstantAnswerItemID:(id)a3
{
  unsigned int v3 = +[NSString stringWithFormat:@"instantAnswer:%@", a3];

  return v3;
}

- (void)reportSuggestionsFetched:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001451F8;
  v5[3] = &unk_100609728;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:v5];
}

- (void)reportSuggestionsVisible:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100145540;
  v5[3] = &unk_100609728;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:v5];
}

- (void)suggestionsGenerator:(id)a3 didProduceResult:(id)a4
{
  id v16 = a4;
  BOOL v5 = [v16 requestID];
  id v6 = [(MessageListSearchViewController *)self suggestionsIdentifier];
  unsigned __int8 v7 = [v5 isEqualToID:v6];

  if (v7)
  {
    id v8 = [v16 suggestions];
    id v9 = [v8 count];

    if (v9) {
      [(MessageListSearchViewController *)self setSuggestersGeneratedSuggestions:1];
    }
    id v10 = [(MessageListSearchViewController *)self suggestionsViewController];
    [v10 updateSuggestionsWithResult:v16];

    id v11 = [(MessageListSearchViewController *)self suggestionsViewController];
    unsigned int v12 = [v11 hasSuggestions];

    if (v12)
    {
      [(MessageListViewController *)self supressNoContentViewAnimated:0];
      if ([v16 phraseKind] == 1)
      {
        id v13 = [(MessageListSearchViewController *)self suggestionsViewController];
        char v14 = objc_opt_respondsToSelector();

        if (v14)
        {
          BOOL v15 = [(MessageListSearchViewController *)self suggestionsViewController];
          [v15 scrollToHideIndexStatus];
        }
      }
    }
    else if ([v16 phraseKind] == 1)
    {
      [(MessageListViewController *)self updateNoContentViewAnimated:0];
    }
    [(MessageListSearchViewController *)self setSearchSuggestionsVisible:(*(unsigned char *)&self->_flags & 4) == 0];
  }
}

- (void)suggestionsGenerator:(id)a3 didCompleteRequestID:(id)a4
{
  id v11 = a4;
  BOOL v5 = [(MessageListSearchViewController *)self suggestionsIdentifier];
  unsigned __int8 v6 = [v11 isEqualToID:v5];

  if (v6)
  {
    [(MessageListSearchViewController *)self setSuggestionsIdentifier:0];
    if (![(MessageListSearchViewController *)self suggestersGeneratedSuggestions])
    {
      unsigned __int8 v7 = [(MessageListSearchViewController *)self suggestionsViewController];
      [v7 clearSuggestions];
    }
    [(MessageListSearchViewController *)self setSuggestersGeneratedSuggestions:0];
    id v8 = [(MessageListSearchViewController *)self suggestionsViewController];
    [v8 endUpdatingSuggestions];

    *(unsigned char *)&self->_flags |= 8u;
    id v9 = [(MessageListSearchViewController *)self beginSearchTimer];
    id v10 = v9;
    if (v9)
    {
      [v9 invalidate];
      [(MessageListSearchViewController *)self setBeginSearchTimer:0];
      [(MessageListSearchViewController *)self _notePredicateUpdated:1];
    }
  }
}

- (void)textFieldDidChangeSelection:(id)a3
{
  id v11 = a3;
  id v4 = [(MessageListSearchViewController *)self searchBar];
  BOOL v5 = [(MessageListSearchViewController *)self _objectFromSelectionInSearchTextField:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    unsigned __int8 v7 = [v6 scopeNames];
    id v8 = [v6 selectedScopeIndex];
    unsigned int v9 = [v6 hasMultipleScopes];

    if (v9)
    {
      [v4 setScopeButtonTitles:v7];
      [v4 setSelectedScopeButtonIndex:v8];
      char v10 = *(unsigned char *)&self->_flags | 0x20;
      goto LABEL_6;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  [(MessageListSearchViewController *)self _resetGlobalScopeTitles];
  char v10 = *(unsigned char *)&self->_flags & 0xDF;
LABEL_6:
  *(unsigned char *)&self->_flags = v10;
}

- (id)searchTextField:(id)a3 itemProviderForCopyingToken:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSItemProvider);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100145C60;
  v13[3] = &unk_100609778;
  v13[4] = self;
  id v7 = v5;
  id v14 = v7;
  [v6 registerDataRepresentationForTypeIdentifier:@"com.apple.mobilemail.searchAtom" visibility:3 loadHandler:v13];
  id v8 = [UTTypePlainText identifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100145D04;
  v11[3] = &unk_1006097A0;
  id v9 = v7;
  id v12 = v9;
  [v6 registerDataRepresentationForTypeIdentifier:v8 visibility:0 loadHandler:v11];

  return v6;
}

- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4
{
  id v5 = a4;
  id v6 = [v5 itemProvider];
  id v7 = [(MessageListSearchViewController *)self searchBar];
  id v8 = [v7 searchTextField];

  id v9 = [(MessageListSearchViewController *)self searchBar];
  char v10 = [v9 representedSuggestionTokens];
  id v11 = (char *)[v10 count];

  if ([v6 hasItemConformingToTypeIdentifier:@"com.apple.mobilemail.searchAtom"])
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10014611C;
    v25[3] = &unk_1006097C8;
    void v25[4] = self;
    id v26 = v5;
    id v12 = [v6 loadDataRepresentationForTypeIdentifier:@"com.apple.mobilemail.searchAtom" completionHandler:v25];
  }
  else
  {
    id v13 = [UTTypePlainText identifier];
    unsigned int v14 = [v6 hasItemConformingToTypeIdentifier:v13];
    if (v11) {
      unsigned int v15 = v14;
    }
    else {
      unsigned int v15 = 0;
    }

    if (v15 == 1)
    {
      id v16 = [v8 selectedTextRange];
      int v17 = [v8 positionOfTokenAtIndex:v11 - 1];
      id v18 = [v16 end];
      id v19 = [v8 comparePosition:v18 toPosition:v17];

      if (v19 == (id)1)
      {
        [v5 setDefaultResult];
      }
      else
      {
        id v20 = [UTTypePlainText identifier];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1001464A8;
        v22[3] = &unk_1006097C8;
        id v23 = v5;
        int v24 = self;
        id v21 = [v6 loadDataRepresentationForTypeIdentifier:v20 completionHandler:v22];
      }
    }
    else
    {
      [v5 setDefaultResult];
    }
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  [(MessageListSearchViewController *)self setSearchSuggestionsVisible:0];
  id v4 = [(MessageListSearchViewController *)self searchBar];
  id v5 = [v4 representedObjects];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(MessageListSearchViewController *)self currentSuggestion];
    [(MessageListSearchViewController *)self _addSuggestionToRecentSuggester:v7];
  }
  id v8 = [(MessageListSearchViewController *)self suggestionsIdentifier];

  if (v8)
  {
    id v9 = +[MessageListSearchViewController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = 0x4000000000000000;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Waiting for suggestions to search with interval: %f", buf, 0xCu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_100146AA4;
    v11[3] = &unk_1006097F0;
    void v11[4] = self;
    char v10 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v11 block:2.0];
    [(MessageListSearchViewController *)self setBeginSearchTimer:v10];
  }
  else
  {
    [(MessageListSearchViewController *)self _notePredicateUpdated:1];
  }
  [(MessageListSearchViewController *)self reportDidGoToCommittedSearch];
  [(MessageListSearchViewController *)self reportSearchQueryStateWithTriggerEvent:23 searchType:3];
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  id v8 = a3;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    [(MessageListSearchViewController *)self searchTokenScopeChanged:a4];
  }
  else {
    [(MessageListSearchViewController *)self globalSearchScopeChanged:a4];
  }
  if ([(MessageListSearchViewController *)self isSearchSuggestionsVisible])
  {
    id v6 = [(MessageListSearchViewController *)self searchBar];
    id v7 = [(MessageListSearchViewController *)self _currentEditingStringForSearchBar:v6];

    if ([v7 length]) {
      [(MessageListSearchViewController *)self _generateSuggestionsForPhrase:v7];
    }
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListSearchViewController *)self searchBar];
  id v7 = [v6 representedObjects];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = [(MessageListSearchViewController *)self searchBar];
    char v10 = [v9 representedSuggestionTokens];
    id v11 = +[MUISuggestionToken csTokensFromMailSuggestionTokens:v10];

    id v12 = [(MessageListSearchViewController *)self currentSuggestion];
    uint64_t v13 = +[CSSuggestion updatedSuggestionWithCurrentSuggestion:v12 userString:v5 tokens:v11];

    unsigned int v14 = +[MessageListSearchViewController log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = +[EMCSLoggingAdditions publicDescriptionForSuggestion:v13];
      id v16 = [v13 userQueryString];
      int v17 = +[EFPrivacy partiallyRedactedStringForString:v16];
      id v18 = [v13 suggestionTokens];
      int v20 = 138412802;
      id v21 = v15;
      __int16 v22 = 2112;
      id v23 = v17;
      __int16 v24 = 2112;
      int64_t v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Suggestion was updated. Reason: Text changed. Suggestion: %@ UserQueryString: %@ SuggestionTokens: %@", (uint8_t *)&v20, 0x20u);
    }
    [(MessageListViewController *)self setCurrentUserTypedPhrase:v5];
    [(MessageListSearchViewController *)self setCurrentSuggestion:v13];
    [(MessageListSearchViewController *)self reportSearchQueryStateWithTriggerEvent:1 searchType:2];
  }
  else
  {
    [(MessageListViewController *)self setCurrentUserTypedPhrase:0];
    id v19 = +[CSSuggestion emptySuggestion];
    [(MessageListSearchViewController *)self setCurrentSuggestion:v19];

    [(MessageListSearchViewController *)self reportQueryClearedEvent:0];
    [(MessageListSearchViewController *)self reportSearchQueryStateWithTriggerEvent:9 searchType:1];
  }
}

- (id)_additionalBarButtonItems
{
  uint64_t v2 = [(MessageListSearchViewController *)self _searchTapToRadarButtonItem];
  unsigned int v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    id v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)_searchTapToRadarButtonItem
{
  if (!qword_100699900)
  {
    unsigned int v3 = +[EFDevice currentDevice];
    if ([v3 isInternal])
    {
      unsigned int v4 = +[MSRadarURLBuilder canOpenRadar];

      if (!v4) {
        goto LABEL_6;
      }
      unsigned int v3 = +[UIImage mf_systemImageNamed:MFImageGlyphTapToRadar textStyle:UIFontTextStyleFootnote scale:2 weight:5];
      id v5 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v3 style:0 target:self action:"_searchTapToRadarButtonSelected:"];
      uint64_t v6 = (void *)qword_100699900;
      qword_100699900 = (uint64_t)v5;

      id v7 = +[UIColor colorWithRed:0.643137255 green:0.0 blue:0.97254902 alpha:1.0];
      [(id)qword_100699900 setTintColor:v7];
    }
  }
LABEL_6:
  id v8 = (void *)qword_100699900;

  return v8;
}

- (void)_searchTapToRadarButtonSelected:(id)a3
{
}

- (void)invokeTapToRadar
{
  id v6 = +[MSRadarInteraction interactionWithTitle:@"Mail Search Problem?" message:@"Having trouble with search? We've got a Tap-to-Radar template ready to go." builder:&stru_100609830];
  unsigned int v3 = [v6 interactionViewController];
  unsigned int v4 = [(MessageListViewController *)self scene];
  id v5 = [v4 mf_rootViewController];
  [v5 presentViewController:v3 animated:1 completion:0];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MessageListSearchViewController;
  [(MessageListViewController *)&v11 collectionView:v8 willDisplayCell:v9 forItemAtIndexPath:v10];
  [(MessageListSearchViewController *)self reportVisibleMessageListResultsAlwaysReportItems:0];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MessageListSearchViewController;
  [(MessageListViewController *)&v11 collectionView:v8 didEndDisplayingCell:v9 forItemAtIndexPath:v10];
  [(MessageListSearchViewController *)self reportVisibleMessageListResultsAlwaysReportItems:0];
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  return [(MessageListSearchViewController *)self isEditing] ^ 1;
}

- (void)_sendAnalyticsForIndexState:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults em_userDefaults];
  uint64_t v6 = EMUserDefaultIndexStatusCollectAfterDate;
  id v7 = [v5 objectForKey:EMUserDefaultIndexStatusCollectAfterDate];

  if (!v7
    || (+[NSDate date],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = objc_msgSend(v7, "ef_isEarlierThanDate:", v8),
        v8,
        v9))
  {
    id v10 = +[NSCalendar currentCalendar];
    objc_super v11 = +[NSDate date];
    id v12 = [v10 dateByAddingUnit:16 value:1 toDate:v11 options:0];

    uint64_t v13 = +[NSUserDefaults em_userDefaults];
    [v13 setObject:v12 forKey:v6];

    v19[0] = @"percentMessagesIndexed";
    unsigned int v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 percentMessagesIndexed]);
    v19[1] = @"percentAttachmentsIndexed";
    v20[0] = v14;
    id v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 percentAttachmentsIndexed]);
    v20[1] = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

    id v17 = [objc_alloc((Class)EMCoreAnalyticsEvent) initWithEventName:@"com.apple.mail.searchableIndex.indexStatus" collectionData:v16];
    id v18 = [(MessageListSearchViewController *)self analyticsCollector];
    [v18 logOneTimeEvent:v17];
  }
}

- (void)_updateIndexStatisticsIfNeeded
{
  id v2 = [(MessageListSearchViewController *)self indexingStatusDebouncer];
  [v2 debounceResult:0];
}

- (void)_updateIndexStatistics
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v2 = +[UIApplication sharedApplication];
  unsigned int v3 = [v2 daemonInterface];
  id v4 = [v3 diagnosticInfoGatherer];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001478BC;
  v5[3] = &unk_100605F40;
  objc_copyWeak(&v6, &location);
  [v4 searchableIndexDatabaseStatisticsWithCompletionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (unint64_t)_computeBGSystemTaskFeatureCheckpoint
{
  unsigned int v3 = [(MessageListSearchViewController *)self indexStatistics];
  id v4 = [v3 objectForKeyedSubscript:EMPersistenceStatisticsKeyMessagesIndexed];
  id v5 = [v4 unsignedIntegerValue];

  id v6 = [(MessageListSearchViewController *)self indexStatistics];
  id v7 = [v6 objectForKeyedSubscript:EMPersistenceStatisticsKeyRemoteMessagesIndexed];
  id v8 = [v7 unsignedIntegerValue];

  unsigned int v9 = [(MessageListSearchViewController *)self indexStatistics];
  id v10 = [v9 objectForKeyedSubscript:EMPersistenceStatisticsKeyIndexableMessages];
  id v11 = [v10 unsignedIntegerValue];

  id v12 = [(MessageListSearchViewController *)self indexStatistics];
  uint64_t v13 = [v12 objectForKeyedSubscript:EMPersistenceStatisticsKeyIndexableRemoteMessages];
  id v14 = [v13 unsignedIntegerValue];

  float v15 = 1.0;
  if (v11) {
    float v15 = (float)(unint64_t)v5 / (float)(unint64_t)v11;
  }
  if (v14) {
    BOOL v16 = (float)((float)(unint64_t)v8 / (float)(unint64_t)v14) <= kDefaultMaxIndexedToTotalRatio;
  }
  else {
    BOOL v16 = 1;
  }
  unint64_t v17 = 40;
  if (!v16) {
    unint64_t v17 = 60;
  }
  if (v15 <= kDefaultMaxIndexedToTotalRatio) {
    return 10;
  }
  else {
    return v17;
  }
}

- (id)searchScopeForSuggestionCategoryScope:(id)a3
{
  unsigned int v3 = [a3 identifier];
  if ([v3 isEqualToString:MFSearchSuggestionSubjectCategoryScope])
  {
    id v4 = (id *)&MSSearchScopeSubject;
LABEL_11:
    id v5 = *v4;
    goto LABEL_12;
  }
  if ([v3 isEqualToString:MUISearchSuggestionCategoryContentScope])
  {
    id v4 = (id *)&MSSearchScopeMessage;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:MFSearchSuggestionPeopleCategoryFromScope])
  {
    id v4 = (id *)&MSSearchScopeFrom;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:MFSearchSuggestionPeopleCategoryToScope])
  {
    id v4 = (id *)&MSSearchScopeTo;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:MFSearchSuggestionMailboxCategoryScope])
  {
    id v4 = (id *)&MSSearchScopeMailbox;
    goto LABEL_11;
  }
  id v5 = 0;
LABEL_12:

  return v5;
}

- (id)SectionCategoryForSuggestion:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id *)&MSSearchSuggestionCategoryTopHit;
LABEL_7:
    id v6 = *v5;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id *)&MSSearchSuggestionCategoryInstantAnswer;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id *)&MSSearchSuggestionCategorySuggestion;
    goto LABEL_7;
  }
  id v6 = [(MessageListSearchViewController *)self categoryForSuggestion:v4];
LABEL_8:
  id v7 = v6;

  return v7;
}

- (id)categoryForSuggestion:(id)a3
{
  id v5 = a3;
  id v6 = [v5 category];
  id v7 = +[MUISearchSuggestionCategory mailboxCategory];

  if (v6 == v7)
  {
    id v18 = (id *)&MSSearchSuggestionCategoryMailboxes;
    goto LABEL_18;
  }
  id v8 = +[MUISearchSuggestionCategory topHitsCategory];

  if (v6 == v8)
  {
    id v18 = (id *)&MSSearchSuggestionCategoryTopHit;
    goto LABEL_18;
  }
  unsigned int v9 = +[MUISearchSuggestionCategory instantAnswersCategory];

  if (v6 == v9)
  {
    id v18 = (id *)&MSSearchSuggestionCategoryInstantAnswer;
    goto LABEL_18;
  }
  id v10 = +[MUISearchSuggestionCategory contactCategory];

  if (v6 == v10)
  {
    id v18 = (id *)&MSSearchSuggestionCategoryContact;
    goto LABEL_18;
  }
  id v11 = +[MUISearchSuggestionCategory documentCategory];

  if (v6 == v11)
  {
    id v18 = (id *)&MSSearchSuggestionCategoryDocument;
    goto LABEL_18;
  }
  id v12 = +[MUISearchSuggestionCategory locationCategory];

  if (v6 == v12)
  {
    id v18 = (id *)&MSSearchSuggestionCategoryLocation;
    goto LABEL_18;
  }
  uint64_t v13 = +[MUISearchSuggestionCategory linkCategory];

  if (v6 == v13)
  {
    id v18 = (id *)&MSSearchSuggestionCategoryLink;
LABEL_18:
    id v17 = *v18;
    if (!v17) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
  id v14 = +[MUISearchSuggestionCategory genericCategory];
  if (v6 == v14)
  {
  }
  else
  {
    float v15 = +[MUISearchSuggestionCategory recentGenericCategory];

    if (v6 != v15)
    {
LABEL_10:
      BOOL v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:a2, self, @"MessageListSearchViewController.m", 1655, @"No corresponding MSSearchSuggestionCategory for MUISearchAtomSuggestion %@", v5 object file lineNumber description];

      id v17 = 0;
      goto LABEL_19;
    }
  }
  int v20 = [v5 spotlightSuggestion];
  id v21 = [v20 currentToken];

  if (v21)
  {
    __int16 v22 = [v5 spotlightSuggestion];
    id v23 = [v22 currentToken];

    -[MessageListSearchViewController categoryForTokenKind:](self, "categoryForTokenKind:", [v23 tokenKind]);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v24 = +[MessageListSearchViewController log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10045B894(v24);
    }

    id v17 = MSSearchSuggestionCategoryGeneric;
  }
LABEL_19:

  return v17;
}

- (void)setUpAppSwitcherObserver
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"reportSearchDidBecomeActive" name:UISceneWillEnterForegroundNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"reportSearchWillTerminate" name:UIApplicationWillTerminateNotification object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UISceneWillEnterForegroundNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIApplicationWillTerminateNotification object:0];
}

- (id)categoryForTokenKind:(int64_t)a3
{
  id v3 = (id *)&MSSearchSuggestionCategorySubject;
  switch(a3)
  {
    case 0:
      id v3 = (id *)&MSSearchSuggestionCategoryFreeText;
      break;
    case 1:
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
    case 15:
    case 17:
    case 18:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
      goto LABEL_6;
    case 2:
      id v3 = (id *)&MSSearchSuggestionCategoryAttachment;
      break;
    case 5:
      id v3 = (id *)&MSSearchSuggestionCategoryDates;
      break;
    case 12:
      id v3 = (id *)&MSSearchSuggestionCategoryMailboxes;
      break;
    case 14:
      id v3 = (id *)&MSSearchSuggestionCategorySubjectContains;
      break;
    case 16:
      id v3 = (id *)&MSSearchSuggestionCategoryPeople;
      break;
    case 19:
      id v3 = (id *)&MSSearchSuggestionCategoryReadStatus;
      break;
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
      id v3 = (id *)&MSSearchSuggestionCategoryFlagColor;
      break;
    case 33:
      id v3 = (id *)&MSSearchSuggestionCategoryFlagStatus;
      break;
    case 34:
      return *v3;
    default:
      if (a3 == 46) {
        id v3 = (id *)&MSSearchSuggestionCategorySenderContains;
      }
      else {
LABEL_6:
      }
        id v3 = (id *)&MSSearchSuggestionCategoryOther;
      break;
  }
  return *v3;
}

- (void)reportSearchViewAppeared:(BOOL)a3 currentMailboxScope:(BOOL)a4
{
  [(MessageListViewController *)self inputLanguages];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001486E0;
  v8[3] = &unk_1006098C0;
  BOOL v10 = a3;
  BOOL v11 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:v8];
}

- (void)reportSearchDidBecomeActive
{
  [(MessageListViewController *)self inputLanguages];
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_1001487F0;
  id v8 = &unk_100609728;
  id v9 = self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v3;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:&v5];
  if ([(MessageListSearchViewController *)self isSearchSuggestionsVisible])
  {
    id v4 = [(MessageListSearchViewController *)self suggestionsViewController];
    [v4 reportVisibleSuggestionResults];
  }
  else
  {
    [(MessageListSearchViewController *)self reportVisibleMessageListResultsAlwaysReportItems:1];
  }
}

- (void)_sceneDidEnterBackground
{
  v5.receiver = self;
  v5.super_class = (Class)MessageListSearchViewController;
  [(MessageListViewController *)&v5 _sceneDidEnterBackground];
  id v3 = [(MessageListSearchViewController *)self view];
  id v4 = [v3 window];

  if (v4) {
    [(MessageListViewController *)self parsecEventQueuePerformBlock:&stru_100609900];
  }
}

- (void)reportSearchWillTerminate
{
}

- (void)reportSearchEndedEvent:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100148934;
  v3[3] = &unk_100609940;
  void v3[4] = a3;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:v3];
}

- (void)reportTopHitSelected:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001489EC;
  v5[3] = &unk_100609968;
  id v6 = a3;
  id v4 = v6;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:v5];
}

- (void)reportInstantAnswerCardSelected:(id)a3 cardSectionID:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100148AD8;
  v8[3] = &unk_100609728;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:v8];
}

- (void)reportInstantAnswerButtonSelected:(id)a3 cardSectionID:(id)a4 command:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100148BFC;
  v11[3] = &unk_100609990;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:v11];
}

- (void)reportSuggestionSelected:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100148CB8;
  v5[3] = &unk_100609968;
  id v6 = a3;
  id v4 = v6;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:v5];
}

- (void)reportDidGoToCommittedSearch
{
}

- (void)reportMessageListResultsFetchedIsFinished:(BOOL)a3
{
  BOOL v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100148DE0;
  v7[3] = &unk_100609A18;
  v7[4] = self;
  BOOL v8 = a3;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:v7];
  if (v3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100148FFC;
    v6[3] = &unk_1006047A0;
    v6[4] = self;
    objc_super v5 = +[EFScheduler mainThreadScheduler];
    [v5 performBlock:v6];
  }
}

- (void)reportVisibleMessageListResultsAlwaysReportItems:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(MessageListViewController *)self initialLoadCompletedFuture];
  id v6 = [v5 resultIfAvailable];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    BOOL v8 = [(MessageListSearchViewController *)self collectionView];
    id v9 = [v8 indexPathsForVisibleItems];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_1001492B8;
    v19[3] = &unk_100609A40;
    v19[4] = self;
    id v10 = [v9 ef_filter:v19];
    BOOL v11 = [v10 sortedArrayUsingSelector:"compare:"];

    if ([v11 count])
    {
      id v12 = [(MessageListSearchViewController *)self lastVisibleIndexPaths];
      unsigned int v13 = [v11 isEqualToArray:v12];

      if (!v13 || v3)
      {
        id v14 = [v11 copy];
        [(MessageListSearchViewController *)self setLastVisibleIndexPaths:v14];

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100149338;
        v18[3] = &unk_100609A68;
        v18[4] = self;
        [v11 ef_compactMap:v18];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100149494;
        v16[3] = &unk_100609968;
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        id v15 = v17;
        [(MessageListViewController *)self parsecEventQueuePerformBlock:v16];
      }
    }
    [(MessageListSearchViewController *)self setNeedsFocusUpdate];
  }
  else
  {
    [(MessageListSearchViewController *)self setLastVisibleIndexPaths:0];
  }
}

- (void)_reportSearchQueryStateForScopeChange
{
  if ([(MessageListSearchViewController *)self isSearchSuggestionsVisible]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 3;
  }

  [(MessageListSearchViewController *)self reportSearchQueryStateWithTriggerEvent:27 searchType:v3];
}

- (void)reportSearchQueryStateWithTriggerEvent:(unint64_t)a3 searchType:(unint64_t)a4
{
  BOOL v8 = [(MessageListViewController *)self inputLanguages];
  if (pthread_main_np() != 1)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MessageListSearchViewController.m" lineNumber:1843 description:@"Current thread must be main"];
  }
  id v9 = [(MessageListSearchViewController *)self currentSuggestion];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100149694;
  v13[3] = &unk_100609AB8;
  objc_copyWeak(v16, &location);
  id v14 = v9;
  v16[1] = (id)a3;
  v16[2] = (id)a4;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:v13];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)reportQueryClearedEvent:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100149B78;
  v3[3] = &unk_100609940;
  void v3[4] = a3;
  [(MessageListViewController *)self parsecEventQueuePerformBlock:v3];
}

- (id)viewForKeyboardAvoidance:(id)a3
{
  uint64_t v3 = [(MessageListSearchViewController *)self collectionView];

  return v3;
}

- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3
{
  return 0;
}

- (void)keyboardAvoidance:(id)a3 adjustForFrameOverlap:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(MessageListSearchViewController *)self currentKeyboardOverlap];
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    -[MessageListSearchViewController setCurrentKeyboardOverlap:](self, "setCurrentKeyboardOverlap:", x, y, width, height);
    [(MessageListSearchViewController *)self reportVisibleMessageListResultsAlwaysReportItems:0];
  }
}

- (id)messageListDataSource:(id)a3 sectionDataSourceForSection:(id)a4 objectID:(id)a5 messageList:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([v11 isEqualToString:MessageListSectionIndexedSearch] & 1) != 0
    || [v11 isEqualToString:MessageListSectionServerSearch])
  {
    id v14 = objc_alloc((Class)MessageListSearchSectionDataSource);
    id v15 = [(MessageListSearchViewController *)self sectionDataSourceConfigurationWithIdentifier:v12 section:v11 messageList:v13];
    id v16 = [v14 initWithConfiguration:v15];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)MessageListSearchViewController;
    id v16 = [(MessageListSearchViewController *)&v18 messageListDataSource:v10 sectionDataSourceForSection:v11 objectID:v12 messageList:v13];
  }

  return v16;
}

- (id)sectionDataSourceConfigurationWithIdentifier:(id)a3 section:(id)a4 messageList:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MessageListSearchViewController;
  id v6 = [(MessageListSearchViewController *)&v9 sectionDataSourceConfigurationWithIdentifier:a3 section:a4 messageList:a5];
  unsigned __int8 v7 = [(MessageListSearchViewController *)self searchProgressView];
  [v6 setSearchProgressView:v7];

  return v6;
}

- (void)messageListDataSource:(id)a3 didUpdateWithChange:(id)a4 section:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [(MessageListSearchViewController *)self _updateFooter];
  v13.receiver = self;
  v13.super_class = (Class)MessageListSearchViewController;
  [(MessageListViewController *)&v13 messageListDataSource:v10 didUpdateWithChange:v11 section:v12 animated:v6];
}

- (BOOL)generateCannedSuggestions
{
  return self->_generateCannedSuggestions;
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setAnalyticsCollector:(id)a3
{
}

- (UIView)snapshotViewForDismissal
{
  return self->_snapshotViewForDismissal;
}

- (BOOL)enablePresentationAnimation
{
  return self->_enablePresentationAnimation;
}

- (void)setEnablePresentationAnimation:(BOOL)a3
{
  self->_enablePresentationAnimation = a3;
}

- (CSSuggestion)suggestionForInitialSearch
{
  return self->_suggestionForInitialSearch;
}

- (void)setSuggestionForInitialSearch:(id)a3
{
}

- (MUISearchSuggestionsGenerator)suggestionsGenerator
{
  return self->_suggestionsGenerator;
}

- (void)setSuggestionsGenerator:(id)a3
{
}

- (MUISearchRequestID)suggestionsIdentifier
{
  return self->_suggestionsIdentifier;
}

- (void)setSuggestionsIdentifier:(id)a3
{
}

- (NSString)lastPhrase
{
  return self->_lastPhrase;
}

- (void)setLastPhrase:(id)a3
{
}

- (unint64_t)countOfAtomsInLastSearch
{
  return self->_countOfAtomsInLastSearch;
}

- (void)setCountOfAtomsInLastSearch:(unint64_t)a3
{
  self->_countOfAtomsInLastSearch = a3;
}

- (MFSearchSuggestionsViewControllable)suggestionsViewController
{
  return self->_suggestionsViewController;
}

- (void)setSuggestionsViewController:(id)a3
{
}

- (MUISearchRecentSuggester)recentSuggester
{
  return self->_recentSuggester;
}

- (void)setRecentSuggester:(id)a3
{
}

- (EMCollectionItemID)lastSelectedTopHitItemID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastSelectedTopHitItemID);

  return (EMCollectionItemID *)WeakRetained;
}

- (void)setLastSelectedTopHitItemID:(id)a3
{
}

- (unint64_t)searchStartAbsoluteTime
{
  return self->_searchStartAbsoluteTime;
}

- (void)setSearchStartAbsoluteTime:(unint64_t)a3
{
  self->_searchStartAbsoluteTime = a3;
}

- (NSTimer)beginSearchTimer
{
  return self->_beginSearchTimer;
}

- (void)setBeginSearchTimer:(id)a3
{
}

- (MFSearchTokenTransformer)searchTokenTransformer
{
  return self->_searchTokenTransformer;
}

- (void)setSearchTokenTransformer:(id)a3
{
}

- (NSMutableDictionary)searchActivityPayloadDictionary
{
  return self->_searchActivityPayloadDictionary;
}

- (void)setSearchActivityPayloadDictionary:(id)a3
{
}

- (void)setSearchProgressView:(id)a3
{
}

- (EFCancelable)searchProgressViewDisplayCancellable
{
  return self->_searchProgressViewDisplayCancellable;
}

- (void)setSearchProgressViewDisplayCancellable:(id)a3
{
}

- (EFPromise)localSearchInitialLoadPromise
{
  return self->_localSearchInitialLoadPromise;
}

- (void)setLocalSearchInitialLoadPromise:(id)a3
{
}

- (EFPromise)localSearchRemotePromise
{
  return self->_localSearchRemotePromise;
}

- (void)setLocalSearchRemotePromise:(id)a3
{
}

- (EFPromise)remoteSearchInitialLoadPromise
{
  return self->_remoteSearchInitialLoadPromise;
}

- (void)setRemoteSearchInitialLoadPromise:(id)a3
{
}

- (EFPromise)remoteSearchServerPromise
{
  return self->_remoteSearchServerPromise;
}

- (void)setRemoteSearchServerPromise:(id)a3
{
}

- (BOOL)suggestersGeneratedSuggestions
{
  return self->_suggestersGeneratedSuggestions;
}

- (void)setSuggestersGeneratedSuggestions:(BOOL)a3
{
  self->_suggestersGeneratedSuggestions = a3;
}

- (NSArray)lastVisibleIndexPaths
{
  return self->_lastVisibleIndexPaths;
}

- (void)setLastVisibleIndexPaths:(id)a3
{
}

- (CGRect)currentKeyboardOverlap
{
  double x = self->_currentKeyboardOverlap.origin.x;
  double y = self->_currentKeyboardOverlap.origin.y;
  double width = self->_currentKeyboardOverlap.size.width;
  double height = self->_currentKeyboardOverlap.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentKeyboardOverlap:(CGRect)a3
{
  self->_currentKeyboardOverlap = a3;
}

- (EMSenderRepository)senderRepository
{
  return self->_senderRepository;
}

- (BOOL)inSearchSession
{
  return self->_inSearchSession;
}

- (BOOL)isSearchingFooterVisible
{
  return self->_isSearchingFooterVisible;
}

- (void)setIsSearchingFooterVisible:(BOOL)a3
{
  self->_isSearchingFooterVisible = a3;
}

- (EFDebouncer)indexingStatusDebouncer
{
  return self->_indexingStatusDebouncer;
}

- (void)setIndexingStatusDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexingStatusDebouncer, 0);
  objc_storeStrong((id *)&self->_senderRepository, 0);
  objc_storeStrong((id *)&self->_lastVisibleIndexPaths, 0);
  objc_storeStrong((id *)&self->_remoteSearchServerPromise, 0);
  objc_storeStrong((id *)&self->_remoteSearchInitialLoadPromise, 0);
  objc_storeStrong((id *)&self->_localSearchRemotePromise, 0);
  objc_storeStrong((id *)&self->_localSearchInitialLoadPromise, 0);
  objc_storeStrong((id *)&self->_searchProgressViewDisplayCancellable, 0);
  objc_storeStrong((id *)&self->_searchProgressView, 0);
  objc_storeStrong((id *)&self->_searchActivityPayloadDictionary, 0);
  objc_storeStrong((id *)&self->_searchTokenTransformer, 0);
  objc_storeStrong((id *)&self->_beginSearchTimer, 0);
  objc_destroyWeak((id *)&self->_lastSelectedTopHitItemID);
  objc_storeStrong((id *)&self->_recentSuggester, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_storeStrong((id *)&self->_lastPhrase, 0);
  objc_storeStrong((id *)&self->_suggestionsIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionsGenerator, 0);
  objc_storeStrong((id *)&self->_suggestionForInitialSearch, 0);
  objc_storeStrong((id *)&self->_snapshotViewForDismissal, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);

  objc_storeStrong((id *)&self->_indexStatistics, 0);
}

@end