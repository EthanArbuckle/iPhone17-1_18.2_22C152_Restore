@interface SUUIErrorDocumentViewController
- (SUUIErrorDocumentViewController)initWithBackgroundColor:(id)a3 clientContext:(id)a4;
- (id)retryActionBlock;
- (void)loadView;
- (void)setRetryActionBlock:(id)a3;
@end

@implementation SUUIErrorDocumentViewController

- (SUUIErrorDocumentViewController)initWithBackgroundColor:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SUUIErrorDocumentViewController;
  v8 = [(SUUIErrorDocumentViewController *)&v11 init];
  if (v8)
  {
    unint64_t v9 = SUUIColorSchemeStyleForColor(v6);
    if (v9 <= 3) {
      v8->_contentUnavailableStyle = qword_2568A13D8[v9];
    }
    objc_storeStrong((id *)&v8->_clientContext, a4);
  }

  return v8;
}

- (void)loadView
{
  SUUIErrorDocumentTitle(self->_clientContext);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc(MEMORY[0x263F82EF0]);
  v4 = objc_msgSend(v3, "initWithFrame:title:style:", v9, self->_contentUnavailableStyle, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = [(SUUIErrorDocumentViewController *)self retryActionBlock];

  if (v5)
  {
    [v4 setMessage:&stru_2704F8130];
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"NETWORK_ERROR_BUTTON_RETRY"];
    }
    else {
    id v7 = +[SUUIClientContext localizedStringForKey:@"NETWORK_ERROR_BUTTON_RETRY" inBundles:0];
    }
    [v4 setButtonTitle:v7];

    v8 = [(SUUIErrorDocumentViewController *)self retryActionBlock];
    [v4 setButtonAction:v8];
  }
  [(SUUIErrorDocumentViewController *)self setView:v4];
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

@end