@interface _UIScreenEdgePanRecognizer
- (BOOL)hasRecordedData;
- (BOOL)recognizeAlongEdge;
- (BOOL)requiresFlatThumb;
- (BOOL)shouldUseGrapeFlags;
- (BOOL)useGrapeFlags;
- (CGPoint)_lastTouchLocation;
- (CGRect)screenBounds;
- (_UIScreenEdgePanRecognizer)initWithType:(int64_t)a3;
- (_UIScreenEdgePanRecognizer)initWithType:(int64_t)a3 settings:(id)a4;
- (_UIScreenEdgePanRecognizerDelegate)delegate;
- (_UIScreenEdgePanRecognizerSettings)settings;
- (int64_t)_type;
- (int64_t)state;
- (unint64_t)_targetEdges;
- (unint64_t)recognizedRegion;
- (unint64_t)targetEdges;
- (unint64_t)touchedEdgesForInterfaceOrientation:(int64_t)a3;
- (void)_idleTimerElapsed:(id)a3;
- (void)_incorporateIncrementalSampleAtLocation:(CGPoint)a3 timestamp:(double)a4 modifier:(int64_t)a5 region:(unint64_t)a6 interfaceOrientation:(int64_t)a7 forceState:(int64_t)a8;
- (void)_incorporateInitialTouchAtLocation:(CGPoint)a3 timestamp:(double)a4 modifier:(int64_t)a5 region:(unint64_t)a6 interfaceOrientation:(int64_t)a7 forceState:(int64_t)a8;
- (void)_longPressTimerElapsed:(id)a3;
- (void)_setState:(int64_t)a3;
- (void)dealloc;
- (void)incorporateTouchSampleAtLocation:(CGPoint)a3 timestamp:(double)a4 modifier:(int64_t)a5 region:(unint64_t)a6 interfaceOrientation:(int64_t)a7 forceState:(int64_t)a8;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setRecognizeAlongEdge:(BOOL)a3;
- (void)setRequiresFlatThumb:(BOOL)a3;
- (void)setScreenBounds:(CGRect)a3;
- (void)setSettings:(id)a3;
- (void)setShouldUseGrapeFlags:(BOOL)a3;
- (void)setTargetEdges:(unint64_t)a3;
@end

@implementation _UIScreenEdgePanRecognizer

- (_UIScreenEdgePanRecognizer)initWithType:(int64_t)a3 settings:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_UIScreenEdgePanRecognizer;
  v6 = [(_UIScreenEdgePanRecognizer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(_UIScreenEdgePanRecognizer *)v6 setTargetEdges:15];
    v7->_type = a3;
    objc_storeStrong((id *)&v7->_settings, a4);
    [(_UIScreenEdgePanRecognizer *)v7 setShouldUseGrapeFlags:1];
    v8 = v7;
  }

  return v7;
}

- (_UIScreenEdgePanRecognizer)initWithType:(int64_t)a3
{
  v5 = [(_UISettings *)[_UIScreenEdgePanRecognizerSettings alloc] initWithDefaultValues];
  v6 = [(_UIScreenEdgePanRecognizer *)self initWithType:a3 settings:v5];

  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_UIScreenEdgePanRecognizer;
  [(_UIScreenEdgePanRecognizer *)&v2 dealloc];
}

- (void)reset
{
  [(_UIScreenEdgePanRecognizer *)self _setState:0];
  *(_WORD *)&self->_hasRecordedData = 0;
  CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_initialTouchLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_initialTouchTimestamp = 0.0;
  self->_touchedRegion = 0;
  self->_lastTouchLocation = v3;
  self->_recognizedRegion = 0;
  self->_lastTouchTimestamp = 0.0;
  self->_lastTouchModifier = 0;
  recognitionTimer = self->_recognitionTimer;
  if (recognitionTimer)
  {
    [(UIDelayedAction *)recognitionTimer cancel];
    v5 = self->_recognitionTimer;
    self->_recognitionTimer = 0;
  }
}

- (BOOL)useGrapeFlags
{
  return self->_shouldUseGrapeFlags;
}

