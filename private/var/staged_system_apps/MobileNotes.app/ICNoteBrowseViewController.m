@interface ICNoteBrowseViewController
- (BOOL)analyticsTrackingActive;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasDeletableNoteCell;
- (BOOL)isAllTagsSelected;
- (BOOL)isTrashFolder;
- (BOOL)needsToConfirmDeletion;
- (BOOL)shouldAvoidEditingChanges;
- (BOOL)shouldIncludeInvitations;
- (BOOL)shouldIncludeSubfolders;
- (BOOL)shouldIncludeTagDetail;
- (BOOL)shouldIncludeTags;
- (BOOL)shouldShowEmptyState;
- (BOOL)shouldShowTagAssignmentBarButtonItem;
- (BOOL)updateFolderSectionVisibility;
- (BOOL)updateTagSectionVisibility;
- (ICCollaborationButtonsController)collaborationButtonsController;
- (ICFolderCreationController)smartFolderCreationController;
- (ICFolderCustomNoteSortType)sortType;
- (ICNoteBrowseDataSource)noteDataSource;
- (ICNoteBrowseNavigationItemConfiguration)navigationItemConfiguration;
- (ICNoteBrowseViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4;
- (ICNoteBrowseViewControllerCollectionViewDelegate)collectionViewDelegate;
- (ICNoteContainer)noteContainer;
- (ICQuery)noteQuery;
- (ICTagContainerCell)tagContainerCell;
- (ICTagSelection)tagSelection;
- (ICToolbarSummaryView)summaryView;
- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder;
- (NSArray)allNotes;
- (NSArray)observedNoteContainerProperties;
- (NSArray)observedUserDefaultsProperties;
- (NSArray)selectedNotes;
- (NoteCollectionObject)noteCollection;
- (double)availableWidthForSummaryView;
- (id)focusedNotes;
- (id)noteBrowseNavigationItemConfigurationCollaborationBarButtonItem:(id)a3;
- (id)noteBrowseNavigationItemConfigurationNavigationTitle:(id)a3;
- (id)noteBrowseNavigationItemConfigurationNoteContainerActionMenu:(id)a3 actionBarButtonItem:(id)a4;
- (id)noteBrowseNavigationItemConfigurationQueryActionMenu:(id)a3 actionBarButtonItem:(id)a4;
- (id)noteBrowseNavigationItemConfigurationVirtualSmartFolderActionMenu:(id)a3 actionBarButtonItem:(id)a4;
- (id)notesForIndexPaths:(id)a3;
- (id)tagDetailCell;
- (int)dateHeadersType;
- (unint64_t)numberOfSelectedItems;
- (unint64_t)tagsActionMenuNoteCount:(id)a3;
- (void)accessibilityStatusDidChange;
- (void)addKVOObservers;
- (void)analyticsSessionWillEnd:(id)a3;
- (void)dataSourceDataDidUpdate:(id)a3;
- (void)dataSourceDataUpdateDidRender:(id)a3;
- (void)dealloc;
- (void)deleteNotes:(id)a3 sender:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)didUpdateSearchAppearanceNotification:(id)a3;
- (void)endAnalyticsTracking;
- (void)loadView;
- (void)managedObjectContextDidSaveObjectIDs:(id)a3;
- (void)moveNotes:(id)a3;
- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldAddNoteFromBarButtonItem:(id)a4 event:(id)a5;
- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldAssignTagsFromBarButtonItem:(id)a4;
- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldDeleteAllFromBarButtonItem:(id)a4;
- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldDeleteSelectedFromBarButtonItem:(id)a4;
- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldLockFromBarButtonItem:(id)a4;
- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldMoveAllFromBarButtonItem:(id)a4;
- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldMoveSelectedFromBarButtonItem:(id)a4;
- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldShareFromBarButtonItem:(id)a4;
- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldShowDebugViewControllerFromBarButtonItem:(id)a4;
- (void)noteDecryptedStatusDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performCmd3:(id)a3;
- (void)performDeleteKey:(id)a3;
- (void)registerForTraitChanges;
- (void)reloadDataSourceAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5;
- (void)removeKVOObservers;
- (void)resetBarButtonItemsAnimated:(BOOL)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneWillDeactivate:(id)a3;
- (void)setAnalyticsTrackingActive:(BOOL)a3;
- (void)setCollaborationButtonsController:(id)a3;
- (void)setCollectionViewDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNavigationItemConfiguration:(id)a3;
- (void)setNeedsToConfirmDeletion:(BOOL)a3;
- (void)setNoteCollection:(id)a3;
- (void)setNoteCollection:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5;
- (void)setNoteContainer:(id)a3;
- (void)setNoteContainer:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5;
- (void)setNoteDataSource:(id)a3;
- (void)setNoteQuery:(id)a3;
- (void)setNoteQuery:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5;
- (void)setShouldAvoidEditingChanges:(BOOL)a3;
- (void)setSmartFolderCreationController:(id)a3;
- (void)setSummaryView:(id)a3;
- (void)setTagSelection:(id)a3;
- (void)setTagSelection:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5;
- (void)setVirtualSmartFolder:(id)a3;
- (void)setVirtualSmartFolder:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5;
- (void)sharedWithYouControllerDidUpdateHighlights:(id)a3;
- (void)showSharedFolderActions:(id)a3;
- (void)startAnalyticsTracking;
- (void)submitTagSelectionAnalyticsIfNeeded;
- (void)summaryViewLockNowPressed:(id)a3;
- (void)updateBarButtonItemsAnimated:(BOOL)a3;
- (void)updateContainerSelection;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)updateDataSourceAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5 updateDataSourceBlock:(id)a6;
- (void)updateDataSourceConfigurationSortTypeChanged:(BOOL)a3;
- (void)updateFocusedNoteIfNeeded;
- (void)updateNavigationTitle;
- (void)updateSelectedTagTitles;
- (void)updateSummaryView;
- (void)updateTagDetailOperatorMenuVisibility;
- (void)updateTagSelectionIfNeeded;
- (void)updateVisibleGalleryCellThumbnails;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismissSearchController:(id)a3;
@end

@implementation ICNoteBrowseViewController

- (BOOL)shouldIncludeTags
{
  v3 = [(ICNoteBrowseViewController *)self noteQuery];
  if (v3)
  {
    v4 = [(ICBaseViewController *)self viewControllerManager];
    unsigned __int8 v5 = [v4 hasCompactWidth];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteBrowseViewController didMoveToParentViewController:](&v5, "didMoveToParentViewController:");
  if (a3)
  {
    if ([(ICNoteBrowseViewController *)self ic_isViewVisible]) {
      [(ICNoteBrowseViewController *)self resetBarButtonItemsAnimated:0];
    }
  }
}

- (BOOL)shouldIncludeTagDetail
{
  v2 = [(ICNoteBrowseViewController *)self noteQuery];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updateContainerSelection
{
  BOOL v3 = [(ICNoteBrowseViewController *)self tagSelection];

  if (v3)
  {
    v4 = [(ICNoteBrowseViewController *)self tagContainerCell];
    objc_super v5 = [(ICNoteBrowseViewController *)self tagSelection];
    [v4 selectTagsWithTagSelection:v5 animated:0];

    v6 = [(ICNoteBrowseViewController *)self tagDetailCell];
    v7 = [(ICNoteBrowseViewController *)self tagSelection];
    [v6 updateForTagSelection:v7 animated:0];
  }

  [(ICNoteBrowseViewController *)self updateFocusedNoteIfNeeded];
}

- (BOOL)shouldIncludeInvitations
{
  v2 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
  BOOL v3 = [v2 type];
  unsigned __int8 v4 = [v3 isEqualToString:ICVirtualSmartFolderItemIdentifierTypeSharedWithYou];

  return v4;
}

- (ICFolderCreationController)smartFolderCreationController
{
  if (self->_smartFolderCreationController)
  {
    BOOL v3 = [(ICNoteBrowseViewController *)self noteQuery];
    [(ICFolderCreationController *)self->_smartFolderCreationController setSmartFolderQuery:v3];
  }
  else
  {
    unsigned __int8 v4 = [ICFolderCreationController alloc];
    BOOL v3 = [(ICNoteBrowseViewController *)self noteQuery];
    objc_super v5 = [(ICFolderCreationController *)v4 initWithViewController:self noteContainer:0 smartFolderQuery:v3 folderTitle:0 creationApproach:2];
    smartFolderCreationController = self->_smartFolderCreationController;
    self->_smartFolderCreationController = v5;
  }
  v7 = self->_smartFolderCreationController;

  return v7;
}

- (void)resetBarButtonItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v5 reset];

  [(ICNoteBrowseViewController *)self updateBarButtonItemsAnimated:v3];
}

- (int)dateHeadersType
{
  BOOL v3 = [(ICNoteBrowseViewController *)self noteContainer];

  if (v3)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    int v16 = 0;
    unsigned __int8 v4 = [(ICNoteBrowseViewController *)self noteContainer];
    objc_super v5 = [v4 managedObjectContext];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000D5A4;
    v12[3] = &unk_100626040;
    v12[4] = self;
    v12[5] = &v13;
    [v5 performBlockAndWait:v12];

    int v6 = *((_DWORD *)v14 + 6);
    _Block_object_dispose(&v13, 8);
    return v6;
  }
  v8 = [(ICNoteBrowseViewController *)self noteQuery];

  if (v8)
  {
    return +[ICDateHeadersUtilities queryDateHeadersType];
  }
  else
  {
    v9 = [(ICNoteBrowseViewController *)self virtualSmartFolder];

    if (v9)
    {
      v10 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
      if ([v10 supportsDateHeaders])
      {
        v11 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
        int v6 = [v11 dateHeadersType];
      }
      else
      {
        int v6 = 1;
      }

      return v6;
    }
    return +[ICDateHeadersUtilities defaultDateHeadersType];
  }
}

- (void)updateSelectedTagTitles
{
  BOOL v3 = [(ICNoteBrowseViewController *)self tagSelection];
  unsigned __int8 v4 = [v3 smartFolderTitle];
  objc_super v5 = [(ICNoteBrowseViewController *)self smartFolderCreationController];
  [v5 setFolderTitle:v4];

  int v6 = [(ICNoteBrowseViewController *)self tagSelection];

  if (v6)
  {
    id v7 = objc_alloc((Class)ICFilterSelection);
    id v10 = [(ICNoteBrowseViewController *)self tagSelection];
    id v8 = [v7 initWithFilterTypeSelection:v10];
    v9 = [(ICNoteBrowseViewController *)self smartFolderCreationController];
    [v9 setFilterSelection:v8];
  }
}

- (ICTagSelection)tagSelection
{
  return self->_tagSelection;
}

- (void)reloadDataSourceAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([(ICNoteBrowseViewController *)self ic_isViewVisible] & 1) == 0) {
    [(ICNoteBrowseViewController *)self updateNavigationTitle];
  }
  [(ICNoteBrowseViewController *)self resetBarButtonItemsAnimated:0];
  [(ICNoteBrowseViewController *)self updateSelectedTagTitles];
  id v10 = [(ICNoteBrowseViewController *)self noteDataSource];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100019AC0;
  v15[3] = &unk_10062A070;
  BOOL v17 = v6;
  v15[4] = self;
  id v16 = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006808;
  v13[3] = &unk_100625B40;
  v13[4] = self;
  id v14 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 reloadDataAnimated:v6 dataIndexedBlock:v15 dataRenderedBlock:v13];
}

