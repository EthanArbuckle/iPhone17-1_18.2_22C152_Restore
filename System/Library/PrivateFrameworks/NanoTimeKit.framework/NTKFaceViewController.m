@interface NTKFaceViewController
+ (id)_controllerForComplication:(id)a3 face:(id)a4 slot:(id)a5;
+ (id)_createNormalDisplayForComplicationController:(id)a3 slot:(id)a4 face:(id)a5 faceView:(id)a6;
+ (void)initialize;
- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4;
- (BOOL)_isCollectionPickerViewEnabled;
- (BOOL)_shouldHideFaceUI;
- (BOOL)_shouldWidgetComplicationsEnableTap;
- (BOOL)_wheelChangedWithEvent:(id)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canStopEditing;
- (BOOL)dailySnapshotShowsComplication:(id)a3 forSlot:(id)a4;
- (BOOL)exitingEditing;
- (BOOL)faceView:(id)a3 wantsToDismissPresentedViewControllerAnimated:(BOOL)a4;
- (BOOL)faceViewComplicationIsEmptyForSlot:(id)a3;
- (BOOL)ignoreSnapshotImages;
- (BOOL)isOrbDisabled;
- (BOOL)pausedForHomeScreen;
- (BOOL)pausedForObstruction;
- (BOOL)shouldLoadLiveFaceAtNextScreenOff;
- (BOOL)shouldShowSnapshot;
- (BOOL)shouldUseSampleTemplate;
- (BOOL)showContentForUnadornedSnapshot;
- (BOOL)showsCanonicalContent;
- (BOOL)showsLockedUI;
- (BOOL)suppressFaceViewInteraction;
- (BOOL)supressesNonSnapshotUI;
- (BOOL)widgetsVisible;
- (CGRect)launchRectForComplicationApplicationIdentifier:(id)a3;
- (NHSUISClockAppearance)homeScreenAppearance;
- (NSDate)pauseDate;
- (NSString)description;
- (NSString)widgetIdentifierNamespace;
- (NTKClockStatusBarViewController)statusBarViewController;
- (NTKFace)face;
- (NTKFaceView)faceView;
- (NTKFaceViewController)initWithFace:(id)a3 configuration:(id)a4;
- (NTKFaceViewControllerDelegate)delegate;
- (NTKFaceViewControllerStatusBarDelegate)statusBarDelegate;
- (NTKTritiumAnimationController)tritiumAnimationController;
- (NTKTritiumController)tritiumController;
- (id)PPTDescriptionForComplication:(id)a3;
- (id)PPTUniqueComplicationsToSlotForCurrentFace;
- (id)_dailySnapshot;
- (id)_newNormalDisplayForComplicationController:(id)a3 slot:(id)a4;
- (id)_overrideDateForWake:(BOOL)a3;
- (id)_selectedVisibleSlotForEditMode:(int64_t)a3;
- (id)_unadornedSnapshot;
- (id)acquireComplicationTouchCancellationAssertion;
- (id)blurSourceImage;
- (id)currentClockComplicationCountSet;
- (id)faceAnalyticsIdentifier;
- (id)faceViewAllVisibleComplicationsForCurrentConfiguration;
- (id)faceViewComplicationAppIdentifierForSlot:(id)a3;
- (id)faceViewComplicationControllerForSlot:(id)a3;
- (id)faceViewComplicationForSlot:(id)a3;
- (id)faceViewComplicationSlots;
- (id)faceViewComplicationSlotsHiddenByEditOption:(id)a3;
- (id)faceViewDidRequestCustomDataForKey:(id)a3;
- (id)faceViewEditOptionThatHidesAllComplications;
- (id)faceViewEditOptionsThatHideEditModes;
- (id)faceViewWantsFaceColorPalette;
- (id)removeStatusBarViewController;
- (id)tritium_complicationControllerForSlot:(id)a3;
- (int64_t)dataMode;
- (void)PPTCleanupLastComplication;
- (void)PPTCreateComplication:(id)a3 forSlot:(id)a4 synchronously:(BOOL)a5;
- (void)PPTPrepareComplicationTest;
- (void)_applyConfigurationWithDuration:(double)a3;
- (void)_clearFaceLaunchRect;
- (void)_clearLastTappedComplication;
- (void)_configureBackgroundFillAlpha:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_ensureDetachedComplication:(id)a3;
- (void)_ensureNormalComplication:(id)a3 forSlot:(id)a4;
- (void)_ensureNotLive;
- (void)_ensurePauseDate;
- (void)_faceSnapshotDidChange:(id)a3;
- (void)_handleDeviceLockChange;
- (void)_handleStatusBarChange;
- (void)_insertDetachedComplicationDisplay:(id)a3 controller:(id)a4 forSlot:(id)a5;
- (void)_insertNormalComplicationDisplay:(id)a3 controller:(id)a4 forSlot:(id)a5;
- (void)_loadInitialComplicationVisibilityFromFace;
- (void)_removeComplicationForSlot:(id)a3;
- (void)_removeDetachedComplicationForSlot:(id)a3 andDisconnectDisplay:(BOOL)a4;
- (void)_removeNormalComplicationForSlot:(id)a3 andDisconnectDisplay:(BOOL)a4;
- (void)_setDataMode:(int64_t)a3 becomeLiveOnUnfreeze:(BOOL)a4;
- (void)_setFaceViewResourceDirectoryFromFace;
- (void)_showStatusBarAfterWake;
- (void)_updateInteractivityOfComplicationDisplays;
- (void)_validateIfCurrentSelectedColorStillExists;
- (void)_wrapperViewTapped:(id)a3;
- (void)cleanupAfterOrb:(BOOL)a3;
- (void)cleanupAfterZoom;
- (void)configureWithDuration:(double)a3 block:(id)a4;
- (void)dealloc;
- (void)disableSlowMode;
- (void)enableSlowMode;
- (void)enumerateComplicationControllersAndDisplaysWithBlock:(id)a3;
- (void)faceConfigurationDidChange:(id)a3;
- (void)faceResourceDirectoryDidChange:(id)a3;
- (void)faceViewDidChangePaddingForStatusBar;
- (void)faceViewDidChangeStatusBarOverrideColor:(BOOL)a3;
- (void)faceViewDidChangeWantsStatusBarIconShadow;
- (void)faceViewDidHideOrShowComplicationSlot;
- (void)faceViewDidReloadSnapshotContentViews;
- (void)faceViewDidScrubToDate:(id)a3 forced:(BOOL)a4;
- (void)faceViewDidUpdateCustomData:(id)a3 forKey:(id)a4;
- (void)faceViewRequestedLaunchFromRect:(CGRect)a3;
- (void)faceViewUpdatedResourceDirectory:(id)a3 wantsToTransferOwnership:(BOOL)a4;
- (void)faceViewWantsComplicationKeylineFramesReloaded;
- (void)faceViewWantsStatusBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)faceViewWantsToPresentViewController:(id)a3;
- (void)faceViewWantsUnadornedSnapshotViewRemoved;
- (void)faceViewWillEnterTimeTravel;
- (void)faceViewWillExitTimeTravel;
- (void)finalizeForSnapshotting:(id)a3;
- (void)freeze;
- (void)freezeAfterDelay:(double)a3;
- (void)getComplicationController:(id *)a3 andDisplay:(id *)a4 forSlot:(id)a5;
- (void)handleOrdinaryScreenWake;
- (void)handleWristRaiseScreenWake;
- (void)hideFaceEditingUIAnimated:(BOOL)a3 destination:(unint64_t)a4;
- (void)hideFaceEditingUIAnimated:(BOOL)a3 destination:(unint64_t)a4 completion:(id)a5;
- (void)loadView;
- (void)performPrewarmRoutine:(id)a3;
- (void)performWristRaiseAnimation;
- (void)prepareForOrb;
- (void)prepareForSnapshotting;
- (void)prepareToZoomWithIconView:(id)a3 minDiameter:(double)a4 maxDiameter:(double)a5;
- (void)prepareWristRaiseAnimation;
- (void)sensitiveUIStateChanged;
- (void)setDataMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExitingEditing:(BOOL)a3;
- (void)setIgnoreSnapshotImages:(BOOL)a3;
- (void)setPauseDate:(id)a3;
- (void)setPausedForHomeScreen:(BOOL)a3;
- (void)setPausedForObstruction:(BOOL)a3;
- (void)setShouldShowSnapshot:(BOOL)a3;
- (void)setShouldUseSampleTemplate:(BOOL)a3;
- (void)setShowContentForUnadornedSnapshot:(BOOL)a3;
- (void)setShowsCanonicalContent:(BOOL)a3;
- (void)setShowsLockedUI:(BOOL)a3;
- (void)setStatusBarDelegate:(id)a3;
- (void)setStatusBarViewController:(id)a3;
- (void)setSuppressFaceViewInteraction:(BOOL)a3;
- (void)setSupressesNonSnapshotUI:(BOOL)a3;
- (void)setWidgetIdentifierNamespace:(id)a3;
- (void)setWidgetsVisible:(BOOL)a3;
- (void)setZoomFraction:(double)a3 iconDiameter:(double)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)unfreeze;
- (void)viewDidLayoutSubviews;
@end

@implementation NTKFaceViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && NTKConfigureFaceDefaultsChangedNotification_onceToken != -1)
  {
    dispatch_once(&NTKConfigureFaceDefaultsChangedNotification_onceToken, &__block_literal_global_19);
  }
}

- (NTKFaceViewController)initWithFace:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NTKFaceViewController;
  v9 = [(NTKFaceViewController *)&v25 init];
  v10 = v9;
  if (v9)
  {
    p_face = (id *)&v9->_face;
    objc_storeStrong((id *)&v9->_face, a3);
    [*p_face addObserver:v10];
    [*p_face performComplicationTypeMigration];
    v10->_normalComplicationControllersLock._os_unfair_lock_opaque = 0;
    v10->_detachedComplicationControllersLock._os_unfair_lock_opaque = 0;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    normalComplicationControllers = v10->_normalComplicationControllers;
    v10->_normalComplicationControllers = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    detachedComplicationControllers = v10->_detachedComplicationControllers;
    v10->_detachedComplicationControllers = v14;

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v10 selector:sel__handleDeviceLockChange name:*MEMORY[0x1E4F19660] object:0];

    v17 = [MEMORY[0x1E4F19A98] sharedMonitor];
    [v17 addSensitiveUIObserver:v10];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v10 selector:sel__faceSnapshotDidChange_ name:@"NTKFaceSnapshotChangedNotification" object:0];

    v19 = [v7 device];
    v10->_deviceLocked = [v19 isLocked];

    CGPoint v23 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v24 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v10->_faceLaunchRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v10->_faceLaunchRect.size = v24;
    id v20 = (id)[(NTKFaceViewController *)v10 view];
    [(NTKFaceViewController *)v10 setDefinesPresentationContext:1];
    v10->_dataMode = 1;
    [(NTKFaceViewController *)v10 configureWithDuration:v8 block:0.0];
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v10 selector:sel__faceColorEditOptionsChanged name:@"NTKColorEditOptionsChangedNotificationName" object:*p_face];

    v10->_editingFromFaceContainerFrame.origin = v23;
    v10->_editingFromFaceContainerFrame.size = v24;
  }

  return v10;
}

