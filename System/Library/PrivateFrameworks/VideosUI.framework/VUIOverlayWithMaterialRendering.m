@interface VUIOverlayWithMaterialRendering
- (CGRect)croppedRect;
- (CGRect)rect;
- (NSString)identifier;
- (VUIOverlayWithMaterialRendering)init;
- (VUIOverlayWithMaterialRendering)initWithIdentifier:(id)a3 rect:(CGRect)a4 croppedRect:(CGRect)a5;
- (void)setCroppedRect:(CGRect)a3;
- (void)setIdentifier:(id)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation VUIOverlayWithMaterialRendering

- (VUIOverlayWithMaterialRendering)initWithIdentifier:(id)a3 rect:(CGRect)a4 croppedRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v9 = a4.size.height;
  CGFloat v10 = a4.size.width;
  CGFloat v11 = a4.origin.y;
  CGFloat v12 = a4.origin.x;
  id v14 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUIOverlayWithMaterialRendering;
  v15 = [(VUIOverlayWithMaterialRendering *)&v19 init];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    v15->_rect.origin.CGFloat x = v12;
    v15->_rect.origin.CGFloat y = v11;
    v15->_rect.size.CGFloat width = v10;
    v15->_rect.size.CGFloat height = v9;
    v15->_croppedRect.origin.CGFloat x = x;
    v15->_croppedRect.origin.CGFloat y = y;
    v15->_croppedRect.size.CGFloat width = width;
    v15->_croppedRect.size.CGFloat height = height;
  }

  return v15;
}

- (VUIOverlayWithMaterialRendering)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (CGRect)croppedRect
{
  double x = self->_croppedRect.origin.x;
  double y = self->_croppedRect.origin.y;
  double width = self->_croppedRect.size.width;
  double height = self->_croppedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCroppedRect:(CGRect)a3
{
  self->_croppedRect = a3;
}

- (void).cxx_destruct
{
}

@end