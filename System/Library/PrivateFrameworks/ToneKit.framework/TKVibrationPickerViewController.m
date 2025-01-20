@interface TKVibrationPickerViewController
- ($96EE1C12479E9B303E9C2794B92A11A2)_cellAccessoriesDescriptorForRowAtIndexPath:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_showsOnlyEditableSections;
- (BOOL)allowsDeletingDefaultVibration;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)canEnterEditingMode;
- (BOOL)showsDefault;
- (BOOL)showsEditButtonInNavigationBar;
- (BOOL)showsNone;
- (BOOL)showsNothingSelected;
- (BOOL)showsUserGenerated;
- (NSString)correspondingToneIdentifier;
- (NSString)defaultVibrationIdentifier;
- (NSString)noneString;
- (NSString)selectedVibrationIdentifier;
- (NSString)topic;
- (TKVibrationPickerStyleProvider)styleProvider;
- (TKVibrationPickerViewController)initWithAlertType:(int64_t)a3;
- (TKVibrationPickerViewController)initWithStyle:(int64_t)a3;
- (TKVibrationPickerViewControllerDelegate)_additionalDelegate;
- (TKVibrationPickerViewControllerDelegate)delegate;
- (TKVibrationPickerViewControllerDismissalDelegate)_dismissalDelegate;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_adjustedNameForVibrationWithDesiredName:(id)a3 vibrationIdentifier:(id)a4;
- (id)_customHeaderViewForHeaderInSection:(int64_t)a3;
- (id)_identifierOfVibrationAtIndexPath:(id)a3;
- (id)_indexPathForVibrationWithIdentifier:(id)a3;
- (id)_initWithAlertType:(int64_t)a3 tableViewStyle:(int64_t)a4;
- (id)_localizationIdentifierForHeaderInSection:(int64_t)a3;
- (id)_navigationItem;
- (id)_sanitizeVibrationIdentifierForPlayback:(id)a3;
- (id)_sanitizedCorrespondingToneIdentifier;
- (id)_sanitizedDefaultVibrationIdentifier;
- (id)_selectedVibrationIndexPath;
- (id)_sortedArrayWithVibrationIdentifiers:(id)a3 allowsDuplicateVibrationNames:(BOOL)a4;
- (id)_sortedUserGeneratedVibrationIdentifiers;
- (id)_sortedVibrationIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_numberOfRowsInVibrationPickerSection:(int64_t)a3;
- (int64_t)_sectionForDefaultGroup;
- (int64_t)_sectionForNoneGroup;
- (int64_t)_sectionForSynchronizedGroup;
- (int64_t)_sectionForSystemGroup;
- (int64_t)_sectionForUserGeneratedGroup;
- (int64_t)alertType;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_handleUserGeneratedVibrationsDidChangeNotification;
- (void)_presentVibrationRecorderViewController;
- (void)_processCurrentVibrationSelection;
- (void)_setAdditionalDelegate:(id)a3;
- (void)_setDismissalDelegate:(id)a3;
- (void)_startVibratingWithVibrationIdentifier:(id)a3;
- (void)_stopVibrating;
- (void)_updateCheckedStateOfAllVisibleCells;
- (void)_updateEditButtonItem;
- (void)_updateEditButtonItemWithAnimation:(BOOL)a3;
- (void)_updateSectionVisibilityFlagToValue:(BOOL)a3 usingBlock:(id)a4 sectionIndexGetter:(id)a5;
- (void)_updateSelectionStyleForCell:(id)a3 indexPath:(id)a4;
- (void)_updateStyleOfTableView:(id)a3 forStyleProvider:(id)a4;
- (void)_updateVisibilityOfSynchronizedGroup;
- (void)dealloc;
- (void)setAllowsDeletingDefaultVibration:(BOOL)a3;
- (void)setCorrespondingToneIdentifier:(id)a3;
- (void)setDefaultVibrationIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNoneString:(id)a3;
- (void)setSelectedVibrationIdentifier:(id)a3;
- (void)setShowsDefault:(BOOL)a3;
- (void)setShowsEditButtonInNavigationBar:(BOOL)a3;
- (void)setShowsNone:(BOOL)a3;
- (void)setShowsNothingSelected:(BOOL)a3;
- (void)setShowsUserGenerated:(BOOL)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTopic:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)vibrationPickerTableViewCell:(id)a3 endedEditingWithText:(id)a4;
- (void)vibrationRecorderViewController:(id)a3 didFinishRecordingVibrationPattern:(id)a4 name:(id)a5;
- (void)vibrationRecorderViewControllerWasDismissedWithoutSavingRecordedVibrationPattern:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TKVibrationPickerViewController

- (TKVibrationPickerViewController)initWithStyle:(int64_t)a3
{
  return [(TKVibrationPickerViewController *)self initWithAlertType:1];
}

- (TKVibrationPickerViewController)initWithAlertType:(int64_t)a3
{
  return (TKVibrationPickerViewController *)[(TKVibrationPickerViewController *)self _initWithAlertType:a3 tableViewStyle:1];
}

- (id)_initWithAlertType:(int64_t)a3 tableViewStyle:(int64_t)a4
{
  v17.receiver = self;
  v17.super_class = (Class)TKVibrationPickerViewController;
  v5 = [(TKVibrationPickerViewController *)&v17 initWithStyle:a4];
  if (v5)
  {
    v6 = (TLVibrationManager *)objc_alloc_init(MEMORY[0x263F7FCA0]);
    vibrationManager = v5->_vibrationManager;
    v5->_vibrationManager = v6;

    v8 = objc_alloc_init(TKVibratorController);
    vibratorController = v5->_vibratorController;
    v5->_vibratorController = v8;

    v5->_alertType = a3;
    v5->_showsDefault = 0;
    v10 = [MEMORY[0x263F7FC80] sharedCapabilitiesManager];
    v5->_showsUserGenerated = [v10 hasUserGeneratedVibrationsCapability];

    v5->_showsNone = 1;
    v11 = [(TLVibrationManager *)v5->_vibrationManager currentVibrationIdentifierForAlertType:a3];
    uint64_t v12 = [v11 copy];
    defaultVibrationIdentifier = v5->_defaultVibrationIdentifier;
    v5->_defaultVibrationIdentifier = (NSString *)v12;

    v14 = TLLocalizedString();
    [(TKVibrationPickerViewController *)v5 setTitle:v14];

    if (v5->_showsUserGenerated)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_TKVibrationPickerViewControllerHandleUserGeneratedVibrationsDidChangeNotification, (CFStringRef)*MEMORY[0x263F7FD80], 0, (CFNotificationSuspensionBehavior)1026);
    }
  }
  return v5;
}

- (void)dealloc
{
  if (self->_showsUserGenerated)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F7FD80], 0);
  }
  [(TKVibrationPickerViewController *)self _stopVibrating];
  v4.receiver = self;
  v4.super_class = (Class)TKVibrationPickerViewController;
  [(TKVibrationPickerViewController *)&v4 dealloc];
}

- (void)setTopic:(id)a3
{
  id v4 = a3;
  uint64_t topic = (uint64_t)self->_topic;
  if ((id)topic != v4)
  {
    v8 = v4;
    uint64_t topic = [(id)topic isEqualToString:v4];
    id v4 = v8;
    if ((topic & 1) == 0)
    {
      v6 = (NSString *)[v8 copy];
      v7 = self->_topic;
      self->_uint64_t topic = v6;

      if (!self->_defaultVibrationIdentifierWasExplicitlySet) {
        [(TKVibrationPickerViewController *)self setDefaultVibrationIdentifier:0];
      }
      uint64_t topic = [(TKVibrationPickerViewController *)self _updateVisibilityOfSynchronizedGroup];
      id v4 = v8;
    }
  }

  MEMORY[0x270F9A758](topic, v4);
}

- (void)setShowsDefault:(BOOL)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  if (self->_showsDefault != a3)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __51__TKVibrationPickerViewController_setShowsDefault___block_invoke;
    v16 = &unk_2645898E0;
    objc_super v17 = self;
    BOOL v18 = a3;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __51__TKVibrationPickerViewController_setShowsDefault___block_invoke_2;
    v11 = &unk_264589C28;
    uint64_t v12 = self;
    -[TKVibrationPickerViewController _updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:](self, "_updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:");
    if ([(TKVibrationPickerViewController *)self isViewLoaded])
    {
      id v4 = [(TKVibrationPickerViewController *)self _sanitizedDefaultVibrationIdentifier];
      v5 = [(TKVibrationPickerViewController *)self _indexPathForVibrationWithIdentifier:v4];

      if (v5)
      {
        v6 = [(TKVibrationPickerViewController *)self tableView];
        v19[0] = v5;
        v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
        [v6 reloadRowsAtIndexPaths:v7 withRowAnimation:5];
      }
    }
  }
}

uint64_t __51__TKVibrationPickerViewController_setShowsDefault___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1032) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __51__TKVibrationPickerViewController_setShowsDefault___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sectionForDefaultGroup];
}

- (void)setDefaultVibrationIdentifier:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [v20 length];
  v5 = (NSString *)v20;
  if (!v4)
  {
    vibrationManager = self->_vibrationManager;
    int64_t v7 = [(TKVibrationPickerViewController *)self alertType];
    uint64_t v8 = [(TKVibrationPickerViewController *)self topic];
    v5 = [(TLVibrationManager *)vibrationManager currentVibrationIdentifierForAlertType:v7 topic:v8];
  }
  uint64_t v9 = self->_defaultVibrationIdentifier;
  v10 = v9;
  if (v9 != v5 && ![(NSString *)v9 isEqualToString:v5])
  {
    v11 = (NSString *)[(NSString *)v5 copy];
    defaultVibrationIdentifier = self->_defaultVibrationIdentifier;
    self->_defaultVibrationIdentifier = v11;

    self->_defaultVibrationIdentifierWasExplicitlySet = v4 != 0;
    if ([(TKVibrationPickerViewController *)self isViewLoaded])
    {
      int64_t v13 = [(TKVibrationPickerViewController *)self _sectionForDefaultGroup];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v14 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:v13];
      }
      v15 = (void *)MEMORY[0x263EFF8C0];
      v16 = [(TKVibrationPickerViewController *)self _indexPathForVibrationWithIdentifier:v5];
      objc_super v17 = [(TKVibrationPickerViewController *)self _indexPathForVibrationWithIdentifier:v10];
      BOOL v18 = objc_msgSend(v15, "arrayWithObjects:", v16, v17, v14, 0);

      v19 = [(TKVibrationPickerViewController *)self tableView];
      [v19 reloadRowsAtIndexPaths:v18 withRowAnimation:5];
    }
  }
}

