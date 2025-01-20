@interface WTSceneHostedInputDashboardViewController
- (BOOL)allowsCompactAssistantBar;
- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4;
- (NSUUID)sessionUUID;
- (WTSceneHostedInputDashboardViewController)initWithWritingToolsDelegate:(id)a3 startupOptions:(id)a4;
- (WTWritingToolsDelegate_Internal)writingToolsDelegate;
- (_TtC14WritingToolsUI16WTStartupOptions)startupOptions;
- (_UISceneHostingController)hostingController;
- (double)preferredHeightForTraitCollection:(id)a3;
- (double)preferredWidthForTraitCollection:(id)a3;
- (void)_setupSceneHosting;
- (void)beginTextPlaceholder;
- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)copyText:(id)a3;
- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4;
- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4;
- (void)endTextPlaceholderAndWillInsertText:(BOOL)a3 completion:(id)a4;
- (void)endWritingTools;
- (void)endWritingToolsWithError:(id)a3;
- (void)enrollmentBegan;
- (void)enrollmentDismissed;
- (void)handOffFromUCBWithPrompt:(id)a3;
- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6;
- (void)proofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5;
- (void)redo;
- (void)replaceSelectionWithText:(id)a3;
- (void)setHostingController:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setStartupOptions:(id)a3;
- (void)setWritingToolsDelegate:(id)a3;
- (void)showAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 buttonAction:(id)a6;
- (void)showContentWarningWithTitle:(id)a3 message:(id)a4;
- (void)showSmartReplyQuestionnaireWithRect:(CGRect)a3;
- (void)undo;
- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4;
- (void)writingToolsDidUpdateKeyboardPosition:(CGRect)a3 preferredContentSizeChanging:(BOOL)a4;
- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4;
@end

@implementation WTSceneHostedInputDashboardViewController

- (WTSceneHostedInputDashboardViewController)initWithWritingToolsDelegate:(id)a3 startupOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WTSceneHostedInputDashboardViewController;
  v8 = [(WTSceneHostedInputDashboardViewController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_writingToolsDelegate, v6);
    uint64_t v10 = [v7 sessionUUID];
    sessionUUID = v9->_sessionUUID;
    v9->_sessionUUID = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_startupOptions, a4);
    [(WTSceneHostedInputDashboardViewController *)v9 _setupSceneHosting];
  }

  return v9;
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _WTVCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v6 uuid];
    int v13 = 136315906;
    v14 = "-[WTSceneHostedInputDashboardViewController willBeginWritingToolsSession:requestContexts:]";
    __int16 v15 = 2112;
    v16 = self;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = [v6 type];
    _os_log_impl(&dword_261BE2000, v8, OS_LOG_TYPE_INFO, "%s (%@, sessUUIS: %@, sessType: %lu)", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v10 = [(WTSceneHostedInputDashboardViewController *)self sessionUUID];

  if (!v10)
  {
    v11 = [v6 uuid];
    [(WTSceneHostedInputDashboardViewController *)self setSessionUUID:v11];
  }
  v12 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v12 willBeginWritingToolsSession:v6 requestContexts:v7];
}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _WTVCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v6 uuid];
    int v11 = 136316162;
    v12 = "-[WTSceneHostedInputDashboardViewController didBeginWritingToolsSession:contexts:]";
    __int16 v13 = 2112;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = [v6 type];
    __int16 v19 = 2048;
    uint64_t v20 = [v7 count];
    _os_log_impl(&dword_261BE2000, v8, OS_LOG_TYPE_INFO, "%s (%@, sessUUID: %@, sessType: %lu, #contexts: %lu)", (uint8_t *)&v11, 0x34u);
  }
  uint64_t v10 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v10 didBeginWritingToolsSession:v6 contexts:v7];
}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _WTVCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [v6 uuid];
    int v10 = 136316162;
    int v11 = "-[WTSceneHostedInputDashboardViewController writingToolsSession:didReceiveAction:]";
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
  v9 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v9 writingToolsSession:v6 didReceiveAction:a4];
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _WTVCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [v6 uuid];
    uint64_t v9 = [v6 type];
    int v13 = 136316162;
    __int16 v14 = "-[WTSceneHostedInputDashboardViewController didEndWritingToolsSession:accepted:]";
    int v10 = "no";
    if (v4) {
      int v10 = "yes";
    }
    __int16 v15 = 2112;
    __int16 v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    __int16 v21 = 2080;
    v22 = v10;
    _os_log_impl(&dword_261BE2000, v7, OS_LOG_TYPE_INFO, "%s (%@, sessUUIS: %@, sessType: %lu, accepted: %s)", (uint8_t *)&v13, 0x34u);
  }
  int v11 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v11 didEndWritingToolsSession:v6 accepted:v4];

  __int16 v12 = [(WTSceneHostedInputDashboardViewController *)self hostingController];
  [v12 invalidate];
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
    __int16 v17 = [v13 uuid];
    uint64_t v18 = [v13 type];
    uint64_t v19 = [v14 length];
    int v22 = 136316930;
    uint64_t v23 = "-[WTSceneHostedInputDashboardViewController compositionSession:didReceiveText:replacementRange:inContext:finished:]";
    uint64_t v20 = "no";
    if (v7) {
      uint64_t v20 = "yes";
    }
    __int16 v24 = 2112;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v17;
    __int16 v28 = 2048;
    uint64_t v29 = v18;
    __int16 v30 = 2048;
    uint64_t v31 = v19;
    __int16 v32 = 2048;
    NSUInteger v33 = location;
    __int16 v34 = 2048;
    NSUInteger v35 = length;
    __int16 v36 = 2080;
    v37 = v20;
    _os_log_impl(&dword_261BE2000, v16, OS_LOG_TYPE_INFO, "%s (%@, sessUUIS: %@, sessType: %lu, textLen: %lu, replaceRange: {%lu,%lu}, finished: %s)", (uint8_t *)&v22, 0x52u);
  }
  __int16 v21 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
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
  id v16 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  objc_msgSend(v16, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v15, v14, location, length, v13, v7);
}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v13 proofreadingSession:v12 didUpdateState:a4 forSuggestionWithUUID:v11 inContext:v10];
}

