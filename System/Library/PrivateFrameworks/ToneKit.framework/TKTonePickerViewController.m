@interface TKTonePickerViewController
+ (id)_checkmarkImage;
- (BOOL)_allowsAutoScrollingToSelectedTone;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isAllowedToPresentMediaPicker;
- (BOOL)_shouldShowCheckmarkOnTrailingEdge;
- (BOOL)_stopMediaItemPlaybackWithFadeOutDuration:(double)a3;
- (BOOL)ignoreMute;
- (BOOL)isMediaAtTop;
- (BOOL)isNoneAtTop;
- (BOOL)showsDefault;
- (BOOL)showsIgnoreMute;
- (BOOL)showsMedia;
- (BOOL)showsNone;
- (BOOL)showsNothingSelected;
- (BOOL)showsStoreButtonInNavigationBar;
- (BOOL)showsToneStore;
- (BOOL)showsVibrations;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tonePickerControllerShouldShowMedia:(id)a3;
- (NSNumber)selectedMediaIdentifier;
- (NSString)_overrideFirstToneSectionTitle;
- (NSString)defaultToneIdentifier;
- (NSString)noneString;
- (NSString)selectedToneIdentifier;
- (NSString)selectedVibrationIdentifier;
- (NSString)topic;
- (TKTonePickerStyleProvider)styleProvider;
- (TKTonePickerViewController)initWithAlertType:(int64_t)a3;
- (TKTonePickerViewController)initWithStyle:(int64_t)a3;
- (TKTonePickerViewControllerDelegate)delegate;
- (double)_minimumTextIndentationForTableView:(id)a3 withCheckmarkImage:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_customHeaderViewForHeaderInSection:(int64_t)a3;
- (id)_initWithAlertType:(int64_t)a3 tableViewStyle:(int64_t)a4;
- (id)_mediaItemForIdentifier:(id)a3;
- (id)_musicPlayer;
- (id)_pickerRowItemForIndexPath:(id)a3;
- (id)selectedIdentifier:(BOOL *)a3;
- (id)selectedTonePickerItem;
- (id)tableView:(id)a3 cellForPickerRowItem:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tonePickerController:(id)a3 identifierOfMediaItemAtIndex:(unint64_t)a4;
- (id)tonePickerController:(id)a3 titleOfMediaItemAtIndex:(unint64_t)a4;
- (int64_t)alertType;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)targetDevice;
- (unint64_t)_addMediaIdentifierToList:(id)a3;
- (unint64_t)numberOfMediaItemsInTonePickerController:(id)a3;
- (unint64_t)tonePickerController:(id)a3 indexOfMediaItemWithIdentifier:(id)a4;
- (void)_configureTextColorOfLabelInCell:(id)a3 shouldTintText:(BOOL)a4 checked:(BOOL)a5;
- (void)_didFinishPreparingToPlayMediaItemWithIdentifier:(id)a3 error:(id)a4;
- (void)_didSelectMediaItemWithIdentifier:(id)a3;
- (void)_didSelectToneWithIdentifier:(id)a3;
- (void)_handleMediaLibraryDidChangeNotification;
- (void)_handlePreferredContentSizeCategoryDidChangeNotification:(id)a3;
- (void)_handleSwitchControlValueChanged:(id)a3;
- (void)_isAllowedToPresentMediaPicker;
- (void)_playMediaItemWithIdentifier:(id)a3;
- (void)_reloadData;
- (void)_resetScrollingPosition;
- (void)_setAllowsAutoScrollingToSelectedTone:(BOOL)a3;
- (void)_setOverrideFirstToneSectionTitle:(id)a3;
- (void)_togglePlayMediaItemWithIdentifier:(id)a3;
- (void)_updateCell:(id)a3 withDownloadProgress:(float)a4 animated:(BOOL)a5;
- (void)_updateMinimumTextIndentation;
- (void)_updateStyleOfTableView:(id)a3 forStyleProvider:(id)a4;
- (void)addMediaItems:(id)a3;
- (void)applicationWillSuspend;
- (void)dealloc;
- (void)layoutMarginsDidChangeInTonePickerTableView:(id)a3;
- (void)loadView;
- (void)loadViewForTonePickerTableViewController:(id)a3;
- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4;
- (void)mediaPickerDidCancel:(id)a3;
- (void)removeMediaItems:(id)a3;
- (void)setDefaultToneIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIgnoreMute:(BOOL)a3;
- (void)setMediaAtTop:(BOOL)a3;
- (void)setNoneAtTop:(BOOL)a3;
- (void)setNoneString:(id)a3;
- (void)setSelectedMediaIdentifier:(id)a3;
- (void)setSelectedToneIdentifier:(id)a3;
- (void)setSelectedVibrationIdentifier:(id)a3;
- (void)setShowsDefault:(BOOL)a3;
- (void)setShowsIgnoreMute:(BOOL)a3;
- (void)setShowsMedia:(BOOL)a3;
- (void)setShowsNone:(BOOL)a3;
- (void)setShowsNothingSelected:(BOOL)a3;
- (void)setShowsToneStore:(BOOL)a3;
- (void)setShowsVibrations:(BOOL)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTargetDevice:(int64_t)a3;
- (void)setTopic:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 forPickerRowItem:(id)a5;
- (void)tableView:(id)a3 updateCell:(id)a4 withSeparatorForPickerRowItem:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tonePickerController:(id)a3 didDeletePickerRowItems:(id)a4;
- (void)tonePickerController:(id)a3 didDeleteTonePickerSectionItems:(id)a4;
- (void)tonePickerController:(id)a3 didInsertPickerRowItems:(id)a4;
- (void)tonePickerController:(id)a3 didInsertTonePickerSectionItems:(id)a4;
- (void)tonePickerController:(id)a3 didSelectMediaItemAtIndex:(unint64_t)a4 selectionDidChange:(BOOL)a5;
- (void)tonePickerController:(id)a3 didUpdateCheckedStatus:(BOOL)a4 ofTonePickerItem:(id)a5;
- (void)tonePickerController:(id)a3 didUpdateDetailText:(id)a4 ofTonePickerItem:(id)a5;
- (void)tonePickerController:(id)a3 didUpdateDownloadProgressOfTonePickerItem:(id)a4;
- (void)tonePickerController:(id)a3 didUpdateHeaderTextOfTonePickerSectionItems:(id)a4;
- (void)tonePickerController:(id)a3 didUpdateIgnoreMute:(BOOL)a4 forTonePickerItem:(id)a5 atIndexPath:(id)a6;
- (void)tonePickerController:(id)a3 didUpdateTonePickerItem:(id)a4;
- (void)tonePickerController:(id)a3 requestsPerformingBatchUpdates:(id)a4 completion:(id)a5;
- (void)tonePickerController:(id)a3 requestsPresentingAlertWithTitle:(id)a4 message:(id)a5;
- (void)tonePickerController:(id)a3 requestsPresentingToneClassicsPickerForItem:(id)a4;
- (void)tonePickerController:(id)a3 selectedMediaItemWithIdentifier:(id)a4;
- (void)tonePickerController:(id)a3 selectedToneWithIdentifier:(id)a4;
- (void)tonePickerController:(id)a3 willBeginPlaybackOfToneWithIdentifier:(id)a4;
- (void)tonePickerControllerDidReloadTones:(id)a3;
- (void)tonePickerControllerRequestsMediaItemsRefresh:(id)a3;
- (void)tonePickerControllerRequestsPresentingMediaItemPicker:(id)a3;
- (void)tonePickerControllerRequestsPresentingVibrationPicker:(id)a3;
- (void)tonePickerTableViewControllerWillBeDeallocated:(id)a3;
- (void)tonePickerTableViewWillDisappear:(BOOL)a3;
- (void)updateCell:(id)a3 withCheckedStatus:(BOOL)a4 forTonePickerItem:(id)a5;
- (void)updateCell:(id)a3 withDetailText:(id)a4;
- (void)updateDividerContentColorToMatchSeparatorColorInTableView:(id)a3;
- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4;
- (void)vibrationPickerViewControllerWasDismissed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TKTonePickerViewController

- (TKTonePickerViewController)initWithStyle:(int64_t)a3
{
  return [(TKTonePickerViewController *)self initWithAlertType:1];
}

- (TKTonePickerViewController)initWithAlertType:(int64_t)a3
{
  return (TKTonePickerViewController *)[(TKTonePickerViewController *)self _initWithAlertType:a3 tableViewStyle:1];
}

- (id)_initWithAlertType:(int64_t)a3 tableViewStyle:(int64_t)a4
{
  v19.receiver = self;
  v19.super_class = (Class)TKTonePickerViewController;
  v6 = [(TKTonePickerViewController *)&v19 initWithStyle:a4];
  if (v6)
  {
    v7 = [[TKTonePickerController alloc] initWithAlertType:a3];
    tonePickerController = v6->_tonePickerController;
    v6->_tonePickerController = v7;

    [(TKTonePickerController *)v6->_tonePickerController setDelegate:v6];
    id v9 = objc_alloc_init(MEMORY[0x263F7FC98]);
    [(TKTonePickerController *)v6->_tonePickerController setToneStoreDownloadController:v9];
    uint64_t v10 = [(TKTonePickerController *)v6->_tonePickerController canShowStore];
    v6->_showsToneStore = v10;
    [(TKTonePickerController *)v6->_tonePickerController setShowsToneStore:v10];
    v6->_allowsAutoScrollingToSelectedTone = 1;
    uint64_t v11 = [(id)objc_opt_class() _checkmarkImage];
    checkmarkImage = v6->_checkmarkImage;
    v6->_checkmarkImage = (UIImage *)v11;

    v13 = objc_alloc_init(TKTonePickerTableViewCellLayoutManager);
    tableViewCellLayoutManagerForIndentedRows = v6->_tableViewCellLayoutManagerForIndentedRows;
    v6->_tableViewCellLayoutManagerForIndentedRows = v13;

    v15 = objc_alloc_init(TKTonePickerTableViewCellLayoutManager);
    tableViewCellLayoutManagerForUnindentedRows = v6->_tableViewCellLayoutManagerForUnindentedRows;
    v6->_tableViewCellLayoutManagerForUnindentedRows = v15;

    v6->_tonePickerTableViewStyle = a4;
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v6 selector:sel__handlePreferredContentSizeCategoryDidChangeNotification_ name:*MEMORY[0x263F1D158] object:0];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D158] object:0];
  if (self->_showsMedia
    && [(TKTonePickerViewController *)self _isAllowedToPresentMediaPicker])
  {
    [v3 removeObserver:self name:*MEMORY[0x263F11418] object:0];
    v4 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [v4 endGeneratingLibraryChangeNotifications];
  }
  [(TKTonePickerViewController *)self tonePickerTableViewControllerWillBeDeallocated:self];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_switchControlsBeingObserved;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) removeTarget:self action:sel__handleSwitchControlValueChanged_ forControlEvents:4096];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v23 count:16];
    }
    while (v7);
  }

  [(TKVibrationPickerViewController *)self->_vibrationPickerViewController _setDismissalDelegate:0];
  [(TKVibrationPickerViewController *)self->_vibrationPickerViewController _setAdditionalDelegate:0];
  if (self->_toneClassicsTableViewController)
  {
    uint64_t v10 = TLLogToneManagement();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      toneClassicsTableViewController = self->_toneClassicsTableViewController;
      *(_DWORD *)buf = 138543874;
      v18 = toneClassicsTableViewController;
      __int16 v19 = 2082;
      v20 = "-[TKTonePickerViewController dealloc]";
      __int16 v21 = 2114;
      v22 = self;
      _os_log_impl(&dword_22107E000, v10, OS_LOG_TYPE_DEFAULT, "Nilling out tonePickerTableViewControllerHelper of %{public}@ in %{public}s for %{public}@.", buf, 0x20u);
    }

    [(TKToneClassicsTableViewController *)self->_toneClassicsTableViewController setTonePickerTableViewControllerHelper:0];
  }
  [(MPMediaPickerController *)self->_mediaPickerController setDelegate:0];
  [(TKTonePickerController *)self->_tonePickerController setDelegate:0];

  v12.receiver = self;
  v12.super_class = (Class)TKTonePickerViewController;
  [(TKTonePickerViewController *)&v12 dealloc];
}

