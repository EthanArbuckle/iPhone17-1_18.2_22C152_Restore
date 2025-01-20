@interface PUCroppedTileLayoutInfo
- (PUCroppedTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 contentsRect:(CGRect)a9 coordinateSystem:(id)a10;
- (id)clone;
- (id)description;
- (id)initWithTileIdentifier:(double)a3 center:(double)a4 size:(double)a5 cropInsets:(double)a6 verticalLegibilityFraction:(double)a7 alpha:(double)a8 cornerRadius:(double)a9 cornerCurve:(uint64_t)a10 cornerMask:(uint64_t)a11 transform:(uint64_t)a12 zPosition:(uint64_t)a13 contentsRect:(_OWORD *)a14 coordinateSystem:(uint64_t)a15;
@end

@implementation PUCroppedTileLayoutInfo

- (id)description
{
  id v22 = (id)NSString;
  v3 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v3);
  v24 = [(PUTileLayoutInfo *)self indexPath];
  v20 = objc_msgSend(v24, "pu_shortDescription");
  v4 = [(PUTileLayoutInfo *)self tileKind];
  v5 = [(PUTileLayoutInfo *)self dataSourceIdentifier];
  [(PUTileLayoutInfo *)self center];
  v6 = NSStringFromCGPoint(v27);
  [(PUTileLayoutInfo *)self size];
  v7 = NSStringFromCGSize(v28);
  [(PUTileLayoutInfo *)self cropInsets];
  v8 = NSStringFromUIEdgeInsets(v29);
  [(PUTileLayoutInfo *)self alpha];
  uint64_t v10 = v9;
  [(PUTileLayoutInfo *)self cornerRadius];
  uint64_t v12 = v11;
  v13 = [(PUTileLayoutInfo *)self cornerCurve];
  unint64_t v14 = [(PUTileLayoutInfo *)self cornerMask];
  [(PUTileLayoutInfo *)self transform];
  v15 = NSStringFromCGAffineTransform(&transform);
  [(PUTileLayoutInfo *)self zPosition];
  uint64_t v17 = v16;
  [(PUTileLayoutInfo *)self contentsRect];
  v18 = NSStringFromCGRect(v30);
  objc_msgSend(v22, "stringWithFormat:", @"<%@: %p; indexPath: %@; tileKind: %@; dataSourceIdentifier: %@; center: %@; size: %@; cropInsets: %@; alpha: %f; cornerRadius: %f; cornerCurve: %@; cornerMask: %lu; transform: %@; zPosition: %f; contentsRect: %@>",
    v21,
    self,
    v20,
    v4,
    v5,
    v6,
    v7,
    v8,
    v10,
    v12,
    v13,
    v14,
    v15,
    v17,
    v18);
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)clone
{
  v4.receiver = self;
  v4.super_class = (Class)PUCroppedTileLayoutInfo;
  v2 = [(PUTileLayoutInfo *)&v4 clone];
  return v2;
}

- (id)initWithTileIdentifier:(double)a3 center:(double)a4 size:(double)a5 cropInsets:(double)a6 verticalLegibilityFraction:(double)a7 alpha:(double)a8 cornerRadius:(double)a9 cornerCurve:(uint64_t)a10 cornerMask:(uint64_t)a11 transform:(uint64_t)a12 zPosition:(uint64_t)a13 contentsRect:(_OWORD *)a14 coordinateSystem:(uint64_t)a15
{
  v26.receiver = a1;
  v26.super_class = (Class)PUCroppedTileLayoutInfo;
  long long v23 = a14[1];
  v25[0] = *a14;
  v25[1] = v23;
  v25[2] = a14[2];
  return objc_msgSendSuper2(&v26, sel_initWithTileIdentifier_center_size_alpha_cornerRadius_cornerCurve_cornerMask_borderWidth_borderColor_transform_zPosition_contentsRect_hitTestOutset_coordinateSystem_cropInsets_verticalLegibilityFraction_, a11, a12, a13, 0, v25, a15, a2, a3, a4, a5, a18, a19, 0.0, a20, a21, a22, a23,
           *MEMORY[0x1E4FB2848],
           *(void *)(MEMORY[0x1E4FB2848] + 8),
           *(void *)(MEMORY[0x1E4FB2848] + 16),
           *(void *)(MEMORY[0x1E4FB2848] + 24),
           *(void *)&a6,
           *(void *)&a7,
           *(void *)&a8,
           *(void *)&a9,
           a17);
}

- (PUCroppedTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 contentsRect:(CGRect)a9 coordinateSystem:(id)a10
{
  double v10 = *MEMORY[0x1E4FB2848];
  double v11 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  long long v14 = *(_OWORD *)&a7->c;
  v16[0] = *(_OWORD *)&a7->a;
  v16[1] = v14;
  v16[2] = *(_OWORD *)&a7->tx;
  return -[PUCroppedTileLayoutInfo initWithTileIdentifier:center:size:cropInsets:verticalLegibilityFraction:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:](self, "initWithTileIdentifier:center:size:cropInsets:verticalLegibilityFraction:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:", a3, 0, 0, v16, a10, a4.x, a4.y, a5.width, a5.height, v10, v11, v12, v13, 0, *(void *)&a6, 0,
           *(void *)&a8,
           *(void *)&a9.origin.x,
           *(void *)&a9.origin.y,
           *(void *)&a9.size.width,
           *(void *)&a9.size.height);
}

@end