- (void)dealloc
{
  [(NTKFace *)self->_face removeObserver:self];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F19660] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"NTKFaceSnapshotChangedNotification" object:0];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"NTKColorEditOptionsChangedNotificationName" object:self->_face];

  [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:&__block_literal_global_19];
  v6 = [(NTKFaceViewController *)self removeStatusBarViewController];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);
    [WeakRetained makeStatusBarViewControllerAvailableForReuse:v6];
  }
  v8.receiver = self;
  v8.super_class = (Class)NTKFaceViewController;
  [(NTKFaceViewController *)&v8 dealloc];
}

uint64_t __32__NTKFaceViewController_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return [a3 removeDisplayWrapper:a4];
}

- (void)loadView
{
  id v7 = (id)objc_opt_new();
  v3 = [(NTKFace *)self->_face faceView];
  id v4 = v3;
  if (!v3) {
    id v4 = +[NTKFaceView newFaceViewForFace:0];
  }
  p_faceView = &self->_faceView;
  objc_storeStrong((id *)&self->_faceView, v4);
  if (!v3) {

  }
  [(NTKFaceView *)*p_faceView setDelegate:self];
  [(NTKFaceViewController *)self _setFaceViewResourceDirectoryFromFace];
  [(NTKFaceView *)*p_faceView populateFaceViewEditOptionsFromFace:self->_face];
  [(NTKFaceViewController *)self _loadInitialComplicationVisibilityFromFace];
  if ([(NTKFaceViewController *)self _shouldHideFaceUI])
  {
    v6 = [v7 layer];
    [v6 setAllowsGroupOpacity:1];
  }
  [(NTKFaceView *)*p_faceView bounds];
  objc_msgSend(v7, "setBounds:");
  [v7 addSubview:*p_faceView];
  [(NTKFaceViewController *)self setView:v7];
}

- (id)tritium_complicationControllerForSlot:(id)a3
{
  id v5 = 0;
  [(NTKFaceViewController *)self getComplicationController:&v5 andDisplay:0 forSlot:a3];
  id v3 = v5;

  return v3;
}

- (BOOL)_shouldHideFaceUI
{
  uint64_t v2 = [(id)objc_opt_class() uiSensitivity];
  id v3 = [MEMORY[0x1E4F19A98] sharedMonitor];
  LOBYTE(v2) = [v3 shouldHideForSensitivity:v2];

  return v2;
}

- (void)setStatusBarViewController:(id)a3
{
  id v5 = (NTKClockStatusBarViewController *)a3;
  p_statusBarViewController = &self->_statusBarViewController;
  statusBarViewController = self->_statusBarViewController;
  if (statusBarViewController != v5)
  {
    v15 = v5;
    [(NTKClockStatusBarViewController *)statusBarViewController willMoveToParentViewController:0];
    objc_super v8 = [(NTKClockStatusBarViewController *)*p_statusBarViewController view];
    [v8 removeFromSuperview];

    [(NTKClockStatusBarViewController *)*p_statusBarViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_statusBarViewController, a3);
    v9 = *p_statusBarViewController;
    [(NTKFaceView *)self->_faceView horizontalPaddingForStatusBar];
    -[NTKClockStatusBarViewController setHorizontalPadding:](v9, "setHorizontalPadding:");
    v10 = *p_statusBarViewController;
    [(NTKFaceView *)self->_faceView verticalPaddingForStatusBar];
    -[NTKClockStatusBarViewController setVerticalPadding:](v10, "setVerticalPadding:");
    if (objc_opt_respondsToSelector())
    {
      v11 = *p_statusBarViewController;
      v12 = [(NTKFaceView *)self->_faceView overrideColorForStatusBar];
      [(NTKClockStatusBarViewController *)v11 setOverrideColor:v12];
    }
    [(NTKFaceViewController *)self _handleStatusBarChange];
    if (objc_opt_respondsToSelector()) {
      [(NTKClockStatusBarViewController *)*p_statusBarViewController setWantsIconShadow:[(NTKFaceView *)self->_faceView wantsStatusBarIconShadow]];
    }
    [(NTKFaceViewController *)self addChildViewController:*p_statusBarViewController];
    v13 = [(NTKFaceViewController *)self view];
    v14 = [(NTKClockStatusBarViewController *)*p_statusBarViewController view];
    [v13 addSubview:v14];

    [(NTKClockStatusBarViewController *)*p_statusBarViewController didMoveToParentViewController:self];
    id v5 = v15;
  }
}

- (id)removeStatusBarViewController
{
  statusBarViewController = self->_statusBarViewController;
  if (statusBarViewController)
  {
    [(NTKClockStatusBarViewController *)statusBarViewController willMoveToParentViewController:0];
    id v4 = [(NTKClockStatusBarViewController *)self->_statusBarViewController view];
    [v4 removeFromSuperview];

    [(NTKClockStatusBarViewController *)self->_statusBarViewController removeFromParentViewController];
    id v5 = self->_statusBarViewController;
    v6 = self->_statusBarViewController;
    self->_statusBarViewController = 0;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)freeze
{
  [(NTKDelayedBlock *)self->_delayedFreezeBlock cancel];
  delayedFreezeBlock = self->_delayedFreezeBlock;
  self->_delayedFreezeBlock = 0;

  [(NTKFaceViewController *)self _ensureNotLive];
  self->_frozen = 1;
  faceView = self->_faceView;

  [(NTKFaceView *)faceView setFrozen:1];
}

- (void)freezeAfterDelay:(double)a3
{
  delayedFreezeBlock = self->_delayedFreezeBlock;
  if (delayedFreezeBlock)
  {
    -[NTKDelayedBlock resetWithDelay:](delayedFreezeBlock, "resetWithDelay:");
  }
  else
  {
    v6 = [NTKDelayedBlock alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__NTKFaceViewController_freezeAfterDelay___block_invoke;
    v9[3] = &unk_1E62C1740;
    v9[4] = self;
    id v7 = [(NTKDelayedBlock *)v6 initWithDelay:v9 action:a3];
    objc_super v8 = self->_delayedFreezeBlock;
    self->_delayedFreezeBlock = v7;
  }
}

uint64_t __42__NTKFaceViewController_freezeAfterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) freeze];
}

- (void)unfreeze
{
  [(NTKDelayedBlock *)self->_delayedFreezeBlock cancel];
  delayedFreezeBlock = self->_delayedFreezeBlock;
  self->_delayedFreezeBlock = 0;

  self->_frozen = 0;
  [(NTKFaceView *)self->_faceView setFrozen:0];
  if (self->_becomeLiveOnUnfreeze)
  {
    [(NTKFaceViewController *)self setDataMode:1];
  }
}

- (void)prepareForOrb
{
  [(NTKFaceViewController *)self dismissViewControllerAnimated:0 completion:0];
  faceView = self->_faceView;

  [(NTKFaceView *)faceView prepareForOrb];
}

- (void)cleanupAfterOrb:(BOOL)a3
{
}

- (void)enableSlowMode
{
}

- (void)disableSlowMode
{
}

- (void)setShowsLockedUI:(BOOL)a3
{
  if (self->_showsLockedUI != a3)
  {
    self->_showsLockedUI = a3;
    [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
  }
}

- (void)_handleDeviceLockChange
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKFace *)self->_face device];
  int v4 = [v3 isLocked];

  id v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(NTKFace *)self->_face device];
    int v7 = [v6 isLocked];
    BOOL deviceLocked = self->_deviceLocked;
    v9[0] = 67109376;
    v9[1] = v7;
    __int16 v10 = 1024;
    BOOL v11 = deviceLocked;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "FaceViewController received CLKDeviceLockStateChangedNotification locked?%i _deviceLocked?%i", (uint8_t *)v9, 0xEu);
  }
  if (self->_deviceLocked != v4)
  {
    self->_BOOL deviceLocked = v4;
    [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
  }
}

- (void)sensitiveUIStateChanged
{
}

- (void)_faceSnapshotDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 object];
  id v5 = [(NTKFaceViewController *)self face];
  v6 = [v5 dailySnapshotKey];
  char v7 = [v4 isEqual:v6];

  if ((v7 & 1) != 0
    || [v5 wantsUnadornedSnapshot]
    && ([v5 unadornedSnapshotKey],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v4 isEqual:v8],
        v8,
        v9))
  {
    __int16 v10 = [(NTKFaceViewController *)self faceView];
    char v11 = [v10 editing];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        v14 = v5;
        _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "FVC reloading snapshot for face %@", (uint8_t *)&v13, 0xCu);
      }

      [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v16 = [(NTKFaceViewController *)self view];
  [v16 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[NTKFaceView setBounds:](self->_faceView, "setBounds:");
  if (![(NTKFaceView *)self->_faceView zooming])
  {
    faceView = self->_faceView;
    MEMORY[0x1C1874A70](v4, v6, v8, v10);
    -[NTKFaceView setCenter:](faceView, "setCenter:");
  }
  statusBarViewController = self->_statusBarViewController;
  if (statusBarViewController)
  {
    int v13 = [(NTKClockStatusBarViewController *)statusBarViewController view];
    objc_msgSend(v13, "ntk_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
    [v16 bringSubviewToFront:v13];
  }
  editView = self->_editView;
  uint64_t v15 = v16;
  if (editView)
  {
    -[NTKFaceEditView setFrame:](editView, "setFrame:", v4, v6, v8, v10);
    [v16 bringSubviewToFront:self->_editView];
    uint64_t v15 = v16;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKFaceViewController;
  [(NTKFaceViewController *)&v5 traitCollectionDidChange:a3];
  [(NTKFaceView *)self->_faceView setNeedsLayout];
  double v4 = [(NTKFaceViewController *)self view];
  [v4 setNeedsLayout];

  [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:&__block_literal_global_35];
}

uint64_t __50__NTKFaceViewController_traitCollectionDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 setNeedsLayout];
}

- (id)blurSourceImage
{
  return [(NTKFaceView *)self->_faceView blurSourceImage];
}

- (void)prepareForSnapshotting
{
  double v3 = [MEMORY[0x1E4FB1618] clearColor];
  double v4 = [(NTKFaceViewController *)self view];
  [v4 setBackgroundColor:v3];

  faceView = self->_faceView;

  [(NTKFaceView *)faceView _prepareForSnapshotting];
}

- (void)finalizeForSnapshotting:(id)a3
{
  id v4 = a3;
  objc_super v5 = self->_faceView;
  double v6 = v5;
  if (v5)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__3;
    v16[4] = __Block_byref_object_dispose__3;
    v17 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke_38;
    v12[3] = &unk_1E62C1768;
    int v13 = v5;
    uint64_t v15 = v16;
    id v14 = v4;
    double v7 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v12);
    v7[2](v7, v8, v9, v10);

    _Block_object_dispose(v16, 8);
    char v11 = v17;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke;
    block[3] = &unk_1E62C0718;
    id v19 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    char v11 = v19;
  }
}

void __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.faceSnapshotRenderer" code:0 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke_38(uint64_t a1)
{
  dispatch_group_t v2 = dispatch_group_create();
  [*(id *)(a1 + 32) renderSynchronouslyWithImageQueueDiscard:1 inGroup:v2];
  double v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke_2;
  v7[3] = &unk_1E62C1768;
  dispatch_group_t v8 = v2;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v9 = v6;
  objc_super v5 = v2;
  [v3 _finalizeForSnapshotting:v7];
}