- (int64_t)alertType
{
  return [(TKTonePickerController *)self->_tonePickerController alertType];
}

- (NSString)topic
{
  return [(TKTonePickerController *)self->_tonePickerController topic];
}

- (void)setTopic:(id)a3
{
  id v7 = a3;
  id v4 = [(TKTonePickerController *)self->_tonePickerController topic];
  v5 = v4;
  if (v4 != v7 && ([v4 isEqualToString:v7] & 1) == 0)
  {
    [(TKTonePickerController *)self->_tonePickerController setTopic:v7];
    if ([(TKTonePickerViewController *)self alertType] == 13
      && [v7 isEqualToString:*MEMORY[0x263F7FCC0]])
    {
      if (!self->_showsToneStoreWasSetExplicitly) {
        [(TKTonePickerController *)self->_tonePickerController setShowsToneStore:0];
      }
      BOOL v6 = 0;
      self->_needsScrollPositionReset = 0;
    }
    else
    {
      BOOL v6 = 1;
    }
    if (!self->_allowsAutoScrollingToSelectedToneWasSetExplicitly) {
      self->_allowsAutoScrollingToSelectedTone = v6;
    }
  }
}

- (BOOL)showsDefault
{
  return [(TKTonePickerController *)self->_tonePickerController showsDefault];
}

- (void)setShowsDefault:(BOOL)a3
{
}

- (NSString)defaultToneIdentifier
{
  return [(TKTonePickerController *)self->_tonePickerController defaultToneIdentifier];
}

- (void)setDefaultToneIdentifier:(id)a3
{
}

- (BOOL)showsNone
{
  return [(TKTonePickerController *)self->_tonePickerController showsNone];
}

- (void)setShowsNone:(BOOL)a3
{
}

- (BOOL)isNoneAtTop
{
  return [(TKTonePickerController *)self->_tonePickerController isNoneAtTop];
}

- (void)setNoneAtTop:(BOOL)a3
{
}

- (NSString)noneString
{
  return [(TKTonePickerController *)self->_tonePickerController noneString];
}

- (void)setNoneString:(id)a3
{
}

- (BOOL)showsNothingSelected
{
  return [(TKTonePickerController *)self->_tonePickerController showsNothingSelected];
}

- (void)setShowsNothingSelected:(BOOL)a3
{
}

- (NSString)selectedToneIdentifier
{
  return [(TKTonePickerController *)self->_tonePickerController selectedToneIdentifier];
}

- (void)setSelectedToneIdentifier:(id)a3
{
}

- (BOOL)_allowsAutoScrollingToSelectedTone
{
  return self->_allowsAutoScrollingToSelectedTone;
}

- (void)_setAllowsAutoScrollingToSelectedTone:(BOOL)a3
{
  self->_allowsAutoScrollingToSelectedTone = a3;
  self->_allowsAutoScrollingToSelectedToneWasSetExplicitly = 1;
}

- (NSString)_overrideFirstToneSectionTitle
{
  return [(TKTonePickerController *)self->_tonePickerController overrideFirstToneSectionTitle];
}

- (void)_setOverrideFirstToneSectionTitle:(id)a3
{
}

- (void)setShowsToneStore:(BOOL)a3
{
  if (a3) {
    *(_DWORD *)&a3 = [(TKTonePickerController *)self->_tonePickerController canShowStore];
  }
  if (self->_showsToneStore != a3)
  {
    self->_showsToneStore = a3;
    self->_showsToneStoreWasSetExplicitly = 1;
    tonePickerController = self->_tonePickerController;
    -[TKTonePickerController setShowsToneStore:](tonePickerController, "setShowsToneStore:");
  }
}

- (void)setShowsIgnoreMute:(BOOL)a3
{
  if (self->_showsIgnoreMute != a3)
  {
    self->_showsIgnoreMute = a3;
    -[TKTonePickerController setShowsIgnoreMute:](self->_tonePickerController, "setShowsIgnoreMute:");
  }
}

- (BOOL)ignoreMute
{
  return [(TKTonePickerController *)self->_tonePickerController ignoreMute];
}

- (void)setIgnoreMute:(BOOL)a3
{
}

- (void)_handleSwitchControlValueChanged:(id)a3
{
  BOOL isHandlingSwitchControlValueChanged = self->_isHandlingSwitchControlValueChanged;
  self->_BOOL isHandlingSwitchControlValueChanged = 1;
  -[TKTonePickerController setIgnoreMute:](self->_tonePickerController, "setIgnoreMute:", [a3 isOn]);
  self->_BOOL isHandlingSwitchControlValueChanged = isHandlingSwitchControlValueChanged;
}

- (int64_t)targetDevice
{
  return [(TKTonePickerController *)self->_tonePickerController targetDevice];
}

- (void)setTargetDevice:(int64_t)a3
{
}

- (BOOL)showsVibrations
{
  return [(TKTonePickerController *)self->_tonePickerController showsVibrations];
}

- (void)setShowsVibrations:(BOOL)a3
{
}

- (NSString)selectedVibrationIdentifier
{
  return [(TKTonePickerController *)self->_tonePickerController selectedVibrationIdentifier];
}

- (void)setSelectedVibrationIdentifier:(id)a3
{
}

- (void)setStyleProvider:(id)a3
{
  id v7 = (TKTonePickerStyleProvider *)a3;
  if (self->_styleProvider != v7)
  {
    objc_storeStrong((id *)&self->_styleProvider, a3);
    if ([(TKTonePickerViewController *)self isViewLoaded])
    {
      v5 = [(TKTonePickerViewController *)self tableView];
      [(TKTonePickerViewController *)self _updateStyleOfTableView:v5 forStyleProvider:v7];
      [v5 reloadData];
      if ([(TKToneClassicsTableViewController *)self->_toneClassicsTableViewController isViewLoaded])
      {
        BOOL v6 = [(TKToneClassicsTableViewController *)self->_toneClassicsTableViewController tableView];
        [(TKTonePickerViewController *)self _updateStyleOfTableView:v6 forStyleProvider:v7];
        [v6 reloadData];
      }
    }
  }
}

- (void)_updateStyleOfTableView:(id)a3 forStyleProvider:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  BOOL v6 = v5;
  if (v5)
  {
    if (([v5 tonePickerUsesOpaqueBackground] & 1) == 0)
    {
      [v10 setBackgroundView:0];
      id v7 = [MEMORY[0x263F1C550] clearColor];
      [v10 setBackgroundColor:v7];
    }
    objc_msgSend(v10, "setSeparatorStyle:", objc_msgSend(v6, "tonePickerTableViewSeparatorStyle"));
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = UIBackdropViewOverlayBlendModeFromTKBackdropViewOverlayBlendMode([v6 tonePickerCustomTableSeparatorBackdropOverlayBlendMode]);
      if (v8) {
        [v10 _setSeparatorBackdropOverlayBlendMode:v8];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v6 tonePickerCustomTableSeparatorColor];
      if (v9) {
        [v10 setSeparatorColor:v9];
      }
    }
  }
}

- (void)loadView
{
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TKTonePickerViewController;
  [(TKTonePickerViewController *)&v3 viewDidLoad];
  [(TKTonePickerViewController *)self _updateMinimumTextIndentation];
  [(TKTonePickerViewController *)self _reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TKTonePickerViewController;
  [(TKTonePickerViewController *)&v7 viewWillAppear:a3];
  id v4 = [(TKTonePickerViewController *)self tableView];
  if (v4)
  {
    id v5 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [v5 lineHeight];
    [v4 setEstimatedRowHeight:ceil(v6 + v6)];

    [v4 setRowHeight:*MEMORY[0x263F1D600]];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)TKTonePickerViewController;
  [(TKTonePickerViewController *)&v11 viewDidAppear:a3];
  if (self->_toneClassicsTableViewController)
  {
    id v4 = TLLogToneManagement();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      toneClassicsTableViewController = self->_toneClassicsTableViewController;
      *(_DWORD *)buf = 138543874;
      long long v13 = toneClassicsTableViewController;
      __int16 v14 = 2082;
      long long v15 = "-[TKTonePickerViewController viewDidAppear:]";
      __int16 v16 = 2114;
      v17 = self;
      _os_log_impl(&dword_22107E000, v4, OS_LOG_TYPE_DEFAULT, "Nilling out tonePickerTableViewControllerHelper of %{public}@ in %{public}s for %{public}@.", buf, 0x20u);
    }

    [(TKToneClassicsTableViewController *)self->_toneClassicsTableViewController setTonePickerTableViewControllerHelper:0];
    double v6 = self->_toneClassicsTableViewController;
    self->_toneClassicsTableViewController = 0;
  }
  objc_super v7 = [(TKTonePickerViewController *)self view];
  uint64_t v8 = [v7 window];

  if (v8)
  {
    id v9 = [(TKTonePickerViewController *)self tableView];
    id v10 = [v9 indexPathForSelectedRow];
    [v9 deselectRowAtIndexPath:v10 animated:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(TKTonePickerController *)self->_tonePickerController finishedWithPicker];
  v5.receiver = self;
  v5.super_class = (Class)TKTonePickerViewController;
  [(TKTonePickerViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)TKTonePickerViewController;
  [(TKTonePickerViewController *)&v8 viewDidLayoutSubviews];
  if (self->_needsScrollPositionReset)
  {
    BOOL v3 = [(TKTonePickerController *)self->_tonePickerController indexPathForSelectedTone];
    if (v3)
    {
      id v4 = [(TKTonePickerViewController *)self tableView];
      objc_super v5 = [v4 indexPathsForVisibleRows];
      char v6 = [v5 containsObject:v3];

      if ((v6 & 1) == 0) {
        [v4 scrollToRowAtIndexPath:v3 atScrollPosition:2 animated:0];
      }
    }
    else
    {
      id v4 = [(TKTonePickerController *)self->_tonePickerController _indexPathForFirstToneGroup];
      if (v4)
      {
        objc_super v7 = [(TKTonePickerViewController *)self tableView];
        [v7 scrollToRowAtIndexPath:v4 atScrollPosition:1 animated:0];
      }
    }

    self->_needsScrollPositionReset = 0;
  }
}

- (void)applicationWillSuspend
{
  v3.receiver = self;
  v3.super_class = (Class)TKTonePickerViewController;
  [(TKTonePickerViewController *)&v3 applicationWillSuspend];
  [(TKTonePickerController *)self->_tonePickerController finishedWithPicker];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_customHeaderViewForHeaderInSection:(int64_t)a3
{
  id v4 = [(TKTonePickerController *)self->_tonePickerController pickerItemForSection:a3];
  objc_super v5 = [v4 text];
  char v6 = @"TKTonePickerSectionHeaderDefault";
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  switch([v4 sectionHeader])
  {
    case 1:
      goto LABEL_5;
    case 2:
      unint64_t v7 = [v4 regularToneSectionIndex];
      char v6 = @"TKTonePickerSectionHeaderRegularToneGroup";
      if (!v5) {
        goto LABEL_25;
      }
      goto LABEL_6;
    case 3:
      char v6 = @"TKTonePickerSectionHeaderMedia";
LABEL_5:
      if (v5) {
        goto LABEL_6;
      }
      goto LABEL_25;
    case 4:
      char v6 = @"TKTonePickerSectionHeaderStore";
      if (!v5) {
        goto LABEL_25;
      }
LABEL_6:
      objc_super v8 = [(NSMutableDictionary *)self->_toneSectionHeaderViews objectForKey:v6];
      id v9 = v8;
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v7 >= [(TKLabelContainerView *)v8 count])
        {
          objc_super v11 = 0;
        }
        else
        {
          id v10 = [(TKLabelContainerView *)v9 objectAtIndex:v7];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_super v11 = v10;
          }
          else {
            objc_super v11 = 0;
          }
        }
        id v9 = v11;
      }
      if (v9) {
        goto LABEL_26;
      }
      if ([(TKTonePickerStyleProvider *)self->_styleProvider wantsCustomTonePickerHeaderView])
      {
        id v9 = objc_alloc_init(TKLabelContainerView);
        id v12 = v5;
        if ((objc_opt_respondsToSelector() & 1) != 0
          && [(TKTonePickerStyleProvider *)self->_styleProvider tonePickerHeaderTextShouldBeUppercase])
        {
          long long v13 = [MEMORY[0x263EFF960] currentLocale];
          uint64_t v25 = [v12 uppercaseStringWithLocale:v13];

          id v12 = (id)v25;
        }
        [(TKLabelContainerView *)v9 setLabelText:v12];
        __int16 v14 = [(TKTonePickerStyleProvider *)self->_styleProvider tonePickerHeaderTextFont];
        [(TKLabelContainerView *)v9 setLabelFont:v14];

        long long v15 = [(TKTonePickerStyleProvider *)self->_styleProvider tonePickerHeaderTextColor];
        [(TKLabelContainerView *)v9 setLabelTextColor:v15];

        __int16 v16 = [(TKTonePickerStyleProvider *)self->_styleProvider tonePickerHeaderTextShadowColor];
        [(TKLabelContainerView *)v9 setLabelShadowColor:v16];

        [(TKTonePickerStyleProvider *)self->_styleProvider tonePickerHeaderTextShadowOffset];
        -[TKLabelContainerView setLabelShadowOffset:](v9, "setLabelShadowOffset:");
        [(TKTonePickerStyleProvider *)self->_styleProvider tonePickerHeaderTextPaddingInsets];
        -[TKLabelContainerView setLabelPaddingInsets:](v9, "setLabelPaddingInsets:");
        toneSectionHeaderViews = self->_toneSectionHeaderViews;
        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!toneSectionHeaderViews)
          {
            uint64_t v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
            __int16 v19 = self->_toneSectionHeaderViews;
            self->_toneSectionHeaderViews = v18;

            toneSectionHeaderViews = self->_toneSectionHeaderViews;
          }
          [(NSMutableDictionary *)toneSectionHeaderViews setObject:v9 forKey:v6];
        }
        else
        {
          id v21 = [(NSMutableDictionary *)toneSectionHeaderViews objectForKey:v6];
          if (!v21)
          {
            id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
            v22 = self->_toneSectionHeaderViews;
            if (!v22)
            {
              v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
              uint64_t v24 = self->_toneSectionHeaderViews;
              self->_toneSectionHeaderViews = v23;

              v22 = self->_toneSectionHeaderViews;
            }
            [(NSMutableDictionary *)v22 setObject:v21 forKey:v6];
          }
          objc_msgSend(v21, "tk_ensureHasItemsOrNullUpToIndex:", v7);
          [v21 replaceObjectAtIndex:v7 withObject:v9];
        }
      }
      else
      {
LABEL_25:
        id v9 = 0;
      }
