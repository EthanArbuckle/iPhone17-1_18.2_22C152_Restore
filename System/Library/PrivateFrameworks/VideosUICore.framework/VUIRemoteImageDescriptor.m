@interface VUIRemoteImageDescriptor
- (BOOL)animatesShadowChanges;
- (BOOL)clearsExisting;
- (BOOL)continuousBorder;
- (BOOL)displayScaleIsPointMultiplier;
- (BOOL)isTemplated;
- (BOOL)loadsImmediately;
- (BOOL)optimizedImageRendering;
- (BOOL)shouldRenderAsTemplate;
- (BOOL)sizeComputationOnly;
- (CGSize)boundingSize;
- (CGSize)containerSize;
- (CGSize)downloadSize;
- (NSShadow)shadow;
- (NSString)accessibilityText;
- (NSString)cropCode;
- (NSString)extension;
- (NSString)p3Specifier;
- (NSString)placeholderSrc;
- (NSString)src;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (UIColor)highlightColor;
- (UIColor)placeholderColor;
- (UIColor)tintColor;
- (VUIRemoteImageDescriptor)initWithSrc:(id)a3 size:(CGSize)a4;
- (VUIRemoteImageDescriptor)initWithSrc:(id)a3 size:(CGSize)a4 containerSize:(CGSize)a5;
- (_VUICornerRadii)borderRadii;
- (double)aspectRatio;
- (double)borderWidth;
- (int64_t)preferredVibrancy;
- (int64_t)scaleMode;
- (unint64_t)decoratorType;
- (void)setAccessibilityText:(id)a3;
- (void)setAnimatesShadowChanges:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderRadii:(_VUICornerRadii)a3;
- (void)setBorderWidth:(double)a3;
- (void)setClearsExisting:(BOOL)a3;
- (void)setContinuousBorder:(BOOL)a3;
- (void)setCropCode:(id)a3;
- (void)setDecoratorType:(unint64_t)a3;
- (void)setDisplayScaleIsPointMultiplier:(BOOL)a3;
- (void)setDownloadSize:(CGSize)a3;
- (void)setExtension:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setLoadsImmediately:(BOOL)a3;
- (void)setOptimizedImageRendering:(BOOL)a3;
- (void)setP3Specifier:(id)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setPlaceholderSrc:(id)a3;
- (void)setPreferredVibrancy:(int64_t)a3;
- (void)setRenderAsTemplate:(BOOL)a3;
- (void)setScaleMode:(int64_t)a3;
- (void)setShadow:(id)a3;
- (void)setSizeComputationOnly:(BOOL)a3;
- (void)setTemplated:(BOOL)a3;
- (void)setTintColor:(id)a3;
@end

