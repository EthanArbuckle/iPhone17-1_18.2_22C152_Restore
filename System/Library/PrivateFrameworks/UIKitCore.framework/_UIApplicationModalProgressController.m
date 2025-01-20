@interface _UIApplicationModalProgressController
+ (id)instanceForScene:(id)a3;
+ (id)sharedInstance;
- (BOOL)_isPresented;
- (BOOL)_shouldAnimatePresentationForIdiom:(int64_t)a3;
- (NSProgress)_progress;
- (NSProgress)urlProgress;
- (NSString)message;
- (NSString)title;
- (NSTimer)_hideTimer;
- (NSTimer)_showTimer;
- (UIAlertController)_alertController;
- (UIViewController)_sourceViewController;
- (UIWindow)_window;
- (_UIApplicationModalProgressController)init;
- (double)_displayStartTime;
- (double)displayDelaySeconds;
- (id)_createSourceWindow;
- (id)_defaultSourceViewControllerCreatingWindowIfNeeded;
- (id)_dismissalHandler;
- (id)_preDisplaySetBlock;
- (id)_sourceScene;
- (void)_callAndClearDismissalHandlerWasDismissedByUser:(BOOL)a3;
- (void)_dismissButtonAction:(id)a3;
- (void)_hideImmediatelyWasDismissedByUser:(BOOL)a3;
- (void)_hideTimerAction:(id)a3;
- (void)_reset;
- (void)_setAlertController:(id)a3;
- (void)_setDismissalHandler:(id)a3;
- (void)_setDisplayStartTime:(double)a3;
- (void)_setHideTimer:(id)a3;
- (void)_setPreDisplayTestBlock:(id)a3;
- (void)_setPresented:(BOOL)a3;
- (void)_setProgress:(id)a3;
- (void)_setShowTimer:(id)a3;
- (void)_setSourceViewController:(id)a3;
- (void)_setWindow:(id)a3;
- (void)_showTimerAction:(id)a3;
- (void)displayForDownloadingURL:(id)a3 copyToURL:(id)a4 sourceViewController:(id)a5 completionHandler:(id)a6;
- (void)displayForDownloadingURL:(id)a3 sourceViewController:(id)a4 completionHandler:(id)a5;
- (void)displayWithTitle:(id)a3 message:(id)a4 progress:(id)a5 buttonTitle:(id)a6 sourceViewController:(id)a7 preDisplayTestBlock:(id)a8 dismissalHandler:(id)a9;
- (void)hideAfterDelay:(double)a3 forceCompletion:(BOOL)a4 replacementDismissalHandler:(id)a5;
- (void)hideAfterMinimumUptimeWithDismissalHandler:(id)a3;
- (void)reconfigureWithTitle:(id)a3 message:(id)a4 progress:(id)a5 buttonTitle:(id)a6 dismissalHandler:(id)a7;
- (void)setDisplayDelaySeconds:(double)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrlProgress:(id)a3;
@end

@implementation _UIApplicationModalProgressController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___UIApplicationModalProgressController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB260190 != -1) {
    dispatch_once(&qword_1EB260190, block);
  }
  v2 = (void *)_MergedGlobals_1013;
  return v2;
}

