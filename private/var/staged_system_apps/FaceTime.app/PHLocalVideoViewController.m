@interface PHLocalVideoViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_isValidFaceTimeOrientation:(int64_t)a3;
- (BOOL)cachedIsUsingIPadExternalCamera;
- (BOOL)deviceIsFrontFacingOrExternal:(id)a3;
- (BOOL)didDeferStartCameraAction;
- (BOOL)isReadyForPreview;
- (BOOL)isUsingIPadExternalCamera;
- (BOOL)localVideoLayersAreAssociated;
- (BOOL)screensaverActive;
- (BOOL)shouldDeferStartCameraAction;
- (BOOL)shouldDisableEdgeClip;
- (BOOL)showsLocalPreviewStatusBarGradient;
- (BOOL)supportsAutoRotation;
- (BOOL)waitingForLocalVideoFirstFrame;
- (PHLocalVideoDisabledOverlayView)disabledOverlayView;
- (PHLocalVideoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TUFeatureFlags)featureFlags;
- (UIControl)videoGroupView;
- (UIView)localVideoStatusBarGradientView;
- (UIView)localVideoView;
- (id)_scene;
- (int)_tuVideoDeviceOrientationForDeviceOrientation:(int64_t)a3;
- (int64_t)lastKnownOrientation;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_adjustForOrientationAnimated:(BOOL)a3;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationEnteredBackground:(id)a3;
- (void)_applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:(id)a3;
- (void)_applyAutoRotationCorrectionForOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)_applyPreviewMSROptimizationTransformsForOrientation:(int64_t)a3;
- (void)_avFirstPreviewFrameArrived:(id)a3;
- (void)_dissociateVideoLayers;
- (void)_ensureLocalVideoWillBecomeVisible;
- (void)_ensureVideoLayersExist;
- (void)_fadeInLocalVideo;
- (void)_handleLocalCameraAvailableNotification:(id)a3;
- (void)_handleLocalCameraErrorNotification:(id)a3;
- (void)_handleLocalCameraUIDChangedNotification:(id)a3;
- (void)_handleSystemPreferredCameraChangedNotification:(id)a3;
- (void)_handleVideoPreviewDidStartNotification:(id)a3;
- (void)_previewMSROptimizationCompensationForOrientation:(int64_t)a3 withTransform:(CGAffineTransform *)a4 withBounds:(CGRect *)a5;
- (void)_setupVideoLayers;
- (void)_updateLocalPreviewStatusBarGradient;
- (void)_updateLocalVideoOrientationAnimated:(BOOL)a3;
- (void)associateLocalVideoLayers;
- (void)dealloc;
- (void)fadeInAnimated:(BOOL)a3;
- (void)fadeOutAnimated:(BOOL)a3;
- (void)loadView;
- (void)setCachedIsUsingIPadExternalCamera:(BOOL)a3;
- (void)setDidDeferStartCameraAction:(BOOL)a3;
- (void)setDisabledOverlayView:(id)a3;
- (void)setLastKnownOrientation:(int64_t)a3;
- (void)setLocalVideoStatusBarGradientView:(id)a3;
- (void)setLocalVideoView:(id)a3;
- (void)setReadyForPreview:(BOOL)a3;
- (void)setScreensaverActive:(BOOL)a3;
- (void)setShowsLocalPreviewStatusBarGradient:(BOOL)a3;
- (void)setSupportsAutoRotation:(BOOL)a3;
- (void)setVideoGroupView:(id)a3;
- (void)setWaitingForLocalVideoFirstFrame:(BOOL)a3;
- (void)startPreview;
- (void)stopPreview;
- (void)updateViewControllerForOrientation:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PHLocalVideoViewController

- (void)_applyAutoRotationCorrectionForOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  unsigned __int8 v6 = [(PHLocalVideoViewController *)self supportsAutoRotation];
  v7 = sub_100012C68();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LODWORD(buf.a) = 134217984;
      *(void *)((char *)&buf.a + 4) = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController _applyAutoRotationCorrectionForOrientation %lu (supportsAutoRotation = YES)", (uint8_t *)&buf, 0xCu);
    }

    [(UIControl *)self->_videoGroupView bounds];
    double v11 = v9;
    double v12 = v10;
    double v44 = v13;
    double v45 = v14;
    double v46 = v9;
    double v47 = v10;
    long long v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&buf.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&buf.c = v15;
    *(_OWORD *)&buf.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    switch(a3)
    {
      case 1:
        break;
      case 2:
        CGFloat v16 = 3.14159203;
        goto LABEL_13;
      case 3:
        double v44 = 0.0;
        double v45 = 0.0;
        double v46 = v10;
        double v47 = v9;
        CGFloat v16 = -1.57079633;
        goto LABEL_13;
      case 4:
        double v44 = 0.0;
        double v45 = 0.0;
        double v46 = v10;
        double v47 = v9;
        CGFloat v16 = 1.57079633;
LABEL_13:
        CGAffineTransformMakeRotation(&buf, v16);
        break;
      default:
        v17 = [(PHLocalVideoViewController *)self localVideoView];
        v18 = v17;
        if (v17) {
          [v17 transform];
        }
        else {
          memset(&v43, 0, sizeof(v43));
        }
        CGAffineTransform buf = v43;

        break;
    }
    v19 = [(PHLocalVideoViewController *)self featureFlags];
    unsigned int v20 = [v19 previewMSROptimizationEnabled];

    if (v20) {
      [(PHLocalVideoViewController *)self _previewMSROptimizationCompensationForOrientation:a3 withTransform:&buf withBounds:&v44];
    }
    v21 = [(PHLocalVideoViewController *)self localVideoView];
    [v21 setCenter:v11 * 0.5, v12 * 0.5];

    if ([(PHLocalVideoViewController *)self isUsingIPadExternalCamera])
    {
      v22 = [(PHLocalVideoViewController *)self featureFlags];
      double v23 = 0.0;
      double v24 = 0.0;
      if ([v22 previewMSROptimizationEnabled])
      {
        [(UIControl *)self->_videoGroupView bounds];
        double v23 = v25;
        double v24 = v26;
        double v12 = v27;
        double v11 = v28;
      }
      v29 = [(PHLocalVideoViewController *)self localVideoView];
      [v29 setBounds:v23, v24, v12, v11];

      v30 = [(PHLocalVideoViewController *)self featureFlags];
      unsigned int v31 = [v30 previewMSROptimizationEnabled];
      double v32 = -1.57079633;
      if (v31) {
        double v32 = 3.14159203;
      }
      CGAffineTransformMakeRotation(&v42, v32);
      v33 = [(PHLocalVideoViewController *)self localVideoView];
      CGAffineTransform v41 = v42;
      [v33 setTransform:&v41];
    }
    else
    {
      double v34 = v44;
      double v35 = v45;
      double v36 = v46;
      double v37 = v47;
      v38 = [(PHLocalVideoViewController *)self localVideoView];
      [v38 setBounds:v34, v35, v36, v37];

      CGAffineTransform v40 = buf;
      v30 = [(PHLocalVideoViewController *)self localVideoView];
      CGAffineTransform v39 = v40;
      [v30 setTransform:&v39];
    }
  }
  else
  {
    if (v8)
    {
      LODWORD(buf.a) = 134217984;
      *(void *)((char *)&buf.a + 4) = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController _applyAutoRotationCorrectionForOrientation %lu (supportsAutoRotation = NO)", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (void)_avFirstPreviewFrameArrived:(id)a3
{
  if ([(PHLocalVideoViewController *)self waitingForLocalVideoFirstFrame])
  {
    v4 = sub_100012C68();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "First frame arrived: fading in local video", buf, 2u);
    }

    [(PHLocalVideoViewController *)self setWaitingForLocalVideoFirstFrame:0];
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_autoFadeInLocalVideo" object:0];
    [(PHLocalVideoViewController *)self _fadeInLocalVideo];
  }
  v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "First local video frame arrived, updating the video layer in case the camera source changed", v6, 2u);
  }

  [(PHLocalVideoViewController *)self _applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:0];
}

- (void)_applicationDidBecomeActive:(id)a3
{
  [(PHLocalVideoViewController *)self _updateLocalVideoOrientationAnimated:0];
  v4 = sub_100012C68();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController _applicationDidBecomeActive", v5, 2u);
  }

  if ([(PHLocalVideoViewController *)self isViewLoaded])
  {
    [(PHLocalVideoViewController *)self startPreview];
    [(PHLocalVideoViewController *)self _updateLocalPreviewStatusBarGradient];
  }
}

- (void)associateLocalVideoLayers
{
  [(PHLocalVideoViewController *)self _ensureVideoLayersExist];
  id v5 = +[TUCallCenter sharedInstance];
  v3 = [v5 videoDeviceController];
  v4 = [(UIView *)self->_localVideoView layer];
  [v3 setLocalFrontLayer:v4];
}

- (void)_handleVideoPreviewDidStartNotification:(id)a3
{
  v4 = sub_100012C68();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Local preview did start notification, we'll remove the disabled overlay view if it exists", v7, 2u);
  }

  id v5 = [(PHLocalVideoViewController *)self disabledOverlayView];

  if (v5)
  {
    unsigned __int8 v6 = [(PHLocalVideoViewController *)self disabledOverlayView];
    [v6 removeFromSuperview];

    [(PHLocalVideoViewController *)self setDisabledOverlayView:0];
  }
}