- (void)_setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      v6 = NSString;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      unint64_t v8 = self->_type - 1;
      if (v8 > 4) {
        v9 = @"unknown";
      }
      else {
        v9 = off_1E52F1190[v8];
      }
      objc_super v10 = [v6 stringWithFormat:@"%f (%@): ", v7, v9];
      v11 = v10;
      v12 = @"possible";
      if (a3 == 2) {
        v12 = @"failed";
      }
      if (a3 == 1) {
        v12 = @"recognized";
      }
      v13 = [v10 stringByAppendingFormat:@"Moving to state %@", v12];
      NSLog(&stru_1ED0F89C0.isa, v13);
    }
    self->_state = a3;
    if (objc_opt_respondsToSelector())
    {
      delegate = self->_delegate;
      [(_UIScreenEdgePanRecognizerDelegate *)delegate screenEdgePanRecognizerStateDidChange:self];
    }
  }
}

- (int64_t)_type
{
  return self->_type;
}

- (unint64_t)touchedEdgesForInterfaceOrientation:(int64_t)a3
{
  if (self->_state != 1) {
    return 0;
  }
  unint64_t touchedRegion = self->_touchedRegion;
  uint64_t v4 = 90;
  uint64_t v5 = -90;
  uint64_t v6 = 180;
  if (a3 != 2) {
    uint64_t v6 = 0;
  }
  if (a3 != 4) {
    uint64_t v5 = v6;
  }
  if (a3 != 3) {
    uint64_t v4 = v5;
  }
  if (a3 == 1) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v4;
  }
  return _rotatedEdgesGivenOrientationInDegrees(touchedRegion, v7);
}

- (void)incorporateTouchSampleAtLocation:(CGPoint)a3 timestamp:(double)a4 modifier:(int64_t)a5 region:(unint64_t)a6 interfaceOrientation:(int64_t)a7 forceState:(int64_t)a8
{
  if (!self->_state)
  {
    CGFloat x = a3.x;
    if (self->_lastTouchTimestamp != a4)
    {
      CGFloat y = a3.y;
      if (self->_hasRecordedData) {
        -[_UIScreenEdgePanRecognizer _incorporateIncrementalSampleAtLocation:timestamp:modifier:region:interfaceOrientation:forceState:](self, "_incorporateIncrementalSampleAtLocation:timestamp:modifier:region:interfaceOrientation:forceState:", a5, a6, a7, a8, a3.x, a3.y, a4);
      }
      else {
        -[_UIScreenEdgePanRecognizer _incorporateInitialTouchAtLocation:timestamp:modifier:region:interfaceOrientation:forceState:](self, "_incorporateInitialTouchAtLocation:timestamp:modifier:region:interfaceOrientation:forceState:", a5, a6, a7, a8, a3.x, a3.y, a4);
      }
      self->_lastTouchLocation.CGFloat x = x;
      self->_lastTouchLocation.CGFloat y = y;
      self->_lastTouchTimestamp = a4;
      self->_lastTouchModifier = a5;
      self->_hasRecordedData = 1;
    }
  }
}

