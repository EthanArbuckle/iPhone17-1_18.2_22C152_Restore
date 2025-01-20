@interface WTMainPopoverViewController
- (BOOL)adjustedPopoverContainerViewFrame;
- (BOOL)enableSmallDetent;
- (BOOL)isFeedbackHiddenDetentEnabled;
- (BOOL)isViewApparent;
- (BOOL)presentedAsSheet;
- (BOOL)presenting;
- (CGRect)_offScreenFrame;
- (CGRect)_onScreenFrame;
- (CGRect)_startFrameForAnimation;
- (CGRect)keyboardFrameInWindow:(id)a3;
- (CGRect)onScreenFrameLastReportedToKeyboardTrackingCoordinator;
- (CGRect)pendingWritingToolsKeyboardFrame;
- (CGRect)writingToolsKeyboardFrame;
- (NSUUID)sessionUUID;
- (UISheetPresentationController)sheetController;
- (UIWTInputViewSetPlacementController_Staging)ivsPlacementController;
- (WTMainPopoverViewController)initWithWritingToolsController:(id)a3 startupOptions:(id)a4;
- (WTWritingToolsController)writingToolsController;
- (_TtC14WritingToolsUI16WTStartupOptions)startupOptions;
- (_UIRemoteSheet)_remoteSheet;
- (_UISceneHostingController)hostingController;
- (double)_currentDetentHeight;
- (double)_desiredSheetHeight;
- (double)_smallDetentHeight;
- (double)smallDetentKeyboardHeight;
- (id)_screenForWindow:(id)a3;
- (id)_sourceResponderWindow;
- (void)_dismissalTransitionDidEnd:(id)a3;
- (void)_dismissalTransitionWillBegin:(id)a3;
- (void)_movePopoverBackToDefaultPosition;
- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)_sendKeyboardTrackingNotificationsFromStartFrame:(CGRect)a3 reason:(id)a4;
- (void)_setupSceneHosting;
- (void)applicationDidResume;
- (void)beginTextPlaceholder;
- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)copyText:(id)a3;
- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4;
- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)enableIntelligentEntryFieldView:(BOOL)a3;
- (void)enableSmallDetent:(BOOL)a3;
- (void)endTextPlaceholderAndWillInsertText:(BOOL)a3 completion:(id)a4;
- (void)endWritingTools;
- (void)endWritingToolsWithError:(id)a3;
- (void)enrollmentBegan;
- (void)enrollmentDismissed;
- (void)photosPickerSessionBegan;
- (void)photosPickerSessionDismissed;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6;
- (void)proofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5;
- (void)redo;
- (void)replaceSelectionWithText:(id)a3;
- (void)repositionWithKeyboardChangedInformation:(id)a3;
- (void)resetPresentationSelectedDetent;
- (void)setAdjustedPopoverContainerViewFrame:(BOOL)a3;
- (void)setEnableSmallDetent:(BOOL)a3;
- (void)setFeedbackHiddenDetentEnabled:(BOOL)a3;
- (void)setHostingController:(id)a3;
- (void)setIsFeedbackHiddenDetentEnabled:(BOOL)a3;
- (void)setIsViewApparent:(BOOL)a3;
- (void)setIvsPlacementController:(id)a3;
- (void)setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:(CGRect)a3;
- (void)setPendingWritingToolsKeyboardFrame:(CGRect)a3;
- (void)setPresentedAsSheet:(BOOL)a3;
- (void)setPresenting:(BOOL)a3;
- (void)setSessionUUID:(id)a3;
- (void)setSheetController:(id)a3;
- (void)setSmallDetentKeyboardHeight:(double)a3;
- (void)setStartupOptions:(id)a3;
- (void)setWritingToolsController:(id)a3;
- (void)setWritingToolsKeyboardFrame:(CGRect)a3;
- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3;
- (void)showContentWarningWithTitle:(id)a3 message:(id)a4;
- (void)sourceResponderHorizontalSizeClassChanged:(int64_t)a3;
- (void)undo;
- (void)updatePromptEntryState:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4;
- (void)windowingModeEnabledChanged:(BOOL)a3;
- (void)writingToolsDidUpdateKeyboardPosition:(CGRect)a3 preferredContentSizeChanging:(BOOL)a4;
- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4;
@end

@implementation WTMainPopoverViewController

- (WTMainPopoverViewController)initWithWritingToolsController:(id)a3 startupOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WTMainPopoverViewController;
  v8 = [(WTMainPopoverViewController *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_writingToolsController, v6);
    objc_storeStrong((id *)&v9->_startupOptions, a4);
    uint64_t v10 = [v7 sessionUUID];
    sessionUUID = v9->_sessionUUID;
    v9->_sessionUUID = (NSUUID *)v10;

    [(WTMainPopoverViewController *)v9 setModalPresentationStyle:7];
    v12 = [(WTMainPopoverViewController *)v9 presentationController];
    [v12 setDelegate:v9];

    v13 = NSClassFromString(&cfstr_Uiwtinputviews.isa);
    if (v13)
    {
      v14 = (UIWTInputViewSetPlacementController_Staging *)objc_alloc_init(v13);
      ivsPlacementController = v9->_ivsPlacementController;
      v9->_ivsPlacementController = v14;
    }
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v9 selector:sel__dismissalTransitionWillBegin_ name:*MEMORY[0x263F83910] object:v9];

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v9 selector:sel__dismissalTransitionDidEnd_ name:*MEMORY[0x263F83908] object:v9];

    [MEMORY[0x263F828A0] sizeForInterfaceOrientation:1];
    v9->_smallDetentKeyboardHeight = v18;
    CGPoint v19 = (CGPoint)*MEMORY[0x263F001A0];
    CGSize v20 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v9->_writingToolsKeyboardFrame.origin = (CGPoint)*MEMORY[0x263F001A0];
    v9->_writingToolsKeyboardFrame.size = v20;
    v9->_pendingWritingToolsKeyboardFrame.origin = v19;
    v9->_pendingWritingToolsKeyboardFrame.size = v20;
    [(WTMainPopoverViewController *)v9 _setupSceneHosting];
  }

  return v9;
}

