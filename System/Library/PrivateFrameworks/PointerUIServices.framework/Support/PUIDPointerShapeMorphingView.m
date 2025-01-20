@interface PUIDPointerShapeMorphingView
- (PUIDPointerShapeMorphingView)initWithFrame:(CGRect)a3;
- (UIBezierPath)path;
- (void)_resetToStableStateWithPath:(id)a3;
- (void)dealloc;
- (void)setPath:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation PUIDPointerShapeMorphingView

- (PUIDPointerShapeMorphingView)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)PUIDPointerShapeMorphingView;
  v3 = -[PUIDPointerShapeMorphingView initWithFrame:](&v40, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = +[PUIDPointerDomain rootSettings];
    settings = v4->_settings;
    v4->_settings = (PUIDPointerSettings *)v5;

    id v7 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v11 = (UIView *)objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    filteredView = v4->_filteredView;
    v4->_filteredView = v11;

    v13 = +[CAFilter filterWithType:kCAFilterAlphaThreshold];
    v14 = +[CAFilter filterWithType:kCAFilterGaussianBlur];
    [v14 setValue:&off_100048138 forKey:kCAFilterInputRadius];
    v15 = [(UIView *)v4->_filteredView layer];
    v41[0] = v14;
    v41[1] = v13;
    v16 = +[NSArray arrayWithObjects:v41 count:2];
    [v15 setFilters:v16];

    v17 = [(UIView *)v4->_filteredView layer];
    [v17 setValue:&__kCFBooleanFalse forKeyPath:@"filters.alphaThreshold.enabled"];

    v18 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    containerView = v4->_containerView;
    v4->_containerView = v18;

    v20 = [(UIView *)v4->_containerView layer];
    [v20 setAllowsGroupBlending:0];

    [(UIView *)v4->_filteredView addSubview:v4->_containerView];
    v21 = -[PUIDShapeView initWithFrame:]([PUIDShapeView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    shapeView = v4->_shapeView;
    v4->_shapeView = v21;

    v23 = [(PUIDShapeView *)v4->_shapeView layer];
    uint64_t v24 = kCAFilterPlusL;
    [v23 setCompositingFilter:kCAFilterPlusL];

    [(UIView *)v4->_containerView addSubview:v4->_shapeView];
    v25 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    animationContainerView = v4->_animationContainerView;
    v4->_animationContainerView = v25;

    v27 = [(UIView *)v4->_animationContainerView layer];
    [v27 setAllowsGroupBlending:0];

    [(UIView *)v4->_filteredView addSubview:v4->_animationContainerView];
    v28 = -[PUIDShapeView initWithFrame:]([PUIDShapeView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    animationShapeView = v4->_animationShapeView;
    v4->_animationShapeView = v28;

    v30 = [(PUIDShapeView *)v4->_animationShapeView layer];
    [v30 setCompositingFilter:v24];

    [(UIView *)v4->_animationContainerView addSubview:v4->_animationShapeView];
    v31 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
    animationCircleView = v4->_animationCircleView;
    v4->_animationCircleView = v31;

    [(UIView *)v4->_animationCircleView _setCornerRadius:0.5];
    v33 = v4->_animationCircleView;
    v34 = [(PUIDShapeView *)v4->_animationShapeView fillColor];
    [(UIView *)v33 setBackgroundColor:v34];

    [(UIView *)v4->_animationCircleView setAlpha:0.0];
    v35 = [(UIView *)v4->_animationCircleView layer];
    [v35 setCompositingFilter:v24];

    [(UIView *)v4->_filteredView addSubview:v4->_animationCircleView];
    v36 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    animationSnapshotView = v4->_animationSnapshotView;
    v4->_animationSnapshotView = v36;

    v38 = [(UIView *)v4->_animationSnapshotView layer];
    [v38 setCompositingFilter:v24];

    [(UIView *)v4->_animationContainerView addSubview:v4->_animationSnapshotView];
    [(PUIDPointerShapeMorphingView *)v4 addSubview:v4->_filteredView];
  }
  return v4;
}

- (void)dealloc
{
  [(UIViewFloatAnimatableProperty *)self->_animatableProperty invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PUIDPointerShapeMorphingView;
  [(PUIDPointerShapeMorphingView *)&v3 dealloc];
}

- (void)setPath:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v8 = (UIBezierPath *)a3;
  id v9 = a5;
  path = self->_path;
  v185 = v8;
  if (path != v8 && ([(UIBezierPath *)path isEqual:v8] & 1) == 0)
  {
    v11 = (UIBezierPath *)[(UIBezierPath *)v8 copy];
    v12 = self->_path;
    self->_path = v11;

    os_unfair_lock_lock(&self->_lock);
    v169 = (void *)(self->_animationGenerationID + 1);
    self->_animationGenerationID = (unint64_t)v169;
    os_unfair_lock_unlock(&self->_lock);
    if (v6)
    {
      v161 = v9;
      [(UIBezierPath *)self->_path bounds];
      v167 = v14;
      v168 = v13;
      double v164 = v16;
      v166 = v15;
      location = (id *)&self->_animatableProperty;
      animatablePropertCGFloat y = self->_animatableProperty;
      val = self;
      v181 = animatableProperty;
      if (animatableProperty)
      {
        [(UIViewFloatAnimatableProperty *)animatableProperty presentationValue];
        double v177 = v18;
        v19 = [(PUIDShapeView *)self->_shapeView path];
        [v19 bounds];
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        v28 = [(PUIDShapeView *)self->_shapeView layer];
        v29 = [v28 presentationLayer];
        v30 = v29;
        if (v29) {
          [v29 affineTransform];
        }
        else {
          memset(&v242, 0, sizeof(v242));
        }
        v263.origin.CGFloat x = v21;
        v263.origin.CGFloat y = v23;
        v263.size.CGFloat width = v25;
        v263.size.CGFloat height = v27;
        CGRect v264 = CGRectApplyAffineTransform(v263, &v242);
        CGFloat x = v264.origin.x;
        CGFloat y = v264.origin.y;
        CGFloat obj = v264.size.width;
        CGFloat r1 = v264.size.height;

        v42 = [(PUIDShapeView *)self->_animationShapeView path];
        [v42 bounds];
        CGFloat v44 = v43;
        CGFloat v46 = v45;
        CGFloat v48 = v47;
        CGFloat v50 = v49;
        v51 = [(PUIDShapeView *)self->_animationShapeView layer];
        v52 = [v51 presentationLayer];
        v53 = v52;
        if (v52) {
          [v52 affineTransform];
        }
        else {
          memset(&v241, 0, sizeof(v241));
        }
        v265.origin.CGFloat x = v44;
        v265.origin.CGFloat y = v46;
        v265.size.CGFloat width = v48;
        v265.size.CGFloat height = v50;
        CGRect v266 = CGRectApplyAffineTransform(v265, &v241);
        CGFloat v54 = v266.origin.x;
        CGFloat v55 = v266.origin.y;
        CGFloat width = v266.size.width;
        CGFloat height = v266.size.height;

        v58 = [(UIView *)self->_animationCircleView layer];
        v59 = [v58 presentationLayer];
        [v59 frame];
        CGFloat v61 = v60;
        CGFloat v63 = v62;
        CGFloat v65 = v64;
        CGFloat v67 = v66;

        v267.origin.CGFloat x = x;
        v267.origin.CGFloat y = y;
        v267.size.CGFloat width = obj;
        v267.size.CGFloat height = r1;
        v272.origin.CGFloat x = v54;
        v272.origin.CGFloat y = v55;
        v272.size.CGFloat width = width;
        v272.size.CGFloat height = height;
        CGRect v268 = CGRectUnion(v267, v272);
        v273.origin.CGFloat x = v61;
        v273.origin.CGFloat y = v63;
        v273.size.CGFloat width = v65;
        v273.size.CGFloat height = v67;
        CGRect v269 = CGRectUnion(v268, v273);
        double v34 = v269.origin.x;
        double v36 = v269.origin.y;
        double v38 = v269.size.width;
        double v40 = v269.size.height;
        unint64_t v68 = vcvtpd_u64_f64(v269.size.width);
        v261[0] = IOSurfacePropertyKeyWidth;
        v69 = +[NSNumber numberWithUnsignedLong:v68];
        unint64_t v70 = vcvtpd_u64_f64(v40);
        v262[0] = v69;
        v261[1] = IOSurfacePropertyKeyHeight;
        v71 = +[NSNumber numberWithUnsignedLong:v70];
        v262[1] = v71;
        v261[2] = IOSurfacePropertyKeyBytesPerElement;
        v72 = +[NSNumber numberWithUnsignedLong:4];
        unint64_t v73 = (4 * v68 + 1020) & 0xFFFFFFFFFFFFFC00;
        v262[2] = v72;
        v261[3] = IOSurfacePropertyKeyBytesPerRow;
        v74 = +[NSNumber numberWithUnsignedLong:v73];
        v262[3] = v74;
        v262[4] = &off_100048150;
        v261[4] = IOSurfacePropertyKeyPixelFormat;
        v261[5] = IOSurfacePropertyKeyAllocSize;
        v75 = +[NSNumber numberWithUnsignedLong:v73 * v70];
        v262[5] = v75;
        v76 = +[NSDictionary dictionaryWithObjects:v262 forKeys:v261 count:6];

        id v41 = [objc_alloc((Class)IOSurface) initWithProperties:v76];
        if (v41)
        {
          v260[0] = kCASnapshotModeLayer;
          v259[0] = kCASnapshotMode;
          v259[1] = kCASnapshotDisplayName;
          v174 = +[CADisplay mainDisplay];
          v77 = [v174 name];
          v260[1] = v77;
          v260[2] = v41;
          v259[2] = kCASnapshotDestination;
          v259[3] = kCASnapshotTransform;
          CATransform3DMakeTranslation(&v240, -v34, -v36, 0.0);
          v78 = +[NSValue valueWithCATransform3D:&v240];
          v260[3] = v78;
          v259[4] = kCASnapshotContextId;
          v79 = [(PUIDPointerShapeMorphingView *)val layer];
          v80 = [v79 context];
          v81 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v80 contextId]);
          v260[4] = v81;
          v259[5] = kCASnapshotLayerId;
          v82 = [(UIView *)val->_filteredView layer];
          v83 = +[NSNumber numberWithUnsignedLongLong:v82];
          v260[5] = v83;
          v84 = +[NSDictionary dictionaryWithObjects:v260 forKeys:v259 count:6];

          CARenderServerSnapshot();
        }
        [*location invalidate];
        id v85 = *location;
        id *location = 0;
      }
      else
      {
        v32 = [(PUIDShapeView *)self->_shapeView path];
        [v32 bounds];
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;

        id v41 = 0;
        double v177 = 0.0;
      }
      id obja = objc_alloc_init((Class)UIViewFloatAnimatableProperty);
      objc_storeStrong(location, obja);
      [*location setValue:0.0];
      if (v181)
      {
        id v86 = *location;
        [(PUIDPointerSettings *)val->_settings customMorphInitialVelocityProgressMultiplier];
        [v86 setVelocity:(1.0 - v177) * v87];
      }
      v232[0] = _NSConcreteStackBlock;
      v232[1] = 3221225472;
      v232[2] = sub_10001DF94;
      v232[3] = &unk_1000452F8;
      BOOL v239 = v181 != 0;
      v232[4] = val;
      id v147 = v41;
      id v233 = v147;
      double v235 = v34;
      double v236 = v36;
      double v237 = v38;
      double v238 = v40;
      v234 = v185;
      +[UIView _performWithoutRetargetingAnimations:v232];
      if (v38 >= *(double *)&v166) {
        double v88 = *(double *)&v166;
      }
      else {
        double v88 = v38;
      }
      if (v38 >= *(double *)&v166) {
        double v89 = v38;
      }
      else {
        double v89 = *(double *)&v166;
      }
      if (v40 >= v164) {
        double v90 = v164;
      }
      else {
        double v90 = v40;
      }
      if (v40 >= v164) {
        double v91 = v40;
      }
      else {
        double v91 = v164;
      }
      double v92 = v89 * 0.3 + v88 * 0.7;
      double v93 = v91 * 0.3 + v90 * 0.7;
      v270.origin.CGFloat x = *(double *)&v168 * 0.5 + v34 * 0.5;
      v270.origin.CGFloat y = *(double *)&v167 * 0.5 + v36 * 0.5;
      v270.size.CGFloat width = *(double *)&v166 * 0.5 + v38 * 0.5;
      v270.size.CGFloat height = v164 * 0.5 + v40 * 0.5;
      double v148 = v93;
      double v149 = v92;
      CGRect v271 = CGRectInset(v270, (v270.size.width - v92) * 0.5, (v270.size.height - v93) * 0.5);
      CGFloat v94 = v271.origin.x;
      CGFloat v95 = v271.origin.y;
      double v96 = v271.size.width;
      double v97 = v271.size.height;
      v182 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
      long long v98 = *(_OWORD *)&CATransform3DIdentity.m33;
      long long v228 = *(_OWORD *)&CATransform3DIdentity.m31;
      long long v175 = v228;
      long long r1a = v98;
      long long v229 = v98;
      long long v155 = *(_OWORD *)&CATransform3DIdentity.m43;
      long long v230 = *(_OWORD *)&CATransform3DIdentity.m41;
      long long v157 = v230;
      long long v231 = v155;
      long long v152 = *(_OWORD *)&CATransform3DIdentity.m13;
      *(_OWORD *)&v226.a = *(_OWORD *)&CATransform3DIdentity.m11;
      long long v153 = *(_OWORD *)&v226.a;
      *(_OWORD *)&v226.c = v152;
      long long v150 = *(_OWORD *)&CATransform3DIdentity.m23;
      *(_OWORD *)&v226.tCGFloat x = *(_OWORD *)&CATransform3DIdentity.m21;
      long long v151 = *(_OWORD *)&v226.tx;
      long long v227 = v150;
      v99 = +[NSValue valueWithCATransform3D:&v226];
      v258[0] = v99;
      memset(&v226, 0, sizeof(v226));
      CGAffineTransformMakeTranslation(&v226, -v34, -v36);
      memset(&v247, 0, sizeof(v247));
      CGAffineTransformMakeScale(&v247, v96 / v38, v97 / v40);
      memset(&v246, 0, sizeof(v246));
      CGAffineTransformMakeTranslation(&v246, v94, v95);
      CGAffineTransform t1 = v247;
      CGAffineTransform t2 = v246;
      CGAffineTransformConcat(&v244, &t1, &t2);
      CGAffineTransform t2 = v226;
      CGAffineTransformConcat(&t1, &t2, &v244);
      CATransform3DMakeAffineTransform(&v225, &t1);
      v100 = +[NSValue valueWithCATransform3D:&v225];
      v258[1] = v100;
      v101 = +[NSArray arrayWithObjects:v258 count:2];
      [v182 setValues:v101];

      [v182 setKeyTimes:&off_100048300];
      v102 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
      v257 = v102;
      v103 = +[NSArray arrayWithObjects:&v257 count:1];
      [v182 setTimingFunctions:v103];

      [v182 setRemovedOnCompletion:0];
      [v182 setFillMode:kCAFillModeBoth];
      [v182 setDuration:1.0];
      v178 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
      memset(&v226, 0, sizeof(v226));
      CGAffineTransformMakeTranslation(&v226, -*(double *)&v168, -*(double *)&v167);
      memset(&v247, 0, sizeof(v247));
      CGAffineTransformMakeScale(&v247, v96 / *(double *)&v166, v97 / v164);
      memset(&v246, 0, sizeof(v246));
      CGAffineTransformMakeTranslation(&v246, v94, v95);
      CGAffineTransform t1 = v247;
      CGAffineTransform t2 = v246;
      CGAffineTransformConcat(&v244, &t1, &t2);
      CGAffineTransform t2 = v226;
      CGAffineTransformConcat(&t1, &t2, &v244);
      CATransform3DMakeAffineTransform(&v224, &t1);
      v104 = +[NSValue valueWithCATransform3D:&v224];
      v256[0] = v104;
      long long v228 = v175;
      long long v229 = r1a;
      long long v230 = v157;
      long long v231 = v155;
      *(_OWORD *)&v226.a = v153;
      *(_OWORD *)&v226.c = v152;
      *(_OWORD *)&v226.tCGFloat x = v151;
      long long v227 = v150;
      v105 = +[NSValue valueWithCATransform3D:&v226];
      v256[1] = v105;
      v106 = +[NSArray arrayWithObjects:v256 count:2];
      [v178 setValues:v106];

      [v178 setKeyTimes:&off_100048318];
      v107 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
      v255 = v107;
      v108 = +[NSArray arrayWithObjects:&v255 count:1];
      [v178 setTimingFunctions:v108];

      [v178 setRemovedOnCompletion:0];
      [v178 setFillMode:kCAFillModeBoth];
      [v178 setDuration:1.0];
      v176 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
      memset(&v226, 0, sizeof(v226));
      CGAffineTransformMakeTranslation(&v226, 0.5, 0.5);
      memset(&v247, 0, sizeof(v247));
      CGAffineTransformMakeScale(&v247, v38, v40);
      memset(&v246, 0, sizeof(v246));
      CGAffineTransformMakeTranslation(&v246, v34, v36);
      CGAffineTransform t1 = v247;
      CGAffineTransform t2 = v246;
      CGAffineTransformConcat(&v244, &t1, &t2);
      CGAffineTransform t2 = v226;
      CGAffineTransformConcat(&t1, &t2, &v244);
      CATransform3DMakeAffineTransform(&v223, &t1);
      v109 = +[NSValue valueWithCATransform3D:&v223];
      v254[0] = v109;
      memset(&v226, 0, sizeof(v226));
      CGAffineTransformMakeTranslation(&v226, 0.5, 0.5);
      memset(&v247, 0, sizeof(v247));
      CGAffineTransformMakeScale(&v247, v96, v97);
      memset(&v246, 0, sizeof(v246));
      CGAffineTransformMakeTranslation(&v246, v94, v95);
      CGAffineTransform t1 = v247;
      CGAffineTransform t2 = v246;
      CGAffineTransformConcat(&v244, &t1, &t2);
      CGAffineTransform t2 = v226;
      CGAffineTransformConcat(&t1, &t2, &v244);
      CATransform3DMakeAffineTransform(&v222, &t1);
      v110 = +[NSValue valueWithCATransform3D:&v222];
      v254[1] = v110;
      memset(&v226, 0, sizeof(v226));
      CGAffineTransformMakeTranslation(&v226, 0.5, 0.5);
      memset(&v247, 0, sizeof(v247));
      CGAffineTransformMakeScale(&v247, *(CGFloat *)&v166, v164);
      memset(&v246, 0, sizeof(v246));
      CGAffineTransformMakeTranslation(&v246, *(CGFloat *)&v168, *(CGFloat *)&v167);
      CGAffineTransform t1 = v247;
      CGAffineTransform t2 = v246;
      CGAffineTransformConcat(&v244, &t1, &t2);
      CGAffineTransform t2 = v226;
      CGAffineTransformConcat(&t1, &t2, &v244);
      CATransform3DMakeAffineTransform(&v221, &t1);
      v111 = +[NSValue valueWithCATransform3D:&v221];
      v254[2] = v111;
      v112 = +[NSArray arrayWithObjects:v254 count:3];
      [v176 setValues:v112];

      [v176 setKeyTimes:&off_100048330];
      v113 = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:");
      v253[0] = v113;
      v114 = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:");
      v253[1] = v114;
      v115 = +[NSArray arrayWithObjects:v253 count:2];
      [v176 setTimingFunctions:v115];

      [v176 setRemovedOnCompletion:0];
      [v176 setFillMode:kCAFillModeBoth];
      [v176 setDuration:1.0];
      v116 = +[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
      [v116 setValues:&off_100048348];
      [v116 setKeyTimes:&off_100048360];
      [v116 setRemovedOnCompletion:0];
      [v116 setFillMode:kCAFillModeBoth];
      [v116 setDuration:1.0];
      v117 = +[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
      [v117 setValues:&off_100048378];
      [v117 setKeyTimes:&off_100048390];
      v118 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
      v252 = v118;
      v119 = +[NSArray arrayWithObjects:&v252 count:1];
      [v117 setTimingFunctions:v119];

      [v117 setRemovedOnCompletion:0];
      [v117 setFillMode:kCAFillModeBoth];
      [v117 setDuration:1.0];
      v120 = +[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
      [v120 setValues:&off_1000483A8];
      [v120 setKeyTimes:&off_1000483C0];
      v121 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
      v251 = v121;
      v122 = +[NSArray arrayWithObjects:&v251 count:1];
      [v120 setTimingFunctions:v122];

      [v120 setRemovedOnCompletion:0];
      [v120 setFillMode:kCAFillModeBoth];
      [v120 setDuration:1.0];
      v123 = +[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
      [v123 setValues:&off_1000483D8];
      [v123 setRemovedOnCompletion:0];
      [v123 setFillMode:kCAFillModeBoth];
      [v123 setDuration:1.0];
      v124 = +[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
      [v124 setValues:&off_1000483F0];
      [v124 setRemovedOnCompletion:0];
      [v124 setFillMode:kCAFillModeBoth];
      [v124 setDuration:1.0];
      if (v149 >= v148) {
        double v125 = v148;
      }
      else {
        double v125 = v149;
      }
      v126 = +[CAKeyframeAnimation animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
      v250[0] = &off_100048138;
      v127 = +[NSNumber numberWithDouble:v125 * 0.2];
      v250[1] = v127;
      v250[2] = &off_100048138;
      v128 = +[NSArray arrayWithObjects:v250 count:3];
      [v126 setValues:v128];

      v129 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
      v249[0] = v129;
      v130 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
      v249[1] = v130;
      v131 = +[NSArray arrayWithObjects:v249 count:2];
      [v126 setTimingFunctions:v131];

      [v126 setDuration:1.0];
      objc_initWeak((id *)&v226, val);
      v210[0] = _NSConcreteStackBlock;
      v210[1] = 3221225472;
      v210[2] = sub_10001E0F8;
      v210[3] = &unk_100045320;
      objc_copyWeak(&v220, (id *)&v226);
      id v183 = v182;
      id v211 = v183;
      id v132 = v178;
      id v212 = v132;
      id v179 = v176;
      id v213 = v179;
      id v133 = v116;
      id v214 = v133;
      id v134 = v117;
      id v215 = v134;
      id v135 = v120;
      id v216 = v135;
      id v136 = v123;
      id v217 = v136;
      id v137 = v124;
      id v218 = v137;
      id v138 = v126;
      id v219 = v138;
      v208[0] = _NSConcreteStackBlock;
      v208[1] = 3221225472;
      v208[2] = sub_10001E904;
      v208[3] = &unk_100045210;
      v139 = objc_retainBlock(v210);
      id v209 = v139;
      +[UIView _performWithoutRetargetingAnimations:v208];
      objc_initWeak((id *)&v247, obja);
      id v248 = *location;
      v140 = +[NSArray arrayWithObjects:&v248 count:1];
      v204[0] = _NSConcreteStackBlock;
      v204[1] = 3221225472;
      v204[2] = sub_10001E91C;
      v204[3] = &unk_100045348;
      objc_copyWeak(&v206, (id *)&v226);
      v207[1] = v169;
      objc_copyWeak(v207, (id *)&v247);
      v165 = v139;
      id v205 = v165;
      v192[0] = _NSConcreteStackBlock;
      v192[1] = 3221225472;
      v192[2] = sub_10001E9D4;
      v192[3] = &unk_100045370;
      objc_copyWeak(&v202, (id *)&v226);
      v203[1] = v169;
      objc_copyWeak(v203, (id *)&v247);
      id v154 = v183;
      id v193 = v154;
      id v141 = v132;
      id v194 = v141;
      id v156 = v179;
      id v195 = v156;
      id v158 = v133;
      id v196 = v158;
      id v180 = v134;
      id v197 = v180;
      id v184 = v135;
      id v198 = v184;
      id v142 = v136;
      id v199 = v142;
      id v143 = v137;
      id v200 = v143;
      id v144 = v138;
      id v201 = v144;
      +[UIView _createTransformerWithInputAnimatableProperties:v140 modelValueSetter:v204 presentationValueSetter:v192];

      v145 = [(PUIDPointerSettings *)val->_settings customShapeMorphAnimationSettings];
      v190[0] = _NSConcreteStackBlock;
      v190[1] = 3221225472;
      v190[2] = sub_10001EEF0;
      v190[3] = &unk_100045190;
      id v191 = obja;
      v186[0] = _NSConcreteStackBlock;
      v186[1] = 3221225472;
      v186[2] = sub_10001EEFC;
      v186[3] = &unk_100045398;
      id v146 = v191;
      id v187 = v146;
      objc_copyWeak(v189, (id *)&v226);
      v189[1] = v169;
      id v188 = v161;
      +[UIView _animateUsingSpringBehavior:v145 tracking:0 animations:v190 completion:v186];

      objc_destroyWeak(v189);
      objc_destroyWeak(v203);
      objc_destroyWeak(&v202);

      objc_destroyWeak(v207);
      objc_destroyWeak(&v206);
      objc_destroyWeak((id *)&v247);

      objc_destroyWeak(&v220);
      objc_destroyWeak((id *)&v226);

      id v9 = v161;
      goto LABEL_36;
    }
    [(UIViewFloatAnimatableProperty *)self->_animatableProperty invalidate];
    v31 = self->_animatableProperty;
    self->_animatablePropertCGFloat y = 0;

    [(PUIDPointerShapeMorphingView *)self _resetToStableStateWithPath:v8];
  }
  if (v9) {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
LABEL_36:
}

- (void)_resetToStableStateWithPath:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F084;
  v4[3] = &unk_100044C88;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[UIView _performWithoutRetargetingAnimations:v4];
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_shapeView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_filteredView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_animationSnapshotView, 0);
  objc_storeStrong((id *)&self->_animationShapeView, 0);
  objc_storeStrong((id *)&self->_animationContainerView, 0);
  objc_storeStrong((id *)&self->_animationCircleView, 0);
  objc_storeStrong((id *)&self->_animatableProperty, 0);
}

@end