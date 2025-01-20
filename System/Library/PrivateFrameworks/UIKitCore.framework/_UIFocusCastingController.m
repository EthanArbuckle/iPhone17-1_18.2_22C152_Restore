@interface _UIFocusCastingController
- (BOOL)isRememberingEntryPoint;
- (CGPoint)_castingPointInNormalizedFrame:(CGRect)a3 forHeading:(unint64_t)a4;
- (CGPoint)_entryPointInNormalizedFrame:(CGRect)a3 forHeading:(unint64_t)a4;
- (CGPoint)_movementPointInNormalizedFrame:(CGRect)a3;
- (CGPoint)screenEntryPoint;
- (CGRect)_castingFrameForFocusedNormalizedFrame:(CGRect)a3 heading:(unint64_t)a4;
- (CGRect)castingFrameForFocusedItem:(id)a3 heading:(unint64_t)a4 inCoordinateSpace:(id)a5;
- (UIFocusSystem)focusSystem;
- (UIView)focusCastingIndicator;
- (UIView)focusEntryIndicator;
- (UIView)focusMovementIndicator;
- (_UIFocusCastingController)init;
- (double)entryPointMemorizationTimeout;
- (id)_focusEffectsControllerForFocusedItem;
- (id)_normalizedCoordinateSpace;
- (unint64_t)_axisForHeading:(unint64_t)a3;
- (unint64_t)entryPointAxis;
- (void)_createFocusMovementIndicator;
- (void)_destroyFocusMovementIndicator;
- (void)_positionFocusMovementIndicators;
- (void)_startRememberingEntryPoint;
- (void)_stopRememberingEntryPoint;
- (void)_updateFocusItemFromNormalizedFrame:(CGRect)a3 toNormalizedFrame:(CGRect)a4 withHeading:(unint64_t)a5;
- (void)_updateFocusMovementIndicatorDisplay;
- (void)forceUpdateFocusCastingFocusedRect:(CGRect)a3 coordinateSpace:(id)a4 heading:(unint64_t)a5;
- (void)forgetEntryPoint;
- (void)setEntryPointAxis:(unint64_t)a3;
- (void)setEntryPointMemorizationTimeout:(double)a3;
- (void)setFocusCastingIndicator:(id)a3;
- (void)setFocusEntryIndicator:(id)a3;
- (void)setFocusMovementIndicator:(id)a3;
- (void)setFocusSystem:(id)a3;
- (void)setIsRememberingEntryPoint:(BOOL)a3;
- (void)setScreenEntryPoint:(CGPoint)a3;
- (void)updateFocusCastingWithContext:(id)a3;
@end

@implementation _UIFocusCastingController

- (_UIFocusCastingController)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusCastingController;
  result = [(_UIFocusCastingController *)&v3 init];
  if (result)
  {
    result->_screenEntryPoint = (CGPoint)_UIFocusCastingPointNone;
    result->_isRememberingEntryPoint = 0;
    result->_entryPointMemorizationTimeout = 0.5;
    result->_entryPointAxis = 0;
  }
  return result;
}

- (void)updateFocusCastingWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(_UIFocusCastingController *)self _normalizedCoordinateSpace];
  if (v5)
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    uint64_t v10 = [v4 previouslyFocusedItem];
    double v11 = v7;
    double v12 = v9;
    double v13 = v8;
    double v14 = v6;
    if (v10)
    {
      v15 = (void *)v10;
      v16 = [v4 previouslyFocusedItem];
      v17 = +[UIFocusSystem focusSystemForEnvironment:v16];

      double v11 = v7;
      double v12 = v9;
      double v13 = v8;
      double v14 = v6;
      if (v17)
      {
        v18 = [v4 previouslyFocusedItem];
        double v14 = _UIFocusItemFrameInCoordinateSpace(v18, v5);
        double v11 = v19;
        double v12 = v20;
        double v13 = v21;
      }
    }
    v22 = [v4 nextFocusedItem];
    if (v22)
    {
      v23 = [v4 nextFocusedItem];
      double v6 = _UIFocusItemFrameInCoordinateSpace(v23, v5);
      double v7 = v24;
      double v9 = v25;
      double v8 = v26;
    }
    -[_UIFocusCastingController _updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:](self, "_updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:", [v4 focusHeading], v14, v11, v12, v13, v6, v7, v9, v8);
  }
  else
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &updateFocusCastingWithContext____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v28 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Unable to get normalized coordinate space for focus casting.", v29, 2u);
      }
    }
  }
}