- (void)fadeInAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(PHLocalVideoViewController *)self view];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A718;
  v7[3] = &unk_1000A1D50;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  id v5 = objc_retainBlock(v7);
  unsigned __int8 v6 = v5;
  if (v3) {
    +[UIView animateWithDuration:v5 animations:0.400000006];
  }
  else {
    ((void (*)(void *))v5[2])(v5);
  }
}

- (void)updateViewControllerForOrientation:(int64_t)a3
{
  if ([(PHLocalVideoViewController *)self supportsAutoRotation])
  {
    [(PHLocalVideoViewController *)self _applyAutoRotationCorrectionForOrientation:a3 withTransitionCoordinator:0];
  }
  else
  {
    id v5 = sub_100012C68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController.updateViewControllerForOrientation: Ignoring since supportsAutoRotation = NO", v8, 2u);
    }

    unsigned __int8 v6 = [(PHLocalVideoViewController *)self featureFlags];
    unsigned int v7 = [v6 previewMSROptimizationEnabled];

    if (v7) {
      [(PHLocalVideoViewController *)self _applyPreviewMSROptimizationTransformsForOrientation:a3];
    }
  }
}

- (void)_applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(PHLocalVideoViewController *)self view];
  unsigned __int8 v6 = [v5 window];
  unsigned int v7 = [v6 windowScene];

  if (v7)
  {
    id v8 = objc_opt_new();
    double v9 = [v8 compose];

    -[PHLocalVideoViewController _applyAutoRotationCorrectionForOrientation:withTransitionCoordinator:](self, "_applyAutoRotationCorrectionForOrientation:withTransitionCoordinator:", [v9 makeInterfaceOrientationFrom:[v9 deviceOrientation] whenFailing:[v7 interfaceOrientation]], v4);
  }
  else
  {
    double v10 = sub_100012C68();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to apply auto-rotation correction because there's no window scene to determine a valid fallback orientation", v11, 2u);
    }
  }
}

- (void)_handleSystemPreferredCameraChangedNotification:(id)a3
{
  id v4 = sub_100012C68();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "System preferred camera changed", buf, 2u);
  }

  if ([(PHLocalVideoViewController *)self didDeferStartCameraAction])
  {
    id v5 = +[AVCaptureDevice systemPreferredCamera];

    unsigned __int8 v6 = sub_100012C68();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)double v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting camera that was deferred due to systemPreferredCamera initialization", v9, 2u);
      }

      [(PHLocalVideoViewController *)self setDidDeferStartCameraAction:0];
      [(PHLocalVideoViewController *)self startPreview];
    }
    else
    {
      if (v7)
      {
        *(_WORD *)double v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring change to systemPreferredCamera because it's nil", v10, 2u);
      }
    }
  }
  else
  {
    id v8 = sub_100012C68();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring change to systemPreferredCamera because there's no pending start camera action", v11, 2u);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHLocalVideoViewController;
  [(PHLocalVideoViewController *)&v4 viewDidAppear:a3];
  [(PHLocalVideoViewController *)self _ensureLocalVideoWillBecomeVisible];
}

- (void)_ensureLocalVideoWillBecomeVisible
{
  BOOL v3 = sub_100012C68();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    double v9 = self;
    __int16 v10 = 2080;
    double v11 = "-[PHLocalVideoViewController _ensureLocalVideoWillBecomeVisible]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v8, 0x16u);
  }

  objc_super v4 = [(PHLocalVideoViewController *)self localVideoView];
  [v4 setHidden:0];

  id v5 = [(PHLocalVideoViewController *)self localVideoView];
  [v5 alpha];
  double v7 = v6;

  if (v7 == 0.0) {
    [(PHLocalVideoViewController *)self performSelector:"_autoFadeInLocalVideo" withObject:0 afterDelay:0.5];
  }
  else {
    self->_waitingForLocalVideoFirstFrame = 0;
  }
}

- (UIView)localVideoView
{
  return self->_localVideoView;
}

