@interface VKDaVinciAnnotationTrackingCameraController
- (Coordinate3D<geo::Radians,)_centerCoordinate:()Coordinate3D<geo:(double>)a3 :(VKEdgeInsets)a4 Radians forEdgeInsets:;
- (VKEdgeInsets)_effectiveEdgeInsets;
- (VKEdgeInsets)_scaledEdgeInsets:(VKEdgeInsets)a3 withCanvasSize:(CGSize)a4;
- (double)_minTrackingCameraDistance:(BOOL)a3;
- (double)_zoomLevelForDistance:()Unit<geo:(double>)a3 :MeterUnitDescription;
- (void)_goToAnnotationAnimated:(BOOL)a3 duration:(double)a4 timingFunction:(id)a5 isInitial:(BOOL)a6;
- (void)_rotateToHeadingAnimated:(BOOL)a3 duration:(double)a4;
- (void)setEdgeInsets:(VKEdgeInsets)a3;
- (void)updateFramerate;
@end

@implementation VKDaVinciAnnotationTrackingCameraController

- (void)_rotateToHeadingAnimated:(BOOL)a3 duration:(double)a4
{
  if (self->super._annotation)
  {
    __int16 v5 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
    if ((v5 & 0x200) != 0)
    {
      if ((v5 & 2) != 0)
      {
        *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v5 | 8;
        self->super._pendingHeadingChangeDuration = a4;
      }
      else
      {
        BOOL v7 = a3;
        currentHeadingAnimation = self->super._currentHeadingAnimation;
        if (currentHeadingAnimation)
        {
          [(VKAnimation *)currentHeadingAnimation stop];
          v9 = self->super._currentHeadingAnimation;
          self->super._currentHeadingAnimation = 0;

          __int16 v5 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
        }
        if ((v5 & 0x100) == 0
          || [(VKTrackableAnnotation *)self->super._annotation hasValidHeading])
        {
          [(VKCameraController *)self camera];
          v10 = (void *)*((void *)location + 6);
          if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
            std::__shared_weak_count::__release_weak(v26);
          }
          [(VKTrackableAnnotation *)self->super._annotation headingDegrees];
          double v12 = v11 * -0.0174532925 + 6.28318531;
          if (v7)
          {
            self->super._headingAnimationCompletedAngle = 0.0;
            v13 = [[VKTimedAnimation alloc] initWithDuration:fmax(a4, 0.200000003)];
            v14 = self->super._currentHeadingAnimation;
            self->super._currentHeadingAnimation = v13;

            [(VKTimedAnimation *)self->super._currentHeadingAnimation setTimingFunction:VKAnimationCurveLinear];
            [(VKCameraController *)self beginRegionChange:1];
            objc_initWeak(&location, self);
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3321888768;
            v23[2] = __81__VKDaVinciAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke;
            v23[3] = &unk_1EF58E4A8;
            objc_copyWeak(v24, &location);
            v24[1] = v10;
            v24[2] = *(id *)&v12;
            [(VKTimedAnimation *)self->super._currentHeadingAnimation setStepHandler:v23];
            uint64_t v18 = MEMORY[0x1E4F143A8];
            uint64_t v19 = 3221225472;
            v20 = __81__VKDaVinciAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_5;
            v21 = &unk_1E5A96C78;
            objc_copyWeak(&v22, &location);
            [(VKAnimation *)self->super._currentHeadingAnimation setCompletionHandler:&v18];
            md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._currentHeadingAnimation->super);
            objc_destroyWeak(&v22);
            objc_destroyWeak(v24);
            objc_destroyWeak(&location);
          }
          else
          {
            [(VKCameraController *)self beginRegionChange:0];
            [(VKCameraController *)self camera];
            v15 = v26;
            *((double *)location + 6) = v12;
            if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
              std::__shared_weak_count::__release_weak(v15);
            }
            v16 = [(VKCameraController *)self cameraDelegate];
            [v16 mapLayerDidChangeVisibleRegion];

            uint64_t v17 = *(void *)[(VKCameraController *)self runLoopController];
            if (v17)
            {
              LOBYTE(location) = 4;
              md::MapEngine::setNeedsTick(v17, &location);
            }
            [(VKCameraController *)self endRegionChange];
          }
          [(VKDaVinciAnnotationTrackingCameraController *)self updateFramerate];
        }
      }
    }
  }
}

void __81__VKDaVinciAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke(uint64_t a1, float a2)
{
  WeakRetained = (float *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = *(double *)(a1 + 40);
    long double v6 = fmod(3.14159265 - v5 + *(double *)(a1 + 48), 6.28318531);
    long double v7 = fmod(v6 + 6.28318531, 6.28318531);
    long double v8 = fmod(v5 + 3.14159265 + (v7 + -3.14159265) * a2, 6.28318531);
    long double v9 = fmod(v8 + 6.28318531, 6.28318531) + -3.14159265;
    float v10 = v9;
    WeakRetained[70] = v10;
    [WeakRetained camera];
    *(long double *)(v12 + 48) = v9;
    if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
    double v11 = [WeakRetained cameraDelegate];
    [v11 mapLayerDidChangeVisibleRegion];
  }
}

