@interface UIKBRenderGeometry
+ (id)geometryWithFrame:(CGRect)a3 paddedFrame:(CGRect)a4;
+ (id)geometryWithShape:(id)a3;
+ (id)sortedGeometries:(id)a3 leftToRight:(BOOL)a4;
- (BOOL)detachedVariants;
- (BOOL)isEqual:(id)a3;
- (BOOL)tallPopup;
- (CGPoint)popupSource;
- (CGRect)displayFrame;
- (CGRect)frame;
- (CGRect)layeredBackgroundPaddedFrame;
- (CGRect)layeredForegroundPaddedFrame;
- (CGRect)paddedFrame;
- (CGRect)symbolFrame;
- (CGSize)concaveCornerOffset;
- (NSValue)splitLeftRect;
- (NSValue)splitRightRect;
- (UIEdgeInsets)displayInsets;
- (UIEdgeInsets)layoutMargins;
- (UIEdgeInsets)paddedInsets;
- (UIKBRenderGeometry)initWithShape:(id)a3;
- (double)layeredBackgroundRoundRectRadius;
- (double)layeredForegroundRoundRectRadius;
- (double)roundRectRadius;
- (id)_copyForDirection:(int64_t)a3 positionFactor:(double)a4 inwardSizeFactor:(double)a5 outwardSizeFactor:(double)a6 perpendicularSizeFactor:(double)a7 sizeAspectRatio:(double)a8 scale:(double)a9;
- (id)copyForFlickDirection:(int64_t)a3 scale:(double)a4;
- (id)copyForPopupDirection:(int64_t)a3 scale:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)iPadVariantGeometries:(unint64_t)a3 rowLimit:(int64_t)a4;
- (id)iPhoneVariantGeometries:(unint64_t)a3 annotationIndex:(unint64_t)a4;
- (id)similarShape;
- (id)watchVariantGeometries:(unint64_t)a3 annotationIndex:(unint64_t)a4;
- (int)popupBias;
- (int64_t)flickDirection;
- (int64_t)popupDirection;
- (unint64_t)adjustForTranslucentGapsInFrameWithSize_10Key:(CGSize)a3 centerX:(double)a4 bottomEdge:(BOOL)a5 topEdge:(BOOL)a6;
- (unint64_t)adjustForTranslucentGapsWithSize:(CGSize)a3 inFrame:(CGRect)a4;
- (unint64_t)concaveCorner;
- (unint64_t)roundRectCorners;
- (void)adjustForConsistentGapsWithSize:(CGSize)a3 inFrame:(CGRect)a4;
- (void)adjustToTopWithInsets:(UIEdgeInsets)a3;
- (void)applyInsets:(UIEdgeInsets)a3;
- (void)applyOffset:(CGPoint)a3;
- (void)applyShadowInsets:(UIEdgeInsets)a3;
- (void)makeIntegralWithScale:(double)a3;
- (void)overlayWithGeometry:(id)a3;
- (void)setConcaveCorner:(unint64_t)a3;
- (void)setConcaveCornerOffset:(CGSize)a3;
- (void)setDetachedVariants:(BOOL)a3;
- (void)setDisplayFrame:(CGRect)a3;
- (void)setFlickDirection:(int64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayeredBackgroundPaddedFrame:(CGRect)a3;
- (void)setLayeredBackgroundRoundRectRadius:(double)a3;
- (void)setLayeredForegroundPaddedFrame:(CGRect)a3;
- (void)setLayeredForegroundRoundRectRadius:(double)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setPaddedFrame:(CGRect)a3;
- (void)setPopupBias:(int)a3;
- (void)setPopupDirection:(int64_t)a3;
- (void)setPopupSource:(CGPoint)a3;
- (void)setRoundRectCorners:(unint64_t)a3;
- (void)setRoundRectRadius:(double)a3;
- (void)setSplitLeftRect:(id)a3;
- (void)setSplitRightRect:(id)a3;
- (void)setSymbolFrame:(CGRect)a3;
- (void)setTallPopup:(BOOL)a3;
@end

@implementation UIKBRenderGeometry

- (unint64_t)adjustForTranslucentGapsWithSize:(CGSize)a3 inFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.height;
  double v9 = a3.width;
  if (CGRectIsEmpty(a4)) {
    return 0;
  }
  if (v9 == *MEMORY[0x1E4F1DB30] && v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    return 0;
  }
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v31 = v8;
  double MidX = CGRectGetMidX(v34);
  [(UIKBRenderGeometry *)self paddedFrame];
  double v13 = v35.origin.x;
  double v14 = v35.size.width;
  double v32 = v35.size.height;
  double v33 = v35.origin.y;
  if (MidX <= CGRectGetMaxX(v35))
  {
    v36.origin.CGFloat x = v13;
    v36.size.CGFloat height = v32;
    v36.origin.CGFloat y = v33;
    v36.size.CGFloat width = v14;
    double MinX = CGRectGetMinX(v36);
    if (MidX < MinX) {
      double v21 = v9 + v13;
    }
    else {
      double v21 = v13;
    }
    if (MidX < MinX) {
      double v13 = v9 + v13;
    }
    double v17 = v33;
    if (MidX < MinX) {
      double v15 = v14 - v9;
    }
    else {
      double v15 = v14;
    }
    double v18 = v21;
    if (MidX < MinX) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    double v15 = v14 - v9;
    uint64_t v16 = 8;
    double v17 = v33;
    double v18 = v13;
  }
  v37.origin.CGFloat x = x;
  CGFloat v22 = v17;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v37);
  v38.origin.CGFloat x = v13;
  v38.origin.CGFloat y = v22;
  v38.size.CGFloat width = v15;
  v38.size.CGFloat height = v32;
  CGFloat v24 = CGRectGetMinY(v38);
  BOOL v25 = MinY == v24;
  BOOL v26 = MinY != v24;
  double v27 = 0.0;
  if (!v25) {
    double v27 = v31;
  }
  double v28 = v32 - v27;
  double v29 = -0.0;
  if (!v25) {
    double v29 = v31;
  }
  unint64_t v19 = v16 | v26;
  -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", v18, v33 + v29, v15, v28, *(void *)&MidX);
  return v19;
}

- (unint64_t)adjustForTranslucentGapsInFrameWithSize_10Key:(CGSize)a3 centerX:(double)a4 bottomEdge:(BOOL)a5 topEdge:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double height = a3.height;
  double width = a3.width;
  [(UIKBRenderGeometry *)self paddedFrame];
  double x = v22.origin.x;
  double y = v22.origin.y;
  double v14 = v22.size.width;
  double v15 = v22.size.height;
  if (CGRectGetMaxX(v22) >= a4)
  {
    v23.origin.double x = x;
    v23.origin.double y = y;
    v23.size.double width = v14;
    v23.size.double height = v15;
    double MinX = CGRectGetMinX(v23);
    if (MinX <= a4)
    {
      double v16 = v14;
    }
    else
    {
      double x = width + x;
      double v16 = v14 - width;
    }
    if (MinX > a4) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    double v16 = v14 - width;
    uint64_t v17 = 8;
  }
  uint64_t v19 = 4;
  if (!v7) {
    uint64_t v19 = 0;
  }
  uint64_t v20 = v19 | v6;
  [(UIKBRenderGeometry *)self setPaddedFrame:UIRectInsetEdges(v20, x, y, v16, v15, height)];
  return v17 | v20;
}

