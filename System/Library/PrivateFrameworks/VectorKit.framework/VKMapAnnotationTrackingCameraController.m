@interface VKMapAnnotationTrackingCameraController
- (VKEdgeInsets)_effectiveEdgeInsets;
- (double)_minTrackingCameraDistance:(BOOL)a3;
- (double)_zoomLevelForCameraPosition:()Matrix<double;
- (void)_goToAnnotationAnimated:(BOOL)a3 duration:(double)a4 timingFunction:(id)a5 isInitial:(BOOL)a6;
- (void)_rotateToHeadingAnimated:(BOOL)a3 duration:(double)a4;
- (void)setEdgeInsets:(VKEdgeInsets)a3;
- (void)updateFramerate;
@end

@implementation VKMapAnnotationTrackingCameraController

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
          v10 = [(VKCameraController *)self vkCamera];
          [v10 upVector];
          double v12 = v11;
          double v14 = v13;
          double v16 = v15;

          double v17 = -1.0;
          double v18 = sqrt(-(v16 * v16 + -1.0));
          double v19 = -v14 / v18;
          if (v19 > -1.0)
          {
            double v17 = 1.0;
            if (v19 < 1.0) {
              double v17 = -v14 / v18;
            }
          }
          double v20 = acos(v17);
          [(VKTrackableAnnotation *)self->super._annotation headingDegrees];
          double v22 = -v20;
          if (v12 <= 0.0) {
            double v22 = v20;
          }
          long double v23 = fmod(v22 + 6.28318531 + v21 * -0.0174532925, 6.28318531);
          double v24 = fmod(v23 + 6.28318531, 6.28318531) + -3.14159265;
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke;
          v40[3] = &unk_1E5A99028;
          v40[4] = self;
          v25 = (void (**)(void, double))MEMORY[0x1A6239EB0](v40);
          if (a3)
          {
            self->super._headingAnimationCompletedAngle = 0.0;
            v26 = [[VKTimedAnimation alloc] initWithDuration:fmax(a4, 0.200000003)];
            v27 = self->super._currentHeadingAnimation;
            self->super._currentHeadingAnimation = v26;

            [(VKTimedAnimation *)self->super._currentHeadingAnimation setTimingFunction:VKAnimationCurveLinear];
            [(VKCameraController *)self beginRegionChange:1];
            objc_initWeak(&location, self);
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_2;
            v36[3] = &unk_1E5A99050;
            objc_copyWeak(v38, &location);
            v38[1] = *(id *)&v24;
            v28 = v25;
            id v37 = v28;
            [(VKTimedAnimation *)self->super._currentHeadingAnimation setStepHandler:v36];
            uint64_t v30 = MEMORY[0x1E4F143A8];
            uint64_t v31 = 3221225472;
            v32 = __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_3;
            v33 = &unk_1E5A99078;
            objc_copyWeak(v35, &location);
            v35[1] = *(id *)&v24;
            v34 = v28;
            [(VKAnimation *)self->super._currentHeadingAnimation setCompletionHandler:&v30];
            md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._currentHeadingAnimation->super);

            objc_destroyWeak(v35);
            objc_destroyWeak(v38);
            objc_destroyWeak(&location);
          }
          else
          {
            [(VKCameraController *)self beginRegionChange:0];
            v25[2](v25, v24);
            uint64_t v29 = *(void *)[(VKCameraController *)self runLoopController];
            if (v29)
            {
              LOBYTE(location) = 4;
              md::MapEngine::setNeedsTick(v29, &location);
            }
            [(VKCameraController *)self endRegionChange];
          }
          [(VKMapAnnotationTrackingCameraController *)self updateFramerate];
        }
      }
    }
  }
}