void __81__VKDaVinciAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_5(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2)
    {
      v3 = (void *)WeakRetained[33];
      WeakRetained[33] = 0;
    }
    [WeakRetained endRegionChange];
    [WeakRetained updateFramerate];
  }
}

- (void)_goToAnnotationAnimated:(BOOL)a3 duration:(double)a4 timingFunction:(id)a5 isInitial:(BOOL)a6
{
  BOOL v6 = a6;
  int v8 = a3;
  id v10 = a5;
  if (self->super._annotation)
  {
    id v182 = v10;
    [(VKCameraController *)self camera];
    uint64_t v11 = v214;
    if (*((void *)&v214 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v214 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**((void **)&v214 + 1) + 16))(*((void *)&v214 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v214 + 1));
    }
    double v12 = *(double *)(v214 + 32);
    v13 = [(VKCameraController *)self canvas];
    [v13 size];
    double v15 = v14;
    double v17 = v16;

    [(VKDaVinciAnnotationTrackingCameraController *)self _effectiveEdgeInsets];
    float v19 = v18;
    float v21 = v20;
    float v23 = v22;
    float v25 = v24;
    -[VKDaVinciAnnotationTrackingCameraController _scaledEdgeInsets:withCanvasSize:](self, "_scaledEdgeInsets:withCanvasSize:");
    float v172 = v19;
    double v175 = v12;
    float v177 = v27;
    float v178 = v26;
    float v179 = v29;
    float v180 = v28;
    [(VKTrackableAnnotation *)self->super._annotation coordinate];
    double v173 = v31;
    double v174 = v30;
    [(VKTrackableAnnotation *)self->super._annotation coordinate];
    double v33 = v32;
    [(VKTrackableAnnotation *)self->super._annotation coordinate];
    *(double *)&long long v212 = v33 * 0.0174532925;
    *((double *)&v212 + 1) = v34 * 0.0174532925;
    uint64_t v213 = 0;
    double v215 = 0.0;
    long long v214 = v212;
    currentAnimation = self->super._currentAnimation;
    __int16 v36 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
    if (!currentAnimation && (v36 & 2) == 0)
    {
      double v37 = 0.0;
      goto LABEL_11;
    }
    if ((v36 & 0x12) == 0)
    {
      double v38 = a4;
      [(VKTimedAnimation *)currentAnimation duration];
      double v40 = v39;
      float v41 = *((float *)&self->super._elevationLogic + 1);
      [(VKAnimation *)self->super._currentAnimation stop];
      double v37 = v40 * (float)(1.0 - v41);
      v42 = self->super._currentAnimation;
      self->super._currentAnimation = 0;

      __int16 v36 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
      a4 = v38;
LABEL_11:
      annotationPresentation = self->super._annotationPresentation;
      if (v6) {
        __int16 v43 = 16;
      }
      else {
        __int16 v43 = 0;
      }
      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v36 & 0xFFEF | v43;
      BOOL v44 = [(VKAnnotationTrackingCameraController *)self shouldForceZoomToFit];
      v176 = (uint64_t *)(v11 + 8);
      gdc::ViewDataAccess::screenPointForCoordinate(*(double **)([(VKCameraController *)self mapDataAccess] + 16), (double *)&v212, (uint64_t *)(v11 + 8));
      if (v45 >= v15 * -16.0)
      {
        BOOL v48 = v45 < v15 * 33.0;
        if (v46 < v17 * -16.0) {
          BOOL v48 = 0;
        }
        BOOL v47 = v46 < v17 * 33.0 && v48;
      }
      else
      {
        BOOL v47 = 0;
      }
      [(VKDaVinciAnnotationTrackingCameraController *)self _minTrackingCameraDistance:v47];
      double v50 = v49;
      double v170 = 0.0;
      if ((*(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) & 0x80) != 0)
      {
        v51 = [(VKCameraController *)self canvas];
        [v51 size];
        if (v52 <= 0.0)
        {
        }
        else
        {
          v53 = [(VKCameraController *)self canvas];
          [v53 size];
          double v55 = v54;

          if (v55 > 0.0)
          {
            [(VKTrackableAnnotation *)self->super._annotation accuracy];
            int v171 = 0;
            double v170 = 0.0;
            if (v8 && !v6)
            {
              if (self->super._annotationPresentation)
              {
                [(VKTrackableAnnotation *)self->super._annotation accuracy];
                double v170 = v56;
                int v171 = 1;
              }
              else
              {
                int v171 = 0;
              }
            }
            [(VKTrackableAnnotation *)self->super._annotation coordinate];
            GEOMapRectMakeWithRadialDistance();
            double v125 = v124;
            double v127 = v126;
            [(VKCameraController *)self camera];
            double v168 = v125;
            double v128 = *((double *)location + 46);
            double v129 = *((double *)location + 47);
            double v130 = v127;
            if (v128 >= v129)
            {
              double v136 = *((double *)location + 57);
            }
            else
            {
              double v131 = v129 * v128;
              double v132 = v128 / v129;
              if (v131 <= 0.0) {
                double v133 = 1.0;
              }
              else {
                double v133 = v132;
              }
              long double v134 = tan(*((double *)location + 57) * 0.5);
              long double v135 = atan(v133 * v134);
              double v136 = v135 + v135;
            }
            long double v137 = tan(v136 * 0.5);
            if (v211 && !atomic_fetch_add(&v211->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v211->__on_zero_shared)(v211);
              std::__shared_weak_count::__release_weak(v211);
            }
            [(VKCameraController *)self camera];
            double v139 = *((double *)location + 46);
            double v138 = *((double *)location + 47);
            double v165 = v137;
            if (v138 >= v139)
            {
              double v145 = *((double *)location + 57);
            }
            else
            {
              double v140 = v138 * v139;
              double v141 = v138 / v139;
              if (v140 <= 0.0) {
                double v142 = 1.0;
              }
              else {
                double v142 = v141;
              }
              long double v143 = tan(*((double *)location + 57) * 0.5);
              long double v144 = atan(v142 * v143);
              double v145 = v144 + v144;
            }
            double v166 = a4;
            double v167 = v37;
            long double v163 = tan(v145 * 0.5);
            if (v211 && !atomic_fetch_add(&v211->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v211->__on_zero_shared)(v211);
              std::__shared_weak_count::__release_weak(v211);
            }
            double v147 = *MEMORY[0x1E4F63F10];
            double v146 = *(double *)(MEMORY[0x1E4F63F10] + 8);
            v148 = [(VKCameraController *)self canvas];
            [v148 size];
            double v150 = v149;

            v151 = [(VKCameraController *)self canvas];
            [v151 size];
            double v152 = v168 / v147;
            double v153 = v130 / v146;
            double v154 = v168 / v147 * 0.5;
            double v155 = v153 * 0.5;
            double v156 = v152 - v152 * (float)(v21 + v25) / v150;
            double v158 = v153 - v153 * (float)(v172 + v23) / v157;

            double v159 = v165 * 0.5 * v156 / v154;
            double v160 = v164 * 0.5 * v158 / v155;
            double v161 = v154 / v159;
            if (v159 <= 0.0) {
              double v161 = 0.0;
            }
            if (v160 <= 0.0) {
              double v162 = 0.0;
            }
            else {
              double v162 = v155 / v160;
            }
            double v50 = fmax(fmax(v161, v162) * 40075017.0, v50);
            a4 = v166;
            double v37 = v167;
LABEL_30:
            [(VKCameraController *)self camera];
            uint64_t v209 = *((void *)location + 4);
            [(VKDaVinciAnnotationTrackingCameraController *)self _zoomLevelForDistance:&v209];
            double v58 = v57;
            v59 = v211;
            if (v211 && !atomic_fetch_add(&v211->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
              std::__shared_weak_count::__release_weak(v59);
            }
            double v208 = v50;
            [(VKDaVinciAnnotationTrackingCameraController *)self _zoomLevelForDistance:&v208];
            if (self->super._behavior.shouldPreserveUserSpecifiedZoomLevel && self->super._hasUserSpecifiedZoomLevel)
            {
              double v61 = v58 - v60;
              if (v60 < v58)
              {
                BOOL v62 = v61 > 0.0 && v6;
                LOBYTE(v44) = v44 || v62;
              }
              BOOL v63 = fabs(v61) > 4.5 && v6;
              if (!v63 && !v44) {
                goto LABEL_45;
              }
            }
            else if (!v44)
            {
LABEL_45:
              int v64 = 0;
              double v50 = v175;
LABEL_48:
              v65 = [(VKCameraController *)self canvas];
              [v65 size];
              double v67 = v66;
              v68 = [(VKCameraController *)self canvas];
              [v68 size];
              double v70 = v69;
              double v71 = a4;

              gdc::ViewDataAccess::screenPointForCoordinate(*(double **)([(VKCameraController *)self mapDataAccess] + 16), (double *)&v214, v176);
              double v74 = sqrt((v72 - v67 * ((float)(v179 - v177) + 0.5)) * (v72 - v67 * ((float)(v179 - v177) + 0.5))+ (v73 - v70 * (0.5 - (float)(v178 - v180))) * (v73 - v70 * (0.5 - (float)(v178 - v180))));
              double v75 = vabdd_f64(*(double *)(v11 + 32), v50);
              id v10 = v182;
              if (v74 < 0.000001 && v75 <= 0.000000001)
              {
                *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x10u;
                goto LABEL_103;
              }
              if ((!v64 || v75 <= 0.000000001) && v74 < 1.5) {
                int v8 = 0;
              }
              if (v6)
              {
                int v76 = v8 ^ 1;
                if (v74 <= 10000.0) {
                  int v76 = 1;
                }
                v8 &= v76;
              }
              if (v75 > 0.000000001) {
                [(VKAnnotationTrackingCameraController *)self setHasUserSpecifiedZoomLevel:0];
              }
              v206[0] = MEMORY[0x1E4F143A8];
              v206[1] = 3221225472;
              v206[2] = __105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke;
              v206[3] = &unk_1E5A96000;
              v206[4] = self;
              char v207 = v8;
              v77 = (void (**)(void, void))MEMORY[0x1A6239EB0](v206);
              if (v8)
              {
                if (v71 == -1.0)
                {
                  uint64_t v205 = *(void *)(v11 + 32);
                  [(VKDaVinciAnnotationTrackingCameraController *)self _zoomLevelForDistance:&v205];
                  double v79 = v78;
                  double v204 = v50;
                  [(VKDaVinciAnnotationTrackingCameraController *)self _zoomLevelForDistance:&v204];
                  double v37 = fmax(fmin(fmax(vabdd_f64(v79, v80) * 0.166666672, v74 * 0.00156250002), 1.0), 0.200000003);
                }
                else if (v37 <= 0.200000003)
                {
                  double v37 = fmax(v71, 0.200000003);
                }
                double v86 = *(double *)v176;
                if (*(double *)v176 == *(double *)&v214)
                {
                  double v86 = *(double *)(v11 + 16);
                  if (v86 == *((double *)&v214 + 1))
                  {
                    double v86 = *(double *)(v11 + 24);
                    if (v86 == v215)
                    {
                      double v86 = *(double *)(v11 + 32);
                      if (v86 == v50) {
                        goto LABEL_102;
                      }
                    }
                  }
                }
                -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v86);
                v87 = self->super._annotationPresentation;
                v88 = v87;
                double v89 = 0.0;
                if (v171)
                {
                  [(VKTrackableAnnotationPresentation *)v87 setAnimatingAccuracy:1];
                  [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation presentationAccuracy];
                  uint64_t v91 = v90;
                  [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation minimumAccuracy];
                  double v92 = v170;
                  if (v170 >= v93)
                  {
                    [(VKCameraController *)self camera];
                    v94 = [(VKCameraController *)self canvas];
                    [v94 size];
                    double v96 = v95;
                    v97 = (double *)location;
                    double v98 = cos(*((long double *)location + 5)) * v50;
                    double v99 = v97[46];
                    double v100 = v97[47];
                    if (v99 >= v100)
                    {
                      double v106 = v97[57];
                    }
                    else
                    {
                      double v101 = v100 * v99;
                      double v102 = v99 / v100;
                      if (v101 <= 0.0) {
                        double v103 = 1.0;
                      }
                      else {
                        double v103 = v102;
                      }
                      long double v104 = v103 * tan(v97[57] * 0.5);
                      double v92 = v170;
                      long double v105 = atan(v104);
                      double v106 = v105 + v105;
                    }
                    long double v107 = tan(v106 * 0.5);
                    float v108 = log2(v107 * 0.0000000499064043 * v98);
                    double v109 = exp2((float)-fminf(fmaxf(-v108, 1.0), 25.0)) * 40075017.0;
                    double v110 = v96 * v92;

                    v111 = v211;
                    if (v211 && !atomic_fetch_add(&v211->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                    {
                      ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
                      std::__shared_weak_count::__release_weak(v111);
                    }
                    double v89 = v110 / v109;
                  }
                }
                else
                {
                  uint64_t v91 = 0;
                }
                LOBYTE(self->_currentAnimationCompletedFraction) = v64;
                v112 = [[VKTimedAnimation alloc] initWithDuration:v37];
                v113 = self->super._currentAnimation;
                self->super._currentAnimation = v112;

                v114 = (uint64_t *)&VKAnimationCurveEaseInOut;
                if (!v6) {
                  v114 = &VKAnimationCurveLinear;
                }
                uint64_t v115 = *v114;
                if (v182) {
                  id v116 = v182;
                }
                else {
                  id v116 = (id)v115;
                }
                [(VKTimedAnimation *)self->super._currentAnimation setTimingFunction:v116];
                HIDWORD(self->super._elevationLogic) = 0;
                [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation presentationCoordinate];
                double v118 = v117;
                [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation presentationCoordinate];
                self->_currentAnimationPresentationStartCoordinate.latitude = v118;
                self->_currentAnimationPresentationStartCoordinate.longitude = v119;
                self->_currentAnimationPresentationEndCoordinate.latitude = v174;
                self->_currentAnimationPresentationEndCoordinate.longitude = v173;
                uint64_t v120 = *(void *)(v11 + 32);
                objc_initWeak(&location, self);
                v192[0] = MEMORY[0x1E4F143A8];
                v192[1] = 3321888768;
                v192[2] = __105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2;
                v192[3] = &unk_1EF58DC30;
                objc_copyWeak(v194, &location);
                v194[1] = (id)(v11 + 8);
                long long v181 = v214;
                long long v195 = v214;
                double v121 = v215;
                char v201 = v64;
                double v196 = v215;
                uint64_t v197 = v120;
                BOOL v202 = annotationPresentation != 0;
                char v203 = v171;
                double v198 = v50;
                uint64_t v199 = v91;
                double v200 = v89;
                v122 = v88;
                v193 = v122;
                [(VKTimedAnimation *)self->super._currentAnimation setStepHandler:v192];
                v183[0] = MEMORY[0x1E4F143A8];
                v183[1] = 3321888768;
                v183[2] = __105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_4;
                v183[3] = &unk_1EF58EBE8;
                objc_copyWeak(&v186, &location);
                long long v187 = v181;
                double v188 = v121;
                double v189 = v50;
                BOOL v190 = annotationPresentation != 0;
                v183[4] = self;
                v123 = v122;
                v184 = v123;
                BOOL v191 = v6;
                v185 = v77;
                [(VKAnimation *)self->super._currentAnimation setCompletionHandler:v183];
                md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._currentAnimation->super);

                objc_destroyWeak(&v186);
                objc_destroyWeak(v194);
                objc_destroyWeak(&location);
              }
              else
              {
                *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) |= 0x20u;
                [(VKCameraController *)self beginRegionChange:0];
                [(VKCameraController *)self camera];
                v81 = (double *)location;
                *(_OWORD *)((char *)location + 8) = v214;
                v81[3] = v215;
                v82 = v211;
                if (v211 && !atomic_fetch_add(&v211->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
                  std::__shared_weak_count::__release_weak(v82);
                }
                [(VKCameraController *)self camera];
                v83 = v211;
                *((double *)location + 4) = v50;
                if (v83 && !atomic_fetch_add(&v83->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
                  std::__shared_weak_count::__release_weak(v83);
                }
                *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x10u;
                if (annotationPresentation)
                {
                  [(VKTrackableAnnotation *)self->super._annotation coordinate];
                  -[VKTrackableAnnotationPresentation setPresentationCoordinate:](self->super._annotationPresentation, "setPresentationCoordinate:");
                }
                v84 = [(VKCameraController *)self cameraDelegate];
                [v84 mapLayerDidChangeVisibleRegion];

                uint64_t v85 = *(void *)[(VKCameraController *)self runLoopController];
                if (v85)
                {
                  LOBYTE(location) = 4;
                  md::MapEngine::setNeedsTick(v85, &location);
                }
                *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x20u;
                [(VKCameraController *)self endRegionChange];
                if (!self->super._annotationPresentation) {
                  v77[2](v77, 0);
                }
              }
              [(VKDaVinciAnnotationTrackingCameraController *)self updateFramerate];
LABEL_102:

              id v10 = v182;
              goto LABEL_103;
            }
            int v64 = 1;
            goto LABEL_48;
          }
        }
      }
      int v171 = 0;
      goto LABEL_30;
    }
    *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v36 | 1;
    self->super._pendingChangeDuration = a4;
  }
LABEL_103:
}

void *__105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke(uint64_t a1, char a2)
{
  result = *(void **)(a1 + 32);
  if (!result[18])
  {
    double v5 = [result cameraDelegate];
    uint64_t v6 = [v5 mapLayerPresentationForAnnotation:*(void *)(*(void *)(a1 + 32) + 136)];
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 144);
    *(void *)(v7 + 144) = v6;

    [*(id *)(*(void *)(a1 + 32) + 144) setTracking:1];
    [*(id *)(*(void *)(a1 + 32) + 136) coordinate];
    result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "setPresentationCoordinate:");
    if ((a2 & 1) == 0)
    {
      result = *(void **)(a1 + 32);
      if (result[18])
      {
        uint64_t v9 = *(unsigned __int8 *)(a1 + 40);
        return (void *)[result _goToAnnotationAnimated:v9 duration:0 timingFunction:0 isInitial:-1.0];
      }
    }
  }
  return result;
}

