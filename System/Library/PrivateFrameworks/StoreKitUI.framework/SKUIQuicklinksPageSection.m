@interface SKUIQuicklinksPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUIQuicklinksPageSection)initWithPageComponent:(id)a3;
- (id)_quicklinksViewController;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)dealloc;
- (void)quicklinksViewController:(id)a3 didSelectLink:(id)a4 atIndex:(int64_t)a5;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUIQuicklinksPageSection

- (SKUIQuicklinksPageSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIQuicklinksPageSection initWithPageComponent:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIQuicklinksPageSection;
  v5 = [(SKUIStorePageSection *)&v7 initWithPageComponent:v4];

  return v5;
}

- (void)dealloc
{
  [(SKUIQuicklinksViewController *)self->_quicklinksViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIQuicklinksPageSection;
  [(SKUIStorePageSection *)&v3 dealloc];
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  id v9 = [v4 collectionView];
  [v9 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SKUIQuicklinksPageSectionReuseIdentifier"];
  v5 = [(SKUIQuicklinksPageSection *)self _quicklinksViewController];
  v6 = [v4 collectionView];

  [v6 bounds];
  objc_msgSend(v5, "willTransitionToSize:withTransitionCoordinator:", 0, v7, v8);
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self context];
  v6 = [v5 collectionView];
  double v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SKUIQuicklinksPageSectionReuseIdentifier" forIndexPath:v4];

  double v8 = [(SKUIQuicklinksPageSection *)self _quicklinksViewController];
  id v9 = [v8 view];

  v10 = [v7 contentChildView];

  if (v9 != v10)
  {
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [v7 setContentChildView:v9];
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SKUIStorePageSection *)self context];
  v5 = [v4 collectionView];
  [v5 bounds];
  double v7 = v6;

  double v8 = [(SKUIQuicklinksPageSection *)self _quicklinksViewController];
  id v9 = [v8 view];
  [v9 bounds];
  double v11 = v10;

  double v12 = v7;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)quicklinksViewController:(id)a3 didSelectLink:(id)a4 atIndex:(int64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = [(SKUIStorePageSection *)self clickEventWithLink:v8 elementName:*MEMORY[0x1E4FA88D0] index:a5];
  if (v9)
  {
    [v14 frameForLinkAtIndex:a5];
    SKUIMetricsSetClickEventPositionWithPoint(v9, v10, v11);
    double v12 = [(SKUIStorePageSection *)self context];
    double v13 = [v12 metricsController];
    [v13 recordEvent:v9];
  }
  [(SKUIStorePageSection *)self showPageWithLink:v8];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  quicklinksViewController = self->_quicklinksViewController;
  id v8 = a4;
  -[SKUIQuicklinksViewController willTransitionToSize:withTransitionCoordinator:](quicklinksViewController, "willTransitionToSize:withTransitionCoordinator:", v8, width, height);
  v9.receiver = self;
  v9.super_class = (Class)SKUIQuicklinksPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (id)_quicklinksViewController
{
  quicklinksViewController = self->_quicklinksViewController;
  if (!quicklinksViewController)
  {
    id v4 = [(SKUIStorePageSection *)self context];
    v5 = objc_alloc_init(SKUIQuicklinksViewController);
    double v6 = self->_quicklinksViewController;
    self->_quicklinksViewController = v5;

    [(SKUIQuicklinksViewController *)self->_quicklinksViewController setDelegate:self];
    double v7 = [(SKUIStorePageSection *)self pageComponent];
    id v8 = self->_quicklinksViewController;
    objc_super v9 = [v4 colorScheme];
    [(SKUIQuicklinksViewController *)v8 setColoringWithColorScheme:v9];

    double v10 = self->_quicklinksViewController;
    double v11 = [v7 links];
    [(SKUIQuicklinksViewController *)v10 setLinks:v11];

    double v12 = self->_quicklinksViewController;
    double v13 = [v7 title];
    [(SKUIQuicklinksViewController *)v12 setTitle:v13];

    id v14 = [v4 parentViewController];
    [v14 addChildViewController:self->_quicklinksViewController];

    quicklinksViewController = self->_quicklinksViewController;
  }

  return quicklinksViewController;
}

- (void).cxx_destruct
{
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIQuicklinksPageSection initWithPageComponent:]";
}

@end