- (PHLocalVideoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PHLocalVideoViewController;
  objc_super v4 = [(PHLocalVideoViewController *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = +[UIDevice currentDevice];
    id v6 = [v5 userInterfaceIdiom];

    if (v6 == (id)1) {
      v4->_showsLocalPreviewStatusBarGradient = 1;
    }
    if ([UIApp contentViewCanRotate]) {
      v4->_supportsAutoRotation = 1;
    }
    double v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v4 selector:"_avFirstPreviewFrameArrived:" name:TUVideoDeviceControllerReceivedFirstPreviewFrameNotification object:0];
    [v7 addObserver:v4 selector:"_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
    [v7 addObserver:v4 selector:"_applicationEnteredBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
    [v7 addObserver:v4 selector:"_handleLocalCameraErrorNotification:" name:TUVideoDeviceControllerDeviceDidReceiveErrorNotification object:0];
    [v7 addObserver:v4 selector:"_handleLocalCameraAvailableNotification:" name:TUVideoDeviceControllerDeviceBecameAvailableNotification object:0];
    [v7 addObserver:v4 selector:"_handleVideoPreviewDidStartNotification:" name:TUVideoDeviceControllerDidStartPreviewNotification object:0];
    [v7 addObserver:v4 selector:"_handleSystemPreferredCameraChangedNotification:" name:TUVideoDeviceControllerSystemPreferredCameraChangedNotification object:0];
    [v7 addObserver:v4 selector:"_handleLocalCameraUIDChangedNotification:" name:TUVideoDeviceControllerDidChangeLocalCameraUIDNotification object:0];
    int v8 = +[UIDevice currentDevice];
    v4->_lastKnownOrientation = (int64_t)[v8 orientation];

    if (![(PHLocalVideoViewController *)v4 _isValidFaceTimeOrientation:v4->_lastKnownOrientation])v4->_lastKnownOrientation = [(PHLocalVideoViewController *)v4 supportsAutoRotation] ^ 1; {
    double v9 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    }
    featureFlags = v4->_featureFlags;
    v4->_featureFlags = v9;

    v4->_readyForPreview = 1;
    v4->_screensaverActive = 0;
  }
  return v4;
}

- (void)_ensureVideoLayersExist
{
  BOOL v3 = [(PHLocalVideoViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (!self->_videoGroupView)
  {
    objc_super v12 = (UIControl *)[objc_alloc((Class)UIControl) initWithFrame:v5, v7, v9, v11];
    videoGroupView = self->_videoGroupView;
    self->_videoGroupView = v12;

    [(UIControl *)self->_videoGroupView setAutoresizingMask:18];
    double v14 = [(UIControl *)self->_videoGroupView layer];
    [v14 setName:@"PHLocalVideoControllerGroupView"];

    long long v15 = [(PHLocalVideoViewController *)self view];
    [v15 addSubview:self->_videoGroupView];
  }
  if (!self->_localVideoView)
  {
    CGFloat v16 = [(UIView *)[objc_alloc((Class)UIView) initWithFrame:v5, v7, v9, v11];
    localVideoView = self->_localVideoView;
    self->_localVideoView = v16;

    [(UIView *)self->_localVideoView setAutoresizingMask:18];
    v18 = [(UIView *)self->_localVideoView layer];
    [v18 setContentsGravity:kCAGravityResizeAspectFill];

    v19 = [(UIView *)self->_localVideoView layer];
    [v19 setMasksToBounds:1];

    unsigned int v20 = [(UIView *)self->_localVideoView layer];
    [v20 setName:@"PHLocalVideoControllerLocalVideoView"];

    [(UIControl *)self->_videoGroupView addSubview:self->_localVideoView];
    [(PHLocalVideoViewController *)self setWaitingForLocalVideoFirstFrame:1];
  }
}

- (void)_updateLocalVideoOrientationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHLocalVideoViewController *)self isUsingIPadExternalCamera]
    || (+[UIDevice currentDevice],
        double v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 userInterfaceIdiom],
        v5,
        v6 == (id)5))
  {
    id v13 = +[TUCallCenter sharedInstance];
    double v7 = [v13 videoDeviceController];
    [v7 setCurrentVideoOrientation:2];
  }
  else
  {
    double v8 = +[UIDevice currentDevice];
    lastKnownOrientation = (char *)[v8 orientation];

    if (![(PHLocalVideoViewController *)self _isValidFaceTimeOrientation:lastKnownOrientation])lastKnownOrientation = (char *)self->_lastKnownOrientation; {
    if ((unint64_t)(lastKnownOrientation - 1) <= 3)
    }
    {
      uint64_t v10 = [(PHLocalVideoViewController *)self _tuVideoDeviceOrientationForDeviceOrientation:lastKnownOrientation];
      double v11 = +[TUCallCenter sharedInstance];
      objc_super v12 = [v11 videoDeviceController];
      [v12 setCurrentVideoOrientation:v10];

      [(PHLocalVideoViewController *)self _adjustForOrientationAnimated:v3];
    }
  }
}

- (BOOL)isUsingIPadExternalCamera
{
  BOOL v3 = [(PHLocalVideoViewController *)self featureFlags];
  if ([v3 wombatWisdomEnabled])
  {
    double v4 = +[TUCallCenter sharedInstance];
    double v5 = [v4 videoDeviceController];
    if ([v5 currentInputIsExternal])
    {
      id v6 = +[UIDevice currentDevice];
      BOOL v7 = [v6 userInterfaceIdiom] == (id)1;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  if (v7 != [(PHLocalVideoViewController *)self cachedIsUsingIPadExternalCamera])
  {
    double v8 = sub_100012C68();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updated cachedIsUsingIPadExternalCamera to %d", (uint8_t *)v10, 8u);
    }

    [(PHLocalVideoViewController *)self setCachedIsUsingIPadExternalCamera:v7];
  }
  return v7;
}

- (BOOL)cachedIsUsingIPadExternalCamera
{
  return self->_cachedIsUsingIPadExternalCamera;
}

- (int)_tuVideoDeviceOrientationForDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) < 3) {
    return a3 - 1;
  }
  else {
    return 0;
  }
}