- (ICFolderCustomNoteSortType)sortType
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100104520;
  BOOL v17 = sub_100104530;
  id v18 = 0;
  BOOL v3 = [(ICNoteBrowseViewController *)self noteContainer];
  unsigned __int8 v4 = [v3 managedObjectContext];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007718;
  v12[3] = &unk_100626040;
  v12[4] = self;
  v12[5] = &v13;
  [v4 performBlockAndWait:v12];

  id v5 = +[ICNoteListSortUtilities folderSortOrderForNoteListSortType:](ICNoteListSortUtilities, "folderSortOrderForNoteListSortType:", +[ICNoteListSortUtilities currentNoteListSortType]);
  BOOL v6 = (void *)v14[5];
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v8 = v5;
    id v9 = [(ICNoteBrowseViewController *)self noteQuery];
    if (!v9
      || (+[ICFolderCustomNoteSortType querySortType],
          (id v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v10 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
      id v7 = [v10 noteSortType];
      if (!v7)
      {
        id v7 = +[ICFolderCustomNoteSortType folderNoteSortTypeWithOrder:v8 direction:0];
      }
    }
  }
  _Block_object_dispose(&v13, 8);

  return (ICFolderCustomNoteSortType *)v7;
}

- (void)sceneDidActivate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];

  ICDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v6 = [v14 session];
  id v7 = [v6 persistentIdentifier];
  id v8 = [(ICNoteBrowseViewController *)self viewIfLoaded];
  id v9 = [v8 window];
  id v10 = [v9 windowScene];
  id v11 = [v10 session];
  id v12 = [v11 persistentIdentifier];
  unsigned int v13 = [v7 isEqual:v12];

  if (v13 && [(ICNoteBrowseViewController *)self ic_isViewVisible])
  {
    [(ICNoteBrowseViewController *)self startAnalyticsTracking];
    [(ICNoteResultsViewController *)self updatePreparedCells];
  }
}

- (void)updateDataSourceAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5 updateDataSourceBlock:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = (void (**)(void))a6;
  id v12 = a5;
  if ([(ICNoteBrowseViewController *)self ic_isViewVisible]) {
    [(ICNoteBrowseViewController *)self endAnalyticsTracking];
  }
  [(ICNoteBrowseViewController *)self removeKVOObservers];
  if (v11) {
    v11[2](v11);
  }
  [(ICNoteBrowseViewController *)self addKVOObservers];
  unsigned int v13 = [[ICNoteBrowseViewControllerCollectionViewDelegate alloc] initWithNoteBrowseViewController:self];
  [(ICNoteBrowseViewController *)self setCollectionViewDelegate:v13];

  id v14 = [(ICNoteBrowseViewController *)self collectionViewDelegate];
  uint64_t v15 = [(ICNoteResultsViewController *)self collectionView];
  [v15 setDelegate:v14];

  if ([(ICNoteBrowseViewController *)self ic_isViewVisible])
  {
    [(ICNoteBrowseViewController *)self startAnalyticsTracking];
    [(ICNoteBrowseViewController *)self updateBarButtonItemsAnimated:0];
  }
  [(ICNoteBrowseViewController *)self updateDataSourceConfigurationSortTypeChanged:0];
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_100032BA4;
  v27 = &unk_10062A048;
  v28 = self;
  id v29 = v10;
  id v16 = v10;
  [(ICNoteBrowseViewController *)self reloadDataSourceAnimated:v8 dataIndexedBlock:&v24 dataRenderedBlock:v12];

  BOOL v17 = [(ICNoteBrowseViewController *)self noteContainer];
  id v18 = [v17 noteContainerAccount];
  v19 = [v18 identifier];
  v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    v22 = [(ICNoteBrowseViewController *)self noteCollection];
    id v21 = [v22 searchDomainIdentifier];
  }
  if (v21)
  {
    v23 = [(ICBaseViewController *)self noteSearchViewController];
    [v23 setAccountIdentifier:v21];
  }
}

- (void)setNoteContainer:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  CFNullRef v8 = (CFNullRef)a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  id v11 = ICDynamicCast();
  id v12 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v23 = [v11 shortLoggingDescription];
    v24 = v23;
    if (!v23)
    {
      v24 = [(__CFNull *)v8 containerIdentifier];
    }
    *(_DWORD *)buf = 134218242;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Setting note container on note browser %p: %@", buf, 0x16u);
    if (!v23) {
  }
    }
  CFNullRef v13 = [(ICNoteBrowseViewController *)self noteContainer];
  if (kCFNull == v8) {
    CFNullRef v14 = 0;
  }
  else {
    CFNullRef v14 = v8;
  }
  unint64_t v15 = v14;
  if (kCFNull == v13) {
    CFNullRef v16 = 0;
  }
  else {
    CFNullRef v16 = v13;
  }
  unint64_t v17 = v16;
  if (v15 | v17)
  {
    id v18 = (void *)v17;
    if (v15) {
      BOOL v19 = v17 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (v19)
    {
    }
    else
    {
      unsigned int v20 = [(id)v15 isEqual:v17];

      if (v20) {
        goto LABEL_17;
      }
    }
    tagSelection = self->_tagSelection;
    self->_tagSelection = 0;

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100005F20;
    v25[3] = &unk_100625860;
    v25[4] = self;
    CFNullRef v26 = v8;
    [(ICNoteBrowseViewController *)self updateDataSourceAnimated:0 dataIndexedBlock:v9 dataRenderedBlock:v10 updateDataSourceBlock:v25];
    CFNullRef v21 = v26;
    goto LABEL_19;
  }

LABEL_17:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100102424;
  block[3] = &unk_100629FD0;
  block[4] = self;
  CFNullRef v28 = (const __CFNull *)v9;
  id v29 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  CFNullRef v21 = v28;
LABEL_19:
}

- (void)updateDataSourceConfigurationSortTypeChanged:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  id v5 = [(ICNoteBrowseViewController *)self noteDataSource];
  BOOL v6 = [(ICNoteBrowseViewController *)self sortType];
  [v5 setSortType:v6 force:v3];

  uint64_t v7 = [(ICNoteBrowseViewController *)self dateHeadersType];
  CFNullRef v8 = [(ICNoteBrowseViewController *)self noteDataSource];
  [v8 setDateHeadersType:v7];

  BOOL v9 = [(ICNoteBrowseViewController *)self shouldIncludeSubfolders];
  id v10 = [(ICNoteBrowseViewController *)self noteDataSource];
  [v10 setShouldIncludeSubfolders:v9];

  BOOL v11 = [(ICNoteBrowseViewController *)self shouldIncludeTags];
  id v12 = [(ICNoteBrowseViewController *)self noteDataSource];
  [v12 setShouldIncludeTags:v11];

  BOOL v13 = [(ICNoteBrowseViewController *)self shouldIncludeTagDetail];
  CFNullRef v14 = [(ICNoteBrowseViewController *)self noteDataSource];
  [v14 setShouldIncludeTagDetail:v13];

  BOOL v15 = [(ICNoteBrowseViewController *)self shouldIncludeInvitations];
  CFNullRef v16 = [(ICNoteBrowseViewController *)self noteDataSource];
  [v16 setShouldIncludeInvitations:v15];

  objc_copyWeak(&v19, &location);
  unint64_t v17 = [(ICNoteBrowseViewController *)self noteDataSource];
  [v17 setTagSelectionDidChangeHandler:&v18];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (ICQuery)noteQuery
{
  v2 = [(ICNoteBrowseViewController *)self noteDataSource];
  BOOL v3 = [v2 noteQuery];

  return (ICQuery *)v3;
}

- (BOOL)updateFolderSectionVisibility
{
  unsigned __int8 v3 = [(ICNoteBrowseViewController *)self shouldIncludeSubfolders];
  id v4 = [(ICNoteBrowseViewController *)self noteDataSource];
  char v5 = v3 ^ [v4 shouldIncludeSubfolders];

  BOOL v6 = [(ICNoteBrowseViewController *)self shouldIncludeSubfolders];
  uint64_t v7 = [(ICNoteBrowseViewController *)self noteDataSource];
  [v7 setShouldIncludeSubfolders:v6];

  return v5;
}

- (BOOL)shouldIncludeSubfolders
{
  id v4 = [(ICNoteBrowseViewController *)self noteContainer];
  if (!v4)
  {
    v2 = [(ICNoteBrowseViewController *)self noteCollection];
    if (!v2)
    {
      BOOL v6 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  char v5 = [(ICBaseViewController *)self viewControllerManager];
  BOOL v6 = ([v5 hasCompactWidth] & 1) != 0
    || (id)[(ICBaseViewController *)self noteContainerViewMode] == (id)1;

  if (!v4) {
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (NoteCollectionObject)noteCollection
{
  v2 = [(ICNoteBrowseViewController *)self noteDataSource];
  unsigned __int8 v3 = [v2 noteCollection];

  return (NoteCollectionObject *)v3;
}

- (void)updateFocusedNoteIfNeeded
{
  unsigned __int8 v3 = [(ICNoteBrowseViewController *)self noteContainer];
  if (v3)
  {
  }
  else
  {
    id v4 = [(ICNoteBrowseViewController *)self virtualSmartFolder];

    if (!v4) {
      return;
    }
  }
  char v5 = [(ICBaseViewController *)self viewControllerManager];
  BOOL v6 = [v5 focusedNoteObjectID];

  if (!v6)
  {
    id v20 = [(ICBaseViewController *)self viewControllerManager];
    CFNullRef v16 = [v20 selectedNoteObjectID];
    if (v16)
    {

      goto LABEL_10;
    }
    BOOL v15 = [(ICBaseViewController *)self viewControllerManager];
    unint64_t v17 = [v15 selectedInvitationObjectID];
    if (!v17)
    {
      uint64_t v18 = [(ICNoteResultsViewController *)self collectionView];
      unsigned __int8 v19 = [v18 isEditing];

      if (v19) {
        return;
      }
      id v20 = [(ICNoteResultsViewController *)self collectionView];
      [v20 ic_deselectAllItems];
      goto LABEL_10;
    }

LABEL_7:
LABEL_10:
    BOOL v11 = v20;
    goto LABEL_11;
  }
  uint64_t v7 = [(ICNoteBrowseViewController *)self noteDataSource];
  CFNullRef v8 = [v7 collectionViewDiffableDataSource];
  BOOL v9 = [(ICBaseViewController *)self viewControllerManager];
  id v10 = [v9 focusedNoteObjectID];
  id v20 = [v8 indexPathForItemIdentifier:v10];

  BOOL v11 = v20;
  if (v20)
  {
    id v12 = [(ICNoteResultsViewController *)self collectionView];
    [v12 ic_selectCellAtIndexPath:v20 animated:0];

    objc_opt_class();
    BOOL v13 = [(ICNoteResultsViewController *)self collectionView];
    CFNullRef v14 = [v13 cellForItemAtIndexPath:v20];
    BOOL v15 = ICDynamicCast();

    [v15 setSelected:1];
    goto LABEL_7;
  }
LABEL_11:
}

- (void)removeKVOObservers
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unsigned __int8 v3 = [(ICNoteBrowseViewController *)self observedNoteContainerProperties];
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v7);
        BOOL v9 = [(ICNoteBrowseViewController *)self noteContainer];
        [v9 ic_removeObserver:self forKeyPath:v8 context:&off_10069A448];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = [(ICNoteBrowseViewController *)self observedUserDefaultsProperties];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      CFNullRef v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v14);
        CFNullRef v16 = +[NSUserDefaults standardUserDefaults];
        [v16 ic_removeObserver:self forKeyPath:v15 context:&off_10069A448];

        CFNullRef v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }
}

- (void)addKVOObservers
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unsigned __int8 v3 = [(ICNoteBrowseViewController *)self observedNoteContainerProperties];
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v7);
        BOOL v9 = [(ICNoteBrowseViewController *)self noteContainer];
        [v9 ic_addObserver:self forKeyPath:v8 context:&off_10069A448];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = [(ICNoteBrowseViewController *)self observedUserDefaultsProperties];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      CFNullRef v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v14);
        CFNullRef v16 = +[NSUserDefaults standardUserDefaults];
        [v16 ic_addObserver:self forKeyPath:v15 context:&off_10069A448];

        CFNullRef v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }
}

