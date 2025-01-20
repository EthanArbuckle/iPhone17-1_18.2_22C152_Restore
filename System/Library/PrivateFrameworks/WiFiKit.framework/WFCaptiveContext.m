@interface WFCaptiveContext
- (BOOL)readyForPresentation;
- (NSTimer)timer;
- (WFCaptiveContext)init;
- (WFNetworkListRecord)network;
- (WFWebSheetViewController)webSheetViewController;
- (id)completionHandler;
- (id)readyForPresentationHandler;
- (int64_t)requestedFields;
- (void)_presentationTimerFired:(id)a3;
- (void)_readyForPresentation:(id)a3;
- (void)cancel;
- (void)setCompletionHandler:(id)a3;
- (void)setReadyForPresentation:(BOOL)a3;
- (void)setReadyForPresentationHandler:(id)a3;
- (void)setTimer:(id)a3;
- (void)setWebSheetViewController:(id)a3;
- (void)webSheetViewController:(id)a3 didTerminateWithError:(id)a4;
- (void)webSheetViewControllerContentReadyForPresentation:(id)a3;
@end

@implementation WFCaptiveContext

- (WFCaptiveContext)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)WFCaptiveContext;
  v2 = [(WFCaptiveContext *)&v10 init];
  uint64_t v3 = [objc_alloc(MEMORY[0x263F863F8]) initWithDelegate:v2];
  webSheetViewController = v2->_webSheetViewController;
  v2->_webSheetViewController = (WFWebSheetViewController *)v3;

  if (v2->_webSheetViewController)
  {
    uint64_t v5 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:v2 target:sel__presentationTimerFired_ selector:0 userInfo:0 repeats:10.0];
    timer = v2->_timer;
    v2->_timer = (NSTimer *)v5;
  }
  else
  {
    v8 = WFLogForCategory(2uLL);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFCaptiveContext init]";
      _os_log_impl(&dword_226071000, v8, v9, "%s: web sheet view controller is nil", buf, 0xCu);
    }

    timer = v2;
    v2 = 0;
  }

  return v2;
}

- (void)cancel
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = WFLogForCategory(2uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    v7 = "-[WFCaptiveContext cancel]";
    _os_log_impl(&dword_226071000, v3, v4, "%s", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = [(WFCaptiveContext *)self completionHandler];
  v5[2]();
}

- (void)_presentationTimerFired:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(WFCaptiveContext *)self readyForPresentation])
  {
    os_log_type_t v4 = WFLogForCategory(2uLL);
    os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4)
    {
      int v6 = v4;
      if (os_log_type_enabled(v6, v5))
      {
        v7 = [(WFCaptiveContext *)self webSheetViewController];
        int v9 = 136315394;
        objc_super v10 = "-[WFCaptiveContext _presentationTimerFired:]";
        __int16 v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_226071000, v6, v5, "%s: presenting view controller %@", (uint8_t *)&v9, 0x16u);
      }
    }

    uint64_t v8 = [(WFCaptiveContext *)self webSheetViewController];
    [(WFCaptiveContext *)self _readyForPresentation:v8];
  }
}

- (void)_readyForPresentation:(id)a3
{
  id v4 = a3;
  os_log_type_t v5 = [(WFCaptiveContext *)self readyForPresentationHandler];
  ((void (**)(void, id))v5)[2](v5, v4);

  int v6 = [(WFCaptiveContext *)self timer];
  [v6 invalidate];

  [(WFCaptiveContext *)self setTimer:0];
}

- (void)webSheetViewControllerContentReadyForPresentation:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = WFLogForCategory(2uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[WFCaptiveContext webSheetViewControllerContentReadyForPresentation:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s: viewController %@", (uint8_t *)&v7, 0x16u);
  }

  [(WFCaptiveContext *)self _readyForPresentation:v4];
}

- (void)webSheetViewController:(id)a3 didTerminateWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_log_type_t v6 = WFLogForCategory(2uLL);
  os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    int v8 = 136315394;
    __int16 v9 = "-[WFCaptiveContext webSheetViewController:didTerminateWithError:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_226071000, v6, v7, "%s: error %@", (uint8_t *)&v8, 0x16u);
  }

  [(WFCaptiveContext *)self cancel];
}

- (WFNetworkListRecord)network
{
  return self->network;
}

- (int64_t)requestedFields
{
  return self->requestedFields;
}

- (id)readyForPresentationHandler
{
  return self->_readyForPresentationHandler;
}

- (void)setReadyForPresentationHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (WFWebSheetViewController)webSheetViewController
{
  return self->_webSheetViewController;
}

- (void)setWebSheetViewController:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)readyForPresentation
{
  return self->_readyForPresentation;
}

- (void)setReadyForPresentation:(BOOL)a3
{
  self->_readyForPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_webSheetViewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_readyForPresentationHandler, 0);
  objc_storeStrong((id *)&self->network, 0);
}

@end