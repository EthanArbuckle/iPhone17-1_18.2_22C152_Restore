@interface TSDShapeRenderingOperation
- (BOOL)needsPressedStateBackground;
- (TSDShapeRenderingOperation)initWithPreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 shapeType:(int)a7 angle:(double)a8 documentRoot:(id)a9;
- (TSDShapeRenderingOperation)initWithPreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 shapeType:(int)a7 documentRoot:(id)a8;
- (UIEdgeInsets)swatchEdgeInsets;
- (void)doWorkWithReadLock;
@end

@implementation TSDShapeRenderingOperation

- (TSDShapeRenderingOperation)initWithPreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 shapeType:(int)a7 documentRoot:(id)a8
{
  return -[TSDShapeRenderingOperation initWithPreset:imageSize:imageScale:swatchFrame:shapeType:angle:documentRoot:](self, "initWithPreset:imageSize:imageScale:swatchFrame:shapeType:angle:documentRoot:", a3, *(void *)&a7, a8, a4.width, a4.height, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, 0.0);
}

- (TSDShapeRenderingOperation)initWithPreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 shapeType:(int)a7 angle:(double)a8 documentRoot:(id)a9
{
  v12.receiver = self;
  v12.super_class = (Class)TSDShapeRenderingOperation;
  result = -[TSDSwatchRenderingOperation initWithPreset:imageSize:imageScale:swatchFrame:documentRoot:](&v12, sel_initWithPreset_imageSize_imageScale_swatchFrame_documentRoot_, a3, a9, a4.width, a4.height, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  if (result)
  {
    result->mShapeType = a7;
    result->mAngle = a8;
  }
  return result;
}

- (UIEdgeInsets)swatchEdgeInsets
{
  objc_msgSend(+[TSDSwatchCache swatchCache](TSDSwatchCache, "swatchCache"), "shapeSwatchInset");
  double v3 = v2;
  double v5 = v4;
  double v6 = v3;
  double v7 = v5;
  double v8 = v5;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (BOOL)needsPressedStateBackground
{
  if (self->mShapeType == 3)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)doWorkWithReadLock
{
  int v3 = TSUPhoneUI();
  id v4 = +[TSDSwatchCache swatchCache];
  mPreset = self->super.mPreset;
  p_mImageSize = &self->super.mImageSize;
  double mImageScale = self->super.mImageScale;
  if (v3) {
    double v8 = objc_msgSend(v4, "imageForShapePreset:imageSize:imageScale:swatchFrame:shapeType:angle:documentRoot:", mPreset, self->mShapeType, self->super.mDocumentRoot, p_mImageSize->width, self->super.mImageSize.height, mImageScale, self->super.mSwatchFrame.origin.x, self->super.mSwatchFrame.origin.y, self->super.mSwatchFrame.size.width, self->super.mSwatchFrame.size.height, self->mAngle);
  }
  else {
    double v8 = objc_msgSend(v4, "imageForShapePreset:imageSize:imageScale:shapeType:angle:documentRoot:", mPreset, self->mShapeType, self->super.mDocumentRoot, p_mImageSize->width, self->super.mImageSize.height, mImageScale, self->mAngle);
  }
  uint64_t v9 = [v8 CGImage];

  [(TSDSwatchRenderingOperation *)self deliverCGImage:v9];
}

@end