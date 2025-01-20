@interface WTWritingToolsController
+ (BOOL)_isArbiterClientReadyForWritingToolsToHandleKeyboardTracking;
+ (BOOL)_isWritingToolsHandlingKeyboardTracking;
+ (BOOL)_isWritingToolsReadyToHandleKeyboardTracking;
+ (BOOL)iPadOSAlternateQuestionnaireEnabled;
+ (BOOL)isAvailable;
- (BETextInput)beTextInput;
- (BOOL)_compositionSessionActive;
- (BOOL)_isEditableResponder;
- (BOOL)_proofreadingSessionActive;
- (BOOL)_proofreadingSessionActiveOrRequested;
- (BOOL)_rewritingSessionActive;
- (BOOL)_rewritingSessionActiveOrRequested;
- (BOOL)_smartReplySessionActive;
- (BOOL)_smartReplySessionActiveOrRequested;
- (BOOL)_wantsInlineEditing;
- (BOOL)_wantsUCBUI;
- (BOOL)_wantsUCBUI_ucbSupported;
- (BOOL)_wantsUCBUI_ucbSupportedStageManagerActive;
- (BOOL)endingUCBWritingToolsSession;
- (BOOL)isPopoverTemporarilyDismissed;
- (BOOL)isResumingFromModelEnrollment;
- (BOOL)isVisualModeWindowed;
- (BOOL)isWindowingModeEnabled;
- (BOOL)isWritingToolsActive;
- (BOOL)minimizedIntoAssistant;
- (BOOL)minimizedIntoUCB;
- (BOOL)popoverWillAdjust;
- (BOOL)presentingFormSheet;
- (BOOL)presentingPromptEntry;
- (BOOL)shouldAdjustPopoverPresentationController:(id)a3 toRect:(CGRect)a4;
- (BOOL)suppressSheetForKeyboardEditing;
- (BOOL)suppressingSheetForRemoteKeyboardOnScreen;
- (BOOL)switchedFromUCBToPopover;
- (BOOL)temporarilySuppressPopoverForAdjustment;
- (BOOL)windowingModeEnabled;
- (CGRect)_cgRectForSelectionRects:(id)a3;
- (CGRect)_textSelectionRectForSmartReplyPopoverForRange:(id)a3 selectionRects:(id)a4;
- (CGRect)_textSelectionRectForTextInput;
- (CGRect)_visibleApproximationOfTextSelectionRect;
- (CGRect)suggestionPopoverSourceRect;
- (NSMutableArray)proofreadingSuggestions;
- (NSMutableDictionary)contextForSuggestions;
- (NSMutableDictionary)uuidContextMapping;
- (NSMutableDictionary)uuidSuggestionMapping;
- (NSString)prompt;
- (NSUUID)analyticsUUID;
- (NSUUID)popoverSuggestionUUID;
- (UIResponder)sourceResponder;
- (UITextInput)sourceTextInput;
- (UIView)suggestionPopoverSourceView;
- (WTAnalyticsDelegate)analyticsDelegate;
- (WTFormSheetViewController)formSheetViewController;
- (WTMainPopoverViewController)mainPopoverViewController;
- (WTPromptEntryViewController)currentPromptEntryViewController;
- (WTProofreadCandidateBarView)proofreadCandidateBarView;
- (WTSession)session;
- (WTSmartReplyConfiguration)smartReplyConfig;
- (WTSuggestionViewController)currentSuggestionViewController;
- (WTUIAttributedStringController)attributedStringController;
- (WTWritingToolsController)initWithRequestedTool:(id)a3;
- (WTWritingToolsController)initWithRequestedTool:(id)a3 inputContextHistory:(id)a4;
- (WTWritingToolsController)initWithRequestedTool:(id)a3 prompt:(id)a4;
- (WTWritingToolsController)initWithRequestedTool:(id)a3 prompt:(id)a4 smartReplyConfiguration:(id)a5;
- (WTWritingToolsController)initWithRequestedTool:(id)a3 smartReplyConfiguration:(id)a4;
- (WTWritingToolsController)initWithTool:(int64_t)a3 prompt:(id)a4;
- (WTWritingToolsController)initWithTool:(int64_t)a3 prompt:(id)a4 smartReplyConfiguration:(id)a5;
- (WTWritingToolsDelegate)writingToolsDelegate;
- (id)_assistantBarButtonCustomViewWithTitle:(id)a3 handler:(id)a4;
- (id)_assistantProofreadBarButton;
- (id)_createCompositionInputDashboardViewController;
- (id)_createProofreadingInputDashboardViewControllerForAssistant:(BOOL)a3;
- (id)_createSmartReplyInputDashboardViewController;
- (id)_initWithRequestedTool:(id)a3 baseResponse:(id)a4 entryPoint:(id)a5 inputContextHistory:(id)a6;
- (id)_inputDashboardViewController;
- (id)_textViewDelegate;
- (id)assistantBarButtonItemWithStyle:(int64_t)a3;
- (id)itemProviderForAttributedText:(id)a3;
- (id)itemProviderForPlainText:(id)a3;
- (id)sourceResponderViewController;
- (id)trailingPredictiveCandidate;
- (int64_t)requestedTool;
- (int64_t)sourceResponderHorizontalSizeClass;
- (unint64_t)_permittedPopoverArrowDirection;
- (void)_createSmartReplyInputDashboardViewController;
- (void)_dismissPromptEntryViewController;
- (void)_dismissSuggestionViewController;
- (void)_presentMainPopoverViewController;
- (void)_presentPromptEntryViewController;
- (void)_presentSuggestionViewController;
- (void)_refreshSourceResponderHorizontalSizeClassState;
- (void)_refreshWindowingModeEnabled;
- (void)_revertAllSuggestions;
- (void)_updatePopoverAnchoring;
- (void)_updatePromptEntryPopover;
- (void)_updateSuggestionPopover;
- (void)beginTextPlaceholder;
- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)copyText:(id)a3;
- (void)dealloc;
- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4;
- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4;
- (void)endTextPlaceholderAndWillInsertText:(BOOL)a3 completion:(id)a4;
- (void)endWritingTools;
- (void)endWritingToolsWithError:(id)a3;
- (void)enrollmentBegan;
- (void)enrollmentDismissed;
- (void)handOffFromUCBWithPrompt:(id)a3;
- (void)photosPickerSessionBegan;
- (void)photosPickerSessionDismissed;
- (void)presentError:(id)a3;
- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6;
- (void)proofreadingSessionWithUUID:(id)a3 showDetailsForSuggestionWithUUID:(id)a4 relativeToRect:(CGRect)a5 inView:(id)a6;
- (void)proofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5;
- (void)redo;
- (void)remoteKeyboardChanged:(id)a3;
- (void)replaceSelectionWithText:(id)a3;
- (void)selectionDidUpdate;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setAttributedStringController:(id)a3;
- (void)setBeTextInput:(id)a3;
- (void)setContextForSuggestions:(id)a3;
- (void)setCurrentPromptEntryViewController:(id)a3;
- (void)setCurrentSuggestionViewController:(id)a3;
- (void)setEndingUCBWritingToolsSession:(BOOL)a3;
- (void)setFormSheetViewController:(id)a3;
- (void)setIsResumingFromModelEnrollment:(BOOL)a3;
- (void)setIsWritingToolsActive:(BOOL)a3;
- (void)setMainPopoverViewController:(id)a3;
- (void)setMinimizedIntoAssistant:(BOOL)a3;
- (void)setMinimizedIntoUCB:(BOOL)a3;
- (void)setPopoverSuggestionUUID:(id)a3;
- (void)setPresentingFormSheet:(BOOL)a3;
- (void)setPresentingPromptEntry:(BOOL)a3;
- (void)setPrompt:(id)a3;
- (void)setProofreadCandidateBarView:(id)a3;
- (void)setProofreadingSuggestions:(id)a3;
- (void)setRequestedTool:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSmartReplyConfig:(id)a3;
- (void)setSourceResponder:(id)a3;
- (void)setSourceResponder:(id)a3 sourceTextInput:(id)a4;
- (void)setSourceResponderHorizontalSizeClass:(int64_t)a3;
- (void)setSourceTextInput:(id)a3;
- (void)setSuggestionPopoverSourceRect:(CGRect)a3;
- (void)setSuggestionPopoverSourceView:(id)a3;
- (void)setSuppressSheetForKeyboardEditing:(BOOL)a3;
- (void)setSuppressWritingToolsForRemoteKeyboard:(BOOL)a3;
- (void)setSuppressingSheetForRemoteKeyboardOnScreen:(BOOL)a3;
- (void)setSwitchedFromUCBToPopover:(BOOL)a3;
- (void)setTemporarilySuppressPopoverForAdjustment:(BOOL)a3;
- (void)setUuidContextMapping:(id)a3;
- (void)setUuidSuggestionMapping:(id)a3;
- (void)setWindowingModeEnabled:(BOOL)a3;
- (void)setWritingToolsDelegate:(id)a3;
- (void)showAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 buttonAction:(id)a6;
- (void)showContentWarningWithTitle:(id)a3 message:(id)a4;
- (void)showSmartReplyQuestionnaireWithRect:(CGRect)a3;
- (void)startWritingTools;
- (void)textSystemWillBeginEditingDuringSessionWithUUID:(id)a3;
- (void)undo;
- (void)updateInputDashboardViewController;
- (void)updateKBSuppression;
- (void)updatePromptEntryState:(int64_t)a3;
- (void)updateSourceView;
- (void)updateWritingToolsPopoverSuppression;
- (void)updateWritingToolsPopoverSuppressionWithCompletion:(id)a3;
- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4;
- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4;
@end

@implementation WTWritingToolsController

- (WTWritingToolsController)initWithRequestedTool:(id)a3
{
  return [(WTWritingToolsController *)self initWithRequestedTool:a3 prompt:0];
}

- (WTWritingToolsController)initWithRequestedTool:(id)a3 prompt:(id)a4
{
  return [(WTWritingToolsController *)self initWithRequestedTool:a3 prompt:a4 smartReplyConfiguration:0];
}

- (WTWritingToolsController)initWithRequestedTool:(id)a3 inputContextHistory:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F880A8];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithInputContextHistory:v7];

  v10 = [(WTWritingToolsController *)self initWithRequestedTool:v8 prompt:0 smartReplyConfiguration:v9];
  return v10;
}

- (WTWritingToolsController)initWithRequestedTool:(id)a3 smartReplyConfiguration:(id)a4
{
  return [(WTWritingToolsController *)self initWithRequestedTool:a3 prompt:0 smartReplyConfiguration:a4];
}

- (id)_initWithRequestedTool:(id)a3 baseResponse:(id)a4 entryPoint:(id)a5 inputContextHistory:(id)a6
{
  v10 = (objc_class *)MEMORY[0x263F880A8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[[v10 alloc] initWithInputContextHistory:v11];

  [v15 setBaseResponse:v13];
  [v15 setEntryPoint:v12];

  v16 = [(WTWritingToolsController *)self initWithRequestedTool:v14 smartReplyConfiguration:v15];
  return v16;
}

- (WTWritingToolsController)initWithRequestedTool:(id)a3 prompt:(id)a4 smartReplyConfiguration:(id)a5
{
  v18[14] = *MEMORY[0x263EF8340];
  v17[0] = @"WTUIRequestedToolNone";
  v17[1] = @"WTUIRequestedToolProofreading";
  v18[0] = &unk_270DB9D98;
  v18[1] = &unk_270DB9DB0;
  v17[2] = @"WTUIRequestedToolRewriting";
  v17[3] = @"WTUIRequestedToolRewriteProofread";
  v18[2] = &unk_270DB9DC8;
  v18[3] = &unk_270DB9DE0;
  v17[4] = @"WTUIRequestedToolSmartReply";
  v17[5] = @"WTUIRequestedToolRewriteFriendly";
  v18[4] = &unk_270DB9DF8;
  v18[5] = &unk_270DB9E10;
  v17[6] = @"WTUIRequestedToolRewriteProfessional";
  v17[7] = @"WTUIRequestedToolRewriteConcise";
  v18[6] = &unk_270DB9E28;
  v18[7] = &unk_270DB9E40;
  v17[8] = @"WTUIRequestedToolRewriteOpenEnded";
  v17[9] = @"WTUIRequestedToolSummary";
  v18[8] = &unk_270DB9E58;
  v18[9] = &unk_270DB9E70;
  v17[10] = @"WTUIRequestedToolTransformKeyPoints";
  v17[11] = @"WTUIRequestedToolTransformList";
  v18[10] = &unk_270DB9E88;
  v18[11] = &unk_270DB9EA0;
  v17[12] = @"WTUIRequestedToolTransformTable";
  v17[13] = @"WTUIRequestedToolCompose";
  v18[12] = &unk_270DB9EB8;
  v18[13] = &unk_270DB9ED0;
  id v8 = NSDictionary;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 dictionaryWithObjects:v18 forKeys:v17 count:14];
  id v13 = [v12 objectForKeyedSubscript:v11];

  uint64_t v14 = [v13 integerValue];
  v15 = [(WTWritingToolsController *)self initWithTool:v14 prompt:v10 smartReplyConfiguration:v9];

  return v15;
}

- (WTWritingToolsController)initWithTool:(int64_t)a3 prompt:(id)a4
{
  return [(WTWritingToolsController *)self initWithTool:a3 prompt:a4 smartReplyConfiguration:0];
}

- (WTWritingToolsController)initWithTool:(int64_t)a3 prompt:(id)a4 smartReplyConfiguration:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WTWritingToolsController;
  id v11 = [(WTWritingToolsController *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    v11->_requestedTool = a3;
    objc_storeStrong((id *)&v11->_prompt, a4);
    objc_storeStrong((id *)&v12->_smartReplyConfig, a5);
  }

  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83920] object:self];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F83918] object:self];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F83910] object:self];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F83908] object:self];

  v7.receiver = self;
  v7.super_class = (Class)WTWritingToolsController;
  [(WTWritingToolsController *)&v7 dealloc];
}

+ (BOOL)iPadOSAlternateQuestionnaireEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)_isWritingToolsReadyToHandleKeyboardTracking
{
  return _os_feature_enabled_impl();
}

