@interface SUUIViewElementLayoutContext
+ (double)_calculateValueFromString:(id)a3 withDefault:(double)a4 coefficent:(double)a5;
+ (double)itemWidthForElement:(id)a3 withDefaultWidth:(double)a4 fitWidth:(double)a5;
- (BOOL)_loadImageForURL:(id)a3 cacheKey:(id)a4 dataConsumer:(id)a5 reason:(int64_t)a6;
- (BOOL)isEditorialLayoutExpanded:(id)a3;
- (BOOL)loadImageForArtwork:(id)a3 dataConsumer:(id)a4 reason:(int64_t)a5;
- (BOOL)loadImageForArtwork:(id)a3 reason:(int64_t)a4;
- (BOOL)loadImageForBadgeElement:(id)a3 reason:(int64_t)a4;
- (BOOL)loadImageForImageElement:(id)a3 reason:(int64_t)a4;
- (BOOL)loadImageForImageElement:(id)a3 reason:(int64_t)a4 dataConsumer:(id)a5;
- (BOOL)loadTemplatedImageForBadgeElement:(id)a3 reason:(int64_t)a4;
- (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4;
- (CGSize)_sizeForImageElement:(id)a3 applyTransform:(BOOL)a4;
- (CGSize)sizeForBadgeElement:(id)a3;
- (CGSize)sizeForImageElement:(id)a3;
- (CGSize)sizeForItemOfferButton:(id)a3;
- (CGSize)sizeForViewElement:(id)a3 width:(double)a4;
- (MPUBorderDrawingCache)borderDrawingCache;
- (NSCache)placeholderImageCache;
- (NSString)backdropGroupName;
- (SUUIArtworkRequestDelegate)artworkRequestDelegate;
- (SUUIBadgeTextAttachmentLoader)badgeImageLoader;
- (SUUIClientContext)clientContext;
- (SUUIResourceLoader)resourceLoader;
- (SUUIViewElementLayoutContext)initWithStorePageSectionContext:(id)a3;
- (SUUIViewElementLayoutContext)initWithStorePageSectionContext:(id)a3 previousLayoutContext:(id)a4;
- (SUUIViewElementTextLayoutCache)labelLayoutCache;
- (UIColor)placeholderColor;
- (UIColor)tintColor;
- (UIEdgeInsets)largeScreenElementPadding;
- (UIViewController)parentViewController;
- (double)activePageWidth;
- (double)defaultItemWidthForViewElement:(id)a3;
- (double)displayScale;
- (id)_initSUUIViewElementLayoutContext;
- (id)aggregateValueForKey:(id)a3;
- (id)blurColorForCacheKey:(id)a3;
- (id)dataConsumerForImageElement:(id)a3;
- (id)editorialLayoutForLabelElement:(id)a3 width:(double)a4;
- (id)imageResourceCacheKeyForArtwork:(id)a3;
- (id)imageResourceCacheKeyForViewElement:(id)a3;
- (id)placeholderImageForImageElement:(id)a3 dataConsumer:(id)a4;
- (id)placeholderImageForSize:(CGSize)a3;
- (id)requestIdentifierForArtwork:(id)a3;
- (id)requestIdentifierForResourceCacheKey:(id)a3;
- (id)requestIdentifierForViewElement:(id)a3;
- (id)textPropertiesForViewElement:(id)a3 width:(double)a4;
- (id)transientRequestIdentifierForViewElement:(id)a3;
- (int64_t)maxWidthForElement:(id)a3 withDefaultWidth:(int64_t)a4;
- (unint64_t)containerViewElementType;
- (void)_artworkRequestDidLoadImageNotification:(id)a3;
- (void)dealloc;
- (void)expandEditorialForLabelElement:(id)a3;
- (void)invalidateAllEditorialLayouts;
- (void)setActivePageWidth:(double)a3;
- (void)setAggregateValue:(id)a3 forKey:(id)a4;
- (void)setArtworkRequestDelegate:(id)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setBlurColor:(id)a3 cacheKey:(id)a4;
- (void)setClientContext:(id)a3;
- (void)setContainerViewElementType:(unint64_t)a3;
- (void)setDisplayScale:(double)a3;
- (void)setLabelLayoutCache:(id)a3;
- (void)setLargeScreenElementPaddingFromContext:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setResourceLoader:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation SUUIViewElementLayoutContext

- (id)_initSUUIViewElementLayoutContext
{
  v17.receiver = self;
  v17.super_class = (Class)SUUIViewElementLayoutContext;
  v2 = [(SUUIViewElementLayoutContext *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    editorialLayouts = v2->_editorialLayouts;
    v2->_editorialLayouts = (NSMapTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    observedArtworkRequestIDs = v2->_observedArtworkRequestIDs;
    v2->_observedArtworkRequestIDs = v5;

    uint64_t v7 = [MEMORY[0x263F825C8] colorWithWhite:0.85 alpha:1.0];
    placeholderColor = v2->_placeholderColor;
    v2->_placeholderColor = (UIColor *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    blurColors = v2->_blurColors;
    v2->_blurColors = (NSMapTable *)v9;

    v11 = objc_alloc_init(SUUIItemOfferButton);
    itemOfferButton = v2->_itemOfferButton;
    v2->_itemOfferButton = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    itemOfferButtonSizes = v2->_itemOfferButtonSizes;
    v2->_itemOfferButtonSizes = v13;

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v2 selector:sel__artworkRequestDidLoadImageNotification_ name:@"SUUIArtworkRequestDidLoadImageNotification" object:0];
  }
  return v2;
}

- (SUUIViewElementLayoutContext)initWithStorePageSectionContext:(id)a3
{
  return [(SUUIViewElementLayoutContext *)self initWithStorePageSectionContext:a3 previousLayoutContext:0];
}

- (SUUIViewElementLayoutContext)initWithStorePageSectionContext:(id)a3 previousLayoutContext:(id)a4
{
  id v6 = a3;
  uint64_t v7 = a4;
  v8 = [(SUUIViewElementLayoutContext *)self _initSUUIViewElementLayoutContext];
  if (v8)
  {
    uint64_t v9 = [v6 resourceLoader];
    if (v9)
    {
      v10 = [v7 resourceLoader];

      if (v10 == v9)
      {
        v11 = (void *)v7[12];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = [v12 mutableCopy];
          observedArtworkRequestIDs = v8->_observedArtworkRequestIDs;
          v8->_observedArtworkRequestIDs = (NSMutableSet *)v13;
        }
      }
    }
    v15 = [v7 labelLayoutCache];
    v16 = [v6 textLayoutCache];
    objc_super v17 = [v15 layoutCache];

    if (v17 == v16)
    {
      objc_storeStrong((id *)&v8->_labelLayoutCache, v15);
      [(SUUIViewElementTextLayoutCache *)v8->_labelLayoutCache invalidateLayoutsForUpdatedElements];
    }
    else
    {
      v18 = [SUUIViewElementTextLayoutCache alloc];
      v19 = [v6 textLayoutCache];
      uint64_t v20 = [(SUUIViewElementTextLayoutCache *)v18 initWithLayoutCache:v19];
      labelLayoutCache = v8->_labelLayoutCache;
      v8->_labelLayoutCache = (SUUIViewElementTextLayoutCache *)v20;
    }
    [v6 activePageWidth];
    -[SUUIViewElementLayoutContext setActivePageWidth:](v8, "setActivePageWidth:");
    v22 = [v6 clientContext];
    [(SUUIViewElementLayoutContext *)v8 setClientContext:v22];

    v23 = [v6 parentViewController];
    [(SUUIViewElementLayoutContext *)v8 setParentViewController:v23];
    v24 = [v6 placeholderColor];
    [(SUUIViewElementLayoutContext *)v8 setPlaceholderColor:v24];

    [(SUUIViewElementLayoutContext *)v8 setResourceLoader:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v23;
    }
    else
    {
      id v25 = [v23 navigationController];
    }
    v26 = v25;
    v27 = [v25 navigationBar];
    v28 = [v27 _backdropViewLayerGroupName];
    [(SUUIViewElementLayoutContext *)v8 setBackdropGroupName:v28];

    v29 = [v6 collectionView];
    v30 = [v29 tintColor];
    [(SUUIViewElementLayoutContext *)v8 setTintColor:v30];

    v31 = [v29 traitCollection];
    [v31 displayScale];
    -[SUUIViewElementLayoutContext setDisplayScale:](v8, "setDisplayScale:");
    [(SUUIViewElementLayoutContext *)v8 setLargeScreenElementPaddingFromContext:v6];
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SUUIArtworkRequestDidLoadImageNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIViewElementLayoutContext;
  [(SUUIViewElementLayoutContext *)&v4 dealloc];
}

- (NSCache)placeholderImageCache
{
  return [(SUUIClientContext *)self->_clientContext placeholderImageCache];
}

+ (double)itemWidthForElement:(id)a3 withDefaultWidth:(double)a4 fitWidth:(double)a5
{
  v8 = [a3 style];
  uint64_t v9 = [v8 itemWidth];

  [a1 _calculateValueFromString:v9 withDefault:a4 coefficent:a5];
  double v11 = v10;

  return v11;
}

- (id)aggregateValueForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_aggregateValues objectForKey:a3];
}

- (SUUIBadgeTextAttachmentLoader)badgeImageLoader
{
  badgeImageLoader = self->_badgeImageLoader;
  if (!badgeImageLoader)
  {
    objc_super v4 = [[SUUIBadgeTextAttachmentLoader alloc] initWithResourceLoader:self->_resourceLoader];
    v5 = self->_badgeImageLoader;
    self->_badgeImageLoader = v4;

    badgeImageLoader = self->_badgeImageLoader;
  }
  return badgeImageLoader;
}

- (id)blurColorForCacheKey:(id)a3
{
  if (a3)
  {
    objc_super v4 = -[NSMapTable objectForKey:](self->_blurColors, "objectForKey:");
  }
  else
  {
    objc_super v4 = 0;
  }
  return v4;
}

- (MPUBorderDrawingCache)borderDrawingCache
{
  borderDrawingCache = self->_borderDrawingCache;
  if (!borderDrawingCache)
  {
    uint64_t v4 = SUUIMPUFoundationFramework();
    v5 = (MPUBorderDrawingCache *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(&cfstr_Mpuborderdrawi.isa, v4));
    id v6 = self->_borderDrawingCache;
    self->_borderDrawingCache = v5;

    borderDrawingCache = self->_borderDrawingCache;
  }
  return borderDrawingCache;
}

- (double)defaultItemWidthForViewElement:(id)a3
{
  uint64_t v4 = [a3 style];
  v5 = [v4 itemWidth];

  if (v5 && ([v5 floatValue], v6 >= 0.00000011921))
  {
    double v7 = v6;
  }
  else if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    double v7 = 335.0;
  }
  else
  {
    v8 = [MEMORY[0x263F82B60] mainScreen];
    [v8 scale];
    double v10 = v9;

    if (v10 == 3.0)
    {
      double v7 = 270.0;
    }
    else
    {
      double v11 = [MEMORY[0x263F82B60] mainScreen];
      [v11 bounds];
      BOOL v13 = v12 > 320.0;

      double v7 = dbl_2568A1320[v13];
    }
  }

  return v7;
}

