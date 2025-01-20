@interface COSScanWatchViewController
- (BKSAccelerometer)accelerometer;
- (BOOL)_isSatellitePairing;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)hasDetectedFrames;
- (BOOL)hasDetectedWrist;
- (BOOL)hasFinishedPairing;
- (BOOL)holdBeforeDisplaying;
- (BOOL)isManualPairingVisibleForScanningCoordinator:(id)a3;
- (BOOL)isViewControllerVisibleForScanningCoordinator:(id)a3;
- (BOOL)noCameraMode;
- (BOOL)offeringFaceUpAdvice;
- (BOOL)requiresActivationCheck;
- (BOOL)teardownScannerOnNextDisappear;
- (BOOL)useFadePushAnimation;
- (BOOL)wrappingUpSuccessfulManualPairing;
- (COSBuddyControllerDelegate)delegate;
- (COSInternalManualPairingViewController)internalPairingController;
- (COSMLCaptureDisclosureView)disclosureView;
- (COSMagicCodeScanner)magicCodeScanner;
- (COSScanWatchDynamicHelpViewController)dynamicHelpViewController;
- (COSScanningCoordinator)scanningCoordinator;
- (COSSecurePairingFlowViewController)manualPairingController;
- (COSTargetOverlayView)overlayView;
- (COSWatchDiscoveryCoordinator)discoveryCoordinator;
- (MotionTuple)previousMotion;
- (NSMutableArray)motionDeltaRingBuffer;
- (NSTimer)alreadyPairedAlertTimer;
- (NSTimer)alreadyPairedStartTimer;
- (NSTimer)faceUpTimer;
- (NSTimer)scanningTimeoutTimer;
- (NSTimer)watchOrWristScanTimer;
- (OBHeaderAccessoryButton)manualPairingButton;
- (OBHeaderView)headerView;
- (UIScrollView)headerScrollView;
- (double)alreadyPairedDetectionStartTimeStamp;
- (id)holdActivityIdentifier;
- (int64_t)currentDeviceOrientation;
- (void)_alertUnpairableWatchPredicted:(id)a3;
- (void)_beginConsideringFaceUpAdvice;
- (void)_cancelAlreadyPairedTimers;
- (void)_evaluateWristDetection:(id)a3;
- (void)_normalizeCameraReticuleScale;
- (void)_offerCameraUseAdvice:(id)a3;
- (void)_refreshFaceUpAdviceTimer;
- (void)_scannerSetupComplete;
- (void)_setupCameraSessionWithCompletion:(id)a3 isAsync:(BOOL)a4;
- (void)_startEvaluatingWristDetection:(id)a3;
- (void)_startStopWatchSetupPushesIfNeeded;
- (void)accelerometer:(id)a3 didAccelerateWithTimeStamp:(double)a4 x:(float)a5 y:(float)a6 z:(float)a7 eventType:(int)a8;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)cancelEnqueuedAlreadyPairedDetectionStart;
- (void)cancelScanningTimeout;
- (void)cancelledManualPairing;
- (void)deviceDidDecode:(id)a3;
- (void)didCancelManualPairing;
- (void)didEstablishHold;
- (void)discoveredWatchNearby:(id)a3;
- (void)doneManualPairing;
- (void)dynamicHelpControllerDidDisappear:(id)a3;
- (void)enqueueAlreadyPairedDetectionStart;
- (void)finishedPairing;
- (void)prepareCameraInfrastructureWithCompletion:(id)a3;
- (void)presentNoCameraMode;
- (void)presentUHP;
- (void)receivedData:(id)a3;
- (void)resetScanningTimeout;
- (void)scanningCoordinatorDidCompleteForInternalUserStudyFlow:(id)a3;
- (void)scanningCoordinatorDidCompleteForManualPairing:(id)a3;
- (void)scanningCoordinatorDidDetectUnsupportedCompanionSoftware:(id)a3;
- (void)scanningCoordinatorDidDetectUnsupportedTinkerHardware:(id)a3;
- (void)scanningCoordinatorDidDetectUnsupportedYorktownHardware:(id)a3;
- (void)scanningCoordinatorDidUnpair:(id)a3;
- (void)scanningDidTimeout;
- (void)setAccelerometer:(id)a3;
- (void)setAlreadyPairedAlertTimer:(id)a3;
- (void)setAlreadyPairedDetectionStartTimeStamp:(double)a3;
- (void)setAlreadyPairedStartTimer:(id)a3;
- (void)setCurrentDeviceOrientation:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosureView:(id)a3;
- (void)setDiscoveryCoordinator:(id)a3;
- (void)setDynamicHelpViewController:(id)a3;
- (void)setFaceUpTimer:(id)a3;
- (void)setHasDetectedFrames:(BOOL)a3;
- (void)setHasDetectedWrist:(BOOL)a3;
- (void)setHasFinishedPairing:(BOOL)a3;
- (void)setHeaderScrollView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setInternalPairingController:(id)a3;
- (void)setMagicCodeScanner:(id)a3;
- (void)setManualPairingButton:(id)a3;
- (void)setManualPairingController:(id)a3;
- (void)setManualPairingScannedCode:(id)a3;
- (void)setMotionDeltaRingBuffer:(id)a3;
- (void)setNoCameraMode:(BOOL)a3;
- (void)setOfferingFaceUpAdvice:(BOOL)a3;
- (void)setOverlayView:(id)a3;
- (void)setPreviousMotion:(id)a3;
- (void)setScanningCoordinator:(id)a3;
- (void)setScanningTimeoutTimer:(id)a3;
- (void)setTeardownScannerOnNextDisappear:(BOOL)a3;
- (void)setWatchOrWristScanTimer:(id)a3;
- (void)setWrappingUpSuccessfulManualPairing:(BOOL)a3;
- (void)stopTrackingAccelerometer;
- (void)updateScanningProgress:(double)a3 key:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSScanWatchViewController

- (id)holdActivityIdentifier
{
  return @"ScanWatchCameraLoading";
}

- (BOOL)holdBeforeDisplaying
{
  return _os_feature_enabled_impl();
}

- (void)didEstablishHold
{
  if (_os_feature_enabled_impl())
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100063948;
    v4[3] = &unk_1002438A0;
    v4[4] = self;
    [(COSScanWatchViewController *)self prepareCameraInfrastructureWithCompletion:v4];
  }
  else
  {
    id v3 = [(COSScanWatchViewController *)self delegate];
    [v3 buddyControllerReleaseHold:self];
  }
}

- (BOOL)useFadePushAnimation
{
  return 1;
}

- (void)prepareCameraInfrastructureWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = -[COSMagicCodeScanner initWithFrame:]([COSMagicCodeScanner alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  magicCodeScanner = self->_magicCodeScanner;
  self->_magicCodeScanner = v5;

  [(COSMagicCodeScanner *)self->_magicCodeScanner setDelegate:self];
  if (_os_feature_enabled_impl())
  {
    v7 = dispatch_get_global_queue(33, 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100063AC8;
    v8[3] = &unk_1002441B0;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
  else
  {
    [(COSScanWatchViewController *)self _setupCameraSessionWithCompletion:v4 isAsync:0];
  }
}

- (void)_setupCameraSessionWithCompletion:(id)a3 isAsync:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void (**)(void))a3;
  v7 = [(COSMagicCodeScanner *)self->_magicCodeScanner setupCameraSession];
  if (!v7 && [(COSMagicCodeScanner *)self->_magicCodeScanner canUseCamera])
  {
    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100063C78;
      block[3] = &unk_1002438A0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      if (!v6) {
        goto LABEL_13;
      }
      goto LABEL_10;
    }
    [(COSScanWatchViewController *)self _scannerSetupComplete];
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    sub_10017223C((uint64_t)v7, v8);
  }

  self->_noCameraMode = 1;
  if (v6)
  {
    if (v4)
    {
LABEL_10:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100063C80;
      v9[3] = &unk_100244668;
      v10 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

      goto LABEL_13;
    }
LABEL_12:
    v6[2](v6);
  }
LABEL_13:
}

