@interface VKGlobeAnnotationTrackingCameraController
- (Matrix<int,)_centerCursor;
- (Matrix<int,)_nonOffsetCenterCursor;
- (VKCameraRegionRestriction)regionRestriction;
- (VKEdgeInsets)_effectiveEdgeInsets;
- (VKGlobeAnnotationTrackingCameraController)init;
- (void)_goToAnnotationAnimated:(BOOL)a3 duration:(double)a4 timingFunction:(id)a5 isInitial:(BOOL)a6;
- (void)_rotateToHeadingAnimated:(BOOL)a3 duration:(double)a4;
- (void)dealloc;
- (void)globeView;
- (void)setEdgeInsets:(VKEdgeInsets)a3;
- (void)setGlobeView:(void *)a3;
- (void)setRegionRestriction:(id)a3;
@end

@implementation VKGlobeAnnotationTrackingCameraController

- (void).cxx_destruct
{
}

- (void)setRegionRestriction:(id)a3
{
}

- (VKCameraRegionRestriction)regionRestriction
{
  return *(VKCameraRegionRestriction **)&self->_currentAnimationEndCoordinate.longitude;
}

- (void)globeView
{
  return self->super._elevationLogic;
}

- (void)setGlobeView:(void *)a3
{
  if (self->super._elevationLogic)
  {
    globeView = (altitude::Anchor *)self->_globeView;
    if (globeView)
    {
      altitude::Anchor::destroy(globeView);
      self->_globeView = 0;
    }
  }
  self->super._elevationLogic = a3;
}

- (void)_rotateToHeadingAnimated:(BOOL)a3 duration:(double)a4
{
  annotation = self->super._annotation;
  if (annotation)
  {
    __int16 v6 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
    if ((v6 & 0x200) != 0)
    {
      double v7 = a4;
      if ((v6 & 2) != 0)
      {
        *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v6 | 8;
        self->super._pendingHeadingChangeDuration = a4;
      }
      else
      {
        BOOL v8 = a3;
        double v9 = *(double *)(*((void *)self->super._elevationLogic + 9) + 48);
        [(VKTrackableAnnotation *)annotation headingDegrees];
        double v11 = v10;
        currentHeadingAnimation = self->super._currentHeadingAnimation;
        if (currentHeadingAnimation)
        {
          [(VKAnimation *)currentHeadingAnimation stop];
          v13 = self->super._currentHeadingAnimation;
          self->super._currentHeadingAnimation = 0;
        }
        if ((*(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) & 0x100) == 0
          || [(VKTrackableAnnotation *)self->super._annotation hasValidHeading])
        {
          double v14 = v11 * -0.0174532925 + 6.28318531;
          if (v8 && v7 == 0.4)
          {
            long double v15 = fmod(3.14159265 - v9 + v14, 6.28318531);
            double v7 = fabs(fmod(v15 + 6.28318531, 6.28318531) + -3.14159265) * 0.0636619772;
            BOOL v8 = v7 >= 0.05;
          }
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke;
          v29[3] = &unk_1E5A99028;
          v29[4] = self;
          v16 = (void (**)(void, double))MEMORY[0x1A6239EB0](v29);
          if (v8)
          {
            self->super._headingAnimationCompletedAngle = 0.0;
            v17 = [[VKTimedAnimation alloc] initWithDuration:fmax(v7, 0.200000003)];
            v18 = self->super._currentHeadingAnimation;
            self->super._currentHeadingAnimation = v17;

            [(VKTimedAnimation *)self->super._currentHeadingAnimation setTimingFunction:VKAnimationCurveLinear];
            [(VKCameraController *)self beginRegionChange:1];
            objc_initWeak(&location, self);
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_2;
            v25[3] = &unk_1E5A96078;
            objc_copyWeak(v27, &location);
            v27[1] = *(id *)&v9;
            v27[2] = *(id *)&v14;
            v19 = v16;
            id v26 = v19;
            [(VKTimedAnimation *)self->super._currentHeadingAnimation setStepHandler:v25];
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_3;
            v22[3] = &unk_1E5A99078;
            objc_copyWeak(v24, &location);
            v23 = v19;
            v24[1] = *(id *)&v14;
            [(VKAnimation *)self->super._currentHeadingAnimation setCompletionHandler:v22];
            md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._currentHeadingAnimation->super);

            objc_destroyWeak(v24);
            objc_destroyWeak(v27);
            objc_destroyWeak(&location);
          }
          else
          {
            [(VKCameraController *)self beginRegionChange:0];
            v16[2](v16, v14);
            v20 = [(VKCameraController *)self cameraDelegate];
            [v20 mapLayerDidChangeVisibleRegion];

            uint64_t v21 = *(void *)[(VKCameraController *)self runLoopController];
            if (v21)
            {
              LOBYTE(location) = 4;
              md::MapEngine::setNeedsTick(v21, &location);
            }
            [(VKCameraController *)self endRegionChange];
          }
          [(VKAnnotationTrackingCameraController *)self updateFramerate];
        }
      }
    }
  }
}

