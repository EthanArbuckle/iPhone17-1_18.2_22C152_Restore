@interface PXOverlayFeedLayoutGenerator
- ($AD15B6C785738E514ABCC493A298F7F8)_frameForItemAtIndex:(SEL)a3 in:(int64_t)a4 verticalOffset:(CGRect *)a5;
- (CGPoint)visibleOrigin;
- (CGRect)_frameForItemInColumn:(int64_t)a3 columnCount:(int64_t)a4 verticalOffset:(double)a5;
- (void)setVisibleOrigin:(CGPoint)a3;
- (void)setVisibleOrigin:(CGPoint)a3 updateFirstItemPosition:(BOOL)a4;
- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5 zPositions:(float *)a6;
@end

@implementation PXOverlayFeedLayoutGenerator

- (void)setVisibleOrigin:(CGPoint)a3
{
  self->_visibleOrigin = a3;
}

- (CGPoint)visibleOrigin
{
  double x = self->_visibleOrigin.x;
  double y = self->_visibleOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)_frameForItemInColumn:(int64_t)a3 columnCount:(int64_t)a4 verticalOffset:(double)a5
{
  v5 = [(PXOverlayFeedLayoutGenerator *)self metrics];
  [v5 referenceSize];
  [v5 contentInsets];
  PXEdgeInsetsInsetSize();
}

- ($AD15B6C785738E514ABCC493A298F7F8)_frameForItemAtIndex:(SEL)a3 in:(int64_t)a4 verticalOffset:(CGRect *)a5
{
  id v38 = [(PXOverlayFeedLayoutGenerator *)self metrics];
  [v38 referenceSize];
  if (a4)
  {
    int v12 = [v38 useSimpleLayout];
    uint64_t v13 = [(PXOverlayFeedLayoutGenerator *)self itemCount];
    int64_t v14 = a4 - 1;
    int64_t v15 = (a4 - 1) % 15;
    if (!v12) {
      int64_t v14 = (a4 - 1) % 15;
    }
    if (v12)
    {
LABEL_5:
      uint64_t v16 = 4;
    }
    else
    {
      uint64_t v16 = (v13 - 1) % 15;
      if (15 * ((v13 - 1) / 15) >= a4)
      {
        uint64_t v25 = 1;
        if ((unint64_t)v15 < 0xE) {
          uint64_t v25 = 2;
        }
        BOOL v26 = v15 < 12;
LABEL_13:
        if (v26) {
          uint64_t v16 = 4;
        }
        else {
          uint64_t v16 = v25;
        }
      }
      else
      {
        switch(v16)
        {
          case 1:
            break;
          case 2:
          case 3:
            uint64_t v16 = 2;
            break;
          case 5:
            BOOL v36 = v15 < 4;
            goto LABEL_33;
          case 6:
            BOOL v37 = v15 < 4;
            goto LABEL_37;
          case 7:
            uint64_t v25 = 1;
            if ((unint64_t)v15 < 6) {
              uint64_t v25 = 2;
            }
            BOOL v26 = v15 < 4;
            goto LABEL_13;
          case 9:
            BOOL v36 = v15 < 8;
            goto LABEL_33;
          case 10:
            BOOL v37 = v15 < 8;
            goto LABEL_37;
          case 11:
            uint64_t v25 = 1;
            if ((unint64_t)v15 < 0xA) {
              uint64_t v25 = 2;
            }
            BOOL v26 = v15 < 8;
            goto LABEL_13;
          case 13:
            BOOL v36 = v15 < 12;
LABEL_33:
            if (v36) {
              uint64_t v16 = 4;
            }
            else {
              uint64_t v16 = 1;
            }
            break;
          case 14:
            BOOL v37 = v15 < 12;
LABEL_37:
            if (v37) {
              uint64_t v16 = 4;
            }
            else {
              uint64_t v16 = 2;
            }
            break;
          default:
            goto LABEL_5;
        }
      }
    }
    uint64_t v27 = v14 % v16;
    [(PXOverlayFeedLayoutGenerator *)self _frameForItemInColumn:v14 % v16 columnCount:v16 verticalOffset:a6];
    CGFloat v24 = v28;
    CGFloat v23 = v29;
    CGFloat v17 = v30;
    double v18 = v31;
    if (v27 == v16 - 1)
    {
      double MaxY = CGRectGetMaxY(*(CGRect *)&v28);
      [v38 interItemSpacing];
      v33 = v38;
      a6 = MaxY + v34;
      goto LABEL_19;
    }
  }
  else
  {
    CGFloat v17 = v10;
    double v18 = v11;
    [v38 contentInsets];
    double v20 = v18 + v19;
    [v38 firstRowTopMargin];
    a6 = v21 + v20;
    [(PXOverlayFeedLayoutGenerator *)self visibleOrigin];
    CGFloat v23 = v22;
    CGFloat v24 = 0.0;
  }
  v33 = v38;
LABEL_19:
  retstr->var0.origin.double x = v24;
  retstr->var0.origin.double y = v23;
  retstr->var0.size.width = v17;
  retstr->var0.size.height = v18;
  retstr->var1 = a6;

  return result;
}

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5 zPositions:(float *)a6
{
  unint64_t v12 = [(PXOverlayFeedLayoutGenerator *)self itemCount];
  uint64_t v13 = [(PXOverlayFeedLayoutGenerator *)self metrics];
  [v13 referenceSize];
  double v15 = v14;
  double v17 = v16;
  [v13 contentInsets];
  double v19 = v18;
  double v21 = v20;
  if (v15 > 0.0)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PXOverlayFeedLayoutGenerator.m", 60, @"Invalid parameter not satisfying: %@", @"itemCount > 0" object file lineNumber description];

    goto LABEL_5;
  }
  BOOL v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"PXOverlayFeedLayoutGenerator.m", 59, @"Invalid parameter not satisfying: %@", @"referenceSize.width > 0" object file lineNumber description];

  if (!v12) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v22 = 0;
  CGFloat v23 = a4;
  do
  {
    [(PXOverlayFeedLayoutGenerator *)self _frameForItemAtIndex:v22 in:a4 verticalOffset:0.0];
    v23->origin = 0u;
    v23->size = 0u;
    ++v23;
    a5[v22] = 0;
    a6[v22++] = -1.0;
  }
  while (v12 != v22);
LABEL_5:
  *a6 = 0.0;
  a3->width = v15;
  double MaxY = CGRectGetMaxY(a4[v12 - 1]);
  if (v12 > 1)
  {
    double v25 = v21 + v19 + MaxY;
    double MaxY = v17 + CGRectGetMinY(a4[1]) - v19;
    if (v25 >= MaxY) {
      double MaxY = v25;
    }
  }
  a3->height = MaxY;
}

- (void)setVisibleOrigin:(CGPoint)a3 updateFirstItemPosition:(BOOL)a4
{
  if (a3.x != self->_visibleOrigin.x || a3.y != self->_visibleOrigin.y)
  {
    BOOL v5 = a4;
    -[PXOverlayFeedLayoutGenerator setVisibleOrigin:](self, "setVisibleOrigin:");
    if (v5)
    {
      [(PXCachingLayoutGenerator *)self invalidate];
    }
  }
}

@end