@interface _UIImageViewStorage
+ (id)storageForImageView:(id)a3;
- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory;
- (BOOL)isEnqueueingLoad;
- (BOOL)isHighlighted;
- (BOOL)isStartingLoad;
- (BOOL)isStoppingLoad;
- (BOOL)masksTemplateImages;
- (NSArray)animationImages;
- (NSArray)highlightedAnimationImages;
- (NSMapTable)layouts;
- (UIImage)highlightedImage;
- (UIImage)image;
- (UIImage)imageBeingSetByLoader;
- (UIImage)resolvedHighlightedImage;
- (UIImage)resolvedImage;
- (UIImageSymbolConfiguration)overridingSymbolConfiguration;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (UILayoutGuide)imageContentGuide;
- (UIView)placeholderView;
- (_UIImageCIImageRenderer)CIRenderer;
- (_UIImageLoader)imageLoader;
- (_UIImageSymbolVariant)preferredSymbolVariant;
- (_UIImageViewLoadingDelegate)loadingDelegate;
- (double)animationDuration;
- (id)extendedStorage;
- (id)simpleStorage;
- (int64_t)animationRepeatCount;
- (int64_t)defaultRenderingMode;
- (unsigned)drawMode;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:(BOOL)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationImages:(id)a3;
- (void)setAnimationRepeatCount:(int64_t)a3;
- (void)setCIRenderer:(id)a3;
- (void)setDefaultRenderingMode:(int64_t)a3;
- (void)setDrawMode:(unsigned int)a3;
- (void)setEnqueueingLoad:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedAnimationImages:(id)a3;
- (void)setHighlightedImage:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageBeingSetByLoader:(id)a3;
- (void)setImageContentGuide:(id)a3;
- (void)setImageLoader:(id)a3;
- (void)setLayouts:(id)a3;
- (void)setLoadingDelegate:(id)a3;
- (void)setMasksTemplateImages:(BOOL)a3;
- (void)setOverridingSymbolConfiguration:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setPreferredSymbolConfiguration:(id)a3;
- (void)setPreferredSymbolVariant:(id)a3;
- (void)setResolvedHighlightedImage:(id)a3;
- (void)setResolvedImage:(id)a3;
- (void)setStartingLoad:(BOOL)a3;
- (void)setStoppingLoad:(BOOL)a3;
@end

@implementation _UIImageViewStorage

- (int64_t)defaultRenderingMode
{
  return [(_UIImageViewStorage *)self->_storage defaultRenderingMode];
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return [(_UIImageViewStorage *)self->_storage preferredSymbolConfiguration];
}

- (UIImageSymbolConfiguration)overridingSymbolConfiguration
{
  return [(_UIImageViewStorage *)self->_storage overridingSymbolConfiguration];
}

- (_UIImageSymbolVariant)preferredSymbolVariant
{
  return [(_UIImageViewStorage *)self->_storage preferredSymbolVariant];
}

- (BOOL)isHighlighted
{
  return [(_UIImageViewStorage *)self->_storage isHighlighted];
}

- (NSMapTable)layouts
{
  return [(_UIImageViewStorage *)self->_storage layouts];
}

- (UIImage)imageBeingSetByLoader
{
  return [(_UIImageViewStorage *)self->_storage imageBeingSetByLoader];
}

- (UIView)placeholderView
{
  return [(_UIImageViewStorage *)self->_storage placeholderView];
}

- (void)setCIRenderer:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self CIRenderer];

  if (v4 != v6)
  {
    v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setCIRenderer:v6];
  }
}

- (_UIImageCIImageRenderer)CIRenderer
{
  return [(_UIImageViewStorage *)self->_storage CIRenderer];
}

- (void)setResolvedHighlightedImage:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self resolvedHighlightedImage];

  if (v4 != v6)
  {
    v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setResolvedHighlightedImage:v6];
  }
}

- (void)setImage:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self image];

  if (v4 != v6)
  {
    v5 = [(_UIImageViewStorage *)self simpleStorage];
    [v5 setImage:v6];
  }
}

- (void)setResolvedImage:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self resolvedImage];

  if (v4 != v6)
  {
    v5 = [(_UIImageViewStorage *)self simpleStorage];
    [v5 setResolvedImage:v6];
  }
}

- (id)simpleStorage
{
  p_storage = &self->_storage;
  v3 = self->_storage;
  if (!*p_storage)
  {
    id v4 = (_UIImageViewStorage *)objc_opt_new();

    objc_storeStrong((id *)p_storage, v4);
    v3 = v4;
  }
  return v3;
}

- (UIImage)highlightedImage
{
  return [(_UIImageViewStorage *)self->_storage highlightedImage];
}

- (UIImage)resolvedHighlightedImage
{
  return [(_UIImageViewStorage *)self->_storage resolvedHighlightedImage];
}

- (NSArray)animationImages
{
  return [(_UIImageViewStorage *)self->_storage animationImages];
}

- (NSArray)highlightedAnimationImages
{
  return [(_UIImageViewStorage *)self->_storage highlightedAnimationImages];
}

- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory
{
  return [(_UIImageViewStorage *)self->_storage adjustsImageSizeForAccessibilityContentSizeCategory];
}

- (UIImage)resolvedImage
{
  return [(_UIImageViewStorage *)self->_storage resolvedImage];
}

- (UIImage)image
{
  return [(_UIImageViewStorage *)self->_storage image];
}

- (unsigned)drawMode
{
  return [(_UIImageViewStorage *)self->_storage drawMode];
}

- (void)setLayouts:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self layouts];

  if (v4 != v6)
  {
    v5 = [(_UIImageViewStorage *)self simpleStorage];
    [v5 setLayouts:v6];
  }
}

