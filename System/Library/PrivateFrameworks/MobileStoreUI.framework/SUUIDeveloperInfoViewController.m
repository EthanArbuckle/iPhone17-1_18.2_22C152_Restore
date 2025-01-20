@interface SUUIDeveloperInfoViewController
- (SUUIDeveloperInfo)developerInfo;
- (SUUIDeveloperInfoViewController)initWithDeveloperInfo:(id)a3;
- (void)loadView;
@end

@implementation SUUIDeveloperInfoViewController

- (SUUIDeveloperInfoViewController)initWithDeveloperInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIDeveloperInfoViewController;
  v5 = [(SUUIDeveloperInfoViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    developerInfo = v5->_developerInfo;
    v5->_developerInfo = (SUUIDeveloperInfo *)v6;
  }
  return v5;
}

- (void)loadView
{
  id v24 = [(SUUIViewController *)self clientContext];
  uint64_t v3 = SUUIUserInterfaceIdiom(v24);
  uint64_t v4 = v3;
  if (self->_infoView)
  {
    p_scrollView = (id *)&self->_scrollView;
    scrollView = self->_scrollView;
    if (scrollView) {
      goto LABEL_13;
    }
    if (v3 != 1)
    {
LABEL_9:
      v11 = [MEMORY[0x263F82B60] mainScreen];
      [v11 bounds];
      double v10 = v12;

      goto LABEL_10;
    }
  }
  else
  {
    v7 = [[SUUIDeveloperInfoView alloc] initWithDeveloperInfo:self->_developerInfo clientContext:v24];
    infoView = self->_infoView;
    self->_infoView = v7;

    objc_super v9 = self->_infoView;
    if (v4 != 1)
    {
      [(SUUIDeveloperInfoView *)v9 setAutoresizingMask:18];
      p_scrollView = (id *)&self->_scrollView;
      scrollView = self->_scrollView;
      if (scrollView) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
    [(SUUIDeveloperInfoView *)v9 setAutoresizingMask:5];
    p_scrollView = (id *)&self->_scrollView;
    scrollView = self->_scrollView;
    if (scrollView) {
      goto LABEL_13;
    }
  }
  double v10 = 370.0;
LABEL_10:
  double v13 = *MEMORY[0x263F001A8];
  double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
  -[SUUIDeveloperInfoView sizeThatFits:](self->_infoView, "sizeThatFits:", v10, 1.79769313e308);
  double v16 = v15;
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F82B88]), "initWithFrame:", v13, v14, v10, v15);
  id v18 = *p_scrollView;
  id *p_scrollView = (id)v17;

  objc_msgSend(*p_scrollView, "setContentSize:", v10, v16);
  id v19 = *p_scrollView;
  v20 = [MEMORY[0x263F825C8] colorWithWhite:0.921568627 alpha:1.0];
  [v19 setBackgroundColor:v20];

  if (v4 == 1) {
    objc_msgSend(*p_scrollView, "setContentInset:", 140.0, 0.0, 0.0, 0.0);
  }
  v21 = self->_infoView;
  v22 = [*p_scrollView backgroundColor];
  [(SUUIDeveloperInfoView *)v21 setBackgroundColor:v22];

  v23 = self->_infoView;
  [*p_scrollView bounds];
  -[SUUIDeveloperInfoView setFrame:](v23, "setFrame:");
  [*p_scrollView addSubview:self->_infoView];
  scrollView = (UIScrollView *)*p_scrollView;
LABEL_13:
  [(SUUIDeveloperInfoViewController *)self setView:scrollView];
  [(SUUIViewController *)self showDefaultNavigationItems];
}

- (SUUIDeveloperInfo)developerInfo
{
  return self->_developerInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_developerInfo, 0);
}

@end