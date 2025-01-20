@interface CRLCanvasZoomTracker
- (BOOL)alwaysUsesTranslationSprings;
- (BOOL)animateTransform;
- (BOOL)currentlySnappingViewScale;
- (BOOL)fastPinchSnapsViewScale;
- (BOOL)gestureIsFastPinch;
- (BOOL)slowPinchSnapsViewScale;
- (CGRect)visibleUnscaledBoundsAtEndOfZoom;
- (CRLCanvasZoomTracker)initWithCanvasLayer:(id)a3;
- (CRLCanvasZoomTrackerDelegate)delegate;
- (void)p_finishZoomWithFinalScaleFactor:(double)a3 contentOffset:(CGPoint)a4;
- (void)setAlwaysUsesTranslationSprings:(BOOL)a3;
- (void)setAnimateTransform:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFastPinchSnapsViewScale:(BOOL)a3;
- (void)setSlowPinchSnapsViewScale:(BOOL)a3;
- (void)zoomWithScale:(double)a3 velocity:(double)a4 locationInView:(CGPoint)a5 phase:(int64_t)a6;
@end

@implementation CRLCanvasZoomTracker

- (CRLCanvasZoomTracker)initWithCanvasLayer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLCanvasZoomTracker;
  v5 = [(CRLCanvasZoomTracker *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_canvasLayer, v4);
    *(_WORD *)&v6->_fastPinchSnapsViewScale = 257;
    v6->_animateTransform = 1;
  }

  return v6;
}

- (void)zoomWithScale:(double)a3 velocity:(double)a4 locationInView:(CGPoint)a5 phase:(int64_t)a6
{
  tdouble y = a5.x;
  tdouble x = a5.y;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", WeakRetained);

  if (a6 == 2)
  {
    if (qword_101719C78 != -1) {
      dispatch_once(&qword_101719C78, &stru_1014D7478);
    }
    v12 = off_10166BBC0;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG)) {
      sub_10107B7C4((os_log_t)v12);
    }
  }
  self->_BOOL gestureIsFastPinch = 0;
  p_canvasLayer = &self->_canvasLayer;
  id v14 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v15 = [v14 controller];

  id v16 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v17 = [v16 canvasView];
  v446 = [v17 enclosingScrollView];

  unsigned __int8 v441 = [v15 shouldCanvasScrollingSizeGrowToFitBoardContent];
  location = (id *)p_delegate;
  switch(a6)
  {
    case 0:
LABEL_18:
      p_savedTransform = &self->_savedTransform;
      id v26 = objc_loadWeakRetained((id *)&self->_canvasLayer);
      v27 = v26;
      if (v26) {
        [v26 affineTransform];
      }
      else {
        memset(&transform, 0, 48);
      }
      long long v28 = *(_OWORD *)&transform.m13;
      *(_OWORD *)&p_savedTransform->a = *(_OWORD *)&transform.m11;
      *(_OWORD *)&self->_savedTransform.c = v28;
      *(_OWORD *)&self->_savedTransform.tdouble x = *(_OWORD *)&transform.m21;

      [v446 contentOffset];
      self->_savedContentOffset.double x = v29;
      self->_savedContentOffset.double y = v30;
      self->_hasGestureOrigin = 0;
      self->_gestureOffset = CGPointZero;
      [v15 i_viewWillBeginZooming];
      self->_isZooming = 1;
      self->_unint64_t zoomVelocitySampleCount = 0;
      self->_zoomVelocitdouble y = 0.0;
      +[NSDate timeIntervalSinceReferenceDate];
      self->_zoomStartTime = v31;
      if (qword_101719C78 != -1) {
        dispatch_once(&qword_101719C78, &stru_1014D74B8);
      }
      v32 = off_10166BBC0;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEBUG))
      {
        id v399 = objc_loadWeakRetained((id *)&self->_canvasLayer);
        [v399 viewScale];
        uint64_t v401 = v400;
        long long v402 = *(_OWORD *)&self->_savedTransform.c;
        *(_OWORD *)&transform.m11 = *(_OWORD *)&p_savedTransform->a;
        *(_OWORD *)&transform.m13 = v402;
        *(_OWORD *)&transform.m21 = *(_OWORD *)&self->_savedTransform.tx;
        NSStringFromCGAffineTransform((CGAffineTransform *)&transform);
        id v403 = (id)objc_claimAutoreleasedReturnValue();
        LODWORD(transform.m11) = 134218242;
        *(void *)((char *)&transform.m11 + 4) = v401;
        WORD2(transform.m12) = 2112;
        *(void *)((char *)&transform.m12 + 6) = v403;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEBUG, "Begin zoom. Initial view scale %f initial transform %@", (uint8_t *)&transform, 0x16u);

        p_delegate = (CRLCanvasZoomTrackerDelegate **)location;
      }

      break;
    case 1:
      if (self->_isZooming) {
        break;
      }
      goto LABEL_18;
    case 3:
      if (qword_101719C78 != -1) {
        dispatch_once(&qword_101719C78, &stru_1014D7498);
      }
      v18 = v446;
      v19 = off_10166BBC0;
      if (os_log_type_enabled((os_log_t)off_10166BBC0, OS_LOG_TYPE_DEBUG)) {
        sub_10107B780(v19);
      }
      if (self->_isShowingZoomHUD)
      {
        id v20 = objc_loadWeakRetained((id *)p_delegate);
        [v20 canvasZoomTrackerDidEndViewScaleFeedback:self];
      }
      id v21 = objc_loadWeakRetained((id *)&self->_canvasLayer);
      *(_OWORD *)txc = *(_OWORD *)&CGAffineTransformIdentity.c;
      v484[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)tyCATransform3D b = v484[0];
      v484[1] = *(_OWORD *)txc;
      long long v485 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      long long v447 = v485;
      [v21 setAffineTransform:v484];

      id v22 = objc_loadWeakRetained((id *)&self->_canvasLayer);
      v23 = [v22 associatedBackgroundLayer];
      v483[0] = *(_OWORD *)tyb;
      v483[1] = *(_OWORD *)txc;
      v483[2] = v447;
      [v23 setDynamicTransform:v483];

      [v15 viewDidEndZooming];
      id v24 = objc_loadWeakRetained((id *)p_delegate);
      [v24 canvasZoomTrackerDidFinish:self];

      goto LABEL_272;
  }
  unint64_t zoomVelocitySampleCount = self->_zoomVelocitySampleCount;
  double v34 = a4 + (double)zoomVelocitySampleCount++ * self->_zoomVelocity;
  self->_zoomVelocitdouble y = v34 / (double)zoomVelocitySampleCount;
  self->_unint64_t zoomVelocitySampleCount = zoomVelocitySampleCount;
  id v35 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  [v35 viewScale];
  double v37 = v36;

  id v38 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  [v38 minimumPinchViewScale];
  double v40 = v39;

  id v41 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  [v41 maximumPinchViewScale];
  double v43 = v42;

  +[NSDate timeIntervalSinceReferenceDate];
  double v45 = v44 - self->_zoomStartTime;
  if (a6 == 2 && v45 < 0.2 && fabs(self->_zoomVelocity) > 0.5)
  {
    self->_BOOL gestureIsFastPinch = 1;
    id v46 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    [v46 viewScale];
    [v15 i_nextCanvasViewScaleDetentForProposedViewScale:self->_zoomVelocity > 0.0, self->_gestureIsFastPinch];
    double v48 = v47;

    p_isShowingZoomHUD = &self->_isShowingZoomHUD;
    if (self->_isShowingZoomHUD) {
      goto LABEL_37;
    }
    id v50 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    unsigned int v51 = [v50 showsScaleFeedback];

    if (!v51) {
      goto LABEL_37;
    }
    id v52 = objc_loadWeakRetained((id *)p_delegate);
    v53 = v52;
    v54 = self;
    uint64_t v55 = 1;
  }
  else
  {
    double v48 = v37 * a3;
    if (v45 <= 0.2) {
      goto LABEL_37;
    }
    p_isShowingZoomHUD = &self->_isShowingZoomHUD;
    if (self->_isShowingZoomHUD) {
      goto LABEL_37;
    }
    id v56 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    unsigned int v57 = [v56 showsScaleFeedback];

    if (!v57) {
      goto LABEL_37;
    }
    id v52 = objc_loadWeakRetained((id *)p_delegate);
    v53 = v52;
    v54 = self;
    uint64_t v55 = 0;
  }
  [v52 canvasZoomTracker:v54 willBeginViewScaleFeedbackWithZoomMethod:v55];

  BOOL *p_isShowingZoomHUD = 1;
