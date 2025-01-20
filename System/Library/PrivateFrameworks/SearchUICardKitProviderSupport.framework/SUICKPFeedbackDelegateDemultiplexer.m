@interface SUICKPFeedbackDelegateDemultiplexer
- (BOOL)shouldHandleCardSectionEngagement:(id)a3;
- (NSMutableDictionary)feedbackDelegatesByCardSectionIdentifiers;
- (NSMutableDictionary)feedbackDelegatesByCardSectionViewIds;
- (SUICKPFeedbackDelegateDemultiplexer)init;
- (SearchUIFeedbackDelegate)defaultDelegate;
- (VRXInteractionDelegate)snippetUIDelegate;
- (id)_delegateForFeedback:(id)a3;
- (id)_delegateForView:(id)a3;
- (void)cardSectionViewDidInvalidateSize:(id)a3;
- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4;
- (void)cardSectionViewDidSelectPreferredPunchoutIndex:(int64_t)a3;
- (void)cardViewDidAppear:(id)a3;
- (void)cardViewDidDisappear:(id)a3;
- (void)didEngageCardSection:(id)a3;
- (void)didErrorOccur:(id)a3;
- (void)didPerformCommand:(id)a3;
- (void)didReportUserResponseFeedback:(id)a3;
- (void)emitInstrumentationEvent:(id)a3;
- (void)presentViewController:(id)a3;
- (void)presentViewControllerForCard:(id)a3 animate:(BOOL)a4;
- (void)reportFeedback:(id)a3 queryId:(int64_t)a4;
- (void)sendCustomFeedback:(id)a3;
- (void)setDefaultDelegate:(id)a3;
- (void)setSnippetUIDelegate:(id)a3;
- (void)willDismissViewController:(id)a3;
@end

@implementation SUICKPFeedbackDelegateDemultiplexer

- (SUICKPFeedbackDelegateDemultiplexer)init
{
  v11.receiver = self;
  v11.super_class = (Class)SUICKPFeedbackDelegateDemultiplexer;
  v2 = [(SUICKPFeedbackDelegateDemultiplexer *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    feedbackDelegatesByCardSectionIdentifiers = v2->_feedbackDelegatesByCardSectionIdentifiers;
    v2->_feedbackDelegatesByCardSectionIdentifiers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    feedbackDelegatesByCardSectionViewIds = v2->_feedbackDelegatesByCardSectionViewIds;
    v2->_feedbackDelegatesByCardSectionViewIds = v5;

    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.siri.cardKit.FeedbackDelegateDemultiplexer.serialInstrumentationFeedbackQueue", v7);
    serialInstrumentationFeedbackQueue = v2->_serialInstrumentationFeedbackQueue;
    v2->_serialInstrumentationFeedbackQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    serialInstrumentationFeedbackQueue = self->_serialInstrumentationFeedbackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__SUICKPFeedbackDelegateDemultiplexer_emitInstrumentationEvent___block_invoke;
    block[3] = &unk_26490F7A8;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(serialInstrumentationFeedbackQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __64__SUICKPFeedbackDelegateDemultiplexer_emitInstrumentationEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    v3 = [WeakRetained snippetUIDelegate];

    id WeakRetained = v7;
    if (v3)
    {
      id v4 = [v7 snippetUIDelegate];
      char v5 = objc_opt_respondsToSelector();

      id WeakRetained = v7;
      if (v5)
      {
        v6 = [v7 snippetUIDelegate];
        [v6 emitInstrumentationEvent:*(void *)(a1 + 32)];

        id WeakRetained = v7;
      }
    }
  }
}

- (id)_delegateForFeedback:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    feedbackDelegatesByCardSectionIdentifiers = self->_feedbackDelegatesByCardSectionIdentifiers;
    v6 = (void *)MEMORY[0x263F316B0];
    id v7 = [v4 cardSection];
    id v8 = [v6 cardSectionWithSFCardSection:v7];
    v9 = [v8 cardSectionIdentifier];
    v10 = [(NSMutableDictionary *)feedbackDelegatesByCardSectionIdentifiers objectForKey:v9];
    defaultDelegate = v10;
    if (!v10) {
      defaultDelegate = self->_defaultDelegate;
    }
    v12 = defaultDelegate;
  }
  else
  {
    v12 = self->_defaultDelegate;
  }

  return v12;
}

- (id)_delegateForView:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26DFA9A88])
  {
    feedbackDelegatesByCardSectionViewIds = self->_feedbackDelegatesByCardSectionViewIds;
    v6 = [v4 cardSectionViewIdentifier];
    id v7 = [(NSMutableDictionary *)feedbackDelegatesByCardSectionViewIds objectForKey:v6];
    defaultDelegate = v7;
    if (!v7) {
      defaultDelegate = self->_defaultDelegate;
    }
    v9 = defaultDelegate;
  }
  else
  {
    v9 = self->_defaultDelegate;
  }

  return v9;
}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(SUICKPFeedbackDelegateDemultiplexer *)self _delegateForFeedback:v6];
  id v8 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2048;
    int64_t v12 = a4;
    _os_log_impl(&dword_22C0E8000, v8, OS_LOG_TYPE_INFO, "Report feedback: %@ with queryId %lld", (uint8_t *)&v9, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [v7 reportFeedback:v6 queryId:a4];
  }
}