- (void)startPreview
{
  BOOL v3 = [(PHLocalVideoViewController *)self _scene];
  double v4 = v3;
  if (!v3 || [v3 activationState] && objc_msgSend(v4, "activationState") != (id)1)
  {
    double v8 = sub_100012C68();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)CGAffineTransform buf = 0;
    double v11 = "PHLocalVideoViewController rejected a start preview request because the scene is not in the foreground";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    goto LABEL_41;
  }
  if (![(PHLocalVideoViewController *)self isReadyForPreview])
  {
    double v8 = sub_100012C68();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)CGAffineTransform buf = 0;
    double v11 = "PHLocalVideoViewController rejected a start preview request because the client has not indicated it is ready";
    goto LABEL_15;
  }
  double v5 = [(PHLocalVideoViewController *)self featureFlags];
  unsigned int v6 = [v5 previewMSROptimizationEnabled];

  if (v6) {
    [(PHLocalVideoViewController *)self associateLocalVideoLayers];
  }
  BOOL v7 = +[TUCallCenter sharedInstance];
  double v8 = [v7 videoDeviceController];

  double v9 = [v8 currentInputDevice];
  if ([(PHLocalVideoViewController *)self shouldDeferStartCameraAction])
  {
    uint64_t v10 = sub_100012C68();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deferring start camera action until systemPreferredCamera is initialized", buf, 2u);
    }

    [(PHLocalVideoViewController *)self setDidDeferStartCameraAction:1];
  }
  else
  {
    if (!v9
      || ![(PHLocalVideoViewController *)self deviceIsFrontFacingOrExternal:v9])
    {
      objc_super v12 = sub_100012C68();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resetting camera on TUVideoDeviceController to be front-facing or external", buf, 2u);
      }

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = [v8 inputDevices];
      id v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v25;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            if ([(PHLocalVideoViewController *)self deviceIsFrontFacingOrExternal:v18])
            {
              [v8 setCurrentInputDevice:v18];
              goto LABEL_30;
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_30:
    }
    v19 = sub_100012C68();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController startPreview", buf, 2u);
    }

    unsigned int v20 = [(PHLocalVideoViewController *)self disabledOverlayView];

    if (v20)
    {
      v21 = [(PHLocalVideoViewController *)self disabledOverlayView];
      [v21 removeFromSuperview];

      [(PHLocalVideoViewController *)self setDisabledOverlayView:0];
    }
    v22 = [v8 currentInputDevice];

    if (v22)
    {
      [v8 startPreview];
    }
    else
    {
      double v23 = sub_100012C68();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController was asked to start preview, but the current input device is nil", buf, 2u);
      }
    }
  }

LABEL_41:
}

- (id)_scene
{
  v2 = [(PHLocalVideoViewController *)self view];
  BOOL v3 = [v2 window];
  double v4 = [v3 windowScene];

  return v4;
}

