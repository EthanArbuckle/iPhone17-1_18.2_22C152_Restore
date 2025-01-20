@interface TKVibrationRecorderContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)vibrationRecorderViewDidEnterRecordingMode:(id)a3;
- (TKVibrationRecorderContentViewController)initWithVibratorController:(id)a3;
- (TKVibrationRecorderViewController)parentVibrationRecorderViewController;
- (TKVibrationRecorderViewControllerDelegate)delegate;
- (id)_indefiniteVibrationPattern;
- (unint64_t)supportedInterfaceOrientations;
- (void)_accessibilityDidEnterRecordingMode;
- (void)_accessibilityDidEnterReplayMode;
- (void)_accessibilityDidExitRecordingMode;
- (void)_accessibilityDidExitReplayMode;
- (void)_accessibilityMakeAnnouncementWithStringForLocalizationIdentifier:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)_cleanUpVibrationNameAlertController;
- (void)_eraseCurrentVibrationComponentDidStartTimeStamp;
- (void)_finishedWithRecorder;
- (void)_saveButtonInAlertTapped:(id)a3;
- (void)_saveButtonTapped:(id)a3;
- (void)_startVibratingWithVibrationPattern:(id)a3;
- (void)_stopRecordingOrPlayingForApplicationSuspension;
- (void)_stopVibrating;
- (void)_storeVibrationComponentOfTypePause:(BOOL)a3;
- (void)_updateStateSaveButtonInAlert;
- (void)applicationWillSuspend;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setParentVibrationRecorderViewController:(id)a3;
- (void)vibrationComponentDidEndForVibrationRecorderView:(id)a3;
- (void)vibrationComponentDidStartForVibrationRecorderView:(id)a3;
- (void)vibrationRecorderView:(id)a3 buttonTappedWithIdentifier:(int)a4;
- (void)vibrationRecorderView:(id)a3 didExitRecordingModeWithContextObject:(id)a4;
- (void)vibrationRecorderViewDidFinishReplayingVibration:(id)a3;
- (void)vibrationRecorderViewDidReachVibrationRecordingMaximumDuration:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TKVibrationRecorderContentViewController

- (TKVibrationRecorderContentViewController)initWithVibratorController:(id)a3
{
  id v5 = a3;
  v6 = [(TKVibrationRecorderContentViewController *)self initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vibratorController, a3);
    v8 = TLLocalizedString();
    [(TKVibrationRecorderContentViewController *)v7 setTitle:v8];

    v9 = [(TKVibrationRecorderContentViewController *)v7 navigationItem];
    uint64_t v10 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:v7 action:sel__cancelButtonTapped_];
    cancelButton = v7->_cancelButton;
    v7->_cancelButton = (UIBarButtonItem *)v10;

    id v12 = objc_alloc(MEMORY[0x263F1C468]);
    v13 = TLLocalizedString();
    uint64_t v14 = [v12 initWithTitle:v13 style:2 target:v7 action:sel__saveButtonTapped_];
    saveButton = v7->_saveButton;
    v7->_saveButton = (UIBarButtonItem *)v14;

    [v9 setLeftBarButtonItem:v7->_cancelButton];
    [v9 setRightBarButtonItem:v7->_saveButton];
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v17 = *MEMORY[0x263F1D050];
    v18 = [MEMORY[0x263F1C408] sharedApplication];
    [v16 addObserver:v7 selector:sel__handleApplicationDidEnterBackgroundNotification_ name:v17 object:v18];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F1D050];
  id v5 = [MEMORY[0x263F1C408] sharedApplication];
  [v3 removeObserver:self name:v4 object:v5];

  [(TKVibrationRecorderContentViewController *)self _cleanUpVibrationNameAlertController];
  v6.receiver = self;
  v6.super_class = (Class)TKVibrationRecorderContentViewController;
  [(TKVibrationRecorderContentViewController *)&v6 dealloc];
}

- (void)_stopRecordingOrPlayingForApplicationSuspension
{
  int mode = self->_mode;
  if (mode == 1)
  {
    uint64_t v3 = 2;
  }
  else
  {
    if (mode != 2) {
      return;
    }
    uint64_t v3 = 4;
  }
  [(TKVibrationRecorderContentViewController *)self vibrationRecorderView:self->_vibrationRecorderView buttonTappedWithIdentifier:v3];
}

