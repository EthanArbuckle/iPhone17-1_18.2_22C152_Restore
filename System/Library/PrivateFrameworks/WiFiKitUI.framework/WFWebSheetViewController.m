@interface WFWebSheetViewController
- (BOOL)wantsModalPresentation;
- (WFRemoteWebSheetViewController)remoteViewController;
- (WFWebSheetViewController)initWithDelegate:(id)a3;
- (WFWebSheetViewControllerDelegate)delegate;
- (_UIAsyncInvocation)cancelServiceInvocation;
- (void)_finishSetupWithError:(id)a3;
- (void)_requestRemoteViewController;
- (void)_showRemoteViewController;
- (void)dealloc;
- (void)remoteWebSheetViewController:(id)a3 handleEvent:(unint64_t)a4 context:(id)a5;
- (void)setCancelServiceInvocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)webSheetViewControllerServiceShouldTerminate;
@end

@implementation WFWebSheetViewController

- (WFWebSheetViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFWebSheetViewController;
  v5 = [(WFWebSheetViewController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(WFWebSheetViewController *)v6 _requestRemoteViewController];
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(WFWebSheetViewController *)self cancelServiceInvocation];

  if (v3)
  {
    id v4 = [(WFWebSheetViewController *)self cancelServiceInvocation];
    id v5 = (id)[v4 invoke];
  }
  v6.receiver = self;
  v6.super_class = (Class)WFWebSheetViewController;
  [(WFWebSheetViewController *)&v6 dealloc];
}

- (void)_requestRemoteViewController
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__WFWebSheetViewController__requestRemoteViewController__block_invoke;
  v4[3] = &unk_264756D60;
  v4[4] = self;
  v3 = +[WFRemoteWebSheetViewController requestViewControllerWithConnectionHandler:v4];
  [(WFWebSheetViewController *)self setCancelServiceInvocation:v3];
}

void __56__WFWebSheetViewController__requestRemoteViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[WFWebSheetViewController _requestRemoteViewController]_block_invoke";
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_2257EC000, v7, v8, "%s: vc %@ error %@", buf, 0x20u);
  }

  if (v5)
  {
    [*(id *)(a1 + 32) setRemoteViewController:v5];
    v9 = *(void **)(a1 + 32);
    v10 = [v9 remoteViewController];
    [v10 setDelegate:v9];

    [*(id *)(a1 + 32) _showRemoteViewController];
  }
  else
  {
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08608];
    id v15 = v6;
    v12 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v13 = [v11 errorWithDomain:@"com.apple.wifi" code:100 userInfo:v12];

    [*(id *)(a1 + 32) _finishSetupWithError:v13];
  }
}

- (void)_finishSetupWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v12 = 136315394;
    v13 = "-[WFWebSheetViewController _finishSetupWithError:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: error %@", (uint8_t *)&v12, 0x16u);
  }

  v7 = [(WFWebSheetViewController *)self presentingViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];

  [(WFWebSheetViewController *)self _endDelayingPresentation];
  os_log_type_t v8 = [(WFWebSheetViewController *)self remoteViewController];
  [(WFWebSheetViewController *)self removeChildViewController:v8];

  [(WFWebSheetViewController *)self setRemoteViewController:0];
  v9 = [(WFWebSheetViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(WFWebSheetViewController *)self delegate];
    [v11 webSheetViewController:self didTerminateWithError:v4];
  }
}

- (void)_showRemoteViewController
{
  v3 = [(WFWebSheetViewController *)self remoteViewController];
  [(WFWebSheetViewController *)self addChildViewController:v3];

  id v4 = [(WFWebSheetViewController *)self remoteViewController];
  id v8 = [v4 view];

  id v5 = [(WFWebSheetViewController *)self view];
  [v5 addSubview:v8];

  os_log_type_t v6 = [(WFWebSheetViewController *)self view];
  [v6 frame];
  objc_msgSend(v8, "setFrame:");

  v7 = [(WFWebSheetViewController *)self remoteViewController];
  [v7 didMoveToParentViewController:self];
}

- (void)webSheetViewControllerServiceShouldTerminate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v9 = 136315138;
    char v10 = "-[WFWebSheetViewController webSheetViewControllerServiceShouldTerminate]";
    _os_log_impl(&dword_2257EC000, v3, v4, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v5 = [(WFWebSheetViewController *)self cancelServiceInvocation];
  id v6 = (id)[v5 invoke];

  v7 = [(WFWebSheetViewController *)self remoteViewController];
  id v8 = (id)[v7 disconnect];
}

- (void)remoteWebSheetViewController:(id)a3 handleEvent:(unint64_t)a4 context:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = WFLogForCategory(0);
  os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v8 && os_log_type_enabled(v8, v9))
  {
    int v24 = 136315650;
    v25 = "-[WFWebSheetViewController remoteWebSheetViewController:handleEvent:context:]";
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_2257EC000, v8, v9, "%s: event %lu context %@", (uint8_t *)&v24, 0x20u);
  }

  switch(a4)
  {
    case 0uLL:
      char v10 = [(WFWebSheetViewController *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        int v12 = [(WFWebSheetViewController *)self delegate];
        [v12 webSheetViewControllerContentDidFinishLoading:self];
        goto LABEL_18;
      }
      break;
    case 1uLL:
      v13 = [(WFWebSheetViewController *)self delegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        int v12 = [(WFWebSheetViewController *)self delegate];
        [v12 webSheetViewControllerContentReadyForPresentation:self];
        goto LABEL_18;
      }
      break;
    case 2uLL:
      id v15 = [(WFWebSheetViewController *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        int v12 = [(WFWebSheetViewController *)self delegate];
        [v12 webSheetViewControllerContentDidStartLoading:self];
        goto LABEL_18;
      }
      break;
    case 3uLL:
      if (v7)
      {
        int v12 = [v7 error];
      }
      else
      {
        int v12 = 0;
      }
      v17 = [(WFWebSheetViewController *)self delegate];
      char v18 = objc_opt_respondsToSelector();

      if (v18)
      {
        id v19 = [(WFWebSheetViewController *)self delegate];
        [v19 webSheetViewController:self didTerminateWithError:v12];
      }
      __int16 v20 = [(WFWebSheetViewController *)self cancelServiceInvocation];
      id v21 = (id)[v20 invoke];

      uint64_t v22 = [(WFWebSheetViewController *)self remoteViewController];
      id v23 = (id)[v22 disconnect];

LABEL_18:
      break;
    default:
      break;
  }
}

- (BOOL)wantsModalPresentation
{
  return 1;
}

- (_UIAsyncInvocation)cancelServiceInvocation
{
  return self->_cancelServiceInvocation;
}

- (void)setCancelServiceInvocation:(id)a3
{
}

- (WFRemoteWebSheetViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (WFWebSheetViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWebSheetViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelServiceInvocation, 0);
}

@end