LABEL_26:

      return v9;
    default:
      goto LABEL_25;
  }
}

- (double)_minimumTextIndentationForTableView:(id)a3 withCheckmarkImage:(id)a4
{
  id v5 = a4;
  [a3 layoutMargins];
  double v7 = v6;
  [v5 size];
  double v9 = v8;

  double result = v7 + v9 + 15.0;
  if (result < 57.0) {
    return 57.0;
  }
  return result;
}

- (void)_updateMinimumTextIndentation
{
  if ([(TKTonePickerViewController *)self isViewLoaded])
  {
    objc_super v3 = [(TKTonePickerViewController *)self tableView];
    [(TKTonePickerViewController *)self _minimumTextIndentationForTableView:v3 withCheckmarkImage:self->_checkmarkImage];
    double v5 = v4;

    tableViewCellLayoutManagerForIndentedRows = self->_tableViewCellLayoutManagerForIndentedRows;
    [(TKTonePickerTableViewCellLayoutManager *)tableViewCellLayoutManagerForIndentedRows setMinimumTextIndentation:v5];
  }
}

+ (id)_checkmarkImage
{
  v2 = [MEMORY[0x263F1C660] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F1D260]];
  objc_super v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  double v4 = [MEMORY[0x263F1C658] fontWithDescriptor:v3 size:0.0];
  double v5 = [MEMORY[0x263F1C6C8] configurationWithFont:v4 scale:2];
  double v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark" withConfiguration:v5];

  return v6;
}

- (void)_didSelectToneWithIdentifier:(id)a3
{
  id v5 = a3;
  double v4 = [(TKTonePickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 tonePickerViewController:self selectedToneWithIdentifier:v5];
  }
}

- (void)_configureTextColorOfLabelInCell:(id)a3 shouldTintText:(BOOL)a4 checked:(BOOL)a5
{
  if (a4)
  {
    id v7 = a3;
    [v7 setShouldTintTextLabel:1];
    [v7 setTextLabelColor:0];
  }
  else
  {
    styleProvider = self->_styleProvider;
    id v6 = a3;
    id v7 = [(TKTonePickerStyleProvider *)styleProvider tonePickerCellTextColor];
    if (!v7)
    {
      id v7 = +[TKUIKitConstants defaultTableViewCellTextColor];
    }
    [v6 setShouldTintTextLabel:0];
    [v6 setTextLabelColor:v7];
  }
}

- (id)_pickerRowItemForIndexPath:(id)a3
{
  tonePickerController = self->_tonePickerController;
  id v4 = a3;
  id v5 = -[TKTonePickerController pickerItemForSection:](tonePickerController, "pickerItemForSection:", [v4 section]);
  uint64_t v6 = [v4 row];

  id v7 = [v5 childItemAtIndex:v6];

  return v7;
}

- (void)_reloadData
{
  if ([(TKTonePickerViewController *)self isViewLoaded])
  {
    objc_super v3 = [(TKTonePickerViewController *)self tableView];
    [v3 reloadData];
  }

  [(TKTonePickerViewController *)self _resetScrollingPosition];
}

- (void)_resetScrollingPosition
{
  if (self->_allowsAutoScrollingToSelectedTone && !self->_needsScrollPositionReset)
  {
    self->_needsScrollPositionReset = 1;
    if ([(TKTonePickerViewController *)self isViewLoaded])
    {
      id v3 = [(TKTonePickerViewController *)self view];
      [v3 setNeedsLayout];
    }
  }
}

- (BOOL)_shouldShowCheckmarkOnTrailingEdge
{
  if ([(TKTonePickerViewController *)self alertType] != 13) {
    return 0;
  }
  id v3 = [(TKTonePickerViewController *)self topic];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F7FCC0]];

  return v4;
}

- (void)_updateCell:(id)a3 withDownloadProgress:(float)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  uint64_t v8 = [v7 accessoryView];
  id v10 = (TKDownloadIndicatorView *)v8;
  if (llroundf(a4 * 8388600.0) != llroundf(8388600.0))
  {
    if (!v8)
    {
      id v10 = objc_alloc_init(TKDownloadIndicatorView);
      [v7 setAccessoryView:v10];
    }
    *(float *)&double v9 = a4;
    [(TKDownloadIndicatorView *)v10 setProgress:v5 animated:0 completion:v9];
    goto LABEL_7;
  }
  if (v8)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __72__TKTonePickerViewController__updateCell_withDownloadProgress_animated___block_invoke;
    v12[3] = &unk_2645898B8;
    id v13 = v7;
    LODWORD(v11) = 1.0;
    [(TKDownloadIndicatorView *)v10 setProgress:v5 animated:v12 completion:v11];

LABEL_7:
  }
}

uint64_t __72__TKTonePickerViewController__updateCell_withDownloadProgress_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccessoryView:0];
}

- (void)_handlePreferredContentSizeCategoryDidChangeNotification:(id)a3
{
  if ([(TKTonePickerViewController *)self isViewLoaded])
  {
    styleProvider = self->_styleProvider;
    if (styleProvider)
    {
      BOOL v5 = [(TKTonePickerStyleProvider *)styleProvider tonePickerHeaderTextFont];
      [(TKTonePickerStyleProvider *)self->_styleProvider tonePickerHeaderTextPaddingInsets];
      toneSectionHeaderViews = self->_toneSectionHeaderViews;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __87__TKTonePickerViewController__handlePreferredContentSizeCategoryDidChangeNotification___block_invoke;
      v12[3] = &unk_264589B48;
      id v13 = v5;
      uint64_t v14 = v7;
      uint64_t v15 = v8;
      uint64_t v16 = v9;
      uint64_t v17 = v10;
      id v11 = v5;
      [(NSMutableDictionary *)toneSectionHeaderViews enumerateKeysAndObjectsUsingBlock:v12];
    }
  }
}

void __87__TKTonePickerViewController__handlePreferredContentSizeCategoryDidChangeNotification___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v4;
    [v6 setLabelFont:v5];
    objc_msgSend(v6, "setLabelPaddingInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v4;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v13 = *(void *)(a1 + 32);
              id v14 = v12;
              [v14 setLabelFont:v13];
              objc_msgSend(v14, "setLabelPaddingInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
    }
  }
}

- (void)_handleMediaLibraryDidChangeNotification
{
}