void __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke(uint64_t a1, double a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[42];
  if (v3)
  {
    uint64_t v5 = *(void *)(v3 + 72);
    long double v6 = fmod(a2 + 3.14159265 - *(double *)(v5 + 48), 6.28318531);
    double v139 = fmod(v6 + 6.28318531, 6.28318531);
    long long v7 = *(_OWORD *)(v5 + 8);
    uint64_t v158 = *(void *)(v5 + 24);
    long long v157 = v7;
    double v154 = 0.0;
    double v155 = 0.0;
    double v156 = 0.0;
    double v167 = COERCE_DOUBLE([v2 _centerCursor]);
    altitude::GlobeView::getCoordAtScreenPosition(v3, (int *)&v167, (double *)&v157, (uint64_t)&v154, 0);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 336);
    double v9 = v155;
    double v10 = v156;
    __double2 v11 = __sincos_stret(v154);
    double v12 = 6378137.0 / sqrt(1.0 - v11.__sinval * v11.__sinval * 0.00669437999);
    double v13 = (v12 + v10) * v11.__cosval;
    __double2 v14 = __sincos_stret(v9);
    double v133 = v13 * v14.__sinval;
    double v135 = v13 * v14.__cosval;
    double v15 = (v10 + v12 * 0.99330562) * v11.__sinval;
    v16 = *(double **)(v8 + 72);
    gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v167, v16 + 1);
    double v17 = v16[2];
    double v18 = v16[3];
    __double2 v19 = __sincos_stret(v16[1]);
    double v20 = 6378137.0 / sqrt(1.0 - v19.__sinval * v19.__sinval * 0.00669437999);
    double v21 = (v20 + v18) * v19.__cosval;
    __double2 v22 = __sincos_stret(v17);
    double v23 = v21 * v22.__cosval;
    double v24 = v21 * v22.__sinval;
    double v25 = (v18 + v20 * 0.99330562) * v19.__sinval;
    double v141 = v167;
    double v144 = v168;
    double v147 = v169;
    double v26 = *(double *)&v170;
    double v27 = (v26 + v26) * *((double *)&v170 + 1) + *((double *)&v171 + 1) * (*(double *)&v171 * -2.0);
    double v125 = -(*(double *)&v171 * -2.0 * *((double *)&v170 + 1) - (v26 + v26) * *((double *)&v171 + 1));
    double v128 = *(double *)&v171 * -2.0 * *(double *)&v171 + 1.0 - (v26 + v26) * v26;
    __double2 v28 = __sincos_stret(v139 * 0.5 + -1.57079633);
    double v29 = v28.__sinval / sqrt(v135 * v135 + v133 * v133 + v15 * v15);
    double v30 = v29 * v135;
    double v31 = v29 * v133;
    double v32 = v29 * v15;
    double v33 = -(v32 * v144 - v29 * v133 * v147);
    double v131 = v33 + v33;
    double v134 = -(v30 * v147 - v32 * v141) - (v30 * v147 - v32 * v141);
    double v129 = -(v31 * v141 - v30 * v144) - (v31 * v141 - v30 * v144);
    double v34 = -(v24 * v32 - v25 * v31) - (v24 * v32 - v25 * v31);
    double v35 = -(v30 * v25 - v23 * v32) - (v30 * v25 - v23 * v32);
    double v36 = -(v23 * v31 - v30 * v24) - (v23 * v31 - v30 * v24);
    double v37 = v23 + v34 * v28.__cosval + v36 * v31 - v35 * v32;
    double v38 = v24 + v34 * v32 + v35 * v28.__cosval - v36 * v30;
    long double v39 = v25 + v35 * v30 + v36 * v28.__cosval - v34 * v31;
    double v40 = -(v128 * v32 - v125 * v31) - (v128 * v32 - v125 * v31);
    double v41 = -(v125 * v30 - v27 * v32) - (v125 * v30 - v27 * v32);
    double v42 = -(v27 * v31 - v128 * v30) - (v27 * v31 - v128 * v30);
    double v122 = v128 + v40 * v32 + v41 * v28.__cosval - v42 * v30;
    double v123 = v27 + v40 * v28.__cosval + v42 * v31 - v41 * v32;
    double v121 = v125 + v41 * v30 + v42 * v28.__cosval - v40 * v31;
    double v43 = v37;
    long double v44 = v38;
    double v119 = v38;
    double v126 = sqrt(v37 * v37 + v38 * v38);
    double v45 = atan2(v39, v126 * 0.996647189);
    double v124 = atan2(v44, v43);
    __double2 v46 = __sincos_stret(v45);
    double v120 = atan2(v39 + v46.__sinval * v46.__sinval * 42841.3115 * v46.__sinval, v126 + v46.__cosval * v46.__cosval * -42697.6727 * v46.__cosval);
    __double2 v47 = __sincos_stret(v120);
    double v136 = 6378137.0 / sqrt(1.0 - v47.__sinval * v47.__sinval * 0.00669437999);
    double v127 = v126 / v47.__cosval;
    double v48 = v43 + v134 * v32 - (v141 + v131 * v28.__cosval + v129 * v31);
    double v49 = v119 + v129 * v30 - (v144 + v131 * v32 + v134 * v28.__cosval);
    long double v50 = v39 + v131 * v31 - (v147 + v134 * v30 + v129 * v28.__cosval);
    double v51 = sqrt(v48 * v48 + v49 * v49 + v50 * v50);
    v52 = *(double **)(v8 + 72);
    __double2 v53 = __sincos_stret(v52[5]);
    double v54 = v53.__cosval / sqrt(v123 * v123 + v122 * v122 + v121 * v121);
    long double v55 = v53.__sinval / v51 * v50;
    double v56 = v53.__sinval / v51 * v48 + v54 * v123;
    double v57 = v53.__sinval / v51 * v49 + v54 * v122;
    long long v161 = 0u;
    long long v160 = 0u;
    long double v58 = v55 + v54 * v121;
    v159[0] = v120;
    v159[1] = v124;
    v159[2] = v127 - v136;
    gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v167, v159);
    double v59 = *(double *)&v171;
    long double v60 = -(*((double *)&v170 + 1) * v58 - v59 * v57) - (*((double *)&v170 + 1) * v58 - v59 * v57);
    long double v61 = -(v59 * v56 - *(double *)&v170 * v58) - (v59 * v56 - *(double *)&v170 * v58);
    double v62 = -(*(double *)&v170 * v57 - *((double *)&v170 + 1) * v56)
        - (*(double *)&v170 * v57
         - *((double *)&v170 + 1) * v56);
    long double v63 = atan2(-(v61 * *(double *)&v171 - (-(v56 - v62 * *((double *)&v170 + 1)) - v60 * *((double *)&v171 + 1))), v57 + v62 * *(double *)&v170 + v61 * *((double *)&v171 + 1) - v60 * *(double *)&v171);
    v52[1] = v120;
    ++v52;
    double v64 = v52[2];
    v52[2] = v127 - v136;
    v52[3] = v51;
    v52[5] = v63;
    v52[1] = v124;
    gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(&v167, v52);
    __double2 v65 = __sincos_stret(v124);
    double v66 = v127 - v136 + v136 * 0.99330562;
    double v67 = v167;
    double v68 = v168;
    double v69 = v169;
    double v130 = *(double *)&v170;
    long long v132 = v171;
    double v137 = *((double *)&v170 + 1);
    double v70 = -(v167 - v127 * v47.__cosval * v65.__cosval);
    double v71 = -(v168 - v127 * v47.__cosval * v65.__sinval);
    double v72 = -(v169 - v66 * v47.__sinval);
    double v73 = 1.0 / sqrt(v70 * v70 + v71 * v71 + v72 * v72);
    double v145 = v73 * v71;
    double v148 = v73 * v70;
    double v142 = v73 * v72;
    v74 = *(double **)(v8 + 72);
    v74[3] = v64;
    double v75 = v74[2];
    __double2 v76 = __sincos_stret(v74[1]);
    double v77 = 6378137.0 / sqrt(1.0 - v76.__sinval * v76.__sinval * 0.00669437999);
    __double2 v78 = __sincos_stret(v75);
    double v153 = v64;
    double v79 = v148 * v148 + v145 * v145 + v142 * v142;
    double v80 = v148 * v67 + v145 * v68 + v142 * v69;
    double v81 = v80 + v80;
    double v82 = (v68 * v68
         - ((v77 + v64) * v76.__cosval * v78.__cosval * ((v77 + v64) * v76.__cosval * v78.__cosval)
          + (v77 + v64) * v76.__cosval * v78.__sinval * ((v77 + v64) * v76.__cosval * v78.__sinval)
          + (v64 + v77 * 0.99330562) * v76.__sinval * ((v64 + v77 * 0.99330562) * v76.__sinval)
          - v67 * v67)
         + v69 * v69)
        * -4.0
        * v79
        + v81 * v81;
    if (v82 >= 0.0)
    {
      double v83 = (sqrt(v82) + v81) * -0.5 / v79;
      if (v83 >= 0.0)
      {
        double v84 = v69;
        double v85 = v130;
        double v86 = *(double *)&v132 * -2.0;
        double v87 = (v85 + v85) * v137 + *((double *)&v132 + 1) * (*(double *)&v132 * -2.0);
        *(double *)&long long v132 = *(double *)&v132 * -2.0 * *(double *)&v132 + 1.0 - (v85 + v85) * v85;
        double v138 = -(v86 * v137 - (v85 + v85) * *((double *)&v132 + 1));
        double v140 = v87;
        double v88 = v83 * v148;
        double v89 = v83 * v145;
        double v90 = v83 * v142;
        long double v91 = v83 * v148 + v67;
        long double v92 = v83 * v145 + v68;
        long double v93 = v83 * v142 + v84;
        double v151 = v91 * v91 + v92 * v92;
        double v94 = sqrt(v151);
        double v95 = atan2(v93, v94 * 0.996647189);
        long double v150 = atan2(v92, v91);
        __double2 v96 = __sincos_stret(v95);
        long double v149 = atan2(v93 + v96.__sinval * v96.__sinval * 42841.3115 * v96.__sinval, v94 + v96.__cosval * v96.__cosval * -42697.6727 * v96.__cosval);
        double v97 = 1.0 / sqrt(v151 + v93 * v93);
        long double v143 = v97 * v92;
        long double v146 = v97 * v91;
        long double v98 = v97 * v93;
        double v152 = sqrt(v88 * v88 + v89 * v89 + v90 * v90);
        double v99 = 1.0 / v152 * v88;
        double v100 = 1.0 / v152 * v89;
        double v101 = 1.0 / v152 * v90;
        double v102 = 1.0 / sqrt(v140 * v140 + *(double *)&v132 * *(double *)&v132 + v138 * v138);
        __double2 v103 = __sincos_stret(v74[5]);
        double v104 = v102 * (*(double *)&v132 * v103.__cosval);
        double v105 = v102 * (v138 * v103.__cosval);
        double v106 = v102 * (v140 * v103.__cosval) + v103.__sinval * v99;
        double v107 = v104 + v103.__sinval * v100;
        double v108 = v105 + v103.__sinval * v101;
        long double v109 = acos(fmax(fmin(-(v101 * v98 + v100 * v143 + v99 * v146)/ sqrt((v99 * v99 + v100 * v100 + v101 * v101) * (v146 * v146 + v143 * v143 + v98 * v98)), 1.0), -1.0));
        long long v171 = 0u;
        long long v170 = 0u;
        double v167 = v149;
        double v168 = v150;
        double v169 = v153;
        gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric(v162, &v167);
        double v111 = v163;
        double v110 = v164;
        double v112 = v165;
        double v113 = -(v110 * v108 - v112 * v107) - (v110 * v108 - v112 * v107);
        double v114 = -(v112 * v106 - v111 * v108) - (v112 * v106 - v111 * v108);
        double v115 = -(v111 * v107 - v110 * v106) - (v111 * v107 - v110 * v106);
        long double v116 = atan2(-(v114 * v165 - (-(v106 - v115 * v164) - v113 * v166)), v107 + v115 * v163 + v114 * v166 - v113 * v165);
        uint64_t v117 = *(void *)(v8 + 72);
        *(long double *)(v117 + 8) = v149;
        *(long double *)(v117 + 16) = v150;
        *(double *)(v117 + 24) = v153;
        *(double *)(v117 + 32) = v152;
        *(long double *)(v117 + 40) = v109;
        *(long double *)(v117 + 48) = v116;
        ++*(_DWORD *)(v8 + 376);
      }
    }
    uint64_t v118 = **(void **)(*(void *)(v8 + 856) + 88);
    if (v118)
    {
      LOBYTE(v167) = 7;
      md::MapEngine::setNeedsTick(v118, &v167);
    }
  }
}

