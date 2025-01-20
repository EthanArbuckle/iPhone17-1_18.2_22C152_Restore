@interface SKUILoadingViewController
- (NSString)loadingText;
- (SKUIClientContext)clientContext;
- (SKUIColorScheme)spinnerColorScheme;
- (SKUILoadingView)loadingView;
- (SKUILoadingViewController)initWithClientContext:(id)a3;
- (UIColor)backgroundColor;
- (void)_initializeLoadingView;
- (void)setBackgroundColor:(id)a3;
- (void)setLoadingText:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setSpinnerColorScheme:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SKUILoadingViewController

- (SKUILoadingViewController)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUILoadingViewController initWithClientContext:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUILoadingViewController;
  v6 = [(SKUILoadingViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientContext, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SKUILoadingViewController;
  [(SKUILoadingViewController *)&v7 viewDidLoad];
  v3 = [(SKUILoadingViewController *)self backgroundColor];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  id v5 = [(SKUILoadingViewController *)self view];
  [v5 setBackgroundColor:v4];

  if (!v3) {
  v6 = [(SKUILoadingViewController *)self view];
  }
  [v6 setAccessibilityIgnoresInvertColors:1];

  [(SKUILoadingViewController *)self _initializeLoadingView];
}

- (void)_initializeLoadingView
{
  uint64_t v3 = 0x1E6420000uLL;
  v4 = objc_alloc_init(SKUILoadingView);
  [(SKUILoadingViewController *)self setLoadingView:v4];

  id v5 = [(SKUILoadingViewController *)self loadingText];
  if (v5)
  {
    [(SKUILoadingViewController *)self loadingText];
  }
  else
  {
    uint64_t v3 = [(SKUILoadingViewController *)self clientContext];
    +[SKUILoadingView defaultLoadingTextWithClientContext:v3];
  v6 = };
  objc_super v7 = [(SKUILoadingViewController *)self loadingView];
  [v7 setLoadingText:v6];

  if (!v5)
  {

    v6 = (void *)v3;
  }

  v8 = [(SKUILoadingViewController *)self view];
  objc_super v9 = [v8 backgroundColor];
  v10 = [(SKUILoadingViewController *)self loadingView];
  [v10 setBackgroundColor:v9];

  v11 = [(SKUILoadingViewController *)self spinnerColorScheme];
  v12 = [(SKUILoadingViewController *)self loadingView];
  [v12 setColorScheme:v11];

  v13 = [(SKUILoadingViewController *)self loadingView];
  [v13 sizeToFit];

  id v15 = [(SKUILoadingViewController *)self view];
  v14 = [(SKUILoadingViewController *)self loadingView];
  [v15 addSubview:v14];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v3 = [(SKUILoadingViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  rect.origin.x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v13 = [(SKUILoadingViewController *)self loadingView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;

  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  double Width = CGRectGetWidth(v24);
  v25.origin.x = rect.origin.x;
  v25.origin.y = v12;
  v25.size.width = v15;
  v25.size.height = v17;
  CGFloat v19 = floor((Width - CGRectGetWidth(v25)) * 0.5);
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  CGFloat v20 = CGRectGetHeight(v26) * 0.5;
  v27.origin.x = v19;
  v27.origin.y = v12;
  v27.size.width = v15;
  v27.size.height = v17;
  double v21 = floor(v20 - CGRectGetHeight(v27));
  v22 = [(SKUILoadingViewController *)self loadingView];
  objc_msgSend(v22, "setFrame:", v19, v21, v15, v17);

  *(void *)&rect.origin.y = self;
  *(void *)&rect.size.width = SKUILoadingViewController;
  [(CGFloat *)(objc_super *)&rect.origin.y viewDidLayoutSubviews];
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSString)loadingText
{
  return self->_loadingText;
}

- (void)setLoadingText:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (SKUIColorScheme)spinnerColorScheme
{
  return self->_spinnerColorScheme;
}

- (void)setSpinnerColorScheme:(id)a3
{
}

- (SKUILoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_spinnerColorScheme, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_loadingText, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILoadingViewController initWithClientContext:]";
}

@end