- (double)displayScale
{
  double result = self->_displayScale;
  if (result <= 0.00000011920929)
  {
    uint64_t v3 = [MEMORY[0x263F82B60] mainScreen];
    [v3 scale];
    double v5 = v4;

    return v5;
  }
  return result;
}

- (id)editorialLayoutForLabelElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  double v7 = [(NSMapTable *)self->_editorialLayouts objectForKey:v6];
  if (!v7)
  {
    v8 = [[SUUIEditorialComponent alloc] initWithViewElement:v6];
    double v9 = [SUUIEditorialLayout alloc];
    double v10 = [(SUUIViewElementTextLayoutCache *)self->_labelLayoutCache layoutCache];
    double v7 = [(SUUIEditorialLayout *)v9 initWithEditorial:v8 layoutCache:v10];

    [(SUUIEditorialLayout *)v7 setLayoutWidth:0 forOrientation:a4];
    [(NSMapTable *)self->_editorialLayouts setObject:v7 forKey:v6];
  }
  return v7;
}

- (void)expandEditorialForLabelElement:(id)a3
{
  uint64_t v4 = [(NSMapTable *)self->_editorialLayouts objectForKey:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    expandedEditorialLayouts = self->_expandedEditorialLayouts;
    uint64_t v9 = v5;
    if (!expandedEditorialLayouts)
    {
      double v7 = (NSHashTable *)[objc_alloc(MEMORY[0x263F088B0]) initWithOptions:512 capacity:1];
      v8 = self->_expandedEditorialLayouts;
      self->_expandedEditorialLayouts = v7;

      expandedEditorialLayouts = self->_expandedEditorialLayouts;
    }
    uint64_t v4 = [(NSHashTable *)expandedEditorialLayouts addObject:v9];
    uint64_t v5 = v9;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (id)imageResourceCacheKeyForArtwork:(id)a3
{
  return (id)[a3 URL];
}

- (id)imageResourceCacheKeyForViewElement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 elementType];
  uint64_t v5 = 0;
  if (v4 > 48)
  {
    if (v4 != 49)
    {
      if (v4 == 50)
      {
        id v6 = [v3 buttonImage];
      }
      else
      {
        if (v4 != 152) {
          goto LABEL_14;
        }
        id v6 = [v3 thumbnailImage];
      }
      goto LABEL_13;
    }
    uint64_t v7 = [v3 resourceCacheKey];
LABEL_10:
    uint64_t v5 = (void *)v7;
    goto LABEL_14;
  }
  if (v4 != 7)
  {
    if (v4 != 8) {
      goto LABEL_14;
    }
    uint64_t v7 = [v3 URL];
    goto LABEL_10;
  }
  id v6 = [v3 firstChildForElementType:49];
LABEL_13:
  v8 = v6;
  uint64_t v5 = [v6 resourceCacheKey];

LABEL_14:
  return v5;
}