+ (BOOL)_isArbiterClientReadyForWritingToolsToHandleKeyboardTracking
{
  v2 = [MEMORY[0x263F828D0] automaticKeyboardArbiterClient];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 _isArbiterClientReadyForWritingToolsToHandleKeyboardTracking];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

+ (BOOL)_isWritingToolsHandlingKeyboardTracking
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__WTWritingToolsController__isWritingToolsHandlingKeyboardTracking__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_isWritingToolsHandlingKeyboardTracking_onceToken != -1) {
    dispatch_once(&_isWritingToolsHandlingKeyboardTracking_onceToken, block);
  }
  return _isWritingToolsHandlingKeyboardTracking_isWritingToolsHandlingKeyboardTracking;
}

void __67__WTWritingToolsController__isWritingToolsHandlingKeyboardTracking__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) _isWritingToolsReadyToHandleKeyboardTracking];
  int v3 = [*(id *)(a1 + 32) _isArbiterClientReadyForWritingToolsToHandleKeyboardTracking];
  _isWritingToolsHandlingKeyboardTracking_isWritingToolsHandlingKeyboardTracking = v2 & v3;
  v4 = _WTVCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "Y";
    if (_isWritingToolsHandlingKeyboardTracking_isWritingToolsHandlingKeyboardTracking) {
      v6 = "Y";
    }
    else {
      v6 = "N";
    }
    if (v2) {
      objc_super v7 = "Y";
    }
    else {
      objc_super v7 = "N";
    }
    int v8 = 136315650;
    id v9 = v6;
    __int16 v10 = 2080;
    id v11 = v7;
    if (!v3) {
      v5 = "N";
    }
    __int16 v12 = 2080;
    id v13 = v5;
    _os_log_impl(&dword_261BE2000, v4, OS_LOG_TYPE_DEFAULT, "isWritingToolsHandlingKeyboardTracking:%s (WT ready:%s, Arbiter ready:%s)", (uint8_t *)&v8, 0x20u);
  }
}

- (void)setSourceResponder:(id)a3 sourceTextInput:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_storeWeak((id *)&self->_sourceResponder, v6);
  objc_storeWeak((id *)&self->_sourceTextInput, v7);
  if ([v7 conformsToProtocol:&unk_270DDBA48]) {
    int v8 = (BETextInput *)v7;
  }
  else {
    int v8 = 0;
  }
  beTextInput = self->_beTextInput;
  self->_beTextInput = v8;

  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceResponder);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_sourceResponder);
    id v13 = self;
    v22[0] = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __63__WTWritingToolsController_setSourceResponder_sourceTextInput___block_invoke;
    v19 = &unk_26558E580;
    objc_copyWeak(&v20, &location);
    id v15 = (id)[v12 registerForTraitChanges:v14 withHandler:&v16];

    objc_destroyWeak(&v20);
  }
  [(WTWritingToolsController *)self _refreshSourceResponderHorizontalSizeClassState];
  objc_destroyWeak(&location);
}

void __63__WTWritingToolsController_setSourceResponder_sourceTextInput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshSourceResponderHorizontalSizeClassState];
}

- (void)startWritingTools
{
  int v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_DEFAULT, "startWritingTools", v12, 2u);
  }

  v4 = [MEMORY[0x263F82678] activeInstance];
  [v4 cancelDictation];

  BOOL v5 = [(WTWritingToolsController *)self requestedTool] == 101;
  id v6 = [MEMORY[0x263F08C38] UUID];
  analyticsUUID = self->_analyticsUUID;
  self->_analyticsUUID = v6;

  int v8 = [WTAnalyticsDelegate alloc];
  id v9 = [(WTWritingToolsController *)self smartReplyConfig];
  __int16 v10 = [(WTWritingToolsController *)self analyticsUUID];
  char v11 = [(WTAnalyticsDelegate *)v8 initWithSmartReplyBool:v5 smartReplyConfig:v9 analyticsUUID:v10 requestedTool:[(WTWritingToolsController *)self requestedTool] isEditable:[(WTWritingToolsController *)self _isEditableResponder]];
  [(WTWritingToolsController *)self setAnalyticsDelegate:v11];

  [(WTWritingToolsController *)self setIsWritingToolsActive:1];
  [(WTWritingToolsController *)self updateSourceView];
  if ([(WTWritingToolsController *)self requestedTool] != 101) {
    [(WTWritingToolsController *)self setRequestedTool:0];
  }
}

- (void)endWritingTools
{
}

- (void)endWritingToolsWithError:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = _WTVCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl(&dword_261BE2000, v5, OS_LOG_TYPE_DEFAULT, "endWritingToolsWithError %@", buf, 0xCu);
  }

  if ([(WTWritingToolsController *)self _proofreadingSessionActive])
  {
    id v6 = [(WTWritingToolsController *)self session];
    id v7 = self;
    int v8 = v6;
    uint64_t v9 = 1;
LABEL_8:
    [(WTWritingToolsController *)v7 didEndWritingToolsSession:v8 accepted:v9];

    goto LABEL_9;
  }
  if ([(WTWritingToolsController *)self _rewritingSessionActive]
    || [(WTWritingToolsController *)self _smartReplySessionActive])
  {
    id v6 = [(WTWritingToolsController *)self session];
    id v7 = self;
    int v8 = v6;
    uint64_t v9 = 0;
    goto LABEL_8;
  }
LABEL_9:
  __int16 v10 = [(WTWritingToolsController *)self mainPopoverViewController];

  if (v10)
  {
    char v11 = _WTVCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_261BE2000, v11, OS_LOG_TYPE_DEFAULT, "dismissViewController for endWritingTools", buf, 2u);
    }

    id v12 = [(WTWritingToolsController *)self mainPopoverViewController];
    id v13 = [v12 presentingViewController];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __53__WTWritingToolsController_endWritingToolsWithError___block_invoke;
    id v20 = &unk_26558E5A8;
    id v21 = v4;
    v22 = self;
    [v13 dismissViewControllerAnimated:1 completion:&v17];

    -[WTWritingToolsController setMainPopoverViewController:](self, "setMainPopoverViewController:", 0, v17, v18, v19, v20);
  }
  else if (v4)
  {
    [(WTWritingToolsController *)self presentError:v4];
  }
  uint64_t v14 = [MEMORY[0x263F828D0] activeKeyboardSceneDelegate];
  [v14 removeVisibilityObserver:self];

  [(WTWritingToolsController *)self setMinimizedIntoAssistant:0];
  [(WTWritingToolsController *)self updateKBSuppression];
  [(WTWritingToolsController *)self updateInputDashboardViewController];
  id v15 = [(WTWritingToolsController *)self sourceResponder];
  if (objc_opt_respondsToSelector()) {
    [v15 _writingToolsDidEnd];
  }
  uint64_t v16 = [(WTWritingToolsController *)self analyticsDelegate];
  [v16 endWritingTools];

  [(WTWritingToolsController *)self setAnalyticsDelegate:0];
  [(WTWritingToolsController *)self setWritingToolsDelegate:0];
}

uint64_t __53__WTWritingToolsController_endWritingToolsWithError___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "presentError:");
  }
  return result;
}

- (void)_refreshSourceResponderHorizontalSizeClassState
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = [(WTWritingToolsController *)self sourceResponderViewController];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  if ([(WTWritingToolsController *)self sourceResponderHorizontalSizeClass] != v5)
  {
    id v6 = _WTVCLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [NSNumber numberWithInteger:v5];
      int v9 = 138412290;
      __int16 v10 = v7;
      _os_log_impl(&dword_261BE2000, v6, OS_LOG_TYPE_DEFAULT, "sourceResponderHorizontalSizeClass changed, new value: %@", (uint8_t *)&v9, 0xCu);
    }
    [(WTWritingToolsController *)self setSourceResponderHorizontalSizeClass:v5];
    int v8 = [(WTWritingToolsController *)self mainPopoverViewController];
    [v8 sourceResponderHorizontalSizeClassChanged:v5];

    [(WTWritingToolsController *)self updateSourceView];
  }
}

- (void)_refreshWindowingModeEnabled
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WTWritingToolsController *)self isWindowingModeEnabled];
  if (v3 != [(WTWritingToolsController *)self windowingModeEnabled])
  {
    id v4 = _WTVCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [NSNumber numberWithBool:v3];
      int v7 = 138412290;
      int v8 = v5;
      _os_log_impl(&dword_261BE2000, v4, OS_LOG_TYPE_DEFAULT, "isWindowingModeEnabled changed, new value: %@", (uint8_t *)&v7, 0xCu);
    }
    id v6 = [(WTWritingToolsController *)self mainPopoverViewController];
    [v6 windowingModeEnabledChanged:v3];
  }
}

- (BOOL)isVisualModeWindowed
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F828D0] activeKeyboardSceneDelegate];
  if (objc_opt_respondsToSelector()) {
    int v3 = [v2 useVisualModeWindowedUI];
  }
  else {
    int v3 = 0;
  }
  id v4 = _WTVCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = "NO";
    if (v3) {
      uint64_t v5 = "YES";
    }
    int v7 = 136315138;
    int v8 = v5;
    _os_log_impl(&dword_261BE2000, v4, OS_LOG_TYPE_DEFAULT, "useVisualModeWindowedUI: %s", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

- (BOOL)isWindowingModeEnabled
{
  int v2 = [MEMORY[0x263F828D0] activeKeyboardSceneDelegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 windowingModeEnabled];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)presentError:(id)a3
{
  id v32 = a3;
  id v4 = (void *)MEMORY[0x263F82418];
  uint64_t v5 = [v32 localizedDescription];
  id v6 = [v32 localizedFailureReason];
  int v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  if (os_variant_has_internal_diagnostics())
  {
    int v8 = NSString;
    uint64_t v9 = [v32 userInfo];
    __int16 v10 = [v9 objectForKeyedSubscript:@"WTInternalDescriptionErrorKey"];
    uint64_t v11 = [v8 stringWithFormat:@"[INTERNAL DEBUGGING] %@", v10];

    id v12 = NSString;
    uint64_t v13 = [v7 message];
    uint64_t v14 = (void *)v13;
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    else {
      id v15 = &stru_270DB2A10;
    }
    uint64_t v16 = [v12 stringWithFormat:@"%@\n\n%@", v15, v11];
    [v7 setMessage:v16];
  }
  uint64_t v17 = [v32 userInfo];
  uint64_t v18 = [v17 objectForKeyedSubscript:@"WTRequireReauthenticationErrorKey"];
  int v19 = [v18 BOOLValue];

  id v20 = (void *)MEMORY[0x263F82400];
  id v21 = [MEMORY[0x263F086E0] mainBundle];
  v22 = v21;
  if (v19)
  {
    v23 = [v21 localizedStringForKey:@"Cancel" value:&stru_270DB2A10 table:0];
    id v24 = [v20 actionWithTitle:v23 style:1 handler:0];
    [v7 addAction:v24];

    uint64_t v25 = (void *)MEMORY[0x263F82400];
    v22 = [MEMORY[0x263F086E0] mainBundle];
    v26 = [v22 localizedStringForKey:@"Update Account" value:&stru_270DB2A10 table:0];
    v27 = &__block_literal_global_4;
    v28 = v25;
    v29 = v26;
  }
  else
  {
    v26 = [v21 localizedStringForKey:@"OK" value:&stru_270DB2A10 table:0];
    v28 = v20;
    v29 = v26;
    v27 = 0;
  }
  v30 = [v28 actionWithTitle:v29 style:0 handler:v27];
  [v7 addAction:v30];

  v31 = [(WTWritingToolsController *)self sourceResponderViewController];
  [v31 presentViewController:v7 animated:1 completion:0];
}

void __41__WTWritingToolsController_presentError___block_invoke()
{
  id v1 = +[WTSettingsDestination rootURL];
  v0 = [MEMORY[0x263F01880] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (void)showContentWarningWithTitle:(id)a3 message:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  int v7 = [(WTWritingToolsController *)self _inputDashboardViewController];
  if ([(WTWritingToolsController *)self _wantsUCBUI] && v7) {
    [v7 showContentWarningWithTitle:v8 message:v6];
  }
}

- (void)showAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 buttonAction:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(WTWritingToolsController *)self _inputDashboardViewController];
  if ([(WTWritingToolsController *)self _wantsUCBUI] && v13) {
    [v13 showAlertWithTitle:v14 message:v10 buttonTitle:v11 buttonAction:v12];
  }
}

- (void)handOffFromUCBWithPrompt:(id)a3
{
  id v4 = a3;
  [(WTWritingToolsController *)self setSwitchedFromUCBToPopover:1];
  [(WTWritingToolsController *)self setRequestedTool:201];
  [(WTWritingToolsController *)self setPrompt:v4];

  uint64_t v5 = [(WTWritingToolsController *)self writingToolsDelegate];
  id v6 = [(WTWritingToolsController *)self session];
  [v5 didEndWritingToolsSession:v6 accepted:0];

  [(WTWritingToolsController *)self updateSourceView];
}

