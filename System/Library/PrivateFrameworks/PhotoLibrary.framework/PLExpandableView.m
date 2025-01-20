@interface PLExpandableView
- (BOOL)_canPinch;
- (BOOL)allowsExpansion;
- (BOOL)canCollapse;
- (BOOL)isTracking;
- (CGRect)contractedFrame;
- (CGRect)expandedFrame;
- (CGRect)pinchRect:(CGRect)a3 inView:(id)a4 insetTouches:(BOOL)a5;
- (PLExpandableView)initWithFrame:(CGRect)a3;
- (double)expansionFraction;
- (float)completeTrackingPinch:(id)a3 toState:(int)a4 duration:(double)a5;
- (float)continueTrackingPinch:(id)a3;
- (id)delegate;
- (int)previousState;
- (int)snapState:(BOOL)a3;
- (int)state;
- (void)_notifyDidCancelCollapsing;
- (void)_notifyDidCancelExpanding;
- (void)_notifyDidCompleteCollapsing;
- (void)_notifyDidCompleteExpanding;
- (void)_notifyWillBeginCollapsing;
- (void)_notifyWillBeginExpanding;
- (void)_notifyWillCancelCollapsingWithDuration:(double)a3;
- (void)_notifyWillCancelExpandingWithDuration:(double)a3;
- (void)_notifyWillCompleteCollapsingWithDuration:(double)a3;
- (void)_notifyWillCompleteExpandingWithDuration:(double)a3;
- (void)_setAutorotationDisabled:(BOOL)a3;
- (void)_transitionFromCancelContract:(int)a3 withDuration:(double)a4;
- (void)_transitionFromCancelExpand:(int)a3 withDuration:(double)a4;
- (void)_transitionFromCompleteContract:(int)a3 withDuration:(double)a4;
- (void)_transitionFromCompleteExpand:(int)a3 withDuration:(double)a4;
- (void)_transitionFromContracted:(int)a3 withDuration:(double)a4;
- (void)_transitionFromContracting:(int)a3 withDuration:(double)a4;
- (void)_transitionFromExpanded:(int)a3 withDuration:(double)a4;
- (void)_transitionFromExpanding:(int)a3 withDuration:(double)a4;
- (void)canceledPinch:(id)a3;
- (void)collapseWithAnimation:(BOOL)a3 completion:(id)a4;
- (void)continuedPinch:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)expandWithAnimation:(BOOL)a3 completion:(id)a4;
- (void)finishTransition;
- (void)finishTransitionToState:(int)a3;
- (void)finishedPinch:(id)a3;
- (void)notifyExpansionFraction:(float)a3 force:(BOOL)a4;
- (void)setAllowsExpansion:(BOOL)a3;
- (void)setContractedFrame:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandedFrame:(CGRect)a3;
- (void)setExpansionFraction:(double)a3;
- (void)setState:(int)a3 withDuration:(double)a4;
- (void)startedPinch:(id)a3;
- (void)updatePinchState:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PLExpandableView

- (BOOL)canCollapse
{
  return ((*(_DWORD *)&self->_expandFlags & 7) != 7) & (0x54u >> (*(_DWORD *)&self->_expandFlags & 7));
}

- (BOOL)_canPinch
{
  return (*(unsigned char *)&self->_expandFlags & 7) != 0 || [(PLExpandableView *)self allowsExpansion];
}

- (BOOL)isTracking
{
  return (*(unsigned char *)&self->_expandFlags >> 6) & 1;
}

- (double)expansionFraction
{
  return self->_expansionFraction;
}

- (void)setExpansionFraction:(double)a3
{
  self->_expansionFraction = a3;
}

- (int)previousState
{
  return (*(_DWORD *)&self->_expandFlags >> 3) & 7;
}

- (int)state
{
  return *(_DWORD *)&self->_expandFlags & 7;
}

- (BOOL)allowsExpansion
{
  return (*((unsigned __int8 *)&self->_expandFlags + 1) >> 3) & 1;
}

- (void)setAllowsExpansion:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFF7FF | v3);
}

