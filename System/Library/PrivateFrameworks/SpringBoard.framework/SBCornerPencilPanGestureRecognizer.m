@interface SBCornerPencilPanGestureRecognizer
+ (BOOL)_shouldSupportStylusTouches;
+ (id)interactiveCornerPanGestureRecognizerWithSettings:(id)a3 corner:(unint64_t)a4 target:(id)a5 action:(SEL)a6;
+ (unint64_t)_edgesForCorner:(unint64_t)a3;
- (BOOL)_isOrientedLocation:(CGPoint)a3 inCorner:(unint64_t)a4 forOrientedBounds:(CGRect)a5 withEdgeOffsets:(UIOffset)a6;
- (BOOL)shouldReceiveTouch:(id)a3;
- (UIOffset)_edgeOffsets;
- (id)_initWithSettings:(id)a3 corner:(unint64_t)a4 target:(id)a5 action:(SEL)a6 type:(int64_t)a7 options:(unint64_t)a8;
- (int64_t)_touchInterfaceOrientation;
- (unint64_t)corner;
- (void)_SBLogTouchesWithMethodName:(id)a3 withMethodName:(id)a4;
- (void)_convertReferenceLocation:(CGPoint)a3 toOrientedLocation:(CGPoint *)a4 orientedBounds:(CGRect *)a5;
- (void)_updateSettingsDerivedValues:(id)a3;
- (void)reset;
- (void)setEdges:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SBCornerPencilPanGestureRecognizer

+ (unint64_t)_edgesForCorner:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return 0;
  }
  else {
    return qword_1D8FD1928[a3 - 1];
  }
}

+ (id)interactiveCornerPanGestureRecognizerWithSettings:(id)a3 corner:(unint64_t)a4 target:(id)a5 action:(SEL)a6
{
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)a1) _initWithSettings:v11 corner:a4 target:v10 action:a6 type:3 options:1];

  return v12;
}

- (id)_initWithSettings:(id)a3 corner:(unint64_t)a4 target:(id)a5 action:(SEL)a6 type:(int64_t)a7 options:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a5;
  uint64_t v17 = [(id)objc_opt_class() _edgesForCorner:a4];
  if (!v17)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBCornerPencilPanGestureRecognizer.m", 114, @"Invalid parameter not satisfying: %@", @"configuredEdges != UIRectEdgeNone" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  v18 = [(SBScreenEdgePanGestureRecognizer *)&v25 initWithTarget:v16 action:a6 type:a7 options:a8];
  v19 = v18;
  if (v18)
  {
    [(SBCornerPencilPanGestureRecognizer *)v18 _updateSettingsDerivedValues:v15];
    [v15 addKeyObserver:v19];
    v20 = objc_alloc_init(SBTouchHistory);
    touchHistory = v19->_touchHistory;
    v19->_touchHistory = v20;

    v19->_corner = a4;
    v24.receiver = v19;
    v24.super_class = (Class)SBCornerPencilPanGestureRecognizer;
    [(UIScreenEdgePanGestureRecognizer *)&v24 setEdges:v17];
    [(SBCornerPencilPanGestureRecognizer *)v19 setAllowedTouchTypes:&unk_1F3347F40];
    [(SBCornerPencilPanGestureRecognizer *)v19 setMaximumNumberOfTouches:1];
    [(UIScreenEdgePanGestureRecognizer *)v19 _setHysteresis:5.0];
  }

  return v19;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SBCornerPencilPanGestureRecognizer *)self _updateSettingsDerivedValues:v5];
  }
}

- (void)_SBLogTouchesWithMethodName:(id)a3 withMethodName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  int v9 = [v8 isEnabled];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__SBCornerPencilPanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke;
    v11[3] = &unk_1E6B022E0;
    id v12 = v6;
    v13 = self;
    id v14 = v7;
    [v10 logBlock:v11];
  }
}

