@interface CRLCanvasHUDController
+ (CRLCanvasHUDController)sharedHUDController;
- (CGFloat)p_HUDFrame:(CGFloat)a3 offset:(CGFloat)a4 fromTouchRect:(CGFloat)a5 insideRect:(double)a6 overlap:(double)a7 shift:(double)a8;
- (CGRect)p_frameForHUDWithSize:(CGSize)a3 anchoredAtPoint:(CGPoint)a4 insideRect:(CGRect)a5;
- (CGRect)p_touchRectForHUDWithFrame:(CGRect)a3;
- (CRLCanvasHUDController)init;
- (NSString)crlaxLastStringSet;
- (id)hudView;
- (void)dealloc;
- (void)hideHUDForKey:(id)a3;
- (void)loadView;
- (void)p_commonInit;
- (void)p_displayText:(id)a3;
- (void)p_hideHUD;
- (void)p_labelTextTimerFired;
- (void)p_layoutUpdatingOffset:(BOOL)a3;
- (void)p_setHidden:(BOOL)a3;
- (void)p_showHUDAtPoint:(CGPoint)a3 inCanvasView:(id)a4 withNudge:(CGSize)a5 size:(unint64_t)a6 anchorPoint:(CGPoint)a7;
- (void)setLabelText:(id)a3;
- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withNudge:(CGSize)a6 size:(unint64_t)a7;
- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withNudge:(CGSize)a6 size:(unint64_t)a7 anchorPoint:(CGPoint)a8;
- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withUpwardsNudge:(double)a6;
- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withUpwardsNudge:(double)a6 size:(unint64_t)a7;
@end

@implementation CRLCanvasHUDController

- (void)p_commonInit
{
  v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  objectsShowingHUD = self->_objectsShowingHUD;
  self->_objectsShowingHUD = v3;
}

- (void)dealloc
{
  [(NSTimer *)self->_stringTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasHUDController;
  [(CRLCanvasHUDController *)&v3 dealloc];
}

+ (CRLCanvasHUDController)sharedHUDController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002727FC;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A9558 != -1) {
    dispatch_once(&qword_1016A9558, block);
  }
  v2 = (void *)qword_1016A9550;

  return (CRLCanvasHUDController *)v2;
}

- (void)setLabelText:(id)a3
{
  id v12 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  if (v5 - self->_lastTimeUpdated >= 0.05)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    self->_lastTimeUpdated = v10;
    if ([v12 length])
    {
      objc_storeStrong((id *)&self->_lastStringSet, a3);
      [(CRLCanvasHUDController *)self p_displayText:v12];
    }
  }
  else
  {
    stringTimer = self->_stringTimer;
    if (stringTimer)
    {
      [(NSTimer *)stringTimer invalidate];
      v7 = self->_stringTimer;
      self->_stringTimer = 0;
    }
    v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:"p_labelTextTimerFired" selector:0 userInfo:0 repeats:0.200000003];
    v9 = self->_stringTimer;
    self->_stringTimer = v8;

    objc_storeStrong((id *)&self->_lastStringSet, a3);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);

  if (WeakRetained) {
    [(CRLCanvasHUDController *)self p_layoutUpdatingOffset:0];
  }
}

- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withUpwardsNudge:(double)a6
{
}

- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withUpwardsNudge:(double)a6 size:(unint64_t)a7
{
}

- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withNudge:(CGSize)a6 size:(unint64_t)a7
{
}

- (void)showHUDForKey:(id)a3 forTouchPoint:(CGPoint)a4 inCanvasView:(id)a5 withNudge:(CGSize)a6 size:(unint64_t)a7 anchorPoint:(CGPoint)a8
{
  double y = a8.y;
  double x = a8.x;
  double height = a6.height;
  double width = a6.width;
  double v13 = a4.y;
  double v14 = a4.x;
  objectsShowingHUD = self->_objectsShowingHUD;
  id v18 = a5;
  [(NSMutableSet *)objectsShowingHUD addObject:a3];
  -[CRLCanvasHUDController p_showHUDAtPoint:inCanvasView:withNudge:size:anchorPoint:](self, "p_showHUDAtPoint:inCanvasView:withNudge:size:anchorPoint:", v18, a7, v14, v13, width, height, x, y);
}

