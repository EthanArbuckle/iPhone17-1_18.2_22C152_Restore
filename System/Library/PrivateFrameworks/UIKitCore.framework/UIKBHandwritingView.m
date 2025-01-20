@interface UIKBHandwritingView
- ($89C9DF7554150EC42DA90319EED2ADED)previousPoint;
- (BOOL)cancelTouchTracking;
- (BOOL)endStrokeWithTouches:(id)a3 event:(id)a4;
- (BOOL)initialPointPosted;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldAllowSelectionGestures:(BOOL)a3;
- (BOOL)shouldCache;
- (CGColor)inkColor;
- (CGImage)inkMask;
- (NSMutableArray)currentPoints;
- (NSMutableArray)interpolatedPoints;
- (NSMutableSet)activeTouches;
- (UIBezierPath)currentPath;
- (UIDelayedAction)nextPageTimer;
- (UIKBHandwritingBezierPathPointFIFO)bezierPathFIFO;
- (UIKBHandwritingBoxcarFilterPointFIFO)smoothingFIFO;
- (UIKBHandwritingInputSpeedModel)inputSpeedModel;
- (UIKBHandwritingQuadCurvePointFIFO)interpolatingFIFO;
- (UIKBHandwritingStrokePointFIFO)strokeFIFO;
- (UIKBHandwritingStrokeView)strokeView;
- (UIKBHandwritingView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (UIView)snapshotView;
- (double)inkWidth;
- (double)pageOffset;
- (id)layerForRenderFlags:(int64_t)a3;
- (unint64_t)numberOfStrokes;
- (void)addInkPoint:(CGPoint)a3 value:(double)a4;
- (void)cancelPageOffsetTimer;
- (void)clearAndNotify:(BOOL)a3;
- (void)clearTouches;
- (void)dealloc;
- (void)deleteStrokesAtIndexes:(id)a3;
- (void)didMoveToWindow;
- (void)displayLayer:(id)a3;
- (void)layoutSubviews;
- (void)log;
- (void)pageOffsetTimerFired;
- (void)recreateInkMaskIfNeeded;
- (void)send;
- (void)setActiveTouches:(id)a3;
- (void)setBezierPathFIFO:(id)a3;
- (void)setCurrentPath:(id)a3;
- (void)setCurrentPoints:(id)a3;
- (void)setInitialPointPosted:(BOOL)a3;
- (void)setInkColor:(CGColor *)a3;
- (void)setInkMask:(CGImage *)a3;
- (void)setInkWidth:(double)a3;
- (void)setInputSpeedModel:(id)a3;
- (void)setInterpolatedPoints:(id)a3;
- (void)setInterpolatingFIFO:(id)a3;
- (void)setNextPageTimer:(id)a3;
- (void)setPageOffset:(double)a3;
- (void)setPreviousPoint:(id *)a3;
- (void)setRenderConfig:(id)a3;
- (void)setSmoothingFIFO:(id)a3;
- (void)setSnapshotView:(id)a3;
- (void)setStrokeFIFO:(id)a3;
- (void)setStrokeView:(id)a3;
- (void)startFadeOutAnimation;
- (void)touchPageOffsetTimer;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateForKeyplane:(id)a3 key:(id)a4;
- (void)updateInkColor;
@end

@implementation UIKBHandwritingView

- (UIKBHandwritingView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v71.receiver = self;
  v71.super_class = (Class)UIKBHandwritingView;
  v13 = -[UIKBKeyView initWithFrame:keyplane:key:](&v71, sel_initWithFrame_keyplane_key_, v11, v12, x, y, width, height);
  v14 = v13;
  if (!v13) {
    goto LABEL_20;
  }
  [(UIKBHandwritingView *)v13 setInkMask:0];
  [(UIView *)v14 setOpaque:0];
  [(UIView *)v14 setClipsToBounds:1];
  [(UIView *)v14 setEnabled:1];
  v15 = objc_alloc_init(UIKBHandwritingInputSpeedModel);
  [(UIKBHandwritingView *)v14 setInputSpeedModel:v15];

  [(UIView *)v14 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(UIKBHandwritingView *)v14 inputSpeedModel];
  objc_msgSend(v24, "setHandwritingFrame:", v17, v19, v21, v23);

  v25 = [MEMORY[0x1E4F1CA80] set];
  [(UIKBHandwritingView *)v14 setActiveTouches:v25];

  [(UIView *)v14 setMultipleTouchEnabled:0];
  v26 = +[UIDevice currentDevice];
  uint64_t v27 = [v26 userInterfaceIdiom];
  double v28 = 2.7;
  if (!v27) {
    double v28 = 2.5;
  }
  [(UIKBHandwritingView *)v14 setInkWidth:v28];

  [(UIKBHandwritingView *)v14 updateInkColor];
  v29 = [UIKBHandwritingStrokeView alloc];
  [(UIView *)v14 bounds];
  v30 = -[UIView initWithFrame:](v29, "initWithFrame:");
  [(UIView *)v30 setUserInteractionEnabled:0];
  [(UIView *)v30 setOpaque:0];
  [(UIKBHandwritingStrokeView *)v30 setKeyView:v14];
  [(UIView *)v30 setContentMode:5];
  [(UIView *)v14 addSubview:v30];
  [(UIKBHandwritingView *)v14 setStrokeView:v30];
  [(UIKBHandwritingView *)v14 recreateInkMaskIfNeeded];
  v31 = [MEMORY[0x1E4F1CA48] array];
  [(UIKBHandwritingView *)v14 setInterpolatedPoints:v31];

  char v32 = [MEMORY[0x1E4F22448] isCurrentProcessAnApplicationExtension];
  v33 = +[UIDevice currentDevice];
  if (([v33 _supportsForceTouch] & 1) == 0)
  {
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      char v40 = +[UIDevice _isLowEnd] | v32;

      if ((v40 & 1) == 0) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    objc_initWeak(&location, v14);
    [(UIKBHandwritingView *)v14 inkWidth];
    v42 = v41;
    v43 = [[UIKBHandwritingBezierPathPointFIFO alloc] initWithFIFO:0];
    [(UIKBHandwritingView *)v14 setBezierPathFIFO:v43];

    uint64_t v64 = MEMORY[0x1E4F143A8];
    objc_copyWeak(v66, &location);
    v66[1] = v42;
    v65 = v30;
    v44 = [(UIKBHandwritingView *)v14 bezierPathFIFO];
    [v44 setEmissionHandler:&v64];

    objc_destroyWeak(v66);
    objc_destroyWeak(&location);
    goto LABEL_12;
  }

LABEL_6:
  v34 = [MEMORY[0x1E4F1CA48] array];
  [(UIKBHandwritingView *)v14 setCurrentPoints:v34];
  v35 = [UIKBHandwritingQuadCurvePointFIFO alloc];
  v36 = +[UIScreen mainScreen];
  [v36 scale];
  v37 = -[UIKBHandwritingQuadCurvePointFIFO initWithFIFO:scale:](v35, "initWithFIFO:scale:", 0);
  [(UIKBHandwritingView *)v14 setInterpolatingFIFO:v37];

  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __50__UIKBHandwritingView_initWithFrame_keyplane_key___block_invoke;
  v68[3] = &unk_1E52F9CD0;
  id v38 = v34;
  id v69 = v38;
  v70 = v30;
  v39 = [(UIKBHandwritingView *)v14 interpolatingFIFO];
  [v39 setEmissionHandler:v68];

LABEL_12:
  v45 = [UIKBHandwritingBoxcarFilterPointFIFO alloc];
  v46 = [(UIKBHandwritingView *)v14 bezierPathFIFO];
  v47 = v46;
  if (!v46)
  {
    v47 = [(UIKBHandwritingView *)v14 interpolatingFIFO];
  }
  v48 = [(UIKBHandwritingBoxcarFilterPointFIFO *)v45 initWithFIFO:v47 width:3];
  [(UIKBHandwritingView *)v14 setSmoothingFIFO:v48];

  if (!v46) {
  v49 = [UIKBHandwritingStrokePointFIFO alloc];
  }
  v50 = [(UIKBHandwritingView *)v14 smoothingFIFO];
  v51 = [(UIKBHandwritingStrokePointFIFO *)v49 initWithFIFO:v50];
  [(UIKBHandwritingView *)v14 setStrokeFIFO:v51];

  v52 = [(UIKBKeyView *)v14 factory];
  v53 = [(UIKBKeyView *)v14 key];
  v54 = [(UIKBKeyView *)v14 keyplane];
  v55 = [v52 traitsForKey:v53 onKeyplane:v54];

  v56 = [v55 geometry];
  [v56 roundRectRadius];
  double v58 = v57;

  if (v58 != 0.0)
  {
    v59 = [v55 geometry];
    uint64_t v60 = [v59 roundRectCorners] & 0xF;

    if (v60)
    {
      v61 = [(UIView *)v14 layer];
      [v61 setCornerRadius:v58];
    }
  }
  v62 = v14;

LABEL_20:
  return v14;
}

void __50__UIKBHandwritingView_initWithFrame_keyplane_key___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) lastObject];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      v9 = v4;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        objc_msgSend(v10, "UIKBHandwritingPointValue", (void)v18);
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        if (v9)
        {
          double v17 = *(void **)(a1 + 40);
          [v9 UIKBHandwritingPointValue];
          objc_msgSend(v17, "addTrapezoidFromFirstPoint:secondPoint:");
        }
        [*(id *)(a1 + 32) addObject:v10];
        objc_msgSend(*(id *)(a1 + 40), "addHandwritingPoint:", v12, v14, v16);
        id v4 = v10;

        ++v8;
        v9 = v4;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 40) displayAggregateInvalidRect];
}

