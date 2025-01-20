@interface NTKGreenfieldCompanionContentViewController
- (CGPoint)_watchScreenInsetForDeviceSize:(unint64_t)a3 screenScale:(double)a4;
- (CGSize)_watchScreenSizeForDeviceSize:(unint64_t)a3 screenScale:(double)a4;
- (NTKGreenfieldCompanionContentViewController)initWithError:(id)a3 decodedRecipe:(id)a4;
- (NTKGreenfieldCompanionContentViewControllerDelegate)greenfieldDelegate;
- (id)_errorSubtitleForError:(id)a3;
- (id)_errorTitleForError:(id)a3;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)initAddComplicationStateWithDecodedRecipe:(id)a3 complicationItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6;
- (id)initCompletedStateWithDecodedRecipe:(id)a3 skippedComplicationSlots:(id)a4 canRevisit:(BOOL)a5;
- (id)initComplicationNotAvailableStateWithDecodedRecipe:(id)a3 unavailableSlots:(id)a4 unavailableTitle:(id)a5 unavailableDescription:(id)a6;
- (id)initStartStateWithDecodedRecipe:(id)a3 canAddFaceDirectly:(BOOL)a4 addFaceDescription:(id)a5;
- (id)suggestedButtonTitle;
- (id)titleString;
- (unint64_t)_deviceSizeForCLKDeviceSizeClass:(unint64_t)a3;
- (void)_didTapAddToMyFacesButton;
- (void)_didTapShowInternalErrorButton;
- (void)_installLocallyAvailableApp;
- (void)_overrideLockup:(id)a3 withButtonTitle:(id)a4 buttonAction:(id)a5;
- (void)_presentErrorUIAlert;
- (void)_reinstallAppWithAdamId:(id)a3;
- (void)_reinstallSystemAppWithBundleId:(id)a3;
- (void)_setupContentView;
- (void)_setupContentViewForWatchFaceNotAvailableError;
- (void)_setupWatchFaceViewContainerWithView:(id)a3 deviceSize:(unint64_t)a4 deviceMaterial:(unint64_t)a5;
- (void)_updateComplicationDisplayStates;
- (void)alternateButtonPressed:(id)a3;
- (void)lockupView:(id)a3 appStateDidChange:(id)a4;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)refreshViews;
- (void)setGreenfieldDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NTKGreenfieldCompanionContentViewController

- (id)initStartStateWithDecodedRecipe:(id)a3 canAddFaceDirectly:(BOOL)a4 addFaceDescription:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  v11 = [(BPSWelcomeOptinViewController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(BPSWelcomeOptinViewController *)v11 setStyle:2];
    v12->_state = 0;
    objc_storeStrong((id *)&v12->_decodedRecipe, a3);
    v12->_canAddFaceDirectly = a4;
    objc_storeStrong((id *)&v12->_addFaceDescription, a5);
  }

  return v12;
}

- (id)initAddComplicationStateWithDecodedRecipe:(id)a3 complicationItemId:(id)a4 installMode:(int64_t)a5 skippedComplicationSlots:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  objc_super v14 = [(BPSWelcomeOptinViewController *)self init];
  v15 = v14;
  if (v14)
  {
    [(BPSWelcomeOptinViewController *)v14 setStyle:10];
    v15->_state = 2;
    objc_storeStrong((id *)&v15->_decodedRecipe, a3);
    objc_storeStrong((id *)&v15->_complicationItemId, a4);
    objc_storeStrong((id *)&v15->_skippedComplicationSlots, a6);
    v15->_installMode = a5;
  }

  return v15;
}

- (id)initComplicationNotAvailableStateWithDecodedRecipe:(id)a3 unavailableSlots:(id)a4 unavailableTitle:(id)a5 unavailableDescription:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(BPSWelcomeOptinViewController *)self init];
  v16 = v15;
  if (v15)
  {
    [(BPSWelcomeOptinViewController *)v15 setStyle:2];
    v16->_state = 1;
    objc_storeStrong((id *)&v16->_decodedRecipe, a3);
    objc_storeStrong((id *)&v16->_unavailableSlots, a4);
    objc_storeStrong((id *)&v16->_unavailableTitle, a5);
    objc_storeStrong((id *)&v16->_unavailableDescription, a6);
  }

  return v16;
}

- (id)initCompletedStateWithDecodedRecipe:(id)a3 skippedComplicationSlots:(id)a4 canRevisit:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  id v11 = [(BPSWelcomeOptinViewController *)&v15 init];
  id v12 = v11;
  if (v11)
  {
    if (v5) {
      uint64_t v13 = 10;
    }
    else {
      uint64_t v13 = 2;
    }
    [(BPSWelcomeOptinViewController *)v11 setStyle:v13];
    v12->_state = 3;
    objc_storeStrong((id *)&v12->_decodedRecipe, a3);
    objc_storeStrong((id *)&v12->_skippedComplicationSlots, a4);
  }

  return v12;
}

