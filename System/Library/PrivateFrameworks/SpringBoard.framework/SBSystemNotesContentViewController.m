@interface SBSystemNotesContentViewController
- (BOOL)_hitTestTouch:(id)a3 gestureRecognizer:(id)a4;
- (BOOL)_updateForegroundStatus:(BOOL)a3;
- (BOOL)containerViewController:(id)a3 shouldHandleStashingForTransitionContext:(id)a4;
- (BOOL)sceneHandle:(id)a3 didReceiveAction:(id)a4;
- (BOOL)shouldAutorotate;
- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5;
- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4;
- (CGRect)_sceneFrame;
- (CGSize)preferredContentSize;
- (NSString)bundleIdentifier;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (SBSSystemNotesPresentationConfiguration)currentConfiguration;
- (SBSystemNotesContentViewController)initWithSceneHandle:(id)a3 workspace:(id)a4 transientUIInteractionManager:(id)a5 notesInteractionSettings:(id)a6 presentationContext:(id)a7;
- (SBSystemNotesContentViewControllerDelegate)delegate;
- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3;
- (id)_imageFromUserActivity:(id)a3 presentationMode:(int64_t)a4;
- (id)_sbWindowSceneForSceneHandle:(id)a3;
- (id)_thumbnailViewForUserActivity:(id)a3;
- (id)contentView;
- (id)layoutStateForApplicationTransitionContext:(id)a3;
- (id)previousLayoutStateForApplicationTransitionContext:(id)a3;
- (id)styleForRegion:(id)a3 forView:(id)a4;
- (int64_t)presentationMode;
- (unint64_t)_sendActionForUpdatedConfiguration:(id)a3 sendCreateIfNecessary:(BOOL)a4;
- (unint64_t)updateConfiguration:(id)a3 sendCreateActionIfNecessary:(BOOL)a4;
- (void)_acquireTraitsParticipantOnWindowSceneIfNecessary:(id)a3;
- (void)_handleThumbnailTapGesture:(id)a3;
- (void)_invalidateTraitsParticipant;
- (void)_setBlurred:(BOOL)a3;
- (void)_setPreferredSceneContentSize:(CGSize)a3;
- (void)_updateSceneFrameWithCompletion:(id)a3;
- (void)containerViewController:(id)a3 didSettleOnStashState:(BOOL)a4;
- (void)containerViewControllerDidEndInteraction:(id)a3 targetWindowScene:(id)a4;
- (void)containerViewControllerDidEndSizeChange:(id)a3;
- (void)containerViewControllerWillBeginSizeChange:(id)a3 behavior:(int)a4;
- (void)dealloc;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPresentationMode:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SBSystemNotesContentViewController

- (SBSystemNotesContentViewController)initWithSceneHandle:(id)a3 workspace:(id)a4 transientUIInteractionManager:(id)a5 notesInteractionSettings:(id)a6 presentationContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)SBSystemNotesContentViewController;
  v17 = [(SBSystemNotesContentViewController *)&v26 initWithNibName:0 bundle:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_workspace, a4);
    objc_storeStrong((id *)&v18->_notesInteractionSettings, a6);
    objc_storeStrong((id *)&v18->_transientUIInteractionManager, a5);
    v18->_preferredSceneContentSize.width = SBSystemNotesDefaultWindowSize();
    v18->_preferredSceneContentSize.height = v19;
    [v12 addObserver:v18];
    [v12 addActionConsumer:v18];
    v20 = [[SBDeviceApplicationSceneViewController alloc] initWithSceneHandle:v12];
    sceneViewController = v18->_sceneViewController;
    v18->_sceneViewController = v20;

    [(SBDeviceApplicationSceneViewController *)v18->_sceneViewController setHomeGrabberDisplayMode:1];
    [(SBDeviceApplicationSceneViewController *)v18->_sceneViewController setDisplayMode:4 animationFactory:0 completion:0];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v18 action:sel__handleThumbnailTapGesture_];
    thumbnailTapGestureRecognizer = v18->_thumbnailTapGestureRecognizer;
    v18->_thumbnailTapGestureRecognizer = (UITapGestureRecognizer *)v22;

    [(UITapGestureRecognizer *)v18->_thumbnailTapGestureRecognizer setAllowedTouchTypes:&unk_1F33481E0];
    objc_storeStrong((id *)&v18->_presentationContext, a7);
    v24 = [(SBSystemNotesContentPresentationContext *)v18->_presentationContext requestedConfiguration];
    [(SBSystemNotesContentViewController *)v18 updateConfiguration:v24 sendCreateActionIfNecessary:1];
  }
  return v18;
}

- (void)dealloc
{
  if ([(SBSystemNotesContentViewController *)self isViewLoaded])
  {
    [(SBDeviceApplicationSceneViewController *)self->_sceneViewController willMoveToParentViewController:0];
    v3 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
    [v3 removeFromSuperview];

    [(SBDeviceApplicationSceneViewController *)self->_sceneViewController removeFromParentViewController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
    v5 = [(SBNubView *)self->_nubView contentView];
    [WeakRetained unregisterView:v5];
  }
  [(SBSystemNotesContentViewController *)self _invalidateTraitsParticipant];
  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController invalidate];
  [(SBTransientUIInteractionManager *)self->_transientUIInteractionManager unregisterParticipantForTapToDismiss:self];
  [(BSAbsoluteMachTimer *)self->_thumbnailCooldownTimer invalidate];
  v6.receiver = self;
  v6.super_class = (Class)SBSystemNotesContentViewController;
  [(SBSystemNotesContentViewController *)&v6 dealloc];
}