LABEL_37:
  double v58 = sub_100407E48(v48, v40, v43);
  if ([(CRLCanvasZoomTracker *)self fastPinchSnapsViewScale] && self->_gestureIsFastPinch
    || [(CRLCanvasZoomTracker *)self slowPinchSnapsViewScale])
  {
    id v59 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    [v59 viewScale];
    [v15 i_viewScaleForProposedViewScale:self->_gestureIsFastPinch originalViewScale:v58 isFastPinch:v60];
    double v62 = v61;

    BOOL v63 = v62 != v58 || self->_gestureIsFastPinch;
    self->_currentlySnappingViewScale = v63;
    double v58 = v62;
  }
  else
  {
    self->_currentlySnappingViewScale = 0;
  }
  if (a6 == 2)
  {
    id v64 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    [v64 viewScale];
    [v15 i_canvasCenterOffsetForProposedViewScale:v58 originalViewScale:v65];
    double width = v66;
    double height = v67;

    if (qword_101719C78 != -1) {
      dispatch_once(&qword_101719C78, &stru_1014D74D8);
    }
    v68 = off_10166BBC0;
    if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEBUG)) {
      sub_10107B6F4(width, height);
    }

    double v48 = v58;
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  double v435 = v58;
  if (v48 >= v40)
  {
    if (v48 > v43) {
      double v48 = v43 + (1.0 - 3.0 / (v48 - v43 + 3.0)) * 0.8;
    }
  }
  else
  {
    double v48 = v40 + (1.0 - 3.0 / (v40 - v48 + 3.0)) * -0.8;
  }
  id v69 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  [v69 unscaledSize];
  double v70 = sub_100064070();
  CGFloat v72 = v71;
  CGFloat v74 = v73;
  CGFloat v76 = v75;

  id v77 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  [v77 viewScale];
  double v79 = sub_1000652FC(v70, v72, v74, v76, v78);
  CGFloat v81 = v80;
  CGFloat v83 = v82;
  CGFloat v85 = v84;

  id v86 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v87 = [v86 controller];
  v88 = [v87 canvas];
  unsigned int v89 = [v88 isAnchoredAtRight];

  double v90 = 0.0;
  if (v89) {
    double v90 = v83;
  }
  double v420 = v83;
  double v91 = sub_100065738(v79 - v90, v81, v83, v85);
  double v422 = v92;
  double v424 = v91;
  id v93 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v94 = [v93 canvasView];
  id v95 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v96 = [v95 canvasView];
  v97 = [v96 superview];
  [v94 convertPoint:v97 toView:ty, tx];
  double v99 = v98;
  double v101 = v100;

  v18 = v446;
  v102 = location;
  if (!self->_hasGestureOrigin)
  {
    memset(&transform, 0, 48);
    id v103 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    v104 = v103;
    if (v103) {
      [v103 affineTransform];
    }
    else {
      memset(&v482, 0, sizeof(v482));
    }
    CGAffineTransformInvert((CGAffineTransform *)&transform, &v482);

    self->_scaledZoomOrigin = (CGPoint)vaddq_f64(*(float64x2_t *)&transform.m21, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&transform.m13, tx), *(float64x2_t *)&transform.m11, ty));
    if (qword_101719C78 != -1) {
      dispatch_once(&qword_101719C78, &stru_1014D74F8);
    }
    v105 = off_10166BBC0;
    if (os_log_type_enabled((os_log_t)v105, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromCGPoint(self->_scaledZoomOrigin);
      id v404 = (id)objc_claimAutoreleasedReturnValue();
      v499.double x = ty;
      v499.double y = tx;
      NSStringFromCGPoint(v499);
      id v405 = (id)objc_claimAutoreleasedReturnValue();
      *(_OWORD *)&t1.m11 = *(_OWORD *)&transform.m11;
      *(_OWORD *)&t1.m13 = *(_OWORD *)&transform.m13;
      *(_OWORD *)&t1.m21 = *(_OWORD *)&transform.m21;
      NSStringFromCGAffineTransform((CGAffineTransform *)&t1);
      id v406 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(t1.m11) = 138412802;
      *(void *)((char *)&t1.m11 + 4) = v404;
      WORD2(t1.m12) = 2112;
      *(void *)((char *)&t1.m12 + 6) = v405;
      HIWORD(t1.m13) = 2112;
      *(void *)&t1.m14 = v406;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v105, OS_LOG_TYPE_DEBUG, "mScaledZoomOrigin %@ transforms locationInView %@ by inverse canvas layer transform %@", (uint8_t *)&t1, 0x20u);

      v102 = location;
    }

    self->_gestureOrigin.double x = v99;
    self->_gestureOrigin.double y = v101;
    self->_hasGestureOrigin = 1;
  }
  double y = self->_scaledZoomOrigin.y;
  double x = self->_scaledZoomOrigin.x;
  if (a6 != 2)
  {
    self->_gestureOffset.double x = sub_100064680(v99, v101, self->_gestureOrigin.x);
    self->_gestureOffset.double y = v106;
  }
  [v446 bounds];
  double v107 = sub_100064070();
  double rect = v108;
  double v430 = v107;
  double v110 = v109;
  double v112 = v111;
  double v436 = v48;
  if ((v441 & 1) == 0)
  {
    id v113 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    [v113 unscaledSize];
    double v116 = sub_1000646A4(v114, v115, v48);
    double v118 = v117;

    double v119 = fmax((v116 - v110) * 0.5, 0.0);
    double v120 = fmax((v118 - v112) * 0.5, 0.0);
    if (a6 == 2)
    {
      self->_gestureOffset.double x = sub_100407E48(self->_gestureOffset.x, -v119, v119);
      double v121 = sub_100407E48(self->_gestureOffset.y, -v120, v120);
    }
    else
    {
      id v122 = objc_loadWeakRetained((id *)&self->_canvasLayer);
      unsigned __int8 v123 = [v122 isInfinite];

      if (v123) {
        goto LABEL_88;
      }
      if ([(CRLCanvasZoomTracker *)self alwaysUsesTranslationSprings])
      {
        double v124 = 0.8;
      }
      else
      {
        id v125 = objc_loadWeakRetained((id *)&self->_canvasLayer);
        [v125 viewScale];
        if (v48 >= 1.0 || v126 < 1.0) {
          double v124 = 0.800000012;
        }
        else {
          double v124 = 1.0;
        }
      }
      double v128 = self->_gestureOffset.x;
      double v129 = 0.0;
      double v130 = 0.0;
      if (v128 != 0.0)
      {
        double v131 = fabs(v128);
        double v130 = v131 * fmax((v131 - v119) / v131, 0.0);
      }
      double v132 = sub_100407E48(v128, -v119, v119);
      float v133 = v130;
      float v134 = v124;
      *(double *)v135.i64 = powf(v133, v134);
      v136.f64[0] = NAN;
      v136.f64[1] = NAN;
      int8x16_t v137 = (int8x16_t)vnegq_f64(v136);
      v139.i64[0] = *(void *)&self->_gestureOffset.x;
      double v138 = self->_gestureOffset.y;
      *(int8x16_t *)txa = v137;
      self->_gestureOffset.double x = v132 + *(double *)vbslq_s8(v137, v135, v139).i64;
      if (v138 != 0.0)
      {
        double v140 = fabs(v138);
        double v129 = v140 * fmax((v140 - v120) / v140, 0.0);
      }
      double v141 = sub_100407E48(v138, -v120, v120);
      float v142 = v129;
      float v143 = v124;
      *(double *)v144.i64 = powf(v142, v143);
      v145.i64[0] = *(void *)&self->_gestureOffset.y;
      double v121 = v141 + *(double *)vbslq_s8(*(int8x16_t *)txa, v144, v145).i64;
    }
    self->_gestureOffset.double y = v121;
  }