- (void)setCorrespondingToneIdentifier:(id)a3
{
  v5 = (NSString *)a3;
  correspondingToneIdentifier = self->_correspondingToneIdentifier;
  int64_t v7 = v5;
  if (correspondingToneIdentifier != v5
    && ![(NSString *)correspondingToneIdentifier isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_correspondingToneIdentifier, a3);
  }
  [(TKVibrationPickerViewController *)self _updateVisibilityOfSynchronizedGroup];
}

- (void)setShowsUserGenerated:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x263F7FC80] sharedCapabilitiesManager];
    int v5 = [v4 hasUserGeneratedVibrationsCapability];

    if (self->_showsUserGenerated == v5) {
      return;
    }
    if (v5) {
      goto LABEL_8;
    }
  }
  else if (!self->_showsUserGenerated)
  {
    return;
  }
  if ([(TKVibrationPickerViewController *)self isEditing]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Hiding the user generated section of the vibration picker while in editing mode is invalid."];
  }
LABEL_8:
  -[TKVibrationPickerViewController _updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:](self, "_updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:");
  sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
  self->_sortedUserGeneratedVibrationIdentifiers = 0;

  [(TKVibrationPickerViewController *)self canEnterEditingMode];
}

uint64_t __57__TKVibrationPickerViewController_setShowsUserGenerated___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1033) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __57__TKVibrationPickerViewController_setShowsUserGenerated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sectionForUserGeneratedGroup];
}

- (void)setShowsNone:(BOOL)a3
{
  if (self->_showsNone != a3) {
    -[TKVibrationPickerViewController _updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:](self, "_updateSectionVisibilityFlagToValue:usingBlock:sectionIndexGetter:");
  }
}

uint64_t __48__TKVibrationPickerViewController_setShowsNone___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1034) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __48__TKVibrationPickerViewController_setShowsNone___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sectionForNoneGroup];
}

- (void)setNoneString:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  noneString = self->_noneString;
  int64_t v13 = v4;
  if (noneString != v4 && ![(NSString *)noneString isEqualToString:v4])
  {
    v6 = (NSString *)[(NSString *)v13 copy];
    int64_t v7 = self->_noneString;
    self->_noneString = v6;
  }
  if ([(TKVibrationPickerViewController *)self isViewLoaded])
  {
    int64_t v8 = [(TKVibrationPickerViewController *)self _sectionForNoneGroup];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:v8];
      v10 = [(TKVibrationPickerViewController *)self tableView];
      v11 = [v10 cellForRowAtIndexPath:v9];

      if (v11)
      {
        if (v13)
        {
          objc_msgSend(v11, "setLabelText:");
        }
        else
        {
          uint64_t v12 = [(TLVibrationManager *)self->_vibrationManager noneVibrationName];
          [v11 setLabelText:v12];
        }
      }
    }
  }
}

- (void)setShowsNothingSelected:(BOOL)a3
{
  if (self->_showsNothingSelected != a3)
  {
    self->_showsNothingSelected = a3;
    [(TKVibrationPickerViewController *)self _updateCheckedStateOfAllVisibleCells];
  }
}

- (void)setShowsEditButtonInNavigationBar:(BOOL)a3
{
  if (self->_showsEditButtonInNavigationBar != a3)
  {
    self->_showsEditButtonInNavigationBar = a3;
    [(TKVibrationPickerViewController *)self _updateEditButtonItem];
  }
}

- (BOOL)canEnterEditingMode
{
  id v3 = [(TKVibrationPickerViewController *)self _sortedUserGeneratedVibrationIdentifiers];
  return self->_canEnterEditingMode;
}

- (void)setSelectedVibrationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t selectedVibrationIdentifier = (uint64_t)self->_selectedVibrationIdentifier;
  if ((id)selectedVibrationIdentifier != v4)
  {
    int64_t v8 = v4;
    uint64_t selectedVibrationIdentifier = [(id)selectedVibrationIdentifier isEqualToString:v4];
    id v4 = v8;
    if ((selectedVibrationIdentifier & 1) == 0)
    {
      v6 = (NSString *)[v8 copy];
      int64_t v7 = self->_selectedVibrationIdentifier;
      self->_uint64_t selectedVibrationIdentifier = v6;

      uint64_t selectedVibrationIdentifier = [(TKVibrationPickerViewController *)self _updateCheckedStateOfAllVisibleCells];
      id v4 = v8;
    }
  }

  MEMORY[0x270F9A758](selectedVibrationIdentifier, v4);
}

- (void)setStyleProvider:(id)a3
{
  int v5 = (TKVibrationPickerStyleProvider *)a3;
  if (self->_styleProvider != v5)
  {
    int64_t v7 = v5;
    objc_storeStrong((id *)&self->_styleProvider, a3);
    if ([(TKVibrationPickerViewController *)self isViewLoaded])
    {
      v6 = [(TKVibrationPickerViewController *)self tableView];
      [(TKVibrationPickerViewController *)self _updateStyleOfTableView:v6 forStyleProvider:v7];
      [v6 reloadData];
    }
  }

  MEMORY[0x270F9A790]();
}

- (void)_updateStyleOfTableView:(id)a3 forStyleProvider:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  v6 = v5;
  if (!v5) {
    goto LABEL_14;
  }
  if ([v5 vibrationPickerUsesOpaqueBackground])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_7;
    }
    int64_t v7 = [v6 vibrationPickerCustomBackgroundColor];
    [v10 setBackgroundView:0];
  }
  else
  {
    [v10 setBackgroundView:0];
    int64_t v7 = [MEMORY[0x263F1C550] clearColor];
  }
  [v10 setBackgroundColor:v7];

LABEL_7:
  objc_msgSend(v10, "setSeparatorStyle:", objc_msgSend(v6, "vibrationPickerTableViewSeparatorStyle"));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = UIBackdropViewOverlayBlendModeFromTKBackdropViewOverlayBlendMode([v6 vibrationPickerCustomTableSeparatorBackdropOverlayBlendMode]);
    if (v8) {
      [v10 _setSeparatorBackdropOverlayBlendMode:v8];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v6 vibrationPickerCustomTableSeparatorColor];
    if (v9) {
      [v10 setSeparatorColor:v9];
    }
  }
LABEL_14:
}

- (BOOL)_showsOnlyEditableSections
{
  if (self->_swipeToDeleteMode) {
    return 0;
  }
  else {
    return [(TKVibrationPickerViewController *)self isEditing];
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)TKVibrationPickerViewController;
  [(TKVibrationPickerViewController *)&v4 viewDidLoad];
  id v3 = [(TKVibrationPickerViewController *)self tableView];
  [(TKVibrationPickerViewController *)self _updateStyleOfTableView:v3 forStyleProvider:self->_styleProvider];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TKVibrationPickerViewController;
  [(TKVibrationPickerViewController *)&v8 viewWillAppear:a3];
  objc_super v4 = [(TKVibrationPickerViewController *)self tableView];
  if (v4)
  {
    id v5 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [v5 lineHeight];
    [v4 setEstimatedRowHeight:ceil(v6 + v6)];

    [v4 setRowHeight:*MEMORY[0x263F1D600]];
  }
  if ([(TKVibrationPickerViewController *)self showsEditButtonInNavigationBar])
  {
    [(TKVibrationPickerViewController *)self _updateEditButtonItemWithAnimation:0];
    if (self->_viewHasAppearedAtLeastOnce) {
      goto LABEL_10;
    }
    [(TKVibrationPickerViewController *)self canEnterEditingMode];
  }
  else if (self->_viewHasAppearedAtLeastOnce)
  {
    goto LABEL_10;
  }
  [v4 setAllowsSelectionDuringEditing:1];
  int64_t v7 = [(TKVibrationPickerViewController *)self _selectedVibrationIndexPath];
  if (v7) {
    [v4 scrollToRowAtIndexPath:v7 atScrollPosition:2 animated:0];
  }

LABEL_10:
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TKVibrationPickerViewController;
  [(TKVibrationPickerViewController *)&v4 viewDidAppear:a3];
  if (!self->_viewHasAppearedAtLeastOnce) {
    self->_viewHasAppearedAtLeastOnce = 1;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(TKVibrationPickerViewController *)self _stopVibrating];
  sortedVibrationIdentifiers = self->_sortedVibrationIdentifiers;
  self->_sortedVibrationIdentifiers = 0;

  sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
  self->_sortedUserGeneratedVibrationIdentifiers = 0;

  sectionHeaderViews = self->_sectionHeaderViews;
  self->_sectionHeaderViews = 0;

  v8.receiver = self;
  v8.super_class = (Class)TKVibrationPickerViewController;
  [(TKVibrationPickerViewController *)&v8 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = self;
  v7.receiver = v4;
  v7.super_class = (Class)TKVibrationPickerViewController;
  [(TKVibrationPickerViewController *)&v7 viewDidDisappear:v3];
  id v5 = [(TKVibrationPickerViewController *)v4 presentedViewController];

  if (!v5)
  {
    double v6 = [(TKVibrationPickerViewController *)v4 _dismissalDelegate];
    if (objc_opt_respondsToSelector()) {
      [v6 vibrationPickerViewControllerWasDismissed:v4];
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)_cellAccessoriesDescriptorForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 row];
  if ([(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup] == v5
    && v6 == [(TKVibrationPickerViewController *)self _numberOfRowsInVibrationPickerSection:v5]- 1)
  {
    __int16 v7 = 0;
    __int16 v8 = 256;
  }
  else
  {
    if (self->_showsNothingSelected)
    {
      __int16 v7 = 0;
    }
    else
    {
      uint64_t v9 = [(TKVibrationPickerViewController *)self _selectedVibrationIndexPath];
      __int16 v7 = [v9 isEqual:v4];
    }
    __int16 v8 = 0;
  }

  return ($96EE1C12479E9B303E9C2794B92A11A2)(v8 | v7);
}

- (id)_sanitizedCorrespondingToneIdentifier
{
  BOOL v3 = self->_correspondingToneIdentifier;
  if (![(NSString *)v3 length])
  {
    id v4 = [MEMORY[0x263F7FC90] sharedToneManager];
    int64_t v5 = [(TKVibrationPickerViewController *)self alertType];
    uint64_t v6 = [(TKVibrationPickerViewController *)self topic];
    uint64_t v7 = [v4 currentToneIdentifierForAlertType:v5 topic:v6];

    BOOL v3 = (NSString *)v7;
  }

  return v3;
}

- (id)_sanitizedDefaultVibrationIdentifier
{
  vibrationManager = self->_vibrationManager;
  defaultVibrationIdentifier = self->_defaultVibrationIdentifier;
  int64_t v5 = [(TKVibrationPickerViewController *)self alertType];
  uint64_t v6 = [(TKVibrationPickerViewController *)self topic];
  uint64_t v7 = [(TLVibrationManager *)vibrationManager _sanitizeVibrationIdentifier:defaultVibrationIdentifier forAlertType:v5 topic:v6 targetDevice:0 correspondingToneIdentifier:self->_correspondingToneIdentifier didFallbackToCurrentVibrationIdentifier:0];

  return v7;
}

- (id)_sanitizeVibrationIdentifierForPlayback:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(TKVibrationPickerViewController *)self _sanitizedDefaultVibrationIdentifier];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)_selectedVibrationIndexPath
{
  return [(TKVibrationPickerViewController *)self _indexPathForVibrationWithIdentifier:self->_selectedVibrationIdentifier];
}