- (id)contentView
{
  return (id)[(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)SBSystemNotesContentViewController;
  [(SBSystemNotesContentViewController *)&v18 viewDidLoad];
  v3 = [(SBSystemNotesContentViewController *)self view];
  v4 = [v3 layer];
  [v4 setAllowsGroupOpacity:1];

  [v3 setClipsToBounds:1];
  [v3 addGestureRecognizer:self->_thumbnailTapGestureRecognizer];
  [v3 setAccessibilityIdentifier:@"system-notes-content-view"];
  v5 = [v3 layer];
  [v5 setBorderWidth:1.0];
  id v6 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.15];
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

  [v3 addSubview:self->_thumbnailView];
  [(UIView *)self->_thumbnailView setContentMode:0];
  [(UIView *)self->_thumbnailView setOpaque:0];
  [(UIView *)self->_thumbnailView setAccessibilityIdentifier:@"system-notes-thumbnail-view"];
  [(SBSystemNotesContentViewController *)self addChildViewController:self->_sceneViewController];
  v7 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
  v8 = [v7 layer];
  [v8 setAllowsGroupOpacity:1];

  [v3 addSubview:v7];
  [v7 setOpaque:0];
  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController didMoveToParentViewController:self];
  v9 = [SBSystemNotesBackgroundView alloc];
  [v7 bounds];
  v10 = -[SBSystemNotesBackgroundView initWithFrame:](v9, "initWithFrame:");
  [(SBDeviceApplicationSceneViewController *)self->_sceneViewController setBackgroundView:v10];
  v11 = [SBNubView alloc];
  id v12 = [(SBSceneViewController *)self->_sceneViewController sceneHandle];
  id v13 = [(SBNubView *)v11 initWithDeviceApplicationSceneHandle:v12];
  nubView = self->_nubView;
  self->_nubView = v13;

  id v15 = [(SBNubView *)self->_nubView layer];
  [v15 setHitTestsAsOpaque:1];

  [(SBNubView *)self->_nubView setHighlighted:0];
  [v7 addSubview:self->_nubView];
  [(SBNubView *)self->_nubView setAccessibilityIdentifier:@"system-notes-nub-view"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
  v17 = [(SBNubView *)self->_nubView contentView];
  [WeakRetained registerView:v17 delegate:self];

  [v3 bringSubviewToFront:self->_thumbnailView];
}