uint64_t __49__NTKFaceViewController_finalizeForSnapshotting___block_invoke_2(void *a1)
{
  dispatch_group_t v2 = a1[4];
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v2, v3))
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.faceSnapshotRenderer" code:1 userInfo:0];
    uint64_t v5 = *(void *)(a1[6] + 8);
    long long v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  double v7 = *(uint64_t (**)(void))(a1[5] + 16);

  return v7();
}

- (void)performPrewarmRoutine:(id)a3
{
}

- (NSString)description
{
  dispatch_time_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTKFaceViewController;
  uint64_t v4 = [(NTKFaceViewController *)&v8 description];
  uint64_t v5 = [(NTKFace *)self->_face description];
  long long v6 = [v3 stringWithFormat:@"%@ [%@]", v4, v5];

  return (NSString *)v6;
}

- (void)getComplicationController:(id *)a3 andDisplay:(id *)a4 forSlot:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    os_unfair_lock_lock(&self->_normalComplicationControllersLock);
    *a3 = [(NSMutableDictionary *)self->_normalComplicationControllers objectForKey:v8];
    os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
  }
  if (a4)
  {
    *a4 = [(NTKFaceView *)self->_faceView normalComplicationDisplayWrapperForSlot:v8];
  }
}

- (void)enumerateComplicationControllersAndDisplaysWithBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_normalComplicationControllersLock);
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_normalComplicationControllers copy];
  os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__NTKFaceViewController_enumerateComplicationControllersAndDisplaysWithBlock___block_invoke;
  v11[3] = &unk_1E62C1790;
  id v6 = v4;
  v11[4] = self;
  id v12 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];
  os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
  double v7 = (void *)[(NSMutableDictionary *)self->_detachedComplicationControllers copy];
  os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __78__NTKFaceViewController_enumerateComplicationControllersAndDisplaysWithBlock___block_invoke_2;
  v9[3] = &unk_1E62C1790;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __78__NTKFaceViewController_enumerateComplicationControllersAndDisplaysWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 1296);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 normalComplicationDisplayWrapperForSlot:v7];
  (*(void (**)(uint64_t, id, id, id))(v4 + 16))(v4, v7, v6, v8);
}

void __78__NTKFaceViewController_enumerateComplicationControllersAndDisplaysWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 1296);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 detachedComplicationDisplayWrapperForSlot:v7];
  (*(void (**)(uint64_t, id, id, id))(v4 + 16))(v4, v7, v6, v8);
}

- (void)configureWithDuration:(double)a3 block:(id)a4
{
  self->_readyToApplyConfiguration = 0;
  if (a4) {
    (*((void (**)(id, NTKFaceViewController *))a4 + 2))(a4, self);
  }
  self->_readyToApplyConfiguration = 1;

  [(NTKFaceViewController *)self _applyConfigurationWithDuration:a3];
}

- (void)setShouldShowSnapshot:(BOOL)a3
{
  if (self->_shouldShowSnapshot != a3)
  {
    self->_shouldShowSnapshot = a3;
    [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
  }
}

- (void)setSupressesNonSnapshotUI:(BOOL)a3
{
  if (self->_supressesNonSnapshotUI != a3)
  {
    self->_supressesNonSnapshotUI = a3;
    [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
  }
}

- (void)setShowsCanonicalContent:(BOOL)a3
{
  if (self->_showsCanonicalContent != a3)
  {
    self->_showsCanonicalContent = a3;
    [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
  }
}

- (void)setShowContentForUnadornedSnapshot:(BOOL)a3
{
  if (self->_showContentForUnadornedSnapshot != a3)
  {
    self->_showContentForUnadornedSnapshot = a3;
    [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
  }
}

- (void)setIgnoreSnapshotImages:(BOOL)a3
{
  if (self->_ignoreSnapshotImages != a3)
  {
    self->_ignoreSnapshotImages = a3;
    [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
  }
}

- (void)setDataMode:(int64_t)a3
{
  if (a3 == 1 && self->_frozen)
  {
    uint64_t v4 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Frozen NTKFaceViewController can't show live data. View will become live without animation after unfreeze.", v5, 2u);
    }

    self->_becomeLiveOnUnfreeze = 1;
  }
  else
  {
    -[NTKFaceViewController _setDataMode:becomeLiveOnUnfreeze:](self, "_setDataMode:becomeLiveOnUnfreeze:");
  }
}

- (void)setPauseDate:(id)a3
{
  objc_storeStrong((id *)&self->_pauseDate, a3);
  if (self->_dataMode == 2)
  {
    [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
  }
}

- (void)_ensureNotLive
{
  if (self->_dataMode == 1)
  {
    [(NTKFaceViewController *)self _ensurePauseDate];
    [(NTKFaceViewController *)self _setDataMode:2 becomeLiveOnUnfreeze:1];
  }
}

- (void)_ensurePauseDate
{
  if (!self->_pauseDate)
  {
    dispatch_time_t v3 = [MEMORY[0x1E4F196B0] now];
    pauseDate = self->_pauseDate;
    self->_pauseDate = v3;
  }
}

- (id)_overrideDateForWake:(BOOL)a3
{
  uint64_t v5 = NTKNilOrDateOverrideInDemoMode();
  int64_t dataMode = self->_dataMode;
  if (dataMode == 3)
  {
    NTKIdealizedDate();
    id v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (dataMode == 2 && !a3)
  {
    [(NTKFaceViewController *)self _ensurePauseDate];
    id v7 = self->_pauseDate;
LABEL_6:
    id v8 = v7;

    uint64_t v5 = v8;
  }
  long long v9 = CLKForcedTime();

  if (v9)
  {
    uint64_t v10 = NTKIdealizedDate();

    uint64_t v5 = (void *)v10;
  }

  return v5;
}

- (void)_setDataMode:(int64_t)a3 becomeLiveOnUnfreeze:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    face = self->_face;
    int v11 = 134218498;
    int64_t v12 = a3;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    __int16 v15 = 2112;
    v16 = face;
    _os_log_debug_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEBUG, "Set Data Mode: %ld, become live: %d, %@", (uint8_t *)&v11, 0x1Cu);
  }

  self->_becomeLiveOnUnfreeze = v4;
  if (self->_dataMode != a3)
  {
    self->_int64_t dataMode = a3;
    BOOL v9 = a3 != 3 || self->_hasGoneLive;
    self->_hasGoneLive = v9;
    [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
    if (self->_dataMode == 1) {
      [(NTKFaceView *)self->_faceView setNeedsRender];
    }
  }
}

- (void)_applyConfigurationWithDuration:(double)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  if (!self->_readyToApplyConfiguration) {
    return;
  }
  kdebug_trace();
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  char v89 = 0;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy__3;
  v86[4] = __Block_byref_object_dispose__3;
  id v87 = 0;
  id v83 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  char v85 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = __Block_byref_object_copy__3;
  v82[4] = __Block_byref_object_dispose__3;
  if (self->_ignoreSnapshotImages)
  {
    v63 = (void (**)(void))&__block_literal_global_51;
    v64 = (void (**)(void))&__block_literal_global_49;
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_3;
    aBlock[3] = &unk_1E62C17D8;
    aBlock[5] = v86;
    aBlock[6] = v88;
    aBlock[4] = self;
    v64 = (void (**)(void))_Block_copy(aBlock);
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_4;
    v80[3] = &unk_1E62C17D8;
    v80[5] = v82;
    v80[6] = v84;
    v80[4] = self;
    v63 = (void (**)(void))_Block_copy(v80);
  }
  if (self->_hasGoneLive)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = v64[2]();
    BOOL v5 = v6 != 0;
  }
  id v7 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasGoneLive = self->_hasGoneLive;
    *(_DWORD *)buf = 134218240;
    unint64_t v93 = v5;
    __int16 v94 = 2048;
    v95 = (NTKFaceView *)hasGoneLive;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Applying usingSwitcherSnapshot:%lu _hasGoneLive:%lu", buf, 0x16u);
  }

  faceView = self->_faceView;
  if (v5)
  {
    uint64_t v10 = [(NTKFaceView *)faceView switcherSnapshotView];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4FB1838]);
      if (NTKDebugShowVisualIndicatorOnSnapshot())
      {
        __int16 v13 = [v12 layer];
        [v13 setBorderWidth:3.0];

        id v14 = [MEMORY[0x1E4FB1618] yellowColor];
        uint64_t v15 = [v14 CGColor];
        v16 = [v12 layer];
        [v16 setBorderColor:v15];
      }
      [(NTKFaceView *)self->_faceView setSwitcherSnapshotView:v12];
    }
    uint64_t v17 = [(NTKFaceView *)self->_faceView switcherSnapshotView];
    v18 = v64[2]();
    [v17 setImage:v18];

    BOOL v19 = 0;
  }
  else
  {
    [(NTKFaceView *)faceView setSwitcherSnapshotView:0];
    if (![(NTKFaceView *)self->_faceView supportsUnadornedSnapshot]
      || self->_hasRemovedUnadornedSnapshot
      || self->_wantsRemoveUnadorned)
    {
      BOOL v19 = 0;
      goto LABEL_21;
    }
    uint64_t v17 = v63[2]();
    BOOL v19 = v17 != 0;
  }