- (id)trailingPredictiveCandidate
{
  if ([(WTWritingToolsController *)self _proofreadingSessionActive]
    && [(WTWritingToolsController *)self suppressSheetForKeyboardEditing])
  {
    char v3 = [MEMORY[0x263F7E640] candidateWithCandidate:&stru_270DB2A10 forInput:&stru_270DB2A10 property:8];
    id v4 = objc_alloc_init(WTProofreadCandidateBarView);
    uint64_t v5 = [(WTWritingToolsController *)self proofreadingSuggestions];
    -[WTProofreadCandidateBarView setSuggestionCount:](v4, "setSuggestionCount:", [v5 count]);

    [(WTWritingToolsController *)self setProofreadCandidateBarView:v4];
    [v3 setCustomView:v4];
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__WTWritingToolsController_trailingPredictiveCandidate__block_invoke;
    v7[3] = &unk_26558E458;
    objc_copyWeak(&v8, &location);
    [v3 setHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

void __55__WTWritingToolsController_trailingPredictiveCandidate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSuppressSheetForKeyboardEditing:0];
}

- (id)assistantBarButtonItemWithStyle:(int64_t)a3
{
  if (![(WTWritingToolsController *)self suppressSheetForKeyboardEditing]
    || ([(WTWritingToolsController *)self session],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    id v14 = 0;
    goto LABEL_15;
  }
  id v6 = objc_alloc_init(MEMORY[0x263F824A8]);
  [v6 setIsKeyboardItem:1];
  objc_initWeak(&location, self);
  switch(a3)
  {
    case 24:
      if (![(WTWritingToolsController *)self minimizedIntoAssistant])
      {
        id v8 = [(WTWritingToolsController *)self _assistantProofreadBarButton];
        [v6 setCustomView:v8];
        goto LABEL_13;
      }
      break;
    case 23:
      id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v8 = [v15 localizedStringForKey:@"Revert" value:&stru_270DB2A10 table:@"Localizable"];

      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v8];
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      int v19 = __60__WTWritingToolsController_assistantBarButtonItemWithStyle___block_invoke_2;
      id v20 = &unk_26558E5F0;
      id v12 = &v22;
      objc_copyWeak(&v22, &location);
      id v21 = self;
      uint64_t v13 = [(WTWritingToolsController *)self _assistantBarButtonCustomViewWithTitle:v9 handler:&v17];
      objc_msgSend(v6, "setCustomView:", v13, v17, v18, v19, v20);
      goto LABEL_11;
    case 22:
      int v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:@"Done" value:&stru_270DB2A10 table:@"Localizable"];

      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v8];
      id v10 = [MEMORY[0x263F81708] boldSystemFontOfSize:15.0];
      uint64_t v11 = [v8 length];
      objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x263F814F0], v10, 0, v11);

      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __60__WTWritingToolsController_assistantBarButtonItemWithStyle___block_invoke;
      v23[3] = &unk_26558E458;
      id v12 = &v24;
      objc_copyWeak(&v24, &location);
      uint64_t v13 = [(WTWritingToolsController *)self _assistantBarButtonCustomViewWithTitle:v9 handler:v23];
      [v6 setCustomView:v13];
LABEL_11:

      objc_destroyWeak(v12);
LABEL_13:

      id v14 = v6;
      goto LABEL_14;
  }
  id v14 = 0;
LABEL_14:
  objc_destroyWeak(&location);

LABEL_15:

  return v14;
}

void __60__WTWritingToolsController_assistantBarButtonItemWithStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endWritingTools];
}

void __60__WTWritingToolsController_assistantBarButtonItemWithStyle___block_invoke_2(uint64_t a1)
{
  int v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [*(id *)(a1 + 32) session];
  [WeakRetained didEndWritingToolsSession:v4 accepted:0];

  id v5 = objc_loadWeakRetained(v2);
  [v5 endWritingTools];
}

- (void)updatePromptEntryState:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      id v5 = _WTVCLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v7 = 0;
        id v6 = (uint8_t *)&v7;
LABEL_11:
        _os_log_impl(&dword_261BE2000, v5, OS_LOG_TYPE_DEFAULT, "prompt entry mode dismissed", v6, 2u);
      }
LABEL_12:

      [(WTWritingToolsController *)self _dismissPromptEntryViewController];
      return;
    case 2:
      id v5 = _WTVCLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        id v6 = v8;
        goto LABEL_11;
      }
      goto LABEL_12;
    case 1:
      id v4 = _WTVCLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_261BE2000, v4, OS_LOG_TYPE_DEFAULT, "prompt entry mode requested", buf, 2u);
      }

      [(WTWritingToolsController *)self _updatePromptEntryPopover];
      break;
  }
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _WTVCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 uuid];
    *(_DWORD *)buf = 138412290;
    v63 = v9;
    _os_log_impl(&dword_261BE2000, v8, OS_LOG_TYPE_DEFAULT, "willBeginWritingToolsSession: %@", buf, 0xCu);
  }
  [v6 setTextViewDelegate:self];
  objc_initWeak((id *)buf, self);
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __73__WTWritingToolsController_willBeginWritingToolsSession_requestContexts___block_invoke;
  v56[3] = &unk_26558E640;
  objc_copyWeak(&v59, (id *)buf);
  id v10 = v7;
  id v58 = v10;
  id v11 = v6;
  id v57 = v11;
  v55 = (void (**)(void, void))MEMORY[0x263E4F630](v56);
  id v12 = [(WTWritingToolsController *)self analyticsDelegate];
  [v12 willBeginWritingToolsSession:v11 requestContexts:v10];

  [(WTWritingToolsController *)self setSwitchedFromUCBToPopover:0];
  uint64_t v13 = [(WTWritingToolsController *)self writingToolsDelegate];

  if (v13)
  {
    id v14 = [(WTWritingToolsController *)self writingToolsDelegate];
    [v14 willBeginWritingToolsSession:v11 requestContexts:v55];
  }
  else
  {
    if ([v11 compositionSessionType] == 10)
    {
      id v15 = [(WTWritingToolsController *)self sourceTextInput];
      v54 = [v15 beginningOfDocument];

      uint64_t v16 = [(WTWritingToolsController *)self sourceTextInput];
      uint64_t v53 = [v16 endOfDocument];

      uint64_t v17 = [(WTWritingToolsController *)self sourceTextInput];
      v52 = [v17 textRangeFromPosition:v54 toPosition:v53];

      uint64_t v18 = [(WTWritingToolsController *)self sourceTextInput];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        id v20 = [(WTWritingToolsController *)self sourceTextInput];
        id v14 = [v20 attributedTextInRange:v52];

        if (!v14) {
          id v14 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_270DB2A10];
        }
      }
      else
      {
        v33 = [(WTWritingToolsController *)self sourceTextInput];
        v34 = [v33 textInRange:v52];

        v35 = &stru_270DB2A10;
        if (v34) {
          v35 = v34;
        }
        v36 = v35;

        id v14 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v36];
      }
      v37 = [(WTWritingToolsController *)self sourceTextInput];
      v38 = [(WTWritingToolsController *)self sourceTextInput];
      v39 = [v38 selectedTextRange];
      v40 = [v39 start];
      uint64_t v51 = [v37 offsetFromPosition:v54 toPosition:v40];

      v41 = [(WTWritingToolsController *)self sourceTextInput];
      v42 = [(WTWritingToolsController *)self sourceTextInput];
      v43 = [v42 selectedTextRange];
      v44 = [v43 start];
      v45 = [(WTWritingToolsController *)self sourceTextInput];
      v46 = [v45 selectedTextRange];
      v47 = [v46 end];
      uint64_t v50 = [v41 offsetFromPosition:v44 toPosition:v47];

      v48 = objc_msgSend(objc_alloc(MEMORY[0x263F880A0]), "initWithAttributedText:range:", v14, v51, v50);
      v61 = v48;
      v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
      ((void (**)(void, void *))v55)[2](v55, v49);

      id v32 = (void *)v53;
    }
    else
    {
      id v21 = [(WTWritingToolsController *)self sourceTextInput];
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        v23 = [(WTWritingToolsController *)self sourceTextInput];
        id v24 = [(WTWritingToolsController *)self sourceTextInput];
        uint64_t v25 = [v24 selectedTextRange];
        id v14 = [v23 attributedTextInRange:v25];

        if (!v14) {
          id v14 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_270DB2A10];
        }
      }
      else
      {
        v26 = [(WTWritingToolsController *)self sourceTextInput];
        v27 = [(WTWritingToolsController *)self sourceTextInput];
        v28 = [v27 selectedTextRange];
        v29 = [v26 textInRange:v28];

        v30 = &stru_270DB2A10;
        if (v29) {
          v30 = v29;
        }
        v31 = v30;

        id v14 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v31];
      }
      v54 = objc_msgSend(objc_alloc(MEMORY[0x263F880A0]), "initWithAttributedText:range:", v14, 0, objc_msgSend(v14, "length"));
      v60 = v54;
      id v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
      ((void (**)(void, void *))v55)[2](v55, v32);
    }
  }
  objc_destroyWeak(&v59);
  objc_destroyWeak((id *)buf);
}

void __73__WTWritingToolsController_willBeginWritingToolsSession_requestContexts___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73__WTWritingToolsController_willBeginWritingToolsSession_requestContexts___block_invoke_2;
  v5[3] = &unk_26558E618;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v8 = a1[5];
  id v7 = a1[4];
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v9);
}

void __73__WTWritingToolsController_willBeginWritingToolsSession_requestContexts___block_invoke_2(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  int v2 = [[WTUIAttributedStringController alloc] initWithContexts:*(void *)(a1 + 32)];
  id v3 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setAttributedStringController:v2];

  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = objc_loadWeakRetained((id *)(a1 + 56));
  [v6 setUuidContextMapping:v5];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v26 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v12 = _WTVCLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [v11 uuid];
          id v14 = [v11 attributedText];
          uint64_t v15 = [v14 length];
          v40.id location = [v11 range];
          uint64_t v16 = NSStringFromRange(v40);
          *(_DWORD *)buf = 138412802;
          v33 = v13;
          __int16 v34 = 2048;
          uint64_t v35 = v15;
          __int16 v36 = 2112;
          v37 = v16;
          _os_log_impl(&dword_261BE2000, v12, OS_LOG_TYPE_DEFAULT, "context: %@, length = %lu, range = %@", buf, 0x20u);
        }
        uint64_t v17 = (void *)[v11 copy];
        id v18 = objc_loadWeakRetained(v3);
        char v19 = [v18 uuidContextMapping];
        id v20 = [v11 uuid];
        [v19 setObject:v17 forKeyedSubscript:v20];

        id v21 = objc_loadWeakRetained(v3);
        char v22 = [v21 attributedStringController];
        v23 = [v22 digestedAttributedStringForContext:v11];
        [v11 setAttributedText:v23];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(v26 + 48) + 16))();
  uint64_t v24 = *(void *)(v26 + 40);
  id v25 = objc_loadWeakRetained(v3);
  [v25 setSession:v24];
}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _WTVCLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(WTWritingToolsController *)self session];
    uint64_t v8 = [v7 uuid];
    *(_DWORD *)buf = 138412290;
    v44 = v8;
    _os_log_impl(&dword_261BE2000, v6, OS_LOG_TYPE_DEFAULT, "didBeginWritingToolsSession: %@", buf, 0xCu);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v40;
    *(void *)&long long v10 = 138412802;
    long long v37 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v39 + 1) + 8 * v13);
        uint64_t v15 = [(WTWritingToolsController *)self uuidContextMapping];
        uint64_t v16 = [v14 uuid];
        uint64_t v17 = [v15 objectForKeyedSubscript:v16];
        id v18 = [v17 attributedText];
        [v14 setAttributedText:v18];

        uint64_t v19 = [v14 range];
        uint64_t v21 = v20;
        char v22 = [(WTWritingToolsController *)self uuidContextMapping];
        v23 = [v14 uuid];
        uint64_t v24 = [v22 objectForKeyedSubscript:v23];
        objc_msgSend(v24, "setRange:", v19, v21);

        id v25 = _WTVCLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = [v14 uuid];
          v27 = [v14 attributedText];
          uint64_t v28 = [v27 length];
          v51.id location = [v14 range];
          long long v29 = NSStringFromRange(v51);
          *(_DWORD *)buf = v37;
          v44 = v26;
          __int16 v45 = 2048;
          uint64_t v46 = v28;
          __int16 v47 = 2112;
          v48 = v29;
          _os_log_impl(&dword_261BE2000, v25, OS_LOG_TYPE_DEFAULT, "didBegin, context: %@, length = %lu, range = %@", buf, 0x20u);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v11);
  }

  if ([(WTWritingToolsController *)self _proofreadingSessionActive])
  {
    long long v30 = [MEMORY[0x263EFF980] array];
    [(WTWritingToolsController *)self setProofreadingSuggestions:v30];

    long long v31 = [MEMORY[0x263EFF9A0] dictionary];
    [(WTWritingToolsController *)self setUuidSuggestionMapping:v31];

    id v32 = [MEMORY[0x263EFF9A0] dictionary];
    [(WTWritingToolsController *)self setContextForSuggestions:v32];
  }
  v33 = [(WTWritingToolsController *)self analyticsDelegate];
  __int16 v34 = [(WTWritingToolsController *)self session];
  [v33 didBeginWritingToolsSession:v34 contexts:obj];

  uint64_t v35 = [(WTWritingToolsController *)self writingToolsDelegate];
  __int16 v36 = [(WTWritingToolsController *)self session];
  [v35 didBeginWritingToolsSession:v36 contexts:obj];
}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = _WTVCLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(WTWritingToolsController *)self session];
    uint64_t v8 = [v7 uuid];
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2048;
    int64_t v16 = a4;
    _os_log_impl(&dword_261BE2000, v6, OS_LOG_TYPE_DEFAULT, "writingToolsSession:didReceiveAction: %@ [action = %ld]", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v9 = [(WTWritingToolsController *)self analyticsDelegate];
  long long v10 = [(WTWritingToolsController *)self session];
  [v9 writingToolsSession:v10 didReceiveAction:a4];

  uint64_t v11 = [(WTWritingToolsController *)self writingToolsDelegate];
  uint64_t v12 = [(WTWritingToolsController *)self session];
  [v11 writingToolsSession:v12 didReceiveAction:a4];
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = _WTVCLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(WTWritingToolsController *)self session];
    uint64_t v8 = [v7 uuid];
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_261BE2000, v6, OS_LOG_TYPE_DEFAULT, "didEndWritingToolsSession: %@", (uint8_t *)&v13, 0xCu);
  }
  [(WTWritingToolsController *)self _dismissSuggestionViewController];
  [(WTWritingToolsController *)self _dismissPromptEntryViewController];
  uint64_t v9 = [(WTWritingToolsController *)self analyticsDelegate];
  long long v10 = [(WTWritingToolsController *)self session];
  [v9 didEndWritingToolsSession:v10 accepted:v4];

  uint64_t v11 = [(WTWritingToolsController *)self writingToolsDelegate];
  uint64_t v12 = [(WTWritingToolsController *)self session];
  [v11 didEndWritingToolsSession:v12 accepted:v4];

  [(WTWritingToolsController *)self setEndingUCBWritingToolsSession:1];
  [(WTWritingToolsController *)self setProofreadingSuggestions:0];
  [(WTWritingToolsController *)self setUuidSuggestionMapping:0];
  [(WTWritingToolsController *)self setContextForSuggestions:0];
  [(WTWritingToolsController *)self setSession:0];
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v37 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = _WTVCLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [(WTWritingToolsController *)self session];
    id v14 = [v13 uuid];
    *(_DWORD *)buf = 138412290;
    v44 = v14;
    _os_log_impl(&dword_261BE2000, v12, OS_LOG_TYPE_DEFAULT, "proofreadingSession:didReceiveSuggestions: %@", buf, 0xCu);
  }
  uint64_t v15 = [(WTWritingToolsController *)self uuidContextMapping];
  int64_t v16 = [v11 uuid];

  uint64_t v17 = [v15 objectForKeyedSubscript:v16];

  id v18 = [(WTWritingToolsController *)self proofreadingSuggestions];
  [v18 addObjectsFromArray:v10];

  uint64_t v19 = [(WTWritingToolsController *)self proofreadCandidateBarView];
  uint64_t v20 = [(WTWritingToolsController *)self proofreadingSuggestions];
  objc_msgSend(v19, "setSuggestionCount:", objc_msgSend(v20, "count"));

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v21 = v10;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v39;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v38 + 1) + 8 * v25);
        v27 = [(WTWritingToolsController *)self uuidSuggestionMapping];
        uint64_t v28 = [v26 uuid];
        [v27 setObject:v26 forKeyedSubscript:v28];

        long long v29 = [v17 uuid];
        long long v30 = [(WTWritingToolsController *)self contextForSuggestions];
        long long v31 = [v26 uuid];
        [v30 setObject:v29 forKeyedSubscript:v31];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v23);
  }

  id v32 = [(WTWritingToolsController *)self analyticsDelegate];
  v33 = [(WTWritingToolsController *)self session];
  objc_msgSend(v32, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v33, v21, location, length, v17, v37);

  __int16 v34 = [(WTWritingToolsController *)self writingToolsDelegate];
  uint64_t v35 = [(WTWritingToolsController *)self session];
  objc_msgSend(v34, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v35, v21, location, length, v17, v37);
}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  id v11 = _WTVCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(WTWritingToolsController *)self session];
    int v13 = [v12 uuid];
    int v25 = 138412290;
    uint64_t v26 = v13;
    _os_log_impl(&dword_261BE2000, v11, OS_LOG_TYPE_DEFAULT, "proofreadingSession:didUpdateState: %@", (uint8_t *)&v25, 0xCu);
  }
  id v14 = [(WTWritingToolsController *)self uuidContextMapping];
  uint64_t v15 = [v10 uuid];

  int64_t v16 = [v14 objectForKeyedSubscript:v15];

  uint64_t v17 = [(WTWritingToolsController *)self uuidSuggestionMapping];
  id v18 = [v17 objectForKeyedSubscript:v9];
  [v18 setState:a4];

  uint64_t v19 = [(WTWritingToolsController *)self popoverSuggestionUUID];
  int v20 = [v9 isEqual:v19];

  if (a4 != 1 && v20)
  {
    [(WTWritingToolsController *)self setPopoverSuggestionUUID:0];
    [(WTWritingToolsController *)self _updateSuggestionPopover];
  }
  id v21 = [(WTWritingToolsController *)self analyticsDelegate];
  uint64_t v22 = [(WTWritingToolsController *)self session];
  [v21 proofreadingSession:v22 didUpdateState:a4 forSuggestionWithUUID:v9 inContext:v16];

  uint64_t v23 = [(WTWritingToolsController *)self writingToolsDelegate];
  uint64_t v24 = [(WTWritingToolsController *)self session];
  [v23 proofreadingSession:v24 didUpdateState:a4 forSuggestionWithUUID:v9 inContext:v16];
}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  uint64_t v7 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a6;
  id v14 = _WTVCLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    [(WTWritingToolsController *)self session];
    uint64_t v15 = v28 = v7;
    int64_t v16 = [v15 uuid];
    uint64_t v17 = [v12 length];
    v36.NSUInteger location = location;
    v36.NSUInteger length = length;
    id v18 = NSStringFromRange(v36);
    *(_DWORD *)buf = 138412802;
    long long v30 = v16;
    __int16 v31 = 2048;
    uint64_t v32 = v17;
    __int16 v33 = 2112;
    __int16 v34 = v18;
    _os_log_impl(&dword_261BE2000, v14, OS_LOG_TYPE_DEFAULT, "compositionSession: [%@], didReceiveText: [NSUInteger length = %lu], range: %@", buf, 0x20u);

    uint64_t v7 = v28;
  }

  uint64_t v19 = [(WTWritingToolsController *)self uuidContextMapping];
  int v20 = [v13 uuid];

  id v21 = [v19 objectForKeyedSubscript:v20];

  uint64_t v22 = [(WTWritingToolsController *)self attributedStringController];
  uint64_t v23 = [v22 reconstitutedAttributedStringForContext:v21 digestedAttributedString:v12];

  uint64_t v24 = [(WTWritingToolsController *)self analyticsDelegate];
  int v25 = [(WTWritingToolsController *)self session];
  objc_msgSend(v24, "compositionSession:didReceiveText:replacementRange:inContext:finished:", v25, v23, location, length, v21, v7);

  uint64_t v26 = [(WTWritingToolsController *)self writingToolsDelegate];
  uint64_t v27 = [(WTWritingToolsController *)self session];
  objc_msgSend(v26, "compositionSession:didReceiveText:replacementRange:inContext:finished:", v27, v23, location, length, v21, v7);
}

- (void)showSmartReplyQuestionnaireWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v8 = [(WTWritingToolsController *)self _inputDashboardViewController];
  id v9 = _WTVCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(WTWritingToolsController *)self session];
    id v11 = [v10 uuid];
    id v12 = NSNumber;
    id v13 = [(WTWritingToolsController *)self session];
    id v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "type"));
    v25.origin.double x = x;
    v25.origin.double y = y;
    v25.size.double width = width;
    v25.size.double height = height;
    uint64_t v15 = NSStringFromCGRect(v25);
    int v16 = 138413058;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    id v21 = v15;
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    _os_log_impl(&dword_261BE2000, v9, OS_LOG_TYPE_DEFAULT, "try -showSmartReplyQuestionnaire (sessionUUID: %@, sessionType: %@, rect: %@, inputDashboardVC: %@", (uint8_t *)&v16, 0x2Au);
  }
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v8, "showSmartReplyQuestionnaireWithRect:", x, y, width, height);
  }
}

- (void)undo
{
  id v3 = [(WTWritingToolsController *)self sourceResponder];
  BOOL v4 = [v3 undoManager];
  [v4 undo];

  id v5 = [(WTWritingToolsController *)self analyticsDelegate];
  [v5 undo];
}

- (void)redo
{
  id v3 = [(WTWritingToolsController *)self sourceResponder];
  BOOL v4 = [v3 undoManager];
  [v4 redo];

  id v5 = [(WTWritingToolsController *)self analyticsDelegate];
  [v5 redo];
}

- (void)setSession:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _WTVCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uuid];
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "type"));
    uint64_t v8 = [(WTSession *)self->_session uuid];
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_261BE2000, v5, OS_LOG_TYPE_DEFAULT, "setSession: %@, type: %@, oldSession: %@", (uint8_t *)&v10, 0x20u);
  }
  session = self->_session;
  self->_session = (WTSession *)v4;

  [(WTWritingToolsController *)self updateKBSuppression];
  [(WTWritingToolsController *)self updateSourceView];
}

- (id)itemProviderForAttributedText:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F088E0]);
  uint64_t v5 = [v3 length];
  uint64_t v6 = *MEMORY[0x263F814D0];
  uint64_t v23 = *MEMORY[0x263F814D0];
  v24[0] = *MEMORY[0x263F81550];
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  uint64_t v8 = objc_msgSend(v3, "dataFromRange:documentAttributes:error:", 0, v5, v7, 0);

  if (v8)
  {
    id v9 = [(id)*MEMORY[0x263F1DAA8] identifier];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __58__WTWritingToolsController_itemProviderForAttributedText___block_invoke;
    v19[3] = &unk_26558E668;
    id v20 = v8;
    [v4 registerDataRepresentationForTypeIdentifier:v9 visibility:0 loadHandler:v19];
  }
  uint64_t v10 = [v3 length];
  uint64_t v11 = *MEMORY[0x263F81548];
  uint64_t v12 = *MEMORY[0x263F814C0];
  v21[0] = v6;
  v21[1] = v12;
  v22[0] = v11;
  v22[1] = &unk_270DB9EE8;
  id v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  __int16 v14 = objc_msgSend(v3, "dataFromRange:documentAttributes:error:", 0, v10, v13, 0);

  if (v14)
  {
    uint64_t v15 = [(id)*MEMORY[0x263F1DD38] identifier];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __58__WTWritingToolsController_itemProviderForAttributedText___block_invoke_518;
    v17[3] = &unk_26558E668;
    id v18 = v14;
    [v4 registerDataRepresentationForTypeIdentifier:v15 visibility:0 loadHandler:v17];
  }

  return v4;
}

uint64_t __58__WTWritingToolsController_itemProviderForAttributedText___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t __58__WTWritingToolsController_itemProviderForAttributedText___block_invoke_518(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (id)itemProviderForPlainText:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F088E0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 dataUsingEncoding:4];

  if (v6)
  {
    uint64_t v7 = [(id)*MEMORY[0x263F1DD38] identifier];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__WTWritingToolsController_itemProviderForPlainText___block_invoke;
    v9[3] = &unk_26558E668;
    id v10 = v6;
    [v5 registerDataRepresentationForTypeIdentifier:v7 visibility:0 loadHandler:v9];
  }

  return v5;
}

uint64_t __53__WTWritingToolsController_itemProviderForPlainText___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (void)replaceSelectionWithText:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WTWritingToolsController *)self attributedStringController];
  uint64_t v6 = [(id)v5 reconstitutedAttributedStringForStitchedContext:v4];

  uint64_t v7 = [(WTWritingToolsController *)self sourceTextInput];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v8 = [(WTWritingToolsController *)self sourceTextInput];
    char v9 = [v8 allowedWritingToolsResultOptions];

    BOOL v10 = (v9 & 0xF) == 1;
  }
  else
  {
    BOOL v10 = 0;
  }
  uint64_t v11 = [(WTWritingToolsController *)self beTextInput];
  if (v11)
  {
    char v12 = 1;
  }
  else
  {
    id v13 = [(WTWritingToolsController *)self sourceTextInput];
    char v12 = [v13 conformsToProtocol:&unk_270DDC0A8];
  }
  if (v10)
  {
    __int16 v14 = [v6 string];
    uint64_t v15 = [(WTWritingToolsController *)self itemProviderForPlainText:v14];

    if (v12) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v15 = [(WTWritingToolsController *)self itemProviderForAttributedText:v6];
    if (v12) {
      goto LABEL_13;
    }
  }
  uint64_t v16 = [(WTWritingToolsController *)self sourceResponder];
  v26[0] = v15;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  int v18 = [v16 canPasteItemProviders:v17];

  if (v18)
  {
    uint64_t v19 = [(WTWritingToolsController *)self sourceResponder];
    CGRect v25 = v15;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    [v19 pasteItemProviders:v20];
    goto LABEL_20;
  }
LABEL_13:
  id v21 = [(WTWritingToolsController *)self sourceTextInput];
  uint64_t v19 = [v21 selectedTextRange];

  id v20 = [(WTWritingToolsController *)self sourceTextInput];
  __int16 v22 = [(WTWritingToolsController *)self beTextInput];

  if (v22)
  {
    uint64_t v23 = [(WTWritingToolsController *)self beTextInput];
    uint64_t v24 = [v6 string];
    [v23 insertText:v24];
  }
  else if ([v20 conformsToProtocol:&unk_270DDC0A8])
  {
    uint64_t v23 = [v6 string];
    [v20 insertText:v23];
  }
  else
  {
    if (!(v10 | ((objc_opt_respondsToSelector() & 1) == 0)))
    {
      [v20 replaceRange:v19 withAttributedText:v6];
      goto LABEL_20;
    }
    uint64_t v23 = [v6 string];
    [v20 replaceRange:v19 withText:v23];
  }

LABEL_20:
}

- (void)copyText:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WTWritingToolsController *)self attributedStringController];
  uint64_t v6 = [v5 reconstitutedAttributedStringForStitchedContext:v4];

  uint64_t v7 = [MEMORY[0x263F82A18] generalPasteboard];
  uint64_t v8 = [(WTWritingToolsController *)self itemProviderForAttributedText:v6];
  v10[0] = v8;
  char v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v7 setItemProviders:v9];
}

- (void)beginTextPlaceholder
{
  id v3 = [(WTWritingToolsController *)self sourceTextInput];
  int v2 = +[_WTTextPlaceholderController placeholderControllerForDelegate:v3];
  [v2 setPattern:0];
  [v2 beginPlaceholder];
}

- (void)endTextPlaceholderAndWillInsertText:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  uint64_t v7 = [(WTWritingToolsController *)self sourceTextInput];
  uint64_t v8 = +[_WTTextPlaceholderController placeholderControllerForDelegate:v7];
  if (v8)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75__WTWritingToolsController_endTextPlaceholderAndWillInsertText_completion___block_invoke;
    v9[3] = &unk_26558E690;
    id v10 = v7;
    uint64_t v11 = v6;
    [v8 endPlaceholderAndWillInsertText:v4 completion:v9];
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

uint64_t __75__WTWritingToolsController_endTextPlaceholderAndWillInsertText_completion___block_invoke(uint64_t a1)
{
  +[_WTTextPlaceholderController removePlaceholderControllerForDelegate:*(void *)(a1 + 32)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)proofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = _WTVCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [NSNumber numberWithInteger:a4];
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_261BE2000, v10, OS_LOG_TYPE_DEFAULT, "proofreadingSessionWithUUID: %@, updateState: %@, forSuggestionWithUUID: %@", (uint8_t *)&v13, 0x20u);
  }
  char v12 = [(WTWritingToolsController *)self _textViewDelegate];
  [v12 proofreadingSessionWithUUID:v8 updateState:a4 forSuggestionWithUUID:v9];
}

