@interface RCRecordingsCollectionViewController
- (BOOL)_isDownloadingAtIndex:(id)a3;
- (BOOL)_supportsSwipeActionsForIndexPath:(id)a3 swipeActionsType:(unint64_t)a4;
- (BOOL)accessibilityPerformEscape;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canMoveSelectionDown;
- (BOOL)canMoveSelectionInDirection:(int64_t)a3;
- (BOOL)canMoveSelectionUp;
- (BOOL)captureIsUnderway;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)inDidSelect;
- (BOOL)isRecentlyDeleted;
- (BOOL)isSearching;
- (BOOL)isSelectingCellForFocusUpdate;
- (BOOL)isUpdatingBottomLayoutForEditing;
- (BOOL)isUpdatingSearchString;
- (BOOL)presentsRecordingWithUUID:(id)a3;
- (BOOL)selectedCellIsEditingTitle;
- (BOOL)selectedCellIsInFlightEditing;
- (BOOL)willSelectRecordingAfterExitingEditMode;
- (NSHashTable)cellsBeingEditedHashTable;
- (NSHashTable)cellsHashTable;
- (NSMapTable)cellsMapTable;
- (NSMutableDictionary)editingProgressItems;
- (NSMutableDictionary)recordingUUIDToEntityInteraction;
- (NSString)folderUUID;
- (NSString)normalRecordingsSearchStringForRestore;
- (NSString)reuseIdentifier;
- (NSString)userFolderName;
- (NSString)uuidOfNewestRecording;
- (NSString)uuidOfSelectedItem;
- (RCCloudRecording)selectedRecording;
- (RCFolderSelectionDelegate)folderSelectionDelegate;
- (RCLibraryActionHandler)libraryActionHandler;
- (RCLibraryEditStateHandler)editStateHandler;
- (RCRecentlyDeletedRecordingsCollectionViewController)recentlyDeletedCollectionViewController;
- (RCRecordingCollectionViewCell)cellWhoseTitleIsBeingEdited;
- (RCRecordingsCollectionViewController)initWithBuiltInFolderType:(int64_t)a3 folderUUID:(id)a4;
- (RCRecordingsCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (RCRecordingsCollectionViewController)initWithUserFolderNamed:(id)a3 folderUUID:(id)a4;
- (RCRecordingsCollectionViewControllerDataCoordinator)recordingsDataCoordinator;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UISearchController)searchController;
- (_TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator)moreButtonMenuCreator;
- (id)_createCollectionViewLayout;
- (id)_createDiffableDataSource;
- (id)_createSwipeActionWithConfiguration:(id)a3;
- (id)_deleteSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4;
- (id)_eraseSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4;
- (id)_favoriteSwipeAction:(BOOL)a3 forUUID:(id)a4;
- (id)_leadingSwipeActionsConfigurationProvider;
- (id)_moreOptionsSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4;
- (id)_moveToFolderSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4;
- (id)_trailingSwipeActionsConfigurationProvider;
- (id)_uuidForItemAtIndexPath:(id)a3;
- (id)allUUIDs;
- (id)cellForUUID:(id)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)contentUnavailableConfigurationState;
- (id)dataArray;
- (id)selectedUUIDs;
- (id)uuidOfSelectedRecording;
- (id)viewDidAppearCompletionBlock;
- (int64_t)_expectedNumberOfItems;
- (int64_t)_incrementForDirection:(int64_t)a3;
- (int64_t)folderType;
- (void)_addCollectionViewCellToCellsMapTable:(id)a3;
- (void)_animateContentUnavailableUpdateWithCompletion:(id)a3;
- (void)_classSpecificInit;
- (void)_commonInit;
- (void)_configureCell:(id)a3 usingDisplayModel:(id)a4;
- (void)_handleEditModeFooterAndNavigationItem;
- (void)_handleMove;
- (void)_logHashTable;
- (void)_logWhetherVisibleCellsHaveIntegrity;
- (void)_moveSelectionInDirection:(int64_t)a3;
- (void)_notifyDelegatesThatSelectionChanged;
- (void)_pauseSelecteditem;
- (void)_performFolderTypeUpdatesOnRecording:(id)a3;
- (void)_removeCollectionViewCellFromCellsMapTable:(id)a3;
- (void)_restyleAllExtantCells;
- (void)_scrollDownToItemAtIndexPathIfNeeded:(id)a3;
- (void)_scrollUpToItemAtIndexPathIfNeeded:(id)a3;
- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)_setSearchString:(id)a3;
- (void)_setupCollectionView;
- (void)_setupEditButton;
- (void)_setupSearchController;
- (void)_styleView;
- (void)_toggleEdit;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateCollectionViewContent:(BOOL)a3;
- (void)_updateEditButtonStateForRecordingsCount:(unint64_t)a3;
- (void)_updateSearchBarPlaceholder;
- (void)_updateSearchString:(id)a3;
- (void)_updateUUIDOfSelectedItem;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4 folder:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)contentChangesComplete;
- (void)contentSizeChanged;
- (void)deleteFolder:(id)a3 controller:(id)a4;
- (void)deleteItemAtIndexPath:(id)a3 withUUID:(id)a4;
- (void)deleteSelectedItems;
- (void)deselectSelectedItem;
- (void)didDismissSearchController:(id)a3;
- (void)didEndEditingTitle:(id)a3;
- (void)didPresentSearchController:(id)a3;
- (void)didProcessUpdatesWithRemainingItemCount:(unint64_t)a3;
- (void)didSelectCellWithUUID:(id)a3;
- (void)didUpdateBottomLayoutForEditing;
- (void)editSelectedItemTitle;
- (void)editingIsInFlight:(BOOL)a3 progress:(float)a4 forUUID:(id)a5;
- (void)endEditing;
- (void)finishLaunchTests;
- (void)handleDeleteForUUID:(id)a3;
- (void)insertItemsAtIndexPaths:(id)a3;
- (void)loadView;
- (void)moveFolder:(id)a3 toDestinationIndexPath:(id)a4;
- (void)moveSelectionDown;
- (void)moveSelectionUp;
- (void)performAction:(int64_t)a3 atPosition:(double)a4 forCellWithUUID:(id)a5 source:(id)a6;
- (void)performDelayedSetup;
- (void)performDropWithSession:(id)a3 folder:(id)a4;
- (void)performRenameWithNewTitle:(id)a3 forCellWithUUID:(id)a4;
- (void)prepareForAdditionOfNewRecordingWithUUID:(id)a3;
- (void)prepareForChangingContent;
- (void)presentViewController:(id)a3 sourceController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)registerAppEntityInteractionForCollectionViewCell:(id)a3;
- (void)registerAppIntentInteractions;
- (void)reloadItemAtIndexPath:(id)a3 usingDisplayModel:(id)a4;
- (void)removeAppEntityInteractionForCollectionViewCell:(id)a3;
- (void)renameFolder:(id)a3 toName:(id)a4;
- (void)restyle;
- (void)scrollToRevealPartiallyObscuredItemAtIndexPathIfNeeded:(id)a3;
- (void)scrollToTop;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scroll:(BOOL)a5;
- (void)selectItemWithUUID:(id)a3;
- (void)selectItemWithUUID:(id)a3 animated:(BOOL)a4;
- (void)setCaptureIsUnderway:(BOOL)a3;
- (void)setCellWhoseTitleIsBeingEdited:(id)a3;
- (void)setCellsBeingEditedHashTable:(id)a3;
- (void)setCellsHashTable:(id)a3;
- (void)setCellsMapTable:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setCurrentTime:(double)a3 forItemWithUUID:(id)a4;
- (void)setDiffableDataSource:(id)a3;
- (void)setEditStateHandler:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingProgressItems:(id)a3;
- (void)setFolderSelectionDelegate:(id)a3;
- (void)setFolderType:(int64_t)a3;
- (void)setFolderUUID:(id)a3;
- (void)setInDidSelect:(BOOL)a3;
- (void)setIsSearching:(BOOL)a3;
- (void)setIsSelectingCellForFocusUpdate:(BOOL)a3;
- (void)setIsUpdatingBottomLayoutForEditing:(BOOL)a3;
- (void)setIsUpdatingSearchString:(BOOL)a3;
- (void)setLibraryActionHandler:(id)a3;
- (void)setMoreButtonMenuCreator:(id)a3;
- (void)setNormalRecordingsSearchStringForRestore:(id)a3;
- (void)setRecentlyDeletedCollectionViewController:(id)a3;
- (void)setRecordingUUIDToEntityInteraction:(id)a3;
- (void)setRecordingsDataCoordinator:(id)a3;
- (void)setReuseIdentifier:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setUserFolderName:(id)a3;
- (void)setUuidOfNewestRecording:(id)a3;
- (void)setUuidOfSelectedItem:(id)a3;
- (void)setViewDidAppearCompletionBlock:(id)a3;
- (void)setWillSelectRecordingAfterExitingEditMode:(BOOL)a3;
- (void)showIdleForItemWithUUID:(id)a3;
- (void)showNewFolderUIFromController:(id)a3;
- (void)showPlayingForItemWithUUID:(id)a3;
- (void)showRenamingControllerWithFolderName:(id)a3 controller:(id)a4;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateToolbarAndFooterView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)wasDeselectedForCellWithUUID:(id)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
- (void)willSelectItemWithUUID:(id)a3;
- (void)willUpdateBottomLayoutForEditing;
@end

@implementation RCRecordingsCollectionViewController

- (int64_t)_expectedNumberOfItems
{
  v2 = [(RCRecordingsCollectionViewController *)self dataArray];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (void)registerAppIntentInteractions
{
  v2 = self;
  sub_10001393C();
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  if ([(RCRecordingsCollectionViewController *)self _expectedNumberOfItems]
    || [(RCRecordingsCollectionViewController *)self captureIsUnderway])
  {
    goto LABEL_3;
  }
  unsigned __int8 v6 = [(RCRecordingsCollectionViewController *)self isSearching];
  if ([(RCRecordingsCollectionViewController *)self isSearching])
  {
    v7 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
    v8 = [v7 searchString];
    id v9 = [v8 length];

    if (v6)
    {
      if (v9)
      {
        uint64_t v4 = +[UIContentUnavailableConfiguration searchConfiguration];
        goto LABEL_4;
      }
LABEL_3:
      uint64_t v4 = 0;
      goto LABEL_4;
    }
  }
  else if (v6)
  {
    goto LABEL_3;
  }
  v10 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v17 = +[UIContentUnavailableConfiguration emptyConfiguration];
  v11 = [v10 recordingsContentUnavailableImage];
  [v17 setImage:v11];

  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"RECORDINGS_CONTENT_UNAVAILABLE_TEXT" value:&stru_100228BC8 table:0];
  [v17 setText:v13];

  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"PLAYBACK_CONTENT_TAP_TO_RECORD_DESCRIPTION" value:&stru_100228BC8 table:0];
  [v17 setSecondaryText:v15];

  uint64_t v4 = (uint64_t)v17;
