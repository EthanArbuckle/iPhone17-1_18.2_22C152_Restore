@interface SKUIAccountButtonsSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUIAccountButtonsSection)initWithPageComponent:(id)a3;
- (id)_accountButtonsViewController;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)accountButtonsViewControllerDidSignIn:(id)a3;
- (void)accountButtonsViewControllerDidSignOut:(id)a3;
- (void)accountButtonsViewControllerDidTapECommerceLink:(id)a3;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)willAppearInContext:(id)a3;
@end

@implementation SKUIAccountButtonsSection

- (SKUIAccountButtonsSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIAccountButtonsSection initWithPageComponent:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIAccountButtonsSection;
  v5 = [(SKUIStorePageSection *)&v7 initWithPageComponent:v4];

  return v5;
}

- (void)dealloc
{
  [(SKUIAccountButtonsViewController *)self->_accountButtonsViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIAccountButtonsSection;
  [(SKUIStorePageSection *)&v3 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5 = a4;
  id v7 = [(SKUIStorePageSection *)self pageComponent];
  v6 = [v7 viewElement];
  [v5 addItemViewElement:v6];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self pageComponent];
  v6 = [v5 viewElement];
  id v7 = [v6 style];

  v8 = [v7 ikBackgroundColor];
  v9 = [v8 color];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIAccountButtonsSection;
    id v10 = [(SKUIStorePageSection *)&v13 backgroundColorForIndexPath:v4];
  }
  v11 = v10;

  return v11;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self context];
  v6 = [v5 collectionView];
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SKUIAccountButtonsSectionReuseIdentifier" forIndexPath:v4];

  v8 = [(SKUIAccountButtonsSection *)self _accountButtonsViewController];
  v9 = [v8 view];

  id v10 = [v7 contentChildView];

  if (v9 != v10)
  {
    v11 = [(SKUIAccountButtonsSection *)self backgroundColorForIndexPath:v4];
    [v9 setBackgroundColor:v11];

    [v7 setContentChildView:v9];
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SKUIStorePageSection *)self context];
  [v4 activePageWidth];
  double v6 = v5;

  id v7 = [(SKUIAccountButtonsSection *)self _accountButtonsViewController];
  v8 = [v7 view];
  objc_msgSend(v8, "sizeThatFits:", v6, 0.0);
  double v10 = v9;

  double v11 = v6;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SKUIStorePageSection *)self context];
  v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SKUIAccountButtonsSection;
  [(SKUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SKUIStorePageSection *)self context];
  v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SKUIAccountButtonsSection;
  [(SKUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SKUIAccountButtonsSectionReuseIdentifier"];
  v6.receiver = self;
  v6.super_class = (Class)SKUIAccountButtonsSection;
  [(SKUIStorePageSection *)&v6 willAppearInContext:v4];
}

- (void)accountButtonsViewControllerDidSignIn:(id)a3
{
  id v6 = objc_alloc_init(MEMORY[0x1E4FA81F8]);
  [v6 setAccountEventTypeWithEventIdentifier:0];
  id v4 = [(SKUIStorePageSection *)self context];
  double v5 = [v4 metricsController];
  [v5 recordEvent:v6];
}

- (void)accountButtonsViewControllerDidSignOut:(id)a3
{
  id v6 = objc_alloc_init(MEMORY[0x1E4FA81F8]);
  [v6 setAccountEventTypeWithEventIdentifier:1];
  id v4 = [(SKUIStorePageSection *)self context];
  double v5 = [v4 metricsController];
  [v5 recordEvent:v6];
}

- (void)accountButtonsViewControllerDidTapECommerceLink:(id)a3
{
  id v8 = [(SKUIStorePageSection *)self pageComponent];
  objc_super v3 = [v8 ECommerceLink];
  id v4 = [v3 URL];

  double v5 = [v8 viewElement];
  id v6 = v5;
  if (v4)
  {
    SKUIMetricsOpenURL(v4);
  }
  else if (v5)
  {
    id v7 = [v5 firstChildForElementType:12];
    [v7 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

- (id)_accountButtonsViewController
{
  accountButtonsViewController = self->_accountButtonsViewController;
  if (!accountButtonsViewController)
  {
    id v4 = [(SKUIStorePageSection *)self context];
    double v5 = [(SKUIStorePageSection *)self pageComponent];
    id v6 = [v5 viewElement];

    id v7 = [v4 parentViewController];
    id v8 = [v7 clientContext];
    objc_super v9 = objc_alloc_init(SKUIAccountButtonsViewController);
    double v10 = self->_accountButtonsViewController;
    self->_accountButtonsViewController = v9;

    [(SKUIAccountButtonsViewController *)self->_accountButtonsViewController setClientContext:v8];
    [(SKUIAccountButtonsViewController *)self->_accountButtonsViewController setDelegate:self];
    double v11 = [(SKUIStorePageSection *)self pageComponent];
    -[SKUIAccountButtonsViewController setTermsAndConditionsHidden:](self->_accountButtonsViewController, "setTermsAndConditionsHidden:", [v11 hidesTermsAndConditions]);
    double v12 = [v6 firstChildForElementType:12];
    objc_super v13 = [v11 ECommerceLink];
    v25 = v12;
    if (!v13 && v12)
    {
      v14 = [v12 buttonText];
      v15 = [v14 string];

      if ([v15 length]) {
        objc_super v13 = [[SKUILink alloc] initWithURL:0 title:v15 targetString:0];
      }
      else {
        objc_super v13 = 0;
      }
    }
    [(SKUIAccountButtonsViewController *)self->_accountButtonsViewController setECommerceLink:v13];
    v16 = [v8 valueForConfigurationKey:@"mgift"];
    v17 = v16;
    if (v16 && ([v16 BOOLValue] & 1) == 0) {
      [(SKUIAccountButtonsViewController *)self->_accountButtonsViewController setGiftingHidden:1];
    }
    v26 = v8;
    [v7 addChildViewController:self->_accountButtonsViewController];
    v27 = v6;
    if (v6)
    {
      v18 = [v6 style];
      [v18 ikColor];
      v19 = v7;
      v21 = v20 = v4;
      v22 = [v21 color];

      id v4 = v20;
      id v7 = v19;
    }
    else
    {
      v18 = [v4 colorScheme];
      v22 = [v18 primaryTextColor];
    }

    if (!v22)
    {
      v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
    }
    v23 = [(SKUIAccountButtonsViewController *)self->_accountButtonsViewController view];
    [v23 setTintColor:v22];

    accountButtonsViewController = self->_accountButtonsViewController;
  }

  return accountButtonsViewController;
}

- (void).cxx_destruct
{
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIAccountButtonsSection initWithPageComponent:]";
}

@end