- (CGRect)castingFrameForFocusedItem:(id)a3 heading:(unint64_t)a4 inCoordinateSpace:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8
    && (([(_UIFocusCastingController *)self screenEntryPoint], v11 == INFINITY)
      ? (BOOL v12 = v10 == INFINITY)
      : (BOOL v12 = 0),
        v12))
  {
    double v19 = *MEMORY[0x1E4F1DB20];
    double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    double v13 = [(_UIFocusCastingController *)self _normalizedCoordinateSpace];
    if (v13)
    {
      if (v8)
      {
        double v14 = _UIFocusItemFrameInCoordinateSpace(v8, v13);
      }
      else
      {
        [(_UIFocusCastingController *)self screenEntryPoint];
        double v15 = round(v23 + -5.0);
        double v14 = round(v24 + -5.0);
        double v16 = 10.0;
        double v17 = 10.0;
      }
      -[_UIFocusCastingController _castingFrameForFocusedNormalizedFrame:heading:](self, "_castingFrameForFocusedNormalizedFrame:heading:", a4, v14, v15, v16, v17);
      objc_msgSend(v13, "convertRect:toCoordinateSpace:", v9);
      double v19 = v25;
      double v20 = v26;
      double v21 = v27;
      double v22 = v28;
    }
    else
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &castingFrameForFocusedItem_heading_inCoordinateSpace____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v33 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34[0] = 0;
          _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "Unable to get normalized coordinate space for focus casting.", (uint8_t *)v34, 2u);
        }
      }
      double v19 = *MEMORY[0x1E4F1DB20];
      double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
  }
  double v29 = v19;
  double v30 = v20;
  double v31 = v21;
  double v32 = v22;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)forceUpdateFocusCastingFocusedRect:(CGRect)a3 coordinateSpace:(id)a4 heading:(unint64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  if (CGRectIsNull(v21))
  {
    -[_UIFocusCastingController setScreenEntryPoint:](self, "setScreenEntryPoint:", INFINITY, INFINITY);
    [(_UIFocusCastingController *)self _stopRememberingEntryPoint];
  }
  else
  {
    BOOL v12 = [(_UIFocusCastingController *)self _normalizedCoordinateSpace];
    double v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v11, x, y, width, height);
      -[_UIFocusCastingController _updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:](self, "_updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:", a5, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), v14, v15, v16, v17);
    }
    else
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &forceUpdateFocusCastingFocusedRect_coordinateSpace_heading____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        double v19 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)double v20 = 0;
          _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Unable to get normalized coordinate space for focus casting.", v20, 2u);
        }
      }
    }
  }
}

- (id)_normalizedCoordinateSpace
{
  v2 = [(_UIFocusCastingController *)self focusSystem];
  objc_super v3 = +[_UIFocusSystemSceneComponent sceneComponentForFocusSystem:v2];
  id v4 = [v3 coordinateSpace];

  return v4;
}

