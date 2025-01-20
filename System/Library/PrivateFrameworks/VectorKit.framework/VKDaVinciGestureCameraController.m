@interface VKDaVinciGestureCameraController
- (BOOL)isPitchIncreasing;
- (VKDaVinciGestureCameraController)initWithCameraController:(id)a3 cameraManager:(void *)a4;
- (void)beginPan:(CGPoint)a3;
- (void)beginPitch:(CGPoint)a3;
- (void)beginRotate:(CGPoint)a3;
- (void)beginZoom:(CGPoint)a3;
- (void)endPan:(CGPoint)a3;
- (void)endPitch:(CGPoint)a3;
- (void)endRotate:(CGPoint)a3;
- (void)endZoom:(CGPoint)a3;
- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4;
- (void)updatePitch:(CGPoint)a3 degrees:(double)a4;
- (void)updatePitch:(CGPoint)a3 translation:(double)a4;
- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4;
- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4;
- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
@end

@implementation VKDaVinciGestureCameraController

- (VKDaVinciGestureCameraController)initWithCameraController:(id)a3 cameraManager:(void *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)VKDaVinciGestureCameraController;
  result = [(VKGestureCameraBehavior *)&v6 initWithCameraController:a3];
  if (result)
  {
    result->super._notifyCameraStateChanges = 1;
    result->_cameraManager = a4;
  }
  return result;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  cameraManager = self->_cameraManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_super v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained camera];
  }
  else
  {
    uint64_t v8 = 0;
    v9 = 0;
  }
  md::CameraManager::update((uint64_t)cameraManager, &v8, 0);
  v7 = v9;
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

- (BOOL)isPitchIncreasing
{
  return self->_isPitchIncreasing;
}

- (void)endPitch:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  cameraManager = self->_cameraManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[130] = 1;
}

- (void)updatePitch:(CGPoint)a3 degrees:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  int v10 = [WeakRetained isPitchEnabled];

  if (v10)
  {
    self->super._rotating = 0;
    double v11 = a4 * 0.0174532925;
    self->_isPitchIncreasing = self->_currentDoublePanPitch < a4 * 0.0174532925;
    if (!self->super._pitching)
    {
      cameraManager = self->_cameraManager;
      id v13 = objc_loadWeakRetained((id *)p_cameraController);
      uint64_t v14 = objc_msgSend(v13, "cursorFromScreenPoint:", x, y);
      cameraManager[64] = 1;
      *((unsigned char *)cameraManager + 130) = 0;
      *((void *)cameraManager + 22) = 0;
      *((void *)cameraManager + 20) = v14;
      *((void *)cameraManager + 21) = v14;

      self->super._pitching = 1;
    }
    id v15 = objc_loadWeakRetained((id *)p_cameraController);
    [v15 camera];
    double v16 = *(double *)(v24 + 72);
    if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v25->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v25);
    }

    v17 = (double *)self->_cameraManager;
    id v18 = objc_loadWeakRetained((id *)p_cameraController);
    uint64_t v19 = objc_msgSend(v18, "cursorFromScreenPoint:", x, y);
    double v20 = fmax(v16, 0.0);
    if (v20 >= v11)
    {
      if (v11 < 0.0) {
        double v11 = 0.0698131701 / (a4 * -0.1375 + 1.0) + -0.0698131701;
      }
    }
    else
    {
      double v11 = 0.0698131701 / ((v20 - v11) * 7.87816968 + -1.0) + v20 + 0.0698131701;
    }
    double v21 = fmin(fmax(v11, 0.0), v16 + 0.0698131701);
    double v22 = v21 - self->_currentDoublePanPitch;
    *((void *)v17 + 20) = v19;
    v17[22] = v22 + v17[22];

    self->_currentDoublePanPitch = v21;
    id v23 = objc_loadWeakRetained((id *)p_cameraController);
    [v23 updateState];
  }
}