- (NTKGreenfieldCompanionContentViewController)initWithError:(id)a3 decodedRecipe:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  id v9 = [(BPSWelcomeOptinViewController *)&v16 init];
  if (v9)
  {
    id v10 = [v8 noBorderFacePreviewImagePath];

    if (v10)
    {
      v9->_state = 4;
      if (NTKInternalBuild(v11, v12)) {
        [(BPSWelcomeOptinViewController *)v9 setStyle:2];
      }
      objc_storeStrong((id *)&v9->_decodedRecipe, a4);
      dispatch_queue_t v13 = dispatch_queue_create("com.apple.NanoTimeKit.GreenfieldViewControllerDecodeImage.queue", 0);
      workQueue = v9->_workQueue;
      v9->_workQueue = (OS_dispatch_queue *)v13;
    }
    else
    {
      v9->_state = 5;
    }
    objc_storeStrong((id *)&v9->_error, a3);
  }

  return v9;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  [(BPSWelcomeOptinViewController *)&v9 viewDidLoad];
  if (self->_state != 5)
  {
    v3 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
    v4 = BPSSetupTintColor();
    [v3 setTitleColor:v4 forState:0];

    BOOL v5 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
    v6 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [v5 setTitleColor:v6 forState:2];

    if (self->_state == 4)
    {
      id v7 = [(NSError *)self->_error domain];
      if ([v7 isEqualToString:@"com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager"])
      {
        if ([(NSError *)self->_error code] == 11)
        {

LABEL_8:
          [(NTKGreenfieldCompanionContentViewController *)self _setupContentViewForWatchFaceNotAvailableError];
          return;
        }
        NSInteger v8 = [(NSError *)self->_error code];

        if (v8 == 13) {
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    [(NTKGreenfieldCompanionContentViewController *)self _setupContentView];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  [(BPSWelcomeOptinViewController *)&v4 viewDidAppear:a3];
  if (self->_state == 5) {
    [(NTKGreenfieldCompanionContentViewController *)self _presentErrorUIAlert];
  }
}

- (void)viewDidLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  [(OBBaseWelcomeController *)&v24 viewDidLayoutSubviews];
  v3 = [(NTKGreenfieldCompanionContentViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(NTKGreenfieldCompanionContentViewController *)self scrollView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  dispatch_queue_t v13 = [(NTKGreenfieldCompanionContentViewController *)self scrollView];
  [v13 verticalScrollIndicatorInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v20 = [(NTKGreenfieldCompanionContentViewController *)self view];
  [v20 safeAreaInsets];
  double v22 = v21;

  v23 = [(NTKGreenfieldCompanionContentViewController *)self scrollView];
  objc_msgSend(v23, "setVerticalScrollIndicatorInsets:", v22, v15, v17, v19);
}

- (id)titleString
{
  switch(self->_state)
  {
    case 0uLL:
      v2 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe watchFace];
      v3 = [v2 faceSharingName];

      if (v3)
      {
        double v4 = NTKClockFaceLocalizedString(@"GREENFIELD_ADD_WATCH_FACE_TITLE_MAIN_SCREEN", @"Add %@ Watch Face");
        double v5 = objc_msgSend(NSString, "stringWithFormat:", v4, v3);
      }
      else
      {
        double v5 = NTKClockFaceLocalizedString(@"GREENFIELD_ADD_WATCH_FACE_TITLE_MAIN_SCREEN_GENERIC", @"Add Watch Face");
      }

      break;
    case 1uLL:
      double v6 = self->_unavailableTitle;
      goto LABEL_10;
    case 2uLL:
      double v7 = @"GREENFIELD_ADD_WATCH_FACE_TITLE_IN_FLOW";
      double v8 = @"Include Complication";
      goto LABEL_8;
    case 3uLL:
      double v7 = @"GREENFIELD_ADD_WATCH_FACE_TITLE_SUCCESS";
      double v8 = @"Watch Face Added";
LABEL_8:
      NTKClockFaceLocalizedString(v7, v8);
      double v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      double v6 = [(NTKGreenfieldCompanionContentViewController *)self _errorTitleForError:self->_error];
LABEL_10:
      double v5 = v6;
      break;
    default:
      double v5 = 0;
      break;
  }
  return v5;
}

- (id)detailString
{
  id v3 = 0;
  switch(self->_state)
  {
    case 0uLL:
      uint64_t v4 = 1312;
      goto LABEL_4;
    case 1uLL:
      uint64_t v4 = 1344;
LABEL_4:
      id v3 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v4);
      break;
    case 2uLL:
      if ((self->_installMode & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        double v5 = @"GREENFIELD_ADD_WATCH_FACE_SUBTITLE_UPDATE_COMPLICATION_IN_FLOW";
        double v6 = @"To use this complication, update the app.";
      }
      else
      {
        double v5 = @"GREENFIELD_ADD_WATCH_FACE_SUBTITLE_IN_FLOW";
        double v6 = @"To use this complication, download the app from the App Store.";
      }
      NTKClockFaceLocalizedString(v5, v6);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      id v3 = [(NTKGreenfieldCompanionContentViewController *)self _errorSubtitleForError:self->_error];
      break;
    default:
      break;
  }
  return v3;
}

- (id)suggestedButtonTitle
{
  switch(self->_state)
  {
    case 0uLL:
      if (!self->_canAddFaceDirectly) {
        goto LABEL_4;
      }
      v2 = @"GREENFIELD_ADD_TO_MY_FACES_BUTTON_TITLE";
      id v3 = @"Add to My Faces";
      goto LABEL_8;
    case 1uLL:
LABEL_4:
      v2 = @"GREENFIELD_CONTINUE_BUTTON_TITLE";
      id v3 = @"Continue";
      goto LABEL_8;
    case 2uLL:
      uint64_t v4 = &stru_1F1635E90;
      break;
    case 3uLL:
      v2 = @"GREENFIELD_DONE_BUTTON_TITLE";
      id v3 = @"Done";
LABEL_8:
      NTKClockFaceLocalizedString(v2, v3);
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      if (NTKInternalBuild(self, a2)) {
        uint64_t v4 = @"[INTERNAL ONLY: SHOW ERROR]";
      }
      else {
        uint64_t v4 = 0;
      }
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  return v4;
}

- (id)alternateButtonTitle
{
  unint64_t state = self->_state;
  if (state == 3)
  {
    id v3 = @"GREENFIELD_REVISIT_SKIPPED_COMPLICATIONS_BUTTON_TITLE";
    uint64_t v4 = @"Add Skipped Apps";
    goto LABEL_5;
  }
  if (state == 2)
  {
    id v3 = @"GREENFIELD_SKIP_APPS_BUTTON_TITLE";
    uint64_t v4 = @"Continue Without This App";
LABEL_5:
    double v5 = NTKClockFaceLocalizedString(v3, v4);
    goto LABEL_7;
  }
  double v5 = 0;
LABEL_7:
  return v5;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  switch(self->_state)
  {
    case 0uLL:
      id v12 = v4;
      BOOL canAddFaceDirectly = self->_canAddFaceDirectly;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
      double v8 = WeakRetained;
      if (!canAddFaceDirectly) {
        goto LABEL_5;
      }
      double v9 = self;
      uint64_t v10 = 0;
      goto LABEL_7;
    case 1uLL:
      id v12 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
      double v8 = WeakRetained;
LABEL_5:
      double v9 = self;
      uint64_t v10 = 1;
      goto LABEL_7;
    case 3uLL:
      id v12 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
      double v8 = WeakRetained;
      double v9 = self;
      uint64_t v10 = 2;
LABEL_7:
      [WeakRetained companionContentViewController:v9 handleButtonEvent:v10];

      goto LABEL_8;
    case 4uLL:
      id v12 = v4;
      int v11 = NTKInternalBuild(v4, v4);
      double v5 = v12;
      if (!v11) {
        goto LABEL_9;
      }
      [(NTKGreenfieldCompanionContentViewController *)self _didTapShowInternalErrorButton];
LABEL_8:
      double v5 = v12;
LABEL_9:

      return;
    default:
      goto LABEL_9;
  }
}

- (void)alternateButtonPressed:(id)a3
{
  id v4 = a3;
  unint64_t state = self->_state;
  if (state == 3)
  {
    id v11 = v4;
    uint64_t v10 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
    [v10 setEnabled:0];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
    double v7 = WeakRetained;
    double v8 = self;
    uint64_t v9 = 3;
  }
  else
  {
    if (state != 2) {
      goto LABEL_6;
    }
    id v11 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
    double v7 = WeakRetained;
    double v8 = self;
    uint64_t v9 = 4;
  }
  [WeakRetained companionContentViewController:v8 handleButtonEvent:v9];

  id v4 = v11;
LABEL_6:
}

- (void)refreshViews
{
  v16.receiver = self;
  v16.super_class = (Class)NTKGreenfieldCompanionContentViewController;
  [(BPSWelcomeOptinViewController *)&v16 refreshViews];
  if (self->_state == 2)
  {
    if (!self->_appStoreView)
    {
      id v3 = (ASCLockupView *)objc_alloc_init(MEMORY[0x1E4F4BB08]);
      appStoreView = self->_appStoreView;
      self->_appStoreView = v3;

      [(ASCLockupView *)self->_appStoreView setDelegate:self];
      double v5 = BPSForegroundColor();
      [(ASCLockupView *)self->_appStoreView setBackgroundColor:v5];

      double v6 = [(ASCLockupView *)self->_appStoreView layer];
      [v6 setCornerRadius:15.0];

      -[ASCLockupView setLayoutMargins:](self->_appStoreView, "setLayoutMargins:", 10.0, 16.0, 10.0, 16.0);
      double v7 = (void *)[objc_alloc(MEMORY[0x1E4F4BAC0]) initWithNumberValue:self->_complicationItemId];
      id v8 = objc_alloc(MEMORY[0x1E4F4BB00]);
      uint64_t v9 = (void *)[v8 initWithID:v7 kind:*MEMORY[0x1E4F4BA80] context:*MEMORY[0x1E4F4BA78]];
      [(ASCLockupView *)self->_appStoreView setRequest:v9];

      self->_lockupViewStateDidChange = 0;
    }
    uint64_t v10 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
    id v11 = [v10 superview];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      dispatch_queue_t v13 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
      double v14 = [v13 superview];

      double v15 = [(BPSWelcomeOptinViewController *)self suggestedChoiceButton];
      [v15 removeFromSuperview];

      [v14 insertArrangedSubview:self->_appStoreView atIndex:0];
    }
  }
}

- (void)_setupContentView
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe watchFace];
  if (v3)
  {
    id v4 = [[NTKGreenfieldHighlightableFaceContainerView alloc] initWithFace:v3];
    faceView = self->_faceView;
    self->_faceView = v4;

    double v6 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe complicationSlotToTemplateMapping];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v7 = objc_msgSend(v6, "allKeys", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          dispatch_queue_t v13 = [v6 objectForKey:v12];
          [(NTKGreenfieldHighlightableFaceContainerView *)self->_faceView setTemplate:v13 forSlot:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    double v14 = [MEMORY[0x1E4F19A30] currentDevice];
    double v15 = [v14 nrDevice];

    uint64_t v16 = [MEMORY[0x1E4F83B58] sizeFromDevice:v15];
    uint64_t v17 = [MEMORY[0x1E4F83B58] materialFromDevice:v15];
    double v18 = [NTKRoundedCornerMaskView alloc];
    double v19 = [MEMORY[0x1E4F19A30] currentDevice];
    v20 = [(NTKRoundedCornerMaskView *)v18 initWithDevice:v19];

    [(NTKRoundedCornerMaskView *)v20 addSubview:self->_faceView];
    [(NTKGreenfieldCompanionContentViewController *)self _setupWatchFaceViewContainerWithView:v20 deviceSize:v16 deviceMaterial:v17];
    [(NTKGreenfieldCompanionContentViewController *)self _updateComplicationDisplayStates];
  }
}

- (void)_setupWatchFaceViewContainerWithView:(id)a3 deviceSize:(unint64_t)a4 deviceMaterial:(unint64_t)a5
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4 <= 8 && ((1 << a4) & 0x186) != 0)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50C28]) initWithStyle:2];
    [v9 overrideMaterial:a5 size:a4];
    int v10 = 0;
    watchView = self->_watchView;
    self->_watchView = (BPSWatchViewProtocol *)v9;
  }
  else
  {
    v46 = (BPSWatchViewProtocol *)objc_alloc_init(MEMORY[0x1E4F50C10]);
    watchView = self->_watchView;
    self->_watchView = v46;
    int v10 = 1;
  }

  [(BPSWatchViewProtocol *)self->_watchView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BPSWatchViewProtocol *)self->_watchView addSubview:v8];
  if (v8)
  {
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 setContentMode:2];
      }
      [(BPSWatchViewProtocol *)self->_watchView watchScreenInsetGuide];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      [v8 bounds];
      CGAffineTransformMakeScale(&v60, v17 / v20, v17 / v20);
      CGAffineTransform v59 = v60;
      [v8 setTransform:&v59];
      objc_msgSend(v8, "setFrame:", v13, v15, v17, v19);
    }
    else
    {
      long long v21 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v21 scale];
      double v23 = v22;

      [(NTKGreenfieldCompanionContentViewController *)self _watchScreenSizeForDeviceSize:a4 screenScale:v23];
      double v25 = v24;
      double v27 = v26;
      [(NTKGreenfieldCompanionContentViewController *)self _watchScreenInsetForDeviceSize:a4 screenScale:v23];
      objc_msgSend(v8, "setCenter:", v28 + v25 * 0.5, v29 + v27 * 0.5);
      [v8 bounds];
      CGFloat v31 = v25 / v30;
      [v8 bounds];
      CGAffineTransformMakeScale(&v58, v31, v27 / v32);
      CGAffineTransform v57 = v58;
      [v8 setTransform:&v57];
    }
  }
  id v33 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v62[0] = self->_watchView;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
  v35 = (void *)[v33 initWithArrangedSubviews:v34];

  [v35 setAxis:1];
  [v35 setAlignment:3];
  [v35 setBaselineRelativeArrangement:1];
  [v35 setSpacing:8.0];
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
  v36 = [(NTKGreenfieldCompanionContentViewController *)self contentView];
  [v36 addSubview:v35];

  v48 = (void *)MEMORY[0x1E4F28DC8];
  v56 = [(NTKGreenfieldCompanionContentViewController *)self contentView];
  v55 = [v56 topAnchor];
  v54 = [v35 topAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v61[0] = v53;
  v52 = [(NTKGreenfieldCompanionContentViewController *)self contentView];
  v50 = [v52 leadingAnchor];
  v49 = [v35 leadingAnchor];
  v47 = [v50 constraintEqualToAnchor:v49];
  v61[1] = v47;
  v37 = [(NTKGreenfieldCompanionContentViewController *)self contentView];
  v38 = [v37 trailingAnchor];
  [v35 trailingAnchor];
  v39 = v51 = v8;
  v40 = [v38 constraintEqualToAnchor:v39];
  v61[2] = v40;
  v41 = [(NTKGreenfieldCompanionContentViewController *)self contentView];
  v42 = [v41 bottomAnchor];
  v43 = [v35 bottomAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v61[3] = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:4];
  [v48 activateConstraints:v45];
}