- (void)applicationWillSuspend
{
  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderContentViewController;
  [(TKVibrationRecorderContentViewController *)&v3 applicationWillSuspend];
  [(TKVibrationRecorderContentViewController *)self _stopRecordingOrPlayingForApplicationSuspension];
}

- (void)loadView
{
  objc_super v3 = [[TKVibrationRecorderView alloc] initWithVibrationPatternMaximumDuration:10.0];
  vibrationRecorderView = self->_vibrationRecorderView;
  self->_vibrationRecorderView = v3;

  [(TKVibrationRecorderView *)self->_vibrationRecorderView setDelegate:self];
  id v5 = self->_vibrationRecorderView;

  [(TKVibrationRecorderContentViewController *)self setView:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TKVibrationRecorderContentViewController;
  [(TKVibrationRecorderContentViewController *)&v4 viewDidAppear:a3];
  [(TKVibrationRecorderContentViewController *)self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(TKVibrationRecorderContentViewController *)self resignFirstResponder];
  [(TKVibrationRecorderContentViewController *)self _finishedWithRecorder];
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderContentViewController;
  [(TKVibrationRecorderContentViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_int mode = 0;
  [(UIBarButtonItem *)self->_saveButton setEnabled:0];
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderContentViewController;
  [(TKVibrationRecorderContentViewController *)&v5 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderContentViewController;
  [(TKVibrationRecorderContentViewController *)&v5 viewDidDisappear:a3];
  [(TKVibrationRecorderContentViewController *)self _finishedWithRecorder];
  indefiniteVibrationPattern = self->_indefiniteVibrationPattern;
  self->_indefiniteVibrationPattern = 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_cancelButtonTapped:(id)a3
{
  [(TKVibrationRecorderContentViewController *)self _finishedWithRecorder];
  [(TKVibrationRecorderContentViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v5 = [(TKVibrationRecorderContentViewController *)self delegate];
  objc_super v4 = [(TKVibrationRecorderContentViewController *)self parentVibrationRecorderViewController];
  [v5 vibrationRecorderViewControllerWasDismissedWithoutSavingRecordedVibrationPattern:v4];
}

- (void)_saveButtonTapped:(id)a3
{
  id v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__0;
  v24[4] = __Block_byref_object_dispose__0;
  id v5 = self;
  v25 = v5;
  objc_super v6 = (void *)MEMORY[0x263F1C3F8];
  v7 = TLLocalizedString();
  uint64_t v8 = [v6 alertControllerWithTitle:v7 message:0 preferredStyle:1];
  vibrationNameAlertController = v5->_vibrationNameAlertController;
  v5->_vibrationNameAlertController = (UIAlertController *)v8;

  [(UIAlertController *)v5->_vibrationNameAlertController addTextFieldWithConfigurationHandler:&__block_literal_global_0];
  uint64_t v10 = [(UIAlertController *)v5->_vibrationNameAlertController textFields];
  uint64_t v11 = [v10 firstObject];
  vibrationNameAlertTextField = v5->_vibrationNameAlertTextField;
  v5->_vibrationNameAlertTextField = (UITextField *)v11;

  [(UITextField *)v5->_vibrationNameAlertTextField setDelegate:v5];
  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:v5 selector:sel__vibrationNameTextFieldContentsDidChange_ name:*MEMORY[0x263F1D778] object:v5->_vibrationNameAlertTextField];

  uint64_t v14 = v5->_vibrationNameAlertController;
  v15 = (void *)MEMORY[0x263F1C3F0];
  v16 = TLLocalizedString();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __62__TKVibrationRecorderContentViewController__saveButtonTapped___block_invoke_2;
  v23[3] = &unk_264589B20;
  v23[4] = v24;
  uint64_t v17 = [v15 actionWithTitle:v16 style:1 handler:v23];
  [(UIAlertController *)v14 addAction:v17];

  v18 = (void *)MEMORY[0x263F1C3F0];
  v19 = TLLocalizedString();
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __62__TKVibrationRecorderContentViewController__saveButtonTapped___block_invoke_3;
  v22[3] = &unk_264589B20;
  v22[4] = v24;
  uint64_t v20 = [v18 actionWithTitle:v19 style:0 handler:v22];
  vibrationNameAlertSaveAction = v5->_vibrationNameAlertSaveAction;
  v5->_vibrationNameAlertSaveAction = (UIAlertAction *)v20;

  [(UIAlertController *)v5->_vibrationNameAlertController addAction:v5->_vibrationNameAlertSaveAction];
  [(TKVibrationRecorderContentViewController *)v5 _updateStateSaveButtonInAlert];
  [(TKVibrationRecorderContentViewController *)v5 presentViewController:v5->_vibrationNameAlertController animated:1 completion:0];
  _Block_object_dispose(v24, 8);
}

uint64_t __62__TKVibrationRecorderContentViewController__saveButtonTapped___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TKVibrationInterfaceUtilities configureVibrationNameTextField:a2];
}

uint64_t __62__TKVibrationRecorderContentViewController__saveButtonTapped___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _cancelButtonInAlertTapped:a2];
}

uint64_t __62__TKVibrationRecorderContentViewController__saveButtonTapped___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _saveButtonInAlertTapped:a2];
}