- (void)cardViewDidDisappear:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(SUICKPFeedbackDelegateDemultiplexer *)self _delegateForFeedback:v4];
  id v6 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22C0E8000, v6, OS_LOG_TYPE_INFO, "Card did disappear with feedback: %@", (uint8_t *)&v7, 0xCu);
  }
  if (objc_opt_respondsToSelector()) {
    [v5 cardViewDidDisappear:v4];
  }
}

- (void)cardViewDidAppear:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(SUICKPFeedbackDelegateDemultiplexer *)self _delegateForFeedback:v4];
  id v6 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22C0E8000, v6, OS_LOG_TYPE_INFO, "Card did appear with feedback: %@", (uint8_t *)&v7, 0xCu);
  }
  if (objc_opt_respondsToSelector()) {
    [v5 cardViewDidAppear:v4];
  }
}

- (void)didEngageCardSection:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(SUICKPFeedbackDelegateDemultiplexer *)self _delegateForFeedback:v4];
  id v6 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_22C0E8000, v6, OS_LOG_TYPE_INFO, "Card section engaged with feedback: %@  listener: %@", (uint8_t *)&v7, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [v5 didEngageCardSection:v4];
  }
}

- (void)didPerformCommand:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(SUICKPFeedbackDelegateDemultiplexer *)self _delegateForFeedback:v4];
  id v6 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_22C0E8000, v6, OS_LOG_TYPE_INFO, "Command performed with feedback: %@  listener: %@", (uint8_t *)&v7, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [v5 didPerformCommand:v4];
  }
}

- (void)didReportUserResponseFeedback:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(SUICKPFeedbackDelegateDemultiplexer *)self _delegateForFeedback:v4];
  id v6 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22C0E8000, v6, OS_LOG_TYPE_INFO, "Report user response feedback: %@", (uint8_t *)&v7, 0xCu);
  }
  if (objc_opt_respondsToSelector()) {
    [v5 didReportUserResponseFeedback:v4];
  }
}

- (void)didErrorOccur:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(SUICKPFeedbackDelegateDemultiplexer *)self _delegateForFeedback:v4];
  id v6 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22C0E8000, v6, OS_LOG_TYPE_INFO, "Error occured: %@", (uint8_t *)&v7, 0xCu);
  }
  if (objc_opt_respondsToSelector()) {
    [v5 didErrorOccur:v4];
  }
}

- (void)sendCustomFeedback:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(SUICKPFeedbackDelegateDemultiplexer *)self _delegateForFeedback:v4];
  id v6 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22C0E8000, v6, OS_LOG_TYPE_INFO, "Sending custom feedback: %@", (uint8_t *)&v7, 0xCu);
  }
  if (objc_opt_respondsToSelector()) {
    [v5 sendCustomFeedback:v4];
  }
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v4 = a3;
  char v5 = [(SUICKPFeedbackDelegateDemultiplexer *)self _delegateForFeedback:v4];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 shouldHandleCardSectionEngagement:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  char v6 = -[SUICKPFeedbackDelegateDemultiplexer _delegateForView:](self, "_delegateForView:");
  if (objc_opt_respondsToSelector()) {
    [v6 cardSectionViewDidInvalidateSize:v7 animate:v4];
  }
}

- (void)presentViewController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(SearchUIFeedbackDelegate *)self->_defaultDelegate presentViewController:v4];
  }
}

- (void)willDismissViewController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(SearchUIFeedbackDelegate *)self->_defaultDelegate willDismissViewController:v4];
  }
}

- (void)cardSectionViewDidInvalidateSize:(id)a3
{
}

- (void)cardSectionViewDidSelectPreferredPunchoutIndex:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    defaultDelegate = self->_defaultDelegate;
    [(SearchUIFeedbackDelegate *)defaultDelegate cardSectionViewDidSelectPreferredPunchoutIndex:a3];
  }
}

- (void)presentViewControllerForCard:(id)a3 animate:(BOOL)a4
{
  id v5 = a3;
  if (objc_opt_respondsToSelector()) {
    [(SearchUIFeedbackDelegate *)self->_defaultDelegate presentViewControllerForCard:v5 animate:1];
  }
}

- (NSMutableDictionary)feedbackDelegatesByCardSectionIdentifiers
{
  return self->_feedbackDelegatesByCardSectionIdentifiers;
}

- (NSMutableDictionary)feedbackDelegatesByCardSectionViewIds
{
  return self->_feedbackDelegatesByCardSectionViewIds;
}

- (SearchUIFeedbackDelegate)defaultDelegate
{
  return self->_defaultDelegate;
}

- (void)setDefaultDelegate:(id)a3
{
}

- (VRXInteractionDelegate)snippetUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetUIDelegate);
  return (VRXInteractionDelegate *)WeakRetained;
}

- (void)setSnippetUIDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snippetUIDelegate);
  objc_storeStrong((id *)&self->_defaultDelegate, 0);
  objc_storeStrong((id *)&self->_feedbackDelegatesByCardSectionViewIds, 0);
  objc_storeStrong((id *)&self->_feedbackDelegatesByCardSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_serialInstrumentationFeedbackQueue, 0);
}

@end