LABEL_21:
  id v20 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = (id)objc_opt_class();
    v22 = self->_faceView;
    BOOL v23 = [(NTKFaceView *)v22 supportsUnadornedSnapshot];
    BOOL hasRemovedUnadornedSnapshot = self->_hasRemovedUnadornedSnapshot;
    BOOL wantsRemoveUnadorned = self->_wantsRemoveUnadorned;
    *(_DWORD *)buf = 138413570;
    unint64_t v93 = (unint64_t)v21;
    __int16 v94 = 2048;
    v95 = v22;
    __int16 v96 = 2048;
    BOOL v97 = v5;
    __int16 v98 = 2048;
    BOOL v99 = v23;
    __int16 v100 = 2048;
    BOOL v101 = hasRemovedUnadornedSnapshot;
    __int16 v102 = 2048;
    BOOL v103 = wantsRemoveUnadorned;
    _os_log_impl(&dword_1BC5A9000, v20, OS_LOG_TYPE_DEFAULT, "[%@-%p] Applying usingSwitcherSnapshot:%lu supportsUnadornedSnapshot:%lu _hasRemovedUnadornedSnapshot:%lu _wantsRemoveUnadorned:%lu", buf, 0x3Eu);
  }
  if (v19)
  {
    if (!self->_hasUsedUnadornedSnapshot)
    {
      v26 = [(NTKFaceView *)self->_faceView unadornedSnapshotView];
      BOOL v27 = v26 == 0;

      if (v27)
      {
        id v28 = objc_alloc_init(MEMORY[0x1E4FB1838]);
        if (NTKDebugShowVisualIndicatorOnSnapshot())
        {
          v29 = [v28 layer];
          [v29 setBorderWidth:3.0];

          id v30 = [MEMORY[0x1E4FB1618] redColor];
          uint64_t v31 = [v30 CGColor];
          v32 = [v28 layer];
          [v32 setBorderColor:v31];
        }
        [(NTKFaceView *)self->_faceView setUnadornedSnapshotView:v28];
        [(NTKFaceView *)self->_faceView addSubview:v28];
        [(NTKFaceView *)self->_faceView sendSubviewToBack:v28];
        self->_hasUsedUnadornedSnapshot = 1;
      }
    }
    v33 = [(NTKFaceView *)self->_faceView unadornedSnapshotView];
    v34 = v63[2]();
    [v33 setImage:v34];
  }
  else
  {
    BOOL v35 = self->_hasUsedUnadornedSnapshot && !self->_hasRemovedUnadornedSnapshot;
    BOOL v36 = self->_wantsRemoveUnadorned;
    if ([(NTKFaceView *)self->_faceView supportsUnadornedSnapshot])
    {
      v37 = v63[2]();
      BOOL v38 = v37 != 0;
    }
    else
    {
      BOOL v38 = 0;
    }
    if (v35 || v36 || !v5 && !v38)
    {
      v39 = [(NTKFaceView *)self->_faceView unadornedSnapshotView];
      [v39 removeFromSuperview];

      [(NTKFaceView *)self->_faceView setUnadornedSnapshotView:0];
      [(NTKFaceView *)self->_faceView loadContentToReplaceUnadornedSnapshot];
      [(NTKFaceView *)self->_faceView handleUnadornedSnapshotRemoved];
      self->_BOOL hasRemovedUnadornedSnapshot = 1;
      self->_BOOL wantsRemoveUnadorned = 0;
    }
  }
  if (self->_supressesNonSnapshotUI)
  {
    v40 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v40, OS_LOG_TYPE_DEFAULT, "Applying _supressesNonSnapshotUI", buf, 2u);
    }

    [(NTKFaceView *)self->_faceView loadContentToReplaceUnadornedSnapshot];
  }
  [(NTKFaceView *)self->_faceView setShowContentForUnadornedSnapshot:self->_showContentForUnadornedSnapshot];
  [(NTKFaceView *)self->_faceView setShouldShowUnsnapshotableContent:!v5];
  if (!v5 && NTKSnapshotSwitchingEnabled() && [(NTKFaceView *)self->_faceView dataMode] == 3)
  {
    v41 = self->_faceView;
    v42 = NTKIdealizedDate();
    [(NTKFaceView *)v41 setOverrideDate:v42 duration:0.0];
  }
  [(NTKFaceView *)self->_faceView setDataMode:self->_dataMode];
  [(NTKFaceView *)self->_faceView setShowsCanonicalContent:self->_showsCanonicalContent];
  if (self->_dataMode == 3) {
    [(NTKClockStatusBarViewController *)self->_statusBarViewController hideAnimated:0];
  }
  uint64_t v43 = [(NTKFaceViewController *)self _overrideDateForWake:0];
  [(NTKFaceView *)self->_faceView setOverrideDate:v43 duration:a3];
  v62 = (void *)v43;
  BOOL v44 = self->_showsLockedUI || self->_deviceLocked;
  [(NTKFaceView *)self->_faceView setShowsLockedUI:v44];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_53;
  v78[3] = &unk_1E62C1800;
  v78[4] = self;
  BOOL v79 = v5;
  v45 = _Block_copy(v78);
  face = self->_face;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_2_55;
  v76[3] = &unk_1E62C1828;
  v76[4] = self;
  id v61 = v45;
  id v77 = v61;
  [(NTKFace *)face enumerateComplicationSlotsWithBlock:v76];
  v47 = [(NTKFaceView *)self->_faceView _detachedComplicationDisplays];
  v48 = objc_opt_new();
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v49 = v47;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v72 objects:v91 count:16];
  if (v50)
  {
    uint64_t v51 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v73 != v51) {
          objc_enumerationMutation(v49);
        }
        v53 = [*(id *)(*((void *)&v72 + 1) + 8 * i) identifier];
        [v48 addObject:v53];
      }
      uint64_t v50 = [v49 countByEnumeratingWithState:&v72 objects:v91 count:16];
    }
    while (v50);
  }

  os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
  v54 = [(NSMutableDictionary *)self->_detachedComplicationControllers allKeys];
  v55 = (void *)[v54 copy];

  os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);
  long long v71 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v68 = 0u;
  id v56 = v55;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v68 objects:v90 count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v57; ++j)
      {
        if (*(void *)v69 != v58) {
          objc_enumerationMutation(v56);
        }
        uint64_t v60 = *(void *)(*((void *)&v68 + 1) + 8 * j);
        if (([v48 containsObject:v60] & 1) == 0) {
          [(NTKFaceViewController *)self _removeDetachedComplicationForSlot:v60 andDisconnectDisplay:1];
        }
      }
      uint64_t v57 = [v56 countByEnumeratingWithState:&v68 objects:v90 count:16];
    }
    while (v57);
  }

  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_3_58;
  v67[3] = &unk_1E62C1850;
  v67[4] = self;
  [v49 enumerateObjectsUsingBlock:v67];
  kdebug_trace();
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_4_60;
  v65[3] = &unk_1E62C18A0;
  v65[4] = self;
  BOOL v66 = v44;
  [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:v65];
  [(NTKFaceViewController *)self _updateInteractivityOfComplicationDisplays];
  [(NTKFaceViewController *)self _updateWidgetVisibilityOfComplicationDisplays];
  kdebug_trace();
  [(NTKFaceView *)self->_faceView setNeedsLayout];
  kdebug_trace();

  _Block_object_dispose(v82, 8);
  _Block_object_dispose(v84, 8);
  _Block_object_dispose(v86, 8);

  _Block_object_dispose(v88, 8);
}

uint64_t __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke()
{
  return 0;
}

uint64_t __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_2()
{
  return 0;
}

id __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v1)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!*(unsigned char *)(v3 + 24))
    {
      uint64_t v4 = [*(id *)(a1 + 32) _dailySnapshot];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    *(unsigned char *)(v3 + 24) = 1;
    v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  id v7 = v1;

  return v7;
}

id __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v1)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!*(unsigned char *)(v3 + 24))
    {
      uint64_t v4 = [*(id *)(a1 + 32) _unadornedSnapshot];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    *(unsigned char *)(v3 + 24) = 1;
    v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  id v7 = v1;

  return v7;
}

uint64_t __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 1233) || *(unsigned char *)(a1 + 40))
  {
    if (*(unsigned char *)(v7 + 1236) || ([*(id *)(v7 + 1296) complicationIsHiddenAtSlot:v6] & 1) != 0)
    {
      uint64_t v8 = 0;
    }
    else
    {
      int v10 = [*(id *)(a1 + 32) dailySnapshotShowsComplication:v5 forSlot:v6];
      int v11 = v10 ^ 1;
      if (*(unsigned char *)(*(void *)(a1 + 32) + 1233)) {
        int v12 = v10;
      }
      else {
        int v12 = 1;
      }
      if (!*(unsigned char *)(a1 + 40)) {
        int v11 = 1;
      }
      uint64_t v8 = v12 & v11;
    }
  }
  else if ([*(id *)(v7 + 1296) complicationIsHiddenAtSlot:v6])
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 1296) editing];
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

void __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_2_55(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1288), "complicationForSlot:");
  if (v3 && (*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) _ensureComplication:v3 forSlot:v4];
  }
  else {
    [*(id *)(a1 + 32) _removeComplicationForSlot:v4];
  }
}

uint64_t __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_3_58(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _ensureDetachedComplication:a2];
}

void __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_4_60(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1272);
  id v7 = a4;
  id v8 = a3;
  [v8 setPauseDate:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_5;
  v9[3] = &unk_1E62C1878;
  v9[4] = *(void *)(a1 + 32);
  [v8 updatePropertiesForDisplayWrapper:v7 withBlock:v9];

  [v8 setShowsLockedUI:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __57__NTKFaceViewController__applyConfigurationWithDuration___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setFaceDataMode:*(void *)(*(void *)(a1 + 32) + 1264)];
}

- (BOOL)dailySnapshotShowsComplication:(id)a3 forSlot:(id)a4
{
  return 1;
}

- (void)hideFaceEditingUIAnimated:(BOOL)a3 destination:(unint64_t)a4
{
}

- (void)hideFaceEditingUIAnimated:(BOOL)a3 destination:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = _NTKLoggingObjectForDomain(11, (uint64_t)"NTKLoggingDomainFaceLibraryViewController");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (objc_class *)objc_opt_class();
    BOOL v9 = NSStringFromClass(v8);
    v10[0] = 67109634;
    v10[1] = v6;
    __int16 v11 = 2048;
    unint64_t v12 = a4;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "#events hideFaceEditingUIAnimated: %d, destination: %lu, for %@", (uint8_t *)v10, 0x1Cu);
  }
}

- (BOOL)canStopEditing
{
  return ![(NTKFaceEditView *)self->_editView isTransitioningBetweenEditPages];
}

- (BOOL)canBecomeFirstResponder
{
  uint64_t v3 = [(NTKFaceViewController *)self presentedViewController];

  if (v3
    && ([(NTKFaceViewController *)self faceView],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [(NTKFaceViewController *)self presentedViewController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v4 presentedViewControllerShouldBecomeFirstResponder:v5],
        v5,
        v4,
        v6))
  {
    id v7 = [(NTKFaceViewController *)self presentedViewController];
    char v8 = [v7 canBecomeFirstResponder];

    return v8;
  }
  else
  {
    int v10 = [(NTKFaceViewController *)self faceView];
    char v11 = [v10 canBecomeFirstResponder];

    if (v11)
    {
      return 1;
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)NTKFaceViewController;
      return [(NTKFaceViewController *)&v12 canBecomeFirstResponder];
    }
  }
}

- (BOOL)becomeFirstResponder
{
  uint64_t v3 = [(NTKFaceViewController *)self presentedViewController];

  if (v3
    && ([(NTKFaceViewController *)self faceView],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [(NTKFaceViewController *)self presentedViewController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v4 presentedViewControllerShouldBecomeFirstResponder:v5],
        v5,
        v4,
        v6))
  {
    id v7 = [(NTKFaceViewController *)self presentedViewController];
    char v8 = [v7 becomeFirstResponder];

    return v8;
  }
  else
  {
    int v10 = [(NTKFaceViewController *)self faceView];
    char v11 = [v10 becomeFirstResponder];

    if (v11)
    {
      return 1;
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)NTKFaceViewController;
      return [(NTKFaceViewController *)&v12 becomeFirstResponder];
    }
  }
}

- (void)_loadInitialComplicationVisibilityFromFace
{
  uint64_t v3 = [(NTKFaceView *)self->_faceView _complicationSlotsHiddenByCurrentConfiguration];
  if ([v3 count])
  {
    face = self->_face;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__NTKFaceViewController__loadInitialComplicationVisibilityFromFace__block_invoke;
    v5[3] = &unk_1E62C18C8;
    v5[4] = self;
    id v6 = v3;
    [(NTKFace *)face enumerateComplicationSlotsWithBlock:v5];
  }
}

void __67__NTKFaceViewController__loadInitialComplicationVisibilityFromFace__block_invoke(uint64_t a1, void *a2)
{
  dispatch_group_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1296);
  id v4 = a2;
  objc_msgSend(v3, "setComplicationHidden:atSlot:", objc_msgSend(v2, "containsObject:", v4), v4);
}

- (void)_setFaceViewResourceDirectoryFromFace
{
  faceView = self->_faceView;
  id v3 = [(NTKFace *)self->_face resourceDirectory];
  [(NTKFaceView *)faceView setResourceDirectory:v3];
}

- (BOOL)_isCollectionPickerViewEnabled
{
  return 1;
}