- (void)invalidateAllEditorialLayouts
{
}

- (BOOL)isEditorialLayoutExpanded:(id)a3
{
  return [(NSHashTable *)self->_expandedEditorialLayouts containsObject:a3];
}

- (BOOL)loadImageForArtwork:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[SSVURLDataConsumer consumer];
  LOBYTE(a4) = [(SUUIViewElementLayoutContext *)self loadImageForArtwork:v6 dataConsumer:v7 reason:a4];

  return a4;
}

- (BOOL)loadImageForArtwork:(id)a3 dataConsumer:(id)a4 reason:(int64_t)a5
{
  id v8 = a4;
  uint64_t v9 = [a3 URL];
  if (v9) {
    BOOL v10 = [(SUUIViewElementLayoutContext *)self _loadImageForURL:v9 cacheKey:v9 dataConsumer:v8 reason:a5];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)loadImageForBadgeElement:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 URL];
  id v8 = [v6 style];
  uint64_t v9 = [v8 imageMaskColor];

  if (v9)
  {
    BOOL v10 = [(SUUIViewElementLayoutContext *)self loadTemplatedImageForBadgeElement:v6 reason:a4];
  }
  else if (v7)
  {
    double v11 = +[SSVURLDataConsumer consumer];
    BOOL v10 = [(SUUIViewElementLayoutContext *)self _loadImageForURL:v7 cacheKey:v7 dataConsumer:v11 reason:a4];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)loadTemplatedImageForBadgeElement:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 URL];
  if (v7)
  {
    id v8 = +[SSVURLDataConsumer consumer];
    uint64_t v9 = [v6 style];
    BOOL v10 = [v9 imageMaskColor];

    if (v10)
    {
      double v11 = [v10 color];
      if ([v10 colorType] == 1 || !v11)
      {
        uint64_t v12 = [(SUUIViewElementLayoutContext *)self tintColor];

        double v11 = (void *)v12;
      }
      [v8 setTemplateColor:v11];
      uint64_t v13 = (uint64_t)v8;
    }
    else
    {
      uint64_t v13 = +[SSVURLDataConsumer consumer];
      double v11 = (void *)v13;
    }
    BOOL v14 = [(SUUIViewElementLayoutContext *)self _loadImageForURL:v7 cacheKey:v7 dataConsumer:v13 reason:a4];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)loadImageForImageElement:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(SUUIViewElementLayoutContext *)self dataConsumerForImageElement:v6];
  LOBYTE(a4) = [(SUUIViewElementLayoutContext *)self loadImageForImageElement:v6 reason:a4 dataConsumer:v7];

  return a4;
}