- (void)_incorporateInitialTouchAtLocation:(CGPoint)a3 timestamp:(double)a4 modifier:(int64_t)a5 region:(unint64_t)a6 interfaceOrientation:(int64_t)a7 forceState:(int64_t)a8
{
  double y = a3.y;
  double x = a3.x;
  if ([(_UIScreenEdgePanRecognizer *)self useGrapeFlags])
  {
    [(_UIScreenEdgePanRecognizer *)self screenBounds];
    double v15 = v14 * 0.5;
    [(_UIScreenEdgePanRecognizer *)self screenBounds];
    if (v15 >= v16 * 0.5) {
      double v17 = v16 * 0.5;
    }
    else {
      double v17 = v15;
    }
  }
  else
  {
    v18 = [(_UIScreenEdgePanRecognizerSettings *)self->_settings edgeSettings];
    [v18 edgeRegionSize];
    double v17 = v19;
  }
  if (_UIScreenEdgePanRecognizerShouldLog())
  {
    v35 = NSString;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    unint64_t v37 = self->_type - 1;
    if (v37 > 4) {
      v38 = @"unknown";
    }
    else {
      v38 = off_1E52F1190[v37];
    }
    v39 = [v35 stringWithFormat:@"%f (%@): ", v36, v38];
    v40 = [v39 stringByAppendingFormat:@"performing initial check for touch at {%.1f, %.1f} with edge region %f", *(void *)&x, *(void *)&y, *(void *)&v17];
    NSLog(&stru_1ED0F89C0.isa, v40);
  }
  uint64_t v20 = _regionForLocation(self->_screenBounds.origin.x, self->_screenBounds.origin.y, self->_screenBounds.size.width, self->_screenBounds.size.height, x, y, v17);
  unint64_t v21 = [(_UIScreenEdgePanRecognizer *)self _targetEdges];
  if (a7 == 4)
  {
    unint64_t v23 = ((2 * v21) | (v21 >> 3) & 1) & v20;
    self->_unint64_t touchedRegion = v23;
    uint64_t v22 = -90;
  }
  else if (a7 == 3)
  {
    unint64_t v23 = ((8 * v21) | (v21 >> 1) & 7) & v20;
    self->_unint64_t touchedRegion = v23;
    uint64_t v22 = 90;
  }
  else
  {
    if (a7 == 1)
    {
      uint64_t v22 = 0;
    }
    else
    {
      if (a7 == 2) {
        uint64_t v24 = -180;
      }
      else {
        uint64_t v24 = 0;
      }
      if (a7 == 2) {
        uint64_t v22 = 180;
      }
      else {
        uint64_t v22 = 0;
      }
      unint64_t v21 = _rotatedEdgesGivenOrientationInDegrees(v21, v24);
    }
    unint64_t v23 = v21 & v20;
    self->_unint64_t touchedRegion = v23;
  }
  unint64_t v25 = _rotatedEdgesGivenOrientationInDegrees(v23, v22);
  BOOL v26 = [(_UIScreenEdgePanRecognizer *)self useGrapeFlags];
  if ((unint64_t)(a5 - 5) <= 0xFFFFFFFFFFFFFFFBLL && v26)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      v27 = NSString;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      unint64_t v29 = self->_type - 1;
      if (v29 > 4) {
        v30 = @"unknown";
      }
      else {
        v30 = off_1E52F1190[v29];
      }
      v41 = [v27 stringWithFormat:@"%f (%@): ", v28, v30];
      v42 = [v41 stringByAppendingFormat:@"failed modifier flag check (got %@)", @"_UIScreenEdgePanRecognizerTouchModifierNone"];
      NSLog(&stru_1ED0F89C0.isa, v42);
LABEL_48:

      goto LABEL_30;
    }
    goto LABEL_30;
  }
  if (([(_UIScreenEdgePanRecognizer *)self _targetEdges] & v25) == 0)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      v43 = NSString;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      unint64_t v45 = self->_type - 1;
      if (v45 > 4) {
        v46 = @"unknown";
      }
      else {
        v46 = off_1E52F1190[v45];
      }
      v41 = [v43 stringWithFormat:@"%f (%@): ", v44, v46];
      v42 = _formatRegion([(_UIScreenEdgePanRecognizer *)self _targetEdges]);
      v47 = _formatRegion(v25);
      v48 = [v41 stringByAppendingFormat:@"failed region check (expected %@, got %@)", v42, v47];
      NSLog(&stru_1ED0F89C0.isa, v48);

      goto LABEL_48;
    }
LABEL_30:
    [(_UIScreenEdgePanRecognizer *)self _setState:2];
    return;
  }
  self->_initialTouchLocation.double x = x;
  self->_initialTouchLocation.double y = y;
  self->_initialTouchTimestamp = a4;
  self->_initialInterfaceOrientation = a7;
  if (!self->_recognizeAlongEdge)
  {
    unint64_t type = self->_type;
    if (type <= 5 && ((1 << type) & 0x2C) != 0)
    {
      v32 = [UIDelayedAction alloc];
      id v49 = [(_UIScreenEdgePanRecognizerSettings *)self->_settings edgeSettings];
      [v49 maximumSwipeDuration];
      v33 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v32, "initWithTarget:action:userInfo:delay:mode:", self, sel__idleTimerElapsed_, 0, *MEMORY[0x1E4F1C4B0]);
      recognitionTimer = self->_recognitionTimer;
      self->_recognitionTimer = v33;
    }
  }
}