void __50__UIKBHandwritingView_initWithFrame_keyplane_key___block_invoke_2(uint64_t a1, void *a2)
{
  id v40 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if ([v40 count] == 1)
    {
      uint64_t v8 = [v40 objectAtIndexedSubscript:0];
      [v8 CGPointValue];
      double v10 = v9;
      double v11 = *(double *)(a1 + 48);
      double v12 = [v40 objectAtIndexedSubscript:0];
      [v12 CGPointValue];
      double x = v10 + v11 * -0.5;
      double width = *(double *)(a1 + 48);
      double y = v13 + width * -0.5;

      double height = width;
    }
    else if ((unint64_t)[v40 count] >= 2)
    {
      double v14 = [v40 objectAtIndexedSubscript:0];
      [v14 CGPointValue];
      double v16 = v15;
      double v18 = v17;

      long long v19 = [v40 objectAtIndexedSubscript:1];
      [v19 CGPointValue];
      double v21 = v20;
      double v23 = v22;

      double v24 = v16 >= v21 ? v21 : v16;
      double v25 = *(double *)(a1 + 48);
      double v26 = v18 >= v23 ? v23 : v18;
      double x = v24 - v25 * 0.5;
      double y = v26 - v25 * 0.5;
      double width = vabdd_f64(v21, v16) + v25;
      double height = vabdd_f64(v23, v18) + v25;
      if ([v40 count] == 3)
      {
        uint64_t v27 = [v40 objectAtIndexedSubscript:2];
        [v27 CGPointValue];
        double v29 = v28;
        double v31 = v30;

        if (v21 >= v29) {
          double v32 = v29;
        }
        else {
          double v32 = v21;
        }
        double v33 = *(double *)(a1 + 48);
        double v34 = v32 - v33 * 0.5;
        if (v23 >= v31) {
          double v35 = v31;
        }
        else {
          double v35 = v23;
        }
        double v36 = v35 - v33 * 0.5;
        double v37 = vabdd_f64(v29, v21) + v33;
        double v38 = vabdd_f64(v31, v23) + v33;
        v42.origin.double x = x;
        v42.origin.double y = y;
        v42.size.double width = width;
        v42.size.double height = height;
        CGRect v43 = CGRectUnion(v42, *(CGRect *)&v34);
        double x = v43.origin.x;
        double y = v43.origin.y;
        double width = v43.size.width;
        double height = v43.size.height;
      }
    }
    [WeakRetained pageOffset];
    objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplayInRect:", x - v39, y, width, height);
  }
}