- (id)_sortedArrayWithVibrationIdentifiers:(id)a3 allowsDuplicateVibrationNames:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        int64_t v13 = [(TLVibrationManager *)self->_vibrationManager nameOfVibrationWithIdentifier:v12];
        if (v13)
        {
          if (v4)
          {
            id v14 = [v7 objectForKey:v13];
            if (!v14)
            {
              id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
              [v7 setObject:v14 forKey:v13];
            }
            [v14 addObject:v12];
          }
          else
          {
            [v7 setObject:v12 forKey:v13];
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v9);
  }

  v15 = [v7 allKeys];
  v16 = [v15 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v30 = v16;
  uint64_t v18 = [v30 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v30);
        }
        v22 = [v7 objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * j)];
        v23 = v22;
        if (v4)
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v33;
            do
            {
              for (uint64_t k = 0; k != v25; ++k)
              {
                if (*(void *)v33 != v26) {
                  objc_enumerationMutation(v23);
                }
                [v17 addObject:*(void *)(*((void *)&v32 + 1) + 8 * k)];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
            }
            while (v25);
          }
        }
        else
        {
          [v17 addObject:v22];
        }
      }
      uint64_t v19 = [v30 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v19);
  }

  v28 = (void *)[v17 copy];

  return v28;
}

- (id)_sortedVibrationIdentifiers
{
  sortedVibrationIdentifiers = self->_sortedVibrationIdentifiers;
  if (!sortedVibrationIdentifiers)
  {
    BOOL v4 = [(TLVibrationManager *)self->_vibrationManager allUserSelectableSystemVibrationIdentifiers];
    id v5 = [(TKVibrationPickerViewController *)self _sortedArrayWithVibrationIdentifiers:v4 allowsDuplicateVibrationNames:0];
    id v6 = self->_sortedVibrationIdentifiers;
    self->_sortedVibrationIdentifiers = v5;

    sortedVibrationIdentifiers = self->_sortedVibrationIdentifiers;
  }

  return sortedVibrationIdentifiers;
}

- (id)_sortedUserGeneratedVibrationIdentifiers
{
  sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
  if (!sortedUserGeneratedVibrationIdentifiers)
  {
    BOOL v4 = [(TLVibrationManager *)self->_vibrationManager allUserGeneratedVibrationIdentifiers];
    id v5 = [(TKVibrationPickerViewController *)self _sortedArrayWithVibrationIdentifiers:v4 allowsDuplicateVibrationNames:1];
    id v6 = self->_sortedUserGeneratedVibrationIdentifiers;
    self->_sortedUserGeneratedVibrationIdentifiers = v5;

    if ([(NSArray *)self->_sortedUserGeneratedVibrationIdentifiers count]) {
      BOOL v7 = [(TKVibrationPickerViewController *)self showsUserGenerated];
    }
    else {
      BOOL v7 = 0;
    }
    if (self->_canEnterEditingMode != v7)
    {
      uint64_t v8 = NSStringFromSelector(sel_canEnterEditingMode);
      [(TKVibrationPickerViewController *)self willChangeValueForKey:v8];
      self->_canEnterEditingMode = v7;
      [(TKVibrationPickerViewController *)self didChangeValueForKey:v8];
      if ([(TKVibrationPickerViewController *)self showsEditButtonInNavigationBar]) {
        [(TKVibrationPickerViewController *)self _updateEditButtonItem];
      }
      if (!v7 && [(TKVibrationPickerViewController *)self isEditing]) {
        [(TKVibrationPickerViewController *)self setEditing:0 animated:self->_viewHasAppearedAtLeastOnce];
      }
    }
    sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
  }

  return sortedUserGeneratedVibrationIdentifiers;
}

- (id)_identifierOfVibrationAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || (uint64_t v6 = [v4 section],
        uint64_t v7 = [v5 row],
        [(TKVibrationPickerViewController *)self _sectionForDefaultGroup] == v6)
    && !v7)
  {
    uint64_t v8 = 0;
    goto LABEL_25;
  }
  if ([(TKVibrationPickerViewController *)self _sectionForSynchronizedGroup] == v6
    && !v7)
  {
    uint64_t v8 = self->_synchronizedVibrationIdentifier;
    if (self->_showsDefault
      || (-[TKVibrationPickerViewController _sanitizedDefaultVibrationIdentifier](self, "_sanitizedDefaultVibrationIdentifier"), uint64_t v9 = objc_claimAutoreleasedReturnValue(), v10 = [v9 isEqualToString:v8], v9, (v10 & 1) == 0))
    {
      v11 = v8;
      uint64_t v8 = v11;
LABEL_10:
      uint64_t v12 = v11;
LABEL_24:

      uint64_t v8 = v12;
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  if ([(TKVibrationPickerViewController *)self _sectionForSystemGroup] == v6)
  {
    uint64_t v8 = [(TKVibrationPickerViewController *)self _sortedVibrationIdentifiers];
    if (v7 < [(NSString *)v8 count])
    {
      uint64_t v12 = [(NSString *)v8 objectAtIndex:v7];
      if (self->_showsDefault) {
        goto LABEL_24;
      }
      int64_t v13 = [(TKVibrationPickerViewController *)self _sanitizedDefaultVibrationIdentifier];
      int v14 = [v13 isEqualToString:v12];

      if (!v14) {
        goto LABEL_24;
      }
    }
    goto LABEL_23;
  }
  if ([(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup] == v6)
  {
    uint64_t v8 = [(TKVibrationPickerViewController *)self _sortedUserGeneratedVibrationIdentifiers];
    if (v7 < [(NSString *)v8 count])
    {
      v11 = [(NSString *)v8 objectAtIndex:v7];
      goto LABEL_10;
    }
LABEL_23:
    uint64_t v12 = 0;
    goto LABEL_24;
  }
  uint64_t v8 = 0;
  if ([(TKVibrationPickerViewController *)self _sectionForNoneGroup] == v6 && !v7)
  {
    uint64_t v8 = (NSString *)(id)*MEMORY[0x263F7FD78];
    if (!self->_showsDefault)
    {
      v15 = [(TKVibrationPickerViewController *)self _sanitizedDefaultVibrationIdentifier];
      int v16 = [v15 isEqualToString:v8];

      if (v16) {
        goto LABEL_23;
      }
    }
  }
LABEL_25:

  return v8;
}

- (id)_indexPathForVibrationWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && ([(TLVibrationManager *)self->_vibrationManager vibrationWithIdentifierIsValid:v4] & 1) != 0)
  {
LABEL_5:
    uint64_t v7 = v4;
    vibrationManager = self->_vibrationManager;
    int64_t v9 = [(TKVibrationPickerViewController *)self alertType];
    char v10 = [(TKVibrationPickerViewController *)self topic];
    id v4 = [(TLVibrationManager *)vibrationManager _sanitizeVibrationIdentifier:v7 forAlertType:v9 topic:v10 targetDevice:0 correspondingToneIdentifier:self->_correspondingToneIdentifier didFallbackToCurrentVibrationIdentifier:0];

    int64_t v11 = [(TKVibrationPickerViewController *)self _sectionForSynchronizedGroup];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v12 = v11;
      if ([v4 isEqualToString:self->_synchronizedVibrationIdentifier])
      {
        int64_t v13 = (void *)MEMORY[0x263F088C8];
        uint64_t v14 = 0;
LABEL_18:
        int64_t v15 = v12;
        goto LABEL_19;
      }
    }
    if ([v4 isEqualToString:*MEMORY[0x263F7FD78]])
    {
      int64_t v5 = [(TKVibrationPickerViewController *)self _sectionForNoneGroup];
      if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_10;
      }
    }
    else
    {
      int64_t v16 = [(TKVibrationPickerViewController *)self _sectionForSystemGroup];
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v12 = v16;
        id v17 = [(TKVibrationPickerViewController *)self _sortedVibrationIdentifiers];
        uint64_t v18 = [v17 indexOfObject:v4];

        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v13 = (void *)MEMORY[0x263F088C8];
          uint64_t v14 = v18;
          goto LABEL_18;
        }
      }
      int64_t v19 = [(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup];
      if (v19 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int64_t v12 = v19;
        uint64_t v20 = [(TKVibrationPickerViewController *)self _sortedUserGeneratedVibrationIdentifiers];
        uint64_t v21 = [v20 indexOfObject:v4];

        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v13 = (void *)MEMORY[0x263F088C8];
          uint64_t v14 = v21;
          goto LABEL_18;
        }
      }
    }
    v22 = 0;
    goto LABEL_20;
  }
  int64_t v5 = [(TKVibrationPickerViewController *)self _sectionForDefaultGroup];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [(TKVibrationPickerViewController *)self _sanitizedDefaultVibrationIdentifier];

    id v4 = (id)v6;
    goto LABEL_5;
  }