- (void)_setupContentViewForWatchFaceNotAvailableError
{
  id v3 = [MEMORY[0x1E4F19A30] currentDevice];
  id v4 = [v3 nrDevice];

  uint64_t v5 = [MEMORY[0x1E4F83B58] materialFromDevice:v4];
  uint64_t v6 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe noBorderFacePreviewImagePath];
  if (v6)
  {
    double v7 = (void *)v6;
    id v8 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe senderBoxedDeviceSize];

    if (v8)
    {
      workQueue = self->_workQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __93__NTKGreenfieldCompanionContentViewController__setupContentViewForWatchFaceNotAvailableError__block_invoke;
      v10[3] = &unk_1E62C2950;
      v10[4] = self;
      v10[5] = v5;
      dispatch_async(workQueue, v10);
    }
  }
}

void __93__NTKGreenfieldCompanionContentViewController__setupContentViewForWatchFaceNotAvailableError__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1818]);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1280) noBorderFacePreviewImagePath];
  id v4 = (void *)[v2 initWithContentsOfFile:v3];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__NTKGreenfieldCompanionContentViewController__setupContentViewForWatchFaceNotAvailableError__block_invoke_2;
  block[3] = &unk_1E62C35A8;
  uint64_t v5 = *(void *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __93__NTKGreenfieldCompanionContentViewController__setupContentViewForWatchFaceNotAvailableError__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1280) senderBoxedDeviceSize];
  uint64_t v3 = [v2 integerValue];

  uint64_t v4 = [*(id *)(a1 + 32) _deviceSizeForCLKDeviceSizeClass:v3];
  [MEMORY[0x1E4F19A30] screenBoundsForSizeClass:v3];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [MEMORY[0x1E4F19A30] screenScaleForSizeClass:v3];
  double v14 = v13;
  [MEMORY[0x1E4F19A30] screenCornerRadiusForSizeClass:v3];
  double v16 = v15;
  id v18 = (id)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*(void *)(a1 + 40)];
  objc_msgSend(v18, "setFrame:", v6, v8, v10, v12);
  double v17 = -[NTKRoundedCornerMaskView initWithFrame:screenScale:cornerRadius:]([NTKRoundedCornerMaskView alloc], "initWithFrame:screenScale:cornerRadius:", v6, v8, v10, v12, v14, v16);
  [(NTKRoundedCornerMaskView *)v17 addSubview:v18];
  [*(id *)(a1 + 32) _setupWatchFaceViewContainerWithView:v17 deviceSize:v4 deviceMaterial:*(void *)(a1 + 48)];
}