- (CGRect)expandedFrame
{
  p_expandedFrame = &self->_expandedFrame;
  if (!CGRectIsEmpty(self->_expandedFrame))
  {
    uint64_t v8 = [(PLExpandableView *)self window];
    if (v8)
    {
      objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:fromView:", v8, p_expandedFrame->origin.x, p_expandedFrame->origin.y, p_expandedFrame->size.width, p_expandedFrame->size.height);
      goto LABEL_7;
    }
    if ([(PLExpandableView *)self state] != 4)
    {
      double x = p_expandedFrame->origin.x;
      double y = p_expandedFrame->origin.y;
      double width = p_expandedFrame->size.width;
      double height = p_expandedFrame->size.height;
      goto LABEL_7;
    }
  }
  [(PLExpandableView *)self frame];
LABEL_7:
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setExpandedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(PLExpandableView *)self window];
  if (v8)
  {
    objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:toView:", v8, x, y, width, height);
    self->_expandedFrame.origin.double x = v9;
    self->_expandedFrame.origin.double y = v10;
    self->_expandedFrame.size.double width = v11;
    self->_expandedFrame.size.double height = v12;
    $D001CA967CA97F9C3908BE3E81D85F1E v13 = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFFBFF);
  }
  else
  {
    self->_expandedFrame.origin.double x = x;
    self->_expandedFrame.origin.double y = y;
    self->_expandedFrame.size.double width = width;
    self->_expandedFrame.size.double height = height;
    $D001CA967CA97F9C3908BE3E81D85F1E v13 = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags | 0x400);
  }
  self->_expandFlags = v13;
}

- (CGRect)contractedFrame
{
  p_contractedFrame = &self->_contractedFrame;
  if (CGRectIsEmpty(self->_contractedFrame))
  {
    [(PLExpandableView *)self frame];
  }
  else
  {
    uint64_t v8 = [(PLExpandableView *)self window];
    if (v8)
    {
      objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:fromView:", v8, p_contractedFrame->origin.x, p_contractedFrame->origin.y, p_contractedFrame->size.width, p_contractedFrame->size.height);
    }
    else
    {
      double x = p_contractedFrame->origin.x;
      double y = p_contractedFrame->origin.y;
      double width = p_contractedFrame->size.width;
      double height = p_contractedFrame->size.height;
    }
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContractedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(PLExpandableView *)self window];
  if (v8)
  {
    objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:toView:", v8, x, y, width, height);
    self->_contractedFrame.origin.double x = v9;
    self->_contractedFrame.origin.double y = v10;
    self->_contractedFrame.size.double width = v11;
    self->_contractedFrame.size.double height = v12;
    $D001CA967CA97F9C3908BE3E81D85F1E v13 = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFFDFF);
  }
  else
  {
    self->_contractedFrame.origin.double x = x;
    self->_contractedFrame.origin.double y = y;
    self->_contractedFrame.size.double width = width;
    self->_contractedFrame.size.double height = height;
    $D001CA967CA97F9C3908BE3E81D85F1E v13 = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags | 0x200);
  }
  self->_expandFlags = v13;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (PLExpandableViewDelegate *)a3;
    if (objc_opt_respondsToSelector()) {
      int v4 = 4096;
    }
    else {
      int v4 = 0;
    }
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFEFFF | v4);
    if (objc_opt_respondsToSelector()) {
      int v5 = 0x2000;
    }
    else {
      int v5 = 0;
    }
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFDFFF | v5);
    if (objc_opt_respondsToSelector()) {
      int v6 = 0x4000;
    }
    else {
      int v6 = 0;
    }
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFBFFF | v6);
    if (objc_opt_respondsToSelector()) {
      int v7 = 0x8000;
    }
    else {
      int v7 = 0;
    }
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFF7FFF | v7);
    if (objc_opt_respondsToSelector()) {
      int v8 = 0x10000;
    }
    else {
      int v8 = 0;
    }
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFEFFFF | v8);
    if (objc_opt_respondsToSelector()) {
      int v9 = 0x20000;
    }
    else {
      int v9 = 0;
    }
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFDFFFF | v9);
    if (objc_opt_respondsToSelector()) {
      int v10 = 0x40000;
    }
    else {
      int v10 = 0;
    }
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFBFFFF | v10);
    if (objc_opt_respondsToSelector()) {
      int v11 = 0x80000;
    }
    else {
      int v11 = 0;
    }
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFF7FFFF | v11);
    if (objc_opt_respondsToSelector()) {
      int v12 = 0x100000;
    }
    else {
      int v12 = 0;
    }
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFEFFFFF | v12);
    if (objc_opt_respondsToSelector()) {
      int v13 = 0x200000;
    }
    else {
      int v13 = 0;
    }
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFDFFFFF | v13);
    if (objc_opt_respondsToSelector()) {
      int v14 = 0x400000;
    }
    else {
      int v14 = 0;
    }
    self->_expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFBFFFFF | v14);
  }
}