+ (id)instanceForScene:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = &unk_1E8FF4000;
  id v5 = (id)_progressControllers;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {

    id v9 = 0;
LABEL_18:
    if (!*((void *)v4 + 431))
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v16 = (void *)*((void *)v4 + 431);
      *((void *)v4 + 431) = v15;
    }
    v8 = (id *)objc_alloc_init((Class)objc_opt_class());
    objc_storeWeak(v8 + 3, v3);
    [*((id *)v4 + 431) addObject:v8];
    goto LABEL_21;
  }
  uint64_t v7 = v6;
  v8 = 0;
  id v9 = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v5);
      }
      v12 = *(id **)(*((void *)&v18 + 1) + 8 * i);
      if (!v8 && (id v13 = objc_loadWeakRetained(v12 + 3), v13, v13 == v3))
      {
        v8 = v12;
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained(v12 + 3);

        if (!WeakRetained)
        {
          if (!v9) {
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          [v9 addObject:v12];
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v7);

  v4 = &unk_1E8FF4000;
  if (!v8) {
    goto LABEL_18;
  }
LABEL_21:
  if ([v9 count]) {
    [*((id *)v4 + 431) minusSet:v9];
  }

  return v8;
}

- (_UIApplicationModalProgressController)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIApplicationModalProgressController;
  v2 = [(_UIApplicationModalProgressController *)&v6 init];
  if (v2)
  {
    int v3 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_ModelProgressControllerDisplayDelay, @"ModelProgressControllerDisplayDelay");
    double v4 = *(double *)&qword_1E8FD50A0;
    if (v3) {
      double v4 = 2.0;
    }
    v2->_displayDelaySeconds = v4;
  }
  return v2;
}

- (void)_setShowTimer:(id)a3
{
  id v5 = (NSTimer *)a3;
  showTimer = self->_showTimer;
  p_showTimer = &self->_showTimer;
  objc_super v6 = showTimer;
  if (showTimer != v5)
  {
    id v9 = v5;
    [(NSTimer *)v6 invalidate];
    objc_storeStrong((id *)p_showTimer, a3);
    id v5 = v9;
  }
}

- (void)_setHideTimer:(id)a3
{
  id v5 = (NSTimer *)a3;
  hideTimer = self->_hideTimer;
  p_hideTimer = &self->_hideTimer;
  objc_super v6 = hideTimer;
  if (hideTimer != v5)
  {
    id v9 = v5;
    [(NSTimer *)v6 invalidate];
    objc_storeStrong((id *)p_hideTimer, a3);
    id v5 = v9;
  }
}

- (void)_callAndClearDismissalHandlerWasDismissedByUser:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v6 = _Block_copy(self->_dismissalHandler);
  [(_UIApplicationModalProgressController *)self _setDismissalHandler:0];
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(void *, BOOL))v6 + 2))(v6, v3);
    id v5 = v6;
  }
}

- (void)_reset
{
  id v5 = [(UIViewController *)self->_alertController presentingViewController];
  if (v5 && ![(UIViewController *)self->_alertController isBeingDismissed])
  {
    BOOL v3 = [v5 traitCollection];
    BOOL v4 = -[_UIApplicationModalProgressController _shouldAnimatePresentationForIdiom:](self, "_shouldAnimatePresentationForIdiom:", [v3 userInterfaceIdiom]);

    [v5 dismissViewControllerAnimated:v4 completion:0];
  }
  [(_UIApplicationModalProgressController *)self _setPresented:0];
  [(_UIApplicationModalProgressController *)self _setSourceViewController:0];
  [(UIWindow *)self->_window setHidden:1];
  [(_UIApplicationModalProgressController *)self _setShowTimer:0];
  [(_UIApplicationModalProgressController *)self _setHideTimer:0];
  [(_UIApplicationModalProgressController *)self _setWindow:0];
  [(_UIApplicationModalProgressController *)self _setAlertController:0];
  [(_UIApplicationModalProgressController *)self _setProgress:0];
  [(_UIApplicationModalProgressController *)self _setPreDisplayTestBlock:0];
}

- (void)_hideImmediatelyWasDismissedByUser:(BOOL)a3
{
  if (self->_sourceViewController)
  {
    BOOL v3 = a3;
    [(_UIApplicationModalProgressController *)self _reset];
    [(_UIApplicationModalProgressController *)self _callAndClearDismissalHandlerWasDismissedByUser:v3];
  }
}

- (BOOL)_shouldAnimatePresentationForIdiom:(int64_t)a3
{
  return a3 == 6;
}

