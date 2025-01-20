@interface TVCarouselLayout
+ (TVCarouselLayout)layoutWithLayout:(id)a3 element:(id)a4;
+ (int64_t)layoutTypeForElement:(id)a3;
+ (int64_t)layoutTypeForString:(id)a3;
+ (unint64_t)scrollModeForString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isParallaxEnabled;
- (BOOL)showsPageControl;
- (CGSize)cellSize;
- (NSNumber)pageControlMarginNumber;
- (UIEdgeInsets)cellPadding;
- (double)focusedEdgeExpansion;
- (double)interitemSpacing;
- (double)revealDistance;
- (double)shearAngle;
- (int64_t)layoutType;
- (unint64_t)scrollMode;
- (void)setCellPadding:(UIEdgeInsets)a3;
- (void)setCellSize:(CGSize)a3;
- (void)setFocusedEdgeExpansion:(double)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setPageControlMarginNumber:(id)a3;
- (void)setParallaxEnabled:(BOOL)a3;
- (void)setRevealDistance:(double)a3;
- (void)setScrollMode:(unint64_t)a3;
- (void)setShearAngle:(double)a3;
- (void)setShowsPageControl:(BOOL)a3;
@end

@implementation TVCarouselLayout

+ (int64_t)layoutTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"upsell"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"ribbon"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"centerGrowth"])
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = 3;
  }

  return v4;
}

+ (unint64_t)scrollModeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"continuous"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"none"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)layoutTypeForElement:(id)a3
{
  unint64_t v4 = [a3 attributes];
  v5 = [v4 objectForKey:@"tv_layout"];

  if (v5) {
    int64_t v6 = [a1 layoutTypeForString:v5];
  }
  else {
    int64_t v6 = 3;
  }

  return v6;
}