LABEL_4:
  id v16 = (id)v4;
  [(RCRecordingsCollectionViewController *)self setContentUnavailableConfiguration:v4];
  v5 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  [v5 libraryChangedEmptyState];
}

- (void)_restyleAllExtantCells
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(RCRecordingsCollectionViewController *)self cellsHashTable];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 conformsToProtocol:&OBJC_PROTOCOL___RCRestylableProtocol]) {
          [v7 restyle];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (RCRecordingsCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCRecordingsCollectionViewController;
  id v3 = [(RCRecordingsCollectionViewController *)&v6 initWithCollectionViewLayout:a3];
  id v4 = v3;
  if (v3)
  {
    [(RCRecordingsCollectionViewController *)v3 setDefinesPresentationContext:1];
    [(RCRecordingsCollectionViewController *)v4 _commonInit];
    [(RCRecordingsCollectionViewController *)v4 _classSpecificInit];
  }
  return v4;
}

- (id)_createCollectionViewLayout
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015A00;
  v5[3] = &unk_100222320;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 initWithSectionProvider:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (id)_trailingSwipeActionsConfigurationProvider
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000770B0;
  v4[3] = &unk_1002223C0;
  objc_copyWeak(&v5, &location);
  id v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)_leadingSwipeActionsConfigurationProvider
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100076F1C;
  v4[3] = &unk_1002223C0;
  objc_copyWeak(&v5, &location);
  id v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RCRecordingsCollectionViewController;
  [(RCRecordingsCollectionViewController *)&v5 viewWillAppear:a3];
  [(RCRecordingsCollectionViewController *)self _setupEditButton];
  [(RCRecordingsCollectionViewController *)self _classSpecificViewWillAppear];
  id v4 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v4 setDragDelegate:self];
}

- (void)_commonInit
{
  [(RCRecordingsCollectionViewController *)self setClearsSelectionOnViewWillAppear:0];
  id v3 = +[NSMapTable strongToWeakObjectsMapTable];
  cellsMapTable = self->_cellsMapTable;
  self->_cellsMapTable = v3;

  objc_super v5 = +[NSHashTable weakObjectsHashTable];
  cellsHashTable = self->_cellsHashTable;
  self->_cellsHashTable = v5;

  v7 = (NSMutableDictionary *)objc_opt_new();
  editingProgressItems = self->_editingProgressItems;
  self->_editingProgressItems = v7;

  long long v9 = (NSMutableDictionary *)objc_opt_new();
  recordingUUIDToEntityInteraction = self->_recordingUUIDToEntityInteraction;
  self->_recordingUUIDToEntityInteraction = v9;
}

- (void)loadView
{
  id v3 = [RCRecordingsCollectionView alloc];
  id v4 = [(RCRecordingsCollectionViewController *)self _createCollectionViewLayout];
  id v6 = -[RCRecordingsCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  [(RCRecordingsCollectionViewController *)self setCollectionView:v6];
  objc_super v5 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v5 setAccessibilityIdentifier:@"Recordings List"];
}

- (id)_createDiffableDataSource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  id v4 = [(RCRecordingsCollectionViewController *)self collectionView];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000266C4;
  v7[3] = &unk_100222348;
  objc_copyWeak(&v8, &location);
  id v5 = [v3 initWithCollectionView:v4 cellProvider:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

- (RCRecordingsCollectionViewController)initWithBuiltInFolderType:(int64_t)a3 folderUUID:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)UICollectionViewLayout);
  id v8 = [(RCRecordingsCollectionViewController *)self initWithCollectionViewLayout:v7];

  if (v8)
  {
    [(RCRecordingsCollectionViewController *)v8 setFolderType:a3];
    [(RCRecordingsCollectionViewController *)v8 setFolderUUID:v6];
    long long v9 = [[RCRecordingsCollectionViewControllerDataCoordinator alloc] initWithFolderType:a3 delegate:v8];
    recordingsDataCoordinator = v8->_recordingsDataCoordinator;
    v8->_recordingsDataCoordinator = v9;
  }
  return v8;
}

- (void)finishLaunchTests
{
  id v2 = +[UIApplication sharedApplication];
  unsigned int v3 = [v2 isRunningTest];

  if (v3)
  {
    id v5 = +[UIApplication sharedApplication];
    id v4 = [v5 delegate];
    [v4 ppt_didShowVoiceMemosList];
  }
}

- (void)_styleView
{
  id v16 = +[RCRecorderStyleProvider sharedStyleProvider];
  [(RCRecordingsCollectionViewController *)self _restyleAllExtantCells];
  unsigned int v3 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
  id v4 = [v3 objectEnumerator];

  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    id v6 = (void *)v5;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
        id v8 = [v7 UUID];
        long long v9 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
        unsigned int v10 = [v8 isEqualToString:v9];

        if (v10)
        {
          long long v11 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
          unsigned __int8 v12 = [v11 isPlayingForUUID:v8];

          if ((v12 & 1) == 0)
          {
            v13 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
            [v13 currentTime];
            [v7 setCurrentTime:];
          }
        }
      }
      uint64_t v14 = [v4 nextObject];

      id v6 = (void *)v14;
    }
    while (v14);
  }
  if ([v16 pinsSearchBarInLibrary])
  {
    v15 = [(RCRecordingsCollectionViewController *)self navigationItem];
    [v15 setHidesSearchBarWhenScrolling:0];
  }
}

- (void)_updateEditButtonStateForRecordingsCount:(unint64_t)a3
{
  uint64_t v5 = [(RCRecordingsCollectionViewController *)self collectionView];
  unsigned int v6 = [v5 isEditing];

  id v7 = [(RCRecordingsCollectionViewController *)self editButtonItem];
  id v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = a3 != 0;
  }
  [v7 setEnabled:v9];

  id v10 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  [v10 updateNavBarTitleAndDeleteButtonForRecordingsCount:a3 isEditMode:[self isEditing]];
}

- (void)_updateCollectionViewContent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_new();
  unsigned int v6 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  id v7 = [v6 recordingDataArray];

  [v5 appendSectionsWithIdentifiers:&off_10022D8C8];
  [v5 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:&off_10022D688];
  id v8 = [(RCRecordingsCollectionViewController *)self diffableDataSource];
  BOOL v9 = [v8 snapshot];
  unsigned __int8 v10 = [v9 isEqual:v5];

  if ((v10 & 1) == 0)
  {
    if (v3)
    {
      long long v11 = [(RCRecordingsCollectionViewController *)self diffableDataSource];
      unsigned __int8 v12 = [v11 snapshot];
      if ([v12 numberOfItems])
      {
      }
      else
      {
        uint64_t v14 = (uint64_t)[v5 numberOfItems];

        if (v14 >= 1)
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_10007489C;
          v17[3] = &unk_100222370;
          v17[4] = self;
          id v18 = v5;
          BOOL v19 = v3;
          [(RCRecordingsCollectionViewController *)self _animateContentUnavailableUpdateWithCompletion:v17];
          v13 = v18;
          goto LABEL_6;
        }
      }
    }
    v13 = [(RCRecordingsCollectionViewController *)self diffableDataSource];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100031FB4;
    v15[3] = &unk_100221830;
    BOOL v16 = v3;
    v15[4] = self;
    [v13 applySnapshot:v5 animatingDifferences:v3 completion:v15];
LABEL_6:
  }
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (id)contentUnavailableConfigurationState
{
  v7.receiver = self;
  v7.super_class = (Class)RCRecordingsCollectionViewController;
  BOOL v3 = [(RCRecordingsCollectionViewController *)&v7 contentUnavailableConfigurationState];
  id v4 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  uint64_t v5 = [v4 searchString];
  [v3 setSearchText:v5];

  return v3;
}

- (id)dataArray
{
  id v2 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  BOOL v3 = [v2 recordingDataArray];

  return v3;
}

- (RCRecordingsCollectionViewControllerDataCoordinator)recordingsDataCoordinator
{
  return self->_recordingsDataCoordinator;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)RCRecordingsCollectionViewController;
  [(RCRecordingsCollectionViewController *)&v13 viewDidLoad];
  [(RCRecordingsCollectionViewController *)self _setupCollectionView];
  [(RCRecordingsCollectionViewController *)self _setupEditButton];
  [(RCRecordingsCollectionViewController *)self _setupSearchController];
  [(RCRecordingsCollectionViewController *)self _updateCollectionViewContent:0];
  BOOL v3 = [(RCRecordingsCollectionViewController *)self navigationItem];
  id v4 = [(RCRecordingsCollectionViewController *)self editButtonItem];
  [v3 setRightBarButtonItem:v4];

  [v3 setLargeTitleDisplayMode:1];
  [(RCRecordingsCollectionViewController *)self registerAppIntentInteractions];
  [(RCRecordingsCollectionViewController *)self _styleView];
  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"contentSizeChanged" name:UIContentSizeCategoryDidChangeNotification object:0];

  unsigned int v6 = self;
  v14[0] = v6;
  objc_super v7 = self;
  v14[1] = v7;
  id v8 = self;
  v14[2] = v8;
  BOOL v9 = self;
  v14[3] = v9;
  unsigned __int8 v10 = +[NSArray arrayWithObjects:v14 count:4];
  id v11 = [(RCRecordingsCollectionViewController *)self registerForTraitChanges:v10 withAction:"_traitCollectionDidChange:previousTraitCollection:"];

  unsigned __int8 v12 = +[TranscriptionAvailabilityProvider shared];
  [v12 registerObserver:self];
}

