@interface PXNonuniformTransform
+ (id)horizontallyDominantTransformWithSourceRect:(CGRect)a3 targetRect:(CGRect)a4 coordinateSpace:(id)a5 minimumScale:(double)a6 maximumScale:(double)a7;
+ (id)identityTransform;
- (CGAffineTransform)affineTransformForRect:(SEL)a3 inCoordinateSpace:(CGRect)a4;
- (PXNonuniformTransform)init;
- (double)_adjustedZoomScale:(double)result;
- (id)inverseTransform;
@end

@implementation PXNonuniformTransform

- (void).cxx_destruct
{
}

- (id)inverseTransform
{
  v3 = objc_alloc_init(PXNonuniformTransform);
  CGPoint origin = self->_targetRect.origin;
  v3->_sourceRect.CGSize size = self->_targetRect.size;
  v3->_sourceRect.CGPoint origin = origin;
  CGSize size = self->_sourceRect.size;
  v3->_targetRect.CGPoint origin = self->_sourceRect.origin;
  v3->_targetRect.CGSize size = size;
  objc_storeStrong((id *)&v3->_coordinateSpace, self->_coordinateSpace);
  v3->_minimumScale = 1.0 / self->_maximumScale;
  v3->_maximumScale = 1.0 / self->_minimumScale;
  return v3;
}

- (double)_adjustedZoomScale:(double)result
{
  if (self->_minimumScale > result) {
    result = self->_minimumScale;
  }
  if (result >= self->_maximumScale) {
    return self->_maximumScale;
  }
  return result;
}

- (CGAffineTransform)affineTransformForRect:(SEL)a3 inCoordinateSpace:(CGRect)a4
{
  uint64_t v6 = MEMORY[0x1E4F1DAB8];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  if (*(void *)&self[1].d)
  {
    id v8 = a5;
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  }
  return self;
}

- (PXNonuniformTransform)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXNonuniformTransform;
  result = [(PXNonuniformTransform *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_minimumScale = _Q0;
  }
  return result;
}

+ (id)horizontallyDominantTransformWithSourceRect:(CGRect)a3 targetRect:(CGRect)a4 coordinateSpace:(id)a5 minimumScale:(double)a6 maximumScale:(double)a7
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  v14 = (UICoordinateSpace *)a5;
  v15 = objc_alloc_init(PXNonuniformTransform);
  v15->_sourceRect.origin.CGFloat x = v13;
  v15->_sourceRect.origin.CGFloat y = v12;
  v15->_sourceRect.size.CGFloat width = v11;
  v15->_sourceRect.size.CGFloat height = v10;
  v15->_targetRect.origin.CGFloat x = x;
  v15->_targetRect.origin.CGFloat y = y;
  v15->_targetRect.size.CGFloat width = width;
  v15->_targetRect.size.CGFloat height = height;
  coordinateSpace = v15->_coordinateSpace;
  v15->_coordinateSpace = v14;

  v15->_minimumScale = a6;
  v15->_maximumScale = a7;
  return v15;
}

+ (id)identityTransform
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PXNonuniformTransform_identityTransform__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (identityTransform_onceToken != -1) {
    dispatch_once(&identityTransform_onceToken, block);
  }
  v2 = (void *)identityTransform_identityTransform;
  return v2;
}

void __42__PXNonuniformTransform_identityTransform__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)identityTransform_identityTransform;
  identityTransform_identityTransform = (uint64_t)v1;
}

@end