- (void)viewWillLayoutSubviews
{
  v3 = [(SBSystemNotesContentViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = v8 - SBSystemNotesThumbnailSize();
  double v13 = SBSystemNotesMinimumWindowSize();
  double v14 = v12 / (v13 - SBSystemNotesThumbnailSize());
  if (v14 < 0.0) {
    double v14 = 0.0;
  }
  double v15 = fmin(v14, 1.0);
  -[UIView setFrame:](self->_thumbnailView, "setFrame:", v5, v7, v9, v11);
  -[SBApplicationBlurContentView setFrame:](self->_blurView, "setFrame:", v5, v7, v9, v11);
  id v16 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
  [v3 bounds];
  UIRectGetCenter();
  objc_msgSend(v16, "setCenter:");
  double width = self->_preferredSceneContentSize.width;
  double height = self->_preferredSceneContentSize.height;
  objc_msgSend(v16, "setBounds:", 0.0, 0.0, width, height);
  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeScale(&v28, v9 / width, v11 / height);
  CGAffineTransform v27 = v28;
  [v16 setTransform:&v27];
  +[SBNubView height];
  -[SBNubView setFrame:](self->_nubView, "setFrame:", 0.0, 0.0, width, v19);
  double v20 = SBSystemNotesThumbnailCornerRadius();
  double v21 = SBSystemNotesWindowCornerRadius();
  if (v20 >= v21) {
    double v22 = v21;
  }
  else {
    double v22 = v20;
  }
  if (v20 >= v21) {
    double v21 = v20;
  }
  [v3 _setContinuousCornerRadius:v22 + (v21 - v22) * v15];
  [(UIView *)self->_thumbnailView setAlpha:1.0 - v15];
  if (BSFloatLessThanOrEqualToFloat())
  {
    [v16 setHidden:1];
    thumbnailView = self->_thumbnailView;
LABEL_12:
    uint64_t v25 = 0;
    goto LABEL_13;
  }
  int v24 = BSFloatGreaterThanOrEqualToFloat();
  [v16 setHidden:0];
  thumbnailView = self->_thumbnailView;
  if (!v24) {
    goto LABEL_12;
  }
  uint64_t v25 = 1;
LABEL_13:
  [(UIView *)thumbnailView setHidden:v25];
  objc_super v26 = [v3 _sbWindowScene];
  [(SBSystemNotesContentViewController *)self _acquireTraitsParticipantOnWindowSceneIfNecessary:v26];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBSystemNotesContentViewController;
  [(SBSystemNotesContentViewController *)&v6 viewWillAppear:a3];
  double v4 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController statusBarAssertionWithStatusBarHidden:1 atLevel:0];
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBSystemNotesContentViewController;
  [(SBSystemNotesContentViewController *)&v11 viewDidAppear:a3];
  double v5 = SBLogSystemNotes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(SBSystemNotesContentViewController *)(id *)&self->super.super.super.isa viewDidAppear:v5];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
  double v7 = [(UIViewController *)self _sbWindowScene];
  id v8 = [v7 systemPointerInteractionManager];

  if (WeakRetained != v8)
  {
    double v9 = [(SBNubView *)self->_nubView contentView];
    [WeakRetained unregisterView:v9];

    objc_storeWeak((id *)&self->_systemPointerInteractionManager, v8);
    double v10 = [(SBNubView *)self->_nubView contentView];
    [v8 registerView:v10 delegate:self];
  }
  if (![(SBSystemNotesContentViewController *)self presentationMode]) {
    [(SBSystemNotesContentViewController *)self _updateForegroundStatus:1];
  }
  [(SBTransientUIInteractionManager *)self->_transientUIInteractionManager registerParticipantForTapToDismiss:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSystemNotesContentViewController;
  [(SBSystemNotesContentViewController *)&v4 viewWillDisappear:a3];
  [(SBTransientUIInteractionManager *)self->_transientUIInteractionManager unregisterParticipantForTapToDismiss:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSystemNotesContentViewController;
  [(SBSystemNotesContentViewController *)&v5 viewDidDisappear:a3];
  [(SBSceneViewStatusBarAssertion *)self->_statusBarAssertion invalidate];
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = 0;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSystemNotesContentViewController;
  id v6 = a3;
  [(SBSystemNotesContentViewController *)&v13 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  double v7 = objc_msgSend(v6, "_sbWindowScene", v13.receiver, v13.super_class);
  [(SBSystemNotesContentViewController *)self _acquireTraitsParticipantOnWindowSceneIfNecessary:v7];

  traitsParticipantDelegate = self->_traitsParticipantDelegate;
  double v9 = NSNumber;
  [v6 windowLevel];
  double v11 = v10;

  double v12 = [v9 numberWithDouble:v11];
  [(SBTraitsSceneParticipantDelegate *)traitsParticipantDelegate setPreferredSceneLevel:v12];
}

- (void)_acquireTraitsParticipantOnWindowSceneIfNecessary:(id)a3
{
  id v4 = a3;
  if (!self->_traitsParticipant
    || (id v5 = objc_loadWeakRetained((id *)&self->_lastKnownWindowScene), v5, v5 != v4))
  {
    objc_storeWeak((id *)&self->_lastKnownWindowScene, v4);
    id v6 = [v4 traitsArbiter];
    objc_storeWeak((id *)&self->_arbiter, v6);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [(SBSystemNotesContentViewController *)self _invalidateTraitsParticipant];
    if (WeakRetained)
    {
      id v8 = [SBTraitsSceneParticipantDelegate alloc];
      double v9 = [(SBSceneViewController *)self->_sceneViewController sceneHandle];
      double v10 = [(SBTraitsSceneParticipantDelegate *)v8 initWithSceneHandle:v9];
      traitsParticipantDelegate = self->_traitsParticipantDelegate;
      self->_traitsParticipantDelegate = v10;

      double v12 = [WeakRetained acquireParticipantWithRole:@"SBTraitsParticipantRolePictureInPicture" delegate:self->_traitsParticipantDelegate];
      traitsParticipant = self->_traitsParticipant;
      self->_traitsParticipant = v12;

      [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate setArbiter:WeakRetained];
      [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate setParticipant:self->_traitsParticipant];
      objc_initWeak(&location, self);
      double v14 = self->_traitsParticipantDelegate;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __88__SBSystemNotesContentViewController__acquireTraitsParticipantOnWindowSceneIfNecessary___block_invoke;
      v18[3] = &unk_1E6B08298;
      objc_copyWeak(&v19, &location);
      [(SBTraitsSceneParticipantDelegate *)v14 setActuateOrientationSettingsAlongsideBlock:v18];
      double v15 = self->_traitsParticipantDelegate;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __88__SBSystemNotesContentViewController__acquireTraitsParticipantOnWindowSceneIfNecessary___block_invoke_2;
      v16[3] = &unk_1E6AF9470;
      objc_copyWeak(&v17, &location);
      [(SBTraitsSceneParticipantDelegate *)v15 setActuateOrientationAlongsideBlock:v16];
      [(TRAParticipant *)self->_traitsParticipant setNeedsUpdatePreferencesWithReason:@"setup" animate:0];
      [(SBDeviceApplicationSceneViewController *)self->_sceneViewController containerDidUpdateTraitsParticipant:self->_traitsParticipant];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

void __88__SBSystemNotesContentViewController__acquireTraitsParticipantOnWindowSceneIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _sceneFrame];
    objc_msgSend(v5, "setFrame:");
  }
}

void __88__SBSystemNotesContentViewController__acquireTraitsParticipantOnWindowSceneIfNecessary___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v2 = objc_msgSend(WeakRetained[146], "sbf_currentOrientation");
    id v3 = v6[123];
    [v6 _sceneFrame];
    objc_msgSend(v3, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v2, v2, v4, v5);
    id WeakRetained = v6;
  }
}

- (void)_invalidateTraitsParticipant
{
  [(SBTraitsSceneParticipantDelegate *)self->_traitsParticipantDelegate invalidate];
  [(TRAParticipant *)self->_traitsParticipant invalidate];
  traitsParticipantDelegate = self->_traitsParticipantDelegate;
  self->_traitsParticipantDelegate = 0;

  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;
}

- (id)_sbWindowSceneForSceneHandle:(id)a3
{
  id v3 = (void *)SBApp;
  id v4 = a3;
  double v5 = [v3 windowSceneManager];
  id v6 = [v4 displayIdentity];

  double v7 = [v5 windowSceneForDisplayIdentity:v6];

  return v7;
}

- (int64_t)presentationMode
{
  currentConfiguration = self->_currentConfiguration;
  if (currentConfiguration) {
    return [(SBSSystemNotesPresentationConfiguration *)currentConfiguration preferredPresentationMode];
  }
  else {
    return -1;
  }
}

- (void)setPresentationMode:(int64_t)a3
{
  currentConfiguration = self->_currentConfiguration;
  if (currentConfiguration)
  {
    id v5 = [(SBSSystemNotesPresentationConfiguration *)currentConfiguration presentationConfigurationWithPreferredPresentationMode:a3];
    [(SBSystemNotesContentViewController *)self updateConfiguration:v5 sendCreateActionIfNecessary:1];
  }
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(SBSSystemNotesPresentationConfiguration *)self->_currentConfiguration sceneBundleIdentifier];
}