- (void)_setupEditButton
{
  id v4 = [(RCRecordingsCollectionViewController *)self editButtonItem];
  [v4 setAction:"_toggleEdit"];
  if (byte_10026A7E8 == 1)
  {
    BOOL v3 = [(RCRecordingsCollectionViewController *)self dataArray];
    -[RCRecordingsCollectionViewController _updateEditButtonStateForRecordingsCount:](self, "_updateEditButtonStateForRecordingsCount:", [v3 count]);
  }
}

- (void)_updateSearchBarPlaceholder
{
  BOOL v3 = [(RCRecordingsCollectionViewController *)self searchController];

  if (v3)
  {
    id v4 = +[TranscriptionAvailabilityProvider shared];
    unsigned int v5 = [v4 deviceIsSupported];

    unsigned int v6 = @"SEARCH_BAR_PLACEHOLDER_DEFAULT";
    if (v5) {
      unsigned int v6 = @"SEARCH_BAR_PLACEHOLDER_TRANSCRIPTION_SUPPORTED";
    }
    objc_super v7 = v6;
    id v11 = +[NSBundle mainBundle];
    id v8 = [v11 localizedStringForKey:v7 value:&stru_100228BC8 table:0];

    BOOL v9 = [(RCRecordingsCollectionViewController *)self searchController];
    unsigned __int8 v10 = [v9 searchBar];
    [v10 setPlaceholder:v8];
  }
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)_setupSearchController
{
  id v7 = [(RCRecordingsCollectionViewController *)self searchController];
  if (!v7)
  {
    id v7 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
    [(RCRecordingsCollectionViewController *)self setSearchController:v7];
    [v7 setDelegate:self];
    [v7 setSearchResultsUpdater:self];
    BOOL v3 = [v7 searchBar];
    [v3 setDelegate:self];

    id v4 = [v7 searchBar];
    [v4 setClipsToBounds:1];

    unsigned int v5 = [v7 searchBar];
    [v5 setUserInteractionEnabled:1];

    [v7 setObscuresBackgroundDuringPresentation:0];
    unsigned int v6 = [v7 searchBar];
    [v6 setLookToDictateEnabled:1];
  }
  [(RCRecordingsCollectionViewController *)self _updateSearchBarPlaceholder];
}

- (void)viewDidAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)RCRecordingsCollectionViewController;
  [(RCRecordingsCollectionViewController *)&v18 viewDidAppear:a3];
  if (([(RCRecordingsCollectionViewController *)self isFirstResponder] & 1) == 0)
  {
    id v4 = +[UIResponder currentFirstResponder];

    if (!v4) {
      [(RCRecordingsCollectionViewController *)self becomeFirstResponder];
    }
  }
  unsigned int v5 = [(RCRecordingsCollectionViewController *)self collectionView];
  unsigned int v6 = [v5 indexPathForSelectedItem];

  id v7 = [(RCRecordingsCollectionViewController *)self collectionView];
  id v8 = v7;
  if (v6) {
    [v7 selectItemAtIndexPath:v6 animated:0 scrollPosition:0];
  }
  if (([(RCRecordingsCollectionViewController *)self isEditing] & 1) == 0)
  {
    BOOL v9 = [v8 indexPathForSelectedItem];
    if (v9)
    {
      unsigned __int8 v10 = [v8 cellForItemAtIndexPath:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        unsigned __int8 v12 = [v11 UUID];
        objc_super v13 = +[RCRecordingCellDisplayModel recordingDisplayModelForUUID:v12];

        if (v13) {
          [(RCRecordingsCollectionViewController *)self _configureCell:v11 usingDisplayModel:v13];
        }
      }
    }
  }
  uint64_t v14 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  v15 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
  [v14 didSelectForUUID:v15 resetPosition:0 force:0];

  [(RCRecordingsCollectionViewController *)self finishLaunchTests];
  BOOL v16 = [(RCRecordingsCollectionViewController *)self viewDidAppearCompletionBlock];

  if (v16)
  {
    id v17 = [(RCRecordingsCollectionViewController *)self viewDidAppearCompletionBlock];
    v17[2]();

    [(RCRecordingsCollectionViewController *)self setViewDidAppearCompletionBlock:0];
  }
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (NSHashTable)cellsHashTable
{
  return self->_cellsHashTable;
}

- (void)_setupCollectionView
{
  BOOL v3 = [(RCRecordingsCollectionViewController *)self _createDiffableDataSource];
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v3;

  unsigned int v5 = self->_diffableDataSource;
  unsigned int v6 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v6 setDataSource:v5];

  id v7 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v7 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"NormalRecordingCellReuseIdentifier"];

  id v8 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"RecentlyDeletedRecordingCellReuseIdentifier"];

  BOOL v9 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v9 setAllowsMultipleSelectionDuringEditing:1];

  unsigned __int8 v10 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v10 setSelectionFollowsFocus:1];

  id v11 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v11 setDropDelegate:self];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v7;
    [v6 layoutIfNeeded];
    [(RCRecordingsCollectionViewController *)self _addCollectionViewCellToCellsMapTable:v6];
    [(RCRecordingsCollectionViewController *)self registerAppEntityInteractionForCollectionViewCell:v6];
  }
}

- (void)registerAppEntityInteractionForCollectionViewCell:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self;
  sub_100026D28(v4);
}

- (NSMutableDictionary)recordingUUIDToEntityInteraction
{
  return self->_recordingUUIDToEntityInteraction;
}

- (void)_addCollectionViewCellToCellsMapTable:(id)a3
{
  id v8 = a3;
  id v4 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v8;
    id v6 = [v5 UUID];
    if (v6)
    {
      id v7 = [v4 objectForKey:v6];
      if (!v7) {
        [v4 setObject:v5 forKey:v6];
      }
    }
  }
}

- (NSMapTable)cellsMapTable
{
  return self->_cellsMapTable;
}

- (void)_configureCell:(id)a3 usingDisplayModel:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 UUID];
    id v8 = v19;
    BOOL v9 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
    [v9 setObject:v8 forKey:v7];

    [v8 setCellDelegate:self];
    [v8 setUUID:v7];
    unsigned __int8 v10 = [v6 title];
    [v8 setRecordingTitle:v10];

    [v6 duration];
    [v8 setRecordingDuration:];
    id v11 = [v6 creationDate];
    [v8 setCreationDate:v11];

    [v8 setRepresentsDownloadingFile:[v6 representsDownloadingFile]];
    [v8 setWasManuallyRenamed:[v6 wasManuallyRenamed]];
    [v8 setHasTranscription:[v6 hasTranscription]];
    [v8 setHasMultipleTracks:[v6 hasMultipleTracks]];
    [v8 setIsRecentlyDeleted:[v6 recentlyDeleted]];
    unsigned __int8 v12 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
    unsigned int v13 = [v12 isPlayingForUUID:v7];

    if (v13)
    {
      [v8 setPlayControlState:1];
    }
    else
    {
      [v8 setPlayControlState:0];
      uint64_t v14 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
      [v14 currentTime];
      double v16 = v15;

      [v8 setCurrentTime:v16];
    }
    id v17 = [(RCRecordingsCollectionViewController *)self editingProgressItems];
    objc_super v18 = [v17 objectForKeyedSubscript:v7];

    if (v18)
    {
      [v8 setEditingInFlight:1];
      [v18 floatValue];
      [v8 setEditingProgress:];
    }
    else
    {
      [v8 setEditingInFlight:0];
    }
  }
}

- (RCLibraryActionHandler)libraryActionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryActionHandler);

  return (RCLibraryActionHandler *)WeakRetained;
}

- (NSMutableDictionary)editingProgressItems
{
  return self->_editingProgressItems;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)viewDidAppearCompletionBlock
{
  return self->_viewDidAppearCompletionBlock;
}

- (NSString)uuidOfSelectedItem
{
  return self->_uuidOfSelectedItem;
}

- (void)setSearchController:(id)a3
{
}

- (void)setReuseIdentifier:(id)a3
{
}

- (void)setLibraryActionHandler:(id)a3
{
}

- (void)setFolderUUID:(id)a3
{
}

- (void)setFolderType:(int64_t)a3
{
  self->_folderType = a3;
}

- (void)setFolderSelectionDelegate:(id)a3
{
}

- (void)setEditStateHandler:(id)a3
{
}

- (void)performDelayedSetup
{
  byte_10026A7E8 = 1;
  [(RCRecordingsCollectionViewController *)self _setupEditButton];
}

- (void)_classSpecificInit
{
}

- (void)setRecordingsDataCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_recordingsDataCoordinator, a3);
  id v5 = a3;
  [v5 setDelegate:self];
}

- (RCCloudRecording)selectedRecording
{
  BOOL v3 = [(RCRecordingsCollectionViewController *)self collectionView];
  id v4 = [v3 indexPathForSelectedItem];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 item];
    id v7 = [(RCRecordingsCollectionViewController *)self dataArray];
    if (v6 >= [v7 count])
    {
      id v8 = 0;
    }
    else
    {
      id v8 = [v7 objectAtIndexedSubscript:v6];
    }
  }
  else
  {
    id v8 = 0;
  }

  return (RCCloudRecording *)v8;
}

- (id)uuidOfSelectedRecording
{
  id v2 = [(RCRecordingsCollectionViewController *)self selectedRecording];
  BOOL v3 = [v2 uuid];

  return v3;
}

- (void)setIsSearching:(BOOL)a3
{
  if (self->_isSearching != a3)
  {
    self->_isSearching = a3;
    [(RCRecordingsCollectionViewController *)self setNeedsUpdateContentUnavailableConfiguration];
    [(RCRecordingsCollectionViewController *)self _handleEditModeFooterAndNavigationItem];
  }
}

- (BOOL)isRecentlyDeleted
{
  return 0;
}