- (void)recreateInkMaskIfNeeded
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIKBHandwritingView *)self strokeView];
  [v3 bounds];
  double v71 = v5;
  double v72 = v4;
  double v7 = v6;
  CGFloat v9 = v8;

  sdouble x = UIKBScale();
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v14 = [&unk_1ED3EFF20 countByEnumeratingWithState:&v74 objects:v78 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v75;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v75 != v15) {
          objc_enumerationMutation(&unk_1ED3EFF20);
        }
        uint64_t v17 = *(void *)(*((void *)&v74 + 1) + 8 * v16);
        double v18 = [(UIKBKeyView *)self keyplane];
        long long v19 = [v18 firstCachedKeyWithName:v17];

        if (v19)
        {
          [v19 frame];
          v91.origin.double x = v20;
          v91.origin.double y = v21;
          v91.size.CGFloat width = v22;
          v91.size.CGFloat height = v23;
          v80.origin.double x = x;
          v80.origin.double y = y;
          v80.size.CGFloat width = width;
          v80.size.CGFloat height = height;
          CGRect v81 = CGRectUnion(v80, v91);
          double x = v81.origin.x;
          double y = v81.origin.y;
          CGFloat width = v81.size.width;
          CGFloat height = v81.size.height;
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [&unk_1ED3EFF20 countByEnumeratingWithState:&v74 objects:v78 count:16];
    }
    while (v14);
  }
  double v24 = [(UIKBKeyView *)self key];
  [v24 frame];
  double v26 = v25;

  uint64_t v27 = [(UIKBKeyView *)self key];
  [v27 frame];
  double v29 = v28;

  double v30 = x - v26;
  double v31 = y - v29;
  v82.origin.double x = v30;
  v82.origin.double y = v31;
  v82.size.CGFloat width = width;
  v82.size.CGFloat height = height;
  if (CGRectIsEmpty(v82)) {
    return;
  }
  v83.size.CGFloat height = v71;
  v83.origin.double x = v72;
  v83.origin.double y = v7;
  v83.size.CGFloat width = v9;
  v92.origin.double x = v30;
  v92.origin.double y = v31;
  v92.size.CGFloat width = width;
  v92.size.CGFloat height = height;
  if (!CGRectIntersectsRect(v83, v92)) {
    return;
  }
  v84.size.CGFloat height = v71;
  v84.origin.double x = v72;
  v84.origin.double y = v7;
  v84.size.CGFloat width = v9;
  v93.origin.double x = v30;
  v93.origin.double y = v31;
  v93.size.CGFloat width = width;
  v93.size.CGFloat height = height;
  CGRect v85 = CGRectIntersection(v84, v93);
  CGFloat v32 = v85.origin.x;
  CGFloat v33 = v85.origin.y;
  CGFloat v34 = v85.size.width;
  double v35 = v85.size.height;
  double v36 = +[UIKeyboardImpl activeInstance];
  uint64_t v37 = [v36 currentHandBias];

  double v38 = [(UIKBKeyView *)self screenTraits];
  if ([v38 idiom] != 1)
  {
    double v39 = [(UIKBKeyView *)self screenTraits];
    if ([v39 idiom] != 24)
    {
      id v40 = [(UIKBKeyView *)self screenTraits];
      if ([v40 idiom] != 25)
      {
        v41 = [(UIKBKeyView *)self screenTraits];
        if ([v41 idiom] != 26)
        {
          v67 = [(UIKBKeyView *)self screenTraits];
          BOOL v69 = [v67 idiom] == 23 || v37 != 0;

          if (!v69) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
      }
    }
  }
LABEL_20:
  CGFloat v32 = 0.0;
  CGFloat v34 = v9;
LABEL_21:
  v86.size.CGFloat height = v35 + v35;
  v86.origin.double x = v32;
  v86.origin.double y = v33;
  v86.size.CGFloat width = v34;
  CGRect v87 = CGRectOffset(v86, -v72, -v7);
  CGFloat v42 = v87.origin.x;
  CGFloat v43 = v87.origin.y;
  CGFloat v44 = v87.size.width;
  CGFloat v45 = v87.size.height;
  inkMask = self->_inkMask;
  if (!inkMask) {
    goto LABEL_26;
  }
  double v47 = (double)CGImageGetHeight(inkMask) - v71 * sx;
  if (v47 < 0.0) {
    double v47 = -v47;
  }
  if (v47 >= 1.0)
  {
    CFRelease(self->_inkMask);
    self->_inkMask = 0;
LABEL_26:
    self->_inkMask = UIKBCreateFadeClipImage(1, 0, v72, v7, v9, v71, v42, v43, v44, v45, 1.0);
    if (v37)
    {
      v48 = +[UIKeyboardImpl activeInstance];
      v49 = [v48 _layout];
      [v49 biasedKeyboardWidthRatio];
      double v51 = v50;

      double v52 = v9 * (1.0 - v51);
      double v54 = v71;
      double v53 = v72;
      double v55 = v7;
      CGFloat v56 = v9;
      if (v37 == 2)
      {
        double v57 = CGRectGetWidth(*(CGRect *)&v53);
        v88.size.CGFloat height = v71;
        v88.origin.double x = v72;
        v88.origin.double y = v7;
        v88.size.CGFloat width = v9;
        CGFloat v58 = CGRectGetHeight(v88);
        double v59 = v57 - v52;
      }
      else
      {
        CGFloat v58 = CGRectGetHeight(*(CGRect *)&v53);
        double v59 = 0.0;
      }
      uint64_t v60 = UIKBCreateFadeClipImage(v37 == 1, 1, v72, v7, v9, v71, v59, 0.0, v52, v58, 1.0);
      p_inkMask = &self->_inkMask;
      size_t v62 = CGImageGetWidth(self->_inkMask);
      size_t v63 = CGImageGetHeight(self->_inkMask);
      uint64_t v64 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DCA0]);
      v65 = CGBitmapContextCreate(0, v62, v63, 8uLL, v62, v64, 0);
      CGAffineTransformMakeScale(&transform, sx, sx);
      CGContextConcatCTM(v65, &transform);
      v89.size.CGFloat height = v71;
      v89.origin.double x = v72;
      v89.origin.double y = v7;
      v89.size.CGFloat width = v9;
      CGContextClipToMask(v65, v89, *p_inkMask);
      v90.size.CGFloat height = v71;
      v90.origin.double x = v72;
      v90.origin.double y = v7;
      v90.size.CGFloat width = v9;
      CGContextDrawImage(v65, v90, v60);
      CGImageRef Image = CGBitmapContextCreateImage(v65);
      CGContextRelease(v65);
      CGColorSpaceRelease(v64);
      CGImageRelease(v60);
      CGImageRelease(*p_inkMask);
      *p_inkMask = Image;
    }
  }
}