+ (TVCarouselLayout)layoutWithLayout:(id)a3 element:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (TVCarouselLayout *)v6;
  v9 = v8;
  if (!v8) {
    v9 = objc_alloc_init(TVCarouselLayout);
  }
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___TVCarouselLayout;
  id v10 = objc_msgSendSuper2(&v23, sel_layoutWithLayout_element_, v9, v7);
  v11 = [v7 style];
  uint64_t v12 = [a1 layoutTypeForElement:v7];
  if (v12 != 3) {
    [(TVCarouselLayout *)v9 setLayoutType:v12];
  }
  v13 = objc_msgSend(v11, "tv_scrollMode");
  -[TVCarouselLayout setScrollMode:](v9, "setScrollMode:", [a1 scrollModeForString:v13]);

  if ([(TVCarouselLayout *)v9 layoutType] == 2 || [(TVCarouselLayout *)v9 layoutType] == 1)
  {
    uint64_t v14 = [(TVCarouselLayout *)v9 layoutType];
    double v15 = 130.0;
    if (v14 == 2) {
      double v15 = 480.0;
    }
    double v16 = 0.0;
    if (v14 == 2) {
      double v17 = 100.0;
    }
    else {
      double v17 = 0.0;
    }
    [(TVCarouselLayout *)v9 setRevealDistance:v15];
    [(TVCarouselLayout *)v9 setFocusedEdgeExpansion:v17];
    goto LABEL_13;
  }
  objc_msgSend(v11, "tv_interitemSpacing");
  if (v21 != 0.0)
  {
    objc_msgSend(v11, "tv_interitemSpacing");
    double v16 = v22;
LABEL_13:
    [(TVCarouselLayout *)v9 setInteritemSpacing:v16];
  }
  if ([(TVCarouselLayout *)v9 layoutType] == 2)
  {
    [(TVCarouselLayout *)v9 setParallaxEnabled:1];
    [(TVCarouselLayout *)v9 setShearAngle:-0.162444763];
  }
  v18 = [v7 attributes];
  v19 = [v18 objectForKey:@"pageControl"];

  if (v19 && (objc_opt_respondsToSelector() & 1) != 0) {
    -[TVCarouselLayout setShowsPageControl:](v9, "setShowsPageControl:", [v19 BOOLValue]);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[_TVLockupFactory cellMetricsForCollectionElement:v7];
    -[TVCarouselLayout setCellPadding:](v9, "setCellPadding:", (unsigned __int128)0, (unsigned __int128)0);
    [(TVCarouselLayout *)v9 setCellSize:(unsigned __int128)0];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (TVCarouselLayout *)a3;
  if (v4 == self)
  {
    BOOL v15 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v15 = 0;
    goto LABEL_20;
  }
  v5 = v4;
  [(TVCarouselLayout *)self interitemSpacing];
  double v7 = v6;
  [(TVCarouselLayout *)v5 interitemSpacing];
  if (v7 != v8) {
    goto LABEL_16;
  }
  int64_t v9 = [(TVCarouselLayout *)self layoutType];
  if (v9 != [(TVCarouselLayout *)v5 layoutType]) {
    goto LABEL_16;
  }
  [(TVCarouselLayout *)self cellSize];
  double v11 = v10;
  double v13 = v12;
  [(TVCarouselLayout *)v5 cellSize];
  BOOL v15 = 0;
  if (v11 != v16) {
    goto LABEL_17;
  }
  if (v13 != v14) {
    goto LABEL_17;
  }
  [(TVCarouselLayout *)self cellPadding];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [(TVCarouselLayout *)v5 cellPadding];
  BOOL v15 = 0;
  if (v20 != v28 || v18 != v25 || v24 != v27 || v22 != v26) {
    goto LABEL_17;
  }
  [(TVCarouselLayout *)self focusedEdgeExpansion];
  double v30 = v29;
  [(TVCarouselLayout *)v5 focusedEdgeExpansion];
  if (v30 != v31) {
    goto LABEL_16;
  }
  [(TVCarouselLayout *)self revealDistance];
  double v33 = v32;
  [(TVCarouselLayout *)v5 revealDistance];
  if (v33 != v34) {
    goto LABEL_16;
  }
  BOOL v35 = [(TVCarouselLayout *)self isParallaxEnabled];
  if (v35 == [(TVCarouselLayout *)v5 isParallaxEnabled]
    && ([(TVCarouselLayout *)self shearAngle],
        double v37 = v36,
        [(TVCarouselLayout *)v5 shearAngle],
        v37 == v38)
    && (BOOL v39 = [(TVCarouselLayout *)self showsPageControl],
        v39 == [(TVCarouselLayout *)v5 showsPageControl]))
  {
    v41 = [(TVCarouselLayout *)self pageControlMarginNumber];
    [v41 floatValue];
    float v43 = v42;
    v44 = [(TVCarouselLayout *)v5 pageControlMarginNumber];
    [v44 floatValue];
    BOOL v15 = v43 == v45;
  }
  else
  {
LABEL_16:
    BOOL v15 = 0;
  }
LABEL_17:

LABEL_20:
  return v15;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (CGSize)cellSize
{
  double width = self->_cellSize.width;
  double height = self->_cellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (UIEdgeInsets)cellPadding
{
  double top = self->_cellPadding.top;
  double left = self->_cellPadding.left;
  double bottom = self->_cellPadding.bottom;
  double right = self->_cellPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCellPadding:(UIEdgeInsets)a3
{
  self->_cellPadding = a3;
}

- (unint64_t)scrollMode
{
  return self->_scrollMode;
}

- (void)setScrollMode:(unint64_t)a3
{
  self->_scrollMode = a3;
}

- (double)focusedEdgeExpansion
{
  return self->_focusedEdgeExpansion;
}

- (void)setFocusedEdgeExpansion:(double)a3
{
  self->_focusedEdgeExpansion = a3;
}

- (double)revealDistance
{
  return self->_revealDistance;
}

- (void)setRevealDistance:(double)a3
{
  self->_revealDistance = a3;
}

- (BOOL)isParallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (double)shearAngle
{
  return self->_shearAngle;
}

- (void)setShearAngle:(double)a3
{
  self->_shearAngle = a3;
}

- (BOOL)showsPageControl
{
  return self->_showsPageControl;
}

- (void)setShowsPageControl:(BOOL)a3
{
  self->_showsPageControl = a3;
}

- (NSNumber)pageControlMarginNumber
{
  return self->_pageControlMarginNumber;
}

- (void)setPageControlMarginNumber:(id)a3
{
  self->_pageControlMarginNumber = (NSNumber *)a3;
}

@end