- (void)_showTimerAction:(id)a3
{
  if (self->_showTimer == a3)
  {
    [(_UIApplicationModalProgressController *)self _setShowTimer:0];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[_UIApplicationModalProgressController _setDisplayStartTime:](self, "_setDisplayStartTime:");
    preDisplayTestBlock = (uint64_t (**)(void))self->_preDisplayTestBlock;
    if (preDisplayTestBlock && (preDisplayTestBlock[2]() & 1) == 0)
    {
      [(_UIApplicationModalProgressController *)self _reset];
      [(_UIApplicationModalProgressController *)self _callAndClearDismissalHandlerWasDismissedByUser:0];
    }
    else
    {
      [(UIWindow *)self->_window makeKeyAndVisible];
      id v5 = [(UIViewController *)self->_sourceViewController traitCollection];
      BOOL v6 = -[_UIApplicationModalProgressController _shouldAnimatePresentationForIdiom:](self, "_shouldAnimatePresentationForIdiom:", [v5 userInterfaceIdiom]);

      [(UIViewController *)self->_sourceViewController presentViewController:self->_alertController animated:v6 completion:0];
      self->_presented = 1;
    }
  }
}

- (void)_hideTimerAction:(id)a3
{
  if (self->_hideTimer == a3)
  {
    [(_UIApplicationModalProgressController *)self _setHideTimer:0];
    [(_UIApplicationModalProgressController *)self _hideImmediatelyWasDismissedByUser:0];
  }
}

- (void)_dismissButtonAction:(id)a3
{
  if (!self->_disableButtonAction) {
    [(_UIApplicationModalProgressController *)self _hideImmediatelyWasDismissedByUser:1];
  }
}

- (void)hideAfterMinimumUptimeWithDismissalHandler:(id)a3
{
  id v10 = a3;
  BOOL v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_ModelProgressControllerMinimumUptime, @"ModelProgressControllerMinimumUptime") == 0;
  id v5 = v10;
  if (v4) {
    double v6 = *(double *)&qword_1E8FD50B0;
  }
  else {
    double v6 = 1.0;
  }
  if (self->_sourceViewController)
  {
    if (self->_dismissalHandler != v10)
    {
      [(_UIApplicationModalProgressController *)self _callAndClearDismissalHandlerWasDismissedByUser:0];
      [(_UIApplicationModalProgressController *)self _setDismissalHandler:v10];
      id v5 = v10;
    }
    if (!self->_hideTimer)
    {
      [(_UIApplicationModalProgressController *)self _setShowTimer:0];
      if (self->_presented
        && ([MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate],
            double v8 = v7 - self->_displayStartTime,
            v8 < v6))
      {
        id v9 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__hideTimerAction_ selector:0 userInfo:0 repeats:v6 - v8];
        [(_UIApplicationModalProgressController *)self _setHideTimer:v9];
      }
      else
      {
        [(_UIApplicationModalProgressController *)self _hideImmediatelyWasDismissedByUser:0];
      }
      id v5 = v10;
    }
  }
}

- (void)hideAfterDelay:(double)a3 forceCompletion:(BOOL)a4 replacementDismissalHandler:(id)a5
{
  self->_disableButtonAction = 1;
  double v7 = (void *)MEMORY[0x1E4F28F90];
  id v8 = a5;
  id v9 = [v7 discreteProgressWithTotalUnitCount:100];
  [v9 setCompletedUnitCount:100];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressView);
  [WeakRetained setTrackedProgress:v9];

  v11 = _Block_copy(v8);
  if (!v11)
  {
    v11 = _Block_copy(self->_dismissalHandler);
    id dismissalHandler = self->_dismissalHandler;
    self->_id dismissalHandler = 0;
  }
  dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100___UIApplicationModalProgressController_hideAfterDelay_forceCompletion_replacementDismissalHandler___block_invoke;
  v15[3] = &unk_1E52DA160;
  v15[4] = self;
  id v16 = v11;
  id v14 = v11;
  dispatch_after(v13, MEMORY[0x1E4F14428], v15);
}