- (BOOL)_isAllowedToPresentMediaPicker
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!self->_isAllowedToPresentMediaPickerFlagLoaded)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2050000000;
    id v3 = (void *)getLSApplicationRecordClass_softClass;
    uint64_t v23 = getLSApplicationRecordClass_softClass;
    if (!getLSApplicationRecordClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getLSApplicationRecordClass_block_invoke;
      uint64_t v25 = &unk_264589B98;
      v26 = &v20;
      __getLSApplicationRecordClass_block_invoke((uint64_t)buf);
      id v3 = (void *)v21[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v20, 8);
    id v19 = 0;
    uint64_t v5 = (void *)[[v4 alloc] initWithBundleIdentifier:@"com.apple.Music" allowPlaceholder:1 error:&v19];
    id v6 = v19;
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      uint64_t v10 = [v5 applicationState];
      char v11 = [v10 isValid];

      if (v11)
      {
        uint64_t v20 = 0;
        id v21 = &v20;
        uint64_t v22 = 0x2050000000;
        id v12 = (void *)getPDCPreflightManagerClass_softClass;
        uint64_t v23 = getPDCPreflightManagerClass_softClass;
        if (!getPDCPreflightManagerClass_softClass)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getPDCPreflightManagerClass_block_invoke;
          uint64_t v25 = &unk_264589B98;
          v26 = &v20;
          __getPDCPreflightManagerClass_block_invoke((uint64_t)buf);
          id v12 = (void *)v21[3];
        }
        uint64_t v13 = v12;
        _Block_object_dispose(&v20, 8);
        uint64_t v9 = [[v13 alloc] initWithTargetQueue:0];
        char v14 = [v9 requiresPreflightForApplicationRecord:v5];
        self->_isAllowedToPresentMediaPicker = v14 ^ 1;
        long long v15 = TLLogToneManagement();
        long long v16 = v15;
        if (v14)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v5;
            *(_WORD *)&buf[22] = 2114;
            uint64_t v25 = v9;
            _os_log_error_impl(&dword_22107E000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Music application %{public}@ requires preflight for privacy disclosure according to %{public}@.", buf, 0x20u);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v5;
          *(_WORD *)&buf[22] = 2114;
          uint64_t v25 = v9;
          _os_log_impl(&dword_22107E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Music application %{public}@ does not require preflight for privacy disclosure according to %{public}@.", buf, 0x20u);
        }
      }
      else
      {
        uint64_t v9 = TLLogToneManagement();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[TKTonePickerViewController _isAllowedToPresentMediaPicker]();
        }
      }
    }
    else
    {
      uint64_t v9 = TLLogToneManagement();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2114;
        uint64_t v25 = v7;
        _os_log_error_impl(&dword_22107E000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve record %{public}@ for Music application with error: %{public}@.", buf, 0x20u);
      }
    }

    if (!self->_isAllowedToPresentMediaPicker)
    {
      long long v17 = TLLogToneManagement();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        [(TKTonePickerViewController *)(uint64_t)self _isAllowedToPresentMediaPicker];
      }
    }
    self->_isAllowedToPresentMediaPickerFlagLoaded = 1;
  }
  return self->_isAllowedToPresentMediaPicker;
}

- (void)setShowsMedia:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v27 = 0;
  uint64_t v5 = [(TKTonePickerController *)self->_tonePickerController _selectedIdentifier:&v27];
  if (!self->_showsMedia)
  {
    self->_showsMedia = v3;
    if (!v3) {
      goto LABEL_21;
    }
    int v7 = 0;
LABEL_7:
    int v8 = [(TKTonePickerViewController *)self _isAllowedToPresentMediaPicker];
    if (v7 == v8) {
      goto LABEL_21;
    }
    if (v8)
    {
      uint64_t v9 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
      mediaItems = self->_mediaItems;
      self->_mediaItems = v9;

      char v11 = (void *)CFPreferencesCopyAppValue(@"tonePickerMediaItemList", (CFStringRef)*MEMORY[0x263EFFE60]);
      if (v11)
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = self->_mediaItems;
              long long v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "unsignedLongLongValue", (void)v23));
              [(NSMutableArray *)v17 addObject:v18];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
          }
          while (v14);
        }

        CFRelease(v12);
      }
      id v19 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", (void)v23);
      [v19 addObserver:self selector:sel__handleMediaLibraryDidChangeNotification name:*MEMORY[0x263F11418] object:0];

      uint64_t v20 = [MEMORY[0x263F11E40] defaultMediaLibrary];
      [v20 beginGeneratingLibraryChangeNotifications];
      goto LABEL_20;
    }
LABEL_19:
    id v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 removeObserver:self name:*MEMORY[0x263F11418] object:0];

    uint64_t v22 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [v22 endGeneratingLibraryChangeNotifications];

    uint64_t v20 = self->_mediaItems;
    self->_mediaItems = 0;
LABEL_20:

    goto LABEL_21;
  }
  BOOL v6 = [(TKTonePickerViewController *)self _isAllowedToPresentMediaPicker];
  int v7 = v6;
  self->_showsMedia = v3;
  if (v3) {
    goto LABEL_7;
  }
  if (v6) {
    goto LABEL_19;
  }
LABEL_21:
  [(TKTonePickerViewController *)self _handleMediaLibraryDidChangeNotification];
  if (v5)
  {
    if (v27) {
      [(TKTonePickerViewController *)self setSelectedMediaIdentifier:v5];
    }
    else {
      [(TKTonePickerViewController *)self setSelectedToneIdentifier:v5];
    }
  }
}

- (BOOL)isMediaAtTop
{
  return [(TKTonePickerController *)self->_tonePickerController isMediaAtTop];
}

- (void)setMediaAtTop:(BOOL)a3
{
  BOOL v3 = a3;
  char v6 = 0;
  uint64_t v5 = [(TKTonePickerViewController *)self selectedIdentifier:&v6];
  [(TKTonePickerController *)self->_tonePickerController setMediaAtTop:v3];
  if (v5)
  {
    if (v6) {
      [(TKTonePickerViewController *)self setSelectedMediaIdentifier:v5];
    }
    else {
      [(TKTonePickerViewController *)self setSelectedToneIdentifier:v5];
    }
  }
}

- (id)selectedIdentifier:(BOOL *)a3
{
  return [(TKTonePickerController *)self->_tonePickerController _selectedIdentifier:a3];
}

- (NSNumber)selectedMediaIdentifier
{
  char v6 = 0;
  v2 = [(TKTonePickerViewController *)self selectedIdentifier:&v6];
  BOOL v3 = v2;
  if (v6) {
    id v4 = v2;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (void)setSelectedMediaIdentifier:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  if (self->_showsMedia
    && [(TKTonePickerViewController *)self _isAllowedToPresentMediaPicker])
  {
    if (v4)
    {
      uint64_t v5 = [(TKTonePickerController *)self->_tonePickerController _indexPathForToneWithIdentifier:v4];
      if (v5)
      {
        char v6 = (void *)v5;
        int v7 = 0;
        goto LABEL_25;
      }
    }
    int v8 = [(TKTonePickerViewController *)self _mediaItemForIdentifier:v4];
    uint64_t v9 = v8;
    if (v4) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    int v7 = !v10;
    if (v10)
    {
    }
    else
    {
      unint64_t v11 = [(TKTonePickerViewController *)self _addMediaIdentifierToList:v4];
      id v12 = (void *)MEMORY[0x263F088C8];
      uint64_t v13 = [(TKTonePickerController *)self->_tonePickerController _indexPathForMediaGroup];
      char v6 = objc_msgSend(v12, "indexPathForRow:inSection:", v11, objc_msgSend(v13, "section"));

      if (v6)
      {
        int v7 = 1;
        goto LABEL_25;
      }
    }
    int v14 = [(TKTonePickerController *)self->_tonePickerController showsDefault];
    tonePickerController = self->_tonePickerController;
    if (v14)
    {
      uint64_t v16 = [(TKTonePickerController *)tonePickerController _indexPathForDefaultGroup];
    }
    else
    {
      if (![(TKTonePickerController *)tonePickerController showsNone]
        || [(TKTonePickerController *)self->_tonePickerController isNoneAtTop])
      {
        char v6 = 0;
        goto LABEL_25;
      }
      uint64_t v16 = [(TKTonePickerController *)self->_tonePickerController _indexPathForNone];
    }
    char v6 = (void *)v16;
    if (v16)
    {
      uint64_t v17 = [(TKTonePickerController *)self->_tonePickerController _identifierOfToneAtIndexPath:v16];
      if (((v17 == 0) & ~v14) == 0)
      {
        long long v18 = (void *)v17;
        [(TKTonePickerViewController *)self _didSelectToneWithIdentifier:v17];

LABEL_41:
        goto LABEL_42;
      }
    }
LABEL_25:
    id v19 = [(TKTonePickerController *)self->_tonePickerController _selectedToneIndexPath];
    char v20 = [v19 isEqual:v6];

    if (v20) {
      goto LABEL_39;
    }
    [(TKTonePickerController *)self->_tonePickerController _setSelectedToneIndexPath:v6];
    char v32 = 0;
    if (v6)
    {
      id v21 = [(TKTonePickerController *)self->_tonePickerController _identifierAtIndexPath:v6 isMediaItem:&v32];
      if (v32)
      {
        id v22 = (id)v4;
        unint64_t v23 = v21;
        id v21 = (void *)v23;
        if (v4 | v23)
        {
          if (!v4 || !v23)
          {

LABEL_37:
            [(TKTonePickerViewController *)self _didSelectMediaItemWithIdentifier:v21];
            goto LABEL_38;
          }
          if ((id)v23 != v22)
          {
            char v24 = [v22 isEqualToNumber:v23];

            if (v24) {
              goto LABEL_38;
            }
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      id v21 = 0;
    }
LABEL_38:

LABEL_39:
    if (v7)
    {
      [(TKTonePickerController *)self->_tonePickerController _invalidatePickerItemCaches];
      long long v25 = [(TKTonePickerViewController *)self tableView];
      [v25 reloadData];
    }
    goto LABEL_41;
  }
LABEL_42:
  long long v26 = [(TKTonePickerViewController *)self selectedIdentifier:0];
  if (v26)
  {
    char v27 = [(TKTonePickerController *)self->_tonePickerController indexPathForSelectedTone];
    if (v27)
    {
      v28 = [(TKTonePickerViewController *)self tableView];
      uint64_t v29 = [v28 indexPathsForVisibleRows];
      char v30 = [v29 containsObject:v27];

      if ((v30 & 1) == 0)
      {
        v31 = [(TKTonePickerController *)self->_tonePickerController indexPathForSelectedTone];
        [v28 scrollToRowAtIndexPath:v31 atScrollPosition:2 animated:0];
      }
    }
  }
}

- (void)addMediaItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([(NSMutableArray *)self->_mediaItems indexOfObject:v9] == 0x7FFFFFFFFFFFFFFFLL) {
          [(TKTonePickerViewController *)self _addMediaIdentifierToList:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  CFStringRef v10 = (const __CFString *)*MEMORY[0x263EFFE60];
  CFPreferencesSetAppValue(@"tonePickerMediaItemList", self->_mediaItems, (CFStringRef)*MEMORY[0x263EFFE60]);
  CFPreferencesAppSynchronize(v10);
  [(TKTonePickerController *)self->_tonePickerController _invalidatePickerItemCaches];
  unint64_t v11 = [(TKTonePickerViewController *)self tableView];
  [v11 reloadData];
}

- (void)removeMediaItems:(id)a3
{
  [(NSMutableArray *)self->_mediaItems removeObjectsInArray:a3];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE60];
  CFPreferencesSetAppValue(@"tonePickerMediaItemList", self->_mediaItems, (CFStringRef)*MEMORY[0x263EFFE60]);
  CFPreferencesAppSynchronize(v4);
  [(TKTonePickerController *)self->_tonePickerController _invalidatePickerItemCaches];
  id v5 = [(TKTonePickerViewController *)self tableView];
  [v5 reloadData];
}

- (unint64_t)_addMediaIdentifierToList:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_mediaItems count] == 5) {
    [(NSMutableArray *)self->_mediaItems removeObjectAtIndex:0];
  }
  [(NSMutableArray *)self->_mediaItems addObject:v4];
  unint64_t v5 = [(NSMutableArray *)self->_mediaItems count] - 1;

  return v5;
}

- (id)_mediaItemForIdentifier:(id)a3
{
  BOOL v3 = [MEMORY[0x263F11E60] predicateWithValue:a3 forProperty:*MEMORY[0x263F11368]];
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v3, 0);
  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F11E68]) initWithFilterPredicates:v4];
  uint64_t v6 = [v5 items];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    int v8 = [v5 items];
    uint64_t v9 = [v8 objectAtIndex:0];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_didSelectMediaItemWithIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = [(TKTonePickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 tonePickerViewController:self selectedMediaItemWithIdentifier:v5];
  }
}

