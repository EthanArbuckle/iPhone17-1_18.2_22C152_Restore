@interface TSDCanvasZoomTracker
- (BOOL)alwaysUsesTranslationSprings;
- (BOOL)animateTransform;
- (BOOL)snapsViewScale;
- (TSDCanvasZoomTracker)initWithCanvasLayer:(id)a3;
- (TSDCanvasZoomTrackerDelegate)delegate;
- (void)p_finishZoomWithFinalScaleFactor:(double)a3 contentOffset:(CGPoint)a4;
- (void)setAlwaysUsesTranslationSprings:(BOOL)a3;
- (void)setAnimateTransform:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSnapsViewScale:(BOOL)a3;
- (void)zoomWithScale:(double)a3 velocity:(double)a4 locationInView:(CGPoint)a5 phase:(int)a6;
@end

@implementation TSDCanvasZoomTracker

- (TSDCanvasZoomTracker)initWithCanvasLayer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasZoomTracker;
  result = [(TSDCanvasZoomTracker *)&v5 init];
  if (result)
  {
    result->mCanvasLayer = (TSDCanvasLayer *)a3;
    *(_WORD *)&result->mSnapsViewScale = 257;
  }
  return result;
}

- (void)zoomWithScale:(double)a3 velocity:(double)a4 locationInView:(CGPoint)a5 phase:(int)a6
{
  double dx = a5.y;
  double x = a5.x;
  p_mDelegate = &self->mDelegate;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:objc_loadWeak((id *)&self->mDelegate) selector:sel_canvasZoomTrackerDidEndViewScaleFeedback_ object:self];
  v11 = [(TSDCanvasLayer *)self->mCanvasLayer controller];
  v12 = [(TSDCanvasView *)[(TSDCanvasLayer *)self->mCanvasLayer canvasView] enclosingScrollView];
  v13 = (CGPoint *)MEMORY[0x263F00148];
  switch(a6)
  {
    case 0:
LABEL_8:
      mCanvasLayer = self->mCanvasLayer;
      if (mCanvasLayer) {
        [(TSDCanvasLayer *)mCanvasLayer affineTransform];
      }
      else {
        memset(&v252, 0, sizeof(v252));
      }
      long long v17 = *(_OWORD *)&v252.c;
      *(_OWORD *)&self->mSavedTransform.a = *(_OWORD *)&v252.a;
      *(_OWORD *)&self->mSavedTransform.c = v17;
      *(_OWORD *)&self->mSavedTransform.CGFloat tx = *(_OWORD *)&v252.tx;
      [(TSKScrollView *)v12 contentOffset];
      self->mSavedContentOffset.double x = v18;
      self->mSavedContentOffset.double y = v19;
      self->mHasGestureOrigin = 0;
      self->mGestureOffset = *v13;
      [(TSDInteractiveCanvasController *)v11 i_viewWillBeginZooming];
      self->mIsZooming = 1;
      self->unint64_t mZoomVelocitySampleCount = 0;
      self->mZoomVelocitdouble y = 0.0;
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      self->mZoomStartTime = v20;
      break;
    case 1:
      if (self->mIsZooming) {
        break;
      }
      goto LABEL_8;
    case 3:
      if (self->mIsShowingZoomHUD) {
        [objc_loadWeak((id *)p_mDelegate) canvasZoomTrackerDidEndViewScaleFeedback:self];
      }
      v14 = self->mCanvasLayer;
      long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      v253[0] = *MEMORY[0x263F000D0];
      v253[1] = v15;
      v253[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      [(TSDCanvasLayer *)v14 setAffineTransform:v253];
      [(TSDInteractiveCanvasController *)v11 viewDidEndZooming];
      [objc_loadWeak((id *)p_mDelegate) canvasZoomTrackerDidFinish:self];
      return;
  }
  unint64_t mZoomVelocitySampleCount = self->mZoomVelocitySampleCount;
  double v22 = a4 + (double)mZoomVelocitySampleCount++ * self->mZoomVelocity;
  self->mZoomVelocitdouble y = v22 / (double)mZoomVelocitySampleCount;
  self->unint64_t mZoomVelocitySampleCount = mZoomVelocitySampleCount;
  [(TSDCanvasLayer *)self->mCanvasLayer viewScale];
  double v24 = v23;
  [(TSDCanvasLayer *)self->mCanvasLayer minimumPinchViewScale];
  double v26 = v25;
  [(TSDCanvasLayer *)self->mCanvasLayer maximumPinchViewScale];
  double v28 = v27;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v30 = v29 - self->mZoomStartTime;
  double v31 = 0.2;
  if (a6 == 2 && v30 < 0.2 && fabs(self->mZoomVelocity) > 0.5)
  {
    [(TSDCanvasLayer *)self->mCanvasLayer viewScale];
    -[TSDInteractiveCanvasController i_nextCanvasViewScaleDetentForProposedViewScale:greater:](v11, "i_nextCanvasViewScaleDetentForProposedViewScale:greater:", self->mZoomVelocity > 0.0);
    double v33 = v32;
    if (self->mIsShowingZoomHUD)
    {
      int v34 = 1;
    }
    else
    {
      int v34 = 1;
      if ([(TSDCanvasLayer *)self->mCanvasLayer showsScaleFeedback])
      {
        [objc_loadWeak((id *)p_mDelegate) canvasZoomTracker:self willBeginViewScaleFeedbackWithFastPinch:1];
        self->mIsShowingZoomHUD = 1;
      }
    }
  }
  else
  {
    if (v30 > 0.2
      && !self->mIsShowingZoomHUD
      && [(TSDCanvasLayer *)self->mCanvasLayer showsScaleFeedback])
    {
      [objc_loadWeak((id *)p_mDelegate) canvasZoomTracker:self willBeginViewScaleFeedbackWithFastPinch:0];
      self->mIsShowingZoomHUD = 1;
    }
    double v33 = v24 * a3;
    if (a6 == 2)
    {
      -[TSDInteractiveCanvasController i_adjustViewScale:](v11, "i_adjustViewScale:", v24 * a3, v31);
      double v33 = v35;
    }
    int v34 = 0;
  }
  TSUClamp();
  double v37 = v36;
  if ([(TSDCanvasZoomTracker *)self snapsViewScale])
  {
    [(TSDCanvasLayer *)self->mCanvasLayer viewScale];
    [(TSDInteractiveCanvasController *)v11 i_viewScaleForProposedViewScale:v37 originalViewScale:v38];
    double v37 = v39;
  }
  if (a6 == 2)
  {
    [(TSDCanvasLayer *)self->mCanvasLayer viewScale];
    [(TSDInteractiveCanvasController *)v11 i_canvasCenterOffsetForProposedViewScale:v37 originalViewScale:v40];
    double v231 = v41;
    double v43 = v42;
    double v33 = v37;
  }
  else
  {
    double v43 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v231 = *MEMORY[0x263F001B0];
  }
  if (v33 >= v26)
  {
    if (v33 > v28) {
      double v33 = v28 + (1.0 - 3.0 / (v33 - v28 + 3.0)) * 0.8;
    }
  }
  else
  {
    double v33 = v26 + (1.0 - 3.0 / (v26 - v33 + 3.0)) * -0.8;
  }
  [(TSDCanvasLayer *)self->mCanvasLayer unscaledSize];
  double v45 = v44;
  double v47 = v46;
  [(TSDCanvasLayer *)self->mCanvasLayer viewScale];
  TSDMultiplySizeScalar(v45, v47, v48);
  double v49 = TSDRectWithSize();
  ddouble y = v50;
  double v53 = TSDCenterOfRect(v49, v51, v50, v52);
  double v219 = v54;
  double v221 = v53;
  -[TSDCanvasView convertPoint:toView:]([(TSDCanvasLayer *)self->mCanvasLayer canvasView], "convertPoint:toView:", [(TSDCanvasView *)[(TSDCanvasLayer *)self->mCanvasLayer canvasView] superview], x, dx);
  double v56 = v55;
  double v58 = v57;
  if (self->mHasGestureOrigin)
  {
    double y = self->mZoomOrigin.y;
    double dxa = self->mZoomOrigin.x;
  }
  else
  {
    memset(&v252, 0, sizeof(v252));
    v60 = self->mCanvasLayer;
    if (v60) {
      [(TSDCanvasLayer *)v60 affineTransform];
    }
    else {
      memset(&v251, 0, sizeof(v251));
    }
    CGAffineTransformInvert(&v252, &v251);
    CGPoint v61 = (CGPoint)vaddq_f64(*(float64x2_t *)&v252.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v252.c, dx), *(float64x2_t *)&v252.a, x));
    self->mZoomOrigin = v61;
    self->mGestureOrigin.double x = v56;
    self->mGestureOrigin.double y = v58;
    self->mHasGestureOrigin = 1;
    double y = v61.y;
    double dxa = v61.x;
  }
  double v233 = v43;
  if (a6 != 2)
  {
    self->mGestureOffset.double x = TSDSubtractPoints(v56, v58, self->mGestureOrigin.x);
    self->mGestureOffset.double y = v62;
  }
  [(TSDCanvasLayer *)self->mCanvasLayer unscaledSize];
  double v65 = TSDMultiplySizeScalar(v63, v64, v33);
  double v67 = v66;
  [(TSKScrollView *)v12 bounds];
  double v69 = fmax((v65 - v68) * 0.5, 0.0);
  double v71 = fmax((v67 - v70) * 0.5, 0.0);
  double v228 = v33;
  if (a6 == 2)
  {
    TSUClamp();
    self->mGestureOffset.double x = v72;
    TSUClamp();
    self->mGestureOffset.double y = v73;
  }
  else if (![(TSDCanvasLayer *)self->mCanvasLayer isInfinite])
  {
    if ([(TSDCanvasZoomTracker *)self alwaysUsesTranslationSprings])
    {
      double v74 = 0.8;
    }
    else
    {
      [(TSDCanvasLayer *)self->mCanvasLayer viewScale];
      if (v33 >= 1.0 || v75 < 1.0) {
        double v74 = 0.800000012;
      }
      else {
        double v74 = 1.0;
      }
    }
    double v77 = self->mGestureOffset.x;
    double v78 = 0.0;
    double v79 = 0.0;
    if (v77 != 0.0)
    {
      double v80 = fabs(v77);
      double v79 = v80 * fmax((v80 - v69) / v80, 0.0);
    }
    TSUClamp();
    double v82 = v81;
    *(float *)&double v81 = v79;
    float v83 = v74;
    *(double *)v84.i64 = powf(*(float *)&v81, v83);
    v85.f64[0] = NAN;
    v85.f64[1] = NAN;
    int8x16_t v86 = (int8x16_t)vnegq_f64(v85);
    v88.i64[0] = *(void *)&self->mGestureOffset.x;
    double v87 = self->mGestureOffset.y;
    int8x16_t v227 = v86;
    self->mGestureOffset.double x = v82 + *(double *)vbslq_s8(v86, v84, v88).i64;
    if (v87 != 0.0)
    {
      double v89 = fabs(v87);
      double v78 = v89 * fmax((v89 - v71) / v89, 0.0);
    }
    TSUClamp();
    double v91 = v90;
    *(float *)&double v90 = v78;
    float v92 = v74;
    *(double *)v93.i64 = powf(*(float *)&v90, v92);
    v94.i64[0] = *(void *)&self->mGestureOffset.y;
    self->mGestureOffset.double y = v91 + *(double *)vbslq_s8(v227, v93, v94).i64;
    double v33 = v228;
  }
  if (self->mIsShowingZoomHUD) {
    [objc_loadWeak((id *)p_mDelegate) canvasZoomTracker:self willUpdateViewScaleFeedbackWithScale:v37];
  }
  double v226 = v37;
  [(TSDCanvasLayer *)self->mCanvasLayer bounds];
  double v96 = v95;
  double v97 = TSDRectWithSize();
  double v101 = TSDCenterOfRect(v97, v98, v99, v100);
  double v217 = v96;
  double v102 = TSDSubtractPoints(dxa, y, v96);
  double v104 = TSDSubtractPoints(v102, v103, v101);
  CGFloat v106 = v105;
  [(TSDCanvasLayer *)self->mCanvasLayer viewScale];
  CGFloat v108 = v33 / v107;
  [(TSKScrollView *)v12 contentOffset];
  double v225 = v109;
  CGFloat v110 = self->mGestureOffset.x;
  CGFloat v111 = self->mGestureOffset.y;
  long long v112 = *(_OWORD *)&self->mSavedTransform.c;
  *(_OWORD *)&v248.a = *(_OWORD *)&self->mSavedTransform.a;
  *(_OWORD *)&v248.c = v112;
  *(_OWORD *)&v248.CGFloat tx = *(_OWORD *)&self->mSavedTransform.tx;
  CGAffineTransformTranslate(&v252, &v248, v110, v111);
  long long v249 = *(_OWORD *)&v252.a;
  long long v250 = *(_OWORD *)&v252.c;
  CGAffineTransform v248 = v252;
  CGAffineTransformTranslate(&v252, &v248, v104, v106);
  long long v249 = *(_OWORD *)&v252.a;
  long long v250 = *(_OWORD *)&v252.c;
  CGAffineTransform v248 = v252;
  CGAffineTransformScale(&v252, &v248, v108, v108);
  long long v249 = *(_OWORD *)&v252.a;
  long long v250 = *(_OWORD *)&v252.c;
  CGAffineTransform v248 = v252;
  CGAffineTransformTranslate(&v252, &v248, -v104, -v106);
  long long v249 = *(_OWORD *)&v252.a;
  long long v250 = *(_OWORD *)&v252.c;
  CGFloat tx = v252.tx;
  tdouble y = v252.ty;
  double v215 = v13->x;
  double v216 = v13->y;
  memset(&v252, 0, sizeof(v252));
  CGAffineTransformMakeTranslation(&v252, v231 - v215, v233 - v216);
  *(_OWORD *)&t1.a = v249;
  *(_OWORD *)&t1.c = v250;
  t1.CGFloat tx = tx;
  t1.tdouble y = ty;
  CGAffineTransform t2 = v252;
  CGAffineTransformConcat(&v248, &t1, &t2);
  long long v249 = *(_OWORD *)&v248.a;
  long long v250 = *(_OWORD *)&v248.c;
  long long v115 = *(_OWORD *)&v248.tx;
  if (a6 != 2)
  {
    v243[0] = v249;
    v243[1] = v250;
    v161 = self->mCanvasLayer;
    CGFloat v244 = v248.tx;
    CGFloat v245 = v248.ty;
    [(TSDCanvasLayer *)v161 setAffineTransform:v243];
    -[TSDInteractiveCanvasController i_viewIsZoomingAtPoint:](v11, "i_viewIsZoomingAtPoint:", dxa, y);
    [(TSDInteractiveCanvasController *)v11 i_viewDidZoomToViewScale:v37];
    return;
  }
  double v204 = TSDSubtractPoints(v221, v219, v217);
  double v205 = v116;
  double v117 = TSDSubtractPoints(v204, v116, v101);
  v254.origin.double x = TSDRectWithCenterAndSize(v117, v118, dy);
  *(_OWORD *)&v248.a = v249;
  *(_OWORD *)&v248.c = v250;
  *(_OWORD *)&v248.CGFloat tx = v115;
  CGFloat v213 = v254.origin.y;
  CGFloat v214 = v254.origin.x;
  CGFloat height = v254.size.height;
  CGFloat width = v254.size.width;
  CGRect v255 = CGRectApplyAffineTransform(v254, &v248);
  CGFloat v119 = v255.size.width;
  CGFloat v120 = v255.size.height;
  double v218 = v101;
  double v121 = TSDAddPoints(v255.origin.x, v255.origin.y, v101);
  v256.origin.double x = TSDSubtractPoints(v121, v122, v225);
  v256.size.CGFloat width = v119;
  v256.size.CGFloat height = v120;
  CGRect v257 = CGRectOffset(v256, -v231, -v233);
  double v123 = v257.origin.x;
  CGFloat v124 = v257.origin.y;
  double v125 = v257.size.width;
  double v126 = v257.size.height;
  [(TSDCanvasLayer *)self->mCanvasLayer contentInset];
  double v222 = v127;
  double v223 = v125 - (v127 + v128);
  double v209 = v129;
  double v220 = v129 + v130;
  [(TSKScrollView *)v12 bounds];
  double v131 = TSDRectWithSize() + v231 * 2.0;
  CGFloat v133 = v132 + v233 * 2.0;
  double v135 = v134 - v231 * 2.0;
  CGFloat v137 = v136 - v233 * 2.0;
  v258.origin.double x = v123;
  v258.origin.double y = v124;
  v258.size.CGFloat width = v125;
  v258.size.CGFloat height = v126;
  double MaxX = CGRectGetMaxX(v258);
  v259.origin.double x = v123;
  CGFloat v210 = v124;
  v259.origin.double y = v124;
  v259.size.CGFloat width = v125;
  v259.size.CGFloat height = v126;
  double MaxY = CGRectGetMaxY(v259);
  v260.origin.double x = v131;
  v260.origin.double y = v133;
  v260.size.CGFloat width = v135;
  v260.size.CGFloat height = v137;
  double v201 = CGRectGetMaxX(v260);
  v261.origin.double x = v131;
  double v206 = v133;
  v261.origin.double y = v133;
  v261.size.CGFloat width = v135;
  CGFloat v208 = v137;
  v261.size.CGFloat height = v137;
  double v207 = CGRectGetMaxY(v261);
  [(TSKScrollView *)v12 contentOffset];
  double v139 = v138;
  double v141 = v140;
  uint64_t v142 = [(TSDInteractiveCanvasController *)v11 sizeOfScrollViewEnclosingCanvas];
  CGFloat v145 = TSDRectWithOriginAndSize(v142, v139, v141, v143, v144);
  CGFloat v147 = v146;
  CGFloat v149 = v148;
  double v151 = v150;
  if ([(TSDCanvasLayer *)self->mCanvasLayer verticallyCenteredInScrollView]
    && [(TSDCanvasLayer *)self->mCanvasLayer avoidKeyboardWhenVerticallyCenteredInScrollView])
  {
    objc_msgSend(+[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor"), "keyboardHeightInView:", v12);
    double v151 = v151 - v152;
    double v207 = v207 - v152;
  }
  double v153 = v123 + v222;
  double v154 = v126 - v220;
  double v155 = TSDCenterOfRect(v145, v147, v149, v151);
  double v157 = TSDAddPoints(v155, v156, v231);
  double v159 = v158;
  if (v223 >= v135)
  {
    if (v153 <= v131)
    {
      double v163 = v226;
      if (MaxX >= v201)
      {
        double v168 = v231;
        double v164 = v233;
        double v162 = *(double *)&v115;
        goto LABEL_77;
      }
      double v162 = *(double *)&v115 + v201 - MaxX;
    }
    else
    {
      double v162 = *(double *)&v115 + v131 - v153;
      double v163 = v226;
    }
    double v168 = v231;
    double v164 = v233;
LABEL_77:
    double v166 = v209;
    double v165 = v210;
    double v167 = v208;
    double v160 = v162 - v168;
    goto LABEL_78;
  }
  if ([(TSDCanvasLayer *)self->mCanvasLayer horizontallyCenteredInScrollView]) {
    double v160 = v157 - v204;
  }
  else {
    double v160 = *(double *)&v115 + v215 - v153;
  }
  double v163 = v226;
  double v164 = v233;
  double v166 = v209;
  double v165 = v210;
  double v167 = v208;
LABEL_78:
  double v169 = v165 + v166;
  if (v154 >= v167)
  {
    if (v169 <= v206)
    {
      double v172 = v218;
      double v173 = v225;
      if (MaxY >= v207) {
        double v171 = *((double *)&v115 + 1);
      }
      else {
        double v171 = *((double *)&v115 + 1) + v207 - MaxY;
      }
    }
    else
    {
      double v171 = *((double *)&v115 + 1) + v206 - v169;
      double v172 = v218;
      double v173 = v225;
    }
    CGFloat v175 = v213;
    CGFloat v174 = v214;
    CGFloat v177 = height;
    CGFloat v176 = width;
    double v170 = v171 - v164;
  }
  else
  {
    if ([(TSDCanvasLayer *)self->mCanvasLayer verticallyCenteredInScrollView]) {
      double v170 = v159 - v205;
    }
    else {
      double v170 = *((double *)&v115 + 1) + v216 - v169;
    }
    double v172 = v218;
    double v173 = v225;
    CGFloat v175 = v213;
    CGFloat v174 = v214;
    CGFloat v177 = height;
    CGFloat v176 = width;
  }
  *(_OWORD *)&v248.a = v249;
  *(_OWORD *)&v248.c = v250;
  v248.CGFloat tx = v160;
  v248.tdouble y = v170;
  CGRect v262 = CGRectApplyAffineTransform(*(CGRect *)&v174, &v248);
  CGFloat v178 = v262.size.width;
  CGFloat v179 = v262.size.height;
  double v180 = TSDAddPoints(v262.origin.x, v262.origin.y, v172);
  v263.origin.double x = TSDSubtractPoints(v180, v181, v173);
  v263.size.CGFloat width = v178;
  v263.size.CGFloat height = v179;
  CGRect v264 = CGRectOffset(v263, -v231, -v233);
  double v182 = v264.origin.x;
  CGFloat v183 = v264.origin.y;
  CGFloat v184 = v264.size.width;
  CGFloat v185 = v264.size.height;
  [(TSDCanvas *)[(TSDInteractiveCanvasController *)v11 canvas] contentsScale];
  double v187 = -TSDRoundedRectForScale(v182, v183, v184, v185, v186);
  double v189 = -v188;
  -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](v11, "clampedUnscaledContentOffset:forViewScale:", TSDMultiplyPointScalar(v187, -v188, 1.0 / v228));
  double v192 = TSDMultiplyPointScalar(v190, v191, v228);
  double v194 = v193;
  if ([(TSDCanvasZoomTracker *)self animateTransform])
  {
    double v195 = v160 + v187 - v192;
    double v196 = v170 + v189 - v194;
    v197 = self->mCanvasLayer;
    if (v197) {
      [(TSDCanvasLayer *)v197 affineTransform];
    }
    else {
      memset(&v242, 0, sizeof(v242));
    }
    double v199 = v228;
    *(_OWORD *)&v248.a = v249;
    *(_OWORD *)&v248.c = v250;
    v248.CGFloat tx = v195;
    v248.tdouble y = v196;
    if (CGAffineTransformEqualToTransform(&v248, &v242))
    {
      char v198 = 0;
    }
    else
    {
      [objc_loadWeak((id *)p_mDelegate) canvasZoomTrackerWillBeginFinalZoomAnimation:self];
      v236[0] = MEMORY[0x263EF8330];
      v236[1] = 3221225472;
      v236[2] = __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke;
      v236[3] = &unk_2646B25B0;
      long long v237 = v249;
      long long v238 = v250;
      double v239 = v195;
      double v240 = v196;
      v236[4] = self;
      v236[5] = v11;
      double v241 = v163;
      v235[0] = MEMORY[0x263EF8330];
      v235[1] = 3221225472;
      v235[2] = __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke_2;
      v235[3] = &unk_2646B0728;
      v235[4] = self;
      *(double *)&v235[5] = v228;
      *(double *)&v235[6] = v192;
      *(double *)&v235[7] = v194;
      v234[0] = MEMORY[0x263EF8330];
      v234[1] = 3221225472;
      v234[2] = __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke_3;
      v234[3] = &unk_2646B2038;
      v234[4] = v235;
      [MEMORY[0x263F1CB60] animateWithDuration:0x20000 delay:v236 options:v234 animations:0.200000003 completion:0.0];
      char v198 = 1;
    }
  }
  else
  {
    char v198 = 0;
    double v199 = v228;
  }
  if (self->mIsShowingZoomHUD)
  {
    id Weak = objc_loadWeak((id *)p_mDelegate);
    if (v34) {
      [Weak performSelector:sel_canvasZoomTrackerDidEndViewScaleFeedback_ withObject:self afterDelay:0.5];
    }
    else {
      [Weak canvasZoomTrackerDidEndViewScaleFeedback:self];
    }
    self->mIsShowingZoomHUD = 0;
  }
  if ((v198 & 1) == 0) {
    -[TSDCanvasZoomTracker p_finishZoomWithFinalScaleFactor:contentOffset:](self, "p_finishZoomWithFinalScaleFactor:contentOffset:", v199, v192, v194);
  }
}

