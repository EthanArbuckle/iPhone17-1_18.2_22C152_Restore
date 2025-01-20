@interface PUParallaxedTileLayoutInfo
- (BOOL)isGeometryEqualToLayoutInfo:(id)a3;
- (CGPoint)parallaxOffset;
- (PUParallaxedTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9;
- (PUParallaxedTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 parallaxOffset:(CGPoint)a9 coordinateSystem:(id)a10;
- (double)initWithTileIdentifier:(uint64_t)a3 center:(uint64_t)a4 size:(uint64_t)a5 alpha:(uint64_t)a6 cornerRadius:(_OWORD *)a7 cornerCurve:(uint64_t)a8 cornerMask:(double)a9 borderWidth:(double)a10 borderColor:(double)a11 transform:(double)a12 zPosition:(double)a13 parallaxOffset:(double)a14 contentsRect:(double)a15 coordinateSystem:(double)a16 cropInsets:(uint64_t)a17 verticalLegibilityFraction:(double)a18;
- (id)clone;
- (uint64_t)initWithTileIdentifier:(double)a3 center:(double)a4 size:(double)a5 alpha:(double)a6 transform:(double)a7 zPosition:(double)a8 parallaxOffset:(double)a9 contentsRect:(uint64_t)a10 coordinateSystem:(uint64_t)a11;
@end

@implementation PUParallaxedTileLayoutInfo

- (CGPoint)parallaxOffset
{
  double x = self->_parallaxOffset.x;
  double y = self->_parallaxOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)clone
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = [(PUTileLayoutInfo *)self tileIdentifier];
  [(PUTileLayoutInfo *)self center];
  double v46 = v6;
  double v47 = v5;
  [(PUTileLayoutInfo *)self size];
  double v44 = v8;
  double v45 = v7;
  [(PUTileLayoutInfo *)self alpha];
  double v43 = v9;
  [(PUTileLayoutInfo *)self cornerRadius];
  double v42 = v10;
  v11 = [(PUTileLayoutInfo *)self cornerCurve];
  unint64_t v12 = [(PUTileLayoutInfo *)self cornerMask];
  [(PUTileLayoutInfo *)self borderWidth];
  double v41 = v13;
  v14 = [(PUTileLayoutInfo *)self borderColor];
  [(PUTileLayoutInfo *)self transform];
  [(PUTileLayoutInfo *)self zPosition];
  double v40 = v15;
  [(PUParallaxedTileLayoutInfo *)self parallaxOffset];
  uint64_t v38 = v17;
  uint64_t v39 = v16;
  [(PUTileLayoutInfo *)self contentsRect];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  v26 = [(PUTileLayoutInfo *)self coordinateSystem];
  [(PUTileLayoutInfo *)self cropInsets];
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  [(PUTileLayoutInfo *)self verticalLegibilityFraction];
  v36 = objc_msgSend(v3, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:cropInsets:verticalLegibilityFraction:", v4, v11, v12, v14, v48, v26, v47, v46, v45, v44, v43, v42, v41, v40, v39, v38,
                  v19,
                  v21,
                  v23,
                  v25,
                  v28,
                  v30,
                  v32,
                  v34,
                  v35);

  return v36;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUParallaxedTileLayoutInfo;
  if ([(PUTileLayoutInfo *)&v10 isGeometryEqualToLayoutInfo:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    p_parallaxOffset = &self->_parallaxOffset;
    [v4 parallaxOffset];
    BOOL v8 = p_parallaxOffset->y == v7 && p_parallaxOffset->x == v6;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (double)initWithTileIdentifier:(uint64_t)a3 center:(uint64_t)a4 size:(uint64_t)a5 alpha:(uint64_t)a6 cornerRadius:(_OWORD *)a7 cornerCurve:(uint64_t)a8 cornerMask:(double)a9 borderWidth:(double)a10 borderColor:(double)a11 transform:(double)a12 zPosition:(double)a13 parallaxOffset:(double)a14 contentsRect:(double)a15 coordinateSystem:(double)a16 cropInsets:(uint64_t)a17 verticalLegibilityFraction:(double)a18
{
  v20.receiver = a1;
  v20.super_class = (Class)PUParallaxedTileLayoutInfo;
  long long v16 = a7[1];
  v19[0] = *a7;
  v19[1] = v16;
  v19[2] = a7[2];
  uint64_t v17 = (double *)objc_msgSendSuper2(&v20, sel_initWithTileIdentifier_center_size_alpha_cornerRadius_cornerCurve_cornerMask_borderWidth_borderColor_transform_zPosition_contentsRect_hitTestOutset_coordinateSystem_cropInsets_verticalLegibilityFraction_, a3, a4, a5, a6, v19, a19, a20, a21, *MEMORY[0x1E4FB2848], *(void *)(MEMORY[0x1E4FB2848] + 8), *(void *)(MEMORY[0x1E4FB2848] + 16), *(void *)(MEMORY[0x1E4FB2848] + 24), a22, a23, a24);
  if (v17)
  {
    double result = a18;
    *((void *)v17 + 37) = a17;
    v17[38] = a18;
  }
  return result;
}

- (uint64_t)initWithTileIdentifier:(double)a3 center:(double)a4 size:(double)a5 alpha:(double)a6 transform:(double)a7 zPosition:(double)a8 parallaxOffset:(double)a9 contentsRect:(uint64_t)a10 coordinateSystem:(uint64_t)a11
{
  long long v20 = a12[1];
  v22[0] = *a12;
  v22[1] = v20;
  v22[2] = a12[2];
  return objc_msgSend(a1, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:cropInsets:verticalLegibilityFraction:", a11, 0, 0, 0, v22, a13, a2, a3, a4, a5, a6, 0.0, 0.0, a7, *(void *)&a8, *(void *)&a9,
           a17,
           a18,
           a19,
           *MEMORY[0x1E4FB2848],
           *(void *)(MEMORY[0x1E4FB2848] + 8),
           *(void *)(MEMORY[0x1E4FB2848] + 16),
           *(void *)(MEMORY[0x1E4FB2848] + 24),
           0);
}

- (PUParallaxedTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 parallaxOffset:(CGPoint)a9 coordinateSystem:(id)a10
{
  long long v10 = *(_OWORD *)&a7->c;
  v12[0] = *(_OWORD *)&a7->a;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a7->tx;
  return -[PUParallaxedTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:", a3, v12, a10, a4.x, a4.y, a5.width, a5.height, a6, a8, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 0, 0, 0x3FF0000000000000, 0x3FF0000000000000);
}

- (PUParallaxedTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9
{
  long long v9 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a7->tx;
  return -[PUParallaxedTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:parallaxOffset:coordinateSystem:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:parallaxOffset:coordinateSystem:", a3, v11, a9, a4.x, a4.y, a5.width, a5.height, a6, a8, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

@end