- (NSArray)observedNoteContainerProperties
{
  v2 = [(ICNoteBrowseViewController *)self noteContainer];
  if (v2) {
    unsigned __int8 v3 = &off_10064B608;
  }
  else {
    unsigned __int8 v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (ICNoteBrowseViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4
{
  id v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)ICNoteBrowseViewController;
  uint64_t v7 = [(ICNoteResultsViewController *)&v37 initWithViewMode:a3 viewControllerManager:v6 viewControllerType:0];
  if (v7)
  {
    uint64_t v8 = [ICNoteBrowseCollectionView alloc];
    BOOL v9 = [(ICBaseViewController *)v7 legacyViewContext];
    id v10 = [(ICBaseViewController *)v7 modernViewContext];
    id v11 = [(ICBaseViewController *)v7 viewControllerManager];
    id v12 = [(ICNoteBrowseCollectionView *)v8 initWithPresentingViewController:v7 legacyManagedObjectContext:v9 modernManagedObjectContext:v10 viewControllerManager:v11];
    [(ICNoteResultsViewController *)v7 setCollectionView:v12];

    uint64_t v13 = [(ICNoteBrowseViewController *)v7 noteDataSource];
    CFNullRef v14 = [v13 collectionViewDiffableDataSource];
    uint64_t v15 = [(ICNoteResultsViewController *)v7 collectionView];
    [v15 setDiffableDataSource:v14];

    objc_initWeak(&location, v7);
    objc_copyWeak(&v35, &location);
    CFNullRef v16 = [(ICNoteResultsViewController *)v7 collectionView];
    [v16 setOptimisticallyAppliedSnapshotHandler:&v34];

    long long v17 = [(ICNoteBrowseViewController *)v7 noteDataSource];
    [v17 setNoteContainerViewMode:a3];

    long long v18 = [(ICNoteResultsViewController *)v7 collectionView];
    [v18 setAllowsMultipleSelection:1];

    long long v19 = [(ICNoteResultsViewController *)v7 collectionView];
    [v19 setAllowsMultipleSelectionDuringEditing:1];

    long long v20 = +[NSNotificationCenter defaultCenter];
    long long v21 = [(ICBaseViewController *)v7 modernViewContext];
    [v20 addObserver:v7 selector:"managedObjectContextDidSaveObjectIDs:" name:NSManagedObjectContextDidSaveObjectIDsNotification object:v21];

    long long v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v7 selector:"sceneDidActivate:" name:UISceneDidActivateNotification object:0];

    long long v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v7 selector:"sceneWillDeactivate:" name:UISceneWillDeactivateNotification object:0];

    long long v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v7 selector:"analyticsSessionWillEnd:" name:ICNASessionWillEndNotification object:0];

    uint64_t v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v7 selector:"didUpdateSearchAppearanceNotification:" name:@"ICNoteSearchViewControllerDidUpdateSearchAppearanceNotification" object:0];

    CFNullRef v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v7 selector:"sharedWithYouControllerDidUpdateHighlights:" name:ICSharedWithYouControllerDidUpdateHighlightsNotification object:0];

    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v7 selector:"accessibilityStatusDidChange" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

    CFNullRef v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v7 selector:"accessibilityStatusDidChange" name:UIAccessibilitySwitchControlStatusDidChangeNotification object:0];

    id v29 = +[ICAppDelegate sharedInstance];
    v30 = [v29 cloudContextDelegate];
    v31 = ICKeyPathFromSelector();
    [v30 ic_addObserver:v7 forKeyPath:v31 context:&off_10069A448];

    __int16 v32 = [(ICBaseViewController *)v7 viewControllerManager];
    [v32 ic_addObserver:v7 forKeyPath:@"focusedNoteObjectID" context:&off_10069A448];

    [(ICNoteBrowseViewController *)v7 addKVOObservers];
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)updateBarButtonItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(ICNoteBrowseViewController *)self updateSummaryView];
  id v5 = +[ICAuthenticationState sharedState];
  id v6 = [v5 isAuthenticated];
  uint64_t v7 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v7 setAuthenticated:v6];

  uint64_t v8 = [(ICBaseViewController *)self viewControllerManager];
  id v9 = [v8 canAddNewNoteToSelectedContainers];
  id v10 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v10 setCanAddNote:v9];

  BOOL v11 = [(ICNoteBrowseViewController *)self shouldShowTagAssignmentBarButtonItem];
  id v12 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v12 setCanAssignTags:v11];

  uint64_t v13 = [(ICNoteBrowseViewController *)self noteContainer];
  id v14 = [v13 canBeSharedViaICloud];
  uint64_t v15 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v15 setCanBeShared:v14];

  CFNullRef v16 = [(ICBaseViewController *)self viewControllerManager];
  id v17 = [v16 hasCompactWidth];
  long long v18 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v18 setCompactWidth:v17];

  long long v19 = [(ICBaseViewController *)self viewControllerManager];
  id v20 = [v19 hasCompactHeight];
  long long v21 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v21 setCompactHeight:v20];

  id v22 = [(ICNoteBrowseViewController *)self isEditing];
  long long v23 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v23 setEditing:v22];

  int64_t v24 = [(ICBaseViewController *)self noteContainerViewMode];
  uint64_t v25 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v25 setNoteContainerViewMode:v24];

  CFNullRef v26 = [(ICNoteBrowseViewController *)self allNotes];
  id v27 = [v26 count];
  CFNullRef v28 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v28 setNoteCount:v27];

  id v29 = [(ICNoteBrowseViewController *)self selectedNotes];
  id v30 = [v29 count];
  v31 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v31 setSelectedNoteCount:v30];

  __int16 v32 = [(ICNoteBrowseViewController *)self noteContainer];
  id v33 = [v32 isSharedViaICloud];
  uint64_t v34 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v34 setShared:v33];

  BOOL v35 = [(ICNoteBrowseViewController *)self shouldShowEmptyState];
  v36 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v36 setShowingEmptyState:v35];

  if (ICDebugModeEnabled() && [(ICNoteBrowseViewController *)self ic_behavior] == (id)1) {
    uint64_t v37 = [(ICNoteBrowseViewController *)self isTrashFolder] ^ 1;
  }
  else {
    uint64_t v37 = 0;
  }
  v38 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v38 setShowsDebugItem:v37];

  BOOL v39 = [(ICNoteBrowseViewController *)self isTrashFolder];
  v40 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v40 setTrashFolder:v39];

  if (+[UIDevice ic_isVision]) {
    BOOL v41 = (id)[(ICBaseViewController *)self noteContainerViewMode] == (id)1;
  }
  else {
    BOOL v41 = 0;
  }
  v42 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v42 setUsesCustomBackButton:v41];

  id v43 = +[UIDevice ic_isVision];
  v44 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v44 setUsesPlainBarButtonItems:v43];

  v45 = [(ICNoteBrowseViewController *)self noteContainer];

  if (v45)
  {
    uint64_t v46 = 1;
  }
  else
  {
    v47 = [(ICNoteBrowseViewController *)self noteCollection];

    if (v47)
    {
      uint64_t v46 = 2;
    }
    else
    {
      v48 = [(ICNoteBrowseViewController *)self noteQuery];

      if (v48)
      {
        uint64_t v46 = 3;
      }
      else
      {
        v49 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
        BOOL v50 = v49 != 0;

        uint64_t v46 = 4 * v50;
      }
    }
  }
  v51 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v51 setCollectionType:v46];

  if ([(ICNoteBrowseViewController *)self numberOfSelectedItems]) {
    [(ICNoteBrowseViewController *)self selectedNotes];
  }
  else {
  id v61 = [(ICNoteBrowseViewController *)self allNotes];
  }
  if (-[ICNoteBrowseViewController isEditing](self, "isEditing") && [v61 count]) {
    id v52 = [v61 ic_allSatisfy:&stru_10062A0D8];
  }
  else {
    id v52 = 0;
  }
  v53 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v53 setCanMoveNotes:v52];

  if (-[ICNoteBrowseViewController isEditing](self, "isEditing") && [v61 count]) {
    id v54 = [v61 ic_allSatisfy:&stru_10062A0F8];
  }
  else {
    id v54 = 0;
  }
  v55 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v55 setCanDeleteNotes:v54];

  v56 = [(ICNoteBrowseViewController *)self navigationItemConfiguration];
  [v56 updateAnimated:v3];

  int64_t v57 = [(ICBaseViewController *)self noteContainerViewMode];
  if (v57 == 1)
  {
    v56 = [(ICNoteBrowseViewController *)self navigationController];
    if ([v56 isToolbarHidden]
      && ![(ICNoteBrowseViewController *)self shouldShowEmptyState])
    {
      v55 = [(ICBaseViewController *)self viewControllerManager];
      uint64_t v59 = [v55 hasCompactWidth] ^ 1;
      int v58 = 1;
    }
    else
    {
      int v58 = 0;
      uint64_t v59 = 0;
    }
  }
  else
  {
    int v58 = 0;
    uint64_t v59 = 0;
  }
  v60 = [(ICNoteResultsViewController *)self collectionView];
  [v60 setShouldShowSummaryFooter:v59];

  if (v58) {
  if (v57 == 1)
  }
}

- (ICNoteBrowseNavigationItemConfiguration)navigationItemConfiguration
{
  return self->_navigationItemConfiguration;
}

- (ICNoteContainer)noteContainer
{
  v2 = [(ICNoteBrowseViewController *)self noteDataSource];
  BOOL v3 = [v2 noteContainer];

  return (ICNoteContainer *)v3;
}