- (void)faceViewWantsStatusBarHidden:(BOOL)a3 animated:(BOOL)a4
{
  statusBarViewController = self->_statusBarViewController;
  if (a3) {
    [(NTKClockStatusBarViewController *)statusBarViewController hideAnimated:a4];
  }
  else {
    [(NTKClockStatusBarViewController *)statusBarViewController showAnimated:a4];
  }
}

- (void)faceViewDidChangeWantsStatusBarIconShadow
{
  if (objc_opt_respondsToSelector())
  {
    statusBarViewController = self->_statusBarViewController;
    BOOL v4 = [(NTKFaceView *)self->_faceView wantsStatusBarIconShadow];
    [(NTKClockStatusBarViewController *)statusBarViewController setWantsIconShadow:v4];
  }
}

- (void)faceViewDidChangePaddingForStatusBar
{
  if (objc_opt_respondsToSelector())
  {
    statusBarViewController = self->_statusBarViewController;
    [(NTKFaceView *)self->_faceView horizontalPaddingForStatusBar];
    -[NTKClockStatusBarViewController setHorizontalPadding:](statusBarViewController, "setHorizontalPadding:");
    BOOL v4 = self->_statusBarViewController;
    [(NTKFaceView *)self->_faceView verticalPaddingForStatusBar];
    -[NTKClockStatusBarViewController setVerticalPadding:](v4, "setVerticalPadding:");
  }
}

- (void)faceViewDidChangeStatusBarOverrideColor:(BOOL)a3
{
  if (objc_opt_respondsToSelector())
  {
    statusBarViewController = self->_statusBarViewController;
    id v5 = [(NTKFaceView *)self->_faceView overrideColorForStatusBar];
    [(NTKClockStatusBarViewController *)statusBarViewController setOverrideColor:v5];
  }
}

- (void)faceViewWantsComplicationKeylineFramesReloaded
{
  id v3 = objc_opt_class();
  BOOL v4 = [(NTKFace *)self->_face device];
  id v5 = [v3 fixedComplicationSlotsForDevice:v4];

  face = self->_face;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__NTKFaceViewController_faceViewWantsComplicationKeylineFramesReloaded__block_invoke;
  v8[3] = &unk_1E62C18C8;
  id v9 = v5;
  int v10 = self;
  id v7 = v5;
  [(NTKFace *)face enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:v8];
}

void __71__NTKFaceViewController_faceViewWantsComplicationKeylineFramesReloaded__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    int v3 = NTKFaceLibraryTabEditorEnabled();
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 1008);
    [*(id *)(v4 + 1296) keylineFrameForComplicationSlot:v8 selected:v3 ^ 1u];
    objc_msgSend(v5, "setSelectedKeylineFrame:forKey:editMode:", v8, 1);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 1008);
    [*(id *)(v6 + 1296) keylineFrameForComplicationSlot:v8 selected:0];
    objc_msgSend(v7, "setDeselectedKeylineFrame:forKey:editMode:", v8, 1);
  }
}

- (void)faceViewWillEnterTimeTravel
{
  [(NTKFaceViewController *)self faceViewWantsStatusBarHidden:1 animated:1];

  [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:&__block_literal_global_70];
}

void __52__NTKFaceViewController_faceViewWillEnterTimeTravel__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a4;
  if (([a3 conformsToProtocol:&unk_1FCD691F8] & 1) == 0) {
    [v5 setDimmed:1];
  }
}

- (void)faceViewDidScrubToDate:(id)a3 forced:(BOOL)a4
{
  id v6 = a3;
  id v7 = NTKRoundDateDownToNearestMinute();
  if (a4)
  {
    objc_storeStrong((id *)&self->_scrubDate, v7);
LABEL_3:
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__NTKFaceViewController_faceViewDidScrubToDate_forced___block_invoke_2;
    v13[3] = &unk_1E62C18F0;
    id v14 = v6;
    [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:v13];

    goto LABEL_6;
  }
  if (![(NSDate *)self->_scrubDate isEqualToDate:v7])
  {
    objc_storeStrong((id *)&self->_scrubDate, v7);
    if (!self->_time_travel_update_timer)
    {
      id v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      time_travel_update_timer = self->_time_travel_update_timer;
      self->_time_travel_update_timer = v8;

      int v10 = self->_time_travel_update_timer;
      dispatch_time_t v11 = dispatch_time(0, 32000000);
      dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
      objc_super v12 = self->_time_travel_update_timer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __55__NTKFaceViewController_faceViewDidScrubToDate_forced___block_invoke;
      handler[3] = &unk_1E62BFF20;
      handler[4] = self;
      dispatch_source_set_event_handler(v12, handler);
      dispatch_resume((dispatch_object_t)self->_time_travel_update_timer);
      goto LABEL_3;
    }
  }
LABEL_6:
}

void __55__NTKFaceViewController_faceViewDidScrubToDate_forced___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_group_t v2 = *(void **)(v1 + 1104);
  *(void *)(v1 + 1104) = 0;
}

void __55__NTKFaceViewController_faceViewDidScrubToDate_forced___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 conformsToProtocol:&unk_1FCD691F8])
  {
    [v7 setTimeTravelDate:*(void *)(a1 + 32) animated:0];
    [v6 setTimeTravelDate:*(void *)(a1 + 32) animated:0];
  }
}

- (void)faceViewWillExitTimeTravel
{
  int v3 = [(NTKFaceViewController *)self faceView];
  -[NTKFaceViewController faceViewWantsStatusBarHidden:animated:](self, "faceViewWantsStatusBarHidden:animated:", [v3 wantsStatusBarHidden], 1);

  [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:&__block_literal_global_74];
}

void __51__NTKFaceViewController_faceViewWillExitTimeTravel__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a4;
  if (([a3 conformsToProtocol:&unk_1FCD691F8] & 1) == 0) {
    [v5 setDimmed:0];
  }
}

- (void)faceViewDidReloadSnapshotContentViews
{
}

- (void)faceViewWantsUnadornedSnapshotViewRemoved
{
  if (!self->_hasRemovedUnadornedSnapshot)
  {
    self->_BOOL wantsRemoveUnadorned = 1;
    [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
  }
}

- (void)faceViewDidHideOrShowComplicationSlot
{
}

- (BOOL)faceViewComplicationIsEmptyForSlot:(id)a3
{
  int v3 = [(NTKFace *)self->_face complicationForSlot:a3];
  BOOL v4 = [v3 complicationType] == 0;

  return v4;
}

- (void)faceViewUpdatedResourceDirectory:(id)a3 wantsToTransferOwnership:(BOOL)a4
{
  face = self->_face;
  if (a4) {
    [(NTKFace *)face setResourceDirectoryByTransferringOwnership:a3];
  }
  else {
    [(NTKFace *)face setResourceDirectory:a3];
  }
}

- (void)faceViewWantsToPresentViewController:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setModalPresentationStyle:6];
  id v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Presenting view controller %@", (uint8_t *)&v6, 0xCu);
  }

  [(NTKFaceViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (BOOL)faceView:(id)a3 wantsToDismissPresentedViewControllerAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(NTKFaceViewController *)self presentedViewController];

  if (v6) {
    [(NTKFaceViewController *)self dismissViewControllerAnimated:v4 completion:0];
  }
  return v6 != 0;
}

- (id)faceViewComplicationAppIdentifierForSlot:(id)a3
{
  int v3 = [(NTKFace *)self->_face complicationForSlot:a3];
  if ([v3 complicationType])
  {
    BOOL v4 = [v3 appIdentifier];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)faceViewComplicationForSlot:(id)a3
{
  return [(NTKFace *)self->_face complicationForSlot:a3];
}

- (id)faceViewComplicationControllerForSlot:(id)a3
{
  id v5 = 0;
  [(NTKFaceViewController *)self getComplicationController:&v5 andDisplay:0 forSlot:a3];
  id v3 = v5;

  return v3;
}

- (id)faceViewComplicationSlots
{
  return [(NTKFace *)self->_face orderedComplicationSlots];
}

- (id)faceViewEditOptionThatHidesAllComplications
{
  return [(NTKFace *)self->_face editOptionThatHidesAllComplications];
}

- (id)faceViewEditOptionsThatHideEditModes
{
  return [(NTKFace *)self->_face editOptionsThatHideEditModes];
}

- (id)faceViewComplicationSlotsHiddenByEditOption:(id)a3
{
  return [(NTKFace *)self->_face complicationSlotsHiddenByEditOption:a3];
}

- (id)faceViewAllVisibleComplicationsForCurrentConfiguration
{
  return [(NTKFace *)self->_face allVisibleComplicationsForCurrentConfiguration];
}

- (id)faceViewWantsFaceColorPalette
{
  if ([(NTKFace *)self->_face supportsPigmentEditOption])
  {
    dispatch_group_t v2 = [NTKFaceColorPalette alloc];
    id v3 = [(id)objc_opt_class() pigmentFaceDomain];
    BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [(NTKFaceColorPalette *)v2 initWithDomainName:v3 inBundle:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)faceViewDidRequestCustomDataForKey:(id)a3
{
  return [(NTKFace *)self->_face customDataForKey:a3];
}

- (void)faceViewDidUpdateCustomData:(id)a3 forKey:(id)a4
{
}

- (id)faceAnalyticsIdentifier
{
  return [(NTKFace *)self->_face analyticsIdentifier];
}

- (id)PPTUniqueComplicationsToSlotForCurrentFace
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
  face = self->_face;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__NTKFaceViewController_PPTUniqueComplicationsToSlotForCurrentFace__block_invoke;
  v11[3] = &unk_1E62C1918;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(NTKFace *)face enumerateComplicationSlotsWithBlock:v11];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

void __67__NTKFaceViewController_PPTUniqueComplicationsToSlotForCurrentFace__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = [*(id *)(*(void *)(a1 + 32) + 1288) allowedComplicationsForSlot:v3];
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v13 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v13) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1288), "preferredComplicationFamilyForComplication:withSlot:", v7, v3));
        id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "complicationType"));
        int v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
        if (!v10)
        {
          int v10 = [MEMORY[0x1E4F1CA60] dictionary];
          [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v8];
        }
        dispatch_time_t v11 = [v10 objectForKeyedSubscript:v9];

        if (!v11)
        {
          [v10 setObject:v7 forKeyedSubscript:v9];
          [*(id *)(a1 + 48) setObject:v3 forKeyedSubscript:v7];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)PPTPrepareComplicationTest
{
  [(NTKFaceView *)self->_faceView removeFromSuperview];
  [MEMORY[0x1E4F39CF8] flush];
  dispatch_group_t v2 = (void *)MEMORY[0x1E4F39CF8];

  [v2 synchronize];
}

- (void)PPTCreateComplication:(id)a3 forSlot:(id)a4 synchronously:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  [(NTKFace *)self->_face faceStyle];
  [(NTKFace *)self->_face preferredComplicationFamilyForComplication:v15 withSlot:v8];
  [v15 complicationType];
  kdebug_trace();
  int64_t v9 = [(NTKFaceViewController *)self dataMode];
  if (v5) {
    [(NTKFaceViewController *)self setDataMode:3];
  }
  int v10 = [(id)objc_opt_class() _controllerForComplication:v15 face:self->_face slot:v8];
  pptComplicationController = self->_pptComplicationController;
  self->_pptComplicationController = v10;

  id v12 = [(NTKFaceViewController *)self _newNormalDisplayForComplicationController:self->_pptComplicationController slot:v8];
  pptComplicationDisplay = self->_pptComplicationDisplay;
  self->_pptComplicationDisplay = v12;

  long long v14 = [(NTKFaceViewController *)self view];
  [v14 addSubview:self->_pptComplicationDisplay];

  [MEMORY[0x1E4F39CF8] flush];
  [MEMORY[0x1E4F39CF8] synchronize];
  if (v5) {
    [(NTKFaceViewController *)self setDataMode:v9];
  }
  [(NTKFace *)self->_face faceStyle];
  [(NTKFace *)self->_face preferredComplicationFamilyForComplication:v15 withSlot:v8];
  [v15 complicationType];
  kdebug_trace();
}

