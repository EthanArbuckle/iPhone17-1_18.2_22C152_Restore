@interface SUUIStorePageSectionContext
- (SUUIClientContext)clientContext;
- (SUUIColorScheme)colorScheme;
- (SUUIItemOfferButtonAppearance)itemOfferButtonAppearance;
- (SUUILayoutCache)textLayoutCache;
- (SUUIMetricsController)metricsController;
- (SUUIMetricsImpressionSession)activeMetricsImpressionSession;
- (SUUIResourceLoader)resourceLoader;
- (SUUIStorePageSectionContext)init;
- (SUUIStorePageSectionsViewController)parentViewController;
- (UICollectionView)collectionView;
- (UIColor)placeholderColor;
- (double)activePageWidth;
- (double)horizontalPadding;
- (double)landscapePageWidth;
- (double)portraitPageWidth;
- (int64_t)defaultPinningTransitionStyle;
- (int64_t)layoutStyle;
- (void)_setActiveMetricsImpressionSession:(id)a3;
- (void)_setActivePageWidth:(double)a3;
- (void)_setCollectionView:(id)a3;
- (void)_setColorScheme:(id)a3;
- (void)_setDefaultPinningTransitionStyle:(int64_t)a3;
- (void)_setLandscapePageWidth:(double)a3;
- (void)_setLayoutStyle:(int64_t)a3;
- (void)_setMetricsController:(id)a3;
- (void)_setParentViewController:(id)a3;
- (void)_setPortraitPageWidth:(double)a3;
- (void)_setResourceLoader:(id)a3;
- (void)_setTextLayoutCache:(id)a3;
@end

@implementation SUUIStorePageSectionContext

- (SUUIStorePageSectionContext)init
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIStorePageSectionContext;
  v2 = [(SUUIStorePageSectionContext *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F82B60] mainScreen];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    v2->_portraitPageWidth = v5;
    v2->_activePageWidth = v5;
    v2->_landscapePageWidth = v7;
  }
  return v2;
}

- (SUUIClientContext)clientContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  v3 = [WeakRetained clientContext];

  return (SUUIClientContext *)v3;
}

- (double)horizontalPadding
{
  v3 = [MEMORY[0x263F82E88] keyWindow];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(SUUIStorePageSectionContext *)self activePageWidth];
  double v13 = v12;
  if (v12 < 1024.0
    || (v16.origin.x = v5,
        v16.origin.y = v7,
        v16.size.width = v9,
        v16.size.height = v11,
        double Height = CGRectGetHeight(v16),
        double result = 20.0,
        Height <= 768.0))
  {
    if ([(SUUIStorePageSectionContext *)self layoutStyle] != 1) {
      return 15.0;
    }
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    if (CGRectGetHeight(v17) >= 1024.0)
    {
      v18.origin.x = v5;
      v18.origin.y = v7;
      v18.size.width = v9;
      v18.size.height = v11;
      if (CGRectGetWidth(v18) >= 1024.0) {
        return 35.0;
      }
    }
    double result = 20.0;
    if (v13 != 414.0) {
      return 15.0;
    }
  }
  return result;
}

- (SUUIItemOfferButtonAppearance)itemOfferButtonAppearance
{
  itemOfferButtonAppearance = self->_itemOfferButtonAppearance;
  if (!itemOfferButtonAppearance)
  {
    double v4 = [[SUUIItemOfferButtonAppearance alloc] initWithColorScheme:self->_colorScheme];
    CGFloat v5 = self->_itemOfferButtonAppearance;
    self->_itemOfferButtonAppearance = v4;

    itemOfferButtonAppearance = self->_itemOfferButtonAppearance;
  }
  return itemOfferButtonAppearance;
}

