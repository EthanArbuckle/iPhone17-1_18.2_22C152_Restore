@interface SUUILoadingViewController
- (NSString)loadingText;
- (SUUIClientContext)clientContext;
- (SUUIColorScheme)spinnerColorScheme;
- (SUUILoadingView)loadingView;
- (SUUILoadingViewController)initWithClientContext:(id)a3;
- (UIColor)backgroundColor;
- (void)_initializeLoadingView;
- (void)setBackgroundColor:(id)a3;
- (void)setLoadingText:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setSpinnerColorScheme:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SUUILoadingViewController

- (SUUILoadingViewController)initWithClientContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUILoadingViewController;
  v6 = [(SUUILoadingViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientContext, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SUUILoadingViewController;
  [(SUUILoadingViewController *)&v7 viewDidLoad];
  v3 = [(SUUILoadingViewController *)self backgroundColor];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  }
  id v5 = [(SUUILoadingViewController *)self view];
  [v5 setBackgroundColor:v4];

  if (!v3) {
  v6 = [(SUUILoadingViewController *)self view];
  }
  [v6 setAccessibilityIgnoresInvertColors:1];

  [(SUUILoadingViewController *)self _initializeLoadingView];
}

- (void)_initializeLoadingView
{
  v3 = &off_2653FF000;
  v4 = objc_alloc_init(SUUILoadingView);
  [(SUUILoadingViewController *)self setLoadingView:v4];

  id v5 = [(SUUILoadingViewController *)self loadingText];
  if (v5)
  {
    [(SUUILoadingViewController *)self loadingText];
  }
  else
  {
    v3 = [(SUUILoadingViewController *)self clientContext];
    +[SUUILoadingView defaultLoadingTextWithClientContext:v3];
  v6 = };
  objc_super v7 = [(SUUILoadingViewController *)self loadingView];
  [v7 setLoadingText:v6];

  if (!v5)
  {

    v6 = v3;
  }

  v8 = [(SUUILoadingViewController *)self view];
  objc_super v9 = [v8 backgroundColor];
  v10 = [(SUUILoadingViewController *)self loadingView];
  [v10 setBackgroundColor:v9];

  v11 = [(SUUILoadingViewController *)self spinnerColorScheme];
  v12 = [(SUUILoadingViewController *)self loadingView];
  [v12 setColorScheme:v11];

  v13 = [(SUUILoadingViewController *)self loadingView];
  [v13 sizeToFit];

  id v15 = [(SUUILoadingViewController *)self view];
  v14 = [(SUUILoadingViewController *)self loadingView];
  [v15 addSubview:v14];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(SUUILoadingViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  CGFloat v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  rect.origin.x = *(CGFloat *)MEMORY[0x263F001A8];
  v13 = [(SUUILoadingViewController *)self loadingView];
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
  v22 = [(SUUILoadingViewController *)self loadingView];
  objc_msgSend(v22, "setFrame:", v19, v21, v15, v17);

  *(void *)&rect.origin.y = self;
  *(void *)&rect.size.width = SUUILoadingViewController;
  [(CGFloat *)(objc_super *)&rect.origin.y viewDidLayoutSubviews];
}

- (SUUIClientContext)clientContext
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

- (SUUIColorScheme)spinnerColorScheme
{
  return self->_spinnerColorScheme;
}

- (void)setSpinnerColorScheme:(id)a3
{
}

- (SUUILoadingView)loadingView
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

@end