void __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_2(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    double v5 = *(double *)(a1 + 48);
    long double v6 = fmod(3.14159265 - v5 + *(double *)(a1 + 56), 6.28318531);
    long double v7 = fmod(v6 + 6.28318531, 6.28318531);
    long double v8 = fmod(v5 + 3.14159265 + (v7 + -3.14159265) * a2, 6.28318531);
    long double v9 = fmod(v8 + 6.28318531, 6.28318531);
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v9 + -3.14159265);
    double v10 = [v11 cameraDelegate];
    [v10 mapLayerDidChangeVisibleRegion];

    id WeakRetained = v11;
  }
}

void __79__VKGlobeAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long double v7 = WeakRetained;
    if (a2)
    {
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48));
      double v5 = [v7 cameraDelegate];
      [v5 mapLayerDidChangeVisibleRegion];

      long double v6 = (void *)v7[33];
      v7[33] = 0;
    }
    [v7 endRegionChange];
    [v7 updateFramerate];
    id WeakRetained = v7;
  }
}

- (void)_goToAnnotationAnimated:(BOOL)a3 duration:(double)a4 timingFunction:(id)a5 isInitial:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  id v10 = a5;
  annotation = self->super._annotation;
  if (!annotation) {
    goto LABEL_110;
  }
  BOOL v152 = v8;
  [(VKTrackableAnnotation *)annotation coordinate];
  double v13 = v12;
  double v149 = v14;
  double v15 = v14 * 0.0174532925;
  double v16 = v12 * 0.0174532925;
  v179[0] = v14 * 0.0174532925;
  v179[1] = v12 * 0.0174532925;
  globeView = self->_globeView;
  if (!globeView)
  {
    globeView = altitude::GlobeView::createAnchor((uint64_t)self->super._elevationLogic, v179);
    self->_globeView = globeView;
  }
  double v154 = v13;
  if (v15 != *((double *)globeView + 1) || v16 != *((double *)globeView + 2) || *((double *)globeView + 3) != 0.0)
  {
    *((double *)globeView + 1) = v15;
    *((double *)globeView + 2) = v16;
    *((void *)globeView + 3) = 0;
    *((_WORD *)globeView + 32) = 255;
    globeView[17] = 0;
    globeView[18] = 0;
    *((unsigned char *)globeView + 96) = 1;
    if (*globeView == 2)
    {
      altitude::Anchor::update((altitude::Anchor *)globeView);
    }
    else
    {
      __double2 v18 = __sincos_stret(v15);
      double v19 = 6378137.0 / sqrt(v18.__sinval * v18.__sinval * -0.00669437999 + 1.0);
      __double2 v20 = __sincos_stret(v16);
      *((double *)globeView + 4) = v19 * v18.__cosval * v20.__cosval;
      *((double *)globeView + 5) = v19 * v18.__cosval * v20.__sinval;
      *((double *)globeView + 6) = v19 * (0.99330562 * v18.__sinval);
    }
  }
  currentAnimation = self->super._currentAnimation;
  __int16 v22 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
  if (currentAnimation) {
    _ZF = 0;
  }
  else {
    _ZF = (v22 & 2) == 0;
  }
  if (!_ZF)
  {
    if ((v22 & 0x12) != 0)
    {
      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v22 | 1;
      self->super._pendingChangeDuration = a4;
      goto LABEL_110;
    }
    [(VKAnimation *)currentAnimation stop];
    double v24 = self->super._currentAnimation;
    self->super._currentAnimation = 0;

    __int16 v22 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
  }
  annotationPresentation = self->super._annotationPresentation;
  if (v6) {
    __int16 v25 = 16;
  }
  else {
    __int16 v25 = 0;
  }
  *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v22 & 0xFFEF | v25;
  BOOL v148 = [(VKAnnotationTrackingCameraController *)self shouldForceZoomToFit];
  double v26 = [(VKGlobeAnnotationTrackingCameraController *)self regionRestriction];
  [(VKTrackableAnnotation *)self->super._annotation coordinate];
  int v27 = objc_msgSend(v26, "containsCoordinate:");

  if (v27)
  {
    double v28 = *((double *)self->_globeView + 7);
    double v29 = v149;
  }
  else
  {
    double v30 = [(VKGlobeAnnotationTrackingCameraController *)self regionRestriction];
    [(VKTrackableAnnotation *)self->super._annotation coordinate];
    objc_msgSend(v30, "clampedCoordinate:");
    double v29 = v31;
    double v13 = v32;

    double v15 = v29 * 0.0174532925;
    double v16 = v13 * 0.0174532925;
    double v28 = 0.0;
  }
  double v144 = v29;
  uint64_t v178 = 0;
  elevationLogic = self->super._elevationLogic;
  v180.f64[0] = v15;
  v180.f64[1] = v16;
  double v150 = v28;
  double v151 = v16;
  double v181 = v28;
  altitude::GlobeView::getViewPositionAtLatLongHeight(elevationLogic, v180.f64, &v178);
  uint64_t v34 = v178;
  double v143 = v13;
  if (v27) {
    Matrix<int, 2, 1> v35 = [(VKGlobeAnnotationTrackingCameraController *)self _centerCursor];
  }
  else {
    Matrix<int, 2, 1> v35 = [(VKGlobeAnnotationTrackingCameraController *)self _nonOffsetCenterCursor];
  }
  double v37 = (double)(int)v34;
  double v38 = (double)SHIDWORD(v34);
  Matrix<int, 2, 1> v177 = v35;
  double v147 = sqrt(((double)v35._e[0] - v37) * ((double)v35._e[0] - v37) + ((double)v35._e[1] - v38)
                                                                    * ((double)v35._e[1] - v38));
  double v39 = fmax(fmin(v147 * 0.00156250002, 1.0), 0.200000003);
  double v40 = fmax(a4, 0.200000003);
  double v41 = self->super._elevationLogic;
  if (a4 != -1.0) {
    double v39 = v40;
  }
  double v145 = v39;
  double v153 = *(double *)(*((void *)v41 + 9) + 32);
  double idealCenterCoordinateDistance = self->super._behavior.idealCenterCoordinateDistance;
  if (idealCenterCoordinateDistance >= 0.0) {
    double v43 = self->super._behavior.idealCenterCoordinateDistance;
  }
  else {
    double v43 = 5500.0;
  }
  double v44 = *((double *)v41 + 49);
  double v45 = *((double *)v41 + 50);
  LODWORD(idealCenterCoordinateDistance) = *((_DWORD *)v41 + 161);
  double v46 = (double)*(unint64_t *)&idealCenterCoordinateDistance;
  v182.origin.x = (double)*(unint64_t *)&idealCenterCoordinateDistance * -16.0;
  LODWORD(v36) = *((_DWORD *)v41 + 162);
  double v47 = (double)v36;
  v182.origin.y = v47 * -16.0;
  v182.size.width = v46 * 33.0;
  v182.size.height = v47 * 33.0;
  BOOL v48 = CGRectContainsPoint(v182, *(CGPoint *)&v37);
  double v49 = fmin(fmax(v43, v44), v45);
  BOOL shouldPreserveUserSpecifiedZoomLevel = self->super._behavior.shouldPreserveUserSpecifiedZoomLevel;
  if (self->super._behavior.shouldPreserveUserSpecifiedZoomLevel)
  {
    BOOL v51 = self->super._hasUserSpecifiedZoomLevel && v48;
    double v52 = fmin(v153, v49);
    if (v51) {
      double v49 = v52;
    }
  }
  double v53 = v154;
  double v55 = v150;
  float64_t v54 = v16;
  if ((*(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) & 0x80) != 0)
  {
    id v142 = v10;
    [(VKTrackableAnnotation *)self->super._annotation accuracy];
    double v57 = v56;
    [(VKGlobeAnnotationTrackingCameraController *)self _effectiveEdgeInsets];
    float v59 = v58;
    float v61 = v60;
    float v63 = v62;
    double v64 = [(VKCameraController *)self canvas];
    [v64 contentScale];
    double v66 = v65;

    int v175 = (int)(v66 * v59);
    uint64_t v67 = [(VKCameraController *)self canvas];
    [(id)v67 size];
    float v68 = v63;
    double v138 = v57;
    double v141 = v49;
    int v176 = (int)((v69 - v61) * v66);

    float64x2_t location = 0uLL;
    double v174 = 0.0;
    LOBYTE(v67) = altitude::GlobeView::getLatLongAtViewPosition((uint64_t)self->super._elevationLogic, &v175, (long long *)&location);
    double v70 = location.f64[1];
    double v71 = v174;
    long double v72 = tan(location.f64[0] * 0.5 + 0.785398163);
    double v140 = v70 * 0.159154943;
    double v73 = v70 * 0.159154943 + 0.5;
    double v139 = log(v72) * 0.159154943;
    v171.f64[0] = v73;
    v171.f64[1] = v139 + 0.5;
    double v172 = v71;
    v74 = [(VKCameraController *)self canvas];
    [v74 size];
    int v175 = (int)((v75 - v68) * v66);

    __double2 v76 = [(VKCameraController *)self canvas];
    [v76 size];
    int v176 = (int)((v77 - v61) * v66);

    if (v67)
    {
      BOOL LatLongAtViewPosition = altitude::GlobeView::getLatLongAtViewPosition((uint64_t)self->super._elevationLogic, &v175, (long long *)&location);
      double v79 = location.f64[1];
      double v80 = v174;
      long double v81 = tan(location.f64[0] * 0.5 + 0.785398163);
      double v82 = v79 * 0.159154943;
      double v83 = log(v81) * 0.159154943;
      double v168 = v79 * 0.159154943 + 0.5;
      double v169 = v83 + 0.5;
      double v170 = v80;
      id v10 = v142;
      if (LatLongAtViewPosition)
      {
        int64x2_t v84 = vdupq_n_s64(0x7FF8000000000000uLL);
        float64x2_t v180 = (float64x2_t)v84;
        BOOL v86 = *(void *)&v171.f64[0] == v84.i64[0]
           && *(void *)&v171.f64[1] == v84.i64[1]
           && *(void *)&v172 == 0x7FF8000000000000;
        double v53 = v154;
        double v55 = v150;
        float64_t v54 = v151;
        if (v86) {
          goto LABEL_59;
        }
        float64x2_t v180 = (float64x2_t)v84;
        BOOL v87 = *(void *)&v168 == v84.i64[0] && *(void *)&v169 == v84.i64[1];
        if (v87 && *(void *)&v170 == 0x7FF8000000000000) {
          goto LABEL_59;
        }
        long double v89 = exp((v139 + 0.5) * 6.28318531 + -3.14159265);
        long double v90 = atan(v89) * 114.591559 + -90.0;
        long double v91 = cos(v90 * 0.034906585) * -559.82 + 111132.92;
        long double v92 = v91 + cos(v90 * 0.0698131701) * 1.175;
        long double v93 = v92 + cos(v90 * 0.104719755) * -0.0023;
        long double v94 = v90 * 0.00872664626;
        long double v95 = tan(v94 + 0.78103484);
        double v96 = log(v95);
        long double v97 = tan(v94 + 0.789761487);
        double v98 = v93
            * sqrt((v82 - v140) * (v82 - v140) + (v83 - v139) * (v83 - v139))
            / fabs((log(v97) - v96) * 0.159154943);
        if (v98 > 0.0)
        {
          double v49 = fmax(v153 + (v138 * 2.1 / v98 + -1.0) * v153, v141);
          double v55 = v150;
          float64_t v54 = v151;
LABEL_60:
          BOOL shouldPreserveUserSpecifiedZoomLevel = self->super._behavior.shouldPreserveUserSpecifiedZoomLevel;
          goto LABEL_61;
        }
LABEL_58:
        double v55 = v150;
        float64_t v54 = v151;
LABEL_59:
        double v49 = v141;
        goto LABEL_60;
      }
    }
    else
    {
      double v168 = v73;
      double v169 = v139 + 0.5;
      double v170 = v71;
      id v10 = v142;
    }
    double v53 = v154;
    goto LABEL_58;
  }