- (BOOL)shouldDeferStartCameraAction
{
  v2 = [(PHLocalVideoViewController *)self featureFlags];
  if ([v2 wombatWisdomEnabled])
  {
    BOOL v3 = +[UIDevice currentDevice];
    if ([v3 userInterfaceIdiom] == (id)1)
    {
      double v4 = +[AVCaptureDevice systemPreferredCamera];
      BOOL v5 = v4 == 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)isReadyForPreview
{
  return self->_readyForPreview;
}

- (PHLocalVideoDisabledOverlayView)disabledOverlayView
{
  return self->_disabledOverlayView;
}

- (BOOL)deviceIsFrontFacingOrExternal:(id)a3
{
  id v3 = a3;
  if ([v3 position] == (id)2)
  {
    BOOL v4 = 1;
  }
  else
  {
    AVCaptureDeviceType v5 = [v3 deviceType];
    BOOL v4 = v5 == AVCaptureDeviceTypeExternal;
  }
  return v4;
}

- (void)_adjustForOrientationAnimated:(BOOL)a3
{
  BOOL v4 = +[UIDevice currentDevice];
  id lastKnownOrientation = [v4 orientation];

  if (![(PHLocalVideoViewController *)self _isValidFaceTimeOrientation:lastKnownOrientation])
  {
    if ([(PHLocalVideoViewController *)self _isValidFaceTimeOrientation:self->_lastKnownOrientation])
    {
      id lastKnownOrientation = self->_lastKnownOrientation;
    }
    else
    {
      id lastKnownOrientation = [UIApp statusBarOrientation];
    }
  }
  if ([UIApp isStatusBarHidden]
    && ![(PHLocalVideoViewController *)self supportsAutoRotation])
  {
    int64_t v6 = +[PHInCallUIUtilities interfaceOrientationForDeviceOrientation:lastKnownOrientation];
    [UIApp setStatusBarOrientation:v6];
  }
  self->_id lastKnownOrientation = (int64_t)lastKnownOrientation;
}

- (BOOL)_isValidFaceTimeOrientation:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 4;
}

- (void)_updateLocalPreviewStatusBarGradient
{
  unsigned int v3 = [(PHLocalVideoViewController *)self showsLocalPreviewStatusBarGradient];
  localVideoStatusBarGradientView = self->_localVideoStatusBarGradientView;
  if (v3)
  {
    if (!localVideoStatusBarGradientView)
    {
      AVCaptureDeviceType v5 = [(PHLocalVideoViewController *)self view];
      [v5 bounds];
      double v7 = v6;

      double v8 = -[PHStatusBarGradientView initWithFrame:]([PHStatusBarGradientView alloc], "initWithFrame:", 0.0, 0.0, v7, 40.0);
      double v9 = self->_localVideoStatusBarGradientView;
      self->_localVideoStatusBarGradientView = &v8->super;

      [(UIView *)self->_localVideoStatusBarGradientView setAutoresizingMask:34];
      uint64_t v10 = [(PHLocalVideoViewController *)self view];
      [v10 addSubview:self->_localVideoStatusBarGradientView];

      localVideoStatusBarGradientView = self->_localVideoStatusBarGradientView;
    }
    double v11 = 1.0;
  }
  else
  {
    double v11 = 0.0;
  }

  [(UIView *)localVideoStatusBarGradientView setAlpha:v11];
}

- (BOOL)showsLocalPreviewStatusBarGradient
{
  return self->_showsLocalPreviewStatusBarGradient;
}

- (BOOL)waitingForLocalVideoFirstFrame
{
  return self->_waitingForLocalVideoFirstFrame;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHLocalVideoViewController;
  [(PHLocalVideoViewController *)&v4 viewWillAppear:a3];
  [(PHLocalVideoViewController *)self _updateLocalVideoOrientationAnimated:0];
  if ([(PHLocalVideoViewController *)self isViewLoaded])
  {
    [(PHLocalVideoViewController *)self startPreview];
    [(PHLocalVideoViewController *)self _updateLocalPreviewStatusBarGradient];
  }
}

- (BOOL)supportsAutoRotation
{
  return self->_supportsAutoRotation;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)setWaitingForLocalVideoFirstFrame:(BOOL)a3
{
  self->_waitingForLocalVideoFirstFrame = a3;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 3;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)PHLocalVideoViewController;
  [(PHLocalVideoViewController *)&v3 loadView];
  [(PHLocalVideoViewController *)self _setupVideoLayers];
  [(PHLocalVideoViewController *)self startPreview];
  [(PHLocalVideoViewController *)self _updateLocalPreviewStatusBarGradient];
}

- (BOOL)didDeferStartCameraAction
{
  return self->_didDeferStartCameraAction;
}

- (void)_setupVideoLayers
{
  [(PHLocalVideoViewController *)self associateLocalVideoLayers];

  [(PHLocalVideoViewController *)self _updateLocalVideoOrientationAnimated:0];
}

- (void)dealloc
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(PHLocalVideoViewController *)self stopPreview];
  [(PHLocalVideoViewController *)self _dissociateVideoLayers];
  v4.receiver = self;
  v4.super_class = (Class)PHLocalVideoViewController;
  [(PHLocalVideoViewController *)&v4 dealloc];
}

- (BOOL)shouldDisableEdgeClip
{
  return 0;
}

- (void)fadeOutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(PHLocalVideoViewController *)self view];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036FCC;
  v7[3] = &unk_1000A1D50;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  AVCaptureDeviceType v5 = objc_retainBlock(v7);
  double v6 = v5;
  if (v3) {
    +[UIView animateWithDuration:v5 animations:0.400000006];
  }
  else {
    ((void (*)(void *))v5[2])(v5);
  }
}

- (BOOL)localVideoLayersAreAssociated
{
  BOOL v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 videoDeviceController];
  AVCaptureDeviceType v5 = [v4 localFrontLayer];
  double v6 = [(UIView *)self->_localVideoView layer];
  unsigned __int8 v7 = [v5 isEqual:v6];

  return v7;
}