- (void)_saveButtonInAlertTapped:(id)a3
{
  id v4 = [(TKVibrationRecorderContentViewController *)self delegate];
  id v5 = [(TKVibrationRecorderContentViewController *)self parentVibrationRecorderViewController];
  objc_super v6 = [(TLVibrationPattern *)self->_recordedVibrationPattern propertyListRepresentation];
  v7 = [(UITextField *)self->_vibrationNameAlertTextField text];
  [v4 vibrationRecorderViewController:v5 didFinishRecordingVibrationPattern:v6 name:v7];

  [(TKVibrationRecorderContentViewController *)self _finishedWithRecorder];
  [(TKVibrationRecorderContentViewController *)self dismissViewControllerAnimated:1 completion:0];

  [(TKVibrationRecorderContentViewController *)self _cleanUpVibrationNameAlertController];
}

- (void)_updateStateSaveButtonInAlert
{
  vibrationNameAlertSaveAction = self->_vibrationNameAlertSaveAction;
  id v3 = [(UITextField *)self->_vibrationNameAlertTextField text];
  -[UIAlertAction setEnabled:](vibrationNameAlertSaveAction, "setEnabled:", [v3 length] != 0);
}

- (void)_cleanUpVibrationNameAlertController
{
  if (self->_vibrationNameAlertTextField)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F1D778] object:self->_vibrationNameAlertTextField];

    [(UITextField *)self->_vibrationNameAlertTextField setDelegate:0];
    vibrationNameAlertTextField = self->_vibrationNameAlertTextField;
    self->_vibrationNameAlertTextField = 0;
  }
  vibrationNameAlertSaveAction = self->_vibrationNameAlertSaveAction;
  self->_vibrationNameAlertSaveAction = 0;

  vibrationNameAlertController = self->_vibrationNameAlertController;
  self->_vibrationNameAlertController = 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  if (self->_vibrationNameAlertTextField != a3) {
    return 1;
  }
  BOOL v7 = +[TKVibrationInterfaceUtilities vibrationNameTextField:shouldChangeCharactersInRange:replacementString:](TKVibrationInterfaceUtilities, "vibrationNameTextField:shouldChangeCharactersInRange:replacementString:");
  [(TKVibrationRecorderContentViewController *)self _updateStateSaveButtonInAlert];
  return v7;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (self->_vibrationNameAlertTextField != a3) {
    return 1;
  }
  id v4 = [a3 text];
  BOOL v3 = [v4 length] != 0;

  return v3;
}

- (id)_indefiniteVibrationPattern
{
  indefiniteVibrationPattern = self->_indefiniteVibrationPattern;
  if (!indefiniteVibrationPattern)
  {
    id v4 = [MEMORY[0x263F7FCA8] simpleVibrationPatternWithVibrationDuration:10.0 pauseDuration:1.0];
    id v5 = [v4 propertyListRepresentation];
    objc_super v6 = self->_indefiniteVibrationPattern;
    self->_indefiniteVibrationPattern = v5;

    indefiniteVibrationPattern = self->_indefiniteVibrationPattern;
  }

  return indefiniteVibrationPattern;
}

