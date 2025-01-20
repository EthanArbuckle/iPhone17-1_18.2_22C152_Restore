@interface SBCornerFingerPanGestureRecognizer
- (BOOL)_shouldBegin;
- (CGVector)_convertReferenceVector:(CGVector)a3 toCorner:(unint64_t)a4 orientation:(int64_t)a5;
- (SBCornerFingerPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 corner:(unint64_t)a5 classifier:(id)a6;
- (int64_t)_touchInterfaceOrientation;
- (unint64_t)corner;
- (unint64_t)edges;
- (void)_SBLogTouchesWithMethodName:(id)a3 withMethodName:(id)a4;
- (void)_convertReferenceLocation:(CGPoint)a3 toOrientedLocation:(CGPoint *)a4 orientedBounds:(CGRect *)a5;
- (void)reset;
- (void)setEdges:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SBCornerFingerPanGestureRecognizer

- (SBCornerFingerPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 corner:(unint64_t)a5 classifier:(id)a6
{
  id v11 = a6;
  v12 = (void *)MEMORY[0x1E4F4F7D0];
  id v13 = a3;
  v14 = [v12 sharedInstance];
  uint64_t v15 = [v14 homeButtonType];

  if (v15 == 2) {
    uint64_t v16 = 5;
  }
  else {
    uint64_t v16 = 3;
  }
  v24.receiver = self;
  v24.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  v17 = [(SBScreenEdgePanGestureRecognizer *)&v24 initWithTarget:v13 action:a4 type:v16 options:0];

  if (v17)
  {
    v18 = objc_alloc_init(SBTouchHistory);
    touchHistory = v17->_touchHistory;
    v17->_touchHistory = v18;

    v17->_corner = a5;
    objc_storeStrong((id *)&v17->_classifier, a6);
    [(SBCornerFingerPanGestureRecognizer *)v17 setMaximumNumberOfTouches:1];
    [(SBCornerFingerPanGestureRecognizer *)v17 setAllowedTouchTypes:&unk_1F3348A20];
    unint64_t v20 = v17->_corner - 1;
    if (v20 > 7) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = qword_1D8FD3630[v20];
    }
    v23.receiver = v17;
    v23.super_class = (Class)SBCornerFingerPanGestureRecognizer;
    [(UIScreenEdgePanGestureRecognizer *)&v23 setEdges:v21];
  }

  return v17;
}

- (BOOL)_shouldBegin
{
  v36.receiver = self;
  v36.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  if ([(SBCornerFingerPanGestureRecognizer *)&v36 _shouldBegin])
  {
    double v34 = 0.0;
    double v35 = 0.0;
    memset(&v33, 0, sizeof(v33));
    -[SBCornerFingerPanGestureRecognizer _convertReferenceLocation:toOrientedLocation:orientedBounds:](self, "_convertReferenceLocation:toOrientedLocation:orientedBounds:", &v34, &v33, self->_firstTouchReferenceLocation.x, self->_firstTouchReferenceLocation.y);
    switch(self->_corner)
    {
      case 1uLL:
        double MaxX = *MEMORY[0x1E4F1DAD8];
        double MinY = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        break;
      case 2uLL:
        double MaxX = CGRectGetMaxX(v33);
        double MinY = CGRectGetMinY(v33);
        break;
      case 4uLL:
        double MinX = CGRectGetMinX(v33);
        goto LABEL_9;
      case 8uLL:
        double MinX = CGRectGetMaxX(v33);
LABEL_9:
        double MaxX = MinX;
        double MinY = CGRectGetMaxY(v33);
        break;
      default:
        v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2 object:self file:@"SBCornerFingerPanGestureRecognizer.m" lineNumber:184 description:@"_corner incorrectly configured"];

        double MinY = 0.0;
        double MaxX = 0.0;
        break;
    }
    double v10 = vabdd_f64(v34, MaxX);
    double v11 = vabdd_f64(v35, MinY);
    if (v10 >= v11) {
      double v12 = v10;
    }
    else {
      double v12 = v11;
    }
    double v13 = SBMainScreenPointsPerMillimeter();
    [(SBTouchHistory *)self->_touchHistory averageTouchVelocityOverTimeDuration:0.0416666667];
    -[SBCornerFingerPanGestureRecognizer _convertReferenceVector:toCorner:orientation:](self, "_convertReferenceVector:toCorner:orientation:", self->_corner, [(SBCornerFingerPanGestureRecognizer *)self _touchInterfaceOrientation], v14, v15);
    for (double i = atan2(v17, v16) / 0.0174532925 + -45.0; i < -180.0; double i = i + 360.0)
      ;
    for (j = v12 / v13; i > 180.0; double i = i + -360.0)
      ;
    BOOL v6 = [(SBCornerFingerGestureClassifier *)self->_classifier classifySwipeWithOffsettedAngle:(unint64_t)([(SBCornerFingerPanGestureRecognizer *)self _touchInterfaceOrientation]- 1) < 2 distanceToCorner:i portrait:j];
    if (v6) {
      v7 = 0;
    }
    else {
      v7 = @"rejected by classifier";
    }
  }
  else
  {
    LOBYTE(v6) = 0;
    v7 = @"rejected by super";
  }
  unint64_t v20 = [(UIScreenEdgePanGestureRecognizer *)self touchedEdges];
  [(SBTouchHistory *)self->_touchHistory averageTouchVelocityOverTimeDuration:0.0416666667];
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  v25 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __50__SBCornerFingerPanGestureRecognizer__shouldBegin__block_invoke;
  v27[3] = &unk_1E6B0EB90;
  BOOL v32 = v6;
  v27[4] = self;
  v28 = v7;
  unint64_t v29 = v20;
  uint64_t v30 = v22;
  uint64_t v31 = v24;
  [v25 logBlock:v27];

  return v6;
}