- (ICNoteBrowseDataSource)noteDataSource
{
  noteDataSource = self->_noteDataSource;
  if (noteDataSource)
  {
    BOOL v3 = noteDataSource;
  }
  else
  {
    id v5 = [ICNoteBrowseDataSource alloc];
    id v6 = [(ICNoteResultsViewController *)self collectionView];
    int64_t v7 = [(ICBaseViewController *)self noteContainerViewMode];
    uint64_t v8 = [(ICBaseViewController *)self viewControllerManager];
    id v9 = [v8 folderListViewController];
    id v10 = [v9 folderDataSource];
    BOOL v11 = [(ICBaseViewController *)self viewControllerManager];
    id v12 = [v11 persistenceConfiguration];
    uint64_t v13 = [(ICNoteBrowseDataSource *)v5 initWithCollectionView:v6 presentingViewController:self noteContainerViewMode:v7 folderDataSource:v10 persistenceConfiguration:v12];
    id v14 = self->_noteDataSource;
    self->_noteDataSource = v13;

    uint64_t v15 = +[ICNoteContext sharedContext];
    CFNullRef v16 = [v15 workerManagedObjectContext];
    [(ICNoteBrowseDataSource *)self->_noteDataSource setApplySnapshotModernManagedObjectContext:v16];

    objc_initWeak(&location, self);
    long long v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_1001048C0;
    long long v21 = &unk_100625598;
    objc_copyWeak(&v22, &location);
    [(ICNoteBrowseDataSource *)self->_noteDataSource setWillExpandItemHandler:&v18];
    [(ICNoteBrowseViewController *)self updateFolderSectionVisibility];
    BOOL v3 = self->_noteDataSource;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (NSArray)allNotes
{
  BOOL v3 = [(ICNoteBrowseViewController *)self noteDataSource];
  id v4 = [v3 collectionViewDiffableDataSource];
  id v5 = [v4 snapshot];

  id v6 = [v5 itemIdentifiers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001047D4;
  v9[3] = &unk_10062A098;
  v9[4] = self;
  int64_t v7 = [v6 ic_compactMap:v9];

  return (NSArray *)v7;
}

- (NSArray)selectedNotes
{
  BOOL v3 = [(ICNoteResultsViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];

  id v5 = [(ICNoteBrowseViewController *)self notesForIndexPaths:v4];

  return (NSArray *)v5;
}

- (id)notesForIndexPaths:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100104DDC;
  v8[3] = &unk_10062A120;
  v8[4] = self;
  id v4 = [a3 ic_compactMap:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100104E8C;
  v7[3] = &unk_10062A148;
  v7[4] = self;
  id v5 = [v4 ic_compactMap:v7];

  return v5;
}

- (void)updateSummaryView
{
  if (([(ICNoteBrowseViewController *)self ic_isViewVisible] & 1) == 0
    && [(ICNoteBrowseViewController *)self _appearState] != 1)
  {
    return;
  }
  if ((id)[(ICBaseViewController *)self noteContainerViewMode] == (id)1
    || [(ICNoteBrowseViewController *)self shouldShowEmptyState])
  {
    BOOL v3 = [(ICBaseViewController *)self viewControllerManager];
    unsigned int v4 = [v3 hasCompactHeight] ^ 1;
  }
  else
  {
    unsigned int v4 = 0;
  }
  id v5 = [(ICBaseViewController *)self viewControllerManager];
  unsigned int v6 = [v5 hasCompactWidth];

  if ([(ICBaseViewController *)self isShowingActiveSearch] || (v4 & ~v6) != 0)
  {
    id v9 = [(ICNoteResultsViewController *)self collectionView];
    id v10 = [v9 visibleSupplementaryViewsOfKind:UICollectionElementKindSectionFooter];
    uint64_t v8 = [v10 firstObject];

    objc_opt_class();
    BOOL v11 = ICCheckedDynamicCast();
    [(ICNoteBrowseViewController *)self setSummaryView:v11];
  }
  else
  {
    int64_t v7 = [(ICNoteBrowseViewController *)self summaryView];

    if (v7) {
      goto LABEL_13;
    }
    uint64_t v8 = -[ICToolbarSummaryView initWithFrame:]([ICToolbarSummaryView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(ICNoteBrowseViewController *)self setSummaryView:v8];
  }

LABEL_13:
  id v12 = [(ICNoteBrowseViewController *)self noteContainer];
  uint64_t v13 = [v12 noteContainerAccount];
  unsigned int v14 = [v13 accountType];

  uint64_t v15 = [(ICNoteBrowseViewController *)self summaryView];
  [v15 setHidden:0];

  CFNullRef v16 = [(ICNoteBrowseViewController *)self noteDataSource];
  id v17 = [v16 totalNoteCount];
  long long v18 = [(ICNoteBrowseViewController *)self summaryView];
  [v18 setTotalNoteCount:v17];

  uint64_t v19 = [(ICNoteBrowseViewController *)self noteDataSource];
  id v20 = [v19 totalFolderCount];
  long long v21 = [(ICNoteBrowseViewController *)self summaryView];
  [v21 setTotalFolderCount:v20];

  id v22 = [(ICNoteBrowseViewController *)self noteDataSource];
  id v23 = [v22 totalInvitationsCount];
  int64_t v24 = [(ICNoteBrowseViewController *)self summaryView];
  [v24 setTotalInvitationsCount:v23];

  uint64_t v25 = +[ICAuthenticationState sharedState];
  uint64_t v26 = [v25 isAuthenticated] ^ 1;
  id v27 = [(ICNoteBrowseViewController *)self summaryView];
  [v27 setLockNowHidden:v26];

  CFNullRef v28 = [(ICNoteBrowseViewController *)self summaryView];
  [v28 setSyncActivityVisible:v14 == 1];

  [(ICNoteBrowseViewController *)self availableWidthForSummaryView];
  double v30 = v29;
  v31 = [(ICNoteBrowseViewController *)self summaryView];
  [v31 setAvailableWidth:v30];

  if (v14 == 1)
  {
    v31 = +[ICAppDelegate sharedInstance];
    CFNullRef v28 = [v31 cloudContextDelegate];
    __int16 v32 = [v28 syncMessage];
  }
  else
  {
    __int16 v32 = 0;
  }
  id v33 = [(ICNoteBrowseViewController *)self summaryView];
  [v33 setSyncMessage:v32];

  if (v14 == 1)
  {
  }
  uint64_t v34 = [(ICNoteBrowseViewController *)self summaryView];
  [v34 setDelegate:self];

  BOOL v35 = [(ICNoteBrowseViewController *)self summaryView];
  [v35 update];

  id v36 = [(ICNoteBrowseViewController *)self summaryView];
  uint64_t v37 = [v36 syncMessage];
  if (v37)
  {
    v38 = (void *)v37;
    int64_t v39 = [(ICBaseViewController *)self noteContainerViewMode];

    if (v39 != 1) {
      goto LABEL_22;
    }
    id v36 = objc_alloc_init((Class)UICollectionViewLayoutInvalidationContext);
    v40 = [(ICNoteResultsViewController *)self collectionView];
    BOOL v41 = [v40 indexPathsForVisibleSupplementaryElementsOfKind:UICollectionElementKindSectionFooter];

    [v36 invalidateSupplementaryElementsOfKind:UICollectionElementKindSectionFooter atIndexPaths:v41];
    v42 = [(ICNoteResultsViewController *)self collectionView];
    id v43 = [v42 collectionViewLayout];
    [v43 invalidateLayoutWithContext:v36];
  }
LABEL_22:
  [(ICNoteBrowseViewController *)self setNeedsUpdateContentUnavailableConfiguration];
  if (+[UIDevice ic_isVision])
  {
    double v44 = ICNoteEditorPillOrnamentViewControllerInsets;
    id v45 = [(ICNoteBrowseViewController *)self navigationController];
    [v45 setAdditionalSafeAreaInsets:0.0, 0.0, v44, 0.0];
  }
}

- (BOOL)shouldShowTagAssignmentBarButtonItem
{
  BOOL v3 = [(ICNoteBrowseViewController *)self selectedNotes];
  id v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  id v5 = [(ICNoteBrowseViewController *)self selectedNotes];
  unsigned int v6 = [v5 ic_objectsPassingTest:&stru_10062A168];
  id v7 = [v6 count];

  uint64_t v8 = [(ICNoteBrowseViewController *)self selectedNotes];
  id v9 = [v8 count];

  if (v9 > v7) {
    return 0;
  }
  if ([(ICNoteBrowseViewController *)self isTrashFolder]) {
    return 0;
  }
  id v12 = [(ICBaseViewController *)self modernViewContext];
  uint64_t v13 = +[ICHashtag allVisibleHashtagsInContext:v12];
  BOOL v10 = [v13 count] != 0;

  return v10;
}

- (BOOL)shouldShowEmptyState
{
  BOOL v3 = [(ICNoteBrowseViewController *)self noteDataSource];
  if ([v3 totalNoteCount])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(ICNoteBrowseViewController *)self noteDataSource];
    if ([v5 totalFolderCount])
    {
      BOOL v4 = 0;
    }
    else
    {
      unsigned int v6 = [(ICNoteBrowseViewController *)self noteDataSource];
      if ([v6 totalInvitationsCount])
      {
        BOOL v4 = 0;
      }
      else
      {
        id v7 = [(ICNoteResultsViewController *)self collectionView];
        if ([v7 numberOfSections])
        {
          uint64_t v8 = [(ICNoteBrowseViewController *)self noteQuery];
          if (v8) {
            BOOL v4 = 1;
          }
          else {
            BOOL v4 = [(ICNoteBrowseViewController *)self ic_behavior] == (id)1;
          }
        }
        else
        {
          BOOL v4 = 1;
        }
      }
    }
  }
  return v4;
}

- (unint64_t)numberOfSelectedItems
{
  v2 = [(ICNoteResultsViewController *)self collectionView];
  BOOL v3 = [v2 indexPathsForSelectedItems];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (BOOL)isTrashFolder
{
  v2 = [(ICNoteBrowseViewController *)self noteDataSource];
  unsigned __int8 v3 = [v2 isTrashFolder];

  return v3;
}

- (NSArray)observedUserDefaultsProperties
{
  unsigned __int8 v3 = +[NSMutableArray array];
  [v3 ic_addNonNilObject:ICSettingsNoteListSortTypeKey];
  [v3 ic_addNonNilObject:ICFolderCustomNoteSortTypeQuerySortKey];
  [v3 ic_addNonNilObject:ICSettingsNoteDateHeadersTypeKey];
  [v3 ic_addNonNilObject:ICSettingsQueryDateHeadersTypeKey];
  id v4 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
  id v5 = [v4 noteSortTypeUserDefaultsKey];
  [v3 ic_addNonNilObject:v5];

  unsigned int v6 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
  id v7 = [v6 dateHeadersTypeUserDefaultsKey];
  [v3 ic_addNonNilObject:v7];

  return (NSArray *)v3;
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  v2 = [(ICNoteBrowseViewController *)self noteDataSource];
  unsigned __int8 v3 = [v2 virtualSmartFolder];

  return (ICVirtualSmartFolderItemIdentifier *)v3;
}

- (void)updateNavigationTitle
{
}

- (void)setShouldAvoidEditingChanges:(BOOL)a3
{
  self->_shouldAvoidEditingChanges = a3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(ICNoteBrowseViewController *)self isEditing] != a3
    && ![(ICNoteBrowseViewController *)self shouldAvoidEditingChanges])
  {
    v15.receiver = self;
    v15.super_class = (Class)ICNoteBrowseViewController;
    [(ICBaseViewController *)&v15 setEditing:v5 animated:v4];
    if (v5)
    {
      uint64_t v7 = 3;
    }
    else if ((id)[(ICBaseViewController *)self noteContainerViewMode] == (id)1)
    {
      uint64_t v7 = 3;
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v8 = [(ICNoteBrowseViewController *)self noteDataSource];
    [v8 setAutoExpandMode:v7];

    +[CATransaction begin];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001032D8;
    v14[3] = &unk_100625AF0;
    v14[4] = self;
    +[CATransaction setCompletionBlock:v14];
    +[CATransaction commit];
    if (v4)
    {
      id v9 = [(ICNoteResultsViewController *)self collectionView];
      [v9 setEditing:v5];
    }
    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100103330;
      v12[3] = &unk_100625D18;
      v12[4] = self;
      BOOL v13 = v5;
      +[UIView performWithoutAnimation:v12];
    }
    [(ICNoteBrowseViewController *)self updateBarButtonItemsAnimated:v4];
    BOOL v10 = [(ICNoteBrowseViewController *)self tagDetailCell];
    [v10 setNeedsUpdateConfiguration];

    if (v5)
    {
      BOOL v11 = +[NSNotificationCenter defaultCenter];
      [v11 postNotificationName:@"ICNoteBrowseViewControllerDidStartEditingNotification" object:self];
    }
  }
}

- (void)setCollectionViewDelegate:(id)a3
{
}

- (ICNoteBrowseViewControllerCollectionViewDelegate)collectionViewDelegate
{
  return self->_collectionViewDelegate;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteBrowseViewController;
  [(ICNoteBrowseViewController *)&v4 loadView];
  unsigned __int8 v3 = [(ICNoteResultsViewController *)self collectionView];
  [(ICNoteBrowseViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteBrowseViewController;
  [(ICNoteResultsViewController *)&v4 viewDidLoad];
  unsigned __int8 v3 = [[ICNoteBrowseNavigationItemConfiguration alloc] initWithDataSource:self delegate:self];
  [(ICNoteBrowseViewController *)self setNavigationItemConfiguration:v3];
}

- (void)sceneWillDeactivate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [v4 object];

  ICDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  unsigned int v6 = [v14 session];
  uint64_t v7 = [v6 persistentIdentifier];
  uint64_t v8 = [(ICNoteBrowseViewController *)self viewIfLoaded];
  id v9 = [v8 window];
  BOOL v10 = [v9 windowScene];
  BOOL v11 = [v10 session];
  id v12 = [v11 persistentIdentifier];
  unsigned int v13 = [v7 isEqual:v12];

  if (v13 && [(ICNoteBrowseViewController *)self ic_isViewVisible]) {
    [(ICNoteBrowseViewController *)self endAnalyticsTracking];
  }
}

- (void)analyticsSessionWillEnd:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [v4 object];

  ICDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  unsigned int v6 = [v14 session];
  uint64_t v7 = [v6 persistentIdentifier];
  uint64_t v8 = [(ICNoteBrowseViewController *)self viewIfLoaded];
  id v9 = [v8 window];
  BOOL v10 = [v9 windowScene];
  BOOL v11 = [v10 session];
  id v12 = [v11 persistentIdentifier];
  unsigned int v13 = [v7 isEqual:v12];

  if (v13) {
    [(ICNoteBrowseViewController *)self endAnalyticsTracking];
  }
}

- (void)dealloc
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[ICAppDelegate sharedInstance];
  BOOL v5 = [v4 cloudContextDelegate];
  unsigned int v6 = ICKeyPathFromSelector();
  [v5 ic_removeObserver:self forKeyPath:v6 context:&off_10069A448];

  uint64_t v7 = [(ICBaseViewController *)self viewControllerManager];
  [v7 ic_removeObserver:self forKeyPath:@"focusedNoteObjectID" context:&off_10069A448];

  [(ICNoteBrowseViewController *)self removeKVOObservers];
  v8.receiver = self;
  v8.super_class = (Class)ICNoteBrowseViewController;
  [(ICNoteResultsViewController *)&v8 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteResultsViewController viewWillAppear:](&v32, "viewWillAppear:");
  [(ICNoteBrowseViewController *)self resetBarButtonItemsAnimated:v3];
  [(ICNoteBrowseViewController *)self updateTagDetailOperatorMenuVisibility];
  if ([(ICNoteBrowseViewController *)self isMovingToParentViewController])
  {
    if (([(ICNoteBrowseViewController *)self ic_isBeingRevealedFromPoppingViewController] & 1) == 0)
    {
      BOOL v5 = [(ICNoteBrowseViewController *)self transitionCoordinator];
      if (v5)
      {
        unsigned int v6 = [(ICNoteBrowseViewController *)self transitionCoordinator];
        unsigned __int8 v7 = [v6 isCancelled];

        if ((v7 & 1) == 0)
        {
          objc_super v8 = [(ICNoteBrowseViewController *)self navigationItem];
          [v8 setHidesSearchBarWhenScrolling:0];
        }
      }
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = [(ICNoteResultsViewController *)self collectionView];
  BOOL v10 = [v9 indexPathsForVisibleItems];

  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      unsigned int v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v13);
        objc_opt_class();
        objc_super v15 = [(ICNoteResultsViewController *)self collectionView];
        CFNullRef v16 = [v15 cellForItemAtIndexPath:v14];
        id v17 = ICDynamicCast();

        [v17 updateSubfolderCount];
        [v17 updateNoteCount];

        unsigned int v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }

  objc_initWeak(&location, self);
  uint64_t v18 = [(ICNoteBrowseViewController *)self view];
  id v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  int64_t v24 = sub_100101CF8;
  uint64_t v25 = &unk_1006286A8;
  objc_copyWeak(&v26, &location);
  [v18 ic_addCreateNoteInteractionWithFolderHandler:&v22];

  uint64_t v19 = [(ICNoteBrowseViewController *)self noteCollection];
  LOBYTE(v18) = v19 == 0;

  if ((v18 & 1) == 0)
  {
    id v20 = +[NotesApp sharedNotesApp];
    long long v21 = [(ICNoteBrowseViewController *)self noteCollection];
    [v20 refreshNotesIfNeededForCollection:v21];
  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)ICNoteBrowseViewController;
  [(ICNoteResultsViewController *)&v17 viewDidAppear:a3];
  uint64_t v5 = ICAccessibilityNeedsAccessibilityElements() ^ 1;
  unsigned int v6 = [(ICNoteBrowseViewController *)self navigationItem];
  [v6 setHidesSearchBarWhenScrolling:v5];

  unsigned __int8 v7 = +[ICAppDelegate sharedInstance];
  [v7 didFinishExtendedLaunch];

  objc_super v8 = +[UIApplication sharedApplication];
  LODWORD(v6) = [v8 isRunningTest];

  if (v6)
  {
    if ([(ICBaseViewController *)self noteContainerViewMode])
    {
      if ((id)[(ICBaseViewController *)self noteContainerViewMode] != (id)1) {
        goto LABEL_7;
      }
      id v9 = +[ICAppDelegate sharedInstance];
      [v9 didShowGridView];
    }
    else
    {
      id v9 = +[ICAppDelegate sharedInstance];
      [v9 didShowNotesList];
    }
  }
LABEL_7:
  [(ICNoteBrowseViewController *)self startAnalyticsTracking];
  BOOL v10 = [(ICBaseViewController *)self noteSearchViewController];
  id v11 = [v10 accountIdentifier];

  if (!v11)
  {
    uint64_t v12 = [(ICNoteBrowseViewController *)self noteContainer];
    unsigned int v13 = [v12 noteContainerAccount];
    uint64_t v14 = [v13 identifier];
    objc_super v15 = v14;
    if (!v14)
    {
      BOOL v3 = [(ICNoteBrowseViewController *)self noteCollection];
      objc_super v15 = [v3 searchDomainIdentifier];
    }
    CFNullRef v16 = [(ICBaseViewController *)self noteSearchViewController];
    [v16 setAccountIdentifier:v15];

    if (!v14)
    {
    }
  }
  [(ICNoteResultsViewController *)self updatePreparedCells];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(ICNoteBrowseViewController *)self endAnalyticsTracking];
  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseViewController;
  [(ICNoteBrowseViewController *)&v6 viewWillDisappear:v3];
  uint64_t v5 = [(ICNoteBrowseViewController *)self view];
  [v5 ic_removeLinkActionInteractions];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)ICNoteBrowseViewController;
  id v7 = a4;
  -[ICNoteBrowseViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001021D8;
  v9[3] = &unk_100625AC8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001021E0;
  v8[3] = &unk_100625AC8;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)ICNoteBrowseViewController;
  [(ICNoteBrowseViewController *)&v14 viewDidLayoutSubviews];
  BOOL v3 = [(ICNoteBrowseViewController *)self summaryView];
  [v3 availableWidth];
  double v5 = v4;
  [(ICNoteBrowseViewController *)self availableWidthForSummaryView];
  double v7 = vabdd_f64(v5, v6);

  if (v7 >= 0.00999999978)
  {
    [(ICNoteBrowseViewController *)self availableWidthForSummaryView];
    double v9 = v8;
    objc_super v10 = [(ICNoteBrowseViewController *)self summaryView];
    [v10 setAvailableWidth:v9];

    id v11 = [(ICNoteBrowseViewController *)self summaryView];
    [v11 update];
  }
  uint64_t v12 = +[UIApplication sharedApplication];
  if (![v12 isRunningTest]) {
    goto LABEL_7;
  }
  unsigned int v13 = [(ICNoteBrowseViewController *)self _appearState];

  if (v13 == 1 && ![(ICBaseViewController *)self noteContainerViewMode])
  {
    uint64_t v12 = +[ICAppDelegate sharedInstance];
    [v12 noteListDidLayoutSubviews];
LABEL_7:
  }
}