- (void)expandWithAnimation:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  if ([(PLExpandableView *)self allowsExpansion])
  {
    if (v5) {
      double v7 = 0.3;
    }
    else {
      double v7 = 0.0;
    }
    if (!v5) {
      *(_DWORD *)&self->_expandFlags |= 0x100u;
    }

    self->_expansionCompletionHandler = (id)[a4 copy];
    [(PLExpandableView *)self setState:1 withDuration:0.0];
    [(PLExpandableView *)self setState:2 withDuration:v7];
    [(PLExpandableView *)self completeTrackingPinch:0 toState:4 duration:v7];
    [(PLExpandableView *)self setExpansionFraction:v8];
    if (!v5) {
      *(_DWORD *)&self->_expandFlags &= ~0x100u;
    }
  }
}

- (void)collapseWithAnimation:(BOOL)a3 completion:(id)a4
{
  if (a3) {
    double v7 = 0.3;
  }
  else {
    double v7 = 0.0;
  }
  if (!a3)
  {
    float v8 = self;
    *(_DWORD *)&self->_expandFlags |= 0x100u;
  }

  self->_collapsingCompletionHandler = (id)[a4 copy];
  [(PLExpandableView *)self setState:5 withDuration:0.0];
  [(PLExpandableView *)self setState:7 withDuration:v7];
  [(PLExpandableView *)self completeTrackingPinch:0 toState:0 duration:v7];
  [(PLExpandableView *)self setExpansionFraction:v9];
  if (!a3) {
    *(_DWORD *)&self->_expandFlags &= ~0x100u;
  }
}

- (float)completeTrackingPinch:(id)a3 toState:(int)a4 duration:(double)a5
{
  return 0.0;
}

- (float)continueTrackingPinch:(id)a3
{
  return 0.0;
}

- (CGRect)pinchRect:(CGRect)a3 inView:(id)a4 insetTouches:(BOOL)a5
{
  double v7 = a3.size.width * 0.21;
  double v8 = 0.0;
  if (!a5) {
    double v7 = 0.0;
  }
  double v9 = a3.size.height * 0.21;
  if (!a5) {
    double v9 = 0.0;
  }
  double v36 = v7;
  double v38 = v9;
  CGRect v44 = CGRectInset(a3, v7, v9);
  CGFloat x = v44.origin.x;
  CGFloat y = v44.origin.y;
  CGFloat width = v44.size.width;
  CGFloat height = v44.size.height;
  -[PLExpandableView convertPoint:toView:](self, "convertPoint:toView:", a4, self->_leftTouchLocation.x, self->_leftTouchLocation.y);
  double v15 = v14;
  double v17 = v16;
  -[PLExpandableView convertPoint:toView:](self, "convertPoint:toView:", a4, self->_rightTouchLocation.x, self->_rightTouchLocation.y);
  double v19 = v18;
  double v40 = v20;
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  if (v15 < CGRectGetMinX(v45)
    || (v46.origin.CGFloat x = x, v46.origin.y = y, v46.size.width = width, v46.size.height = height, v15 > CGRectGetMaxX(v46)))
  {
    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    double v8 = v15 - CGRectGetMidX(v47);
  }
  double v34 = v15;
  double v37 = v8;
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  if (v17 < CGRectGetMinY(v48)
    || (v49.origin.CGFloat x = x,
        v49.origin.CGFloat y = y,
        v49.size.CGFloat width = width,
        v49.size.CGFloat height = height,
        double v21 = 0.0,
        v17 > CGRectGetMaxY(v49)))
  {
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    double v21 = v17 - CGRectGetMidY(v50);
  }
  double v35 = v17;
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  if (v19 < CGRectGetMinX(v51)
    || (v52.origin.CGFloat x = x,
        v52.origin.CGFloat y = y,
        v52.size.CGFloat width = width,
        v52.size.CGFloat height = height,
        double v22 = 0.0,
        v19 > CGRectGetMaxX(v52)))
  {
    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    double v22 = v19 - CGRectGetMidX(v53);
  }
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = height;
  if (v40 < CGRectGetMinY(v54)
    || (v55.origin.CGFloat x = x,
        v55.origin.CGFloat y = y,
        v55.size.CGFloat width = width,
        v55.size.CGFloat height = height,
        CGFloat MaxY = CGRectGetMaxY(v55),
        double v24 = v40,
        double v25 = 0.0,
        v40 > MaxY))
  {
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    CGFloat MidY = CGRectGetMidY(v56);
    double v24 = v40;
    double v25 = v40 - MidY;
  }
  memset(&v43, 0, sizeof(v43));
  if (a4)
  {
    [a4 transform];
    double v24 = v40;
  }
  double v27 = (vabdd_f64(v34, v19) + v36 * 2.0) / a3.size.width;
  if (v27 < 1.0) {
    double v27 = 1.0;
  }
  double v28 = (vabdd_f64(v35, v24) + v38 * 2.0) / a3.size.height;
  if (v28 < 1.0) {
    double v28 = 1.0;
  }
  if (v27 >= v28) {
    CGFloat v29 = v27;
  }
  else {
    CGFloat v29 = v28;
  }
  CGAffineTransform v41 = v43;
  CGAffineTransformTranslate(&v42, &v41, (v37 + v22) * 0.5, (v21 + v25) * 0.5);
  CGAffineTransform v43 = v42;
  UIRectGetCenter();
  double v31 = v30;
  double v33 = v32;
  CGAffineTransform v41 = v43;
  CGAffineTransformTranslate(&v42, &v41, v30, v32);
  CGAffineTransform v43 = v42;
  CGAffineTransform v41 = v42;
  CGAffineTransformScale(&v42, &v41, v29, v29);
  CGAffineTransform v43 = v42;
  CGAffineTransform v41 = v42;
  CGAffineTransformTranslate(&v42, &v41, -v31, -v33);
  CGAffineTransform v43 = v42;
  return CGRectApplyAffineTransform(a3, &v42);
}