- (void)proofreadingSessionWithUUID:(id)a3 showDetailsForSuggestionWithUUID:(id)a4 relativeToRect:(CGRect)a5 inView:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a6;
  id v14 = _WTVCLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [(WTWritingToolsController *)self session];
    uint64_t v16 = [v15 uuid];
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    __int16 v17 = NSStringFromCGRect(v27);
    int v18 = 138413058;
    uint64_t v19 = v16;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl(&dword_261BE2000, v14, OS_LOG_TYPE_DEFAULT, "session: %@, showDetailsForSuggestion: %@, relativeToRect: %@, inView: %@", (uint8_t *)&v18, 0x2Au);
  }
  if ([(WTWritingToolsController *)self _wantsUCBUI]
    || [(WTWritingToolsController *)self suppressSheetForKeyboardEditing])
  {
    [(WTWritingToolsController *)self setPopoverSuggestionUUID:v12];
    -[WTWritingToolsController setSuggestionPopoverSourceRect:](self, "setSuggestionPopoverSourceRect:", x, y, width, height);
    [(WTWritingToolsController *)self setSuggestionPopoverSourceView:v13];
    [(WTWritingToolsController *)self _updateSuggestionPopover];
  }
}

- (void)textSystemWillBeginEditingDuringSessionWithUUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _WTVCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_261BE2000, v5, OS_LOG_TYPE_DEFAULT, "textSystemWillBeginEditingDuringSessionWithUUID: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 != 1 || ([MEMORY[0x263F828A0] isInHardwareKeyboardMode] & 1) == 0)
  {
    [(WTWritingToolsController *)self setSuppressSheetForKeyboardEditing:1];
    [(WTWritingToolsController *)self setMinimizedIntoAssistant:0];
  }
}

- (void)remoteKeyboardChanged:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v6 = [v5 bundleIdentifier];
  v15[0] = v6;
  v15[1] = @"com.apple.Feedback.DraftingExtension";
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  int v8 = [v4 sourceBundleIdentifier];
  char v9 = [v7 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [v4 sourceBundleIdentifier];
    int v11 = [v10 isEqualToString:@"com.apple.WritingToolsUIService"];

    if (v11
      || ([v4 hostBundleIdentifier],
          id v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 isEqualToString:@"com.apple.WritingToolsUIService"],
          v12,
          v13))
    {
      id v14 = [(WTWritingToolsController *)self mainPopoverViewController];
      [v14 repositionWithKeyboardChangedInformation:v4];
    }
    else
    {
      -[WTWritingToolsController setSuppressWritingToolsForRemoteKeyboard:](self, "setSuppressWritingToolsForRemoteKeyboard:", [v4 keyboardOnScreen]);
    }
  }
}

- (void)updateKBSuppression
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WTWritingToolsController *)self _wantsUCBUI];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(WTWritingToolsController *)self mainPopoverViewController];
    BOOL v4 = v5 != 0;
  }
  uint64_t v6 = _WTVCLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [NSNumber numberWithBool:v4];
    int v8 = [NSNumber numberWithBool:v3];
    char v9 = [(WTWritingToolsController *)self mainPopoverViewController];
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl(&dword_261BE2000, v6, OS_LOG_TYPE_DEFAULT, "updateKBSuppression shouldSuppress: %@, shouldSuppressForUCBUI: %@, sheet/popover: %@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v10 = [(WTWritingToolsController *)self sourceResponder];
  objc_msgSend(v10, "_setWritingToolsWantsKeyboardSuppression:suppressAssistant:", v4, -[WTWritingToolsController _wantsUCBUI](self, "_wantsUCBUI") ^ 1);
}

- (void)updateSourceView
{
  if ([(WTWritingToolsController *)self isWritingToolsActive])
  {
    [(WTWritingToolsController *)self _refreshWindowingModeEnabled];
    [(WTWritingToolsController *)self setMinimizedIntoUCB:[(WTWritingToolsController *)self _wantsUCBUI]];
    if ([(WTWritingToolsController *)self minimizedIntoUCB])
    {
      [(WTWritingToolsController *)self updateWritingToolsPopoverSuppression];
      BOOL v3 = [(WTWritingToolsController *)self mainPopoverViewController];

      if (!v3)
      {
        [(WTWritingToolsController *)self updateKBSuppression];
        [(WTWritingToolsController *)self updateInputDashboardViewController];
      }
    }
    else
    {
      [(WTWritingToolsController *)self _dismissSuggestionViewController];
      [(WTWritingToolsController *)self _dismissPromptEntryViewController];
      [(WTWritingToolsController *)self _updatePopoverAnchoring];
      [(WTWritingToolsController *)self updateWritingToolsPopoverSuppression];
    }
  }
}

- (void)updateInputDashboardViewController
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WTWritingToolsController *)self sourceResponder];
  BOOL v4 = [(WTWritingToolsController *)self _wantsUCBUI];
  BOOL v5 = [(WTWritingToolsController *)self minimizedIntoAssistant];
  uint64_t v6 = _WTVCLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [NSNumber numberWithBool:v4];
    uint64_t v7 = v20 = v3;
    int v8 = [NSNumber numberWithBool:v5];
    int64_t v9 = [(WTWritingToolsController *)self requestedTool];
    uint64_t v10 = NSNumber;
    int v11 = [(WTWritingToolsController *)self session];
    id v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "compositionSessionType"));
    __int16 v13 = [v20 _writingToolsInputDashboardViewController];
    *(_DWORD *)buf = 138413314;
    id v14 = @"NO";
    __int16 v22 = v7;
    __int16 v23 = 2112;
    if (!v13) {
      id v14 = @"YES";
    }
    __int16 v24 = v8;
    __int16 v25 = 2048;
    int64_t v26 = v9;
    __int16 v27 = 2112;
    unsigned int v28 = v12;
    __int16 v29 = 2112;
    long long v30 = v14;
    _os_log_impl(&dword_261BE2000, v6, OS_LOG_TYPE_DEFAULT, "updateInputDashboardViewController. wantsUCB %@, wantsAssistant %@, requestedTool: %ld, rewriteType: %@, WTIDVC is nil: %@", buf, 0x34u);

    BOOL v3 = v20;
  }

  if (!v4)
  {
    if (!v5)
    {
      [v3 _setWritingToolsInputDashboardViewController:0];
      goto LABEL_21;
    }
    goto LABEL_10;
  }
  __int16 v15 = [v3 _writingToolsInputDashboardViewController];

  if (v15)
  {
    if (!v5) {
      goto LABEL_21;
    }
LABEL_10:
    uint64_t v16 = [v3 _writingToolsInputDashboardViewController];

    if (!v16)
    {
      uint64_t v17 = [(WTWritingToolsController *)self _createProofreadingInputDashboardViewControllerForAssistant:1];
LABEL_20:
      uint64_t v19 = (void *)v17;
      [v3 _setWritingToolsInputDashboardViewController:v17];

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if ([(WTWritingToolsController *)self _proofreadingSessionActiveOrRequested])
  {
    int v18 = [(WTWritingToolsController *)self _createProofreadingInputDashboardViewControllerForAssistant:0];
    [v3 _setWritingToolsInputDashboardViewController:v18];

    [(WTWritingToolsController *)self _updateSuggestionPopover];
  }
  else
  {
    if ([(WTWritingToolsController *)self _rewritingSessionActiveOrRequested])
    {
      uint64_t v17 = [(WTWritingToolsController *)self _createCompositionInputDashboardViewController];
      goto LABEL_20;
    }
    if ([(id)objc_opt_class() iPadOSAlternateQuestionnaireEnabled]
      && [(WTWritingToolsController *)self _smartReplySessionActiveOrRequested])
    {
      uint64_t v17 = [(WTWritingToolsController *)self _createSmartReplyInputDashboardViewController];
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (void)updateWritingToolsPopoverSuppressionWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(WTWritingToolsController *)self isPopoverTemporarilyDismissed]
    && ([(WTWritingToolsController *)self mainPopoverViewController],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = _WTVCLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_261BE2000, v6, OS_LOG_TYPE_DEFAULT, "dismissViewControllerAnimated for _updateWritingToolsSheetSuppression", buf, 2u);
    }

    uint64_t v7 = [(WTWritingToolsController *)self mainPopoverViewController];
    int v8 = [v7 presentingViewController];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __79__WTWritingToolsController_updateWritingToolsPopoverSuppressionWithCompletion___block_invoke;
    __int16 v13 = &unk_26558E690;
    id v14 = self;
    id v15 = v4;
    [v8 dismissViewControllerAnimated:1 completion:&v10];

    -[WTWritingToolsController setMainPopoverViewController:](self, "setMainPopoverViewController:", 0, v10, v11, v12, v13, v14);
  }
  else if (![(WTWritingToolsController *)self isPopoverTemporarilyDismissed])
  {
    int64_t v9 = [(WTWritingToolsController *)self mainPopoverViewController];
    if (v9)
    {
    }
    else if (![(WTWritingToolsController *)self endingUCBWritingToolsSession])
    {
      [(WTWritingToolsController *)self _presentMainPopoverViewController];
    }
  }
}

uint64_t __79__WTWritingToolsController_updateWritingToolsPopoverSuppressionWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateKBSuppression];
  [*(id *)(a1 + 32) updateInputDashboardViewController];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)updateWritingToolsPopoverSuppression
{
}

- (id)sourceResponderViewController
{
  int v2 = [(WTWritingToolsController *)self sourceResponder];
  BOOL v3 = [v2 _viewControllerForWritingToolsSource];

  return v3;
}

- (BOOL)isPopoverTemporarilyDismissed
{
  if ([(WTWritingToolsController *)self suppressingSheetForRemoteKeyboardOnScreen]|| [(WTWritingToolsController *)self minimizedIntoUCB]|| [(WTWritingToolsController *)self suppressSheetForKeyboardEditing]|| [(WTWritingToolsController *)self presentingFormSheet]|| [(WTWritingToolsController *)self presentingPromptEntry])
  {
    return 1;
  }

  return [(WTWritingToolsController *)self temporarilySuppressPopoverForAdjustment];
}

- (void)selectionDidUpdate
{
  BOOL v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_DEFAULT, "Handling selection update", buf, 2u);
  }

  id v4 = [MEMORY[0x263F82670] currentDevice];
  if ([v4 userInterfaceIdiom] == 1
    && [(WTWritingToolsController *)self _compositionSessionActive])
  {
    int v5 = _os_feature_enabled_impl();
  }
  else
  {
    int v5 = 0;
  }

  if ([(WTWritingToolsController *)self _smartReplySessionActive] || v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__WTWritingToolsController_selectionDidUpdate__block_invoke;
    block[3] = &unk_26558E530;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __46__WTWritingToolsController_selectionDidUpdate__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _visibleApproximationOfTextSelectionRect];
  if (v3 != 0.0)
  {
    uint64_t result = [*(id *)(a1 + 32) popoverWillAdjust];
    if (result)
    {
      [*(id *)(a1 + 32) setTemporarilySuppressPopoverForAdjustment:1];
      id v4 = *(void **)(a1 + 32);
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __46__WTWritingToolsController_selectionDidUpdate__block_invoke_2;
      v5[3] = &unk_26558E530;
      void v5[4] = v4;
      return [v4 updateWritingToolsPopoverSuppressionWithCompletion:v5];
    }
  }
  return result;
}

uint64_t __46__WTWritingToolsController_selectionDidUpdate__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTemporarilySuppressPopoverForAdjustment:0];
  int v2 = *(void **)(a1 + 32);

  return [v2 updateWritingToolsPopoverSuppression];
}

- (id)_inputDashboardViewController
{
  int v2 = [(WTWritingToolsController *)self sourceResponder];
  double v3 = [v2 _writingToolsInputDashboardViewController];

  return v3;
}

- (id)_createProofreadingInputDashboardViewControllerForAssistant:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = objc_alloc_init(_TtC14WritingToolsUI16WTStartupOptions);
  [(WTStartupOptions *)v5 setRequestedTool:1];
  [(WTStartupOptions *)v5 setEditable:1];
  [(WTStartupOptions *)v5 setIsForInputDashboard:1];
  uint64_t v6 = [(WTWritingToolsController *)self session];
  uint64_t v7 = [v6 uuid];
  [(WTStartupOptions *)v5 setSessionUUID:v7];

  [(WTStartupOptions *)v5 setIsForAssistant:v3];
  [(WTStartupOptions *)v5 setWantsInlineEditing:1];
  int v8 = [(WTWritingToolsController *)self analyticsUUID];
  [(WTStartupOptions *)v5 setAnalyticsUUID:v8];

  int64_t v9 = [MEMORY[0x263F82670] currentDevice];
  -[WTStartupOptions setSourceUserInterfaceIdiom:](v5, "setSourceUserInterfaceIdiom:", [v9 userInterfaceIdiom]);

  uint64_t v10 = [[WTSceneHostedInputDashboardViewController alloc] initWithWritingToolsDelegate:self startupOptions:v5];

  return v10;
}

- (id)_createCompositionInputDashboardViewController
{
  BOOL v3 = objc_alloc_init(_TtC14WritingToolsUI16WTStartupOptions);
  [(WTStartupOptions *)v3 setRequestedTool:2];
  [(WTStartupOptions *)v3 setEditable:1];
  [(WTStartupOptions *)v3 setIsForInputDashboard:1];
  id v4 = [(WTWritingToolsController *)self session];
  int v5 = [v4 uuid];
  [(WTStartupOptions *)v3 setSessionUUID:v5];

  [(WTStartupOptions *)v3 setWantsInlineEditing:1];
  uint64_t v6 = [(WTWritingToolsController *)self analyticsUUID];
  [(WTStartupOptions *)v3 setAnalyticsUUID:v6];

  uint64_t v7 = [MEMORY[0x263F82670] currentDevice];
  -[WTStartupOptions setSourceUserInterfaceIdiom:](v3, "setSourceUserInterfaceIdiom:", [v7 userInterfaceIdiom]);

  int v8 = [[WTSceneHostedInputDashboardViewController alloc] initWithWritingToolsDelegate:self startupOptions:v3];

  return v8;
}