void __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke(uint64_t a1, double a2)
{
  v4 = [*(id *)(a1 + 32) canvas];
  [v4 size];
  float64_t v57 = v6;
  float64_t v58 = v5;

  [*(id *)(a1 + 32) _effectiveEdgeInsets];
  unsigned int v56 = v7;
  unsigned int v54 = v8;
  unsigned int v53 = v9;
  unsigned int v55 = v10;
  double v11 = [*(id *)(a1 + 32) vkCamera];
  double v12 = v11;
  if (v11)
  {
    v13.f64[0] = v58;
    v13.f64[1] = v57;
    float64x2_t v14 = vaddq_f64(v13, v13);
    float64x2_t v15 = vcvtq_f64_f32(vsub_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v53, v54)), v14)), vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v56, v55)), v14))));
    __asm { FMOV            V1.2D, #0.5 }
    objc_msgSend(v11, "groundPointFromScreenPoint:", vaddq_f64(v15, _Q1));
  }
  else
  {
    long long v61 = 0u;
    long long v62 = 0u;
  }

  if ((_BYTE)v61)
  {
    __double2 v21 = __sincos_stret(a2 * 0.5);
    double v22 = [*(id *)(a1 + 32) vkCamera];
    uint64_t v23 = [v22 position];
    double v24 = *(double *)(v23 + 8);
    double v25 = *(double *)(v23 + 16);
    double v26 = v21.__sinval * -2.0;
    double v27 = v21.__sinval * -2.0 * (v24 - *(double *)&v62);
    double v28 = v21.__sinval + v21.__sinval;
    double v29 = (v21.__sinval + v21.__sinval) * (*(double *)v23 - *((double *)&v61 + 1));
    v60[0] = *(double *)v23 - v29 * v21.__sinval + v27 * v21.__cosval;
    v60[1] = v24 + v29 * v21.__cosval + v27 * v21.__sinval;
    v60[2] = v25;

    uint64_t v30 = [*(id *)(a1 + 32) vkCamera];
    uint64_t v31 = [v30 orientation];
    float64x2_t v32 = *(float64x2_t *)(v31 + 16);
    float64x2_t v33 = vmulq_n_f64(*(float64x2_t *)v31, v21.__cosval);
    int8x16_t v34 = (int8x16_t)vmulq_n_f64(*(float64x2_t *)v31, v21.__sinval);
    float64x2_t v35 = (float64x2_t)vextq_s8(v34, v34, 8uLL);
    *(void *)&long long v36 = *(_OWORD *)&vsubq_f64(v33, v35);
    *((void *)&v36 + 1) = *(void *)&vaddq_f64(v33, v35).f64[1];
    float64x2_t v37 = vmulq_n_f64(v32, v21.__cosval);
    int8x16_t v38 = (int8x16_t)vmulq_n_f64(v32, v21.__sinval);
    float64x2_t v39 = (float64x2_t)vextq_s8(v38, v38, 8uLL);
    *(void *)&v33.f64[0] = *(_OWORD *)&vaddq_f64(v37, v39);
    v33.f64[1] = vsubq_f64(v37, v39).f64[1];
    v59[0] = v36;
    v59[1] = v33;

    v40 = [*(id *)(a1 + 32) vkCamera];
    [v40 setPosition:v60];

    v41 = [*(id *)(a1 + 32) vkCamera];
    [v41 setOrientation:v59];

    uint64_t v42 = *(void *)(a1 + 32);
    if (*(void *)(v42 + 152))
    {
      double v43 = *(double *)(v42 + 184);
      double v44 = *(double *)(v42 + 192);
      double v45 = v26 * (v44 - *(double *)(v42 + 168));
      double v46 = v28 * (v43 - *(double *)(v42 + 160));
      *(double *)(v42 + 184) = v43 - v46 * v21.__sinval + v45 * v21.__cosval;
      *(double *)(v42 + 192) = v44 + v46 * v21.__cosval + v45 * v21.__sinval;
      v47 = *(double **)(a1 + 32);
      v48 = v47 + 29;
      v47 += 26;
      double v49 = v48[1];
      double v50 = v26 * (v49 - v47[1]);
      double v51 = v28 * (*v48 - *v47);
      double *v48 = *v48 - v51 * v21.__sinval + v50 * v21.__cosval;
      v48[1] = v49 + v51 * v21.__cosval + v50 * v21.__sinval;
      uint64_t v42 = *(void *)(a1 + 32);
    }
    v52 = [(id)v42 cameraDelegate];
    [v52 mapLayerDidChangeVisibleRegion];
  }
}

void __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_2(uint64_t a1, float a2)
{
  WeakRetained = (float *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v4 = *(double *)(a1 + 48) * a2;
    double v5 = v4 - WeakRetained[70];
    *(float *)&double v4 = v4;
    WeakRetained[70] = *(float *)&v4;
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v5);
  }
}

void __77__VKMapAnnotationTrackingCameraController__rotateToHeadingAnimated_duration___block_invoke_3(uint64_t a1, int a2)
{
  WeakRetained = (float *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unsigned int v7 = WeakRetained;
    if (a2)
    {
      float v5 = *(double *)(a1 + 48) - WeakRetained[70];
      if (v5 > 0.0) {
        (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v5);
      }
      double v6 = (void *)*((void *)v7 + 33);
      *((void *)v7 + 33) = 0;
    }
    [v7 endRegionChange];
    [v7 updateFramerate];
    WeakRetained = v7;
  }
}