LABEL_10:
  int64_t v15 = v5;
  int64_t v13 = (void *)MEMORY[0x263F088C8];
  uint64_t v14 = 0;
LABEL_19:
  v22 = [v13 indexPathForRow:v14 inSection:v15];
LABEL_20:

  return v22;
}

- (void)_processCurrentVibrationSelection
{
  int64_t v5 = self->_selectedVibrationIdentifier;
  BOOL v3 = [(TKVibrationPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 vibrationPickerViewController:self selectedVibrationWithIdentifier:v5];
  }
  id v4 = [(TKVibrationPickerViewController *)self _additionalDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 vibrationPickerViewController:self selectedVibrationWithIdentifier:v5];
  }
}

- (id)_navigationItem
{
  if ([(TKVibrationPickerViewController *)self isViewLoaded])
  {
    BOOL v3 = [(TKVibrationPickerViewController *)self view];
    id v4 = [v3 superview];

    if (v4)
    {
      int64_t v5 = [(TKVibrationPickerViewController *)self parentViewController];
      uint64_t v6 = [v5 view];

      if (v4 == v6)
      {
        uint64_t v7 = [v5 navigationItem];

        if (v7) {
          goto LABEL_7;
        }
      }
      else
      {
      }
    }
  }
  uint64_t v7 = [(TKVibrationPickerViewController *)self navigationItem];
LABEL_7:

  return v7;
}

- (void)_updateEditButtonItem
{
  if ([(TKVibrationPickerViewController *)self isViewLoaded]) {
    BOOL viewHasAppearedAtLeastOnce = self->_viewHasAppearedAtLeastOnce;
  }
  else {
    BOOL viewHasAppearedAtLeastOnce = 0;
  }

  [(TKVibrationPickerViewController *)self _updateEditButtonItemWithAnimation:viewHasAppearedAtLeastOnce];
}

- (void)_updateEditButtonItemWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(TKVibrationPickerViewController *)self _navigationItem];
  if (v5)
  {
    id v7 = v5;
    if ([(TKVibrationPickerViewController *)self canEnterEditingMode]
      && [(TKVibrationPickerViewController *)self showsEditButtonInNavigationBar]
      && [(TKVibrationPickerViewController *)self showsUserGenerated])
    {
      uint64_t v6 = [(TKVibrationPickerViewController *)self editButtonItem];
    }
    else
    {
      uint64_t v6 = 0;
    }
    [v7 setRightBarButtonItem:v6 animated:v3];

    int64_t v5 = v7;
  }
}

- (void)_updateSelectionStyleForCell:(id)a3 indexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v12)
  {
    if ([(TKVibrationPickerViewController *)self isEditing])
    {
      if ([(TKVibrationPickerViewController *)self isViewLoaded])
      {
        id v7 = [(TKVibrationPickerViewController *)self tableView];
        uint64_t v8 = v7;
        v11 = (v6 || ([v7 indexPathForCell:v12], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
           && (uint64_t v9 = [v6 section],
               uint64_t v10 = [v6 row],
               [(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup] == v9)
           && v10 == [(TKVibrationPickerViewController *)self tableView:v8 numberOfRowsInSection:v9]- 1;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 1;
    }
    [v12 setSelectionStyle:v11];
  }
}

- (id)_adjustedNameForVibrationWithDesiredName:(id)a3 vibrationIdentifier:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v9 = [v6 stringByTrimmingCharactersInSet:v8];

  if (![v9 length])
  {
    uint64_t v10 = TLLocalizedString();

    uint64_t v9 = (void *)v10;
  }
  BOOL v11 = [(TKVibrationPickerViewController *)self _sortedUserGeneratedVibrationIdentifiers];
  uint64_t v12 = [v11 count];
  if (v12)
  {
    __base = malloc_type_malloc(8 * v12, 0x100004000313F17uLL);
    if (__base)
    {
      int64_t v13 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
      long long v41 = [v13 invertedSet];

      long long v42 = [NSString stringWithFormat:@"%@ ", v9];
      uint64_t v40 = [v42 length];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        long long v35 = v11;
        id v36 = v6;
        uint64_t v17 = 0;
        size_t __nel = 0;
        id v39 = v14;
        uint64_t v18 = *(void *)v44;
        int64_t v19 = &OBJC_IVAR___TKVibrationRecorderContentViewController__vibratorController;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v44 != v18) {
              objc_enumerationMutation(v14);
            }
            uint64_t v21 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            if (![v7 length] || (objc_msgSend(v21, "isEqualToString:", v7) & 1) == 0)
            {
              v22 = [*(id *)((char *)&self->super.super.super.super.isa + v19[51]) nameOfVibrationWithIdentifier:v21];
              v23 = v22;
              if (v22)
              {
                if ([v22 isEqualToString:v9])
                {
                  uint64_t v17 = 1;
                }
                else if ([v23 hasPrefix:v42])
                {
                  uint64_t v24 = self;
                  uint64_t v25 = v19;
                  uint64_t v26 = v9;
                  uint64_t v27 = v17;
                  v28 = objc_msgSend(v23, "stringByReplacingCharactersInRange:withString:", 0, v40, &stru_26D2E1860);
                  if ([v28 rangeOfCharacterFromSet:v41] == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    uint64_t v29 = [v28 integerValue];
                    if (v29 >= 2) {
                      __base[__nel++] = v29;
                    }
                  }

                  uint64_t v17 = v27;
                  uint64_t v9 = v26;
                  int64_t v19 = v25;
                  self = v24;
                  id v14 = v39;
                }
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v16);

        id v6 = v36;
        if ((v17 & 1) == 0)
        {
          BOOL v11 = v35;
LABEL_34:
          free(__base);

          goto LABEL_35;
        }
        if (__nel)
        {
          qsort_b(__base, __nel, 8uLL, &__block_literal_global_1);
          uint64_t v30 = 0;
          uint64_t v31 = __nel + 2;
          BOOL v11 = v35;
          unint64_t v32 = 0x263F08000uLL;
          while (v30 + 2 == __base[v30])
          {
            if (__nel == ++v30) {
              goto LABEL_32;
            }
          }
          uint64_t v31 = v30 + 2;
        }
        else
        {
          uint64_t v31 = 2;
          BOOL v11 = v35;
          unint64_t v32 = 0x263F08000;
        }
LABEL_32:
        objc_msgSend(*(id *)(v32 + 2880), "localizedStringWithFormat:", @" %ld", v31);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = [v9 stringByAppendingString:v14];

        uint64_t v9 = (void *)v33;
      }

      goto LABEL_34;
    }
  }
LABEL_35:

  return v9;
}

uint64_t __96__TKVibrationPickerViewController__adjustedNameForVibrationWithDesiredName_vibrationIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    unsigned int v3 = -1;
  }
  else {
    unsigned int v3 = 1;
  }
  if (*a2 == *a3) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)_handleUserGeneratedVibrationsDidChangeNotification
{
  if (self->_skipNextUserGeneratedVibrationsDidChangeNotification)
  {
    self->_skipNextUserGeneratedVibrationsDidChangeNotification = 0;
  }
  else
  {
    int64_t v3 = [(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup];
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v4 = v3;
      sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
      self->_sortedUserGeneratedVibrationIdentifiers = 0;

      if ([(TKVibrationPickerViewController *)self isViewLoaded])
      {
        id v6 = [(TKVibrationPickerViewController *)self tableView];
        id v7 = [MEMORY[0x263F088D0] indexSetWithIndex:v4];
        [v6 reloadSections:v7 withRowAnimation:100];

        [(TKVibrationPickerViewController *)self _updateCheckedStateOfAllVisibleCells];
      }
    }
  }
}

- (void)_updateSectionVisibilityFlagToValue:(BOOL)a3 usingBlock:(id)a4 sectionIndexGetter:(id)a5
{
  uint64_t v8 = (void (**)(void))a4;
  uint64_t v9 = (uint64_t (**)(void))a5;
  uint64_t v10 = v9;
  if (a3)
  {
    v8[2](v8);
    uint64_t v11 = v10[2](v10);
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v12 = v9[2](v9);
    v8[2](v8);
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([(TKVibrationPickerViewController *)self isViewLoaded])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __101__TKVibrationPickerViewController__updateSectionVisibilityFlagToValue_usingBlock_sectionIndexGetter___block_invoke;
    v13[3] = &unk_264589C70;
    BOOL v14 = a3;
    v13[4] = self;
    v13[5] = v11;
    v13[6] = v12;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v13];
    [(TKVibrationPickerViewController *)self _updateCheckedStateOfAllVisibleCells];
  }
}

void __101__TKVibrationPickerViewController__updateSectionVisibilityFlagToValue_usingBlock_sectionIndexGetter___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(void *)(a1 + 40) == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    id v3 = [*(id *)(a1 + 32) tableView];
    v2 = [MEMORY[0x263F088D0] indexSetWithIndex:*(void *)(a1 + 40)];
    [v3 insertSections:v2 withRowAnimation:5];
  }
  else
  {
    if (*(void *)(a1 + 48) == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    id v3 = [*(id *)(a1 + 32) tableView];
    v2 = [MEMORY[0x263F088D0] indexSetWithIndex:*(void *)(a1 + 48)];
    [v3 deleteSections:v2 withRowAnimation:5];
  }
}