- (id)_musicPlayer
{
  musicPlayer = self->_musicPlayer;
  if (!musicPlayer)
  {
    id v4 = [MEMORY[0x263F120B0] applicationMusicPlayer];
    id v5 = self->_musicPlayer;
    self->_musicPlayer = v4;

    musicPlayer = self->_musicPlayer;
  }

  return musicPlayer;
}

- (void)_togglePlayMediaItemWithIdentifier:(id)a3
{
  if (self->_playingMediaItemIdentifier) {
    [(TKTonePickerController *)self->_tonePickerController stopPlayingWithFadeOut:0];
  }
  else {
    [(TKTonePickerViewController *)self _playMediaItemWithIdentifier:a3];
  }
}

- (void)_playMediaItemWithIdentifier:(id)a3
{
  id v5 = a3;
  [(TKTonePickerController *)self->_tonePickerController stopPlayingWithFadeOut:0];
  uint64_t v6 = [(TKTonePickerViewController *)self _mediaItemForIdentifier:v5];
  if (v6)
  {
    objc_storeStrong((id *)&self->_playingMediaItemIdentifier, a3);
    uint64_t v7 = (void *)MEMORY[0x263F11E18];
    int v8 = [MEMORY[0x263EFF8C0] arrayWithObject:v6];
    uint64_t v9 = [v7 collectionWithItems:v8];

    CFStringRef v10 = [(TKTonePickerViewController *)self _musicPlayer];
    [v10 setQueueWithItemCollection:v9];
    [v10 setRepeatMode:1];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__TKTonePickerViewController__playMediaItemWithIdentifier___block_invoke;
    v11[3] = &unk_264589B70;
    objc_copyWeak(&v13, &location);
    id v12 = v5;
    [v10 prepareToPlayWithCompletionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __59__TKTonePickerViewController__playMediaItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _didFinishPreparingToPlayMediaItemWithIdentifier:*(void *)(a1 + 32) error:v4];
}

- (void)_didFinishPreparingToPlayMediaItemWithIdentifier:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = TLLogPlayback();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "tl_nonRedundantDescription");
      long long v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      int v16 = 138543874;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v15;
      _os_log_error_impl(&dword_22107E000, v8, OS_LOG_TYPE_ERROR, "%{public}@: -_didFinishPreparingToPlayMediaItemWithIdentifier:(%{public}@): Failed to prepare to play media item with error: %{public}@", (uint8_t *)&v16, 0x20u);
    }
    goto LABEL_17;
  }
  unint64_t v9 = self->_playingMediaItemIdentifier;
  unint64_t v10 = (unint64_t)v6;
  unint64_t v11 = (void *)v10;
  if (!(v10 | v9)) {
    goto LABEL_11;
  }
  if (v10 && v9)
  {
    if (v9 != v10)
    {
      BOOL v12 = [(id)v9 isEqualToNumber:v10];

      if (!v12) {
        goto LABEL_14;
      }
LABEL_12:
      [(MPMusicPlayerController *)self->_musicPlayer play];
      goto LABEL_17;
    }
LABEL_11:

    goto LABEL_12;
  }

LABEL_14:
  id v13 = TLLogPlayback();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    playingMediaItemIdentifier = self->_playingMediaItemIdentifier;
    int v16 = 138543874;
    uint64_t v17 = self;
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 2114;
    id v21 = playingMediaItemIdentifier;
    _os_log_impl(&dword_22107E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didFinishPreparingToPlayMediaItemWithIdentifier:(%{public}@): Skipped calling -play on music player because mediaIdentifier doesn't match with _playingMediaItemIdentifier: %{public}@.", (uint8_t *)&v16, 0x20u);
  }

LABEL_17:
}

- (BOOL)_stopMediaItemPlaybackWithFadeOutDuration:(double)a3
{
  playingMediaItemIdentifier = self->_playingMediaItemIdentifier;
  if (!playingMediaItemIdentifier) {
    return 0;
  }
  self->_playingMediaItemIdentifier = 0;

  if ([(MPMusicPlayerController *)self->_musicPlayer playbackState] != MPMusicPlaybackStatePlaying) {
    return 0;
  }
  [(MPMusicPlayerController *)self->_musicPlayer pauseWithFadeoutDuration:a3];
  [(MPMusicPlayerController *)self->_musicPlayer stop];
  return 1;
}

- (void)mediaPickerDidCancel:(id)a3
{
  id v3 = [(TKTonePickerViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4
{
  id v5 = objc_msgSend(a4, "items", a3);
  id v16 = [v5 objectAtIndex:0];

  id v6 = [v16 valueForProperty:*MEMORY[0x263F11368]];
  id v7 = [(TKTonePickerViewController *)self tableView];
  if (v6)
  {
    int v8 = [(TKTonePickerController *)self->_tonePickerController _selectedToneIndexPath];
    unint64_t v9 = [v7 cellForRowAtIndexPath:v8];

    if (v9) {
      [v9 setAccessoryType:0];
    }
    uint64_t v10 = [(NSMutableArray *)self->_mediaItems indexOfObject:v6];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v10 = [(TKTonePickerViewController *)self _addMediaIdentifierToList:v6],
          CFStringRef v11 = (const __CFString *)*MEMORY[0x263EFFE60],
          CFPreferencesSetAppValue(@"tonePickerMediaItemList", self->_mediaItems, (CFStringRef)*MEMORY[0x263EFFE60]), CFPreferencesAppSynchronize(v11), v10 != 0x7FFFFFFFFFFFFFFFLL))
    {
      BOOL v12 = (void *)MEMORY[0x263F088C8];
      id v13 = [(TKTonePickerController *)self->_tonePickerController _indexPathForMediaGroup];
      long long v14 = objc_msgSend(v12, "indexPathForRow:inSection:", v10, objc_msgSend(v13, "section"));

      [(TKTonePickerController *)self->_tonePickerController _setSelectedToneIndexPath:v14];
    }
    [(TKTonePickerController *)self->_tonePickerController _invalidatePickerItemCaches];
    [v7 reloadData];
    [(TKTonePickerViewController *)self _didSelectMediaItemWithIdentifier:v6];
    [(TKTonePickerViewController *)self _playMediaItemWithIdentifier:v6];
  }
  long long v15 = [(TKTonePickerViewController *)self navigationController];
  [v15 dismissViewControllerAnimated:1 completion:0];
}

- (void)loadViewForTonePickerTableViewController:(id)a3
{
  id v4 = a3;
  id v5 = [TKTonePickerTableView alloc];
  id v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 bounds];
  id v7 = -[TKTonePickerTableView initWithFrame:style:](v5, "initWithFrame:style:", self->_tonePickerTableViewStyle);

  [(TKTonePickerTableView *)v7 setAutoresizingMask:18];
  [v4 setTableView:v7];
  -[TKTonePickerTableView setEditing:](v7, "setEditing:", [v4 isEditing]);
  [(TKTonePickerTableView *)v7 setLayoutMarginsObserver:v4];
  [(TKTonePickerTableView *)v7 setSeparatorObserver:v4];

  [(TKTonePickerViewController *)self _updateStyleOfTableView:v7 forStyleProvider:self->_styleProvider];
}

- (id)tableView:(id)a3 cellForPickerRowItem:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v6 bounds];
  double Width = CGRectGetWidth(v67);
  double v9 = *MEMORY[0x263F1D5F8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:@"_TKTonePickerDividerCellReuseIdentifier"];
    -[TKPickerDividerTableViewCell setFrame:](v10, "setFrame:", 0.0, 0.0, Width, v9);
    if (!v10)
    {
      uint64_t v10 = -[TKPickerDividerTableViewCell initWithFrame:]([TKPickerDividerTableViewCell alloc], "initWithFrame:", 0.0, 0.0, Width, v9);
      -[TKPickerDividerTableViewCell setContentBackdropOverlayBlendMode:](v10, "setContentBackdropOverlayBlendMode:", [v6 _separatorBackdropOverlayBlendMode]);
      CFStringRef v11 = [v6 separatorColor];
      [(TKPickerDividerTableViewCell *)v10 setContentBackgroundColor:v11];

      [(TKPickerDividerTableViewCell *)v10 setSelectionStyle:0];
      [(TKPickerDividerTableViewCell *)v10 setUserInteractionEnabled:0];
      styleProvider = self->_styleProvider;
      if (styleProvider)
      {
        id v13 = [(TKTonePickerStyleProvider *)styleProvider tonePickerCellBackgroundColor];
        [(TKPickerDividerTableViewCell *)v10 setBackgroundColor:v13];
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v7;
      int v15 = [v14 showsDisclosureIndicator];
      if (v15) {
        id v16 = @"_TKTonePickerCellWithDisclosureIndicatorReuseIdentifier";
      }
      else {
        id v16 = @"_TKTonePickerCellReuseIdentifier";
      }
      uint64_t v17 = [v14 itemKind];
      if (v17 == 3) {
        id v16 = @"_TKTonePickerCellWithSwitchReuseIdentifier";
      }
      int v56 = [v14 needsActivityIndicator];
      if (v56) {
        id v16 = @"_TKTonePickerCellWithActivityIndicatorReuseIdentifier";
      }
      int v18 = [v14 needsDownloadProgress];
      if (v18) {
        id v19 = @"_TKTonePickerCellWithDownloadProgressReuseIdentifier";
      }
      else {
        id v19 = v16;
      }
      uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:v19];
      -[TKPickerDividerTableViewCell setFrame:](v10, "setFrame:", 0.0, 0.0, Width, v9);
      if (!v10)
      {
        __int16 v20 = [[TKPickerTableViewCell alloc] initWithStyle:+[TKUIKitConstants defaultStyleForTableViewCellsWithDetailText] reuseIdentifier:v19];
        uint64_t v10 = (TKPickerDividerTableViewCell *)v20;
        if (v15)
        {
          [(TKPickerTableViewCell *)v20 setAccessoryType:1];
          [(TKPickerDividerTableViewCell *)v10 setEditingAccessoryType:1];
        }
        if (self->_styleProvider)
        {
          id v21 = [(TKPickerDividerTableViewCell *)v10 textLabel];
          uint64_t v22 = [(TKTonePickerStyleProvider *)self->_styleProvider tonePickerCellHighlightedTextColor];
          [v21 setHighlightedTextColor:v22];

          unint64_t v23 = [(TKTonePickerStyleProvider *)self->_styleProvider tonePickerCellBackgroundColor];
          [(TKPickerDividerTableViewCell *)v10 setBackgroundColor:v23];

          uint64_t v24 = [(TKTonePickerStyleProvider *)self->_styleProvider tonePickerCellTextFont];
          if (!v24)
          {
            uint64_t v24 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
          }
          v54 = (void *)v24;
          v55 = v21;
          [v21 setFont:v24];
          long long v25 = (void *)[(TKTonePickerStyleProvider *)self->_styleProvider newBackgroundViewForSelectedTonePickerCell:0];
          if (v25) {
            [(TKPickerDividerTableViewCell *)v10 setBackgroundView:v25];
          }
          long long v26 = (void *)[(TKTonePickerStyleProvider *)self->_styleProvider newBackgroundViewForSelectedTonePickerCell:1];
          if (v26) {
            [(TKPickerDividerTableViewCell *)v10 setSelectedBackgroundView:v26];
          }
          if (v15)
          {
            [(TKPickerDividerTableViewCell *)v10 setAccessoryType:1];
            [(TKPickerDividerTableViewCell *)v10 setEditingAccessoryType:1];
            uint64_t v27 = [(TKTonePickerStyleProvider *)self->_styleProvider newAccessoryDisclosureIndicatorViewForTonePickerCell];
            if (v27) {
              [(TKPickerDividerTableViewCell *)v10 setAccessoryView:v27];
            }
            v28 = (void *)[(TKTonePickerStyleProvider *)self->_styleProvider newAccessoryDisclosureIndicatorViewForTonePickerCell];
            if (v28) {
              [(TKPickerDividerTableViewCell *)v10 setEditingAccessoryView:v28];
            }
            [(TKTonePickerViewController *)self _configureTextColorOfLabelInCell:v10 shouldTintText:0 checked:0];
          }
        }
        if (v17 == 3)
        {
          id v29 = objc_alloc_init(MEMORY[0x263F1CA10]);
          [v29 addTarget:self action:sel__handleSwitchControlValueChanged_ forControlEvents:4096];
          [(TKPickerDividerTableViewCell *)v10 setAccessoryView:v29];
          switchControlsBeingObserved = self->_switchControlsBeingObserved;
          if (!switchControlsBeingObserved)
          {
            v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
            char v32 = self->_switchControlsBeingObserved;
            self->_switchControlsBeingObserved = v31;

            switchControlsBeingObserved = self->_switchControlsBeingObserved;
          }
          [(NSMutableArray *)switchControlsBeingObserved addObject:v29];
        }
        if (v56)
        {
          v33 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
          [(TKPickerDividerTableViewCell *)v10 setAccessoryView:v33];
        }
      }
      v34 = [(TKPickerDividerTableViewCell *)v10 textLabel];
      v35 = [v14 text];
      [v34 setText:v35];

      v36 = [(TKPickerDividerTableViewCell *)v10 detailTextLabel];
      v37 = [v14 detailText];
      [v36 setText:v37];

      -[TKTonePickerViewController updateCell:withCheckedStatus:forTonePickerItem:](self, "updateCell:withCheckedStatus:forTonePickerItem:", v10, [v14 showsCheckmark], v14);
      if (v17 == 3)
      {
        v38 = [(TKPickerDividerTableViewCell *)v10 accessoryView];
        objc_msgSend(v38, "setOn:", -[TKTonePickerController ignoreMute](self->_tonePickerController, "ignoreMute"));
      }
      v39 = &OBJC_IVAR___TKTonePickerViewController__tableViewCellLayoutManagerForUnindentedRows;
      if (![(TKTonePickerViewController *)self _shouldShowCheckmarkOnTrailingEdge]
        && [v14 needsRoomForCheckmark])
      {
        v39 = &OBJC_IVAR___TKTonePickerViewController__tableViewCellLayoutManagerForIndentedRows;
      }
      [(TKPickerDividerTableViewCell *)v10 setLayoutManager:*(Class *)((char *)&self->super.super.super.super.isa + *v39)];
      if (v56)
      {
        v40 = [(TKTonePickerStyleProvider *)self->_styleProvider tonePickerCellTextColor];
        v41 = [MEMORY[0x263F1C550] whiteColor];
        int v42 = [v40 isEqual:v41];

        if (v42)
        {
          v43 = [MEMORY[0x263F1C550] whiteColor];
        }
        else
        {
          v43 = 0;
        }
        v51 = [(TKPickerDividerTableViewCell *)v10 accessoryView];
        [v51 setColor:v43];
        [v51 startAnimating];
      }
      if (v18)
      {
        [v14 downloadProgress];
        -[TKTonePickerViewController _updateCell:withDownloadProgress:animated:](self, "_updateCell:withDownloadProgress:animated:", v10, 0);
      }
    }
    else
    {
      v44 = TLLogGeneral();
      BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);

      if (v45)
      {
        v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m"];
        v47 = TLLogGeneral();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = [v46 lastPathComponent];
          v49 = [MEMORY[0x263F08B88] callStackSymbols];
          *(_DWORD *)buf = 136381443;
          v58 = "-[TKTonePickerViewController tableView:cellForPickerRowItem:]";
          __int16 v59 = 2113;
          v60 = v48;
          __int16 v61 = 2049;
          uint64_t v62 = 1246;
          __int16 v63 = 2113;
          v64 = v49;
          _os_log_impl(&dword_22107E000, v47, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
        }
      }
      else
      {
        v46 = TLLogGeneral();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
        }
      }

      v50 = TLLogGeneral();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        -[TKTonePickerViewController tableView:cellForPickerRowItem:]();
      }

      uint64_t v10 = 0;
    }
  }

  return v10;
}