- (BOOL)loadImageForImageElement:(id)a3 reason:(int64_t)a4 dataConsumer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [v8 URL];
  if (v10)
  {
    double v11 = [v8 URL];
    uint64_t v12 = [v8 resourceCacheKey];
    BOOL v13 = [(SUUIViewElementLayoutContext *)self _loadImageForURL:v11 cacheKey:v12 dataConsumer:v9 reason:a4];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)dataConsumerForImageElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 style];
  id v6 = [v5 imageMaskColor];

  if (v6)
  {
    uint64_t v7 = +[SSVURLDataConsumer consumer];
    id v8 = [v6 color];
    if ([v6 colorType] == 1 || !v8)
    {
      uint64_t v9 = [(SUUIViewElementLayoutContext *)self tintColor];

      id v8 = (void *)v9;
    }
    [(SUUIStyledImageDataConsumer *)v7 setTemplateColor:v8];
  }
  else
  {
    uint64_t v7 = [[SUUIStyledImageDataConsumer alloc] initWithViewElement:v4];
    [(SUUIViewElementLayoutContext *)self _sizeForImageElement:v4 applyTransform:0];
    -[SUUIStyledImageDataConsumer setImageSize:](v7, "setImageSize:");
  }

  return v7;
}

- (id)placeholderImageForImageElement:(id)a3 dataConsumer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SUUIViewElementLayoutContext *)self _sizeForImageElement:v7 applyTransform:0];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [v7 style];
  BOOL v13 = [v12 imageTreatment];
  uint64_t v14 = SUUIImageTreatmentForString(v13);

  v15 = [v7 style];

  v16 = [v15 imagePlaceholderBackgroundColor];

  if ([v16 colorType] == 4)
  {
    objc_super v17 = 0;
    goto LABEL_8;
  }
  v18 = -[SUUIPlaceholderImageKey initWithSize:imageTreatment:placeholderBackgroundColor:]([SUUIPlaceholderImageKey alloc], "initWithSize:imageTreatment:placeholderBackgroundColor:", v14, v16, v9, v11);
  v19 = [(SUUIViewElementLayoutContext *)self placeholderImageCache];
  objc_super v17 = [v19 objectForKey:v18];

  if (!v17)
  {
    uint64_t v20 = [v16 color];

    if (!v20)
    {
      objc_super v17 = [v6 imageForColor:self->_placeholderColor];
      if (!v17) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    v21 = [v16 color];
    v22 = [v6 imageForColor:v21];
    objc_super v17 = [v22 imageWithRenderingMode:1];

    if (v17)
    {
LABEL_6:
      v23 = [(SUUIViewElementLayoutContext *)self placeholderImageCache];
      [v23 setObject:v17 forKey:v18];
    }
  }
LABEL_7:

LABEL_8:
  return v17;
}

- (int64_t)maxWidthForElement:(id)a3 withDefaultWidth:(int64_t)a4
{
  uint64_t v5 = [a3 style];
  id v6 = [v5 maxWidth];

  [(id)objc_opt_class() _calculateValueFromString:v6 withDefault:(double)a4 coefficent:(double)a4];
  if (v7 < 0.0) {
    double v7 = -v7;
  }
  int64_t v8 = (uint64_t)v7;

  return v8;
}

- (id)placeholderImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = -[SUUIPlaceholderImageKey initWithSize:imageTreatment:placeholderBackgroundColor:]([SUUIPlaceholderImageKey alloc], "initWithSize:imageTreatment:placeholderBackgroundColor:", 0, 0, a3.width, a3.height);
  double v7 = [(SUUIViewElementLayoutContext *)self placeholderImageCache];
  int64_t v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    double v9 = objc_alloc_init(SUUIStyledImageDataConsumer);
    -[SUUIStyledImageDataConsumer setImageSize:](v9, "setImageSize:", width, height);
    [(SUUIStyledImageDataConsumer *)v9 setImageTreatment:0];
    int64_t v8 = [(SUUIStyledImageDataConsumer *)v9 imageForColor:self->_placeholderColor];
    if (v8)
    {
      double v10 = [(SUUIViewElementLayoutContext *)self placeholderImageCache];
      [v10 setObject:v8 forKey:v6];
    }
  }

  return v8;
}

- (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 elementType];
  BOOL v8 = 0;
  if (v7 <= 61)
  {
    switch(v7)
    {
      case '(':
        double v9 = SUUIFilterBarView;
        goto LABEL_17;
      case ')':
      case '*':
      case '+':
      case ',':
      case '-':
      case '.':
      case '/':
        goto LABEL_19;
      case '0':
        double v9 = SUUISectionHeaderView;
        goto LABEL_17;
      case '1':
        char v11 = [(SUUIViewElementLayoutContext *)self loadImageForImageElement:v6 reason:a4];
        goto LABEL_18;
      case '2':
        uint64_t v10 = [v6 buttonImage];
        goto LABEL_13;
      case '3':
        double v9 = SUUIImageDeckView;
        goto LABEL_17;
      default:
        if (v7 != 8) {
          goto LABEL_19;
        }
        char v11 = [(SUUIViewElementLayoutContext *)self loadImageForBadgeElement:v6 reason:a4];
        break;
    }
    goto LABEL_18;
  }
  switch(v7)
  {
    case 62:
      double v9 = SUUIHorizontalListView;
LABEL_17:
      char v11 = [(__objc2_class *)v9 prefetchResourcesForViewElement:v6 reason:a4 context:self];
LABEL_18:
      BOOL v8 = v11;
      break;
    case 77:
      double v9 = SUUIOfferView;
      goto LABEL_17;
    case 152:
      uint64_t v10 = [v6 thumbnailImage];
LABEL_13:
      uint64_t v12 = (void *)v10;
      BOOL v8 = [(SUUIViewElementLayoutContext *)self loadImageForImageElement:v10 reason:a4];

      break;
  }