- (void)hideHUDForKey:(id)a3
{
  id v7 = a3;
  if (-[NSMutableSet containsObject:](self->_objectsShowingHUD, "containsObject:"))
  {
    [(NSMutableSet *)self->_objectsShowingHUD removeObject:v7];
    if (![(NSMutableSet *)self->_objectsShowingHUD count])
    {
      [(CRLCanvasHUDController *)self p_hideHUD];
      CGPoint v4 = CGPointZero;
      self->_touchPoint = CGPointZero;
      self->_HUDPoint = v4;
      self->_HUDOffset = 0;
      objc_storeWeak((id *)&self->_canvasView, 0);
      stringTimer = self->_stringTimer;
      if (stringTimer)
      {
        [(NSTimer *)stringTimer invalidate];
        v6 = self->_stringTimer;
        self->_stringTimer = 0;
      }
    }
  }
}

- (void)p_labelTextTimerFired
{
  stringTimer = self->_stringTimer;
  if (stringTimer)
  {
    [(NSTimer *)stringTimer invalidate];
    CGPoint v4 = self->_stringTimer;
    self->_stringTimer = 0;
  }
  lastStringSet = self->_lastStringSet;

  [(CRLCanvasHUDController *)self setLabelText:lastStringSet];
}

- (CRLCanvasHUDController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasHUDController;
  v2 = [(CRLCanvasHUDController *)&v5 initWithNibName:0 bundle:0];
  objc_super v3 = v2;
  if (v2) {
    [(CRLCanvasHUDController *)v2 p_commonInit];
  }
  return v3;
}

- (id)hudView
{
  uint64_t v3 = objc_opt_class();
  CGPoint v4 = [(CRLCanvasHUDController *)self view];
  objc_super v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (void)loadView
{
  id v3 = [[CRLiOSCanvasHUDView alloc] initForHUDViewSize:0];
  [(CRLCanvasHUDController *)self setView:v3];
}

- (void)p_showHUDAtPoint:(CGPoint)a3 inCanvasView:(id)a4 withNudge:(CGSize)a5 size:(unint64_t)a6 anchorPoint:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double height = a5.height;
  double width = a5.width;
  double v12 = a3.y;
  double v13 = a3.x;
  id v15 = a4;
  v16 = [(CRLCanvasHUDController *)self hudView];
  [v16 updateViewToHUDViewSize:a6];

  v17 = [v15 enclosingScrollView];
  id v18 = [v17 superview];

  if (!v18) {
    id v18 = v15;
  }
  v19 = [(CRLCanvasHUDController *)self view];
  id v20 = [v19 superview];

  if (v20 != v18)
  {
    v21 = [(CRLCanvasHUDController *)self view];
    [v21 removeFromSuperview];

    v22 = [(CRLCanvasHUDController *)self view];
    [v18 addSubview:v22];
  }
  v23 = [(CRLCanvasHUDController *)self view];
  unsigned int v24 = [v23 isHidden];

  if (v24)
  {
    v25 = [(CRLCanvasHUDController *)self view];
    [v25 setHidden:0];
  }
  [v15 convertPoint:v18 toView:v13];
  double v27 = v26;
  double v29 = v28;
  double v31 = sub_1000656DC(x, y, 0.0, 0.0, 1.0, 1.0);
  CGFloat v32 = v30;
  if (v31 != x || v30 != y)
  {
    int v34 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6830);
    }
    v35 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101092B30(v35, v34, x, y);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6850);
    }
    v36 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v36);
    }
    v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasHUDController p_showHUDAtPoint:inCanvasView:withNudge:size:anchorPoint:]");
    v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasHUDController.m"];
    v52.double x = x;
    v52.double y = y;
    v39 = NSStringFromCGPoint(v52);
    +[CRLAssertionHandler handleFailureInFunction:v37, v38, 204, 0, "Anchor point should be [0, 1]! Got %@", v39 file lineNumber isFatal description];
  }
  self->_anchorPoint.double x = v31;
  self->_anchorPoint.double y = v32;
  self->_touchPoint.double x = v27;
  self->_touchPoint.double y = v29;
  self->_HUDPoint.double x = width + v27;
  self->_HUDPoint.double y = height + v29;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);
  if (WeakRetained)
  {
    v41 = WeakRetained;
    id v42 = objc_loadWeakRetained((id *)&self->_canvasView);

    if (v42 != v15)
    {
      int v43 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6870);
      }
      v44 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101092A84(v43, v44);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6890);
      }
      v45 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v45);
      }
      v46 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasHUDController p_showHUDAtPoint:inCanvasView:withNudge:size:anchorPoint:]");
      v47 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasHUDController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v46 file:v47 lineNumber:211 isFatal:0 description:"trying to move the CanvasHUD from one canvas to another while it is visible!"];
    }
  }
  objc_storeWeak((id *)&self->_canvasView, v15);
  [(CRLCanvasHUDController *)self p_layoutUpdatingOffset:1];
  v48 = [(CRLCanvasHUDController *)self view];
  [v48 alpha];
  double v50 = v49;

  if (v50 != 1.0)
  {
    v51 = [(CRLCanvasHUDController *)self view];
    [v51 setAlpha:1.0];
  }
}