- (RCRecordingsCollectionViewController)initWithUserFolderNamed:(id)a3 folderUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)UICollectionViewLayout);
  BOOL v9 = [(RCRecordingsCollectionViewController *)self initWithCollectionViewLayout:v8];

  if (v9)
  {
    [(RCRecordingsCollectionViewController *)v9 setFolderType:4];
    [(RCRecordingsCollectionViewController *)v9 setUserFolderName:v6];
    [(RCRecordingsCollectionViewController *)v9 setFolderUUID:v7];
    unsigned __int8 v10 = [[RCRecordingsCollectionViewControllerDataCoordinator alloc] initWithUserFolderNamed:v6 delegate:v9];
    recordingsDataCoordinator = v9->_recordingsDataCoordinator;
    v9->_recordingsDataCoordinator = v10;
  }
  return v9;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RCRecordingsCollectionViewController;
  [(RCRecordingsCollectionViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(RCRecordingsCollectionViewController *)self searchController];
  [v4 setActive:0];

  [(RCRecordingsCollectionViewController *)self _updateSearchString:&stru_100228BC8];
  [(RCRecordingsCollectionViewController *)self _classSpecificViewWillDisappear];
  if ([(RCRecordingsCollectionViewController *)self isFirstResponder]) {
    [(RCRecordingsCollectionViewController *)self resignFirstResponder];
  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = a4;
  id v6 = [(RCRecordingsCollectionViewController *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];
  id v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    [(RCRecordingsCollectionViewController *)self restyle];
  }
}

- (void)contentSizeChanged
{
  BOOL v3 = [(RCRecordingsCollectionViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];

  id v5 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v5 reloadData];

  [(RCRecordingsCollectionViewController *)self restyle];
  id v6 = [(RCRecordingsCollectionViewController *)self collectionView];
  unsigned int v7 = [v6 isEditing];

  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        unsigned __int8 v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v12);
          uint64_t v14 = [(RCRecordingsCollectionViewController *)self collectionView];
          [v14 selectItemAtIndexPath:v13 animated:0 scrollPosition:0];

          unsigned __int8 v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  else
  {
    double v15 = [(RCRecordingsCollectionViewController *)self collectionView];
    double v16 = [v4 firstObject];
    [v15 selectItemAtIndexPath:v16 animated:0 scrollPosition:0];
  }
}

- (void)restyle
{
  BOOL v3 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v3 restyle];

  [(RCRecordingsCollectionViewController *)self _styleView];
}

- (void)_toggleEdit
{
  if (![(RCRecordingsCollectionViewController *)self isUpdatingBottomLayoutForEditing])
  {
    [(RCRecordingsCollectionViewController *)self setEditing:[(RCRecordingsCollectionViewController *)self isEditing] ^ 1 animated:1];
    id v3 = [(RCRecordingsCollectionViewController *)self isEditing];
    id v4 = [(RCRecordingsCollectionViewController *)self editStateHandler];
    [v4 updateBottomLayoutForEditing:v3 delegate:self];

    [(RCRecordingsCollectionViewController *)self _handleEditModeFooterAndNavigationItem];
  }
}

- (void)updateToolbarAndFooterView
{
  if ([(RCRecordingsCollectionViewController *)self isEditing])
  {
    [(RCRecordingsCollectionViewController *)self _handleEditModeFooterAndNavigationItem];
  }
}

- (void)endEditing
{
  if ([(RCRecordingsCollectionViewController *)self isEditing])
  {
    [(RCRecordingsCollectionViewController *)self _toggleEdit];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v7 = [(RCRecordingsCollectionViewController *)self isEditing] & !a3;
  id v8 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  [v8 libraryWillChangeEditingState:v5];

  if (v5) {
    [(RCRecordingsCollectionViewController *)self _updateUUIDOfSelectedItem];
  }
  id v9 = [(RCRecordingsCollectionViewController *)self collectionView];
  if (v7)
  {
    id v10 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  [(RCRecordingsCollectionViewController *)self setWillSelectRecordingAfterExitingEditMode:v11];
  objc_initWeak(&location, self);
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_1000750D8;
  v26 = &unk_100222398;
  BOOL v29 = v11;
  objc_copyWeak(&v28, &location);
  id v12 = v9;
  id v27 = v12;
  [(RCRecordingsCollectionViewController *)self _setEditing:v5 animated:v4 withCompletionHandler:&v23];
  uint64_t v13 = +[NSBundle mainBundle];
  if (v5) {
    [v13 localizedStringForKey:@"CANCEL" value:&stru_100228BC8 table:0];
  }
  else {
  uint64_t v14 = [v13 localizedStringForKey:@"EDIT" value:&stru_100228BC8 table:0];
  }

  double v15 = [(RCRecordingsCollectionViewController *)self editButtonItem];
  [v15 setTitle:v14];

  if (!v5)
  {
    double v16 = [(RCRecordingsCollectionViewController *)self dataArray];
    -[RCRecordingsCollectionViewController _updateEditButtonStateForRecordingsCount:](self, "_updateEditButtonStateForRecordingsCount:", [v16 count]);
  }
  [v12 setSelectionFollowsFocus:v5 ^ 1];
  long long v17 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
  if (v17)
  {
    long long v18 = [v12 indexPathsForSelectedItems];
    id v19 = [v18 count];

    if (v5 && !v19)
    {
      long long v20 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
      [(RCRecordingsCollectionViewController *)self wasDeselectedForCellWithUUID:v20];
    }
  }
  if (!v5)
  {
    v21 = [(RCRecordingsCollectionViewController *)self editStateHandler];
    [v21 updateBottomLayoutForEditing:0 delegate:self];
  }
  v22 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  [v22 libraryDidChangeEditingState];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = (void (**)(void))a5;
  v15.receiver = self;
  v15.super_class = (Class)RCRecordingsCollectionViewController;
  [(RCRecordingsCollectionViewController *)&v15 setEditing:v6 animated:v5];
  if (v5)
  {
    id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v9 collectionViewEditModeAnimationDuration];
    double v11 = v10;

    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100075318;
    block[3] = &unk_1002221F8;
    uint64_t v14 = v8;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v8[2](v8);
  }
}

- (void)_updateUUIDOfSelectedItem
{
  id v5 = [(RCRecordingsCollectionViewController *)self collectionView];
  id v3 = [v5 indexPathForSelectedItem];
  BOOL v4 = [(RCRecordingsCollectionViewController *)self _uuidForItemAtIndexPath:v3];
  [(RCRecordingsCollectionViewController *)self setUuidOfSelectedItem:v4];
}

- (void)prepareForAdditionOfNewRecordingWithUUID:(id)a3
{
  [(RCRecordingsCollectionViewController *)self setUuidOfNewestRecording:a3];
  id v5 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  BOOL v4 = [(RCRecordingsCollectionViewController *)self uuidOfNewestRecording];
  [v5 setUUIDToSelectAfterDismiss:v4];
}

- (void)didProcessUpdatesWithRemainingItemCount:(unint64_t)a3
{
  id v3 = (id)a3;
  if (!a3) {
    -[RCRecordingsCollectionViewController setEditing:](self, "setEditing:");
  }
  if ([(RCRecordingsCollectionViewController *)self isEditing])
  {
    id v5 = [(RCRecordingsCollectionViewController *)self collectionView];
    BOOL v6 = [v5 indexPathsForSelectedItems];
    id v3 = [v6 count];
  }

  [(RCRecordingsCollectionViewController *)self _updateEditButtonStateForRecordingsCount:v3];
}

- (void)_logWhetherVisibleCellsHaveIntegrity
{
  id v3 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  BOOL v4 = [(RCRecordingsCollectionViewController *)self collectionView];
  id v5 = [v4 visibleCells];

  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          dispatch_time_t v12 = [v11 UUID];
          [v3 addObject:v12];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  uint64_t v13 = objc_opt_new();
  uint64_t v14 = [(RCRecordingsCollectionViewController *)self dataArray];
  if ([v14 count])
  {
    unint64_t v15 = 0;
    do
    {
      if ((unint64_t)[v3 count] <= v15) {
        break;
      }
      double v16 = [v14 objectAtIndexedSubscript:v15];
      long long v17 = [v16 uuid];
      [v13 addObject:v17];

      ++v15;
    }
    while ((unint64_t)[v14 count] > v15);
  }
  if ([v3 count])
  {
    unint64_t v18 = 0;
    while ((unint64_t)[v13 count] > v18)
    {
      id v19 = [v3 objectAtIndexedSubscript:v18];
      long long v20 = [v13 objectAtIndexedSubscript:v18];
      unsigned __int8 v21 = [v19 isEqualToString:v20];

      if ((v21 & 1) == 0)
      {
        v23 = OSLogForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_10016C1C0();
        }

        char v22 = 0;
        goto LABEL_23;
      }
      if ((unint64_t)[v3 count] <= ++v18) {
        break;
      }
    }
  }
  char v22 = 1;
LABEL_23:
  uint64_t v24 = OSLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    sub_10016C11C(v22, v24);
  }
}

- (void)deleteSelectedItems
{
  id v3 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  [v3 performAction:15 atPosition:0 forUUID:self sourceController:0 source:0.0];

  [(RCRecordingsCollectionViewController *)self _handleEditModeFooterAndNavigationItem];

  [(RCRecordingsCollectionViewController *)self setEditing:0 animated:1];
}

- (void)prepareForChangingContent
{
  self->_didInsertItems = 0;
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  self->_didInsertItems = 1;
}

- (void)reloadItemAtIndexPath:(id)a3 usingDisplayModel:(id)a4
{
  id v13 = a4;
  id v5 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  [v5 refreshDisplayWithDisplayModel:v13];

  id v6 = [(RCRecordingsCollectionViewController *)self collectionView];
  id v7 = [v6 window];

  if (v7)
  {
    uint64_t v8 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
    id v9 = [v13 UUID];
    double v10 = [v8 objectForKey:v9];

    if (v10)
    {
      id v11 = [v13 title];
      [v10 setRecordingTitle:v11];

      [v13 duration];
      [v10 setRecordingDuration:];
      dispatch_time_t v12 = [v13 creationDate];
      [v10 setCreationDate:v12];

      [v10 setRepresentsDownloadingFile:[v13 representsDownloadingFile]];
      [v10 setWasManuallyRenamed:[v13 wasManuallyRenamed]];
      [v10 setHasTranscription:[v13 hasTranscription]];
      [v10 setHasMultipleTracks:[v13 hasMultipleTracks]];
    }
  }
}

- (void)deleteItemAtIndexPath:(id)a3 withUUID:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v11 = v6;
    id v7 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
    unsigned int v8 = [v11 isEqualToString:v7];

    if (v8) {
      [(RCRecordingsCollectionViewController *)self setUuidOfSelectedItem:0];
    }
    id v9 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
    [v9 wasDeselectedForUUID:v11];

    double v10 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
    [v10 removeObjectForKey:v11];

    id v6 = v11;
  }
}

