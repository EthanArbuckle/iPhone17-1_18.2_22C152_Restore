@interface VKMapGestureCameraController
- (BOOL)isPitchIncreasing;
- (Matrix<double,)positionClampedToCameraRestriction:()Matrix<double;
- (Matrix<double,)positionClampedToCameraRestriction:()Matrix<double delta:()3;
- (id).cxx_construct;
- (void)beginPitch:(CGPoint)a3;
- (void)endZoom:(CGPoint)a3;
- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4;
- (void)updatePitch:(CGPoint)a3 degrees:(double)a4;
- (void)updatePitch:(CGPoint)a3 translation:(double)a4;
- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4;
- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
@end

@implementation VKMapGestureCameraController

- (id).cxx_construct
{
  *((unsigned char *)self + 232) = 0;
  *((unsigned char *)self + 240) = 0;
  *((unsigned char *)self + 248) = 0;
  *((unsigned char *)self + 256) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (Matrix<double,)positionClampedToCameraRestriction:()Matrix<double delta:()3
{
  double v4 = a4._e[2];
  double v5 = a4._e[1];
  double v6 = a4._e[0];
  double v7 = a3._e[2];
  double v8 = a3._e[1];
  double v9 = a3._e[0];
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  v12 = [WeakRetained vkCamera];

  v13 = [v12 regionRestriction];
  int v14 = [v13 isEmpty];

  if (v14)
  {
    double v15 = v6 + v9;
    double v16 = v5 + v8;
  }
  else
  {
    if (v12) {
      [v12 cameraState];
    }
    else {
      memset(v37, 0, sizeof(v37));
    }
    id v17 = objc_loadWeakRetained((id *)p_cameraController);
    [v17 centerScreenPoint];
    double v35 = v7;
    double v36 = v4;
    VKCameraMakeGroundPoint(&v38, v39, v18, (double *)v37);

    [v12 groundPoint];
    double v20 = v19;
    double v22 = v21;
    double v23 = v38.var0._translation._e[1];
    double v24 = v38.var0._translation._e[2];
    v25 = [v12 regionRestriction];
    double v26 = v23 - v20;
    double v27 = v24 - v22;
    objc_msgSend(v25, "clampedPositionForOrigin:delta:", v26 + v9, v27 + v8, v6, v5);
    double v29 = v28;
    double v31 = v30;

    double v15 = v29 - v26;
    double v16 = v31 - v27;
    double v7 = v35;
    double v4 = v36;
  }

  double v32 = v15;
  double v33 = v16;
  double v34 = v4 + v7;
  result._e[2] = v34;
  result._e[1] = v33;
  result._e[0] = v32;
  return result;
}

- (Matrix<double,)positionClampedToCameraRestriction:()Matrix<double
{
  double v3 = a3._e[2];
  double v4 = a3._e[1];
  double v5 = a3._e[0];
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  double v8 = [WeakRetained vkCamera];

  double v9 = [v8 regionRestriction];
  char v10 = [v9 isEmpty];

  if ((v10 & 1) == 0)
  {
    if (v8) {
      [v8 cameraState];
    }
    else {
      memset(v29, 0, sizeof(v29));
    }
    id v11 = objc_loadWeakRetained((id *)p_cameraController);
    [v11 centerScreenPoint];
    VKCameraMakeGroundPoint(&v30, v31, v12, (double *)v29);

    [v8 groundPoint];
    double v14 = v13;
    double v16 = v15;
    double v17 = v30.var0._translation._e[1];
    double v18 = v30.var0._translation._e[2];
    double v19 = [v8 regionRestriction];
    double v20 = v17 - v14;
    double v21 = v18 - v16;
    objc_msgSend(v19, "clampedPosition:", v20 + v5, v21 + v4);
    double v23 = v22;
    double v25 = v24;

    double v5 = v23 - v20;
    double v4 = v25 - v21;
  }

  double v26 = v5;
  double v27 = v4;
  double v28 = v3;
  result._e[2] = v28;
  result._e[1] = v27;
  result._e[0] = v26;
  return result;
}

- (BOOL)isPitchIncreasing
{
  return self->_isPitchIncreasing;
}

- (void)updatePitch:(CGPoint)a3 degrees:(double)a4
{
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  double v8 = [WeakRetained vkCamera];

  double v9 = a4 * 0.0174532925;
  self->_isPitchIncreasing = self->_currentPitch < a4 * 0.0174532925;
  [v8 maxPitch];
  double v11 = v10;
  [v8 maxPitch];
  if (v11 == 0.0) {
    double v13 = v11;
  }
  else {
    double v13 = 0.0698131701;
  }
  double v14 = fmax(v12, 0.0);
  if (v14 >= v9)
  {
    if (v9 < 0.0) {
      double v9 = -(v13 + 1.0 / (a4 * 0.00959931089 / v13 - 1.0) * v13);
    }
  }
  else
  {
    double v9 = v14 + (1.0 / ((v14 - v9) * 0.55 / v13 - 1.0) + 1.0) * v13;
  }
  [v8 maxPitch];
  double v16 = v15;
  id v17 = objc_loadWeakRetained((id *)p_cameraController);
  int v18 = [v17 isPitched];

  [v8 pitch];
  double v20 = v19;
  [v8 rightVector];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v27 = fmin(fmax(v9, 0.0), v16 + 0.0698131701);
  __double2 v28 = __sincos_stret((v27 - v20) * 0.5);
  double v29 = (double *)[v8 orientation];
  double v30 = v28.__sinval / sqrt(v22 * v22 + v24 * v24 + v26 * v26);
  double v31 = v30 * v22;
  double v32 = v30 * v24;
  double v33 = v30 * v26;
  double v34 = v29[1];
  double v35 = v29[2];
  double v36 = v29[3];
  double v37 = *v29 * v33 + v34 * v28.__cosval - v35 * v31 + v36 * v32;
  double v38 = v35 * v28.__cosval - (*v29 * v32 - v34 * v31) + v36 * v33;
  double v39 = *v29 * v31 + v34 * v32 + v35 * v33;
  v68[0] = v35 * v32 - (v34 * v33 - *v29 * v28.__cosval) + v36 * v31;
  v68[1] = v37;
  v68[2] = v38;
  v68[3] = -(v39 - v36 * v28.__cosval);
  id v40 = objc_loadWeakRetained((id *)p_cameraController);
  [v40 centerScreenPoint];
  if (v8)
  {
    objc_msgSend(v8, "groundPointFromScreenPoint:");
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
  }

  if ((_BYTE)v66)
  {
    v41 = (double *)[v8 position];
    double v42 = v41[1];
    double v43 = *v41 - *((double *)&v66 + 1);
    double v44 = v41[2];
    double v45 = -((v42 - *(double *)&v67) * v33 - (v44 - *((double *)&v67 + 1)) * v32);
    double v46 = -((v44 - *((double *)&v67 + 1)) * v31 - v43 * v33);
    double v47 = -(v43 * v32 - (v42 - *(double *)&v67) * v31);
    double v48 = v46 + v46;
    double v49 = v47 + v47;
    *(double *)&long long v64 = *v41 + v49 * v32 + (v45 + v45) * v28.__cosval - v48 * v33;
    *((double *)&v64 + 1) = v42 - v49 * v31 + (v45 + v45) * v33 + v48 * v28.__cosval;
    *(double *)&long long v65 = v44 + v49 * v28.__cosval + v48 * v31 - (v45 + v45) * v32;
    [v8 setPosition:&v64];
    [v8 setOrientation:v68];
  }
  else
  {
    [v8 setOrientation:v68];
    id v50 = objc_loadWeakRetained((id *)p_cameraController);
    [v50 centerScreenPoint];
    if (v8)
    {
      objc_msgSend(v8, "groundPointFromScreenPoint:");
    }
    else
    {
      long long v64 = 0u;
      long long v65 = 0u;
    }

    v51 = (double *)[v8 position];
    double v53 = *((double *)&v64 + 1);
    double v52 = *(double *)&v65;
    double v55 = *v51;
    double v54 = v51[1];
    double v56 = *(double *)[v8 position];
    double v57 = *(double *)([v8 position] + 8);
    double v58 = *(double *)([v8 position] + 16);
    v63[0] = v55 - v53 + v56;
    v63[1] = v54 - v52 + v57;
    v63[2] = v58;
    [v8 setPosition:v63];
  }
  self->_currentPitch = v27;
  id v59 = objc_loadWeakRetained((id *)p_cameraController);
  int v60 = [v59 isPitched];

  if (((v18 | v60 ^ 1) & 1) == 0)
  {
    id v61 = objc_loadWeakRetained((id *)p_cameraController);
    v62 = [v61 cameraDelegate];
    [v62 mapLayerDidBecomePitched:1];
    goto LABEL_21;
  }
  if (((v18 ^ 1 | v60) & 1) == 0)
  {
    id v61 = objc_loadWeakRetained((id *)p_cameraController);
    v62 = [v61 cameraDelegate];
    [v62 mapLayerDidBecomePitched:0];
LABEL_21:
  }
}

- (void)updatePitch:(CGPoint)a3 translation:(double)a4
{
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  double v8 = [WeakRetained vkCamera];

  int v9 = (a4 > 0.0) - (a4 < 0.0);
  double v10 = fabs(a4);
  self->_isPitchIncreasing = v9 < 0;
  double beganPitch = self->_beganPitch;
  if (v9 >= 0) {
    double v12 = -v10;
  }
  else {
    double v12 = v10;
  }
  [v8 maxPitch];
  double v14 = v13;
  [v8 maxPitch];
  double v16 = beganPitch + v12;
  if (v14 == 0.0) {
    double v17 = v14;
  }
  else {
    double v17 = 0.0698131701;
  }
  double v18 = fmax(v15, 0.0);
  if (v18 >= v16)
  {
    if (v16 < 0.0) {
      double v16 = -(v17 + 1.0 / (v16 * 0.55 / v17 - 1.0) * v17);
    }
  }
  else
  {
    double v16 = v18 + (1.0 / ((v18 - v16) * 0.55 / v17 - 1.0) + 1.0) * v17;
  }
  [v8 maxPitch];
  double v20 = v19;
  id v21 = objc_loadWeakRetained((id *)p_cameraController);
  int v22 = [v21 isPitched];

  [v8 pitch];
  double v24 = v23;
  [v8 rightVector];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v31 = fmin(fmax(v16, 0.0), v20 + 0.0698131701);
  __double2 v32 = __sincos_stret((v31 - v24) * 0.5);
  double v33 = (double *)[v8 orientation];
  double v34 = v32.__sinval / sqrt(v26 * v26 + v28 * v28 + v30 * v30);
  double v35 = v34 * v26;
  double v36 = v34 * v28;
  double v37 = v34 * v30;
  double v38 = v33[1];
  double v39 = v33[2];
  double v40 = v33[3];
  double v41 = *v33 * v37 + v38 * v32.__cosval - v39 * v35 + v40 * v36;
  double v42 = v39 * v32.__cosval - (*v33 * v36 - v38 * v35) + v40 * v37;
  double v43 = *v33 * v35 + v38 * v36 + v39 * v37;
  v72[0] = v39 * v36 - (v38 * v37 - *v33 * v32.__cosval) + v40 * v35;
  v72[1] = v41;
  v72[2] = v42;
  v72[3] = -(v43 - v40 * v32.__cosval);
  id v44 = objc_loadWeakRetained((id *)p_cameraController);
  [v44 centerScreenPoint];
  if (v8)
  {
    objc_msgSend(v8, "groundPointFromScreenPoint:");
  }
  else
  {
    long long v70 = 0u;
    long long v71 = 0u;
  }

  if ((_BYTE)v70)
  {
    double v45 = (double *)[v8 position];
    double v46 = v45[1];
    double v47 = *v45 - *((double *)&v70 + 1);
    double v48 = v45[2];
    double v49 = -((v46 - *(double *)&v71) * v37 - (v48 - *((double *)&v71 + 1)) * v36);
    double v50 = -((v48 - *((double *)&v71 + 1)) * v35 - v47 * v37);
    double v51 = -(v47 * v36 - (v46 - *(double *)&v71) * v35);
    double v52 = v50 + v50;
    double v53 = v51 + v51;
    *(double *)&long long v68 = *v45 + v53 * v36 + (v49 + v49) * v32.__cosval - v52 * v37;
    *((double *)&v68 + 1) = v46 - v53 * v35 + (v49 + v49) * v37 + v52 * v32.__cosval;
    *(double *)&long long v69 = v48 + v53 * v32.__cosval + v52 * v35 - (v49 + v49) * v36;
    [v8 setPosition:&v68];
    [v8 setOrientation:v72];
  }
  else
  {
    [v8 setOrientation:v72];
    id v54 = objc_loadWeakRetained((id *)p_cameraController);
    [v54 centerScreenPoint];
    if (v8)
    {
      objc_msgSend(v8, "groundPointFromScreenPoint:");
    }
    else
    {
      long long v68 = 0u;
      long long v69 = 0u;
    }

    double v55 = (double *)[v8 position];
    double v57 = *((double *)&v68 + 1);
    double v56 = *(double *)&v69;
    double v59 = *v55;
    double v58 = v55[1];
    double v60 = *(double *)[v8 position];
    double v61 = *(double *)([v8 position] + 8);
    double v62 = *(double *)([v8 position] + 16);
    v67[0] = v59 - v57 + v60;
    v67[1] = v58 - v56 + v61;
    v67[2] = v62;
    [v8 setPosition:v67];
  }
  self->_currentPitch = v31;
  id v63 = objc_loadWeakRetained((id *)p_cameraController);
  int v64 = [v63 isPitched];

  if (((v22 | v64 ^ 1) & 1) == 0)
  {
    id v65 = objc_loadWeakRetained((id *)p_cameraController);
    long long v66 = [v65 cameraDelegate];
    [v66 mapLayerDidBecomePitched:1];
    goto LABEL_24;
  }
  if (((v22 ^ 1 | v64) & 1) == 0)
  {
    id v65 = objc_loadWeakRetained((id *)p_cameraController);
    long long v66 = [v65 cameraDelegate];
    [v66 mapLayerDidBecomePitched:0];
LABEL_24:
  }
}

- (void)beginPitch:(CGPoint)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  double v4 = [WeakRetained vkCamera];
  [v4 pitch];
  self->_double beganPitch = v5;
}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  int v9 = [WeakRetained vkCamera];

  if (v9)
  {
    objc_msgSend(v9, "groundPointFromScreenPoint:", x, y);
    if (v27)
    {
      __double2 v10 = __sincos_stret(a3 * 0.5);
      double v11 = (double *)[v9 position];
      double v12 = v10.__sinval * (*v11 - v28 + *v11 - v28);
      -[VKMapGestureCameraController positionClampedToCameraRestriction:](self, "positionClampedToCameraRestriction:", *v11 - v12 * v10.__sinval + v10.__sinval * -2.0 * (v11[1] - v29) * v10.__cosval, v11[1] + v12 * v10.__cosval + v10.__sinval * -2.0 * (v11[1] - v29) * v10.__sinval, v11[2]);
      v26[0] = v13;
      v26[1] = v14;
      v26[2] = v15;
      [v9 setPosition:v26];
      uint64_t v16 = [v9 orientation];
      float64x2_t v17 = *(float64x2_t *)(v16 + 16);
      float64x2_t v18 = vmulq_n_f64(*(float64x2_t *)v16, v10.__cosval);
      int8x16_t v19 = (int8x16_t)vmulq_n_f64(*(float64x2_t *)v16, v10.__sinval);
      float64x2_t v20 = (float64x2_t)vextq_s8(v19, v19, 8uLL);
      *(void *)&long long v21 = *(_OWORD *)&vsubq_f64(v18, v20);
      *((void *)&v21 + 1) = *(void *)&vaddq_f64(v18, v20).f64[1];
      float64x2_t v22 = vmulq_n_f64(v17, v10.__cosval);
      int8x16_t v23 = (int8x16_t)vmulq_n_f64(v17, v10.__sinval);
      float64x2_t v24 = (float64x2_t)vextq_s8(v23, v23, 8uLL);
      *(void *)&v18.f64[0] = *(_OWORD *)&vaddq_f64(v22, v24);
      v18.f64[1] = vsubq_f64(v22, v24).f64[1];
      v25[0] = v21;
      v25[1] = v18;
      [v9 setOrientation:v25];
    }
  }
}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  uint64_t v14 = [WeakRetained vkCamera];

  id v15 = objc_loadWeakRetained((id *)p_cameraController);
  int v16 = [v15 isPitched];

  if (!v16)
  {
    if (v14)
    {
      objc_msgSend(v14, "groundPointFromScreenPoint:", v10, v9);
      if (LOBYTE(v57.var0._rotation._imaginary._e[1]))
      {
        double v4 = v57.var0._rotation._imaginary._e[2];
        double scalar = v57.var0._rotation._scalar;
        int v29 = 1;
      }
      else
      {
        int v29 = 0;
      }
      objc_msgSend(v14, "groundPointFromScreenPoint:", x, y);
      int v30 = LOBYTE(v57.var0._rotation._imaginary._e[1]);
      if (LOBYTE(v57.var0._rotation._imaginary._e[1]))
      {
        int v30 = 1;
        double x = v57.var0._rotation._imaginary._e[2];
        double v5 = v57.var0._rotation._scalar;
      }
    }
    else
    {
      int v30 = 0;
      int v29 = 0;
    }
    goto LABEL_18;
  }
  [v14 pitch];
  double v18 = v17;
  [v14 rightVector];
  double v51 = v20;
  double v52 = v19;
  double v53 = v21;
  v54.double x = x;
  __double2 v22 = __sincos_stret(v18 * -0.5);
  int8x16_t v23 = (double *)[v14 orientation];
  double v24 = *v23;
  double v25 = v23[1];
  double v27 = v23[2];
  double v26 = v23[3];
  id v28 = objc_loadWeakRetained((id *)p_cameraController);
  [v28 centerScreenPoint];
  if (v14)
  {
    objc_msgSend(v14, "groundPointFromScreenPoint:");
  }
  else
  {
    long long v62 = 0u;
    long long v63 = 0u;
  }

  if ((_BYTE)v62)
  {
    CGFloat v49 = y;
    v50.double x = v10;
    v50.double y = v9;
    double v31 = (double *)[v14 position];
    double v33 = *v31;
    double v32 = v31[1];
    double v34 = v31[2];
    if (v14)
    {
      [v14 cameraState];
    }
    else
    {
      uint64_t v59 = 0;
      uint64_t v60 = 0;
      uint64_t v61 = 0;
    }
    double v35 = v22.__sinval / sqrt(v53 * v53 + v52 * v52 + v51 * v51);
    double v36 = v35 * v53;
    double v37 = v35 * v52;
    double v38 = v35 * v51;
    double v39 = -((v32 - *(double *)&v63) * v38 - (v34 - *((double *)&v63 + 1)) * v37);
    double v40 = -((v34 - *((double *)&v63 + 1)) * v36 - (v33 - *((double *)&v62 + 1)) * v38);
    double v41 = -((v33 - *((double *)&v62 + 1)) * v37 - (v32 - *(double *)&v63) * v36);
    double v42 = v40 + v40;
    double v43 = v41 + v41;
    v57.var2._value = v24 * v38 + v25 * v22.__cosval - v27 * v36 + v26 * v37;
    v57.var3 = v27 * v22.__cosval - (v24 * v37 - v25 * v36) + v26 * v38;
    double v58 = -(v24 * v36 + v25 * v37 + v27 * v38 - v26 * v22.__cosval);
    v57.var0._rotation._imaginary._e[1] = v33 + v43 * v37 + (v39 + v39) * v22.__cosval - v42 * v38;
    v57.var0._rotation._imaginary._e[2] = v32 - v43 * v36 + (v39 + v39) * v38 + v42 * v22.__cosval;
    v57.var0._rotation._double scalar = v34 + v43 * v22.__cosval + v42 * v36 - (v39 + v39) * v37;
    v57.var1 = v27 * v37 - (v25 * v38 - v24 * v22.__cosval) + v26 * v36;
    double v9 = v50.y;
    double v10 = v50.x;
    VKCameraMakeGroundPoint(&v57, v50, v37, &v57.var0._rotation._imaginary._e[1]);
    int v29 = LOBYTE(v57.var0._translation._e[0]);
    double v4 = v57.var0._translation._e[1];
    double scalar = v57.var0._translation._e[2];
    v64.double x = v54.x;
    v64.double y = v49;
    VKCameraMakeGroundPoint(&v57, v64, v44, &v57.var0._rotation._imaginary._e[1]);
    int v30 = LOBYTE(v57.var0._translation._e[0]);
    double x = v57.var0._translation._e[1];
    double v5 = v57.var0._translation._e[2];
LABEL_18:
    if (v30 && v29)
    {
      double v45 = (double *)[v14 position];
      -[VKMapGestureCameraController positionClampedToCameraRestriction:delta:](self, "positionClampedToCameraRestriction:delta:", *v45, v45[1], v45[2], x - v4, v5 - scalar, 0.0);
      v54.double y = v46;
      uint64_t v55 = v47;
      uint64_t v56 = v48;
      [v14 setPosition:&v54.y];
      self->_panLastScreenPoint.double x = v10;
      self->_panLastScreenPoint.double y = v9;
    }
  }
}