- (void)adjustForConsistentGapsWithSize:(CGSize)a3 inFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.height;
  double v9 = a3.width;
  if (!CGRectIsEmpty(a4))
  {
    BOOL v11 = v9 == *MEMORY[0x1E4F1DB30] && v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (!v11)
    {
      double v31 = v8;
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      double MidX = CGRectGetMidX(v37);
      [(UIKBRenderGeometry *)self paddedFrame];
      CGFloat v13 = v38.origin.y;
      double v14 = v38.size.width;
      CGFloat v33 = v38.origin.x;
      CGFloat rect = v38.size.height;
      double v32 = MidX;
      if (MidX <= CGRectGetMaxX(v38))
      {
        double v17 = v33;
        v39.size.CGFloat height = rect;
        v39.origin.CGFloat x = v33;
        v39.origin.CGFloat y = v13;
        v39.size.CGFloat width = v14;
        if (v32 >= CGRectGetMinX(v39)) {
          double v15 = v9;
        }
        else {
          double v15 = 1.0;
        }
        double v16 = v15;
      }
      else
      {
        double v15 = 1.0;
        double v16 = v9;
        double v17 = v33;
      }
      double v18 = v13;
      CGFloat v19 = v14 - (v9 + v15);
      double v20 = v18 + 0.0;
      double v30 = v9;
      double v21 = v17 + v16;
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.CGFloat width = width;
      v40.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v40);
      v41.origin.CGFloat x = v21;
      CGFloat v34 = v19;
      v41.origin.CGFloat y = v20;
      v41.size.CGFloat width = v19;
      v41.size.CGFloat height = rect;
      if (MinY == CGRectGetMinY(v41))
      {
        double v23 = v21;
        double v24 = v31;
        double v25 = v31 + v30 * 0.5 + -1.0;
        double v26 = v34;
        double v27 = rect;
      }
      else
      {
        v42.origin.CGFloat x = x;
        v42.origin.CGFloat y = y;
        v42.size.CGFloat width = width;
        v42.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v42);
        double v23 = v21;
        v43.origin.CGFloat x = v21;
        v43.origin.CGFloat y = v20;
        v43.size.CGFloat width = v34;
        double v27 = rect;
        v43.size.CGFloat height = rect;
        CGFloat v29 = CGRectGetMaxY(v43);
        double v24 = v31 * 0.5 + 2.0;
        BOOL v11 = MaxY == v29;
        double v25 = v24 + v30 * 0.5 + -1.0;
        if (v11) {
          double v25 = v30 * 0.5 + v24;
        }
        double v26 = v34;
      }
      -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", v23 + 0.0, v20 + v24, v26, v27 - v25);
    }
  }
}

- (void)adjustToTopWithInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(UIKBRenderGeometry *)self frame];
  if (v8 != 0.0)
  {
    [(UIKBRenderGeometry *)self frame];
    double v11 = left + right;
    double v13 = top + bottom;
    -[UIKBRenderGeometry setFrame:](self, "setFrame:", left + v9, top + v10, v12 - v11, v14 - v13);
    [(UIKBRenderGeometry *)self paddedFrame];
    -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", left + v15, top + v16, v17 - v11, v18 - v13);
    [(UIKBRenderGeometry *)self displayFrame];
    double v20 = left + v19;
    double v22 = top + v21;
    double v24 = v23 - v11;
    double v26 = v25 - v13;
    -[UIKBRenderGeometry setDisplayFrame:](self, "setDisplayFrame:", v20, v22, v24, v26);
  }
}

- (void)makeIntegralWithScale:(double)a3
{
  [(UIKBRenderGeometry *)self frame];
  [(UIKBRenderGeometry *)self setFrame:UIRectIntegralWithScale(v5, v6, v7, v8, a3)];
  [(UIKBRenderGeometry *)self paddedFrame];
  [(UIKBRenderGeometry *)self setPaddedFrame:UIRectIntegralWithScale(v9, v10, v11, v12, a3)];
  [(UIKBRenderGeometry *)self displayFrame];
  [(UIKBRenderGeometry *)self setDisplayFrame:UIRectIntegralWithScale(v13, v14, v15, v16, a3)];
  [(UIKBRenderGeometry *)self symbolFrame];
  double v21 = UIRectIntegralWithScale(v17, v18, v19, v20, a3);
  [(UIKBRenderGeometry *)self setSymbolFrame:v21];
}

- (void)applyOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIKBRenderGeometry *)self frame];
  -[UIKBRenderGeometry setFrame:](self, "setFrame:", x + v6, y + v8, v7 - (x - x), v9 - (y - y));
  [(UIKBRenderGeometry *)self paddedFrame];
  -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", x + v10, y + v12, v11 - (x - x), v13 - (y - y));
  [(UIKBRenderGeometry *)self displayFrame];
  -[UIKBRenderGeometry setDisplayFrame:](self, "setDisplayFrame:", x + v14, y + v16, v15 - (x - x), v17 - (y - y));
  [(UIKBRenderGeometry *)self symbolFrame];
  double v19 = x + v18;
  double v21 = v20 - (x - x);
  double v23 = y + v22;
  double v25 = v24 - (y - y);
  -[UIKBRenderGeometry setSymbolFrame:](self, "setSymbolFrame:", v19, v23, v21, v25);
}