- (void)contentChangesComplete
{
  [(RCRecordingsCollectionViewController *)self _updateCollectionViewContent:[(RCRecordingsCollectionViewController *)self isUpdatingSearchString] ^ 1];
  id v3 = [(RCRecordingsCollectionViewController *)self dataArray];
  id v4 = [v3 count];

  [(RCRecordingsCollectionViewController *)self didProcessUpdatesWithRemainingItemCount:v4];
  if (self->_didInsertItems)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
      [v5 mostRecentRecordingIsSelectable];
    }
  }
}

- (id)selectedUUIDs
{
  id v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(RCRecordingsCollectionViewController *)self collectionView];
  id v5 = [v4 indexPathsForSelectedItems];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [(RCRecordingsCollectionViewController *)self dataArray];
        dispatch_time_t v12 = [v11 objectAtIndexedSubscript:[v10 item]];
        id v13 = [v12 uuid];

        [v3 addObject:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)allUUIDs
{
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(RCRecordingsCollectionViewController *)self dataArray];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) uuid];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)cellForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setCaptureIsUnderway:(BOOL)a3
{
  self->_captureIsUnderway = a3;
  [(RCRecordingsCollectionViewController *)self _animateContentUnavailableUpdateWithCompletion:0];
}

- (void)_animateContentUnavailableUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v5 contentUnavailableViewAnimationDuration];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100075F1C;
  v6[3] = &unk_100221278;
  v6[4] = self;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v4);
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scroll:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v10 = a3;
  uint64_t v8 = [(RCRecordingsCollectionViewController *)self collectionView];
  id v9 = v8;
  if (v5) {
    [v8 scrollToItemAtIndexPath:v10 atScrollPosition:1 animated:v6];
  }
  [v9 selectItemAtIndexPath:v10 animated:v6 scrollPosition:0];
  [(RCRecordingsCollectionViewController *)self _updateUUIDOfSelectedItem];
  [(RCRecordingsCollectionViewController *)self _notifyDelegatesThatSelectionChanged];
}

- (void)deselectSelectedItem
{
  id v6 = [(RCRecordingsCollectionViewController *)self collectionView];
  id v3 = [v6 indexPathForSelectedItem];
  if (v3)
  {
    [v6 deselectItemAtIndexPath:v3 animated:0];
    id v4 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
    BOOL v5 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
    [v4 wasDeselectedForUUID:v5];

    [(RCRecordingsCollectionViewController *)self setUuidOfSelectedItem:0];
  }
}

- (void)scrollToTop
{
  if ([(RCRecordingsCollectionViewController *)self _expectedNumberOfItems] >= 2)
  {
    id v4 = [(RCRecordingsCollectionViewController *)self collectionView];
    id v3 = +[NSIndexPath indexPathForItem:0 inSection:0];
    [v4 scrollToItemAtIndexPath:v3 atScrollPosition:1 animated:0];
  }
}

- (BOOL)presentsRecordingWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  id v6 = [v5 indexOfUUID:v4];

  return v6 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (void)willSelectItemWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  id v6 = [v5 indexOfUUID:v4];

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = +[NSIndexPath indexPathForItem:v6 inSection:0];
    [(RCRecordingsCollectionViewController *)self scrollToRevealPartiallyObscuredItemAtIndexPathIfNeeded:v7];
  }
}

- (void)selectItemWithUUID:(id)a3
{
}

- (void)selectItemWithUUID:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  id v8 = [v7 indexOfUUID:v6];

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL
    || ([(RCRecordingsCollectionViewController *)self collectionView],
        id v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 numberOfItemsInSection:0],
        v9,
        v8 >= v10))
  {
    long long v13 = OSLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10016C234(v13);
    }
  }
  else
  {
    id v14 = +[NSIndexPath indexPathForItem:v8 inSection:0];
    long long v11 = [(RCRecordingsCollectionViewController *)self collectionView];
    long long v12 = [v11 cellForItemAtIndexPath:v14];

    [(RCRecordingsCollectionViewController *)self selectItemAtIndexPath:v14 animated:v4 scroll:v12 == 0];
  }
}

- (void)_handleEditModeFooterAndNavigationItem
{
  id v3 = [(RCRecordingsCollectionViewController *)self collectionView];
  BOOL v4 = [v3 indexPathsForSelectedItems];
  id v5 = [v4 count];

  id v7 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  id v6 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v7 updateNavBarTitleAndDeleteButtonForRecordingsCount:v5 isEditMode:[v6 isEditing]];
}

- (void)handleDeleteForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    [(RCRecordingsCollectionViewController *)self setUuidOfSelectedItem:0];
  }
}

- (void)willUpdateBottomLayoutForEditing
{
}

- (void)didUpdateBottomLayoutForEditing
{
}

- (void)showNewFolderUIFromController:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingsCollectionViewController *)self folderSelectionDelegate];
  [v5 showNewFolderUIFromController:v4];
}

- (void)showRenamingControllerWithFolderName:(id)a3 controller:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RCRecordingsCollectionViewController *)self folderSelectionDelegate];
  [v8 showRenamingControllerWithFolderName:v7 controller:v6];
}

- (void)moveFolder:(id)a3 toDestinationIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RCRecordingsCollectionViewController *)self folderSelectionDelegate];
  [v8 moveFolder:v7 toDestinationIndexPath:v6];
}

- (void)deleteFolder:(id)a3 controller:(id)a4
{
  id v5 = a3;
  id v6 = [(RCRecordingsCollectionViewController *)self folderSelectionDelegate];
  [v6 deleteFolder:v5 controller:self completionBlock:0];
}

- (void)renameFolder:(id)a3 toName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RCRecordingsCollectionViewController *)self folderSelectionDelegate];
  [v8 renameFolder:v7 toName:v6];
}

- (void)presentViewController:(id)a3 sourceController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(RCRecordingsCollectionViewController *)self folderSelectionDelegate];
  [v13 presentViewController:v12 sourceController:v11 animated:v6 completion:v10];
}

- (void)_handleMove
{
  id v5 = (id)objc_opt_new();
  id v3 = [(RCRecordingsCollectionViewController *)self folderSelectionDelegate];
  [v5 setSelectionDelegate:v3];

  id v4 = [(RCRecordingsCollectionViewController *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v4 = a4;
  id v5 = [v4 localDragSession];

  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    id v7 = +[RCCaptureFormat supportedFileTypeIdentifiers];
    uint64_t v6 = [v4 hasItemsConformingToTypeIdentifiers:v7];
  }
  return v6;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4 folder:(id)a5
{
  id v7 = a5;
  id v8 = [a4 session];
  [(RCRecordingsCollectionViewController *)self performDropWithSession:v8 folder:v7];
}

- (void)performDropWithSession:(id)a3 folder:(id)a4
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [a3 items];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v9) itemProvider];
        id v11 = [v10 rc_supportedFileTypesRepresented];
        id v12 = [v11 firstObject];

        if (v10) {
          BOOL v13 = v12 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_100076ACC;
          v15[3] = &unk_100221FA8;
          v15[4] = self;
          id v14 = [v10 loadFileRepresentationForTypeIdentifier:v12 completionHandler:v15];
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)_performFolderTypeUpdatesOnRecording:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(RCRecordingsCollectionViewController *)self folderType];
  if (v5 == 1)
  {
    id v10 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
    id v11 = [v4 uuid];
    [v10 setFavorite:1 forRecordingWithUUID:v11];
  }
  else if (v5 == 4)
  {
    id v6 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
    id v7 = [v4 uuid];
    id v12 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v12 count:1];
    id v9 = [(RCRecordingsCollectionViewController *)self userFolderName];
    [v6 moveRecordingsWithUUIDs:v8 toUserFolderNamed:v9 source:self];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  [(RCRecordingsCollectionViewController *)self _removeCollectionViewCellFromCellsMapTable:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(RCRecordingsCollectionViewController *)self removeAppEntityInteractionForCollectionViewCell:v6];
  }
}

- (void)_removeCollectionViewCellFromCellsMapTable:(id)a3
{
  id v9 = a3;
  id v4 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v9;
    id v6 = [v5 UUID];
    if (v6)
    {
      uint64_t v7 = [v4 objectForKey:v6];
      uint64_t v8 = (void *)v7;
      if (v7 && (id)v7 == v5) {
        [v4 removeObjectForKey:v6];
      }
    }
  }
}

- (id)_favoriteSwipeAction:(BOOL)a3 forUUID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  uint64_t v8 = +[NSBundle mainBundle];
  id v9 = v8;
  if (a3)
  {
    id v10 = [v8 localizedStringForKey:@"ADD_TO_FAVORITES" value:&stru_100228BC8 table:0];

    id v11 = [v7 notFavoriteImage];
    uint64_t v12 = 38;
  }
  else
  {
    id v10 = [v8 localizedStringForKey:@"REMOVE_FROM_FAVORITES" value:&stru_100228BC8 table:0];

    id v11 = [v7 favoriteImage];
    uint64_t v12 = 39;
  }
  BOOL v13 = [[RCSwipeActionConfiguration alloc] initWithControlsAction:v12 recordingUUID:v6 actionTitle:v10];

  [(RCSwipeActionConfiguration *)v13 setActionImage:v11];
  [(RCSwipeActionConfiguration *)v13 setActionImageAxLabel:v10];
  long long v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  long long v19 = sub_1000774DC;
  long long v20 = &unk_1002223E8;
  BOOL v22 = a3;
  id v21 = v7;
  id v14 = v7;
  [(RCSwipeActionConfiguration *)v13 setCustomCompletionBlock:&v17];
  long long v15 = -[RCRecordingsCollectionViewController _createSwipeActionWithConfiguration:](self, "_createSwipeActionWithConfiguration:", v13, v17, v18, v19, v20);

  return v15;
}

- (id)_deleteSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [RCSwipeActionConfiguration alloc];
  uint64_t v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"DELETE" value:&stru_100228BC8 table:0];
  id v10 = [(RCSwipeActionConfiguration *)v7 initWithControlsAction:14 recordingUUID:v6 actionTitle:v9];

  [(RCSwipeActionConfiguration *)v10 setActionStyle:1];
  id v11 = +[RCRecorderStyleProvider sharedStyleProvider];
  uint64_t v12 = [v11 swipeTrashImage];
  [(RCSwipeActionConfiguration *)v10 setActionImage:v12];

  BOOL v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"AX_DELETE" value:&stru_100228BC8 table:0];
  [(RCSwipeActionConfiguration *)v10 setActionImageAxLabel:v14];

  long long v15 = [(RCRecordingsCollectionViewController *)self cellForUUID:v6];

  long long v16 = [v15 contentView];
  [(RCSwipeActionConfiguration *)v10 setSourceItem:v16];

  [(RCSwipeActionConfiguration *)v10 setShouldExecuteCompletionBeforeAction:v4];
  long long v17 = [(RCRecordingsCollectionViewController *)self _createSwipeActionWithConfiguration:v10];

  return v17;
}