LABEL_61:
  if (!shouldPreserveUserSpecifiedZoomLevel || !self->super._hasUserSpecifiedZoomLevel)
  {
    if (!v148) {
      goto LABEL_75;
    }
    goto LABEL_71;
  }
  BOOL v99 = v49 / v153 > 1.0;
  if (!v6) {
    BOOL v99 = 0;
  }
  char v100 = v148 || v99;
  if (v49 <= v153) {
    char v100 = v148;
  }
  if (!v6)
  {
    if ((v100 & 1) == 0) {
      goto LABEL_75;
    }
LABEL_71:
    int v101 = 1;
    if (vabdd_f64(v49, v153) >= 0.000000001 || v147 >= 1.5) {
      goto LABEL_77;
    }
    goto LABEL_76;
  }
  if (v100 & 1 | (fmax(v153, v49) / fmin(v153, v49) > 22.627417)) {
    goto LABEL_71;
  }
LABEL_75:
  int v101 = 0;
  double v49 = v153;
  if (v147 < 1.5) {
LABEL_76:
  }
    BOOL v152 = 0;
LABEL_77:
  double v102 = self->super._elevationLogic;
  double v181 = 0.0;
  float64x2_t v180 = 0uLL;
  uint64_t v103 = v102[9];
  if (v103)
  {
    float64x2_t v104 = *(float64x2_t *)(v103 + 8);
    double v181 = *(double *)(v103 + 24);
    float64x2_t v180 = v104;
  }
  altitude::GlobeView::getCoordAtScreenPosition((uint64_t)v102, (int *)&v177, v180.f64, (uint64_t)&v180, 0);
  if (vabdd_f64(v181, v55) > 0.000000001) {
    [(VKAnnotationTrackingCameraController *)self setHasUserSpecifiedZoomLevel:0];
  }
  v166[0] = MEMORY[0x1E4F143A8];
  v166[1] = 3221225472;
  v166[2] = __103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke;
  v166[3] = &unk_1E5A96000;
  v166[4] = self;
  char v167 = v27;
  double v105 = (void (**)(void, void))MEMORY[0x1A6239EB0](v166);
  if (v152)
  {
    double v106 = [[VKTimedAnimation alloc] initWithDuration:v145];
    double v107 = self->super._currentAnimation;
    self->super._currentAnimation = v106;

    double v108 = (uint64_t *)&VKAnimationCurveEaseInOut;
    if (!v6) {
      double v108 = &VKAnimationCurveLinear;
    }
    uint64_t v109 = *v108;
    if (v10) {
      id v110 = v10;
    }
    else {
      id v110 = (id)v109;
    }
    [(VKTimedAnimation *)self->super._currentAnimation setTimingFunction:v110];
    [(VKCameraController *)self beginRegionChange:1];
    double v111 = v181;
    *(float64x2_t *)&self->_anchor = vmulq_f64(v180, (float64x2_t)vdupq_n_s64(0x404CA5DC1A63C1F8uLL));
    self->_currentAnimationStartCoordinate.longitude = v111;
    [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation presentationCoordinate];
    double v113 = v112;
    [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation presentationCoordinate];
    self->_currentAnimationStartCoordinate.altitude = v113;
    self->_currentAnimationPresentationStartCoordinate.double latitude = v114;
    self->_currentAnimationPresentationStartCoordinate.longitude = v149;
    self->_currentAnimationPresentationEndCoordinate.double latitude = v53;
    self->_currentAnimationPresentationEndCoordinate.longitude = v144;
    self->_currentAnimationEndCoordinate.double latitude = v143;
    double latitude = self->_currentAnimationStartCoordinate.latitude;
    double v116 = v143 - latitude;
    if (v143 - latitude >= -180.0)
    {
      BOOL v117 = annotationPresentation != 0;
      double v118 = v153;
      if (v116 > 180.0) {
        double v116 = v116 + -360.0;
      }
    }
    else
    {
      double v116 = v116 + 360.0;
      BOOL v117 = annotationPresentation != 0;
      double v118 = v153;
    }
    self->_currentAnimationEndCoordinate.double latitude = v116 + latitude;
    objc_initWeak((id *)&location, self);
    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2;
    v161[3] = &unk_1E5A96028;
    objc_copyWeak(v162, (id *)&location);
    char v163 = v101;
    v162[1] = *(id *)&v55;
    v162[2] = *(id *)&v118;
    double v162[3] = *(id *)&v49;
    char v164 = v27;
    BOOL v165 = v117;
    [(VKTimedAnimation *)self->super._currentAnimation setStepHandler:v161];
    v155[0] = MEMORY[0x1E4F143A8];
    v155[1] = 3221225472;
    v155[2] = __103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_3;
    v155[3] = &unk_1E5A96050;
    objc_copyWeak(v157, (id *)&location);
    v157[1] = *(id *)&v55;
    char v158 = v27;
    BOOL v159 = v117;
    BOOL v160 = v6;
    v155[4] = self;
    double v156 = v105;
    [(VKAnimation *)self->super._currentAnimation setCompletionHandler:v155];
    md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._currentAnimation->super);

    objc_destroyWeak(v157);
    objc_destroyWeak(v162);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) |= 0x20u;
    [(VKCameraController *)self beginRegionChange:0];
    location.f64[0] = v15;
    location.f64[1] = v54;
    double v174 = v55;
    double v119 = self->super._elevationLogic;
    v119[160] = 0;
    uint64_t v120 = *((void *)v119 + 9);
    double v121 = v174;
    *(float64x2_t *)(v120 + 8) = location;
    *(double *)(v120 + 24) = v121;
    ++*((_DWORD *)v119 + 94);
    uint64_t v122 = **(void **)(*((void *)v119 + 107) + 88);
    if (v122)
    {
      LOBYTE(v171.f64[0]) = 7;
      md::MapEngine::setNeedsTick(v122, &v171);
    }
    if (v101)
    {
      double v123 = (double *)self->super._elevationLogic;
      if (*((unsigned char *)v123 + 184))
      {
        double v124 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)self->super._elevationLogic);
        double v125 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v123);
        int v126 = *((unsigned __int8 *)v123 + 184);
        uint64_t v127 = *((void *)v123 + 9);
        *(double *)(v127 + 32) = fmin(fmax(v124, v49), fmax(fmin(v123[50], 60592301.5), v125));
        if (v126) {
          *(double *)(v127 + 40) = fmax(*(double *)(v127 + 40), 0.0);
        }
      }
      else
      {
        *(double *)(*((void *)v123 + 9) + 32) = v49;
      }
      ++*((_DWORD *)v123 + 94);
    }
    if (v27)
    {
      double v168 = COERCE_DOUBLE([(VKGlobeAnnotationTrackingCameraController *)self _centerCursor]);
      float64x2_t v171 = 0uLL;
      double v172 = 0.0;
      altitude::GlobeView::getCoordAtScreenPosition((uint64_t)self->super._elevationLogic, (int *)&v168, location.f64, (uint64_t)&v171, 0);
      __asm { FMOV            V2.2D, #-2.0 }
      float64x2_t location = vnegq_f64(vmlaq_f64(v171, _Q2, location));
      long long v132 = self->super._elevationLogic;
      v132[160] = 0;
      uint64_t v133 = *((void *)v132 + 9);
      float64x2_t v134 = location;
      *(double *)(v133 + 24) = v174;
      *(float64x2_t *)(v133 + 8) = v134;
      ++*((_DWORD *)v132 + 94);
      uint64_t v135 = **(void **)(*((void *)v132 + 107) + 88);
      if (v135)
      {
        LOBYTE(v175) = 7;
        md::MapEngine::setNeedsTick(v135, &v175);
      }
    }
    *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x10u;
    if (annotationPresentation)
    {
      [(VKTrackableAnnotation *)self->super._annotation coordinate];
      -[VKTrackableAnnotationPresentation setPresentationCoordinate:](self->super._annotationPresentation, "setPresentationCoordinate:");
    }
    double v136 = [(VKCameraController *)self cameraDelegate];
    [v136 mapLayerDidChangeVisibleRegion];

    uint64_t v137 = *(void *)[(VKCameraController *)self runLoopController];
    if (v137)
    {
      LOBYTE(v171.f64[0]) = 4;
      md::MapEngine::setNeedsTick(v137, &v171);
    }
    *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x20u;
    [(VKCameraController *)self endRegionChange];
    if (!self->super._annotationPresentation) {
      v105[2](v105, 0);
    }
  }
  [(VKAnnotationTrackingCameraController *)self updateFramerate];

