@interface _UIImageViewExtendedStorage
+ (id)storageFromSimpleStorage:(id)a3;
- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory;
- (BOOL)isEnqueueingLoad;
- (BOOL)isHighlighted;
- (BOOL)isStartingLoad;
- (BOOL)isStoppingLoad;
- (BOOL)masksTemplateImages;
- (double)animationDuration;
- (id)CIRenderer;
- (id)animationImages;
- (id)animationProperties;
- (id)highlightedAnimationImages;
- (id)highlightedImage;
- (id)highlightedImageProperties;
- (id)imageBeingSetByLoader;
- (id)imageContentGuide;
- (id)imageLoader;
- (id)imageLoadingProperties;
- (id)loadingDelegate;
- (id)overridingSymbolConfiguration;
- (id)placeholderView;
- (id)preferredSymbolConfiguration;
- (id)preferredSymbolVariant;
- (id)resolvedHighlightedImage;
- (id)uncommonProperties;
- (int64_t)animationRepeatCount;
- (int64_t)defaultRenderingMode;
- (unsigned)drawMode;
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
- (void)setImageBeingSetByLoader:(id)a3;
- (void)setImageContentGuide:(id)a3;
- (void)setImageLoader:(id)a3;
- (void)setLoadingDelegate:(id)a3;
- (void)setMasksTemplateImages:(BOOL)a3;
- (void)setOverridingSymbolConfiguration:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setPreferredSymbolConfiguration:(id)a3;
- (void)setPreferredSymbolVariant:(id)a3;
- (void)setResolvedHighlightedImage:(id)a3;
- (void)setStartingLoad:(BOOL)a3;
- (void)setStoppingLoad:(BOOL)a3;
@end

@implementation _UIImageViewExtendedStorage

- (int64_t)defaultRenderingMode
{
  return [(_UIImageViewUncommonProperties *)self->_uncommonProperties defaultRenderingMode];
}

- (id)preferredSymbolConfiguration
{
  return self->preferredSymbolConfiguration;
}

- (id)overridingSymbolConfiguration
{
  return [(_UIImageViewUncommonProperties *)self->_uncommonProperties overridingSymbolConfiguration];
}

- (id)preferredSymbolVariant
{
  return [(_UIImageViewUncommonProperties *)self->_uncommonProperties preferredSymbolVariant];
}

- (BOOL)isHighlighted
{
  return self->highlighted;
}

- (id)imageBeingSetByLoader
{
  return [(_UIImageViewImageLoadingProperties *)self->_imageLoadingProperties imageBeingSetByLoader];
}

- (id)highlightedImage
{
  return [(_UIImageViewImageProperties *)self->_highlightedImageProperties image];
}

- (id)resolvedHighlightedImage
{
  return [(_UIImageViewImageProperties *)self->_highlightedImageProperties resolvedImage];
}

- (id)animationImages
{
  return [(_UIImageViewAnimationProperties *)self->_animationProperties animationImages];
}

- (id)highlightedAnimationImages
{
  return [(_UIImageViewAnimationProperties *)self->_animationProperties highlightedAnimationImages];
}

- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory
{
  return self->adjustsImageSizeForAccessibilityContentSizeCategory;
}

- (unsigned)drawMode
{
  return [(_UIImageViewUncommonProperties *)self->_uncommonProperties drawMode];
}

- (id)placeholderView
{
  return [(_UIImageViewImageLoadingProperties *)self->_imageLoadingProperties placeholderView];
}

- (id)CIRenderer
{
  return [(_UIImageViewUncommonProperties *)self->_uncommonProperties CIRenderer];
}

- (id)imageLoader
{
  return [(_UIImageViewImageLoadingProperties *)self->_imageLoadingProperties imageLoader];
}

- (id)imageContentGuide
{
  return self->imageContentGuide;
}

- (BOOL)masksTemplateImages
{
  return self->masksTemplateImages;
}

- (double)animationDuration
{
  [(_UIImageViewAnimationProperties *)self->_animationProperties animationDuration];
  return result;
}

- (int64_t)animationRepeatCount
{
  return [(_UIImageViewAnimationProperties *)self->_animationProperties animationRepeatCount];
}

- (void)setAnimationImages:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewExtendedStorage *)self animationImages];

  if (v4 != v6)
  {
    v5 = [(_UIImageViewExtendedStorage *)self animationProperties];
    [v5 setAnimationImages:v6];
  }
}

- (void)setAnimationDuration:(double)a3
{
  [(_UIImageViewExtendedStorage *)self animationDuration];
  if (v5 != a3)
  {
    id v6 = [(_UIImageViewExtendedStorage *)self animationProperties];
    [v6 setAnimationDuration:a3];
  }
}

- (id)animationProperties
{
  animationProperties = self->_animationProperties;
  if (!animationProperties)
  {
    id v4 = (_UIImageViewAnimationProperties *)objc_opt_new();
    double v5 = self->_animationProperties;
    self->_animationProperties = v4;

    animationProperties = self->_animationProperties;
  }
  return animationProperties;
}

- (void)setDrawMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(_UIImageViewExtendedStorage *)self drawMode] != a3)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self uncommonProperties];
    [v5 setDrawMode:v3];
  }
}

- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:(BOOL)a3
{
  self->adjustsImageSizeForAccessibilityContentSizeCategory = a3;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
}

+ (id)storageFromSimpleStorage:(id)a3
{
  uint64_t v3 = (id *)a3;
  id v4 = (id *)objc_opt_new();
  objc_storeStrong(v4 + 1, v3[1]);

  return v4;
}