- (id)_eraseSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [RCSwipeActionConfiguration alloc];
  uint64_t v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"DELETE" value:&stru_100228BC8 table:0];
  id v10 = [(RCSwipeActionConfiguration *)v7 initWithControlsAction:17 recordingUUID:v6 actionTitle:v9];

  [(RCSwipeActionConfiguration *)v10 setActionStyle:1];
  id v11 = [(RCRecordingsCollectionViewController *)self cellForUUID:v6];

  [(RCSwipeActionConfiguration *)v10 setSourceItem:v11];
  [(RCSwipeActionConfiguration *)v10 setShouldExecuteCompletionBeforeAction:v4];
  uint64_t v12 = [(RCRecordingsCollectionViewController *)self _createSwipeActionWithConfiguration:v10];

  return v12;
}

- (id)_moveToFolderSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [RCSwipeActionConfiguration alloc];
  uint64_t v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"MOVE_TO_FOLDER" value:&stru_100228BC8 table:0];
  id v10 = [(RCSwipeActionConfiguration *)v7 initWithControlsAction:42 recordingUUID:v6 actionTitle:v9];

  id v11 = +[RCRecorderStyleProvider sharedStyleProvider];
  uint64_t v12 = [v11 filledMoveToFolderImage];
  [(RCSwipeActionConfiguration *)v10 setActionImage:v12];

  BOOL v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"MOVE_TO_FOLDER" value:&stru_100228BC8 table:0];
  [(RCSwipeActionConfiguration *)v10 setActionImageAxLabel:v14];

  long long v15 = +[UIColor systemBlueColor];
  [(RCSwipeActionConfiguration *)v10 setActionBackgroundColor:v15];

  long long v16 = [(RCRecordingsCollectionViewController *)self cellForUUID:v6];

  long long v17 = [v16 contentView];
  [(RCSwipeActionConfiguration *)v10 setSourceItem:v17];

  [(RCSwipeActionConfiguration *)v10 setShouldExecuteCompletionBeforeAction:v4];
  uint64_t v18 = [(RCRecordingsCollectionViewController *)self _createSwipeActionWithConfiguration:v10];

  return v18;
}

- (id)_moreOptionsSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [RCSwipeActionConfiguration alloc];
  uint64_t v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"MORE_ACTIONS" value:&stru_100228BC8 table:0];
  id v10 = [(RCSwipeActionConfiguration *)v7 initWithControlsAction:28 recordingUUID:v6 actionTitle:v9];

  id v11 = +[RCRecorderStyleProvider sharedStyleProvider];
  uint64_t v12 = [v11 ellipsisImage];
  [(RCSwipeActionConfiguration *)v10 setActionImage:v12];

  BOOL v13 = [(RCRecordingsCollectionViewController *)self cellForUUID:v6];

  [(RCSwipeActionConfiguration *)v10 setSourceItem:v13];
  [(RCSwipeActionConfiguration *)v10 setShouldExecuteCompletionBeforeAction:v4];
  id v14 = [(RCRecordingsCollectionViewController *)self _createSwipeActionWithConfiguration:v10];

  return v14;
}

- (id)_createSwipeActionWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 actionStyle];
  id v6 = [v4 actionTitle];
  long long v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  long long v19 = sub_100077CDC;
  long long v20 = &unk_100222410;
  id v7 = v4;
  id v21 = v7;
  BOOL v22 = self;
  uint64_t v8 = +[UIContextualAction contextualActionWithStyle:v5 title:v6 handler:&v17];

  id v9 = [v7 actionImage:v17, v18, v19, v20];

  if (v9)
  {
    id v10 = [v7 actionImage];
    [v8 setImage:v10];
  }
  id v11 = [v7 actionImageAxLabel];

  if (v11)
  {
    uint64_t v12 = [v7 actionImageAxLabel];
    BOOL v13 = [v8 image];
    [v13 setAccessibilityLabel:v12];
  }
  id v14 = [v7 actionBackgroundColor];

  if (v14)
  {
    long long v15 = [v7 actionBackgroundColor];
    [v8 setBackgroundColor:v15];
  }

  return v8;
}

- (BOOL)_supportsSwipeActionsForIndexPath:(id)a3 swipeActionsType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  uint64_t v8 = [v7 uuidAtIndexPath:v6];

  id v9 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
  id v10 = [v9 objectForKey:v8];

  uint64_t v11 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  unsigned __int8 v12 = [(id)v11 isEditingInFlightForUUID:v8];

  LOBYTE(v11) = [v10 isEditingTitle];
  objc_opt_class();
  LOBYTE(a4) = (v12 | v11 | (a4 == 0) & objc_opt_isKindOfClass()) ^ 1;

  return a4;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  id v9 = [v8 uuidAtIndexPath:v7];

  id v10 = [v6 indexPathForSelectedItem];
  unsigned __int8 v11 = [(RCRecordingsCollectionViewController *)self _isDownloadingAtIndex:v7];
  if ([v6 isEditing])
  {
    unsigned __int8 v12 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
    unsigned __int8 v13 = [v12 isEditingInFlightForUUID:v9];

    if (v10)
    {
LABEL_3:
      BOOL v14 = [v10 compare:v7] == 0;
      goto LABEL_6;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
    if (v10) {
      goto LABEL_3;
    }
  }
  BOOL v14 = 0;
LABEL_6:
  char v15 = v11 | v13 | v14;
  if ((v15 & 1) == 0)
  {
    long long v16 = [v6 cellForItemAtIndexPath:v7];
    -[RCRecordingsCollectionViewController setIsSelectingCellForFocusUpdate:](self, "setIsSelectingCellForFocusUpdate:", [v16 isFocused]);
  }
  return v15 ^ 1;
}

- (void)scrollToRevealPartiallyObscuredItemAtIndexPathIfNeeded:(id)a3
{
  id v7 = a3;
  id v4 = [(RCRecordingsCollectionViewController *)self collectionView];
  id v5 = [v4 indexPathsForVisibleItems];
  unsigned int v6 = [v5 containsObject:v7];

  if (v6)
  {
    [(RCRecordingsCollectionViewController *)self _scrollDownToItemAtIndexPathIfNeeded:v7];
    [(RCRecordingsCollectionViewController *)self _scrollUpToItemAtIndexPathIfNeeded:v7];
  }
}

- (void)_scrollUpToItemAtIndexPathIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingsCollectionViewController *)self collectionView];
  unsigned int v6 = [v5 cellForItemAtIndexPath:v4];
  [v6 frame];
  double v8 = v7;
  [v5 contentOffset];
  double v10 = v9;
  [v5 safeAreaInsets];
  double v12 = v11;
  unsigned __int8 v13 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v13 explicitlyScrollsToRecordingsCollectionViewItemOnSelection]) {
    BOOL v14 = v8 < v10 + v12;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    +[CATransaction begin];
    char v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    long long v17 = sub_100078294;
    uint64_t v18 = &unk_100221C38;
    id v19 = v5;
    id v20 = v4;
    +[CATransaction setCompletionBlock:&v15];
    +[CATransaction commit];
  }
}

- (void)_scrollDownToItemAtIndexPathIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingsCollectionViewController *)self collectionView];
  unsigned int v6 = [v5 cellForItemAtIndexPath:v4];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  [v5 contentOffset];
  double v12 = v11;
  [v5 frame];
  double v14 = v13;
  [v5 contentInset];
  double v16 = v15;
  [v5 contentInset];
  double v18 = v17;
  id v19 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v19 explicitlyScrollsToRecordingsCollectionViewItemOnSelection]
    && v8 + v10 > v12 + v14 - v16 - v18)
  {
    +[CATransaction begin];
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    BOOL v22 = sub_100078428;
    v23 = &unk_100221C38;
    id v24 = v5;
    id v25 = v4;
    +[CATransaction setCompletionBlock:&v20];
    +[CATransaction commit];
  }
}

- (BOOL)_isDownloadingAtIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  unsigned __int8 v6 = [v5 isDownloadingAtIndexPath:v4];

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  double v7 = [(RCRecordingsCollectionViewController *)self searchController];
  if ([v7 isActive]
    && ![(RCRecordingsCollectionViewController *)self isSelectingCellForFocusUpdate])
  {
    double v8 = [v7 searchBar];
    [v8 resignFirstResponder];
  }
  [(RCRecordingsCollectionViewController *)self setInDidSelect:1];
  double v9 = [v6 cellForItemAtIndexPath:v11];

  [(RCRecordingsCollectionViewController *)self setInDidSelect:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(RCRecordingsCollectionViewController *)self isEditing] & 1) == 0)
  {
    double v10 = [v9 UUID];
    [(RCRecordingsCollectionViewController *)self setUuidOfSelectedItem:v10];
  }
  [(RCRecordingsCollectionViewController *)self scrollToRevealPartiallyObscuredItemAtIndexPathIfNeeded:v11];
  [(RCRecordingsCollectionViewController *)self _handleEditModeFooterAndNavigationItem];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, v9);
  [(RCRecordingsCollectionViewController *)self setIsSelectingCellForFocusUpdate:0];
  [(RCRecordingsCollectionViewController *)self _notifyDelegatesThatSelectionChanged];
}

- (void)_notifyDelegatesThatSelectionChanged
{
  if (([(RCRecordingsCollectionViewController *)self isEditing] & 1) == 0)
  {
    id v3 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];

    if (v3)
    {
      id v4 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
      [(RCRecordingsCollectionViewController *)self didSelectCellWithUUID:v4];
    }
  }
}