void __105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2(uint64_t a1, float a2)
{
  WeakRetained = (float *)objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_14;
  }
  WeakRetained[85] = a2;
  uint64_t v6 = *(float64x2_t **)(a1 + 48);
  float64x2_t v12 = *v6;
  float64x2_t v13 = *(float64x2_t *)(a1 + 56);
  double v7 = v6[1].f64[0];
  [WeakRetained camera];
  float64x2_t v8 = vsubq_f64(v13, v12);
  double v14 = a2;
  *(float64x2_t *)(v15 + 8) = vmlaq_n_f64(v12, v8, a2);
  *(double *)(v15 + 24) = v7 - v7 * a2;
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v16->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v16);
    if (*(unsigned char *)(a1 + 112)) {
      goto LABEL_5;
    }
  }
  else if (*(unsigned char *)(a1 + 112))
  {
LABEL_5:
    double v9 = *(double *)(a1 + 80);
    double v10 = *(double *)(a1 + 88);
    [v5 camera];
    *(double *)(v15 + 32) = v9 + (v10 - v9) * v14;
    if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v16->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  if (*(unsigned char *)(a1 + 113)) {
    objc_msgSend(*((id *)v5 + 18), "setPresentationCoordinate:", vmlaq_n_f64(*(float64x2_t *)(v5 + 88), vsubq_f64(*(float64x2_t *)(v5 + 92), *(float64x2_t *)(v5 + 88)), v14));
  }
  if (*(unsigned char *)(a1 + 114)) {
    [*(id *)(a1 + 32) setPresentationAccuracy:*(double *)(a1 + 96) + (*(double *)(a1 + 104) - *(double *)(a1 + 96)) * v14];
  }
  uint64_t v11 = [v5 cameraDelegate];
  [v11 mapLayerDidChangeVisibleRegion];

LABEL_14:
}