- (void)_scannerSetupComplete
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(COSMagicCodeScanner *)self->_magicCodeScanner startRunning];
  id v3 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
  [v3 beginMacroActivity:@"COSGizmoCaptureViewControllerScanningPhase" beginTime:CFAbsoluteTimeGetCurrent()];
}

- (void)viewDidLoad
{
  v160.receiver = self;
  v160.super_class = (Class)COSScanWatchViewController;
  [(COSScanWatchViewController *)&v160 viewDidLoad];
  id v3 = objc_alloc_init(COSScanningCoordinator);
  [(COSScanWatchViewController *)self setScanningCoordinator:v3];

  BOOL v4 = [(COSScanWatchViewController *)self scanningCoordinator];
  [v4 setDelegate:self];

  if ((_os_feature_enabled_impl() & 1) == 0) {
    [(COSScanWatchViewController *)self prepareCameraInfrastructureWithCompletion:0];
  }
  self->_hasFinishedPairing = 0;
  v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;

  v8 = +[UIScreen mainScreen];
  [v8 bounds];
  double v10 = v9;

  if (v7 >= v10) {
    double v11 = v7;
  }
  else {
    double v11 = v10;
  }
  double v12 = v11 * 0.36;
  id v13 = objc_alloc((Class)UIView);
  v14 = [(COSScanWatchViewController *)self view];
  [v14 bounds];
  id v15 = [v13 initWithFrame:];

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = [(COSScanWatchViewController *)self view];
  [v16 addSubview:v15];

  v155 = [(COSScanWatchViewController *)self view];
  v149 = [v155 leadingAnchor];
  v143 = [v15 leadingAnchor];
  v136 = [v149 constraintEqualToAnchor:v143];
  v167[0] = v136;
  v130 = [(COSScanWatchViewController *)self view];
  v126 = [v130 trailingAnchor];
  v122 = [v15 trailingAnchor];
  v118 = [v126 constraintEqualToAnchor:v122];
  v167[1] = v118;
  v17 = [(COSScanWatchViewController *)self view];
  v18 = [v17 layoutMarginsGuide];
  v19 = [v18 topAnchor];
  v20 = [v15 topAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v167[2] = v21;
  v22 = [v15 heightAnchor];
  v23 = [v22 constraintEqualToConstant:v12];
  v167[3] = v23;
  v24 = +[NSArray arrayWithObjects:v167 count:4];
  +[NSLayoutConstraint activateConstraints:v24];

  v25 = v15;
  [v15 insertSubview:self->_magicCodeScanner atIndex:0];
  [(COSMagicCodeScanner *)self->_magicCodeScanner setTranslatesAutoresizingMaskIntoConstraints:0];
  v156 = [v15 leadingAnchor];
  v150 = [(COSMagicCodeScanner *)self->_magicCodeScanner leadingAnchor];
  v144 = [v156 constraintEqualToAnchor:v150];
  v166[0] = v144;
  v137 = [v15 trailingAnchor];
  v131 = [(COSMagicCodeScanner *)self->_magicCodeScanner trailingAnchor];
  v26 = [v137 constraintEqualToAnchor:v131];
  v166[1] = v26;
  v27 = [v15 topAnchor];
  v28 = [(COSMagicCodeScanner *)self->_magicCodeScanner topAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v166[2] = v29;
  v30 = [v25 bottomAnchor];
  v31 = [(COSMagicCodeScanner *)self->_magicCodeScanner bottomAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v166[3] = v32;
  v33 = +[NSArray arrayWithObjects:v166 count:4];
  +[NSLayoutConstraint activateConstraints:v33];

  v34 = [COSTargetOverlayView alloc];
  v35 = v25;
  [v25 bounds];
  v36 = -[COSTargetOverlayView initWithFrame:](v34, "initWithFrame:");
  overlayView = self->_overlayView;
  self->_overlayView = v36;

  [v25 insertSubview:self->_overlayView atIndex:1];
  [(COSTargetOverlayView *)self->_overlayView setTranslatesAutoresizingMaskIntoConstraints:0];
  v157 = [v25 leadingAnchor];
  v151 = [(COSTargetOverlayView *)self->_overlayView leadingAnchor];
  v145 = [v157 constraintEqualToAnchor:v151];
  v165[0] = v145;
  v138 = [v25 trailingAnchor];
  v38 = [(COSTargetOverlayView *)self->_overlayView trailingAnchor];
  v39 = [v138 constraintEqualToAnchor:v38];
  v165[1] = v39;
  v159 = v35;
  v40 = [v35 topAnchor];
  v41 = [(COSTargetOverlayView *)self->_overlayView topAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  v165[2] = v42;
  v43 = [v35 bottomAnchor];
  v44 = [(COSTargetOverlayView *)self->_overlayView bottomAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  v165[3] = v45;
  v46 = +[NSArray arrayWithObjects:v165 count:4];
  +[NSLayoutConstraint activateConstraints:v46];

  [v159 setClipsToBounds:1];
  v47 = (UIScrollView *)objc_opt_new();
  headerScrollView = self->_headerScrollView;
  self->_headerScrollView = v47;

  v49 = [(COSScanWatchViewController *)self view];
  [v49 addSubview:self->_headerScrollView];

  [(UIScrollView *)self->_headerScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  v50 = [(UIScrollView *)self->_headerScrollView bottomAnchor];
  v51 = [(COSScanWatchViewController *)self view];
  v52 = [v51 bottomAnchor];
  uint64_t v53 = [v50 constraintEqualToAnchor:v52];

  v152 = [(UIScrollView *)self->_headerScrollView topAnchor];
  v146 = [v159 bottomAnchor];
  v139 = [v152 constraintEqualToAnchor:v146];
  v164[0] = v139;
  v132 = [(UIScrollView *)self->_headerScrollView leadingAnchor];
  v54 = [(COSScanWatchViewController *)self view];
  v55 = [v54 leadingAnchor];
  v56 = [v132 constraintEqualToAnchor:v55];
  v164[1] = v56;
  v57 = [(UIScrollView *)self->_headerScrollView trailingAnchor];
  v58 = [(COSScanWatchViewController *)self view];
  v59 = [v58 trailingAnchor];
  v60 = [v57 constraintEqualToAnchor:v59];
  v164[2] = v60;
  v164[3] = v53;
  v158 = (void *)v53;
  v61 = +[NSArray arrayWithObjects:v164 count:4];
  +[NSLayoutConstraint activateConstraints:v61];

  v62 = objc_opt_new();
  [v62 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_headerScrollView addSubview:v62];
  v153 = [(UIScrollView *)self->_headerScrollView topAnchor];
  v147 = [v62 topAnchor];
  v140 = [v153 constraintEqualToAnchor:v147];
  v163[0] = v140;
  v133 = [(UIScrollView *)self->_headerScrollView bottomAnchor];
  v127 = [v62 bottomAnchor];
  v123 = [v133 constraintEqualToAnchor:v127];
  v163[1] = v123;
  v119 = [(COSScanWatchViewController *)self view];
  v63 = [v119 leadingAnchor];
  v64 = [v62 leadingAnchor];
  v65 = [v63 constraintEqualToAnchor:v64];
  v163[2] = v65;
  v66 = [(COSScanWatchViewController *)self view];
  v67 = [v66 trailingAnchor];
  v68 = [v62 trailingAnchor];
  v69 = [v67 constraintEqualToAnchor:v68];
  v163[3] = v69;
  v70 = +[NSArray arrayWithObjects:v163 count:4];
  +[NSLayoutConstraint activateConstraints:v70];

  id v71 = objc_alloc((Class)OBHeaderView);
  v72 = +[NSBundle mainBundle];
  v73 = [v72 localizedStringForKey:@"SCAN_TITLE_TOP_LAYOUT" value:&stru_100249230 table:@"Localizable"];
  v74 = +[NSBundle mainBundle];
  v75 = [v74 localizedStringForKey:@"SCAN_DETAIL_TOP_LAYOUT" value:&stru_100249230 table:@"Localizable"];
  v76 = (OBHeaderView *)[v71 initWithTitle:v73 detailText:v75 icon:0];
  headerView = self->_headerView;
  self->_headerView = v76;

  [v62 addSubview:self->_headerView];
  [(OBHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v141 = [(OBHeaderView *)self->_headerView leadingAnchor];
  v134 = [v62 leadingAnchor];
  v128 = [v141 constraintEqualToAnchor:v134 constant:16.0];
  v162[0] = v128;
  v124 = [(OBHeaderView *)self->_headerView trailingAnchor];
  v78 = [v62 trailingAnchor];
  v79 = [v124 constraintEqualToAnchor:v78 constant:-16.0];
  v162[1] = v79;
  v80 = [(OBHeaderView *)self->_headerView topAnchor];
  v81 = [v62 topAnchor];
  v82 = [v80 constraintEqualToAnchor:v81 constant:32.0];
  v162[2] = v82;
  v83 = [(OBHeaderView *)self->_headerView bottomAnchor];
  v154 = v62;
  v84 = [v62 bottomAnchor];
  v85 = [v83 constraintEqualToAnchor:v84 constant:-32.0];
  v162[3] = v85;
  v86 = +[NSArray arrayWithObjects:v162 count:4];
  +[NSLayoutConstraint activateConstraints:v86];

  v87 = +[OBHeaderAccessoryButton accessoryButton];
  manualPairingButton = self->_manualPairingButton;
  self->_manualPairingButton = v87;

  v89 = self->_manualPairingButton;
  v90 = +[NSBundle mainBundle];
  v91 = [v90 localizedStringForKey:@"SCAN_MANUAL_PAIR_TOP_LAYOUT" value:&stru_100249230 table:@"Localizable"];
  [(OBHeaderAccessoryButton *)v89 setTitle:v91 forState:0];

  [(OBHeaderAccessoryButton *)self->_manualPairingButton addTarget:self action:"manualPairingButtonPressed:" forEvents:64];
  [(OBHeaderView *)self->_headerView addAccessoryButton:self->_manualPairingButton];
  v92 = +[NSNotificationCenter defaultCenter];
  [v92 addObserver:self selector:"presentNoCameraMode" name:@"COSCameraHitRuntimeError" object:0];

  v93 = +[NSNotificationCenter defaultCenter];
  [v93 addObserver:self selector:"deviceDidDecode:" name:@"COSMagicCodeDidDecodeNotification" object:0];

  v94 = (BKSAccelerometer *)objc_alloc_init((Class)BKSAccelerometer);
  accelerometer = self->_accelerometer;
  self->_accelerometer = v94;

  [(BKSAccelerometer *)self->_accelerometer setDelegate:self];
  [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:1];
  LODWORD(v96) = 1008981770;
  [(BKSAccelerometer *)self->_accelerometer setXThreshold:v96];
  LODWORD(v97) = 1008981770;
  [(BKSAccelerometer *)self->_accelerometer setYThreshold:v97];
  LODWORD(v98) = 0.5;
  [(BKSAccelerometer *)self->_accelerometer setZThreshold:v98];
  +[PBBridgeCAReporter incrementSuccessType:4];
  if ([(COSScanWatchViewController *)self _isSatellitePairing]) {
    +[PBBridgeCAReporter incrementSuccessType:23];
  }
  if (PBIsInternalInstall())
  {
    uint64_t v99 = +[COSInternalUserStudyAssetManager detailBundle];
    if (v99)
    {
      v100 = (void *)v99;
      int v101 = sub_10003251C();

      if (v101)
      {
        v102 = -[COSMLCaptureDisclosureView initWithFrame:]([COSMLCaptureDisclosureView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        disclosureView = self->_disclosureView;
        self->_disclosureView = v102;

        [(COSMLCaptureDisclosureView *)self->_disclosureView setParentController:self];
        v104 = [(COSScanWatchViewController *)self view];
        [v104 addSubview:self->_disclosureView];

        [(COSMLCaptureDisclosureView *)self->_disclosureView setTranslatesAutoresizingMaskIntoConstraints:0];
        [v158 setActive:0];
        v148 = [(COSScanWatchViewController *)self view];
        v142 = [v148 leadingAnchor];
        v135 = [(COSMLCaptureDisclosureView *)self->_disclosureView leadingAnchor];
        v129 = [v142 constraintEqualToAnchor:v135];
        v161[0] = v129;
        v125 = [(COSScanWatchViewController *)self view];
        v121 = [v125 trailingAnchor];
        v120 = [(COSMLCaptureDisclosureView *)self->_disclosureView trailingAnchor];
        v117 = [v121 constraintEqualToAnchor:v120];
        v161[1] = v117;
        v116 = [(COSScanWatchViewController *)self view];
        v105 = [v116 bottomAnchor];
        v106 = [(COSMLCaptureDisclosureView *)self->_disclosureView bottomAnchor];
        v107 = [v105 constraintEqualToAnchor:v106 constant:0.0];
        v161[2] = v107;
        v108 = [(COSMLCaptureDisclosureView *)self->_disclosureView heightAnchor];
        v109 = [v108 constraintEqualToConstant:100.0];
        v161[3] = v109;
        v110 = [(UIScrollView *)self->_headerScrollView bottomAnchor];
        v111 = [(COSMLCaptureDisclosureView *)self->_disclosureView topAnchor];
        v112 = [v110 constraintEqualToAnchor:v111];
        v161[4] = v112;
        v113 = +[NSArray arrayWithObjects:v161 count:5];
        +[NSLayoutConstraint activateConstraints:v113];
      }
    }
  }
  v114 = objc_alloc_init(COSWatchDiscoveryCoordinator);
  discoveryCoordinator = self->_discoveryCoordinator;
  self->_discoveryCoordinator = v114;

  [(COSWatchDiscoveryCoordinator *)self->_discoveryCoordinator setDelegate:self];
  [(COSWatchDiscoveryCoordinator *)self->_discoveryCoordinator startDiscoveringWatchNearby];
  [(COSScanWatchViewController *)self _normalizeCameraReticuleScale];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)COSScanWatchViewController;
  [(COSScanWatchViewController *)&v9 viewWillAppear:a3];
  BOOL v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v11 = "-[COSScanWatchViewController viewWillAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self->_wrappingUpSuccessfulManualPairing || self->_hasFinishedPairing)
  {
    v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL wrappingUpSuccessfulManualPairing = self->_wrappingUpSuccessfulManualPairing;
      BOOL hasFinishedPairing = self->_hasFinishedPairing;
      *(_DWORD *)buf = 136315650;
      double v11 = "-[COSScanWatchViewController viewWillAppear:]";
      __int16 v12 = 1024;
      BOOL v13 = wrappingUpSuccessfulManualPairing;
      __int16 v14 = 1024;
      BOOL v15 = hasFinishedPairing;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s skipping initialization. wrappingUpSuccessfulManualPairing: %{BOOL}d hasFinishedPairing: %{BOOL}d", buf, 0x18u);
    }
  }
  else
  {
    if (![(COSMagicCodeScanner *)self->_magicCodeScanner isScanningForCode])
    {
      [(COSMagicCodeScanner *)self->_magicCodeScanner startRunning];
      v8 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      [v8 beginMacroActivity:@"COSGizmoCaptureViewControllerScanningPhase" beginTime:CFAbsoluteTimeGetCurrent()];
    }
    [(COSScanWatchViewController *)self _beginConsideringFaceUpAdvice];
    [(COSScanWatchViewController *)self _startStopWatchSetupPushesIfNeeded];
    [(COSScanWatchViewController *)self resetScanningTimeout];
    [(COSScanWatchViewController *)self enqueueAlreadyPairedDetectionStart];
    [(COSWatchDiscoveryCoordinator *)self->_discoveryCoordinator startDiscoveringWatchNearby];
    v5 = +[UIApplication sharedApplication];
    [v5 setIdleTimerDisabled:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)COSScanWatchViewController;
  [(COSScanWatchViewController *)&v11 viewDidAppear:a3];
  BOOL v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v13 = "-[COSScanWatchViewController viewDidAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self->_wrappingUpSuccessfulManualPairing || self->_hasFinishedPairing)
  {
    v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL wrappingUpSuccessfulManualPairing = self->_wrappingUpSuccessfulManualPairing;
      BOOL hasFinishedPairing = self->_hasFinishedPairing;
      *(_DWORD *)buf = 136315650;
      BOOL v13 = "-[COSScanWatchViewController viewDidAppear:]";
      __int16 v14 = 1024;
      BOOL v15 = wrappingUpSuccessfulManualPairing;
      __int16 v16 = 1024;
      BOOL v17 = hasFinishedPairing;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s skipping initialization. wrappingUpSuccessfulManualPairing: %{BOOL}d hasFinishedPairing: %{BOOL}d", buf, 0x18u);
    }
  }
  else
  {
    if (sub_100032420() && [UIApp automationFlowPressed])
    {
      if (!self->_internalPairingController)
      {
        v8 = objc_alloc_init(COSInternalManualPairingViewController);
        internalPairingController = self->_internalPairingController;
        self->_internalPairingController = v8;

        [(COSInternalManualPairingViewController *)self->_internalPairingController setPairingDelegate:self];
        [(COSInternalManualPairingViewController *)self->_internalPairingController setModalPresentationStyle:0];
        double v10 = [(COSScanWatchViewController *)self scanningCoordinator];
        [v10 startObservingCompatibilityState];

        [(COSScanWatchViewController *)self presentViewController:self->_internalPairingController animated:1 completion:&stru_100244C98];
      }
    }
    else if (self->_noCameraMode && !self->_manualPairingController)
    {
      [(COSScanWatchViewController *)self presentNoCameraMode];
    }
    [(UIScrollView *)self->_headerScrollView flashScrollIndicators];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)COSScanWatchViewController;
  [(COSScanWatchViewController *)&v8 viewDidDisappear:a3];
  BOOL v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v10 = "-[COSScanWatchViewController viewDidDisappear:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(COSScanWatchViewController *)self stopTrackingAccelerometer];
  if ([(COSMagicCodeScanner *)self->_magicCodeScanner isScanningForCode]) {
    [(COSMagicCodeScanner *)self->_magicCodeScanner stopRunning];
  }
  if (self->_teardownScannerOnNextDisappear)
  {
    v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Tearing down code scanner post lock-on.", buf, 2u);
    }

    [(COSMagicCodeScanner *)self->_magicCodeScanner stopRunning];
    [(COSMagicCodeScanner *)self->_magicCodeScanner removeFromSuperview];
    magicCodeScanner = self->_magicCodeScanner;
    self->_magicCodeScanner = 0;

    self->_teardownScannerOnNextDisappear = 0;
  }
  [(COSScanWatchViewController *)self _startStopWatchSetupPushesIfNeeded];
  [(COSScanWatchViewController *)self cancelScanningTimeout];
  [(COSScanWatchViewController *)self _cancelAlreadyPairedTimers];
  [(COSWatchDiscoveryCoordinator *)self->_discoveryCoordinator stopDiscoveringWatchNearby];
  double v7 = +[UIApplication sharedApplication];
  [v7 setIdleTimerDisabled:0];
}

- (void)_normalizeCameraReticuleScale
{
  [(COSTargetOverlayView *)self->_overlayView targetWidthRatio];
  double v4 = v3;
  if (v3 >= 0.45)
  {
    double v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v13.a) = 134217984;
      *(double *)((char *)&v13.a + 4) = v4;
      objc_super v8 = "Reticule is already at appropriate ratio (%f)";
      objc_super v9 = &v13;
      double v10 = v7;
      uint32_t v11 = 12;
      goto LABEL_6;
    }
  }
  else
  {
    memset(&v13, 0, sizeof(v13));
    CGAffineTransformMakeScale(&v13, 0.45 / v3, 0.45 / v3);
    overlayView = self->_overlayView;
    CGAffineTransform v12 = v13;
    [(COSTargetOverlayView *)overlayView setTransform:&v12];
    magicCodeScanner = self->_magicCodeScanner;
    CGAffineTransform v12 = v13;
    [(COSMagicCodeScanner *)magicCodeScanner setTransform:&v12];
    double v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v12.a) = 134218496;
      *(double *)((char *)&v12.a + 4) = v4;
      WORD2(v12.b) = 2048;
      *(CGFloat *)((char *)&v12.b + 6) = 0.45;
      HIWORD(v12.c) = 2048;
      v12.d = 0.45 / v4;
      objc_super v8 = "Scaled camera views from actual reticule ratio (%f) to ideal (%f) with scale factor (%f)";
      objc_super v9 = &v12;
      double v10 = v7;
      uint32_t v11 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)v9, v11);
    }
  }
}

- (BOOL)requiresActivationCheck
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (void)didCancelManualPairing
{
  double v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[COSScanWatchViewController didCancelManualPairing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  double v4 = [(COSScanWatchViewController *)self scanningCoordinator];
  [v4 stopObservingCompatibilityState];

  if (self->_noCameraMode)
  {
    [UIApp dismissSetupFlowComplete:0 animated:1];
  }
  else
  {
    v5 = [(COSSecurePairingFlowViewController *)self->_manualPairingController presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];

    manualPairingController = self->_manualPairingController;
    self->_manualPairingController = 0;
  }
}

- (void)doneManualPairing
{
  v2 = pbb_setupflow_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    double v4 = "-[COSScanWatchViewController doneManualPairing]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)cancelledManualPairing
{
  int v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v8 = "-[COSScanWatchViewController cancelledManualPairing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  internalPairingController = self->_internalPairingController;
  if (internalPairingController)
  {
    v5 = [(COSInternalManualPairingViewController *)internalPairingController presentingViewController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000658A0;
    v6[3] = &unk_1002438A0;
    v6[4] = self;
    [v5 dismissViewControllerAnimated:1 completion:v6];
  }
}

- (void)setManualPairingScannedCode:(id)a3
{
  id v4 = a3;
  v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[COSScanWatchViewController setManualPairingScannedCode:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(COSScanWatchViewController *)self receivedData:v4];
}

- (BOOL)_isSatellitePairing
{
  v2 = [UIApp bridgeController];
  unsigned __int8 v3 = [v2 isTinkerPairing];

  return v3;
}

- (void)_startStopWatchSetupPushesIfNeeded
{
  magicCodeScanner = self->_magicCodeScanner;
  if (magicCodeScanner
    && ([(COSMagicCodeScanner *)magicCodeScanner isHidden] & 1) == 0
    && [(COSMagicCodeScanner *)self->_magicCodeScanner isScanningForCode]
    || self->_manualPairingController)
  {
    id v4 = +[NRPairedDeviceRegistry sharedInstance];
    [v4 startWatchSetupPush];
  }
  else
  {
    id v4 = +[NRPairedDeviceRegistry sharedInstance];
    [v4 stopWatchSetupPush];
  }
}

- (void)presentUHP
{
  unsigned __int8 v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[COSScanWatchViewController presentUHP]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  +[PBBridgeCAReporter incrementSuccessType:7];
  if (!self->_manualPairingController)
  {
    id v4 = objc_alloc_init(COSSecurePairingFlowViewController);
    manualPairingController = self->_manualPairingController;
    self->_manualPairingController = v4;

    [(COSManualPairingFlowViewController *)self->_manualPairingController setPairingDelegate:self];
    [(COSSecurePairingFlowViewController *)self->_manualPairingController setModalPresentationStyle:0];
    int v6 = [(COSScanWatchViewController *)self scanningCoordinator];
    [v6 startObservingCompatibilityState];

    [(COSScanWatchViewController *)self presentViewController:self->_manualPairingController animated:1 completion:&stru_100244CB8];
  }
}

- (void)finishedPairing
{
  unsigned __int8 v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v15 = "-[COSScanWatchViewController finishedPairing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v4 = [UIApp setupController];
  v5 = [v4 linkUpgradeMonitor];
  [v5 requestLinkUpgrade];

  int v6 = [UIApp setupController];
  int v7 = [v6 pairingReportManager];

  [v7 addPairingTimeEventToPairingReportPlist:9 withValue:&__kCFBooleanTrue withError:0];
  if (!self->_hasFinishedPairing)
  {
    internalPairingController = self->_internalPairingController;
    if (internalPairingController)
    {
      objc_super v9 = [(COSInternalManualPairingViewController *)internalPairingController presentingViewController];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100065E54;
      v13[3] = &unk_1002438A0;
      v13[4] = self;
      [v9 dismissViewControllerAnimated:1 completion:v13];
    }
    double v10 = [v4 pairingCompatiblity];
    if ([v10 runUpdateInSetup])
    {
      uint32_t v11 = [(COSScanWatchViewController *)self delegate];
      [v11 buddyControllerDone:self nextControllerClass:objc_opt_class()];
    }
    else
    {
      CGAffineTransform v12 = [v4 linkUpgradeMonitor];
      [v12 indicateSoftwareUpdateStateResolved];

      uint32_t v11 = [(COSScanWatchViewController *)self delegate];
      [v11 buddyControllerDone:self];
    }

    self->_BOOL hasFinishedPairing = 1;
    self->_teardownScannerOnNextDisappear = 1;
  }
}

- (void)presentNoCameraMode
{
  unsigned __int8 v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSScanWatchViewController presentNoCameraMode]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  self->_noCameraMode = 1;
  [(COSScanWatchViewController *)self presentUHP];
}

- (void)resetScanningTimeout
{
  unsigned __int8 v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[COSScanWatchViewController resetScanningTimeout]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  if (self->_scanningTimeoutTimer) {
    [(COSScanWatchViewController *)self cancelScanningTimeout];
  }
  int v4 = +[NSTimer timerWithTimeInterval:self target:"scanningDidTimeout" selector:0 userInfo:0 repeats:300.0];
  scanningTimeoutTimer = self->_scanningTimeoutTimer;
  self->_scanningTimeoutTimer = v4;

  int v6 = +[NSRunLoop mainRunLoop];
  [v6 addTimer:self->_scanningTimeoutTimer forMode:NSRunLoopCommonModes];
}

- (void)cancelScanningTimeout
{
  unsigned __int8 v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[COSScanWatchViewController cancelScanningTimeout]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(NSTimer *)self->_scanningTimeoutTimer invalidate];
  scanningTimeoutTimer = self->_scanningTimeoutTimer;
  self->_scanningTimeoutTimer = 0;
}

- (void)scanningDidTimeout
{
  v2 = pbb_setupflow_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1001722B4(v2);
  }

  unsigned __int8 v3 = +[UIApplication sharedApplication];
  [v3 resetFlowForCameraExpiry];
}

- (void)enqueueAlreadyPairedDetectionStart
{
  if (!self->_hasDetectedFrames)
  {
    [(COSScanWatchViewController *)self _cancelAlreadyPairedTimers];
    unsigned __int8 v3 = +[NSTimer timerWithTimeInterval:self target:"_startEvaluatingWristDetection:" selector:0 userInfo:0 repeats:5.0];
    alreadyPairedStartTimer = self->_alreadyPairedStartTimer;
    self->_alreadyPairedStartTimer = v3;

    id v5 = +[NSRunLoop currentRunLoop];
    [v5 addTimer:self->_alreadyPairedStartTimer forMode:NSRunLoopCommonModes];
  }
}

- (void)cancelEnqueuedAlreadyPairedDetectionStart
{
  [(NSTimer *)self->_alreadyPairedStartTimer invalidate];
  alreadyPairedStartTimer = self->_alreadyPairedStartTimer;
  self->_alreadyPairedStartTimer = 0;
}

- (void)deviceDidDecode:(id)a3
{
  int v4 = [a3 object];
  if (objc_opt_respondsToSelector())
  {
    [v4 floatValue];
    float v6 = v5;
    int v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Decoding Code: %.1f", buf, 0xCu);
    }

    if (v6 > 0.0)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100066448;
      block[3] = &unk_1002438A0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_startEvaluatingWristDetection:(id)a3
{
  BOOL hasDetectedFrames = self->_hasDetectedFrames;
  float v5 = pbb_setupflow_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (hasDetectedFrames)
  {
    if (v6)
    {
      *(_WORD *)objc_super v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Already Paired Detector] Found MagicCode frames, bailing out early.", v9, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Already Paired Detector] Begin aggresively looking for wrist / watch.", buf, 2u);
    }

    int v7 = +[NSTimer timerWithTimeInterval:self target:"_evaluateWristDetection:" selector:0 userInfo:1 repeats:0.4];
    watchOrWristScanTimer = self->_watchOrWristScanTimer;
    self->_watchOrWristScanTimer = v7;

    float v5 = +[NSRunLoop currentRunLoop];
    [v5 addTimer:self->_watchOrWristScanTimer forMode:NSRunLoopCommonModes];
  }
}