- (id)layerForRenderFlags:(int64_t)a3
{
  char v3 = a3;
  v28.receiver = self;
  v28.super_class = (Class)UIKBHandwritingView;
  double v5 = -[UIKBKeyView layerForRenderFlags:](&v28, sel_layerForRenderFlags_);
  double v6 = v5;
  if (v3)
  {
    [v5 setContentsScaling:*MEMORY[0x1E4F39E38]];
    double v7 = [(UIKBKeyView *)self key];
    [v7 originalFrame];
    double v9 = v8;

    double v10 = [(UIKBKeyView *)self key];
    [v10 frame];
    double v12 = v11;

    if (v12 >= 1.0)
    {
      if (v12 <= v9) {
        double height = 1.0;
      }
      else {
        double height = v9 / v12;
      }
      if (v6)
      {
        [v6 affineTransform];
        if (v27 < 0.0)
        {
          long long v23 = *(_OWORD *)-[UIKBHandwritingView layerForRenderFlags:]::invertTransform;
          long long v24 = *(_OWORD *)&-[UIKBHandwritingView layerForRenderFlags:]::invertTransform[16];
          CGAffineTransform v26 = *(CGAffineTransform *)-[UIKBHandwritingView layerForRenderFlags:]::invertTransform;
          long long v22 = *(_OWORD *)&-[UIKBHandwritingView layerForRenderFlags:]::invertTransform[32];
          v30.origin.double x = 0.0;
          v30.origin.double y = 0.0;
          v30.size.double width = 1.0;
          v30.size.double height = height;
          CGRect v31 = CGRectApplyAffineTransform(v30, &v26);
          double x = v31.origin.x;
          double y = v31.origin.y;
          double width = v31.size.width;
          double height = v31.size.height;
          CGAffineTransform v25 = *(CGAffineTransform *)-[UIKBHandwritingView layerForRenderFlags:]::invertTransform;
          v31.origin.double y = 0.99;
          v31.size.double height = 0.01;
          v31.origin.double x = 0.0;
          v31.size.double width = 1.0;
          CGRect v32 = CGRectApplyAffineTransform(v31, &v25);
          double v17 = v32.origin.x;
          double v18 = v32.origin.y;
          double v19 = v32.size.width;
          double v20 = v32.size.height;
LABEL_12:
          objc_msgSend(v6, "setContentsRect:", x, y, width, height, v22, v23, v24);
          objc_msgSend(v6, "setContentsCenter:", v17, v18, v19, v20);
          goto LABEL_13;
        }
        double v17 = 0.0;
        double v19 = 1.0;
        double v18 = 0.99;
        double v20 = 0.01;
      }
      else
      {
        double v17 = 0.0;
        double v19 = 1.0;
        double v18 = 0.99;
        double v20 = 0.01;
      }
      double width = 1.0;
      double y = 0.0;
      double x = 0.0;
      goto LABEL_12;
    }
  }
LABEL_13:
  return v6;
}

- (void)displayLayer:(id)a3
{
  id v4 = a3;
  [(UIKBHandwritingView *)self recreateInkMaskIfNeeded];
  v5.receiver = self;
  v5.super_class = (Class)UIKBHandwritingView;
  [(UIKBKeyView *)&v5 displayLayer:v4];
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)UIKBHandwritingView;
  [(UIView *)&v17 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(UIKBHandwritingView *)self strokeView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  if (v6 < v13) {
    double v6 = v13;
  }
  uint64_t v14 = [(UIKBHandwritingView *)self strokeView];
  objc_msgSend(v14, "setFrame:", v9, v11, v4, v6);

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v16.receiver = self;
  v16.super_class = (Class)UIKBHandwritingView;
  uint64_t v15 = [(UIKBKeyView *)&v16 layerForRenderFlags:1];
  [(UIView *)self bounds];
  objc_msgSend(v15, "setFrame:");
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)dealloc
{
  inkMask = self->_inkMask;
  if (inkMask) {
    CGImageRelease(inkMask);
  }
  [(UIKBHandwritingView *)self cancelPageOffsetTimer];
  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingView;
  [(UIKBKeyView *)&v4 dealloc];
}

- (void)log
{
  v2 = [(UIKBHandwritingView *)self strokeFIFO];
  id v3 = [v2 strokes];
  if (![v3 numberOfStrokes]) {
    goto LABEL_20;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateFormat:@"%Y-%m-%d-%H%M%S"];
  double v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = [v4 stringFromDate:v5];

  long long v22 = (void *)v6;
  if (geteuid())
  {
    NSHomeDirectory();
    double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v7 = &stru_1ED0E84C0;
  }
  double v8 = [(__CFString *)v7 stringByAppendingPathComponent:@"/Library/Logs/CrashReporter/HandwritingCapture/"];

  double v9 = [NSString stringWithFormat:@"Capture_%@.log", v6];
  double v10 = [v8 stringByAppendingPathComponent:v9];

  id v11 = v10;
  double v12 = fopen((const char *)[v11 UTF8String], "w+");
  if (!v12)
  {
    if (*__error() != 2
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          double v18 = objc_claimAutoreleasedReturnValue(),
          v19 = [v18 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0], v18, !v19)|| (double v12 = fopen((const char *)objc_msgSend(v11, "UTF8String"), "w+")) == 0)
    {
LABEL_19:

LABEL_20:
      return;
    }
  }
  for (unint64_t i = 0; i < [v3 numberOfStrokes]; ++i)
  {
    for (unint64_t j = 0; j < [v3 numberOfPointsInStrokeAtIndex:i]; ++j)
    {
      [v3 pointAtIndex:j inStrokeAtIndex:i];
      fprintf(v12, "%d %d\n", (int)v15, (int)v16);
    }
    fwrite(";\n", 2uLL, 1uLL, v12);
  }
  fclose(v12);
  uint64_t v24 = 0;
  CGAffineTransform v25 = &v24;
  uint64_t v26 = 0x2020000000;
  objc_super v17 = (void (*)(uint64_t))_MergedGlobals_3_18;
  double v27 = _MergedGlobals_3_18;
  if (!_MergedGlobals_3_18)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = ___ZL40getAudioServicesPlaySystemSoundSymbolLocv_block_invoke;
    v23[3] = &unk_1E52EC7E8;
    v23[4] = &v24;
    ___ZL40getAudioServicesPlaySystemSoundSymbolLocv_block_invoke(v23);
    objc_super v17 = (void (*)(uint64_t))v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (v17)
  {
    v17(1108);
    goto LABEL_19;
  }
  double v20 = [MEMORY[0x1E4F28B00] currentHandler];
  CGFloat v21 = [NSString stringWithUTF8String:"void __AudioServicesPlaySystemSound(SystemSoundID)"];
  objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"UIKBHandwritingView.mm", 44, @"%s", dlerror());

  __break(1u);
}