id __81__SBCornerPencilPanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v37 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v34 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v38 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v38)
  {
    uint64_t v36 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        double v4 = _SBLocationForTouch(v3);
        double v6 = v5;
        v54[0] = @"timestamp";
        id v7 = NSNumber;
        [v3 timestamp];
        v45 = objc_msgSend(v7, "numberWithDouble:");
        v55[0] = v45;
        v54[1] = @"phase";
        v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "phase"));
        v55[1] = v44;
        v54[2] = @"tapCount";
        v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "tapCount"));
        v55[2] = v43;
        v54[3] = @"type";
        v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "type"));
        v55[3] = v42;
        v54[4] = @"majorRadius";
        v8 = NSNumber;
        [v3 majorRadius];
        v41 = objc_msgSend(v8, "numberWithDouble:");
        v55[4] = v41;
        v54[5] = @"majorRadiusToTolerance";
        int v9 = NSNumber;
        [v3 majorRadiusTolerance];
        v40 = objc_msgSend(v9, "numberWithDouble:");
        v55[5] = v40;
        v54[6] = @"force";
        id v10 = NSNumber;
        [v3 force];
        v39 = objc_msgSend(v10, "numberWithDouble:");
        v55[6] = v39;
        v54[7] = @"maximumPossibleForce";
        id v11 = NSNumber;
        [v3 maximumPossibleForce];
        id v12 = objc_msgSend(v11, "numberWithDouble:");
        v55[7] = v12;
        v54[8] = @"altitudeAngle";
        v13 = NSNumber;
        [v3 altitudeAngle];
        id v14 = objc_msgSend(v13, "numberWithDouble:");
        v55[8] = v14;
        v54[9] = @"estimationUpdateIndex";
        uint64_t v15 = [v3 estimationUpdateIndex];
        id v16 = (void *)v15;
        uint64_t v17 = &unk_1F334A340;
        if (v15) {
          uint64_t v17 = (void *)v15;
        }
        v55[9] = v17;
        v54[10] = @"estimatedProperties";
        v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "estimatedProperties"));
        v55[10] = v18;
        v54[11] = @"estimatedPropertiesExpectingUpdates";
        v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "estimatedPropertiesExpectingUpdates"));
        v55[11] = v19;
        v54[12] = @"location";
        v52[0] = @"x";
        v20 = [NSNumber numberWithDouble:v4];
        v52[1] = @"y";
        v53[0] = v20;
        v21 = [NSNumber numberWithDouble:v6];
        v53[1] = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
        v55[12] = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:13];

        [v37 addObject:v23];
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v38);
  }

  objc_super v24 = NSString;
  objc_super v25 = (objc_class *)objc_opt_class();
  v26 = NSStringFromClass(v25);
  v27 = [v24 stringWithFormat:@"[%@ %@]", v26, *(void *)(v34 + 48)];

  v51[0] = v37;
  v50[0] = v27;
  v50[1] = @"address";
  v28 = [NSNumber numberWithUnsignedLong:*(void *)(v34 + 40)];
  v51[1] = v28;
  v50[2] = @"name";
  uint64_t v29 = [*(id *)(v34 + 40) name];
  v30 = (void *)v29;
  v31 = &stru_1F3084718;
  if (v29) {
    v31 = (__CFString *)v29;
  }
  v51[2] = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];

  return v32;
}

- (void)setEdges:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"SBCornerPencilPanGestureRecognizer.m" lineNumber:181 description:@"configure edges by passing in corner"];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  int v9 = [v8 anyObject];
  id v10 = [v7 coalescedTouchesForTouch:v9];

  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, 0, 0);
  _SBLogCoalescedTouchesForGestureAndView_0(v10, self);
  id v11 = NSStringFromSelector(a2);
  [(SBCornerPencilPanGestureRecognizer *)self _SBLogTouchesWithMethodName:v8 withMethodName:v11];

  v12.receiver = self;
  v12.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v12 touchesBegan:v8 withEvent:v7];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  int v9 = [v8 anyObject];
  id v10 = [v7 coalescedTouchesForTouch:v9];

  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, 0, 0);
  _SBLogCoalescedTouchesForGestureAndView_0(v10, self);
  id v11 = NSStringFromSelector(a2);
  [(SBCornerPencilPanGestureRecognizer *)self _SBLogTouchesWithMethodName:v8 withMethodName:v11];

  v12.receiver = self;
  v12.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v12 touchesMoved:v8 withEvent:v7];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  int v9 = [v8 anyObject];
  id v10 = [v7 coalescedTouchesForTouch:v9];

  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, 0, 0);
  _SBLogCoalescedTouchesForGestureAndView_0(v10, self);
  id v11 = NSStringFromSelector(a2);
  [(SBCornerPencilPanGestureRecognizer *)self _SBLogTouchesWithMethodName:v8 withMethodName:v11];

  v12.receiver = self;
  v12.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v12 touchesEnded:v8 withEvent:v7];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v3 reset];
  self->_touchInterfaceOrientationWhenGestureBegan = 0;
  [(SBTouchHistory *)self->_touchHistory reset];
}

- (void)setState:(int64_t)a3
{
  if (a3 == 1) {
    self->_touchInterfaceOrientationWhenGestureBegan = [(SBCornerPencilPanGestureRecognizer *)self _touchInterfaceOrientation];
  }
  id v5 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SBCornerPencilPanGestureRecognizer_setState___block_invoke;
  v7[3] = &unk_1E6B029D0;
  v7[4] = self;
  v7[5] = a3;
  [v5 logBlock:v7];

  v6.receiver = self;
  v6.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  [(SBCornerPencilPanGestureRecognizer *)&v6 setState:a3];
}

id __47__SBCornerPencilPanGestureRecognizer_setState___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = @"[SBCornerPencilPanGestureRecognizer setState:]";
  v13[0] = @"state";
  v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v14[0] = v2;
  v13[1] = @"address";
  objc_super v3 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v14[1] = v3;
  v13[2] = @"name";
  uint64_t v4 = [*(id *)(a1 + 32) name];
  id v5 = (void *)v4;
  objc_super v6 = &stru_1F3084718;
  if (v4) {
    objc_super v6 = (__CFString *)v4;
  }
  v14[2] = v6;
  v13[3] = @"horizontalEdgeLength";
  id v7 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 536)];
  v14[3] = v7;
  v13[4] = @"verticalEdgeLength";
  id v8 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 544)];
  v14[4] = v8;
  v13[5] = @"corner";
  int v9 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 528)];
  v14[5] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];
  v16[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  return v11;
}