- (void)_evaluateWristDetection:(id)a3
{
  if (self->_hasDetectedFrames)
  {
    unsigned __int8 v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGAffineTransform v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Already Paired Detector] Found MagicCode frames, bailing out during aggressive scan.", v12, 2u);
    }
  }
  else
  {
    unsigned __int8 v3 = [(COSMagicCodeScanner *)self->_magicCodeScanner detector];
    float v5 = [v3 confidenceSummary];
    if ((unint64_t)[v5 attribute] < 2)
    {
      if (self->_hasDetectedWrist)
      {
        double v10 = pbb_setupflow_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)CGAffineTransform v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Already Paired Detector] Device/Wrist Disappeared.", v13, 2u);
        }
      }
      [(NSTimer *)self->_alreadyPairedAlertTimer invalidate];
      alreadyPairedAlertTimer = self->_alreadyPairedAlertTimer;
      self->_alreadyPairedAlertTimer = 0;

      self->_hasDetectedWrist = 0;
    }
    else
    {
      if (self->_alreadyPairedDetectionStartTimeStamp == 0.0) {
        self->_alreadyPairedDetectionStartTimeStamp = CFAbsoluteTimeGetCurrent();
      }
      if (!self->_hasDetectedWrist)
      {
        BOOL v6 = pbb_setupflow_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Already Paired Detector] Detected Device... Begin timer to see if MagicCode is present.", buf, 2u);
        }

        self->_hasDetectedWrist = 1;
        int v7 = +[NSTimer timerWithTimeInterval:self target:"_alertUnpairableWatchPredicted:" selector:0 userInfo:0 repeats:4.0];
        objc_super v8 = self->_alreadyPairedAlertTimer;
        self->_alreadyPairedAlertTimer = v7;

        objc_super v9 = +[NSRunLoop currentRunLoop];
        [v9 addTimer:self->_alreadyPairedAlertTimer forMode:NSRunLoopCommonModes];
      }
    }
  }
}