- (void)p_hideHUD
{
  id v2 = [(CRLCanvasHUDController *)self view];
  [v2 setHidden:1];
}

- (void)p_displayText:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[UIApplication sharedApplication];
  BOOL v6 = [v5 userInterfaceLayoutDirection] == (id)1;

  id v7 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v7 setAlignment:1];
  [v7 setBaseWritingDirection:v6];
  v8 = [(CRLCanvasHUDController *)self hudView];
  +[CRLiOSCanvasHUDView fontSizeForHUDViewSize:](CRLiOSCanvasHUDView, "fontSizeForHUDViewSize:", [v8 hudSize]);
  double v10 = v9;

  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    +[UIFont monospacedDigitSystemFontOfSize:v10 weight:UIFontWeightBold];
  }
  else {
  v11 = +[UIFont boldSystemFontOfSize:v10];
  }
  v16[0] = NSParagraphStyleAttributeName;
  v16[1] = NSFontAttributeName;
  v17[0] = v7;
  v17[1] = v11;
  double v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v13 = [objc_alloc((Class)NSAttributedString) initWithString:v4 attributes:v12];

  double v14 = [(CRLCanvasHUDController *)self hudView];
  id v15 = [v14 label];
  [v15 setAttributedText:v13];
}

- (void)p_layoutUpdatingOffset:(BOOL)a3
{
  objc_super v5 = [(CRLCanvasHUDController *)self hudView];
  BOOL v6 = [v5 label];

  [v6 bounds];
  [v6 sizeThatFits:v7, v8];
  double v10 = v9 + 18.0;
  v11 = [(CRLCanvasHUDController *)self hudView];
  +[CRLiOSCanvasHUDView viewHeightForHUDViewSize:](CRLiOSCanvasHUDView, "viewHeightForHUDViewSize:", [v11 hudSize]);
  double v13 = v12;

  double v14 = [(CRLCanvasHUDController *)self view];
  id v15 = [v14 superview];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);
  v17 = [WeakRetained controller];
  [v17 visibleScaledRectForCanvasUI];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  id v26 = objc_loadWeakRetained((id *)&self->_canvasView);
  [v26 convertRect:v15 toView:v19, v21, v23, v25];
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v83.origin.CGFloat x = v28;
  v83.origin.CGFloat y = v30;
  v83.size.CGFloat width = v32;
  v83.size.CGFloat height = v34;
  CGRect v84 = CGRectInset(v83, 6.0, 6.0);
  CGFloat height = v84.size.height;
  CGFloat y = v84.origin.y;
  CGFloat x = v84.origin.x;
  CGFloat width = v84.size.width;
  -[CRLCanvasHUDController p_frameForHUDWithSize:anchoredAtPoint:insideRect:](self, "p_frameForHUDWithSize:anchoredAtPoint:insideRect:", v10, v13, self->_HUDPoint.x, self->_HUDPoint.y);
  double v78 = v37;
  double v79 = v36;
  double v76 = v39;
  double v77 = v38;
  double v41 = self->_touchPoint.x;
  double v40 = self->_touchPoint.y;
  double v42 = 0.0;
  if (self->_HUDPoint.x != v41 || self->_HUDPoint.y != v40)
  {
    BOOL v72 = a3;
    v85.origin.CGFloat x = x;
    v85.origin.CGFloat y = y;
    v85.size.CGFloat width = width;
    v85.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v85);
    v86.origin.CGFloat x = x;
    v86.origin.CGFloat y = y;
    v86.size.CGFloat width = width;
    v86.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v86);
    double v45 = sub_100407E48(v40, MinY, MaxY);
    self->_touchPoint.CGFloat x = v41;
    self->_touchPoint.CGFloat y = v45;
    -[CRLCanvasHUDController p_touchRectForHUDWithFrame:](self, "p_touchRectForHUDWithFrame:", v79, v78, v77, v76);
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    uint64_t v54 = 0;
    unint64_t v55 = 0;
    double v56 = INFINITY;
    double v57 = INFINITY;
    double v58 = INFINITY;
    do
    {
      uint64_t v59 = qword_101177188[v54];
      double v81 = 0.0;
      v82[0] = 0.0;
      v60 = &v82[4 * v59 + 1];
      -[CRLCanvasHUDController p_HUDFrame:offset:fromTouchRect:insideRect:overlap:shift:](self, "p_HUDFrame:offset:fromTouchRect:insideRect:overlap:shift:", v59, v82, &v81, v79, v78, v77, v76, v47, v49, v51, v53, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);
      *((void *)v60 - 4) = v61;
      *((void *)v60 - 3) = v62;
      *((void *)v60 - 2) = v63;
      *((void *)v60 - 1) = v64;
      if (v82[0] >= v58)
      {
        if (v82[0] == v58 && v81 < v57 && v57 - v81 > 2.0)
        {
          unint64_t v55 = v59;
          double v57 = v81;
        }
      }
      else
      {
        double v57 = v81;
        unint64_t v55 = v59;
        double v58 = v82[0];
      }
      ++v54;
      unint64_t HUDOffset = self->_HUDOffset;
      if (v59 == HUDOffset) {
        double v56 = v82[0];
      }
    }
    while (v54 != 3);
    if (v56 != v58 || v55 == HUDOffset || v55 == 1) {
      unint64_t v68 = v55;
    }
    else {
      unint64_t v68 = self->_HUDOffset;
    }
    v69 = &v82[4 * v68 + 1];
    double v78 = *(v69 - 3);
    double v79 = *(v69 - 4);
    double v76 = *(v69 - 1);
    double v77 = *(v69 - 2);
    if (v72)
    {
      if (HUDOffset) {
        BOOL v70 = HUDOffset == v68;
      }
      else {
        BOOL v70 = 1;
      }
      self->_unint64_t HUDOffset = v68;
      char v71 = !v70;
      double v42 = 0.0;
      if (v71) {
        double v42 = 0.15;
      }
    }
    else
    {
      double v42 = 0.0;
    }
  }
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100273928;
  v80[3] = &unk_1014CE288;
  v80[4] = self;
  *(double *)&v80[5] = v79;
  *(double *)&v80[6] = v78;
  *(double *)&v80[7] = v77;
  *(double *)&v80[8] = v76;
  +[UIView animateWithDuration:v80 animations:v42];
}