void __105__VKDaVinciAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_4(uint64_t a1, char a2)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 56));
  double v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_19;
  }
  if ((a2 & 1) == 0)
  {
    int v8 = 0;
    goto LABEL_12;
  }
  [WeakRetained camera];
  uint64_t v6 = *(void *)(a1 + 80);
  *(_OWORD *)(v10 + 8) = *(_OWORD *)(a1 + 64);
  *(void *)(v10 + 24) = v6;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v11->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v11);
  }
  [v5 camera];
  *(void *)(v10 + 32) = *(void *)(a1 + 88);
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v11->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v11);
    if (!*(unsigned char *)(a1 + 96)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 96))
  {
LABEL_9:
    [*((id *)v5 + 17) coordinate];
    objc_msgSend(*((id *)v5 + 18), "setPresentationCoordinate:");
  }
LABEL_10:
  double v7 = (void *)*((void *)v5 + 19);
  *((void *)v5 + 19) = 0;

  int v8 = *(_WORD *)(*(void *)(a1 + 32) + 321) & 1;
LABEL_12:
  *(_WORD *)(v5 + 321) &= 0xFFEEu;
  v5[344] = 0;
  [*(id *)(a1 + 40) setAnimatingAccuracy:0];
  [v5 endRegionChange];
  if (*(unsigned char *)(a1 + 97))
  {
    double v9 = [v5 cameraDelegate];
    [v9 mapLayerDidFinishInitialTrackingAnimation];
  }
  if (!*(void *)(*(void *)(a1 + 32) + 144)) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  if (v8) {
    [v5 _goToAnnotationAnimated:1 duration:0 timingFunction:0 isInitial:*((double *)v5 + 32)];
  }
  [v5 updateFramerate];