- (void)updatePinchState:(id)a3
{
  if ([a3 numberOfTouches] == 2)
  {
    self->_previousLeftLocation = self->_leftTouchLocation;
    self->_previousRightLocation = self->_rightTouchLocation;
    [a3 locationOfTouch:self->_leftTouchIndex inView:self];
    self->_leftTouchLocation.CGFloat x = v5;
    self->_leftTouchLocation.CGFloat y = v6;
    [a3 locationOfTouch:self->_rightTouchIndex inView:self];
    self->_rightTouchLocation.CGFloat x = v7;
    self->_rightTouchLocation.CGFloat y = v8;
    [a3 velocity];
    self->_pinchVelocitCGFloat y = v9;
    [a3 scale];
    self->_trackingTimeInterval = v10 / self->_pinchVelocity;
  }
}

- (int)snapState:(BOOL)a3
{
  double expansionFraction = self->_expansionFraction;
  if (a3)
  {
    pinchVelocitCGFloat y = self->_pinchVelocity;
  }
  else
  {
    double v5 = 1.0 - expansionFraction;
    BOOL v9 = expansionFraction < 1.0;
    double expansionFraction = 0.0;
    if (v9) {
      double expansionFraction = v5;
    }
    float v6 = self->_pinchVelocity;
    pinchVelocitCGFloat y = -v6;
  }
  if (pinchVelocity <= 1.0
    && ((v7 = pinchVelocity, float v8 = expansionFraction, v8 > 0.25) ? (v9 = v7 < -0.2) : (v9 = 1), v9 && v8 <= 0.7))
  {
    int v10 = 0;
    int v11 = 4;
  }
  else
  {
    int v11 = 0;
    int v10 = 4;
  }
  if (a3) {
    return v10;
  }
  else {
    return v11;
  }
}

- (void)finishTransitionToState:(int)a3
{
  if (a3)
  {
    if (a3 != 4) {
      return;
    }
    if ((*(_DWORD *)&self->_expandFlags & 3 | 4) == 6) {
      [(PLExpandableView *)self setState:4 withDuration:0.0];
    }
    uint64_t v4 = 424;
  }
  else
  {
    if ((~*(_DWORD *)&self->_expandFlags & 3) == 0) {
      [(PLExpandableView *)self setState:0 withDuration:0.0];
    }
    uint64_t v4 = 416;
  }
  double v5 = (id *)((char *)&self->super.super.super.isa + v4);
  if (*v5)
  {
    (*((void (**)(void))*v5 + 2))();

    *double v5 = 0;
  }
}

- (void)finishTransition
{
  unsigned int v3 = [(PLExpandableView *)self state] - 2;
  if (v3 <= 5 && ((0x33u >> v3) & 1) != 0)
  {
    uint64_t v4 = dword_1BEED8D4C[v3];
    [(PLExpandableView *)self finishTransitionToState:v4];
  }
}