- (CGSize)preferredContentSize
{
  int64_t v4 = [(SBSystemNotesContentViewController *)self presentationMode];
  if (v4)
  {
    if (v4 == 1)
    {
      double v5 = SBSystemNotesThumbnailSize();
    }
    else
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = SBSSystemNotesPresentationModeDescription();
      [v7 handleFailureInMethod:a2, self, @"SBSystemNotesContentViewController.m", 362, @"invalid mode: %@", v8 object file lineNumber description];

      double v5 = *MEMORY[0x1E4F1DB30];
      double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
  }
  else
  {
    double v5 = SBSystemNotesDefaultWindowSize();
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (SBSSystemNotesPresentationConfiguration)currentConfiguration
{
  return self->_currentConfiguration;
}

- (unint64_t)updateConfiguration:(id)a3 sendCreateActionIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  int64_t v9 = [(SBSystemNotesContentViewController *)self presentationMode];
  p_currentConfiguration = &self->_currentConfiguration;
  uint64_t v11 = SBSDiffSystemNotesPresentationConfigurations();
  if (v11)
  {
    char v12 = v11;
    if ((v11 & 1) != 0 && *p_currentConfiguration)
    {
      v49 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v48 = objc_opt_class();
      v46 = [(SBSSystemNotesPresentationConfiguration *)*p_currentConfiguration sceneBundleIdentifier];
      v47 = [v8 sceneBundleIdentifier];
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSystemNotesContentViewController.m", 379, @"%@ can't update configuration for different bundleID. our bundleID: %@; new bundleID: %@",
        v48,
        v46,
        v47);
    }
    objc_storeStrong((id *)&self->_currentConfiguration, a3);
    if ((v12 & 4) != 0)
    {
      objc_super v13 = [(SBSSystemNotesPresentationConfiguration *)*p_currentConfiguration userActivity];
      double v14 = [(SBSystemNotesContentViewController *)self _thumbnailViewForUserActivity:v13];

      if (self->_thumbnailView) {
        BOOL v15 = v9 == 1;
      }
      else {
        BOOL v15 = 0;
      }
      if (v15 && ([(SBSystemNotesContentViewController *)self isViewLoaded] & 1) != 0)
      {
        id v16 = [MEMORY[0x1E4FA7940] crossfadeViewWithStartView:self->_thumbnailView endView:v14 translucent:0];
        objc_storeStrong((id *)&self->_thumbnailView, v14);
        id v17 = [(SBSystemNotesContentViewController *)self view];
        [v17 bounds];
        objc_msgSend(v16, "setFrame:");
        [v17 addSubview:v16];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __86__SBSystemNotesContentViewController_updateConfiguration_sendCreateActionIfNecessary___block_invoke;
        v53[3] = &unk_1E6AF4E00;
        v53[4] = self;
        id v54 = v17;
        id v55 = v16;
        id v18 = v16;
        id v19 = v17;
        [v18 crossfadeWithCompletion:v53];
      }
      else
      {
        objc_storeStrong((id *)&self->_thumbnailView, v14);
      }
      double v20 = [(SBSSystemNotesPresentationConfiguration *)*p_currentConfiguration userActivity];
      double v21 = [(SBSystemNotesContentViewController *)self _imageFromUserActivity:v20 presentationMode:0];

      placeholderProvider = self->_placeholderProvider;
      if (placeholderProvider)
      {
        [(SBSystemNotesPlaceholderContentProvider *)placeholderProvider setSnapshot:v21];
      }
      else
      {
        v23 = [[SBSystemNotesPlaceholderContentProvider alloc] initWithSnapshot:v21];
        int v24 = self->_placeholderProvider;
        self->_placeholderProvider = v23;

        uint64_t v25 = [(SBSceneViewController *)self->_sceneViewController sceneHandle];
        [v25 setPlaceholderContentProvider:self->_placeholderProvider];
      }
    }
    uint64_t v26 = [v8 preferredPresentationMode];
    if ((v12 & 2) != 0)
    {
      uint64_t v27 = v26;
      [(BSAbsoluteMachTimer *)self->_thumbnailCooldownTimer cancel];
      self->_thumbnailCooldownTimerFired = 0;
      if (v27)
      {
        if (v27 == 1)
        {
          if (!self->_thumbnailCooldownTimer)
          {
            CGAffineTransform v28 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBSystemNotesConventViewController.thumbnailCooldown"];
            thumbnailCooldownTimer = self->_thumbnailCooldownTimer;
            self->_thumbnailCooldownTimer = v28;
          }
          objc_initWeak(&location, self);
          v30 = self->_thumbnailCooldownTimer;
          [(SBSystemNotesInteractionSettings *)self->_notesInteractionSettings delayBeforeUserInteractionDismissesThumbnail];
          double v32 = v31;
          uint64_t v33 = MEMORY[0x1E4F14428];
          id v34 = MEMORY[0x1E4F14428];
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __86__SBSystemNotesContentViewController_updateConfiguration_sendCreateActionIfNecessary___block_invoke_2;
          v50[3] = &unk_1E6AF5838;
          objc_copyWeak(&v51, &location);
          [(BSAbsoluteMachTimer *)v30 scheduleWithFireInterval:v33 leewayInterval:v50 queue:v32 handler:0.05];

          objc_destroyWeak(&v51);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        switch([(SBSystemNotesContentPresentationContext *)self->_presentationContext source])
        {
          case 2uLL:
            [MEMORY[0x1E4FA9278] logActivationEvent:*MEMORY[0x1E4FA92A8]];
            v35 = SBLogSystemNotes();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
              -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:]();
            }

            v36 = [(SBSSystemNotesPresentationConfiguration *)*p_currentConfiguration userActivity];
            if (v36)
            {
              [MEMORY[0x1E4FA9230] didActivateBacklinkItemWithUserActivity:v36];
              v37 = SBLogSystemNotes();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
                -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:]();
              }
            }
            goto LABEL_43;
          case 4uLL:
            v38 = [(SBSystemNotesContentPresentationContext *)self->_presentationContext positionConfiguration];
            char v39 = [v38 edgeProtectEnabled];

            if (v39)
            {
              objc_storeStrong((id *)&self->_pendingAnalyticsString, (id)*MEMORY[0x1E4FA92C0]);
              v36 = SBLogSystemNotes();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:]();
              }
            }
            else
            {
              [MEMORY[0x1E4FA9278] logActivationEvent:*MEMORY[0x1E4FA92C0]];
              v36 = SBLogSystemNotes();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:].cold.4();
              }
            }
            goto LABEL_43;
          case 5uLL:
            v40 = [(SBSystemNotesContentPresentationContext *)self->_presentationContext positionConfiguration];
            char v41 = [v40 edgeProtectEnabled];

            if (v41)
            {
              objc_storeStrong((id *)&self->_pendingAnalyticsString, (id)*MEMORY[0x1E4FA92B8]);
              v36 = SBLogSystemNotes();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:].cold.5();
              }
            }
            else
            {
              [MEMORY[0x1E4FA9278] logActivationEvent:*MEMORY[0x1E4FA92B8]];
              v36 = SBLogSystemNotes();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:].cold.6();
              }
            }
            goto LABEL_43;
          case 6uLL:
            [MEMORY[0x1E4FA9278] logActivationEvent:*MEMORY[0x1E4FA92B0]];
            v36 = SBLogSystemNotes();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
              -[SBSystemNotesContentViewController updateConfiguration:sendCreateActionIfNecessary:].cold.7();
            }