- (id)selectedTonePickerItem
{
  return [(TKTonePickerController *)self->_tonePickerController selectedTonePickerItem];
}

- (void)tableView:(id)a3 updateCell:(id)a4 withSeparatorForPickerRowItem:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    uint64_t v11 = [v10 classicToneIndex];
    BOOL v12 = [v10 parentItem];
  }
  else
  {
    uint64_t v11 = [v9 row];
    BOOL v12 = -[TKTonePickerController pickerItemForSection:](self->_tonePickerController, "pickerItemForSection:", [v9 section]);
  }
  double v13 = *MEMORY[0x263F1D600];
  uint64_t v14 = v11 + 1;
  if (v14 < [v12 numberOfChildren]
    && ([v12 childItemAtIndex:v14],
        int v15 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v16 = objc_opt_isKindOfClass(),
        v15,
        (v16 & 1) != 0))
  {
    [v8 _setShouldHaveFullLengthBottomSeparator:1];
    double v17 = v13;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v17 = v13;
    if (isKindOfClass)
    {
      int v19 = [v9 needsRoomForCheckmark];
      double v17 = v13;
      if (v19)
      {
        BOOL v20 = [(TKTonePickerViewController *)self _shouldShowCheckmarkOnTrailingEdge];
        double v17 = v13;
        if (!v20)
        {
          [(TKTonePickerViewController *)self _minimumTextIndentationForTableView:v22 withCheckmarkImage:self->_checkmarkImage];
          double v17 = v21;
        }
      }
    }
  }
  objc_msgSend(v8, "setSeparatorInset:", v13, v17, v13, v13);
}

- (void)updateCell:(id)a3 withCheckedStatus:(BOOL)a4 forTonePickerItem:(id)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  LODWORD(v10) = [v9 showsDisclosureIndicator];
  if ([(TKTonePickerViewController *)self _shouldShowCheckmarkOnTrailingEdge])
  {
    if (v10 & v6)
    {
      uint64_t v11 = TLLogGeneral();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

      if (v12)
      {
        double v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m"];
        uint64_t v14 = TLLogGeneral();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = [v13 lastPathComponent];
          char v16 = [MEMORY[0x263F08B88] callStackSymbols];
          int v22 = 136381443;
          unint64_t v23 = "-[TKTonePickerViewController updateCell:withCheckedStatus:forTonePickerItem:]";
          __int16 v24 = 2113;
          long long v25 = v15;
          __int16 v26 = 2049;
          uint64_t v27 = 1296;
          __int16 v28 = 2113;
          id v29 = v16;
          _os_log_impl(&dword_22107E000, v14, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v22, 0x2Au);
        }
      }
      else
      {
        double v13 = TLLogGeneral();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
        }
      }

      BOOL v20 = TLLogGeneral();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[TKTonePickerViewController updateCell:withCheckedStatus:forTonePickerItem:]((uint64_t)v9, v20);
      }
    }
    if (v6) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = v10;
    }
    [v8 setAccessoryType:v10];
    [v8 setEditingAccessoryType:v10];
    double v21 = [v8 imageView];
    [v21 setImage:0];
  }
  else
  {
    double v17 = [v8 imageView];
    int v18 = v17;
    if (v6) {
      checkmarkImage = self->_checkmarkImage;
    }
    else {
      checkmarkImage = 0;
    }
    [v17 setImage:checkmarkImage];

    if ((v10 & 1) == 0)
    {
      [v8 setAccessoryType:0];
      [v8 setEditingAccessoryType:0];
    }
  }
  -[TKTonePickerViewController _configureTextColorOfLabelInCell:shouldTintText:checked:](self, "_configureTextColorOfLabelInCell:shouldTintText:checked:", v8, [v9 shouldTintText], v6);
}

- (void)updateCell:(id)a3 withDetailText:(id)a4
{
  id v5 = a4;
  id v6 = [a3 detailTextLabel];
  [v6 setText:v5];
}

- (void)updateDividerContentColorToMatchSeparatorColorInTableView:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 separatorColor];
  id v6 = [v4 indexPathsForVisibleRows];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([(TKTonePickerController *)self->_tonePickerController _isDividerAtIndexPath:v11])
        {
          BOOL v12 = [v4 cellForRowAtIndexPath:v11];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v12 setContentBackgroundColor:v5];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 forPickerRowItem:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || [(TKTonePickerController *)self->_tonePickerController didSelectTonePickerItem:v7])
  {
    uint64_t v8 = [v9 indexPathForSelectedRow];
    [v9 deselectRowAtIndexPath:v8 animated:1];
  }
}

- (void)tonePickerTableViewWillDisappear:(BOOL)a3
{
}

- (void)tonePickerTableViewControllerWillBeDeallocated:(id)a3
{
  id v4 = a3;
  if ([v4 isViewLoaded])
  {
    id v3 = [v4 tableView];
    [v3 setLayoutMarginsObserver:0];
    [v3 setSeparatorObserver:0];
  }
}

- (void)layoutMarginsDidChangeInTonePickerTableView:(id)a3
{
  id v4 = a3;
  [(TKTonePickerViewController *)self _updateMinimumTextIndentation];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__TKTonePickerViewController_layoutMarginsDidChangeInTonePickerTableView___block_invoke;
  v6[3] = &unk_264589980;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 performBlockEnsuringContentOffsetRemainsUnchanged:v6];
}

