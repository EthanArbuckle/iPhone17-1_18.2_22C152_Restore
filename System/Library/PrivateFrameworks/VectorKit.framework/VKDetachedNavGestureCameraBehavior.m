@interface VKDetachedNavGestureCameraBehavior
- (VKDetachedNavGestureCameraBehavior)initWithNavCameraController:(id)a3;
- (void)beginPitch:(CGPoint)a3;
- (void)dealloc;
- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5;
- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4;
- (void)updatePitch:(CGPoint)a3 degrees:(double)a4;
- (void)updatePitch:(CGPoint)a3 translation:(double)a4;
- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4;
- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5;
@end

@implementation VKDetachedNavGestureCameraBehavior

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapZoomAnimation, 0);
  objc_destroyWeak((id *)&self->_navCameraController);
}

- (void)updatePitch:(CGPoint)a3 degrees:(double)a4
{
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (!WeakRetained) {
    return;
  }
  v8 = WeakRetained;
  [WeakRetained camera];
  if (*((void *)&v55 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v55 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**((void **)&v55 + 1) + 16))(*((void *)&v55 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v55 + 1));

    if (!(void)v55) {
      return;
    }
  }
  else
  {

    if (!(void)v55) {
      return;
    }
  }
  id v9 = objc_loadWeakRetained((id *)p_cameraController);
  [v9 camera];
  long long v10 = *(_OWORD *)(*(void *)&v50 + 24);
  long long v55 = *(_OWORD *)(*(void *)&v50 + 8);
  long long v56 = v10;
  long long v57 = *(_OWORD *)(*(void *)&v50 + 40);
  uint64_t v58 = *(void *)(*(void *)&v50 + 56);
  if (v51 != 0.0 && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v51 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**(void **)&v51 + 16))(*(void *)&v51);
    std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v51);
  }

  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v50, (double *)&v55);
  long double v11 = v50;
  *(double *)&v12 = v51;
  double v13 = v52;
  double v14 = sqrt(v11 * v11 + *(double *)&v12 * *(double *)&v12);
  double v15 = atan2(v52, v14 * 0.996647189);
  long double v16 = atan2(*(long double *)&v12, v11);
  __double2 v17 = __sincos_stret(v15);
  double v18 = atan2(v13 + v17.__sinval * v17.__sinval * 42841.3115 * v17.__sinval, v14 + v17.__cosval * v17.__cosval * -42697.6727 * v17.__cosval);
  __double2 v19 = __sincos_stret(v18);
  *(double *)&long long v53 = v18;
  *((long double *)&v53 + 1) = v16;
  double v54 = v14 / v19.__cosval + -6378137.0 / sqrt(v19.__sinval * v19.__sinval * -0.00669437999 + 1.0);
  id v20 = objc_loadWeakRetained((id *)p_cameraController);
  md::MapDataAccess::heightAtCoordinate((unsigned __int8 *)[v20 mapDataAccess], &v53);
  double v22 = v21;
  double v23 = *(double *)&v56;
  if (!v24) {
    double v22 = *(double *)&v56;
  }
  double v25 = v22 + 10.0;

  double v26 = acos((v25 - v23) / *((double *)&v56 + 1));
  p_navCameraController = &self->_navCameraController;
  id v28 = objc_loadWeakRetained((id *)p_navCameraController);
  v29 = v28;
  if (v28)
  {
    [v28 maxCameraPitch];
    double v30 = v50;
  }
  else
  {
    double v50 = 0.0;
    double v30 = 0.0;
  }
  id v31 = objc_loadWeakRetained((id *)p_navCameraController);
  v32 = v31;
  if (v31)
  {
    [v31 minCameraPitch];
    double v33 = v49;
  }
  else
  {
    double v49 = 0.0;
    double v33 = 0.0;
  }
  double v34 = a4 * 0.0174532925;
  double v35 = fmax(v33, v30);
  if (v35 < v34)
  {
    double v36 = 0.0698131701 / ((v35 - v34) * 7.87816968 + -1.0);
    double v37 = v35 + 0.0698131701;
LABEL_22:
    double v34 = v36 + v37;
    goto LABEL_23;
  }
  if (v34 < v33)
  {
    double v37 = 0.0698131701 / ((v33 - v34) * 7.87816968 + 1.0);
    double v36 = v33 + -0.0698131701;
    goto LABEL_22;
  }