- (void)_goToAnnotationAnimated:(BOOL)a3 duration:(double)a4 timingFunction:(id)a5 isInitial:(BOOL)a6
{
  BOOL v6 = a6;
  int v8 = a3;
  id v10 = a5;
  if (self->super._annotation)
  {
    double v11 = [(VKCameraController *)self canvas];
    [v11 size];
    double v13 = v12;
    double v15 = v14;

    [(VKMapAnnotationTrackingCameraController *)self _effectiveEdgeInsets];
    float v208 = v16;
    float v18 = v17;
    float v20 = v19;
    float v22 = v21;
    [(VKTrackableAnnotation *)self->super._annotation coordinate];
    v211 = v23;
    double v25 = v24;
    long double v26 = tan(v24 * 0.00872664626 + 0.785398163);
    long double v27 = log(v26);
    *(void *)&v28.f64[0] = v211;
    v28.f64[1] = v27;
    __asm { FMOV            V0.2D, #0.5 }
    float64x2_t v204 = _Q0;
    float64x2_t v241 = vmlaq_f64(_Q0, (float64x2_t)xmmword_1A28FCBE0, v28);
    double v242 = 0.0;
    float64x2_t v33 = [(VKCameraController *)self vkCamera];
    int8x16_t v34 = v33;
    float v200 = v18;
    float v198 = v20;
    float v35 = v18 / (v15 + v15);
    float v36 = v20 / (v13 + v13);
    float v37 = v22 / (v15 + v15);
    float v38 = v208 / (v13 + v13);
    double v39 = (float)(v36 - v38);
    double v40 = (float)(v37 - v35);
    double v41 = v39 + 0.5;
    if (v33)
    {
      objc_msgSend(v33, "groundPointFromScreenPoint:", v39 + 0.5, v40 + 0.5);
    }
    else
    {
      long long v239 = 0u;
      long long v240 = 0u;
    }

    if ((_BYTE)v239)
    {
      uint64_t v42 = [(VKCameraController *)self vkCamera];
      float v202 = v22;
      double v43 = [v42 regionRestriction];
      [v43 clampedPosition:*(_OWORD *)&v241];
      double v45 = v44;
      double v47 = v46;

      *(double *)v48.i64 = *((double *)&v239 + 1) - v45;
      v49.i64[0] = 1.0;
      v50.f64[0] = NAN;
      v50.f64[1] = NAN;
      *(void *)&double v51 = vbslq_s8((int8x16_t)vnegq_f64(v50), v49, v48).u64[0];
      if (*((double *)&v239 + 1) - v45 != 0.0) {
        *(double *)v48.i64 = v51;
      }
      double v52 = v45 + *(double *)v48.i64;
      if (*((double *)&v240 + 1) * *((double *)&v240 + 1)
         + (v47 - *(double *)&v240) * (v47 - *(double *)&v240)
         + (v52 - *((double *)&v239 + 1)) * (v52 - *((double *)&v239 + 1)) >= (v47 - *(double *)&v240)
                                                                            * (v47 - *(double *)&v240)
                                                                            + (v45 - *((double *)&v239 + 1))
                                                                            * (v45 - *((double *)&v239 + 1))
                                                                            + *((double *)&v240 + 1)
                                                                            * *((double *)&v240 + 1))
        double v53 = v45;
      else {
        double v53 = v52;
      }
      double v206 = v53;
      currentAnimation = self->super._currentAnimation;
      __int16 v55 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
      if (!currentAnimation && (v55 & 2) == 0)
      {
        double v188 = a4;
        double v56 = 0.0;
        goto LABEL_17;
      }
      if ((v55 & 0x12) == 0)
      {
        double v188 = a4;
        [(VKTimedAnimation *)currentAnimation duration];
        double v58 = v57;
        float v59 = *(float *)&self->super._elevationLogic;
        [(VKAnimation *)self->super._currentAnimation stop];
        double v56 = v58 * (float)(1.0 - v59);
        v60 = self->super._currentAnimation;
        self->super._currentAnimation = 0;

        __int16 v55 = *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1);
LABEL_17:
        double v185 = v56;
        double v192 = v25;
        annotationPresentation = self->super._annotationPresentation;
        if (v6) {
          __int16 v61 = 16;
        }
        else {
          __int16 v61 = 0;
        }
        *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v55 & 0xFFEF | v61;
        BOOL v62 = [(VKAnnotationTrackingCameraController *)self shouldForceZoomToFit];
        v63 = [(VKCameraController *)self vkCamera];
        double v196 = v41;
        double v197 = v40;
        v64 = (double *)[v63 position];
        double v205 = v47;
        double v65 = v47 - *(double *)&v240;
        double v66 = *v64;
        double v67 = v64[1];
        double v68 = v64[2];

        double v190 = v67;
        double v191 = v66;
        double v195 = v68;
        *(double *)&long long v237 = v206 - *((double *)&v239 + 1) + v66;
        *((double *)&v237 + 1) = v65 + v67;
        double v238 = v68 - *((double *)&v240 + 1);
        v69 = [(VKCameraController *)self vkCamera];
        [v69 screenPointFromGroundPoint:&v241];
        CGFloat v71 = (v70 * 0.5 + 0.5) * v13;
        CGFloat v73 = (0.5 - v72 * 0.5) * v15;

        v244.origin.x = v13 * -16.0;
        v244.origin.y = v15 * -16.0;
        v244.size.width = v13 * 33.0;
        v244.size.height = v15 * 33.0;
        v243.x = v71;
        v243.y = v73;
        [(VKMapAnnotationTrackingCameraController *)self _minTrackingCameraDistance:CGRectContainsPoint(v244, v243)];
        double v75 = v74;
        double v186 = 0.0;
        if ((*(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) & 0x80) != 0)
        {
          v76 = [(VKCameraController *)self canvas];
          [v76 size];
          if (v77 <= 0.0)
          {
          }
          else
          {
            v78 = [(VKCameraController *)self canvas];
            [v78 size];
            double v80 = v79;

            if (v80 > 0.0)
            {
              [(VKTrackableAnnotation *)self->super._annotation accuracy];
              int v189 = 0;
              double v186 = 0.0;
              if (v8 && !v6)
              {
                if (self->super._annotationPresentation)
                {
                  [(VKTrackableAnnotation *)self->super._annotation accuracy];
                  double v186 = v81;
                  int v189 = 1;
                }
                else
                {
                  int v189 = 0;
                }
              }
              GEOMapRectMakeWithRadialDistance();
              double v160 = v159;
              double v162 = v161;
              v163 = [(VKCameraController *)self vkCamera];
              [v163 tanHalfHorizFOV];
              double v165 = v164;

              v166 = [(VKCameraController *)self vkCamera];
              [v166 tanHalfVerticalFOV];
              double v194 = v167;

              double v168 = *MEMORY[0x1E4F63F10];
              double v169 = *(double *)(MEMORY[0x1E4F63F10] + 8);
              v170 = [(VKCameraController *)self canvas];
              [v170 size];
              double v172 = v171;

              v173 = [(VKCameraController *)self canvas];
              [v173 size];
              double v174 = v160 / v168;
              double v175 = v162 / v169;
              double v176 = v160 / v168 * 0.5;
              double v177 = v162 / v169 * 0.5;
              double v178 = v174 - v174 * (float)(v198 + v208) / v172;
              double v180 = v175 - v175 * (float)(v200 + v202) / v179;

              double v181 = v165 * 0.5 * v178 / v176;
              double v182 = v194 * 0.5 * v180 / v177;
              double v183 = v176 / v181;
              if (v181 <= 0.0) {
                double v183 = 0.0;
              }
              if (v182 <= 0.0) {
                double v184 = 0.0;
              }
              else {
                double v184 = v177 / v182;
              }
              double v75 = fmax(fmax(v183, v184), v75);
LABEL_29:
              -[VKMapAnnotationTrackingCameraController _zoomLevelForCameraPosition:](self, "_zoomLevelForCameraPosition:", v237, v238);
              double v83 = v82;
              double v84 = v75
                  / sqrt((*(double *)&v237 - v206) * (*(double *)&v237 - v206)+ (*((double *)&v237 + 1) - v205) * (*((double *)&v237 + 1) - v205)+ v238 * v238);
              double v85 = v84 * v238;
              double v86 = v206 + v84 * (*(double *)&v237 - v206);
              double v87 = v205 + v84 * (*((double *)&v237 + 1) - v205);
              -[VKMapAnnotationTrackingCameraController _zoomLevelForCameraPosition:](self, "_zoomLevelForCameraPosition:", v86, v87, v84 * v238);
              if (self->super._behavior.shouldPreserveUserSpecifiedZoomLevel && self->super._hasUserSpecifiedZoomLevel)
              {
                BOOL v89 = v83 - v88 > 0.0 && v6;
                char v90 = v62 || v89;
                if (v88 >= v83) {
                  char v90 = v62;
                }
                BOOL v91 = fabs(v83 - v88) > 4.5 && v6;
                if (!v91 && (v90 & 1) == 0) {
                  goto LABEL_41;
                }
              }
              else if (!v62)
              {
LABEL_41:
                int v92 = 0;
LABEL_44:
                v93 = [(VKCameraController *)self vkCamera];
                v94 = (double *)[v93 scaledViewProjectionMatrix];
                double v209 = *v94;
                double v95 = v94[4];
                double v201 = v94[5];
                double v203 = v94[1];
                double v96 = v94[12];
                double v97 = v94[13];
                double v199 = v94[3];
                double v193 = v94[7];
                double v98 = v94[15];

                v99 = [(VKCameraController *)self canvas];
                [v99 size];
                double v101 = v100;

                v102 = [(VKCameraController *)self canvas];
                [v102 size];
                double v104 = v103;

                v105 = [(VKCameraController *)self canvas];
                [v105 size];
                double v107 = v106;
                v108 = [(VKCameraController *)self canvas];
                [v108 size];
                double v110 = v109;
                double v111 = 0.5 / (v98 + v199 * v206 + v193 * v205);
                double v112 = v101 * (v111 * (v96 + v209 * v206 + v95 * v205) + 0.5);
                double v113 = v104 * -(v111 * (v97 + v203 * v206 + v201 * v205) + -0.5);

                double v114 = sqrt((v107 * v196 - v112) * (v107 * v196 - v112)+ -(v113 - v110 * (0.5 - v197)) * -(v113 - v110 * (0.5 - v197)));
                double v115 = vabdd_f64(v238, v195);
                BOOL v116 = v115 > 0.000000001;
                if (v114 < 0.000001 && v115 <= 0.000000001)
                {
                  *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x10u;
                  goto LABEL_94;
                }
                if (v92)
                {
                  double v117 = v192;
                  if (v115 > 0.000000001 || v114 >= 1.5)
                  {
LABEL_53:
                    if (v6)
                    {
                      int v118 = v8 ^ 1;
                      if (v114 <= 10000.0) {
                        int v118 = 1;
                      }
                      v8 &= v118;
                    }
                    if (v115 > 0.000000001) {
                      [(VKAnnotationTrackingCameraController *)self setHasUserSpecifiedZoomLevel:0];
                    }
                    v235[0] = MEMORY[0x1E4F143A8];
                    v235[1] = 3221225472;
                    v235[2] = __101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke;
                    v235[3] = &unk_1E5A98FB0;
                    v235[4] = self;
                    *(double *)&v235[5] = v117;
                    v235[6] = v211;
                    char v236 = v8;
                    v210 = (void (**)(void, void))MEMORY[0x1A6239EB0](v235);
                    if (v8)
                    {
                      if (v188 == -1.0)
                      {
                        -[VKMapAnnotationTrackingCameraController _zoomLevelForCameraPosition:](self, "_zoomLevelForCameraPosition:", v191, v190, v195);
                        BOOL v119 = annotationPresentation != 0;
                        int v120 = v189;
                        double v122 = v121;
                        -[VKMapAnnotationTrackingCameraController _zoomLevelForCameraPosition:](self, "_zoomLevelForCameraPosition:", v237, v238);
                        double v124 = fmax(fmin(fmax(vabdd_f64(v122, v123) * 0.166666672, v114 * 0.00156250002), 1.0), 0.200000003);
                      }
                      else
                      {
                        double v124 = v185;
                        BOOL v119 = annotationPresentation != 0;
                        int v120 = v189;
                        if (v185 <= 0.200000003) {
                          double v124 = fmax(v188, 0.200000003);
                        }
                      }
                      [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation presentationCoordinate];
                      double v129 = v128;
                      [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation presentationCoordinate];
                      float64_t v207 = v130;
                      long double v131 = tan(v129 * 0.00872664626 + 0.785398163);
                      long double v132 = log(v131);
                      v133.f64[0] = v207;
                      v133.f64[1] = v132;
                      *(float64x2_t *)self->super._currentAnimationStartPoint._e = vmlaq_f64(v204, (float64x2_t)xmmword_1A28FCBE0, v133);
                      self->super._currentAnimationStartPoint._e[2] = 0.0;
                      *(float64x2_t *)self->super._currentAnimationEndPoint._e = v241;
                      self->super._currentAnimationEndPoint._e[2] = v242;
                      self->super._currentAnimationStartCameraPosition._e[0] = v191;
                      self->super._currentAnimationStartCameraPosition._e[1] = v190;
                      self->super._currentAnimationStartCameraPosition._e[2] = v195;
                      *(_OWORD *)self->super._currentAnimationEndCameraPosition._e = v237;
                      self->super._currentAnimationEndCameraPosition._e[2] = v238;
                      if (*(void *)&self->super._currentAnimationStartCameraPosition._e[0] == *(void *)&self->super._currentAnimationEndCameraPosition._e[0]
                        && *(void *)&self->super._currentAnimationStartCameraPosition._e[1] == *(void *)&self->super._currentAnimationEndCameraPosition._e[1]
                        && *(void *)&self->super._currentAnimationStartCameraPosition._e[2] == *(void *)&self->super._currentAnimationEndCameraPosition._e[2])
                      {
                        goto LABEL_93;
                      }
                      [(VKCameraController *)self beginRegionChange:1];
                      v136 = self->super._annotationPresentation;
                      v137 = v136;
                      v138 = 0;
                      long double v139 = 0.0;
                      if (v120)
                      {
                        [(VKTrackableAnnotationPresentation *)v136 setAnimatingAccuracy:1];
                        [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation presentationAccuracy];
                        v138 = v140;
                        v141 = [(VKCameraController *)self vkCamera];
                        v142 = v141;
                        if (v141)
                        {
                          [v141 cameraState];
                        }
                        else
                        {
                          long long v233 = 0u;
                          long long v234 = 0u;
                          memset(v232, 0, sizeof(v232));
                          *(_OWORD *)id location = 0u;
                        }

                        v143 = [(VKCameraController *)self vkCamera];
                        [v143 setPosition:&v237];

                        [(VKTrackableAnnotationPresentation *)self->super._annotationPresentation minimumAccuracy];
                        if (v186 >= v144)
                        {
                          v145 = [(VKCameraController *)self vkCamera];
                          v146 = [(VKCameraController *)self canvas];
                          [v146 size];
                          long double v139 = _screenPointsForDistance(v145, v147, v148, v186);
                        }
                        v149 = [(VKCameraController *)self vkCamera];
                        long long v225 = *(_OWORD *)location;
                        long long v227 = *(_OWORD *)((char *)v232 + 8);
                        uint64_t v226 = *(void *)&v232[0];
                        uint64_t v228 = *((void *)&v232[1] + 1);
                        long long v229 = v233;
                        long long v230 = v234;
                        [v149 setCameraState:&v225];
                      }
                      BYTE4(self->super._elevationLogic) = v116;
                      v150 = self->super._currentAnimation;
                      if (v150)
                      {
                        [(VKAnimation *)v150 stop];
                        v151 = self->super._currentAnimation;
                        self->super._currentAnimation = 0;
                      }
                      v152 = [[VKTimedAnimation alloc] initWithDuration:v124];
                      v153 = self->super._currentAnimation;
                      self->super._currentAnimation = v152;

                      v154 = (uint64_t *)&VKAnimationCurveEaseInOut;
                      if (!v6) {
                        v154 = &VKAnimationCurveLinear;
                      }
                      uint64_t v155 = *v154;
                      if (v10) {
                        id v156 = v10;
                      }
                      else {
                        id v156 = (id)v155;
                      }
                      [(VKTimedAnimation *)self->super._currentAnimation setTimingFunction:v156];
                      objc_initWeak(location, self->super._currentAnimation);
                      objc_initWeak(&from, self);
                      LODWORD(self->super._elevationLogic) = 0;
                      v219[0] = MEMORY[0x1E4F143A8];
                      v219[1] = 3221225472;
                      v219[2] = __101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2;
                      v219[3] = &unk_1E5A98FD8;
                      objc_copyWeak(v221, &from);
                      BOOL v222 = v119;
                      char v223 = v120;
                      v221[1] = v138;
                      v221[2] = *(id *)&v139;
                      v157 = v137;
                      v220 = v157;
                      [(VKTimedAnimation *)self->super._currentAnimation setStepHandler:v219];
                      v212[0] = MEMORY[0x1E4F143A8];
                      v212[1] = 3221225472;
                      v212[2] = __101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_3;
                      v212[3] = &unk_1E5A99000;
                      objc_copyWeak(&v215, &from);
                      BOOL v217 = v119;
                      v216[1] = *(id *)&v117;
                      v216[2] = v211;
                      objc_copyWeak(v216, location);
                      v212[4] = self;
                      v158 = v157;
                      v213 = v158;
                      BOOL v218 = v6;
                      v214 = v210;
                      [(VKAnimation *)self->super._currentAnimation setCompletionHandler:v212];
                      md::AnimationRunner::runAnimation((md::MapEngine **)[(VKCameraController *)self animationRunner], &self->super._currentAnimation->super);

                      objc_destroyWeak(v216);
                      objc_destroyWeak(&v215);

                      objc_destroyWeak(v221);
                      objc_destroyWeak(&from);
                      objc_destroyWeak(location);
                    }
                    else
                    {
                      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) |= 0x20u;
                      [(VKCameraController *)self beginRegionChange:0];
                      v125 = [(VKCameraController *)self vkCamera];
                      [v125 setPosition:&v237];

                      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x10u;
                      if (annotationPresentation)
                      {
                        [(VKTrackableAnnotation *)self->super._annotation coordinate];
                        -[VKTrackableAnnotationPresentation setPresentationCoordinate:](self->super._annotationPresentation, "setPresentationCoordinate:");
                      }
                      v126 = [(VKCameraController *)self cameraDelegate];
                      [v126 mapLayerDidChangeVisibleRegion];

                      uint64_t v127 = *(void *)[(VKCameraController *)self runLoopController];
                      if (v127)
                      {
                        LOBYTE(location[0]) = 4;
                        md::MapEngine::setNeedsTick(v127, location);
                      }
                      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) &= ~0x20u;
                      [(VKCameraController *)self endRegionChange];
                      if (!self->super._annotationPresentation) {
                        v210[2](v210, 0);
                      }
                    }
                    [(VKMapAnnotationTrackingCameraController *)self updateFramerate];
LABEL_93:

                    goto LABEL_94;
                  }
                }
                else
                {
                  double v117 = v192;
                  if (v114 >= 1.5) {
                    goto LABEL_53;
                  }
                }
                int v8 = 0;
                goto LABEL_53;
              }
              *(double *)&long long v237 = v86;
              *((double *)&v237 + 1) = v87;
              int v92 = 1;
              double v238 = v85;
              goto LABEL_44;
            }
          }
        }
        int v189 = 0;
        goto LABEL_29;
      }
      *(_WORD *)(&self->super._hasUserSpecifiedZoomLevel + 1) = v55 | 1;
      self->super._pendingChangeDuration = a4;
    }
  }