- (void)_alertUnpairableWatchPredicted:(id)a3
{
  if (!self->_hasDetectedFrames)
  {
    int v4 = pbb_setupflow_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Already Paired Detector] No MagicCode frames found; detected device appears to be powered off or already paired"
        ". Presenting \"Unable to Pair\" alert.",
        buf,
        2u);
    }

    float v5 = +[NRPairedDeviceRegistry sharedInstance];
    unsigned int v6 = [v5 watchNeedsGraduation];

    if (v6)
    {
      int v7 = [(COSScanWatchViewController *)self delegate];
      [v7 displayUnpairingInstructions];
    }
    else
    {
      double Current = CFAbsoluteTimeGetCurrent();
      double v9 = Current - self->_alreadyPairedDetectionStartTimeStamp;
      double v10 = +[NSUserDefaults standardUserDefaults];
      [v10 doubleForKey:@"AlreadyPairedFiredTimeStamp"];
      double v12 = v11;

      CGAffineTransform v13 = pbb_setupflow_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = +[NSNumber numberWithDouble:v9];
        BOOL v15 = +[NSNumber numberWithInt:v12 > 0.0];
        *(_DWORD *)buf = 138412546;
        v19 = v14;
        __int16 v20 = 2112;
        v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Already Paired Detector] Detection took ~%@ (Has fired before? %@).", buf, 0x16u);
      }
      +[PBBridgeCAReporter recordAlreadyPairedAlertFired:1 afterDuration:v12 > 0.0 hasFiredBefore:v9];
      __int16 v16 = +[NSUserDefaults standardUserDefaults];
      [v16 setDouble:@"AlreadyPairedFiredTimeStamp" forKey:Current];

      int v7 = [(COSScanWatchViewController *)self delegate];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100066AE4;
      v17[3] = &unk_100244CE0;
      v17[4] = self;
      [v7 displayWatchAppearsPairedOrOffAlert:v17];
    }
  }
  [(COSScanWatchViewController *)self _cancelAlreadyPairedTimers];
}