id __50__SBCornerFingerPanGestureRecognizer__shouldBegin__block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v21 = @"[SBCornerFingerPanGestureRecognizer _shouldBegin]";
  v19[0] = @"shouldBegin";
  long double v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  v20[0] = v16;
  v19[1] = @"address";
  v2 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v20[1] = v2;
  v19[2] = @"name";
  uint64_t v3 = [*(id *)(a1 + 32) name];
  v4 = (void *)v3;
  v5 = &stru_1F3084718;
  if (v3) {
    BOOL v6 = (__CFString *)v3;
  }
  else {
    BOOL v6 = &stru_1F3084718;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (*(void *)(a1 + 40)) {
    v5 = *(__CFString **)(a1 + 40);
  }
  v20[2] = v6;
  v20[3] = v5;
  v19[3] = @"failureReason";
  v19[4] = @"touchedEdges";
  v8 = [NSNumber numberWithUnsignedInteger:v7];
  v20[4] = v8;
  v19[5] = @"touchVector";
  v17[0] = @"x";
  v9 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v17[1] = @"y";
  v18[0] = v9;
  double v10 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v18[1] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[5] = v11;
  v19[6] = @"corner";
  double v12 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 528)];
  v20[6] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:7];
  v22[0] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

  return v14;
}

- (void)_convertReferenceLocation:(CGPoint)a3 toOrientedLocation:(CGPoint *)a4 orientedBounds:(CGRect *)a5
{
  id v16 = [(SBCornerFingerPanGestureRecognizer *)self view];
  [(SBCornerFingerPanGestureRecognizer *)self _touchInterfaceOrientation];
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

- (CGVector)_convertReferenceVector:(CGVector)a3 toCorner:(unint64_t)a4 orientation:(int64_t)a5
{
  CGFloat dy = a3.dy;
  double dx = a3.dx;
  double v9 = a3.dy;
  switch(a5)
  {
    case 0:
      double v10 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4);
      [v10 handleFailureInMethod:a2 object:self file:@"SBCornerFingerPanGestureRecognizer.m" lineNumber:285 description:@"dealing with unknown orientation"];

      goto LABEL_3;
    case 1:
      break;
    case 2:
      double dx = -a3.dx;
      double v9 = -a3.dy;
      break;
    case 3:
      double v9 = -a3.dx;
      double dx = a3.dy;
      break;
    case 4:
      double v9 = a3.dx;
      double dx = -a3.dy;
      break;
    default:
LABEL_3:
      double v9 = dy;
      break;
  }
  switch(self->_corner)
  {
    case 1uLL:
      break;
    case 2uLL:
      double dx = -dx;
      break;
    case 4uLL:
      goto LABEL_11;
    case 8uLL:
      double dx = -dx;
LABEL_11:
      double v9 = -v9;
      break;
    default:
      CGFloat v11 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4);
      [v11 handleFailureInMethod:a2 object:self file:@"SBCornerFingerPanGestureRecognizer.m" lineNumber:304 description:@"_corner incorrectly configured"];

      break;
  }
  double v12 = dx;
  double v13 = v9;
  result.CGFloat dy = v13;
  result.double dx = v12;
  return result;
}