- (CGRect)_castingFrameForFocusedNormalizedFrame:(CGRect)a3 heading:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    -[_UIFocusCastingController _castingPointInNormalizedFrame:forHeading:](self, "_castingPointInNormalizedFrame:forHeading:", a4, x, y, width, height);
    double v15 = v13;
    if (v13 == INFINITY && v14 == INFINITY)
    {
      double v10 = x;
      double v11 = width;
      double v12 = height;
      goto LABEL_21;
    }
    double v11 = fmin(width, 10.0);
    double v12 = fmin(height, 10.0);
    if ((a4 & 3) != 0)
    {
      double v15 = v13 + v11 * -0.5;
      if (a4)
      {
        double v17 = 0.0;
        goto LABEL_17;
      }
      if ((a4 & 2) != 0)
      {
        v25.origin.double x = x;
        v25.origin.double y = y;
        v25.size.double width = width;
        v25.size.double height = height;
        double v17 = CGRectGetMaxY(v25) - v12;
LABEL_17:
        double v24 = v17;
LABEL_20:
        v27.origin.double x = x;
        v27.origin.double y = y;
        v27.size.double width = width;
        v27.size.double height = height;
        double MinX = CGRectGetMinX(v27);
        v28.origin.double x = x;
        v28.origin.double y = y;
        v28.size.double width = width;
        v28.size.double height = height;
        double v10 = fmax(MinX, fmin(v15, CGRectGetMaxX(v28) - v11));
        v29.origin.double x = x;
        v29.origin.double y = y;
        v29.size.double width = width;
        v29.size.double height = height;
        double MinY = CGRectGetMinY(v29);
        v30.origin.double x = x;
        v30.origin.double y = y;
        v30.size.double width = width;
        v30.size.double height = height;
        double y = fmax(MinY, fmin(v24, CGRectGetMaxY(v30) - v12));
        goto LABEL_21;
      }
    }
    else if ((a4 & 0xC) != 0)
    {
      double v24 = v14 + v12 * -0.5;
      if ((a4 & 4) != 0)
      {
        double v15 = 0.0;
      }
      else if ((a4 & 8) != 0)
      {
        v26.origin.double x = x;
        v26.origin.double y = y;
        v26.size.double width = width;
        v26.size.double height = height;
        double v15 = CGRectGetMaxX(v26) - v11;
      }
      goto LABEL_20;
    }
    double v24 = v14;
    goto LABEL_20;
  }
  double v10 = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_21:
  double v20 = v10;
  double v21 = y;
  double v22 = v11;
  double v23 = v12;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)_updateFocusItemFromNormalizedFrame:(CGRect)a3 toNormalizedFrame:(CGRect)a4 withHeading:(unint64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  double v12 = a3.origin.y;
  double v13 = a3.origin.x;
  if (CGRectIsNull(a4) || (a5 & 0xF) == 0)
  {
    [(_UIFocusCastingController *)self _stopRememberingEntryPoint];
    double v19 = INFINITY;
    double v20 = INFINITY;
    goto LABEL_17;
  }
  v41.origin.CGFloat x = v13;
  v41.origin.CGFloat y = v12;
  v41.size.CGFloat width = v11;
  v41.size.CGFloat height = v10;
  if (CGRectIsNull(v41))
  {
    CGFloat v15 = x;
    CGFloat v16 = y;
    CGFloat v17 = width;
    CGFloat v18 = height;
  }
  else
  {
    -[_UIFocusCastingController _castingFrameForFocusedNormalizedFrame:heading:](self, "_castingFrameForFocusedNormalizedFrame:heading:", a5, v13, v12, v11, v10);
    CGFloat v15 = v21;
    CGFloat v16 = v22;
    CGFloat v17 = v23;
    CGFloat v18 = v24;
  }
  if (_UIRectIntersectsRectAlongFocusHeading(a5, x, y, width, height, v15, v16, v17, v18))
  {
    if ((a5 & 3) == 0)
    {
      if ((a5 & 0xC) != 0)
      {
        v52.origin.CGFloat x = v15;
        v52.origin.CGFloat y = v16;
        v52.size.CGFloat width = v17;
        v52.size.CGFloat height = v18;
        CGFloat recta = v15;
        double MinY = CGRectGetMinY(v52);
        v53.origin.CGFloat x = x;
        v53.origin.CGFloat y = y;
        v53.size.CGFloat width = width;
        v53.size.CGFloat height = height;
        double v34 = CGRectGetMinY(v53);
        if (MinY >= v34) {
          double v34 = MinY;
        }
        double v37 = v34;
        v54.origin.CGFloat x = recta;
        v54.origin.CGFloat y = v16;
        v54.size.CGFloat width = v17;
        v54.size.CGFloat height = v18;
        double MaxY = CGRectGetMaxY(v54);
        v55.origin.CGFloat x = x;
        v55.origin.CGFloat y = y;
        v55.size.CGFloat width = width;
        v55.size.CGFloat height = height;
        double v36 = CGRectGetMaxY(v55);
        if (MaxY < v36) {
          double v36 = MaxY;
        }
        double MidY = (v37 + v36) * 0.5;
        v56.origin.CGFloat x = x;
        v56.origin.CGFloat y = y;
        v56.size.CGFloat width = width;
        v56.size.CGFloat height = height;
        double MidX = CGRectGetMidX(v56);
      }
      else
      {
        double MidX = INFINITY;
        double MidY = INFINITY;
      }
      goto LABEL_16;
    }
    v42.origin.CGFloat x = v15;
    v42.origin.CGFloat y = v16;
    v42.size.CGFloat width = v17;
    v42.size.CGFloat height = v18;
    CGFloat rect = v15;
    double MinX = CGRectGetMinX(v42);
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double v26 = CGRectGetMinX(v43);
    if (MinX >= v26) {
      double v26 = MinX;
    }
    double v37 = v26;
    v44.origin.CGFloat x = rect;
    v44.origin.CGFloat y = v16;
    v44.size.CGFloat width = v17;
    v44.size.CGFloat height = v18;
    double MaxX = CGRectGetMaxX(v44);
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    double v28 = CGRectGetMaxX(v45);
    if (MaxX < v28) {
      double v28 = MaxX;
    }
    double MidX = (v37 + v28) * 0.5;
  }
  else
  {
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v46);
  }
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v47);
LABEL_16:
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double v31 = CGRectGetMinX(v48);
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  double v19 = fmax(v31, fmin(MidX, CGRectGetMaxX(v49)));
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  double v32 = CGRectGetMinY(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  double v20 = fmax(v32, fmin(MidY, CGRectGetMaxY(v51)));
  [(_UIFocusCastingController *)self _startRememberingEntryPoint];
LABEL_17:
  -[_UIFocusCastingController setScreenEntryPoint:](self, "setScreenEntryPoint:", v19, v20, *(void *)&v37);
  [(_UIFocusCastingController *)self setEntryPointAxis:[(_UIFocusCastingController *)self _axisForHeading:a5]];
  if (_UIGetFocusCastingVisualization())
  {
    [(_UIFocusCastingController *)self _updateFocusMovementIndicatorDisplay];
  }
}

