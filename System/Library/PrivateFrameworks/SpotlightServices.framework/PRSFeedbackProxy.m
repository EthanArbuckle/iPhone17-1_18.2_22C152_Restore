@interface PRSFeedbackProxy
- (OS_dispatch_queue)feedbackQueue;
- (PARSession)listener;
- (PRSFeedbackProxy)init;
- (void)cardViewDidAppear:(id)a3;
- (void)cardViewDidDisappear:(id)a3;
- (void)didAppendLateSections:(id)a3;
- (void)didClearInput:(id)a3;
- (void)didEndSearch:(id)a3;
- (void)didEngageCardSection:(id)a3;
- (void)didEngageResult:(id)a3;
- (void)didEngageSection:(id)a3;
- (void)didEngageSuggestion:(id)a3;
- (void)didErrorOccur:(id)a3;
- (void)didGradeResultRelevancy:(id)a3;
- (void)didPerformCommand:(id)a3;
- (void)didRankSections:(id)a3;
- (void)didReceiveResultsAfterTimeout:(id)a3;
- (void)didReportUserResponseFeedback:(id)a3;
- (void)didStartSearch:(id)a3;
- (void)reportFeedback:(id)a3 queryId:(int64_t)a4;
- (void)resultsDidBecomeVisible:(id)a3;
- (void)searchViewDidAppear:(id)a3;
- (void)searchViewDidDisappear:(id)a3;
- (void)sectionHeaderDidBecomeVisible:(id)a3;
- (void)sendCustomFeedback:(id)a3;
- (void)sendCustomFeedback:(id)a3 clientID:(id)a4;
- (void)sendFeedback:(id)a3;
- (void)sendFeedback:(id)a3 queryId:(unint64_t)a4;
- (void)setFeedbackQueue:(id)a3;
- (void)setListener:(id)a3;
- (void)suggestionsDidBecomeVisible:(id)a3;
@end

@implementation PRSFeedbackProxy

- (PRSFeedbackProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)PRSFeedbackProxy;
  v2 = [(PRSFeedbackProxy *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.spotlight.PRSFeedbackProxy", v4);
    [(PRSFeedbackProxy *)v2 setFeedbackQueue:v5];
  }
  return v2;
}

- (void)searchViewDidAppear:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)searchViewDidDisappear:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)cardViewDidDisappear:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)didStartSearch:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  if (objc_opt_respondsToSelector()) {
    [(PRSFeedbackProxy *)self sendFeedback:v5];
  }
}

- (void)didEndSearch:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  if (objc_opt_respondsToSelector()) {
    [(PRSFeedbackProxy *)self sendFeedback:v5];
  }
}

- (void)didRankSections:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)didEngageResult:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)didEngageSuggestion:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)didEngageCardSection:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)didErrorOccur:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  if (objc_opt_respondsToSelector()) {
    [(PRSFeedbackProxy *)self sendFeedback:v5];
  }
}

- (void)sendCustomFeedback:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  if (objc_opt_respondsToSelector()) {
    [(PRSFeedbackProxy *)self sendFeedback:v5];
  }
}

- (void)resultsDidBecomeVisible:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)suggestionsDidBecomeVisible:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)didReceiveResultsAfterTimeout:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)didAppendLateSections:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)didClearInput:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)sectionHeaderDidBecomeVisible:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)cardViewDidAppear:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)didPerformCommand:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [(PRSFeedbackProxy *)self sendFeedback:v7 queryId:a4];
    }
  }
}

- (void)sendFeedback:(id)a3
{
}

- (void)sendFeedback:(id)a3 queryId:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(PRSFeedbackProxy *)self feedbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PRSFeedbackProxy_sendFeedback_queryId___block_invoke;
  block[3] = &unk_1E634D088;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __41__PRSFeedbackProxy_sendFeedback_queryId___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) listener];
  v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = v2;
  if (!v3)
  {
    uint64_t v3 = [v4 queryId];
    v2 = v5;
  }
  [v2 reportFeedback:v4 queryId:v3];
}

- (void)sendCustomFeedback:(id)a3 clientID:(id)a4
{
  id v5 = a3;
  -[PRSFeedbackProxy reportFeedback:queryId:](self, "reportFeedback:queryId:", v5, [v5 queryId]);
}

- (void)didReportUserResponseFeedback:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)didGradeResultRelevancy:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (void)didEngageSection:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();
}

- (PARSession)listener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  return (PARSession *)WeakRetained;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)feedbackQueue
{
  return self->_feedbackQueue;
}

- (void)setFeedbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackQueue, 0);
  objc_destroyWeak((id *)&self->_listener);
}

@end