- (id)copyForFlickDirection:(int64_t)a3 scale:(double)a4
{
  id v5 = [(UIKBRenderGeometry *)self _copyForDirection:a3 positionFactor:1.0 inwardSizeFactor:0.12 outwardSizeFactor:-0.12 perpendicularSizeFactor:-0.125 sizeAspectRatio:0.8 scale:a4];
  [v5 displayFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(UIKBRenderGeometry *)self displayFrame];
  v21.origin.double x = v14;
  v21.origin.double y = v15;
  v21.size.CGFloat width = v16;
  v21.size.CGFloat height = v17;
  v19.origin.double x = v7;
  v19.origin.double y = v9;
  v19.size.CGFloat width = v11;
  v19.size.CGFloat height = v13;
  CGRect v20 = CGRectUnion(v19, v21);
  objc_msgSend(v5, "setDisplayFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  return v5;
}

- (id)copyForPopupDirection:(int64_t)a3 scale:(double)a4
{
  return [(UIKBRenderGeometry *)self _copyForDirection:a3 positionFactor:1.0 inwardSizeFactor:0.0 outwardSizeFactor:-0.0125 perpendicularSizeFactor:0.0 sizeAspectRatio:0.5 scale:a4];
}

- (id)_copyForDirection:(int64_t)a3 positionFactor:(double)a4 inwardSizeFactor:(double)a5 outwardSizeFactor:(double)a6 perpendicularSizeFactor:(double)a7 sizeAspectRatio:(double)a8 scale:(double)a9
{
  CGFloat v16 = (void *)[(UIKBRenderGeometry *)self copy];
  [v16 paddedFrame];
  double v19 = v17;
  double v20 = v18;
  switch(a3)
  {
    case 0:
      objc_msgSend(v16, "applyOffset:", 0.0, -(v18 * a4));
      [v16 paddedFrame];
      double v21 = v20 * a6;
      double v22 = v19 * a7 * a8;
      objc_msgSend(v16, "setPaddedFrame:", v22 + v23, v21 + v25, v24 - (v22 + v22), v26 - (v21 + v20 * a5));
      [v16 displayFrame];
      double v28 = v22 + v27;
      double v30 = v29 - (v22 + v22);
      double v32 = v21 + v31;
      double v34 = v33 - (v21 + v20 * a5);
      uint64_t v35 = 3;
      goto LABEL_6;
    case 1:
      objc_msgSend(v16, "applyOffset:", v17 * a4, 0.0);
      [v16 paddedFrame];
      double v36 = v20 * a7;
      double v37 = v19 * a6 * a8;
      double v38 = v19 * a5 * a8;
      double v40 = v37 + v38;
      objc_msgSend(v16, "setPaddedFrame:", v38 + v39, v36 + v42, v41 - (v37 + v38), v43 - (v36 + v36));
      [v16 displayFrame];
      double v28 = v38 + v44;
      double v30 = v45 - v40;
      double v32 = v36 + v46;
      double v34 = v47 - (v36 + v36);
      uint64_t v35 = 10;
      goto LABEL_6;
    case 2:
      objc_msgSend(v16, "applyOffset:", 0.0, v18 * a4);
      [v16 paddedFrame];
      double v48 = v20 * a5;
      double v49 = v19 * a7 * a8;
      objc_msgSend(v16, "setPaddedFrame:", v49 + v50, v48 + v52, v51 - (v49 + v49), v53 - (v48 + v20 * a6));
      [v16 displayFrame];
      double v28 = v49 + v54;
      double v30 = v55 - (v49 + v49);
      double v32 = v48 + v56;
      double v34 = v57 - (v48 + v20 * a6);
      uint64_t v35 = 12;
      goto LABEL_6;
    case 3:
      objc_msgSend(v16, "applyOffset:", -(v17 * a4), 0.0);
      [v16 paddedFrame];
      double v58 = v20 * a7;
      double v59 = v19 * a5 * a8;
      double v60 = v19 * a6 * a8;
      double v62 = v59 + v60;
      objc_msgSend(v16, "setPaddedFrame:", v60 + v61, v58 + v64, v63 - (v59 + v60), v65 - (v58 + v58));
      [v16 displayFrame];
      double v28 = v60 + v66;
      double v30 = v67 - v62;
      double v32 = v58 + v68;
      double v34 = v69 - (v58 + v58);
      uint64_t v35 = 5;
LABEL_6:
      objc_msgSend(v16, "setDisplayFrame:", v28, v32, v30, v34);
      [v16 setRoundRectCorners:v35];
      break;
    default:
      break;
  }
  [v16 setRoundRectRadius:8.0];
  [v16 makeIntegralWithScale:a9];
  return v16;
}

+ (id)geometryWithShape:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithShape:v4];

  return v5;
}

+ (id)geometryWithFrame:(CGRect)a3 paddedFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  double v12 = objc_alloc_init(UIKBRenderGeometry);
  -[UIKBRenderGeometry setFrame:](v12, "setFrame:", v11, v10, v9, v8);
  -[UIKBRenderGeometry setPaddedFrame:](v12, "setPaddedFrame:", x, y, width, height);
  -[UIKBRenderGeometry setSymbolFrame:](v12, "setSymbolFrame:", x, y, width, height);
  -[UIKBRenderGeometry setDisplayFrame:](v12, "setDisplayFrame:", x, y, width, height);
  [(UIKBRenderGeometry *)v12 setConcaveCorner:0];
  -[UIKBRenderGeometry setConcaveCornerOffset:](v12, "setConcaveCornerOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [(UIKBRenderGeometry *)v12 setFlickDirection:-3];
  double v13 = *MEMORY[0x1E4F1DB20];
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  -[UIKBRenderGeometry setLayeredBackgroundPaddedFrame:](v12, "setLayeredBackgroundPaddedFrame:", *MEMORY[0x1E4F1DB20], v14, v15, v16);
  -[UIKBRenderGeometry setLayeredForegroundPaddedFrame:](v12, "setLayeredForegroundPaddedFrame:", v13, v14, v15, v16);
  return v12;
}