LABEL_43:

            break;
          default:
            break;
        }
        [(SBSystemNotesContentViewController *)self _updateForegroundStatus:1];
      }
      v42 = [(SBSystemNotesContentViewController *)self viewIfLoaded];
      [v42 setNeedsLayout];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained contentViewController:self didChangeToPresentationMode:v27];
    }
  }
  if (v9) {
    unint64_t v44 = 0;
  }
  else {
    unint64_t v44 = [(SBSystemNotesContentViewController *)self _sendActionForUpdatedConfiguration:*p_currentConfiguration sendCreateIfNecessary:v4];
  }

  return v44;
}

uint64_t __86__SBSystemNotesContentViewController_updateConfiguration_sendCreateActionIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1024);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v2, "setFrame:");
  [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(a1 + 32) + 1024)];
  [*(id *)(a1 + 48) removeFromSuperview];
  id v3 = *(void **)(a1 + 40);
  return [v3 setNeedsLayout];
}

void __86__SBSystemNotesContentViewController_updateConfiguration_sendCreateActionIfNecessary___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[1136] = 1;
  }
}

- (unint64_t)_sendActionForUpdatedConfiguration:(id)a3 sendCreateIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(SBSceneViewController *)self->_sceneViewController sceneHandle];
  id v8 = [v7 sceneIfExists];
  if (v8)
  {
    uint64_t v9 = [v6 userActivity];
    double v10 = v9;
    if (!v4 || v9)
    {
      if (!v9)
      {
        unint64_t v13 = 0;
LABEL_17:
        double v14 = SBLogSystemNotes();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[SBSystemNotesContentViewController _sendActionForUpdatedConfiguration:sendCreateIfNecessary:]();
        }
        goto LABEL_19;
      }
      BOOL v15 = SBLogSystemNotes();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "sending UIUserActivityContinuationAction to remote scene", v18, 2u);
      }

      double v14 = [v6 _uiActivityContinuationAction];
      unint64_t v13 = 2;
      if (!v14) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v11 = SBLogSystemNotes();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "sending SBSSystemNotesCreateAction to remote scene", buf, 2u);
      }

      char v12 = [MEMORY[0x1E4F4F670] responderWithHandler:&__block_literal_global_268];
      objc_msgSend(v12, "setTimeout:", dispatch_time(0, 2000000000));
      unint64_t v13 = 1;
      double v14 = [objc_alloc(MEMORY[0x1E4FA6C58]) initWithReason:1 responder:v12];

      if (!v14) {
        goto LABEL_17;
      }
    }
    id v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
    [v8 sendActions:v16];

LABEL_19:
    goto LABEL_20;
  }
  double v10 = SBLogSystemNotes();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SBSystemNotesContentViewController _sendActionForUpdatedConfiguration:sendCreateIfNecessary:]();
  }
  unint64_t v13 = 0;
LABEL_20:

  return v13;
}

void __95__SBSystemNotesContentViewController__sendActionForUpdatedConfiguration_sendCreateIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];
  if (v3)
  {
    BOOL v4 = SBLogSystemNotes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __95__SBSystemNotesContentViewController__sendActionForUpdatedConfiguration_sendCreateIfNecessary___block_invoke_cold_1();
    }
  }
}

- (void)_setBlurred:(BOOL)a3
{
  blurView = self->_blurView;
  if (a3)
  {
    if (!blurView)
    {
      id v20 = [(SBSystemNotesContentViewController *)self view];
      double v5 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
      id v6 = [(SBSceneViewController *)self->_sceneViewController sceneHandle];
      double v7 = [v6 application];
      id v8 = [v7 bundleIdentifier];

      uint64_t v9 = [SBApplicationBlurContentView alloc];
      [v20 bounds];
      double v10 = -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:](v9, "initWithFrame:bundleIdentifier:targetViewToBlur:", v8, v5);
      uint64_t v11 = self->_blurView;
      self->_blurView = v10;

      char v12 = [MEMORY[0x1E4F4F898] factoryWithDuration:0.25];
      [(SBApplicationBlurContentView *)self->_blurView generateAndAnimateToBlurredSnapshotWithAnimationFactory:v12 completion:0];
      [(SBApplicationBlurContentView *)self->_blurView setClipsToBounds:1];
      unint64_t v13 = [(SBApplicationBlurContentView *)self->_blurView layer];
      [v13 setAllowsGroupOpacity:1];

      double v14 = [(SBApplicationBlurContentView *)self->_blurView iconView];
      [v14 setHidden:1];

      [v20 addSubview:self->_blurView];
    }
  }
  else if (blurView)
  {
    BOOL v15 = blurView;
    id v16 = self->_blurView;
    self->_blurView = 0;

    id v17 = [MEMORY[0x1E4F4F898] factoryWithDuration:0.25];
    id v18 = (void *)MEMORY[0x1E4F4F898];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __50__SBSystemNotesContentViewController__setBlurred___block_invoke;
    v23[3] = &unk_1E6AF4AC0;
    int v24 = v15;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__SBSystemNotesContentViewController__setBlurred___block_invoke_2;
    v21[3] = &unk_1E6AF5350;
    double v22 = v24;
    id v19 = v24;
    [v18 animateWithFactory:v17 options:4 actions:v23 completion:v21];
  }
}

uint64_t __50__SBSystemNotesContentViewController__setBlurred___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __50__SBSystemNotesContentViewController__setBlurred___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return (SBDeviceApplicationSceneHandle *)[(SBSceneViewController *)self->_sceneViewController sceneHandle];
}

- (void)containerViewController:(id)a3 didSettleOnStashState:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    p_pendingAnalyticsString = &self->_pendingAnalyticsString;
    if (self->_pendingAnalyticsString)
    {
      objc_msgSend(MEMORY[0x1E4FA9278], "logActivationEvent:");
      id v8 = SBLogSystemNotes();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[SBSystemNotesContentViewController containerViewController:didSettleOnStashState:]((uint64_t *)&self->_pendingAnalyticsString, v8);
      }

      uint64_t v9 = *p_pendingAnalyticsString;
      *p_pendingAnalyticsString = 0;
    }
    if (([v6 isStashed] & 1) == 0) {
      [(SBSystemNotesContentViewController *)self _updateSceneFrameWithCompletion:0];
    }
  }
}