void __74__TKTonePickerViewController_layoutMarginsDidChangeInTonePickerTableView___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) indexPathsForVisibleRows];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = [*(id *)(a1 + 32) cellForRowAtIndexPath:v7];
        uint64_t v10 = *(void *)(a1 + 32);
        id v9 = *(void **)(a1 + 40);
        uint64_t v11 = [v9 _pickerRowItemForIndexPath:v7];
        [v9 tableView:v10 updateCell:v8 withSeparatorForPickerRowItem:v11];

        [v8 setNeedsLayout];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TKTonePickerViewController *)self _pickerRowItemForIndexPath:v7];
  if (!v8)
  {
    id v9 = TLLogGeneral();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m"];
      long long v12 = TLLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = [v11 lastPathComponent];
        long long v14 = [MEMORY[0x263F08B88] callStackSymbols];
        int v25 = 136381443;
        __int16 v26 = (TKTonePickerViewController *)"-[TKTonePickerViewController tableView:cellForRowAtIndexPath:]";
        __int16 v27 = 2113;
        id v28 = v13;
        __int16 v29 = 2049;
        uint64_t v30 = 1398;
        __int16 v31 = 2113;
        char v32 = v14;
        _os_log_impl(&dword_22107E000, v12, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v25, 0x2Au);
      }
    }
    else
    {
      uint64_t v11 = TLLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
      }
    }

    long long v15 = TLLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[TKTonePickerViewController tableView:cellForRowAtIndexPath:]();
    }
  }
  long long v16 = [(TKTonePickerViewController *)self tableView:v6 cellForPickerRowItem:v8];
  if (!v16)
  {
    uint64_t v17 = TLLogGeneral();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

    if (v18)
    {
      int v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m"];
      BOOL v20 = TLLogGeneral();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        double v21 = [v19 lastPathComponent];
        int v22 = [MEMORY[0x263F08B88] callStackSymbols];
        int v25 = 136381443;
        __int16 v26 = (TKTonePickerViewController *)"-[TKTonePickerViewController tableView:cellForRowAtIndexPath:]";
        __int16 v27 = 2113;
        id v28 = v21;
        __int16 v29 = 2049;
        uint64_t v30 = 1400;
        __int16 v31 = 2113;
        char v32 = v22;
        _os_log_impl(&dword_22107E000, v20, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v25, 0x2Au);
      }
    }
    else
    {
      int v19 = TLLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
      }
    }

    unint64_t v23 = TLLogGeneral();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138543874;
      __int16 v26 = self;
      __int16 v27 = 2114;
      id v28 = v7;
      __int16 v29 = 2114;
      uint64_t v30 = (uint64_t)v8;
      _os_log_error_impl(&dword_22107E000, v23, OS_LOG_TYPE_ERROR, "%{public}@ is about to return a nil cell for row at index path %{public}@ with pickerRowItem = %{public}@.", (uint8_t *)&v25, 0x20u);
    }
  }

  return v16;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(TKTonePickerController *)self->_tonePickerController numberOfSections];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(TKTonePickerController *)self->_tonePickerController pickerItemForSection:a4];
  int64_t v5 = [v4 numberOfChildren];

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  int64_t v5 = [(TKTonePickerViewController *)self _pickerRowItemForIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v6 = [(TKTonePickerController *)self->_tonePickerController canDeleteTonePickerItem:v5];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v7 = [(TKTonePickerViewController *)self _pickerRowItemForIndexPath:a5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(TKTonePickerController *)self->_tonePickerController deleteTonePickerItem:v7];
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TKTonePickerViewController *)self _pickerRowItemForIndexPath:v6];
  [(TKTonePickerViewController *)self tableView:v7 didSelectRowAtIndexPath:v6 forPickerRowItem:v8];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  double v7 = 2.0;
  if (![(TKTonePickerController *)self->_tonePickerController _isDividerAtIndexPath:a4])
  {
    [v6 rowHeight];
    double v7 = v8;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if ([(TKTonePickerStyleProvider *)self->_styleProvider wantsCustomTonePickerHeaderView])
  {
    id v6 = [(TKTonePickerViewController *)self _customHeaderViewForHeaderInSection:a4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(TKTonePickerStyleProvider *)self->_styleProvider wantsCustomTonePickerHeaderView])
  {
    id v6 = 0;
  }
  else
  {
    double v7 = [(TKTonePickerController *)self->_tonePickerController pickerItemForSection:a4];
    id v6 = [v7 text];
  }

  return v6;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(TKTonePickerStyleProvider *)self->_styleProvider wantsCustomTonePickerHeaderView])
  {
    double v7 = [(TKTonePickerViewController *)self tableView:v6 viewForHeaderInSection:a4];
    double v8 = v7;
    if (v7)
    {
      [v7 sizeToFit];
      [v8 frame];
      double Height = CGRectGetHeight(v11);
    }
    else if (a4)
    {
      double Height = 0.0;
    }
    else
    {
      double Height = *MEMORY[0x263F1D600];
    }
  }
  else
  {
    double Height = *MEMORY[0x263F1D600];
  }

  return Height;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4 = [(TKTonePickerController *)self->_tonePickerController pickerItemForSection:a4];
  uint64_t v5 = [v4 footerText];

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(TKTonePickerViewController *)self _pickerRowItemForIndexPath:a5];
  [(TKTonePickerViewController *)self tableView:v9 willDisplayCell:v8 forPickerRowItem:v10];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = [(TKTonePickerViewController *)self _pickerRowItemForIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = [v4 shouldPreventSelection] ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)tonePickerControllerDidReloadTones:(id)a3
{
  [(NSMutableDictionary *)self->_toneSectionHeaderViews removeObjectForKey:@"TKTonePickerSectionHeaderRegularToneGroup"];
  [(TKTonePickerViewController *)self _reloadData];
  toneClassicsTableViewController = self->_toneClassicsTableViewController;

  [(TKToneClassicsTableViewController *)toneClassicsTableViewController didReloadTones];
}

- (void)tonePickerController:(id)a3 requestsPerformingBatchUpdates:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(TKTonePickerViewController *)self tableView];
  [v9 performBatchUpdates:v8 completion:v7];
}

- (void)tonePickerController:(id)a3 didDeletePickerRowItems:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        CGRect v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v12 = TLLogGeneral();
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

          if (v13)
          {
            long long v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m"];
            long long v15 = TLLogGeneral();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = [v14 lastPathComponent];
              uint64_t v17 = [MEMORY[0x263F08B88] callStackSymbols];
              *(_DWORD *)buf = 136381443;
              uint64_t v30 = "-[TKTonePickerViewController tonePickerController:didDeletePickerRowItems:]";
              __int16 v31 = 2113;
              char v32 = v16;
              __int16 v33 = 2049;
              uint64_t v34 = 1532;
              __int16 v35 = 2113;
              v36 = v17;
              _os_log_impl(&dword_22107E000, v15, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
            }
          }
          else
          {
            long long v14 = TLLogGeneral();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[TKTonePickerViewController tonePickerController:didDeletePickerRowItems:](&v23, v24);
            }
          }

          BOOL v18 = TLLogGeneral();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[TKTonePickerViewController tonePickerController:didDeletePickerRowItems:](&v21, v22);
          }
        }
        else
        {
          BOOL v18 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v11, "row"), objc_msgSend(v11, "section"));
          [v5 addObject:v18];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v8);
  }

  int v19 = [(TKTonePickerViewController *)self tableView];
  [v19 deleteRowsAtIndexPaths:v5 withRowAnimation:100];
}

- (void)tonePickerController:(id)a3 didDeleteTonePickerSectionItems:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F089C8]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11++), "section", (void)v13));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  long long v12 = [(TKTonePickerViewController *)self tableView];
  [v12 deleteSections:v6 withRowAnimation:100];
}

- (void)tonePickerController:(id)a3 didInsertPickerRowItems:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v12 = TLLogGeneral();
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

          if (v13)
          {
            long long v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m"];
            long long v15 = TLLogGeneral();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = [v14 lastPathComponent];
              uint64_t v17 = [MEMORY[0x263F08B88] callStackSymbols];
              *(_DWORD *)buf = 136381443;
              uint64_t v30 = "-[TKTonePickerViewController tonePickerController:didInsertPickerRowItems:]";
              __int16 v31 = 2113;
              char v32 = v16;
              __int16 v33 = 2049;
              uint64_t v34 = 1553;
              __int16 v35 = 2113;
              v36 = v17;
              _os_log_impl(&dword_22107E000, v15, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
            }
          }
          else
          {
            long long v14 = TLLogGeneral();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[TKTonePickerViewController tonePickerController:didDeletePickerRowItems:](&v23, v24);
            }
          }

          uint64_t v18 = TLLogGeneral();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[TKTonePickerViewController tonePickerController:didDeletePickerRowItems:](&v21, v22);
          }
        }
        else
        {
          uint64_t v18 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v11, "row"), objc_msgSend(v11, "section"));
          [v5 addObject:v18];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v8);
  }

  int v19 = [(TKTonePickerViewController *)self tableView];
  [v19 insertRowsAtIndexPaths:v5 withRowAnimation:100];
}

- (void)tonePickerController:(id)a3 didInsertTonePickerSectionItems:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F089C8]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11++), "section", (void)v13));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  long long v12 = [(TKTonePickerViewController *)self tableView];
  [v12 insertSections:v6 withRowAnimation:100];
}

- (void)tonePickerController:(id)a3 didUpdateHeaderTextOfTonePickerSectionItems:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F089C8]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11++), "section", (void)v13));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  long long v12 = [(TKTonePickerViewController *)self tableView];
  [v12 _reloadSectionHeaderFooters:v6 withRowAnimation:100];
}

- (void)tonePickerController:(id)a3 didUpdateCheckedStatus:(BOOL)a4 ofTonePickerItem:(id)a5
{
  BOOL v5 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TKToneClassicsTableViewController *)self->_toneClassicsTableViewController didUpdateCheckedStatus:v5 ofToneClassicsPickerItem:v10];
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v10, "row"), objc_msgSend(v10, "section"));
    uint64_t v8 = [(TKTonePickerViewController *)self tableView];
    uint64_t v9 = [v8 cellForRowAtIndexPath:v7];

    [(TKTonePickerViewController *)self updateCell:v9 withCheckedStatus:v5 forTonePickerItem:v10];
  }
}

- (void)tonePickerController:(id)a3 didUpdateDownloadProgressOfTonePickerItem:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = TLLogGeneral();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m"];
      uint64_t v9 = TLLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v8 lastPathComponent];
        uint64_t v11 = [MEMORY[0x263F08B88] callStackSymbols];
        int v16 = 136381443;
        uint64_t v17 = "-[TKTonePickerViewController tonePickerController:didUpdateDownloadProgressOfTonePickerItem:]";
        __int16 v18 = 2113;
        int v19 = v10;
        __int16 v20 = 2049;
        uint64_t v21 = 1595;
        __int16 v22 = 2113;
        char v23 = v11;
        _os_log_impl(&dword_22107E000, v9, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v16, 0x2Au);
      }
    }
    else
    {
      uint64_t v8 = TLLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
      }
    }

    long long v15 = TLLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_1();
    }
  }
  else
  {
    long long v12 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v5, "row"), objc_msgSend(v5, "section"));
    long long v13 = [(TKTonePickerViewController *)self tableView];
    long long v14 = [v13 cellForRowAtIndexPath:v12];

    [v5 downloadProgress];
    -[TKTonePickerViewController _updateCell:withDownloadProgress:animated:](self, "_updateCell:withDownloadProgress:animated:", v14, 1);
  }
}

- (void)tonePickerController:(id)a3 didUpdateTonePickerItem:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = TLLogGeneral();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/Embedded/TKTonePickerViewController.m"];
      uint64_t v9 = TLLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v8 lastPathComponent];
        uint64_t v11 = [MEMORY[0x263F08B88] callStackSymbols];
        *(_DWORD *)buf = 136381443;
        uint64_t v17 = "-[TKTonePickerViewController tonePickerController:didUpdateTonePickerItem:]";
        __int16 v18 = 2113;
        int v19 = v10;
        __int16 v20 = 2049;
        uint64_t v21 = 1605;
        __int16 v22 = 2113;
        char v23 = v11;
        _os_log_impl(&dword_22107E000, v9, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v8 = TLLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]();
      }
    }

    long long v12 = TLLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_1();
    }
  }
  else
  {
    long long v12 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v5, "row"), objc_msgSend(v5, "section"));
    long long v13 = [(TKTonePickerViewController *)self tableView];
    long long v15 = v12;
    long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    [v13 reloadRowsAtIndexPaths:v14 withRowAnimation:100];
  }
}

- (void)tonePickerController:(id)a3 didUpdateDetailText:(id)a4 ofTonePickerItem:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TKToneClassicsTableViewController *)self->_toneClassicsTableViewController didUpdateDetailText:v11 ofToneClassicsPickerItem:v7];
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section"));
    uint64_t v9 = [(TKTonePickerViewController *)self tableView];
    id v10 = [v9 cellForRowAtIndexPath:v8];

    [(TKTonePickerViewController *)self updateCell:v10 withDetailText:v11];
  }
}

- (void)tonePickerController:(id)a3 selectedToneWithIdentifier:(id)a4
{
}

- (void)tonePickerController:(id)a3 selectedMediaItemWithIdentifier:(id)a4
{
}

- (BOOL)tonePickerControllerShouldShowMedia:(id)a3
{
  return self->_showsMedia
      && [(TKTonePickerViewController *)self _isAllowedToPresentMediaPicker];
}