LABEL_19:
}

- (void)updateFramerate
{
  if (LOBYTE(self->_currentAnimationCompletedFraction))
  {
    v3 = [(VKCameraController *)self runLoopController];
    uint64_t v4 = [(VKCameraController *)self maxDisplayRate];
    v3->var1 = v4;
    uint64_t var0 = (uint64_t)v3->var0;
    if (v3->var0 && !**(unsigned char **)(var0 + 1056))
    {
      md::MapEngine::setDisplayRate(var0, v4);
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VKDaVinciAnnotationTrackingCameraController;
    [(VKAnnotationTrackingCameraController *)&v6 updateFramerate];
  }
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

- (VKEdgeInsets)_scaledEdgeInsets:(VKEdgeInsets)a3 withCanvasSize:(CGSize)a4
{
  CGFloat v4 = a4.height + a4.height;
  CGFloat v5 = a4.width + a4.width;
  float v6 = a3.top / v4;
  float v7 = a3.left / v5;
  float v8 = a3.bottom / v4;
  float v9 = a3.right / v5;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (Coordinate3D<geo::Radians,)_centerCoordinate:()Coordinate3D<geo:(double>)a3 :(VKEdgeInsets)a4 Radians forEdgeInsets:
{
  float top = a4.top;
  int value_low = LODWORD(a3.altitude._value);
  int v8 = LODWORD(a3.longitude._value);
  int v9 = LODWORD(a3.latitude._value);
  float v10 = v4;
  float v12 = v5;
  float v13 = [(VKCameraController *)self canvas];
  [v13 size];
  double v15 = v14;
  double v17 = v16;
  LODWORD(v14) = v9;
  LODWORD(v16) = v8;
  LODWORD(v18) = value_low;
  *(float *)&double v19 = top;
  -[VKDaVinciAnnotationTrackingCameraController _scaledEdgeInsets:withCanvasSize:](self, "_scaledEdgeInsets:withCanvasSize:", v14, v16, v18, v19, v15, v17);
  float v21 = v20;
  float v23 = v22;
  float v25 = v24;
  float v27 = v26;

  double v28 = (float)(v23 - v27);
  double v29 = (float)(v25 - v21);
  [(VKCameraController *)self camera];
  long long v30 = *(_OWORD *)(*(void *)&v36 + 24);
  long long v39 = *(_OWORD *)(*(void *)&v36 + 8);
  long long v40 = v30;
  long long v41 = *(_OWORD *)(*(void *)&v36 + 40);
  uint64_t v42 = *(void *)(*(void *)&v36 + 56);
  if (*(double *)&v37 != 0.0 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
    std::__shared_weak_count::__release_weak(v37);
  }
  long long v39 = *(_OWORD *)v10;
  *(double *)&long long v40 = v10[2];
  double v31 = [(VKCameraController *)self mapDataAccess];
  v32.f64[0] = v28 + 0.5;
  v32.f64[1] = v29 + 0.5;
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v36, (uint64_t)v31, (uint64_t)&v39, 0, v32);
  double v33 = v38;
  double v34 = *v10;
  if (v36 == -3.14159265 && *(double *)&v37 == -3.14159265 && v38 == 0.0)
  {
    double v35 = v10[1];
    double v33 = v10[2];
  }
  else
  {
    double v34 = -(v36 + v34 * -2.0);
    double v35 = v10[1] - *(double *)&v37 + v10[1];
  }
  *float v12 = v34;
  v12[1] = v35;
  v12[2] = v33;
  result.altitude = *(Unit<geo::MeterUnitDescription, double> *)&v35;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v34;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&v33;
  return result;
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  float right = a3.right;
  float bottom = a3.bottom;
  float left = a3.left;
  float top = a3.top;
  [(VKDaVinciAnnotationTrackingCameraController *)self _effectiveEdgeInsets];
  int v9 = v8;
  int v11 = v10;
  int v13 = v12;
  int v15 = v14;
  v87.receiver = self;
  v87.super_class = (Class)VKDaVinciAnnotationTrackingCameraController;
  *(float *)&double v16 = top;
  *(float *)&double v17 = left;
  *(float *)&double v18 = bottom;
  *(float *)&double v19 = right;
  -[VKCameraController setEdgeInsets:](&v87, sel_setEdgeInsets_, v16, v17, v18, v19);
  if (self->super._currentAnimation)
  {
    [(VKDaVinciAnnotationTrackingCameraController *)self _effectiveEdgeInsets];
    int v21 = v20;
    int v23 = v22;
    int v25 = v24;
    int v27 = v26;
    double v28 = [(VKCameraController *)self canvas];
    [v28 size];
    double v30 = v29;
    double v32 = v31;
    LODWORD(v29) = v9;
    LODWORD(v31) = v11;
    LODWORD(v33) = v13;
    LODWORD(v34) = v15;
    -[VKDaVinciAnnotationTrackingCameraController _scaledEdgeInsets:withCanvasSize:](self, "_scaledEdgeInsets:withCanvasSize:", v29, v31, v33, v34, v30, v32);
    float v36 = v35;
    float v38 = v37;
    float v40 = v39;
    float v42 = v41;

    __int16 v43 = [(VKCameraController *)self canvas];
    [v43 size];
    double v45 = v44;
    double v47 = v46;
    LODWORD(v44) = v21;
    LODWORD(v46) = v23;
    LODWORD(v48) = v25;
    LODWORD(v49) = v27;
    -[VKDaVinciAnnotationTrackingCameraController _scaledEdgeInsets:withCanvasSize:](self, "_scaledEdgeInsets:withCanvasSize:", v44, v46, v48, v49, v45, v47);
    float v51 = v50;
    float v53 = v52;
    float v55 = v54;
    float v57 = v56;

    double v58 = [(VKCameraController *)self mapDataAccess];
    v59.f64[0] = (float)(v38 - v42) + 0.5;
    v59.f64[1] = (float)(v40 - v36) + 0.5;
    float64x2_t v79 = v59;
    [(VKCameraController *)self camera];
    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)v86, (uint64_t)v58, *(void *)&v83 + 8, 0, v79);
    double v60 = (float)(v53 - v57);
    double v61 = (float)(v55 - v51);
    if (v84 && !atomic_fetch_add(&v84->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
      std::__shared_weak_count::__release_weak(v84);
    }
    BOOL v62 = [(VKCameraController *)self mapDataAccess];
    v63.f64[0] = v60 + 0.5;
    v63.f64[1] = v61 + 0.5;
    float64x2_t v80 = v63;
    [(VKCameraController *)self camera];
    md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v83, (uint64_t)v62, v81 + 8, 0, v80);
    if (v82)
    {
      if (!atomic_fetch_add(&v82->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)())v82->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v82);
      }
    }
    double v64 = v86[1];
    double v65 = v86[2];
    __double2 v66 = __sincos_stret(v86[0]);
    double v67 = 6378137.0 / sqrt(1.0 - v66.__sinval * v66.__sinval * 0.00669437999);
    double v68 = (v67 + v65) * v66.__cosval;
    __double2 v69 = __sincos_stret(v64);
    double v78 = v65 + v67 * 0.99330562;
    double v70 = v84;
    double v71 = v85;
    __double2 v72 = __sincos_stret(v83);
    double v73 = 6378137.0 / sqrt(1.0 - v72.__sinval * v72.__sinval * 0.00669437999);
    double v74 = (v73 + v71) * v72.__cosval;
    __double2 v75 = __sincos_stret(*(double *)&v70);
    double v76 = self->super._currentAnimationEndCameraPosition._e[1] + v68 * v69.__sinval - v74 * v75.__sinval;
    double v77 = self->super._currentAnimationEndCameraPosition._e[2]
        + v78 * v66.__sinval
        - (v71 + v73 * 0.99330562) * v72.__sinval;
    self->super._currentAnimationEndCameraPosition._e[0] = self->super._currentAnimationEndCameraPosition._e[0]
                                                         + v68 * v69.__cosval
                                                         - v74 * v75.__cosval;
    self->super._currentAnimationEndCameraPosition._e[1] = v76;
    self->super._currentAnimationEndCameraPosition._e[2] = v77;
  }
  else
  {
    [(VKDaVinciAnnotationTrackingCameraController *)self _goToAnnotationAnimated:0 duration:0 timingFunction:0 isInitial:0.0];
  }
}