- (void)canceledPinch:(id)a3
{
  $D001CA967CA97F9C3908BE3E81D85F1E expandFlags = self->_expandFlags;
  if ((*(unsigned char *)&expandFlags & 0x40) != 0)
  {
    self->_$D001CA967CA97F9C3908BE3E81D85F1E expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&expandFlags & 0xFFFFFFBF);
    int v6 = [(PLExpandableView *)self state];
    if (v6 == 5)
    {
      double expansionFraction = 1.0 - self->_expansionFraction;
      uint64_t v7 = 4;
      uint64_t v9 = 6;
    }
    else
    {
      if (v6 != 1) {
        return;
      }
      uint64_t v7 = 0;
      double expansionFraction = self->_expansionFraction;
      uint64_t v9 = 3;
    }
    double v10 = expansionFraction * 0.3;
    [(PLExpandableView *)self setState:v9 withDuration:expansionFraction * 0.3];
    [(PLExpandableView *)self completeTrackingPinch:a3 toState:v7 duration:v10];
    [(PLExpandableView *)self setExpansionFraction:v11];
    CGPoint v12 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    self->_leftTouchLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
    self->_previousLeftLocation = v12;
    self->_rightTouchLocation = v12;
    self->_previousRightLocation = v12;
  }
}

- (void)finishedPinch:(id)a3
{
  if ((*(_DWORD *)&self->_expandFlags & 0x40) != 0)
  {
    int v5 = [(PLExpandableView *)self snapState:(*(_DWORD *)&self->_expandFlags & 7) == 1];
    $D001CA967CA97F9C3908BE3E81D85F1E expandFlags = self->_expandFlags;
    self->_$D001CA967CA97F9C3908BE3E81D85F1E expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&expandFlags & 0xFFFFFFBF);
    int v7 = *(unsigned char *)&expandFlags & 7;
    if (v7 == 5)
    {
      if (v5)
      {
        if (v5 == 4)
        {
          uint64_t v8 = 6;
          goto LABEL_10;
        }
LABEL_15:
        CGPoint v13 = (CGPoint)*MEMORY[0x1E4F1DAD8];
        self->_leftTouchLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
        self->_previousLeftLocation = v13;
        self->_rightTouchLocation = v13;
        self->_previousRightLocation = v13;
        return;
      }
      uint64_t v8 = 7;
    }
    else
    {
      if (v7 != 1) {
        goto LABEL_15;
      }
      if (v5)
      {
        if (v5 == 4)
        {
          uint64_t v8 = 2;
LABEL_10:
          double expansionFraction = 1.0 - self->_expansionFraction;
          uint64_t v10 = 4;
LABEL_14:
          double v11 = expansionFraction * 0.3;
          [(PLExpandableView *)self setState:v8 withDuration:expansionFraction * 0.3];
          [(PLExpandableView *)self completeTrackingPinch:a3 toState:v10 duration:v11];
          [(PLExpandableView *)self setExpansionFraction:v12];
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      uint64_t v8 = 3;
    }
    uint64_t v10 = 0;
    double expansionFraction = self->_expansionFraction;
    goto LABEL_14;
  }
}

- (void)continuedPinch:(id)a3
{
  if ((*(unsigned char *)&self->_expandFlags & 0x40) != 0)
  {
    -[PLExpandableView updatePinchState:](self, "updatePinchState:");
    if ((*(_DWORD *)&self->_expandFlags & 3 | 4) == 5)
    {
      [(PLExpandableView *)self continueTrackingPinch:a3];
      -[PLExpandableView notifyExpansionFraction:force:](self, "notifyExpansionFraction:force:", 0);
    }
  }
}

- (void)startedPinch:(id)a3
{
  if ((unint64_t)[a3 numberOfTouches] >= 2 && -[PLExpandableView _canPinch](self, "_canPinch"))
  {
    [(PLExpandableView *)self _removeAllAnimations:1];
    *(_DWORD *)&self->_expandFlags |= 0x40u;
    self->_leftTouchIndeCGFloat x = 0;
    self->_rightTouchIndeCGFloat x = 1;
    p_leftTouchLocation = &self->_leftTouchLocation;
    CGPoint v6 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    self->_leftTouchLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
    p_rightTouchLocation = &self->_rightTouchLocation;
    self->_rightTouchLocation = v6;
    [(PLExpandableView *)self updatePinchState:a3];
    if (self->_leftTouchLocation.x >= self->_rightTouchLocation.x)
    {
      CGPoint v8 = *p_leftTouchLocation;
      self->_leftTouchIndeCGFloat x = 1;
      self->_rightTouchIndeCGFloat x = 0;
      CGPoint *p_leftTouchLocation = *p_rightTouchLocation;
      CGPoint *p_rightTouchLocation = v8;
    }
    unsigned int v9 = (*(_DWORD *)&self->_expandFlags & 7) - 1;
    if (v9 > 5)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v10 = dword_1BEED8D1C[v9];
      uint64_t v11 = dword_1BEED8D34[v9];
    }
    [(PLExpandableView *)self setState:v10 withDuration:0.0];
    [(PLExpandableView *)self setState:v11 withDuration:0.0];
    [(PLExpandableView *)self beginTrackingPinch:a3];
    double expansionFraction = self->_expansionFraction;
    *(float *)&double expansionFraction = expansionFraction;
    [(PLExpandableView *)self notifyExpansionFraction:1 force:expansionFraction];
  }
  else
  {
    *(_DWORD *)&self->_expandFlags &= ~0x40u;
  }
}