- (void)_startVibratingWithVibrationPattern:(id)a3
{
  id v4 = a3;
  [(TKVibrationRecorderContentViewController *)self _stopVibrating];
  [(TKVibratorController *)self->_vibratorController turnOnWithVibrationPattern:v4];
}

- (void)_stopVibrating
{
}

- (void)_storeVibrationComponentOfTypePause:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  [(TLVibrationPattern *)self->_recordedVibrationPattern appendVibrationComponentWithDuration:v3 isPause:v5 - self->_currentVibrationComponentDidStartTimeStamp];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_currentVibrationComponentDidStartTimeStamp = v6;
  self->_isWaitingForEndOfCurrentVibrationComponent = v3;
}

- (void)_eraseCurrentVibrationComponentDidStartTimeStamp
{
  self->_currentVibrationComponentDidStartTimeStamp = 0.0;
}

- (void)vibrationComponentDidStartForVibrationRecorderView:(id)a3
{
  id v4 = a3;
  if (self->_mode == 1)
  {
    id v9 = v4;
    if (self->_recordedVibrationPattern)
    {
      [(TKVibrationRecorderContentViewController *)self _storeVibrationComponentOfTypePause:1];
    }
    else
    {
      double v5 = (TLVibrationPattern *)objc_alloc_init(MEMORY[0x263F7FCA8]);
      recordedVibrationPattern = self->_recordedVibrationPattern;
      self->_recordedVibrationPattern = v5;

      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      self->_currentVibrationComponentDidStartTimeStamp = v7;
      [v9 startAnimatingProgress];
    }
    uint64_t v8 = [(TKVibrationRecorderContentViewController *)self _indefiniteVibrationPattern];
    [(TKVibrationRecorderContentViewController *)self _startVibratingWithVibrationPattern:v8];

    id v4 = v9;
  }
}

- (void)vibrationComponentDidEndForVibrationRecorderView:(id)a3
{
  if (self->_mode == 1)
  {
    [(TKVibrationRecorderContentViewController *)self _storeVibrationComponentOfTypePause:0];
    [(TKVibrationRecorderContentViewController *)self _stopVibrating];
  }
}

- (void)vibrationRecorderView:(id)a3 buttonTappedWithIdentifier:(int)a4
{
  id v6 = a3;
  int mode = self->_mode;
  if (mode == 2)
  {
    if (a4 != 4) {
      goto LABEL_14;
    }
    self->_int mode = 0;
    id v11 = v6;
    [(UIBarButtonItem *)self->_cancelButton setEnabled:1];
    [(UIBarButtonItem *)self->_saveButton setEnabled:1];
    [(TKVibrationRecorderContentViewController *)self _stopVibrating];
    [v11 exitReplayMode];
    [(TKVibrationRecorderContentViewController *)self _accessibilityDidExitReplayMode];
  }
  else if (mode == 1)
  {
    id v11 = v6;
    [(TKVibrationRecorderContentViewController *)self _stopVibrating];
    if (self->_isWaitingForEndOfCurrentVibrationComponent) {
      [(TKVibrationRecorderContentViewController *)self vibrationComponentDidEndForVibrationRecorderView:0];
    }
    [(TKVibrationRecorderContentViewController *)self _eraseCurrentVibrationComponentDidStartTimeStamp];
    BOOL v9 = self->_recordedVibrationPattern != 0;
    [(UIBarButtonItem *)self->_cancelButton setEnabled:1];
    [(UIBarButtonItem *)self->_saveButton setEnabled:v9];
    self->_int mode = 0;
    [v11 exitRecordingModeWithPlayButtonEnabled:v9];
    [(TLVibrationPattern *)self->_recordedVibrationPattern appendVibrationComponentWithDuration:1 isPause:0.5];
    [(TKVibrationRecorderContentViewController *)self _accessibilityDidExitRecordingMode];
  }
  else
  {
    if (mode) {
      goto LABEL_14;
    }
    if (a4 == 1)
    {
      self->_int mode = 1;
      recordedVibrationPattern = self->_recordedVibrationPattern;
      self->_recordedVibrationPattern = 0;
      id v11 = v6;

      [(UIBarButtonItem *)self->_cancelButton setEnabled:0];
      [(UIBarButtonItem *)self->_saveButton setEnabled:0];
      [v11 enterRecordingMode];
      [(TKVibrationRecorderContentViewController *)self _accessibilityDidEnterRecordingMode];
    }
    else
    {
      if (a4 != 3) {
        goto LABEL_14;
      }
      self->_int mode = 2;
      id v11 = v6;
      [(UIBarButtonItem *)self->_cancelButton setEnabled:0];
      [(UIBarButtonItem *)self->_saveButton setEnabled:0];
      [v11 enterReplayModeWithVibrationPattern:self->_recordedVibrationPattern];
      uint64_t v8 = [(TLVibrationPattern *)self->_recordedVibrationPattern propertyListRepresentation];
      [(TKVibrationRecorderContentViewController *)self _startVibratingWithVibrationPattern:v8];

      [(TKVibrationRecorderContentViewController *)self _accessibilityDidEnterReplayMode];
    }
  }
  id v6 = v11;
LABEL_14:
}