- (void)_presentErrorUIAlert
{
  uint64_t v3 = [(NTKGreenfieldCompanionContentViewController *)self _errorTitleForError:self->_error];
  uint64_t v4 = [(NTKGreenfieldCompanionContentViewController *)self _errorSubtitleForError:self->_error];
  if (NTKInternalBuild(v4, v5))
  {
    double v6 = [NSString stringWithFormat:@"\n \n [INTERNAL ONLY] \n Please file a radar and include a sysdiagnose. Error: reason: %@", self->_error];
    uint64_t v7 = [NSString stringWithFormat:@"%@ %@", v4, v6];

    uint64_t v4 = (void *)v7;
  }
  double v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v3 message:v4 preferredStyle:1];
  double v9 = (void *)MEMORY[0x1E4FB1410];
  double v10 = NTKClockFaceLocalizedString(@"GREENFIELD_ADD_WATCH_FACE_ERROR_OK_BUTON_TITLE", @"OK");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__NTKGreenfieldCompanionContentViewController__presentErrorUIAlert__block_invoke;
  v12[3] = &unk_1E62C0AA8;
  v12[4] = self;
  double v11 = [v9 actionWithTitle:v10 style:1 handler:v12];

  [v8 addAction:v11];
  [(NTKGreenfieldCompanionContentViewController *)self presentViewController:v8 animated:1 completion:0];
}