LABEL_19:

  return v8;
}

- (id)requestIdentifierForArtwork:(id)a3
{
  id v4 = [(SUUIViewElementLayoutContext *)self imageResourceCacheKeyForArtwork:a3];
  uint64_t v5 = [(SUUIViewElementLayoutContext *)self requestIdentifierForResourceCacheKey:v4];

  return v5;
}

- (id)requestIdentifierForResourceCacheKey:(id)a3
{
  if (a3)
  {
    id v4 = -[SUUIResourceLoader requestIdentifierForCacheKey:](self->_resourceLoader, "requestIdentifierForCacheKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)requestIdentifierForViewElement:(id)a3
{
  id v4 = [(SUUIViewElementLayoutContext *)self imageResourceCacheKeyForViewElement:a3];
  uint64_t v5 = [(SUUIViewElementLayoutContext *)self requestIdentifierForResourceCacheKey:v4];

  return v5;
}

- (void)setAggregateValue:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v12;
  id v8 = v6;
  aggregateValues = self->_aggregateValues;
  if (v12)
  {
    if (!aggregateValues)
    {
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      char v11 = self->_aggregateValues;
      self->_aggregateValues = v10;

      id v7 = v12;
      aggregateValues = self->_aggregateValues;
    }
    [(NSMutableDictionary *)aggregateValues setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)aggregateValues removeObjectForKey:v8];
  }
}

- (void)setBlurColor:(id)a3 cacheKey:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[NSMapTable setObject:forKey:](self->_blurColors, "setObject:forKey:");
    }
  }
}