- (CGFloat)p_HUDFrame:(CGFloat)a3 offset:(CGFloat)a4 fromTouchRect:(CGFloat)a5 insideRect:(double)a6 overlap:(double)a7 shift:(double)a8
{
  if (a11 != 1)
  {
    double v46 = a6;
    double v47 = a7;
    double v48 = a8;
    double v49 = a9;
    [a1 p_touchRectForHUDWithFrame:a2, a3, a4, a5];
    double v33 = a4 * 0.5 + v32 * 1.5 + 1.0;
    if (a11 == 3)
    {
      double v34 = v33 + a1[6];
    }
    else
    {
      if (a11 != 2)
      {
        v35 = a1 + 9;
        double v34 = a1[8];
LABEL_10:
        [a1 p_frameForHUDWithSize:a4 anchoredAtPoint:a5 insideRect:v34 *v35 a14 a15 a16 a17];
        CGFloat v29 = v36;
        CGFloat v28 = v37;
        CGFloat v27 = v38;
        CGFloat v26 = v39;
        a8 = v48;
        a9 = v49;
        a6 = v46;
        a7 = v47;
        if (!a12) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      double v34 = a1[6] - v33;
    }
    v35 = a1 + 9;
    goto LABEL_10;
  }
  CGFloat v26 = a5;
  CGFloat v27 = a4;
  CGFloat v28 = a3;
  CGFloat v29 = a2;
  if (a12)
  {
LABEL_11:
    v50.origin.CGFloat x = v29;
    v50.origin.CGFloat y = v28;
    v50.size.CGFloat width = v27;
    v50.size.CGFloat height = v26;
    CGRect v51 = CGRectIntersection(v50, *(CGRect *)&a6);
    *a12 = v51.size.width * v51.size.height;
  }
LABEL_12:
  if (a13)
  {
    double v40 = sub_100065738(a2, a3, a4, a5);
    double v42 = v41;
    double v43 = sub_100065738(v29, v28, v27, v26);
    *a13 = sub_1000653B4(v40, v42, v43, v44);
  }
  return v29;
}

- (CGRect)p_frameForHUDWithSize:(CGSize)a3 anchoredAtPoint:(CGPoint)a4 insideRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v9 = a4.y;
  double v10 = a4.x;
  double v12 = sub_1000652F0(self->_anchorPoint.x, self->_anchorPoint.y, a3.width);
  sub_100064680(v10, v9, v12);
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v13, v14);
  double v19 = sub_100065E4C(v15, v16, v17, v18, x, y, width, height);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);
  CGFloat v27 = [WeakRetained controller];
  CGFloat v28 = [v27 canvas];
  [v28 contentsScale];
  double v30 = sub_100067584(v19, v21, v23, v25, v29);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  double v37 = v30;
  double v38 = v32;
  double v39 = v34;
  double v40 = v36;
  result.size.CGFloat height = v40;
  result.size.CGFloat width = v39;
  result.origin.CGFloat y = v38;
  result.origin.CGFloat x = v37;
  return result;
}

- (CGRect)p_touchRectForHUDWithFrame:(CGRect)a3
{
  double v3 = sub_10006402C(self->_touchPoint.x, self->_touchPoint.y, 30.0);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)p_setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CRLCanvasHUDController *)self hudView];
  [v4 setHidden:v3];
}

- (NSString)crlaxLastStringSet
{
  return self->_lastStringSet;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_canvasView);
  objc_storeStrong((id *)&self->_objectsShowingHUD, 0);
  objc_storeStrong((id *)&self->_stringTimer, 0);

  objc_storeStrong((id *)&self->_lastStringSet, 0);
}

@end