- (UIKBRenderGeometry)initWithShape:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)UIKBRenderGeometry;
  id v5 = [(UIKBRenderGeometry *)&v27 init];
  if (v5)
  {
    [v4 frame];
    *((void *)v5 + 15) = v6;
    *((void *)v5 + 16) = v7;
    *((void *)v5 + 17) = v8;
    *((void *)v5 + 18) = v9;
    [v4 paddedFrame];
    *((void *)v5 + 19) = v10;
    *((void *)v5 + 20) = v11;
    *((void *)v5 + 21) = v12;
    *((void *)v5 + 22) = v13;
    [v4 paddedFrame];
    *((void *)v5 + 23) = v14;
    *((void *)v5 + 24) = v15;
    *((void *)v5 + 25) = v16;
    *((void *)v5 + 26) = v17;
    [v4 paddedFrame];
    *((void *)v5 + 27) = v18;
    *((void *)v5 + 28) = v19;
    *((void *)v5 + 29) = v20;
    *((void *)v5 + 30) = v21;
    *((void *)v5 + 2) = [v4 concaveCorner];
    [v4 concaveCornerOffset];
    *((void *)v5 + 13) = v22;
    *((void *)v5 + 14) = v23;
    *((void *)v5 + 5) = -3;
    long long v24 = *MEMORY[0x1E4F1DB20];
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v5 + 280) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v5 + 296) = v25;
    *(_OWORD *)(v5 + 312) = v24;
    *(_OWORD *)(v5 + 328) = v25;
  }

  return (UIKBRenderGeometry *)v5;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  [(UIKBRenderGeometry *)self frame];
  id v4 = NSStringFromCGRect(v24);
  [v3 appendFormat:@"; frame = %@", v4];

  [(UIKBRenderGeometry *)self paddedFrame];
  id v5 = NSStringFromCGRect(v25);
  [v3 appendFormat:@"; paddedFrame = %@", v5];

  [(UIKBRenderGeometry *)self displayFrame];
  uint64_t v6 = NSStringFromCGRect(v26);
  [v3 appendFormat:@"; displayFrame = %@", v6];

  [(UIKBRenderGeometry *)self symbolFrame];
  uint64_t v7 = NSStringFromCGRect(v27);
  [v3 appendFormat:@"; symbolFrame = %@", v7];

  if ([(UIKBRenderGeometry *)self concaveCorner]) {
    objc_msgSend(v3, "appendFormat:", @"; concaveCorner = %lux",
  }
      [(UIKBRenderGeometry *)self concaveCorner]);
  [(UIKBRenderGeometry *)self concaveCornerOffset];
  if (v9 != *MEMORY[0x1E4F1DB30] || v8 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(UIKBRenderGeometry *)self concaveCornerOffset];
    uint64_t v10 = NSStringFromCGSize(v22);
    [v3 appendFormat:@"; concaveCornerOffset = %@", v10];
  }
  [(UIKBRenderGeometry *)self popupSource];
  if (v12 != *MEMORY[0x1E4F1DAD8] || v11 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    [(UIKBRenderGeometry *)self popupSource];
    uint64_t v13 = NSStringFromCGPoint(v23);
    [v3 appendFormat:@"; popupSource = %@", v13];
  }
  if ([(UIKBRenderGeometry *)self roundRectCorners]) {
    objc_msgSend(v3, "appendFormat:", @"; roundRectCorners = %lux",
  }
      [(UIKBRenderGeometry *)self roundRectCorners]);
  uint64_t v14 = enumStringForAttributeValue([(UIKBRenderGeometry *)self popupBias]);

  if (v14)
  {
    uint64_t v15 = enumStringForAttributeValue([(UIKBRenderGeometry *)self popupBias]);
    [v3 appendFormat:@"; popupBias = %@", v15];
  }
  if ([(UIKBRenderGeometry *)self flickDirection] != -3) {
    objc_msgSend(v3, "appendFormat:", @"; flickDirection = %d",
  }
      [(UIKBRenderGeometry *)self flickDirection]);
  if ([(UIKBRenderGeometry *)self detachedVariants]) {
    [v3 appendFormat:@"; detachedVariants = YES"];
  }
  if ([(UIKBRenderGeometry *)self tallPopup]) {
    objc_msgSend(v3, "appendFormat:", @"; tallPopup = %d", -[UIKBRenderGeometry tallPopup](self, "tallPopup"));
  }
  if ([(UIKBRenderGeometry *)self popupDirection]) {
    objc_msgSend(v3, "appendFormat:", @"; popupDirection = %ld",
  }
      [(UIKBRenderGeometry *)self popupDirection]);
  uint64_t v16 = [(UIKBRenderGeometry *)self splitLeftRect];

  if (v16)
  {
    uint64_t v17 = [(UIKBRenderGeometry *)self splitLeftRect];
    [v3 appendFormat:@"; splitLeftRect = %@", v17];
  }
  uint64_t v18 = [(UIKBRenderGeometry *)self splitRightRect];

  if (v18)
  {
    uint64_t v19 = [(UIKBRenderGeometry *)self splitRightRect];
    [v3 appendFormat:@"; splitRightRect = %@", v19];
  }
  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIKBRenderGeometry *)a3;
  if (v4 == self) {
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !CGRectEqualToRect(self->_frame, v4->_frame)
    || !CGRectEqualToRect(self->_paddedFrame, v4->_paddedFrame)
    || !CGRectEqualToRect(self->_displayFrame, v4->_displayFrame)
    || !CGRectEqualToRect(self->_symbolFrame, v4->_symbolFrame)
    || self->_concaveCorner != v4->_concaveCorner)
  {
LABEL_26:
    char v5 = 0;
    goto LABEL_28;
  }
  char v5 = 0;
  if (self->_concaveCornerOffset.width == v4->_concaveCornerOffset.width
    && self->_concaveCornerOffset.height == v4->_concaveCornerOffset.height)
  {
    char v5 = 0;
    if (self->_popupSource.x == v4->_popupSource.x && self->_popupSource.y == v4->_popupSource.y)
    {
      if (self->_roundRectCorners == v4->_roundRectCorners
        && self->_roundRectRadius == v4->_roundRectRadius
        && self->_popupBias == v4->_popupBias
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layoutMargins.top, *(float64x2_t *)&v4->_layoutMargins.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layoutMargins.bottom, *(float64x2_t *)&v4->_layoutMargins.bottom))), 0xFuLL))) & 1) != 0&& self->_flickDirection == v4->_flickDirection&& self->_detachedVariants == v4->_detachedVariants&& self->_tallPopup == v4->_tallPopup&& self->_popupDirection == v4->_popupDirection)
      {
        splitLeftRect = self->_splitLeftRect;
        if ((splitLeftRect != 0) != (v4->_splitLeftRect == 0)
          && (!splitLeftRect || -[NSValue isEqualToValue:](splitLeftRect, "isEqualToValue:")))
        {
          splitRightRect = self->_splitRightRect;
          if ((splitRightRect != 0) != (v4->_splitRightRect == 0))
          {
            if (splitRightRect)
            {
              char v5 = -[NSValue isEqualToValue:](splitRightRect, "isEqualToValue:");
              goto LABEL_28;
            }
LABEL_27:
            char v5 = 1;
            goto LABEL_28;
          }
        }
      }
      goto LABEL_26;
    }
  }
LABEL_28:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UIKBRenderGeometry);
  [(UIKBRenderGeometry *)self frame];
  -[UIKBRenderGeometry setFrame:](v4, "setFrame:");
  [(UIKBRenderGeometry *)self paddedFrame];
  -[UIKBRenderGeometry setPaddedFrame:](v4, "setPaddedFrame:");
  [(UIKBRenderGeometry *)self displayFrame];
  -[UIKBRenderGeometry setDisplayFrame:](v4, "setDisplayFrame:");
  [(UIKBRenderGeometry *)self symbolFrame];
  -[UIKBRenderGeometry setSymbolFrame:](v4, "setSymbolFrame:");
  [(UIKBRenderGeometry *)v4 setConcaveCorner:[(UIKBRenderGeometry *)self concaveCorner]];
  [(UIKBRenderGeometry *)self concaveCornerOffset];
  -[UIKBRenderGeometry setConcaveCornerOffset:](v4, "setConcaveCornerOffset:");
  [(UIKBRenderGeometry *)self popupSource];
  -[UIKBRenderGeometry setPopupSource:](v4, "setPopupSource:");
  [(UIKBRenderGeometry *)v4 setRoundRectCorners:[(UIKBRenderGeometry *)self roundRectCorners]];
  [(UIKBRenderGeometry *)self roundRectRadius];
  -[UIKBRenderGeometry setRoundRectRadius:](v4, "setRoundRectRadius:");
  [(UIKBRenderGeometry *)v4 setPopupBias:[(UIKBRenderGeometry *)self popupBias]];
  [(UIKBRenderGeometry *)self layoutMargins];
  [(UIKBRenderGeometry *)v4 setLayoutMargins:"setLayoutMargins:"];
  [(UIKBRenderGeometry *)v4 setFlickDirection:[(UIKBRenderGeometry *)self flickDirection]];
  [(UIKBRenderGeometry *)v4 setDetachedVariants:[(UIKBRenderGeometry *)self detachedVariants]];
  [(UIKBRenderGeometry *)v4 setTallPopup:[(UIKBRenderGeometry *)self tallPopup]];
  [(UIKBRenderGeometry *)v4 setPopupDirection:[(UIKBRenderGeometry *)self popupDirection]];
  char v5 = [(UIKBRenderGeometry *)self splitLeftRect];
  uint64_t v6 = (void *)[v5 copy];
  [(UIKBRenderGeometry *)v4 setSplitLeftRect:v6];

  uint64_t v7 = [(UIKBRenderGeometry *)self splitRightRect];
  double v8 = (void *)[v7 copy];
  [(UIKBRenderGeometry *)v4 setSplitRightRect:v8];

  return v4;
}

- (void)overlayWithGeometry:(id)a3
{
  id v5 = a3;
  [v5 roundRectRadius];
  if (v4 > 0.0)
  {
    [v5 roundRectRadius];
    -[UIKBRenderGeometry setRoundRectRadius:](self, "setRoundRectRadius:");
  }
  if ([v5 roundRectCorners]) {
    -[UIKBRenderGeometry setRoundRectCorners:](self, "setRoundRectCorners:", [v5 roundRectCorners]);
  }
  if ([v5 popupBias]) {
    -[UIKBRenderGeometry setPopupBias:](self, "setPopupBias:", [v5 popupBias]);
  }
  if ([v5 flickDirection] != -3) {
    -[UIKBRenderGeometry setFlickDirection:](self, "setFlickDirection:", [v5 flickDirection]);
  }
  if ([v5 detachedVariants]) {
    -[UIKBRenderGeometry setDetachedVariants:](self, "setDetachedVariants:", [v5 detachedVariants]);
  }
  if ([v5 tallPopup]) {
    -[UIKBRenderGeometry setTallPopup:](self, "setTallPopup:", [v5 tallPopup]);
  }
  if ([v5 popupDirection]) {
    -[UIKBRenderGeometry setPopupDirection:](self, "setPopupDirection:", [v5 popupDirection]);
  }
}