- (void)PPTCleanupLastComplication
{
  [(NTKComplicationDisplayWrapperView *)self->_pptComplicationDisplay removeFromSuperview];
  [(NTKComplicationController *)self->_pptComplicationController removeDisplayWrapper:self->_pptComplicationDisplay];
  pptComplicationDisplay = self->_pptComplicationDisplay;
  self->_pptComplicationDisplay = 0;

  pptComplicationController = self->_pptComplicationController;
  self->_pptComplicationController = 0;

  BOOL v5 = [(NTKFaceViewController *)self view];
  [v5 addSubview:self->_faceView];

  id v6 = [(NTKFaceViewController *)self view];
  [v6 setNeedsLayout];
}

- (id)PPTDescriptionForComplication:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(a3, "complicationType"));
  uint64_t v4 = NTKComplicationTypeDescription(v3);

  return v4;
}

- (void)faceConfigurationDidChange:(id)a3
{
  if (self->_face == a3)
  {
    colorPickerConfig = self->_colorPickerConfig;
    self->_colorPickerConfig = 0;
    id v5 = a3;

    [(NTKFaceView *)self->_faceView populateFaceViewEditOptionsFromFace:v5];
    [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
    [(NTKFaceViewController *)self _clearFaceLaunchRect];
    [(NTKFaceViewController *)self _clearLastTappedComplication];
  }
}

- (void)faceResourceDirectoryDidChange:(id)a3
{
  [(NTKFaceViewController *)self _setFaceViewResourceDirectoryFromFace];

  [(NTKFaceViewController *)self _applyConfigurationWithDuration:0.0];
}

- (void)prepareToZoomWithIconView:(id)a3 minDiameter:(double)a4 maxDiameter:(double)a5
{
  kdebug_trace();
  self->_zoomingMinDiameter = a4;
  self->_zoomingMaxDiameter = a5;
  id v17 = [(NTKClockStatusBarViewController *)self->_statusBarViewController view];
  id v8 = [(NTKFaceViewController *)self view];
  [(NTKFaceView *)self->_faceView center];
  objc_msgSend(v8, "convertPoint:toView:", v17);
  double v10 = v9;
  double v12 = v11;

  [v17 bounds];
  double v13 = v10 / CGRectGetWidth(v19);
  [v17 bounds];
  double v14 = v12 / CGRectGetHeight(v20);
  id v15 = [v17 layer];
  objc_msgSend(v15, "setAnchorPoint:", v13, v14);

  [(NTKFaceView *)self->_faceView prepareToZoom];
  long long v16 = [(NTKFaceViewController *)self view];
  [v16 layoutIfNeeded];

  [(NTKFaceView *)self->_faceView layoutIfNeeded];
  [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:&__block_literal_global_81];
}

uint64_t __75__NTKFaceViewController_prepareToZoomWithIconView_minDiameter_maxDiameter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setFaceZooming:1];
}

- (void)setZoomFraction:(double)a3 iconDiameter:(double)a4
{
  kdebug_trace();
  double zoomingMaxDiameter = self->_zoomingMaxDiameter;
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, a4 / zoomingMaxDiameter, a4 / zoomingMaxDiameter);
  CGAffineTransform v10 = v11;
  [(NTKFaceView *)self->_faceView setTransform:&v10];
  CGAffineTransform v9 = v11;
  id v7 = [(NTKClockStatusBarViewController *)self->_statusBarViewController view];
  CGAffineTransform v8 = v9;
  [v7 setTransform:&v8];

  CLKInterpolateBetweenFloatsClipped();
  -[NTKFaceView setAlpha:](self->_faceView, "setAlpha:");
}

- (void)cleanupAfterZoom
{
  id v3 = [(NTKClockStatusBarViewController *)self->_statusBarViewController view];
  uint64_t v4 = [v3 layer];
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);

  id v5 = [(NTKClockStatusBarViewController *)self->_statusBarViewController view];
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v13[0] = *MEMORY[0x1E4F1DAB8];
  long long v10 = v13[0];
  v13[1] = v11;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v9 = v14;
  [v5 setTransform:v13];

  [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:&__block_literal_global_83];
  [(NTKFaceView *)self->_faceView cleanupAfterZoom];
  [(NTKFaceView *)self->_faceView setAlpha:1.0];
  faceView = self->_faceView;
  v12[0] = v10;
  v12[1] = v11;
  v12[2] = v9;
  [(NTKFaceView *)faceView setTransform:v12];
  id v7 = [(NTKFaceViewController *)self view];
  [v7 bounds];
  -[NTKFaceView setFrame:](self->_faceView, "setFrame:");

  CGAffineTransform v8 = [(NTKFaceViewController *)self view];
  [v8 setNeedsLayout];

  kdebug_trace();
}

uint64_t __41__NTKFaceViewController_cleanupAfterZoom__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setFaceZooming:0];
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  editView = self->_editView;
  if (editView) {
    goto LABEL_7;
  }
  if (!NTKStarbearEnabled()
    || [(NTKFaceView *)self->_faceView dataMode] != 3
    && ([(NTKFaceViewController *)self presentedViewController],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    editView = self->_faceView;
LABEL_7:
    id v8 = editView;
    char v7 = [v8 _wheelChangedWithEvent:v4];

    goto LABEL_8;
  }
  char v7 = 1;
LABEL_8:

  return v7;
}

- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4
{
  editView = self->_editView;
  if (!editView) {
    editView = self->_faceView;
  }
  id v7 = editView;
  char v8 = [v7 _handlePhysicalButton:a3 event:a4];

  return v8;
}

- (void)prepareWristRaiseAnimation
{
}

- (void)performWristRaiseAnimation
{
}

- (void)handleWristRaiseScreenWake
{
  [(NTKFaceViewController *)self _showStatusBarAfterWake];
  id v3 = [(NTKFaceViewController *)self _overrideDateForWake:1];
  [(NTKFaceView *)self->_faceView setOverrideDate:v3 duration:0.0];
  [(NTKFaceView *)self->_faceView handleWristRaiseScreenWake];
}

- (void)handleOrdinaryScreenWake
{
  [(NTKFaceViewController *)self _showStatusBarAfterWake];
  id v3 = [(NTKFaceViewController *)self _overrideDateForWake:1];
  [(NTKFaceView *)self->_faceView setOverrideDate:v3 duration:0.0];
  [(NTKFaceView *)self->_faceView handleOrdinaryScreenWake];
}

- (id)currentClockComplicationCountSet
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__NTKFaceViewController_currentClockComplicationCountSet__block_invoke;
  v17[3] = &unk_1E62C18F0;
  id v4 = v3;
  id v18 = v4;
  [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:v17];
  id v5 = [(NTKFaceView *)self->_faceView _additionalPrelaunchApplicationIdentifiers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F196A0]) initWithApplicationIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * v9) countOnFace:1 isWidget:1];
        [v4 appendCount:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
  id v11 = v4;

  return v11;
}

void __57__NTKFaceViewController_currentClockComplicationCountSet__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v8 = [v4 complication];
  uint64_t v5 = [v8 complicationType];
  uint64_t v6 = [v4 complicationApplicationIdentifier];

  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F196A0]) initWithApplicationIdentifier:v6 countOnFace:1 isWidget:v5 == 56];
    [*(id *)(a1 + 32) appendCount:v7];
  }
}

- (void)_showStatusBarAfterWake
{
  if (![(NTKFaceView *)self->_faceView wantsStatusBarHidden])
  {
    id v3 = [(NTKFaceViewController *)self statusBarViewController];
    id v4 = [v3 view];
    [v4 setAlpha:1.0];

    uint64_t v5 = [(NTKFaceViewController *)self statusBarViewController];
    [v5 showAnimated:0];

    uint64_t v6 = [(NTKFaceViewController *)self statusBarViewController];
    [v6 prepareToAnimate];

    id v7 = [(NTKFaceViewController *)self statusBarViewController];
    [v7 animate];
  }
}

- (void)_handleStatusBarChange
{
  uint64_t v3 = [(NTKClockStatusBarViewController *)self->_statusBarViewController isDisplayingStatus];
  faceView = self->_faceView;

  [(NTKFaceView *)faceView prepareForStatusChange:v3];
}

- (void)_removeComplicationForSlot:(id)a3
{
}

- (void)_ensureNormalComplication:(id)a3 forSlot:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_normalComplicationControllersLock);
  id v7 = [(NSMutableDictionary *)self->_normalComplicationControllers objectForKey:v6];
  os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
  if (!v7
    || ([v7 complication],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqual:v15],
        v8,
        (v9 & 1) == 0))
  {
    [(NTKFaceViewController *)self _removeNormalComplicationForSlot:v6 andDisconnectDisplay:1];
    long long v10 = [(id)objc_opt_class() _controllerForComplication:v15 face:self->_face slot:v6];
    id v11 = [(NTKFaceViewController *)self _newNormalDisplayForComplicationController:v10 slot:v6];
    [(NTKFaceViewController *)self _insertNormalComplicationDisplay:v11 controller:v10 forSlot:v6];
    double v12 = [(NTKFaceView *)self->_faceView device];
    if ((NTKShowGossamerUI(v12) & 1) == 0)
    {
      BOOL v13 = [(NTKFaceView *)self->_faceView _legacyShouldSwapGraphicCircularComplicationColors];

      if (!v13)
      {
LABEL_7:

        goto LABEL_8;
      }
      faceView = self->_faceView;
      double v12 = [v11 display];
      [(NTKFaceView *)faceView _configureComplicationView:v12 forSlot:v6];
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (void)_ensureDetachedComplication:(id)a3
{
  id v20 = a3;
  id v4 = [v20 identifier];
  uint64_t v5 = [v20 complication];
  os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
  id v6 = [(NSMutableDictionary *)self->_detachedComplicationControllers objectForKey:v4];
  os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);
  if (!v6
    || ([v6 complication],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqual:v5],
        v7,
        (v8 & 1) == 0))
  {
    [(NTKFaceViewController *)self _removeDetachedComplicationForSlot:v4 andDisconnectDisplay:1];
    uint64_t v9 = [v20 family];
    long long v10 = [(NTKFaceViewController *)self face];
    id v11 = [v10 device];
    double v12 = +[NTKComplicationVariant defaultVariantForFamily:v9 device:v11];

    BOOL v13 = [(NTKFaceViewController *)self face];
    long long v14 = [v13 device];
    id v15 = +[NTKComplicationController controllerForComplication:v5 variant:v12 device:v14];

    long long v16 = [NTKComplicationDisplayWrapperView alloc];
    id v17 = [v20 display];
    id v18 = -[NTKComplicationDisplayWrapperView initWithCustomTemplateDisplay:isDetachedDisplay:family:](v16, "initWithCustomTemplateDisplay:isDetachedDisplay:family:", v17, 1, [v20 family]);

    [(NTKComplicationDisplayWrapperView *)v18 setComplicationSlotIdentifier:v4];
    CGRect v19 = objc_opt_new();
    [v19 setFaceDataMode:self->_dataMode];
    [v15 setPauseDate:self->_pauseDate];
    [v15 addDisplayWrapper:v18 withDisplayProperties:v19];
    [(NTKFaceViewController *)self _insertDetachedComplicationDisplay:v18 controller:v15 forSlot:v4];
  }
}