LABEL_94:
}

void *__101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke(uint64_t a1, char a2)
{
  result = *(void **)(a1 + 32);
  if (!result[18])
  {
    float v5 = [result cameraDelegate];
    uint64_t v6 = [v5 mapLayerPresentationForAnnotation:*(void *)(*(void *)(a1 + 32) + 136)];
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 144);
    *(void *)(v7 + 144) = v6;

    [*(id *)(*(void *)(a1 + 32) + 144) setTracking:1];
    result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "setPresentationCoordinate:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    if ((a2 & 1) == 0)
    {
      result = *(void **)(a1 + 32);
      if (result[18])
      {
        uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
        return (void *)[result _goToAnnotationAnimated:v9 duration:0 timingFunction:0 isInitial:-1.0];
      }
    }
  }
  return result;
}

void __101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_2(uint64_t a1, float a2)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    *((float *)WeakRetained + 84) = a2;
    double v6 = *((double *)WeakRetained + 25) + (*((double *)WeakRetained + 31) - *((double *)WeakRetained + 25)) * a2;
    double v12 = a2;
    float64x2_t v13 = vmlaq_n_f64(*(float64x2_t *)(WeakRetained + 184), vsubq_f64(*(float64x2_t *)(WeakRetained + 232), *(float64x2_t *)(WeakRetained + 184)), a2);
    double v14 = v6;
    uint64_t v7 = [WeakRetained vkCamera];
    [v7 setPosition:&v13];

    if (*(unsigned char *)(a1 + 64))
    {
      long double v8 = exp((*((double *)v5 + 21) + (*((double *)v5 + 27) - *((double *)v5 + 21)) * v12) * 6.28318531 + -3.14159265);
      long double v9 = atan(v8) * 114.591559 + -90.0;
      long double v10 = fmod((*((double *)v5 + 20) + (*((double *)v5 + 26) - *((double *)v5 + 20)) * v12) * 6.28318531, 6.28318531);
      objc_msgSend(*((id *)v5 + 18), "setPresentationCoordinate:", (double)v9, (double)(fmod(v10 + 6.28318531, 6.28318531) * 57.2957795 + -180.0));
    }
    if (*(unsigned char *)(a1 + 65)) {
      [*(id *)(a1 + 32) setPresentationAccuracy:*(double *)(a1 + 48) + (*(double *)(a1 + 56) - *(double *)(a1 + 48)) * v12];
    }
    double v11 = [v5 cameraDelegate];
    [v11 mapLayerDidChangeVisibleRegion];
  }
}

