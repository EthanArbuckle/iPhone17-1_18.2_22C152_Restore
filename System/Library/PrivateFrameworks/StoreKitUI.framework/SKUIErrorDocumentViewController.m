@interface SKUIErrorDocumentViewController
- (SKUIErrorDocumentViewController)initWithBackgroundColor:(id)a3 clientContext:(id)a4;
- (id)retryActionBlock;
- (void)loadView;
- (void)setRetryActionBlock:(id)a3;
@end

@implementation SKUIErrorDocumentViewController

- (SKUIErrorDocumentViewController)initWithBackgroundColor:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIErrorDocumentViewController initWithBackgroundColor:clientContext:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIErrorDocumentViewController;
  v8 = [(SKUIErrorDocumentViewController *)&v11 init];
  if (v8)
  {
    unint64_t v9 = SKUIColorSchemeStyleForColor(v6);
    if (v9 <= 3) {
      v8->_contentUnavailableStyle = qword_1C1CCB270[v9];
    }
    objc_storeStrong((id *)&v8->_clientContext, a4);
  }

  return v8;
}

- (void)loadView
{
  SKUIErrorDocumentTitle(self->_clientContext);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc(MEMORY[0x1E4FB2070]);
  v4 = objc_msgSend(v3, "initWithFrame:title:style:", v9, self->_contentUnavailableStyle, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = [(SKUIErrorDocumentViewController *)self retryActionBlock];

  if (v5)
  {
    [v4 setMessage:&stru_1F1C879E8];
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"NETWORK_ERROR_BUTTON_RETRY"];
    }
    else {
    id v7 = +[SKUIClientContext localizedStringForKey:@"NETWORK_ERROR_BUTTON_RETRY" inBundles:0];
    }
    [v4 setButtonTitle:v7];

    v8 = [(SKUIErrorDocumentViewController *)self retryActionBlock];
    [v4 setButtonAction:v8];
  }
  [(SKUIErrorDocumentViewController *)self setView:v4];
}

- (id)retryActionBlock
{
  return self->_retryActionBlock;
}

- (void)setRetryActionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryActionBlock, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithBackgroundColor:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIErrorDocumentViewController initWithBackgroundColor:clientContext:]";
}

@end