- (int64_t)_touchInterfaceOrientation
{
  int64_t result = self->_touchInterfaceOrientationWhenGestureBegan;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBCornerPencilPanGestureRecognizer;
    return [(SBScreenEdgePanGestureRecognizer *)&v4 _touchInterfaceOrientation];
  }
  return result;
}

+ (BOOL)_shouldSupportStylusTouches
{
  return 1;
}

- (BOOL)shouldReceiveTouch:(id)a3
{
  double v10 = 0.0;
  double v11 = 0.0;
  long long v8 = 0u;
  long long v9 = 0u;
  [a3 locationInView:0];
  -[SBCornerPencilPanGestureRecognizer _convertReferenceLocation:toOrientedLocation:orientedBounds:](self, "_convertReferenceLocation:toOrientedLocation:orientedBounds:", &v10, &v8);
  unint64_t corner = self->_corner;
  [(SBCornerPencilPanGestureRecognizer *)self _edgeOffsets];
  return -[SBCornerPencilPanGestureRecognizer _isOrientedLocation:inCorner:forOrientedBounds:withEdgeOffsets:](self, "_isOrientedLocation:inCorner:forOrientedBounds:withEdgeOffsets:", corner, v10, v11, v8, v9, v5, v6);
}

- (void)_updateSettingsDerivedValues:(id)a3
{
  id v4 = a3;
  [v4 cornerHorizontalEdgeLength];
  self->_cornerHorizontalEdgeLength = v5;
  [v4 cornerVerticalEdgeLength];
  double v7 = v6;

  self->_cornerVerticalEdgeLength = v7;
}

- (void)_convertReferenceLocation:(CGPoint)a3 toOrientedLocation:(CGPoint *)a4 orientedBounds:(CGRect *)a5
{
  id v16 = [(SBCornerPencilPanGestureRecognizer *)self view];
  [(SBCornerPencilPanGestureRecognizer *)self _touchInterfaceOrientation];
  [v16 bounds];
  _UIWindowConvertPointFromOrientationToOrientation();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  _UIWindowConvertRectFromOrientationToOrientation();
  if (a4)
  {
    a4->x = v9;
    a4->y = v11;
  }
  if (a5)
  {
    a5->origin.x = v12;
    a5->origin.y = v13;
    a5->size.width = v14;
    a5->size.height = v15;
  }
}

- (UIOffset)_edgeOffsets
{
  double cornerHorizontalEdgeLength = self->_cornerHorizontalEdgeLength;
  double cornerVerticalEdgeLength = self->_cornerVerticalEdgeLength;
  result.vertical = cornerVerticalEdgeLength;
  result.horizontal = cornerHorizontalEdgeLength;
  return result;
}

- (BOOL)_isOrientedLocation:(CGPoint)a3 inCorner:(unint64_t)a4 forOrientedBounds:(CGRect)a5 withEdgeOffsets:(UIOffset)a6
{
  BOOL result = 0;
  double vertical = a6.vertical;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v12 = a3.y;
  double v13 = a3.x;
  switch(a4)
  {
    case 1uLL:
      if (a3.x > a6.horizontal + CGRectGetMinX(a5)) {
        return 0;
      }
      v16.origin.CGFloat x = x;
      v16.origin.CGFloat y = y;
      v16.size.CGFloat width = width;
      v16.size.CGFloat height = height;
      if (v13 < CGRectGetMinX(v16) || v12 > vertical) {
        return 0;
      }
      goto LABEL_17;
    case 2uLL:
      if (a3.x < CGRectGetMaxX(a5) - a6.horizontal) {
        return 0;
      }
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      if (v13 > CGRectGetMaxX(v18) || v12 > vertical) {
        return 0;
      }
LABEL_17:
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      return v12 >= CGRectGetMinY(v19);
    case 4uLL:
      if (a3.x > a6.horizontal + CGRectGetMinX(a5)) {
        return 0;
      }
      v17.origin.CGFloat x = x;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      if (v13 < CGRectGetMinX(v17)) {
        return 0;
      }
      goto LABEL_20;
    case 8uLL:
      if (a3.x < CGRectGetMaxX(a5) - a6.horizontal) {
        return 0;
      }
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      if (v13 > CGRectGetMaxX(v20)) {
        return 0;
      }
LABEL_20:
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      if (v12 < CGRectGetMaxY(v21) - vertical) {
        return 0;
      }
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      return v12 <= CGRectGetMaxY(v22);
    default:
      return result;
  }
}

- (unint64_t)corner
{
  return self->_corner;
}

- (void).cxx_destruct
{
}

@end