- (void)touchPageOffsetTimer
{
  id v3 = [(UIKBHandwritingView *)self nextPageTimer];
  if (!v3)
  {
    id v8 = [(UIKBHandwritingView *)self inputSpeedModel];
    int v4 = [v8 autoConfirmationEnabled];

    if (!v4) {
      goto LABEL_10;
    }
    id v9 = [(UIKBHandwritingView *)self inputSpeedModel];
    [v9 timeoutForNextPage];
    double v6 = v5;

    id v10 = +[UIDevice currentDevice];
    char v7 = [v10 userInterfaceIdiom] == 1
      && !+[UIKeyboardImpl isFloating];

    if (v6 <= 0.0 || (v7 & 1) != 0) {
      goto LABEL_10;
    }
    id v11 = [[UIDelayedAction alloc] initWithTarget:self action:sel_pageOffsetTimerFired userInfo:0 delay:v6];
    -[UIKBHandwritingView setNextPageTimer:](self, "setNextPageTimer:");
    id v3 = v11;
  }

LABEL_10:
  id v12 = [(UIKBHandwritingView *)self nextPageTimer];
  [v12 touch];
}

- (void)cancelPageOffsetTimer
{
  id v3 = [(UIKBHandwritingView *)self nextPageTimer];
  [v3 cancel];

  int v4 = [(UIKBHandwritingView *)self nextPageTimer];
  [v4 setTarget:0];

  [(UIKBHandwritingView *)self setNextPageTimer:0];
}

- (void)pageOffsetTimerFired
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIKBHandwritingView *)self inputSpeedModel];
  [v3 endCharacter];

  [(UIKBHandwritingView *)self startFadeOutAnimation];
  int v4 = [(UIKBHandwritingView *)self bezierPathFIFO];

  if (v4)
  {
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    r1[0] = *(double *)MEMORY[0x1E4F1DB20];
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    memset(&r1[1], 0, 32);
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = [(UIKBHandwritingView *)self interpolatedPoints];
    uint64_t v9 = [v8 countByEnumeratingWithState:&r1[1] objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = **(void **)&r1[3];
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (**(void **)&r1[3] != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*(void *)&r1[2] + 8 * v11) bounds];
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          [(UIKBHandwritingView *)self inkWidth];
          double v21 = v20;
          [(UIKBHandwritingView *)self inkWidth];
          CGFloat v23 = v22 * -0.5;
          v34.origin.double x = v13;
          v34.origin.CGFloat y = v15;
          v34.size.double width = v17;
          v34.size.CGFloat height = v19;
          CGRect v37 = CGRectInset(v34, v21 * -0.5, v23);
          v35.origin.double x = r1[0];
          v35.origin.CGFloat y = y;
          v35.size.double width = width;
          v35.size.CGFloat height = height;
          CGRect v36 = CGRectUnion(v35, v37);
          r1[0] = v36.origin.x;
          CGFloat y = v36.origin.y;
          double width = v36.size.width;
          CGFloat height = v36.size.height;
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&r1[1] objects:v32 count:16];
      }
      while (v9);
    }

    [(UIKBHandwritingView *)self pageOffset];
    [(UIKBHandwritingView *)self setPageOffset:r1[0] + width + v24];
    CGAffineTransform v25 = [(UIKBHandwritingView *)self strokeView];
    [v25 setNeedsDisplay];
  }
  else
  {
    [(UIKBHandwritingView *)self pageOffset];
    [(UIKBHandwritingView *)self setPageOffset:v26 + 10000.0];
    double v27 = [(UIKBHandwritingView *)self strokeView];
    objc_super v28 = [(UIKBHandwritingView *)self strokeView];
    [v28 bounds];
    objc_msgSend(v27, "clearRect:");
  }
  [(UIKBHandwritingView *)self cancelPageOffsetTimer];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingView;
  [(UIView *)&v4 didMoveToWindow];
  id v3 = [(UIView *)self window];

  if (!v3) {
    [(UIKBHandwritingView *)self cancelPageOffsetTimer];
  }
}

- (void)startFadeOutAnimation
{
  id v3 = [(UIKBHandwritingView *)self snapshotView];

  if (v3)
  {
    objc_super v4 = [(UIKBHandwritingView *)self snapshotView];
    [v4 removeFromSuperview];
  }
  double v5 = [(UIView *)self snapshotViewAfterScreenUpdates:0];
  [(UIKBHandwritingView *)self setSnapshotView:v5];

  double v6 = [(UIKBHandwritingView *)self snapshotView];
  [v6 setUserInteractionEnabled:0];

  char v7 = [(UIKBHandwritingView *)self snapshotView];
  [(UIView *)self addSubview:v7];

  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__UIKBHandwritingView_startFadeOutAnimation__block_invoke;
  v9[3] = &unk_1E52F9D20;
  v9[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__UIKBHandwritingView_startFadeOutAnimation__block_invoke_2;
  v8[3] = &unk_1E52F9D48;
  +[UIView animateWithDuration:v9 animations:v8 completion:0.25];
}

void __44__UIKBHandwritingView_startFadeOutAnimation__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) snapshotView];
  [v1 setAlpha:0.0];
}

void __44__UIKBHandwritingView_startFadeOutAnimation__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) snapshotView];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setSnapshotView:0];
  id v3 = [*(id *)(a1 + 32) inputSpeedModel];
  [v3 endCharacter];
}

- (BOOL)shouldCache
{
  return 0;
}

- (void)setRenderConfig:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKBKeyView *)self renderConfig];
  if (v5)
  {
    double v6 = [(UIKBKeyView *)self renderConfig];
    int v7 = [v6 whiteText];
    int v8 = v7 ^ [v4 whiteText];
  }
  else
  {
    int v8 = 1;
  }

  v10.receiver = self;
  v10.super_class = (Class)UIKBHandwritingView;
  [(UIKBKeyView *)&v10 setRenderConfig:v4];
  if (v8) {
    [(UIKBHandwritingView *)self updateInkColor];
  }
  uint64_t v9 = [(UIKBHandwritingView *)self strokeView];
  [v9 setNeedsDisplay];
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  [(UIKBHandwritingView *)self updateInkColor];
  [(UIKBHandwritingView *)self clearAndNotify:0];
}

- (void)updateInkColor
{
  id v5 = [(UIKBKeyView *)self renderConfig];
  if ([v5 whiteText]) {
    +[UIColor whiteColor];
  }
  else {
  id v3 = +[UIColor blackColor];
  }
  -[UIKBHandwritingView setInkColor:](self, "setInkColor:", [v3 CGColor]);

  id v4 = [(UIKBHandwritingView *)self bezierPathFIFO];

  if (!v4)
  {
    id v6 = [(UIKBHandwritingView *)self strokeView];
    [v6 updateInkColor];
  }
}