- (void)repositionWithKeyboardChangedInformation:(id)a3
{
  id v33 = a3;
  if ([v33 isFloating]
    || [(WTMainPopoverViewController *)self presentedAsSheet]
    || ([v33 keyboardOnScreen] & 1) == 0)
  {
    [(WTMainPopoverViewController *)self _movePopoverBackToDefaultPosition];
  }
  else
  {
    v4 = [(WTMainPopoverViewController *)self presentationController];
    v5 = [v4 containerView];

    [v33 keyboardPosition];
    double v7 = v6;
    double v9 = v8;
    uint64_t v10 = [v5 window];
    v11 = [v10 screen];
    [v11 bounds];
    double v13 = v12;

    v14 = [v5 window];
    v15 = [v14 screen];
    v16 = [v15 coordinateSpace];
    objc_msgSend(v5, "convertRect:fromCoordinateSpace:", v16, 0.0, v13 - v9, v7, v9);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    [v5 bounds];
    v38.origin.x = v25;
    v38.origin.y = v26;
    v38.size.width = v27;
    v38.size.height = v28;
    v35.origin.x = v18;
    v35.origin.y = v20;
    v35.size.width = v22;
    v35.size.height = v24;
    if (CGRectIntersectsRect(v35, v38))
    {
      [v5 bounds];
      v39.origin.x = v29;
      v39.origin.y = v30;
      v39.size.width = v31;
      v39.size.height = v32;
      v36.origin.x = v18;
      v36.origin.y = v20;
      v36.size.width = v22;
      v36.size.height = v24;
      CGRect v37 = CGRectIntersection(v36, v39);
      objc_msgSend(v5, "frame", v37.origin.x, v37.origin.y, v37.size.width);
      objc_msgSend(v5, "setFrame:");
      [v5 setNeedsLayout];
      [v5 layoutIfNeeded];
      [(WTMainPopoverViewController *)self setAdjustedPopoverContainerViewFrame:1];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WTMainPopoverViewController;
  [(WTMainPopoverViewController *)&v4 viewDidAppear:a3];
  [(WTMainPopoverViewController *)self setIsViewApparent:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(WTMainPopoverViewController *)self setIsViewApparent:0];
  v5.receiver = self;
  v5.super_class = (Class)WTMainPopoverViewController;
  [(WTMainPopoverViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)WTMainPopoverViewController;
  [(WTMainPopoverViewController *)&v10 viewDidDisappear:a3];
  objc_super v4 = _WTVCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = NSNumber;
    double v6 = [(WTMainPopoverViewController *)self writingToolsController];
    double v7 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "isPopoverTemporarilyDismissed"));
    *(_DWORD *)buf = 138412290;
    double v12 = v7;
    _os_log_impl(&dword_261BE2000, v4, OS_LOG_TYPE_DEFAULT, "viewDidDisappear isPopoverTemporarilyDismissed: %@", buf, 0xCu);
  }
  double v8 = [(WTMainPopoverViewController *)self writingToolsController];
  char v9 = [v8 isPopoverTemporarilyDismissed];

  if ((v9 & 1) == 0) {
    [(WTMainPopoverViewController *)self endWritingTools];
  }
}

- (void)applicationDidResume
{
  v4.receiver = self;
  v4.super_class = (Class)WTMainPopoverViewController;
  [(WTMainPopoverViewController *)&v4 applicationDidResume];
  BOOL v3 = [(WTMainPopoverViewController *)self writingToolsController];
  [v3 updateKBSuppression];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)WTMainPopoverViewController;
  [(WTMainPopoverViewController *)&v17 didRotateFromInterfaceOrientation:a3];
  [(WTMainPopoverViewController *)self onScreenFrameLastReportedToKeyboardTrackingCoordinator];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(WTMainPopoverViewController *)self _onScreenFrame];
  -[WTMainPopoverViewController setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:](self, "setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:");
  double v12 = [(WTMainPopoverViewController *)self ivsPlacementController];
  [(WTMainPopoverViewController *)self onScreenFrameLastReportedToKeyboardTrackingCoordinator];
  objc_msgSend(v12, "animateTrackingElementsFromStart:toEnd:forShow:", 1, v5, v7, v9, v11, v13, v14, v15, v16);
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unsigned int v7 = (a4 == 2) ^ [(WTMainPopoverViewController *)self presentedAsSheet];
  if (v7 == 1) {
    [(WTMainPopoverViewController *)self setPresentedAsSheet:a4 == 2];
  }
  double v8 = _WTVCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [NSNumber numberWithInteger:a4];
    double v10 = objc_msgSend(NSNumber, "numberWithBool:", -[WTMainPopoverViewController presentedAsSheet](self, "presentedAsSheet"));
    int v22 = 138412546;
    double v23 = v9;
    __int16 v24 = 2112;
    CGFloat v25 = v10;
    _os_log_impl(&dword_261BE2000, v8, OS_LOG_TYPE_DEFAULT, "presentationController:willPresentWithAdaptiveStyle: %@, presentingAsSheet: %@", (uint8_t *)&v22, 0x16u);
  }
  double v11 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 1)
  {
    double v13 = [MEMORY[0x263F828D0] activeKeyboardSceneDelegate];
    objc_msgSend(v13, "setHideSystemInputAssistantViewForWritingTools:", -[WTMainPopoverViewController presentedAsSheet](self, "presentedAsSheet"));
  }
  double v14 = [(WTMainPopoverViewController *)self writingToolsController];
  [v14 updateKBSuppression];

  double v15 = [(WTMainPopoverViewController *)self writingToolsController];
  [v15 updateInputDashboardViewController];

  double v16 = [(WTMainPopoverViewController *)self writingToolsController];
  [v16 updateSourceView];

  if (v7)
  {
    if ([(WTMainPopoverViewController *)self presentedAsSheet]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 7;
    }
    CGFloat v18 = +[WTUIActionHostToClient actionForChangingPresentationStyle:v17];
    double v19 = [(WTMainPopoverViewController *)self hostingController];
    [v19 sendAction:v18];
  }
  [(WTMainPopoverViewController *)self preferredContentSize];
  if (v21 == *MEMORY[0x263F001B0]
    && v20 == *(double *)(MEMORY[0x263F001B0] + 8)
    && ![(WTMainPopoverViewController *)self enableSmallDetent])
  {
    if (![(WTMainPopoverViewController *)self presentedAsSheet]) {
      -[WTMainPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0, 322.0);
    }
  }
  else
  {
    [(WTMainPopoverViewController *)self _offScreenFrame];
    -[WTMainPopoverViewController _sendKeyboardTrackingNotificationsFromStartFrame:reason:](self, "_sendKeyboardTrackingNotificationsFromStartFrame:reason:", @"initOffScreen");
  }
}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  [(WTMainPopoverViewController *)self _startFrameForAnimation];

  -[WTMainPopoverViewController _sendKeyboardTrackingNotificationsFromStartFrame:reason:](self, "_sendKeyboardTrackingNotificationsFromStartFrame:reason:", @"selectedDetentChanged");
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  v28[3] = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[WTMainPopoverViewController setSheetController:](self, "setSheetController:", v6, v20);
    unsigned int v7 = [(WTMainPopoverViewController *)self sheetController];
    [v7 setPrefersEdgeAttachedInCompactHeight:1];

    double v8 = [(WTMainPopoverViewController *)self sheetController];
    [v8 setWidthFollowsPreferredContentSizeWhenEdgeAttached:1];

    objc_initWeak(&location, self);
    double v9 = (void *)MEMORY[0x263F82BD0];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __93__WTMainPopoverViewController__presentationController_prepareAdaptivePresentationController___block_invoke;
    v25[3] = &unk_26558E4E0;
    objc_copyWeak(&v26, &location);
    double v10 = [v9 customDetentWithIdentifier:@"WTFullSizedDetentIdentifier" resolver:v25];
    double v11 = (void *)MEMORY[0x263F82BD0];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __93__WTMainPopoverViewController__presentationController_prepareAdaptivePresentationController___block_invoke_2;
    v23[3] = &unk_26558E4E0;
    objc_copyWeak(&v24, &location);
    uint64_t v12 = [v11 customDetentWithIdentifier:@"WTFeedbackHiddenDetentIdentifier" resolver:v23];
    double v13 = (void *)MEMORY[0x263F82BD0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __93__WTMainPopoverViewController__presentationController_prepareAdaptivePresentationController___block_invoke_3;
    v21[3] = &unk_26558E4E0;
    objc_copyWeak(&v22, &location);
    double v14 = [v13 customDetentWithIdentifier:@"WTKeyboardSizedDetentIdentifier" resolver:v21];
    v28[0] = v14;
    v28[1] = v12;
    v28[2] = v10;
    double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
    double v16 = [(WTMainPopoverViewController *)self sheetController];
    [v16 setDetents:v15];

    uint64_t v17 = [(WTMainPopoverViewController *)self sheetController];
    [v17 setLargestUndimmedDetentIdentifier:@"WTFullSizedDetentIdentifier"];

    CGFloat v18 = [(WTMainPopoverViewController *)self sheetController];
    [v18 setPrefersGrabberVisible:1];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v6;
    [v19 _setBackgroundBlurDisabled:1];
    [v19 _setOverrideAllowsHitTestingOnBackgroundViews:0];
  }
}