- (void)endWritingToolsWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _WTVCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    v8 = "-[WTSceneHostedInputDashboardViewController endWritingToolsWithError:]";
    __int16 v9 = 2112;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_261BE2000, v5, OS_LOG_TYPE_INFO, "%s (%@, error: %@)", (uint8_t *)&v7, 0x20u);
  }

  id v6 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v6 endWritingToolsWithError:v4];
}

- (void)showContentWarningWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  objc_initWeak(&location, self);
  __int16 v9 = (void *)MEMORY[0x263F82400];
  id v10 = [MEMORY[0x263F086E0] mainBundle];
  __int16 v11 = [v10 localizedStringForKey:@"Cancel" value:&stru_270DB2A10 table:0];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __81__WTSceneHostedInputDashboardViewController_showContentWarningWithTitle_message___block_invoke;
  v18[3] = &unk_26558E3C0;
  objc_copyWeak(&v19, &location);
  id v12 = [v9 actionWithTitle:v11 style:0 handler:v18];
  [v8 addAction:v12];

  uint64_t v13 = (void *)MEMORY[0x263F82400];
  id v14 = [MEMORY[0x263F086E0] mainBundle];
  id v15 = [v14 localizedStringForKey:@"Continue" value:&stru_270DB2A10 table:0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__WTSceneHostedInputDashboardViewController_showContentWarningWithTitle_message___block_invoke_2;
  v17[3] = &unk_26558E3E8;
  v17[4] = self;
  id v16 = [v13 actionWithTitle:v15 style:0 handler:v17];
  [v8 addAction:v16];

  [(WTSceneHostedInputDashboardViewController *)self presentViewController:v8 animated:1 completion:0];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __81__WTSceneHostedInputDashboardViewController_showContentWarningWithTitle_message___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained writingToolsDelegate];
  [v1 endWritingTools];
}