- (void)clearAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(UIKBHandwritingView *)self inputSpeedModel];
  [v9 endCharacter];

  id v10 = [(UIKBHandwritingView *)self inputSpeedModel];
  [v10 updatePreferences];

  [(UIKBHandwritingView *)self setPageOffset:0.0];
  [(UIKBHandwritingView *)self cancelPageOffsetTimer];
  id v11 = [(UIKBHandwritingView *)self strokeFIFO];
  [v11 clear];

  id v12 = [(UIKBHandwritingView *)self interpolatedPoints];
  [v12 removeAllObjects];

  id v5 = [(UIKBHandwritingView *)self bezierPathFIFO];

  if (v5)
  {
    [(UIKBHandwritingView *)self setCurrentPath:0];
    id v13 = [(UIKBHandwritingView *)self strokeView];
    [v13 setNeedsDisplay];
  }
  else
  {
    id v14 = [(UIKBHandwritingView *)self currentPoints];
    [v14 removeAllObjects];

    id v13 = [(UIKBHandwritingView *)self strokeView];
    id v6 = [(UIKBHandwritingView *)self strokeView];
    [v6 bounds];
    objc_msgSend(v13, "clearRect:");
  }
  if (v3)
  {
    id v15 = +[UIKeyboardImpl activeInstance];
    [v15 clearInput];
    int v7 = [(UIKBHandwritingView *)self strokeFIFO];
    int v8 = [v7 strokes];
    [v15 addInputObject:v8];
  }
}

- (void)deleteStrokesAtIndexes:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(UIKBHandwritingView *)self cancelPageOffsetTimer];
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    for (unint64_t i = [v4 lastIndex]; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = objc_msgSend(v4, "indexLessThanIndex:", i))
    {
      id v10 = [(UIKBHandwritingView *)self interpolatedPoints];
      if (i >= [v10 count])
      {

LABEL_18:
        NSLog(&cfstr_SInvalidStroke.isa, "-[UIKBHandwritingView deleteStrokesAtIndexes:]", v4);
        CGFloat v43 = [(UIKBHandwritingView *)self strokeView];
        [v43 bounds];
        double x = v44;
        double y = v45;
        double width = v46;
        double height = v47;

        [(UIKBHandwritingView *)self clearAndNotify:0];
        break;
      }
      id v11 = [(UIKBHandwritingView *)self strokeFIFO];
      id v12 = [v11 strokes];
      BOOL v13 = i < [v12 numberOfStrokes];

      if (!v13) {
        goto LABEL_18;
      }
      id v14 = [(UIKBHandwritingView *)self bezierPathFIFO];
      BOOL v15 = v14 == 0;

      if (v15)
      {
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        double v29 = [(UIKBHandwritingView *)self interpolatedPoints];
        long long v30 = [v29 objectAtIndexedSubscript:i];

        uint64_t v31 = [v30 countByEnumeratingWithState:&v55 objects:v59 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v56 != v32) {
                objc_enumerationMutation(v30);
              }
              CGRect v34 = *(void **)(*((void *)&v55 + 1) + 8 * j);
              CGRect v35 = [(UIKBHandwritingView *)self strokeView];
              [v34 UIKBHandwritingPointValue];
              objc_msgSend(v35, "handwritingPointToRect:");
              v69.origin.double x = v36;
              v69.origin.double y = v37;
              v69.size.double width = v38;
              v69.size.double height = v39;
              v64.origin.double x = x;
              v64.origin.double y = y;
              v64.size.double width = width;
              v64.size.double height = height;
              CGRect v65 = CGRectUnion(v64, v69);
              double x = v65.origin.x;
              double y = v65.origin.y;
              double width = v65.size.width;
              double height = v65.size.height;
            }
            uint64_t v31 = [v30 countByEnumeratingWithState:&v55 objects:v59 count:16];
          }
          while (v31);
        }

        v66.origin.double x = x;
        v66.origin.double y = y;
        v66.size.double width = width;
        v66.size.double height = height;
        CGRect v67 = CGRectInset(v66, -0.200000003, -0.200000003);
        double x = v67.origin.x;
        double y = v67.origin.y;
        double width = v67.size.width;
        double height = v67.size.height;
      }
      else
      {
        double v16 = [(UIKBHandwritingView *)self interpolatedPoints];
        CGFloat v17 = [v16 objectAtIndex:i];
        [v17 bounds];
        CGFloat rect = v18;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        [(UIKBHandwritingView *)self inkWidth];
        double v26 = v25;
        [(UIKBHandwritingView *)self inkWidth];
        CGFloat v28 = v27 * -0.5;
        v61.origin.double x = v20;
        v61.origin.double y = v22;
        v61.size.double width = v24;
        v61.size.double height = rect;
        CGRect v68 = CGRectInset(v61, v26 * -0.5, v28);
        v62.origin.double x = x;
        v62.origin.double y = y;
        v62.size.double width = width;
        v62.size.double height = height;
        CGRect v63 = CGRectUnion(v62, v68);
        double x = v63.origin.x;
        double y = v63.origin.y;
        double width = v63.size.width;
        double height = v63.size.height;
      }
      id v40 = [(UIKBHandwritingView *)self interpolatedPoints];
      [v40 removeObjectAtIndex:i];

      v41 = [(UIKBHandwritingView *)self strokeFIFO];
      CGFloat v42 = [v41 strokes];
      [v42 removeStrokeAtIndex:i];
    }
    [(UIKBHandwritingView *)self pageOffset];
    double v49 = v48;
    double v50 = [(UIKBHandwritingView *)self bezierPathFIFO];
    BOOL v51 = v50 == 0;

    double v52 = x - v49;
    [(UIKBHandwritingView *)self strokeView];
    if (v51) {
      double v53 = {;
    }
      objc_msgSend(v53, "clearRect:", v52, y, width, height);
    }
    else {
      double v53 = {;
    }
      objc_msgSend(v53, "setNeedsDisplayInRect:", v52, y, width, height);
    }
  }
}

- (void)send
{
  BOOL v3 = [(UIKBHandwritingView *)self strokeFIFO];
  id v4 = [v3 strokes];
  uint64_t v5 = [v4 numberOfStrokes];

  if (v5)
  {
    [(UIView *)self bounds];
    double v6 = 1.0;
    if (v7 > 0.0)
    {
      [(UIView *)self bounds];
      double v6 = 1000.0 / v8;
    }
    id v9 = [(UIKBHandwritingView *)self strokeFIFO];
    id v11 = [v9 scaleStrokes:v6];

    id v10 = +[UIKeyboardImpl activeInstance];
    [v10 addInputObject:v11];
  }
}