LABEL_88:
  double v426 = v110;
  double v432 = v112;
  if (self->_isShowingZoomHUD)
  {
    id v146 = objc_loadWeakRetained(v102);
    [v146 canvasZoomTracker:self willUpdateViewScaleFeedbackWithScale:v435];
  }
  id v147 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  [v147 bounds];
  double v149 = v148;
  double v151 = v150;
  double v153 = v152;
  double v155 = v154;

  double v156 = sub_100064070();
  double v160 = sub_100065738(v156, v157, v158, v159);
  double v162 = v161;
  id v163 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  [v163 anchorPoint];
  double v165 = v164;
  double v167 = v166;

  v500.origin.double x = v149;
  v500.origin.double y = v151;
  v500.size.double width = v153;
  v500.size.double height = v155;
  double v168 = v165 * CGRectGetWidth(v500);
  v501.origin.double x = v149;
  v501.origin.double y = v151;
  v501.size.double width = v153;
  v501.size.double height = v155;
  double v169 = v167 * CGRectGetHeight(v501);
  double v443 = v160;
  double txb = sub_100064680(v160, v162, v168);
  double tya = v170;
  if (a6 == 2)
  {
    if (qword_101719C78 != -1) {
      dispatch_once(&qword_101719C78, &stru_1014D7518);
    }
    v171 = off_10166BBC0;
    if (os_log_type_enabled((os_log_t)v171, OS_LOG_TYPE_DEBUG)) {
      sub_10107B668(v149, v151, v153, v155);
    }

    if (qword_101719C78 != -1) {
      dispatch_once(&qword_101719C78, &stru_1014D7538);
    }
    v172 = off_10166BBC0;
    if (os_log_type_enabled((os_log_t)v172, OS_LOG_TYPE_DEBUG)) {
      sub_10107B5DC(v160, v162);
    }

    if (qword_101719C78 != -1) {
      dispatch_once(&qword_101719C78, &stru_1014D7558);
    }
    v173 = off_10166BBC0;
    if (os_log_type_enabled((os_log_t)v173, OS_LOG_TYPE_DEBUG)) {
      sub_10107B550(v168, v169);
    }

    if (qword_101719C78 != -1) {
      dispatch_once(&qword_101719C78, &stru_1014D7578);
    }
    v174 = off_10166BBC0;
    if (os_log_type_enabled((os_log_t)v174, OS_LOG_TYPE_DEBUG)) {
      sub_10107B4C4(txb, tya);
    }
  }
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7598);
  }
  v175 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v175, OS_LOG_TYPE_DEBUG))
  {
    v489.double y = y;
    v489.double x = x;
    NSStringFromCGPoint(v489);
    id v316 = (id)objc_claimAutoreleasedReturnValue();
    v511.origin.double x = v149;
    v511.origin.double y = v151;
    v511.size.double width = v153;
    v511.size.double height = v155;
    NSStringFromCGRect(v511);
    id v317 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412546;
    *(void *)((char *)&transform.m11 + 4) = v316;
    WORD2(transform.m12) = 2112;
    *(void *)((char *)&transform.m12 + 6) = v317;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v175, OS_LOG_TYPE_DEBUG, "zoomOriginInBounds %@ canvasLayerBounds %@", (uint8_t *)&transform, 0x16u);
  }
  double v176 = sub_100064680(x, y, v149);
  CGFloat v178 = v177;
  double v179 = sub_100064680(v176, v177, v160);
  CGFloat v181 = v180;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D75B8);
  }
  v182 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v182, OS_LOG_TYPE_DEBUG))
  {
    v490.double x = v176;
    v490.double y = v178;
    NSStringFromCGPoint(v490);
    id v318 = (id)objc_claimAutoreleasedReturnValue();
    v491.double x = v179;
    v491.double y = v181;
    NSStringFromCGPoint(v491);
    id v319 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412546;
    *(void *)((char *)&transform.m11 + 4) = v318;
    WORD2(transform.m12) = 2112;
    *(void *)((char *)&transform.m12 + 6) = v319;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v182, OS_LOG_TYPE_DEBUG, "zoomOriginRelativeToFrameOrigin %@ zoomOriginRelativeToViewAnchor %@", (uint8_t *)&transform, 0x16u);
  }
  id v183 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  [v183 viewScale];
  double v185 = v184;

  [v446 contentOffset];
  CGFloat v187 = v186;
  CGFloat v189 = v188;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D75D8);
  }
  v190 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v190, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromCGPoint(self->_gestureOffset);
    id v320 = (id)objc_claimAutoreleasedReturnValue();
    v492.double x = v187;
    v492.double y = v189;
    NSStringFromCGPoint(v492);
    id v321 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412546;
    *(void *)((char *)&transform.m11 + 4) = v320;
    WORD2(transform.m12) = 2112;
    *(void *)((char *)&transform.m12 + 6) = v321;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v190, OS_LOG_TYPE_DEBUG, "mGestureOffset %@, scaledContentOffset %@", (uint8_t *)&transform, 0x16u);
  }
  long long v191 = *(_OWORD *)&self->_savedTransform.c;
  *(_OWORD *)&v481.a = *(_OWORD *)&self->_savedTransform.a;
  *(_OWORD *)&v481.c = v191;
  long long v193 = *(_OWORD *)&self->_savedTransform.a;
  long long v192 = *(_OWORD *)&self->_savedTransform.c;
  *(_OWORD *)&v481.tdouble x = *(_OWORD *)&self->_savedTransform.tx;
  *(_OWORD *)&transform.m11 = v193;
  *(_OWORD *)&transform.m13 = v192;
  *(_OWORD *)&transform.m21 = *(_OWORD *)&self->_savedTransform.tx;
  CGAffineTransformTranslate(&v481, (CGAffineTransform *)&transform, txb, tya);
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D75F8);
  }
  v194 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v194, OS_LOG_TYPE_DEBUG)) {
    sub_10107B438((__n128 *)&v481);
  }

  CGFloat v195 = self->_gestureOffset.x;
  CGFloat v196 = self->_gestureOffset.y;
  *(_OWORD *)&t1.m11 = *(_OWORD *)&v481.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v481.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v481.tx;
  CGAffineTransformTranslate((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, v195, v196);
  *(_OWORD *)&v481.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v481.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v481.tdouble x = *(_OWORD *)&transform.m21;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7618);
  }
  v197 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v197, OS_LOG_TYPE_DEBUG)) {
    sub_10107B3AC((__n128 *)&v481);
  }

  *(_OWORD *)&t1.m11 = *(_OWORD *)&v481.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v481.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v481.tx;
  CGAffineTransformTranslate((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, v179, v181);
  *(_OWORD *)&v481.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v481.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v481.tdouble x = *(_OWORD *)&transform.m21;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7638);
  }
  double v198 = v436 / v185;
  v199 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v199, OS_LOG_TYPE_DEBUG)) {
    sub_10107B320((__n128 *)&v481);
  }

  *(_OWORD *)&t1.m11 = *(_OWORD *)&v481.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v481.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v481.tx;
  CGAffineTransformScale((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, v198, v198);
  *(_OWORD *)&v481.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v481.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v481.tdouble x = *(_OWORD *)&transform.m21;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7658);
  }
  v200 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v200, OS_LOG_TYPE_DEBUG)) {
    sub_10107B294((__n128 *)&v481);
  }

  *(_OWORD *)&t1.m11 = *(_OWORD *)&v481.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v481.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v481.tx;
  CGAffineTransformTranslate((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, -v179, -v181);
  *(_OWORD *)&v481.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v481.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v481.tdouble x = *(_OWORD *)&transform.m21;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7678);
  }
  v201 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v201, OS_LOG_TYPE_DEBUG)) {
    sub_10107B208((__n128 *)&v481);
  }

  double v202 = CGPointZero.y;
  memset(&v480, 0, sizeof(v480));
  CGAffineTransformMakeTranslation(&v480, width - CGPointZero.x, height - v202);
  *(_OWORD *)&t1.m11 = *(_OWORD *)&v481.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v481.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v481.tx;
  CGAffineTransform t2 = v480;
  CGAffineTransformConcat((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, &t2);
  *(_OWORD *)&v481.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v481.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v481.tdouble x = *(_OWORD *)&transform.m21;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7698);
  }
  v203 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v203, OS_LOG_TYPE_DEBUG)) {
    sub_10107B17C((__n128 *)&v481);
  }

  *(_OWORD *)&t1.m11 = *(_OWORD *)&v481.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v481.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v481.tx;
  CGAffineTransformTranslate((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, -txb, -tya);
  *(_OWORD *)&v481.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v481.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v481.tdouble x = *(_OWORD *)&transform.m21;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D76B8);
  }
  v204 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v204, OS_LOG_TYPE_DEBUG)) {
    sub_10107B0F0((__n128 *)&v481);
  }

  if (a6 != 2)
  {
    memset(&transform, 0, sizeof(transform));
    *(_OWORD *)&t1.m11 = *(_OWORD *)&v481.a;
    *(_OWORD *)&t1.m13 = *(_OWORD *)&v481.c;
    *(_OWORD *)&t1.m21 = *(_OWORD *)&v481.tx;
    CATransform3DMakeAffineTransform(&transform, (CGAffineTransform *)&t1);
    transform.m33 = transform.m11;
    CATransform3D v478 = transform;
    id v296 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    CATransform3D v477 = v478;
    [v296 setTransform:&v477];

    CGAffineTransform v476 = v481;
    id v297 = objc_loadWeakRetained((id *)p_canvasLayer);
    v298 = [v297 associatedBackgroundLayer];
    CGAffineTransform v475 = v476;
    [v298 setDynamicTransform:&v475];

    [v15 i_viewIsZoomingAtPoint:x, y];
    [v15 i_viewDidZoomToViewScale:1 notify:v435];
    goto LABEL_272;
  }
  double v205 = sub_100064680(v424, v422, v149);
  double v207 = v206;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D76D8);
  }
  v208 = off_10166BBC0;
  double v434 = v187;
  if (os_log_type_enabled((os_log_t)v208, OS_LOG_TYPE_DEBUG))
  {
    v493.double x = v205;
    v493.double y = v207;
    NSStringFromCGPoint(v493);
    id v379 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v379;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v208, OS_LOG_TYPE_DEBUG, "boundsCenterRelativeToFrameOrigin %@", (uint8_t *)&transform, 0xCu);
  }
  double v209 = sub_100064680(v205, v207, v160);
  double v211 = v210;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D76F8);
  }
  v212 = off_10166BBC0;
  double v407 = v205;
  if (os_log_type_enabled((os_log_t)v212, OS_LOG_TYPE_DEBUG))
  {
    v494.double x = v209;
    v494.double y = v211;
    NSStringFromCGPoint(v494);
    id v380 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v380;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v212, OS_LOG_TYPE_DEBUG, "boundsCenterRelativeToViewCenter %@", (uint8_t *)&transform, 0xCu);
  }
  memset(&t2, 0, sizeof(t2));
  *(_OWORD *)&transform.m11 = *(_OWORD *)&v481.a;
  *(_OWORD *)&transform.m13 = *(_OWORD *)&v481.c;
  *(_OWORD *)&transform.m21 = *(_OWORD *)&v481.tx;
  sub_10007FCC0(&transform, &t2, txb, tya);
  double v213 = sub_10006402C(v209, v211, v420);
  CGFloat v215 = v214;
  CGFloat v217 = v216;
  CGFloat v219 = v218;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7718);
  }
  v220 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v220, OS_LOG_TYPE_DEBUG))
  {
    v516.origin.double x = v213;
    v516.origin.double y = v215;
    v516.size.double width = v217;
    v516.size.double height = v219;
    NSStringFromCGRect(v516);
    id v381 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v381;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v220, OS_LOG_TYPE_DEBUG, "transformedRect1 %@", (uint8_t *)&transform, 0xCu);
  }
  *(_OWORD *)&transform.m11 = *(_OWORD *)&t2.a;
  *(_OWORD *)&transform.m13 = *(_OWORD *)&t2.c;
  *(_OWORD *)&transform.m21 = *(_OWORD *)&t2.tx;
  v502.origin.double x = v213;
  v502.origin.double y = v215;
  v502.size.double width = v217;
  CGFloat v419 = v219;
  v502.size.double height = v219;
  CGRect v503 = CGRectApplyAffineTransform(v502, (CGAffineTransform *)&transform);
  double v221 = v503.origin.x;
  double v222 = v503.origin.y;
  CGFloat v223 = v503.size.width;
  CGFloat v224 = v503.size.height;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7738);
  }
  v225 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v225, OS_LOG_TYPE_DEBUG))
  {
    v517.origin.double x = v221;
    v517.origin.double y = v222;
    v517.size.double width = v223;
    v517.size.double height = v224;
    NSStringFromCGRect(v517);
    id v382 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v382;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v225, OS_LOG_TYPE_DEBUG, "transformedRect2 %@", (uint8_t *)&transform, 0xCu);
  }
  double v226 = sub_100064698(v221, v222, v443);
  double v228 = v227;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7758);
  }
  v229 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v229, OS_LOG_TYPE_DEBUG))
  {
    v518.origin.double x = v226;
    v518.origin.double y = v228;
    v518.size.double width = v223;
    v518.size.double height = v224;
    NSStringFromCGRect(v518);
    id v383 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v383;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v229, OS_LOG_TYPE_DEBUG, "transformedRect3 %@", (uint8_t *)&transform, 0xCu);
  }
  double v230 = sub_100064680(v226, v228, v434);
  CGFloat v232 = v231;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7778);
  }
  v233 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v233, OS_LOG_TYPE_DEBUG))
  {
    v519.origin.double x = v230;
    v519.origin.double y = v232;
    v519.size.double width = v223;
    v519.size.double height = v224;
    NSStringFromCGRect(v519);
    id v384 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v384;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v233, OS_LOG_TYPE_DEBUG, "transformedRect4 %@", (uint8_t *)&transform, 0xCu);
  }
  v504.origin.double x = v230;
  v504.origin.double y = v232;
  v504.size.double width = v223;
  v504.size.double height = v224;
  double v438 = -height;
  double v440 = -width;
  CGRect v505 = CGRectOffset(v504, -width, -height);
  double v234 = v505.origin.x;
  double v235 = v505.origin.y;
  double v236 = v505.size.width;
  double v237 = v505.size.height;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7798);
  }
  v238 = off_10166BBC0;
  double v410 = v207;
  CGFloat v423 = v215;
  double v425 = v213;
  CGFloat v421 = v217;
  if (os_log_type_enabled((os_log_t)v238, OS_LOG_TYPE_DEBUG))
  {
    v520.origin.double x = v234;
    v520.origin.double y = v235;
    v520.size.double width = v236;
    v520.size.double height = v237;
    NSStringFromCGRect(v520);
    id v385 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v385;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v238, OS_LOG_TYPE_DEBUG, "transformedRect5 %@", (uint8_t *)&transform, 0xCu);
  }
  id v239 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  [v239 contentInset];
  CGFloat v415 = v235;
  CGFloat v417 = v234;
  double v241 = v234 + v240;
  double v243 = v235 + v242;
  CGFloat v413 = v237;
  CGFloat v414 = v236;
  double v245 = v236 - (v240 + v244);
  double v247 = v237 - (v242 + v246);

  [v446 adjustedContentInset];
  double v249 = v248;
  double v251 = v250;
  double v254 = -v253 - v250;
  double v255 = -v252 - v248;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D77B8);
  }
  double point_8 = v241 - v251;
  double v411 = v243 - v249;
  double v412 = v245 - v254;
  v256 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v256, OS_LOG_TYPE_DEBUG))
  {
    v521.origin.double x = v241 - v251;
    v521.origin.double y = v243 - v249;
    v521.size.double width = v245 - v254;
    v521.size.double height = v247 - v255;
    NSStringFromCGRect(v521);
    id v386 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v386;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v256, OS_LOG_TYPE_DEBUG, "transformedAndInsetRect %@", (uint8_t *)&transform, 0xCu);
  }
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D77D8);
  }
  double v257 = v430 + width * 2.0;
  double v258 = rect + height * 2.0;
  double v259 = v426 + v440 * 2.0;
  double v260 = v432 + v438 * 2.0;
  v261 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v261, OS_LOG_TYPE_DEBUG)) {
    sub_10107B000(v412 >= v259, v247 - v255 >= v260, v261);
  }
  double recta = v247 - v255;

  long long v473 = *(_OWORD *)&t2.a;
  long long v474 = *(_OWORD *)&t2.c;
  double v431 = t2.tx;
  CGFloat v433 = t2.ty;
  v506.origin.double x = v417;
  v506.origin.double y = v415;
  v506.size.double width = v414;
  v506.size.double height = v413;
  double point = CGRectGetMaxX(v506);
  v507.origin.double x = v417;
  v507.origin.double y = v415;
  v507.size.double width = v414;
  v507.size.double height = v413;
  double MaxY = CGRectGetMaxY(v507);
  v508.origin.double x = v257;
  v508.origin.double y = v258;
  v508.size.double width = v259;
  v508.size.double height = v260;
  double MaxX = CGRectGetMaxX(v508);
  [v446 adjustedContentInset];
  double v264 = v263;
  v509.origin.double x = v257;
  v509.origin.double y = v258;
  v509.size.double width = v259;
  v509.size.double height = v260;
  double v265 = CGRectGetMaxY(v509);
  [v446 adjustedContentInset];
  double v267 = v266;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D77F8);
  }
  double v418 = MaxX - v264;
  v268 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v268, OS_LOG_TYPE_DEBUG))
  {
    v495.double x = point_8;
    v495.double y = v411;
    NSStringFromCGPoint(v495);
    id v387 = (id)objc_claimAutoreleasedReturnValue();
    v496.double x = point;
    v496.double y = MaxY;
    NSStringFromCGPoint(v496);
    id v388 = (id)objc_claimAutoreleasedReturnValue();
    v497.double x = MaxX - v264;
    v497.double y = v265 - v267;
    NSStringFromCGPoint(v497);
    id v389 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412802;
    *(void *)((char *)&transform.m11 + 4) = v387;
    WORD2(transform.m12) = 2112;
    *(void *)((char *)&transform.m12 + 6) = v388;
    HIWORD(transform.m13) = 2112;
    *(void *)&transform.m14 = v389;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v268, OS_LOG_TYPE_DEBUG, "currentContentOffset %@ bottomRightPoint %@ svBottomRight %@", (uint8_t *)&transform, 0x20u);
  }
  double v416 = v265 - v267;

  [v446 contentOffset];
  id v269 = [v15 sizeOfScrollViewEnclosingCanvas];
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v488 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v269, v270);
  double v272 = v271;
  double v274 = v273;
  double v276 = v275;
  double v278 = v277;
  [v446 adjustedContentInset:v488.recordType._object];
  double v283 = sub_100065738(v272 + v282, v274 + v279, v276 - (v282 + v280), v278 - (v279 + v281));
  double v285 = sub_100064698(v283, v284, width);
  double v287 = v286;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7818);
  }
  v288 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v288, OS_LOG_TYPE_DEBUG)) {
    sub_10107AF74(v285, v287);
  }

  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7838);
  }
  v289 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v289, OS_LOG_TYPE_DEBUG))
  {
    *(_OWORD *)&transform.m11 = v473;
    *(_OWORD *)&transform.m13 = v474;
    transform.m21 = v431;
    transform.m22 = v433;
    NSStringFromCGAffineTransform((CGAffineTransform *)&transform);
    id v390 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v390;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v289, OS_LOG_TYPE_DEBUG, "adjustedTransform before horizontal and vertical clamping %@", (uint8_t *)&transform, 0xCu);
  }
  if ((v441 & 1) == 0)
  {
    id v299 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    v300 = v299;
    if (v412 < v259)
    {
      unsigned int v307 = [v299 horizontallyCenteredInScrollView:v412];

      if (v307)
      {
        double v295 = v285 - v407;
        double v304 = v410;
        double v293 = v421;
        double v305 = v433;
      }
      else
      {
        id v312 = objc_loadWeakRetained((id *)&self->_canvasLayer);
        v313 = [v312 controller];
        v314 = [v313 canvas];
        unsigned int v315 = [v314 isAnchoredAtRight];

        double v304 = v410;
        double v305 = v433;
        if (v315)
        {
          v510.origin.double x = point_8;
          v510.origin.double y = v411;
          v510.size.double width = v412;
          v510.size.double height = recta;
          double v295 = v431 + v259 - CGRectGetMaxX(v510);
        }
        else
        {
          double v295 = v431 - point_8;
        }
        double v293 = v421;
      }
LABEL_216:
      if (recta < v260)
      {
        id v322 = objc_loadWeakRetained((id *)&self->_canvasLayer);
        unsigned int v323 = [v322 verticallyCenteredInScrollView];

        double v291 = v425;
        if (v323) {
          double v294 = v287 - v304;
        }
        else {
          double v294 = v305 - v411;
        }
        double v290 = v423;
        double v292 = v419;
      }
      else
      {
        double v291 = v425;
        if (v411 >= v258)
        {
          double v305 = v258 - v411 + v305;
          double v290 = v423;
        }
        else
        {
          double v290 = v423;
          if (MaxY < v416) {
            double v305 = v305 + v416 - MaxY;
          }
        }
        double v292 = v419;
        double v294 = v305 - height;
      }
      goto LABEL_226;
    }
    v301 = [v299 controller];
    v302 = [v301 canvas];
    unsigned __int8 v303 = [v302 isAnchoredAtRight];

    if (v303)
    {
      double v304 = v410;
      double v293 = v421;
      double v306 = v431;
      double v305 = v433;
    }
    else
    {
      double v293 = v421;
      double v306 = v431;
      if (point_8 >= v257)
      {
        double v306 = v257 - point_8 + v431;
      }
      else if (point < v418)
      {
        id v308 = objc_loadWeakRetained((id *)&self->_canvasLayer);
        v309 = [v308 controller];
        v310 = [v309 canvas];
        unsigned __int8 v311 = [v310 isAnchoredAtRight];

        double v304 = v410;
        double v305 = v433;
        if ((v311 & 1) == 0) {
          double v306 = v431 + v418 - point;
        }
        goto LABEL_213;
      }
      double v304 = v410;
      double v305 = v433;
    }
LABEL_213:
    double v295 = v306 - width;
    goto LABEL_216;
  }
  double v290 = v423;
  double v291 = v425;
  double v292 = v419;
  double v293 = v421;
  double v295 = v431;
  double v294 = v433;