void __81__WTSceneHostedInputDashboardViewController_showContentWarningWithTitle_message___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sessionUUID];
  id v4 = +[WTUIActionHostToClient actionForDidDismissInputWarningForSessionWithUUID:v2];

  v3 = [*(id *)(a1 + 32) hostingController];
  [v3 sendAction:v4];
}

- (void)showAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 buttonAction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v23 = a5;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:v11 preferredStyle:1];
  objc_initWeak(&location, self);
  id v14 = (void *)MEMORY[0x263F82400];
  id v15 = [MEMORY[0x263F086E0] mainBundle];
  id v16 = [v15 localizedStringForKey:@"Cancel" value:&stru_270DB2A10 table:0];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __97__WTSceneHostedInputDashboardViewController_showAlertWithTitle_message_buttonTitle_buttonAction___block_invoke;
  v26[3] = &unk_26558E3C0;
  objc_copyWeak(&v27, &location);
  __int16 v17 = [v14 actionWithTitle:v16 style:0 handler:v26];
  [v13 addAction:v17];

  uint64_t v18 = (void *)MEMORY[0x263F82400];
  id v19 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v20 = [v19 localizedStringForKey:@"Continue" value:&stru_270DB2A10 table:0];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __97__WTSceneHostedInputDashboardViewController_showAlertWithTitle_message_buttonTitle_buttonAction___block_invoke_2;
  v24[3] = &unk_26558E410;
  v24[4] = self;
  id v21 = v12;
  id v25 = v21;
  int v22 = [v18 actionWithTitle:v20 style:0 handler:v24];
  [v13 addAction:v22];

  [(WTSceneHostedInputDashboardViewController *)self presentViewController:v13 animated:1 completion:0];
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __97__WTSceneHostedInputDashboardViewController_showAlertWithTitle_message_buttonTitle_buttonAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained writingToolsDelegate];
  [v1 endWritingTools];
}

void __97__WTSceneHostedInputDashboardViewController_showAlertWithTitle_message_buttonTitle_buttonAction___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sessionUUID];
  id v4 = +[WTUIActionHostToClient actionForDidDismissInputWarningForSessionWithUUID:v2];

  v3 = [*(id *)(a1 + 32) hostingController];
  [v3 sendAction:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handOffFromUCBWithPrompt:(id)a3
{
  id v4 = a3;
  id v5 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v5 handOffFromUCBWithPrompt:v4];
}

- (void)writingToolsDidUpdateKeyboardPosition:(CGRect)a3 preferredContentSizeChanging:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  objc_msgSend(v9, "writingToolsDidUpdateKeyboardPosition:preferredContentSizeChanging:", v4, x, y, width, height);
}

- (void)endWritingTools
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    id v5 = "-[WTSceneHostedInputDashboardViewController endWritingTools]";
    __int16 v6 = 2112;
    id v7 = self;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v4, 0x16u);
  }

  [(WTSceneHostedInputDashboardViewController *)self endWritingToolsWithError:0];
}

- (void)undo
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    __int16 v6 = "-[WTSceneHostedInputDashboardViewController undo]";
    __int16 v7 = 2112;
    uint64_t v8 = self;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v5, 0x16u);
  }

  int v4 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v4 undo];
}

- (void)redo
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    __int16 v6 = "-[WTSceneHostedInputDashboardViewController redo]";
    __int16 v7 = 2112;
    uint64_t v8 = self;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v5, 0x16u);
  }

  int v4 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
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
    uint64_t v8 = "-[WTSceneHostedInputDashboardViewController replaceSelectionWithText:]";
    __int16 v9 = 2112;
    id v10 = self;
    __int16 v11 = 2048;
    uint64_t v12 = [v4 length];
    _os_log_impl(&dword_261BE2000, v5, OS_LOG_TYPE_INFO, "%s (%@, textLen=%lu)", (uint8_t *)&v7, 0x20u);
  }

  __int16 v6 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
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
    uint64_t v8 = "-[WTSceneHostedInputDashboardViewController copyText:]";
    __int16 v9 = 2112;
    id v10 = self;
    __int16 v11 = 2048;
    uint64_t v12 = [v4 length];
    _os_log_impl(&dword_261BE2000, v5, OS_LOG_TYPE_INFO, "%s (%@, textLen: %lu)", (uint8_t *)&v7, 0x20u);
  }

  __int16 v6 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v6 copyText:v4];
}