- (void)_cancelAlreadyPairedTimers
{
  unsigned __int8 v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Already Paired Detector] Cleanup Timers.", v7, 2u);
  }

  [(NSTimer *)self->_watchOrWristScanTimer invalidate];
  watchOrWristScanTimer = self->_watchOrWristScanTimer;
  self->_watchOrWristScanTimer = 0;

  [(NSTimer *)self->_alreadyPairedAlertTimer invalidate];
  alreadyPairedAlertTimer = self->_alreadyPairedAlertTimer;
  self->_alreadyPairedAlertTimer = 0;

  [(NSTimer *)self->_watchOrWristScanTimer invalidate];
  unsigned int v6 = self->_watchOrWristScanTimer;
  self->_watchOrWristScanTimer = 0;
}

- (void)updateScanningProgress:(double)a3 key:(id)a4
{
  if (a3 > 0.0)
  {
    id v7 = a4;
    id v8 = [(COSScanWatchViewController *)self overlayView];
    [v8 setScanningProgress:v7 key:a3];
  }
}

- (void)receivedData:(id)a3
{
  id v4 = a3;
  float v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 67109634;
    *(_DWORD *)CGAffineTransform v13 = 762;
    *(_WORD *)&v13[4] = 2080;
    *(void *)&v13[6] = "-[COSScanWatchViewController receivedData:]";
    *(_WORD *)&v13[14] = 2112;
    *(void *)&uint8_t v13[16] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%d %s (%@)", (uint8_t *)&v12, 0x1Cu);
  }

  unsigned int v6 = PBBridgeMagicCodeDecoder();
  id v7 = [v6 count];

  id v8 = pbb_setupflow_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)7)
  {
    if (v9)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Valid setup code, starting pairing", (uint8_t *)&v12, 2u);
    }

    id v8 = [UIApp setupController];
    [v8 blockGoingBackFromCurrentController];
    double v10 = [(COSScanWatchViewController *)self manualPairingButton];
    [v10 setEnabled:0];

    double v11 = [(COSScanWatchViewController *)self scanningCoordinator];
    [v11 startPairingWithScannedCode:v4];

    [(COSScanWatchViewController *)self cancelScanningTimeout];
  }
  else if (v9)
  {
    int v12 = 134218240;
    *(void *)CGAffineTransform v13 = v7;
    *(_WORD *)&v13[8] = 2048;
    *(void *)&v13[10] = 7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Invalid setup code! Has %lu comps but expected %lu", (uint8_t *)&v12, 0x16u);
  }
}