- (void)_pauseSelecteditem
{
  id v4 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  id v3 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
  [v4 performAction:1 atPosition:v3 forUUID:0 sourceController:0 source:0.0];
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5 = [(RCRecordingsCollectionViewController *)self _uuidForItemAtIndexPath:a4];
  [(RCRecordingsCollectionViewController *)self wasDeselectedForCellWithUUID:v5];
  [(RCRecordingsCollectionViewController *)self _handleEditModeFooterAndNavigationItem];
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  if (([(RCRecordingsCollectionViewController *)self isEditing] & 1) == 0)
  {
    [(RCRecordingsCollectionViewController *)self _toggleEdit];
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v8 = a4;
  double v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v10 = [v9 showsMoreActionsContextMenu];

  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10007889C;
    v13[3] = &unk_100222438;
    id v14 = v8;
    double v15 = self;
    CGFloat v16 = x;
    CGFloat v17 = y;
    id v11 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v13];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)performAction:(int64_t)a3 atPosition:(double)a4 forCellWithUUID:(id)a5 source:(id)a6
{
  if (a5)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
    [v12 performAction:a3 atPosition:v11 forUUID:self sourceController:v10 source:a4];
  }
}

- (void)showPlayingForItemWithUUID:(id)a3
{
  id v8 = a3;
  id v4 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  id v5 = [v4 indexOfUUID:v8];

  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
    double v7 = [v6 objectForKey:v8];

    [v7 setPlayControlState:1];
  }
}

- (void)showIdleForItemWithUUID:(id)a3
{
  id v8 = a3;
  id v4 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  id v5 = [v4 indexOfUUID:v8];

  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
    double v7 = [v6 objectForKey:v8];

    [v7 setPlayControlState:0];
  }
}

- (void)setCurrentTime:(double)a3 forItemWithUUID:(id)a4
{
  id v12 = a4;
  id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v7 = [v6 expandsRecordingsCollectionViewItemOnSelection];

  if (v7)
  {
    id v8 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
    id v9 = [v8 indexOfUUID:v12];

    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
      id v11 = [v10 objectForKey:v12];

      [v11 setCurrentTime:a3];
    }
  }
}

- (void)editingIsInFlight:(BOOL)a3 progress:(float)a4 forUUID:(id)a5
{
  BOOL v6 = a3;
  id v18 = a5;
  if (v6)
  {
    *(float *)&double v8 = a4;
    id v9 = +[NSNumber numberWithFloat:v8];
    id v10 = [(RCRecordingsCollectionViewController *)self editingProgressItems];
    [v10 setObject:v9 forKeyedSubscript:v18];
  }
  else
  {
    id v9 = [(RCRecordingsCollectionViewController *)self editingProgressItems];
    [v9 setObject:0 forKeyedSubscript:v18];
  }

  id v11 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
  id v12 = [v11 objectForKey:v18];

  if (v12)
  {
    double v13 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v14 = [v13 expandsRecordingsCollectionViewItemOnSelection];

    [v12 setEditingInFlight:v6];
    *(float *)&double v15 = a4;
    [v12 setEditingProgress:v15];
    if (!v6)
    {
      if (v14)
      {
        CGFloat v16 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
        unsigned int v17 = [v16 isEqualToString:v18];

        if (v17) {
          [(RCRecordingsCollectionViewController *)self selectItemWithUUID:v18];
        }
      }
    }
  }
}

- (void)performRenameWithNewTitle:(id)a3 forCellWithUUID:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
    [v8 performRenameWithNewTitle:v7 forUUID:v6];
  }
}

- (void)didSelectCellWithUUID:(id)a3
{
  id v20 = a3;
  id v4 = [(RCRecordingsCollectionViewController *)self uuidOfNewestRecording];
  if (v4)
  {
    id v5 = [(RCRecordingsCollectionViewController *)self uuidOfNewestRecording];
    unsigned int v6 = [v20 isEqualToString:v5];
  }
  else
  {
    unsigned int v6 = 0;
  }

  if (v20)
  {
    id v7 = [(RCRecordingsCollectionViewController *)self uuidOfNewestRecording];
    if (v7) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 1;
    }

    if (!v6) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v8 = 1;
    if (!v6) {
      goto LABEL_14;
    }
  }
  id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v10 = [v9 expandsRecordingsCollectionViewItemOnSelection];

  if (v10)
  {
    id v11 = [(RCRecordingsCollectionViewController *)self diffableDataSource];
    id v12 = [(RCRecordingsCollectionViewController *)self diffableDataSource];
    double v13 = [v12 snapshot];
    [v11 applySnapshot:v13 animatingDifferences:1];
  }
  [(RCRecordingsCollectionViewController *)self setUuidOfNewestRecording:0];
  uint64_t v8 = 0;
LABEL_14:
  unsigned int v14 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
  double v15 = [v14 objectForKey:v20];

  if ((v6 & 1) == 0)
  {
    if (([v15 isSelected] & 1) != 0
      || ([v15 configurationState],
          CGFloat v16 = objc_claimAutoreleasedReturnValue(),
          unsigned int v17 = [v16 isEditing],
          v16,
          v17))
    {
      uint64_t v8 = 0;
    }
  }
  id v18 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  [v18 didSelectForUUID:v20 resetPosition:v8 force:0];

  if (![(RCRecordingsCollectionViewController *)self willSelectRecordingAfterExitingEditMode])
  {
    id v19 = [(RCRecordingsCollectionViewController *)self splitViewController];
    [v19 hidePrimaryColumnIfNeeded];
  }
}

- (void)wasDeselectedForCellWithUUID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
    [v5 wasDeselectedForUUID:v4];
  }
}

- (void)didEndEditingTitle:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUID];
  unsigned int v6 = [(RCRecordingsCollectionViewController *)self cellWhoseTitleIsBeingEdited];
  id v7 = [v6 UUID];
  unsigned int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    [(RCRecordingsCollectionViewController *)self setCellWhoseTitleIsBeingEdited:0];
  }
  else
  {
    id v9 = OSLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10016C3AC(self, (uint64_t)v4, v9);
    }
  }
}

- (id)_uuidForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingsCollectionViewController *)self dataArray];
  if (!v4)
  {
LABEL_6:
    unsigned int v6 = 0;
    goto LABEL_7;
  }
  unsigned int v6 = 0;
  if ([v4 item] != (id)0x7FFFFFFFFFFFFFFFLL && v5)
  {
    id v7 = [v4 item];
    if (v7 < [v5 count])
    {
      unsigned int v8 = [(RCRecordingsCollectionViewController *)self dataArray];
      id v9 = [v8 objectAtIndexedSubscript:[v4 item]];
      unsigned int v6 = [v9 uuid];

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

- (void)willPresentSearchController:(id)a3
{
}

- (void)didPresentSearchController:(id)a3
{
  id v6 = a3;
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    id v3 = [v6 searchBar];
    id v4 = [v3 searchField];

    id v5 = +[UIColor blackColor];
    [v4 setTextColor:v5];
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = [a3 searchBar];
  id v5 = [v4 text];

  [(RCRecordingsCollectionViewController *)self _updateSearchString:v5];
}

- (void)willDismissSearchController:(id)a3
{
  [(RCRecordingsCollectionViewController *)self _updateSearchString:&stru_100228BC8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(RCRecordingsCollectionViewController *)self collectionView];
  id v5 = [v4 visibleCells];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 resignFirstResponderForTitleEditing];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = [(RCRecordingsCollectionViewController *)self collectionView];
  [v4 becomeFirstResponder];

  [(RCRecordingsCollectionViewController *)self setIsSearching:0];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  if (![(RCRecordingsCollectionViewController *)self isSearching])
  {
    [(RCRecordingsCollectionViewController *)self setIsSearching:1];
  }
}

- (void)_updateSearchString:(id)a3
{
  id v4 = a3;
  [(RCRecordingsCollectionViewController *)self setIsUpdatingSearchString:1];
  id v5 = [(RCRecordingsCollectionViewController *)self recordingsDataCoordinator];
  [v5 setSearchString:v4];

  [(RCRecordingsCollectionViewController *)self setIsUpdatingSearchString:0];

  [(RCRecordingsCollectionViewController *)self setNeedsUpdateContentUnavailableConfiguration];
}

- (void)_setSearchString:(id)a3
{
  id v4 = a3;
  id v6 = [(RCRecordingsCollectionViewController *)self searchController];
  id v5 = [v6 searchBar];
  [v5 setText:v4];
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = [a5 item];
  id v9 = [(RCRecordingsCollectionViewController *)self dataArray];
  if (v8 >= [v9 count]) {
    goto LABEL_6;
  }
  unsigned int v10 = [v9 objectAtIndexedSubscript:v8];
  long long v11 = +[RCComposition compositionLoadedForSavedRecording:v10];
  if (![v11 compositionIsShareable])
  {

LABEL_6:
    long long v26 = &__NSArray0__struct;
    goto LABEL_11;
  }
  long long v12 = [[RCShareableComposition alloc] initWithComposition:v11];
  long long v13 = objc_opt_new();
  id v30 = 0;
  unsigned __int8 v14 = [(RCShareableComposition *)v12 registerAudioFileRepresentationWithItemProvider:v13 error:&v30];
  id v15 = v30;
  if (v14)
  {
    CGFloat v16 = [v10 title];
    [v10 url];
    unsigned int v17 = v28 = v15;
    [v17 pathExtension];
    id v18 = v29 = v12;
    id v19 = [v16 stringByAppendingPathExtension:v18];

    [v13 setSuggestedName:v19];
    id v20 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v13];
    uint64_t v21 = [v10 uuid];
    [v20 setLocalObject:v21];

    int64_t v22 = [(RCRecordingsCollectionViewController *)self folderType];
    v23 = [(RCRecordingsCollectionViewController *)self folderUUID];
    int64_t v24 = v22;
    id v15 = v28;
    id v25 = +[RCLocalDropContext dropContextWithFolderType:v24 folderUUID:v23 folderIndexPath:0 payloadType:0];

    [v7 setLocalContext:v25];
    id v31 = v20;
    long long v26 = +[NSArray arrayWithObjects:&v31 count:1];

    long long v12 = v29;
  }
  else
  {
    id v19 = OSLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10016C46C();
    }
    long long v26 = &__NSArray0__struct;
  }

LABEL_11:

  return v26;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v4 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  [v4 willBeginDragSession];
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v4 = [(RCRecordingsCollectionViewController *)self libraryActionHandler];
  [v4 didEndDragSession];
}

