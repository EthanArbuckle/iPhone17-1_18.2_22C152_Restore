@interface SearchUIStoreViewController
- (SFFeedbackListener)feedbackListener;
- (SearchUIStoreViewController)initWithIdentifier:(id)a3 feedbackListener:(id)a4 queryId:(unint64_t)a5;
- (unint64_t)queryId;
- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)setFeedbackListener:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SearchUIStoreViewController

- (SearchUIStoreViewController)initWithIdentifier:(id)a3 feedbackListener:(id)a4 queryId:(unint64_t)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIStoreViewController;
  v10 = [(SearchUIStoreViewController *)&v16 init];
  v11 = v10;
  if (v10)
  {
    [(SearchUIStoreViewController *)v10 setFeedbackListener:v9];
    v12 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v17 = *MEMORY[0x1E4F3C3A8];
    v18[0] = v8;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v14 = [v12 dictionaryWithDictionary:v13];

    [v14 setObject:*MEMORY[0x1E4F3C350] forKeyedSubscript:*MEMORY[0x1E4F3C398]];
    [(SKStoreProductViewController *)v11 setDelegate:v11];
    [(SKStoreProductViewController *)v11 loadProductWithParameters:v14 completionBlock:0];
    [(SearchUIStoreViewController *)v11 setQueryId:a5];
  }
  return v11;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIStoreViewController;
  [(SKStoreProductViewController *)&v7 viewDidDisappear:a3];
  v4 = [(SearchUIStoreViewController *)self feedbackListener];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(SearchUIStoreViewController *)self feedbackListener];
    [v6 willDismissViewController:self];
  }
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  v6 = SearchUIGeneralLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1E45B5000, v6, OS_LOG_TYPE_DEFAULT, "dismissing storevc", v13, 2u);
  }

  [(SKStoreProductViewController *)self dismissViewControllerAnimated:1 completion:0];
  objc_super v7 = [(SearchUIStoreViewController *)self feedbackListener];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    if ((unint64_t)a4 > 1)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F9A478]) initWithProductPageResult:a4];
    }
    else
    {
      if (a4 == 1) {
        uint64_t v9 = 7;
      }
      else {
        uint64_t v9 = 4;
      }
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F99F48]) initWithEvent:v9];
    }
    v11 = (void *)v10;
    v12 = [(SearchUIStoreViewController *)self feedbackListener];
    objc_msgSend(v12, "reportFeedback:queryId:", v11, -[SearchUIStoreViewController queryId](self, "queryId"));
  }
}

- (SFFeedbackListener)feedbackListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackListener);
  return (SFFeedbackListener *)WeakRetained;
}

- (void)setFeedbackListener:(id)a3
{
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (void).cxx_destruct
{
}

@end