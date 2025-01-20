@interface VKARGestureCameraBehavior
- (VKARGestureCameraBehavior)initWithARCameraController:(id)a3;
- (void)beginPan:(CGPoint)a3;
- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4;
- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4;
- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
@end

@implementation VKARGestureCameraBehavior

- (void).cxx_destruct
{
}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  p_arCameraController = &self->_arCameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arCameraController);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained arCameraTransform];
  }
  else
  {
    uint64_t v51 = 0;
    long long v49 = 0u;
    long long v50 = 0u;
    float64x2_t v48 = 0u;
  }

  id v10 = objc_loadWeakRetained((id *)p_arCameraController);
  uint64_t v11 = objc_msgSend(v10, "cursorFromScreenPoint:", x, y);

  id v12 = objc_loadWeakRetained((id *)p_arCameraController);
  uint64_t v13 = [v12 globeView];
  float64x2_t v52 = v48;
  uint64_t v53 = v49;
  if (altitude::GlobeView::getDirFromScreenPosition(v13, &v54, v48.f64, (float)(int)v11, (float)SHIDWORD(v11))
    && altitude::Intersector::intersectRayWithVisibleSet(*(void *)(v13 + 456), &v52, &v54, (uint64_t)&v43))
  {
    double v14 = *(double *)&v44;
    float64x2_t v42 = v43;

    __double2 v15 = __sincos_stret(a3 * 0.5);
    id v16 = objc_loadWeakRetained((id *)p_arCameraController);
    id v12 = v16;
    if (v16)
    {
      [v16 offsetTransform];
      double v17 = *((double *)&v45 + 1);
      double v18 = *(double *)&v45;
      double v19 = v46;
      double v21 = *((double *)&v44 + 1);
      double v20 = *(double *)&v44;
      double v22 = v43.f64[1];
      double v23 = v43.f64[0];
    }
    else
    {
      double v46 = 0.0;
      double v23 = 0.0;
      long long v44 = 0u;
      long long v45 = 0u;
      float64x2_t v43 = 0u;
      double v22 = 0.0;
      double v20 = 0.0;
      double v19 = 0.0;
      double v17 = 0.0;
      double v18 = 0.0;
      double v21 = 0.0;
    }
    _V17.D[1] = v42.f64[1];
    _D7 = v42.f64[1];
    __asm { FMLA            D16, D7, V17.D[1] }
    double v31 = v15.__sinval / sqrt(_D16 + v14 * v14);
    double v32 = v31 * v42.f64[0];
    double v33 = vmuld_lane_f64(v31, v42, 1);
    double v34 = v31 * v14;
    double v35 = v17 * v33 - (v18 * v34 - v21 * v15.__cosval);
    double v36 = v21 * v34 + v18 * v15.__cosval - v17 * v32;
    double v37 = v17 * v15.__cosval - (v21 * v33 - v18 * v32) + v19 * v34;
    double v38 = v21 * v32 + v18 * v33 + v17 * v34;
    double v39 = -(v22 * v34 - v20 * v33) - (v22 * v34 - v20 * v33);
    double v40 = -(v20 * v32 - v23 * v34) - (v20 * v32 - v23 * v34);
    double v41 = -(v23 * v33 - v22 * v32) - (v23 * v33 - v22 * v32);
    v47[0] = v23 + v39 * v15.__cosval + v41 * v33 - v40 * v34;
    v47[1] = v22 + v39 * v34 + v40 * v15.__cosval - v41 * v32;
    v47[2] = v20 - v39 * v33 + v40 * v32 + v41 * v15.__cosval;
    v47[3] = v35 + v19 * v32;
    v47[4] = v36 + v19 * v33;
    v47[5] = v37;
    v47[6] = -(v38 - v19 * v15.__cosval);
    objc_msgSend(v12, "setOffsetTransform:", v47, *(_OWORD *)&v42, *(_OWORD *)&v43, v44, v45, *(void *)&v46);
  }
}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  p_arCameraController = &self->_arCameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arCameraController);
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained arCameraTransform];
  }
  else
  {
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    float64x2_t v34 = 0u;
  }

  id v12 = objc_loadWeakRetained((id *)p_arCameraController);
  uint64_t v13 = objc_msgSend(v12, "cursorFromScreenPoint:", x, y);

  id v14 = objc_loadWeakRetained((id *)p_arCameraController);
  uint64_t v15 = [v14 globeView];
  float64x2_t v38 = v34;
  uint64_t v39 = v35;
  if (altitude::GlobeView::getDirFromScreenPosition(v15, &v40, v34.f64, (float)(int)v13, (float)SHIDWORD(v13))
    && altitude::Intersector::intersectRayWithVisibleSet(*(void *)(v15 + 456), &v38, &v40, (uint64_t)v32))
  {
    double v16 = v32[1].f64[0];
    float64x2_t v25 = v32[0];

    float64x2_t v24 = v34;
    double v17 = *(double *)&v35;
    id v18 = objc_loadWeakRetained((id *)p_arCameraController);
    double v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "offsetTransform", *(_OWORD *)&v24, *(_OWORD *)&v25);
    }
    else
    {
      uint64_t v33 = 0;
      memset(v32, 0, sizeof(v32));
    }
    double v20 = a4 * -0.7 / a5 + -0.3;
    float64x2_t v26 = vsubq_f64(v25, v24);
    double v21 = v16 - v17;
    double v22 = sqrt(vaddvq_f64(vmulq_f64(v26, v26)) + v21 * v21);
    double v23 = v22 + v22 * v20;

    v32[0] = vmlaq_n_f64(v32[0], v26, v23 / v22);
    v32[1].f64[0] = v32[1].f64[0] + v23 / v22 * v21;
    id v14 = objc_loadWeakRetained((id *)p_arCameraController);
    float64x2_t v27 = v32[0];
    float64_t v28 = v32[1].f64[0];
    long long v29 = *(long long *)((char *)&v32[1] + 8);
    float64_t v30 = v32[2].f64[1];
    uint64_t v31 = v33;
    [v14 setOffsetTransform:&v27];
  }
}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  p_startPanPosition = &self->_startPanPosition;
  if (*(void *)&self->_startPanPosition._e[0] | *(void *)&self->_startPanPosition._e[1] | *(void *)&self->_startPanPosition._e[2])
  {
    double y = a4.y;
    double x = a4.x;
    double v7 = a3.y;
    double v8 = a3.x;
    p_arCameraController = &self->_arCameraController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_arCameraController);
    uint64_t v11 = objc_msgSend(WeakRetained, "cursorFromScreenPoint:", x, y);

    id v12 = objc_loadWeakRetained((id *)p_arCameraController);
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 arCameraTransform];
    }
    else
    {
      uint64_t v60 = 0;
      memset(v59, 0, sizeof(v59));
    }

    double v14 = p_startPanPosition->_e[0];
    double v15 = p_startPanPosition->_e[1];
    double v16 = p_startPanPosition->_e[2];
    id v17 = objc_loadWeakRetained((id *)p_arCameraController);
    double v18 = sqrt(v14 * v14 + v15 * v15 + v16 * v16);
    BOOL SpherePointIntersection = altitude::GlobeView::getSpherePointIntersection([v17 globeView], v11, SHIDWORD(v11), (double *)v59, (uint64_t)&v56, v18);

    if (SpherePointIntersection)
    {
      id v20 = objc_loadWeakRetained((id *)p_arCameraController);
      uint64_t v21 = objc_msgSend(v20, "cursorFromScreenPoint:", v8, v7);

      id v22 = objc_loadWeakRetained((id *)p_arCameraController);
      LOBYTE(v21) = altitude::GlobeView::getSpherePointIntersection([v22 globeView], v21, SHIDWORD(v21), (double *)v59, (uint64_t)&v53, v18);

      if (v21)
      {
        id v23 = objc_loadWeakRetained((id *)p_arCameraController);
        [v23 altitude];
        if (v24 < 10.0)
        {
          double v28 = 112.94372;
        }
        else
        {
          id v25 = objc_loadWeakRetained((id *)p_arCameraController);
          [v25 altitude];
          double v27 = sqrt((v26 + 12756274.0) * v26);

          double v28 = v27 * 0.01;
        }

        double v29 = fmin(fmax(sqrt((v56 - v53) * (v56 - v53) + (v57 - v54) * (v57 - v54) + (v58 - v55) * (v58 - v55)), 0.0), v28)/ v28;
        if (v28 == 0.0) {
          double v29 = 1.0;
        }
        double v30 = -(v58 * v53 - v55 * v56);
        double v31 = -(v54 * v56 - v57 * v53);
        double v32 = -(v55 * v57 - v58 * v54);
        double v33 = v53 * v56 + v54 * v57 + v55 * v58;
        double v34 = v31 * v31 + v32 * v32 + v30 * v30;
        double v35 = sqrt(v34 + v33 * v33) + v33;
        double v36 = 1.0 / sqrt(v34 + v35 * v35);
        v52[0] = v36 * v32;
        v52[1] = v36 * v30;
        v52[2] = v36 * v31;
        v52[3] = v36 * v35;
        memset(v50, 0, 24);
        *((void *)&v50[1] + 1) = 0x3FF0000000000000;
        gm::Quaternion<double>::slerp((double *)v50, v52, v29 * v29 * (v29 * 2.0 + -3.0) + 1.0);
        long long v37 = v50[0];
        long long v38 = v50[1];
        id v39 = objc_loadWeakRetained((id *)p_arCameraController);
        float64x2_t v40 = v39;
        if (v39)
        {
          [v39 offsetTransform];
        }
        else
        {
          double v51 = 0.0;
          memset(v50, 0, sizeof(v50));
        }

        double v41 = v51 * *((double *)&v37 + 1)
            - (*((double *)&v50[2] + 1) * *(double *)&v37
             - *(double *)&v50[2] * *((double *)&v38 + 1))
            + *((double *)&v50[1] + 1) * *(double *)&v38;
        double v42 = *((double *)&v50[2] + 1) * *((double *)&v38 + 1)
            + *(double *)&v50[2] * *(double *)&v37
            - *((double *)&v50[1] + 1) * *((double *)&v37 + 1)
            + v51 * *(double *)&v38;
        double v43 = *((double *)&v50[1] + 1) * *(double *)&v37
            + *(double *)&v50[2] * *((double *)&v37 + 1)
            + *((double *)&v50[2] + 1) * *(double *)&v38;
        *((double *)&v50[1] + 1) = *((double *)&v50[1] + 1) * *((double *)&v38 + 1)
                                 + v51 * *(double *)&v37
                                 + *((double *)&v50[2] + 1) * *((double *)&v37 + 1)
                                 - *(double *)&v50[2] * *(double *)&v38;
        *(double *)&v50[2] = v41;
        *((double *)&v50[2] + 1) = v42;
        double v51 = -(v43 - v51 * *((double *)&v38 + 1));
        id v44 = objc_loadWeakRetained((id *)p_arCameraController);
        long long v45 = v50[0];
        uint64_t v46 = *(void *)&v50[1];
        long long v47 = *(_OWORD *)((char *)&v50[1] + 8);
        uint64_t v48 = *((void *)&v50[2] + 1);
        double v49 = v51;
        [v44 setOffsetTransform:&v45];
      }
    }
  }
}