- (void)beginTextPlaceholder
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = _WTVCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    __int16 v6 = "-[WTSceneHostedInputDashboardViewController beginTextPlaceholder]";
    __int16 v7 = 2112;
    uint64_t v8 = self;
    _os_log_impl(&dword_261BE2000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v5, 0x16u);
  }

  id v4 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
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
    __int16 v11 = "-[WTSceneHostedInputDashboardViewController endTextPlaceholderAndWillInsertText:completion:]";
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

  uint64_t v9 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v9 endTextPlaceholderAndWillInsertText:v4 completion:v6];
}

- (void)showSmartReplyQuestionnaireWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = _WTVCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[WTSceneHostedInputDashboardViewController showSmartReplyQuestionnaireWithRect:](self, v8, x, y, width, height);
  }

  uint64_t v9 = [WTSmartReplyQuestionnaireViewController alloc];
  int v10 = [(WTSceneHostedInputDashboardViewController *)self sessionUUID];
  __int16 v11 = [(WTSmartReplyQuestionnaireViewController *)v9 initWithSessionUUID:v10];

  [(WTSmartReplyQuestionnaireViewController *)v11 setModalPresentationStyle:7];
  __int16 v12 = [(WTSceneHostedInputDashboardViewController *)self view];
  uint64_t v13 = [(WTSmartReplyQuestionnaireViewController *)v11 popoverPresentationController];
  [v13 setSourceView:v12];

  __int16 v14 = [(WTSmartReplyQuestionnaireViewController *)v11 popoverPresentationController];
  objc_msgSend(v14, "setSourceRect:", x, y, width, height);

  id v15 = [(WTSmartReplyQuestionnaireViewController *)v11 popoverPresentationController];
  [v15 setPermittedArrowDirections:2];

  uint64_t v16 = [(WTSmartReplyQuestionnaireViewController *)v11 popoverPresentationController];
  [v16 setCanOverlapSourceViewRect:1];

  [(WTSceneHostedInputDashboardViewController *)self presentViewController:v11 animated:1 completion:&__block_literal_global_0];
}

- (void)proofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5
{
  id v7 = +[WTUIActionHostToClient actionForProofreadingSessionWithUUID:a3 updateState:a4 forSuggestionWithUUID:a5];
  id v6 = [(WTSceneHostedInputDashboardViewController *)self hostingController];
  [v6 sendAction:v7];
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return 1;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  return *MEMORY[0x263F83730];
}

- (double)preferredWidthForTraitCollection:(id)a3
{
  return 500.0;
}

- (BOOL)allowsCompactAssistantBar
{
  return 0;
}