- (BOOL)isViewControllerVisibleForScanningCoordinator:(id)a3
{
  unsigned __int8 v3 = self;
  id v4 = [(COSScanWatchViewController *)self navigationController];
  float v5 = [v4 topViewController];
  LOBYTE(v3) = v5 == v3;

  return (char)v3;
}

- (BOOL)isManualPairingVisibleForScanningCoordinator:(id)a3
{
  return self->_manualPairingController || self->_internalPairingController != 0;
}

- (void)scanningCoordinatorDidDetectUnsupportedTinkerHardware:(id)a3
{
  id v3 = [(COSScanWatchViewController *)self delegate];
  [v3 displayUnsupportedTinkerHardwareFailure:&stru_100244D00];
}

- (void)scanningCoordinatorDidDetectUnsupportedYorktownHardware:(id)a3
{
  id v3 = [(COSScanWatchViewController *)self delegate];
  [v3 displayUnsupportedYorktownHardwareFailure:&stru_100244D20];
}

- (void)scanningCoordinatorDidDetectUnsupportedCompanionSoftware:(id)a3
{
  id v3 = [(COSScanWatchViewController *)self delegate];
  [v3 displayCompanionTooOldPairingFailureAlertWithDismissalHandler:&stru_100244D40];
}

- (void)scanningCoordinatorDidUnpair:(id)a3
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(Scan Watch) Presenting Unpairing UI", v4, 2u);
  }
}