- (void)applyInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (a3.left != 0.0 || a3.top != 0.0 || a3.right != 0.0 || a3.bottom != 0.0)
  {
    [(UIKBRenderGeometry *)self frame];
    -[UIKBRenderGeometry setFrame:](self, "setFrame:", left + v8, top + v9, v10 - (left + right), v11 - (top + bottom));
    [(UIKBRenderGeometry *)self paddedFrame];
    -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", left + v12, top + v13, v14 - (left + right), v15 - (top + bottom));
    [(UIKBRenderGeometry *)self displayFrame];
    -[UIKBRenderGeometry setDisplayFrame:](self, "setDisplayFrame:", left + v16, top + v17, v18 - (left + right), v19 - (top + bottom));
    [(UIKBRenderGeometry *)self symbolFrame];
    -[UIKBRenderGeometry setSymbolFrame:](self, "setSymbolFrame:", left + v20, top + v21, v22 - (left + right), v23 - (top + bottom));
    [(UIKBRenderGeometry *)self popupSource];
    double v25 = v24;
    double v27 = v26;
    if ([(UIKBRenderGeometry *)self flickDirection])
    {
      if ([(UIKBRenderGeometry *)self flickDirection] == 2)
      {
        double v27 = top + v27;
      }
      else if ([(UIKBRenderGeometry *)self flickDirection] == 3)
      {
        double v25 = v25 - right;
      }
      else
      {
        int64_t v28 = [(UIKBRenderGeometry *)self flickDirection];
        double v29 = -0.0;
        if (v28 == 1) {
          double v29 = left;
        }
        double v25 = v25 + v29;
      }
    }
    else
    {
      double v27 = v27 - bottom;
    }
    -[UIKBRenderGeometry setPopupSource:](self, "setPopupSource:", v25, v27);
  }
}

- (void)applyShadowInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (a3.left == 0.0 && a3.top == 0.0 && a3.right == 0.0 && a3.bottom == 0.0) {
    return;
  }
  if ([(UIKBRenderGeometry *)self detachedVariants]
    || ![(UIKBRenderGeometry *)self popupBias]
    || [(UIKBRenderGeometry *)self popupDirection] == 3)
  {
    if (([(UIKBRenderGeometry *)self flickDirection] & 0x8000000000000000) == 0)
    {
      if (![(UIKBRenderGeometry *)self flickDirection])
      {
        [(UIKBRenderGeometry *)self popupSource];
        double v9 = v12;
        [(UIKBRenderGeometry *)self popupSource];
        double v11 = v13 - bottom;
        double bottom = 0.0;
        goto LABEL_22;
      }
      if ([(UIKBRenderGeometry *)self flickDirection] == 2)
      {
        [(UIKBRenderGeometry *)self popupSource];
        double v9 = v8;
        [(UIKBRenderGeometry *)self popupSource];
        double v11 = top + v10;
        double top = 0.0;
LABEL_22:
        -[UIKBRenderGeometry setPopupSource:](self, "setPopupSource:", v9, v11);
        goto LABEL_23;
      }
      if ([(UIKBRenderGeometry *)self flickDirection] == 3)
      {
        [(UIKBRenderGeometry *)self popupSource];
        double v9 = v14 - right;
        [(UIKBRenderGeometry *)self popupSource];
        double right = 0.0;
        goto LABEL_22;
      }
      if ([(UIKBRenderGeometry *)self flickDirection] == 1)
      {
        [(UIKBRenderGeometry *)self popupSource];
        double v9 = left + v30;
        [(UIKBRenderGeometry *)self popupSource];
        double left = 0.0;
        goto LABEL_22;
      }
    }
LABEL_23:
    -[UIKBRenderGeometry applyInsets:](self, "applyInsets:", top, left, bottom, right);
    return;
  }
  [(UIKBRenderGeometry *)self displayFrame];
  double v17 = left + right;
  -[UIKBRenderGeometry setDisplayFrame:](self, "setDisplayFrame:", left + v15, top + v16, v18 - (left + right), v19 - (top + bottom));
  [(UIKBRenderGeometry *)self paddedFrame];
  double v21 = v20;
  double v23 = left + v22;
  double v25 = v24 - v17;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v27 = v25 / v26;
  if (v25 / v26 < 0.785) {
    double v27 = v25 / v26 * 0.5;
  }
  double v28 = ceil(v21 * v27);
  [(UIKBRenderGeometry *)self paddedFrame];
  double v29 = CGRectGetMaxY(v32) - bottom - v28;
  -[UIKBRenderGeometry setPaddedFrame:](self, "setPaddedFrame:", v23, v29, v25, v28);
}

