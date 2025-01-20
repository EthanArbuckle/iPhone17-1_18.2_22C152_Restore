@interface _UIDraggingImageComponent
- (BOOL)hidesImage;
- (BOOL)ignoresAccessibilityFilters;
- (CGRect)frame;
- (UIImage)image;
- (UIView)view;
- (_UIDraggingImageComponent)initWithImage:(id)a3 frame:(CGRect)a4 ignoreAccessibilityFilters:(BOOL)a5;
- (_UIDraggingImageComponent)initWithView:(id)a3;
- (id)_initWithNoImageAndFrame:(CGRect)a3;
- (id)description;
- (id)initHidingDragImage;
@end

@implementation _UIDraggingImageComponent

- (_UIDraggingImageComponent)initWithImage:(id)a3 frame:(CGRect)a4 ignoreAccessibilityFilters:(BOOL)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  if (!v12) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"image must be non-nil"];
  }
  v16.receiver = self;
  v16.super_class = (Class)_UIDraggingImageComponent;
  v13 = [(_UIDraggingImageComponent *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_image, a3);
    v14->_ignoresAccessibilityFilters = a5;
    v14->_frame.origin.CGFloat x = x;
    v14->_frame.origin.CGFloat y = y;
    v14->_frame.size.CGFloat width = width;
    v14->_frame.size.CGFloat height = height;
  }

  return v14;
}

- (_UIDraggingImageComponent)initWithView:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"view must be non-nil"];
  }
  [v5 bounds];
  v6 = -[_UIDraggingImageComponent _initWithNoImageAndFrame:](self, "_initWithNoImageAndFrame:");
  v7 = (_UIDraggingImageComponent *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 2, a3);
    v7->_ignoresAccessibilityFilters = [v5 accessibilityIgnoresInvertColors];
  }

  return v7;
}

- (id)initHidingDragImage
{
  id result = -[_UIDraggingImageComponent _initWithNoImageAndFrame:](self, "_initWithNoImageAndFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (result) {
    *((unsigned char *)result + 9) = 1;
  }
  return result;
}

- (id)_initWithNoImageAndFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_UIDraggingImageComponent;
  id result = [(_UIDraggingImageComponent *)&v8 init];
  if (result)
  {
    *((CGFloat *)result + 4) = x;
    *((CGFloat *)result + 5) = y;
    *((CGFloat *)result + 6) = width;
    *((CGFloat *)result + 7) = height;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  image = self->_image;
  [(_UIDraggingImageComponent *)self frame];
  v6 = NSStringFromCGRect(v10);
  v7 = [v3 stringWithFormat:@"<%@ %p image=%@ frame=%@>", v4, self, image, v6];

  return v7;
}

- (UIView)view
{
  return self->_view;
}

- (UIImage)image
{
  return self->_image;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)ignoresAccessibilityFilters
{
  return self->_ignoresAccessibilityFilters;
}

- (BOOL)hidesImage
{
  return self->_hidesImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end