- (void)containerViewControllerWillBeginSizeChange:(id)a3 behavior:(int)a4
{
  if ([(SBSystemNotesContentViewController *)self presentationMode] != 1)
  {
    [(SBSystemNotesContentViewController *)self _setBlurred:1];
    id v5 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
    [v5 setHidden:1];
  }
}

- (void)containerViewControllerDidEndSizeChange:(id)a3
{
  BOOL v4 = [(SBDeviceApplicationSceneViewController *)self->_sceneViewController view];
  [v4 setHidden:0];

  id v5 = [(SBSystemNotesContentViewController *)self view];
  [v5 bounds];
  -[SBSystemNotesContentViewController _setPreferredSceneContentSize:](self, "_setPreferredSceneContentSize:", v6, v7);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__SBSystemNotesContentViewController_containerViewControllerDidEndSizeChange___block_invoke;
  v8[3] = &unk_1E6AF4AC0;
  v8[4] = self;
  [(SBSystemNotesContentViewController *)self _updateSceneFrameWithCompletion:v8];
}

uint64_t __78__SBSystemNotesContentViewController_containerViewControllerDidEndSizeChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setBlurred:0];
}

- (void)containerViewControllerDidEndInteraction:(id)a3 targetWindowScene:(id)a4
{
  if (([a3 isStashed] & 1) == 0)
  {
    [(SBSystemNotesContentViewController *)self _updateSceneFrameWithCompletion:0];
  }
}

- (void)_updateSceneFrameWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  id v5 = [(SBSceneViewController *)self->_sceneViewController sceneHandle];
  double v6 = [v5 sceneIfExists];

  [(SBSystemNotesContentViewController *)self _sceneFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  p_lastKnownSceneFrame = &self->_lastKnownSceneFrame;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.double width = v11;
  v19.size.double height = v13;
  if (CGRectEqualToRect(*p_lastKnownSceneFrame, v19))
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    p_lastKnownSceneFrame->origin.x = v8;
    p_lastKnownSceneFrame->origin.y = v10;
    p_lastKnownSceneFrame->size.double width = v12;
    p_lastKnownSceneFrame->size.double height = v14;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__SBSystemNotesContentViewController__updateSceneFrameWithCompletion___block_invoke;
    v18[3] = &__block_descriptor_64_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
    *(CGFloat *)&void v18[4] = v8;
    *(CGFloat *)&v18[5] = v10;
    *(CGFloat *)&v18[6] = v12;
    *(CGFloat *)&v18[7] = v14;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__SBSystemNotesContentViewController__updateSceneFrameWithCompletion___block_invoke_2;
    v16[3] = &unk_1E6B02370;
    id v17 = v4;
    [v6 performUpdate:v18 withCompletion:v16];
  }
}

uint64_t __70__SBSystemNotesContentViewController__updateSceneFrameWithCompletion___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __70__SBSystemNotesContentViewController__updateSceneFrameWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)containerViewController:(id)a3 shouldHandleStashingForTransitionContext:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(SBSystemNotesContentViewController *)self presentationMode];
  if (v5 == 1)
  {
    double v6 = SBLogSystemNotes();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v7 = _SBFLoggingMethodProem();
      int v10 = 138543362;
      CGFloat v11 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting dismissal of thumbnail due to transition", (uint8_t *)&v10, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained contentViewControllerWantsDismissal:self forReason:1 animated:1];
  }
  return v5 == 1;
}

- (void)_handleThumbnailTapGesture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    BOOL v5 = [(SBSystemNotesContentViewController *)self presentationMode] == 1;
    id WeakRetained = v6;
    if (v5)
    {
      [v6 contentViewControllerDidReceiveTapToExpand:self];
      id WeakRetained = v6;
    }
  }
}

- (BOOL)_updateForegroundStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBSceneViewController *)self->_sceneViewController sceneHandle];
  id v6 = [(SBSystemNotesContentViewController *)self _sbWindowSceneForSceneHandle:v5];
  [(SBSystemNotesContentViewController *)self _acquireTraitsParticipantOnWindowSceneIfNecessary:v6];

  workspace = self->_workspace;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke;
  v14[3] = &unk_1E6AFCFE0;
  v14[4] = self;
  BOOL v16 = v3;
  id v8 = v5;
  id v15 = v8;
  BOOL v9 = [(SBMainWorkspace *)workspace requestTransitionWithOptions:0 builder:v14 validator:&__block_literal_global_76_0];
  int v10 = SBLogPIP();
  CGFloat v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v8 sceneIdentifier];
      *(_DWORD *)buf = 138543362;
      id v18 = v12;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "PIP scene transition succeeded; sceneID: %{public}@",
        buf,
        0xCu);
    }
    if (v3) {
      self->_haveBeenForeground = 1;
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBSystemNotesContentViewController _updateForegroundStatus:](v8, v11);
    }
  }
  return v9;
}

void __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke(uint64_t a1, void *a2)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke_2;
  v9[3] = &unk_1E6AF5C08;
  v9[4] = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 48);
  id v3 = a2;
  [v3 modifyApplicationContext:v9];
  [v3 setSource:49];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke_3;
  v6[3] = &unk_1E6AFF610;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 setTransactionProvider:v6];
}

void __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 1168);
  id v4 = a2;
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(v3, "sbf_currentOrientation"));
  [v4 setBackground:*(unsigned char *)(a1 + 40) == 0];
  [v4 setWaitsForSceneUpdates:1];
  [v4 setDelegate:*(void *)(a1 + 32)];
}