- (void)scanningCoordinatorDidCompleteForInternalUserStudyFlow:(id)a3
{
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[COSScanWatchViewController scanningCoordinatorDidCompleteForInternalUserStudyFlow:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  float v5 = [(COSScanWatchViewController *)self delegate];
  [v5 buddyControllerDone:self nextControllerClass:objc_opt_class()];

  self->_teardownScannerOnNextDisappear = 1;
}

- (void)scanningCoordinatorDidCompleteForManualPairing:(id)a3
{
  id v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(UHP) Clean up controller", buf, 2u);
  }

  self->_noCameraMode = 0;
  manualPairingController = self->_manualPairingController;
  if (manualPairingController)
  {
    int v6 = manualPairingController;
LABEL_6:
    self->_BOOL wrappingUpSuccessfulManualPairing = 1;
    goto LABEL_7;
  }
  int v6 = self->_internalPairingController;
  if (v6) {
    goto LABEL_6;
  }
LABEL_7:
  id v7 = [(COSInternalManualPairingViewController *)v6 presentingViewController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000674F8;
  v10[3] = &unk_1002438A0;
  v10[4] = self;
  [v7 dismissViewControllerAnimated:1 completion:v10];

  id v8 = self->_manualPairingController;
  self->_manualPairingController = 0;

  internalPairingController = self->_internalPairingController;
  self->_internalPairingController = 0;
}

- (void)_beginConsideringFaceUpAdvice
{
  if (!self->_hasDetectedFrames)
  {
    [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:1];
    self->_currentDeviceOrientation = (int64_t)[(BKSAccelerometer *)self->_accelerometer currentDeviceOrientation];
    id v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    motionDeltaRingBuffer = self->_motionDeltaRingBuffer;
    self->_motionDeltaRingBuffer = v3;

    previousMotion = self->_previousMotion;
    self->_previousMotion = 0;

    if (self->_currentDeviceOrientation == 5)
    {
      int v6 = pbb_setupflow_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Start timer for FaceUp advice", v7, 2u);
      }

      [(BKSAccelerometer *)self->_accelerometer setAccelerometerEventsEnabled:1];
      [(COSScanWatchViewController *)self _refreshFaceUpAdviceTimer];
    }
  }
}

- (void)_refreshFaceUpAdviceTimer
{
  [(NSTimer *)self->_faceUpTimer invalidate];
  id v3 = +[NSTimer timerWithTimeInterval:self target:"_offerCameraUseAdvice:" selector:0 userInfo:0 repeats:5.0];
  faceUpTimer = self->_faceUpTimer;
  self->_faceUpTimer = v3;

  id v5 = +[NSRunLoop mainRunLoop];
  [v5 addTimer:self->_faceUpTimer forMode:NSRunLoopCommonModes];
}

- (void)stopTrackingAccelerometer
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop tracking the accelerometer", v5, 2u);
  }

  [(NSTimer *)self->_faceUpTimer invalidate];
  faceUpTimer = self->_faceUpTimer;
  self->_faceUpTimer = 0;

  [(BKSAccelerometer *)self->_accelerometer setAccelerometerEventsEnabled:0];
  [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:0];
}

- (void)_offerCameraUseAdvice:(id)a3
{
  [(NSTimer *)self->_faceUpTimer invalidate];
  faceUpTimer = self->_faceUpTimer;
  self->_faceUpTimer = 0;

  if (self->_currentDeviceOrientation == 5)
  {
    self->_offeringFaceUpAdvice = 1;
    +[PBBridgeCAReporter incrementSuccessType:3];
    if (!self->_hasDetectedFrames && _os_feature_enabled_impl() && !self->_dynamicHelpViewController)
    {
      id v5 = objc_alloc_init(COSScanWatchDynamicHelpViewController);
      dynamicHelpViewController = self->_dynamicHelpViewController;
      self->_dynamicHelpViewController = v5;

      [(COSScanWatchDynamicHelpViewController *)self->_dynamicHelpViewController setScanDelegate:self];
      [(COSScanWatchDynamicHelpViewController *)self->_dynamicHelpViewController setDiscoveredWatchNearby:[(COSWatchDiscoveryCoordinator *)self->_discoveryCoordinator discoveredWatchNearby]];
      id v7 = self->_dynamicHelpViewController;
      [(COSScanWatchViewController *)self presentViewController:v7 animated:1 completion:0];
    }
  }
}

- (void)dynamicHelpControllerDidDisappear:(id)a3
{
  dynamicHelpViewController = self->_dynamicHelpViewController;
  self->_dynamicHelpViewController = 0;

  self->_offeringFaceUpAdvice = 0;

  [(COSScanWatchViewController *)self _beginConsideringFaceUpAdvice];
}

- (void)accelerometer:(id)a3 didAccelerateWithTimeStamp:(double)a4 x:(float)a5 y:(float)a6 z:(float)a7 eventType:(int)a8
{
  id v12 = a3;
  if (self->_faceUpTimer)
  {
    if ((unint64_t)[(NSMutableArray *)self->_motionDeltaRingBuffer count] >= 0x12) {
      [(NSMutableArray *)self->_motionDeltaRingBuffer removeFirstObject];
    }
    previousMotion = self->_previousMotion;
    if (previousMotion)
    {
      motionDeltaRingBuffer = self->_motionDeltaRingBuffer;
      [(MotionTuple *)previousMotion x];
      float v16 = a5 - v15;
      [(MotionTuple *)self->_previousMotion y];
      float v18 = a6 - v17;
      [(MotionTuple *)self->_previousMotion z];
      *(float *)&double v20 = a7 - v19;
      *(float *)&double v21 = v16;
      *(float *)&double v22 = v18;
      v23 = +[MotionTuple motionWithX:v21 andY:v22 andZ:v20];
      [(NSMutableArray *)motionDeltaRingBuffer addObject:v23];
    }
    else
    {
      v24 = objc_alloc_init(MotionTuple);
      v23 = self->_previousMotion;
      self->_previousMotion = v24;
    }

    *(float *)&double v25 = a5;
    [(MotionTuple *)self->_previousMotion setX:v25];
    *(float *)&double v26 = a6;
    [(MotionTuple *)self->_previousMotion setY:v26];
    *(float *)&double v27 = a7;
    [(MotionTuple *)self->_previousMotion setZ:v27];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v28 = self->_motionDeltaRingBuffer;
    id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v44;
      float v32 = 0.0;
      float v33 = 0.0;
      float v34 = 0.0;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v44 != v31) {
            objc_enumerationMutation(v28);
          }
          v36 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          [v36 x:v43];
          float v34 = v34 + v37;
          [v36 y];
          float v33 = v33 + v38;
          [v36 z];
          float v32 = v32 + v39;
        }
        id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v30);
    }
    else
    {
      float v32 = 0.0;
      float v33 = 0.0;
      float v34 = 0.0;
    }

    id v40 = [(NSMutableArray *)self->_motionDeltaRingBuffer count];
    if (v40)
    {
      float v34 = v34 / (float)(uint64_t)v40;
      float v33 = v33 / (float)(uint64_t)v40;
      float v32 = v32 / (float)(uint64_t)v40;
    }
    else
    {
      v41 = pbb_setupflow_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_1001722F8(v41);
      }
    }
    double v42 = v34;
    if (v34 > 0.0003 || (double v42 = v33, v33 > 0.0003) || (double v42 = v32, v32 > 0.0003)) {
      [(COSScanWatchViewController *)self _refreshFaceUpAdviceTimer];
    }
  }
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v6 = a3;
  if (self->_offeringFaceUpAdvice)
  {
    if (a4 != 5)
    {
      self->_offeringFaceUpAdvice = 0;
      if (self->_dynamicHelpViewController)
      {
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_100067CD4;
        v7[3] = &unk_1002438A0;
        v7[4] = self;
        [(COSScanWatchViewController *)self dismissViewControllerAnimated:1 completion:v7];
      }
      self->_currentDeviceOrientation = a4;
    }
  }
  else
  {
    [(COSScanWatchViewController *)self _beginConsideringFaceUpAdvice];
  }
}