void __101__VKMapAnnotationTrackingCameraController__goToAnnotationAnimated_duration_timingFunction_isInitial___block_invoke_3(uint64_t a1, char a2)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    double v12 = WeakRetained;
    if (a2)
    {
      id v5 = [WeakRetained vkCamera];
      [v5 setPosition:v12 + 232];

      if (*(unsigned char *)(a1 + 88)) {
        objc_msgSend(*((id *)v12 + 18), "setPresentationCoordinate:", *(double *)(a1 + 72), *(double *)(a1 + 80));
      }
      id v6 = objc_loadWeakRetained((id *)(a1 + 64));
      id v7 = (id)*((void *)v12 + 19);
      if (!v6 || (v8 = v7 == v6, id v7 = v6, v8))
      {
        *((void *)v12 + 19) = 0;
      }
      int v9 = *(_WORD *)(*(void *)(a1 + 32) + 321) & 1;
    }
    else
    {
      int v9 = 0;
    }
    *(_WORD *)(v12 + 321) &= 0xFFEEu;
    v12[340] = 0;
    [*(id *)(a1 + 40) setAnimatingAccuracy:0];
    [v12 endRegionChange];
    if (*(unsigned char *)(a1 + 89))
    {
      long double v10 = [v12 cameraDelegate];
      [v10 mapLayerDidFinishInitialTrackingAnimation];
    }
    double v11 = (double *)v12;
    if (!*((void *)v12 + 18))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      double v11 = (double *)v12;
    }
    if (v9) {
      [v12 _goToAnnotationAnimated:1 duration:0 timingFunction:0 isInitial:v11[32]];
    }
    [v12 updateFramerate];
    WeakRetained = v12;
  }
}

