@interface PUExpandableTileLayoutInfo
- (BOOL)isExpanded;
- (BOOL)isGeometryEqualToLayoutInfo:(id)a3;
- (CGSize)expandedSize;
- (CGSize)unexpandedSize;
- (PUExpandableTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 cornerRadius:(double)a6 alpha:(double)a7 transform:(CGAffineTransform *)a8 zPosition:(double)a9 coordinateSystem:(id)a10;
- (PUExpandableTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 cornerRadius:(double)a6 alpha:(double)a7 transform:(CGAffineTransform *)a8 zPosition:(double)a9 coordinateSystem:(id)a10 isExpanded:(BOOL)a11 expandedSize:(CGSize)a12 unexpandedSize:(CGSize)a13;
- (id)clone;
@end

@implementation PUExpandableTileLayoutInfo

- (CGSize)unexpandedSize
{
  double width = self->_unexpandedSize.width;
  double height = self->_unexpandedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)expandedSize
{
  double width = self->_expandedSize.width;
  double height = self->_expandedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUExpandableTileLayoutInfo;
  if ([(PUTileLayoutInfo *)&v14 isGeometryEqualToLayoutInfo:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (([v4 expandedSize], self->_expandedSize.width == v6)
      ? (BOOL v7 = self->_expandedSize.height == v5)
      : (BOOL v7 = 0),
        v7
     && (([v4 unexpandedSize], self->_unexpandedSize.width == v9)
       ? (BOOL v10 = self->_unexpandedSize.height == v8)
       : (BOOL v10 = 0),
         v10)))
  {
    int isExpanded = self->_isExpanded;
    BOOL v11 = isExpanded == [v4 isExpanded];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)clone
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(PUTileLayoutInfo *)self tileIdentifier];
  [(PUTileLayoutInfo *)self center];
  double v28 = v5;
  double v7 = v6;
  [(PUTileLayoutInfo *)self size];
  double v9 = v8;
  double v11 = v10;
  [(PUTileLayoutInfo *)self cornerRadius];
  double v13 = v12;
  [(PUTileLayoutInfo *)self alpha];
  double v15 = v14;
  [(PUTileLayoutInfo *)self transform];
  [(PUTileLayoutInfo *)self zPosition];
  double v17 = v16;
  v18 = [(PUTileLayoutInfo *)self coordinateSystem];
  BOOL v19 = [(PUExpandableTileLayoutInfo *)self isExpanded];
  [(PUExpandableTileLayoutInfo *)self expandedSize];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  [(PUExpandableTileLayoutInfo *)self unexpandedSize];
  v26 = objc_msgSend(v3, "initWithTileIdentifier:center:size:cornerRadius:alpha:transform:zPosition:coordinateSystem:isExpanded:expandedSize:unexpandedSize:", v4, v29, v18, v19, v28, v7, v9, v11, v13, v15, v17, v21, v23, v24, v25);

  return v26;
}

- (PUExpandableTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 cornerRadius:(double)a6 alpha:(double)a7 transform:(CGAffineTransform *)a8 zPosition:(double)a9 coordinateSystem:(id)a10 isExpanded:(BOOL)a11 expandedSize:(CGSize)a12 unexpandedSize:(CGSize)a13
{
  uint64_t v14 = *MEMORY[0x1E4F39EA0];
  v18.receiver = self;
  v18.super_class = (Class)PUExpandableTileLayoutInfo;
  long long v15 = *(_OWORD *)&a8->c;
  v17[0] = *(_OWORD *)&a8->a;
  v17[1] = v15;
  v17[2] = *(_OWORD *)&a8->tx;
  CGSize result = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:](&v18, sel_initWithTileIdentifier_center_size_alpha_cornerRadius_cornerCurve_cornerMask_transform_zPosition_contentsRect_coordinateSystem_, a3, v14, 15, v17, a10, *(void *)&a13.height, a4.x, a4.y, a5.width, a5.height, a7, a6, a9, *MEMORY[0x1E4F91340], *(void *)(MEMORY[0x1E4F91340] + 8), *(void *)(MEMORY[0x1E4F91340] + 16), *(void *)(MEMORY[0x1E4F91340] + 24));
  if (result)
  {
    result->_unexpandedSize.double width = v19;
    result->_unexpandedSize.double height = v20;
    result->_int isExpanded = a11;
    result->_expandedSize = a12;
  }
  return result;
}

- (PUExpandableTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 cornerRadius:(double)a6 alpha:(double)a7 transform:(CGAffineTransform *)a8 zPosition:(double)a9 coordinateSystem:(id)a10
{
  long long v10 = *(_OWORD *)&a8->c;
  v12[0] = *(_OWORD *)&a8->a;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a8->tx;
  return -[PUExpandableTileLayoutInfo initWithTileIdentifier:center:size:cornerRadius:alpha:transform:zPosition:coordinateSystem:isExpanded:expandedSize:unexpandedSize:](self, "initWithTileIdentifier:center:size:cornerRadius:alpha:transform:zPosition:coordinateSystem:isExpanded:expandedSize:unexpandedSize:", a3, v12, a10, 0, a4.x, a4.y, a5.width, a5.height, a6, a7, a9, *MEMORY[0x1E4F1DB30], *(void *)(MEMORY[0x1E4F1DB30] + 8), *MEMORY[0x1E4F1DB30], *(void *)(MEMORY[0x1E4F1DB30] + 8));
}

@end