- (void)updatePitch:(CGPoint)a3 translation:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  int v10 = [WeakRetained isPitchEnabled];

  if (v10)
  {
    self->super._rotating = 0;
    self->_isPitchIncreasing = a4 < 0.0;
    if (!self->super._pitching)
    {
      cameraManager = self->_cameraManager;
      id v12 = objc_loadWeakRetained((id *)p_cameraController);
      uint64_t v13 = objc_msgSend(v12, "cursorFromScreenPoint:", x, y);
      cameraManager[64] = 1;
      *((unsigned char *)cameraManager + 130) = 0;
      *((void *)cameraManager + 22) = 0;
      *((void *)cameraManager + 20) = v13;
      *((void *)cameraManager + 21) = v13;

      self->super._pitching = 1;
    }
    id v14 = objc_loadWeakRetained((id *)p_cameraController);
    [v14 camera];
    double v15 = *(double *)(v27 + 72);
    if (v28)
    {
      if (!atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)())v28->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v28);
      }
    }

    double beganDoublePanPitch = self->_beganDoublePanPitch;
    v17 = (double *)self->_cameraManager;
    id v18 = objc_loadWeakRetained((id *)p_cameraController);
    uint64_t v19 = objc_msgSend(v18, "cursorFromScreenPoint:", x, y);
    double v20 = beganDoublePanPitch - a4;
    double v21 = fmax(v15, 0.0);
    if (v21 >= beganDoublePanPitch - a4)
    {
      if (v20 >= 0.0)
      {
LABEL_12:
        double v24 = fmin(fmax(v20, 0.0), v15 + 0.0698131701);
        double v25 = v24 - self->_currentDoublePanPitch;
        *((void *)v17 + 20) = v19;
        v17[22] = v25 + v17[22];

        self->_currentDoublePanPitch = v24;
        id v26 = objc_loadWeakRetained((id *)p_cameraController);
        [v26 updateState];

        return;
      }
      double v22 = 0.0698131701 / (v20 * -7.87816968 + 1.0);
      double v23 = -0.0698131701;
    }
    else
    {
      double v22 = 0.0698131701 / ((v21 - v20) * 7.87816968 + -1.0);
      double v23 = v21 + 0.0698131701;
    }
    double v20 = v22 + v23;
    goto LABEL_12;
  }
}

- (void)beginPitch:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  [WeakRetained camera];
  self->_double beganDoublePanPitch = *(double *)(v11 + 40);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v12->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v12);
  }

  self->_currentDoublePanPitch = self->_beganDoublePanPitch;
  cameraManager = self->_cameraManager;
  id v9 = objc_loadWeakRetained((id *)p_cameraController);
  uint64_t v10 = objc_msgSend(v9, "cursorFromScreenPoint:", x, y);
  cameraManager[64] = 1;
  *((unsigned char *)cameraManager + 130) = 0;
  *((void *)cameraManager + 22) = 0;
  *((void *)cameraManager + 20) = v10;
  *((void *)cameraManager + 21) = v10;
}

- (void)endRotate:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  cameraManager = self->_cameraManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[83] = 1;
}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  self->super._pitching = 0;
  cameraManager = (double *)self->_cameraManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  uint64_t v8 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[15] = cameraManager[15] + a3;
  *((void *)cameraManager + 14) = v8;
}

- (void)beginRotate:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  cameraManager = (char *)self->_cameraManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  uint64_t v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  *(_WORD *)(cameraManager + 81) = 1;
  cameraManager[83] = 0;
  *((void *)cameraManager + 14) = v6;
  *((void *)cameraManager + 15) = 0;
}

- (void)endPan:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  cameraManager = self->_cameraManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[18] = 1;
}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  double y = a3.y;
  double x = a3.x;
  cameraManager = (char *)self->_cameraManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  *(void *)(cameraManager + 20) = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
}

- (void)beginPan:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  cameraManager = (char *)self->_cameraManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  uint64_t v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  *((_WORD *)cameraManager + 8) = 1;
  cameraManager[18] = 0;
  cameraManager[80] = 0;
  *(void *)(cameraManager + 36) = v6;
  *(void *)(cameraManager + 20) = v6;
  *(void *)(cameraManager + 28) = v6;
}

- (void)endZoom:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  cameraManager = self->_cameraManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[186] = 1;
}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  cameraManager = (double *)self->_cameraManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  uint64_t v10 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[28] = cameraManager[28] * (a4 * 0.7 / a5 + 0.3);
  *((void *)cameraManager + 27) = v10;
}

- (void)beginZoom:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  cameraManager = self->_cameraManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  uint64_t v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  cameraManager[92] = 1;
  *((unsigned char *)cameraManager + 186) = 0;
  *((void *)cameraManager + 27) = v6;
  *((void *)cameraManager + 28) = 0x3FF0000000000000;
  *((unsigned char *)cameraManager + 240) = 0;
}

@end