double __93__WTMainPopoverViewController__presentationController_prepareAdaptivePresentationController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _desiredSheetHeight];
  double v3 = v2;

  return v3;
}

double __93__WTMainPopoverViewController__presentationController_prepareAdaptivePresentationController___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained isFeedbackHiddenDetentEnabled];

  if ((v3 & 1) == 0) {
    return *MEMORY[0x263F83988];
  }
  id v4 = objc_loadWeakRetained(v1);
  [v4 _desiredSheetHeight];
  double v6 = v5 + -75.0;

  return v6;
}

double __93__WTMainPopoverViewController__presentationController_prepareAdaptivePresentationController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _smallDetentHeight];
  double v3 = v2;

  return v3;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WTMainPopoverViewController *)self _onScreenFrame];
  double v48 = v6;
  double v49 = v5;
  double v8 = v7;
  double v10 = v9;
  [(WTMainPopoverViewController *)self preferredContentSize];
  double v12 = v11;
  double v14 = v13;
  [v4 preferredContentSize];
  double v16 = v15;
  double v18 = v17;

  -[WTMainPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", v16, v18);
  [(WTMainPopoverViewController *)self preferredContentSize];
  BOOL v21 = v14 == v20 && v12 == v19;
  [(WTMainPopoverViewController *)self pendingWritingToolsKeyboardFrame];
  if (CGRectIsNull(v57)) {
    goto LABEL_6;
  }
  [(WTMainPopoverViewController *)self pendingWritingToolsKeyboardFrame];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  [(WTMainPopoverViewController *)self writingToolsKeyboardFrame];
  v59.origin.x = v30;
  v59.origin.y = v31;
  v59.size.width = v32;
  v59.size.height = v33;
  v58.origin.x = v23;
  v58.origin.y = v25;
  v58.size.width = v27;
  v58.size.height = v29;
  if (CGRectEqualToRect(v58, v59))
  {
LABEL_6:
    int v34 = 0;
  }
  else
  {
    [(WTMainPopoverViewController *)self pendingWritingToolsKeyboardFrame];
    -[WTMainPopoverViewController setWritingToolsKeyboardFrame:](self, "setWritingToolsKeyboardFrame:");
    int v34 = 1;
  }
  -[WTMainPopoverViewController setPendingWritingToolsKeyboardFrame:](self, "setPendingWritingToolsKeyboardFrame:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  CGRect v35 = _WTVCLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    [(WTMainPopoverViewController *)self preferredContentSize];
    CGRect v37 = "N";
    *(_DWORD *)buf = 134218498;
    double v51 = v14;
    if (v34) {
      CGRect v37 = "Y";
    }
    __int16 v52 = 2048;
    uint64_t v53 = v36;
    __int16 v54 = 2080;
    v55 = v37;
    _os_log_impl(&dword_261BE2000, v35, OS_LOG_TYPE_DEFAULT, "-preferredContentSizeDidChange (%.0f -> %.0f) keyboardPositionChange=%s", buf, 0x20u);
  }

  CGRect v38 = [(WTMainPopoverViewController *)self sheetPresentationController];
  CGRect v39 = [v38 selectedDetentIdentifier];
  char v40 = [v39 isEqualToString:@"WTKeyboardSizedDetentIdentifier"];

  if ((v40 & 1) == 0)
  {
    [(WTMainPopoverViewController *)self preferredContentSize];
    double v43 = *MEMORY[0x263F001B0];
    double v42 = *(double *)(MEMORY[0x263F001B0] + 8);
    if ((*MEMORY[0x263F001B0] != v44 || v42 != v41)
      && (![(WTMainPopoverViewController *)self presenting] || v12 == v43 && v14 == v42))
    {
      v45 = &stru_270DB2A10;
      if (!v21)
      {
        v45 = [&stru_270DB2A10 stringByAppendingString:@"preferredContentSize changed"];
      }
      if (v34)
      {
        v46 = @", ";
        if (v21) {
          v46 = &stru_270DB2A10;
        }
        uint64_t v47 = [(__CFString *)v45 stringByAppendingFormat:@"%@keyboardPosition changed", v46];

        v45 = (__CFString *)v47;
      }
      -[WTMainPopoverViewController _sendKeyboardTrackingNotificationsFromStartFrame:reason:](self, "_sendKeyboardTrackingNotificationsFromStartFrame:reason:", v45, v49, v48, v8, v10);
    }
  }
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = _WTVCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = [v6 uuid];
    int v13 = 136315906;
    double v14 = "-[WTMainPopoverViewController willBeginWritingToolsSession:requestContexts:]";
    __int16 v15 = 2112;
    double v16 = self;
    __int16 v17 = 2112;
    double v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = [v6 type];
    _os_log_impl(&dword_261BE2000, v8, OS_LOG_TYPE_INFO, "%s (%@, sessUUIS: %@, sessType: %lu)", (uint8_t *)&v13, 0x2Au);
  }
  double v10 = [(WTMainPopoverViewController *)self sessionUUID];

  if (!v10)
  {
    double v11 = [v6 uuid];
    [(WTMainPopoverViewController *)self setSessionUUID:v11];
  }
  double v12 = [(WTMainPopoverViewController *)self writingToolsController];
  [v12 willBeginWritingToolsSession:v6 requestContexts:v7];
}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = _WTVCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = [v6 uuid];
    int v11 = 136316162;
    double v12 = "-[WTMainPopoverViewController didBeginWritingToolsSession:contexts:]";
    __int16 v13 = 2112;
    double v14 = self;
    __int16 v15 = 2112;
    double v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = [v6 type];
    __int16 v19 = 2048;
    uint64_t v20 = [v7 count];
    _os_log_impl(&dword_261BE2000, v8, OS_LOG_TYPE_INFO, "%s (%@, sessUUID: %@, sessType: %lu, #contexts: %lu)", (uint8_t *)&v11, 0x34u);
  }
  double v10 = [(WTMainPopoverViewController *)self writingToolsController];
  [v10 didBeginWritingToolsSession:v6 contexts:v7];
}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _WTVCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = [v6 uuid];
    int v10 = 136316162;
    int v11 = "-[WTMainPopoverViewController writingToolsSession:didReceiveAction:]";
    __int16 v12 = 2112;
    __int16 v13 = self;
    __int16 v14 = 2112;
    __int16 v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = [v6 type];
    __int16 v18 = 2048;
    int64_t v19 = a4;
    _os_log_impl(&dword_261BE2000, v7, OS_LOG_TYPE_INFO, "%s (%@, sessUUIS: %@, sessType: %lu, action: %lu)", (uint8_t *)&v10, 0x34u);
  }
  double v9 = [(WTMainPopoverViewController *)self writingToolsController];
  [v9 writingToolsSession:v6 didReceiveAction:a4];
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _WTVCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = [v6 uuid];
    uint64_t v9 = [v6 type];
    int v12 = 136316162;
    __int16 v13 = "-[WTMainPopoverViewController didEndWritingToolsSession:accepted:]";
    int v10 = "no";
    if (v4) {
      int v10 = "yes";
    }
    __int16 v14 = 2112;
    __int16 v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 2080;
    uint64_t v21 = v10;
    _os_log_impl(&dword_261BE2000, v7, OS_LOG_TYPE_INFO, "%s (%@, sessUUIS: %@, sessType: %lu, accepted: %s)", (uint8_t *)&v12, 0x34u);
  }
  int v11 = [(WTMainPopoverViewController *)self writingToolsController];
  [v11 didEndWritingToolsSession:v6 accepted:v4];
}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  __int16 v16 = _WTVCLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [v13 uuid];
    uint64_t v18 = [v13 type];
    uint64_t v19 = [v14 length];
    int v22 = 136316930;
    CGFloat v23 = "-[WTMainPopoverViewController compositionSession:didReceiveText:replacementRange:inContext:finished:]";
    __int16 v20 = "no";
    if (v7) {
      __int16 v20 = "yes";
    }
    __int16 v24 = 2112;
    CGFloat v25 = self;
    __int16 v26 = 2112;
    CGFloat v27 = v17;
    __int16 v28 = 2048;
    uint64_t v29 = v18;
    __int16 v30 = 2048;
    uint64_t v31 = v19;
    __int16 v32 = 2048;
    NSUInteger v33 = location;
    __int16 v34 = 2048;
    NSUInteger v35 = length;
    __int16 v36 = 2080;
    CGRect v37 = v20;
    _os_log_impl(&dword_261BE2000, v16, OS_LOG_TYPE_INFO, "%s (%@, sessUUIS: %@, sessType: %lu, textLen: %lu, replaceRange: {%lu,%lu}, finished: %s)", (uint8_t *)&v22, 0x52u);
  }
  uint64_t v21 = [(WTMainPopoverViewController *)self writingToolsController];
  objc_msgSend(v21, "compositionSession:didReceiveText:replacementRange:inContext:finished:", v13, v14, location, length, v15, v7);
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(WTMainPopoverViewController *)self writingToolsController];
  objc_msgSend(v16, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v15, v14, location, length, v13, v7);
}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(WTMainPopoverViewController *)self writingToolsController];
  [v13 proofreadingSession:v12 didUpdateState:a4 forSuggestionWithUUID:v11 inContext:v10];
}

