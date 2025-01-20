@interface VKGestureCameraBehavior
- (BOOL)allowsZoomRubberbanding;
- (BOOL)isGesturing;
- (BOOL)isPanning;
- (BOOL)isPinching;
- (BOOL)isPitching;
- (BOOL)isRotating;
- (BOOL)tapAtPoint:(CGPoint)a3;
- (VKGestureCameraBehavior)initWithCameraController:(id)a3;
- (void)setAllowsZoomRubberbanding:(BOOL)a3;
- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4;
- (void)startPinchingWithFocusPoint:(CGPoint)a3;
- (void)startPitchingWithFocusPoint:(CGPoint)a3;
- (void)startRotatingWithFocusPoint:(CGPoint)a3;
- (void)stopPanningAtPoint:(CGPoint)a3;
- (void)stopPinchingWithFocusPoint:(CGPoint)a3;
- (void)stopPitchingWithFocusPoint:(CGPoint)a3;
- (void)stopRotatingWithFocusPoint:(CGPoint)a3;
- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5;
- (void)transferGestureState:(id)a3;
- (void)updatePanWithTranslation:(CGPoint)a3;
- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4;
- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4;
- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4;
- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5;
@end

@implementation VKGestureCameraBehavior

- (BOOL)isPinching
{
  return self->_pinching;
}

