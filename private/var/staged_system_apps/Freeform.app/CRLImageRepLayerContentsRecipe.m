@interface CRLImageRepLayerContentsRecipe
- (BOOL)hasBakedMask;
- (CGImage)image;
- (CRLImageRepLayerContentsRecipe)initWithImage:(CGImage *)a3 orientation:(int64_t)a4 hasBakedMask:(BOOL)a5;
- (int64_t)orientation;
- (void)dealloc;
@end

@implementation CRLImageRepLayerContentsRecipe

- (CRLImageRepLayerContentsRecipe)initWithImage:(CGImage *)a3 orientation:(int64_t)a4 hasBakedMask:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CRLImageRepLayerContentsRecipe;
  v8 = [(CRLImageRepLayerContentsRecipe *)&v10 init];
  if (v8)
  {
    v8->_image = CGImageRetain(a3);
    v8->_orientation = a4;
    v8->_hasBakedMask = a5;
  }
  return v8;
}

- (void)dealloc
{
  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)CRLImageRepLayerContentsRecipe;
  [(CRLImageRepLayerContentsRecipe *)&v3 dealloc];
}

- (CGImage)image
{
  return self->_image;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)hasBakedMask
{
  return self->_hasBakedMask;
}

@end