LABEL_110:
}

void *__103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke(uint64_t a1, char a2)
{
  result = *(void **)(a1 + 32);
  if (!result[18])
  {
    double v5 = [result cameraDelegate];
    uint64_t v6 = [v5 mapLayerPresentationForAnnotation:*(void *)(*(void *)(a1 + 32) + 136)];
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v8 = *(void **)(v7 + 144);
    *(void *)(v7 + 144) = v6;

    [*(id *)(*(void *)(a1 + 32) + 144) setTracking:*(unsigned __int8 *)(a1 + 40)];
    result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "setPresentationCoordinate:", *(double *)(*(void *)(a1 + 32) + 392), *(double *)(*(void *)(a1 + 32) + 400));
    if ((a2 & 1) == 0)
    {
      result = *(void **)(a1 + 32);
      if (result[18])
      {
        return (void *)[result _goToAnnotationAnimated:1 duration:0 timingFunction:0 isInitial:-1.0];
      }
    }
  }
  return result;
}

void __103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2(uint64_t a1, float a2)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_22;
  }
  uint64_t v7 = *((void *)WeakRetained + 42);
  if (!v7) {
    goto LABEL_22;
  }
  *(double *)&long long v5 = a2;
  double v8 = WeakRetained[45] + (WeakRetained[52] - WeakRetained[45]) * a2;
  long long v31 = v5;
  double v9 = WeakRetained[46] + (*(double *)(a1 + 40) - WeakRetained[46]) * a2;
  if (v8 > 180.0)
  {
    double v10 = -360.0;
LABEL_7:
    double v8 = v8 + v10;
    goto LABEL_8;
  }
  if (v8 < -180.0)
  {
    double v10 = 360.0;
    goto LABEL_7;
  }