- (UIColor)placeholderColor
{
  placeholderColor = self->_placeholderColor;
  if (!placeholderColor)
  {
    double v4 = [(UICollectionView *)self->_collectionView backgroundColor];
    CGFloat v5 = v4;
    if (v4)
    {
      switch(SUUIColorSchemeStyleForColor(v4))
      {
        case 0:
        case 2:
          float v6 = -0.15;
          goto LABEL_7;
        case 1:
        case 3:
          float v6 = 0.25;
LABEL_7:
          SUUIColorByAdjustingBrightness(v5, v6);
          CGFloat v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        default:
          goto LABEL_9;
      }
    }
    CGFloat v7 = [MEMORY[0x263F825C8] colorWithWhite:0.85 alpha:1.0];
LABEL_8:
    double v8 = self->_placeholderColor;
    self->_placeholderColor = v7;

LABEL_9:
    placeholderColor = self->_placeholderColor;
  }
  return placeholderColor;
}

- (void)_setActiveMetricsImpressionSession:(id)a3
{
}

- (void)_setActivePageWidth:(double)a3
{
  if (self->_activePageWidth != a3)
  {
    self->_portraitPageWidth = a3;
    self->_activePageWidth = a3;
  }
}

- (void)_setCollectionView:(id)a3
{
  CGFloat v5 = (UICollectionView *)a3;
  p_collectionView = &self->_collectionView;
  if (self->_collectionView != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)p_collectionView, a3);
    placeholderColor = self->_placeholderColor;
    self->_placeholderColor = 0;

    CGFloat v5 = v8;
  }
  MEMORY[0x270F9A758](p_collectionView, v5);
}

- (void)_setColorScheme:(id)a3
{
  CGFloat v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)p_colorScheme, a3);
    placeholderColor = self->_placeholderColor;
    self->_placeholderColor = 0;

    CGFloat v5 = v8;
  }
  MEMORY[0x270F9A758](p_colorScheme, v5);
}

- (void)_setDefaultPinningTransitionStyle:(int64_t)a3
{
  self->_defaultPinningTransitionStyle = a3;
}

- (void)_setLandscapePageWidth:(double)a3
{
  self->_landscapePageWidth = a3;
}

- (void)_setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (void)_setMetricsController:(id)a3
{
  CGFloat v5 = (SUUIMetricsController *)a3;
  metricsController = self->_metricsController;
  p_metricsController = &self->_metricsController;
  if (metricsController != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)p_metricsController, a3);
    CGFloat v5 = v8;
  }
}

- (void)_setParentViewController:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_parentViewController, v4);
}

- (void)_setPortraitPageWidth:(double)a3
{
  self->_portraitPageWidth = a3;
}

- (void)_setResourceLoader:(id)a3
{
  CGFloat v5 = (SUUIResourceLoader *)a3;
  resourceLoader = self->_resourceLoader;
  p_resourceLoader = &self->_resourceLoader;
  if (resourceLoader != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)p_resourceLoader, a3);
    CGFloat v5 = v8;
  }
}

- (void)_setTextLayoutCache:(id)a3
{
  CGFloat v5 = (SUUILayoutCache *)a3;
  textLayoutCache = self->_textLayoutCache;
  p_textLayoutCache = &self->_textLayoutCache;
  if (textLayoutCache != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)p_textLayoutCache, a3);
    CGFloat v5 = v8;
  }
}

- (SUUIMetricsImpressionSession)activeMetricsImpressionSession
{
  return self->_activeMetricsImpressionSession;
}

- (double)activePageWidth
{
  return self->_activePageWidth;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)defaultPinningTransitionStyle
{
  return self->_defaultPinningTransitionStyle;
}

- (double)landscapePageWidth
{
  return self->_landscapePageWidth;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (SUUIMetricsController)metricsController
{
  return self->_metricsController;
}

- (SUUIStorePageSectionsViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (SUUIStorePageSectionsViewController *)WeakRetained;
}

- (double)portraitPageWidth
{
  return self->_portraitPageWidth;
}

- (SUUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (SUUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_itemOfferButtonAppearance, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_activeMetricsImpressionSession, 0);
}

@end