- (void)_updateCheckedStateOfAllVisibleCells
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(TKVibrationPickerViewController *)self isViewLoaded])
  {
    id v3 = [(TKVibrationPickerViewController *)self tableView];
    int64_t v4 = [v3 indexPathsForVisibleRows];
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
          uint64_t v10 = [v3 cellForRowAtIndexPath:v9];
          $96EE1C12479E9B303E9C2794B92A11A2 v11 = ($96EE1C12479E9B303E9C2794B92A11A2)[(TKVibrationPickerViewController *)self _cellAccessoriesDescriptorForRowAtIndexPath:v9];
          if ((*(_WORD *)&v11 & 0x100) == 0) {
            [v10 setChecked:v11.var0];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)_updateVisibilityOfSynchronizedGroup
{
  vibrationManager = self->_vibrationManager;
  int64_t v4 = [(TKVibrationPickerViewController *)self alertType];
  uint64_t v5 = [(TKVibrationPickerViewController *)self topic];
  LODWORD(vibrationManager) = [(TLVibrationManager *)vibrationManager _areSynchronizedVibrationsAllowedForAlertType:v4 topic:v5];

  if (vibrationManager)
  {
    uint64_t v6 = self->_vibrationManager;
    uint64_t v7 = [(TKVibrationPickerViewController *)self _sanitizedCorrespondingToneIdentifier];
    uint64_t v8 = [(TLVibrationManager *)v6 _synchronizedVibrationIdentifierForToneIdentifier:v7 targetDevice:0];

    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
    uint64_t v8 = 0;
  }
  if (self->_showsSynchronized != v9)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__TKVibrationPickerViewController__updateVisibilityOfSynchronizedGroup__block_invoke;
    v11[3] = &unk_264589C98;
    v11[4] = self;
    BOOL v13 = v9;
    id v12 = v8;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__TKVibrationPickerViewController__updateVisibilityOfSynchronizedGroup__block_invoke_2;
    v10[3] = &unk_264589C28;
    v10[4] = self;
    [(TKVibrationPickerViewController *)self _updateSectionVisibilityFlagToValue:v9 usingBlock:v11 sectionIndexGetter:v10];
  }
}

uint64_t __71__TKVibrationPickerViewController__updateVisibilityOfSynchronizedGroup__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1054) = *(unsigned char *)(a1 + 48);
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 1056);
  *(void *)(v3 + 1056) = v2;

  return MEMORY[0x270F9A758](v2, v4);
}

uint64_t __71__TKVibrationPickerViewController__updateVisibilityOfSynchronizedGroup__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sectionForSynchronizedGroup];
}

- (id)_localizationIdentifierForHeaderInSection:(int64_t)a3
{
  if ([(TKVibrationPickerViewController *)self _sectionForDefaultGroup] == a3) {
    return @"VIBRATION_PICKER_GROUP_TITLE_DEFAULT";
  }
  if ([(TKVibrationPickerViewController *)self _sectionForSynchronizedGroup] == a3) {
    return 0;
  }
  if ([(TKVibrationPickerViewController *)self _sectionForSystemGroup] == a3) {
    return @"VIBRATION_PICKER_GROUP_TITLE_STANDARD";
  }
  if ([(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup] == a3) {
    return @"VIBRATION_PICKER_GROUP_TITLE_USER_GENERATED";
  }
  return 0;
}

- (id)_customHeaderViewForHeaderInSection:(int64_t)a3
{
  uint64_t v4 = [(TKVibrationPickerViewController *)self _localizationIdentifierForHeaderInSection:a3];
  if (!v4) {
    goto LABEL_10;
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_sectionHeaderViews objectForKey:v4];
  if (v5) {
    goto LABEL_11;
  }
  if ([(TKVibrationPickerStyleProvider *)self->_styleProvider wantsCustomVibrationPickerHeaderView])
  {
    uint64_t v6 = TLLocalizedString();
    uint64_t v5 = objc_alloc_init(TKLabelContainerView);
    id v7 = v6;
    uint64_t v8 = v7;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = v7;
      if ([(TKVibrationPickerStyleProvider *)self->_styleProvider vibrationPickerHeaderTextShouldBeUppercase])
      {
        BOOL v9 = [MEMORY[0x263EFF960] currentLocale];
        uint64_t v8 = [v7 uppercaseStringWithLocale:v9];
      }
    }
    [(TKLabelContainerView *)v5 setLabelText:v8];
    uint64_t v10 = [(TKVibrationPickerStyleProvider *)self->_styleProvider vibrationPickerHeaderTextFont];
    [(TKLabelContainerView *)v5 setLabelFont:v10];

    $96EE1C12479E9B303E9C2794B92A11A2 v11 = [(TKVibrationPickerStyleProvider *)self->_styleProvider vibrationPickerHeaderTextColor];
    [(TKLabelContainerView *)v5 setLabelTextColor:v11];

    id v12 = [(TKVibrationPickerStyleProvider *)self->_styleProvider vibrationPickerHeaderTextShadowColor];
    [(TKLabelContainerView *)v5 setLabelShadowColor:v12];

    [(TKVibrationPickerStyleProvider *)self->_styleProvider vibrationPickerHeaderTextShadowOffset];
    -[TKLabelContainerView setLabelShadowOffset:](v5, "setLabelShadowOffset:");
    [(TKVibrationPickerStyleProvider *)self->_styleProvider vibrationPickerHeaderTextPaddingInsets];
    -[TKLabelContainerView setLabelPaddingInsets:](v5, "setLabelPaddingInsets:");
    sectionHeaderViews = self->_sectionHeaderViews;
    if (!sectionHeaderViews)
    {
      long long v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v15 = self->_sectionHeaderViews;
      self->_sectionHeaderViews = v14;

      sectionHeaderViews = self->_sectionHeaderViews;
    }
    [(NSMutableDictionary *)sectionHeaderViews setObject:v5 forKey:v4];
  }
  else
  {
LABEL_10:
    uint64_t v5 = 0;
  }
LABEL_11:

  return v5;
}

- (int64_t)_sectionForDefaultGroup
{
  int64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_showsDefault
    && ![(TKVibrationPickerViewController *)self _showsOnlyEditableSections])
  {
    return 0;
  }
  return v2;
}

- (int64_t)_sectionForSynchronizedGroup
{
  if (!self->_showsSynchronized
    || [(TKVibrationPickerViewController *)self _showsOnlyEditableSections])
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_showsDefault) {
    return [(TKVibrationPickerViewController *)self _sectionForDefaultGroup] + 1;
  }
  return 0;
}

