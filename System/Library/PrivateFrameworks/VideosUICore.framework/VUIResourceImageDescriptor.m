@interface VUIResourceImageDescriptor
- (BOOL)scaleToSize;
- (BOOL)shouldRenderAsTemplate;
- (CGSize)containerSize;
- (CGSize)size;
- (NSString)accessibilityText;
- (NSString)name;
- (UIColor)borderColor;
- (UIColor)highlightColor;
- (UIColor)tintColor;
- (UIImageSymbolConfiguration)symbolConfiguration;
- (VUIResourceImageDescriptor)initWithResource:(id)a3 size:(CGSize)a4;
- (VUIResourceImageDescriptor)initWithResource:(id)a3 size:(CGSize)a4 containerSize:(CGSize)a5;
- (VUIResourceImageDescriptor)initWithResourceSymbol:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5;
- (VUIResourceImageDescriptor)initWithSymbol:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5;
- (_VUICornerRadii)borderRadii;
- (double)aspectRatio;
- (double)borderWidth;
- (int64_t)preferredVibrancy;
- (int64_t)scaleMode;
- (unint64_t)type;
- (void)setAccessibilityText:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderRadii:(_VUICornerRadii)a3;
- (void)setBorderWidth:(double)a3;
- (void)setHighlightColor:(id)a3;
- (void)setName:(id)a3;
- (void)setPreferredVibrancy:(int64_t)a3;
- (void)setRenderAsTemplate:(BOOL)a3;
- (void)setScaleMode:(int64_t)a3;
- (void)setScaleToSize:(BOOL)a3;
- (void)setTintColor:(id)a3;
@end

@implementation VUIResourceImageDescriptor

- (void)setRenderAsTemplate:(BOOL)a3
{
  self->_renderAsTemplate = a3;
}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  return self->_symbolConfiguration;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (VUIResourceImageDescriptor)initWithSymbol:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VUIResourceImageDescriptor;
  v12 = [(VUIResourceImageDescriptor *)&v16 init];
  if (v12)
  {
    if ([v10 length])
    {
      objc_storeStrong((id *)&v12->_name, a3);
      v12->_size.CGFloat width = width;
      v12->_size.CGFloat height = height;
      v12->_containerSize.CGFloat width = width;
      v12->_containerSize.CGFloat height = height;
      v12->_type = 0;
      v12->_scaleMode = 1;
      v13 = (UIImageSymbolConfiguration *)v11;
      symbolConfiguration = v12->_symbolConfiguration;
      v12->_symbolConfiguration = v13;
    }
    else
    {
      symbolConfiguration = v12;
      v12 = 0;
    }
  }
  else
  {
    symbolConfiguration = 0;
  }

  return v12;
}

- (VUIResourceImageDescriptor)initWithResource:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIResourceImageDescriptor;
  v9 = [(VUIResourceImageDescriptor *)&v11 init];
  if (v9 && [v8 length])
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v9->_size.CGFloat width = width;
    v9->_size.CGFloat height = height;
    v9->_containerSize.CGFloat width = width;
    v9->_containerSize.CGFloat height = height;
    v9->_scaleMode = 1;
    v9->_type = 1;
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (VUIResourceImageDescriptor)initWithResource:(id)a3 size:(CGSize)a4 containerSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  _VUICornerRadii result = -[VUIResourceImageDescriptor initWithResource:size:](self, "initWithResource:size:", a3, a4.width, a4.height);
  if (result)
  {
    result->_containerSize.CGFloat width = width;
    result->_containerSize.CGFloat height = height;
  }
  return result;
}

- (VUIResourceImageDescriptor)initWithResourceSymbol:(id)a3 size:(CGSize)a4 symbolConfiguration:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VUIResourceImageDescriptor;
  v12 = [(VUIResourceImageDescriptor *)&v16 init];
  if (v12)
  {
    if ([v10 length])
    {
      objc_storeStrong((id *)&v12->_name, a3);
      v12->_size.CGFloat width = width;
      v12->_size.CGFloat height = height;
      v12->_containerSize.CGFloat width = width;
      v12->_containerSize.CGFloat height = height;
      v12->_type = 2;
      v12->_scaleMode = 1;
      v13 = (UIImageSymbolConfiguration *)v11;
      symbolConfiguration = v12->_symbolConfiguration;
      v12->_symbolConfiguration = v13;
    }
    else
    {
      symbolConfiguration = v12;
      v12 = 0;
    }
  }
  else
  {
    symbolConfiguration = 0;
  }

  return v12;
}

- (void)setName:(id)a3
{
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (BOOL)shouldRenderAsTemplate
{
  return self->_renderAsTemplate;
}

- (void)setBorderRadii:(_VUICornerRadii)a3
{
  self->_borderRadii = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (void)setTintColor:(id)a3
{
}

- (void)setHighlightColor:(id)a3
{
}

- (int64_t)preferredVibrancy
{
  return self->_preferredVibrancy;
}

- (void)setPreferredVibrancy:(int64_t)a3
{
  self->_preferredVibrancy = a3;
}

- (void)setScaleMode:(int64_t)a3
{
  self->_scaleMode = a3;
}

- (void)setAccessibilityText:(id)a3
{
}

- (BOOL)scaleToSize
{
  return self->_scaleToSize;
}

- (void)setScaleToSize:(BOOL)a3
{
  self->_scaleToSize = a3;
}

@end