@interface PUUserTransformTileLayoutInfo
- (BOOL)isGeometryEqualToLayoutInfo:(id)a3;
- (CGRect)untransformedContentFrame;
- (CGSize)contentPixelSize;
- (PUUserTransformTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9;
- (UIEdgeInsets)chromeInsets;
- (double)initWithTileIdentifier:(double)a3 center:(double)a4 size:(double)a5 alpha:(double)a6 transform:(double)a7 zPosition:(uint64_t)a8 coordinateSystem:(uint64_t)a9 untransformedContentFrame:(_OWORD *)a10 chromeInsets:(uint64_t)a11 contentPixelSize:(double)a12 cropInsets:(double)a13;
- (double)initWithTileIdentifier:(uint64_t)a3 center:(_OWORD *)a4 size:(uint64_t)a5 alpha:(uint64_t)a6 transform:(uint64_t)a7 zPosition:(uint64_t)a8 coordinateSystem:(double)a9 untransformedContentFrame:(double)a10 chromeInsets:(double)a11 contentPixelSize:(double)a12;
- (id)clone;
@end

@implementation PUUserTransformTileLayoutInfo

- (CGSize)contentPixelSize
{
  double width = self->_contentPixelSize.width;
  double height = self->_contentPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)chromeInsets
{
  double top = self->_chromeInsets.top;
  double left = self->_chromeInsets.left;
  double bottom = self->_chromeInsets.bottom;
  double right = self->_chromeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)untransformedContentFrame
{
  double x = self->_untransformedContentFrame.origin.x;
  double y = self->_untransformedContentFrame.origin.y;
  double width = self->_untransformedContentFrame.size.width;
  double height = self->_untransformedContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)clone
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = [(PUTileLayoutInfo *)self tileIdentifier];
  [(PUTileLayoutInfo *)self center];
  double v36 = v6;
  double v37 = v5;
  [(PUTileLayoutInfo *)self size];
  double v34 = v8;
  double v35 = v7;
  [(PUTileLayoutInfo *)self alpha];
  double v33 = v9;
  [(PUTileLayoutInfo *)self transform];
  [(PUTileLayoutInfo *)self zPosition];
  double v32 = v10;
  v11 = [(PUTileLayoutInfo *)self coordinateSystem];
  [(PUUserTransformTileLayoutInfo *)self untransformedContentFrame];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  [(PUUserTransformTileLayoutInfo *)self chromeInsets];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  [(PUUserTransformTileLayoutInfo *)self contentPixelSize];
  v30 = objc_msgSend(v3, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:chromeInsets:contentPixelSize:", v4, v38, v11, v37, v36, v35, v34, v33, v32, v13, v15, v17, v19, v21, v23, v25,
                  v27,
                  v28,
                  v29);

  return v30;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUUserTransformTileLayoutInfo;
  if ([(PUTileLayoutInfo *)&v14 isGeometryEqualToLayoutInfo:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v4 untransformedContentFrame],
        v15.origin.double x = v5,
        v15.origin.double y = v6,
        v15.size.double width = v7,
        v15.size.double height = v8,
        CGRectEqualToRect(self->_untransformedContentFrame, v15))
    && ([v4 chromeInsets], PXEdgeInsetsEqualToEdgeInsets()))
  {
    p_contentPixelSize = &self->_contentPixelSize;
    [v4 contentPixelSize];
    BOOL v12 = p_contentPixelSize->height == v11 && p_contentPixelSize->width == v10;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (double)initWithTileIdentifier:(double)a3 center:(double)a4 size:(double)a5 alpha:(double)a6 transform:(double)a7 zPosition:(uint64_t)a8 coordinateSystem:(uint64_t)a9 untransformedContentFrame:(_OWORD *)a10 chromeInsets:(uint64_t)a11 contentPixelSize:(double)a12 cropInsets:(double)a13
{
  v31.receiver = a1;
  v31.super_class = (Class)PUUserTransformTileLayoutInfo;
  long long v27 = a10[1];
  v30[0] = *a10;
  v30[1] = v27;
  v30[2] = a10[2];
  uint64_t v28 = (double *)objc_msgSendSuper2(&v31, sel_initWithTileIdentifier_center_size_alpha_cornerRadius_cornerCurve_cornerMask_borderWidth_borderColor_transform_zPosition_contentsRect_hitTestOutset_coordinateSystem_cropInsets_verticalLegibilityFraction_, a9, 0, 0, 0, v30, a11, a2, a3, a4, a5, a6, 0.0, 0.0, a7, 0, 0, 0x3FF0000000000000,
                    0x3FF0000000000000,
                    *MEMORY[0x1E4FB2848],
                    *(void *)(MEMORY[0x1E4FB2848] + 8),
                    *(void *)(MEMORY[0x1E4FB2848] + 16),
                    *(void *)(MEMORY[0x1E4FB2848] + 24),
                    a27,
                    a28,
                    a29,
                    0);
  if (v28)
  {
    double result = a26;
    *((void *)v28 + 39) = a17;
    *((void *)v28 + 40) = a18;
    *((void *)v28 + 41) = a19;
    *((void *)v28 + 42) = a20;
    *((void *)v28 + 43) = a21;
    *((void *)v28 + 44) = a22;
    *((void *)v28 + 45) = a23;
    *((void *)v28 + 46) = a24;
    *((void *)v28 + 37) = a25;
    v28[38] = a26;
  }
  return result;
}

- (double)initWithTileIdentifier:(uint64_t)a3 center:(_OWORD *)a4 size:(uint64_t)a5 alpha:(uint64_t)a6 transform:(uint64_t)a7 zPosition:(uint64_t)a8 coordinateSystem:(double)a9 untransformedContentFrame:(double)a10 chromeInsets:(double)a11 contentPixelSize:(double)a12
{
  v22.receiver = a1;
  v22.super_class = (Class)PUUserTransformTileLayoutInfo;
  long long v18 = a4[1];
  v21[0] = *a4;
  v21[1] = v18;
  v21[2] = a4[2];
  uint64_t v19 = (double *)objc_msgSendSuper2(&v22, sel_initWithTileIdentifier_center_size_alpha_transform_zPosition_coordinateSystem_, a3, v21);
  if (v19)
  {
    double result = a26;
    *((void *)v19 + 39) = a17;
    *((void *)v19 + 40) = a18;
    *((void *)v19 + 41) = a19;
    *((void *)v19 + 42) = a20;
    *((void *)v19 + 43) = a21;
    *((void *)v19 + 44) = a22;
    *((void *)v19 + 45) = a23;
    *((void *)v19 + 46) = a24;
    *((void *)v19 + 37) = a25;
    v19[38] = a26;
  }
  return result;
}

- (PUUserTransformTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9
{
  long long v9 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a7->tx;
  return -[PUUserTransformTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:chromeInsets:contentPixelSize:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:chromeInsets:contentPixelSize:", a3, v11, a9, a4.x, a4.y, a5.width, a5.height, a6, a8, *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8), *(void *)(MEMORY[0x1E4F1DB20] + 16), *(void *)(MEMORY[0x1E4F1DB20] + 24), *MEMORY[0x1E4F91320], *(void *)(MEMORY[0x1E4F91320] + 8), *(void *)(MEMORY[0x1E4F91320] + 16),
           *(void *)(MEMORY[0x1E4F91320] + 24),
           *MEMORY[0x1E4F1DB30],
           *(void *)(MEMORY[0x1E4F1DB30] + 8));
}

@end