LABEL_23:

  id v38 = objc_loadWeakRetained((id *)p_navCameraController);
  v39 = v38;
  if (v38)
  {
    [v38 minCameraPitch];
    double v40 = v50;
  }
  else
  {
    double v50 = 0.0;
    double v40 = 0.0;
  }
  id v41 = objc_loadWeakRetained((id *)p_navCameraController);
  v42 = v41;
  if (v41)
  {
    [v41 maxCameraPitch];
    double v43 = v49 + 0.0698131701;
  }
  else
  {
    double v43 = 0.0698131701;
  }
  double v44 = fmin(fmax(v34, v40), fmin(v26, v43));

  *(double *)&long long v57 = v44;
  id v45 = objc_loadWeakRetained((id *)p_cameraController);
  v46 = v45;
  if (v45)
  {
    [v45 camera];
    double v47 = v50;
    v48 = *(std::__shared_weak_count **)&v51;
    *(_OWORD *)(*(void *)&v50 + 8) = v55;
    *(_OWORD *)(*(void *)&v47 + 24) = v56;
    *(_OWORD *)(*(void *)&v47 + 40) = v57;
    *(void *)(*(void *)&v47 + 56) = v58;
    if (v48)
    {
      if (!atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
    }
  }
  else
  {
    double v50 = 0.0;
    double v51 = 0.0;
    MEMORY[8] = v55;
    MEMORY[0x18] = v56;
    MEMORY[0x28] = v57;
    MEMORY[0x38] = v58;
  }
}

- (void)updatePitch:(CGPoint)a3 translation:(double)a4
{
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (!WeakRetained) {
    return;
  }
  v8 = WeakRetained;
  [WeakRetained camera];
  if (*((void *)&v56 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v56 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**((void **)&v56 + 1) + 16))(*((void *)&v56 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v56 + 1));

    if (!(void)v56) {
      return;
    }
  }
  else
  {

    if (!(void)v56) {
      return;
    }
  }
  id v9 = objc_loadWeakRetained((id *)p_cameraController);
  [v9 camera];
  long long v10 = *(_OWORD *)(*(void *)&v51 + 24);
  long long v56 = *(_OWORD *)(*(void *)&v51 + 8);
  long long v57 = v10;
  long long v58 = *(_OWORD *)(*(void *)&v51 + 40);
  uint64_t v59 = *(void *)(*(void *)&v51 + 56);
  if (v52 != 0.0 && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v52 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**(void **)&v52 + 16))(*(void *)&v52);
    std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v52);
  }

  gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v51, (double *)&v56);
  long double v11 = v51;
  *(double *)&v12 = v52;
  double v13 = v53;
  double v14 = sqrt(v11 * v11 + *(double *)&v12 * *(double *)&v12);
  double v15 = atan2(v53, v14 * 0.996647189);
  long double v16 = atan2(*(long double *)&v12, v11);
  __double2 v17 = __sincos_stret(v15);
  double v18 = atan2(v13 + v17.__sinval * v17.__sinval * 42841.3115 * v17.__sinval, v14 + v17.__cosval * v17.__cosval * -42697.6727 * v17.__cosval);
  __double2 v19 = __sincos_stret(v18);
  *(double *)&long long v54 = v18;
  *((long double *)&v54 + 1) = v16;
  double v55 = v14 / v19.__cosval + -6378137.0 / sqrt(v19.__sinval * v19.__sinval * -0.00669437999 + 1.0);
  id v20 = objc_loadWeakRetained((id *)p_cameraController);
  md::MapDataAccess::heightAtCoordinate((unsigned __int8 *)[v20 mapDataAccess], &v54);
  double v22 = v21;
  double v23 = *(double *)&v57;
  if (!v24) {
    double v22 = *(double *)&v57;
  }
  double v25 = v22 + 10.0;

  double v26 = acos((v25 - v23) / *((double *)&v57 + 1));
  double value = self->_startPitch._value;
  p_navCameraController = &self->_navCameraController;
  id v29 = objc_loadWeakRetained((id *)p_navCameraController);
  double v30 = v29;
  if (v29)
  {
    [v29 maxCameraPitch];
    double v31 = v51;
  }
  else
  {
    double v51 = 0.0;
    double v31 = 0.0;
  }
  id v32 = objc_loadWeakRetained((id *)p_navCameraController);
  double v33 = v32;
  if (v32)
  {
    [v32 minCameraPitch];
    double v34 = v50;
  }
  else
  {
    double v50 = 0.0;
    double v34 = 0.0;
  }
  double v35 = value - a4;
  double v36 = fmax(v34, v31);
  if (v36 < v35)
  {
    double v37 = 0.0698131701 / ((v36 - v35) * 7.87816968 + -1.0);
    double v38 = v36 + 0.0698131701;
LABEL_22:
    double v35 = v37 + v38;
    goto LABEL_23;
  }
  if (v35 < v34)
  {
    double v38 = 0.0698131701 / ((v34 - v35) * 7.87816968 + 1.0);
    double v37 = v34 + -0.0698131701;
    goto LABEL_22;
  }