- (id)_createSmartReplyInputDashboardViewController
{
  if ([(id)objc_opt_class() iPadOSAlternateQuestionnaireEnabled])
  {
    BOOL v3 = objc_alloc_init(_TtC14WritingToolsUI16WTStartupOptions);
    [(WTStartupOptions *)v3 setRequestedTool:101];
    [(WTStartupOptions *)v3 setEditable:1];
    [(WTStartupOptions *)v3 setIsForInputDashboard:1];
    id v4 = [(WTWritingToolsController *)self session];
    int v5 = [v4 uuid];
    [(WTStartupOptions *)v3 setSessionUUID:v5];

    [(WTStartupOptions *)v3 setWantsInlineEditing:1];
    uint64_t v6 = [(WTWritingToolsController *)self smartReplyConfig];
    [(WTStartupOptions *)v3 setSmartReplyConfiguration:v6];

    uint64_t v7 = [(WTWritingToolsController *)self analyticsUUID];
    [(WTStartupOptions *)v3 setAnalyticsUUID:v7];

    int v8 = [MEMORY[0x263F82670] currentDevice];
    -[WTStartupOptions setSourceUserInterfaceIdiom:](v3, "setSourceUserInterfaceIdiom:", [v8 userInterfaceIdiom]);

    int64_t v9 = [[WTSceneHostedInputDashboardViewController alloc] initWithWritingToolsDelegate:self startupOptions:v3];
  }
  else
  {
    uint64_t v10 = _WTVCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WTWritingToolsController _createSmartReplyInputDashboardViewController](v10);
    }

    int64_t v9 = 0;
  }

  return v9;
}

- (void)_revertAllSuggestions
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = [(WTWritingToolsController *)self proofreadingSuggestions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        int64_t v9 = [(WTWritingToolsController *)self session];
        uint64_t v10 = [v9 uuid];
        uint64_t v11 = [v8 uuid];
        [(WTWritingToolsController *)self proofreadingSessionWithUUID:v10 updateState:3 forSuggestionWithUUID:v11];

        id v12 = [(WTWritingToolsController *)self contextForSuggestions];
        __int16 v13 = [v8 uuid];
        id v14 = [v12 objectForKeyedSubscript:v13];

        id v15 = [(WTWritingToolsController *)self session];
        uint64_t v16 = [v8 uuid];
        uint64_t v17 = [(WTWritingToolsController *)self uuidContextMapping];
        int v18 = [v17 objectForKeyedSubscript:v14];
        [(WTWritingToolsController *)self proofreadingSession:v15 didUpdateState:3 forSuggestionWithUUID:v16 inContext:v18];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
}

- (BOOL)_proofreadingSessionActive
{
  BOOL v3 = [(WTWritingToolsController *)self session];
  if (v3)
  {
    uint64_t v4 = [(WTWritingToolsController *)self session];
    BOOL v5 = [v4 type] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_proofreadingSessionActiveOrRequested
{
  int64_t v3 = [(WTWritingToolsController *)self requestedTool];
  if (v3 != 1)
  {
    LOBYTE(v3) = [(WTWritingToolsController *)self _proofreadingSessionActive];
  }
  return v3;
}

- (BOOL)_rewritingSessionActive
{
  int64_t v3 = [(WTWritingToolsController *)self session];
  if (v3)
  {
    uint64_t v4 = [(WTWritingToolsController *)self session];
    if ([v4 type] == 2)
    {
      BOOL v5 = [(WTWritingToolsController *)self session];
      if ([v5 compositionSessionType] == 11)
      {
        BOOL v6 = 0;
      }
      else
      {
        uint64_t v7 = [(WTWritingToolsController *)self session];
        BOOL v6 = [v7 compositionSessionType] != 10;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_smartReplySessionActive
{
  int64_t v3 = [(WTWritingToolsController *)self session];
  if (v3)
  {
    uint64_t v4 = [(WTWritingToolsController *)self session];
    if ([v4 type] == 2)
    {
      BOOL v5 = [(WTWritingToolsController *)self session];
      BOOL v6 = [v5 compositionSessionType] == 11;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_rewritingSessionActiveOrRequested
{
  if ([(WTWritingToolsController *)self requestedTool] == 2
    || [(WTWritingToolsController *)self requestedTool] == 3
    || [(WTWritingToolsController *)self requestedTool] == 11
    || [(WTWritingToolsController *)self requestedTool] == 12
    || [(WTWritingToolsController *)self requestedTool] == 13
    || [(WTWritingToolsController *)self requestedTool] == 23
    || [(WTWritingToolsController *)self requestedTool] == 24)
  {
    return 1;
  }

  return [(WTWritingToolsController *)self _rewritingSessionActive];
}

- (BOOL)_smartReplySessionActiveOrRequested
{
  if ([(WTWritingToolsController *)self requestedTool] == 101) {
    return 1;
  }

  return [(WTWritingToolsController *)self _smartReplySessionActive];
}

- (BOOL)_compositionSessionActive
{
  int64_t v3 = [(WTWritingToolsController *)self session];
  if (v3)
  {
    uint64_t v4 = [(WTWritingToolsController *)self session];
    if ([v4 type] == 2)
    {
      BOOL v5 = [(WTWritingToolsController *)self session];
      BOOL v6 = [v5 compositionSessionType] == 10;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_wantsUCBUI
{
  int64_t v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 1 || [(WTWritingToolsController *)self switchedFromUCBToPopover]) {
    return 0;
  }
  if ([(WTWritingToolsController *)self isWindowingModeEnabled])
  {
    return [(WTWritingToolsController *)self _wantsUCBUI_ucbSupportedStageManagerActive];
  }
  else
  {
    return [(WTWritingToolsController *)self _wantsUCBUI_ucbSupported];
  }
}

- (BOOL)_wantsUCBUI_ucbSupported
{
  if ([(WTWritingToolsController *)self suppressSheetForKeyboardEditing])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = [(WTWritingToolsController *)self _wantsInlineEditing];
    if (v3)
    {
      if (-[WTWritingToolsController _proofreadingSessionActiveOrRequested](self, "_proofreadingSessionActiveOrRequested")|| -[WTWritingToolsController _rewritingSessionActiveOrRequested](self, "_rewritingSessionActiveOrRequested")|| [(id)objc_opt_class() iPadOSAlternateQuestionnaireEnabled]&& -[WTWritingToolsController _smartReplySessionActiveOrRequested](self, "_smartReplySessionActiveOrRequested"))
      {
        goto LABEL_10;
      }
      uint64_t v4 = [(WTWritingToolsController *)self session];
      unint64_t v5 = [v4 compositionSessionType];

      LOBYTE(v3) = 0;
      if (v5 > 0xB) {
        return v3;
      }
      if (((1 << v5) & 0x33E) != 0)
      {
LABEL_10:
        LOBYTE(v3) = 1;
        return v3;
      }
      if (v5 == 11)
      {
        BOOL v6 = objc_opt_class();
        LOBYTE(v3) = [v6 iPadOSAlternateQuestionnaireEnabled];
      }
    }
  }
  return v3;
}

- (BOOL)_wantsUCBUI_ucbSupportedStageManagerActive
{
  if ([(WTWritingToolsController *)self sourceResponderHorizontalSizeClass] == 1) {
    return 0;
  }

  return [(WTWritingToolsController *)self _wantsUCBUI_ucbSupported];
}

- (CGRect)_textSelectionRectForTextInput
{
  int v3 = [(WTWritingToolsController *)self sourceTextInput];
  uint64_t v4 = [v3 selectedTextRange];

  unint64_t v5 = [(WTWritingToolsController *)self sourceTextInput];
  BOOL v6 = [v5 selectionRectsForRange:v4];

  if ([(WTWritingToolsController *)self _smartReplySessionActiveOrRequested]) {
    [(WTWritingToolsController *)self _textSelectionRectForSmartReplyPopoverForRange:v4 selectionRects:v6];
  }
  else {
    [(WTWritingToolsController *)self _cgRectForSelectionRects:v6];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)_textSelectionRectForSmartReplyPopoverForRange:(id)a3 selectionRects:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(WTWritingToolsController *)self sourceTextInput];
  double v9 = [v8 textInputView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  [(WTWritingToolsController *)self _cgRectForSelectionRects:v6];
  double v17 = v16;
  double v19 = v18;

  int v20 = [v7 isEmpty];
  if (v20) {
    double v21 = 1.0;
  }
  else {
    double v21 = v19;
  }
  if (v20) {
    double v22 = v13;
  }
  else {
    double v22 = v17;
  }
  double v23 = v11;
  double v24 = v15;
  result.size.double height = v21;
  result.size.double width = v24;
  result.origin.double y = v22;
  result.origin.double x = v23;
  return result;
}

- (CGRect)_cgRectForSelectionRects:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v11) rect];
        v29.origin.CGFloat x = v12;
        v29.origin.CGFloat y = v13;
        v29.size.CGFloat width = v14;
        v29.size.CGFloat height = v15;
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v29);
        CGFloat x = v27.origin.x;
        CGFloat y = v27.origin.y;
        CGFloat width = v27.size.width;
        CGFloat height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)setSuppressSheetForKeyboardEditing:(BOOL)a3
{
  if (self->_suppressSheetForKeyboardEditing != a3)
  {
    self->_suppressSheetForKeyboardEditing = a3;
    [(WTWritingToolsController *)self updateWritingToolsPopoverSuppression];
    [(WTWritingToolsController *)self updateKBSuppression];
    [(WTWritingToolsController *)self updateInputDashboardViewController];
  }
}

- (void)setMinimizedIntoAssistant:(BOOL)a3
{
  if (self->_minimizedIntoAssistant != a3)
  {
    self->_minimizedIntoAssistant = a3;
    id v4 = [(WTWritingToolsController *)self sourceResponder];
    [v4 _setWritingToolsInputDashboardViewController:0];
    [(WTWritingToolsController *)self updateInputDashboardViewController];
  }
}

- (BOOL)popoverWillAdjust
{
  int v2 = self;
  [(WTWritingToolsController *)self _visibleApproximationOfTextSelectionRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(WTWritingToolsController *)v2 mainPopoverViewController];
  CGFloat v12 = [v11 popoverPresentationController];
  LOBYTE(v2) = -[WTWritingToolsController shouldAdjustPopoverPresentationController:toRect:](v2, "shouldAdjustPopoverPresentationController:toRect:", v12, v4, v6, v8, v10);

  return (char)v2;
}

- (void)_updatePopoverAnchoring
{
  v13[1] = *MEMORY[0x263EF8340];
  double v3 = [(WTWritingToolsController *)self mainPopoverViewController];
  double v4 = [v3 popoverPresentationController];

  [(WTWritingToolsController *)self _visibleApproximationOfTextSelectionRect];
  if (-[WTWritingToolsController shouldAdjustPopoverPresentationController:toRect:](self, "shouldAdjustPopoverPresentationController:toRect:", v4))
  {
    double v5 = [(WTWritingToolsController *)self sourceTextInput];
    double v6 = [v5 textInputView];
    [v4 setSourceView:v6];

    [(WTWritingToolsController *)self _visibleApproximationOfTextSelectionRect];
    objc_msgSend(v4, "setSourceRect:");
    objc_msgSend(v4, "setPermittedArrowDirections:", -[WTWritingToolsController _permittedPopoverArrowDirection](self, "_permittedPopoverArrowDirection"));
    [v4 setCanOverlapSourceViewRect:1];
    double v7 = [v4 containerView];
    [v7 setNeedsLayout];

    double v8 = [v4 containerView];
    [v8 layoutIfNeeded];

    double v9 = [(WTWritingToolsController *)self session];
    if (v9)
    {
    }
    else if (![(WTWritingToolsController *)self requestedTool])
    {
      [v4 setPassthroughViews:0];
      goto LABEL_6;
    }
    double v10 = [(WTWritingToolsController *)self sourceTextInput];
    uint64_t v11 = [v10 textInputView];
    v13[0] = v11;
    CGFloat v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [v4 setPassthroughViews:v12];
  }
LABEL_6:
}

- (BOOL)shouldAdjustPopoverPresentationController:(id)a3 toRect:(CGRect)a4
{
  double width = a4.size.width;
  id v6 = a3;
  if ([(WTWritingToolsController *)self _compositionSessionActive]) {
    int v7 = _os_feature_enabled_impl() ^ 1;
  }
  else {
    LOBYTE(v7) = 1;
  }
  double v8 = [v6 sourceView];

  if (v8) {
    char v9 = v7;
  }
  else {
    char v9 = 1;
  }
  if (width == 0.0) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 1;
  }

  return v10;
}

- (CGRect)_visibleApproximationOfTextSelectionRect
{
  [(WTWritingToolsController *)self _textSelectionRectForTextInput];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  uint64_t v11 = [(WTWritingToolsController *)self sourceTextInput];
  CGFloat v12 = [v11 textInputView];

  CGFloat v13 = [v12 window];
  CGFloat v14 = [v12 window];
  [v14 bounds];
  objc_msgSend(v13, "convertRect:toView:", v12);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v31.origin.CGFloat x = v16;
  v31.origin.CGFloat y = v18;
  v31.size.CGFloat width = v20;
  v31.size.CGFloat height = v22;
  v34.origin.CGFloat x = v4;
  v34.origin.CGFloat y = v6;
  v34.size.CGFloat width = v8;
  v34.size.CGFloat height = v10;
  CGRect v32 = CGRectIntersection(v31, v34);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;

  double v27 = x;
  double v28 = y;
  double v29 = width;
  double v30 = height;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (unint64_t)_permittedPopoverArrowDirection
{
  if ([(WTWritingToolsController *)self _smartReplySessionActiveOrRequested]) {
    return 1;
  }
  else {
    return 15;
  }
}

- (id)_assistantProofreadBarButton
{
  v22[3] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  double v3 = (void *)MEMORY[0x263F823D0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__WTWritingToolsController__assistantProofreadBarButton__block_invoke;
  v19[3] = &unk_26558E6B8;
  objc_copyWeak(&v20, &location);
  CGFloat v16 = [v3 actionWithHandler:v19];
  CGFloat v4 = objc_msgSend(MEMORY[0x263F824E8], "systemButtonWithPrimaryAction:");
  double v5 = objc_alloc_init(WTProofreadCandidateBarView);
  [(WTProofreadCandidateBarView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  CGFloat v6 = [(WTWritingToolsController *)self proofreadingSuggestions];
  -[WTProofreadCandidateBarView setSuggestionCount:](v5, "setSuggestionCount:", [v6 count]);

  [(WTWritingToolsController *)self setProofreadCandidateBarView:v5];
  [v4 addSubview:v5];
  double v17 = (void *)MEMORY[0x263F08938];
  CGFloat v18 = [(WTProofreadCandidateBarView *)v5 centerXAnchor];
  double v7 = [v4 centerXAnchor];
  CGFloat v8 = [v18 constraintEqualToAnchor:v7];
  v22[0] = v8;
  double v9 = [(WTProofreadCandidateBarView *)v5 topAnchor];
  CGFloat v10 = [v4 topAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10 constant:4.0];
  v22[1] = v11;
  CGFloat v12 = [v4 widthAnchor];
  CGFloat v13 = [v12 constraintEqualToConstant:60.0];
  void v22[2] = v13;
  CGFloat v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  [v17 activateConstraints:v14];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v4;
}

void __56__WTWritingToolsController__assistantProofreadBarButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMinimizedIntoAssistant:1];
}

- (id)_assistantBarButtonCustomViewWithTitle:(id)a3 handler:(id)a4
{
  v40[4] = *MEMORY[0x263EF8340];
  id v5 = a4;
  CGFloat v6 = (objc_class *)MEMORY[0x263F82E50];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = objc_alloc(MEMORY[0x263F82FE0]);
  CGFloat v10 = [MEMORY[0x263F82FF8] sharedLight];
  uint64_t v11 = (void *)[v9 initWithLightSource:v10];
  CGFloat v12 = (void *)[v8 initWithEffect:v11];

  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  CGFloat v13 = (void *)MEMORY[0x263F823D0];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __75__WTWritingToolsController__assistantBarButtonCustomViewWithTitle_handler___block_invoke;
  v38[3] = &unk_26558E6E0;
  id v39 = v5;
  id v37 = v5;
  NSRange v36 = [v13 actionWithHandler:v38];
  CGFloat v14 = [MEMORY[0x263F824E8] systemButtonWithPrimaryAction:v36];
  [v14 setAttributedTitle:v7 forState:0];

  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v14, "setContentEdgeInsets:", 20.0, 6.0, 20.0, 6.0);
  double v15 = [v12 contentView];
  [v15 addSubview:v14];

  double v28 = (void *)MEMORY[0x263F08938];
  uint64_t v35 = [v12 contentView];
  CGRect v34 = [v35 leadingAnchor];
  __int16 v33 = [v14 leadingAnchor];
  CGRect v32 = [v34 constraintEqualToAnchor:v33];
  v40[0] = v32;
  CGRect v31 = [v12 contentView];
  double v30 = [v31 trailingAnchor];
  double v29 = [v14 trailingAnchor];
  double v27 = [v30 constraintEqualToAnchor:v29];
  v40[1] = v27;
  CGFloat v16 = [v12 contentView];
  double v17 = [v16 topAnchor];
  CGFloat v18 = [v14 topAnchor];
  double v19 = [v17 constraintEqualToAnchor:v18];
  v40[2] = v19;
  id v26 = v12;
  id v20 = [v12 contentView];
  double v21 = [v20 bottomAnchor];
  CGFloat v22 = [v14 bottomAnchor];
  long long v23 = [v21 constraintEqualToAnchor:v22];
  v40[3] = v23;
  double v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
  [v28 activateConstraints:v24];

  return v26;
}

uint64_t __75__WTWritingToolsController__assistantBarButtonCustomViewWithTitle_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSuppressWritingToolsForRemoteKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WTWritingToolsController *)self mainPopoverViewController];
  int v6 = [v5 presentedAsSheet];

  if (v6)
  {
    [(WTWritingToolsController *)self setSuppressingSheetForRemoteKeyboardOnScreen:v3];
    [(WTWritingToolsController *)self updateWritingToolsPopoverSuppression];
  }
}

- (void)_updateSuggestionPopover
{
  BOOL v3 = [(WTWritingToolsController *)self popoverSuggestionUUID];

  if (v3)
  {
    CGFloat v4 = [(WTWritingToolsController *)self popoverSuggestionUUID];
    id v5 = [(WTWritingToolsController *)self currentSuggestionViewController];
    int v6 = [v5 suggestion];
    id v7 = [v6 uuid];
    char v8 = [v4 isEqual:v7];

    if (v8)
    {
      uint64_t v9 = [(WTWritingToolsController *)self popoverSuggestionUUID];
      if (v9)
      {
        CGFloat v10 = (void *)v9;
        uint64_t v11 = [(WTWritingToolsController *)self currentSuggestionViewController];

        if (!v11)
        {
          [(WTWritingToolsController *)self _presentSuggestionViewController];
        }
      }
    }
    else
    {
      CGFloat v12 = [(WTWritingToolsController *)self sourceResponderViewController];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      void v13[2] = __52__WTWritingToolsController__updateSuggestionPopover__block_invoke;
      v13[3] = &unk_26558E530;
      v13[4] = self;
      [v12 dismissViewControllerAnimated:1 completion:v13];
    }
  }
  else
  {
    [(WTWritingToolsController *)self _dismissSuggestionViewController];
  }
}

uint64_t __52__WTWritingToolsController__updateSuggestionPopover__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) currentSuggestionViewController];
  [v2 invalidateConnection];

  [*(id *)(a1 + 32) setCurrentSuggestionViewController:0];
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 _presentSuggestionViewController];
}