- (void)addInkPoint:(CGPoint)a3 value:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  id v10 = [(UIKBHandwritingView *)self strokeFIFO];
  objc_msgSend(v10, "addPoint:", x, y, a4);

  double v8 = [(UIKBHandwritingView *)self bezierPathFIFO];

  if (v8)
  {
    id v11 = [(UIKBHandwritingView *)self bezierPathFIFO];
    id v9 = [v11 path];
    [(UIKBHandwritingView *)self setCurrentPath:v9];
  }
  id v12 = +[UIKeyboardImpl activeInstance];
  [v12 updateIdleDetection:0];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v18 = a3;
  uint64_t v5 = [(UIKBHandwritingView *)self inputSpeedModel];
  [v5 beginStroke];

  double v6 = [(UIKBHandwritingView *)self activeTouches];
  [v6 unionSet:v18];

  double v7 = [v18 anyObject];
  [v7 locationInView:self];
  double v9 = v8;
  double v11 = v10;
  id v12 = [(UIKBHandwritingView *)self inputSpeedModel];
  [v7 timestamp];
  objc_msgSend(v12, "addPoint:timestamp:", v9, v11, v13);

  [(UIKBHandwritingView *)self pageOffset];
  double v15 = v14;
  [v7 force];
  double v17 = v16;
  [(UIKBHandwritingView *)self setInitialPointPosted:0];
  -[UIKBHandwritingView setPreviousPoint:](self, "setPreviousPoint:", v9 + v15, v11, v17);
  [(UIKBHandwritingView *)self cancelPageOffsetTimer];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)[v6 mutableCopy];
  double v9 = [(UIKBHandwritingView *)self activeTouches];
  [v8 intersectSet:v9];

  id v10 = v8;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v11 = objc_msgSend(v10, "anyObject", 0);
  id v12 = [v7 coalescedTouchesForTouch:v11];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v12);
        }
        double v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v16 locationInView:self];
        double v18 = v17;
        double v20 = v19;
        double v21 = [(UIKBHandwritingView *)self inputSpeedModel];
        [v16 timestamp];
        objc_msgSend(v21, "addPoint:timestamp:", v18, v20, v22);

        [(UIKBHandwritingView *)self pageOffset];
        double v24 = v23;
        [v16 force];
        double v26 = v25;
        if (![(UIKBHandwritingView *)self initialPointPosted])
        {
          [(UIKBHandwritingView *)self previousPoint];
          -[UIKBHandwritingView addInkPoint:value:](self, "addInkPoint:value:");
          [(UIKBHandwritingView *)self setInitialPointPosted:1];
        }
        double v27 = v18 + v24;
        -[UIKBHandwritingView addInkPoint:value:](self, "addInkPoint:value:", v27, v20, v26);
        -[UIKBHandwritingView setPreviousPoint:](self, "setPreviousPoint:", v27, v20, v26);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  [(UIKBHandwritingView *)self cancelPageOffsetTimer];
}

- (BOOL)endStrokeWithTouches:(id)a3 event:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UIKBHandwritingView *)self activeTouches];
  char v9 = [v6 isSubsetOfSet:v8];

  id v10 = [(UIKBHandwritingView *)self activeTouches];
  [v10 minusSet:v6];

  if (v9)
  {
    if (![(UIKBHandwritingView *)self initialPointPosted])
    {
      [(UIKBHandwritingView *)self previousPoint];
      double v12 = v11;
      double v14 = v13;
      [(UIKBHandwritingView *)self previousPoint];
      [(UIKBHandwritingView *)self addInkPoint:v12 value:v14];
      [(UIKBHandwritingView *)self setInitialPointPosted:1];
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    double v15 = objc_msgSend(v6, "anyObject", 0);
    double v16 = [v7 coalescedTouchesForTouch:v15];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v16);
          }
          double v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          [v20 locationInView:self];
          double v22 = v21;
          double v24 = v23;
          double v25 = [(UIKBHandwritingView *)self inputSpeedModel];
          [v20 timestamp];
          objc_msgSend(v25, "addPoint:timestamp:", v22, v24, v26);

          [(UIKBHandwritingView *)self pageOffset];
          double v28 = v27;
          [v20 force];
          double v30 = v29;
          [(UIKBHandwritingView *)self previousPoint];
          double v31 = v22 + v28;
          -[UIKBHandwritingView addInkPoint:value:](self, "addInkPoint:value:", v31, v24, v32 * 0.5);
          -[UIKBHandwritingView setPreviousPoint:](self, "setPreviousPoint:", v31, v24, v30);
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v17);
    }

    [(UIKBHandwritingStrokePointFIFO *)self->_strokeFIFO flush];
    uint64_t v33 = [(UIKBHandwritingView *)self bezierPathFIFO];
    BOOL v34 = v33 == 0;

    interpolatedPoints = self->_interpolatedPoints;
    if (v34)
    {
      CGFloat v39 = (void *)[(NSMutableArray *)self->_currentPoints copy];
      [(NSMutableArray *)interpolatedPoints addObject:v39];

      [(NSMutableArray *)self->_currentPoints removeAllObjects];
    }
    else
    {
      CGFloat v36 = [(UIKBHandwritingView *)self bezierPathFIFO];
      CGFloat v37 = [v36 path];
      CGFloat v38 = (void *)[v37 copy];
      [(NSMutableArray *)interpolatedPoints addObject:v38];

      [(UIKBHandwritingView *)self setCurrentPath:0];
    }
    id v40 = [(UIKBHandwritingView *)self inputSpeedModel];
    [v40 endStroke];

    [(UIKBHandwritingView *)self touchPageOffsetTimer];
  }

  return v9;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(UIKBHandwritingView *)self endStrokeWithTouches:v7 event:v6]) {
    [(UIKBHandwritingView *)self send];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(UIKBHandwritingView *)self endStrokeWithTouches:a3 event:a4])
  {
    id v6 = [(UIKBHandwritingStrokePointFIFO *)self->_strokeFIFO strokes];
    uint64_t v5 = [v6 numberOfStrokes];

    if (v5)
    {
      id v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v5 - 1];
      -[UIKBHandwritingView deleteStrokesAtIndexes:](self, "deleteStrokesAtIndexes:");
    }
  }
}

- (unint64_t)numberOfStrokes
{
  id v2 = [(UIKBHandwritingView *)self strokeFIFO];
  BOOL v3 = [v2 strokes];
  unint64_t v4 = [v3 numberOfStrokes];

  return v4;
}