- (void)setLargeScreenElementPaddingFromContext:(id)a3
{
  id v24 = a3;
  long long v4 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *(_OWORD *)&self->_largeScreenElementPadding.top = *MEMORY[0x263F834E8];
  *(_OWORD *)&self->_largeScreenElementPadding.bottom = v4;
  uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
  id v6 = [v5 bundleIdentifier];
  char v7 = [v6 isEqual:@"com.apple.Music"];

  if ((v7 & 1) == 0)
  {
    id v8 = [v24 collectionView];
    [v8 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v26.origin.x = v10;
    v26.origin.y = v12;
    v26.size.double width = v14;
    v26.size.double height = v16;
    if (CGRectGetHeight(v26) >= 1024.0)
    {
      v27.origin.x = v10;
      v27.origin.y = v12;
      v27.size.double width = v14;
      v27.size.double height = v16;
      if (CGRectGetWidth(v27) >= 1024.0)
      {
        __asm { FMOV            V0.2D, #20.0 }
        *(_OWORD *)&self->_largeScreenElementPadding.top = _Q0;
        *(_OWORD *)&self->_largeScreenElementPadding.bottom = _Q0;
      }
    }
    [v24 activePageWidth];
    if (v22 == 455.0 || ([v24 activePageWidth], v23 == 341.0))
    {
      *(_OWORD *)&self->_largeScreenElementPadding.top = xmmword_2568A1330;
      *(_OWORD *)&self->_largeScreenElementPadding.bottom = xmmword_2568A1340;
    }
  }
}

- (CGSize)sizeForBadgeElement:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v6 = v5;
  double v7 = v4;
  if (v5 == *MEMORY[0x263F001B0] && v4 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    double v9 = [v3 resourceName];
    CGFloat v10 = v9;
    if (v9 && (SUUIImageWithResourceName(v9), (double v11 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v3 fallbackImage], (double v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v11 size];
      double v6 = v12;
      double v7 = v13;
    }
  }

  double v14 = v6;
  double v15 = v7;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)sizeForImageElement:(id)a3
{
  [(SUUIViewElementLayoutContext *)self _sizeForImageElement:a3 applyTransform:1];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)sizeForItemOfferButton:(id)a3
{
  id v4 = a3;
  double v5 = [v4 buttonText];
  double v6 = [v5 string];

  uint64_t v7 = [v4 itemIdentifier];
  if (v7)
  {
    uint64_t v8 = v7;
    double v9 = +[SUUIItemStateCenter defaultCenter];
    CGFloat v10 = [v9 stateForItemWithIdentifier:v8];

    if (([v10 state] & 3) != 0)
    {

      double v11 = 26.0;
      double v12 = 26.0;
      goto LABEL_18;
    }
    if ([v10 state])
    {
      double v13 = [v4 parent];
      double v14 = [v13 attributes];
      double v15 = [v14 objectForKey:@"supportsPlayButton"];
      char v16 = [v15 BOOLValue];

      if ((v16 & 1) == 0)
      {
        uint64_t v17 = +[SUUIItemOfferButton localizedTitleForItemState:v10 clientContext:self->_clientContext];

        double v6 = (void *)v17;
      }
    }
  }
  if (v6)
  {
    v18 = [(NSMutableDictionary *)self->_itemOfferButtonSizes objectForKey:v6];
    if (v18)
    {
      v19 = v18;
      [(SUUISizeValue *)v18 size];
      double v12 = v20;
      double v11 = v21;
    }
    else
    {
      [(SUUIItemOfferButton *)self->_itemOfferButton setImage:0];
      [(SUUIItemOfferButton *)self->_itemOfferButton setTitle:v6];
      -[SUUIItemOfferButton sizeThatFits:](self->_itemOfferButton, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
      double v12 = v28;
      double v11 = v29;
      v19 = -[SUUISizeValue initWithSize:]([SUUISizeValue alloc], "initWithSize:", v28, v29);
      [(NSMutableDictionary *)self->_itemOfferButtonSizes setObject:v19 forKey:v6];
    }
  }
  else if ([v4 buttonViewType] == 3)
  {
    double v22 = (void *)sizeForItemOfferButton__sDownloadButtonSize;
    if (!sizeForItemOfferButton__sDownloadButtonSize)
    {
      [(SUUIItemOfferButton *)self->_itemOfferButton setTitle:0];
      [(SUUIItemOfferButton *)self->_itemOfferButton showCloudImage];
      double v23 = [SUUISizeValue alloc];
      -[SUUIItemOfferButton sizeThatFits:](self->_itemOfferButton, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
      uint64_t v24 = -[SUUISizeValue initWithSize:](v23, "initWithSize:");
      id v25 = (void *)sizeForItemOfferButton__sDownloadButtonSize;
      sizeForItemOfferButton__sDownloadButtonSize = v24;

      double v22 = (void *)sizeForItemOfferButton__sDownloadButtonSize;
    }
    [v22 size];
    double v12 = v26;
    double v11 = v27;
  }
  else
  {
    double v12 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
LABEL_18:

  double v30 = v12;
  double v31 = v11;
  result.double height = v31;
  result.double width = v30;
  return result;
}

- (CGSize)sizeForViewElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  double v8 = *MEMORY[0x263F001B0];
  double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  uint64_t v9 = [v6 elementType];
  if (v9 <= 76)
  {
    if (v9 > 39)
    {
      switch(v9)
      {
        case '(':
          CGFloat v10 = SUUIFilterBarView;
          goto LABEL_49;
        case ')':
        case '*':
        case '+':
        case ',':
        case '-':
        case '.':
        case '/':
          goto LABEL_68;
        case '0':
          CGFloat v10 = SUUISectionHeaderView;
          goto LABEL_49;
        case '1':
          [(SUUIViewElementLayoutContext *)self _sizeForImageElement:v6 applyTransform:1];
          goto LABEL_50;
        case '2':
          uint64_t v32 = [v6 buttonImage];
          goto LABEL_52;
        case '3':
          CGFloat v10 = SUUIImageDeckView;
          goto LABEL_49;
        default:
          if (v9 == 62)
          {
            CGFloat v10 = SUUIHorizontalListView;
            goto LABEL_49;
          }
          if (v9 != 69) {
            goto LABEL_68;
          }
          id v20 = [v6 titleItem];
          [(SUUIViewElementTextLayoutCache *)self->_labelLayoutCache sizeForViewElement:v20 width:a4];
          break;
      }
      goto LABEL_54;
    }
    if (v9 <= 12)
    {
      if (v9 == 8)
      {
        id v20 = v6;
        if ([v20 badgeType] == 1)
        {
          v33 = [(SUUIViewElementTextLayoutCache *)self->_labelLayoutCache layoutForWidth:(uint64_t)a4 viewElement:v20];
          if (v33)
          {
            +[SUUIAttributedStringView sizeWithLayout:v33 treatment:1];
            double v8 = v34;
            double v7 = v35;
          }

          goto LABEL_67;
        }
        [(SUUIViewElementLayoutContext *)self sizeForBadgeElement:v20];
LABEL_54:
        double v8 = v21;
        double v7 = v22;
LABEL_67:

        goto LABEL_68;
      }
      if (v9 == 12)
      {
        [(SUUIViewElementTextLayoutCache *)self->_labelLayoutCache sizeForButton:v6 width:a4];
        double v8 = v11;
        double v7 = v12;
        switch([v6 buttonViewType])
        {
          case 0:
          case 8:
          case 10:
          case 11:
          case 13:
            double v13 = [SUUIButtonBorderStyle alloc];
            double v14 = [v6 style];
            double v15 = [(SUUIButtonBorderStyle *)v13 initWithElementStyle:v14];

            +[SUUIStyledButton sizeForTextSize:buttonType:borderStyle:](SUUIStyledButton, "sizeForTextSize:buttonType:borderStyle:", 0, v15, v8, v7);
            double v8 = v16;
            double v7 = v17;
            goto LABEL_76;
          case 1:
            double v45 = v8;
            double v46 = v7;
            uint64_t v47 = 3;
            goto LABEL_72;
          case 6:
            v48 = [SUUIButtonBorderStyle alloc];
            v49 = [v6 style];
            double v15 = [(SUUIButtonBorderStyle *)v48 initWithElementStyle:v49];

            +[SUUIStyledButton sizeForTextSize:buttonType:borderStyle:](SUUIStyledButton, "sizeForTextSize:buttonType:borderStyle:", +[SUUIStyledButton buttonTypeForElement:v6], v15, v8, v7);
            double v51 = v50;
            double v53 = v52;
            v54 = [v6 style];
            [v54 elementPadding];
            double v56 = v55;
            double v58 = v57;
            double v60 = v59;
            double v62 = v61;

            double v8 = v51 + v58 + v62;
            double v7 = v53 + v56 + v60;
            goto LABEL_76;
          case 7:
            double v45 = v8;
            double v46 = v7;
            uint64_t v47 = 4;
LABEL_72:
            +[SUUIStyledButton sizeForTextSize:buttonType:](SUUIStyledButton, "sizeForTextSize:buttonType:", v47, v45, v46);
            goto LABEL_50;
          case 12:
            CGFloat v10 = SUUIPlayButton;
            goto LABEL_49;
          default:
            goto LABEL_68;
        }
      }
      goto LABEL_68;
    }
    if (v9 != 13)
    {
      if (v9 == 32)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v15 = (SUUIButtonBorderStyle *)v6;
          if ([(SUUIButtonBorderStyle *)v15 dividerType] == 3)
          {
            double v23 = [(SUUIButtonBorderStyle *)v15 style];
            uint64_t v24 = [v23 itemHeight];

            if (v24)
            {
              [v24 floatValue];
              double v7 = v25;
            }
            else
            {
              double v7 = 10.0;
            }

            double v8 = 0.0;
          }
LABEL_76:
        }
      }
      goto LABEL_68;
    }
    [(SUUIViewElementLayoutContext *)self sizeForItemOfferButton:v6];
LABEL_50:
    double v8 = v18;
    double v7 = v19;
    goto LABEL_68;
  }
  if (v9 > 134)
  {
    switch(v9)
    {
      case 135:
        CGFloat v10 = SUUIStarRatingViewElementView;
        goto LABEL_49;
      case 136:
      case 137:
      case 139:
      case 140:
      case 142:
      case 143:
        goto LABEL_68;
      case 138:
        double v26 = [(NSMapTable *)self->_editorialLayouts objectForKey:v6];
        if (v26)
        {
          objc_msgSend(v26, "layoutHeightForOrientation:expanded:", 0, -[SUUIViewElementLayoutContext isEditorialLayoutExpanded:](self, "isEditorialLayoutExpanded:", v26));
          double v7 = v27;
        }
        else
        {
          [(SUUIViewElementTextLayoutCache *)self->_labelLayoutCache estimatedSizeForLabel:v6 width:a4];
          a4 = v36;
          double v7 = v37;
        }

        double v8 = a4;
        goto LABEL_68;
      case 141:
        id v20 = v6;
        uint64_t v28 = [v20 itemIdentifier];
        if (v28)
        {
          uint64_t v29 = v28;
          double v30 = +[SUUIItemStateCenter defaultCenter];
          double v31 = [v30 stateForItemWithIdentifier:v29];
        }
        else
        {
          double v31 = [v20 storeIdentifier];

          if (!v31) {
            goto LABEL_60;
          }
          double v30 = +[SUUIItemStateCenter defaultCenter];
          v38 = [v20 storeIdentifier];
          double v31 = [v30 stateForItemWithStoreIdentifier:v38];
        }
LABEL_60:
        if (+[SUUIStyledButton usesItemOfferAppearanceForButtonType:1 itemState:v31])
        {
          [(SUUIViewElementLayoutContext *)self sizeForItemOfferButton:v20];
        }
        else
        {
          if (a4 < 0.00000011920929)
          {
            [(SUUIViewElementLayoutContext *)self sizeForItemOfferButton:v20];
            double v7 = v41;
            double v8 = v42 + -20.0;
            goto LABEL_66;
          }
          [(SUUIViewElementTextLayoutCache *)self->_labelLayoutCache sizeForButton:v20 width:a4];
          +[SUUIStyledButton sizeForTextSize:buttonType:](SUUIStyledButton, "sizeForTextSize:buttonType:", 1);
        }
        double v8 = v39;
        double v7 = v40;
LABEL_66:

        goto LABEL_67;
      case 144:
        CGFloat v10 = SUUITomatoRatingView;
        goto LABEL_49;
      default:
        if (v9 == 152)
        {
          uint64_t v32 = [v6 thumbnailImage];
LABEL_52:
          id v20 = (id)v32;
          [(SUUIViewElementLayoutContext *)self _sizeForImageElement:v32 applyTransform:1];
          goto LABEL_54;
        }
        if (v9 != 154) {
          goto LABEL_68;
        }
        CGFloat v10 = SUUIImageGridView;
        break;
    }
    goto LABEL_49;
  }
  if (v9 <= 108)
  {
    if (v9 != 77)
    {
      if (v9 != 80) {
        goto LABEL_68;
      }
      [(SUUIViewElementTextLayoutCache *)self->_labelLayoutCache estimatedSizeForOrdinal:v6 width:a4];
      goto LABEL_50;
    }
    CGFloat v10 = SUUIOfferView;
LABEL_49:
    [(__objc2_class *)v10 sizeThatFitsWidth:v6 viewElement:self context:a4];
    goto LABEL_50;
  }
  if (v9 == 109)
  {
    double v8 = 0.0;
    double v7 = 29.0;
    goto LABEL_68;
  }
  if (v9 == 131)
  {
    CGFloat v10 = SUUIStackListCollectionViewCell;
    goto LABEL_49;
  }
LABEL_68:

  double v43 = v8;
  double v44 = v7;
  result.double height = v44;
  result.double width = v43;
  return result;
}

- (id)textPropertiesForViewElement:(id)a3 width:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 elementType];
  if (v7 == 138)
  {
    uint64_t v9 = [(NSMapTable *)self->_editorialLayouts objectForKey:v6];
    CGFloat v10 = v9;
    if (v9)
    {
      double v11 = [v9 bodyTextLayoutForOrientation:0];
      if (v11)
      {
        double v12 = [[SUUIViewTextProperties alloc] initWithTextLayout:v11 isExpanded:[(SUUIViewElementLayoutContext *)self isEditorialLayoutExpanded:v10]];
LABEL_10:
        double v8 = v12;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      double v11 = [(SUUIViewElementTextLayoutCache *)self->_labelLayoutCache layoutForWidth:(uint64_t)a4 viewElement:v6];
      if (v11)
      {
        double v12 = [[SUUIViewTextProperties alloc] initWithStringLayout:v11];
        goto LABEL_10;
      }
    }
    double v8 = 0;
    goto LABEL_12;
  }
  if (v7 == 135)
  {
    double v8 = +[SUUIStarRatingViewElementView textPropertiesForViewElement:v6 width:self context:a4];
  }
  else
  {
    double v8 = 0;
  }
LABEL_13:

  return v8;
}

- (id)transientRequestIdentifierForViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 elementType];
  switch(v5)
  {
    case 152:
      double v8 = [v4 thumbnailImage];
      break;
    case 50:
      double v8 = [v4 buttonImage];
      break;
    case 49:
      id v6 = [v4 transientResourceCacheKey];
      if (!v6) {
        goto LABEL_5;
      }
      goto LABEL_9;
    default:
      goto LABEL_5;
  }
  uint64_t v9 = v8;
  id v6 = [v8 transientResourceCacheKey];

  if (!v6)
  {
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = [(SUUIResourceLoader *)self->_resourceLoader requestIdentifierForCacheKey:v6];

LABEL_10:
  return v7;
}