LABEL_8:
  v35.f64[0] = (WeakRetained[44] + (WeakRetained[51] - WeakRetained[44]) * a2) * 0.0174532925;
  v35.f64[1] = v8 * 0.0174532925;
  double v36 = v9;
  *(unsigned char *)(v7 + 160) = 0;
  uint64_t v11 = *(void *)(v7 + 72);
  double v12 = v36;
  *(float64x2_t *)(v11 + 8) = v35;
  *(double *)(v11 + 24) = v12;
  ++*(_DWORD *)(v7 + 376);
  uint64_t v13 = **(void **)(*(void *)(v7 + 856) + 88);
  if (v13)
  {
    LOBYTE(v32.f64[0]) = 7;
    md::MapEngine::setNeedsTick(v13, &v32);
  }
  if (*(unsigned char *)(a1 + 64))
  {
    double v14 = *(double *)(a1 + 48) + (*(double *)(a1 + 56) - *(double *)(a1 + 48)) * *(double *)&v31;
    uint64_t v15 = *((void *)v6 + 42);
    if (*(unsigned char *)(v15 + 184))
    {
      double v16 = altitude::GlobeView::calculateMinZoomDistance(*((altitude::GlobeView **)v6 + 42));
      double v17 = altitude::GlobeView::calculateMinZoomDistance((altitude::GlobeView *)v15);
      int v18 = *(unsigned __int8 *)(v15 + 184);
      uint64_t v19 = *(void *)(v15 + 72);
      *(double *)(v19 + 32) = fmin(fmax(v16, v14), fmax(fmin(*(double *)(v15 + 400), 60592301.5), v17));
      if (v18) {
        *(double *)(v19 + 40) = fmax(*(double *)(v19 + 40), 0.0);
      }
    }
    else
    {
      *(double *)(*(void *)(v15 + 72) + 32) = v14;
    }
    ++*(_DWORD *)(v15 + 376);
  }
  if (*(unsigned char *)(a1 + 65))
  {
    uint64_t v20 = [v6 _centerCursor];
    uint64_t v33 = 0;
    uint64_t v34 = v20;
    float64x2_t v32 = 0uLL;
    altitude::GlobeView::getCoordAtScreenPosition(*((void *)v6 + 42), (int *)&v34, v35.f64, (uint64_t)&v32, 0);
    __asm { FMOV            V2.2D, #-2.0 }
    float64x2_t v35 = vnegq_f64(vmlaq_f64(v32, _Q2, v35));
    uint64_t v26 = *((void *)v6 + 42);
    *(unsigned char *)(v26 + 160) = 0;
    uint64_t v27 = *(void *)(v26 + 72);
    float64x2_t v28 = v35;
    *(double *)(v27 + 24) = v36;
    *(float64x2_t *)(v27 + 8) = v28;
    ++*(_DWORD *)(v26 + 376);
    uint64_t v29 = **(void **)(*(void *)(v26 + 856) + 88);
    if (v29)
    {
      char v37 = 7;
      md::MapEngine::setNeedsTick(v29, &v37);
    }
  }
  if (*(unsigned char *)(a1 + 66)) {
    objc_msgSend(*((id *)v6 + 18), "setPresentationCoordinate:", vmlaq_n_f64(*(float64x2_t *)(v6 + 47), vsubq_f64(*(float64x2_t *)(v6 + 49), *(float64x2_t *)(v6 + 47)), *(double *)&v31));
  }
  double v30 = objc_msgSend(v6, "cameraDelegate", v31);
  [v30 mapLayerDidChangeVisibleRegion];

LABEL_22:
}