- (void)updateFramerate
{
  if (BYTE4(self->super._elevationLogic))
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
    v6.super_class = (Class)VKMapAnnotationTrackingCameraController;
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

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  float right = a3.right;
  float bottom = a3.bottom;
  float left = a3.left;
  float top = a3.top;
  [(VKMapAnnotationTrackingCameraController *)self _effectiveEdgeInsets];
  float v9 = v8;
  float v11 = v10;
  float v13 = v12;
  float v15 = v14;
  v50.receiver = self;
  v50.super_class = (Class)VKMapAnnotationTrackingCameraController;
  *(float *)&double v16 = top;
  *(float *)&double v17 = left;
  *(float *)&double v18 = bottom;
  *(float *)&double v19 = right;
  -[VKCameraController setEdgeInsets:](&v50, sel_setEdgeInsets_, v16, v17, v18, v19);
  if (self->super._currentAnimation)
  {
    [(VKMapAnnotationTrackingCameraController *)self _effectiveEdgeInsets];
    float v21 = v20;
    float v23 = v22;
    float v47 = v24;
    float v48 = v25;
    long double v26 = [(VKCameraController *)self canvas];
    [v26 size];
    double v28 = v27;
    double v30 = v29;

    double v31 = v30 + v30;
    double v32 = v28 + v28;
    float64x2_t v33 = [(VKCameraController *)self vkCamera];
    int8x16_t v34 = v33;
    if (v33)
    {
      float v35 = v13 / v31;
      float v36 = v9 / v31;
      double v37 = (float)(v35 - v36) + 0.5;
      float v38 = v11 / v32;
      float v39 = v15 / v32;
      objc_msgSend(v33, "groundPointFromScreenPoint:", (float)(v38 - v39) + 0.5, v37);
    }
    else
    {
      memset(&v49[2], 0, 32);
    }

    double v40 = [(VKCameraController *)self vkCamera];
    double v41 = v40;
    if (v40)
    {
      float v42 = v21 / v31;
      float v43 = v23 / v32;
      float v44 = v47 / v31;
      float v45 = v48 / v32;
      objc_msgSend(v40, "groundPointFromScreenPoint:", (float)(v43 - v45) + 0.5, (float)(v44 - v42) + 0.5);
    }
    else
    {
      memset(v49, 0, 32);
    }

    float64_t v46 = v49[3].f64[1] - v49[1].f64[1] + self->super._currentAnimationEndCameraPosition._e[2];
    *(float64x2_t *)self->super._currentAnimationEndCameraPosition._e = vaddq_f64(vsubq_f64(*(float64x2_t *)((char *)&v49[2] + 8), *(float64x2_t *)((char *)v49 + 8)), *(float64x2_t *)self->super._currentAnimationEndCameraPosition._e);
    self->super._currentAnimationEndCameraPosition._e[2] = v46;
  }
  else
  {
    [(VKMapAnnotationTrackingCameraController *)self _goToAnnotationAnimated:0 duration:0 timingFunction:0 isInitial:0.0];
  }
}