- (void)setDefaultRenderingMode:(int64_t)a3
{
  if ([(_UIImageViewExtendedStorage *)self defaultRenderingMode] != a3)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self uncommonProperties];
    [v5 setDefaultRenderingMode:a3];
  }
}

- (id)uncommonProperties
{
  uncommonProperties = self->_uncommonProperties;
  if (!uncommonProperties)
  {
    id v4 = (_UIImageViewUncommonProperties *)objc_opt_new();
    id v5 = self->_uncommonProperties;
    self->_uncommonProperties = v4;

    uncommonProperties = self->_uncommonProperties;
  }
  return uncommonProperties;
}

- (void)setOverridingSymbolConfiguration:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewExtendedStorage *)self overridingSymbolConfiguration];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self uncommonProperties];
    [v5 setOverridingSymbolConfiguration:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->imageContentGuide, 0);
  objc_storeStrong((id *)&self->preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_uncommonProperties, 0);
  objc_storeStrong((id *)&self->_imageLoadingProperties, 0);
  objc_storeStrong((id *)&self->_animationProperties, 0);
  objc_storeStrong((id *)&self->_highlightedImageProperties, 0);
}

- (id)highlightedImageProperties
{
  highlightedImageProperties = self->_highlightedImageProperties;
  if (!highlightedImageProperties)
  {
    id v4 = (_UIImageViewImageProperties *)objc_opt_new();
    id v5 = self->_highlightedImageProperties;
    self->_highlightedImageProperties = v4;

    highlightedImageProperties = self->_highlightedImageProperties;
  }
  return highlightedImageProperties;
}

- (id)imageLoadingProperties
{
  imageLoadingProperties = self->_imageLoadingProperties;
  if (!imageLoadingProperties)
  {
    id v4 = (_UIImageViewImageLoadingProperties *)objc_opt_new();
    id v5 = self->_imageLoadingProperties;
    self->_imageLoadingProperties = v4;

    imageLoadingProperties = self->_imageLoadingProperties;
  }
  return imageLoadingProperties;
}

- (void)setHighlightedImage:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewExtendedStorage *)self highlightedImage];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self highlightedImageProperties];
    [v5 setImage:v6];
  }
}

- (void)setResolvedHighlightedImage:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewExtendedStorage *)self resolvedHighlightedImage];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self highlightedImageProperties];
    [v5 setResolvedImage:v6];
  }
}

- (void)setHighlightedAnimationImages:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewExtendedStorage *)self highlightedAnimationImages];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self animationProperties];
    [v5 setHighlightedAnimationImages:v6];
  }
}

- (void)setAnimationRepeatCount:(int64_t)a3
{
  if ([(_UIImageViewExtendedStorage *)self animationRepeatCount] != a3)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self animationProperties];
    [v5 setAnimationRepeatCount:a3];
  }
}

- (void)setPreferredSymbolVariant:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewExtendedStorage *)self preferredSymbolVariant];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self uncommonProperties];
    [v5 setPreferredSymbolVariant:v6];
  }
}

- (void)setCIRenderer:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewExtendedStorage *)self CIRenderer];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self uncommonProperties];
    [v5 setCIRenderer:v6];
  }
}

- (void)setImageLoader:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewExtendedStorage *)self imageLoader];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self imageLoadingProperties];
    [v5 setImageLoader:v6];
  }
}

- (id)loadingDelegate
{
  return [(_UIImageViewImageLoadingProperties *)self->_imageLoadingProperties loadingDelegate];
}

- (void)setLoadingDelegate:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewExtendedStorage *)self loadingDelegate];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self imageLoadingProperties];
    [v5 setLoadingDelegate:v6];
  }
}

- (void)setImageBeingSetByLoader:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewExtendedStorage *)self imageBeingSetByLoader];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self imageLoadingProperties];
    [v5 setImageBeingSetByLoader:v6];
  }
}

- (void)setPlaceholderView:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewExtendedStorage *)self placeholderView];

  if (v4 != v6)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self imageLoadingProperties];
    [v5 setPlaceholderView:v6];
  }
}

- (BOOL)isStartingLoad
{
  return [(_UIImageViewImageLoadingProperties *)self->_imageLoadingProperties isStartingLoad];
}

- (void)setStartingLoad:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIImageViewExtendedStorage *)self isStartingLoad] != a3)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self imageLoadingProperties];
    [v5 setStartingLoad:v3];
  }
}

- (BOOL)isEnqueueingLoad
{
  return [(_UIImageViewImageLoadingProperties *)self->_imageLoadingProperties isEnqueueingLoad];
}

- (void)setEnqueueingLoad:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIImageViewExtendedStorage *)self isEnqueueingLoad] != a3)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self imageLoadingProperties];
    [v5 setEnqueueingLoad:v3];
  }
}

- (BOOL)isStoppingLoad
{
  return [(_UIImageViewImageLoadingProperties *)self->_imageLoadingProperties isStoppingLoad];
}

- (void)setStoppingLoad:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIImageViewExtendedStorage *)self isStoppingLoad] != a3)
  {
    id v5 = [(_UIImageViewExtendedStorage *)self imageLoadingProperties];
    [v5 setStoppingLoad:v3];
  }
}

- (void)setImageContentGuide:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  self->highlighted = a3;
}

- (void)setMasksTemplateImages:(BOOL)a3
{
  self->masksTemplateImages = a3;
}

@end