- (void)reconfigureWithTitle:(id)a3 message:(id)a4 progress:(id)a5 buttonTitle:(id)a6 dismissalHandler:(id)a7
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (self->_sourceViewController)
  {
    v17 = [(UIAlertController *)self->_alertController actions];
    long long v18 = [v17 firstObject];
    long long v19 = [v18 title];
    char v20 = [v19 isEqualToString:v15];

    char v21 = [(NSProgress *)self->_progress isEqual:v14];
    [(_UIApplicationModalProgressController *)self _setProgress:v14];
    if (self->_dismissalHandler != v16)
    {
      [(_UIApplicationModalProgressController *)self _callAndClearDismissalHandlerWasDismissedByUser:0];
      [(_UIApplicationModalProgressController *)self _setDismissalHandler:v16];
    }
    [(UIAlertController *)self->_alertController setTitle:v12];
    [(UIAlertController *)self->_alertController setMessage:v13];
    if ((v20 & 1) == 0)
    {
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __108___UIApplicationModalProgressController_reconfigureWithTitle_message_progress_buttonTitle_dismissalHandler___block_invoke;
      v49[3] = &unk_1E52DC290;
      v49[4] = self;
      v22 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v49];
      alertController = self->_alertController;
      v51[0] = v22;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      [(UIAlertController *)alertController _setActions:v24];
    }
    if ((v21 & 1) == 0)
    {
      id v46 = v15;
      [(UIAlertController *)self->_alertController setContentViewController:0];
      v25 = objc_alloc_init(UIViewController);
      v26 = [(UIViewController *)v25 view];
      [(UIAlertController *)self->_alertController setContentViewController:v25];
      id v47 = v13;
      id v48 = v12;
      id v45 = v16;
      if (v14 && ([v14 isIndeterminate] & 1) == 0)
      {
        v27 = objc_alloc_init(_UIProgressView);
        [(_UIProgressView *)v27 setTrackedProgress:v14];
        objc_storeWeak((id *)&self->_progressView, v27);
      }
      else
      {
        v27 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:100];
        v28 = +[UIColor systemGrayColor];
        [(_UIProgressView *)v27 setColor:v28];

        [(_UIProgressView *)v27 startAnimating];
      }
      [(UIView *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v26 addSubview:v27];
      v44 = [(UIViewController *)v25 _visualStyleOfContainingAlertController];
      [v44 _scaledMarginBelowLastLabelLastBaseline];
      double v30 = v29;
      [(UIViewController *)v25 preferredContentSize];
      double v32 = v31;
      [(UIView *)v27 frame];
      -[UIViewController setPreferredContentSize:](v25, "setPreferredContentSize:", v32, v30 + v33);
      v42 = (void *)MEMORY[0x1E4F5B268];
      v34 = [(UIView *)v27 centerXAnchor];
      v35 = [v26 centerXAnchor];
      [v34 constraintEqualToAnchor:v35 constant:0.0];
      v43 = v25;
      v37 = v36 = v26;
      v50[0] = v37;
      v38 = [(UIView *)v27 topAnchor];
      v39 = [v36 topAnchor];
      v40 = [v38 constraintEqualToAnchor:v39 constant:0.0];
      v50[1] = v40;
      v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
      [v42 activateConstraints:v41];

      id v13 = v47;
      id v12 = v48;
      id v16 = v45;
      id v15 = v46;
    }
  }
}

- (NSString)title
{
  return [(UIViewController *)self->_alertController title];
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return [(UIAlertController *)self->_alertController message];
}

- (void)setMessage:(id)a3
{
}