LABEL_226:
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7858);
  }
  v324 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v324, OS_LOG_TYPE_DEBUG))
  {
    *(_OWORD *)&transform.m11 = v473;
    *(_OWORD *)&transform.m13 = v474;
    transform.m21 = v295;
    transform.m22 = v294;
    NSStringFromCGAffineTransform((CGAffineTransform *)&transform);
    id v391 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v391;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v324, OS_LOG_TYPE_DEBUG, "adjustedTransform after horizontal and vertical clamping %@", (uint8_t *)&transform, 0xCu);
  }
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7878);
  }
  v325 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v325, OS_LOG_TYPE_DEBUG)) {
    sub_10107AEE8(v291, v290, v293, v292);
  }

  *(_OWORD *)&transform.m11 = v473;
  *(_OWORD *)&transform.m13 = v474;
  transform.m21 = v295;
  transform.m22 = v294;
  v512.origin.double x = v291;
  v512.origin.double y = v290;
  v512.size.double width = v293;
  v512.size.double height = v292;
  CGRect v513 = CGRectApplyAffineTransform(v512, (CGAffineTransform *)&transform);
  double v326 = v513.origin.x;
  double v327 = v513.origin.y;
  CGFloat v328 = v513.size.width;
  CGFloat v329 = v513.size.height;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7898);
  }
  v330 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v330, OS_LOG_TYPE_DEBUG))
  {
    v522.origin.double x = v326;
    v522.origin.double y = v327;
    v522.size.double width = v328;
    v522.size.double height = v329;
    NSStringFromCGRect(v522);
    id v392 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v392;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v330, OS_LOG_TYPE_DEBUG, "finalBounds adjusted by transform %@", (uint8_t *)&transform, 0xCu);
  }
  double v331 = sub_100064698(v326, v327, v443);
  double v333 = v332;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D78B8);
  }
  v334 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v334, OS_LOG_TYPE_DEBUG))
  {
    v523.origin.double x = v331;
    v523.origin.double y = v333;
    v523.size.double width = v328;
    v523.size.double height = v329;
    NSStringFromCGRect(v523);
    id v393 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v393;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v334, OS_LOG_TYPE_DEBUG, "finalBounds taking into account viewCenterInSuperlayer %@", (uint8_t *)&transform, 0xCu);
  }
  double v335 = sub_100064680(v331, v333, v434);
  CGFloat v337 = v336;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D78D8);
  }
  v338 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v338, OS_LOG_TYPE_DEBUG))
  {
    v524.origin.double x = v335;
    v524.origin.double y = v337;
    v524.size.double width = v328;
    v524.size.double height = v329;
    NSStringFromCGRect(v524);
    id v394 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v394;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v338, OS_LOG_TYPE_DEBUG, "finalBounds taking into account scaledContentOffset %@", (uint8_t *)&transform, 0xCu);
  }
  v514.origin.double x = v335;
  v514.origin.double y = v337;
  v514.size.double width = v328;
  v514.size.double height = v329;
  CGRect v515 = CGRectOffset(v514, v440, v438);
  double v339 = v515.origin.x;
  CGFloat v340 = v515.origin.y;
  CGFloat v341 = v515.size.width;
  CGFloat v342 = v515.size.height;
  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D78F8);
  }
  v343 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v343, OS_LOG_TYPE_DEBUG))
  {
    v525.origin.double x = v339;
    v525.origin.double y = v340;
    v525.size.double width = v341;
    v525.size.double height = v342;
    NSStringFromCGRect(v525);
    id v395 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138412290;
    *(void *)((char *)&transform.m11 + 4) = v395;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v343, OS_LOG_TYPE_DEBUG, "finalBounds taking into account canvasCenterOffset %@", (uint8_t *)&transform, 0xCu);
  }
  v344 = [v15 canvas];
  [v344 contentsScale];
  double v346 = sub_100067584(v339, v340, v341, v342, v345);
  double v348 = v347;
  CGFloat v350 = v349;
  CGFloat v352 = v351;

  if (qword_101719C78 != -1) {
    dispatch_once(&qword_101719C78, &stru_1014D7918);
  }
  double v353 = -v346;
  v354 = off_10166BBC0;
  if (os_log_type_enabled((os_log_t)v354, OS_LOG_TYPE_DEBUG))
  {
    v498.double x = -v346;
    v498.double y = -v348;
    NSStringFromCGPoint(v498);
    id v396 = (id)objc_claimAutoreleasedReturnValue();
    v526.origin.double x = v346;
    v526.origin.double y = v348;
    v526.size.double width = v350;
    v526.size.double height = v352;
    NSStringFromCGRect(v526);
    id v397 = (id)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)&transform.m11 = v473;
    *(_OWORD *)&transform.m13 = v474;
    transform.m21 = v295;
    transform.m22 = v294;
    NSStringFromCGAffineTransform((CGAffineTransform *)&transform);
    id v398 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(transform.m11) = 138413058;
    *(void *)((char *)&transform.m11 + 4) = v396;
    WORD2(transform.m12) = 2112;
    *(void *)((char *)&transform.m12 + 6) = v397;
    HIWORD(transform.m13) = 2048;
    transform.m14 = v435;
    LOWORD(transform.m21) = 2112;
    *(void *)((char *)&transform.m21 + 2) = v398;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v354, OS_LOG_TYPE_DEBUG, "final content offset %@ finalBounds %@ view scale %f transform %@", (uint8_t *)&transform, 0x2Au);
  }
  memset(&v472, 0, sizeof(v472));
  double v355 = sub_1000646A4(txb, tya, -1.0);
  *(_OWORD *)&transform.m11 = v473;
  *(_OWORD *)&transform.m13 = v474;
  transform.m21 = v295;
  transform.m22 = v294;
  sub_10007FCC0(&transform, &v472, v355, v356);
  memset(&transform, 0, sizeof(transform));
  *(_OWORD *)&t1.m11 = *(_OWORD *)&v472.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v472.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v472.tx;
  CATransform3DMakeAffineTransform(&transform, (CGAffineTransform *)&t1);
  transform.m33 = transform.m11;
  if ([(CRLCanvasZoomTracker *)self animateTransform])
  {
    id v357 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    v358 = v357;
    v18 = v446;
    double v359 = v436;
    if (v357) {
      [v357 transform];
    }
    else {
      memset(&b, 0, sizeof(b));
    }
    CATransform3D t1 = transform;
    BOOL v361 = CATransform3DEqualToTransform(&t1, &b);

    if (v361)
    {
      char v360 = 0;
    }
    else
    {
      CFTimeInterval v362 = CACurrentMediaTime();
      memset(&t1, 0, 48);
      id v363 = objc_loadWeakRetained((id *)&self->_canvasLayer);
      v364 = v363;
      if (v363) {
        [v363 transform];
      }
      else {
        memset(&v470, 0, sizeof(v470));
      }
      CATransform3DGetAffineTransform((CGAffineTransform *)&t1, &v470);

      v365 = [CRLDisplayLink alloc];
      v465[0] = _NSConcreteStackBlock;
      v465[1] = 3221225472;
      v465[2] = sub_10012186C;
      v465[3] = &unk_1014D7940;
      *(CFTimeInterval *)&v465[5] = v362;
      long long v466 = *(_OWORD *)&t1.m11;
      long long v467 = *(_OWORD *)&t1.m13;
      long long v468 = *(_OWORD *)&t1.m21;
      CGAffineTransform v469 = v472;
      v465[4] = self;
      v366 = [(CRLDisplayLink *)v365 initWithHandler:v465];
      [(CRLDisplayLink *)v366 setPaused:0];
      id v367 = objc_loadWeakRetained(location);
      [v367 canvasZoomTrackerWillBeginFinalZoomAnimation:self];

      v461[0] = _NSConcreteStackBlock;
      v461[1] = 3221225472;
      CATransform3D v463 = transform;
      v461[2] = sub_100121970;
      v461[3] = &unk_1014D7968;
      v461[4] = self;
      id v368 = v15;
      id v462 = v368;
      double v464 = v435;
      v369 = objc_retainBlock(v461);
      v455[0] = _NSConcreteStackBlock;
      v455[1] = 3221225472;
      v455[2] = sub_1001219E4;
      v455[3] = &unk_1014D7990;
      v370 = v366;
      v456 = v370;
      v457 = self;
      double v458 = v436;
      double v459 = v353;
      double v460 = -v348;
      v371 = objc_retainBlock(v455);
      [v368 beginAnimations:&stru_101538650];
      v372 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
      v373 = [v368 i_currentAnimation];
      [v373 setTimingFunction:v372];

      v374 = [v368 i_currentAnimation];
      [v374 setDuration:0.2];

      v375 = [v368 i_currentAnimation];
      [v375 setCompletionBlock:v371];

      ((void (*)(void *))v369[2])(v369);
      [v368 commitAnimations];

      char v360 = 1;
      v18 = v446;
    }
  }
  else
  {
    char v360 = 0;
    v18 = v446;
    double v359 = v436;
  }
  if (self->_isShowingZoomHUD)
  {
    BOOL gestureIsFastPinch = self->_gestureIsFastPinch;
    id v377 = objc_loadWeakRetained(location);
    v378 = v377;
    if (gestureIsFastPinch) {
      [v377 performSelector:"canvasZoomTrackerDidEndViewScaleFeedback:" withObject:self afterDelay:0.5];
    }
    else {
      [v377 canvasZoomTrackerDidEndViewScaleFeedback:self];
    }

    self->_isShowingZoomHUD = 0;
  }
  if ((v360 & 1) == 0) {
    -[CRLCanvasZoomTracker p_finishZoomWithFinalScaleFactor:contentOffset:](self, "p_finishZoomWithFinalScaleFactor:contentOffset:", v359, v353, -v348);
  }
