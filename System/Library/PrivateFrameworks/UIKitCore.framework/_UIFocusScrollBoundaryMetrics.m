@interface _UIFocusScrollBoundaryMetrics
- (BOOL)_checkScrollableBounds;
- (BOOL)checkOtherFocusItem:(id)a3;
- (BOOL)checkOtherRect:(CGRect)a3;
- (BOOL)consumeOtherMetrics:(id)a3;
- (BOOL)hasDisprovedAllRelevantAssumptions;
- (BOOL)isMaxX;
- (BOOL)isMaxY;
- (BOOL)isMinX;
- (BOOL)isMinY;
- (BOOL)shouldSearchX;
- (BOOL)shouldSearchY;
- (CGPoint)localFocusedCenter;
- (CGPoint)maxContentOffset;
- (CGPoint)minContentOffset;
- (CGRect)localFocusedRect;
- (UIFocusEnvironment)owningEnvironment;
- (UIFocusItem)focusItem;
- (UIFocusItemScrollableContainer)scrollableContainer;
- (_UIFocusScrollBoundaryMetrics)initWithFocusItem:(id)a3 owningEnvironment:(id)a4 scrollableContainer:(id)a5;
- (_UIFocusScrollBoundaryMetrics)initWithFocusItem:(id)a3 scrollView:(id)a4;
- (void)setIsMaxX:(BOOL)a3;
- (void)setIsMaxY:(BOOL)a3;
- (void)setIsMinX:(BOOL)a3;
- (void)setIsMinY:(BOOL)a3;
@end

@implementation _UIFocusScrollBoundaryMetrics

- (_UIFocusScrollBoundaryMetrics)initWithFocusItem:(id)a3 scrollView:(id)a4
{
  return [(_UIFocusScrollBoundaryMetrics *)self initWithFocusItem:a3 owningEnvironment:a4 scrollableContainer:a4];
}

- (_UIFocusScrollBoundaryMetrics)initWithFocusItem:(id)a3 owningEnvironment:(id)a4 scrollableContainer:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_UIFocusScrollBoundaryMetrics;
  v13 = [(_UIFocusScrollBoundaryMetrics *)&v31 init];
  if (!v13) {
    goto LABEL_12;
  }
  if (v10)
  {
    if (v11) {
      goto LABEL_4;
    }
LABEL_14:
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, v13, @"_UIFocusScrollBoundaryMetrics.m", 32, @"Invalid parameter not satisfying: %@", @"owningEnvironment" object file lineNumber description];

    if (v12) {
      goto LABEL_5;
    }
LABEL_15:
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, v13, @"_UIFocusScrollBoundaryMetrics.m", 33, @"Invalid parameter not satisfying: %@", @"scrollableContainer" object file lineNumber description];

    goto LABEL_5;
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, v13, @"_UIFocusScrollBoundaryMetrics.m", 31, @"Invalid parameter not satisfying: %@", @"focusItem" object file lineNumber description];

  if (!v11) {
    goto LABEL_14;
  }
LABEL_4:
  if (!v12) {
    goto LABEL_15;
  }
LABEL_5:
  *(_DWORD *)(v13 + 10) = 16843009;
  objc_storeStrong((id *)v13 + 2, a3);
  objc_storeStrong((id *)v13 + 3, a4);
  objc_storeStrong((id *)v13 + 4, a5);
  v14 = [v12 coordinateSpace];
  *((double *)v13 + 11) = _UIFocusItemFrameInCoordinateSpace(v10, v14);
  *((void *)v13 + 12) = v15;
  *((void *)v13 + 13) = v16;
  *((void *)v13 + 14) = v17;

  __asm { FMOV            V2.2D, #0.5 }
  *(float64x2_t *)(v13 + 40) = vaddq_f64(*(float64x2_t *)(v13 + 88), vmulq_f64(*(float64x2_t *)(v13 + 104), _Q2));
  if (objc_msgSend(v12, "__isKindOfUICollectionView"))
  {
    id v23 = v12;
    if ([v23 _canDeriveVisibleBoundsFromContainingScrollView])
    {
      char CanScrollY = 1;
      v13[8] = 1;
    }
    else
    {
      v13[8] = _UIFocusItemScrollableContainerCanScrollX(v23);
      char CanScrollY = _UIFocusItemScrollableContainerCanScrollY(v23);
    }
    v13[9] = CanScrollY;
  }
  else
  {
    v13[8] = _UIFocusItemScrollableContainerCanScrollX(v12);
    v13[9] = _UIFocusItemScrollableContainerCanScrollY(v12);
  }
  *((double *)v13 + 7) = _UIFocusItemScrollableContainerMinimumContentOffset(v12);
  *((void *)v13 + 8) = v25;
  *((double *)v13 + 9) = _UIFocusItemScrollableContainerMaximumContentOffset(v12);
  *((void *)v13 + 10) = v26;
  [v13 _checkScrollableBounds];
LABEL_12:

  return (_UIFocusScrollBoundaryMetrics *)v13;
}