- (void)endWritingToolsWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = _WTVCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    id v15 = "-[WTMainPopoverViewController endWritingToolsWithError:]";
    __int16 v16 = 2112;
    uint64_t v17 = self;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_261BE2000, v5, OS_LOG_TYPE_INFO, "%s (%@, error: %@)", (uint8_t *)&v14, 0x20u);
  }

  double v6 = *MEMORY[0x263F001A0];
  double v7 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A0] + 24);
  -[WTMainPopoverViewController setPendingWritingToolsKeyboardFrame:](self, "setPendingWritingToolsKeyboardFrame:", *MEMORY[0x263F001A0], v7, v8, v9);
  -[WTMainPopoverViewController setWritingToolsKeyboardFrame:](self, "setWritingToolsKeyboardFrame:", v6, v7, v8, v9);
  id v10 = [(WTMainPopoverViewController *)self writingToolsController];
  [v10 endWritingToolsWithError:v4];

  [(WTMainPopoverViewController *)self setPresentedAsSheet:0];
  id v11 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 1)
  {
    id v13 = [MEMORY[0x263F828D0] activeKeyboardSceneDelegate];
    [v13 setHideSystemInputAssistantViewForWritingTools:0];
  }
}

- (void)showContentWarningWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WTMainPopoverViewController *)self writingToolsController];
  [v8 showContentWarningWithTitle:v7 message:v6];
}

- (void)endWritingTools
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  double v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    double v5 = "-[WTMainPopoverViewController endWritingTools]";
    __int16 v6 = 2112;
    id v7 = self;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v4, 0x16u);
  }

  [(WTMainPopoverViewController *)self endWritingToolsWithError:0];
}

- (void)undo
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    __int16 v6 = "-[WTMainPopoverViewController undo]";
    __int16 v7 = 2112;
    uint64_t v8 = self;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v5, 0x16u);
  }

  int v4 = [(WTMainPopoverViewController *)self writingToolsController];
  [v4 undo];
}

- (void)redo
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    __int16 v6 = "-[WTMainPopoverViewController redo]";
    __int16 v7 = 2112;
    uint64_t v8 = self;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v5, 0x16u);
  }

  int v4 = [(WTMainPopoverViewController *)self writingToolsController];
  [v4 redo];
}