- (void)beginPan:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_arCameraController = &self->_arCameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arCameraController);
  double v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained arCameraTransform];
  }
  else
  {
    uint64_t v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    float64x2_t v15 = 0u;
  }

  id v9 = objc_loadWeakRetained((id *)p_arCameraController);
  uint64_t v10 = objc_msgSend(v9, "cursorFromScreenPoint:", x, y);

  id v11 = objc_loadWeakRetained((id *)p_arCameraController);
  uint64_t v12 = [v11 globeView];
  float64x2_t v19 = v15;
  uint64_t v20 = v16;
  p_startPanPosition = &self->_startPanPosition;
  if (altitude::GlobeView::getDirFromScreenPosition(v12, &v21, v15.f64, (float)(int)v10, (float)SHIDWORD(v10))
    && altitude::Intersector::intersectRayWithVisibleSet(*(void *)(v12 + 456), &v19, &v21, (uint64_t)&v22))
  {
    double v14 = v23;
    *(_OWORD *)p_startPanPosition->_e = v22;
    p_startPanPosition->_e[2] = v14;
  }
  else
  {

    p_startPanPosition->_e[0] = 0.0;
    p_startPanPosition->_e[1] = 0.0;
    p_startPanPosition->_e[2] = 0.0;
  }
}

- (VKARGestureCameraBehavior)initWithARCameraController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKARGestureCameraBehavior;
  v5 = [(VKGestureCameraBehavior *)&v8 initWithCameraController:v4];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_arCameraController, v4);
  }

  return v6;
}

@end