- (VKGestureCameraBehavior)initWithCameraController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKGestureCameraBehavior;
  v5 = [(VKGestureCameraBehavior *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cameraController, v4);
    v6->_notifyCameraStateChanges = 1;
    v7 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (void)setAllowsZoomRubberbanding:(BOOL)a3
{
  self->_allowsZoomRubberbanding = a3;
}

- (BOOL)allowsZoomRubberbanding
{
  return self->_allowsZoomRubberbanding;
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (BOOL)isPanning
{
  return self->_panning;
}

- (BOOL)isPitching
{
  return self->_pitching;
}

- (BOOL)isGesturing
{
  if (self->_panning) {
    return 1;
  }
  if (self->_rotating) {
    return 1;
  }
  if (self->_pinching) {
    return 1;
  }
  return self->_pitching;
}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)stopPitchingWithFocusPoint:(CGPoint)a3
{
  self->_pitching = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  [WeakRetained centerScreenPoint];
  double v6 = v5;
  double v8 = v7;

  -[VKGestureCameraBehavior endPitch:](self, "endPitch:", v6, v8);
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4
{
  p_cameraController = &self->_cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  [WeakRetained centerScreenPoint];
  double v8 = v7;
  double v10 = v9;

  -[VKGestureCameraBehavior updatePitch:degrees:](self, "updatePitch:degrees:", v8, v10, a4);
  if (self->_notifyCameraStateChanges)
  {
    id v14 = objc_loadWeakRetained((id *)p_cameraController);
    v11 = [v14 cameraDelegate];
    [v11 mapLayerDidChangeVisibleRegion];

    id v15 = objc_loadWeakRetained((id *)p_cameraController);
    uint64_t v12 = *(void *)[v15 runLoopController];
    if (v12)
    {
      char v16 = 4;
      md::MapEngine::setNeedsTick(v12, &v16);
    }
  }
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4
{
  p_cameraController = &self->_cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  [WeakRetained centerScreenPoint];
  double v8 = v7;
  double v10 = v9;

  -[VKGestureCameraBehavior updatePitch:translation:](self, "updatePitch:translation:", v8, v10, a4 * 0.005);
  if (self->_notifyCameraStateChanges)
  {
    id v14 = objc_loadWeakRetained((id *)p_cameraController);
    v11 = [v14 cameraDelegate];
    [v11 mapLayerDidChangeVisibleRegion];

    id v15 = objc_loadWeakRetained((id *)p_cameraController);
    uint64_t v12 = *(void *)[v15 runLoopController];
    if (v12)
    {
      char v16 = 4;
      md::MapEngine::setNeedsTick(v12, &v16);
    }
  }
}

- (void)startPitchingWithFocusPoint:(CGPoint)a3
{
  self->_pitching = 1;
  self->_pitchStartFocusPoint = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  [WeakRetained centerScreenPoint];
  double v6 = v5;
  double v8 = v7;

  self->_pitchStartScreenPoint.x = v6;
  self->_pitchStartScreenPoint.y = v8;
  -[VKGestureCameraBehavior beginPitch:](self, "beginPitch:", v6, v8);
}

- (void)stopRotatingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_cameraController = &self->_cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  int v8 = [WeakRetained staysCenteredDuringPinch];

  id v9 = objc_loadWeakRetained((id *)p_cameraController);
  double v10 = v9;
  if (v8) {
    [v9 centerScreenPoint];
  }
  else {
    objc_msgSend(v9, "scaledScreenPointForPoint:", x, y);
  }
  double v13 = v11;
  double v14 = v12;

  -[VKGestureCameraBehavior endRotate:](self, "endRotate:", v13, v14);
}

- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  p_cameraController = &self->_cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  int v9 = [WeakRetained staysCenteredDuringPinch];

  id v10 = objc_loadWeakRetained((id *)p_cameraController);
  if (v9) {
    objc_msgSend(v10, "centerScreenPoint", v10);
  }
  else {
    objc_msgSend(v10, "scaledScreenPointForPoint:", x, y, v10);
  }
  double v13 = v11;
  double v14 = v12;

  if (self->_shouldRotationRubberband)
  {
    double v15 = fabs(a4);
    if (v15 > 0.392699082) {
      double v15 = -0.261799388 / (v15 * 2.10084525 + 0.175) + 0.65449847;
    }
    if (a4 >= 0.0) {
      a4 = v15;
    }
    else {
      a4 = -v15;
    }
  }
  long double v16 = fmod(a4 + 3.14159265 - self->_lastRotation, 6.28318531);
  long double v17 = fmod(v16 + 6.28318531, 6.28318531);
  self->_lastRotation = a4;
  -[VKGestureCameraBehavior updateRotate:atScreenPoint:](self, "updateRotate:atScreenPoint:", (double)(v17 + -3.14159265), v13, v14);
  if (self->_notifyCameraStateChanges)
  {
    id v22 = objc_loadWeakRetained((id *)p_cameraController);
    v18 = [v22 cameraDelegate];
    [v18 mapLayerDidChangeVisibleRegion];

    id v23 = objc_loadWeakRetained((id *)p_cameraController);
    uint64_t v19 = *(void *)[v23 runLoopController];
    if (v19)
    {
      char v24 = 4;
      md::MapEngine::setNeedsTick(v19, &v24);
    }
  }
}

- (void)startRotatingWithFocusPoint:(CGPoint)a3
{
  self->_rotateStartFocusPoint = a3;
  p_cameraController = &self->_cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  int v6 = [WeakRetained staysCenteredDuringPinch];

  id v7 = objc_loadWeakRetained((id *)p_cameraController);
  int v8 = v7;
  if (v6) {
    [v7 centerScreenPoint];
  }
  else {
    objc_msgSend(v7, "scaledScreenPointForPoint:", self->_rotateStartFocusPoint.x, self->_rotateStartFocusPoint.y);
  }
  double v11 = v9;
  double v12 = v10;

  self->_lastRotation = 0.0;
  id v13 = objc_loadWeakRetained((id *)p_cameraController);
  [v13 currentZoomLevel];
  self->_shouldRotationRubberband = v14 <= 6.0;

  -[VKGestureCameraBehavior beginRotate:](self, "beginRotate:", v11, v12);
}

- (void)stopPanningAtPoint:(CGPoint)a3
{
  self->_panning = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  [WeakRetained centerScreenPoint];
  -[VKGestureCameraBehavior endPan:](self, "endPan:");
}

- (void)updatePanWithTranslation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_cameraController = &self->_cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  int v8 = [WeakRetained canvas];
  [v8 size];
  double v10 = v9;

  id v11 = objc_loadWeakRetained((id *)p_cameraController);
  double v12 = [v11 canvas];
  [v12 size];
  double v14 = v13;

  double v15 = self->_panStartScreenPoint.x + x / v10;
  double v16 = self->_panStartScreenPoint.y - y / v14;
  -[VKGestureCameraBehavior updatePan:lastScreenPoint:](self, "updatePan:lastScreenPoint:", v15, v16, self->_panLastScreenPoint.x, self->_panLastScreenPoint.y);
  if (self->_notifyCameraStateChanges)
  {
    id v17 = objc_loadWeakRetained((id *)p_cameraController);
    v18 = [v17 cameraDelegate];
    [v18 mapLayerDidChangeVisibleRegion];

    id v19 = objc_loadWeakRetained((id *)p_cameraController);
    uint64_t v20 = *(void *)[v19 runLoopController];
    if (v20)
    {
      char v21 = 4;
      md::MapEngine::setNeedsTick(v20, &v21);
    }
  }
  self->_panLastScreenPoint.double x = v15;
  self->_panLastScreenPoint.double y = v16;
}

- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4
{
  self->_panStartFocusPoint = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  objc_msgSend(WeakRetained, "scaledScreenPointForPoint:", self->_panStartFocusPoint.x, self->_panStartFocusPoint.y);
  double v7 = v6;
  double v9 = v8;

  self->_panStartScreenPoint.double x = v7;
  self->_panStartScreenPoint.double y = v9;
  self->_panLastScreenPoint.double x = v7;
  self->_panLastScreenPoint.double y = v9;
  self->_panning = 1;
  -[VKGestureCameraBehavior beginPan:](self, "beginPan:", v7, v9);
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  self->_pinching = 0;
  p_cameraController = &self->_cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  int v8 = [WeakRetained staysCenteredDuringPinch];

  id v9 = objc_loadWeakRetained((id *)p_cameraController);
  double v10 = v9;
  if (v8) {
    [v9 centerScreenPoint];
  }
  else {
    objc_msgSend(v9, "scaledScreenPointForPoint:", x, y);
  }
  double v13 = v11;
  double v14 = v12;

  -[VKGestureCameraBehavior endZoom:](self, "endZoom:", v13, v14);
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double x = a3.x;
  if (a5 >= 0.01)
  {
    double y = a3.y;
    p_cameraController = &self->_cameraController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
    int v11 = [WeakRetained staysCenteredDuringPinch];

    id v12 = objc_loadWeakRetained((id *)p_cameraController);
    if (v11) {
      objc_msgSend(v12, "centerScreenPoint", v12);
    }
    else {
      objc_msgSend(v12, "scaledScreenPointForPoint:", x, y, v12);
    }
    double v15 = v13;
    double v16 = v14;

    -[VKGestureCameraBehavior updateZoom:oldFactor:newFactor:](self, "updateZoom:oldFactor:newFactor:", v15, v16, a4, a5);
    if (self->_notifyCameraStateChanges)
    {
      id v21 = objc_loadWeakRetained((id *)p_cameraController);
      id v17 = [v21 cameraDelegate];
      [v17 mapLayerDidChangeVisibleRegion];

      id v22 = objc_loadWeakRetained((id *)p_cameraController);
      uint64_t v18 = *(void *)[v22 runLoopController];
      if (v18)
      {
        char v23 = 4;
        md::MapEngine::setNeedsTick(v18, &v23);
      }
    }
  }
}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  self->_pinching = 1;
  self->_pinchStartFocusPoint = a3;
  p_cameraController = &self->_cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  int v8 = [WeakRetained staysCenteredDuringPinch];

  id v9 = objc_loadWeakRetained((id *)p_cameraController);
  double v10 = v9;
  if (v8) {
    [v9 centerScreenPoint];
  }
  else {
    objc_msgSend(v9, "scaledScreenPointForPoint:", x, y);
  }
  double v13 = v11;
  double v14 = v12;

  -[VKGestureCameraBehavior beginZoom:](self, "beginZoom:", v13, v14);
}

- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5
{
  double v5 = (void (**)(void))a5;
  if (v5) {
    v5[2]();
  }
}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v17 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraController);
  int v10 = [WeakRetained staysCenteredDuringPinch];

  id v11 = objc_loadWeakRetained((id *)&self->_cameraController);
  double v12 = v11;
  if (v10) {
    [v11 centerScreenPoint];
  }
  else {
    objc_msgSend(v11, "scaledScreenPointForPoint:", x, y);
  }
  double v15 = v13;
  double v16 = v14;

  -[VKGestureCameraBehavior tapZoom:levels:completionHandler:](self, "tapZoom:levels:completionHandler:", v17, v15, v16, a3);
}

- (void)transferGestureState:(id)a3
{
  id v4 = a3;
  if (self->_pinching) {
    objc_msgSend(v4, "startPinchingWithFocusPoint:", self->_pinchStartFocusPoint.x, self->_pinchStartFocusPoint.y);
  }
  if (self->_panning) {
    objc_msgSend(v4, "startPanningAtPoint:panAtStartPoint:", 1, self->_panStartFocusPoint.x, self->_panStartFocusPoint.y);
  }
  if (self->_rotating) {
    objc_msgSend(v4, "startRotatingWithFocusPoint:", self->_rotateStartFocusPoint.x, self->_rotateStartFocusPoint.y);
  }
  if (self->_pitching) {
    objc_msgSend(v4, "startPitchingWithFocusPoint:", self->_pitchStartFocusPoint.x, self->_pitchStartFocusPoint.y);
  }
}

@end