- (BOOL)shouldAllowSelectionGestures:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UIKBHandwritingView *)self bezierPathFIFO];

  BOOL v6 = 1;
  if (v3 && !v5)
  {
    if ((unint64_t)[(NSMutableArray *)self->_currentPoints count] <= 0xF)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v7 = self->_currentPoints;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        id v9 = 0;
        uint64_t v10 = *(void *)v23;
        double v11 = 0.0;
        while (2)
        {
          uint64_t v12 = 0;
          double v13 = v9;
          do
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            double v14 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
            if (v13)
            {
              objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v12), "UIKBHandwritingPointValue", (void)v22);
              double v16 = v15;
              double v18 = v17;
              [v13 UIKBHandwritingPointValue];
              double v11 = v11 + hypot(v16 - v19, v18 - v20);
              if (v11 > 15.0)
              {
                BOOL v6 = 0;
                goto LABEL_17;
              }
            }
            id v9 = v14;

            ++v12;
            double v13 = v9;
          }
          while (v8 != v12);
          uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v8) {
            continue;
          }
          break;
        }
        BOOL v6 = 1;
        double v13 = v9;
      }
      else
      {
        double v13 = 0;
        BOOL v6 = 1;
      }
LABEL_17:
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (void)clearTouches
{
  id v2 = [(UIKBHandwritingView *)self activeTouches];
  [v2 removeAllObjects];
}

- (BOOL)cancelTouchTracking
{
  [(UIKBHandwritingStrokePointFIFO *)self->_strokeFIFO flush];
  BOOL v3 = [(UIKBHandwritingView *)self bezierPathFIFO];

  interpolatedPoints = self->_interpolatedPoints;
  if (v3)
  {
    uint64_t v5 = [(UIKBHandwritingView *)self bezierPathFIFO];
    BOOL v6 = [v5 path];
    id v7 = (void *)[v6 copy];
    [(NSMutableArray *)interpolatedPoints addObject:v7];

    [(UIKBHandwritingView *)self setCurrentPath:0];
  }
  else
  {
    uint64_t v8 = (void *)[(NSMutableArray *)self->_currentPoints copy];
    [(NSMutableArray *)interpolatedPoints addObject:v8];

    [(NSMutableArray *)self->_currentPoints removeAllObjects];
  }
  v10.receiver = self;
  v10.super_class = (Class)UIKBHandwritingView;
  return [(UIView *)&v10 cancelTouchTracking];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(UIView *)self superview];
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = [(UIKBKeyView *)self keyplane];
  double v14 = [v13 firstCachedKeyWithName:@"Delete-Key"];

  if (v14 && ([v14 frame], v24.x = v10, v24.double y = v12, CGRectContainsPoint(v26, v24)))
  {
    BOOL v15 = 0;
  }
  else
  {
    double v16 = [(UIKBKeyView *)self keyplane];
    double v17 = [v16 firstCachedKeyWithName:@"Candidate-Selection"];

    if (!v17) {
      goto LABEL_8;
    }
    [v17 frame];
    v25.double x = v10;
    v25.double y = v12;
    if (!CGRectContainsPoint(v27, v25)) {
      goto LABEL_8;
    }
    double v18 = +[UIKeyboardImpl activeInstance];
    double v19 = [v18 candidateController];
    double v20 = [v19 candidateResultSet];
    char v21 = [v20 hasCandidates];

    if (v21)
    {
      BOOL v15 = 0;
    }
    else
    {
LABEL_8:
      v23.receiver = self;
      v23.super_class = (Class)UIKBHandwritingView;
      BOOL v15 = -[UIView pointInside:withEvent:](&v23, sel_pointInside_withEvent_, v7, x, y);
    }
  }
  return v15;
}

- (double)inkWidth
{
  return self->_inkWidth;
}

- (void)setInkWidth:(double)a3
{
  self->_inkWidth = a3;
}

- (CGColor)inkColor
{
  return self->_inkColor;
}

- (void)setInkColor:(CGColor *)a3
{
  self->_inkColor = a3;
}

- (CGImage)inkMask
{
  return self->_inkMask;
}

- (void)setInkMask:(CGImage *)a3
{
  self->_inkMask = a3;
}

- (NSMutableArray)interpolatedPoints
{
  return self->_interpolatedPoints;
}

- (void)setInterpolatedPoints:(id)a3
{
}

- (UIBezierPath)currentPath
{
  return self->_currentPath;
}

- (void)setCurrentPath:(id)a3
{
}

- (NSMutableArray)currentPoints
{
  return self->_currentPoints;
}

- (void)setCurrentPoints:(id)a3
{
}

- (UIKBHandwritingStrokePointFIFO)strokeFIFO
{
  return self->_strokeFIFO;
}

- (void)setStrokeFIFO:(id)a3
{
}

- (UIKBHandwritingBoxcarFilterPointFIFO)smoothingFIFO
{
  return self->_smoothingFIFO;
}

- (void)setSmoothingFIFO:(id)a3
{
}

- (UIKBHandwritingQuadCurvePointFIFO)interpolatingFIFO
{
  return self->_interpolatingFIFO;
}

- (void)setInterpolatingFIFO:(id)a3
{
}

- (UIKBHandwritingBezierPathPointFIFO)bezierPathFIFO
{
  return self->_bezierPathFIFO;
}

- (void)setBezierPathFIFO:(id)a3
{
}

- (UIKBHandwritingStrokeView)strokeView
{
  return self->_strokeView;
}

- (void)setStrokeView:(id)a3
{
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (NSMutableSet)activeTouches
{
  return self->_activeTouches;
}

- (void)setActiveTouches:(id)a3
{
}

- (BOOL)initialPointPosted
{
  return self->_initialPointPosted;
}

- (void)setInitialPointPosted:(BOOL)a3
{
  self->_initialPointPosted = a3;
}

- ($89C9DF7554150EC42DA90319EED2ADED)previousPoint
{
  return self;
}

- (void)setPreviousPoint:(id *)a3
{
  self->_previousPoint.point.double x = v3;
  self->_previousPoint.point.double y = v4;
  self->_previousPoint.force = v5;
}

- (double)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(double)a3
{
  self->_pageOffset = a3;
}

- (UIDelayedAction)nextPageTimer
{
  return self->_nextPageTimer;
}

- (void)setNextPageTimer:(id)a3
{
}

- (UIKBHandwritingInputSpeedModel)inputSpeedModel
{
  return self->_inputSpeedModel;
}

- (void)setInputSpeedModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSpeedModel, 0);
  objc_storeStrong((id *)&self->_nextPageTimer, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_strokeView, 0);
  objc_storeStrong((id *)&self->_bezierPathFIFO, 0);
  objc_storeStrong((id *)&self->_interpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_smoothingFIFO, 0);
  objc_storeStrong((id *)&self->_strokeFIFO, 0);
  objc_storeStrong((id *)&self->_currentPoints, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_interpolatedPoints, 0);
}

@end