SBPIPSceneContentSceneUpdateWorkspaceTransaction *__62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 1112) userActivity];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    id v7 = [*(id *)(*(void *)(a1 + 40) + 1112) _uiActivityContinuationAction];
    uint64_t v8 = [v6 setWithObject:v7];
    [(SBApplicationSceneEntity *)v4 addActions:v8];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v9 + 1137))
  {
    uint64_t v10 = [*(id *)(v9 + 1120) source];
    if ((unint64_t)(v10 - 2) > 3) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = qword_1D8FD2738[v10 - 2];
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    CGFloat v13 = (void *)[objc_alloc(MEMORY[0x1E4FA6C50]) initWithSource:v11 responder:0];
    CGFloat v14 = [v12 setWithObject:v13];
    [(SBApplicationSceneEntity *)v4 addActions:v14];
  }
  id v15 = [[SBPIPSceneContentSceneUpdateWorkspaceTransaction alloc] initWithApplicationSceneEntity:v4 transitionRequest:v3];

  return v15;
}

uint64_t __62__SBSystemNotesContentViewController__updateForegroundStatus___block_invoke_4()
{
  return 1;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 request];
  uint64_t v5 = [v4 layoutStateForApplicationTransitionContext:v3];

  return v5;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 request];
  uint64_t v5 = [v4 previousLayoutStateForApplicationTransitionContext:v3];

  return v5;
}

- (BOOL)_hitTestTouch:(id)a3 gestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBSystemNotesContentViewController *)self view];
  uint64_t v9 = [v6 view];

  uint64_t v10 = [v9 window];

  uint64_t v11 = [v10 screen];
  uint64_t v12 = [v11 fixedCoordinateSpace];

  CGFloat v13 = [v7 view];
  [v7 locationInView:v13];
  double v15 = v14;
  double v17 = v16;

  objc_msgSend(v10, "convertPoint:toCoordinateSpace:", v12, v15, v17);
  double v19 = v18;
  double v21 = v20;

  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v12, v19, v21);
  double v22 = objc_msgSend(v8, "hitTest:withEvent:", 0);
  LOBYTE(v7) = v22 != 0;

  return (char)v7;
}

- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(SBSystemNotesContentViewController *)self presentationMode] != 1) {
    goto LABEL_8;
  }
  if ([(SBSystemNotesContentViewController *)self _hitTestTouch:v6 gestureRecognizer:v7])
  {
    [(SBSystemNotesContentViewController *)self _handleThumbnailTapGesture:v7];
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_9;
  }
  if (!self->_thumbnailCooldownTimerFired) {
    goto LABEL_8;
  }
  uint64_t v8 = SBLogSystemNotes();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = _SBFLoggingMethodProem();
    int v13 = 138543362;
    double v14 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting dismissal for outside interaction after thumbnail cooldown", (uint8_t *)&v13, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v11 = 1;
  [WeakRetained contentViewControllerWantsDismissal:self forReason:1 animated:1];

LABEL_9:
  return v11;
}

- (void)_setPreferredSceneContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = SBSystemNotesMinimumWindowSize();
  double v8 = v7;
  double v9 = SBSystemNotesMaximumWindowSize();
  if (width < v6 || height < v8)
  {
    self->_preferredSceneContentSize.double width = v6;
    self->_preferredSceneContentSize.double height = v8;
  }
  else
  {
    p_preferredSceneContentSize = &self->_preferredSceneContentSize;
    if (width <= v9 && height <= v10)
    {
      p_preferredSceneContentSize->double width = width;
      self->_preferredSceneContentSize.double height = height;
    }
    else
    {
      p_preferredSceneContentSize->double width = v9;
      self->_preferredSceneContentSize.double height = v10;
    }
  }
  id v14 = [(SBSystemNotesContentViewController *)self view];
  [v14 setNeedsLayout];
}

- (CGRect)_sceneFrame
{
  int64_t v3 = [(TRAParticipant *)self->_traitsParticipant sbf_currentOrientation];
  if ((unint64_t)(v3 - 3) >= 2) {
    double width = self->_preferredSceneContentSize.width;
  }
  else {
    double width = self->_preferredSceneContentSize.height;
  }
  if ((unint64_t)(v3 - 3) >= 2) {
    double height = self->_preferredSceneContentSize.height;
  }
  else {
    double height = self->_preferredSceneContentSize.width;
  }
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)_thumbnailViewForUserActivity:(id)a3
{
  int64_t v3 = [(SBSystemNotesContentViewController *)self _imageFromUserActivity:a3 presentationMode:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v3];
  [v4 setContentMode:2];

  return v4;
}

- (id)_imageFromUserActivity:(id)a3 presentationMode:(int64_t)a4
{
  double v7 = (void *)MEMORY[0x1E4F82DB0];
  id v8 = a3;
  double v9 = [v7 shared];
  id v18 = 0;
  double v10 = [v9 previewForUserActivity:v8 error:&v18];

  id v11 = v18;
  if (v11)
  {
    uint64_t v12 = SBLogSystemNotes();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBSystemNotesContentViewController _imageFromUserActivity:presentationMode:]();
    }
  }
  if (!a4)
  {
    int v13 = (void *)MEMORY[0x1E4F82DA0];
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    int v13 = (void *)MEMORY[0x1E4F82DA8];
LABEL_9:
    id v14 = [v10 objectForKey:*v13];
    goto LABEL_11;
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  double v16 = SBSSystemNotesPresentationModeDescription();
  [v15 handleFailureInMethod:a2, self, @"SBSystemNotesContentViewController.m", 792, @"unsupported presentationMode: %@", v16 object file lineNumber description];

  id v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  nubView = self->_nubView;
  if (nubView && ([(SBNubView *)nubView isHiddenOrHasHiddenAncestor] & 1) == 0) {
    char v10 = [(SBNubView *)self->_nubView _isInAWindow];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3
{
  +[SBNubView height];
  double v4 = v3;
  +[SBNubView contentHeight];
  double v6 = v4 - v5;
  +[SBNubView hitTestPadding];
  double v7 = v6 * -0.5;
  double v9 = -v8;
  double v10 = v6 * -0.5;
  double v11 = v9;
  result.right = v11;
  result.bottom = v7;
  result.left = v9;
  result.top = v10;
  return result;
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self->_nubView];
  double v6 = [MEMORY[0x1E4F42C90] effectWithPreview:v5];
  double v7 = [(SBNubView *)self->_nubView contentView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = objc_msgSend(MEMORY[0x1E4F42CB8], "shapeWithRoundedRect:cornerRadius:", v9 + -7.0, v11 + -4.0, v13 + 14.0, v15 + 8.0, (v13 + 14.0) * 0.5);
  double v17 = [MEMORY[0x1E4F42CC0] styleWithEffect:v6 shape:v16];

  return v17;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__SBSystemNotesContentViewController_sceneHandle_didCreateScene___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __65__SBSystemNotesContentViewController_sceneHandle_didCreateScene___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _sbWindowScene];
  double v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) _sbWindowSceneForSceneHandle:*(void *)(a1 + 40)];
  }
  id v5 = v4;

  [*(id *)(a1 + 32) _acquireTraitsParticipantOnWindowSceneIfNecessary:v5];
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(SBSystemNotesContentViewController *)self _invalidateTraitsParticipant];
  id v5 = SBLogSystemNotes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = _SBFLoggingMethodProem();
    int v8 = 138543362;
    double v9 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting dismissal for scene destruction (invalidation)", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained contentViewControllerWantsDismissal:self forReason:2 animated:0];
}