LABEL_23:

  id v39 = objc_loadWeakRetained((id *)p_navCameraController);
  double v40 = v39;
  if (v39)
  {
    [v39 minCameraPitch];
    double v41 = v51;
  }
  else
  {
    double v51 = 0.0;
    double v41 = 0.0;
  }
  id v42 = objc_loadWeakRetained((id *)p_navCameraController);
  double v43 = v42;
  if (v42)
  {
    [v42 maxCameraPitch];
    double v44 = v50 + 0.0698131701;
  }
  else
  {
    double v44 = 0.0698131701;
  }
  double v45 = fmin(fmax(v35, v41), fmin(v26, v44));

  *(double *)&long long v58 = v45;
  id v46 = objc_loadWeakRetained((id *)p_cameraController);
  double v47 = v46;
  if (v46)
  {
    [v46 camera];
    double v48 = v51;
    double v49 = *(std::__shared_weak_count **)&v52;
    *(_OWORD *)(*(void *)&v51 + 8) = v56;
    *(_OWORD *)(*(void *)&v48 + 24) = v57;
    *(_OWORD *)(*(void *)&v48 + 40) = v58;
    *(void *)(*(void *)&v48 + 56) = v59;
    if (v49)
    {
      if (!atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }
  }
  else
  {
    double v51 = 0.0;
    double v52 = 0.0;
    MEMORY[8] = v56;
    MEMORY[0x18] = v57;
    MEMORY[0x28] = v58;
    MEMORY[0x38] = v59;
  }
}