- (int64_t)_touchInterfaceOrientation
{
  int64_t result = self->_touchInterfaceOrientationWhenGestureBegan;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBCornerFingerPanGestureRecognizer;
    return [(SBScreenEdgePanGestureRecognizer *)&v4 _touchInterfaceOrientation];
  }
  return result;
}

- (unint64_t)edges
{
  unint64_t v2 = self->_corner - 1;
  if (v2 > 7) {
    return 0;
  }
  else {
    return qword_1D8FD3630[v2];
  }
}

- (void)setEdges:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"SBCornerFingerPanGestureRecognizer.m" lineNumber:326 description:@"edges are readonly"];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  double v9 = [v8 anyObject];
  [v9 locationInView:0];
  self->_firstTouchReferenceLocation.x = v10;
  self->_firstTouchReferenceLocation.y = v11;
  double v12 = [v7 coalescedTouchesForTouch:v9];
  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v12, self, 0, 0);
  _SBLogCoalescedTouchesForGestureAndView_1(v12, self);
  double v13 = NSStringFromSelector(a2);
  [(SBCornerFingerPanGestureRecognizer *)self _SBLogTouchesWithMethodName:v8 withMethodName:v13];

  v14.receiver = self;
  v14.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v14 touchesBegan:v8 withEvent:v7];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  double v9 = [v8 anyObject];
  CGFloat v10 = [v7 coalescedTouchesForTouch:v9];

  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, 0, 0);
  _SBLogCoalescedTouchesForGestureAndView_1(v10, self);
  CGFloat v11 = NSStringFromSelector(a2);
  [(SBCornerFingerPanGestureRecognizer *)self _SBLogTouchesWithMethodName:v8 withMethodName:v11];

  v12.receiver = self;
  v12.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v12 touchesMoved:v8 withEvent:v7];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  double v9 = [v8 anyObject];
  CGFloat v10 = [v7 coalescedTouchesForTouch:v9];

  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, 0, 0);
  _SBLogCoalescedTouchesForGestureAndView_1(v10, self);
  CGFloat v11 = NSStringFromSelector(a2);
  [(SBCornerFingerPanGestureRecognizer *)self _SBLogTouchesWithMethodName:v8 withMethodName:v11];

  v12.receiver = self;
  v12.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v12 touchesEnded:v8 withEvent:v7];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v3 reset];
  self->_touchInterfaceOrientationWhenGestureBegan = 0;
  self->_firstTouchReferenceLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
  [(SBTouchHistory *)self->_touchHistory reset];
}

- (void)setState:(int64_t)a3
{
  if (a3 == 1) {
    self->_touchInterfaceOrientationWhenGestureBegan = [(SBCornerFingerPanGestureRecognizer *)self _touchInterfaceOrientation];
  }
  id v5 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SBCornerFingerPanGestureRecognizer_setState___block_invoke;
  v7[3] = &unk_1E6B029D0;
  v7[4] = self;
  v7[5] = a3;
  [v5 logBlock:v7];

  v6.receiver = self;
  v6.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  [(SBCornerFingerPanGestureRecognizer *)&v6 setState:a3];
}