LABEL_272:
}

- (void)p_finishZoomWithFinalScaleFactor:(double)a3 contentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  p_canvasLayer = &self->_canvasLayer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v10 = [WeakRetained associatedBackgroundLayer];
  long long v83 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v85 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v91[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v91[1] = v83;
  long long v81 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v91[2] = v81;
  [v10 setDynamicTransform:v91];

  id v11 = objc_loadWeakRetained((id *)p_canvasLayer);
  v12 = [v11 canvasView];

  id v13 = objc_loadWeakRetained((id *)p_canvasLayer);
  id v14 = [v13 controller];

  [v14 visibleUnscaledRect];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  id v23 = objc_loadWeakRetained((id *)p_canvasLayer);
  id v24 = v23;
  if (v23) {
    [v23 transform];
  }
  else {
    memset(&v88, 0, sizeof(v88));
  }
  CATransform3DGetAffineTransform(&v89, &v88);
  CGAffineTransformInvert(&v90, &v89);
  v92.origin.double x = v16;
  v92.origin.double y = v18;
  v92.size.CGFloat width = v20;
  v92.size.CGFloat height = v22;
  CGRect v93 = CGRectApplyAffineTransform(v92, &v90);
  CGFloat v25 = v93.origin.x;
  CGFloat v26 = v93.origin.y;
  CGFloat width = v93.size.width;
  CGFloat height = v93.size.height;

  id v29 = objc_loadWeakRetained((id *)p_canvasLayer);
  v87[0] = v85;
  v87[1] = v83;
  v87[2] = v81;
  [v29 setAffineTransform:v87];

  id v30 = objc_loadWeakRetained((id *)p_canvasLayer);
  [v30 setViewScale:a3];

  id v31 = objc_loadWeakRetained((id *)p_canvasLayer);
  v32 = [v31 controller];
  v33 = [v32 canvas];
  unsigned int v34 = [v33 isAnchoredAtRight];

  id v35 = objc_loadWeakRetained((id *)p_canvasLayer);
  id v36 = v35;
  if (v34)
  {
    [v35 contentInset];
    double v38 = y - v37;

    id v36 = objc_loadWeakRetained((id *)p_canvasLayer);
    [v36 contentInset];
    double v40 = x - v39;
  }
  else
  {
    [v35 bounds];
    double v40 = sub_100064680(x, y, v41);
    double v38 = v42;
  }

  double v43 = [v12 enclosingScrollView];
  double v86 = v38;
  double v84 = v40;
  if ([v14 shouldCanvasScrollingSizeGrowToFitBoardContent])
  {
    [v43 convertPoint:v12 toView:v40];
    double v45 = v44;
    double v47 = v46;
    [v43 adjustedContentInset];
    [v14 convertBoundsToUnscaledPoint:sub_100064698(v45, v47, v48)];
    double v80 = v50;
    double v82 = v49;
    self->_visibleUnscaledBoundsAtEndOfZoom.origin.double x = v49;
    self->_visibleUnscaledBoundsAtEndOfZoom.origin.double y = v50;
    self->_visibleUnscaledBoundsAtEndOfZoom.size.CGFloat width = width;
    self->_visibleUnscaledBoundsAtEndOfZoom.size.CGFloat height = height;
  }
  else
  {
    double v80 = v26;
    double v82 = v25;
  }
  [v43 adjustedContentInset];
  double v52 = v51;
  double v54 = v53;
  double v56 = -v55;
  double v58 = -v57;
  [v43 contentSize];
  double v60 = v59;
  double v62 = v61;
  double v63 = sub_100064070() - v54;
  double v65 = v64 - v52;
  double v67 = v66 - (v58 - v54);
  double v69 = v68 - (v56 - v52);
  [v43 scrollableAreaBounds];
  if (v70 <= v60) {
    double v72 = v70;
  }
  else {
    double v72 = v60;
  }
  if (v71 <= v62) {
    double v73 = v71;
  }
  else {
    double v73 = v62;
  }
  v94.origin.double x = v63;
  v94.origin.double y = v65;
  v94.size.CGFloat width = v67;
  v94.size.CGFloat height = v69;
  double MinX = CGRectGetMinX(v94);
  v95.origin.double x = v63;
  v95.origin.double y = v65;
  v95.size.CGFloat width = v67;
  v95.size.CGFloat height = v69;
  CGFloat MaxX = CGRectGetMaxX(v95);
  double v76 = sub_100407E48(v84, MinX, MaxX - v72);
  v96.origin.double x = v63;
  v96.origin.double y = v65;
  v96.size.CGFloat width = v67;
  v96.size.CGFloat height = v69;
  double MinY = CGRectGetMinY(v96);
  v97.origin.double x = v63;
  v97.origin.double y = v65;
  v97.size.CGFloat width = v67;
  v97.size.CGFloat height = v69;
  CGFloat MaxY = CGRectGetMaxY(v97);
  [v43 setContentOffset:v76, sub_100407E48(v86, MinY, MaxY - v73)];
  [v14 viewDidEndZooming];
  if ([v14 shouldCanvasScrollingSizeGrowToFitBoardContent]) {
    [v14 setContentOffset:0 scrollOptions:v82, v80];
  }
  [v14 i_recordUserViewScale];
  self->_isZooming = 0;
  id v79 = objc_loadWeakRetained((id *)&self->_delegate);
  [v79 canvasZoomTrackerDidFinish:self];
}