- (unint64_t)_axisForHeading:(unint64_t)a3
{
  if ((a3 & 3) != 0) {
    return 2;
  }
  else {
    return (a3 & 0xC) != 0;
  }
}

- (CGPoint)_castingPointInNormalizedFrame:(CGRect)a3 forHeading:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(_UIFocusCastingController *)self isRememberingEntryPoint])
  {
    -[_UIFocusCastingController _entryPointInNormalizedFrame:forHeading:](self, "_entryPointInNormalizedFrame:forHeading:", a4, x, y, width, height);
  }
  else
  {
    -[_UIFocusCastingController _movementPointInNormalizedFrame:](self, "_movementPointInNormalizedFrame:", x, y, width, height);
  }
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)_stopRememberingEntryPoint
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_forgetEntryPoint object:0];
  [(_UIFocusCastingController *)self setIsRememberingEntryPoint:0];
}

- (void)_startRememberingEntryPoint
{
  [(_UIFocusCastingController *)self _stopRememberingEntryPoint];
  [(_UIFocusCastingController *)self setIsRememberingEntryPoint:1];
  [(_UIFocusCastingController *)self entryPointMemorizationTimeout];
  if (v3 > 0.0)
  {
    -[_UIFocusCastingController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_forgetEntryPoint, 0);
  }
}

- (void)forgetEntryPoint
{
  if ([(_UIFocusCastingController *)self isRememberingEntryPoint])
  {
    [(_UIFocusCastingController *)self _stopRememberingEntryPoint];
    if (_UIGetFocusCastingVisualization())
    {
      [(_UIFocusCastingController *)self _positionFocusMovementIndicators];
    }
  }
}