+ (id)storageForImageView:(id)a3
{
  id v3 = a3;
  id v4 = (id *)objc_opt_new();
  objc_storeWeak(v4 + 1, v3);

  return v4;
}

- (_UIImageLoader)imageLoader
{
  return [(_UIImageViewStorage *)self->_storage imageLoader];
}

- (void)setDrawMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(_UIImageViewStorage *)self drawMode] != a3)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setDrawMode:v3];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if ([(_UIImageViewStorage *)self animationRepeatCount] >= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
    [WeakRetained _cleanUpForStopAnimating];
  }
}

- (UILayoutGuide)imageContentGuide
{
  return [(_UIImageViewStorage *)self->_storage imageContentGuide];
}

- (BOOL)masksTemplateImages
{
  return [(_UIImageViewStorage *)self->_storage masksTemplateImages];
}

- (void)setAnimationDuration:(double)a3
{
  [(_UIImageViewStorage *)self animationDuration];
  if (v5 != a3)
  {
    id v6 = [(_UIImageViewStorage *)self extendedStorage];
    [v6 setAnimationDuration:a3];
  }
}

- (double)animationDuration
{
  [(_UIImageViewStorage *)self->_storage animationDuration];
  return result;
}

- (void)setAnimationRepeatCount:(int64_t)a3
{
  if ([(_UIImageViewStorage *)self animationRepeatCount] != a3)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setAnimationRepeatCount:a3];
  }
}

- (int64_t)animationRepeatCount
{
  return [(_UIImageViewStorage *)self->_storage animationRepeatCount];
}

- (void)setAnimationImages:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self animationImages];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setAnimationImages:v6];
  }
}

- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIImageViewStorage *)self adjustsImageSizeForAccessibilityContentSizeCategory] != a3)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setAdjustsImageSizeForAccessibilityContentSizeCategory:v3];
  }
}

- (void)setHighlightedImage:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self highlightedImage];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setHighlightedImage:v6];
  }
}

- (void)setHighlightedAnimationImages:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self highlightedAnimationImages];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setHighlightedAnimationImages:v6];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIImageViewStorage *)self isHighlighted] != a3)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setHighlighted:v3];
  }
}

- (void)setDefaultRenderingMode:(int64_t)a3
{
  if ([(_UIImageViewStorage *)self defaultRenderingMode] != a3)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setDefaultRenderingMode:a3];
  }
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self preferredSymbolConfiguration];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setPreferredSymbolConfiguration:v6];
  }
}

- (id)extendedStorage
{
  p_storage = (id *)&self->_storage;
  id v4 = self->_storage;
  if (*p_storage)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = self;

    if ((void *)v5 != v6) {
      goto LABEL_6;
    }
    uint64_t v7 = [(_UIImageViewStorage *)self simpleStorage];
    v8 = +[_UIImageViewExtendedStorage storageFromSimpleStorage:v7];

    id v4 = (_UIImageViewStorage *)v7;
  }
  else
  {
    v8 = (_UIImageViewStorage *)objc_opt_new();
  }

  objc_storeStrong(p_storage, v8);
  id v4 = v8;
LABEL_6:
  return v4;
}

- (void)setOverridingSymbolConfiguration:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self overridingSymbolConfiguration];

  if (v4 != v6)
  {
    uint64_t v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setOverridingSymbolConfiguration:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_imageView);
}

- (void)setPreferredSymbolVariant:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self preferredSymbolVariant];

  if (v4 != v6)
  {
    uint64_t v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setPreferredSymbolVariant:v6];
  }
}

- (void)setImageContentGuide:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self imageContentGuide];

  if (v4 != v6)
  {
    uint64_t v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setImageContentGuide:v6];
  }
}

- (void)setImageLoader:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self imageLoader];

  if (v4 != v6)
  {
    uint64_t v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setImageLoader:v6];
  }
}

- (_UIImageViewLoadingDelegate)loadingDelegate
{
  return [(_UIImageViewStorage *)self->_storage loadingDelegate];
}

- (void)setLoadingDelegate:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self loadingDelegate];

  if (v4 != v6)
  {
    uint64_t v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setLoadingDelegate:v6];
  }
}

- (void)setImageBeingSetByLoader:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self imageBeingSetByLoader];

  if (v4 != v6)
  {
    uint64_t v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setImageBeingSetByLoader:v6];
  }
}

- (void)setPlaceholderView:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewStorage *)self placeholderView];

  if (v4 != v6)
  {
    uint64_t v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setPlaceholderView:v6];
  }
}

- (void)setMasksTemplateImages:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIImageViewStorage *)self masksTemplateImages] != a3)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setMasksTemplateImages:v3];
  }
}

- (BOOL)isStartingLoad
{
  return [(_UIImageViewStorage *)self->_storage isStartingLoad];
}

- (void)setStartingLoad:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIImageViewStorage *)self isStartingLoad] != a3)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setStartingLoad:v3];
  }
}

- (BOOL)isEnqueueingLoad
{
  return [(_UIImageViewStorage *)self->_storage isEnqueueingLoad];
}

- (void)setEnqueueingLoad:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIImageViewStorage *)self isEnqueueingLoad] != a3)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setEnqueueingLoad:v3];
  }
}

- (BOOL)isStoppingLoad
{
  return [(_UIImageViewStorage *)self->_storage isStoppingLoad];
}

- (void)setStoppingLoad:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIImageViewStorage *)self isStoppingLoad] != a3)
  {
    id v5 = [(_UIImageViewStorage *)self extendedStorage];
    [v5 setStoppingLoad:v3];
  }
}

@end