- (void)_dissociateVideoLayers
{
  BOOL v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 videoDeviceController];

  AVCaptureDeviceType v5 = [v4 localFrontLayer];
  double v6 = [(UIView *)self->_localVideoView layer];

  if (v5 == v6)
  {
    [v4 setLocalFrontLayer:0];
  }
  else
  {
    unsigned __int8 v7 = sub_100012C68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Not clearing the local front video layer because this isn't the current displayController's layer", v8, 2u);
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHLocalVideoViewController;
  [(PHLocalVideoViewController *)&v5 viewDidDisappear:a3];
  id v4 = [(PHLocalVideoViewController *)self localVideoView];
  [v4 setAlpha:0.0];

  [(PHLocalVideoViewController *)self setWaitingForLocalVideoFirstFrame:1];
  [(PHLocalVideoViewController *)self stopPreview];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)_applicationEnteredBackground:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [v4 name];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping preview due to application notification %@", (uint8_t *)&v7, 0xCu);
  }
  [(PHLocalVideoViewController *)self stopPreview];
}

- (void)_previewMSROptimizationCompensationForOrientation:(int64_t)a3 withTransform:(CGAffineTransform *)a4 withBounds:(CGRect *)a5
{
  id v8 = sub_100012C68();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = NSStringFromCGRect(*a5);
    LODWORD(buf.a) = 138412290;
    *(void *)((char *)&buf.a + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHLocalVideoViewController _previewMSROptimizationCompensationForTransform bounds %@", (uint8_t *)&buf, 0xCu);
  }
  a5->origin.x = 0.0;
  a5->origin.y = 0.0;
  a5->size = (CGSize)vextq_s8((int8x16_t)a5->size, (int8x16_t)a5->size, 8uLL);
  CGFloat v10 = dbl_10007DBA0[(unint64_t)(a3 - 3) < 2];
  if ((unint64_t)(a3 - 3) >= 2) {
    double v11 = -1.0;
  }
  else {
    double v11 = 1.0;
  }
  if ((unint64_t)(a3 - 3) >= 2) {
    double v12 = 1.0;
  }
  else {
    double v12 = -1.0;
  }
  long long v13 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v17.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v17.c = v13;
  *(_OWORD *)&v17.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformRotate(&buf, &v17, v10);
  long long v14 = *(_OWORD *)&buf.c;
  *(_OWORD *)&a4->a = *(_OWORD *)&buf.a;
  *(_OWORD *)&a4->c = v14;
  *(_OWORD *)&a4->tx = *(_OWORD *)&buf.tx;
  long long v15 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v17.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v17.c = v15;
  *(_OWORD *)&v17.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformScale(&buf, &v17, v12, v11);
  long long v16 = *(_OWORD *)&buf.c;
  *(_OWORD *)&a4->a = *(_OWORD *)&buf.a;
  *(_OWORD *)&a4->c = v16;
  *(_OWORD *)&a4->tx = *(_OWORD *)&buf.tx;
}

- (void)_applyPreviewMSROptimizationTransformsForOrientation:(int64_t)a3
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v24 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v25 = v5;
  long long v26 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(UIControl *)self->_videoGroupView bounds];
  double v20 = v6;
  double v21 = v7;
  double v22 = v8;
  double v23 = v9;
  [(PHLocalVideoViewController *)self _previewMSROptimizationCompensationForOrientation:a3 withTransform:&v24 withBounds:&v20];
  double v10 = v20;
  double v11 = v21;
  double v12 = v22;
  double v13 = v23;
  long long v14 = [(PHLocalVideoViewController *)self localVideoView];
  [v14 setBounds:v10, v11, v12, v13];

  long long v17 = v24;
  long long v18 = v25;
  long long v19 = v26;
  long long v15 = [(PHLocalVideoViewController *)self localVideoView];
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  [v15 setTransform:v16];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if ([(PHLocalVideoViewController *)self supportsAutoRotation])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003766C;
    v13[3] = &unk_1000A24F8;
    v13[4] = self;
    id v14 = v7;
    [v14 animateAlongsideTransition:v13 completion:0];
  }
  else
  {
    double v8 = [(PHLocalVideoViewController *)self featureFlags];
    unsigned int v9 = [v8 previewMSROptimizationEnabled];

    if (v9)
    {
      double v10 = objc_opt_new();
      double v11 = [v10 compose];

      -[PHLocalVideoViewController _applyPreviewMSROptimizationTransformsForOrientation:](self, "_applyPreviewMSROptimizationTransformsForOrientation:", [v11 makeInterfaceOrientationFrom:[v11 deviceOrientation] whenFailing:1]);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PHLocalVideoViewController;
  -[PHLocalVideoViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)stopPreview
{
  v2 = sub_100012C68();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = 1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "VideoDeviceController stopPreview: %d", (uint8_t *)v5, 8u);
  }

  BOOL v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 videoDeviceController];
  [v4 stopPreview];
}

- (void)_fadeInLocalVideo
{
  [(PHLocalVideoViewController *)self setWaitingForLocalVideoFirstFrame:0];
  BOOL v3 = [(PHLocalVideoViewController *)self localVideoView];
  [v3 alpha];
  double v5 = v4;

  if (v5 != 1.0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100037820;
    v7[3] = &unk_1000A1D50;
    void v7[4] = self;
    double v6 = objc_retainBlock(v7);
    +[UIView animateWithDuration:v6 animations:0.300000012];
  }
}