- (void)vibrationRecorderViewDidFinishReplayingVibration:(id)a3
{
  self->_int mode = 0;
  [(UIBarButtonItem *)self->_cancelButton setEnabled:1];
  [(UIBarButtonItem *)self->_saveButton setEnabled:1];

  [(TKVibrationRecorderContentViewController *)self _accessibilityDidExitReplayMode];
}

- (BOOL)vibrationRecorderViewDidEnterRecordingMode:(id)a3
{
  id v4 = a3;
  if (self->_mode || self->_recordedVibrationPattern)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 1;
    [(TKVibrationRecorderContentViewController *)self vibrationRecorderView:v4 buttonTappedWithIdentifier:1];
  }

  return v5;
}

- (void)vibrationRecorderView:(id)a3 didExitRecordingModeWithContextObject:(id)a4
{
  id v6 = a4;
  BOOL v5 = [(TLVibrationPattern *)self->_recordedVibrationPattern contextObject];

  if (!v5) {
    [(TLVibrationPattern *)self->_recordedVibrationPattern setContextObject:v6];
  }
}

- (void)vibrationRecorderViewDidReachVibrationRecordingMaximumDuration:(id)a3
{
  if (self->_mode == 1) {
    [(TKVibrationRecorderContentViewController *)self vibrationRecorderView:a3 buttonTappedWithIdentifier:2];
  }
}

- (void)_finishedWithRecorder
{
  [(TKVibrationRecorderView *)self->_vibrationRecorderView stopAnimatingProgress];
  recordedVibrationPattern = self->_recordedVibrationPattern;
  self->_recordedVibrationPattern = 0;

  [(TKVibrationRecorderContentViewController *)self _stopVibrating];
}

- (void)_accessibilityMakeAnnouncementWithStringForLocalizationIdentifier:(id)a3
{
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
  id v4 = a3;
  UIAccessibilityPostNotification(v3, 0);
  TLLocalizedString();
  id argument = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
}

- (void)_accessibilityDidEnterRecordingMode
{
}

- (void)_accessibilityDidExitRecordingMode
{
}

- (void)_accessibilityDidEnterReplayMode
{
}

- (void)_accessibilityDidExitReplayMode
{
}

- (TKVibrationRecorderViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TKVibrationRecorderViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TKVibrationRecorderViewController)parentVibrationRecorderViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentVibrationRecorderViewController);

  return (TKVibrationRecorderViewController *)WeakRetained;
}

- (void)setParentVibrationRecorderViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentVibrationRecorderViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indefiniteVibrationPattern, 0);
  objc_storeStrong((id *)&self->_vibratorController, 0);
  objc_storeStrong((id *)&self->_vibrationNameAlertTextField, 0);
  objc_storeStrong((id *)&self->_vibrationNameAlertSaveAction, 0);
  objc_storeStrong((id *)&self->_vibrationNameAlertController, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_recordedVibrationPattern, 0);

  objc_storeStrong((id *)&self->_vibrationRecorderView, 0);
}

@end