- (void)beginPitch:(CGPoint)a3
{
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    [WeakRetained camera];
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);

      if (!v9) {
        return;
      }
    }
    else
    {

      if (!v9) {
        return;
      }
    }
    id v7 = objc_loadWeakRetained((id *)p_cameraController);
    [v7 camera];
    double v8 = *(double *)(v9 + 40);
    if (v10)
    {
      if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)())v10->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v10);
      }
    }

    self->_startPitch._double value = v8;
  }
}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (WeakRetained)
  {
    long long v10 = WeakRetained;
    [WeakRetained camera];
    if (*(void *)&v190.f64[1]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v190.f64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**(void **)&v190.f64[1] + 16))(*(void *)&v190.f64[1]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v190.f64[1]);

      if (!*(void *)&v190.f64[0]) {
        return;
      }
    }
    else
    {

      if (!*(void *)&v190.f64[0]) {
        return;
      }
    }
    id v11 = objc_loadWeakRetained((id *)p_cameraController);
    uint64_t v12 = [v11 mapDataAccess];

    id v13 = objc_loadWeakRetained((id *)p_cameraController);
    [v13 camera];
    long long v14 = *(_OWORD *)(*(void *)&v190.f64[0] + 24);
    float64x2_t v181 = *(float64x2_t *)(*(void *)&v190.f64[0] + 8);
    long long v182 = v14;
    long long v183 = *(_OWORD *)(*(void *)&v190.f64[0] + 40);
    double v184 = *(double *)(*(void *)&v190.f64[0] + 56);
    if (*(void *)&v190.f64[1]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v190.f64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**(void **)&v190.f64[1] + 16))(*(void *)&v190.f64[1]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v190.f64[1]);
    }

    p_navCameraController = &self->_navCameraController;
    id v16 = objc_loadWeakRetained((id *)&self->_navCameraController);
    __double2 v17 = [v16 canvas];
    [v17 size];
    double v19 = v18;
    id v20 = objc_loadWeakRetained((id *)p_navCameraController);
    double v21 = [v20 canvas];
    [v21 size];
    v22.f64[0] = v19 * x;
    v22.f64[1] = v23 * (1.0 - y);
    float64x2_t v173 = v22;

    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v178, v12, (uint64_t)&v181, 0, v173);
    double v25 = v178;
    double v24 = v179;
    double v26 = v180;
    double v27 = -3.14159265;
    if (v178 != -3.14159265 || v179 != -3.14159265 || v180 != 0.0)
    {
      if (*(unsigned char *)(v12 + 8) == 2)
      {
        float64x2_t v28 = v181;
        long long v29 = v182;
        long long v30 = v183;
        double v31 = v184;
      }
      else
      {
        double v32 = 0.0;
        unsigned int v33 = *(unsigned __int8 *)(v12 + 9) - 1;
        if (v33 >= 3)
        {
          if (*(unsigned char *)(v12 + 9))
          {
            double v158 = 1.0;
            float64x2_t v175 = 0u;
            double v73 = 0.0;
          }
          else
          {
            double v162 = v184;
            double v58 = *(double *)&v183;
            double v176 = v181.f64[0];
            double v155 = v179;
            double v59 = *((double *)&v183 + 1);
            __double2 v60 = __sincos_stret((*((double *)&v183 + 1) - v184) * 0.5);
            __double2 v61 = __sincos_stret(v58 * 0.5);
            double v149 = v60.__sinval * v61.__sinval;
            double v62 = v60.__cosval * v61.__sinval * -2.0;
            double v171 = v62 * (v60.__cosval * v61.__sinval) + 1.0 - (v149 + v149) * v149;
            __double2 v63 = __sincos_stret((v162 + v59) * 0.5);
            double v159 = v62 * (v63.__cosval * v61.__cosval) + (v149 + v149) * (v63.__sinval * v61.__cosval);
            double v152 = -(v62 * (v63.__sinval * v61.__cosval) - (v149 + v149) * (v63.__cosval * v61.__cosval));
            double v64 = *(double *)&v182;
            double v163 = v181.f64[1];
            long double v65 = tan(v176 * 0.5 + 0.785398163);
            double v164 = v163 * 0.159154943 + 0.5;
            double v140 = v26;
            long double v66 = log(v65) * 0.159154943 + 0.5;
            double v146 = v66 + v159 * (*((double *)&v182 + 1) * 0.0000000249532021);
            double v147 = v164 + v152 * (*((double *)&v182 + 1) * 0.0000000249532021);
            double v172 = v64 * 0.0000000249532021 + v171 * (*((double *)&v182 + 1) * 0.0000000249532021);
            double v67 = v60.__cosval * v61.__sinval;
            double v142 = (v67 + v67) * (v60.__sinval * v61.__sinval)
                 + v63.__sinval * v61.__cosval * -2.0 * (v63.__cosval * v61.__cosval);
            double v158 = 1.0;
            double v148 = -(v63.__sinval * v61.__cosval * -2.0 * (v60.__sinval * v61.__sinval)
                   - (v67 + v67) * (v63.__cosval * v61.__cosval));
            double v151 = v63.__sinval * v61.__cosval * -2.0 * (v63.__sinval * v61.__cosval) + 1.0 - (v67 + v67) * v67;
            long double v68 = tan(v25 * 0.5 + 0.785398163);
            double v144 = v155 * 0.159154943 + 0.5;
            double v145 = log(v68) * 0.159154943 + 0.5;
            double v32 = 0.0;
            long double v69 = exp(v66 * 6.28318531 + -3.14159265);
            long double v177 = atan(v69) * 2.0 + -1.57079633;
            double v25 = v66;
            double v26 = v140;
            long double v70 = fmod(v164 * 6.28318531, 6.28318531);
            double v24 = v164;
            long double v71 = fmod(v70 + 6.28318531, 6.28318531);
            double v27 = v142;
            v72.f64[0] = v177;
            v72.f64[1] = v71 + -3.14159265;
            float64x2_t v175 = v72;
            double v143 = v172 * 40075017.0;
            double v167 = v64;
            double v73 = v64;
          }
          double v170 = v73;
          double v57 = 0.0;
        }
        else
        {
          double v138 = a3;
          double v154 = v179;
          gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v190.f64, v181.f64);
          double v34 = v181.f64[1];
          double v35 = *(double *)&v182;
          __double2 v36 = __sincos_stret(v181.f64[0]);
          double v37 = 6378137.0 / sqrt(1.0 - v36.__sinval * v36.__sinval * 0.00669437999);
          double v38 = (v37 + v35) * v36.__cosval;
          __double2 v39 = __sincos_stret(v34);
          long double v161 = v38 * v39.__cosval;
          long double v40 = v38 * v39.__sinval;
          double v167 = (v35 + v37 * 0.99330562) * v36.__sinval;
          double v146 = v190.f64[1];
          double v147 = v190.f64[0];
          double v41 = *(double *)&v192;
          double v141 = (v41 + v41) * *((double *)&v192 + 1) + *((double *)&v193 + 1) * (*(double *)&v193 * -2.0);
          double v143 = v191;
          double v148 = -(*(double *)&v193 * -2.0 * *((double *)&v192 + 1) - (v41 + v41) * *((double *)&v193 + 1));
          double v151 = *(double *)&v193 * -2.0 * *(double *)&v193 + 1.0 - (v41 + v41) * v41;
          __double2 v42 = __sincos_stret(v25);
          double v43 = 6378137.0 / sqrt(1.0 - v42.__sinval * v42.__sinval * 0.00669437999);
          double v44 = (v43 + v26) * v42.__cosval;
          __double2 v45 = __sincos_stret(v154);
          double v144 = v44 * v45.__cosval;
          double v145 = v44 * v45.__sinval;
          double v139 = v26;
          double v26 = (v26 + v43 * 0.99330562) * v42.__sinval;
          double v46 = sqrt(v161 * v161 + v40 * v40);
          double v47 = atan2(v167, v46 * 0.996647189);
          long double v157 = atan2(v40, v161);
          __double2 v48 = __sincos_stret(v47);
          double v174 = atan2(v167 + v48.__sinval * v48.__sinval * 42841.3115 * v48.__sinval, v46 + v48.__cosval * v48.__cosval * -42697.6727 * v48.__cosval);
          __double2 v49 = __sincos_stret(v174);
          double v170 = v46 / v49.__cosval - 6378137.0 / sqrt(1.0 - v49.__sinval * v49.__sinval * 0.00669437999);
          v50.f64[0] = v174;
          v50.f64[1] = v157;
          float64x2_t v175 = v50;
          __double2 v51 = __sincos_stret(v25);
          double v52 = 6378137.0 / sqrt(v51.__sinval * v51.__sinval * -0.00669437999 + 1.0);
          double v53 = (v52 + v139) * v51.__cosval;
          __double2 v54 = __sincos_stret(v154);
          double v55 = (v139 + v52 * 0.99330562) * v51.__sinval;
          double v56 = 1.0
              / sqrt(v53 * v54.__cosval * (v53 * v54.__cosval) + v53 * v54.__sinval * (v53 * v54.__sinval) + v55 * v55);
          double v32 = v56 * (v53 * v54.__cosval);
          double v57 = v56 * (v53 * v54.__sinval);
          double v158 = v56 * v55;
          double v25 = v40;
          a3 = v138;
          double v24 = v161;
          double v27 = v141;
        }
        __double2 v74 = __sincos_stret(a3 * 0.5);
        double v75 = -((v146 - v145) * (v158 * v74.__sinval) - (v143 - v26) * (v57 * v74.__sinval));
        double v76 = -((v143 - v26) * (v32 * v74.__sinval) - (v147 - v144) * (v158 * v74.__sinval));
        double v77 = -((v147 - v144) * (v57 * v74.__sinval) - (v146 - v145) * (v32 * v74.__sinval));
        double v78 = v76 + v76;
        double v79 = v77 + v77;
        double v80 = v147 + v79 * (v57 * v74.__sinval) + (v75 + v75) * v74.__cosval;
        double v81 = v78 * (v158 * v74.__sinval);
        double v82 = v146 - v79 * (v32 * v74.__sinval) + (v75 + v75) * (v158 * v74.__sinval) + v78 * v74.__cosval;
        double v83 = v143 + v79 * v74.__cosval + v78 * (v32 * v74.__sinval);
        double v84 = (v75 + v75) * (v57 * v74.__sinval);
        double v85 = -((v25 - v145) * (v158 * v74.__sinval) - (v167 - v26) * (v57 * v74.__sinval));
        double v86 = -((v167 - v26) * (v32 * v74.__sinval) - (v24 - v144) * (v158 * v74.__sinval));
        double v87 = -((v24 - v144) * (v57 * v74.__sinval) - (v25 - v145) * (v32 * v74.__sinval));
        double v88 = v86 + v86;
        double v89 = v87 + v87;
        double v90 = v24 + v89 * (v57 * v74.__sinval) + (v85 + v85) * v74.__cosval - v88 * (v158 * v74.__sinval);
        double v91 = v25 - v89 * (v32 * v74.__sinval) + (v85 + v85) * (v158 * v74.__sinval) + v88 * v74.__cosval;
        double v92 = v167 + v89 * v74.__cosval + v88 * (v32 * v74.__sinval) - (v85 + v85) * (v57 * v74.__sinval);
        double v93 = -((v151 - v145) * (v158 * v74.__sinval) - (v148 - v26) * (v57 * v74.__sinval));
        double v94 = -((v148 - v26) * (v32 * v74.__sinval) - (v27 - v144) * (v158 * v74.__sinval));
        double v95 = -((v27 - v144) * (v57 * v74.__sinval) - (v151 - v145) * (v32 * v74.__sinval));
        double v96 = v94 + v94;
        double v97 = v95 + v95;
        double v98 = v27 + v97 * (v57 * v74.__sinval) + (v93 + v93) * v74.__cosval - v96 * (v158 * v74.__sinval);
        double v99 = v151 - v97 * (v32 * v74.__sinval) + (v93 + v93) * (v158 * v74.__sinval) + v96 * v74.__cosval;
        double v100 = v148 + v97 * v74.__cosval + v96 * (v32 * v74.__sinval) - (v93 + v93) * (v57 * v74.__sinval);
        double v101 = 1.0;
        double v31 = 0.0;
        double v102 = 0.0;
        double v103 = 0.0;
        double v104 = 1.0;
        if (*(unsigned __int8 *)(v12 + 9) - 1 <= 2)
        {
          double v150 = v84;
          double v168 = v80;
          double v165 = v81;
          double v156 = v82;
          double v160 = v27 + v97 * (v57 * v74.__sinval) + (v93 + v93) * v74.__cosval - v96 * (v158 * v74.__sinval);
          double v153 = v83;
          double v105 = v99;
          double v106 = v90;
          double v107 = v91;
          double v108 = v100;
          double v109 = v92;
          __double2 v110 = __sincos_stret(v175.f64[0]);
          double v111 = 6378137.0 / sqrt(v110.__sinval * v110.__sinval * -0.00669437999 + 1.0);
          double v112 = (v111 + v170) * v110.__cosval;
          __double2 v113 = __sincos_stret(v175.f64[1]);
          double v101 = 1.0;
          double v92 = v109;
          double v100 = v108;
          double v91 = v107;
          double v90 = v106;
          double v99 = v105;
          double v84 = v150;
          double v83 = v153;
          double v82 = v156;
          double v98 = v160;
          double v81 = v165;
          double v80 = v168;
          double v31 = 0.0;
          double v114 = (v170 + v111 * 0.99330562) * v110.__sinval;
          double v115 = 1.0
               / sqrt(v112 * v113.__cosval * (v112 * v113.__cosval)+ v112 * v113.__sinval * (v112 * v113.__sinval)+ v114 * v114);
          double v102 = v115 * (v112 * v113.__cosval);
          double v103 = v115 * (v112 * v113.__sinval);
          double v104 = v115 * v114;
        }
        double v116 = v90 + v81 - v80;
        double v117 = v92 + v84 - v83;
        double v169 = sqrt(v116 * v116 + (v91 - v82) * (v91 - v82) + v117 * v117);
        double v118 = v101 / v169 * v116;
        double v119 = v101 / v169 * (v91 - v82);
        double v120 = v101 / v169 * v117;
        double v166 = acos(fmin(fmax(-(v118 * v102 + v119 * v103 + v120 * v104), -1.0), v101));
        __double2 v121 = __sincos_stret(v166);
        double v122 = v121.__cosval / sqrt(v98 * v98 + v99 * v99 + v100 * v100);
        double v123 = v118 * v121.__sinval + v122 * v98;
        double v124 = v119 * v121.__sinval + v122 * v99;
        double v125 = v120 * v121.__sinval + v122 * v100;
        long long v193 = 0u;
        long long v192 = 0u;
        float64x2_t v190 = v175;
        double v191 = v170;
        gdc::ViewDataAccess::rigidTransformForFrame(v185, **(unsigned char **)(v12 + 16), v190.f64);
        double v127 = v186;
        double v126 = v187;
        double v128 = v188;
        double v129 = -(v126 * v125 - v128 * v124) - (v126 * v125 - v128 * v124);
        double v130 = -(v128 * v123 - v127 * v125) - (v128 * v123 - v127 * v125);
        double v131 = -(v127 * v124 - v126 * v123) - (v127 * v124 - v126 * v123);
        long double v132 = atan2(-(v130 * v188 - (-(v123 - v131 * v187) - v129 * v189)), v124 + v131 * v186 + v130 * v189 - v129 * v188);
        *(double *)&long long v29 = v170;
        float64x2_t v28 = v175;
        *((double *)&v29 + 1) = v169;
        *(double *)&long long v133 = v166;
        *((long double *)&v133 + 1) = v132;
        long long v30 = v133;
      }
      float64x2_t v181 = v28;
      long long v182 = v29;
      long long v183 = v30;
      double v184 = v31;
      id v134 = objc_loadWeakRetained((id *)p_cameraController);
      v135 = v134;
      if (v134)
      {
        [v134 camera];
        float64x2_t v136 = v190;
        long long v137 = v182;
        *(float64x2_t *)(*(void *)&v190.f64[0] + 8) = v181;
        *(_OWORD *)(*(void *)&v136.f64[0] + 24) = v137;
        *(_OWORD *)(*(void *)&v136.f64[0] + 40) = v183;
        *(double *)(*(void *)&v136.f64[0] + 56) = v184;
        if (*(void *)&v136.f64[1])
        {
          if (!atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v136.f64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
          {
            (*(void (**)(void))(**(void **)&v136.f64[1] + 16))(*(void *)&v136.f64[1]);
            std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v136.f64[1]);
          }
        }
      }
      else
      {
        float64x2_t v190 = 0uLL;
        MEMORY[8] = v181;
        MEMORY[0x18] = v182;
        MEMORY[0x28] = v183;
        MEMORY[0x38] = *(void *)&v184;
      }
    }
  }
}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    [WeakRetained camera];
    if (*(void *)&v56[8]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v56[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**(void **)&v56[8] + 16))(*(void *)&v56[8]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v56[8]);

      if (!*(void *)v56) {
        return;
      }
    }
    else
    {

      if (!*(void *)v56) {
        return;
      }
    }
    id v12 = objc_loadWeakRetained((id *)p_cameraController);
    id v13 = (unsigned __int8 *)[v12 mapDataAccess];

    id v14 = objc_loadWeakRetained((id *)p_cameraController);
    [v14 camera];
    *(_OWORD *)double v56 = *(_OWORD *)(v51 + 8);
    long long v15 = *(_OWORD *)(v51 + 40);
    *(_OWORD *)&v56[16] = *(_OWORD *)(v51 + 24);
    *(_OWORD *)double v57 = v15;
    *(void *)&v57[16] = *(void *)(v51 + 56);
    if ((void)v52 && !atomic_fetch_add((atomic_ullong *volatile)(v52 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(*(void *)v52 + 16))(v52);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v52);
    }

    double v16 = *(double *)v56;
    uint64_t v51 = *(void *)v56;
    long long v40 = *(_OWORD *)&v56[8];
    long long v52 = *(_OWORD *)&v56[8];
    uint64_t v53 = *(void *)&v56[24];
    long long v55 = *(_OWORD *)&v57[8];
    uint64_t v54 = 0;
    p_navCameraController = &self->_navCameraController;
    id v18 = objc_loadWeakRetained((id *)&self->_navCameraController);
    double v19 = [v18 canvas];
    [v19 size];
    double v21 = v20;
    id v22 = objc_loadWeakRetained((id *)p_navCameraController);
    double v23 = [v22 canvas];
    [v23 size];
    v24.f64[0] = v21 * v7;
    v24.f64[1] = v25 * (1.0 - v6);
    float64x2_t v41 = v24;

    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v48, (uint64_t)v13, (uint64_t)&v51, 0, v41);
    id v26 = objc_loadWeakRetained((id *)p_navCameraController);
    double v27 = [v26 canvas];
    [v27 size];
    double v29 = v28;
    id v30 = objc_loadWeakRetained((id *)p_navCameraController);
    double v31 = [v30 canvas];
    [v31 size];
    v32.f64[0] = v29 * x;
    v32.f64[1] = v33 * (1.0 - y);
    float64x2_t v42 = v32;

    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v45, (uint64_t)v13, (uint64_t)&v51, 0, v42);
    if ((v48 != -3.14159265 || v49 != -3.14159265 || v50 != 0.0)
      && (v45 != -3.14159265 || v46 != -3.14159265 || v47 != 0.0))
    {
      *(double *)double v56 = fmax(fmin((v45 - v48 + v16) * 57.2957795, 75.0), -75.0) * 0.0174532925;
      long double v34 = fmod(3.14159265 - v49 + v46 + *(double *)&v40, 6.28318531);
      *(double *)&v56[8] = fmod(v34 + 6.28318531, 6.28318531) + -3.14159265;
      md::MapDataAccess::heightAtCoordinate(v13, v56);
      if (v36) {
        uint64_t v37 = v35;
      }
      else {
        uint64_t v37 = *((void *)&v40 + 1);
      }
      *(void *)&v56[16] = v37;
      id v38 = objc_loadWeakRetained((id *)p_cameraController);
      __double2 v39 = v38;
      if (v38)
      {
        [v38 camera];
        *(_OWORD *)(v43 + 8) = *(_OWORD *)v56;
        *(_OWORD *)(v43 + 24) = *(_OWORD *)&v56[16];
        *(_OWORD *)(v43 + 40) = *(_OWORD *)v57;
        *(void *)(v43 + 56) = *(void *)&v57[16];
        if (v44)
        {
          if (!atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)())v44->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v44);
          }
        }
      }
      else
      {
        MEMORY[8] = *(_OWORD *)v56;
        MEMORY[0x18] = *(_OWORD *)&v56[16];
        MEMORY[0x28] = *(_OWORD *)v57;
        MEMORY[0x38] = *(void *)&v57[16];
      }
    }
  }
}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  p_cameraController = &self->super._cameraController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._cameraController);
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    [WeakRetained camera];
    if (*(void *)&v65.f64[1]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v65.f64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**(void **)&v65.f64[1] + 16))(*(void *)&v65.f64[1]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v65.f64[1]);

      if (!*(void *)&v65.f64[0]) {
        return;
      }
    }
    else
    {

      if (!*(void *)&v65.f64[0]) {
        return;
      }
    }
    id v13 = objc_loadWeakRetained((id *)p_cameraController);
    uint64_t v14 = [v13 mapDataAccess];

    id v15 = objc_loadWeakRetained((id *)p_cameraController);
    [v15 camera];
    long long v16 = *(_OWORD *)(*(void *)&v63.f64[0] + 24);
    float64x2_t v65 = *(float64x2_t *)(*(void *)&v63.f64[0] + 8);
    long long v66 = v16;
    long long v67 = *(_OWORD *)(*(void *)&v63.f64[0] + 40);
    uint64_t v68 = *(void *)(*(void *)&v63.f64[0] + 56);
    if (*(void *)&v63.f64[1]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v63.f64[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**(void **)&v63.f64[1] + 16))(*(void *)&v63.f64[1]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v63.f64[1]);
    }

    p_navCameraController = &self->_navCameraController;
    id v18 = objc_loadWeakRetained((id *)p_navCameraController);
    double v19 = [v18 canvas];
    [v19 size];
    double v21 = v20;
    id v22 = objc_loadWeakRetained((id *)p_navCameraController);
    double v23 = [v22 canvas];
    [v23 size];
    v24.f64[0] = v21 * x;
    v24.f64[1] = v25 * (1.0 - y);
    float64x2_t v59 = v24;

    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v63, v14, (uint64_t)&v65, 0, v59);
    if (v63.f64[0] != -3.14159265 || v63.f64[1] != -3.14159265 || v64 != 0.0)
    {
      id v26 = objc_loadWeakRetained((id *)p_navCameraController);
      [v26 minZoomHeight];
      double v28 = v27;
      double v29 = *((double *)&v66 + 1);

      id v30 = objc_loadWeakRetained((id *)p_navCameraController);
      [v30 maxZoomHeight];
      double v32 = v31;

      uint64_t v33 = v66;
      float64x2_t v58 = v65;
      float64x2_t v60 = v63;
      id v34 = objc_loadWeakRetained((id *)p_navCameraController);
      [v34 minZoomHeight];
      double v36 = v35;
      id v37 = objc_loadWeakRetained((id *)p_navCameraController);
      [v37 maxZoomHeight];
      float v38 = 1.0 - 1.0 / a4;
      double v55 = v38;
      double v56 = 1.0 - v38;
      double v57 = 1.0 - 1.0 / a5;
      double v40 = fmin(fmax(v29 / v56 - v29 / v56 * v57, v36), v39);

      if (vabdd_f64(v40, v29) > 1.0)
      {
        float64x2_t v41 = vdivq_f64(vmlsq_lane_f64(v58, v60, v55, 0), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v56, 0));
        float64x2_t v65 = vmlaq_n_f64(v41, vsubq_f64(v60, v41), v57);
        *(void *)&long long v66 = v33;
        *((double *)&v66 + 1) = v40;
        id v42 = objc_loadWeakRetained((id *)p_cameraController);
        uint64_t v43 = v42;
        if (v42)
        {
          [v42 camera];
          *(float64x2_t *)(v61 + 8) = v65;
          *(_OWORD *)(v61 + 24) = v66;
          *(_OWORD *)(v61 + 40) = v67;
          *(void *)(v61 + 56) = v68;
          if (v62 && !atomic_fetch_add(&v62->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)())v62->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v62);
          }
        }
        else
        {
          MEMORY[8] = v65;
          MEMORY[0x18] = v66;
          MEMORY[0x28] = v67;
          MEMORY[0x38] = v68;
        }
      }
      id v44 = objc_loadWeakRetained((id *)p_navCameraController);
      [v44 minZoomHeight];
      double v46 = v45;
      double v47 = *((double *)&v66 + 1);

      id v48 = objc_loadWeakRetained((id *)p_navCameraController);
      [v48 maxZoomHeight];
      double v50 = v49;

      if (v28 >= v29 == v46 < v47)
      {
        id v51 = objc_loadWeakRetained((id *)p_navCameraController);
        long long v52 = [v51 cameraDelegate];
        [v52 mapLayerCanZoomInDidChange:v46 < v47];
      }
      if (v32 <= v29 == v50 > v47)
      {
        id v53 = objc_loadWeakRetained((id *)p_navCameraController);
        uint64_t v54 = [v53 cameraDelegate];
        [v54 mapLayerCanZoomOutDidChange:v50 > v47];
      }
    }
  }
}

- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a5;
  double startZoomScale = self->_startZoomScale;
  double v11 = exp2(a4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navCameraController);
  [WeakRetained minZoomScale];
  double v14 = v13;
  id v15 = objc_loadWeakRetained((id *)&self->_navCameraController);
  [v15 maxZoomScale];
  double v17 = v16;

  [(VKAnimation *)self->_tapZoomAnimation stop];
  id v18 = [[VKTimedAnimation alloc] initWithDuration:0.25];
  double v19 = fmin(fmax(startZoomScale * v11, v14), v17);
  tapZoomAnimation = self->_tapZoomAnimation;
  self->_tapZoomAnimation = v18;

  double v21 = self->_startZoomScale;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  *(double *)&v32[3] = v21;
  objc_initWeak(&location, self);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __71__VKDetachedNavGestureCameraBehavior_tapZoom_levels_completionHandler___block_invoke;
  v29[3] = &unk_1E5A985C0;
  objc_copyWeak(v30, &location);
  v30[1] = *(id *)&v21;
  v30[2] = *(id *)&v19;
  v30[3] = *(id *)&x;
  v30[4] = *(id *)&y;
  v29[4] = v32;
  [(VKTimedAnimation *)self->_tapZoomAnimation setStepHandler:v29];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __71__VKDetachedNavGestureCameraBehavior_tapZoom_levels_completionHandler___block_invoke_2;
  double v27 = &unk_1E5A98598;
  id v22 = v9;
  id v28 = v22;
  [(VKAnimation *)self->_tapZoomAnimation setCompletionHandler:&v24];
  id v23 = objc_loadWeakRetained((id *)&self->_navCameraController);
  md::AnimationRunner::runAnimation((md::MapEngine **)objc_msgSend(v23, "animationRunner", v24, v25, v26, v27), &self->_tapZoomAnimation->super);

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Block_object_dispose(v32, 8);
}