void __67__NTKGreenfieldCompanionContentViewController__presentErrorUIAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1400));
  [WeakRetained companionContentViewController:*(void *)(a1 + 32) handleButtonEvent:5];
}

- (unint64_t)_deviceSizeForCLKDeviceSizeClass:(unint64_t)a3
{
  if (a3 > 8) {
    return 7;
  }
  else {
    return qword_1BC8A0D38[a3];
  }
}

- (CGPoint)_watchScreenInsetForDeviceSize:(unint64_t)a3 screenScale:(double)a4
{
  if (a4 <= 2.0)
  {
    if (a3 == 2)
    {
      double v5 = 56.0;
      double v4 = 25.5;
      goto LABEL_17;
    }
    if (a3 == 7)
    {
      double v5 = 50.5;
      double v4 = 19.5;
      goto LABEL_17;
    }
    if (a3 != 8)
    {
      double v5 = 54.0;
      double v4 = 24.5;
      goto LABEL_17;
    }
    double v5 = 50.5;
    goto LABEL_12;
  }
  switch(a3)
  {
    case 2uLL:
      double v5 = 74.0;
      double v4 = 32.0;
      break;
    case 7uLL:
      double v5 = 65.0;
LABEL_12:
      double v4 = 20.5;
      break;
    case 8uLL:
      double v4 = 21.0;
      double v5 = 66.0;
      break;
    default:
      double v4 = 30.0;
      double v5 = 71.0;
      break;
  }
LABEL_17:
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGSize)_watchScreenSizeForDeviceSize:(unint64_t)a3 screenScale:(double)a4
{
  if (a4 <= 2.0)
  {
    switch(a3)
    {
      case 2uLL:
        double v4 = 85.0;
        uint64_t v6 = 0x4051000000000000;
        break;
      case 8uLL:
        double v4 = 95.0;
        double v5 = 78.0;
        goto LABEL_17;
      case 7uLL:
        double v4 = 98.0;
        uint64_t v6 = 0x4054000000000000;
        break;
      default:
        double v4 = 89.0;
        double v5 = 71.0;
        goto LABEL_17;
    }
    double v5 = *(double *)&v6;
  }
  else
  {
    switch(a3)
    {
      case 2uLL:
        double v4 = 108.0;
        double v5 = 86.0;
        break;
      case 8uLL:
        double v4 = 123.0;
        double v5 = 101.0;
        break;
      case 7uLL:
        double v4 = 126.0;
        double v5 = 103.0;
        break;
      default:
        double v4 = 113.0;
        double v5 = 90.0;
        break;
    }
  }
LABEL_17:
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)_updateComplicationDisplayStates
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe complicationSlotToTemplateMapping];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v19 = v23 = 0u;
  uint64_t v3 = [v19 allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
    uint64_t v7 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
    uint64_t v8 = *(void *)v21;
    double v9 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ([*(id *)((char *)&self->super.super.super.super.super.super.isa + v6[842]) containsObject:v11])
        {
          uint64_t v12 = 1;
        }
        else
        {
          uint64_t v13 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v9[837]);
          if (v13 == 2)
          {
            double v14 = v6;
            double v15 = v3;
            double v16 = v9;
            if (self->_complicationItemId)
            {
              double v17 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe complicationSlotToItemIdMapping];
              id v18 = [v17 allKeysForObject:self->_complicationItemId];

              if ([v18 containsObject:v11]) {
                uint64_t v12 = 2;
              }
              else {
                uint64_t v12 = 0;
              }
            }
            else
            {
              uint64_t v12 = 0;
            }
            double v9 = v16;
            uint64_t v3 = v15;
            uint64_t v6 = v14;
            uint64_t v7 = &OBJC_IVAR___NTKComplicationMetrics__cornerRadius;
          }
          else if (v13 == 1)
          {
            if ([(NSSet *)self->_unavailableSlots containsObject:v11]) {
              uint64_t v12 = 2;
            }
            else {
              uint64_t v12 = 0;
            }
          }
          else
          {
            uint64_t v12 = 0;
          }
        }
        [*(id *)((char *)&self->super.super.super.super.super.super.isa + v7[852]) setComplicationDisplayViewState:v12 forSlot:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void)_installLocallyAvailableApp
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Could not fine app record for complication item id %@", (uint8_t *)&v3, 0xCu);
}