- (void)setEntryPointMemorizationTimeout:(double)a3
{
  self->_entryPointMemorizationTimeout = a3;
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_forgetEntryPoint object:0];
  BOOL v5 = [(_UIFocusCastingController *)self isRememberingEntryPoint];
  if (a3 > 0.0 && v5)
  {
    [(_UIFocusCastingController *)self performSelector:sel_forgetEntryPoint withObject:0 afterDelay:a3];
  }
}

- (CGPoint)_entryPointInNormalizedFrame:(CGRect)a3 forHeading:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(_UIFocusCastingController *)self screenEntryPoint];
  double v11 = v10;
  double v13 = v12;
  unint64_t v14 = [(_UIFocusCastingController *)self _axisForHeading:a4];
  double v15 = INFINITY;
  BOOL v16 = v11 == INFINITY && v13 == INFINITY;
  double v17 = INFINITY;
  if (!v16)
  {
    if ([(_UIFocusCastingController *)self entryPointAxis] == v14)
    {
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v22);
      v23.origin.CGFloat x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      double v15 = fmax(MinX, fmin(v11, CGRectGetMaxX(v23)));
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v24);
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      double v17 = fmax(MinY, fmin(v13, CGRectGetMaxY(v25)));
    }
    else
    {
      double v15 = INFINITY;
      double v17 = INFINITY;
    }
  }
  double v20 = v15;
  result.CGFloat y = v17;
  result.CGFloat x = v20;
  return result;
}

- (CGPoint)_movementPointInNormalizedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(_UIFocusCastingController *)self _focusEffectsControllerForFocusedItem];
  id v8 = v7;
  if (v7)
  {
    [v7 displayOffset];
    double v10 = x + width * (v9 + 1.0) * 0.5;
    double v12 = y + height * (v11 + 1.0) * 0.5;
  }
  else
  {
    double v12 = INFINITY;
    double v10 = INFINITY;
  }

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (id)_focusEffectsControllerForFocusedItem
{
  double v3 = [(_UIFocusCastingController *)self focusSystem];
  id v4 = [v3 _focusedWindow];

  BOOL v5 = [v4 _focusEventRecognizer];
  double v6 = [v5 _motionEffectsController];

  if (_UIGetFocusCastingVisualization() && v6) {
    [v6 addObserver:self];
  }

  return v6;
}

- (void)_updateFocusMovementIndicatorDisplay
{
  [(_UIFocusCastingController *)self _createFocusMovementIndicator];
  [(_UIFocusCastingController *)self _positionFocusMovementIndicators];
}

- (void)_createFocusMovementIndicator
{
  double v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.PineBoard"];

  if ((v5 & 1) == 0)
  {
    double v6 = [(_UIFocusCastingController *)self focusSystem];
    id v36 = [v6 _focusedWindow];

    double v7 = [(_UIFocusCastingController *)self focusCastingIndicator];
    id v8 = [v7 window];

    if (v36 != v8) {
      [(_UIFocusCastingController *)self _destroyFocusMovementIndicator];
    }
    if (v36)
    {
      double v9 = [(_UIFocusCastingController *)self focusCastingIndicator];

      if (!v9)
      {
        double v10 = [UIView alloc];
        double v11 = *MEMORY[0x1E4F1DB28];
        double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        double v15 = -[UIView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
        [(_UIFocusCastingController *)self setFocusCastingIndicator:v15];

        BOOL v16 = +[UIColor colorWithRed:0.543 green:1.11 blue:0.678 alpha:7.0];
        double v17 = [(_UIFocusCastingController *)self focusCastingIndicator];
        [v17 setBackgroundColor:v16];

        CGFloat v18 = [(_UIFocusCastingController *)self focusCastingIndicator];
        double v19 = [v18 layer];
        [v19 setZPosition:100.0];

        double v20 = [(_UIFocusCastingController *)self focusCastingIndicator];
        [v20 setUserInteractionEnabled:0];

        double v21 = [(_UIFocusCastingController *)self focusCastingIndicator];
        [v36 addSubview:v21];

        CGRect v22 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v11, v12, v13, v14);
        [(_UIFocusCastingController *)self setFocusMovementIndicator:v22];

        CGRect v23 = +[UIColor colorWithRed:1.11 green:0.543 blue:0.678 alpha:1.0];
        CGRect v24 = [(_UIFocusCastingController *)self focusMovementIndicator];
        [v24 setBackgroundColor:v23];

        CGRect v25 = [(_UIFocusCastingController *)self focusMovementIndicator];
        double v26 = [v25 layer];
        [v26 setZPosition:100.0];

        CGRect v27 = [(_UIFocusCastingController *)self focusMovementIndicator];
        [v27 setUserInteractionEnabled:0];

        double v28 = [(_UIFocusCastingController *)self focusMovementIndicator];
        [v36 addSubview:v28];

        CGRect v29 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v11, v12, v13, v14);
        [(_UIFocusCastingController *)self setFocusEntryIndicator:v29];

        CGRect v30 = +[UIColor colorWithRed:0.678 green:0.543 blue:1.11 alpha:1.0];
        double v31 = [(_UIFocusCastingController *)self focusEntryIndicator];
        [v31 setBackgroundColor:v30];

        double v32 = [(_UIFocusCastingController *)self focusEntryIndicator];
        v33 = [v32 layer];
        [v33 setZPosition:100.0];

        double v34 = [(_UIFocusCastingController *)self focusEntryIndicator];
        [v34 setUserInteractionEnabled:0];

        v35 = [(_UIFocusCastingController *)self focusEntryIndicator];
        [v36 addSubview:v35];
      }
    }
  }
}