id __47__SBCornerFingerPanGestureRecognizer_setState___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  double v13 = @"[SBCornerFingerPanGestureRecognizer setState:]";
  v11[0] = @"state";
  unint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v12[0] = v2;
  v11[1] = @"address";
  objc_super v3 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v12[1] = v3;
  v11[2] = @"name";
  uint64_t v4 = [*(id *)(a1 + 32) name];
  id v5 = (void *)v4;
  objc_super v6 = &stru_1F3084718;
  if (v4) {
    objc_super v6 = (__CFString *)v4;
  }
  v12[2] = v6;
  v11[3] = @"corner";
  id v7 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 528)];
  v12[3] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v14[0] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  return v9;
}

- (void)_SBLogTouchesWithMethodName:(id)a3 withMethodName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  int v9 = [v8 isEnabled];

  if (v9)
  {
    CGFloat v10 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__SBCornerFingerPanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke;
    v11[3] = &unk_1E6B022E0;
    id v12 = v6;
    double v13 = self;
    id v14 = v7;
    [v10 logBlock:v11];
  }
}

id __81__SBCornerFingerPanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v37 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v34 = a1;
  obdouble j = *(id *)(a1 + 32);
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
        objc_super v3 = *(void **)(*((void *)&v46 + 1) + 8 * i);
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
        id v8 = NSNumber;
        [v3 majorRadius];
        v41 = objc_msgSend(v8, "numberWithDouble:");
        v55[4] = v41;
        v54[5] = @"majorRadiusToTolerance";
        int v9 = NSNumber;
        [v3 majorRadiusTolerance];
        v40 = objc_msgSend(v9, "numberWithDouble:");
        v55[5] = v40;
        v54[6] = @"force";
        CGFloat v10 = NSNumber;
        [v3 force];
        v39 = objc_msgSend(v10, "numberWithDouble:");
        v55[6] = v39;
        v54[7] = @"maximumPossibleForce";
        CGFloat v11 = NSNumber;
        [v3 maximumPossibleForce];
        id v12 = objc_msgSend(v11, "numberWithDouble:");
        v55[7] = v12;
        v54[8] = @"altitudeAngle";
        double v13 = NSNumber;
        [v3 altitudeAngle];
        id v14 = objc_msgSend(v13, "numberWithDouble:");
        v55[8] = v14;
        v54[9] = @"estimationUpdateIndex";
        uint64_t v15 = [v3 estimationUpdateIndex];
        id v16 = (void *)v15;
        long double v17 = &unk_1F334B810;
        if (v15) {
          long double v17 = (void *)v15;
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
        unint64_t v20 = [NSNumber numberWithDouble:v4];
        v52[1] = @"y";
        v53[0] = v20;
        uint64_t v21 = [NSNumber numberWithDouble:v6];
        v53[1] = v21;
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
        v55[12] = v22;
        uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:13];

        [v37 addObject:v23];
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v38);
  }

  uint64_t v24 = NSString;
  v25 = (objc_class *)objc_opt_class();
  v26 = NSStringFromClass(v25);
  v27 = [v24 stringWithFormat:@"[%@ %@]", v26, *(void *)(v34 + 48)];

  v51[0] = v37;
  v50[0] = v27;
  v50[1] = @"address";
  v28 = [NSNumber numberWithUnsignedLong:*(void *)(v34 + 40)];
  v51[1] = v28;
  v50[2] = @"name";
  uint64_t v29 = [*(id *)(v34 + 40) name];
  uint64_t v30 = (void *)v29;
  uint64_t v31 = &stru_1F3084718;
  if (v29) {
    uint64_t v31 = (__CFString *)v29;
  }
  v51[2] = v31;
  BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];

  return v32;
}

- (unint64_t)corner
{
  return self->_corner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_touchHistory, 0);
}

@end