- (int64_t)_sectionForSystemGroup
{
  if ([(TKVibrationPickerViewController *)self _showsOnlyEditableSections]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!self->_showsSynchronized
    || (int64_t result = [(TKVibrationPickerViewController *)self _sectionForSynchronizedGroup]
               + 1,
        result == 0x7FFFFFFFFFFFFFFFLL))
  {
    if (self->_showsDefault) {
      return [(TKVibrationPickerViewController *)self _sectionForDefaultGroup] + 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (int64_t)_sectionForUserGeneratedGroup
{
  if (!self->_showsUserGenerated) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([(TKVibrationPickerViewController *)self _showsOnlyEditableSections]) {
    return 0;
  }
  return [(TKVibrationPickerViewController *)self _sectionForSystemGroup] + 1;
}

- (int64_t)_sectionForNoneGroup
{
  if (!self->_showsNone
    || [(TKVibrationPickerViewController *)self _showsOnlyEditableSections])
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_showsUserGenerated) {
    int64_t v4 = [(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup];
  }
  else {
    int64_t v4 = [(TKVibrationPickerViewController *)self _sectionForSystemGroup];
  }
  return v4 + 1;
}

- (int64_t)_numberOfRowsInVibrationPickerSection:(int64_t)a3
{
  if ([(TKVibrationPickerViewController *)self _sectionForDefaultGroup] == a3
    || [(TKVibrationPickerViewController *)self _sectionForSynchronizedGroup] == a3)
  {
    return 1;
  }
  if ([(TKVibrationPickerViewController *)self _sectionForSystemGroup] != a3)
  {
    if ([(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup] != a3) {
      return [(TKVibrationPickerViewController *)self _sectionForNoneGroup] == a3;
    }
    BOOL v9 = [(TKVibrationPickerViewController *)self _sortedUserGeneratedVibrationIdentifiers];
    int64_t v5 = [v9 count] + 1;

    return v5;
  }
  id v7 = [(TKVibrationPickerViewController *)self _sortedVibrationIdentifiers];
  int64_t v8 = [v7 count];

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  $96EE1C12479E9B303E9C2794B92A11A2 v8 = ($96EE1C12479E9B303E9C2794B92A11A2)[(TKVibrationPickerViewController *)self _cellAccessoriesDescriptorForRowAtIndexPath:v7];
  BOOL v9 = @"_TLVibrationPickerViewTableCellWithDisclosureIndicatorIdentifier";
  if ((*(_WORD *)&v8 & 0x100) == 0) {
    BOOL v9 = @"_TLVibrationPickerViewTableCellDefaultIdentifier";
  }
  uint64_t v10 = v9;
  $96EE1C12479E9B303E9C2794B92A11A2 v11 = [v6 dequeueReusableCellWithIdentifier:v10];
  if (!v11)
  {
    $96EE1C12479E9B303E9C2794B92A11A2 v11 = [[TKVibrationPickerTableViewCell alloc] initWithReuseIdentifier:v10];
    [(TKVibrationPickerTableViewCell *)v11 setDelegate:self];
    if ((*(_WORD *)&v8 & 0x100) != 0)
    {
      [(TKVibrationPickerTableViewCell *)v11 setAccessoryType:1];
      [(TKVibrationPickerTableViewCell *)v11 setEditingAccessoryType:1];
    }
    styleProvider = self->_styleProvider;
    if (styleProvider)
    {
      BOOL v13 = [(TKVibrationPickerStyleProvider *)styleProvider vibrationPickerCellTextFont];
      [(TKVibrationPickerTableViewCell *)v11 setRegularTextFont:v13];

      long long v14 = [(TKVibrationPickerStyleProvider *)self->_styleProvider vibrationPickerCellTextColor];
      [(TKVibrationPickerTableViewCell *)v11 setRegularTextColor:v14];

      long long v15 = [(TKVibrationPickerStyleProvider *)self->_styleProvider vibrationPickerCellHighlightedTextColor];
      [(TKVibrationPickerTableViewCell *)v11 setHighlightedTextColor:v15];

      uint64_t v16 = [(TKVibrationPickerStyleProvider *)self->_styleProvider vibrationPickerCellBackgroundColor];
      [(TKVibrationPickerTableViewCell *)v11 setBackgroundColor:v16];

      uint64_t v17 = (void *)[(TKVibrationPickerStyleProvider *)self->_styleProvider newBackgroundViewForSelectedVibrationPickerCell:0];
      if (v17) {
        [(TKVibrationPickerTableViewCell *)v11 setBackgroundView:v17];
      }
      uint64_t v18 = (void *)[(TKVibrationPickerStyleProvider *)self->_styleProvider newBackgroundViewForSelectedVibrationPickerCell:1];
      if (v18) {
        [(TKVibrationPickerTableViewCell *)v11 setSelectedBackgroundView:v18];
      }
      if ((*(_WORD *)&v8 & 0x100) != 0)
      {
        [(TKVibrationPickerTableViewCell *)v11 setAccessoryType:1];
        [(TKVibrationPickerTableViewCell *)v11 setEditingAccessoryType:1];
        int64_t v19 = (void *)[(TKVibrationPickerStyleProvider *)self->_styleProvider newAccessoryDisclosureIndicatorViewForVibrationPickerCell];
        if (v19) {
          [(TKVibrationPickerTableViewCell *)v11 setAccessoryView:v19];
        }
        uint64_t v20 = (void *)[(TKVibrationPickerStyleProvider *)self->_styleProvider newAccessoryDisclosureIndicatorViewForVibrationPickerCell];
        if (v20) {
          [(TKVibrationPickerTableViewCell *)v11 setEditingAccessoryView:v20];
        }
      }
    }
  }
  uint64_t v21 = [v7 section];
  uint64_t v22 = [v7 row];
  if ([(TKVibrationPickerViewController *)self _sectionForDefaultGroup] == v21)
  {
    if (!v22)
    {
      vibrationManager = self->_vibrationManager;
      uint64_t v24 = [(TKVibrationPickerViewController *)self _sanitizedDefaultVibrationIdentifier];
      uint64_t v25 = [(TLVibrationManager *)vibrationManager nameOfVibrationWithIdentifier:v24];
LABEL_35:

LABEL_36:
      uint64_t v26 = 0;
      goto LABEL_39;
    }
LABEL_23:
    uint64_t v26 = 0;
    BOOL v27 = 0;
    uint64_t v25 = 0;
    goto LABEL_40;
  }
  if ([(TKVibrationPickerViewController *)self _sectionForSynchronizedGroup] == v21)
  {
    if (v22) {
      goto LABEL_23;
    }
    uint64_t v24 = self->_synchronizedVibrationIdentifier;
    uint64_t v25 = [(TLVibrationManager *)self->_vibrationManager nameOfVibrationWithIdentifier:v24];
    if (self->_showsDefault) {
      goto LABEL_35;
    }
    long long v38 = [(TKVibrationPickerViewController *)self _sanitizedDefaultVibrationIdentifier];
    char v39 = [v38 isEqualToString:v24];

    uint64_t v26 = 0;
    if ((v39 & 1) == 0) {
      goto LABEL_39;
    }
    goto LABEL_53;
  }
  if ([(TKVibrationPickerViewController *)self _sectionForSystemGroup] == v21)
  {
    v28 = [(TKVibrationPickerViewController *)self _sortedVibrationIdentifiers];
    if (v22 >= [v28 count])
    {
      uint64_t v25 = 0;
      uint64_t v26 = 0;
    }
    else
    {
      uint64_t v26 = [v28 objectAtIndex:v22];
      uint64_t v25 = [(TLVibrationManager *)self->_vibrationManager nameOfVibrationWithIdentifier:v26];
      if (!self->_showsDefault)
      {
        uint64_t v29 = [(TKVibrationPickerViewController *)self _sanitizedDefaultVibrationIdentifier];
        char v44 = [v29 isEqualToString:v26];

        if ((v44 & 1) == 0)
        {
LABEL_39:
          BOOL v27 = 0;
          goto LABEL_40;
        }
LABEL_53:
        uint64_t v40 = NSString;
        long long v41 = TLLocalizedString();
        uint64_t v42 = [v40 stringWithFormat:@"%@ (%@)", v25, v41];

        BOOL v27 = 0;
        uint64_t v25 = (void *)v42;
        goto LABEL_40;
      }
    }

    goto LABEL_39;
  }
  if ([(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup] == v21)
  {
    int64_t v30 = [(TKVibrationPickerViewController *)self tableView:v6 numberOfRowsInSection:v21]- 1;
    if (v22 >= v30)
    {
      if (v22 == v30)
      {
        uint64_t v25 = TLLocalizedString();
        goto LABEL_36;
      }
      goto LABEL_23;
    }
    uint64_t v31 = [(TKVibrationPickerViewController *)self _sortedUserGeneratedVibrationIdentifiers];
    uint64_t v32 = [v31 count];
    BOOL v27 = v22 < v32;
    if (v22 < v32)
    {
      uint64_t v26 = [v31 objectAtIndex:v22];
      uint64_t v33 = [(TLVibrationManager *)self->_vibrationManager nameOfVibrationWithIdentifier:v26];
      long long v43 = v31;
      uint64_t v25 = (void *)v33;
    }
    else
    {
      long long v43 = v31;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
    }
  }
  else
  {
    BOOL v27 = 0;
    uint64_t v26 = 0;
    if ([(TKVibrationPickerViewController *)self _sectionForNoneGroup] == v21)
    {
      uint64_t v25 = 0;
      if (v22) {
        goto LABEL_40;
      }
      uint64_t v25 = [(TKVibrationPickerViewController *)self noneString];
      if (!v25)
      {
        uint64_t v25 = [(TLVibrationManager *)self->_vibrationManager noneVibrationName];
      }
      if (self->_showsDefault) {
        goto LABEL_36;
      }
      id v36 = [(TKVibrationPickerViewController *)self _sanitizedDefaultVibrationIdentifier];
      int v37 = [v36 isEqualToString:*MEMORY[0x263F7FD78]];

      uint64_t v26 = 0;
      if (!v37) {
        goto LABEL_39;
      }
      goto LABEL_53;
    }
    uint64_t v25 = 0;
  }
LABEL_40:
  [(TKVibrationPickerTableViewCell *)v11 setEditable:v27];
  [(TKVibrationPickerTableViewCell *)v11 setLabelText:v25];
  long long v34 = TLLocalizedString();
  [(TKVibrationPickerTableViewCell *)v11 setPlaceholderText:v34];

  if ((*(_WORD *)&v8 & 0x100) == 0) {
    [(TKVibrationPickerTableViewCell *)v11 setChecked:v8.var0];
  }
  [(TKVibrationPickerViewController *)self _updateSelectionStyleForCell:v11 indexPath:v7];

  return v11;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v4 = [(TKVibrationPickerViewController *)self _showsOnlyEditableSections];
  LODWORD(v5) = !v4;
  uint64_t v6 = 2;
  if (v4) {
    uint64_t v6 = 0;
  }
  if (self->_showsDefault) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = !v4;
  }
  if (v4) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7 + 1;
  }
  if (self->_showsSynchronized) {
    uint64_t v7 = v8;
  }
  uint64_t v9 = v7 + self->_showsUserGenerated;
  if (self->_showsNone) {
    uint64_t v5 = v5;
  }
  else {
    uint64_t v5 = 0;
  }
  return v9 + v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(TKVibrationPickerViewController *)self _numberOfRowsInVibrationPickerSection:a4];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    uint64_t v10 = [(TKVibrationPickerViewController *)self _identifierOfVibrationAtIndexPath:v9];
    if ([v10 length])
    {
      $96EE1C12479E9B303E9C2794B92A11A2 v11 = [(TKVibrationPickerViewController *)self _selectedVibrationIndexPath];
      self->_skipNextUserGeneratedVibrationsDidChangeNotification = 1;
      vibrationManager = self->_vibrationManager;
      id v21 = 0;
      char v13 = [(TLVibrationManager *)vibrationManager deleteUserGeneratedVibrationPatternWithIdentifier:v10 error:&v21];
      id v14 = v21;
      long long v15 = v14;
      if ((v13 & 1) == 0 && v14) {
        [(TKVibrationPickerViewController *)self _handleError:v14];
      }
      int v16 = [v11 isEqual:v9];
      if (v16)
      {
        uint64_t selectedVibrationIdentifier = self->_selectedVibrationIdentifier;
        self->_uint64_t selectedVibrationIdentifier = 0;
      }
      sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
      self->_sortedUserGeneratedVibrationIdentifiers = 0;

      objc_storeStrong((id *)&self->_indexPathOfCellBeingDeleted, a5);
      [v8 beginUpdates];
      [(TKVibrationPickerViewController *)self canEnterEditingMode];
      v22[0] = v9;
      int64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
      [v8 deleteRowsAtIndexPaths:v19 withRowAnimation:100];

      [v8 endUpdates];
      [(TKVibrationPickerViewController *)self _updateCheckedStateOfAllVisibleCells];
      indexPathOfCellBeingDeleted = self->_indexPathOfCellBeingDeleted;
      self->_indexPathOfCellBeingDeleted = 0;

      if (v16) {
        [(TKVibrationPickerViewController *)self _processCurrentVibrationSelection];
      }
    }
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if ([(TKVibrationPickerStyleProvider *)self->_styleProvider wantsCustomVibrationPickerHeaderView])
  {
    uint64_t v6 = [(TKVibrationPickerViewController *)self _customHeaderViewForHeaderInSection:a4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(TKVibrationPickerStyleProvider *)self->_styleProvider wantsCustomVibrationPickerHeaderView])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [(TKVibrationPickerViewController *)self _localizationIdentifierForHeaderInSection:a4];
    uint64_t v6 = TLLocalizedString();
  }

  return v6;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(TKVibrationPickerStyleProvider *)self->_styleProvider wantsCustomVibrationPickerHeaderView])
  {
    uint64_t v7 = [(TKVibrationPickerViewController *)self tableView:v6 viewForHeaderInSection:a4];
    id v8 = v7;
    if (v7)
    {
      [v7 sizeToFit];
      [v8 frame];
      double Height = CGRectGetHeight(v11);
    }
    else
    {
      double Height = 0.0;
    }
  }
  else
  {
    double Height = *MEMORY[0x263F1D600];
  }

  return Height;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if ([(TKVibrationPickerViewController *)self isEditing])
  {
    uint64_t v9 = [v7 section];
    uint64_t v10 = [v7 row];
    if ([(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup] != v9
      || (v11 = [(TKVibrationPickerViewController *)self tableView:v6 numberOfRowsInSection:v9], id v8 = v7, v10 != v11 - 1))
    {

      id v8 = 0;
    }
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  uint64_t v9 = [v7 row];
  int v10 = [(TKVibrationPickerViewController *)self isEditing];
  if ([(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup] == v8
    && v9 == [(TKVibrationPickerViewController *)self tableView:v6 numberOfRowsInSection:v8]- 1)
  {
    if (v10)
    {
      int64_t v11 = [v6 visibleCells];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * v15++) makeTextFieldResignFirstResponderIfNeeded];
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v13);
      }
    }
    [(TKVibrationPickerViewController *)self _stopVibrating];
    int v16 = [[TKVibrationRecorderViewController alloc] initWithVibratorController:self->_vibratorController];
    [(TKVibrationRecorderViewController *)v16 setVibrationRecorderViewControllerDelegate:self];
    [(TKVibrationRecorderViewController *)v16 setDelegate:self];
    [(TKVibrationRecorderViewController *)v16 setModalPresentationStyle:0];
    [(TKVibrationPickerViewController *)self presentViewController:v16 animated:1 completion:0];
    [v6 deselectRowAtIndexPath:v7 animated:1];
    goto LABEL_29;
  }
  if ((v10 & 1) == 0)
  {
    self->_showsNothingSelected = 0;
    int v16 = self->_selectedVibrationIdentifier;
    uint64_t v17 = [(TKVibrationPickerViewController *)self _identifierOfVibrationAtIndexPath:v7];
    uint64_t v18 = [(TKVibrationPickerViewController *)self _sanitizeVibrationIdentifierForPlayback:v17];
    if ([(TKVibrationRecorderViewController *)v18 isEqualToString:*MEMORY[0x263F7FD78]])
    {
      [(TKVibrationPickerViewController *)self _stopVibrating];
      goto LABEL_24;
    }
    int64_t v19 = [(TKVibrationPickerViewController *)self _sanitizeVibrationIdentifierForPlayback:v16];
    uint64_t v20 = v19;
    if (v19 == v18 || ([(TKVibrationRecorderViewController *)v19 isEqualToString:v18] & 1) != 0)
    {
      if ([(TKVibratorController *)self->_vibratorController vibratorState] == 1)
      {
        [(TKVibrationPickerViewController *)self _stopVibrating];
LABEL_23:

LABEL_24:
        if (v16 == v17
          || ([(TKVibrationRecorderViewController *)v16 isEqualToString:v17] & 1) != 0)
        {
          [(TKVibrationPickerViewController *)self _updateCheckedStateOfAllVisibleCells];
          [v6 deselectRowAtIndexPath:v7 animated:1];
        }
        else
        {
          v23 = (NSString *)[(TKVibrationRecorderViewController *)v17 copy];
          uint64_t selectedVibrationIdentifier = self->_selectedVibrationIdentifier;
          self->_uint64_t selectedVibrationIdentifier = v23;

          [(TKVibrationPickerViewController *)self _updateCheckedStateOfAllVisibleCells];
          [v6 deselectRowAtIndexPath:v7 animated:1];
          [(TKVibrationPickerViewController *)self _processCurrentVibrationSelection];
        }

LABEL_29:
        goto LABEL_30;
      }
      id v21 = self;
      uint64_t v22 = v17;
    }
    else
    {
      id v21 = self;
      uint64_t v22 = v18;
    }
    [(TKVibrationPickerViewController *)v21 _startVibratingWithVibrationIdentifier:v22];
    goto LABEL_23;
  }