- (id)iPhoneVariantGeometries:(unint64_t)a3 annotationIndex:(unint64_t)a4
{
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  [(UIKBRenderGeometry *)self displayFrame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(UIKBRenderGeometry *)self symbolFrame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v89 = v20;
  double v94 = v21;
  v104.origin.CGFloat x = v9;
  v104.origin.CGFloat y = v11;
  v104.size.CGFloat width = v13;
  v104.size.CGFloat height = v15;
  CGRect v105 = CGRectInset(v104, 8.0, -8.0);
  CGFloat x = v105.origin.x;
  CGFloat y = v105.origin.y;
  CGFloat width = v105.size.width;
  CGFloat height = v105.size.height;
  double v26 = +[UIKBGeometry geometry];
  [(UIKBRenderGeometry *)self frame];
  double v28 = v27;
  [(UIKBRenderGeometry *)self paddedFrame];
  objc_msgSend(v26, "setPaddingTop:", fabs(v28 - v29), 3);
  [(UIKBRenderGeometry *)self frame];
  double v32 = v30 + v31;
  [(UIKBRenderGeometry *)self paddedFrame];
  objc_msgSend(v26, "setPaddingBottom:", fabs(v32 - (v33 + v34)), 3);
  [(UIKBRenderGeometry *)self frame];
  double v36 = v35;
  [(UIKBRenderGeometry *)self paddedFrame];
  objc_msgSend(v26, "setPaddingLeft:", fabs(v36 - v37), 3);
  [(UIKBRenderGeometry *)self frame];
  double v40 = v38 + v39;
  [(UIKBRenderGeometry *)self paddedFrame];
  objc_msgSend(v26, "setPaddingRight:", fabs(v40 - (v41 + v42)), 3);
  [v26 setExplicitlySpecified:1];
  v106.origin.CGFloat x = v17;
  v106.origin.CGFloat y = v19;
  v106.size.CGFloat width = v89;
  v106.size.CGFloat height = v94;
  double MinX = CGRectGetMinX(v106);
  v107.origin.CGFloat x = x;
  v107.origin.CGFloat y = y;
  v107.size.CGFloat width = width;
  v107.size.CGFloat height = height;
  double v98 = CGRectGetMinX(v107);
  double rect1 = y;
  CGFloat v92 = width;
  double v93 = x;
  v108.origin.CGFloat x = x;
  v108.origin.CGFloat y = y;
  v108.size.CGFloat width = width;
  CGFloat v91 = height;
  v108.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v108);
  double v88 = v17;
  v109.origin.CGFloat x = v17;
  double v44 = v19;
  v109.origin.CGFloat y = v19;
  v109.size.CGFloat width = v89;
  double v45 = v94;
  v109.size.CGFloat height = v94;
  double v46 = CGRectGetMaxX(v109);
  if (a3)
  {
    double v47 = v46;
    double v48 = fmod(MinX - v98, v89);
    long double v49 = fmod(MaxX - v47, v89);
    uint64_t v50 = 0;
    double v86 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v87 = *MEMORY[0x1E4F1DB28];
    double v84 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v85 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    BOOL v52 = v48 < v49 || a4 >= a3;
    double v53 = v88 + v89;
    double v54 = v88 + v89;
    do
    {
      if (v89 >= v45 || v50 != 1 || a4 >= a3) {
        double v57 = v89;
      }
      else {
        double v57 = v45;
      }
      if (v50 == 1) {
        BOOL v58 = v52;
      }
      else {
        BOOL v58 = v50;
      }
      double v59 = v88;
      if (!v58) {
        double v59 = v88 + v89;
      }
      double v90 = v59;
      double v97 = v86;
      double v99 = v87;
      double v95 = v84;
      double v96 = v85;
      CGFloat v60 = v93;
      double v61 = rect1;
      while (1)
      {
        double v62 = v53 - v57;
        double v102 = v53;
        CGFloat v63 = v60;
        double v64 = v61;
        CGFloat v65 = v92;
        CGFloat v66 = v91;
        if (v58)
        {
          v113.origin.CGFloat x = v54;
          v113.origin.CGFloat y = v44;
          v113.size.CGFloat width = v57;
          CGFloat v67 = v44;
          double v68 = v94;
          v113.size.CGFloat height = v94;
          if (CGRectContainsRect(*(CGRect *)&v63, v113))
          {
            double v62 = v54;
            double v54 = v57 + v54;
LABEL_29:
            double v69 = v67;
            double v70 = v57;
            double v71 = v68;
            goto LABEL_44;
          }
          v110.origin.CGFloat x = v60;
          v110.origin.CGFloat y = rect1;
          v110.size.CGFloat width = v92;
          v110.size.CGFloat height = v91;
          v115.origin.CGFloat x = v62;
          v115.origin.CGFloat y = v67;
          v115.size.CGFloat width = v57;
          v115.size.CGFloat height = v94;
          BOOL v72 = CGRectContainsRect(v110, v115);
          BOOL v73 = !v72;
          double v74 = v102;
          if (v72) {
            double v74 = v62;
          }
          double v102 = v74;
          if (!v72) {
            double v62 = v99;
          }
        }
        else
        {
          v114.origin.CGFloat x = v62;
          v114.origin.CGFloat y = v44;
          v114.size.CGFloat width = v57;
          CGFloat v67 = v44;
          double v68 = v94;
          v114.size.CGFloat height = v94;
          if (CGRectContainsRect(*(CGRect *)&v63, v114))
          {
            double v102 = v62;
            goto LABEL_29;
          }
          v111.origin.CGFloat x = v60;
          v111.origin.CGFloat y = rect1;
          v111.size.CGFloat width = v92;
          v111.size.CGFloat height = v91;
          v116.origin.CGFloat x = v54;
          v116.origin.CGFloat y = v67;
          v116.size.CGFloat width = v57;
          v116.size.CGFloat height = v94;
          BOOL v75 = CGRectContainsRect(v111, v116);
          double v76 = v57 + v54;
          BOOL v73 = !v75;
          if (!v75) {
            double v76 = v54;
          }
          double v62 = v99;
          if (v75) {
            double v62 = v54;
          }
          double v54 = v76;
        }
        double v70 = v96;
        double v69 = v97;
        if (!v73)
        {
          double v69 = v67;
          double v70 = v57;
        }
        double v71 = v95;
        if (!v73) {
          double v71 = v68;
        }
LABEL_44:
        double v44 = v67;
        double v61 = rect1;
        v112.origin.CGFloat x = v62;
        v112.origin.CGFloat y = v69;
        v112.size.CGFloat width = v70;
        v112.size.CGFloat height = v71;
        if (!CGRectIsEmpty(v112) || v44 < rect1) {
          break;
        }
        double v95 = v71;
        double v96 = v70;
        double v97 = v69;
        double v99 = v62;
        double v53 = v90;
        double v44 = v44 - (v94 + 10.0);
        double v54 = v90;
        CGFloat v60 = v93;
      }
      objc_msgSend(v26, "paddedFrameWithResolvedFrame:", v62, v69, v70, v71);
      v82 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v62, v69, v70, v71, v78, v79, v80, v81);
      objc_msgSend(v82, "setRoundRectCorners:", -[UIKBRenderGeometry roundRectCorners](self, "roundRectCorners"));
      [(UIKBRenderGeometry *)self roundRectRadius];
      objc_msgSend(v82, "setRoundRectRadius:");
      [v7 addObject:v82];

      ++v50;
      double v45 = v94;
      double v53 = v102;
    }
    while (v50 != a3);
  }
  if (a4 < a3 && (unint64_t)objc_msgSend(v7, "count", v46) >= 2) {
    [v7 exchangeObjectAtIndex:1 withObjectAtIndex:a4];
  }

  return v7;
}

