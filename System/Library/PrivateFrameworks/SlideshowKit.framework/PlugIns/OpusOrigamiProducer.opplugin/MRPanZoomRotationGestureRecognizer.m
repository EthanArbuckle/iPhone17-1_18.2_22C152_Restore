@interface MRPanZoomRotationGestureRecognizer
- (MRPanZoomRotationGestureRecognizer)initWithRenderer:(id)a3 endAction:(id)a4 direction:(unsigned __int8)a5 andSender:(id)a6;
- (MRPanZoomRotationGestureRecognizer)initWithRenderer:(id)a3 masterAction:(id)a4 direction:(unsigned __int8)a5 andSender:(id)a6;
- (MRPanZoomRotationGestureRecognizer)initWithRenderer:(id)a3 startAction:(id)a4 direction:(unsigned __int8)a5 andSender:(id)a6;
- (double)progressThreshold;
- (double)trackingBoxRadius;
- (double)velocityThreshold;
- (unsigned)direction;
- (void)_addSpecificObjectToAction:(id)a3;
- (void)dealloc;
- (void)recognize;
- (void)setProgressThreshold:(double)a3;
- (void)setTrackingBoxRadius:(double)a3;
- (void)setVelocityThreshold:(double)a3;
- (void)touchEnded:(id)a3;
- (void)touchMoved:(id)a3;
@end

@implementation MRPanZoomRotationGestureRecognizer

- (MRPanZoomRotationGestureRecognizer)initWithRenderer:(id)a3 startAction:(id)a4 direction:(unsigned __int8)a5 andSender:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MRPanZoomRotationGestureRecognizer;
  result = [(MRGestureRecognizer *)&v8 initWithRenderer:a3 startAction:a4 andSender:a6];
  if (result)
  {
    result->_direction = a5;
    result->_trackingBoxRadius = -10.0;
    result->_progressThreshold = 1.0;
    result->_velocityThreshold = 300.0;
  }
  return result;
}

- (MRPanZoomRotationGestureRecognizer)initWithRenderer:(id)a3 endAction:(id)a4 direction:(unsigned __int8)a5 andSender:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MRPanZoomRotationGestureRecognizer;
  objc_super v8 = [(MRGestureRecognizer *)&v11 initWithRenderer:a3 startAction:0 andSender:a6];
  v9 = v8;
  if (v8)
  {
    v8->_direction = a5;
    [(MRGestureRecognizer *)v8 setEndAction:a4];
  }
  return v9;
}

- (MRPanZoomRotationGestureRecognizer)initWithRenderer:(id)a3 masterAction:(id)a4 direction:(unsigned __int8)a5 andSender:(id)a6
{
  v23.receiver = self;
  v23.super_class = (Class)MRPanZoomRotationGestureRecognizer;
  objc_super v8 = [(MRGestureRecognizer *)&v23 initWithRenderer:a3 startAction:0 andSender:a6];
  v9 = v8;
  if (v8)
  {
    v8->_direction = a5;
    v8->_isMaster = 1;
    id v10 = [a4 attributes];
    objc_super v11 = (NSString *)[v10 objectForKey:@"type"];
    v9->_type = v11;
    if ([(NSString *)v11 isEqualToString:@"panTransition"])
    {
      id v12 = objc_msgSend(objc_msgSend(a4, "attributes"), "objectForKey:", @"transitionAction");
      v13 = objc_alloc_init(MCActionTrigger);
      id v14 = [v12 objectForKey:@"targetIDInPage"];
      if (!v14) {
        id v14 = [a4 targetObjectID];
      }
      [(MCAction *)v13 setTargetObjectID:v14];
      -[MCActionTrigger setActionKey:](v13, "setActionKey:", [v12 objectForKey:@"actionKey"]);
      v15 = [[MRAction alloc] initWithAction:v13 inRenderer:v9->super._renderer];
      v9->super._automaticStartAction = v15;
      [(MRAction *)v15 setSender:v9->super._sender];

      id v16 = [v10 objectForKey:@"progressFactor"];
      if (v16)
      {
        [v16 floatValue];
        double v18 = v17 * 0.5;
      }
      else
      {
        double v18 = 0.5;
      }
      v9->_factor = v18;
      v19 = &selRef_abortTransition_;
      v20 = &selRef_finishTransition_;
      v21 = &selRef_updateTransition_;
      goto LABEL_13;
    }
    if ([(NSString *)v9->_type isEqualToString:@"effectPan"])
    {
      v9->super._automaticStartAction = -[MRAction initWithSelector:sender:andTargetPath:inRenderer:]([MRAction alloc], "initWithSelector:sender:andTargetPath:inRenderer:", "pzrStart:", v9->super._sender, [a4 targetObjectID], v9->super._renderer);
      v19 = &selRef_pzrCancel_;
      v20 = &selRef_pzrEnd_;
      v21 = &selRef_pzrUpdate_;
LABEL_13:
      v9->super._automaticUpdateAction = -[MRAction initWithSelector:sender:andTargetPath:inRenderer:]([MRAction alloc], "initWithSelector:sender:andTargetPath:inRenderer:", *v21, v9->super._sender, [a4 targetObjectID], v9->super._renderer);
      v9->super._automaticEndAction = -[MRAction initWithSelector:sender:andTargetPath:inRenderer:]([MRAction alloc], "initWithSelector:sender:andTargetPath:inRenderer:", *v20, v9->super._sender, [a4 targetObjectID], v9->super._renderer);
      v9->super._automaticCancelAction = -[MRAction initWithSelector:sender:andTargetPath:inRenderer:]([MRAction alloc], "initWithSelector:sender:andTargetPath:inRenderer:", *v19, v9->super._sender, [a4 targetObjectID], v9->super._renderer);
      return v9;
    }
    if ([(NSString *)v9->_type isEqualToString:@"fastScrub"])
    {
      v9->super._automaticStartAction = -[MRAction initWithSelector:sender:andTargetPath:inRenderer:]([MRAction alloc], "initWithSelector:sender:andTargetPath:inRenderer:", "fastScrubStart:", v9->super._sender, [a4 targetObjectID], v9->super._renderer);
      v19 = &selRef_fastScrubCancel_;
      v20 = &selRef_fastScrubEnd_;
      v21 = &selRef_fastScrubUpdate_;
      goto LABEL_13;
    }
  }
  return v9;
}