void __74__NTKGreenfieldCompanionContentViewController__installLocallyAvailableApp__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v14 = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Installing local available app result: %ld %@", buf, 0x16u);
  }

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier", @"ApplicationID");
  v12[0] = v8;
  v11[1] = @"InstallState";
  double v9 = [NSNumber numberWithInteger:a2];
  v12[1] = v9;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v7 postNotificationName:@"GreenfieldApplicationInstallBeganNotification" object:0 userInfo:v10];
}

- (void)_overrideLockup:(id)a3 withButtonTitle:(id)a4 buttonAction:(id)a5
{
  id v24 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F4BB20];
  id v8 = a5;
  uint64_t v25 = [v7 textMetadataWithTitle:a4 subtitle:0];
  long long v23 = (void *)[objc_alloc(MEMORY[0x1E4F4BAE0]) initWithMetadata:v25 action:v8];

  double v9 = [v24 lockup];
  id v22 = objc_alloc(MEMORY[0x1E4F4BAE8]);
  double v10 = [v9 id];
  uint64_t v11 = [v9 kind];
  uint64_t v12 = [v9 metrics];
  uint64_t v13 = [v9 icon];
  uint64_t v14 = [v9 heading];
  __int16 v15 = [v9 title];
  id v16 = [v9 subtitle];
  uint64_t v17 = [v9 ageRating];
  id v18 = (void *)[v22 initWithID:v10 kind:v11 metrics:v12 icon:v13 heading:v14 title:v15 subtitle:v16 ageRating:v17 offer:v23];

  double v19 = (void *)MEMORY[0x1E4FB1EB0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __92__NTKGreenfieldCompanionContentViewController__overrideLockup_withButtonTitle_buttonAction___block_invoke;
  v26[3] = &unk_1E62C09C0;
  id v27 = v24;
  id v28 = v18;
  id v20 = v18;
  id v21 = v24;
  [v19 performWithoutAnimation:v26];
}

uint64_t __92__NTKGreenfieldCompanionContentViewController__overrideLockup_withButtonTitle_buttonAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLockup:*(void *)(a1 + 40)];
}

- (void)_reinstallAppWithAdamId:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [MEMORY[0x1E4F4BB30] sharedWatchApps];
  uint64_t v6 = [v5 reinstallAppWithID:v4];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke;
  v9[3] = &unk_1E62C0068;
  objc_copyWeak(&v10, &location);
  [v6 addSuccessBlock:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_3;
  v7[3] = &unk_1E62C35F8;
  objc_copyWeak(&v8, &location);
  [v6 addErrorBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_2;
  block[3] = &unk_1E62C0068;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained alternateChoiceButton];
    [v2 setEnabled:1];

    id v3 = objc_loadWeakRetained(v4 + 175);
    [v3 companionContentViewController:v4 didStartInstallingAppWithItemId:v4[162]];

    id WeakRetained = v4;
  }
}

void __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_4;
  block[3] = &unk_1E62C0068;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __71__NTKGreenfieldCompanionContentViewController__reinstallAppWithAdamId___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained alternateChoiceButton];
    [v2 setEnabled:1];

    id WeakRetained = v3;
  }
}

- (void)_reinstallSystemAppWithBundleId:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [MEMORY[0x1E4F4BB30] sharedWatchApps];
  uint64_t v6 = [v5 reinstallSystemAppWithBundleID:v4];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke;
  v9[3] = &unk_1E62C0068;
  objc_copyWeak(&v10, &location);
  [v6 addSuccessBlock:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_3;
  v7[3] = &unk_1E62C35F8;
  objc_copyWeak(&v8, &location);
  [v6 addErrorBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_2;
  block[3] = &unk_1E62C0068;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained alternateChoiceButton];
    [v2 setEnabled:1];

    id v3 = objc_loadWeakRetained(v4 + 175);
    [v3 companionContentViewController:v4 didStartInstallingAppWithItemId:v4[162]];

    id WeakRetained = v4;
  }
}

