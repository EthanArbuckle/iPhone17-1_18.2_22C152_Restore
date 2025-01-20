@interface _UIImageViewSimpleStorage
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
- (id)imageProperties;
- (int64_t)animationRepeatCount;
- (int64_t)defaultRenderingMode;
- (unsigned)drawMode;
- (void)setImage:(id)a3;
- (void)setLayouts:(id)a3;
- (void)setResolvedImage:(id)a3;
@end

@implementation _UIImageViewSimpleStorage

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return 0;
}

- (UIImageSymbolConfiguration)overridingSymbolConfiguration
{
  return 0;
}

- (int64_t)defaultRenderingMode
{
  return 0;
}

- (_UIImageSymbolVariant)preferredSymbolVariant
{
  return 0;
}

- (BOOL)isHighlighted
{
  return 0;
}

- (NSMapTable)layouts
{
  return self->layouts;
}

- (UIImage)imageBeingSetByLoader
{
  return 0;
}

- (UIView)placeholderView
{
  return 0;
}

- (NSArray)animationImages
{
  return 0;
}

- (NSArray)highlightedAnimationImages
{
  return 0;
}

- (UIImage)highlightedImage
{
  return 0;
}

- (UIImage)resolvedHighlightedImage
{
  return 0;
}

- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory
{
  return 0;
}

- (UIImage)resolvedImage
{
  return [(_UIImageViewImageProperties *)self->_imageProperties resolvedImage];
}

- (UIImage)image
{
  return [(_UIImageViewImageProperties *)self->_imageProperties image];
}

- (void)setResolvedImage:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewSimpleStorage *)self resolvedImage];

  if (v4 != v6)
  {
    v5 = [(_UIImageViewSimpleStorage *)self imageProperties];
    [v5 setResolvedImage:v6];
  }
}

- (id)imageProperties
{
  imageProperties = self->_imageProperties;
  if (!imageProperties)
  {
    id v4 = (_UIImageViewImageProperties *)objc_opt_new();
    v5 = self->_imageProperties;
    self->_imageProperties = v4;

    imageProperties = self->_imageProperties;
  }
  return imageProperties;
}

- (unsigned)drawMode
{
  return 0;
}

- (void)setImage:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIImageViewSimpleStorage *)self image];

  if (v4 != v6)
  {
    v5 = [(_UIImageViewSimpleStorage *)self imageProperties];
    [v5 setImage:v6];
  }
}

- (_UIImageCIImageRenderer)CIRenderer
{
  return 0;
}

- (void)setLayouts:(id)a3
{
}

- (_UIImageLoader)imageLoader
{
  return 0;
}

- (UILayoutGuide)imageContentGuide
{
  return 0;
}

- (BOOL)masksTemplateImages
{
  return 0;
}

- (int64_t)animationRepeatCount
{
  return 0;
}

- (double)animationDuration
{
  return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->layouts, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
}

- (_UIImageViewLoadingDelegate)loadingDelegate
{
  return 0;
}

- (BOOL)isStartingLoad
{
  return 0;
}

- (BOOL)isEnqueueingLoad
{
  return 0;
}

- (BOOL)isStoppingLoad
{
  return 0;
}

@end