@implementation VUIRemoteImageDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_placeholderSrc, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_cropCode, 0);
  objc_storeStrong((id *)&self->_p3Specifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_src, 0);
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (BOOL)sizeComputationOnly
{
  return self->_sizeComputationOnly;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (BOOL)clearsExisting
{
  return self->_clearsExisting;
}

- (CGSize)boundingSize
{
  double width = self->_boundingSize.width;
  double height = self->_boundingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (NSString)placeholderSrc
{
  return self->_placeholderSrc;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (BOOL)optimizedImageRendering
{
  return self->_optimizedImageRendering;
}

- (BOOL)loadsImmediately
{
  return self->_loadsImmediately;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (unint64_t)decoratorType
{
  return self->_decoratorType;
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (_VUICornerRadii)borderRadii
{
  double topLeft = self->_borderRadii.topLeft;
  double topRight = self->_borderRadii.topRight;
  double bottomLeft = self->_borderRadii.bottomLeft;
  double bottomRight = self->_borderRadii.bottomRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topRight = topRight;
  result.double topLeft = topLeft;
  return result;
}

- (BOOL)animatesShadowChanges
{
  return self->_animatesShadowChanges;
}

- (void)setClearsExisting:(BOOL)a3
{
  self->_clearsExisting = a3;
}

- (void)setTemplated:(BOOL)a3
{
  self->_templated = a3;
}

- (void)setScaleMode:(int64_t)a3
{
  self->_scaleMode = a3;
}

- (void)setRenderAsTemplate:(BOOL)a3
{
  self->_renderAsTemplate = a3;
}

- (void)setPlaceholderSrc:(id)a3
{
}

- (void)setP3Specifier:(id)a3
{
}

- (void)setLoadsImmediately:(BOOL)a3
{
  self->_loadsImmediately = a3;
}

- (void)setExtension:(id)a3
{
}

- (void)setDownloadSize:(CGSize)a3
{
  self->_downloadSize = a3;
}

- (void)setCropCode:(id)a3
{
}

- (void)setContinuousBorder:(BOOL)a3
{
  self->_continuousBorder = a3;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (void)setAccessibilityText:(id)a3
{
}

- (void)setTintColor:(id)a3
{
}

- (void)setShadow:(id)a3
{
}

- (void)setHighlightColor:(id)a3
{
}

- (void)setBorderRadii:(_VUICornerRadii)a3
{
  self->_borderRadii = a3;
}

- (void)setBorderColor:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setPlaceholderColor:(id)a3
{
}

- (NSString)src
{
  return self->_src;
}

- (CGSize)downloadSize
{
  double width = self->_downloadSize.width;
  double height = self->_downloadSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)p3Specifier
{
  return self->_p3Specifier;
}

- (NSString)extension
{
  return self->_extension;
}

- (BOOL)displayScaleIsPointMultiplier
{
  return self->_displayScaleIsPointMultiplier;
}

- (NSString)cropCode
{
  return self->_cropCode;
}

- (VUIRemoteImageDescriptor)initWithSrc:(id)a3 size:(CGSize)a4 containerSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  id v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VUIRemoteImageDescriptor;
  v12 = [(VUIRemoteImageDescriptor *)&v16 init];
  v13 = v12;
  if (!v12 || (*MEMORY[0x1E4F1DB30] == v8 ? (BOOL v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8) == v7) : (BOOL v14 = 0), v14))
  {

    v13 = 0;
  }
  else
  {
    objc_storeStrong((id *)&v12->_src, a3);
    v13->_boundingSize.CGFloat width = v8;
    v13->_boundingSize.CGFloat height = v7;
    v13->_containerSize.CGFloat width = width;
    v13->_containerSize.CGFloat height = height;
    v13->_aspectRatio = v8 / v7;
    *(_OWORD *)&v13->_decoratorType = xmmword_1E2A15690;
    v13->_continuousBorder = 0;
    *(_OWORD *)&v13->_borderRadii.double topLeft = VUICornerRadiiZero;
    *(_OWORD *)&v13->_borderRadii.double bottomLeft = *(_OWORD *)&qword_1E2A15638;
    v13->_sizeComputationOnly = 0;
    *(_WORD *)&v13->_optimizedImageRendering = 257;
  }

  return v13;
}

- (VUIRemoteImageDescriptor)initWithSrc:(id)a3 size:(CGSize)a4
{
  return -[VUIRemoteImageDescriptor initWithSrc:size:containerSize:](self, "initWithSrc:size:containerSize:", a3, a4.width, a4.height, a4.width, a4.height);
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setDisplayScaleIsPointMultiplier:(BOOL)a3
{
  self->_displayScaleIsPointMultiplier = a3;
}

- (BOOL)isTemplated
{
  return self->_templated;
}

- (BOOL)shouldRenderAsTemplate
{
  return self->_renderAsTemplate;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)preferredVibrancy
{
  return self->_preferredVibrancy;
}

- (void)setPreferredVibrancy:(int64_t)a3
{
  self->_preferredVibrancy = a3;
}

- (void)setDecoratorType:(unint64_t)a3
{
  self->_decoratorType = a3;
}

- (BOOL)continuousBorder
{
  return self->_continuousBorder;
}

- (void)setAnimatesShadowChanges:(BOOL)a3
{
  self->_animatesShadowChanges = a3;
}

- (void)setOptimizedImageRendering:(BOOL)a3
{
  self->_optimizedImageRendering = a3;
}

- (void)setSizeComputationOnly:(BOOL)a3
{
  self->_sizeComputationOnly = a3;
}

@end