void __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_4;
  block[3] = &unk_1E62C0068;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __79__NTKGreenfieldCompanionContentViewController__reinstallSystemAppWithBundleId___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained alternateChoiceButton];
    [v2 setEnabled:1];

    id WeakRetained = v3;
  }
}

- (void)_didTapAddToMyFacesButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
  [WeakRetained companionContentViewController:self handleButtonEvent:0];
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int64_t installMode = self->_installMode;
  if (installMode) {
    BOOL v7 = installMode == 2;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = [v4 lockup];
    double v9 = [v8 offer];

    if (([v9 flags] & 0x10) != 0 && (objc_msgSend(v9, "flags") & 0x40) != 0)
    {
      [v5 setAutomaticallyPresentsProductDetails:0];
      id v10 = NTKClockFaceLocalizedString(@"GREENFIELD_ADD_WATCH_FACE_INSTALL_BUTTON_TITLE", @"INSTALL");
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __74__NTKGreenfieldCompanionContentViewController_lockupViewDidFinishRequest___block_invoke_2;
      v11[3] = &unk_1E62BFF20;
      v11[4] = self;
      [(NTKGreenfieldCompanionContentViewController *)self _overrideLockup:v5 withButtonTitle:v10 buttonAction:v11];
    }
    goto LABEL_11;
  }
  if (installMode == 1)
  {
    double v9 = NTKClockFaceLocalizedString(@"GREENFIELD_ADD_WATCH_FACE_INSTALL_BUTTON_TITLE", @"INSTALL");
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __74__NTKGreenfieldCompanionContentViewController_lockupViewDidFinishRequest___block_invoke;
    v12[3] = &unk_1E62C0068;
    objc_copyWeak(&v13, &location);
    [(NTKGreenfieldCompanionContentViewController *)self _overrideLockup:v5 withButtonTitle:v9 buttonAction:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
LABEL_11:
  }
}

void __74__NTKGreenfieldCompanionContentViewController_lockupViewDidFinishRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _installLocallyAvailableApp];
}

void __74__NTKGreenfieldCompanionContentViewController_lockupViewDidFinishRequest___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1280) complicationSlotToItemIdMapping];
  id v3 = [v2 allKeysForObject:*(void *)(*(void *)(a1 + 32) + 1296)];
  id v6 = [v3 firstObject];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 1280) complicationSlotToBundleIdMapping];
  id v5 = [v4 objectForKeyedSubscript:v6];

  [*(id *)(a1 + 32) _reinstallSystemAppWithBundleId:v5];
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 isEqualToString:*MEMORY[0x1E4F4B9C0]])
  {
    if (([v7 isEqualToString:*MEMORY[0x1E4F4B998]] & 1) != 0
      || [v7 isEqualToString:*MEMORY[0x1E4F4B9A0]])
    {
      if (self->_lockupViewDidUpdateStateForInstallingOrOpenable) {
        goto LABEL_9;
      }
      self->_lockupViewDidUpdateStateForInstallingOrOpenable = 1;
      if (self->_installMode == 2)
      {
        [(NTKGreenfieldCompanionContentViewController *)self _installLocallyAvailableApp];
        goto LABEL_5;
      }
    }
    else
    {
      if (![v7 isEqualToString:*MEMORY[0x1E4F4B9A8]])
      {
        id v8 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
        id WeakRetained = v8;
        uint64_t v10 = 1;
        goto LABEL_3;
      }
      if (!self->_lockupViewStateDidChange)
      {
        id WeakRetained = NTKClockFaceLocalizedString(@"GREENFIELD_ADD_WATCH_FACE_INSTALL_BUTTON_TITLE", @"INSTALL");
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        void v12[2] = __76__NTKGreenfieldCompanionContentViewController_lockupView_appStateDidChange___block_invoke;
        v12[3] = &unk_1E62C09C0;
        void v12[4] = self;
        id v13 = v6;
        [(NTKGreenfieldCompanionContentViewController *)self _overrideLockup:v13 withButtonTitle:WeakRetained buttonAction:v12];

        goto LABEL_4;
      }
    }
    uint64_t v11 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
    [v11 setEnabled:1];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
    [WeakRetained companionContentViewController:self didStartInstallingAppWithItemId:self->_complicationItemId];
    goto LABEL_4;
  }
  id v8 = [(BPSWelcomeOptinViewController *)self alternateChoiceButton];
  id WeakRetained = v8;
  uint64_t v10 = 0;
LABEL_3:
  [v8 setEnabled:v10];
LABEL_4:

LABEL_5:
  self->_lockupViewStateDidChange = 1;
LABEL_9:
}

void __76__NTKGreenfieldCompanionContentViewController_lockupView_appStateDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) lockup];
  id v2 = [v3 id];
  [v1 _reinstallAppWithAdamId:v2];
}