- (BOOL)_checkScrollableBounds
{
  [(UIFocusItemScrollableContainer *)self->_scrollableContainer visibleSize];
  double v4 = v3;
  double v6 = v5;
  double x = self->_minContentOffset.x;
  double y = self->_minContentOffset.y;
  double v9 = self->_maxContentOffset.x;
  double v10 = self->_maxContentOffset.y;
  _UIIntervalFromCGRect(1, x, y, v3, v5);
  double v58 = v11;
  double v13 = v12;
  _UIIntervalFromCGRect(1, v9, v10, v4, v6);
  double v59 = v14;
  double v16 = v15;
  _UIIntervalFromCGRect(2, x, y, v4, v6);
  double v18 = v17;
  double v20 = v19;
  _UIIntervalFromCGRect(2, v9, v10, v4, v6);
  double v22 = v21;
  double v24 = v23;
  _UIIntervalFromCGRect(1, self->_localFocusedRect.origin.x, self->_localFocusedRect.origin.y, self->_localFocusedRect.size.width, self->_localFocusedRect.size.height);
  double v26 = v25;
  double v28 = v27;
  _UIIntervalFromCGRect(2, self->_localFocusedRect.origin.x, self->_localFocusedRect.origin.y, self->_localFocusedRect.size.width, self->_localFocusedRect.size.height);
  double v31 = -0.0;
  if (v13 >= 0.0) {
    double v32 = -0.0;
  }
  else {
    double v32 = v13;
  }
  double v33 = v58 + v32;
  if (v28 < 0.0) {
    double v31 = v28;
  }
  double v34 = v26 + v31;
  double v35 = -v13;
  if (v13 >= 0.0) {
    double v35 = v13;
  }
  double v36 = v35 + v33;
  double v37 = -v28;
  if (v28 >= 0.0) {
    double v38 = v28;
  }
  else {
    double v38 = -v28;
  }
  BOOL v39 = v36 >= v38 + v34;
  if (v33 > v34) {
    BOOL v39 = 0;
  }
  if (!self->_isMinX) {
    BOOL v39 = 0;
  }
  self->_isMinX = v39;
  double v40 = -0.0;
  if (v16 < 0.0) {
    double v40 = v16;
  }
  double v41 = v59 + v40;
  double v42 = -v16;
  if (v16 >= 0.0) {
    double v42 = v16;
  }
  double v43 = v42 + v41;
  if (v28 >= 0.0) {
    double v37 = v28;
  }
  BOOL v44 = v43 >= v37 + v34;
  if (v41 > v34) {
    BOOL v44 = 0;
  }
  if (!self->_isMaxX) {
    BOOL v44 = 0;
  }
  self->_isMaxX = v44;
  double v45 = -0.0;
  if (v20 >= 0.0) {
    double v46 = -0.0;
  }
  else {
    double v46 = v20;
  }
  double v47 = v18 + v46;
  if (v30 < 0.0) {
    double v45 = v30;
  }
  double v48 = v29 + v45;
  double v49 = -v20;
  if (v20 >= 0.0) {
    double v49 = v20;
  }
  if (v30 >= 0.0) {
    double v50 = v30;
  }
  else {
    double v50 = -v30;
  }
  BOOL v51 = v49 + v47 >= v50 + v48;
  if (v47 > v48) {
    BOOL v51 = 0;
  }
  if (!self->_isMinY) {
    BOOL v51 = 0;
  }
  self->_isMinY = v51;
  double v52 = -0.0;
  if (v24 < 0.0) {
    double v52 = v24;
  }
  double v53 = v22 + v52;
  if (v53 <= v48)
  {
    double v55 = -v24;
    if (v24 >= 0.0) {
      double v55 = v24;
    }
    double v56 = v55 + v53;
    if (v30 < 0.0) {
      double v30 = -v30;
    }
    BOOL v54 = v56 >= v30 + v48;
  }
  else
  {
    BOOL v54 = 0;
  }
  if (!self->_isMaxY) {
    BOOL v54 = 0;
  }
  self->_isMaxY = v54;
  return [(_UIFocusScrollBoundaryMetrics *)self hasDisprovedAllRelevantAssumptions];
}