- (void)tonePickerControllerRequestsMediaItemsRefresh:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_showsMedia
    && [(TKTonePickerViewController *)self _isAllowedToPresentMediaPicker])
  {
    char v22 = 0;
    id v5 = [v4 _selectedToneIndexPath];

    if (v5)
    {
      id v6 = [v4 _selectedToneIndexPath];
      uint64_t v17 = [v4 _identifierAtIndexPath:v6 isMediaItem:&v22];
    }
    else
    {
      uint64_t v17 = 0;
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = self->_mediaItems;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          long long v14 = [(TKTonePickerViewController *)self _mediaItemForIdentifier:v13];
          if (!v14) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }

    [(NSMutableArray *)self->_mediaItems removeObjectsInArray:v7];
    if (v22 && v17) {
      [(TKTonePickerViewController *)self setSelectedMediaIdentifier:v17];
    }
    mediaItems = self->_mediaItems;
    CFStringRef v16 = (const __CFString *)*MEMORY[0x263EFFE60];
    CFPreferencesSetAppValue(@"tonePickerMediaItemList", mediaItems, (CFStringRef)*MEMORY[0x263EFFE60]);
    CFPreferencesAppSynchronize(v16);
  }
}

- (unint64_t)numberOfMediaItemsInTonePickerController:(id)a3
{
  return [(NSMutableArray *)self->_mediaItems count];
}

- (id)tonePickerController:(id)a3 identifierOfMediaItemAtIndex:(unint64_t)a4
{
  return (id)[(NSMutableArray *)self->_mediaItems objectAtIndex:a4];
}

- (id)tonePickerController:(id)a3 titleOfMediaItemAtIndex:(unint64_t)a4
{
  id v5 = [(NSMutableArray *)self->_mediaItems objectAtIndex:a4];
  id v6 = [(TKTonePickerViewController *)self _mediaItemForIdentifier:v5];

  id v7 = [v6 valueForProperty:*MEMORY[0x263F11400]];

  return v7;
}

- (unint64_t)tonePickerController:(id)a3 indexOfMediaItemWithIdentifier:(id)a4
{
  return [(NSMutableArray *)self->_mediaItems indexOfObject:a4];
}

- (void)tonePickerController:(id)a3 didSelectMediaItemAtIndex:(unint64_t)a4 selectionDidChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(NSMutableArray *)self->_mediaItems objectAtIndex:a4];
  if (v5) {
    [(TKTonePickerViewController *)self _playMediaItemWithIdentifier:v7];
  }
  else {
    [(TKTonePickerViewController *)self _togglePlayMediaItemWithIdentifier:v7];
  }
}

- (void)tonePickerControllerRequestsPresentingMediaItemPicker:(id)a3
{
  id v8 = a3;
  mediaPickerController = self->_mediaPickerController;
  if (!mediaPickerController)
  {
    BOOL v5 = (MPMediaPickerController *)[objc_alloc(MEMORY[0x263F11E48]) initWithMediaTypes:2049];
    id v6 = self->_mediaPickerController;
    self->_mediaPickerController = v5;

    [(MPMediaPickerController *)self->_mediaPickerController setDelegate:self];
    [(MPMediaPickerController *)self->_mediaPickerController setAllowsPickingMultipleItems:0];
    [(MPMediaPickerController *)self->_mediaPickerController setModalPresentationStyle:3];
    mediaPickerController = self->_mediaPickerController;
  }
  if (([(MPMediaPickerController *)mediaPickerController isBeingPresented] & 1) == 0)
  {
    id v7 = [(TKTonePickerViewController *)self navigationController];
    [v7 presentViewController:self->_mediaPickerController animated:1 completion:0];
  }
}

- (void)tonePickerController:(id)a3 willBeginPlaybackOfToneWithIdentifier:(id)a4
{
}

- (void)tonePickerController:(id)a3 didUpdateIgnoreMute:(BOOL)a4 forTonePickerItem:(id)a5 atIndexPath:(id)a6
{
  BOOL v6 = a4;
  id v11 = a6;
  if (self->_isHandlingSwitchControlValueChanged)
  {
    id v8 = [(TKTonePickerViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 tonePickerViewController:self didChangeIgnoreMute:v6];
    }
  }
  else
  {
    uint64_t v9 = [(TKTonePickerViewController *)self tableView];
    id v8 = [v9 cellForRowAtIndexPath:v11];

    if (v8)
    {
      uint64_t v10 = [v8 accessoryView];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v10 setOn:v6];
      }
    }
  }
}

- (void)tonePickerController:(id)a3 requestsPresentingToneClassicsPickerForItem:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ((unint64_t)([v5 itemKind] - 1) <= 1)
  {
    BOOL v6 = [[TKToneClassicsTableViewController alloc] initWithClassicTonesHeaderItem:v5];
    toneClassicsTableViewController = self->_toneClassicsTableViewController;
    self->_toneClassicsTableViewController = v6;

    [(TKToneClassicsTableViewController *)self->_toneClassicsTableViewController setTonePickerTableViewControllerHelper:self];
    id v8 = TLLogToneManagement();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = self->_toneClassicsTableViewController;
      int v14 = 138543874;
      long long v15 = self;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      __int16 v18 = 2082;
      long long v19 = "-[TKTonePickerViewController tonePickerController:requestsPresentingToneClassicsPickerForItem:]";
      _os_log_impl(&dword_22107E000, v8, OS_LOG_TYPE_DEFAULT, "Assigning %{public}@ as tonePickerTableViewControllerHelper of %{public}@ in %{public}s.", (uint8_t *)&v14, 0x20u);
    }

    uint64_t v10 = [(TKToneClassicsTableViewController *)self->_toneClassicsTableViewController tableView];
    id v11 = [(TKTonePickerViewController *)self tableView];
    long long v12 = [v11 backgroundColor];
    [v10 setBackgroundColor:v12];

    [v11 _sectionContentInset];
    objc_msgSend(v10, "_setSectionContentInset:");
    uint64_t v13 = [(TKTonePickerViewController *)self navigationController];
    [v13 _setClipUnderlapWhileTransitioning:1];
    [v13 pushViewController:self->_toneClassicsTableViewController animated:1];
  }
}

- (void)tonePickerControllerRequestsPresentingVibrationPicker:(id)a3
{
  id v4 = a3;
  id v5 = -[TKVibrationPickerViewController _initWithAlertType:tableViewStyle:]([TKVibrationPickerViewController alloc], "_initWithAlertType:tableViewStyle:", [v4 alertType], self->_tonePickerTableViewStyle);
  vibrationPickerViewController = self->_vibrationPickerViewController;
  self->_vibrationPickerViewController = v5;

  id v7 = self->_vibrationPickerViewController;
  id v8 = [v4 topic];
  [(TKVibrationPickerViewController *)v7 setTopic:v8];

  uint64_t v9 = self->_vibrationPickerViewController;
  uint64_t v10 = [v4 selectedVibrationIdentifier];
  [(TKVibrationPickerViewController *)v9 setSelectedVibrationIdentifier:v10];

  id v11 = self->_vibrationPickerViewController;
  long long v12 = [v4 selectedToneIdentifier];

  [(TKVibrationPickerViewController *)v11 setCorrespondingToneIdentifier:v12];
  [(TKVibrationPickerViewController *)self->_vibrationPickerViewController _setAdditionalDelegate:self];
  [(TKVibrationPickerViewController *)self->_vibrationPickerViewController _setDismissalDelegate:self];
  id v31 = [(TKTonePickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v31 tonePickerViewController:self willPresentVibrationPickerViewController:self->_vibrationPickerViewController];
  }
  uint64_t v13 = [(TKTonePickerViewController *)self tableView];
  [v13 _sectionContentInset];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  char v22 = [(TKVibrationPickerViewController *)self->_vibrationPickerViewController tableView];
  [v22 _sectionContentInset];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  if (!TKFloatEqualToFloat(v29, v17)
    || !TKFloatEqualToFloat(v24, v15)
    || !TKFloatEqualToFloat(v28, v21)
    || !TKFloatEqualToFloat(v26, v19))
  {
    objc_msgSend(v22, "_setSectionContentInset:", v15, v17, v19, v21);
  }
  uint64_t v30 = [(TKTonePickerViewController *)self navigationController];
  [v30 pushViewController:self->_vibrationPickerViewController animated:1];
}

- (void)tonePickerController:(id)a3 requestsPresentingAlertWithTitle:(id)a4 message:(id)a5
{
  id v9 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:a4 message:a5 preferredStyle:1];
  BOOL v6 = (void *)MEMORY[0x263F1C3F0];
  id v7 = TLLocalizedString();
  id v8 = [v6 actionWithTitle:v7 style:1 handler:0];
  [v9 addAction:v8];

  [(TKTonePickerViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4
{
}

- (void)vibrationPickerViewControllerWasDismissed:(id)a3
{
  id v5 = a3;
  id v4 = [(TKTonePickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 tonePickerViewController:self didDismissVibrationPickerViewController:v5];
  }
  [v5 _setDismissalDelegate:0];
  [v5 _setAdditionalDelegate:0];
}

- (BOOL)showsToneStore
{
  return self->_showsToneStore;
}

- (TKTonePickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TKTonePickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsIgnoreMute
{
  return self->_showsIgnoreMute;
}

- (BOOL)showsMedia
{
  return self->_showsMedia;
}

- (TKTonePickerStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_switchControlsBeingObserved, 0);
  objc_storeStrong((id *)&self->_vibrationPickerViewController, 0);
  objc_storeStrong((id *)&self->_toneClassicsTableViewController, 0);
  objc_storeStrong((id *)&self->_playingMediaItemIdentifier, 0);
  objc_storeStrong((id *)&self->_musicPlayer, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_mediaPickerController, 0);
  objc_storeStrong((id *)&self->_toneSectionHeaderViews, 0);
  objc_storeStrong((id *)&self->_storeBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tableViewCellLayoutManagerForUnindentedRows, 0);
  objc_storeStrong((id *)&self->_tableViewCellLayoutManagerForIndentedRows, 0);
  objc_storeStrong((id *)&self->_checkmarkImage, 0);

  objc_storeStrong((id *)&self->_tonePickerController, 0);
}

- (BOOL)showsStoreButtonInNavigationBar
{
  return 0;
}

- (void)_isAllowedToPresentMediaPicker
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22107E000, v0, v1, "%{public}@: State for Music application %{public}@ is invalid.");
}

- (void)tableView:cellForPickerRowItem:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22107E000, v0, v1, "%{public}@ doesn't support this kind of picker row item: %{public}@.");
}

- (void)updateCell:(uint64_t)a1 withCheckedStatus:(NSObject *)a2 forTonePickerItem:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22107E000, a2, OS_LOG_TYPE_ERROR, "Unexpected. Can't have both a disclosure indicator and a checkmark on the trailing edge. Problematic item: %{public}@.", (uint8_t *)&v2, 0xCu);
}

- (void)tableView:cellForRowAtIndexPath:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22107E000, v0, v1, "%{public}@ unexpectedly found a nil pickerRowItem while generating cell for row at index path %{public}@.");
}

- (void)tonePickerController:(unsigned char *)a1 didDeletePickerRowItems:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_22107E000, v2, (uint64_t)v2, "Unexpected.", v3);
}

- (void)tonePickerController:(unsigned char *)a1 didDeletePickerRowItems:(unsigned char *)a2 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_22107E000, v2, (uint64_t)v2, "*** Assertion failure.", v3);
}

@end