- (void)replaceSelectionWithText:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _WTVCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    uint64_t v8 = "-[WTMainPopoverViewController replaceSelectionWithText:]";
    __int16 v9 = 2112;
    id v10 = self;
    __int16 v11 = 2048;
    uint64_t v12 = [v4 length];
    _os_log_impl(&dword_261BE2000, v5, OS_LOG_TYPE_INFO, "%s (%@, textLen=%lu)", (uint8_t *)&v7, 0x20u);
  }

  __int16 v6 = [(WTMainPopoverViewController *)self writingToolsController];
  [v6 replaceSelectionWithText:v4];
}

- (void)copyText:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _WTVCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    uint64_t v8 = "-[WTMainPopoverViewController copyText:]";
    __int16 v9 = 2112;
    id v10 = self;
    __int16 v11 = 2048;
    uint64_t v12 = [v4 length];
    _os_log_impl(&dword_261BE2000, v5, OS_LOG_TYPE_INFO, "%s (%@, textLen: %lu)", (uint8_t *)&v7, 0x20u);
  }

  __int16 v6 = [(WTMainPopoverViewController *)self writingToolsController];
  [v6 copyText:v4];
}

- (void)beginTextPlaceholder
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    __int16 v6 = "-[WTMainPopoverViewController beginTextPlaceholder]";
    __int16 v7 = 2112;
    uint64_t v8 = self;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v5, 0x16u);
  }

  id v4 = [(WTMainPopoverViewController *)self writingToolsController];
  [v4 beginTextPlaceholder];
}

- (void)endTextPlaceholderAndWillInsertText:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  __int16 v7 = _WTVCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = "no";
    __int16 v11 = "-[WTMainPopoverViewController endTextPlaceholderAndWillInsertText:completion:]";
    int v10 = 136315650;
    if (v4) {
      uint64_t v8 = "yes";
    }
    __int16 v12 = 2112;
    uint64_t v13 = self;
    __int16 v14 = 2080;
    id v15 = v8;
    _os_log_impl(&dword_261BE2000, v7, OS_LOG_TYPE_INFO, "%s (%@, willInsertText: %s)", (uint8_t *)&v10, 0x20u);
  }

  uint64_t v9 = [(WTMainPopoverViewController *)self writingToolsController];
  [v9 endTextPlaceholderAndWillInsertText:v4 completion:v6];
}

- (void)enableSmallDetent:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(WTMainPopoverViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 != 1)
  {
    [(WTMainPopoverViewController *)self _onScreenFrame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    BOOL v15 = [(WTMainPopoverViewController *)self enableSmallDetent];
    [(WTMainPopoverViewController *)self setEnableSmallDetent:v3];
    if (v15 != v3 && [(WTMainPopoverViewController *)self presentedAsSheet] && v3)
    {
      [(WTMainPopoverViewController *)self _sendKeyboardTrackingNotificationsFromStartFrame:@"enableSmallDetent", v8, v10, v12, v14 reason];
    }
  }
}

- (void)setFeedbackHiddenDetentEnabled:(BOOL)a3
{
  if ([(WTMainPopoverViewController *)self isFeedbackHiddenDetentEnabled] != a3)
  {
    self->_isFeedbackHiddenDetentEnabled = a3;
    int v5 = [(WTMainPopoverViewController *)self sheetController];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__WTMainPopoverViewController_setFeedbackHiddenDetentEnabled___block_invoke;
    v6[3] = &unk_26558E508;
    BOOL v7 = a3;
    v6[4] = self;
    [v5 animateChanges:v6];
  }
}

void __62__WTMainPopoverViewController_setFeedbackHiddenDetentEnabled___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    BOOL v4 = [v3 sheetController];
    int v5 = @"WTFeedbackHiddenDetentIdentifier";
    id v7 = v4;
  }
  else
  {
    int v6 = [v3 enableSmallDetent];
    BOOL v4 = [*(id *)(a1 + 32) sheetController];
    id v7 = v4;
    if (v6) {
      int v5 = @"WTKeyboardSizedDetentIdentifier";
    }
    else {
      int v5 = @"WTFullSizedDetentIdentifier";
    }
  }
  [v4 setSelectedDetentIdentifier:v5];
}

- (void)enableIntelligentEntryFieldView:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = _WTVCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [NSNumber numberWithBool:v3];
    int v9 = 138412290;
    double v10 = v6;
    _os_log_impl(&dword_261BE2000, v5, OS_LOG_TYPE_DEFAULT, "EnableIntelligentEntryFieldView: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = v3 ^ 1;
  [(WTMainPopoverViewController *)self setEnableSmallDetent:v7];
  double v8 = [(WTMainPopoverViewController *)self sheetController];
  [v8 setPrefersGrabberVisible:v7];
}

- (void)updatePromptEntryState:(int64_t)a3
{
  id v4 = [(WTMainPopoverViewController *)self writingToolsController];
  [v4 updatePromptEntryState:a3];
}

- (void)writingToolsDidUpdateKeyboardPosition:(CGRect)a3 preferredContentSizeChanging:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v26 = *MEMORY[0x263EF8340];
  double v10 = _WTVCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    uint64_t v11 = NSStringFromCGRect(v27);
    double v12 = (void *)v11;
    double v13 = "N";
    if (v4) {
      double v13 = "Y";
    }
    int v22 = 138412546;
    uint64_t v23 = v11;
    __int16 v24 = 2080;
    CGFloat v25 = v13;
    _os_log_impl(&dword_261BE2000, v10, OS_LOG_TYPE_DEFAULT, "-writingToolsDidUpdateKeyboardPosition:%@ preferredContentSizeChanging:%s", (uint8_t *)&v22, 0x16u);
  }
  if (v4)
  {
    -[WTMainPopoverViewController setPendingWritingToolsKeyboardFrame:](self, "setPendingWritingToolsKeyboardFrame:", x, y, width, height);
  }
  else
  {
    [(WTMainPopoverViewController *)self _startFrameForAnimation];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    -[WTMainPopoverViewController setWritingToolsKeyboardFrame:](self, "setWritingToolsKeyboardFrame:", x, y, width, height);
    -[WTMainPopoverViewController setPendingWritingToolsKeyboardFrame:](self, "setPendingWritingToolsKeyboardFrame:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
    if ([(WTMainPopoverViewController *)self isViewApparent]) {
      [(WTMainPopoverViewController *)self _sendKeyboardTrackingNotificationsFromStartFrame:@"updateKeyboardPosition", v15, v17, v19, v21 reason];
    }
  }
}