- (BOOL)consumeOtherMetrics:(id)a3
{
  double v5 = (_UIFocusScrollBoundaryMetrics *)a3;
  double v6 = v5;
  if (v5)
  {
    if (v5 != self)
    {
      [(_UIFocusScrollBoundaryMetrics *)self setIsMinX:[(_UIFocusScrollBoundaryMetrics *)v5 isMinX] & [(_UIFocusScrollBoundaryMetrics *)self isMinX]];
      [(_UIFocusScrollBoundaryMetrics *)self setIsMaxX:[(_UIFocusScrollBoundaryMetrics *)v6 isMaxX] & [(_UIFocusScrollBoundaryMetrics *)self isMaxX]];
      [(_UIFocusScrollBoundaryMetrics *)self setIsMinY:[(_UIFocusScrollBoundaryMetrics *)v6 isMinY] & [(_UIFocusScrollBoundaryMetrics *)self isMinY]];
      [(_UIFocusScrollBoundaryMetrics *)self setIsMaxY:[(_UIFocusScrollBoundaryMetrics *)v6 isMaxY] & [(_UIFocusScrollBoundaryMetrics *)self isMaxY]];
    }
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIFocusScrollBoundaryMetrics.m", 96, @"Invalid parameter not satisfying: %@", @"otherMetrics != nil" object file lineNumber description];
  }
  BOOL v7 = [(_UIFocusScrollBoundaryMetrics *)self hasDisprovedAllRelevantAssumptions];

  return v7;
}

- (BOOL)checkOtherRect:(CGRect)a3
{
  double v3 = a3.origin.x + a3.size.width * 0.5;
  double v4 = a3.size.height * 0.5;
  double x = self->_localFocusedCenter.x;
  if (v3 < x) {
    self->_isMinX = 0;
  }
  double v6 = a3.origin.y + v4;
  if (v3 > x) {
    self->_isMaxX = 0;
  }
  double y = self->_localFocusedCenter.y;
  if (v6 < y) {
    self->_isMinY = 0;
  }
  if (v6 > y) {
    self->_isMaxY = 0;
  }
  return [(_UIFocusScrollBoundaryMetrics *)self hasDisprovedAllRelevantAssumptions];
}

- (BOOL)checkOtherFocusItem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIFocusScrollBoundaryMetrics.m", 133, @"Invalid parameter not satisfying: %@", @"otherItem != nil" object file lineNumber description];

    goto LABEL_5;
  }
  id v6 = [(_UIFocusScrollBoundaryMetrics *)self focusItem];

  if (v6 == v5)
  {
LABEL_5:
    BOOL v9 = [(_UIFocusScrollBoundaryMetrics *)self hasDisprovedAllRelevantAssumptions];
    goto LABEL_6;
  }
  BOOL v7 = [(_UIFocusScrollBoundaryMetrics *)self scrollableContainer];
  v8 = [v7 coordinateSpace];

  BOOL v9 = [(_UIFocusScrollBoundaryMetrics *)self checkOtherRect:_UIFocusItemFrameInCoordinateSpace(v5, v8)];
LABEL_6:

  return v9;
}

- (BOOL)hasDisprovedAllRelevantAssumptions
{
  if (!self->_isMinX && !self->_isMaxX && (!self->_isMinY && !self->_isMaxY || !self->_shouldSearchY)) {
    return 1;
  }
  if (self->_shouldSearchX || self->_isMinY) {
    return 0;
  }
  return !self->_isMaxY;
}

- (UIFocusItem)focusItem
{
  return self->_focusItem;
}

- (UIFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (UIFocusItemScrollableContainer)scrollableContainer
{
  return self->_scrollableContainer;
}

- (BOOL)shouldSearchX
{
  return self->_shouldSearchX;
}

- (BOOL)shouldSearchY
{
  return self->_shouldSearchY;
}

- (CGRect)localFocusedRect
{
  double x = self->_localFocusedRect.origin.x;
  double y = self->_localFocusedRect.origin.y;
  double width = self->_localFocusedRect.size.width;
  double height = self->_localFocusedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)localFocusedCenter
{
  double x = self->_localFocusedCenter.x;
  double y = self->_localFocusedCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)minContentOffset
{
  double x = self->_minContentOffset.x;
  double y = self->_minContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)maxContentOffset
{
  double x = self->_maxContentOffset.x;
  double y = self->_maxContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isMinX
{
  return self->_isMinX;
}

- (void)setIsMinX:(BOOL)a3
{
  self->_isMinX = a3;
}

- (BOOL)isMaxX
{
  return self->_isMaxX;
}

- (void)setIsMaxX:(BOOL)a3
{
  self->_isMaxX = a3;
}

- (BOOL)isMinY
{
  return self->_isMinY;
}

- (void)setIsMinY:(BOOL)a3
{
  self->_isMinY = a3;
}

- (BOOL)isMaxY
{
  return self->_isMaxY;
}

- (void)setIsMaxY:(BOOL)a3
{
  self->_isMaxY = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollableContainer, 0);
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
  objc_storeStrong((id *)&self->_focusItem, 0);
}

@end