- (void)_incorporateIncrementalSampleAtLocation:(CGPoint)a3 timestamp:(double)a4 modifier:(int64_t)a5 region:(unint64_t)a6 interfaceOrientation:(int64_t)a7 forceState:(int64_t)a8
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_recognizeAlongEdge
    && sqrt((self->_lastTouchLocation.x - a3.x) * (self->_lastTouchLocation.x - a3.x)+ (self->_lastTouchLocation.y - a3.y) * (self->_lastTouchLocation.y - a3.y)) > 100.0)
  {
    int64_t type = self->_type;
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      double v17 = NSString;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      if ((unint64_t)(type - 1) > 4) {
        double v19 = @"unknown";
      }
      else {
        double v19 = off_1E52F1190[type - 1];
      }
      v85 = [v17 stringWithFormat:@"%f (%@): ", v18, v19];
      v86 = v85;
      v87 = @"Touches have teleported";
LABEL_125:
      objc_msgSend(v85, "stringByAppendingFormat:", v87, *(void *)&v111, *(void *)&v112);
      v101 = LABEL_126:;
      NSLog(&stru_1ED0F89C0.isa, v101);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (!a5 && self->_lastTouchModifier == 3) {
    goto LABEL_8;
  }
  BOOL v22 = [(_UIScreenEdgePanRecognizer *)self useGrapeFlags];
  BOOL v23 = a5 == 3 && v22;
  BOOL v24 = [(_UIScreenEdgePanRecognizer *)self useGrapeFlags];
  BOOL v25 = a5 == 4 && v24;
  if (!self->_hasDoneInitialBackProjectionTest && !v23)
  {
    unint64_t v26 = [(_UIScreenEdgePanRecognizer *)self _targetEdges];
    uint64_t v27 = -90;
    uint64_t v28 = 90;
    uint64_t v29 = -180;
    if (a7 != 2) {
      uint64_t v29 = 0;
    }
    if (a7 != 4) {
      uint64_t v28 = v29;
    }
    if (a7 != 3) {
      uint64_t v27 = v28;
    }
    if (a7 == 1) {
      uint64_t v30 = 0;
    }
    else {
      uint64_t v30 = v27;
    }
    unint64_t v31 = _rotatedEdgesGivenOrientationInDegrees(v26, v30);
    if (a6) {
      BOOL v32 = v25;
    }
    else {
      BOOL v32 = 0;
    }
    if (!v32)
    {
      double v33 = a4 - self->_initialTouchTimestamp;
      double v34 = self->_initialTouchLocation.x - v33 * ((x - self->_initialTouchLocation.x) / v33);
      double v35 = self->_initialTouchLocation.y - v33 * ((y - self->_initialTouchLocation.y) / v33);
      uint64_t v36 = [(_UIScreenEdgePanRecognizerSettings *)self->_settings edgeSettings];
      [v36 edgeRegionSize];
      double v38 = v37;

      uint64_t v39 = 90;
      uint64_t v40 = -90;
      uint64_t v41 = 180;
      if (a7 != 2) {
        uint64_t v41 = 0;
      }
      if (a7 != 4) {
        uint64_t v40 = v41;
      }
      if (a7 != 3) {
        uint64_t v39 = v40;
      }
      if (a7 == 1) {
        uint64_t v42 = 0;
      }
      else {
        uint64_t v42 = v39;
      }
      if (_rotatedEdgesGivenOrientationInDegrees(self->_touchedRegion, v42) == 4)
      {
        v43 = [(_UIScreenEdgePanRecognizerSettings *)self->_settings edgeSettings];
        [v43 bottomEdgeRegionSize];
        double v38 = v44;
      }
      a6 = _regionForLocation(self->_screenBounds.origin.x, self->_screenBounds.origin.y, self->_screenBounds.size.width, self->_screenBounds.size.height, v34, v35, v38);
    }
    self->_unint64_t touchedRegion = a6 & v31;
    if ((a6 & v31) == 0)
    {
      if (_UIScreenEdgePanRecognizerShouldLog())
      {
        v54 = NSString;
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        unint64_t v56 = self->_type - 1;
        if (v56 > 4) {
          v57 = @"unknown";
        }
        else {
          v57 = off_1E52F1190[v56];
        }
        v85 = [v54 stringWithFormat:@"%f (%@): ", v55, v57];
        v86 = v85;
        CGFloat v111 = self->_initialTouchLocation.x;
        CGFloat v112 = self->_initialTouchLocation.y;
        v87 = @"Touched outside target edge region ({%.1f, %.1f})";
        goto LABEL_125;
      }
LABEL_8:
      uint64_t v20 = self;
      uint64_t v21 = 2;
LABEL_9:
      [(_UIScreenEdgePanRecognizer *)v20 _setState:v21];
      return;
    }
    self->_hasDoneInitialBackProjectionTest = 1;
  }
  if (self->_recognizeAlongEdge
    || (unint64_t touchedRegion = self->_touchedRegion, touchedRegion <= 0xC) && ((1 << touchedRegion) & 0x1248) != 0)
  {
    double v46 = sqrt((self->_initialTouchLocation.x - x) * (self->_initialTouchLocation.x - x)+ (self->_initialTouchLocation.y - y) * (self->_initialTouchLocation.y - y));
    double v47 = 0.0;
  }
  else if ((touchedRegion & 0xA) != 0)
  {
    double v46 = vabdd_f64(x, self->_initialTouchLocation.x);
    double v47 = vabdd_f64(y, self->_initialTouchLocation.y);
  }
  else
  {
    double v46 = vabdd_f64(y, self->_initialTouchLocation.y);
    double v47 = vabdd_f64(x, self->_initialTouchLocation.x);
  }
  v48 = [(_UIScreenEdgePanRecognizerSettings *)self->_settings edgeSettings];
  [v48 edgeAngleWindow];
  double v50 = v49;

  unint64_t v51 = self->_touchedRegion;
  if (v51 <= 0xC && ((1 << v51) & 0x1248) != 0)
  {
    v52 = [(_UIScreenEdgePanRecognizerSettings *)self->_settings cornerSettings];
    [v52 cornerAngleWindow];
    double v50 = v53;
  }
  else if (v51 == 4)
  {
    double v50 = 2.0943951;
  }
  v58 = [(_UIScreenEdgePanRecognizerSettings *)self->_settings edgeSettings];
  [v58 hysteresis];
  double v60 = v59;

  if (v60 <= 0.0)
  {
    if (a8 == 2 || self->_type != 4)
    {
      [(_UIScreenEdgePanRecognizer *)self _setState:1];
      return;
    }
    double initialTouchTimestamp = self->_initialTouchTimestamp;
    v69 = [(_UIScreenEdgePanRecognizerSettings *)self->_settings edgeSettings];
    [v69 edgeAngleWindowDecayTime];
    double v71 = v70;
    double v72 = 10.0 / tan(v50 * -0.5 + 1.57079633);
  }
  else
  {
    if (v46 > v60)
    {
      int64_t v61 = self->_type;
      unint64_t v62 = self->_touchedRegion;
      long double v63 = atan2(y - self->_initialTouchLocation.y, x - self->_initialTouchLocation.x);
      double v64 = 0.0;
      if (v62 - 1 <= 0xB) {
        double v64 = dbl_186B96C60[v62 - 1];
      }
      if (_UIScreenEdgePanRecognizerShouldLog())
      {
        unint64_t v118 = v62;
        v88 = NSString;
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        int64_t v114 = v61;
        if ((unint64_t)(v61 - 1) > 4) {
          v90 = @"unknown";
        }
        else {
          v90 = off_1E52F1190[v61 - 1];
        }
        v97 = [v88 stringWithFormat:@"%f (%@): ", v89, v90];
        v98 = objc_msgSend(v97, "stringByAppendingFormat:", @"Checking angle %f against %f around %f", v63 * 57.2957795, v50 * 57.2957795, v64 * 57.2957795);
        NSLog(&stru_1ED0F89C0.isa, v98);

        int64_t v61 = v114;
        unint64_t v62 = v118;
      }
      double v65 = fabs(remainder(v63 - v64, 6.28318531));
      double v66 = v50 * 0.5;
      if (_UIScreenEdgePanRecognizerShouldLog())
      {
        unint64_t v119 = v62;
        v91 = NSString;
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        int64_t v115 = v61;
        if ((unint64_t)(v61 - 1) > 4) {
          v93 = @"unknown";
        }
        else {
          v93 = off_1E52F1190[v61 - 1];
        }
        v99 = [v91 stringWithFormat:@"%f (%@): ", v92, v93];
        objc_msgSend(v99, "stringByAppendingFormat:", @"Comparing angles (%f vs %f) Imperfection: %f; threshold: %f",
          v63 * 57.2957795,
          v64 * 57.2957795,
          v65 * 57.2957795,
        v100 = v66 * 57.2957795);
        NSLog(&stru_1ED0F89C0.isa, v100);

        int64_t v61 = v115;
        unint64_t v62 = v119;
      }
      if (v65 >= v66)
      {
        if (_UIScreenEdgePanRecognizerShouldLog())
        {
          unint64_t v120 = v62;
          v94 = NSString;
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          int64_t v116 = v61;
          if ((unint64_t)(v61 - 1) > 4) {
            v96 = @"unknown";
          }
          else {
            v96 = off_1E52F1190[v61 - 1];
          }
          v105 = [v94 stringWithFormat:@"%f (%@): ", v95, v96];
          v106 = objc_msgSend(v105, "stringByAppendingFormat:", @"failed angle %.0f from ideal. threshold is %.0f", v65 * 57.2957795, v66 * 57.2957795);
          NSLog(&stru_1ED0F89C0.isa, v106);

          int64_t v61 = v116;
          unint64_t v62 = v120;
        }
        unint64_t v67 = 0;
        if (v62 <= 0xC && ((1 << v62) & 0x1248) != 0)
        {
          int __z = 0;
          remquo(v63, 1.57079633, &__z);
          if (__z < 0) {
            __z += 4;
          }
          if (_UIScreenEdgePanRecognizerShouldLog())
          {
            unint64_t v121 = v62;
            BOOL v117 = v23;
            v102 = NSString;
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            if ((unint64_t)(v61 - 1) > 4) {
              v104 = @"unknown";
            }
            else {
              v104 = off_1E52F1190[v61 - 1];
            }
            v107 = [v102 stringWithFormat:@"%f (%@): ", v103, v104];
            if (__z > 3) {
              uint64_t v108 = 0;
            }
            else {
              uint64_t v108 = qword_186B96CC0[__z];
            }
            v109 = _formatRegion(v108);
            v110 = [v107 stringByAppendingFormat:@"Corner gesture being interpreted as %@", v109];
            NSLog(&stru_1ED0F89C0.isa, v110);

            BOOL v23 = v117;
            unint64_t v62 = v121;
          }
          if (__z > 3) {
            uint64_t v79 = 0;
          }
          else {
            uint64_t v79 = qword_186B96CC0[__z];
          }
          unint64_t v67 = v79 & v62;
        }
      }
      else
      {
        unint64_t v67 = v62;
      }
      switch(a7)
      {
        case 1:
          uint64_t v80 = 0;
          break;
        case 3:
          uint64_t v80 = 90;
          break;
        case 4:
          uint64_t v80 = -90;
          break;
        case 2:
          uint64_t v80 = 180;
          break;
        default:
          uint64_t v80 = 0;
          break;
      }
      unint64_t v81 = _rotatedEdgesGivenOrientationInDegrees(v67, v80);
      self->_recognizedRegion = v81;
      if (!self->_recognizeAlongEdge)
      {
        unint64_t v82 = v81;
        unint64_t v83 = self->_type - 6;
        unint64_t v84 = [(_UIScreenEdgePanRecognizer *)self _targetEdges];
        if (v83 > 0xFFFFFFFFFFFFFFFCLL)
        {
          if ((v84 & v82) == 0) {
            goto LABEL_8;
          }
        }
        else if (v82 != v84)
        {
          goto LABEL_8;
        }
      }
      if (!v23 && (a8 == 2 || self->_type != 4))
      {
        uint64_t v20 = self;
        uint64_t v21 = 1;
        goto LABEL_9;
      }
      return;
    }
    double initialTouchTimestamp = self->_initialTouchTimestamp;
    v69 = [(_UIScreenEdgePanRecognizerSettings *)self->_settings edgeSettings];
    [v69 edgeAngleWindowDecayTime];
    double v71 = v73;
    double v72 = v60 / tan(v50 * -0.5 + 1.57079633);
  }
  double v74 = fmax(v72 * (1.0 - (a4 - initialTouchTimestamp) * (1.0 / v71)), 20.0);

  if (v47 > v74)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      v75 = NSString;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      unint64_t v77 = self->_type - 1;
      if (v77 > 4) {
        v78 = @"unknown";
      }
      else {
        v78 = off_1E52F1190[v77];
      }
      v86 = [v75 stringWithFormat:@"%f (%@): ", v76, v78];
      objc_msgSend(v86, "stringByAppendingFormat:", @"too much movement on non-target axis (%f)", *(void *)&v47, v113);
      goto LABEL_126;
    }
    goto LABEL_8;
  }
}