- (double)_minTrackingCameraDistance:(BOOL)a3
{
  BOOL v3 = a3;
  CGFloat v5 = [(VKCameraController *)self canvas];
  [v5 size];
  *(float *)&double v6 = 512.0 / v6;
  float v7 = log2f(*(float *)&v6);

  double idealCenterCoordinateDistance = self->super._behavior.idealCenterCoordinateDistance;
  if (idealCenterCoordinateDistance < 0.0)
  {
    [(VKCameraController *)self camera];
    double v9 = *(double *)(v40 + 368);
    double v10 = *(double *)(v40 + 376);
    if (v9 >= v10)
    {
      double v16 = *(double *)(v40 + 456);
    }
    else
    {
      double v11 = v10 * v9;
      double v12 = v9 / v10;
      if (v11 <= 0.0) {
        double v13 = 1.0;
      }
      else {
        double v13 = v12;
      }
      long double v14 = tan(*(double *)(v40 + 456) * 0.5);
      long double v15 = atan(v13 * v14);
      double v16 = v15 + v15;
    }
    double v17 = tan(v16 * 0.5);
    double v18 = v17 + v17;
    double v19 = exp2((float)(-14.0 - v7)) * 40075017.0;
    if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v41->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v41);
    }
    double idealCenterCoordinateDistance = v19 / v18;
  }
  [(VKCameraController *)self camera];
  int v20 = *(unsigned __int8 *)(v40 + 336);
  if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v41->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v41);
  }
  if (v20)
  {
    [(VKCameraController *)self camera];
    double v21 = *(double *)(v40 + 344);
    if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v41->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  else
  {
    [(VKCameraController *)self camera];
    double v22 = *(double *)(v40 + 368);
    double v23 = *(double *)(v40 + 376);
    if (v22 >= v23)
    {
      double v29 = *(double *)(v40 + 456);
    }
    else
    {
      double v24 = v23 * v22;
      double v25 = v22 / v23;
      if (v24 <= 0.0) {
        double v26 = 1.0;
      }
      else {
        double v26 = v25;
      }
      long double v27 = tan(*(double *)(v40 + 456) * 0.5);
      long double v28 = atan(v26 * v27);
      double v29 = v28 + v28;
    }
    double v30 = tan(v29 * 0.5);
    long double v31 = exp2((float)(-20.0 - v7));
    double v32 = v30 + v30;
    double v33 = v31 * 40075017.0;
    if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v41->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v41);
    }
    double v21 = v33 / v32;
  }
  [(VKCameraController *)self camera];
  double v34 = v21;
  if (*(double *)(v40 + 104) > v21)
  {
    [(VKCameraController *)self camera];
    double v34 = *(double *)(v38 + 104);
    if (v39)
    {
      if (!atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)())v39->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v39);
      }
    }
  }
  if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v41->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v41);
  }
  double v35 = fmin(fmax(idealCenterCoordinateDistance, v21), v34);
  if (self->super._behavior.shouldPreserveUserSpecifiedZoomLevel && self->super._hasUserSpecifiedZoomLevel && v3)
  {
    [(VKCameraController *)self camera];
    double v36 = *(double *)(v40 + 32);
    if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)())v41->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v41);
    }
    return fmin(v36, v35);
  }
  return v35;
}

- (double)_zoomLevelForDistance:()Unit<geo:(double>)a3 :MeterUnitDescription
{
  CGFloat v4 = v3;
  [(VKCameraController *)self camera];
  double v6 = v23[46];
  double v7 = v23[47];
  if (v6 >= v7)
  {
    double v13 = v23[57];
  }
  else
  {
    double v8 = v7 * v6;
    double v9 = v6 / v7;
    if (v8 <= 0.0) {
      double v10 = 1.0;
    }
    else {
      double v10 = v9;
    }
    long double v11 = tan(v23[57] * 0.5);
    long double v12 = atan(v10 * v11);
    double v13 = v12 + v12;
  }
  double v14 = *v4;
  if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)())v24->__on_zero_shared)();
    std::__shared_weak_count::__release_weak(v24);
  }
  long double v15 = [(VKCameraController *)self canvas];
  [v15 size];
  double v17 = v16;
  long double v18 = tan(v13 * 0.5);
  float v19 = log2(v18 * (0.0000000499064043 * v14));
  float v20 = fminf(fmaxf(-v19, 1.0), 25.0);
  float v21 = 512.0 / v17;
  LODWORD(v17) = log2f(v21);

  return (float)(v20 + *(float *)&v17);
}

@end