- (void)_updatePromptEntryPopover
{
  BOOL v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CGFloat v4 = 0;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_DEFAULT, "Update prompt entry view controller...", v4, 2u);
  }

  [(WTWritingToolsController *)self _presentPromptEntryViewController];
}

- (void)_presentSuggestionViewController
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WTWritingToolsController *)self uuidSuggestionMapping];
  CGFloat v4 = [(WTWritingToolsController *)self popoverSuggestionUUID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  int v6 = [(WTWritingToolsController *)self contextForSuggestions];
  id v7 = [v5 uuid];
  char v8 = [v6 objectForKeyedSubscript:v7];

  uint64_t v9 = [WTSuggestionViewController alloc];
  CGFloat v10 = [(WTWritingToolsController *)self session];
  uint64_t v11 = [(WTSuggestionViewController *)v9 initWithSuggestion:v5 inContextWithUUID:v8 inSession:v10];

  [(WTSuggestionViewController *)v11 setModalPresentationStyle:7];
  CGFloat v12 = [(WTWritingToolsController *)self suggestionPopoverSourceView];
  CGFloat v13 = [(WTSuggestionViewController *)v11 popoverPresentationController];
  [v13 setSourceView:v12];

  [(WTWritingToolsController *)self suggestionPopoverSourceRect];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  CGFloat v22 = [(WTSuggestionViewController *)v11 popoverPresentationController];
  objc_msgSend(v22, "setSourceRect:", v15, v17, v19, v21);

  long long v23 = [(WTSuggestionViewController *)v11 popoverPresentationController];
  [v23 setPermittedArrowDirections:3];

  [(WTWritingToolsController *)self setCurrentSuggestionViewController:v11];
  double v24 = _WTVCLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [(WTWritingToolsController *)self currentSuggestionViewController];
    int v28 = 138412290;
    double v29 = v25;
    _os_log_impl(&dword_261BE2000, v24, OS_LOG_TYPE_DEFAULT, "present suggestionViewController: %@", (uint8_t *)&v28, 0xCu);
  }
  id v26 = [(WTWritingToolsController *)self sourceResponderViewController];
  double v27 = [(WTWritingToolsController *)self currentSuggestionViewController];
  [v26 presentViewController:v27 animated:1 completion:0];
}

- (void)_presentPromptEntryViewController
{
  BOOL v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v26 = 0;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_DEFAULT, "Presenting prompt entry view controller...", v26, 2u);
  }

  [(WTWritingToolsController *)self setPresentingPromptEntry:1];
  [(WTWritingToolsController *)self updateWritingToolsPopoverSuppression];
  CGFloat v4 = [WTPromptEntryViewController alloc];
  id v5 = [(WTWritingToolsController *)self session];
  int v6 = [(WTPromptEntryViewController *)v4 initWithWritingToolsController:self session:v5];

  [(WTPromptEntryViewController *)v6 setModalPresentationStyle:7];
  id v7 = [(WTWritingToolsController *)self sourceResponderViewController];
  char v8 = [v7 view];
  uint64_t v9 = [(WTPromptEntryViewController *)v6 popoverPresentationController];
  [v9 setSourceView:v8];

  CGFloat v10 = [(WTPromptEntryViewController *)v6 popoverPresentationController];
  uint64_t v11 = [v10 sourceView];
  CGFloat v12 = [v11 keyboardLayoutGuide];
  [v12 layoutFrame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = [(WTPromptEntryViewController *)v6 popoverPresentationController];
  objc_msgSend(v21, "setSourceRect:", v14, v16, v18, v20);

  CGFloat v22 = [(WTPromptEntryViewController *)v6 popoverPresentationController];
  [v22 _setShouldHideArrow:1];

  long long v23 = [(WTPromptEntryViewController *)v6 _popoverController];
  [v23 setDelegate:v6];

  [(WTWritingToolsController *)self setCurrentPromptEntryViewController:v6];
  double v24 = [(WTWritingToolsController *)self sourceResponderViewController];
  uint64_t v25 = [(WTWritingToolsController *)self currentPromptEntryViewController];
  [v24 presentViewController:v25 animated:1 completion:0];
}

- (void)_dismissSuggestionViewController
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v4 = [(WTWritingToolsController *)self currentSuggestionViewController];
    *(_DWORD *)buf = 138412290;
    double v14 = v4;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_DEFAULT, "_dismissSuggestionViewController, %@", buf, 0xCu);
  }
  uint64_t v5 = [(WTWritingToolsController *)self currentSuggestionViewController];
  if (v5)
  {
    int v6 = (void *)v5;
    id v7 = [(WTWritingToolsController *)self currentSuggestionViewController];
    char v8 = [v7 presentationController];
    if ([v8 dismissed])
    {
    }
    else
    {
      uint64_t v9 = [(WTWritingToolsController *)self currentSuggestionViewController];
      CGFloat v10 = [v9 presentationController];
      char v11 = [v10 dismissing];

      if (v11) {
        return;
      }
      int v6 = [(WTWritingToolsController *)self sourceResponderViewController];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __60__WTWritingToolsController__dismissSuggestionViewController__block_invoke;
      v12[3] = &unk_26558E530;
      v12[4] = self;
      [v6 dismissViewControllerAnimated:1 completion:v12];
    }
  }
}

uint64_t __60__WTWritingToolsController__dismissSuggestionViewController__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) currentSuggestionViewController];
  [v2 invalidateConnection];

  [*(id *)(a1 + 32) setCurrentSuggestionViewController:0];
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 updateWritingToolsPopoverSuppression];
}

- (void)enrollmentBegan
{
  BOOL v3 = [WTFormSheetViewController alloc];
  CGFloat v4 = [(WTWritingToolsController *)self session];
  int v6 = [(WTFormSheetViewController *)v3 initWithWritingToolsController:self inSession:v4 formSheetUIType:1];

  [(WTFormSheetViewController *)v6 setModalPresentationStyle:2];
  [(WTWritingToolsController *)self setFormSheetViewController:v6];
  [(WTWritingToolsController *)self setPresentingFormSheet:1];
  [(WTWritingToolsController *)self updateWritingToolsPopoverSuppression];
  uint64_t v5 = [(WTWritingToolsController *)self sourceResponderViewController];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)enrollmentDismissed
{
  [(WTWritingToolsController *)self setIsResumingFromModelEnrollment:1];
  BOOL v3 = [(WTWritingToolsController *)self sourceResponderViewController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__WTWritingToolsController_enrollmentDismissed__block_invoke;
  v4[3] = &unk_26558E530;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

uint64_t __47__WTWritingToolsController_enrollmentDismissed__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentingFormSheet:0];
  int v2 = *(void **)(a1 + 32);

  return [v2 updateSourceView];
}

- (void)photosPickerSessionBegan
{
  BOOL v3 = [WTFormSheetViewController alloc];
  CGFloat v4 = [(WTWritingToolsController *)self session];
  int v6 = [(WTFormSheetViewController *)v3 initWithWritingToolsController:self inSession:v4 formSheetUIType:2];

  [(WTFormSheetViewController *)v6 setModalPresentationStyle:2];
  [(WTWritingToolsController *)self setFormSheetViewController:v6];
  [(WTWritingToolsController *)self setPresentingFormSheet:1];
  [(WTWritingToolsController *)self updateWritingToolsPopoverSuppression];
  uint64_t v5 = [(WTWritingToolsController *)self sourceResponderViewController];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)photosPickerSessionDismissed
{
  BOOL v3 = [(WTWritingToolsController *)self sourceResponderViewController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__WTWritingToolsController_photosPickerSessionDismissed__block_invoke;
  v4[3] = &unk_26558E530;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

uint64_t __56__WTWritingToolsController_photosPickerSessionDismissed__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentingFormSheet:0];
  int v2 = *(void **)(a1 + 32);

  return [v2 updateSourceView];
}

- (void)_dismissPromptEntryViewController
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v4 = [(WTWritingToolsController *)self currentPromptEntryViewController];
    *(_DWORD *)buf = 138412290;
    double v14 = v4;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_DEFAULT, "__dismissPromptEntryViewController, %@", buf, 0xCu);
  }
  [(WTWritingToolsController *)self setPresentingPromptEntry:0];
  uint64_t v5 = [(WTWritingToolsController *)self currentPromptEntryViewController];
  if (v5)
  {
    int v6 = (void *)v5;
    id v7 = [(WTWritingToolsController *)self currentPromptEntryViewController];
    char v8 = [v7 presentationController];
    if ([v8 dismissed])
    {
    }
    else
    {
      uint64_t v9 = [(WTWritingToolsController *)self currentPromptEntryViewController];
      CGFloat v10 = [v9 presentationController];
      char v11 = [v10 dismissing];

      if (v11) {
        return;
      }
      int v6 = [(WTWritingToolsController *)self sourceResponderViewController];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __61__WTWritingToolsController__dismissPromptEntryViewController__block_invoke;
      v12[3] = &unk_26558E530;
      v12[4] = self;
      [v6 dismissViewControllerAnimated:1 completion:v12];
    }
  }
}

uint64_t __61__WTWritingToolsController__dismissPromptEntryViewController__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) currentPromptEntryViewController];
  [v2 invalidateConnection];

  [*(id *)(a1 + 32) setCurrentPromptEntryViewController:0];
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 updateWritingToolsPopoverSuppression];
}