LABEL_30:
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == [(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup]
    && (int64_t v9 = [v7 row],
        v9 < [(TKVibrationPickerViewController *)self tableView:v6 numberOfRowsInSection:v8]- 1))
  {
    if (self->_allowsDeletingDefaultVibration)
    {
      int64_t v10 = 1;
    }
    else
    {
      uint64_t v12 = [(TKVibrationPickerViewController *)self _identifierOfVibrationAtIndexPath:v7];
      uint64_t v13 = [(TKVibrationPickerViewController *)self _sanitizedDefaultVibrationIdentifier];
      int64_t v10 = [v12 isEqualToString:v13] ^ 1;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->_swipeToDeleteMode = 1;
  [(TKVibrationPickerViewController *)self setEditing:1 animated:1];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  self->_swipeToDeleteMode = 0;
}

- (void)vibrationRecorderViewController:(id)a3 didFinishRecordingVibrationPattern:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(TKVibrationPickerViewController *)self _adjustedNameForVibrationWithDesiredName:v10 vibrationIdentifier:0];
    uint64_t v12 = (void *)v11;
    if (v9 && v11)
    {
      self->_skipNextUserGeneratedVibrationsDidChangeNotification = 1;
      vibrationManager = self->_vibrationManager;
      id v22 = 0;
      uint64_t v14 = [(TLVibrationManager *)vibrationManager addUserGeneratedVibrationPattern:v9 name:v12 error:&v22];
      id v15 = v22;
      if ([v14 length])
      {
        sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
        self->_sortedUserGeneratedVibrationIdentifiers = 0;

        uint64_t v17 = (NSString *)[v14 copy];
        uint64_t selectedVibrationIdentifier = self->_selectedVibrationIdentifier;
        self->_uint64_t selectedVibrationIdentifier = v17;

        [(TKVibrationPickerViewController *)self _processCurrentVibrationSelection];
        int64_t v19 = [(TKVibrationPickerViewController *)self _indexPathForVibrationWithIdentifier:v14];
        uint64_t v20 = [(TKVibrationPickerViewController *)self tableView];
        [v20 beginUpdates];
        id v21 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v19, 0);
        [v20 insertRowsAtIndexPaths:v21 withRowAnimation:4];

        [v20 endUpdates];
        [(TKVibrationPickerViewController *)self _updateCheckedStateOfAllVisibleCells];
      }
      else if (v15)
      {
        [(TKVibrationPickerViewController *)self _handleError:v15];
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
}

- (void)vibrationRecorderViewControllerWasDismissedWithoutSavingRecordedVibrationPattern:(id)a3
{
  id v4 = [(TKVibrationPickerViewController *)self tableView];
  uint64_t v3 = [v4 indexPathForSelectedRow];
  if (v3) {
    [v4 deselectRowAtIndexPath:v3 animated:1];
  }
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  uint64_t v3 = [(TKVibrationPickerViewController *)self parentViewController];
  if (!v3) {
    return 30;
  }
  id v4 = (void *)v3;
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    uint64_t v5 = [v4 parentViewController];

    id v4 = (void *)v5;
    if (!v5) {
      return 30;
    }
  }
  unint64_t v7 = [v4 supportedInterfaceOrientations];

  return v7;
}

- (void)_startVibratingWithVibrationIdentifier:(id)a3
{
  id v4 = a3;
  if ([(TKVibratorController *)self->_vibratorController vibratorState] == 1)
  {
    [(TKVibrationPickerViewController *)self _stopVibrating];
    dispatch_time_t v5 = dispatch_time(0, 200000000);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__TKVibrationPickerViewController__startVibratingWithVibrationIdentifier___block_invoke;
    v8[3] = &unk_264589980;
    v8[4] = self;
    id v4 = v4;
    id v9 = v4;
    dispatch_after(v5, MEMORY[0x263EF83A0], v8);
  }
  else
  {
    if (![v4 length])
    {
      uint64_t v6 = [(TKVibrationPickerViewController *)self _sanitizedDefaultVibrationIdentifier];

      id v4 = (id)v6;
    }
    [(TKVibrationPickerViewController *)self _stopVibrating];
    unint64_t v7 = [(TLVibrationManager *)self->_vibrationManager patternForVibrationWithIdentifier:v4];
    [(TKVibratorController *)self->_vibratorController turnOnWithVibrationPattern:v7];
  }
}

uint64_t __74__TKVibrationPickerViewController__startVibratingWithVibrationIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startVibratingWithVibrationIdentifier:*(void *)(a1 + 40)];
}

- (void)_stopVibrating
{
}