- (id)watchVariantGeometries:(unint64_t)a3 annotationIndex:(unint64_t)a4
{
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  [(UIKBRenderGeometry *)self displayFrame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(UIKBRenderGeometry *)self symbolFrame];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v81 = v20;
  double v86 = v21;
  v96.origin.CGFloat x = v9;
  v96.origin.CGFloat y = v11;
  v96.size.CGFloat width = v13;
  v96.size.CGFloat height = v15;
  CGRect v97 = CGRectInset(v96, 0.0, -0.0);
  CGFloat x = v97.origin.x;
  CGFloat y = v97.origin.y;
  CGFloat width = v97.size.width;
  CGFloat height = v97.size.height;
  double v26 = +[UIKBGeometry geometry];
  objc_msgSend(v26, "setPaddingTop:", 0x4000000000000000, 3);
  objc_msgSend(v26, "setPaddingBottom:", 0x4000000000000000, 3);
  [(UIKBRenderGeometry *)self frame];
  double v28 = v27;
  [(UIKBRenderGeometry *)self paddedFrame];
  objc_msgSend(v26, "setPaddingLeft:", fabs(v28 - v29), 3);
  [(UIKBRenderGeometry *)self frame];
  double v32 = v30 + v31;
  [(UIKBRenderGeometry *)self paddedFrame];
  objc_msgSend(v26, "setPaddingRight:", fabs(v32 - (v33 + v34)), 3);
  [v26 setExplicitlySpecified:1];
  v98.origin.CGFloat x = v17;
  v98.origin.CGFloat y = v19;
  v98.size.CGFloat width = v81;
  v98.size.CGFloat height = v86;
  double MinX = CGRectGetMinX(v98);
  v99.origin.CGFloat x = x;
  v99.origin.CGFloat y = y;
  v99.size.CGFloat width = width;
  v99.size.CGFloat height = height;
  double v90 = CGRectGetMinX(v99);
  double rect1 = y;
  CGFloat v84 = width;
  double v85 = x;
  v100.origin.CGFloat x = x;
  v100.origin.CGFloat y = y;
  v100.size.CGFloat width = width;
  CGFloat v83 = height;
  v100.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v100);
  double v80 = v17;
  v101.origin.CGFloat x = v17;
  double v36 = v19;
  v101.origin.CGFloat y = v19;
  v101.size.CGFloat width = v81;
  double v37 = v86;
  v101.size.CGFloat height = v86;
  double v38 = CGRectGetMaxX(v101);
  if (a3)
  {
    double v39 = v38;
    double v40 = fmod(MinX - v90, v81);
    long double v41 = fmod(MaxX - v39, v81);
    uint64_t v42 = 0;
    double v78 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v79 = *MEMORY[0x1E4F1DB28];
    double v76 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v77 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    BOOL v44 = v40 < v41 || a4 >= a3;
    double v45 = v80 + v81;
    double v46 = v80 + v81;
    do
    {
      if (v81 >= v37 || v42 != 1 || a4 >= a3) {
        double v49 = v81;
      }
      else {
        double v49 = v37;
      }
      if (v42 == 1) {
        BOOL v50 = v44;
      }
      else {
        BOOL v50 = v42;
      }
      double v51 = v80;
      if (!v50) {
        double v51 = v80 + v81;
      }
      double v82 = v51;
      double v89 = v78;
      double v91 = v79;
      double v87 = v76;
      double v88 = v77;
      CGFloat v52 = v85;
      double v53 = rect1;
      while (1)
      {
        double v54 = v45 - v49;
        double v94 = v45;
        CGFloat v55 = v52;
        double v56 = v53;
        CGFloat v57 = v84;
        CGFloat v58 = v83;
        if (v50)
        {
          v105.origin.CGFloat x = v46;
          v105.origin.CGFloat y = v36;
          v105.size.CGFloat width = v49;
          CGFloat v59 = v36;
          double v60 = v86;
          v105.size.CGFloat height = v86;
          if (CGRectContainsRect(*(CGRect *)&v55, v105))
          {
            double v54 = v46;
            double v46 = v49 + v46;
LABEL_29:
            double v61 = v59;
            double v62 = v49;
            double v63 = v60;
            goto LABEL_44;
          }
          v102.origin.CGFloat x = v52;
          v102.origin.CGFloat y = rect1;
          v102.size.CGFloat width = v84;
          v102.size.CGFloat height = v83;
          v107.origin.CGFloat x = v54;
          v107.origin.CGFloat y = v59;
          v107.size.CGFloat width = v49;
          v107.size.CGFloat height = v86;
          BOOL v64 = CGRectContainsRect(v102, v107);
          BOOL v65 = !v64;
          double v66 = v94;
          if (v64) {
            double v66 = v54;
          }
          double v94 = v66;
          if (!v64) {
            double v54 = v91;
          }
        }
        else
        {
          v106.origin.CGFloat x = v54;
          v106.origin.CGFloat y = v36;
          v106.size.CGFloat width = v49;
          CGFloat v59 = v36;
          double v60 = v86;
          v106.size.CGFloat height = v86;
          if (CGRectContainsRect(*(CGRect *)&v55, v106))
          {
            double v94 = v54;
            goto LABEL_29;
          }
          v103.origin.CGFloat x = v52;
          v103.origin.CGFloat y = rect1;
          v103.size.CGFloat width = v84;
          v103.size.CGFloat height = v83;
          v108.origin.CGFloat x = v46;
          v108.origin.CGFloat y = v59;
          v108.size.CGFloat width = v49;
          v108.size.CGFloat height = v86;
          BOOL v67 = CGRectContainsRect(v103, v108);
          double v68 = v49 + v46;
          BOOL v65 = !v67;
          if (!v67) {
            double v68 = v46;
          }
          double v54 = v91;
          if (v67) {
            double v54 = v46;
          }
          double v46 = v68;
        }
        double v62 = v88;
        double v61 = v89;
        if (!v65)
        {
          double v61 = v59;
          double v62 = v49;
        }
        double v63 = v87;
        if (!v65) {
          double v63 = v60;
        }
LABEL_44:
        double v36 = v59;
        double v53 = rect1;
        v104.origin.CGFloat x = v54;
        v104.origin.CGFloat y = v61;
        v104.size.CGFloat width = v62;
        v104.size.CGFloat height = v63;
        if (!CGRectIsEmpty(v104) || v36 < rect1) {
          break;
        }
        double v87 = v63;
        double v88 = v62;
        double v89 = v61;
        double v91 = v54;
        double v45 = v82;
        double v36 = v36 - (v86 + 16.0);
        double v46 = v82;
        CGFloat v52 = v85;
      }
      objc_msgSend(v26, "paddedFrameWithResolvedFrame:", v54, v61, v62, v63);
      double v74 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v54, v61, v62, v63, v70, v71, v72, v73);
      [v74 setRoundRectCorners:-1];
      [v74 setRoundRectRadius:2.0];
      [v7 addObject:v74];

      ++v42;
      double v37 = v86;
      double v45 = v94;
    }
    while (v42 != a3);
  }
  if (a4 < a3 && (unint64_t)objc_msgSend(v7, "count", v38) >= 2) {
    [v7 exchangeObjectAtIndex:1 withObjectAtIndex:a4];
  }

  return v7;
}

- (id)iPadVariantGeometries:(unint64_t)a3 rowLimit:(int64_t)a4
{
  [(UIKBRenderGeometry *)self roundRectRadius];
  double v8 = v7;
  if ((unint64_t)(a4 - 1) >= 0x7FFFFFFFFFFFFFFELL) {
    unint64_t v9 = 5;
  }
  else {
    unint64_t v9 = a4;
  }
  [(UIKBRenderGeometry *)self paddedFrame];
  double v11 = v10;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v13 = v12;
  [(UIKBRenderGeometry *)self displayFrame];
  CGRect v53 = CGRectInset(v52, 40.0, -40.0);
  double x = v53.origin.x;
  CGFloat width = v53.size.width;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v16 = v15;
  [(UIKBRenderGeometry *)self frame];
  double v49 = v17;
  [(UIKBRenderGeometry *)self frame];
  double v46 = v19;
  double v47 = v18;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v21 = v20;
  double v23 = v22;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v45 = v24;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v26 = v25;
  double v27 = [MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    unint64_t v28 = 0;
    BOOL v29 = 0;
    double v30 = width;
    double v31 = v8 * 0.5;
    double v32 = v11 - (v8 + v8);
    double v33 = v13 - (v8 + v8);
    double v34 = v45 - (v8 + (v16 - v49 + 0.0 + v47 + v46 - (v21 + v23) + 0.0) * 0.5 + 1.0) - v33;
    double v35 = v8 + v26;
    double v50 = x + v30;
    double v36 = 0.0;
    double v37 = v35;
    do
    {
      unint64_t v38 = v28 % v9;
      if (v29) {
        double v39 = v35;
      }
      else {
        double v39 = v37;
      }
      if (v29) {
        double v36 = 0.0;
      }
      if (v36 == 0.0)
      {
        if (v38) {
          int v40 = 1;
        }
        else {
          int v40 = -1;
        }
        double v41 = v39 + v32 * (double)v38 * (double)v40;
        if ((v38 & 1) != 0 && v32 + v41 > v50)
        {
          double v36 = -1.0;
        }
        else if ((v38 & 1) == 0 && v41 < x)
        {
          double v36 = 1.0;
        }
        else
        {
          double v39 = v39 + v32 * (double)v38 * (double)v40;
        }
      }
      double v42 = v32 * v36;
      if (v36 == 0.0) {
        double v42 = -0.0;
      }
      double v37 = v39 + v42;
      BOOL v29 = v9 - 1 == v38;
      double v43 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v39 + v42, v34 - v33 * (double)(v28 / v9), v32, v33, v39 + v42, v34 - v33 * (double)(v28 / v9), v32, v33);
      objc_msgSend(v43, "setRoundRectCorners:", -[UIKBRenderGeometry roundRectCorners](self, "roundRectCorners"));
      [v43 setRoundRectRadius:v31];
      [v27 addObject:v43];

      ++v28;
    }
    while (a3 != v28);
  }
  return v27;
}