- (void)displayWithTitle:(id)a3 message:(id)a4 progress:(id)a5 buttonTitle:(id)a6 sourceViewController:(id)a7 preDisplayTestBlock:(id)a8 dismissalHandler:(id)a9
{
  id v23 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  [(_UIApplicationModalProgressController *)self _setPreDisplayTestBlock:a8];
  if (self->_sourceViewController)
  {
    [(_UIApplicationModalProgressController *)self _setHideTimer:0];
    [(_UIApplicationModalProgressController *)self _callAndClearDismissalHandlerWasDismissedByUser:0];
  }
  else
  {
    if (v18)
    {
      [(_UIApplicationModalProgressController *)self _setSourceViewController:v18];
    }
    else
    {
      char v20 = [(_UIApplicationModalProgressController *)self _defaultSourceViewControllerCreatingWindowIfNeeded];
      [(_UIApplicationModalProgressController *)self _setSourceViewController:v20];
    }
    char v21 = +[UIAlertController alertControllerWithTitle:&stru_1ED0E84C0 message:&stru_1ED0E84C0 preferredStyle:1];
    [(_UIApplicationModalProgressController *)self _setAlertController:v21];
  }
  if (!self->_showTimer)
  {
    if (self->_presented)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[_UIApplicationModalProgressController _setDisplayStartTime:](self, "_setDisplayStartTime:");
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__showTimerAction_ selector:0 userInfo:0 repeats:self->_displayDelaySeconds];
      [(_UIApplicationModalProgressController *)self _setShowTimer:v22];
    }
  }
  [(_UIApplicationModalProgressController *)self reconfigureWithTitle:v23 message:v15 progress:v16 buttonTitle:v17 dismissalHandler:v19];
}

- (id)_defaultSourceViewControllerCreatingWindowIfNeeded
{
  BOOL v3 = [(_UIApplicationModalProgressController *)self _createSourceWindow];
  [(_UIApplicationModalProgressController *)self _setWindow:v3];
  BOOL v4 = [v3 rootViewController];

  return v4;
}

- (id)_createSourceWindow
{
  v2 = [(_UIApplicationModalProgressController *)self _sourceScene];
  BOOL v3 = [_UIApplicationModalProgressWindow alloc];
  BOOL v4 = v3;
  if (v2)
  {
    id v5 = [(UIWindow *)v3 initWithWindowScene:v2];
  }
  else
  {
    double v6 = +[UIScreen mainScreen];
    [v6 bounds];
    id v5 = -[_UIApplicationModalProgressWindow initWithFrame:](v4, "initWithFrame:");
  }
  double v7 = objc_alloc_init(UIViewController);
  id v8 = objc_alloc_init(UIView);
  [(UIViewController *)v7 setView:v8];

  [(UIWindow *)v5 setRootViewController:v7];
  return v5;
}

- (id)_sourceScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
  }
  else
  {
    id v5 = [(id)UIApp _defaultSceneIfExists];
    double v6 = +[UIScene _sceneForFBSScene:v5];

    if (v6)
    {
      id v4 = v6;
    }
    else
    {
      double v7 = +[UIWindow _applicationKeyWindow];
      id v4 = [v7 windowScene];
    }
  }

  return v4;
}

- (void)displayForDownloadingURL:(id)a3 sourceViewController:(id)a4 completionHandler:(id)a5
{
}