- (void)viewLayoutMarginsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)ICNoteBrowseViewController;
  [(ICNoteBrowseViewController *)&v5 viewLayoutMarginsDidChange];
  if (+[UIDevice ic_isVision])
  {
    BOOL v3 = [(ICBaseViewController *)self noteSearchViewController];
    double v4 = [v3 searchBar];
    [v4 _setOverrideContentInsets:10 forRectEdges:0.0, 12.0, 0.0, 12.0];
  }
}

- (void)willDismissSearchController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseViewController;
  [(ICBaseViewController *)&v6 willDismissSearchController:a3];
  double v4 = [(ICNoteBrowseViewController *)self navigationController];
  objc_super v5 = [v4 topViewController];

  if (v5 == self) {
    [(ICNoteBrowseViewController *)self updateBarButtonItemsAnimated:0];
  }
}

- (void)setNoteContainer:(id)a3
{
}

- (void)setNoteCollection:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  CFNullRef v8 = (CFNullRef)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1004DBD74((uint64_t)self, v8, v11);
  }

  CFNullRef v12 = [(ICNoteBrowseViewController *)self noteCollection];
  if (kCFNull == v8) {
    CFNullRef v13 = 0;
  }
  else {
    CFNullRef v13 = v8;
  }
  unint64_t v14 = v13;
  if (kCFNull == v12) {
    CFNullRef v15 = 0;
  }
  else {
    CFNullRef v15 = v12;
  }
  unint64_t v16 = v15;
  if (v14 | v16)
  {
    objc_super v17 = (void *)v16;
    if (v14) {
      BOOL v18 = v16 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18)
    {
    }
    else
    {
      unsigned int v19 = [(id)v14 isEqual:v16];

      if (v19) {
        goto LABEL_18;
      }
    }
    tagSelection = self->_tagSelection;
    self->_tagSelection = 0;

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100102790;
    v22[3] = &unk_100625860;
    v22[4] = self;
    CFNullRef v23 = v8;
    [(ICNoteBrowseViewController *)self updateDataSourceAnimated:0 dataIndexedBlock:v9 dataRenderedBlock:v10 updateDataSourceBlock:v22];
    CFNullRef v20 = v23;
    goto LABEL_20;
  }

LABEL_18:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001026F8;
  block[3] = &unk_100629FD0;
  block[4] = self;
  CFNullRef v25 = (const __CFNull *)v9;
  id v26 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  CFNullRef v20 = v25;
LABEL_20:
}

- (void)setNoteCollection:(id)a3
{
}

- (void)setNoteQuery:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  CFNullRef v8 = (const __CFNull *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1004DBE28();
  }

  CFNullRef v12 = [(ICNoteBrowseViewController *)self noteQuery];
  if (kCFNull == v8) {
    CFNullRef v13 = 0;
  }
  else {
    CFNullRef v13 = v8;
  }
  unint64_t v14 = v13;
  if (kCFNull == v12) {
    CFNullRef v15 = 0;
  }
  else {
    CFNullRef v15 = v12;
  }
  unint64_t v16 = v15;
  if (v14 | v16)
  {
    objc_super v17 = (void *)v16;
    if (v14) {
      BOOL v18 = v16 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18)
    {
    }
    else
    {
      unsigned int v19 = [(id)v14 isEqual:v16];

      if (v19) {
        goto LABEL_18;
      }
    }
    long long v21 = [(ICNoteBrowseViewController *)self noteQuery];
    BOOL v22 = v21 != 0;

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100102AD0;
    v23[3] = &unk_100625860;
    v23[4] = self;
    CFNullRef v24 = v8;
    [(ICNoteBrowseViewController *)self updateDataSourceAnimated:v22 dataIndexedBlock:v9 dataRenderedBlock:v10 updateDataSourceBlock:v23];
    CFNullRef v20 = v24;
    goto LABEL_20;
  }

LABEL_18:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100102A38;
  block[3] = &unk_100629FD0;
  block[4] = self;
  CFNullRef v26 = (const __CFNull *)v9;
  id v27 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  CFNullRef v20 = v26;
LABEL_20:
}

- (void)setNoteQuery:(id)a3
{
}