- (void)proofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5
{
  id v7 = +[WTUIActionHostToClient actionForProofreadingSessionWithUUID:a3 updateState:a4 forSuggestionWithUUID:a5];
  int v6 = [(WTMainPopoverViewController *)self hostingController];
  [v6 sendAction:v7];
}

- (void)sourceResponderHorizontalSizeClassChanged:(int64_t)a3
{
  id v5 = +[WTUIActionHostToClient actionForSourceResponderHorizontalSizeClassChanged:a3];
  BOOL v4 = [(WTMainPopoverViewController *)self hostingController];
  [v4 sendAction:v5];
}

- (void)windowingModeEnabledChanged:(BOOL)a3
{
  id v5 = +[WTUIActionHostToClient actionForWindowingModeEnabledChanged:a3];
  BOOL v4 = [(WTMainPopoverViewController *)self hostingController];
  [v4 sendAction:v5];
}

- (_UIRemoteSheet)_remoteSheet
{
  return self->_hostingController;
}

- (void)_setupSceneHosting
{
  v37[4] = *MEMORY[0x263EF8340];
  BOOL v3 = [(WTMainPopoverViewController *)self hostingController];

  if (!v3)
  {
    [(WTMainPopoverViewController *)self _beginDelayingPresentation:&__block_literal_global_3 cancellationHandler:3.0];
    __int16 v32 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.WritingToolsUIService"];
    id v4 = objc_alloc(MEMORY[0x263F830A8]);
    id v5 = objc_alloc_init(MEMORY[0x263F830C0]);
    int v6 = (void *)[v4 initWithProcessIdentity:v32 sceneSpecification:v5];
    [(WTMainPopoverViewController *)self setHostingController:v6];

    id v7 = [(WTMainPopoverViewController *)self hostingController];
    double v8 = [v7 _eventDeferringComponent];
    [v8 setMaintainHostFirstResponderWhenClientWantsKeyboard:1];

    int v9 = [(WTMainPopoverViewController *)self startupOptions];
    uint64_t v31 = [v9 asBSActionAndReturnError:0];

    objc_initWeak(&location, self);
    double v10 = [WTUISceneHostingActivationController alloc];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __49__WTMainPopoverViewController__setupSceneHosting__block_invoke_2;
    v34[3] = &unk_26558E458;
    objc_copyWeak(&v35, &location);
    uint64_t v11 = [(WTUISceneHostingActivationController *)v10 initWithStartupAction:v31 invalidationHandler:v34];
    double v12 = [(WTMainPopoverViewController *)self hostingController];
    [v12 setActivationController:v11];

    double v13 = [(WTMainPopoverViewController *)self hostingController];
    [v13 setDelegate:self];

    double v14 = [(WTMainPopoverViewController *)self hostingController];
    NSUInteger v33 = [v14 sceneViewController];

    [(WTMainPopoverViewController *)self addChildViewController:v33];
    double v15 = [v33 view];
    double v16 = [(WTMainPopoverViewController *)self view];
    [v16 addSubview:v15];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    __int16 v24 = (void *)MEMORY[0x263F08938];
    __int16 v30 = [v15 leadingAnchor];
    uint64_t v29 = [v16 leadingAnchor];
    __int16 v28 = [v30 constraintEqualToAnchor:v29];
    v37[0] = v28;
    CGRect v27 = [v15 trailingAnchor];
    uint64_t v26 = [v16 trailingAnchor];
    CGFloat v25 = [v27 constraintEqualToAnchor:v26];
    v37[1] = v25;
    double v17 = [v15 topAnchor];
    double v18 = [v16 topAnchor];
    double v19 = [v17 constraintEqualToAnchor:v18];
    v37[2] = v19;
    double v20 = [v15 bottomAnchor];
    double v21 = [v16 bottomAnchor];
    int v22 = [v20 constraintEqualToAnchor:v21];
    v37[3] = v22;
    uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
    [v24 activateConstraints:v23];

    [v33 didMoveToParentViewController:self];
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
}

uint64_t __49__WTMainPopoverViewController__setupSceneHosting__block_invoke()
{
  return 0;
}

void __49__WTMainPopoverViewController__setupSceneHosting__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained writingToolsController];
  [v1 endWritingToolsWithError:0];
}

- (void)_dismissalTransitionWillBegin:(id)a3
{
  if ([(WTMainPopoverViewController *)self presentedAsSheet])
  {
    id v4 = [(WTMainPopoverViewController *)self writingToolsController];
    char v5 = [v4 suppressingSheetForRemoteKeyboardOnScreen];

    if ((v5 & 1) == 0)
    {
      if ([MEMORY[0x263F828A0] isInHardwareKeyboardMode])
      {
        [(WTMainPopoverViewController *)self _offScreenFrame];
        -[WTMainPopoverViewController setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:](self, "setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:");
        id v18 = [(WTMainPopoverViewController *)self ivsPlacementController];
        [(WTMainPopoverViewController *)self _onScreenFrame];
        double v7 = v6;
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        [(WTMainPopoverViewController *)self onScreenFrameLastReportedToKeyboardTrackingCoordinator];
        objc_msgSend(v18, "animateTrackingElementsFromStart:toEnd:forShow:", 0, v7, v9, v11, v13, v14, v15, v16, v17);
      }
    }
  }
}

- (void)_dismissalTransitionDidEnd:(id)a3
{
  id v20 = a3;
  if ([(WTMainPopoverViewController *)self presentedAsSheet])
  {
    id v4 = [v20 userInfo];
    char v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83900]];
    char v6 = [v5 BOOLValue];

    if ((v6 & 1) == 0)
    {
      if ([MEMORY[0x263F828A0] isInHardwareKeyboardMode])
      {
        [(WTMainPopoverViewController *)self _onScreenFrame];
        -[WTMainPopoverViewController setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:](self, "setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:");
        double v7 = [(WTMainPopoverViewController *)self ivsPlacementController];
        [(WTMainPopoverViewController *)self _offScreenFrame];
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        [(WTMainPopoverViewController *)self onScreenFrameLastReportedToKeyboardTrackingCoordinator];
        objc_msgSend(v7, "animateTrackingElementsFromStart:toEnd:forShow:", 1, v9, v11, v13, v15, v16, v17, v18, v19);
      }
    }
  }
}