- (BOOL)accessibilityPerformEscape
{
  if ([(RCRecordingsCollectionViewController *)self isEditing])
  {
    [(RCRecordingsCollectionViewController *)self _toggleEdit];
    id v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"ENDED_EDITING" value:&stru_100228BC8 table:0];

    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v4);
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)RCRecordingsCollectionViewController;
    return [(RCRecordingsCollectionViewController *)&v6 accessibilityPerformEscape];
  }
}

- (BOOL)selectedCellIsEditingTitle
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = [(RCRecordingsCollectionViewController *)self cellWhoseTitleIsBeingEdited];

    if (!v3)
    {
      id v5 = [(RCRecordingsCollectionViewController *)self recentlyDeletedCollectionViewController];
      unsigned __int8 v7 = [v5 selectedCellIsEditingTitle];
      goto LABEL_12;
    }
  }
  id v4 = [(RCRecordingsCollectionViewController *)self cellWhoseTitleIsBeingEdited];
  id v5 = v4;
  if (v4 && ([v4 isEditingTitle] & 1) == 0)
  {
    objc_super v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10016C4EC();
    }
  }
  if ([v5 isEditingTitle])
  {
    unsigned __int8 v7 = [v5 isSelected];
LABEL_12:
    BOOL v8 = v7;
    goto LABEL_13;
  }
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (BOOL)selectedCellIsInFlightEditing
{
  id v3 = [(RCRecordingsCollectionViewController *)self uuidOfSelectedItem];
  if (v3)
  {
    id v4 = [(RCRecordingsCollectionViewController *)self editingProgressItems];
    id v5 = [v4 objectForKeyedSubscript:v3];

    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)editSelectedItemTitle
{
  id v3 = [(RCRecordingsCollectionViewController *)self collectionView];
  if ((uint64_t)[v3 numberOfItemsInSection:0] >= 1)
  {
    id v4 = [v3 indexPathForSelectedItem];
    if (v4)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100079D24;
      v7[3] = &unk_100221C38;
      id v8 = v3;
      id v9 = v4;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100079D38;
      v5[3] = &unk_100221C88;
      void v5[4] = self;
      id v6 = v9;
      +[UIView animateWithDuration:v7 animations:v5 completion:0.3];
    }
  }
}

- (BOOL)canMoveSelectionUp
{
  return [(RCRecordingsCollectionViewController *)self canMoveSelectionInDirection:0];
}

- (BOOL)canMoveSelectionDown
{
  return [(RCRecordingsCollectionViewController *)self canMoveSelectionInDirection:1];
}

- (BOOL)canMoveSelectionInDirection:(int64_t)a3
{
  id v5 = [(RCRecordingsCollectionViewController *)self collectionView];
  if (([v5 isEditing] & 1) == 0
    && (uint64_t)[v5 numberOfItemsInSection:0] >= 1)
  {
    int64_t v6 = [(RCRecordingsCollectionViewController *)self _incrementForDirection:a3];
    unsigned __int8 v7 = [v5 indexPathForSelectedItem];
    id v8 = v7;
    if (v7)
    {
      id v9 = (char *)[v7 item] + v6;
      if ((uint64_t)v9 < 0) {
        goto LABEL_10;
      }
    }
    else
    {
      id v9 = 0;
    }
    if ((uint64_t)v9 < (uint64_t)[v5 numberOfItemsInSection:0])
    {
      long long v11 = +[NSIndexPath indexPathForItem:v9 inSection:0];
      unsigned int v10 = ![(RCRecordingsCollectionViewController *)self _isDownloadingAtIndex:v11];

LABEL_11:
      goto LABEL_12;
    }
LABEL_10:
    LOBYTE(v10) = 0;
    goto LABEL_11;
  }
  LOBYTE(v10) = 0;
LABEL_12:

  return v10;
}

- (void)moveSelectionUp
{
}

- (void)moveSelectionDown
{
}

- (void)_moveSelectionInDirection:(int64_t)a3
{
  id v12 = [(RCRecordingsCollectionViewController *)self collectionView];
  if ((uint64_t)[v12 numberOfItemsInSection:0] >= 1)
  {
    int64_t v5 = [(RCRecordingsCollectionViewController *)self _incrementForDirection:a3];
    int64_t v6 = [v12 indexPathForSelectedItem];
    unsigned __int8 v7 = v6;
    if (v6)
    {
      id v8 = (char *)[v6 item] + v5;
      if ((uint64_t)v8 < 0)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      id v8 = 0;
    }
    if ((uint64_t)v8 < (uint64_t)[v12 numberOfItemsInSection:0])
    {
      id v9 = +[NSIndexPath indexPathForItem:v8 inSection:0];
      [v12 selectItemAtIndexPath:v9 animated:1 scrollPosition:2];
      if (v7)
      {
        uint64_t v10 = [(RCRecordingsCollectionViewController *)self _uuidForItemAtIndexPath:v7];
        if (v10)
        {
          long long v11 = (void *)v10;
          [(RCRecordingsCollectionViewController *)self wasDeselectedForCellWithUUID:v10];
        }
      }
      [(RCRecordingsCollectionViewController *)self _updateUUIDOfSelectedItem];
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (int64_t)_incrementForDirection:(int64_t)a3
{
  if (a3) {
    return a3 == 1;
  }
  else {
    return -1;
  }
}

- (void)_logHashTable
{
  id v2 = [(RCRecordingsCollectionViewController *)self cellsMapTable];
  id v8 = [v2 objectEnumerator];

  uint64_t v3 = [v8 nextObject];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = 0;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v6 = [v4 UUID];
        NSLog(@"cell at index %d has UUID: %@", v5, v6);

        uint64_t v5 = (v5 + 1);
      }
      uint64_t v7 = [v8 nextObject];

      id v4 = (void *)v7;
    }
    while (v7);
  }
}

- (RCLibraryEditStateHandler)editStateHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editStateHandler);

  return (RCLibraryEditStateHandler *)WeakRetained;
}

- (int64_t)folderType
{
  return self->_folderType;
}

- (NSString)folderUUID
{
  return self->_folderUUID;
}

- (NSString)userFolderName
{
  return self->_userFolderName;
}

- (void)setUserFolderName:(id)a3
{
}

- (BOOL)captureIsUnderway
{
  return self->_captureIsUnderway;
}

- (RCFolderSelectionDelegate)folderSelectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderSelectionDelegate);

  return (RCFolderSelectionDelegate *)WeakRetained;
}

- (void)setViewDidAppearCompletionBlock:(id)a3
{
}

- (BOOL)willSelectRecordingAfterExitingEditMode
{
  return self->_willSelectRecordingAfterExitingEditMode;
}

- (void)setWillSelectRecordingAfterExitingEditMode:(BOOL)a3
{
  self->_willSelectRecordingAfterExitingEditMode = a3;
}

- (void)setCellsMapTable:(id)a3
{
}

- (void)setCellsHashTable:(id)a3
{
}

- (RCRecordingCollectionViewCell)cellWhoseTitleIsBeingEdited
{
  return self->_cellWhoseTitleIsBeingEdited;
}

- (void)setCellWhoseTitleIsBeingEdited:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (NSHashTable)cellsBeingEditedHashTable
{
  return self->_cellsBeingEditedHashTable;
}

- (void)setCellsBeingEditedHashTable:(id)a3
{
}

- (void)setEditingProgressItems:(id)a3
{
}

- (void)setDiffableDataSource:(id)a3
{
}

- (_TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator)moreButtonMenuCreator
{
  return self->_moreButtonMenuCreator;
}

- (void)setMoreButtonMenuCreator:(id)a3
{
}

- (BOOL)inDidSelect
{
  return self->_inDidSelect;
}

- (void)setInDidSelect:(BOOL)a3
{
  self->_inDidSelect = a3;
}

- (BOOL)isUpdatingBottomLayoutForEditing
{
  return self->_isUpdatingBottomLayoutForEditing;
}

- (void)setIsUpdatingBottomLayoutForEditing:(BOOL)a3
{
  self->_isUpdatingBottomLayoutForEditing = a3;
}

- (BOOL)isSelectingCellForFocusUpdate
{
  return self->_isSelectingCellForFocusUpdate;
}

- (void)setIsSelectingCellForFocusUpdate:(BOOL)a3
{
  self->_isSelectingCellForFocusUpdate = a3;
}

- (BOOL)isUpdatingSearchString
{
  return self->_isUpdatingSearchString;
}

- (void)setIsUpdatingSearchString:(BOOL)a3
{
  self->_isUpdatingSearchString = a3;
}

- (BOOL)isSearching
{
  return self->_isSearching;
}

- (NSString)normalRecordingsSearchStringForRestore
{
  return self->_normalRecordingsSearchStringForRestore;
}

- (void)setNormalRecordingsSearchStringForRestore:(id)a3
{
}

- (RCRecentlyDeletedRecordingsCollectionViewController)recentlyDeletedCollectionViewController
{
  return self->_recentlyDeletedCollectionViewController;
}

- (void)setRecentlyDeletedCollectionViewController:(id)a3
{
}

- (NSString)uuidOfNewestRecording
{
  return self->_uuidOfNewestRecording;
}

- (void)setUuidOfNewestRecording:(id)a3
{
}

- (void)setUuidOfSelectedItem:(id)a3
{
}

- (void)setRecordingUUIDToEntityInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingUUIDToEntityInteraction, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_uuidOfSelectedItem, 0);
  objc_storeStrong((id *)&self->_uuidOfNewestRecording, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedCollectionViewController, 0);
  objc_storeStrong((id *)&self->_normalRecordingsSearchStringForRestore, 0);
  objc_storeStrong((id *)&self->_moreButtonMenuCreator, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_editingProgressItems, 0);
  objc_storeStrong((id *)&self->_cellsBeingEditedHashTable, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_cellWhoseTitleIsBeingEdited, 0);
  objc_storeStrong((id *)&self->_cellsHashTable, 0);
  objc_storeStrong((id *)&self->_cellsMapTable, 0);
  objc_storeStrong(&self->_viewDidAppearCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_folderSelectionDelegate);
  objc_storeStrong((id *)&self->_userFolderName, 0);
  objc_storeStrong((id *)&self->_folderUUID, 0);
  objc_storeStrong((id *)&self->_recordingsDataCoordinator, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_destroyWeak((id *)&self->_editStateHandler);

  objc_destroyWeak((id *)&self->_libraryActionHandler);
}

- (void)removeAppEntityInteractionForCollectionViewCell:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000DE4A4(v4);
}

@end