@interface SBReduceMotionDeckSwitcherModifier
- (CGPoint)_pagingOrigin;
- (CGSize)_interpageSpacingForPaging;
- (double)_cardWidth;
- (double)_switcherCardScale;
- (double)depthForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5;
- (double)homeScreenAlpha;
- (double)homeScreenScale;
- (double)leadingOffsetForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5;
- (double)opacityForIndex:(unint64_t)a3 scrollProgress:(double)a4;
- (double)scrollProgressForIndex:(unint64_t)a3;
- (double)scrollProgressForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5;
- (double)titleOpacityForIndex:(unint64_t)a3 scrollProgress:(double)a4;
- (double)wallpaperScale;
- (id)scrollViewAttributes;
- (unint64_t)indexForScrollProgress:(double)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5;
@end

@implementation SBReduceMotionDeckSwitcherModifier

- (double)homeScreenAlpha
{
  return 1.0;
}

- (double)homeScreenScale
{
  return 1.0;
}

- (double)wallpaperScale
{
  return 1.0;
}

- (id)scrollViewAttributes
{
  v6.receiver = self;
  v6.super_class = (Class)SBReduceMotionDeckSwitcherModifier;
  v3 = [(SBDeckSwitcherModifier *)&v6 scrollViewAttributes];
  v4 = (void *)[v3 mutableCopy];

  [v4 setScrollViewPagingEnabled:1];
  [(SBReduceMotionDeckSwitcherModifier *)self _interpageSpacingForPaging];
  objc_msgSend(v4, "setInterpageSpacingForPaging:");
  [(SBReduceMotionDeckSwitcherModifier *)self _pagingOrigin];
  objc_msgSend(v4, "setPagingOrigin:");
  return v4;
}

- (CGSize)_interpageSpacingForPaging
{
  [(SBReduceMotionDeckSwitcherModifier *)self containerViewBounds];
  CGRectGetWidth(v6);
  [(SBReduceMotionDeckSwitcherModifier *)self _switcherCardScale];
  SBFloatRoundForMainScreenScale();
  double v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGPoint)_pagingOrigin
{
  if ([(SBReduceMotionDeckSwitcherModifier *)self isRTLEnabled])
  {
    [(SBDeckSwitcherModifier *)self contentOffsetForIndex:0 alignment:2];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  -[SBReduceMotionDeckSwitcherModifier scrollProgressForIndex:](self, "scrollProgressForIndex:");
  double v8 = v7;
  double v9 = 1.0;
  if (a3 && v8 > a4)
  {
    -[SBReduceMotionDeckSwitcherModifier scrollProgressForIndex:](self, "scrollProgressForIndex:", a3 - 1, 1.0);
    double v9 = (a4 - v10) / (v8 - v10) + 0.0;
  }
  return fmin(fmax(v9, 0.0), 1.0);
}

- (double)opacityForIndex:(unint64_t)a3 scrollProgress:(double)a4
{
  double v5 = 1.0;
  BOOL v6 = a3 >= 2;
  unint64_t v7 = a3 - 2;
  if (v6)
  {
    -[SBReduceMotionDeckSwitcherModifier scrollProgressForIndex:](self, "scrollProgressForIndex:", v7, 1.0);
    double v10 = v9;
    unint64_t v11 = [(SBDeckSwitcherModifier *)self numberOfItems];
    double v5 = (a4 - (v10 + -1.0 / (double)v11)) / (v10 - (v10 + -1.0 / (double)v11)) + 0.0;
  }
  return fmin(fmax(v5, 0.0), 1.0);
}

- (double)depthForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5
{
  return 0.0;
}

- (double)scrollProgressForIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBDeckSwitcherModifier *)self numberOfItems];
  [(SBDeckSwitcherModifier *)self desiredXOriginForQuantizedTopPage];
  -[SBReduceMotionDeckSwitcherModifier scrollProgressForIndex:displayItemsCount:frameOrigin:](self, "scrollProgressForIndex:displayItemsCount:frameOrigin:", a3, v5);
  return result;
}

- (double)scrollProgressForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5
{
  [(SBReduceMotionDeckSwitcherModifier *)self _cardWidth];
  double v9 = v8;
  [(SBDeckSwitcherModifier *)self scrollRange];
  return 1.0 - (v9 + v9 * -0.2) * (double)(~a3 + a4) / v10;
}

- (unint64_t)indexForScrollProgress:(double)a3 displayItemsCount:(unint64_t)a4 frameOrigin:(double)a5
{
  double v8 = [(SBReduceMotionDeckSwitcherModifier *)self appLayouts];
  uint64_t v9 = [v8 count];

  if (!v9) {
    return 0;
  }
  [(SBReduceMotionDeckSwitcherModifier *)self _cardWidth];
  double v11 = v10;
  [(SBDeckSwitcherModifier *)self scrollRange];
  double v13 = v12;
  double v14 = v11 + v11 * -0.2;
  if (BSFloatIsZero()) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = (unint64_t)((double)a4 - (1.0 - a3) * v13 / v14 + 1.0);
  }
  if (v9 - 1 >= v15) {
    return v15;
  }
  else {
    return v9 - 1;
  }
}

- (double)leadingOffsetForIndex:(unint64_t)a3 displayItemsCount:(unint64_t)a4 scrollProgress:(double)a5
{
  [(SBReduceMotionDeckSwitcherModifier *)self _cardWidth];
  double v10 = v9;
  [(SBDeckSwitcherModifier *)self scrollRange];
  double v12 = (v10 + v10 * -0.2) * (double)(~a3 + a4) - (1.0 - a5) * v11;
  [(SBReduceMotionDeckSwitcherModifier *)self containerViewBounds];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double v17 = CGRectGetWidth(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  return fmax(v12, CGRectGetMinX(v20) + v17 * -0.08);
}

- (double)_cardWidth
{
  [(SBReduceMotionDeckSwitcherModifier *)self containerViewBounds];
  double Width = CGRectGetWidth(v6);
  [(SBReduceMotionDeckSwitcherModifier *)self _switcherCardScale];
  return Width * v4;
}

- (double)_switcherCardScale
{
  v2 = [(SBReduceMotionDeckSwitcherModifier *)self switcherSettings];
  [v2 deckSwitcherPageScale];
  double v4 = v3;

  return v4;
}

@end