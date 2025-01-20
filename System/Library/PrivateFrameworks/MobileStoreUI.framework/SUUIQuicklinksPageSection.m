@interface SUUIQuicklinksPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIQuicklinksPageSection)initWithPageComponent:(id)a3;
- (id)_quicklinksViewController;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)dealloc;
- (void)quicklinksViewController:(id)a3 didSelectLink:(id)a4 atIndex:(int64_t)a5;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIQuicklinksPageSection

- (SUUIQuicklinksPageSection)initWithPageComponent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIQuicklinksPageSection;
  return [(SUUIStorePageSection *)&v4 initWithPageComponent:a3];
}

- (void)dealloc
{
  [(SUUIQuicklinksViewController *)self->_quicklinksViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIQuicklinksPageSection;
  [(SUUIStorePageSection *)&v3 dealloc];
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  id v9 = [v4 collectionView];
  [v9 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SUUIQuicklinksPageSectionReuseIdentifier"];
  v5 = [(SUUIQuicklinksPageSection *)self _quicklinksViewController];
  v6 = [v4 collectionView];

  [v6 bounds];
  objc_msgSend(v5, "willTransitionToSize:withTransitionCoordinator:", 0, v7, v8);
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStorePageSection *)self context];
  v6 = [v5 collectionView];
  double v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SUUIQuicklinksPageSectionReuseIdentifier" forIndexPath:v4];

  double v8 = [(SUUIQuicklinksPageSection *)self _quicklinksViewController];
  id v9 = [v8 view];

  v10 = [v7 contentChildView];

  if (v9 != v10)
  {
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    [v7 setContentChildView:v9];
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SUUIStorePageSection *)self context];
  v5 = [v4 collectionView];
  [v5 bounds];
  double v7 = v6;

  double v8 = [(SUUIQuicklinksPageSection *)self _quicklinksViewController];
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
  id v9 = [(SUUIStorePageSection *)self clickEventWithLink:v8 elementName:*MEMORY[0x263F7BBA8] index:a5];
  if (v9)
  {
    [v14 frameForLinkAtIndex:a5];
    SUUIMetricsSetClickEventPositionWithPoint(v9, v10, v11);
    double v12 = [(SUUIStorePageSection *)self context];
    double v13 = [v12 metricsController];
    [v13 recordEvent:v9];
  }
  [(SUUIStorePageSection *)self showPageWithLink:v8];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  quicklinksViewController = self->_quicklinksViewController;
  id v8 = a4;
  -[SUUIQuicklinksViewController willTransitionToSize:withTransitionCoordinator:](quicklinksViewController, "willTransitionToSize:withTransitionCoordinator:", v8, width, height);
  v9.receiver = self;
  v9.super_class = (Class)SUUIQuicklinksPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (id)_quicklinksViewController
{
  quicklinksViewController = self->_quicklinksViewController;
  if (!quicklinksViewController)
  {
    id v4 = [(SUUIStorePageSection *)self context];
    v5 = objc_alloc_init(SUUIQuicklinksViewController);
    double v6 = self->_quicklinksViewController;
    self->_quicklinksViewController = v5;

    [(SUUIQuicklinksViewController *)self->_quicklinksViewController setDelegate:self];
    double v7 = [(SUUIStorePageSection *)self pageComponent];
    id v8 = self->_quicklinksViewController;
    objc_super v9 = [v4 colorScheme];
    [(SUUIQuicklinksViewController *)v8 setColoringWithColorScheme:v9];

    double v10 = self->_quicklinksViewController;
    double v11 = [v7 links];
    [(SUUIQuicklinksViewController *)v10 setLinks:v11];

    double v12 = self->_quicklinksViewController;
    double v13 = [v7 title];
    [(SUUIQuicklinksViewController *)v12 setTitle:v13];

    id v14 = [v4 parentViewController];
    [v14 addChildViewController:self->_quicklinksViewController];

    quicklinksViewController = self->_quicklinksViewController;
  }
  return quicklinksViewController;
}

- (void).cxx_destruct
{
}

@end