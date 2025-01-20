@interface SKUIDeveloperInfoViewController
- (SKUIDeveloperInfo)developerInfo;
- (SKUIDeveloperInfoViewController)initWithDeveloperInfo:(id)a3;
- (void)loadView;
@end

@implementation SKUIDeveloperInfoViewController

- (SKUIDeveloperInfoViewController)initWithDeveloperInfo:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDeveloperInfoViewController initWithDeveloperInfo:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIDeveloperInfoViewController;
  v5 = [(SKUIDeveloperInfoViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    developerInfo = v5->_developerInfo;
    v5->_developerInfo = (SKUIDeveloperInfo *)v6;
  }
  return v5;
}

- (void)loadView
{
  id v24 = [(SKUIViewController *)self clientContext];
  uint64_t v3 = SKUIUserInterfaceIdiom(v24);
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
      v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v11 bounds];
      double v10 = v12;

      goto LABEL_10;
    }
  }
  else
  {
    v7 = [[SKUIDeveloperInfoView alloc] initWithDeveloperInfo:self->_developerInfo clientContext:v24];
    infoView = self->_infoView;
    self->_infoView = v7;

    objc_super v9 = self->_infoView;
    if (v4 != 1)
    {
      [(SKUIDeveloperInfoView *)v9 setAutoresizingMask:18];
      p_scrollView = (id *)&self->_scrollView;
      scrollView = self->_scrollView;
      if (scrollView) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
    [(SKUIDeveloperInfoView *)v9 setAutoresizingMask:5];
    p_scrollView = (id *)&self->_scrollView;
    scrollView = self->_scrollView;
    if (scrollView) {
      goto LABEL_13;
    }
  }
  double v10 = 370.0;
LABEL_10:
  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  -[SKUIDeveloperInfoView sizeThatFits:](self->_infoView, "sizeThatFits:", v10, 1.79769313e308);
  double v16 = v15;
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", v13, v14, v10, v15);
  id v18 = *p_scrollView;
  id *p_scrollView = (id)v17;

  objc_msgSend(*p_scrollView, "setContentSize:", v10, v16);
  id v19 = *p_scrollView;
  v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.921568627 alpha:1.0];
  [v19 setBackgroundColor:v20];

  if (v4 == 1) {
    objc_msgSend(*p_scrollView, "setContentInset:", 140.0, 0.0, 0.0, 0.0);
  }
  v21 = self->_infoView;
  v22 = [*p_scrollView backgroundColor];
  [(SKUIDeveloperInfoView *)v21 setBackgroundColor:v22];

  v23 = self->_infoView;
  [*p_scrollView bounds];
  -[SKUIDeveloperInfoView setFrame:](v23, "setFrame:");
  [*p_scrollView addSubview:self->_infoView];
  scrollView = (UIScrollView *)*p_scrollView;
LABEL_13:
  [(SKUIDeveloperInfoViewController *)self setView:scrollView];
  [(SKUIViewController *)self showDefaultNavigationItems];
}

- (SKUIDeveloperInfo)developerInfo
{
  return self->_developerInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_infoView, 0);

  objc_storeStrong((id *)&self->_developerInfo, 0);
}

- (void)initWithDeveloperInfo:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDeveloperInfoViewController initWithDeveloperInfo:]";
}

@end