- (void)discoveredWatchNearby:(id)a3
{
  dynamicHelpViewController = self->_dynamicHelpViewController;
  id v4 = a3;
  [(COSScanWatchDynamicHelpViewController *)dynamicHelpViewController setState:1 animated:1];
  [v4 stopDiscoveringWatchNearby];
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (COSMagicCodeScanner)magicCodeScanner
{
  return self->_magicCodeScanner;
}

- (void)setMagicCodeScanner:(id)a3
{
}

- (COSTargetOverlayView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (UIScrollView)headerScrollView
{
  return self->_headerScrollView;
}

- (void)setHeaderScrollView:(id)a3
{
}

- (OBHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (OBHeaderAccessoryButton)manualPairingButton
{
  return self->_manualPairingButton;
}

- (void)setManualPairingButton:(id)a3
{
}

- (COSSecurePairingFlowViewController)manualPairingController
{
  return self->_manualPairingController;
}

- (void)setManualPairingController:(id)a3
{
}

- (COSInternalManualPairingViewController)internalPairingController
{
  return self->_internalPairingController;
}

- (void)setInternalPairingController:(id)a3
{
}

- (COSScanningCoordinator)scanningCoordinator
{
  return self->_scanningCoordinator;
}

- (void)setScanningCoordinator:(id)a3
{
}

- (BOOL)hasFinishedPairing
{
  return self->_hasFinishedPairing;
}

- (void)setHasFinishedPairing:(BOOL)a3
{
  self->_BOOL hasFinishedPairing = a3;
}

- (BOOL)noCameraMode
{
  return self->_noCameraMode;
}

- (void)setNoCameraMode:(BOOL)a3
{
  self->_noCameraMode = a3;
}

- (NSTimer)scanningTimeoutTimer
{
  return self->_scanningTimeoutTimer;
}

- (void)setScanningTimeoutTimer:(id)a3
{
}

- (BOOL)teardownScannerOnNextDisappear
{
  return self->_teardownScannerOnNextDisappear;
}

- (void)setTeardownScannerOnNextDisappear:(BOOL)a3
{
  self->_teardownScannerOnNextDisappear = a3;
}

- (BOOL)hasDetectedFrames
{
  return self->_hasDetectedFrames;
}

- (void)setHasDetectedFrames:(BOOL)a3
{
  self->_BOOL hasDetectedFrames = a3;
}

- (BOOL)hasDetectedWrist
{
  return self->_hasDetectedWrist;
}

- (void)setHasDetectedWrist:(BOOL)a3
{
  self->_hasDetectedWrist = a3;
}

- (NSTimer)alreadyPairedStartTimer
{
  return self->_alreadyPairedStartTimer;
}

- (void)setAlreadyPairedStartTimer:(id)a3
{
}

- (NSTimer)alreadyPairedAlertTimer
{
  return self->_alreadyPairedAlertTimer;
}

- (void)setAlreadyPairedAlertTimer:(id)a3
{
}

- (NSTimer)watchOrWristScanTimer
{
  return self->_watchOrWristScanTimer;
}

- (void)setWatchOrWristScanTimer:(id)a3
{
}

- (double)alreadyPairedDetectionStartTimeStamp
{
  return self->_alreadyPairedDetectionStartTimeStamp;
}

- (void)setAlreadyPairedDetectionStartTimeStamp:(double)a3
{
  self->_alreadyPairedDetectionStartTimeStamp = a3;
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (void)setAccelerometer:(id)a3
{
}

- (int64_t)currentDeviceOrientation
{
  return self->_currentDeviceOrientation;
}

- (void)setCurrentDeviceOrientation:(int64_t)a3
{
  self->_currentDeviceOrientation = a3;
}

- (NSTimer)faceUpTimer
{
  return self->_faceUpTimer;
}

- (void)setFaceUpTimer:(id)a3
{
}

- (BOOL)offeringFaceUpAdvice
{
  return self->_offeringFaceUpAdvice;
}

- (void)setOfferingFaceUpAdvice:(BOOL)a3
{
  self->_offeringFaceUpAdvice = a3;
}

- (NSMutableArray)motionDeltaRingBuffer
{
  return self->_motionDeltaRingBuffer;
}

- (void)setMotionDeltaRingBuffer:(id)a3
{
}

- (MotionTuple)previousMotion
{
  return self->_previousMotion;
}

- (void)setPreviousMotion:(id)a3
{
}

- (COSScanWatchDynamicHelpViewController)dynamicHelpViewController
{
  return self->_dynamicHelpViewController;
}

- (void)setDynamicHelpViewController:(id)a3
{
}

- (COSWatchDiscoveryCoordinator)discoveryCoordinator
{
  return self->_discoveryCoordinator;
}

- (void)setDiscoveryCoordinator:(id)a3
{
}

- (COSMLCaptureDisclosureView)disclosureView
{
  return self->_disclosureView;
}

- (void)setDisclosureView:(id)a3
{
}

- (BOOL)wrappingUpSuccessfulManualPairing
{
  return self->_wrappingUpSuccessfulManualPairing;
}

- (void)setWrappingUpSuccessfulManualPairing:(BOOL)a3
{
  self->_BOOL wrappingUpSuccessfulManualPairing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_discoveryCoordinator, 0);
  objc_storeStrong((id *)&self->_dynamicHelpViewController, 0);
  objc_storeStrong((id *)&self->_previousMotion, 0);
  objc_storeStrong((id *)&self->_motionDeltaRingBuffer, 0);
  objc_storeStrong((id *)&self->_faceUpTimer, 0);
  objc_storeStrong((id *)&self->_accelerometer, 0);
  objc_storeStrong((id *)&self->_watchOrWristScanTimer, 0);
  objc_storeStrong((id *)&self->_alreadyPairedAlertTimer, 0);
  objc_storeStrong((id *)&self->_alreadyPairedStartTimer, 0);
  objc_storeStrong((id *)&self->_scanningTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_scanningCoordinator, 0);
  objc_storeStrong((id *)&self->_internalPairingController, 0);
  objc_storeStrong((id *)&self->_manualPairingController, 0);
  objc_storeStrong((id *)&self->_manualPairingButton, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_headerScrollView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_magicCodeScanner, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end