- (void)_artworkRequestDidLoadImageNotification:(id)a3
{
  id v9 = a3;
  id v4 = [v9 object];
  uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v4, "requestIdentifier"));
  if ([(NSMutableSet *)self->_observedArtworkRequestIDs containsObject:v5])
  {
    id v6 = [v9 userInfo];
    uint64_t v7 = [v6 objectForKey:@"SUUIArtworkRequestImageKey"];

    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_artworkRequestDelegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained artworkRequest:v4 didLoadImage:v7];
      }
    }
    [(NSMutableSet *)self->_observedArtworkRequestIDs removeObject:v5];
  }
}

+ (double)_calculateValueFromString:(id)a3 withDefault:(double)a4 coefficent:(double)a5
{
  id v7 = a3;
  if ([v7 length])
  {
    double v8 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v9 = [v7 stringByTrimmingCharactersInSet:v8];
    CGFloat v10 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v9];
    double v14 = 0.0;
    a4 = 0.0;
    if ([v10 scanDouble:&v14])
    {
      int v11 = [v10 scanString:@"%" intoString:0];
      a4 = v14;
      if (v14 > 0.0 && v11 != 0) {
        a4 = floor(v14 * a5 / 100.0);
      }
    }
  }
  return a4;
}

- (BOOL)_loadImageForURL:(id)a3 cacheKey:(id)a4 dataConsumer:(id)a5 reason:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = [(SUUIResourceLoader *)self->_resourceLoader requestIdentifierForCacheKey:v11];
  double v14 = v13;
  if (v13
    && -[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_resourceLoader, "trySetReason:forRequestWithIdentifier:", a6, [v13 unsignedIntegerValue]))
  {
    [(NSMutableSet *)self->_observedArtworkRequestIDs addObject:v14];
    BOOL v15 = 0;
  }
  else
  {
    double v16 = objc_alloc_init(SUUIArtworkRequest);
    [(SUUIResourceRequest *)v16 setCacheKey:v11];
    [(SUUIArtworkRequest *)v16 setDataConsumer:v12];
    [(SUUIArtworkRequest *)v16 setURL:v10];
    double v17 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v16, "requestIdentifier"));
    [(NSMutableSet *)self->_observedArtworkRequestIDs addObject:v17];
    BOOL v15 = [(SUUIResourceLoader *)self->_resourceLoader loadResourceWithRequest:v16 reason:a6];
  }
  return v15;
}