- (void)_insertDetachedComplicationDisplay:(id)a3 controller:(id)a4 forSlot:(id)a5
{
  id v13 = a4;
  faceView = self->_faceView;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NTKFaceView *)faceView detachedComplicationDisplayWrapperForSlot:v9];
  [(NTKFaceView *)self->_faceView setDetachedComplicationDisplayWrapper:v10 forSlot:v9];

  os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
  [(NSMutableDictionary *)self->_detachedComplicationControllers setObject:v13 forKey:v9];
  os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);
  double v12 = [(NTKFaceView *)self->_faceView detachedComplicationDisplayWrapperForSlot:v9];

  if (v11 != v12) {
    [v13 removeDisplayWrapper:v11];
  }
}

- (void)_insertNormalComplicationDisplay:(id)a3 controller:(id)a4 forSlot:(id)a5
{
  id v13 = a4;
  faceView = self->_faceView;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NTKFaceView *)faceView normalComplicationDisplayWrapperForSlot:v9];
  [(NTKFaceView *)self->_faceView setNormalComplicationDisplayWrapper:v10 forSlot:v9];

  os_unfair_lock_lock(&self->_normalComplicationControllersLock);
  [(NSMutableDictionary *)self->_normalComplicationControllers setObject:v13 forKey:v9];
  os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
  double v12 = [(NTKFaceView *)self->_faceView normalComplicationDisplayWrapperForSlot:v9];

  if (v11 != v12) {
    [v13 removeDisplayWrapper:v11];
  }
  [(NTKFaceViewController *)self _updateInteractivityOfComplicationDisplays];
  [(NTKFaceViewController *)self _updateWidgetVisibilityOfComplicationDisplays];
}

- (void)_removeDetachedComplicationForSlot:(id)a3 andDisconnectDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = -[NTKFaceView detachedComplicationDisplayWrapperForSlot:](self->_faceView, "detachedComplicationDisplayWrapperForSlot:");
  if (v6)
  {
    [(NTKFaceView *)self->_faceView setDetachedComplicationDisplayWrapper:0 forSlot:v8];
    os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
    id v7 = [(NSMutableDictionary *)self->_detachedComplicationControllers objectForKey:v8];
    os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);
    if (v4) {
      [v7 removeDisplayWrapper:v6];
    }
    else {
      [v7 updatePropertiesForDisplayWrapper:v6 withBlock:&__block_literal_global_91];
    }
  }
  os_unfair_lock_lock(&self->_detachedComplicationControllersLock);
  [(NSMutableDictionary *)self->_detachedComplicationControllers removeObjectForKey:v8];
  os_unfair_lock_unlock(&self->_detachedComplicationControllersLock);
}

uint64_t __81__NTKFaceViewController__removeDetachedComplicationForSlot_andDisconnectDisplay___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFaceDataMode:0];
}

- (void)_removeNormalComplicationForSlot:(id)a3 andDisconnectDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = -[NTKFaceView normalComplicationDisplayWrapperForSlot:](self->_faceView, "normalComplicationDisplayWrapperForSlot:");
  if (v6)
  {
    [(NTKFaceView *)self->_faceView setNormalComplicationDisplayWrapper:0 forSlot:v8];
    os_unfair_lock_lock(&self->_normalComplicationControllersLock);
    id v7 = [(NSMutableDictionary *)self->_normalComplicationControllers objectForKey:v8];
    os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
    if (v4) {
      [v7 removeDisplayWrapper:v6];
    }
    else {
      [v7 updatePropertiesForDisplayWrapper:v6 withBlock:&__block_literal_global_93];
    }
  }
  os_unfair_lock_lock(&self->_normalComplicationControllersLock);
  [(NSMutableDictionary *)self->_normalComplicationControllers removeObjectForKey:v8];
  os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
}

uint64_t __79__NTKFaceViewController__removeNormalComplicationForSlot_andDisconnectDisplay___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFaceDataMode:0];
}

- (void)setSuppressFaceViewInteraction:(BOOL)a3
{
  if (self->_suppressFaceViewInteraction != a3)
  {
    self->_suppressFaceViewInteraction = a3;
    [(NTKFaceView *)self->_faceView setUserInteractionEnabled:!a3];
  }
}

- (void)_updateInteractivityOfComplicationDisplays
{
  BOOL v3 = [(NTKFaceViewController *)self _shouldWidgetComplicationsEnableTap];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__NTKFaceViewController__updateInteractivityOfComplicationDisplays__block_invoke;
  v4[3] = &__block_descriptor_33_e86_v32__0__NSString_8__NTKComplicationController_16__NTKComplicationDisplayWrapperView_24l;
  BOOL v5 = v3;
  [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:v4];
}

void __67__NTKFaceViewController__updateInteractivityOfComplicationDisplays__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__NTKFaceViewController__updateInteractivityOfComplicationDisplays__block_invoke_2;
  v8[3] = &unk_1E62C1960;
  char v10 = *(unsigned char *)(a1 + 32);
  id v9 = v6;
  id v7 = v6;
  [v7 updatePropertiesForDisplayWrapper:a4 withBlock:v8];
}

void __67__NTKFaceViewController__updateInteractivityOfComplicationDisplays__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = [*(id *)(a1 + 32) hasTapAction];
  }
  else {
    uint64_t v3 = 0;
  }
  [v4 setTapEnabled:v3];
  [v4 setDefaultTapAnimationEnabled:1];
}

- (BOOL)_shouldWidgetComplicationsEnableTap
{
  int64_t dataMode = self->_dataMode;
  if ((unint64_t)(dataMode - 3) < 2 || dataMode == 0) {
    return 0;
  }
  if (dataMode == 2) {
    return !self->_pausedForObstruction;
  }
  return 1;
}

- (id)_newNormalDisplayForComplicationController:(id)a3 slot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() _createNormalDisplayForComplicationController:v7 slot:v6 face:self->_face faceView:self->_faceView];
  [v8 addTarget:self action:sel__wrapperViewTapped_ forControlEvents:64];
  [(NTKFaceView *)self->_faceView configureComplicationViewDisplayWrapper:v8 forSlot:v6];

  id v9 = objc_opt_new();
  objc_msgSend(v9, "setShowPreview:", -[NTKFaceViewController shouldUseSampleTemplate](self, "shouldUseSampleTemplate"));
  [v9 setFaceDataMode:self->_dataMode];
  [v7 setPauseDate:self->_pauseDate];
  [v7 addDisplayWrapper:v8 withDisplayProperties:v9];

  return v8;
}

+ (id)_createNormalDisplayForComplicationController:(id)a3 slot:(id)a4 face:(id)a5 faceView:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v9 complication];
  uint64_t v14 = [v11 preferredComplicationFamilyForComplication:v13 withSlot:v10];
  id v15 = [v12 _filterProviderForSlot:v10];
  if ([v9 wantsLegacyDisplay])
  {
    long long v16 = (void *)[v12 newLegacyComplicationViewForSlot:v10 family:v14 complication:v13];
    if (!v16)
    {
      id v17 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v31 = 138412802;
        v32 = v13;
        __int16 v33 = 2112;
        id v34 = v10;
        __int16 v35 = 2048;
        uint64_t v36 = v14;
        _os_log_error_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_ERROR, "Missing legacy complication view for %@ slot %@ family %ld", (uint8_t *)&v31, 0x20u);
      }
    }
    id v18 = -[NTKComplicationDisplayWrapperView initWithLegacyDisplay:layoutOverride:]([NTKComplicationDisplayWrapperView alloc], "initWithLegacyDisplay:layoutOverride:", v16, [v12 legacyComplicationLayoutOverrideForSlot:v10 complication:v13]);
    [v12 configureComplicationView:v16 forSlot:v10];
  }
  else
  {
    CGRect v19 = objc_opt_class();
    id v20 = [v11 device];
    id v21 = [v19 richComplicationSlotsForDevice:v20];
    int v22 = [v21 containsObject:v10];

    BOOL v23 = (void *)[v9 richComplicationDisplayViewClass];
    if (v22 && (CGSize v24 = (objc_class *)v23) != 0)
    {
      if ([v23 instancesRespondToSelector:sel_initWithFamily_]) {
        id v25 = (id)[[v24 alloc] initWithFamily:v14];
      }
      else {
        id v25 = objc_alloc_init(v24);
      }
      BOOL v27 = v25;
      [v25 setFilterProvider:v15];
      [v12 configureComplicationView:v27 forSlot:v10];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v29 = [NTKComplicationDisplayWrapperView alloc];
      if (isKindOfClass) {
        uint64_t v30 = [(NTKComplicationDisplayWrapperView *)v29 initWithCustomTemplateDisplay:v27 isDetachedDisplay:0 family:v14];
      }
      else {
        uint64_t v30 = [(NTKComplicationDisplayWrapperView *)v29 initWithCustomRichDisplay:v27];
      }
      id v18 = (NTKComplicationDisplayWrapperView *)v30;
    }
    else
    {
      id v18 = [[NTKComplicationDisplayWrapperView alloc] initWithFamily:v14];
      if (!v22) {
        goto LABEL_13;
      }
    }
    [(NTKComplicationDisplayWrapperView *)v18 setFilterProvider:v15];
  }
LABEL_13:
  [(NTKComplicationDisplayWrapperView *)v18 setComplicationSlotIdentifier:v10];

  return v18;
}

+ (id)_controllerForComplication:(id)a3 face:(id)a4 slot:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 complicationVariantForComplication:v8 withSlot:a5];
  id v10 = [v7 device];

  id v11 = +[NTKComplicationController controllerForComplication:v8 variant:v9 device:v10];

  return v11;
}

- (void)setShouldUseSampleTemplate:(BOOL)a3
{
  if (self->_shouldUseSampleTemplate != a3)
  {
    self->_shouldUseSampleTemplate = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __52__NTKFaceViewController_setShouldUseSampleTemplate___block_invoke;
    v3[3] = &__block_descriptor_33_e86_v32__0__NSString_8__NTKComplicationController_16__NTKComplicationDisplayWrapperView_24l;
    BOOL v4 = a3;
    [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:v3];
  }
}

uint64_t __52__NTKFaceViewController_setShouldUseSampleTemplate___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__NTKFaceViewController_setShouldUseSampleTemplate___block_invoke_2;
  v5[3] = &__block_descriptor_33_e59_v16__0__NTKMutableComplicationControllerDisplayProperties_8l;
  char v6 = *(unsigned char *)(a1 + 32);
  return [a3 updatePropertiesForDisplayWrapper:a4 withBlock:v5];
}

uint64_t __52__NTKFaceViewController_setShouldUseSampleTemplate___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setShowPreview:*(unsigned __int8 *)(a1 + 32)];
}

- (id)_selectedVisibleSlotForEditMode:(int64_t)a3
{
  faceView = self->_faceView;
  BOOL v5 = -[NTKFace selectedSlotForEditMode:](self->_face, "selectedSlotForEditMode:");
  char v6 = [(NTKFaceView *)faceView closestVisibleSlotToSlot:v5 editMode:a3];

  return v6;
}

