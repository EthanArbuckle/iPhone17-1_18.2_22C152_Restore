@interface MRPatchworkPatch
- (BOOL)needsBlend;
- (CGRect)rectangle;
- (MRImage)image;
- (MRPatchworkPatch)initWithImage:(id)a3 rectangle:(CGRect)a4 needsBlend:(BOOL)a5;
- (void)dealloc;
- (void)setImage:(id)a3;
- (void)setNeedsBlend:(BOOL)a3;
- (void)setRectangle:(CGRect)a3;
@end

@implementation MRPatchworkPatch

- (MRPatchworkPatch)initWithImage:(id)a3 rectangle:(CGRect)a4 needsBlend:(BOOL)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)MRPatchworkPatch;
  v11 = [(MRPatchworkPatch *)&v13 init];
  if (v11)
  {
    v11->_image = (MRImage *)[a3 retainByUser];
    v11->rectangle.origin.CGFloat x = x;
    v11->rectangle.origin.CGFloat y = y;
    v11->rectangle.size.CGFloat width = width;
    v11->rectangle.size.CGFloat height = height;
    v11->needsBlend = a5;
  }
  return v11;
}

- (void)dealloc
{
  [(MRImage *)self->_image releaseByUser];
  self->_image = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRPatchworkPatch;
  [(MRPatchworkPatch *)&v3 dealloc];
}

- (MRImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CGRect)rectangle
{
  double x = self->rectangle.origin.x;
  double y = self->rectangle.origin.y;
  double width = self->rectangle.size.width;
  double height = self->rectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRectangle:(CGRect)a3
{
  self->rectangle = a3;
}

- (BOOL)needsBlend
{
  return self->needsBlend;
}

- (void)setNeedsBlend:(BOOL)a3
{
  self->needsBlend = a3;
}

@end