@interface VKGlobeGestureCameraController
- (BOOL)isPitchIncreasing;
- (void)beginPan:(CGPoint)a3;
- (void)beginPitch:(CGPoint)a3;
- (void)beginRotate:(CGPoint)a3;
- (void)beginZoom:(CGPoint)a3;
- (void)endPan:(CGPoint)a3;
- (void)endPitch:(CGPoint)a3;
- (void)endRotate:(CGPoint)a3;
- (void)endZoom:(CGPoint)a3;
- (void)setCameraManager:(void *)a3;
- (void)setGlobeView:(void *)a3;
- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4;
- (void)updatePitch:(CGPoint)a3 degrees:(double)a4;
- (void)updatePitch:(CGPoint)a3 translation:(double)a4;
- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4;
- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
@end

@implementation VKGlobeGestureCameraController

- (BOOL)isPitchIncreasing
{
  return self->_isPitchIncreasing;
}

- (void)endPitch:(CGPoint)a3
{
  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[122] = 1;
  }
}

- (void)updatePitch:(CGPoint)a3 degrees:(double)a4
{
  if (self->_cameraManager)
  {
    if (self->_globeView)
    {
      double y = a3.y;
      double x = a3.x;
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
      int v8 = [WeakRetained isPitchEnabled];

      if (v8)
      {
        self->super._rotating = 0;
        double v9 = a4 * 0.0174532925;
        self->_isPitchIncreasing = self->_currentDoublePanPitch < a4 * 0.0174532925;
        if (!self->super._pitching)
        {
          cameraManager = self->_cameraManager;
          id v23 = objc_loadWeakRetained((id *)&self->super._cameraController);
          uint64_t v11 = objc_msgSend(v23, "cursorFromScreenPoint:", x, y);
          cameraManager[60] = 1;
          *((unsigned char *)cameraManager + 122) = 0;
          *((void *)cameraManager + 21) = 0;
          *((void *)cameraManager + 19) = v11;
          *((void *)cameraManager + 20) = v11;

          self->super._pitching = 1;
        }
        v12 = (double *)self->_cameraManager;
        if (*((unsigned char *)v12 + 233))
        {
          double v13 = *(double *)(*((void *)self->_globeView + 9) + 32);
          double v14 = 0.0;
          if (v13 <= 1500000.0)
          {
            double v15 = 1.0;
            double v16 = fmax(v13, 1.0);
            double v14 = 0.680678408 - cos(sqrt(v16 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
            if (*((_DWORD *)v12 + 59) == 1)
            {
              if (v16 < 20000.0) {
                double v15 = v12[40] + v16 * 0.00005 * (1.0 - v12[40]);
              }
              double v14 = v15 * v14;
            }
            if (*((unsigned char *)v12 + 241)) {
              double v14 = v12[33] + fmin(fmax(v12[32], 0.0), 1.0) * (v14 - v12[33]);
            }
          }
        }
        else
        {
          double v14 = 1.57079633;
        }
        id v24 = objc_loadWeakRetained((id *)&self->super._cameraController);
        uint64_t v17 = objc_msgSend(v24, "cursorFromScreenPoint:", x, y);
        double v18 = fmax(v14, 0.0);
        if (v18 >= v9)
        {
          v19 = v24;
          if (v9 < 0.0) {
            double v9 = 0.0698131701 / (a4 * -0.1375 + 1.0) + -0.0698131701;
          }
        }
        else
        {
          double v9 = 0.0698131701 / ((v18 - v9) * 7.87816968 + -1.0) + v18 + 0.0698131701;
          v19 = v24;
        }
        double v20 = fmin(fmax(v9, 0.0), v14 + 0.0698131701);
        double v21 = v20 - self->_currentDoublePanPitch;
        *((void *)v12 + 19) = v17;
        v12[21] = v21 + v12[21];

        self->_currentDoublePanPitch = v20;
        id v25 = objc_loadWeakRetained((id *)&self->super._cameraController);
        [v25 updateState];
      }
    }
  }
}

- (void)updatePitch:(CGPoint)a3 translation:(double)a4
{
  if (!self->_cameraManager) {
    return;
  }
  if (!self->_globeView) {
    return;
  }
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  int v8 = [WeakRetained isPitchEnabled];

  if (!v8) {
    return;
  }
  self->super._rotating = 0;
  self->_isPitchIncreasing = a4 < 0.0;
  if (!self->super._pitching)
  {
    cameraManager = self->_cameraManager;
    id v25 = objc_loadWeakRetained((id *)&self->super._cameraController);
    uint64_t v10 = objc_msgSend(v25, "cursorFromScreenPoint:", x, y);
    cameraManager[60] = 1;
    *((unsigned char *)cameraManager + 122) = 0;
    *((void *)cameraManager + 21) = 0;
    *((void *)cameraManager + 19) = v10;
    *((void *)cameraManager + 20) = v10;

    self->super._pitching = 1;
  }
  uint64_t v11 = (double *)self->_cameraManager;
  if (*((unsigned char *)v11 + 233))
  {
    double v12 = *(double *)(*((void *)self->_globeView + 9) + 32);
    double v13 = 0.0;
    if (v12 <= 1500000.0)
    {
      double v14 = 1.0;
      double v15 = fmax(v12, 1.0);
      double v13 = 0.680678408 - cos(sqrt(v15 * 0.000000666666667) * 3.7699104 + 2.5132736) * 0.680678408;
      if (*((_DWORD *)v11 + 59) == 1)
      {
        if (v15 < 20000.0) {
          double v14 = v11[40] + v15 * 0.00005 * (1.0 - v11[40]);
        }
        double v13 = v14 * v13;
      }
      if (*((unsigned char *)v11 + 241)) {
        double v13 = v11[33] + fmin(fmax(v11[32], 0.0), 1.0) * (v13 - v11[33]);
      }
    }
  }
  else
  {
    double v13 = 1.57079633;
  }
  double beganDoublePanPitch = self->_beganDoublePanPitch;
  id v26 = objc_loadWeakRetained((id *)&self->super._cameraController);
  uint64_t v17 = objc_msgSend(v26, "cursorFromScreenPoint:", x, y);
  double v18 = beganDoublePanPitch - a4;
  double v19 = fmax(v13, 0.0);
  if (v19 < beganDoublePanPitch - a4)
  {
    double v20 = 0.0698131701 / ((v19 - v18) * 7.87816968 + -1.0);
    double v21 = v19 + 0.0698131701;
LABEL_20:
    double v18 = v20 + v21;
    goto LABEL_21;
  }
  if (v18 < 0.0)
  {
    double v20 = 0.0698131701 / (v18 * -7.87816968 + 1.0);
    double v21 = -0.0698131701;
    goto LABEL_20;
  }
LABEL_21:
  double v22 = fmin(fmax(v18, 0.0), v13 + 0.0698131701);
  double v23 = v22 - self->_currentDoublePanPitch;
  *((void *)v11 + 19) = v17;
  v11[21] = v23 + v11[21];

  self->_currentDoublePanPitch = v22;
  id v27 = objc_loadWeakRetained((id *)&self->super._cameraController);
  [v27 updateState];
}

- (void)beginPitch:(CGPoint)a3
{
  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    globeView = self->_globeView;
    if (globeView)
    {
      double y = a3.y;
      double x = a3.x;
      double v7 = *(double *)(globeView[9] + 40);
      self->_double beganDoublePanPitch = v7;
      self->_currentDoublePanPitch = v7;
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
      uint64_t v8 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
      cameraManager[60] = 1;
      *((unsigned char *)cameraManager + 122) = 0;
      *((void *)cameraManager + 21) = 0;
      *((void *)cameraManager + 19) = v8;
      *((void *)cameraManager + 20) = v8;
    }
  }
}

- (void)endRotate:(CGPoint)a3
{
  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[75] = 1;
  }
}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  cameraManager = (double *)self->_cameraManager;
  if (cameraManager)
  {
    double y = a4.y;
    double x = a4.x;
    self->super._pitching = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    uint64_t v8 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[14] = cameraManager[14] + a3;
    *((void *)cameraManager + 13) = v8;
  }
}

