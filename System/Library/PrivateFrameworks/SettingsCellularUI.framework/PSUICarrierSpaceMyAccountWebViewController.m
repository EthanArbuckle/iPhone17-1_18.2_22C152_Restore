@interface PSUICarrierSpaceMyAccountWebViewController
- (NSURL)myAccountURL;
- (PSUICarrierSpaceMyAccountWebViewController)initWithURLString:(id)a3;
- (PSUICarrierSpaceMyAccountWebViewController)initWithWebView:(id)a3 url:(id)a4;
- (UIBarButtonItem)cancelButton;
- (WKWebView)webView;
- (void)addCancelButton;
- (void)dismissMyAccount;
- (void)loadView;
- (void)setCancelButton:(id)a3;
- (void)setMyAccountURL:(id)a3;
- (void)setWebView:(id)a3;
- (void)viewDidLoad;
@end

@implementation PSUICarrierSpaceMyAccountWebViewController

- (PSUICarrierSpaceMyAccountWebViewController)initWithURLString:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSUICarrierSpaceMyAccountWebViewController;
  v5 = [(PSUICarrierSpaceMyAccountWebViewController *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [NSURL URLWithString:v4];
    myAccountURL = v5->_myAccountURL;
    v5->_myAccountURL = (NSURL *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v5 action:sel_dismissMyAccount];
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (UIBarButtonItem *)v8;
  }
  return v5;
}

- (PSUICarrierSpaceMyAccountWebViewController)initWithWebView:(id)a3 url:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PSUICarrierSpaceMyAccountWebViewController;
  v9 = [(PSUICarrierSpaceMyAccountWebViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webView, a3);
    objc_storeStrong((id *)&v10->_myAccountURL, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v10 action:sel_dismissMyAccount];
    cancelButton = v10->_cancelButton;
    v10->_cancelButton = (UIBarButtonItem *)v11;
  }
  return v10;
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)PSUICarrierSpaceMyAccountWebViewController;
  [(PSUICarrierSpaceMyAccountWebViewController *)&v11 loadView];
  [(PSUICarrierSpaceMyAccountWebViewController *)self addCancelButton];
  if (!self->_webView)
  {
    id v5 = objc_alloc(MEMORY[0x263F1FA58]);
    uint64_t v6 = [(PSUICarrierSpaceMyAccountWebViewController *)self view];
    [v6 bounds];
    id v7 = (WKWebView *)objc_msgSend(v5, "initWithFrame:");
    webView = self->_webView;
    self->_webView = v7;

    v9 = [(WKWebView *)self->_webView scrollView];
    v10 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
    [v9 setBackgroundColor:v10];

    goto LABEL_5;
  }
  v3 = [(PSUICarrierSpaceMyAccountWebViewController *)self view];
  id v4 = self->_webView;

  if (v3 != v4) {
LABEL_5:
  }
    [(PSUICarrierSpaceMyAccountWebViewController *)self setView:self->_webView];
}

- (void)dismissMyAccount
{
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PSUICarrierSpaceMyAccountWebViewController;
  [(PSUICarrierSpaceMyAccountWebViewController *)&v7 viewDidLoad];
  if (self->_webView)
  {
    v3 = (void *)MEMORY[0x263F08BD8];
    id v4 = [(PSUICarrierSpaceMyAccountWebViewController *)self myAccountURL];
    id v5 = [v3 requestWithURL:v4];

    id v6 = [(WKWebView *)self->_webView loadRequest:v5];
  }
}

- (void)addCancelButton
{
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  id v5 = [(PSUICarrierSpaceMyAccountWebViewController *)self navigationItem];
  cancelButton = self->_cancelButton;
  id v7 = v5;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [v5 setRightBarButtonItem:cancelButton animated:1];
  }
  else {
    [v5 setLeftBarButtonItem:cancelButton animated:1];
  }
}

- (NSURL)myAccountURL
{
  return self->_myAccountURL;
}

- (void)setMyAccountURL:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_myAccountURL, 0);
}

@end