- (double)_minTrackingCameraDistance:(BOOL)a3
{
  BOOL v4 = a3;
  float v6 = [(VKCameraController *)self vkCamera];
  float v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "groundPointFromScreenPoint:", 0.5, 0.5);
  }
  else
  {
    long long v95 = 0u;
    float64x2_t v96 = 0u;
  }

  float v8 = [(VKCameraController *)self canvas];
  [v8 size];
  *(float *)&double v9 = 512.0 / v9;
  float v10 = log2f(*(float *)&v9);

  double idealCenterCoordinateDistance = self->super._behavior.idealCenterCoordinateDistance;
  if (idealCenterCoordinateDistance >= 0.0)
  {
    [(VKTrackableAnnotation *)self->super._annotation coordinate];
    double v32 = v31;
    long double v33 = cos(v31 + v31) * -559.82 + 111132.92;
    long double v34 = v33 + cos(v32 * 4.0) * 1.175;
    long double v35 = v34 + cos(v32 * 6.0) * -0.0023;
    double v36 = v32 * 0.5;
    long double v37 = tan(v32 * 0.5 + 0.78103484);
    double v38 = log(v37);
    long double v39 = tan(v36 + 0.789761487);
    double v40 = fabs((log(v39) - v38) * 0.159154943) * idealCenterCoordinateDistance / v35;
  }
  else
  {
    float v12 = [(VKCameraController *)self vkCamera];
    [v12 depthForViewWidth:(double)exp2((float)(-14.0 - v10))];
    double v14 = v13;

    float v15 = [(VKCameraController *)self canvas];
    [v15 size];
    float64_t v86 = v17;
    float64_t v88 = v16;

    [(VKMapAnnotationTrackingCameraController *)self _effectiveEdgeInsets];
    unsigned int v85 = v18;
    unsigned int v82 = v19;
    unsigned int v81 = v20;
    unsigned int v83 = v21;
    float v22 = [(VKCameraController *)self vkCamera];
    float v23 = v22;
    if (v22)
    {
      v24.f64[0] = v88;
      v24.f64[1] = v86;
      float64x2_t v25 = vaddq_f64(v24, v24);
      __asm { FMOV            V2.2D, #0.5 }
      objc_msgSend(v22, "groundPointFromScreenPoint:", vsubq_f64(vaddq_f64(vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v81, v82)), v25))), _Q2), vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v85, v83)), v25)))));
    }
    else
    {
      long long v93 = 0u;
      long long v94 = 0u;
    }

    double v41 = [(VKCameraController *)self vkCamera];
    float v42 = (double *)[v41 position];
    double v44 = *v42;
    double v43 = v42[1];
    double v45 = v42[2];

    float64_t v46 = [(VKCameraController *)self vkCamera];
    float v89 = v10;
    [v46 forwardVector];
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;

    double v53 = [(VKCameraController *)self vkCamera];
    uint64_t v54 = [v53 position];
    double v55 = v14
        / ((v44 - *((double *)&v93 + 1)) * v48 + (v43 - *(double *)&v94) * v50 + (v45 - *((double *)&v94 + 1)) * v52)
        + 1.0;
    double v56 = *(double *)v54 + (*((double *)&v95 + 1) - *(double *)v54) * v55;
    float64x2_t v84 = *(float64x2_t *)(v54 + 8);
    double v87 = v55;

    float64x2_t v57 = vsubq_f64(v96, vmlaq_n_f64(v84, vsubq_f64(v96, v84), v87));
    float64x2_t v58 = vmulq_f64(v57, v57);
    double v40 = sqrt(v58.f64[0] + (*((double *)&v95 + 1) - v56) * (*((double *)&v95 + 1) - v56) + v58.f64[1]);
    float v10 = v89;
  }
  float v59 = [(VKCameraController *)self vkCamera];
  v60 = v59;
  if (!v59) {
    goto LABEL_15;
  }
  [v59 minDistanceToGroundRestriction];
  if (!(_BYTE)v93)
  {

LABEL_15:
    BOOL v62 = [(VKCameraController *)self vkCamera];
    double v63 = VKCameraDistanceForDisplayZoomLevel(v10 + 20.0, v62);
    goto LABEL_16;
  }
  LOBYTE(v93) = 0;

  __int16 v61 = [(VKCameraController *)self vkCamera];
  BOOL v62 = v61;
  if (v61)
  {
    [(VKCamera *)v61 minDistanceToGroundRestriction];
    double v63 = *((double *)&v93 + 1);
  }
  else
  {
    long long v93 = 0uLL;
    double v63 = 0.0;
  }