uint64_t __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 80);
  [v2 setAffineTransform:v5];
  return objc_msgSend(*(id *)(a1 + 40), "i_viewDidZoomToViewScale:", *(double *)(a1 + 96));
}

uint64_t __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke_2(double *a1)
{
  [objc_loadWeak((id *)(*((void *)a1 + 4) + 16)) canvasZoomTrackerDidEndFinalZoomAnimation:*((void *)a1 + 4)];
  v2 = (void *)*((void *)a1 + 4);
  double v3 = a1[5];
  double v4 = a1[6];
  double v5 = a1[7];

  return objc_msgSend(v2, "p_finishZoomWithFinalScaleFactor:contentOffset:", v3, v4, v5);
}

uint64_t __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)p_finishZoomWithFinalScaleFactor:(double)a3 contentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v8 = [(TSDCanvasLayer *)self->mCanvasLayer controller];
  [(TSDCanvasLayer *)self->mCanvasLayer setViewScale:a3];
  mCanvasLayer = self->mCanvasLayer;
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v14[0] = *MEMORY[0x263F000D0];
  v14[1] = v10;
  v14[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(TSDCanvasLayer *)mCanvasLayer setAffineTransform:v14];
  [(TSDCanvasLayer *)self->mCanvasLayer bounds];
  double v12 = TSDSubtractPoints(x, y, v11);
  -[TSKScrollView setContentOffset:]([(TSDCanvasView *)[(TSDCanvasLayer *)self->mCanvasLayer canvasView] enclosingScrollView], "setContentOffset:", v12, v13);
  [(TSDInteractiveCanvasController *)v8 viewDidEndZooming];
  [(TSDInteractiveCanvasController *)v8 i_recordUserViewScale];
  self->mIsZooming = 0;
  [objc_loadWeak((id *)&self->mDelegate) canvasZoomTrackerDidFinish:self];
}

- (TSDCanvasZoomTrackerDelegate)delegate
{
  return (TSDCanvasZoomTrackerDelegate *)objc_loadWeak((id *)&self->mDelegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)alwaysUsesTranslationSprings
{
  return self->mAlwaysUsesTranslationSprings;
}

- (void)setAlwaysUsesTranslationSprings:(BOOL)a3
{
  self->mAlwaysUsesTranslationSprings = a3;
}

- (BOOL)snapsViewScale
{
  return self->mSnapsViewScale;
}

- (void)setSnapsViewScale:(BOOL)a3
{
  self->mSnapsViewScale = a3;
}

- (BOOL)animateTransform
{
  return self->mAnimateTransform;
}

- (void)setAnimateTransform:(BOOL)a3
{
  self->mAnimateTransform = a3;
}

- (void).cxx_destruct
{
}

@end