- (UIWTInputViewSetPlacementController_Staging)ivsPlacementController
{
  BOOL v3 = [(WTMainPopoverViewController *)self startupOptions];
  int v4 = [v3 editable];

  if (v4) {
    char v5 = self->_ivsPlacementController;
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)_sendKeyboardTrackingNotificationsFromStartFrame:(CGRect)a3 reason:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a4;
  double v10 = [(WTMainPopoverViewController *)self sheetController];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __87__WTMainPopoverViewController__sendKeyboardTrackingNotificationsFromStartFrame_reason___block_invoke;
  v27[3] = &unk_26558E530;
  v27[4] = self;
  [v10 animateChanges:v27];

  if ([(WTMainPopoverViewController *)self presenting]
    || [(WTMainPopoverViewController *)self isViewApparent])
  {
    [(WTMainPopoverViewController *)self _onScreenFrame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    -[WTMainPopoverViewController setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:](self, "setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:");
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    v38.origin.double x = v12;
    v38.origin.double y = v14;
    v38.size.double width = v16;
    v38.size.double height = v18;
    if (!CGRectEqualToRect(v35, v38))
    {
      double v19 = _WTVCLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v36.origin.double x = x;
        v36.origin.double y = y;
        v36.size.double width = width;
        v36.size.double height = height;
        id v20 = NSStringFromCGRect(v36);
        [(WTMainPopoverViewController *)self onScreenFrameLastReportedToKeyboardTrackingCoordinator];
        double v21 = NSStringFromCGRect(v37);
        *(_DWORD *)buf = 138412802;
        uint64_t v29 = v20;
        __int16 v30 = 2112;
        uint64_t v31 = v21;
        __int16 v32 = 2112;
        id v33 = v9;
        _os_log_impl(&dword_261BE2000, v19, OS_LOG_TYPE_DEFAULT, "Send keyboard tracking notification now (start:%@, end:%@, reason:\"%@\")", buf, 0x20u);
      }
      int v22 = [(WTMainPopoverViewController *)self ivsPlacementController];
      [(WTMainPopoverViewController *)self onScreenFrameLastReportedToKeyboardTrackingCoordinator];
      objc_msgSend(v22, "animateTrackingElementsFromStart:toEnd:forShow:", 1, x, y, width, height, v23, v24, v25, v26);
    }
  }
}

void __87__WTMainPopoverViewController__sendKeyboardTrackingNotificationsFromStartFrame_reason___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sheetController];
  [v1 invalidateDetents];
}

- (id)_sourceResponderWindow
{
  int v2 = [(WTMainPopoverViewController *)self writingToolsController];
  BOOL v3 = [v2 sourceResponderViewController];
  int v4 = [v3 view];
  char v5 = [v4 window];

  return v5;
}

- (id)_screenForWindow:(id)a3
{
  id v3 = a3;
  int v4 = [v3 windowScene];
  char v5 = [v4 screen];
  char v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 screen];
  }
  double v8 = v7;

  return v8;
}

- (CGRect)keyboardFrameInWindow:(id)a3
{
  id v4 = a3;
  [(WTMainPopoverViewController *)self writingToolsKeyboardFrame];
  CGFloat x = v38.origin.x;
  CGFloat y = v38.origin.y;
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;
  BOOL IsNull = CGRectIsNull(v38);
  CGFloat v10 = *MEMORY[0x263F001A8];
  CGFloat v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  if (!IsNull)
  {
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    if (!CGRectEqualToRect(v39, *MEMORY[0x263F001A8]))
    {
      CGFloat v14 = [(WTMainPopoverViewController *)self _screenForWindow:v4];
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.CGFloat width = width;
      v40.size.CGFloat height = height;
      double v15 = CGRectGetHeight(v40);
      [v14 bounds];
      double MinX = CGRectGetMinX(v41);
      [v14 bounds];
      double v17 = CGRectGetMaxY(v42) - v15;
      [v14 bounds];
      double v18 = CGRectGetWidth(v43);
      double v19 = [v4 windowScene];
      id v20 = [v19 coordinateSpace];

      if (!v20)
      {
        id v20 = [v4 coordinateSpace];
      }
      double v21 = [v14 coordinateSpace];
      objc_msgSend(v21, "convertRect:toCoordinateSpace:", v20, MinX, v17, v18, v15);
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;

      [v4 bounds];
      v47.origin.CGFloat x = v30;
      v47.origin.CGFloat y = v31;
      v47.size.CGFloat width = v32;
      v47.size.CGFloat height = v33;
      v44.origin.CGFloat x = v23;
      v44.origin.CGFloat y = v25;
      v44.size.CGFloat width = v27;
      v44.size.CGFloat height = v29;
      CGRect v45 = CGRectIntersection(v44, v47);
      CGFloat v10 = v45.origin.x;
      CGFloat v11 = v45.origin.y;
      CGFloat v12 = v45.size.width;
      CGFloat v13 = v45.size.height;
    }
  }

  double v34 = v10;
  double v35 = v11;
  double v36 = v12;
  double v37 = v13;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v34;
  return result;
}