- (CGSize)_sizeForImageElement:(id)a3 applyTransform:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [v5 size];
  double v8 = v7;
  double v9 = v6;
  if (v7 == *MEMORY[0x263F001B0] && v6 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    id v11 = [v5 resourceName];
    id v12 = v11;
    if (v11)
    {
      double v13 = SUUIImageWithResourceName(v11);
      if (v13)
      {
        double v14 = v13;
        [v13 size];
        double v8 = v15;
        double v9 = v16;
      }
    }
  }
  double v17 = [v5 style];
  double v18 = v17;
  if (v4 && v17)
  {
    [v17 transform];
    double v19 = v9 * v24 + v22 * v8;
    double v9 = fabs(floor(v9 * v25 + v23 * v8));
    double v8 = fabs(floor(v19));
  }

  double v20 = v8;
  double v21 = v9;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (double)activePageWidth
{
  return self->_activePageWidth;
}

- (void)setActivePageWidth:(double)a3
{
  self->_activePageWidth = a3;
}

- (SUUIArtworkRequestDelegate)artworkRequestDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_artworkRequestDelegate);
  return (SUUIArtworkRequestDelegate *)WeakRetained;
}

- (void)setArtworkRequestDelegate:(id)a3
{
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (unint64_t)containerViewElementType
{
  return self->_containerViewElementType;
}

- (void)setContainerViewElementType:(unint64_t)a3
{
  self->_containerViewElementType = a3;
}

- (SUUIViewElementTextLayoutCache)labelLayoutCache
{
  return self->_labelLayoutCache;
}

- (void)setLabelLayoutCache:(id)a3
{
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (SUUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (void)setPlaceholderColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (UIEdgeInsets)largeScreenElementPadding
{
  double top = self->_largeScreenElementPadding.top;
  double left = self->_largeScreenElementPadding.left;
  double bottom = self->_largeScreenElementPadding.bottom;
  double right = self->_largeScreenElementPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (void)setBackdropGroupName:(id)a3
{
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_labelLayoutCache, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_artworkRequestDelegate);
  objc_storeStrong((id *)&self->_blurColors, 0);
  objc_storeStrong((id *)&self->_observedArtworkRequestIDs, 0);
  objc_storeStrong((id *)&self->_itemOfferButtonSizes, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_expandedEditorialLayouts, 0);
  objc_storeStrong((id *)&self->_editorialLayouts, 0);
  objc_storeStrong((id *)&self->_borderDrawingCache, 0);
  objc_storeStrong((id *)&self->_badgeImageLoader, 0);
  objc_storeStrong((id *)&self->_aggregateValues, 0);
}

@end