- (void)vibrationPickerTableViewCell:(id)a3 endedEditingWithText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TKVibrationPickerViewController *)self tableView];
  id v9 = [v8 indexPathForCell:v6];
  if (v9)
  {
    id v10 = [(TKVibrationPickerViewController *)self _identifierOfVibrationAtIndexPath:v9];
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = [(TKVibrationPickerViewController *)self _adjustedNameForVibrationWithDesiredName:v7 vibrationIdentifier:v10];
  if (v11 && ([(NSIndexPath *)self->_indexPathOfCellBeingDeleted isEqual:v9] & 1) == 0)
  {
    [v6 setLabelText:v11];
    if ([v10 length])
    {
      uint64_t v12 = [(TLVibrationManager *)self->_vibrationManager nameOfVibrationWithIdentifier:v10];
      id v13 = v11;
      id v14 = v12;
      if (v14)
      {
        id v15 = v14;
        if (v13 == v14)
        {

LABEL_20:
          goto LABEL_21;
        }
        char v16 = [v13 isEqualToString:v14];

        id v13 = v15;
        if (v16) {
          goto LABEL_20;
        }
LABEL_13:
        self->_skipNextUserGeneratedVibrationsDidChangeNotification = 1;
        vibrationManager = self->_vibrationManager;
        id v25 = 0;
        char v19 = [(TLVibrationManager *)vibrationManager setName:v11 forUserGeneratedVibrationWithIdentifier:v10 error:&v25];
        id v20 = v25;
        id v21 = v20;
        if ((v19 & 1) == 0 && v20) {
          [(TKVibrationPickerViewController *)self _handleError:v20];
        }
        sortedUserGeneratedVibrationIdentifiers = self->_sortedUserGeneratedVibrationIdentifiers;
        self->_sortedUserGeneratedVibrationIdentifiers = 0;

        v23 = [(TKVibrationPickerViewController *)self _indexPathForVibrationWithIdentifier:v10];
        uint64_t v24 = v23;
        if (v23 && ([v23 isEqual:v9] & 1) == 0)
        {
          [v8 beginUpdates];
          [v8 moveRowAtIndexPath:v9 toIndexPath:v24];
          [v8 endUpdates];
        }

        goto LABEL_20;
      }
    }
    else
    {
      id v17 = v11;
    }

    id v13 = 0;
    goto LABEL_13;
  }
LABEL_21:
}

- (void)_presentVibrationRecorderViewController
{
  int64_t v3 = [(TKVibrationPickerViewController *)self _sectionForUserGeneratedGroup];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v4 = v3;
    id v7 = [(TKVibrationPickerViewController *)self tableView];
    int64_t v5 = [(TKVibrationPickerViewController *)self tableView:v7 numberOfRowsInSection:v4];
    id v6 = [MEMORY[0x263F088C8] indexPathForRow:v5 - 1 inSection:v4];
    [(TKVibrationPickerViewController *)self tableView:v7 didSelectRowAtIndexPath:v6];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(TKVibrationPickerViewController *)self isEditing] != a3)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__TKVibrationPickerViewController_setEditing_animated___block_invoke;
    v11[3] = &unk_264589CC0;
    v11[4] = self;
    BOOL v12 = v5;
    BOOL v13 = v4;
    id v7 = (void (**)(void))MEMORY[0x223C781A0](v11);
    if (self->_isCallingParentViewController) {
      goto LABEL_3;
    }
    id v8 = [(TKVibrationPickerViewController *)self parentViewController];
    if (!v8
      || (id v9 = v8,
          self->_isCallingParentViewController = 1,
          [v8 setEditing:v5 animated:v4],
          self->_isCallingParentViewController = 0,
          int v10 = [(TKVibrationPickerViewController *)self isEditing],
          v9,
          v10 != v5))
    {
LABEL_3:
      v7[2](v7);
    }
  }
}

void __55__TKVibrationPickerViewController_setEditing_animated___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  int64_t v2 = [*(id *)(a1 + 32) navigationController];
  int64_t v3 = [v2 viewControllers];

  if ((unint64_t)[v3 count] >= 2)
  {
    BOOL v4 = [v3 lastObject];
    BOOL v5 = *(void **)(a1 + 32);

    if (v4 == v5)
    {
      id v6 = [*(id *)(a1 + 32) _navigationItem];
      id v7 = v6;
      if (*(unsigned char *)(a1 + 40)) {
        BOOL v8 = *(unsigned char *)(*(void *)(a1 + 32) + 1051) == 0;
      }
      else {
        BOOL v8 = 0;
      }
      [v6 setHidesBackButton:v8 animated:*(unsigned __int8 *)(a1 + 41)];
    }
  }
  if (![*(id *)(a1 + 32) isViewLoaded] || (id v9 = *(unsigned char **)(a1 + 32), v9[1051]))
  {
    int v10 = 0;
LABEL_10:
    char v11 = 1;
    goto LABEL_11;
  }
  int v10 = [v9 tableView];
  int v37 = [v10 visibleCells];
  long long v38 = (void *)[v37 copy];

  if (!*(unsigned char *)(a1 + 40))
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v39 = v38;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v51 != v42) {
            objc_enumerationMutation(v39);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * i) makeTextFieldResignFirstResponderIfNeeded];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v41);
    }
  }
  if (!v10) {
    goto LABEL_10;
  }
  [v10 beginUpdates];
  char v11 = 0;
LABEL_11:
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v12 = [*(id *)(a1 + 32) _sectionForDefaultGroup];
    uint64_t v13 = [*(id *)(a1 + 32) _sectionForSynchronizedGroup];
    uint64_t v14 = [*(id *)(a1 + 32) _sectionForSystemGroup];
    uint64_t v15 = [*(id *)(a1 + 32) _sectionForNoneGroup];
    uint64_t v16 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v17 = *(unsigned __int8 *)(a1 + 41);
    v49.receiver = *(id *)(a1 + 32);
    v49.super_class = (Class)TKVibrationPickerViewController;
    objc_msgSendSuper2(&v49, sel_setEditing_animated_, v16, v17);
    if ((v11 & 1) == 0)
    {
      id v18 = objc_alloc_init(MEMORY[0x263F089C8]);
      char v19 = v18;
      if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
        [v18 addIndex:v12];
      }
      if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
        [v19 addIndex:v13];
      }
      if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
        [v19 addIndex:v14];
      }
      if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
        [v19 addIndex:v15];
      }
      if ([v19 count]) {
        [v10 deleteSections:v19 withRowAnimation:0];
      }
    }
    [*(id *)(a1 + 32) _stopVibrating];
    if (v11) {
      goto LABEL_47;
    }
LABEL_39:
    [v10 endUpdates];
    long long v27 = [v10 visibleCells];
    long long v28 = (void *)[v27 copy];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v45 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v44 + 1) + 8 * j);
          long long v35 = *(void **)(a1 + 32);
          id v36 = objc_msgSend(v10, "indexPathForCell:", v34, (void)v44);
          [v35 _updateSelectionStyleForCell:v34 indexPath:v36];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v44 objects:v54 count:16];
      }
      while (v31);
    }

    goto LABEL_47;
  }
  uint64_t v20 = *(unsigned __int8 *)(a1 + 41);
  v48.receiver = *(id *)(a1 + 32);
  v48.super_class = (Class)TKVibrationPickerViewController;
  objc_msgSendSuper2(&v48, sel_setEditing_animated_, 0, v20);
  if ((v11 & 1) == 0)
  {
    uint64_t v21 = [*(id *)(a1 + 32) _sectionForDefaultGroup];
    uint64_t v22 = [*(id *)(a1 + 32) _sectionForSynchronizedGroup];
    uint64_t v23 = [*(id *)(a1 + 32) _sectionForSystemGroup];
    uint64_t v24 = [*(id *)(a1 + 32) _sectionForNoneGroup];
    id v25 = objc_alloc_init(MEMORY[0x263F089C8]);
    long long v26 = v25;
    if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
      [v25 addIndex:v21];
    }
    if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
      [v26 addIndex:v22];
    }
    if (v23 != 0x7FFFFFFFFFFFFFFFLL) {
      [v26 addIndex:v23];
    }
    if (v24 != 0x7FFFFFFFFFFFFFFFLL) {
      [v26 addIndex:v24];
    }
    if ([v26 count]) {
      [v10 insertSections:v26 withRowAnimation:0];
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1051) = 0;
  if ((v11 & 1) == 0) {
    goto LABEL_39;
  }
LABEL_47:
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (NSString)topic
{
  return self->_topic;
}

- (TKVibrationPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TKVibrationPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsDefault
{
  return self->_showsDefault;
}

- (NSString)defaultVibrationIdentifier
{
  return self->_defaultVibrationIdentifier;
}

- (NSString)correspondingToneIdentifier
{
  return self->_correspondingToneIdentifier;
}

- (BOOL)showsUserGenerated
{
  return self->_showsUserGenerated;
}

- (BOOL)showsNone
{
  return self->_showsNone;
}

- (NSString)noneString
{
  return self->_noneString;
}

- (BOOL)showsNothingSelected
{
  return self->_showsNothingSelected;
}

- (NSString)selectedVibrationIdentifier
{
  return self->_selectedVibrationIdentifier;
}

- (BOOL)allowsDeletingDefaultVibration
{
  return self->_allowsDeletingDefaultVibration;
}

- (void)setAllowsDeletingDefaultVibration:(BOOL)a3
{
  self->_allowsDeletingDefaultVibration = a3;
}

- (BOOL)showsEditButtonInNavigationBar
{
  return self->_showsEditButtonInNavigationBar;
}

- (TKVibrationPickerStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (TKVibrationPickerViewControllerDelegate)_additionalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__additionalDelegate);

  return (TKVibrationPickerViewControllerDelegate *)WeakRetained;
}

- (void)_setAdditionalDelegate:(id)a3
{
}

- (TKVibrationPickerViewControllerDismissalDelegate)_dismissalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__dismissalDelegate);

  return (TKVibrationPickerViewControllerDismissalDelegate *)WeakRetained;
}

- (void)_setDismissalDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__dismissalDelegate);
  objc_destroyWeak((id *)&self->__additionalDelegate);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_selectedVibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_correspondingToneIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultVibrationIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_sectionHeaderViews, 0);
  objc_storeStrong((id *)&self->_indexPathOfCellBeingDeleted, 0);
  objc_storeStrong((id *)&self->_sortedUserGeneratedVibrationIdentifiers, 0);
  objc_storeStrong((id *)&self->_sortedVibrationIdentifiers, 0);
  objc_storeStrong((id *)&self->_vibrationShouldStopTimer, 0);
  objc_storeStrong((id *)&self->_vibratorController, 0);
  objc_storeStrong((id *)&self->_vibrationManager, 0);
  objc_storeStrong((id *)&self->_synchronizedVibrationIdentifier, 0);

  objc_storeStrong((id *)&self->_noneString, 0);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

@end