- (CGRect)_onScreenFrame
{
  id v3 = [(WTMainPopoverViewController *)self _sourceResponderWindow];
  double v4 = 0.0;
  if (+[WTWritingToolsController _isWritingToolsHandlingKeyboardTracking])
  {
    [(WTMainPopoverViewController *)self keyboardFrameInWindow:v3];
    double v4 = v5;
  }
  if ([(WTMainPopoverViewController *)self presentedAsSheet])
  {
    [(WTMainPopoverViewController *)self _currentDetentHeight];
    double v4 = v4 + v6;
  }
  [v3 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(WTMainPopoverViewController *)self _screenForWindow:v3];
  CGFloat v16 = [v3 windowScene];
  double v17 = [v16 coordinateSpace];

  if (!v17)
  {
    double v17 = [v3 coordinateSpace];
  }
  double v18 = [v15 coordinateSpace];
  objc_msgSend(v17, "convertRect:toCoordinateSpace:", v18, v8, v10 + v14 - v4, v12, v4);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (CGRect)_offScreenFrame
{
  [(WTMainPopoverViewController *)self _onScreenFrame];
  double v6 = v5 + v4;
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v2;
  return result;
}

- (double)_desiredSheetHeight
{
  [(WTMainPopoverViewController *)self preferredContentSize];
  return v2;
}

- (double)_smallDetentHeight
{
  [(WTMainPopoverViewController *)self smallDetentKeyboardHeight];
  double v4 = v3;
  BOOL v5 = [(WTMainPopoverViewController *)self enableSmallDetent];
  double result = *MEMORY[0x263F83988];
  if (v5) {
    return v4;
  }
  return result;
}

- (CGRect)_startFrameForAnimation
{
  [(WTMainPopoverViewController *)self onScreenFrameLastReportedToKeyboardTrackingCoordinator];
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  if (CGRectIsNull(v15)
    || (v16.origin.CGFloat x = x,
        v16.origin.CGFloat y = y,
        v16.size.CGFloat width = width,
        v16.size.CGFloat height = height,
        CGRectEqualToRect(v16, *MEMORY[0x263F001A8])))
  {
    [(WTMainPopoverViewController *)self _offScreenFrame];
    CGFloat x = v7;
    CGFloat y = v8;
    CGFloat width = v9;
    CGFloat height = v10;
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (double)_currentDetentHeight
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  double v3 = [(WTMainPopoverViewController *)self sheetController];
  double v4 = [v3 selectedDetentIdentifier];

  if (v4)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    BOOL v5 = [(WTMainPopoverViewController *)self sheetController];
    double v6 = [v5 detents];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
        double v12 = [v11 identifier];
        char v13 = [v12 isEqualToString:v4];

        if (v13) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      [v11 resolvedValueInContext:0];
      double v15 = v14;
      double v16 = *MEMORY[0x263F83988];

      if (v15 != v16) {
        goto LABEL_23;
      }
    }
    else
    {
LABEL_10:
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v17 = [(WTMainPopoverViewController *)self sheetController];
  double v18 = [v17 detents];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
  double v15 = 0.0;
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v31;
    double v22 = *MEMORY[0x263F83988];
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) resolvedValueInContext:0];
        if (v24 != v22)
        {
          double v15 = v24;
          goto LABEL_22;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_22:

LABEL_23:
  double v25 = [(WTMainPopoverViewController *)self presentingViewController];
  double v26 = [v25 view];
  [v26 safeAreaInsets];
  double v28 = v27;

  return v15 + v28;
}

- (void)_movePopoverBackToDefaultPosition
{
  if ([(WTMainPopoverViewController *)self adjustedPopoverContainerViewFrame])
  {
    [(WTMainPopoverViewController *)self setAdjustedPopoverContainerViewFrame:0];
    double v3 = [(WTMainPopoverViewController *)self presentationController];
    id v6 = [v3 containerView];

    double v4 = [(WTMainPopoverViewController *)self presentationController];
    BOOL v5 = [v6 superview];
    [v4 _frameForTransitionViewInPresentationSuperview:v5];
    objc_msgSend(v6, "setFrame:");

    [v6 setNeedsLayout];
    [v6 layoutIfNeeded];
  }
}

- (void)enrollmentBegan
{
  id v2 = [(WTMainPopoverViewController *)self writingToolsController];
  [v2 enrollmentBegan];
}

- (void)enrollmentDismissed
{
  id v2 = [(WTMainPopoverViewController *)self writingToolsController];
  [v2 enrollmentDismissed];
}

- (void)photosPickerSessionBegan
{
  id v2 = [(WTMainPopoverViewController *)self writingToolsController];
  [v2 photosPickerSessionBegan];
}

- (void)photosPickerSessionDismissed
{
  id v2 = [(WTMainPopoverViewController *)self writingToolsController];
  [v2 photosPickerSessionDismissed];
}

- (void)resetPresentationSelectedDetent
{
  id v2 = [(WTMainPopoverViewController *)self sheetController];
  [v2 setSelectedDetentIdentifier:0];
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (BOOL)presentedAsSheet
{
  return self->_presentedAsSheet;
}

- (void)setPresentedAsSheet:(BOOL)a3
{
  self->_presentedAsSheet = a3;
}

- (_UISceneHostingController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (WTWritingToolsController)writingToolsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writingToolsController);

  return (WTWritingToolsController *)WeakRetained;
}

- (void)setWritingToolsController:(id)a3
{
}

- (UISheetPresentationController)sheetController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sheetController);

  return (UISheetPresentationController *)WeakRetained;
}

- (void)setSheetController:(id)a3
{
}

- (BOOL)enableSmallDetent
{
  return self->_enableSmallDetent;
}

- (void)setEnableSmallDetent:(BOOL)a3
{
  self->_enableSmallDetent = a3;
}

- (BOOL)isFeedbackHiddenDetentEnabled
{
  return self->_isFeedbackHiddenDetentEnabled;
}

- (void)setIsFeedbackHiddenDetentEnabled:(BOOL)a3
{
  self->_isFeedbackHiddenDetentEnabled = a3;
}

- (double)smallDetentKeyboardHeight
{
  return self->_smallDetentKeyboardHeight;
}

- (void)setSmallDetentKeyboardHeight:(double)a3
{
  self->_smallDetentKeyboardHeight = a3;
}

- (void)setIvsPlacementController:(id)a3
{
}

- (CGRect)onScreenFrameLastReportedToKeyboardTrackingCoordinator
{
  double x = self->_onScreenFrameLastReportedToKeyboardTrackingCoordinator.origin.x;
  double y = self->_onScreenFrameLastReportedToKeyboardTrackingCoordinator.origin.y;
  double width = self->_onScreenFrameLastReportedToKeyboardTrackingCoordinator.size.width;
  double height = self->_onScreenFrameLastReportedToKeyboardTrackingCoordinator.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:(CGRect)a3
{
  self->_onScreenFrameLastReportedToKeyboardTrackingCoordinator = a3;
}

- (_TtC14WritingToolsUI16WTStartupOptions)startupOptions
{
  return (_TtC14WritingToolsUI16WTStartupOptions *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setStartupOptions:(id)a3
{
}

- (BOOL)adjustedPopoverContainerViewFrame
{
  return self->_adjustedPopoverContainerViewFrame;
}

- (void)setAdjustedPopoverContainerViewFrame:(BOOL)a3
{
  self->_adjustedPopoverContainerViewFrame = a3;
}

- (BOOL)isViewApparent
{
  return self->_isViewApparent;
}

- (void)setIsViewApparent:(BOOL)a3
{
  self->_isViewApparent = a3;
}

- (CGRect)writingToolsKeyboardFrame
{
  double x = self->_writingToolsKeyboardFrame.origin.x;
  double y = self->_writingToolsKeyboardFrame.origin.y;
  double width = self->_writingToolsKeyboardFrame.size.width;
  double height = self->_writingToolsKeyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setWritingToolsKeyboardFrame:(CGRect)a3
{
  self->_writingToolsKeyboardFrame = a3;
}

- (CGRect)pendingWritingToolsKeyboardFrame
{
  double x = self->_pendingWritingToolsKeyboardFrame.origin.x;
  double y = self->_pendingWritingToolsKeyboardFrame.origin.y;
  double width = self->_pendingWritingToolsKeyboardFrame.size.width;
  double height = self->_pendingWritingToolsKeyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPendingWritingToolsKeyboardFrame:(CGRect)a3
{
  self->_pendingWritingToolsKeyboardFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startupOptions, 0);
  objc_storeStrong((id *)&self->_ivsPlacementController, 0);
  objc_destroyWeak((id *)&self->_sheetController);
  objc_destroyWeak((id *)&self->_writingToolsController);
  objc_storeStrong((id *)&self->_sessionUUID, 0);

  objc_storeStrong((id *)&self->_hostingController, 0);
}

@end