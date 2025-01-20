@interface PUAccessoryTileLayoutInfo
- (BOOL)isGeometryEqualToLayoutInfo:(id)a3;
- (CGRect)untransformedContentFrame;
- (PUAccessoryTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9;
- (UIEdgeInsets)contentInsets;
- (double)initWithTileIdentifier:(uint64_t)a3 center:(_OWORD *)a4 size:(uint64_t)a5 alpha:(uint64_t)a6 transform:(uint64_t)a7 zPosition:(uint64_t)a8 coordinateSystem:(double)a9 untransformedContentFrame:(double)a10 contentInsets:(double)a11 minimumVisibleHeight:(double)a12;
- (double)minimumVisibleHeight;
- (id)clone;
@end

@implementation PUAccessoryTileLayoutInfo

- (double)minimumVisibleHeight
{
  return self->_minimumVisibleHeight;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
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
  double v35 = v6;
  double v36 = v5;
  [(PUTileLayoutInfo *)self size];
  double v33 = v8;
  double v34 = v7;
  [(PUTileLayoutInfo *)self alpha];
  double v32 = v9;
  [(PUTileLayoutInfo *)self transform];
  [(PUTileLayoutInfo *)self zPosition];
  double v31 = v10;
  v11 = [(PUTileLayoutInfo *)self coordinateSystem];
  [(PUAccessoryTileLayoutInfo *)self untransformedContentFrame];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  [(PUAccessoryTileLayoutInfo *)self contentInsets];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  [(PUAccessoryTileLayoutInfo *)self minimumVisibleHeight];
  v29 = objc_msgSend(v3, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:contentInsets:minimumVisibleHeight:", v4, v37, v11, v36, v35, v34, v33, v32, v31, v13, v15, v17, v19, v21, v23, v25,
                  v27,
                  v28);

  return v29;
}

- (BOOL)isGeometryEqualToLayoutInfo:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PUAccessoryTileLayoutInfo;
  if (![(PUTileLayoutInfo *)&v34 isGeometryEqualToLayoutInfo:v4]) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  [(PUAccessoryTileLayoutInfo *)self untransformedContentFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 untransformedContentFrame];
  v36.origin.double x = v13;
  v36.origin.double y = v14;
  v36.size.double width = v15;
  v36.size.double height = v16;
  v35.origin.double x = v6;
  v35.origin.double y = v8;
  v35.size.double width = v10;
  v35.size.double height = v12;
  if (CGRectEqualToRect(v35, v36))
  {
    [(PUAccessoryTileLayoutInfo *)self contentInsets];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    [v4 contentInsets];
    BOOL v28 = 0;
    if (v20 == v29 && v18 == v25 && v24 == v27 && v22 == v26)
    {
      [(PUAccessoryTileLayoutInfo *)self minimumVisibleHeight];
      double v31 = v30;
      [v4 minimumVisibleHeight];
      BOOL v28 = v31 == v32;
    }
  }
  else
  {
LABEL_9:
    BOOL v28 = 0;
  }

  return v28;
}

- (double)initWithTileIdentifier:(uint64_t)a3 center:(_OWORD *)a4 size:(uint64_t)a5 alpha:(uint64_t)a6 transform:(uint64_t)a7 zPosition:(uint64_t)a8 coordinateSystem:(double)a9 untransformedContentFrame:(double)a10 contentInsets:(double)a11 minimumVisibleHeight:(double)a12
{
  v21.receiver = a1;
  v21.super_class = (Class)PUAccessoryTileLayoutInfo;
  long long v17 = a4[1];
  v20[0] = *a4;
  v20[1] = v17;
  v20[2] = a4[2];
  double v18 = (double *)objc_msgSendSuper2(&v21, sel_initWithTileIdentifier_center_size_alpha_transform_zPosition_coordinateSystem_, a3, v20);
  if (v18)
  {
    double result = a24;
    *((void *)v18 + 38) = a17;
    *((void *)v18 + 39) = a18;
    *((void *)v18 + 40) = a19;
    *((void *)v18 + 41) = a20;
    *((void *)v18 + 42) = a21;
    *((void *)v18 + 43) = a22;
    *((void *)v18 + 44) = a23;
    v18[45] = a24;
    *((void *)v18 + 37) = a25;
  }
  return result;
}

- (PUAccessoryTileLayoutInfo)initWithTileIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5 alpha:(double)a6 transform:(CGAffineTransform *)a7 zPosition:(double)a8 coordinateSystem:(id)a9
{
  long long v9 = *(_OWORD *)&a7->c;
  v11[0] = *(_OWORD *)&a7->a;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a7->tx;
  return -[PUAccessoryTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:contentInsets:minimumVisibleHeight:](self, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:contentInsets:minimumVisibleHeight:", a3, v11, a9, a4.x, a4.y, a5.width, a5.height, a6, a8, *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8), *(void *)(MEMORY[0x1E4F1DB20] + 16), *(void *)(MEMORY[0x1E4F1DB20] + 24), *MEMORY[0x1E4FB2848], *(void *)(MEMORY[0x1E4FB2848] + 8), *(void *)(MEMORY[0x1E4FB2848] + 16),
           *(void *)(MEMORY[0x1E4FB2848] + 24),
           0);
}

@end