- (void)displayForDownloadingURL:(id)a3 copyToURL:(id)a4 sourceViewController:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v94[0] = 0;
  LOBYTE(a6) = [v9 getPromisedItemResourceValue:v94 forKey:*MEMORY[0x1E4F1C6C8] error:0];
  id v13 = v94[0];
  v53 = v11;
  if ((a6 & 1) == 0)
  {
    uint64_t v14 = [v9 lastPathComponent];

    id v13 = (id)v14;
  }
  id v93 = 0;
  uint64_t v15 = *MEMORY[0x1E4F1C5F8];
  id v92 = 0;
  int v16 = [v9 getPromisedItemResourceValue:&v93 forKey:v15 error:&v92];
  id v17 = v93;
  id v18 = v92;
  v49 = v18;
  v50 = v17;
  id v48 = v10;
  if (v16)
  {
    uint64_t v19 = [v17 unsignedIntegerValue];
  }
  else
  {
    NSLog(&cfstr_CouldnTGetFile.isa, v9, v18);
    uint64_t v19 = 0;
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
  char v21 = NSString;
  v22 = _UIKitBundle();
  id v23 = [v22 localizedStringForKey:@"Downloading \"%@\" value:@"Downloading a Copy of “%@”" table:@"Localizable""];
  uint64_t v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v13);

  v25 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x2020000000;
  char v91 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__63;
  v88 = __Block_byref_object_dispose__63;
  id v89 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke;
  aBlock[3] = &unk_1E52EA650;
  v82 = v90;
  id v47 = v20;
  id v80 = v47;
  id v26 = v12;
  id v81 = v26;
  v83 = &v84;
  v27 = _Block_copy(aBlock);
  v52 = (void *)v24;
  [(_UIApplicationModalProgressController *)self displayWithTitle:v24 message:0 progress:0 buttonTitle:v25 sourceViewController:v53 preDisplayTestBlock:0 dismissalHandler:v27];
  if (v19)
  {
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_2;
    v78[3] = &unk_1E52EA678;
    v78[4] = self;
    v28 = [MEMORY[0x1E4F28F90] _addSubscriberForFileURL:v9 withPublishingHandler:v78];
    double v29 = [MEMORY[0x1E4F28B68] stringFromByteCount:v19 countStyle:0];
    double v30 = _UINSLocalizedStringWithDefaultValue(@"%@ of %@ downloaded", @"%@ of %@ downloaded");
    double v31 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:self path:"urlProgress.fractionCompleted"];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_4;
    v70[3] = &unk_1E52EA6C8;
    uint64_t v77 = v19;
    id v32 = v30;
    id v71 = v32;
    id v33 = v29;
    id v72 = v33;
    v73 = self;
    id v74 = v52;
    id v75 = v25;
    id v76 = v27;
    v34 = [v31 addObserverBlock:v70];

    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_6;
    v65[3] = &unk_1E52EA6F0;
    id v66 = v34;
    v67 = self;
    id v68 = v28;
    v69 = &v84;
    id v35 = v28;
    id v36 = v34;
    v37 = _Block_copy(v65);
    v38 = (void *)v85[5];
    v85[5] = (uint64_t)v37;
  }
  v39 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_7;
  block[3] = &unk_1E52EA7B0;
  id v55 = v48;
  id v56 = v47;
  v63 = v90;
  v64 = &v84;
  id v57 = v9;
  v58 = self;
  id v59 = v52;
  id v60 = v25;
  id v61 = v27;
  id v62 = v26;
  id v40 = v26;
  id v41 = v27;
  id v42 = v25;
  id v43 = v52;
  id v44 = v9;
  id v45 = v47;
  id v46 = v48;
  dispatch_async(v39, block);

  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(v90, 8);
}

- (double)displayDelaySeconds
{
  return self->_displayDelaySeconds;
}

- (void)setDisplayDelaySeconds:(double)a3
{
  self->_displayDelaySeconds = a3;
}

- (BOOL)_isPresented
{
  return self->_presented;
}

- (void)_setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (UIWindow)_window
{
  return self->_window;
}

- (void)_setWindow:(id)a3
{
}

- (UIViewController)_sourceViewController
{
  return self->_sourceViewController;
}

- (void)_setSourceViewController:(id)a3
{
}

- (UIAlertController)_alertController
{
  return self->_alertController;
}

- (void)_setAlertController:(id)a3
{
}

- (id)_dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)_setDismissalHandler:(id)a3
{
}

- (id)_preDisplaySetBlock
{
  return self->_preDisplayTestBlock;
}

- (void)_setPreDisplayTestBlock:(id)a3
{
}

- (NSProgress)_progress
{
  return self->_progress;
}

- (void)_setProgress:(id)a3
{
}

- (NSTimer)_showTimer
{
  return self->_showTimer;
}

- (NSTimer)_hideTimer
{
  return self->_hideTimer;
}

- (double)_displayStartTime
{
  return self->_displayStartTime;
}

- (void)_setDisplayStartTime:(double)a3
{
  self->_displayStartTime = a3;
}

- (NSProgress)urlProgress
{
  return self->_urlProgress;
}

- (void)setUrlProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlProgress, 0);
  objc_storeStrong((id *)&self->_hideTimer, 0);
  objc_storeStrong((id *)&self->_showTimer, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_preDisplayTestBlock, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_weakScene);
  objc_destroyWeak((id *)&self->_progressView);
}

@end