- (void)setVirtualSmartFolder:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  CFNullRef v8 = (const __CFNull *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1004DBE90();
  }

  CFNullRef v12 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
  if (kCFNull == v8) {
    CFNullRef v13 = 0;
  }
  else {
    CFNullRef v13 = v8;
  }
  unint64_t v14 = v13;
  if (kCFNull == v12) {
    CFNullRef v15 = 0;
  }
  else {
    CFNullRef v15 = v12;
  }
  unint64_t v16 = v15;
  if (!(v14 | v16))
  {

LABEL_18:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100102DD8;
    block[3] = &unk_100629FD0;
    block[4] = self;
    CFNullRef v31 = (const __CFNull *)v9;
    id v32 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    CFNullRef v20 = v31;
    goto LABEL_22;
  }
  objc_super v17 = (void *)v16;
  if (v14) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
  }
  else
  {
    unsigned int v19 = [(id)v14 isEqual:v16];

    if (v19) {
      goto LABEL_18;
    }
  }
  tagSelection = self->_tagSelection;
  self->_tagSelection = 0;

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100102E70;
  v28[3] = &unk_100625860;
  v28[4] = self;
  CFNullRef v22 = v8;
  CFNullRef v29 = v22;
  [(ICNoteBrowseViewController *)self updateDataSourceAnimated:0 dataIndexedBlock:v9 dataRenderedBlock:v10 updateDataSourceBlock:v28];
  CFNullRef v23 = [(__CFNull *)v22 type];
  unsigned int v24 = [v23 isEqual:ICVirtualSmartFolderItemIdentifierTypeSharedWithYou];

  if (v24)
  {
    CFNullRef v25 = +[ICCollaborationController sharedInstance];
    CFNullRef v26 = [(__CFNull *)v22 accountObjectID];
    id v27 = +[ICInvitationsCoreDataIndexer defaultReceivedSince];
    [v25 updatePendingInvitationsInAccountWithID:v26 receivedSince:v27];
  }
  CFNullRef v20 = v29;
LABEL_22:
}

- (void)setVirtualSmartFolder:(id)a3
{
}

- (void)setTagSelection:(id)a3
{
}

- (void)setTagSelection:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  CFNullRef v12 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1004DBEF8();
  }

  CFNullRef v13 = [(ICNoteBrowseViewController *)self tagDetailCell];
  [v13 updateForTagSelection:v9 animated:1];

  unint64_t v14 = [(ICNoteBrowseViewController *)self tagSelection];
  BOOL v15 = v14 != 0;

  objc_storeStrong((id *)&self->_tagSelection, a3);
  [(ICNoteBrowseViewController *)self submitTagSelectionAnalyticsIfNeeded];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100103090;
  v20[3] = &unk_100625B40;
  v20[4] = self;
  id v21 = v10;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001030E4;
  v18[3] = &unk_100625860;
  v18[4] = self;
  id v19 = v9;
  id v16 = v9;
  id v17 = v10;
  [(ICNoteBrowseViewController *)self updateDataSourceAnimated:v15 dataIndexedBlock:v11 dataRenderedBlock:v20 updateDataSourceBlock:v18];
}

- (void)updateTagSelectionIfNeeded
{
  BOOL v3 = [(ICNoteBrowseViewController *)self tagSelection];

  if (v3)
  {
    tagSelection = self->_tagSelection;
    [(ICNoteBrowseViewController *)self setTagSelection:tagSelection];
  }
}

- (BOOL)hasDeletableNoteCell
{
  BOOL v3 = [(ICNoteResultsViewController *)self collectionView];
  double v4 = [v3 indexPathsForFocusedItems];
  if ([v4 count])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_super v6 = [(ICBaseViewController *)self viewControllerManager];
    double v7 = [v6 focusedNoteObjectID];
    BOOL v5 = v7 != 0;
  }
  CFNullRef v8 = [(ICNoteResultsViewController *)self collectionView];
  if ([v8 isEditing])
  {
    id v9 = [(ICNoteResultsViewController *)self collectionView];
    id v10 = [v9 indexPathsForSelectedItems];
    BOOL v11 = [v10 count] != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  if (v5 || v11) {
    return ![(ICNoteBrowseViewController *)self needsToConfirmDeletion];
  }
  else {
    return 0;
  }
}

- (BOOL)canBecomeFirstResponder
{
  objc_super v6 = [(ICBaseViewController *)self viewControllerManager];
  BOOL v3 = [v6 activeEditorController];
  unsigned __int8 v4 = [v3 wantsToRemainFirstResponder];

  unsigned int v5 = [(ICNoteBrowseViewController *)self _appearState];
  LOBYTE(v6) = 0;
  if ((v4 & 1) == 0 && v5 == 2)
  {
    double v7 = [(ICNoteBrowseViewController *)self view];
    CFNullRef v8 = [v7 window];
    id v9 = [v8 rootViewController];
    id v10 = [v9 ic_topViewController];
    LODWORD(v6) = [v10 ic_hasFullScreenModalPresentationStyle] ^ 1;
  }
  return (char)v6;
}

- (void)deleteNotes:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFNullRef v8 = [ICDeleteDecisionController alloc];
  id v9 = [(ICNoteBrowseViewController *)self view];
  id v10 = [v9 window];
  BOOL v11 = [(ICNoteBrowseViewController *)self eventReporter];
  CFNullRef v12 = [(ICDeleteDecisionController *)v8 initWithSourceObjects:v6 window:v10 sender:v7 eventReporter:v11];

  objc_initWeak(&location, self);
  [(ICNoteBrowseViewController *)self setNeedsToConfirmDeletion:1];
  id v13 = [v6 count];
  unint64_t v14 = [(ICNoteBrowseViewController *)self allNotes];
  id v15 = [v14 count];

  [(ICNoteBrowseViewController *)self setShouldAvoidEditingChanges:v13 == v15];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100103604;
  v16[3] = &unk_100629FF8;
  objc_copyWeak(&v17, &location);
  BOOL v18 = v13 == v15;
  v16[4] = self;
  [(ICDeleteDecisionController *)v12 performDecisionWithCompletion:v16];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)moveNotes:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned int v5 = [[ICMoveDecisionController alloc] initWithSourceObjects:v4 presentingViewController:self];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100103830;
  v6[3] = &unk_10062A020;
  objc_copyWeak(&v7, &location);
  [(ICMoveDecisionController *)v5 performDecisionWithCompletion:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

- (void)showSharedFolderActions:(id)a3
{
  objc_opt_class();
  id v4 = [(ICNoteBrowseViewController *)self noteContainer];
  ICCheckedDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    unsigned int v5 = +[ICCollaborationUIController sharedInstance];
    id v6 = [(ICNoteBrowseViewController *)self collaborationButtonsController];
    id v7 = [v6 buttonItem];
    [v5 showCloudSharingControllerForFolder:v8 presentingViewController:self popoverBarButtonItem:v7 presented:0 dismissed:0];
  }
}

- (void)performCmd3:(id)a3
{
  id v4 = [ICViewAttachmentsActivity alloc];
  unsigned int v5 = [(ICNoteBrowseViewController *)self eventReporter];
  id v6 = [(ICViewAttachmentsActivity *)v4 initWithPresentingViewController:self eventReporter:v5];

  [(ICViewAttachmentsActivity *)v6 performActivityWithCompletion:0];
}

- (void)performDeleteKey:(id)a3
{
  id v13 = a3;
  id v4 = [(ICNoteResultsViewController *)self collectionView];
  unsigned int v5 = [v4 indexPathsForSelectedItems];
  id v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(ICNoteBrowseViewController *)self selectedNotes];
  }
  else
  {
    id v8 = [(ICNoteResultsViewController *)self collectionView];
    id v9 = [v8 indexPathsForFocusedItems];
    id v10 = [v9 count];

    BOOL v11 = v13;
    if (!v10) {
      goto LABEL_6;
    }
    uint64_t v7 = [(ICNoteBrowseViewController *)self focusedNotes];
  }
  CFNullRef v12 = (void *)v7;
  [(ICNoteBrowseViewController *)self deleteNotes:v7 sender:v13];

  BOOL v11 = v13;
LABEL_6:
}

- (void)dataSourceDataDidUpdate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseViewController;
  [(ICBaseViewController *)&v6 dataSourceDataDidUpdate:a3];
  id v4 = [(ICNoteBrowseViewController *)self navigationController];
  unsigned int v5 = [v4 topViewController];

  if (v5 == self) {
    [(ICNoteBrowseViewController *)self updateBarButtonItemsAnimated:0];
  }
}

- (void)dataSourceDataUpdateDidRender:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseViewController;
  [(ICNoteResultsViewController *)&v6 dataSourceDataUpdateDidRender:a3];
  id v4 = [(ICNoteBrowseViewController *)self navigationController];
  unsigned int v5 = [v4 topViewController];

  if (v5 == self)
  {
    [(ICNoteBrowseViewController *)self updateBarButtonItemsAnimated:1];
    [(ICNoteBrowseViewController *)self updateContainerSelection];
  }
}