- (void)_positionFocusMovementIndicators
{
  double v3 = [(_UIFocusCastingController *)self focusCastingIndicator];

  if (v3)
  {
    id v4 = [(_UIFocusCastingController *)self _normalizedCoordinateSpace];
    if (v4)
    {
      char v5 = [(_UIFocusCastingController *)self focusMovementIndicator];
      [v5 setHidden:1];

      double v6 = [(_UIFocusCastingController *)self focusEntryIndicator];
      [v6 setHidden:1];

      double v7 = [(_UIFocusCastingController *)self focusCastingIndicator];
      [v7 setHidden:1];

      id v8 = [(_UIFocusCastingController *)self focusSystem];
      double v9 = [v8 focusedItem];

      v50.origin.double x = _UIFocusItemFrameInCoordinateSpace(v9, v4);
      double x = v50.origin.x;
      double y = v50.origin.y;
      double width = v50.size.width;
      double height = v50.size.height;
      if (!CGRectIsNull(v50))
      {
        double v14 = [(_UIFocusCastingController *)self _focusEffectsControllerForFocusedItem];
        [v14 displayOffset];
        double v16 = v15;
        double v18 = v17;

        double v19 = -v16;
        if (v16 >= 0.0) {
          double v19 = v16;
        }
        double v20 = -v18;
        uint64_t v21 = 4;
        if (v16 > 0.0) {
          uint64_t v21 = 8;
        }
        if (v18 >= 0.0) {
          double v20 = v18;
        }
        uint64_t v22 = 2;
        if (v18 <= 0.0) {
          uint64_t v22 = 1;
        }
        if (v19 <= v20) {
          uint64_t v23 = v22;
        }
        else {
          uint64_t v23 = v21;
        }
        -[_UIFocusCastingController _movementPointInNormalizedFrame:](self, "_movementPointInNormalizedFrame:", x, y, width, height);
        double v25 = v24;
        double v27 = v26;
        -[_UIFocusCastingController _entryPointInNormalizedFrame:forHeading:](self, "_entryPointInNormalizedFrame:forHeading:", v23, x, y, width, height);
        double v29 = v28;
        double v31 = v30;
        -[_UIFocusCastingController _castingPointInNormalizedFrame:forHeading:](self, "_castingPointInNormalizedFrame:forHeading:", v23, x, y, width, height);
        double v33 = v32;
        double v35 = v34;
        BOOL v36 = v31 == INFINITY && v29 == INFINITY;
        double v37 = [(_UIFocusCastingController *)self focusEntryIndicator];
        [v37 setHidden:v36];

        v38 = [(_UIFocusCastingController *)self focusEntryIndicator];
        objc_msgSend(v38, "setBounds:", 0.0, 0.0, 20.0, 20.0);

        v39 = [(_UIFocusCastingController *)self focusEntryIndicator];
        objc_msgSend(v39, "setCenter:", v29, v31);

        BOOL v40 = v27 == INFINITY && v25 == INFINITY;
        CGRect v41 = [(_UIFocusCastingController *)self focusMovementIndicator];
        [v41 setHidden:v40];

        CGRect v42 = [(_UIFocusCastingController *)self focusMovementIndicator];
        objc_msgSend(v42, "setBounds:", 0.0, 0.0, 25.0, 25.0);

        CGRect v43 = [(_UIFocusCastingController *)self focusMovementIndicator];
        objc_msgSend(v43, "setCenter:", v25, v27);

        CGRect v44 = [(_UIFocusCastingController *)self focusCastingIndicator];
        [v44 setHidden:0];

        CGRect v45 = [(_UIFocusCastingController *)self focusCastingIndicator];
        objc_msgSend(v45, "setBounds:", 0.0, 0.0, 30.0, 30.0);

        CGRect v46 = [(_UIFocusCastingController *)self focusCastingIndicator];
        objc_msgSend(v46, "setCenter:", v33, v35);
      }
    }
    else
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &_positionFocusMovementIndicators___s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        CGRect v48 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CGRect v49 = 0;
          _os_log_impl(&dword_1853B0000, v48, OS_LOG_TYPE_ERROR, "Unable to get normalized coordinate space for focus casting.", v49, 2u);
        }
      }
    }
  }
}