- (void)_validateIfCurrentSelectedColorStillExists
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__NTKFaceViewController__validateIfCurrentSelectedColorStillExists__block_invoke;
  aBlock[3] = &unk_1E62C19C8;
  aBlock[4] = self;
  uint64_t v3 = (void (**)(void *, void))_Block_copy(aBlock);
  BOOL v4 = [(NTKFaceViewController *)self face];
  BOOL v5 = [v4 slotsForCustomEditMode:10];

  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          v3[2](v3, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v3[2](v3, 0);
  }
}

void __67__NTKFaceViewController__validateIfCurrentSelectedColorStillExists__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) face];
  BOOL v4 = [v3 selectedOptionForCustomEditMode:10 slot:v8];

  BOOL v5 = [*(id *)(a1 + 32) faceView];
  id v6 = [v5 optionForCustomEditMode:10 slot:v8];

  if (([v4 isEqual:v6] & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 32) faceView];
    [v7 setOption:v4 forCustomEditMode:10 slot:v8];
  }
}

- (void)_configureBackgroundFillAlpha:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  if ([(NTKFaceView *)self->_faceView isEveryComplicationHidden])
  {
    BOOL v9 = a4 == 1 || a5 == 1;
    BOOL v10 = !v9;
    if (a4 != a5 && !v10)
    {
      double v11 = 1.0;
      if (a3 <= 1.0) {
        double v11 = a3;
      }
      [(NTKFaceEditView *)self->_editView setBackgroundFillAlpha:v11];
    }
  }
  id v17 = [(NTKFaceView *)self->_faceView _editModesDisabledByCurrentConfiguration];
  long long v12 = [NSNumber numberWithInteger:a5];
  int v13 = [v17 containsObject:v12];

  long long v14 = [NSNumber numberWithInteger:a4];
  int v15 = [v17 containsObject:v14];

  if (a4 != a5 && v13 | v15)
  {
    double v16 = 1.0;
    if (1.0 - a3 <= 1.0) {
      double v16 = 1.0 - a3;
    }
    [(NTKFaceEditView *)self->_editView setBackgroundFillAlpha:v16];
  }
}

- (CGRect)launchRectForComplicationApplicationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x4010000000;
  __int16 v35 = &unk_1BC8E8B0B;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  v36[0] = *MEMORY[0x1E4F1DB20];
  v36[1] = v5;
  if (self->_lastTappedSlotIdentifier)
  {
    os_unfair_lock_lock(&self->_normalComplicationControllersLock);
    id v6 = [(NSMutableDictionary *)self->_normalComplicationControllers objectForKeyedSubscript:self->_lastTappedSlotIdentifier];
    os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
    uint64_t v7 = [v6 complicationApplicationIdentifier];
    int v8 = [v7 isEqualToString:v4];

    if (v8)
    {
      BOOL v9 = [(NTKFaceView *)self->_faceView normalComplicationDisplayWrapperForSlot:self->_lastTappedSlotIdentifier];
      [v9 frame];
      BOOL v10 = v33;
      v33[4] = v11;
      v10[5] = v12;
      v10[6] = v13;
      v10[7] = v14;
    }
    int v15 = (CGRect *)(v33 + 4);
  }
  else
  {
    int v15 = (CGRect *)v36;
  }
  BOOL IsNull = CGRectIsNull(*v15);
  id v17 = (CGRect *)v33;
  if (IsNull)
  {
    CGSize size = self->_faceLaunchRect.size;
    *((_OWORD *)v33 + 2) = self->_faceLaunchRect.origin;
    v17[1].CGSize size = size;
  }
  if (CGRectIsNull(v17[1]))
  {
    os_unfair_lock_lock(&self->_normalComplicationControllersLock);
    CGRect v19 = (void *)[(NSMutableDictionary *)self->_normalComplicationControllers copy];
    os_unfair_lock_unlock(&self->_normalComplicationControllersLock);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __72__NTKFaceViewController_launchRectForComplicationApplicationIdentifier___block_invoke;
    v28[3] = &unk_1E62C19F0;
    uint64_t v30 = self;
    int v31 = &v32;
    id v29 = v4;
    [v19 enumerateKeysAndObjectsUsingBlock:v28];
  }
  double v20 = *((double *)v33 + 4);
  double v21 = *((double *)v33 + 5);
  double v22 = *((double *)v33 + 6);
  double v23 = *((double *)v33 + 7);
  _Block_object_dispose(&v32, 8);

  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

void __72__NTKFaceViewController_launchRectForComplicationApplicationIdentifier___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v15 = a2;
  uint64_t v7 = [a3 complicationApplicationIdentifier];
  int v8 = [v7 isEqualToString:a1[4]];

  if (v8)
  {
    BOOL v9 = [*(id *)(a1[5] + 1296) normalComplicationDisplayWrapperForSlot:v15];
    [v9 frame];
    BOOL v10 = *(void **)(a1[6] + 8);
    v10[4] = v11;
    v10[5] = v12;
    v10[6] = v13;
    v10[7] = v14;

    *a4 = 1;
  }
}

- (void)_clearLastTappedComplication
{
  lastTappedSlotIdentifier = self->_lastTappedSlotIdentifier;
  self->_lastTappedSlotIdentifier = 0;
}

- (void)_clearFaceLaunchRect
{
  CGSize v2 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_faceLaunchRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_faceLaunchRect.CGSize size = v2;
}

- (void)faceViewRequestedLaunchFromRect:(CGRect)a3
{
  self->_faceLaunchRect = a3;
  lastTappedSlotIdentifier = self->_lastTappedSlotIdentifier;
  self->_lastTappedSlotIdentifier = 0;
}

- (void)_wrapperViewTapped:(id)a3
{
  id v4 = [a3 complicationSlotIdentifier];
  lastTappedSlotIdentifier = self->_lastTappedSlotIdentifier;
  self->_lastTappedSlotIdentifier = v4;

  [(NTKFaceViewController *)self _clearFaceLaunchRect];
}

- (BOOL)shouldLoadLiveFaceAtNextScreenOff
{
  uint64_t v3 = [(NTKFaceViewController *)self _unadornedSnapshot];
  if (v3) {
    BOOL v4 = [(NTKFaceView *)self->_faceView _wantsOpportunisticLiveFaceLoading];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_dailySnapshot
{
  if (self->_shouldShowSnapshot && (NTKDebugNoSnapshotsInSwitcher() & 1) == 0)
  {
    uint64_t v3 = NTKSnapshotForFace(self->_face);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_unadornedSnapshot
{
  return NTKUnadornedSnapshotForFace(self->_face);
}

- (id)acquireComplicationTouchCancellationAssertion
{
  uint64_t v3 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__NTKFaceViewController_acquireComplicationTouchCancellationAssertion__block_invoke;
  v7[3] = &unk_1E62C18F0;
  id v8 = v3;
  id v4 = v3;
  [(NTKFaceViewController *)self enumerateComplicationControllersAndDisplaysWithBlock:v7];
  long long v5 = [[NTKInvalidatableGroup alloc] initWithInvalidatables:v4];

  return v5;
}

void __70__NTKFaceViewController_acquireComplicationTouchCancellationAssertion__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = [a4 display];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v7 acquireTouchCancellationAssertion];
    if (v5)
    {
      id v6 = (void *)v5;
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

- (NTKFaceViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKFaceViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NTKFaceViewControllerStatusBarDelegate)statusBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);

  return (NTKFaceViewControllerStatusBarDelegate *)WeakRetained;
}

- (void)setStatusBarDelegate:(id)a3
{
}

- (BOOL)shouldShowSnapshot
{
  return self->_shouldShowSnapshot;
}

- (BOOL)supressesNonSnapshotUI
{
  return self->_supressesNonSnapshotUI;
}

- (BOOL)shouldUseSampleTemplate
{
  return self->_shouldUseSampleTemplate;
}

- (int64_t)dataMode
{
  return self->_dataMode;
}

- (NSDate)pauseDate
{
  return self->_pauseDate;
}

- (BOOL)showsCanonicalContent
{
  return self->_showsCanonicalContent;
}

- (BOOL)showContentForUnadornedSnapshot
{
  return self->_showContentForUnadornedSnapshot;
}

- (BOOL)ignoreSnapshotImages
{
  return self->_ignoreSnapshotImages;
}

- (BOOL)showsLockedUI
{
  return self->_showsLockedUI;
}

- (BOOL)exitingEditing
{
  return self->_exitingEditing;
}

- (void)setExitingEditing:(BOOL)a3
{
  self->_exitingEditing = a3;
}

- (BOOL)suppressFaceViewInteraction
{
  return self->_suppressFaceViewInteraction;
}

- (BOOL)pausedForHomeScreen
{
  return self->_pausedForHomeScreen;
}

- (void)setPausedForHomeScreen:(BOOL)a3
{
  self->_pausedForHomeScreen = a3;
}

- (BOOL)pausedForObstruction
{
  return self->_pausedForObstruction;
}

- (void)setPausedForObstruction:(BOOL)a3
{
  self->_pausedForObstruction = a3;
}

- (BOOL)widgetsVisible
{
  return self->_widgetsVisible;
}

- (void)setWidgetsVisible:(BOOL)a3
{
  self->_widgetsVisible = a3;
}

- (BOOL)isOrbDisabled
{
  return self->_isOrbDisabled;
}

- (NTKClockStatusBarViewController)statusBarViewController
{
  return self->_statusBarViewController;
}

- (NTKFace)face
{
  return self->_face;
}

- (NTKFaceView)faceView
{
  return self->_faceView;
}

- (NTKTritiumAnimationController)tritiumAnimationController
{
  return self->_tritiumAnimationController;
}

- (NTKTritiumController)tritiumController
{
  return self->_tritiumController;
}

- (NHSUISClockAppearance)homeScreenAppearance
{
  return self->_homeScreenAppearance;
}

- (NSString)widgetIdentifierNamespace
{
  return self->_widgetIdentifierNamespace;
}

- (void)setWidgetIdentifierNamespace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIdentifierNamespace, 0);
  objc_storeStrong((id *)&self->_homeScreenAppearance, 0);
  objc_storeStrong((id *)&self->_tritiumController, 0);
  objc_storeStrong((id *)&self->_tritiumAnimationController, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_statusBarViewController, 0);
  objc_storeStrong((id *)&self->_pauseDate, 0);
  objc_destroyWeak((id *)&self->_statusBarDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tombstoneColor, 0);
  objc_storeStrong((id *)&self->_colorPickerConfig, 0);
  objc_storeStrong((id *)&self->_lastTappedSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_pptComplicationController, 0);
  objc_storeStrong((id *)&self->_pptComplicationDisplay, 0);
  objc_storeStrong((id *)&self->_time_travel_update_timer, 0);
  objc_storeStrong((id *)&self->_scrubDate, 0);
  objc_storeStrong((id *)&self->_delayedFreezeBlock, 0);
  objc_storeStrong((id *)&self->_informationVariantsCache, 0);
  objc_storeStrong((id *)&self->_appearanceVariantsCache, 0);
  objc_storeStrong((id *)&self->_editView, 0);
  objc_storeStrong((id *)&self->_detachedComplicationControllers, 0);

  objc_storeStrong((id *)&self->_normalComplicationControllers, 0);
}

@end