LABEL_16:

  v64 = [(VKCameraController *)self vkCamera];
  double v65 = v64;
  if (!v64)
  {
    int v67 = 0;
LABEL_22:
    double v68 = 1.0;
    goto LABEL_23;
  }
  [v64 maxDistanceToGroundRestriction];
  if (!(_BYTE)v93)
  {
    int v67 = 0;
    goto LABEL_22;
  }
  double v66 = [(VKCameraController *)self vkCamera];
  float v3 = v66;
  if (v66)
  {
    [v66 maxDistanceToGroundRestriction];
    int v67 = 1;
    double v68 = v92;
  }
  else
  {
    double v68 = 0.0;
    int v67 = 1;
  }
LABEL_23:
  double v69 = v63;
  if (v68 > v63)
  {
    double v70 = [(VKCameraController *)self vkCamera];
    CGFloat v71 = v70;
    if (v70 && ([v70 maxDistanceToGroundRestriction], v91))
    {
      double v72 = [(VKCameraController *)self vkCamera];
      CGFloat v73 = v72;
      if (v72)
      {
        [v72 maxDistanceToGroundRestriction];
        double v69 = v90;
      }
      else
      {
        double v69 = 0.0;
      }
    }
    else
    {
      double v69 = 1.0;
    }
  }
  if (v67) {

  }
  double v74 = fmin(fmax(v40, v63), v69);
  if (self->super._behavior.shouldPreserveUserSpecifiedZoomLevel && self->super._hasUserSpecifiedZoomLevel && v4)
  {
    double v75 = [(VKCameraController *)self vkCamera];
    uint64_t v76 = [v75 position];
    float64x2_t v77 = vsubq_f64(v96, *(float64x2_t *)(v76 + 8));
    float64x2_t v78 = vmulq_f64(v77, v77);
    double v79 = sqrt(v78.f64[0]+ (*((double *)&v95 + 1) - *(double *)v76) * (*((double *)&v95 + 1) - *(double *)v76)+ v78.f64[1]);

    return fmin(v79, v74);
  }
  return v74;
}

- (double)_zoomLevelForCameraPosition:()Matrix<double
{
  double v3 = a3._e[2];
  float v5 = [(VKCameraController *)self vkCamera];
  [v5 minHeight];
  double v7 = v6;
  float v8 = [(VKCameraController *)self vkCamera];
  [v8 maxHeight];
  double v10 = v9;
  float v11 = [(VKCameraController *)self vkCamera];
  double v12 = *(double *)([v11 position] + 16);

  double v13 = [(VKCameraController *)self vkCamera];
  double v14 = [v13 footprint];
  [v14 maxDepth];
  double v16 = v15 * fmin(fmax(v3, v7), v10) / v12;

  double v17 = [(VKCameraController *)self vkCamera];
  [v17 widthOfViewAtDepth:v16];
  long double v19 = v18;

  unsigned int v20 = [(VKCameraController *)self canvas];
  [v20 size];
  *(float *)&double v21 = 512.0 / v21;
  LODWORD(v7) = log2f(*(float *)&v21);

  return *(float *)&v7 - log2(v19);
}

@end