- (void)_destroyFocusMovementIndicator
{
  double v3 = [(_UIFocusCastingController *)self focusMovementIndicator];

  if (v3)
  {
    id v4 = [(_UIFocusCastingController *)self focusMovementIndicator];
    [v4 removeFromSuperview];

    [(_UIFocusCastingController *)self setFocusMovementIndicator:0];
  }
  char v5 = [(_UIFocusCastingController *)self focusEntryIndicator];

  if (v5)
  {
    double v6 = [(_UIFocusCastingController *)self focusEntryIndicator];
    [v6 removeFromSuperview];

    [(_UIFocusCastingController *)self setFocusEntryIndicator:0];
  }
  double v7 = [(_UIFocusCastingController *)self focusCastingIndicator];

  if (v7)
  {
    id v8 = [(_UIFocusCastingController *)self focusCastingIndicator];
    [v8 removeFromSuperview];

    [(_UIFocusCastingController *)self setFocusCastingIndicator:0];
  }
}

- (UIFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (UIFocusSystem *)WeakRetained;
}

- (void)setFocusSystem:(id)a3
{
}

- (double)entryPointMemorizationTimeout
{
  return self->_entryPointMemorizationTimeout;
}

- (CGPoint)screenEntryPoint
{
  double x = self->_screenEntryPoint.x;
  double y = self->_screenEntryPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setScreenEntryPoint:(CGPoint)a3
{
  self->_screenEntryPoint = a3;
}

- (unint64_t)entryPointAxis
{
  return self->_entryPointAxis;
}

- (void)setEntryPointAxis:(unint64_t)a3
{
  self->_entryPointAxis = a3;
}

- (BOOL)isRememberingEntryPoint
{
  return self->_isRememberingEntryPoint;
}

- (void)setIsRememberingEntryPoint:(BOOL)a3
{
  self->_isRememberingEntryPoint = a3;
}

- (UIView)focusMovementIndicator
{
  return self->_focusMovementIndicator;
}

- (void)setFocusMovementIndicator:(id)a3
{
}

- (UIView)focusEntryIndicator
{
  return self->_focusEntryIndicator;
}

- (void)setFocusEntryIndicator:(id)a3
{
}

- (UIView)focusCastingIndicator
{
  return self->_focusCastingIndicator;
}

- (void)setFocusCastingIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusCastingIndicator, 0);
  objc_storeStrong((id *)&self->_focusEntryIndicator, 0);
  objc_storeStrong((id *)&self->_focusMovementIndicator, 0);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end