- (void)notifyExpansionFraction:(float)a3 force:(BOOL)a4
{
  double v4 = a3;
  if (self->_expansionFraction != a3 || a4)
  {
    if ((*((unsigned char *)&self->_expandFlags + 2) & 0x40) != 0) {
      -[PLExpandableViewDelegate expandableView:expansionFractionChanged:](self->_delegate, "expandableView:expansionFractionChanged:", self);
    }
    -[PLExpandableView setExpansionFraction:](self, "setExpansionFraction:", a4, v4);
  }
}

- (void)didMoveToWindow
{
  uint64_t v3 = [(PLExpandableView *)self window];
  uint64_t v4 = v3;
  $D001CA967CA97F9C3908BE3E81D85F1E expandFlags = self->_expandFlags;
  if ((*(_WORD *)&expandFlags & 0x200) != 0 && v3)
  {
    p_contractedFrame = &self->_contractedFrame;
    if (!CGRectIsEmpty(self->_contractedFrame))
    {
      objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:toView:", v4, p_contractedFrame->origin.x, self->_contractedFrame.origin.y, self->_contractedFrame.size.width, self->_contractedFrame.size.height);
      p_contractedFrame->origin.CGFloat x = v7;
      self->_contractedFrame.origin.CGFloat y = v8;
      self->_contractedFrame.size.CGFloat width = v9;
      self->_contractedFrame.size.CGFloat height = v10;
    }
    $D001CA967CA97F9C3908BE3E81D85F1E expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&self->_expandFlags & 0xFFFFFDFF);
    self->_$D001CA967CA97F9C3908BE3E81D85F1E expandFlags = expandFlags;
  }
  if ((*(_WORD *)&expandFlags & 0x400) != 0 && v4)
  {
    p_expandedFrame = &self->_expandedFrame;
    if (!CGRectIsEmpty(self->_expandedFrame))
    {
      objc_msgSend((id)-[PLExpandableView superview](self, "superview"), "convertRect:toView:", v4, p_expandedFrame->origin.x, self->_expandedFrame.origin.y, self->_expandedFrame.size.width, self->_expandedFrame.size.height);
      p_expandedFrame->origin.CGFloat x = v12;
      self->_expandedFrame.origin.CGFloat y = v13;
      self->_expandedFrame.size.CGFloat width = v14;
      self->_expandedFrame.size.CGFloat height = v15;
    }
    *(_DWORD *)&self->_expandFlags &= ~0x400u;
  }
}

- (void)willMoveToWindow:(id)a3
{
  if (!a3 && (*(unsigned char *)&self->_expandFlags & 0x80) != 0) {
    [(PLExpandableView *)self _setAutorotationDisabled:0];
  }
}