- (void)_handleLocalCameraErrorNotification:(id)a3
{
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:TUVideoDeviceControllerDeviceDidReceiveErrorErrorKey];

  if (v5 && [v5 code] == (id)32023)
  {
    double v6 = sub_100012C68();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Local camera was pre-empted from FaceTime local preview", v14, 2u);
    }

    id v7 = [(PHLocalVideoViewController *)self disabledOverlayView];

    if (!v7)
    {
      double v8 = [PHLocalVideoDisabledOverlayView alloc];
      unsigned int v9 = [(PHLocalVideoViewController *)self view];
      [v9 bounds];
      double v10 = -[PHLocalVideoDisabledOverlayView initWithFrame:](v8, "initWithFrame:");
      [(PHLocalVideoViewController *)self setDisabledOverlayView:v10];

      double v11 = [(PHLocalVideoViewController *)self disabledOverlayView];
      [v11 setAutoresizingMask:18];

      objc_super v12 = [(PHLocalVideoViewController *)self view];
      double v13 = [(PHLocalVideoViewController *)self disabledOverlayView];
      [v12 addSubview:v13];
    }
  }
}

- (void)_handleLocalCameraAvailableNotification:(id)a3
{
  double v4 = sub_100012C68();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Local camera pre-emption ended and the camera became available", v7, 2u);
  }

  double v5 = [(PHLocalVideoViewController *)self disabledOverlayView];

  if (v5)
  {
    double v6 = [(PHLocalVideoViewController *)self disabledOverlayView];
    [v6 removeFromSuperview];

    [(PHLocalVideoViewController *)self setDisabledOverlayView:0];
  }
}

- (void)_handleLocalCameraUIDChangedNotification:(id)a3
{
  unsigned int v4 = [(PHLocalVideoViewController *)self cachedIsUsingIPadExternalCamera];
  unsigned int v5 = [(PHLocalVideoViewController *)self isUsingIPadExternalCamera];
  if (v4 != v5)
  {
    unsigned int v6 = v5;
    id v7 = sub_100012C68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109376;
      v10[1] = v4;
      __int16 v11 = 1024;
      unsigned int v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Local camera UID changed, oldIsUsingIPadExternalCamera=%d, newIsUsingIPadExternalCamera=%d", (uint8_t *)v10, 0xEu);
    }

    double v8 = [(PHLocalVideoViewController *)self localVideoView];
    [v8 setAlpha:0.0];

    [(PHLocalVideoViewController *)self setWaitingForLocalVideoFirstFrame:1];
  }
  unsigned int v9 = sub_100012C68();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Local camera UID changed, updating the video layer in case we switched between a built-in and external camera", (uint8_t *)v10, 2u);
  }

  [(PHLocalVideoViewController *)self _applyAutoRotationCorrectionForCurrentOrientationWithTransitionCoordinator:0];
}

- (void)setReadyForPreview:(BOOL)a3
{
  self->_readyForPreview = a3;
}

- (UIControl)videoGroupView
{
  return self->_videoGroupView;
}

- (void)setVideoGroupView:(id)a3
{
}

- (void)setLocalVideoView:(id)a3
{
}

- (UIView)localVideoStatusBarGradientView
{
  return self->_localVideoStatusBarGradientView;
}

- (void)setLocalVideoStatusBarGradientView:(id)a3
{
}

- (void)setDisabledOverlayView:(id)a3
{
}

- (void)setSupportsAutoRotation:(BOOL)a3
{
  self->_supportsAutoRotation = a3;
}

- (void)setShowsLocalPreviewStatusBarGradient:(BOOL)a3
{
  self->_showsLocalPreviewStatusBarGradient = a3;
}

- (int64_t)lastKnownOrientation
{
  return self->_lastKnownOrientation;
}

- (void)setLastKnownOrientation:(int64_t)a3
{
  self->_id lastKnownOrientation = a3;
}

- (void)setDidDeferStartCameraAction:(BOOL)a3
{
  self->_didDeferStartCameraAction = a3;
}

- (BOOL)screensaverActive
{
  return self->_screensaverActive;
}

- (void)setScreensaverActive:(BOOL)a3
{
  self->_screensaverActive = a3;
}

- (void)setCachedIsUsingIPadExternalCamera:(BOOL)a3
{
  self->_cachedIsUsingIPadExternalCamera = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_disabledOverlayView, 0);
  objc_storeStrong((id *)&self->_localVideoStatusBarGradientView, 0);
  objc_storeStrong((id *)&self->_localVideoView, 0);

  objc_storeStrong((id *)&self->_videoGroupView, 0);
}

@end