- (BOOL)_wantsInlineEditing
{
  BOOL v3 = [(WTWritingToolsController *)self writingToolsDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(WTWritingToolsController *)self writingToolsDelegate];
    uint64_t v6 = [v5 writingToolsBehavior];

    if (v6 == 2) {
      return 0;
    }
  }
  char v8 = [(WTWritingToolsController *)self writingToolsDelegate];
  if (v8) {
    BOOL v7 = [(WTWritingToolsController *)self _isEditableResponder];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_isEditableResponder
{
  BOOL v3 = [(WTWritingToolsController *)self beTextInput];
  char v4 = [v3 isEditable];

  if (v4) {
    return 1;
  }
  uint64_t v6 = [(WTWritingToolsController *)self sourceTextInput];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(WTWritingToolsController *)self sourceTextInput];
    char v5 = [v8 isEditable];
LABEL_7:

    return v5;
  }
  uint64_t v9 = [(WTWritingToolsController *)self sourceResponder];
  CGFloat v10 = [v9 _textInteraction];

  if (v10)
  {
    char v8 = [(WTWritingToolsController *)self sourceResponder];
    char v11 = [v8 _textInteraction];
    char v5 = [v11 textInteractionMode] == 0;

    goto LABEL_7;
  }
  return 1;
}

- (void)_presentMainPopoverViewController
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WTWritingToolsController *)self currentSuggestionViewController];

  if (v3)
  {
    [(WTWritingToolsController *)self _dismissSuggestionViewController];
  }
  else
  {
    char v4 = [MEMORY[0x263F828D0] activeKeyboardSceneDelegate];
    [v4 addVisibilityObserver:self];

    char v5 = [(WTWritingToolsController *)self sourceResponderViewController];
    uint64_t v6 = _WTVCLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v27 = v5;
      _os_log_impl(&dword_261BE2000, v6, OS_LOG_TYPE_DEFAULT, "presentViewController in _updateWritingToolsSheetSuppression from %@", buf, 0xCu);
    }

    char v7 = objc_alloc_init(_TtC14WritingToolsUI16WTStartupOptions);
    char v8 = [(WTWritingToolsController *)self session];
    uint64_t v9 = [v8 uuid];
    [(WTStartupOptions *)v7 setSessionUUID:v9];

    [(WTStartupOptions *)v7 setRequestedTool:[(WTWritingToolsController *)self requestedTool]];
    CGFloat v10 = [(WTWritingToolsController *)self prompt];
    [(WTStartupOptions *)v7 setPrompt:v10];

    [(WTStartupOptions *)v7 setEditable:[(WTWritingToolsController *)self _isEditableResponder]];
    [(WTStartupOptions *)v7 setWantsInlineEditing:[(WTWritingToolsController *)self _wantsInlineEditing]];
    char v11 = [(WTWritingToolsController *)self analyticsUUID];
    [(WTStartupOptions *)v7 setAnalyticsUUID:v11];

    CGFloat v12 = [MEMORY[0x263F82670] currentDevice];
    -[WTStartupOptions setSourceUserInterfaceIdiom:](v7, "setSourceUserInterfaceIdiom:", [v12 userInterfaceIdiom]);

    double v13 = [(WTWritingToolsController *)self writingToolsDelegate];
    objc_opt_class();
    LOBYTE(v9) = objc_opt_isKindOfClass();

    if (v9)
    {
      double v14 = [(WTWritingToolsController *)self writingToolsDelegate];
      -[WTStartupOptions setAllowedResultOptions:](v7, "setAllowedResultOptions:", [v14 resultOptions]);
    }
    else
    {
      uint64_t v15 = [(WTWritingToolsController *)self sourceTextInput];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        double v17 = [(WTWritingToolsController *)self sourceTextInput];
        -[WTStartupOptions setAllowedResultOptions:](v7, "setAllowedResultOptions:", [v17 allowedWritingToolsResultOptions]);
      }
      else
      {
        [(WTStartupOptions *)v7 setAllowedResultOptions:0];
      }
    }
    double v18 = [(WTWritingToolsController *)self smartReplyConfig];
    [(WTStartupOptions *)v7 setSmartReplyConfiguration:v18];

    double v19 = [(WTWritingToolsController *)self sourceResponderViewController];
    double v20 = [v19 traitCollection];
    -[WTStartupOptions setSourceResponderHorizontalSizeClass:](v7, "setSourceResponderHorizontalSizeClass:", [v20 horizontalSizeClass]);

    [(WTStartupOptions *)v7 setIsWindowingModeEnabled:[(WTWritingToolsController *)self isWindowingModeEnabled]];
    if ([(WTWritingToolsController *)self isResumingFromModelEnrollment])
    {
      [(WTStartupOptions *)v7 setIsResumingFromModelEnrollment:1];
      [(WTWritingToolsController *)self setIsResumingFromModelEnrollment:0];
    }
    double v21 = [[WTMainPopoverViewController alloc] initWithWritingToolsController:self startupOptions:v7];
    [(WTWritingToolsController *)self setMainPopoverViewController:v21];

    CGFloat v22 = [(WTWritingToolsController *)self mainPopoverViewController];
    [v22 setPresenting:1];

    [(WTWritingToolsController *)self _updatePopoverAnchoring];
    objc_initWeak((id *)buf, self);
    long long v23 = [(WTWritingToolsController *)self mainPopoverViewController];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    void v24[2] = __61__WTWritingToolsController__presentMainPopoverViewController__block_invoke;
    v24[3] = &unk_26558E458;
    objc_copyWeak(&v25, (id *)buf);
    [v5 presentViewController:v23 animated:1 completion:v24];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __61__WTWritingToolsController__presentMainPopoverViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained mainPopoverViewController];
  [v1 setPresenting:0];
}

- (id)_textViewDelegate
{
  BOOL v3 = [(WTWritingToolsController *)self mainPopoverViewController];

  if (v3)
  {
    char v4 = [(WTWritingToolsController *)self mainPopoverViewController];
  }
  else
  {
    char v5 = [(WTWritingToolsController *)self _inputDashboardViewController];
    char v4 = v5;
    if (v5) {
      id v6 = v5;
    }
  }

  return v4;
}

- (WTWritingToolsDelegate)writingToolsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writingToolsDelegate);

  return (WTWritingToolsDelegate *)WeakRetained;
}

- (void)setWritingToolsDelegate:(id)a3
{
}

- (int64_t)requestedTool
{
  return self->_requestedTool;
}

- (void)setRequestedTool:(int64_t)a3
{
  self->_requestedTool = a3;
}

- (NSString)prompt
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPrompt:(id)a3
{
}

- (WTSmartReplyConfiguration)smartReplyConfig
{
  return (WTSmartReplyConfiguration *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSmartReplyConfig:(id)a3
{
}

- (NSMutableDictionary)uuidContextMapping
{
  return self->_uuidContextMapping;
}

- (void)setUuidContextMapping:(id)a3
{
}

- (NSMutableArray)proofreadingSuggestions
{
  return self->_proofreadingSuggestions;
}

- (void)setProofreadingSuggestions:(id)a3
{
}

- (NSMutableDictionary)uuidSuggestionMapping
{
  return self->_uuidSuggestionMapping;
}

- (void)setUuidSuggestionMapping:(id)a3
{
}

- (NSMutableDictionary)contextForSuggestions
{
  return self->_contextForSuggestions;
}

- (void)setContextForSuggestions:(id)a3
{
}

- (BOOL)isWritingToolsActive
{
  return self->_isWritingToolsActive;
}

- (void)setIsWritingToolsActive:(BOOL)a3
{
  self->_isWritingToolsActive = a3;
}

- (WTSession)session
{
  return self->_session;
}

- (BOOL)suppressingSheetForRemoteKeyboardOnScreen
{
  return self->_suppressingSheetForRemoteKeyboardOnScreen;
}

- (void)setSuppressingSheetForRemoteKeyboardOnScreen:(BOOL)a3
{
  self->_suppressingSheetForRemoteKeyboardOnScreen = a3;
}

- (BOOL)endingUCBWritingToolsSession
{
  return self->_endingUCBWritingToolsSession;
}

- (void)setEndingUCBWritingToolsSession:(BOOL)a3
{
  self->_endingUCBWritingToolsSession = a3;
}

- (BOOL)minimizedIntoUCB
{
  return self->_minimizedIntoUCB;
}

- (void)setMinimizedIntoUCB:(BOOL)a3
{
  self->_minimizedIntoUCB = a3;
}

- (BOOL)minimizedIntoAssistant
{
  return self->_minimizedIntoAssistant;
}

- (BOOL)presentingPromptEntry
{
  return self->_presentingPromptEntry;
}

- (void)setPresentingPromptEntry:(BOOL)a3
{
  self->_presentingPromptEntrCGFloat y = a3;
}

- (BOOL)presentingFormSheet
{
  return self->_presentingFormSheet;
}

- (void)setPresentingFormSheet:(BOOL)a3
{
  self->_presentingFormSheet = a3;
}

- (BOOL)switchedFromUCBToPopover
{
  return self->_switchedFromUCBToPopover;
}

- (void)setSwitchedFromUCBToPopover:(BOOL)a3
{
  self->_switchedFromUCBToPopover = a3;
}

- (BOOL)temporarilySuppressPopoverForAdjustment
{
  return self->_temporarilySuppressPopoverForAdjustment;
}

- (void)setTemporarilySuppressPopoverForAdjustment:(BOOL)a3
{
  self->_temporarilySuppressPopoverForAdjustment = a3;
}

- (BOOL)isResumingFromModelEnrollment
{
  return self->_isResumingFromModelEnrollment;
}

- (void)setIsResumingFromModelEnrollment:(BOOL)a3
{
  self->_isResumingFromModelEnrollment = a3;
}

- (BOOL)suppressSheetForKeyboardEditing
{
  return self->_suppressSheetForKeyboardEditing;
}

- (int64_t)sourceResponderHorizontalSizeClass
{
  return self->_sourceResponderHorizontalSizeClass;
}

- (void)setSourceResponderHorizontalSizeClass:(int64_t)a3
{
  self->_sourceResponderHorizontalSizeClass = a3;
}

- (BOOL)windowingModeEnabled
{
  return self->_windowingModeEnabled;
}

- (void)setWindowingModeEnabled:(BOOL)a3
{
  self->_windowingModeEnabled = a3;
}

- (WTUIAttributedStringController)attributedStringController
{
  return (WTUIAttributedStringController *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAttributedStringController:(id)a3
{
}

- (UIResponder)sourceResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceResponder);

  return (UIResponder *)WeakRetained;
}

- (void)setSourceResponder:(id)a3
{
}

- (UITextInput)sourceTextInput
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceTextInput);

  return (UITextInput *)WeakRetained;
}

- (void)setSourceTextInput:(id)a3
{
}

- (BETextInput)beTextInput
{
  return self->_beTextInput;
}

- (void)setBeTextInput:(id)a3
{
}

- (WTMainPopoverViewController)mainPopoverViewController
{
  return (WTMainPopoverViewController *)objc_getProperty(self, a2, 136, 1);
}

- (void)setMainPopoverViewController:(id)a3
{
}

- (WTSuggestionViewController)currentSuggestionViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentSuggestionViewController);

  return (WTSuggestionViewController *)WeakRetained;
}

- (void)setCurrentSuggestionViewController:(id)a3
{
}

- (WTPromptEntryViewController)currentPromptEntryViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentPromptEntryViewController);

  return (WTPromptEntryViewController *)WeakRetained;
}

- (void)setCurrentPromptEntryViewController:(id)a3
{
}

- (NSUUID)popoverSuggestionUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPopoverSuggestionUUID:(id)a3
{
}

- (CGRect)suggestionPopoverSourceRect
{
  objc_copyStruct(v6, &self->_suggestionPopoverSourceRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setSuggestionPopoverSourceRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_suggestionPopoverSourceRect, &v3, 32, 1, 0);
}

- (UIView)suggestionPopoverSourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionPopoverSourceView);

  return (UIView *)WeakRetained;
}

- (void)setSuggestionPopoverSourceView:(id)a3
{
}

- (WTFormSheetViewController)formSheetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_formSheetViewController);

  return (WTFormSheetViewController *)WeakRetained;
}

- (void)setFormSheetViewController:(id)a3
{
}

- (WTProofreadCandidateBarView)proofreadCandidateBarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proofreadCandidateBarView);

  return (WTProofreadCandidateBarView *)WeakRetained;
}

- (void)setProofreadCandidateBarView:(id)a3
{
}

- (WTAnalyticsDelegate)analyticsDelegate
{
  return self->_analyticsDelegate;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (NSUUID)analyticsUUID
{
  return self->_analyticsUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsUUID, 0);
  objc_storeStrong((id *)&self->_analyticsDelegate, 0);
  objc_destroyWeak((id *)&self->_proofreadCandidateBarView);
  objc_destroyWeak((id *)&self->_formSheetViewController);
  objc_destroyWeak((id *)&self->_suggestionPopoverSourceView);
  objc_storeStrong((id *)&self->_popoverSuggestionUUID, 0);
  objc_destroyWeak((id *)&self->_currentPromptEntryViewController);
  objc_destroyWeak((id *)&self->_currentSuggestionViewController);
  objc_storeStrong((id *)&self->_mainPopoverViewController, 0);
  objc_storeStrong((id *)&self->_beTextInput, 0);
  objc_destroyWeak((id *)&self->_sourceTextInput);
  objc_destroyWeak((id *)&self->_sourceResponder);
  objc_storeStrong((id *)&self->_attributedStringController, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_contextForSuggestions, 0);
  objc_storeStrong((id *)&self->_uuidSuggestionMapping, 0);
  objc_storeStrong((id *)&self->_proofreadingSuggestions, 0);
  objc_storeStrong((id *)&self->_uuidContextMapping, 0);
  objc_storeStrong((id *)&self->_smartReplyConfig, 0);
  objc_storeStrong((id *)&self->_prompt, 0);

  objc_destroyWeak((id *)&self->_writingToolsDelegate);
}

+ (BOOL)isAvailable
{
  return sub_261C0964C() & 1;
}

- (void)_createSmartReplyInputDashboardViewController
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_261BE2000, log, OS_LOG_TYPE_ERROR, "Attempt to create InputDashboardVC for SmartReply, but input dashboard configuration is not enabled", v1, 2u);
}

@end