- (void)setState:(int)a3 withDuration:(double)a4
{
  if ((*(_DWORD *)&self->_expandFlags & 7) != a3)
  {
    uint64_t v5 = *(void *)&a3;
    -[PLExpandableView stateWillChangeTo:](self, "stateWillChangeTo:");
    $D001CA967CA97F9C3908BE3E81D85F1E expandFlags = self->_expandFlags;
    self->_$D001CA967CA97F9C3908BE3E81D85F1E expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&expandFlags & 0xFFFFFFC0 | v5 & 7 | (8 * (*(unsigned char *)&expandFlags & 7)));
    switch(*(unsigned char *)&expandFlags & 7)
    {
      case 1:
        [(PLExpandableView *)self _transitionFromExpanding:v5 withDuration:a4];
        break;
      case 2:
        [(PLExpandableView *)self _transitionFromCompleteExpand:v5 withDuration:a4];
        break;
      case 3:
        [(PLExpandableView *)self _transitionFromCancelExpand:v5 withDuration:a4];
        break;
      case 4:
        [(PLExpandableView *)self _transitionFromExpanded:v5 withDuration:a4];
        break;
      case 5:
        [(PLExpandableView *)self _transitionFromContracting:v5 withDuration:a4];
        break;
      case 6:
        [(PLExpandableView *)self _transitionFromCancelContract:v5 withDuration:a4];
        break;
      case 7:
        [(PLExpandableView *)self _transitionFromCompleteContract:v5 withDuration:a4];
        break;
      default:
        if (CGRectIsEmpty(self->_contractedFrame))
        {
          [(PLExpandableView *)self frame];
          -[PLExpandableView setContractedFrame:](self, "setContractedFrame:");
        }
        [(PLExpandableView *)self _transitionFromContracted:v5 withDuration:a4];
        break;
    }
    [(PLExpandableView *)self stateDidChangeFrom:(*(_DWORD *)&self->_expandFlags >> 3) & 7];
    int v8 = (*(_DWORD *)&self->_expandFlags >> 3) & 7;
    if ((v8 - 1) > 6) {
      unsigned int v9 = 0;
    }
    else {
      unsigned int v9 = dword_1BEED8D00[v8 - 1];
    }
    int v10 = *(_DWORD *)&self->_expandFlags & 7;
    if ((v10 - 1) > 6) {
      unsigned int v11 = 0;
    }
    else {
      unsigned int v11 = dword_1BEED8D00[v10 - 1];
    }
    if (v9 != v11)
    {
      if (((1 << v8) & 0xCC) != 0)
      {

        int v10 = *(_DWORD *)&self->_expandFlags & 7;
      }
      if (((1 << v10) & 0xCC) != 0)
      {
        delegate = self->_delegate;
        CGFloat v13 = delegate;
      }
    }
  }
}

- (void)_transitionFromCompleteContract:(int)a3 withDuration:(double)a4
{
  if (a3 == 1)
  {
    [(PLExpandableView *)self _notifyDidCompleteCollapsing];
    [(PLExpandableView *)self _notifyWillBeginExpanding];
  }
  else if (!a3)
  {
    [(PLExpandableView *)self _notifyDidCompleteCollapsing];
  }
}

- (void)_transitionFromCancelContract:(int)a3 withDuration:(double)a4
{
  if (a3 == 5)
  {
    [(PLExpandableView *)self _notifyDidCancelCollapsing];
    [(PLExpandableView *)self _notifyWillBeginCollapsing];
  }
  else if (a3 == 4)
  {
    [(PLExpandableView *)self _notifyDidCancelCollapsing];
  }
}

- (void)_transitionFromContracting:(int)a3 withDuration:(double)a4
{
  if (a3 == 7)
  {
    [(PLExpandableView *)self _notifyWillCompleteCollapsingWithDuration:a4];
  }
  else if (a3 == 6)
  {
    [(PLExpandableView *)self _notifyWillCancelCollapsingWithDuration:a4];
  }
}

- (void)_transitionFromExpanded:(int)a3 withDuration:(double)a4
{
  if (a3 == 5) {
    [(PLExpandableView *)self _notifyWillBeginCollapsing];
  }
}

- (void)_transitionFromCancelExpand:(int)a3 withDuration:(double)a4
{
  if (a3 == 1)
  {
    [(PLExpandableView *)self _notifyDidCancelExpanding];
    [(PLExpandableView *)self _notifyWillBeginExpanding];
  }
  else if (!a3)
  {
    [(PLExpandableView *)self _notifyDidCancelExpanding];
  }
}

- (void)_transitionFromCompleteExpand:(int)a3 withDuration:(double)a4
{
  if (a3 == 5)
  {
    [(PLExpandableView *)self _notifyDidCompleteExpanding];
    [(PLExpandableView *)self _notifyWillBeginCollapsing];
  }
  else if (a3 == 4)
  {
    [(PLExpandableView *)self _notifyDidCompleteExpanding];
  }
}

- (void)_transitionFromExpanding:(int)a3 withDuration:(double)a4
{
  if (a3 == 3)
  {
    [(PLExpandableView *)self _notifyWillCancelExpandingWithDuration:a4];
  }
  else if (a3 == 2)
  {
    [(PLExpandableView *)self _notifyWillCompleteExpandingWithDuration:a4];
  }
}

- (void)_transitionFromContracted:(int)a3 withDuration:(double)a4
{
  if (a3 == 1) {
    [(PLExpandableView *)self _notifyWillBeginExpanding];
  }
}

- (void)_notifyDidCancelCollapsing
{
  [(PLExpandableView *)self _setAutorotationDisabled:0];
  if ((*((unsigned char *)&self->_expandFlags + 2) & 0x20) != 0)
  {
    delegate = self->_delegate;
    [(PLExpandableViewDelegate *)delegate expandableViewDidCancelCollapsing:self];
  }
}