- (void)_longPressTimerElapsed:(id)a3
{
  if (!self->_state)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      uint64_t v4 = NSString;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      unint64_t v6 = self->_type - 1;
      if (v6 > 4) {
        uint64_t v7 = @"unknown";
      }
      else {
        uint64_t v7 = off_1E52F1190[v6];
      }
      unint64_t v8 = [v4 stringWithFormat:@"%f (%@): ", v5, v7];
      v9 = [v8 stringByAppendingFormat:@"User has dwelled long enough"];
      NSLog(&stru_1ED0F89C0.isa, v9);
    }
    [(_UIScreenEdgePanRecognizer *)self _setState:1];
  }
}

- (void)_idleTimerElapsed:(id)a3
{
  if (!self->_state)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      uint64_t v4 = NSString;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      unint64_t v6 = self->_type - 1;
      if (v6 > 4) {
        uint64_t v7 = @"unknown";
      }
      else {
        uint64_t v7 = off_1E52F1190[v6];
      }
      unint64_t v8 = [v4 stringWithFormat:@"%f (%@): ", v5, v7];
      v9 = [v8 stringByAppendingFormat:@"Finger was idle too long"];
      NSLog(&stru_1ED0F89C0.isa, v9);
    }
    [(_UIScreenEdgePanRecognizer *)self _setState:2];
  }
}