void __71__VKDetachedNavGestureCameraBehavior_tapZoom_levels_completionHandler___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v5 = *(double *)(a1 + 48) + (*(double *)(a1 + 56) - *(double *)(a1 + 48)) * a2;
    double v7 = WeakRetained;
    objc_msgSend(WeakRetained, "updateZoom:oldFactor:newFactor:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v5);
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
    id v6 = objc_loadWeakRetained(v7 + 23);
    [v6 startIgnoreStyleChangeTimer];

    id WeakRetained = v7;
  }
}

uint64_t __71__VKDetachedNavGestureCameraBehavior_tapZoom_levels_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dealloc
{
  [(VKAnimation *)self->_tapZoomAnimation stop];
  tapZoomAnimation = self->_tapZoomAnimation;
  self->_tapZoomAnimation = 0;

  v4.receiver = self;
  v4.super_class = (Class)VKDetachedNavGestureCameraBehavior;
  [(VKDetachedNavGestureCameraBehavior *)&v4 dealloc];
}

- (VKDetachedNavGestureCameraBehavior)initWithNavCameraController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKDetachedNavGestureCameraBehavior;
  double v5 = [(VKGestureCameraBehavior *)&v8 initWithCameraController:v4];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_navCameraController, v4);
    v6->super._notifyCameraStateChanges = 1;
    v6->_double startZoomScale = 1.0;
    v6->_startPitch._double value = 0.0;
  }

  return v6;
}

@end