+ (id)sortedGeometries:(id)a3 leftToRight:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = NSNumber;
  id v6 = a3;
  double v7 = objc_msgSend(v6, "sortedArrayUsingFunction:context:", geometryPositionSort, objc_msgSend(v5, "numberWithBool:", v4));

  return v7;
}

- (id)similarShape
{
  v3 = +[UIKBShape shape];
  [(UIKBRenderGeometry *)self frame];
  objc_msgSend(v3, "setFrame:");
  [(UIKBRenderGeometry *)self paddedFrame];
  objc_msgSend(v3, "setPaddedFrame:");
  return v3;
}

- (UIEdgeInsets)displayInsets
{
  [(UIKBRenderGeometry *)self displayFrame];
  double v4 = v3;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v6 = v4 - v5;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v9 = v7 + v8;
  [(UIKBRenderGeometry *)self displayFrame];
  double v12 = v9 - (v10 + v11);
  [(UIKBRenderGeometry *)self displayFrame];
  double v14 = v13;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v16 = v14 - v15;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v19 = v17 + v18;
  [(UIKBRenderGeometry *)self displayFrame];
  double v22 = v19 - (v20 + v21);
  double v23 = v6;
  double v24 = v16;
  double v25 = v12;
  result.double right = v22;
  result.double bottom = v25;
  result.double left = v24;
  result.double top = v23;
  return result;
}

- (UIEdgeInsets)paddedInsets
{
  [(UIKBRenderGeometry *)self paddedFrame];
  double v4 = v3;
  [(UIKBRenderGeometry *)self frame];
  double v6 = v4 - v5;
  [(UIKBRenderGeometry *)self frame];
  double v9 = v7 + v8;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v12 = v9 - (v10 + v11);
  [(UIKBRenderGeometry *)self paddedFrame];
  double v14 = v13;
  [(UIKBRenderGeometry *)self frame];
  double v16 = v14 - v15;
  [(UIKBRenderGeometry *)self frame];
  double v19 = v17 + v18;
  [(UIKBRenderGeometry *)self paddedFrame];
  double v22 = v19 - (v20 + v21);
  double v23 = v6;
  double v24 = v16;
  double v25 = v12;
  result.double right = v22;
  result.double bottom = v25;
  result.double left = v24;
  result.double top = v23;
  return result;
}

- (void)setLayeredBackgroundPaddedFrame:(CGRect)a3
{
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_layeredBackgroundPaddedFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_layeredBackgroundPaddedFrame.size = v3;
}

- (void)setLayeredBackgroundRoundRectRadius:(double)a3
{
  self->_layeredBackgroundRoundRectRadius = 0.0;
}

- (void)setLayeredForegroundPaddedFrame:(CGRect)a3
{
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_layeredForegroundPaddedFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_layeredForegroundPaddedFrame.size = v3;
}

- (void)setLayeredForegroundRoundRectRadius:(double)a3
{
  self->_layeredForegroundRoundRectRadius = 0.0;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)paddedFrame
{
  double x = self->_paddedFrame.origin.x;
  double y = self->_paddedFrame.origin.y;
  double width = self->_paddedFrame.size.width;
  double height = self->_paddedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPaddedFrame:(CGRect)a3
{
  self->_paddedFrame = a3;
}

- (CGRect)displayFrame
{
  double x = self->_displayFrame.origin.x;
  double y = self->_displayFrame.origin.y;
  double width = self->_displayFrame.size.width;
  double height = self->_displayFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDisplayFrame:(CGRect)a3
{
  self->_displayFrame = a3;
}

- (CGRect)symbolFrame
{
  double x = self->_symbolFrame.origin.x;
  double y = self->_symbolFrame.origin.y;
  double width = self->_symbolFrame.size.width;
  double height = self->_symbolFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSymbolFrame:(CGRect)a3
{
  self->_symbolFrame = a3;
}

- (CGPoint)popupSource
{
  double x = self->_popupSource.x;
  double y = self->_popupSource.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPopupSource:(CGPoint)a3
{
  self->_popupSource = a3;
}

- (unint64_t)concaveCorner
{
  return self->_concaveCorner;
}

- (void)setConcaveCorner:(unint64_t)a3
{
  self->_concaveCorner = a3;
}

- (CGSize)concaveCornerOffset
{
  double width = self->_concaveCornerOffset.width;
  double height = self->_concaveCornerOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setConcaveCornerOffset:(CGSize)a3
{
  self->_concaveCornerOffset = a3;
}

- (unint64_t)roundRectCorners
{
  return self->_roundRectCorners;
}

- (void)setRoundRectCorners:(unint64_t)a3
{
  self->_roundRectCorners = a3;
}

- (double)roundRectRadius
{
  return self->_roundRectRadius;
}

- (void)setRoundRectRadius:(double)a3
{
  self->_roundRectRadius = a3;
}

- (int)popupBias
{
  return self->_popupBias;
}

- (void)setPopupBias:(int)a3
{
  self->_popupBias = a3;
}

- (UIEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double left = self->_layoutMargins.left;
  double bottom = self->_layoutMargins.bottom;
  double right = self->_layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (int64_t)flickDirection
{
  return self->_flickDirection;
}

- (void)setFlickDirection:(int64_t)a3
{
  self->_flickDirection = a3;
}

- (BOOL)detachedVariants
{
  return self->_detachedVariants;
}

- (void)setDetachedVariants:(BOOL)a3
{
  self->_detachedVariants = a3;
}

- (BOOL)tallPopup
{
  return self->_tallPopup;
}

- (void)setTallPopup:(BOOL)a3
{
  self->_tallPopup = a3;
}

- (NSValue)splitLeftRect
{
  return self->_splitLeftRect;
}

- (void)setSplitLeftRect:(id)a3
{
}

- (NSValue)splitRightRect
{
  return self->_splitRightRect;
}

- (void)setSplitRightRect:(id)a3
{
}

- (int64_t)popupDirection
{
  return self->_popupDirection;
}

- (void)setPopupDirection:(int64_t)a3
{
  self->_popupDirection = a3;
}

- (CGRect)layeredBackgroundPaddedFrame
{
  double x = self->_layeredBackgroundPaddedFrame.origin.x;
  double y = self->_layeredBackgroundPaddedFrame.origin.y;
  double width = self->_layeredBackgroundPaddedFrame.size.width;
  double height = self->_layeredBackgroundPaddedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)layeredBackgroundRoundRectRadius
{
  return self->_layeredBackgroundRoundRectRadius;
}

- (CGRect)layeredForegroundPaddedFrame
{
  double x = self->_layeredForegroundPaddedFrame.origin.x;
  double y = self->_layeredForegroundPaddedFrame.origin.y;
  double width = self->_layeredForegroundPaddedFrame.size.width;
  double height = self->_layeredForegroundPaddedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)layeredForegroundRoundRectRadius
{
  return self->_layeredForegroundRoundRectRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitRightRect, 0);
  objc_storeStrong((id *)&self->_splitLeftRect, 0);
}

@end