- (void)setScreenBounds:(CGRect)a3
{
  self->_screenBounds = a3;
  [(_UIScreenEdgePanRecognizer *)self reset];
}

- (void)setSettings:(id)a3
{
}

- (void)setTargetEdges:(unint64_t)a3
{
  self->_targetEdges = a3;
  [(_UIScreenEdgePanRecognizer *)self reset];
}

- (unint64_t)_targetEdges
{
  return self->_targetEdges;
}

- (BOOL)shouldUseGrapeFlags
{
  return self->_shouldUseGrapeFlags;
}

- (void)setShouldUseGrapeFlags:(BOOL)a3
{
  self->_shouldUseGrapeFlags = a3;
}

- (BOOL)hasRecordedData
{
  return self->_hasRecordedData;
}

- (CGPoint)_lastTouchLocation
{
  double x = self->_lastTouchLocation.x;
  double y = self->_lastTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (_UIScreenEdgePanRecognizerSettings)settings
{
  return self->_settings;
}

- (CGRect)screenBounds
{
  double x = self->_screenBounds.origin.x;
  double y = self->_screenBounds.origin.y;
  double width = self->_screenBounds.size.width;
  double height = self->_screenBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)targetEdges
{
  return self->_targetEdges;
}

- (BOOL)requiresFlatThumb
{
  return self->_requiresFlatThumb;
}

- (void)setRequiresFlatThumb:(BOOL)a3
{
  self->_requiresFlatThumb = a3;
}

- (BOOL)recognizeAlongEdge
{
  return self->_recognizeAlongEdge;
}

- (void)setRecognizeAlongEdge:(BOOL)a3
{
  self->_recognizeAlongEdge = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (unint64_t)recognizedRegion
{
  return self->_recognizedRegion;
}

- (_UIScreenEdgePanRecognizerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIScreenEdgePanRecognizerDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_recognitionTimer, 0);
}

@end