- (CRLCanvasZoomTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLCanvasZoomTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)alwaysUsesTranslationSprings
{
  return self->_alwaysUsesTranslationSprings;
}

- (void)setAlwaysUsesTranslationSprings:(BOOL)a3
{
  self->_alwaysUsesTranslationSprings = a3;
}

- (BOOL)fastPinchSnapsViewScale
{
  return self->_fastPinchSnapsViewScale;
}

- (void)setFastPinchSnapsViewScale:(BOOL)a3
{
  self->_fastPinchSnapsViewScale = a3;
}

- (BOOL)slowPinchSnapsViewScale
{
  return self->_slowPinchSnapsViewScale;
}

- (void)setSlowPinchSnapsViewScale:(BOOL)a3
{
  self->_slowPinchSnapsViewScale = a3;
}

- (BOOL)animateTransform
{
  return self->_animateTransform;
}

- (void)setAnimateTransform:(BOOL)a3
{
  self->_animateTransform = a3;
}

- (BOOL)currentlySnappingViewScale
{
  return self->_currentlySnappingViewScale;
}

- (BOOL)gestureIsFastPinch
{
  return self->_gestureIsFastPinch;
}

- (CGRect)visibleUnscaledBoundsAtEndOfZoom
{
  double x = self->_visibleUnscaledBoundsAtEndOfZoom.origin.x;
  double y = self->_visibleUnscaledBoundsAtEndOfZoom.origin.y;
  double width = self->_visibleUnscaledBoundsAtEndOfZoom.size.width;
  double height = self->_visibleUnscaledBoundsAtEndOfZoom.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_canvasLayer);
}

@end