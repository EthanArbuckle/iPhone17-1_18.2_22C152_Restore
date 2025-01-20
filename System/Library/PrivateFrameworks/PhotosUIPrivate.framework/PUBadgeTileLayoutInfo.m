@interface PUBadgeTileLayoutInfo
- (BOOL)isGeometryEqualToLayoutInfo:(id)a3;
- (BOOL)isOverContent;
- (PUBadgeTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9;
- (PUBadgeTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 hitTestOutset:(UIEdgeInsets)a9 coordinateSystem:(id)a10 isOverContent:(BOOL)a11 contentWidth:(double)a12 leadingContentWidth:(double)a13;
- (double)contentWidth;
- (double)leadingContentWidth;
- (id)clone;
@end

@implementation PUBadgeTileLayoutInfo

- (double)leadingContentWidth
{
  return self->_leadingContentWidth;
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (BOOL)isOverContent
{
  return self->_isOverContent;
}

- (id)clone
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = [(PUTileLayoutInfo *)self tileIdentifier];
  [(PUTileLayoutInfo *)self center];
  double v30 = v6;
  double v31 = v5;
  [(PUTileLayoutInfo *)self size];
  double v29 = v7;
  double v9 = v8;
  [(PUTileLayoutInfo *)self alpha];
  double v11 = v10;
  [(PUTileLayoutInfo *)self transform];
  [(PUTileLayoutInfo *)self zPosition];
  double v13 = v12;
  [(PUTileLayoutInfo *)self hitTestOutset];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  v22 = [(PUTileLayoutInfo *)self coordinateSystem];
  BOOL v23 = [(PUBadgeTileLayoutInfo *)self isOverContent];
  [(PUBadgeTileLayoutInfo *)self contentWidth];
  uint64_t v25 = v24;
  [(PUBadgeTileLayoutInfo *)self leadingContentWidth];
  v27 = objc_msgSend(v3, "initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:", v4, v32, v22, v23, v31, v30, v29, v9, v11, v13, v15, v17, v19, v21, v25, v26);

  return v27;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUBadgeTileLayoutInfo;
  if ([(PUTileLayoutInfo *)&v12 isGeometryEqualToLayoutInfo:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (int isOverContent = self->_isOverContent, isOverContent == [v4 isOverContent])
    && (double contentWidth = self->_contentWidth, [v4 contentWidth], contentWidth == v7))
  {
    double leadingContentWidth = self->_leadingContentWidth;
    [v4 leadingContentWidth];
    BOOL v10 = leadingContentWidth == v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (PUBadgeTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 hitTestOutset:(UIEdgeInsets)a9 coordinateSystem:(id)a10 isOverContent:(BOOL)a11 contentWidth:(double)a12 leadingContentWidth:(double)a13
{
  v17.receiver = self;
  v17.super_class = (Class)PUBadgeTileLayoutInfo;
  long long v14 = *(_OWORD *)&a7->c;
  v16[0] = *(_OWORD *)&a7->a;
  v16[1] = v14;
  v16[2] = *(_OWORD *)&a7->tx;
  result = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:contentsRect:hitTestOutset:coordinateSystem:cropInsets:verticalLegibilityFraction:](&v17, sel_initWithTileIdentifier_center_size_alpha_cornerRadius_cornerCurve_cornerMask_borderWidth_borderColor_transform_zPosition_contentsRect_hitTestOutset_coordinateSystem_cropInsets_verticalLegibilityFraction_, a3, 0, 0, 0, v16, a10, a4.x, a4.y, a5.width, a5.height, a6, 0.0, 0.0, a8, *MEMORY[0x1E4F91340], *(void *)(MEMORY[0x1E4F91340] + 8), *(void *)(MEMORY[0x1E4F91340] + 16),
             *(void *)(MEMORY[0x1E4F91340] + 24),
             *(void *)&a9.top,
             *(void *)&a9.left,
             *(void *)&a9.bottom,
             *(void *)&a9.right,
             *MEMORY[0x1E4FB2848],
             *(void *)(MEMORY[0x1E4FB2848] + 8),
             *(void *)(MEMORY[0x1E4FB2848] + 16),
             *(void *)(MEMORY[0x1E4FB2848] + 24),
             0);
  if (result)
  {
    result->_int isOverContent = a11;
    result->_double contentWidth = a12;
    result->_double leadingContentWidth = a13;
  }
  return result;
}

- (PUBadgeTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9
{
  long long v9 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a7->tx;
  return -[PUBadgeTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:", a3, v11, a9, 0, a4.x, a4.y, a5.width, a5.height, a6, a8, *MEMORY[0x1E4FB2848], *(void *)(MEMORY[0x1E4FB2848] + 8), *(void *)(MEMORY[0x1E4FB2848] + 16), *(void *)(MEMORY[0x1E4FB2848] + 24), 0, 0);
}

@end