- (BOOL)sceneHandle:(id)a3 didReceiveAction:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        double v9 = v8;
      }
      else {
        double v9 = 0;
      }
    }
    else
    {
      double v9 = 0;
    }
    id v11 = v9;

    double v12 = [v5 scene];
    if ([v11 canSendResponse]
      && ([v12 clientProcess],
          double v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 hasEntitlement:@"com.apple.springboard.systemNotesScreenshot"],
          v13,
          v14))
    {
      double v15 = [v11 displaysToScreenshot];
      double v16 = (void *)MEMORY[0x1E4F1CA80];
      unint64_t v17 = [v15 count];
      if (v17 <= 1) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = v17;
      }
      double v19 = [v16 setWithCapacity:v18];
      if ([v15 count])
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v29 = v15;
        id v20 = v15;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v32 != v23) {
                objc_enumerationMutation(v20);
              }
              objc_msgSend(v19, "addObject:", *(void *)(*((void *)&v31 + 1) + 8 * i), v29);
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }
          while (v22);
        }

        double v15 = v29;
      }
      else
      {
        uint64_t v25 = [v12 settings];
        uint64_t v26 = objc_msgSend(v25, "sb_displayIdentityForSceneManagers");
        [v19 addObject:v26];
      }
      id v30 = v11;
      id v27 = v19;
      BSDispatchMain();

      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __67__SBSystemNotesContentViewController_sceneHandle_didReceiveAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SBSystemNotesContentViewController_sceneHandle_didReceiveAction___block_invoke_2;
  v5[3] = &unk_1E6AF8F58;
  id v6 = *(id *)(a1 + 48);
  [v2 contentViewController:v3 didReceiveScreenshotRequestForDisplays:v4 completion:v5];
}

void __67__SBSystemNotesContentViewController_sceneHandle_didReceiveAction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v4 = a2;
  id v8 = objc_alloc_init(v3);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F4F878]) initWithArray:v4];

  [v8 setObject:v5 forSetting:0];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [MEMORY[0x1E4F4F678] responseWithInfo:v8];
  [v6 sendResponse:v7];
}

- (SBSystemNotesContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSystemNotesContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_traitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_destroyWeak((id *)&self->_lastKnownWindowScene);
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong((id *)&self->_pendingAnalyticsString, 0);
  objc_storeStrong((id *)&self->_thumbnailCooldownTimer, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_destroyWeak((id *)&self->_systemPointerInteractionManager);
  objc_storeStrong((id *)&self->_transientUIInteractionManager, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_placeholderProvider, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_thumbnailTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_nubView, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_notesInteractionSettings, 0);
}

- (void)viewDidAppear:(NSObject *)a3 .cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = _SBFLoggingMethodProem();
  id v6 = [a1[123] sceneHandle];
  uint64_t v7 = [v6 sceneIdentifier];
  id v8 = [a1 view];
  double v9 = [v8 recursiveDescription];
  int v10 = 138543874;
  id v11 = v5;
  __int16 v12 = 2114;
  double v13 = v7;
  __int16 v14 = 2114;
  double v15 = v9;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}@ \n%{public}@", (uint8_t *)&v10, 0x20u);
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "[Metrics] didActivateBacklinkItemWithUserActivity:", v2, v3, v4, v5, v6);
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "[Metrics] SYSystemPaperActivationMethodBacklink", v2, v3, v4, v5, v6);
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "[Pended] [Metrics] SYSystemPaperActivationMethodSwipePencil", v2, v3, v4, v5, v6);
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "[Metrics] SYSystemPaperActivationMethodSwipePencil", v2, v3, v4, v5, v6);
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.5()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "[Pended] [Metrics] SYSystemPaperActivationMethodSwipeFinger", v2, v3, v4, v5, v6);
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.6()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "[Metrics] SYSystemPaperActivationMethodSwipeFinger", v2, v3, v4, v5, v6);
}

- (void)updateConfiguration:sendCreateActionIfNecessary:.cold.7()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "[Metrics] SYSystemPaperActivationMethodKeyboard", v2, v3, v4, v5, v6);
}

- (void)_sendActionForUpdatedConfiguration:sendCreateIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "asked to send an action but we don't have a scene for handle: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_sendActionForUpdatedConfiguration:sendCreateIfNecessary:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "not sending any action", v2, v3, v4, v5, v6);
}

void __95__SBSystemNotesContentViewController__sendActionForUpdatedConfiguration_sendCreateIfNecessary___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "received an error in response to SBSystemNotesCreateAction: %{public}@", v2, v3, v4, v5, v6);
}

- (void)containerViewController:(uint64_t *)a1 didSettleOnStashState:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[Metrics] %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)_updateForegroundStatus:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 sceneIdentifier];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "PIP scene transition failed. sceneID: %{public}@", v4, 0xCu);
}

- (void)_imageFromUserActivity:presentationMode:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "previewForUserActivity:error: returned an error: %{public}@", v2, v3, v4, v5, v6);
}

@end