- (void)dealloc
{
  self->_type = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRPanZoomRotationGestureRecognizer;
  [(MRPanZoomRotationGestureRecognizer *)&v3 dealloc];
}

- (void)touchMoved:(id)a3
{
  v76.receiver = self;
  v76.super_class = (Class)MRPanZoomRotationGestureRecognizer;
  [(MRGestureRecognizer *)&v76 touchMoved:a3];
  int state = self->super._state;
  if ((state & 0x11) != 0)
  {
    if ((state & 4) == 0)
    {
      [(MRPanZoomRotationGestureRecognizer *)self _postProcess];
      double trackingBoxRadius = self->_trackingBoxRadius;
      if (trackingBoxRadius <= 0.0
        || ((double v5 = self->super._referenceSize.width
                * vabdd_f64(self->super._centroidLocation.x, self->super._centroidStartLocation.x)
                * 0.5,
             double trackingBoxRadius = trackingBoxRadius * 44.0,
             (self->_direction & 3) != 0)
          ? (_NF = v5 < trackingBoxRadius)
          : (_NF = 1),
            _NF))
      {
        [(MRGestureRecognizer *)self _sendUpdateActions];
      }
      else
      {
        self->super._state |= 4u;
        [(MRGestureRecognizer *)self _sendEndActions];
      }
    }
  }
  else
  {
    double referenceScale = self->super._referenceScale;
    double v9 = referenceScale * 10.0;
    double v10 = referenceScale * 7.5;
    __asm { FMOV            V1.2D, #0.5 }
    float64x2_t v75 = vmulq_f64(vmulq_f64(vsubq_f64((float64x2_t)self->super._centroidLocation, (float64x2_t)self->super._centroidStartLocation), (float64x2_t)self->super._referenceSize), _Q1);
    float64x2_t v15 = vabsq_f64(v75);
    float64x2_t v16 = v15;
    int v17 = v15.f64[1] < v9 && v15.f64[0] < v9;
    BOOL v18 = v15.f64[0] <= v15.f64[1];
    double v19 = self->super._scale + -1.0;
    [(MRTouchSet *)self->super._touchSet scale];
    double v21 = v19 * v20;
    double offsetFromRotation = self->super._offsetFromRotation;
    double v23 = fabs(v21);
    unsigned int direction = self->_direction;
    double v25 = fabs(offsetFromRotation);
    double v26 = -v9;
    BOOL v27 = v75.f64[0] <= -v9;
    if (v18) {
      BOOL v27 = 0;
    }
    if (v17) {
      BOOL v27 = 0;
    }
    if ((direction & 1) == 0) {
      BOOL v27 = 0;
    }
    if ((direction & 4) != 0) {
      int v28 = v17;
    }
    else {
      int v28 = 1;
    }
    if (v16.f64[0] > v16.f64[1]) {
      int v28 = 1;
    }
    int v29 = (direction >> 1) & ~v17 & (v16.f64[0] > v16.f64[1]);
    if (v75.f64[0] < v9) {
      int v29 = 0;
    }
    int v30 = (v75.f64[1] >= v9) & ~v28 | v29 | v27;
    if ((direction & 8) != 0) {
      char v31 = v17;
    }
    else {
      char v31 = 1;
    }
    BOOL v32 = v75.f64[1] <= v26;
    if (v16.f64[0] > v16.f64[1]) {
      BOOL v32 = 0;
    }
    BOOL v33 = (v31 & 1) == 0 && v32;
    int v34 = (v23 >= v10) & (direction >> 4);
    if (v21 < v10) {
      int v34 = 0;
    }
    int v35 = v34 | v33 | v30;
    double v73 = -v10;
    BOOL v36 = v21 <= -v10;
    if (v23 < v10) {
      BOOL v36 = 0;
    }
    if ((direction & 0x20) == 0) {
      BOOL v36 = 0;
    }
    BOOL v37 = (direction & 0x80u) != 0;
    double v74 = v25;
    int v38 = (v25 >= 0.05) & (direction >> 6);
    if (v25 < 0.05) {
      BOOL v37 = 0;
    }
    if (offsetFromRotation < 0.05) {
      int v38 = 0;
    }
    int v39 = v38 | v36;
    double v40 = self->super._offsetFromRotation;
    BOOL v41 = offsetFromRotation <= -0.05 && v37;
    int v42 = v41 | v39 | v35;
    if ([(MRGestureRecognizer *)self requiredTouchCount])
    {
      unsigned int v43 = [(MRGestureRecognizer *)self requiredTouchCount];
      BOOL v44 = (id)[(MRTouchSet *)self->super._touchSet countOfActiveTouches] == (id)v43;
    }
    else
    {
      BOOL v44 = 1;
    }
    unsigned int v45 = self->_direction;
    if (v45) {
      char v46 = v17;
    }
    else {
      char v46 = 1;
    }
    double v47 = v16.f64[0];
    int v48 = v75.f64[0] > v26 || v18;
    if (v46) {
      int v49 = 0;
    }
    else {
      int v49 = v48;
    }
    if ((v45 & 2) != 0) {
      char v50 = v17;
    }
    else {
      char v50 = 1;
    }
    int v51 = v75.f64[0] < v9 || v18;
    if (v50) {
      int v52 = 0;
    }
    else {
      int v52 = v51;
    }
    if ((v45 & 4) != 0) {
      char v53 = v17;
    }
    else {
      char v53 = 1;
    }
    BOOL v54 = v16.f64[0] > v16.f64[1];
    if (v75.f64[1] < v9) {
      BOOL v54 = 1;
    }
    BOOL v55 = (v53 & 1) == 0 && v54;
    if ((v45 & 8) != 0) {
      char v56 = v17;
    }
    else {
      char v56 = 1;
    }
    BOOL v57 = v16.f64[0] > v16.f64[1];
    if (v75.f64[1] > v26) {
      BOOL v57 = 1;
    }
    BOOL v58 = (v56 & 1) == 0 && v57;
    int v59 = (v23 >= v10) & (v45 >> 4);
    if (v21 >= v10) {
      int v59 = 0;
    }
    BOOL v60 = v21 > v73;
    if (v23 < v10) {
      BOOL v60 = 0;
    }
    if ((v45 & 0x20) == 0) {
      BOOL v60 = 0;
    }
    self->super._score = 0.0;
    if ((v42 & v44) != 0)
    {
      self->super._state |= 8u;
      unsigned __int8 v61 = self->_direction;
      if (v61) {
        int v62 = v17;
      }
      else {
        int v62 = 1;
      }
      if (((v62 | v18) & 1) == 0 && v75.f64[0] <= v26
        || ((self->_direction & 2) == 0 ? (int v63 = 1) : (int v63 = v17),
            (double v64 = 0.0, ((v63 | v18) & 1) == 0) && v75.f64[0] >= v9))
      {
        self->super._score = v16.f64[0];
        unsigned __int8 v61 = self->_direction;
        double v64 = v16.f64[0];
      }
      if ((v61 & 4) != 0) {
        char v65 = v17;
      }
      else {
        char v65 = 1;
      }
      if ((v65 & 1) == 0 && (v16.f64[0] <= v16.f64[1] ? (BOOL v66 = v75.f64[1] < v9) : (BOOL v66 = 1), !v66)
        || ((v61 & 8) == 0 ? (char v67 = 1) : (char v67 = v17), (v67 & 1) == 0 && v16.f64[0] <= v16.f64[1] && v75.f64[1] <= v26))
      {
        if (v64 < v16.f64[1]) {
          double v64 = v16.f64[1];
        }
        self->super._score = v64;
        unsigned __int8 v61 = self->_direction;
      }
      if ((v61 & 0x10) != 0 && v23 >= v10 && v21 >= v10 || (v61 & 0x20) != 0 && v23 >= v10 && v21 <= v73)
      {
        double v47 = fabs(v21 * 1.5);
        if (v64 < v47) {
          double v64 = v47;
        }
        self->super._score = v64;
        unsigned __int8 v61 = self->_direction;
      }
      if ((v61 & 0x40) != 0 && v74 >= 0.05 && v40 >= 0.05
        || (v61 & 0x80) != 0 && v74 >= 0.05 && (double v47 = v72, v40 <= v72))
      {
        double v47 = fabs(v40 * 50.0);
        if (v64 < v47) {
          double v64 = v47;
        }
        self->super._score = v64;
      }
      unint64_t v68 = [(MRTouchSet *)self->super._touchSet countOfActiveTouches];
      uint64_t requiredTouchCount = self->super._requiredTouchCount;
      if (v68 == requiredTouchCount) {
        self->super._score = self->super._score * (double)requiredTouchCount;
      }
    }
    else
    {
      BOOL v70 = (v45 & 0x80u) != 0;
      if (v74 < 0.05) {
        BOOL v70 = 0;
      }
      if (v40 <= v72) {
        BOOL v70 = 0;
      }
      int v71 = (v74 >= 0.05) & (v45 >> 6);
      if (v40 >= 0.05) {
        LOBYTE(v71) = 0;
      }
      if (v70 || (v71 & 1) != 0 || v59 | v49 | v52 | v55 | v58 | v60) {
        [(MRGestureRecognizer *)self abort];
      }
    }
  }
}

- (void)touchEnded:(id)a3
{
  if ((self->super._state & 4) != 0) {
    return;
  }
  if ((char *)[(NSSet *)[(MRTouchSet *)self->super._touchSet touches] count] != (char *)&dword_0 + 1)
  {
LABEL_8:
    v6.receiver = self;
    v6.super_class = (Class)MRPanZoomRotationGestureRecognizer;
    [(MRGestureRecognizer *)&v6 touchEnded:a3];
    return;
  }
  int state = self->super._state;
  if (state)
  {
    self->super._int state = state | 4;
    [(MRGestureRecognizer *)self _sendEndActions];
    goto LABEL_8;
  }
  [(MRGestureRecognizer *)self abort];
}

- (void)recognize
{
  self->super._int state = self->super._state & 0xFFFFFFE6 | 0x11;
  CGPoint offsetFromCentroid = self->super._offsetFromCentroid;
  self->super._centroidLocation = (CGPoint)vsubq_f64((float64x2_t)self->super._centroidLocation, (float64x2_t)offsetFromCentroid);
  self->super._previousCentroidLocation = (CGPoint)vsubq_f64((float64x2_t)self->super._previousCentroidLocation, (float64x2_t)offsetFromCentroid);
  self->super._centroidStartLocation = self->super._centroidLocation;
  self->super._CGPoint offsetFromCentroid = CGPointZero;
  self->super._previousScale = self->super._previousScale / self->super._scale;
  self->super._scale = 1.0;
  [(MRTouchSet *)self->super._touchSet scale];
  self->super._ratioFromScale = 1.0 / v4;
  self->super._previousRotation = self->super._previousRotation - self->super._rotation;
  self->super._rotation = 0.0;
  [(MRTouchSet *)self->super._touchSet rotation];
  self->super._double offsetFromRotation = 0.0 - v5;
  [(MRPanZoomRotationGestureRecognizer *)self _postProcess];
  [(MRGestureRecognizer *)self _sendStartActions];
}

- (void)_addSpecificObjectToAction:(id)a3
{
  int v29 = objc_alloc_init(MRGesturePanZoomRotation);
  [a3 time];
  v29->time = v5;
  *(CGPoint *)&v29->double x = self->super._centroidLocation;
  v29->double deltaX = self->super._centroidLocation.x - self->super._centroidStartLocation.x;
  v29->double deltaY = self->super._centroidLocation.y - self->super._centroidStartLocation.y;
  v29->double scale = self->super._scale;
  v29->double rotation = self->super._rotation;
  double hitTime = self->super._hitTime;
  double previousHitTime = self->super._previousHitTime;
  BOOL v8 = previousHitTime < hitTime;
  double v9 = 1.0 / (hitTime - previousHitTime);
  if (v8) {
    double v10 = v9;
  }
  else {
    double v10 = 1.0;
  }
  v29->double speedX = v10 * (self->super._centroidLocation.x - self->super._previousCentroidLocation.x);
  v29->double speedY = v10 * (self->super._centroidLocation.y - self->super._previousCentroidLocation.y);
  v29->double speedScale = pow(self->super._scale / self->super._previousScale, v10);
  v29->double speedRotation = v10 * (self->super._rotation - self->super._previousRotation);
  v29->unsigned int direction = self->_direction;
  v29->countOfTouches = [(NSSet *)[(MRTouchSet *)self->super._touchSet touches] count];
  v29->okToAnimate = 1;
  objc_msgSend(a3, "setSpecificObject:");
  double trackingBoxRadius = self->_trackingBoxRadius;
  if (trackingBoxRadius <= 0.0)
  {
    v29->double boxedProgress = -10.0;
  }
  else
  {
    double v12 = self->_progressThreshold * (self->super._referenceSize.width * 0.5) / (trackingBoxRadius * 44.0);
    v29->double boxedProgress = v29->deltaX * v12;
    v29->boxedVelocitdouble y = v12 * v29->speedX;
    if ((self->super._state & 4) != 0)
    {
      double v13 = v29->speedX * (self->super._referenceSize.width * 0.5);
      double boxedProgress = v29->boxedProgress;
      double v15 = fabs(boxedProgress);
      if (fabs(v13) >= self->_velocityThreshold) {
        char v16 = (v13 >= 0.0) ^ (boxedProgress < 0.0);
      }
      else {
        char v16 = 0;
      }
      if (v15 >= self->_progressThreshold) {
        char v16 = 1;
      }
      v29->forceFinish = v16;
    }
  }
  if ([a3 mcAction])
  {
    id v17 = [a3 states];
    double x = v29->x;
    *(float *)&double x = x;
    objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", x), @"_pzrX");
    double y = v29->y;
    *(float *)&double y = y;
    objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", y), @"_pzrY");
    unsigned int direction = self->_direction;
    if ((direction & 3) != 0)
    {
      double deltaX = v29->deltaX;
      *(float *)&double deltaX = deltaX;
      objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", deltaX), @"_pzrDeltaX");
      double speedX = v29->speedX;
      *(float *)&double speedX = speedX;
      objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", speedX), @"_pzrSpeedX");
      unsigned int direction = self->_direction;
    }
    if ((direction & 0xC) != 0)
    {
      double deltaY = v29->deltaY;
      *(float *)&double deltaY = deltaY;
      objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", deltaY), @"_pzrDeltaY");
      double speedY = v29->speedY;
      *(float *)&double speedY = speedY;
      objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", speedY), @"_pzrSpeedY");
      unsigned int direction = self->_direction;
    }
    if ((direction & 0x30) != 0)
    {
      double scale = v29->scale;
      *(float *)&double scale = scale;
      objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", scale), @"_pzrScale");
      double speedScale = v29->speedScale;
      *(float *)&double speedScale = speedScale;
      objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", speedScale), @"_pzrSpeedScale");
      unsigned int direction = self->_direction;
    }
    if (direction >= 0x40)
    {
      double rotation = v29->rotation;
      *(float *)&double rotation = rotation;
      objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", rotation), @"_pzrRotation");
      double speedRotation = v29->speedRotation;
      *(float *)&double speedRotation = speedRotation;
      objc_msgSend(v17, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", speedRotation), @"_pzrSpeedRotation");
    }
  }
}

- (unsigned)direction
{
  return self->_direction;
}

- (double)trackingBoxRadius
{
  return self->_trackingBoxRadius;
}

- (void)setTrackingBoxRadius:(double)a3
{
  self->_double trackingBoxRadius = a3;
}

- (double)progressThreshold
{
  return self->_progressThreshold;
}

- (void)setProgressThreshold:(double)a3
{
  self->_progressThreshold = a3;
}

- (double)velocityThreshold
{
  return self->_velocityThreshold;
}

- (void)setVelocityThreshold:(double)a3
{
  self->_velocityThreshold = a3;
}

@end