- (unint64_t)tagsActionMenuNoteCount:(id)a3
{
  BOOL v3 = [(ICNoteBrowseViewController *)self noteDataSource];
  id v4 = [v3 totalNoteCount];

  return (unint64_t)v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([(ICNoteBrowseViewController *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/UI/Note/Browse/View Controllers/ICNoteBrowseViewController.m"] & 1) == 0)
  {
    v30.receiver = self;
    v30.super_class = (Class)ICNoteBrowseViewController;
    [(ICNoteResultsViewController *)&v30 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];

    goto LABEL_17;
  }
  unsigned __int8 v13 = [(ICNoteBrowseViewController *)self ic_shouldIgnoreObserveValue:v12 ofObject:v11 forKeyPath:v10];

  if (a6 == &off_10069A448 && (v13 & 1) == 0)
  {
    unint64_t v14 = +[ICAppDelegate sharedInstance];
    id v15 = [v14 cloudContextDelegate];

    if (v15 == v11)
    {
      id v27 = ICKeyPathFromSelector();
      unsigned int v28 = [v10 isEqualToString:v27];

      if (v28) {
        performBlockOnMainThread();
      }
      goto LABEL_17;
    }
    id v16 = [(ICNoteBrowseViewController *)self noteContainer];

    if (v16 != v11)
    {
      id v17 = +[NSUserDefaults standardUserDefaults];

      if (v17 == v11)
      {
        +[ICNoteListSortUtilities clearCache];
        +[ICDateHeadersUtilities clearCache];
        id v18 = [v10 isEqualToString:ICSettingsNoteListSortTypeKey];
        if ((v18 & 1) != 0
          || ([v10 isEqualToString:ICFolderCustomNoteSortTypeQuerySortKey] & 1) != 0
          || ([v10 isEqualToString:ICSettingsNoteDateHeadersTypeKey] & 1) != 0
          || [v10 isEqualToString:ICSettingsQueryDateHeadersTypeKey])
        {
          [(ICNoteBrowseViewController *)self updateDataSourceConfigurationSortTypeChanged:v18];
          id v19 = [(ICNoteBrowseViewController *)self noteDataSource];
          [v19 reloadDataAnimated:0];
        }
        CFNullRef v20 = [(ICNoteBrowseViewController *)self virtualSmartFolder];

        if (v20)
        {
          id v21 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
          CFNullRef v22 = [v21 noteSortTypeUserDefaultsKey];
          unsigned int v23 = [v10 isEqualToString:v22];

          if (v23) {
            goto LABEL_28;
          }
          unsigned int v24 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
          CFNullRef v25 = [v24 dateHeadersTypeUserDefaultsKey];
          unsigned int v26 = [v10 isEqualToString:v25];

          if (v26) {
            goto LABEL_28;
          }
        }
      }
      goto LABEL_17;
    }
    if ([v10 isEqualToString:@"title"])
    {
      [(ICNoteBrowseViewController *)self updateNavigationTitle];
LABEL_23:
      [(ICNoteBrowseViewController *)self updateBarButtonItemsAnimated:0];
      goto LABEL_17;
    }
    if ([v10 isEqualToString:@"smartFolderQueryJSON"]) {
      goto LABEL_23;
    }
    if ([v10 isEqualToString:@"focusedNoteObjectID"])
    {
      [(ICNoteBrowseViewController *)self updateFocusedNoteIfNeeded];
    }
    else if ([v10 isEqualToString:@"customNoteSortTypeValue"] {
           || [v10 isEqualToString:@"dateHeadersType"])
    }
    {
LABEL_28:
      [(ICNoteBrowseViewController *)self updateDataSourceConfigurationSortTypeChanged:0];
      CFNullRef v29 = [(ICNoteBrowseViewController *)self noteDataSource];
      [v29 reloadDataAnimated:0];
    }
  }
LABEL_17:
}

- (void)didUpdateSearchAppearanceNotification:(id)a3
{
  if ((id)[(ICBaseViewController *)self noteContainerViewMode] == (id)1)
  {
    [(ICNoteBrowseViewController *)self updateBarButtonItemsAnimated:1];
  }
}

- (void)registerForTraitChanges
{
  v14.receiver = self;
  v14.super_class = (Class)ICNoteBrowseViewController;
  [(ICBaseViewController *)&v14 registerForTraitChanges];
  objc_initWeak(&location, self);
  uint64_t v17 = objc_opt_class();
  BOOL v3 = +[NSArray arrayWithObjects:&v17 count:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001042C4;
  v11[3] = &unk_100625EB8;
  objc_copyWeak(&v12, &location);
  id v4 = [(ICNoteBrowseViewController *)self registerForTraitChanges:v3 withHandler:v11];

  uint64_t v16 = objc_opt_class();
  unsigned int v5 = +[NSArray arrayWithObjects:&v16 count:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001043B0;
  v9[3] = &unk_100625EB8;
  objc_copyWeak(&v10, &location);
  id v6 = [(ICNoteBrowseViewController *)self registerForTraitChanges:v5 withHandler:v9];

  uint64_t v15 = objc_opt_class();
  uint64_t v7 = +[NSArray arrayWithObjects:&v15 count:1];
  id v8 = [(ICNoteBrowseViewController *)self registerForTraitChanges:v7 withAction:"updateTagDetailOperatorMenuVisibility"];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)updateTagSectionVisibility
{
  unsigned __int8 v3 = [(ICNoteBrowseViewController *)self shouldIncludeTags];
  id v4 = [(ICNoteBrowseViewController *)self noteDataSource];
  char v5 = v3 ^ [v4 shouldIncludeTags];

  BOOL v6 = [(ICNoteBrowseViewController *)self shouldIncludeTags];
  uint64_t v7 = [(ICNoteBrowseViewController *)self noteDataSource];
  [v7 setShouldIncludeTags:v6];

  BOOL v8 = [(ICNoteBrowseViewController *)self shouldIncludeTagDetail];
  id v9 = [(ICNoteBrowseViewController *)self noteDataSource];
  [v9 setShouldIncludeTagDetail:v8];

  return v5;
}

- (void)sharedWithYouControllerDidUpdateHighlights:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001045AC;
  block[3] = &unk_100625AF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (ICCollaborationButtonsController)collaborationButtonsController
{
  collaborationButtonsController = self->_collaborationButtonsController;
  if (collaborationButtonsController)
  {
    unsigned __int8 v3 = collaborationButtonsController;
  }
  else
  {
    objc_opt_class();
    char v5 = [(ICNoteBrowseViewController *)self noteContainer];
    BOOL v6 = ICDynamicCast();

    if (v6)
    {
      uint64_t v7 = [ICCollaborationButtonsController alloc];
      BOOL v8 = [(ICBaseViewController *)self viewControllerManager];
      id v9 = [(ICCollaborationButtonsController *)v7 initWithCloudObject:v6 coordinator:v8];
      id v10 = self->_collaborationButtonsController;
      self->_collaborationButtonsController = v9;

      objc_initWeak(&location, self);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100104790;
      v12[3] = &unk_100625938;
      objc_copyWeak(&v13, &location);
      [(ICCollaborationButtonsController *)self->_collaborationButtonsController setDidPressManageShareButton:v12];
      unsigned __int8 v3 = self->_collaborationButtonsController;
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      unsigned __int8 v3 = 0;
    }
  }

  return v3;
}

- (id)focusedNotes
{
  unsigned __int8 v3 = [(ICNoteResultsViewController *)self collectionView];
  id v4 = [v3 indexPathsForFocusedItems];

  char v5 = [(ICNoteBrowseViewController *)self notesForIndexPaths:v4];

  return v5;
}

- (BOOL)isAllTagsSelected
{
  v2 = [(ICNoteBrowseViewController *)self tagSelection];
  BOOL v3 = [v2 mode] == (id)1;

  return v3;
}

- (void)updateVisibleGalleryCellThumbnails
{
  BOOL v3 = +[UIApplication sharedApplication];
  id v4 = [v3 applicationState];

  if (!v4)
  {
    char v5 = [(ICNoteResultsViewController *)self collectionView];
    BOOL v6 = [v5 visibleCells];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
            [v12 updateThumbnail:v13];
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (ICTagContainerCell)tagContainerCell
{
  BOOL v3 = [(ICNoteBrowseViewController *)self tagSelection];

  if (v3)
  {
    id v4 = [(ICNoteBrowseViewController *)self dataSource];
    char v5 = [v4 collectionViewDiffableDataSource];
    BOOL v6 = +[ICTagContainerItemIdentifier sharedItemIdentifier];
    id v7 = [v5 indexPathForItemIdentifier:v6];

    if (v7)
    {
      objc_opt_class();
      id v8 = [(ICNoteResultsViewController *)self collectionView];
      id v9 = [v8 cellForItemAtIndexPath:v7];
      uint64_t v10 = ICDynamicCast();
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return (ICTagContainerCell *)v10;
}

- (id)tagDetailCell
{
  BOOL v3 = [(ICNoteBrowseViewController *)self tagSelection];

  if (v3)
  {
    id v4 = [(ICNoteBrowseViewController *)self dataSource];
    char v5 = [v4 collectionViewDiffableDataSource];
    BOOL v6 = +[ICTagDetailItemIdentifier sharedItemIdentifier];
    id v7 = [v5 indexPathForItemIdentifier:v6];

    if (v7)
    {
      objc_opt_class();
      id v8 = [(ICNoteResultsViewController *)self collectionView];
      id v9 = [v8 cellForItemAtIndexPath:v7];
      uint64_t v10 = ICDynamicCast();
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (double)availableWidthForSummaryView
{
  BOOL v3 = [(ICBaseViewController *)self viewControllerManager];
  unsigned int v4 = [v3 hasCompactWidth];

  char v5 = [(ICNoteBrowseViewController *)self view];
  [v5 bounds];
  double v7 = v6;

  double v8 = -32.0;
  if (v4) {
    double v8 = -100.0;
  }
  return v7 + v8;
}

- (void)noteDecryptedStatusDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICNoteBrowseViewController;
  [(ICNoteResultsViewController *)&v5 noteDecryptedStatusDidChange:a3];
  BOOL v3 = +[ICAuthenticationState sharedState];
  unsigned __int8 v4 = [v3 isBlockingDeauthentication];

  if ((v4 & 1) == 0) {
    performBlockOnMainThread();
  }
}

- (void)summaryViewLockNowPressed:(id)a3
{
  unsigned __int8 v4 = [(ICBaseViewController *)self viewControllerManager];
  [v4 lockNotesNow];

  objc_super v5 = [(ICNoteBrowseViewController *)self noteContainer];
  id v9 = [v5 noteContainerAccount];

  if (v9)
  {
    double v6 = +[ICLockedNotesModeMigrator sharedMigrator];
    double v7 = [(ICNoteBrowseViewController *)self view];
    double v8 = [v7 window];
    [v6 showMigrationPromptAndMigrateIfNeededForAccount:v9 window:v8];
  }
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  if ([(ICNoteBrowseViewController *)self shouldShowEmptyState]
    && ([(ICNoteBrowseViewController *)self navigationController],
        unsigned __int8 v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isToolbarHidden],
        v4,
        v5))
  {
    id v9 = +[UIContentUnavailableConfiguration emptyExtraProminentConfiguration];
    double v6 = +[UIImage systemImageNamed:@"note.text"];
    [v9 setImage:v6];

    double v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"No Notes" value:&stru_10063F3D8 table:0];
    [v9 setText:v8];

    [(ICNoteBrowseViewController *)self setContentUnavailableConfiguration:v9];
  }
  else
  {
    [(ICNoteBrowseViewController *)self setContentUnavailableConfiguration:0];
  }
}

- (void)managedObjectContextDidSaveObjectIDs:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  unsigned int v5 = [(ICNoteBrowseViewController *)self noteContainer];
  double v6 = ICDynamicCast();
  unsigned int v7 = [v6 isSmartFolder];

  if (v7)
  {
    double v8 = +[NSMutableSet set];
    id v9 = [v4 userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:NSUpdatedObjectIDsKey];
    [v8 ic_addObjectsFromNonNilArray:v10];

    id v11 = [v4 userInfo];
    id v12 = [v11 objectForKeyedSubscript:NSRefreshedObjectIDsKey];
    [v8 ic_addObjectsFromNonNilArray:v12];

    long long v13 = [(ICNoteBrowseViewController *)self noteContainer];
    long long v14 = [v13 objectID];
    unsigned int v15 = [v8 containsObject:v14];

    if (v15)
    {
      long long v16 = [(ICNoteBrowseViewController *)self noteContainer];
      uint64_t v17 = [(ICNoteBrowseViewController *)self noteDataSource];
      [v17 setNoteContainer:v16];

      id v18 = [(ICNoteBrowseViewController *)self noteDataSource];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1001054D0;
      v19[3] = &unk_100626270;
      v19[4] = self;
      [v18 reloadDataAnimated:1 dataIndexedBlock:v19 dataRenderedBlock:0];
    }
  }
}

- (void)accessibilityStatusDidChange
{
  uint64_t v3 = ICAccessibilityNeedsAccessibilityElements() ^ 1;
  id v4 = [(ICNoteBrowseViewController *)self navigationItem];
  [v4 setHidesSearchBarWhenScrolling:v3];
}

- (void)startAnalyticsTracking
{
  if ([(ICNoteBrowseViewController *)self analyticsTrackingActive]) {
    return;
  }
  uint64_t v3 = [(ICNoteBrowseViewController *)self noteContainer];

  if (v3)
  {
    id v4 = [(ICNoteBrowseViewController *)self eventReporter];
    unsigned int v5 = [(ICNoteBrowseViewController *)self noteContainer];
    [v4 startFolderViewEventDurationTrackingForNoteContainer:v5 isInGridMode:[self noteContainerViewMode] == 1];
LABEL_8:

    goto LABEL_9;
  }
  double v6 = [(ICNoteBrowseViewController *)self noteCollection];

  if (v6)
  {
    id v4 = [(ICNoteBrowseViewController *)self eventReporter];
    unsigned int v5 = [(ICNoteBrowseViewController *)self noteCollection];
    [v4 startFolderViewEventDurationTrackingForNoteCollection:v5 isInGridMode:[self noteContainerViewMode] == 1];
    goto LABEL_8;
  }
  unsigned int v7 = [(ICNoteBrowseViewController *)self virtualSmartFolder];

  if (v7)
  {
    id v4 = [(ICNoteBrowseViewController *)self eventReporter];
    unsigned int v5 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
    BOOL v8 = (id)[(ICBaseViewController *)self noteContainerViewMode] == (id)1;
    id v9 = +[ICNoteContext sharedContext];
    uint64_t v10 = [v9 managedObjectContext];
    [v4 startFolderViewEventDurationTrackingForVirtualFolder:v5 isInGridMode:v8 context:v10];

    goto LABEL_8;
  }
LABEL_9:

  [(ICNoteBrowseViewController *)self setAnalyticsTrackingActive:1];
}

- (void)endAnalyticsTracking
{
  if (![(ICNoteBrowseViewController *)self analyticsTrackingActive]) {
    return;
  }
  uint64_t v3 = [(ICNoteBrowseViewController *)self noteContainer];

  if (v3)
  {
    id v4 = [(ICNoteBrowseViewController *)self eventReporter];
    unsigned int v5 = [(ICNoteBrowseViewController *)self noteContainer];
    [v4 submitFolderViewEventForNoteContainer:v5 isInGridMode:[self noteContainerViewMode] == 1];
LABEL_9:

    goto LABEL_10;
  }
  double v6 = [(ICNoteBrowseViewController *)self noteCollection];

  if (v6)
  {
    id v4 = [(ICNoteBrowseViewController *)self eventReporter];
    unsigned int v5 = [(ICNoteBrowseViewController *)self noteCollection];
    [v4 submitFolderViewEventForNoteCollection:v5 isInGridMode:[self noteContainerViewMode] == 1];
    goto LABEL_9;
  }
  unsigned int v7 = [(ICNoteBrowseViewController *)self virtualSmartFolder];

  if (v7)
  {
    id v4 = [(ICNoteBrowseViewController *)self eventReporter];
    unsigned int v5 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
    BOOL v8 = (id)[(ICBaseViewController *)self noteContainerViewMode] == (id)1;
    id v9 = +[ICNoteContext sharedContext];
    uint64_t v10 = [v9 managedObjectContext];
    [v4 submitFolderViewEventForVirtualFolder:v5 isInGridMode:v8 context:v10];

    goto LABEL_9;
  }
LABEL_10:

  [(ICNoteBrowseViewController *)self setAnalyticsTrackingActive:0];
}

- (void)submitTagSelectionAnalyticsIfNeeded
{
  uint64_t v3 = [(ICNoteBrowseViewController *)self tagSelection];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned int v5 = [(ICNoteBrowseViewController *)self tagSelection];
    unsigned __int8 v6 = [v5 isEmpty];

    if ((v6 & 1) == 0)
    {
      BOOL v7 = [(ICNoteBrowseViewController *)self isAllTagsSelected];
      BOOL v8 = [(ICNoteBrowseViewController *)self tagSelection];
      id v9 = [v8 selectedTagCount];

      id v10 = [(ICNoteBrowseViewController *)self eventReporter];
      [v10 submitTagBrowserSelectionEventWithSelectedTagCount:v9 isAllTagsSelected:v7];
    }
  }
}

- (void)updateTagDetailOperatorMenuVisibility
{
  id v5 = [(ICNoteBrowseViewController *)self traitCollection];
  id v3 = [v5 ic_hasCompactWidth];
  id v4 = [(ICNoteBrowseViewController *)self tagDetailCell];
  [v4 setShowOperatorMenuButton:v3];
}

- (id)noteBrowseNavigationItemConfigurationNavigationTitle:(id)a3
{
  if ([(ICBaseViewController *)self isShowingActiveSearch])
  {
    id v5 = [(ICBaseViewController *)self searchNavigationTitle];
    goto LABEL_14;
  }
  if ([(ICNoteBrowseViewController *)self isEditing]
    && [(ICNoteBrowseViewController *)self numberOfSelectedItems])
  {
    unsigned __int8 v6 = +[NSBundle mainBundle];
    BOOL v7 = [v6 localizedStringForKey:@"%lu (notes) Selected" value:&stru_10063F3D8 table:0];
    id v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, [(ICNoteBrowseViewController *)self numberOfSelectedItems]);

    goto LABEL_14;
  }
  BOOL v8 = [(ICNoteBrowseViewController *)self noteContainer];

  if (v8)
  {
    id v9 = [(ICNoteBrowseViewController *)self noteContainer];
    uint64_t v10 = [v9 titleForNavigationBar];
LABEL_12:
    id v5 = (void *)v10;
LABEL_13:

    goto LABEL_14;
  }
  id v11 = [(ICNoteBrowseViewController *)self noteCollection];

  if (v11)
  {
    id v9 = [(ICNoteBrowseViewController *)self noteCollection];
    uint64_t v10 = [v9 titleForTableViewCell];
    goto LABEL_12;
  }
  id v12 = [(ICNoteBrowseViewController *)self tagSelection];

  if (v12)
  {
    id v9 = [(ICNoteBrowseViewController *)self tagSelection];
    uint64_t v10 = [v9 title];
    goto LABEL_12;
  }
  id v9 = [(ICNoteBrowseViewController *)self virtualSmartFolder];

  if (v9)
  {
    id v14 = [(ICNoteBrowseViewController *)self ic_behavior];
    if (v14 == (id)1)
    {
      id v9 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
      id v3 = [v9 type];
      if (v3 == (void *)ICVirtualSmartFolderItemIdentifierTypeMathNotes)
      {
        id v5 = 0;
LABEL_24:

        goto LABEL_13;
      }
    }
    unsigned int v15 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
    id v5 = [v15 title];

    if (v14 == (id)1) {
      goto LABEL_24;
    }
  }
  else
  {
    id v5 = 0;
  }
LABEL_14:

  return v5;
}

- (id)noteBrowseNavigationItemConfigurationNoteContainerActionMenu:(id)a3 actionBarButtonItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  BOOL v8 = [(ICNoteBrowseViewController *)self noteContainer];
  id v9 = ICDynamicCast();

  if (v9)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    objc_initWeak(&v18, v7);
    uint64_t v10 = [(ICBaseViewController *)self viewControllerManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100105F50;
    v13[3] = &unk_10062A1D0;
    objc_copyWeak(&v15, &location);
    id v14 = v7;
    objc_copyWeak(&v16, &from);
    objc_copyWeak(&v17, &v18);
    id v11 = +[ICNoteContainerActionMenu menuWithNoteContainer:v9 presentingViewController:self presentingBarButtonItem:v14 viewControllerManager:v10 completion:v13];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)noteBrowseNavigationItemConfigurationQueryActionMenu:(id)a3 actionBarButtonItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICNoteBrowseViewController *)self noteQuery];
  if (v8
    && (id v9 = (void *)v8,
        [(ICNoteBrowseViewController *)self tagSelection],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    objc_initWeak(&v20, v7);
    id v11 = [(ICNoteBrowseViewController *)self tagSelection];
    id v12 = [(ICBaseViewController *)self viewControllerManager];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100106248;
    v15[3] = &unk_10062A1D0;
    objc_copyWeak(&v17, &location);
    id v16 = v7;
    objc_copyWeak(&v18, &from);
    objc_copyWeak(&v19, &v20);
    long long v13 = +[ICTagsActionMenu menuWithTagSelection:v11 presentingViewController:self presentingBarButtonItem:v16 viewControllerManager:v12 delegate:self completion:v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (id)noteBrowseNavigationItemConfigurationVirtualSmartFolderActionMenu:(id)a3 actionBarButtonItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICNoteBrowseViewController *)self virtualSmartFolder];

  if (v8)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    objc_initWeak(&v18, v7);
    id v9 = [(ICNoteBrowseViewController *)self virtualSmartFolder];
    uint64_t v10 = [(ICBaseViewController *)self viewControllerManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100106524;
    v13[3] = &unk_10062A1D0;
    objc_copyWeak(&v15, &location);
    id v14 = v7;
    objc_copyWeak(&v16, &from);
    objc_copyWeak(&v17, &v18);
    id v11 = +[ICNoteContainerActionMenu menuWithVirtualSmartFolder:v9 presentingViewController:self presentingBarButtonItem:v14 viewControllerManager:v10 completion:v13];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)noteBrowseNavigationItemConfigurationCollaborationBarButtonItem:(id)a3
{
  id v3 = [(ICNoteBrowseViewController *)self collaborationButtonsController];
  id v4 = [v3 buttonItem];

  return v4;
}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldAddNoteFromBarButtonItem:(id)a4 event:(id)a5
{
  id v8 = a5;
  id v6 = [(ICBaseViewController *)self viewControllerManager];
  id v7 = [v6 showNewNoteWithApproach:14 sender:v8 animated:1];
}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldAssignTagsFromBarButtonItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICNoteBrowseViewController *)self selectedNotes];
  id v9 = [v8 ic_compactMap:&stru_10062A210];

  objc_initWeak(&location, self);
  uint64_t v10 = [ICTagAssignmentViewController alloc];
  id v11 = [(ICBaseViewController *)self modernViewContext];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100106898;
  id v17 = &unk_100625938;
  objc_copyWeak(&v18, &location);
  id v12 = [(ICTagAssignmentViewController *)v10 initWithSelectedNotes:v9 managedObjectContext:v11 completion:&v14];

  long long v13 = [(ICTagAssignmentViewController *)v12 ic_embedInNavigationControllerForModalPresentation];
  [(ICNoteBrowseViewController *)self presentViewController:v13 animated:1 completion:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldDeleteAllFromBarButtonItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ICNoteBrowseViewController *)self isTrashFolder])
  {
    id v8 = [(ICNoteBrowseViewController *)self allNotes];
    [(ICNoteBrowseViewController *)self deleteNotes:v8 sender:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    id v9 = [(ICNoteBrowseViewController *)self allNotes];
    id v10 = [v9 count];
    id v11 = [(ICNoteBrowseViewController *)self view];
    id v12 = [v11 window];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100106A78;
    v13[3] = &unk_10062A238;
    objc_copyWeak(&v15, &location);
    id v14 = v7;
    +[ICDeleteAlert showAlertForDeletingObjectsWithType:16 count:v10 window:v12 sender:v14 completion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldDeleteSelectedFromBarButtonItem:(id)a4
{
  id v5 = a4;
  id v6 = [(ICNoteBrowseViewController *)self selectedNotes];
  [(ICNoteBrowseViewController *)self deleteNotes:v6 sender:v5];
}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldLockFromBarButtonItem:(id)a4
{
  id v4 = [(ICBaseViewController *)self viewControllerManager];
  [v4 lockNotesNow];
}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldMoveAllFromBarButtonItem:(id)a4
{
  id v5 = [(ICNoteBrowseViewController *)self allNotes];
  [(ICNoteBrowseViewController *)self moveNotes:v5];
}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldMoveSelectedFromBarButtonItem:(id)a4
{
  id v5 = [(ICNoteBrowseViewController *)self selectedNotes];
  [(ICNoteBrowseViewController *)self moveNotes:v5];
}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldShareFromBarButtonItem:(id)a4
{
  id v8 = a4;
  objc_opt_class();
  id v5 = [(ICNoteBrowseViewController *)self noteContainer];
  id v6 = ICDynamicCast();

  if (v6)
  {
    id v7 = +[ICCollaborationUIController sharedInstance];
    [v7 presentFolderActivityViewControllerWithFolder:v6 presentingViewController:self sourceItem:v8 sourceView:0 sourceRect:CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height];
  }
}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldShowDebugViewControllerFromBarButtonItem:(id)a4
{
}

- (void)setNoteDataSource:(id)a3
{
}

- (ICToolbarSummaryView)summaryView
{
  return self->_summaryView;
}

- (void)setSummaryView:(id)a3
{
}

- (void)setNavigationItemConfiguration:(id)a3
{
}

- (void)setSmartFolderCreationController:(id)a3
{
}

- (BOOL)needsToConfirmDeletion
{
  return self->_needsToConfirmDeletion;
}

- (void)setNeedsToConfirmDeletion:(BOOL)a3
{
  self->_needsToConfirmDeletion = a3;
}

- (BOOL)shouldAvoidEditingChanges
{
  return self->_shouldAvoidEditingChanges;
}

- (BOOL)analyticsTrackingActive
{
  return self->_analyticsTrackingActive;
}

- (void)setAnalyticsTrackingActive:(BOOL)a3
{
  self->_analyticsTrackingActive = a3;
}

- (void)setCollaborationButtonsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationButtonsController, 0);
  objc_storeStrong((id *)&self->_collectionViewDelegate, 0);
  objc_storeStrong((id *)&self->_smartFolderCreationController, 0);
  objc_storeStrong((id *)&self->_navigationItemConfiguration, 0);
  objc_storeStrong((id *)&self->_summaryView, 0);
  objc_storeStrong((id *)&self->_noteDataSource, 0);

  objc_storeStrong((id *)&self->_tagSelection, 0);
}

@end