- (id)_errorSubtitleForError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:@"com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager"];

  if (v5)
  {
    switch([v3 code])
    {
      case 1:
      case 8:
      case 11:
        id v6 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_NOT_AVAIALBLE_ON_DEVICE";
        id v7 = @"This watch face is not available on your Apple Watch.";
        goto LABEL_5;
      case 2:
      case 4:
        id v6 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_TRY_AGAIN_LATER";
        id v7 = @"Try again later.";
        goto LABEL_5;
      case 3:
        id v6 = @"GREENFIELD_COMPANION_ADD_WATCH_FACE_ERROR_NO_WATCH_PAIRED";
        id v7 = @"Pair your Apple Watch with this iPhone to add this face.";
        goto LABEL_5;
      case 5:
        uint64_t v10 = NSString;
        uint64_t v11 = NTKClockFaceLocalizedString(@"GREENFIELD_ADD_WATCH_FACE_ERROR_FACE_LIMIT", @"too many faces");
        uint64_t v12 = [MEMORY[0x1E4F19A30] currentDevice];
        id v8 = objc_msgSend(v10, "localizedStringWithFormat:", v11, NTKFaceLibraryMaxFaceCountForDevice(v12));

        break;
      case 6:
        id v6 = @"GREENFIELD_COMPANION_ADD_WATCH_FACE_ERROR_SINGULAR_FACE_SUBTITLE";
        id v7 = @"You can switch to this face on your Apple Watch.";
        goto LABEL_5;
      case 7:
        id v6 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_NO_PHOTOS_INCLUDED_IN_PHOTOS_WATCH_FACE";
        id v7 = @"This face cannot be added to your Apple Watch because the sender did not include any photos.";
        goto LABEL_5;
      case 9:
        id v6 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_LIBRARY_NOT_LOADED";
        id v7 = @"Could not add this watch face at this time. Try again later.";
        goto LABEL_5;
      case 10:
        id v6 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_NO_NETWORK_CONNECTION_OR_INVALID_URL_SUBTITLE";
        id v7 = @"Check your internet connection and try again.";
        goto LABEL_5;
      case 12:
        id v6 = @"GREENFIELD_COMPANION_ADD_WATCH_FACE_ERROR_REQURE_WATCH_OS_UPDATE";
        id v7 = @"Watch face sharing is not available with your current version of watchOS.";
        goto LABEL_5;
      case 13:
        id v13 = [MEMORY[0x1E4F19A30] currentDevice];
        uint64_t v14 = [v13 nrDevice];
        __int16 v15 = [v14 valueForProperty:*MEMORY[0x1E4F79E08]];

        id v16 = NSString;
        uint64_t v17 = NTKClockFaceLocalizedString(@"GREENFIELD_ADD_WATCH_FACE_ERROR_PAIRED_DEVICE_IS_TINKER", @"This face can be added on Apple Watch. Message it to %@ to get started.");
        id v8 = objc_msgSend(v16, "localizedStringWithFormat:", v17, v15);

        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    id v6 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_DEFAULT_ALERT_MESSAGE";
    id v7 = @"This watch face is not available with your current version of watchOS.";
LABEL_5:
    id v8 = NTKClockFaceLocalizedString(v6, v7);
  }

  return v8;
}

- (id)_errorTitleForError:(id)a3
{
  id v4 = a3;
  int v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager"];

  if (v6)
  {
    switch([v4 code])
    {
      case 0:
      case 2:
      case 11:
        goto LABEL_3;
      case 4:
        id v8 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_FAILED_TO_DOWNLOAD_WATCH_FACE_DATA_TITLE";
        double v9 = @"This Watch Face is Not Available at This Time";
        break;
      case 6:
        id v8 = @"GREENFIELD_COMPANION_ADD_WATCH_FACE_ERROR_SINGULAR_FACE_TITLE";
        double v9 = @"You Already Have This Face";
        break;
      case 10:
        id v8 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_NO_NETWORK_CONNECTION_OR_INVALID_URL_TITLE";
        double v9 = @"Unable to Download the Watch Face";
        break;
      case 12:
        goto LABEL_5;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_3:
    id v7 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe watchFace];

    if (v7)
    {
LABEL_4:
      id v8 = @"GREENFIELD_ADD_WATCH_FACE_TITLE_MAIN_SCREEN_GENERIC";
      double v9 = @"Add Watch Face";
    }
    else
    {
LABEL_5:
      id v8 = @"GREENFIELD_ADD_WATCH_FACE_ERROR_NOT_AVAIALBLE_ON_DEVICE_ALERT_TITLE";
      double v9 = @"Watch Face Unavailable";
    }
  }
  uint64_t v10 = NTKClockFaceLocalizedString(v8, v9);

  return v10;
}

- (void)_didTapShowInternalErrorButton
{
  id v5 = [NSString stringWithFormat:@"Please file a radar to Watch Faces if you think this is an error.\n %@", self->_error];
  id v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"[Internal Only]" message:v5 preferredStyle:1];
  id v4 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Ok" style:1 handler:0];
  [v3 addAction:v4];

  [(NTKGreenfieldCompanionContentViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (NTKGreenfieldCompanionContentViewControllerDelegate)greenfieldDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_greenfieldDelegate);
  return (NTKGreenfieldCompanionContentViewControllerDelegate *)WeakRetained;
}

- (void)setGreenfieldDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_greenfieldDelegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
  objc_storeStrong((id *)&self->_appStoreView, 0);
  objc_storeStrong((id *)&self->_unavailableDescription, 0);
  objc_storeStrong((id *)&self->_unavailableTitle, 0);
  objc_storeStrong((id *)&self->_unavailableSlots, 0);
  objc_storeStrong((id *)&self->_skippedComplicationSlots, 0);
  objc_storeStrong((id *)&self->_addFaceDescription, 0);
  objc_storeStrong((id *)&self->_complicationItemId, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_decodedRecipe, 0);
}

@end