void __103__VKGlobeAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  long long v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_25;
  }
  if (a2)
  {
    uint64_t v6 = *((void *)WeakRetained + 42);
    if (!v6)
    {
LABEL_17:
      __int16 v25 = (void *)*((void *)v5 + 19);
      *((void *)v5 + 19) = 0;

      __int16 v10 = *(_WORD *)(v5 + 321);
      int v9 = v10 & 1;
      goto LABEL_18;
    }
    double v7 = *((double *)WeakRetained + 52);
    if (v7 <= 180.0)
    {
      if (v7 >= -180.0)
      {
LABEL_10:
        uint64_t v11 = *(void *)(a1 + 56);
        v31.f64[0] = *((double *)WeakRetained + 51) * 0.0174532925;
        v31.f64[1] = v7 * 0.0174532925;
        uint64_t v32 = v11;
        *(unsigned char *)(v6 + 160) = 0;
        uint64_t v12 = *(void *)(v6 + 72);
        uint64_t v13 = v32;
        *(float64x2_t *)(v12 + 8) = v31;
        *(void *)(v12 + 24) = v13;
        ++*(_DWORD *)(v6 + 376);
        uint64_t v14 = **(void **)(*(void *)(v6 + 856) + 88);
        if (v14)
        {
          LOBYTE(v28.f64[0]) = 7;
          md::MapEngine::setNeedsTick(v14, &v28);
        }
        if (*(unsigned char *)(a1 + 64))
        {
          uint64_t v15 = [v5 _centerCursor];
          uint64_t v29 = 0;
          uint64_t v30 = v15;
          float64x2_t v28 = 0uLL;
          altitude::GlobeView::getCoordAtScreenPosition(*((void *)v5 + 42), (int *)&v30, v31.f64, (uint64_t)&v28, 0);
          __asm { FMOV            V2.2D, #-2.0 }
          float64x2_t v31 = vnegq_f64(vmlaq_f64(v28, _Q2, v31));
          uint64_t v21 = *((void *)v5 + 42);
          *(unsigned char *)(v21 + 160) = 0;
          uint64_t v22 = *(void *)(v21 + 72);
          float64x2_t v23 = v31;
          *(void *)(v22 + 24) = v32;
          *(float64x2_t *)(v22 + 8) = v23;
          ++*(_DWORD *)(v21 + 376);
          uint64_t v24 = **(void **)(*(void *)(v21 + 856) + 88);
          if (v24)
          {
            char v33 = 7;
            md::MapEngine::setNeedsTick(v24, &v33);
          }
        }
        if (*(unsigned char *)(a1 + 65)) {
          objc_msgSend(*((id *)v5 + 18), "setPresentationCoordinate:", *((double *)v5 + 49), *((double *)v5 + 50));
        }
        goto LABEL_17;
      }
      double v8 = 360.0;
    }
    else
    {
      double v8 = -360.0;
    }
    double v7 = v7 + v8;
    *((double *)WeakRetained + 52) = v7;
    goto LABEL_10;
  }
  int v9 = 0;
  __int16 v10 = *(_WORD *)(WeakRetained + 321);
LABEL_18:
  *(_WORD *)(v5 + 321) = v10 & 0xFFEE;
  [v5 endRegionChange];
  if (*(unsigned char *)(a1 + 66))
  {
    uint64_t v26 = [v5 cameraDelegate];
    [v26 mapLayerDidFinishInitialTrackingAnimation];
  }
  if (!*(void *)(*(void *)(a1 + 32) + 144)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if (v9) {
    [v5 _goToAnnotationAnimated:1 duration:0 timingFunction:0 isInitial:*((double *)v5 + 32)];
  }
  v27.receiver = *(id *)(a1 + 32);
  v27.super_class = (Class)VKGlobeAnnotationTrackingCameraController;
  objc_msgSendSuper2(&v27, sel_updateFramerate);
LABEL_25:
}

- (Matrix<int,)_centerCursor
{
  [(VKGlobeAnnotationTrackingCameraController *)self _effectiveEdgeInsets];
  float v4 = v3;
  float v6 = v5;
  float v8 = v7;
  float v10 = v9;
  uint64_t v11 = [(VKCameraController *)self canvas];
  [v11 size];
  double v13 = v12;
  uint64_t v14 = [(VKCameraController *)self canvas];
  [v14 contentScale];
  double v16 = v15;

  double v17 = [(VKCameraController *)self canvas];
  [v17 size];
  double v19 = v18;
  uint64_t v20 = [(VKCameraController *)self canvas];
  [v20 contentScale];
  uint64_t v22 = (int)(v21 * (v4 + (v19 - (v8 + v4)) * 0.5));

  return (Matrix<int, 2, 1>)((int)(v16 * (v6 + (v13 - (v6 + v10)) * 0.5)) | (unint64_t)(v22 << 32));
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKGlobeAnnotationTrackingCameraController;
  -[VKCameraController setEdgeInsets:](&v4, sel_setEdgeInsets_, *(double *)&a3.top, *(double *)&a3.left, *(double *)&a3.bottom, *(double *)&a3.right);
  [(VKGlobeAnnotationTrackingCameraController *)self _goToAnnotationAnimated:0 duration:0 timingFunction:0 isInitial:0.0];
}

- (VKEdgeInsets)_effectiveEdgeInsets
{
  [(VKCameraController *)self edgeInsets];
  float v4 = v3;
  [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation annotationTrackingEdgeInsets];
  float v6 = v5 + v4;
  [(VKCameraController *)self edgeInsets];
  float v8 = v7;
  [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation annotationTrackingEdgeInsets];
  float v10 = v9 + v8;
  [(VKCameraController *)self edgeInsets];
  float v12 = v11;
  [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation annotationTrackingEdgeInsets];
  float v14 = v13 + v12;
  [(VKCameraController *)self edgeInsets];
  float v16 = v15;
  [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation annotationTrackingEdgeInsets];
  float v18 = v17 + v16;
  float v19 = v6;
  float v20 = v10;
  float v21 = v14;
  result.right = v18;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (Matrix<int,)_nonOffsetCenterCursor
{
  float v3 = [(VKCameraController *)self canvas];
  [v3 size];
  double v5 = v4;
  float v6 = [(VKCameraController *)self canvas];
  [v6 contentScale];
  double v8 = v7;

  float v9 = [(VKCameraController *)self canvas];
  [v9 size];
  double v11 = v10;
  float v12 = [(VKCameraController *)self canvas];
  [v12 contentScale];
  uint64_t v14 = (int)(v11 * 0.5 * v13);

  return (Matrix<int, 2, 1>)((int)(v5 * 0.5 * v8) | (unint64_t)(v14 << 32));
}

- (void)dealloc
{
  globeView = (altitude::Anchor *)self->_globeView;
  if (globeView) {
    altitude::Anchor::destroy(globeView);
  }
  v4.receiver = self;
  v4.super_class = (Class)VKGlobeAnnotationTrackingCameraController;
  [(VKAnnotationTrackingCameraController *)&v4 dealloc];
}

- (VKGlobeAnnotationTrackingCameraController)init
{
  v3.receiver = self;
  v3.super_class = (Class)VKGlobeAnnotationTrackingCameraController;
  VKEdgeInsets result = [(VKGlobeAnnotationTrackingCameraController *)&v3 init];
  result->super._elevationLogic = 0;
  result->_globeView = 0;
  return result;
}

@end