- (void)endZoom:(CGPoint)a3
{
  if (self->_zoomPreviousT._value.data[0]) {
    self->_zoomPreviousT._value.data[0] = 0;
  }
  if (self->_rubberbandZoomStartFactor._value.data[0]) {
    self->_rubberbandZoomStartFactor._value.data[0] = 0;
  }
}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  double v11 = [WeakRetained vkCamera];

  BOOL v12 = [(VKGestureCameraBehavior *)self allowsZoomRubberbanding];
  double v13 = 1.0 - 1.0 / a4;
  if (v12 && self->_zoomPreviousT._value.data[0]) {
    double v13 = *(double *)&self->_zoomPreviousT._hasValue;
  }
  if (!v11) {
    goto LABEL_24;
  }
  objc_msgSend(v11, "groundPointFromScreenPoint:", x, y);
  if (!v42) {
    goto LABEL_24;
  }
  uint64_t v14 = (float64x2_t *)[v11 position];
  float v15 = v13;
  double v16 = v15;
  double v17 = (v14[1].f64[0] - v44 * v16) / (1.0 - v16);
  double v18 = 1.0 / a5;
  float64x2_t v39 = vdivq_f64(vmlsq_lane_f64(*v14, v43, v16, 0), (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 - v16), 0));
  double v40 = 1.0 - 1.0 / a5;
  float64x2_t v37 = vmulq_n_f64(vsubq_f64(v43, v39), v40);
  double v19 = v17 + (v44 - v17) * v40;
  if (!v12 || ([v11 minHeight], v19 >= v20) && (objc_msgSend(v11, "maxHeight"), v19 <= v21))
  {
    if (self->_rubberbandZoomStartFactor._value.data[0]) {
      self->_rubberbandZoomStartFactor._value.data[0] = 0;
    }
    objc_msgSend(v11, "minHeight", *(_OWORD *)&v37);
    double v30 = v29;
    [v11 maxHeight];
    goto LABEL_16;
  }
  p_rubberbandZoomStartFactor = &self->_rubberbandZoomStartFactor;
  if (!self->_rubberbandZoomStartFactor._value.data[0])
  {
    *(double *)&p_rubberbandZoomStartFactor->_hasValue = a5;
    self->_rubberbandZoomStartFactor._value.data[0] = 1;
    [v11 minHeight];
    double v30 = v33;
    [v11 maxHeight];
LABEL_16:
    double v32 = fmin(fmax(v19, v30), v31);
    double v27 = v40;
    goto LABEL_22;
  }
  [v11 position];
  if (self->_rubberbandZoomStartFactor._value.data[0])
  {
    double v23 = *(double *)&p_rubberbandZoomStartFactor->_hasValue;
    GEOConfigGetDouble();
    double v25 = 1.0 / v23;
    double v26 = 1.0 - 1.0 / v23;
    double v27 = v40;
    if (v26 >= v40)
    {
      if (v40 >= v26)
      {
LABEL_21:
        float64x2_t v37 = vmulq_n_f64(vsubq_f64(v43, v39), v27);
        double v32 = v17 + (v44 - v17) * v27;
LABEL_22:
        *(double *)&self->_zoomPreviousT._hasValue = v27;
        self->_zoomPreviousT._value.data[0] = 1;
        if (v32 != *(double *)(objc_msgSend(v11, "position", *(_OWORD *)&v37) + 16))
        {
          -[VKMapGestureCameraController positionClampedToCameraRestriction:](self, "positionClampedToCameraRestriction:", vaddq_f64(v38, v39), v32);
          v41[0] = v34;
          v41[1] = v35;
          v41[2] = v36;
          [v11 setPosition:v41];
        }
LABEL_24:

        return;
      }
      double v28 = 1.0 / ((v18 - v25) * 0.55 / v24 + 1.0) - 1.0;
    }
    else
    {
      double v28 = 1.0 / ((v18 - v25) * 0.55 / v24 - 1.0) + 1.0;
    }
    double v27 = v26 + v28 * v24;
    goto LABEL_21;
  }
  std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
}

@end