- (void)_notifyDidCancelExpanding
{
  [(PLExpandableView *)self _setAutorotationDisabled:0];
  if (*((unsigned char *)&self->_expandFlags + 2))
  {
    delegate = self->_delegate;
    [(PLExpandableViewDelegate *)delegate expandableViewDidCancelExpanding:self];
  }
}

- (void)_notifyWillBeginCollapsing
{
  [(PLExpandableView *)self _setAutorotationDisabled:1];
  if ((*((unsigned char *)&self->_expandFlags + 2) & 2) != 0)
  {
    delegate = self->_delegate;
    [(PLExpandableViewDelegate *)delegate expandableViewDidBeginCollapsing:self];
  }
}

- (void)_notifyDidCompleteExpanding
{
  [(PLExpandableView *)self _setAutorotationDisabled:0];
  if ((*((unsigned char *)&self->_expandFlags + 1) & 0x40) != 0)
  {
    delegate = self->_delegate;
    [(PLExpandableViewDelegate *)delegate expandableViewDidCompleteExpanding:self];
  }
}

- (void)_notifyWillCancelExpandingWithDuration:(double)a3
{
  if ((*((unsigned char *)&self->_expandFlags + 1) & 0x80) != 0) {
    [(PLExpandableViewDelegate *)self->_delegate expandableView:self willCancelExpandingWithDuration:a3];
  }
}

- (void)_notifyWillCompleteExpandingWithDuration:(double)a3
{
  if ((*((unsigned char *)&self->_expandFlags + 1) & 0x20) != 0) {
    [(PLExpandableViewDelegate *)self->_delegate expandableView:self willCompleteExpandingWithDuration:a3];
  }
}

- (void)_notifyWillCompleteCollapsingWithDuration:(double)a3
{
  if ((*((unsigned char *)&self->_expandFlags + 2) & 4) != 0) {
    [(PLExpandableViewDelegate *)self->_delegate expandableView:self willCompleteCollapsingWithDuration:a3];
  }
}

- (void)_notifyWillCancelCollapsingWithDuration:(double)a3
{
  if ((*((unsigned char *)&self->_expandFlags + 2) & 0x10) != 0) {
    [(PLExpandableViewDelegate *)self->_delegate expandableView:self willCancelCollapsingWithDuration:a3];
  }
}

- (void)_notifyWillBeginExpanding
{
  [(PLExpandableView *)self _setAutorotationDisabled:1];
  if ((*((unsigned char *)&self->_expandFlags + 1) & 0x10) != 0)
  {
    delegate = self->_delegate;
    [(PLExpandableViewDelegate *)delegate expandableViewWillBeginExpanding:self];
  }
}

- (void)_notifyDidCompleteCollapsing
{
  [(PLExpandableView *)self _setAutorotationDisabled:0];
  if ((*((unsigned char *)&self->_expandFlags + 2) & 8) != 0)
  {
    delegate = self->_delegate;
    [(PLExpandableViewDelegate *)delegate expandableViewDidCompleteCollapsing:self];
  }
}

- (void)_setAutorotationDisabled:(BOOL)a3
{
  $D001CA967CA97F9C3908BE3E81D85F1E expandFlags = self->_expandFlags;
  if (a3)
  {
    if ((*(unsigned char *)&expandFlags & 0x80) == 0)
    {
      self->_$D001CA967CA97F9C3908BE3E81D85F1E expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&expandFlags | 0x80);
      uint64_t v5 = (void *)[(PLExpandableView *)self window];
      [v5 beginDisablingInterfaceAutorotation];
    }
  }
  else if ((*(unsigned char *)&expandFlags & 0x80) != 0)
  {
    self->_$D001CA967CA97F9C3908BE3E81D85F1E expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&expandFlags & 0xFFFFFF7F);
    if (objc_msgSend((id)-[PLExpandableView window](self, "window"), "isInterfaceAutorotationDisabled"))
    {
      CGPoint v6 = (void *)[(PLExpandableView *)self window];
      [v6 endDisablingInterfaceAutorotation];
    }
  }
}

- (void)dealloc
{
  self->_expansionCompletionHandler = 0;
  self->_collapsingCompletionHandler = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLExpandableView;
  [(PLExpandableView *)&v3 dealloc];
}

- (PLExpandableView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLExpandableView;
  CGRect result = -[PLExpandableView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result->_$D001CA967CA97F9C3908BE3E81D85F1E expandFlags = ($D001CA967CA97F9C3908BE3E81D85F1E)(*(_DWORD *)&result->_expandFlags & 0xFFFFF7F8 | 0x800);
  return result;
}

@end