- (void)_setupSceneHosting
{
  v37[4] = *MEMORY[0x263EF8340];
  v3 = [(WTSceneHostedInputDashboardViewController *)self hostingController];

  if (!v3)
  {
    [(WTSceneHostedInputDashboardViewController *)self _beginDelayingPresentation:&__block_literal_global_17 cancellationHandler:3.0];
    __int16 v32 = [MEMORY[0x263F64598] identityForEmbeddedApplicationIdentifier:@"com.apple.WritingToolsUIService"];
    id v4 = objc_alloc(MEMORY[0x263F830A8]);
    id v5 = objc_alloc_init(MEMORY[0x263F830C0]);
    id v6 = (void *)[v4 initWithProcessIdentity:v32 sceneSpecification:v5];
    [(WTSceneHostedInputDashboardViewController *)self setHostingController:v6];

    id v7 = [(WTSceneHostedInputDashboardViewController *)self hostingController];
    uint64_t v8 = [v7 _eventDeferringComponent];
    [v8 setMaintainHostFirstResponderWhenClientWantsKeyboard:1];

    uint64_t v9 = [(WTSceneHostedInputDashboardViewController *)self startupOptions];
    uint64_t v31 = [v9 asBSActionAndReturnError:0];

    objc_initWeak(&location, self);
    int v10 = [WTUISceneHostingActivationController alloc];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __63__WTSceneHostedInputDashboardViewController__setupSceneHosting__block_invoke_2;
    v34[3] = &unk_26558E458;
    objc_copyWeak(&v35, &location);
    __int16 v11 = [(WTUISceneHostingActivationController *)v10 initWithStartupAction:v31 invalidationHandler:v34];
    __int16 v12 = [(WTSceneHostedInputDashboardViewController *)self hostingController];
    [v12 setActivationController:v11];

    uint64_t v13 = [(WTSceneHostedInputDashboardViewController *)self hostingController];
    [v13 setDelegate:self];

    __int16 v14 = [(WTSceneHostedInputDashboardViewController *)self hostingController];
    NSUInteger v33 = [v14 sceneViewController];

    [(WTSceneHostedInputDashboardViewController *)self addChildViewController:v33];
    id v15 = [v33 view];
    uint64_t v16 = [(WTSceneHostedInputDashboardViewController *)self view];
    [v16 addSubview:v15];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    __int16 v24 = (void *)MEMORY[0x263F08938];
    __int16 v30 = [v15 leadingAnchor];
    uint64_t v29 = [v16 leadingAnchor];
    __int16 v28 = [v30 constraintEqualToAnchor:v29];
    v37[0] = v28;
    id v27 = [v15 trailingAnchor];
    __int16 v26 = [v16 trailingAnchor];
    id v25 = [v27 constraintEqualToAnchor:v26];
    v37[1] = v25;
    __int16 v17 = [v15 topAnchor];
    uint64_t v18 = [v16 topAnchor];
    id v19 = [v17 constraintEqualToAnchor:v18];
    v37[2] = v19;
    uint64_t v20 = [v15 bottomAnchor];
    id v21 = [v16 bottomAnchor];
    int v22 = [v20 constraintEqualToAnchor:v21];
    v37[3] = v22;
    id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
    [v24 activateConstraints:v23];

    [v33 didMoveToParentViewController:self];
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
}

uint64_t __63__WTSceneHostedInputDashboardViewController__setupSceneHosting__block_invoke()
{
  return 0;
}

void __63__WTSceneHostedInputDashboardViewController__setupSceneHosting__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained writingToolsDelegate];
  [v1 endWritingToolsWithError:0];
}

- (void)enrollmentBegan
{
  id v2 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v2 enrollmentBegan];
}

- (void)enrollmentDismissed
{
  id v2 = [(WTSceneHostedInputDashboardViewController *)self writingToolsDelegate];
  [v2 enrollmentDismissed];
}

- (_UISceneHostingController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
}

- (WTWritingToolsDelegate_Internal)writingToolsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_writingToolsDelegate);

  return (WTWritingToolsDelegate_Internal *)WeakRetained;
}

- (void)setWritingToolsDelegate:(id)a3
{
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (_TtC14WritingToolsUI16WTStartupOptions)startupOptions
{
  return (_TtC14WritingToolsUI16WTStartupOptions *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setStartupOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startupOptions, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_destroyWeak((id *)&self->_writingToolsDelegate);

  objc_storeStrong((id *)&self->_hostingController, 0);
}

- (void)showSmartReplyQuestionnaireWithRect:(CGFloat)a3 .cold.1(void *a1, NSObject *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  __int16 v12 = [a1 sessionUUID];
  v23.origin.CGFloat x = a3;
  v23.origin.CGFloat y = a4;
  v23.size.CGFloat width = a5;
  v23.size.CGFloat height = a6;
  uint64_t v13 = NSStringFromCGRect(v23);
  int v14 = 136315906;
  id v15 = "-[WTSceneHostedInputDashboardViewController showSmartReplyQuestionnaireWithRect:]";
  __int16 v16 = 2112;
  __int16 v17 = a1;
  __int16 v18 = 2112;
  id v19 = v12;
  __int16 v20 = 2112;
  id v21 = v13;
  _os_log_debug_impl(&dword_261BE2000, a2, OS_LOG_TYPE_DEBUG, "%s (%@, sessionUUID: %@, rect: %@)", (uint8_t *)&v14, 0x2Au);
}

@end