- (void)beginRotate:(CGPoint)a3
{
  cameraManager = (char *)self->_cameraManager;
  if (cameraManager)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    uint64_t v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    *(_WORD *)(cameraManager + 73) = 1;
    cameraManager[75] = 0;
    *((void *)cameraManager + 13) = v6;
    *((void *)cameraManager + 14) = 0;
  }
}

- (void)endPan:(CGPoint)a3
{
  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[10] = 1;
  }
}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  cameraManager = (char *)self->_cameraManager;
  if (cameraManager)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    *(void *)(cameraManager + 12) = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
  }
}

- (void)beginPan:(CGPoint)a3
{
  cameraManager = (char *)self->_cameraManager;
  if (cameraManager)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    uint64_t v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    *((_WORD *)cameraManager + 4) = 1;
    cameraManager[10] = 0;
    cameraManager[72] = 0;
    *(void *)(cameraManager + 28) = v6;
    *(void *)(cameraManager + 12) = v6;
    *(void *)(cameraManager + 20) = v6;
  }
}

- (void)endZoom:(CGPoint)a3
{
  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[178] = 1;
  }
}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  cameraManager = (double *)self->_cameraManager;
  if (cameraManager && self->_globeView)
  {
    double y = a3.y;
    double x = a3.x;
    p_cameraController = &self->super._cameraController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    uint64_t v11 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[27] = cameraManager[27] * (a4 * 0.7 / a5 + 0.3);
    *((void *)cameraManager + 26) = v11;

    id v13 = objc_loadWeakRetained((id *)p_cameraController);
    [v13 setUserChangedZoomSinceLastProgrammaticRegionChange:1];
  }
}

- (void)beginZoom:(CGPoint)a3
{
  cameraManager = self->_cameraManager;
  if (cameraManager)
  {
    double y = a3.y;
    double x = a3.x;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
    uint64_t v6 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);
    cameraManager[88] = 1;
    *((unsigned char *)cameraManager + 178) = 0;
    *((void *)cameraManager + 26) = v6;
    *((void *)cameraManager + 27) = 0x3FF0000000000000;
    *((unsigned char *)cameraManager + 232) = 0;
  }
}

- (void)setCameraManager:(void *)a3
{
  self->_cameraManager = a3;
}

- (void)setGlobeView:(void *)a3
{
  self->_globeView = a3;
}

@end