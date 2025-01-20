@interface UIBandSelectionInteraction
- (BOOL)_debugUIEnabled;
- (BOOL)_gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4;
- (BOOL)_isSelecting;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isEnabled;
- (CGPoint)_locationInView:(id)a3;
- (CGRect)_selectionRectWithLocation:(CGPoint)a3;
- (CGRect)selectionRect;
- (UIBandSelectionInteraction)initWithSelectionHandler:(void *)selectionHandler;
- (UIBandSelectionInteractionState)state;
- (UIHoverGestureRecognizer)hoverGR;
- (UIKeyModifierFlags)initialModifierFlags;
- (UILongPressGestureRecognizer)pressGR;
- (UIView)view;
- (_UISelectionBandVisualProviding)visualProvider;
- (id)_bandVisibilityHandler;
- (id)selectionHandler;
- (unint64_t)_handleBeginEvent;
- (void)_callHandlerWithState:(int64_t)a3;
- (void)_handleDidBegin;
- (void)_handleDidEndFromState:(unint64_t)a3;
- (void)_handleDidMove;
- (void)_handleHoverGesture:(id)a3;
- (void)_handlePressGesture:(id)a3;
- (void)_setBandVisibilityHandler:(id)a3;
- (void)_updateDebugUIWithGesture:(id)a3;
- (void)_updateInteractionEnabled;
- (void)_viewTraitCollectionDidChange:(id)a3;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setHoverGR:(id)a3;
- (void)setPressGR:(id)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setShouldBeginHandler:(void *)shouldBeginHandler;
- (void)setVisualProvider:(id)a3;
- (void)set_debugUIEnabled:(BOOL)a3;
- (void)shouldBeginHandler;
- (void)willMoveToView:(id)a3;
@end

@implementation UIBandSelectionInteraction

- (void)_viewTraitCollectionDidChange:(id)a3
{
  uint64_t v4 = [a3 userInterfaceIdiom];
  v5 = [(UIBandSelectionInteraction *)self view];
  v6 = [v5 traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v4 != v7)
  {
    [(UIBandSelectionInteraction *)self _updateInteractionEnabled];
  }
}

- (void)_updateInteractionEnabled
{
  uint64_t v3 = [(UIBandSelectionInteraction *)self view];

  if (v3)
  {
    uint64_t v4 = [(UIBandSelectionInteraction *)self view];
    v5 = [v4 traitCollection];
    uint64_t v6 = [v5 userInterfaceIdiom];

    BOOL v7 = [(UIBandSelectionInteraction *)self isEnabled];
    uint64_t v3 = (v6 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v7;
  }
  v8 = [(UIBandSelectionInteraction *)self visualProvider];
  [v8 setEnabled:v3];

  v9 = [(UIBandSelectionInteraction *)self hoverGR];
  [v9 setEnabled:v3];

  id v10 = [(UIBandSelectionInteraction *)self pressGR];
  [v10 setEnabled:v3];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (_UISelectionBandVisualProviding)visualProvider
{
  return self->_visualProvider;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)willMoveToView:(id)a3
{
  uint64_t v4 = [(UIBandSelectionInteraction *)self hoverGR];
  v5 = [v4 view];
  uint64_t v6 = [(UIBandSelectionInteraction *)self hoverGR];
  [v5 removeGestureRecognizer:v6];

  BOOL v7 = [(UIBandSelectionInteraction *)self pressGR];
  v8 = [v7 view];
  v9 = [(UIBandSelectionInteraction *)self pressGR];
  [v8 removeGestureRecognizer:v9];

  id v10 = [(UIBandSelectionInteraction *)self visualProvider];
  [v10 setView:0];

  objc_storeWeak((id *)&self->_view, 0);
}

- (void)setShouldBeginHandler:(void *)shouldBeginHandler
{
}

- (UIBandSelectionInteraction)initWithSelectionHandler:(void *)selectionHandler
{
  uint64_t v4 = selectionHandler;
  v8.receiver = self;
  v8.super_class = (Class)UIBandSelectionInteraction;
  v5 = [(UIBandSelectionInteraction *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(UIBandSelectionInteraction *)v5 setSelectionHandler:v4];
    v6->_enabled = 1;
    v6->_internalState = 1;
  }

  return v6;
}

- (void)setSelectionHandler:(id)a3
{
}

- (void)_setBandVisibilityHandler:(id)a3
{
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  objc_storeWeak((id *)&self->_view, a3);
  v5 = [(UIBandSelectionInteraction *)self hoverGR];

  if (!v5)
  {
    uint64_t v6 = [[UIHoverGestureRecognizer alloc] initWithTarget:self action:sel__handleHoverGesture_];
    [(UIBandSelectionInteraction *)self setHoverGR:v6];

    BOOL v7 = [(UIBandSelectionInteraction *)self hoverGR];
    [v7 setName:@"com.apple.UIKit.bandSelectionHover"];

    objc_super v8 = [(UIBandSelectionInteraction *)self hoverGR];
    [v8 _setPausesWhilePanning:0];

    v9 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__handlePressGesture_];
    [(UIBandSelectionInteraction *)self setPressGR:v9];

    id v10 = [(UIBandSelectionInteraction *)self pressGR];
    [v10 setName:@"com.apple.UIKit.bandSelectionInitiationPress"];

    v11 = [(UIBandSelectionInteraction *)self pressGR];
    [v11 setMinimumPressDuration:0.0];

    v12 = [(UIBandSelectionInteraction *)self pressGR];
    [v12 setButtonMaskRequired:1];

    v13 = [(UIBandSelectionInteraction *)self pressGR];
    [v13 setDelegate:self];

    v14 = [(UIBandSelectionInteraction *)self pressGR];
    [v14 setDelaysTouchesEnded:0];

    v15 = [(UIBandSelectionInteraction *)self pressGR];
    [v15 setCancelsTouchesInView:0];

    v16 = objc_opt_new();
    [(UIBandSelectionInteraction *)self setVisualProvider:v16];
  }
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  v18 = [(UIBandSelectionInteraction *)self hoverGR];
  [WeakRetained addGestureRecognizer:v18];

  id v19 = objc_loadWeakRetained((id *)p_view);
  v20 = [(UIBandSelectionInteraction *)self pressGR];
  [v19 addGestureRecognizer:v20];

  v21 = [(UIBandSelectionInteraction *)self visualProvider];
  id v22 = objc_loadWeakRetained((id *)p_view);
  [v21 setView:v22];

  [(UIBandSelectionInteraction *)self _updateInteractionEnabled];
}

- (UILongPressGestureRecognizer)pressGR
{
  return self->_pressGR;
}

- (UIHoverGestureRecognizer)hoverGR
{
  return self->_hoverGR;
}

- (void)setVisualProvider:(id)a3
{
}

- (void)setPressGR:(id)a3
{
}

- (void)setHoverGR:(id)a3
{
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    [(UIBandSelectionInteraction *)self _updateInteractionEnabled];
  }
}

- (void)dealloc
{
  [(UIBandSelectionInteraction *)self willMoveToView:0];
  v3.receiver = self;
  v3.super_class = (Class)UIBandSelectionInteraction;
  [(UIBandSelectionInteraction *)&v3 dealloc];
}

- (CGRect)selectionRect
{
  if (self->_internalState < 2)
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    objc_super v3 = [(UIBandSelectionInteraction *)self view];
    [(UIBandSelectionInteraction *)self _locationInView:v3];
    double v5 = v4;
    double v7 = v6;

    -[UIBandSelectionInteraction _selectionRectWithLocation:](self, "_selectionRectWithLocation:", v5, v7);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)_selectionRectWithLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UIBandSelectionInteraction *)self view];
  double v7 = self->_initialLocation.x;
  double v8 = self->_initialLocation.y;
  [v6 _currentScreenScale];
  double v10 = UIPointRoundToScale(v7, v8, v9);
  double v12 = v11;
  v13 = [(UIBandSelectionInteraction *)self view];
  [v13 _currentScreenScale];
  double v15 = UIPointRoundToScale(x, y, v14);
  if (v10 >= v15) {
    CGFloat v17 = v15;
  }
  else {
    CGFloat v17 = v10;
  }
  if (v12 >= v16) {
    CGFloat v18 = v16;
  }
  else {
    CGFloat v18 = v12;
  }
  double v19 = vabdd_f64(v10, v15);
  double v20 = vabdd_f64(v12, v16);

  v28.origin.double x = v17;
  v28.origin.double y = v18;
  v28.size.width = v19;
  v28.size.height = v20;
  BOOL v21 = CGRectEqualToRect(v28, *MEMORY[0x1E4F1DB28]);
  double v22 = 1.0;
  if (v20 >= 1.0) {
    double v23 = v20;
  }
  else {
    double v23 = 1.0;
  }
  if (v19 >= 1.0) {
    double v22 = v19;
  }
  if (v21) {
    double v24 = v20;
  }
  else {
    double v24 = v23;
  }
  if (v21) {
    double v25 = v19;
  }
  else {
    double v25 = v22;
  }
  double v26 = v17;
  double v27 = v18;
  result.size.height = v24;
  result.size.width = v25;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (CGPoint)_locationInView:(id)a3
{
  id v4 = a3;
  double v5 = [(UIBandSelectionInteraction *)self hoverGR];
  [v5 locationInView:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)_handlePressGesture:(id)a3
{
  id v8 = a3;
  if ([v8 state] == 1)
  {
    p_unint64_t internalState = (uint64_t *)&self->_internalState;
    unint64_t internalState = self->_internalState;
    uint64_t v6 = 0;
  }
  else
  {
    if ([v8 state] < 3) {
      goto LABEL_6;
    }
    p_unint64_t internalState = (uint64_t *)&self->_internalState;
    unint64_t internalState = self->_internalState;
    uint64_t v6 = 2;
  }
  handleEvent(stateMachineSpec_2, internalState, v6, (uint64_t)self, p_internalState);
LABEL_6:
  double v7 = [(UIBandSelectionInteraction *)self hoverGR];
  [(UIBandSelectionInteraction *)self _updateDebugUIWithGesture:v7];
}

- (void)_handleHoverGesture:(id)a3
{
  if ([a3 state] == 2) {
    handleEvent(stateMachineSpec_2, self->_internalState, 1, (uint64_t)self, (uint64_t *)&self->_internalState);
  }
  if (![(UIBandSelectionInteraction *)self _isSelecting])
  {
    id v4 = [(UIBandSelectionInteraction *)self view];
    [(UIBandSelectionInteraction *)self _locationInView:v4];
    self->_initialLocation.double x = v5;
    self->_initialLocation.double y = v6;
  }
  id v7 = [(UIBandSelectionInteraction *)self hoverGR];
  [(UIBandSelectionInteraction *)self _updateDebugUIWithGesture:v7];
}

- (BOOL)_isSelecting
{
  return self->_internalState == 3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIBandSelectionInteraction *)self pressGR];

  if (v8 == v7) {
    char v9 = [v6 _isPointerTouch];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)_gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(UIBandSelectionInteraction *)self pressGR];

  return v6 != v5;
}

- (BOOL)_gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIBandSelectionInteraction *)self pressGR];

  if (v8 == v7) {
    char isDragInteractionGestureRecognizer = _isDragInteractionGestureRecognizer(v6);
  }
  else {
    char isDragInteractionGestureRecognizer = 1;
  }

  return isDragInteractionGestureRecognizer;
}

- (unint64_t)_handleBeginEvent
{
  objc_super v3 = [(UIBandSelectionInteraction *)self view];
  [(UIBandSelectionInteraction *)self _locationInView:v3];
  self->_initialLocation.double x = v4;
  self->_initialLocation.double y = v5;

  id v6 = [(UIBandSelectionInteraction *)self pressGR];
  self->_initialModifierFlags = [v6 modifierFlags];

  id v7 = [(UIBandSelectionInteraction *)self shouldBeginHandler];

  if (!v7) {
    return 2;
  }
  id v8 = [(UIBandSelectionInteraction *)self shouldBeginHandler];
  int v9 = ((uint64_t (**)(void, UIBandSelectionInteraction *, double, double))v8)[2](v8, self, self->_initialLocation.x, self->_initialLocation.y);

  if (v9) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)_handleDidBegin
{
  objc_super v3 = [(UIBandSelectionInteraction *)self _bandVisibilityHandler];
  if (v3)
  {
    CGFloat v4 = [(UIBandSelectionInteraction *)self _bandVisibilityHandler];
    self->_hidesVisuals = v4[2](self->_initialLocation.x, self->_initialLocation.y) ^ 1;
    p_hidesVisuals = &self->_hidesVisuals;
  }
  else
  {
    self->_hidesVisuals = 0;
    p_hidesVisuals = &self->_hidesVisuals;
  }

  if (!*p_hidesVisuals)
  {
    id v6 = [(UIBandSelectionInteraction *)self visualProvider];
    objc_msgSend(v6, "beginAtPoint:", self->_initialLocation.x, self->_initialLocation.y);
  }
  [(UIBandSelectionInteraction *)self _callHandlerWithState:1];
}

- (void)_handleDidMove
{
  if (!self->_hidesVisuals)
  {
    objc_super v3 = [(UIBandSelectionInteraction *)self visualProvider];
    CGFloat v4 = [(UIBandSelectionInteraction *)self view];
    [(UIBandSelectionInteraction *)self _locationInView:v4];
    objc_msgSend(v3, "updateWithPoint:");
  }
  [(UIBandSelectionInteraction *)self _callHandlerWithState:2];
}

- (void)_handleDidEndFromState:(unint64_t)a3
{
  if (!self->_hidesVisuals)
  {
    CGFloat v5 = [(UIBandSelectionInteraction *)self visualProvider];
    id v6 = [(UIBandSelectionInteraction *)self view];
    [(UIBandSelectionInteraction *)self _locationInView:v6];
    objc_msgSend(v5, "endAtPoint:");
  }
  if (a3 != 1) {
    [(UIBandSelectionInteraction *)self _callHandlerWithState:3];
  }
  self->_initialLocation = (CGPoint)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  self->_hidesVisuals = 0;
  self->_state = 0;
  self->_initialModifierFlags = 0;
}

- (void)_callHandlerWithState:(int64_t)a3
{
  self->_state = a3;
  CGFloat v4 = [(UIBandSelectionInteraction *)self selectionHandler];
  v4[2](v4, self);
}

- (void)_updateDebugUIWithGesture:(id)a3
{
  id v4 = a3;
  if (-[UIBandSelectionInteraction _debugUIEnabled](self, "_debugUIEnabled") && [v4 state] < 3)
  {
    if (!_MergedGlobals_1133)
    {
      int v9 = [(UIBandSelectionInteraction *)self view];
      uint64_t v10 = [v9 window];
      double v11 = (void *)qword_1EB261B40;
      qword_1EB261B40 = v10;

      double v12 = -[_UIMIDebugPointerView initWithFrame:]([_UIMIDebugPointerView alloc], "initWithFrame:", 0.0, 0.0, 19.0, 19.0);
      v13 = (void *)_MergedGlobals_1133;
      _MergedGlobals_1133 = (uint64_t)v12;

      [(id)_MergedGlobals_1133 setUserInteractionEnabled:0];
      double v14 = [(id)_MergedGlobals_1133 layer];
      [v14 setZPosition:100000.0];

      [(id)qword_1EB261B40 addSubview:_MergedGlobals_1133];
    }
    if (!qword_1EB261B38)
    {
      uint64_t v15 = objc_opt_new();
      double v16 = (void *)qword_1EB261B38;
      qword_1EB261B38 = v15;

      CGFloat v17 = [(id)qword_1EB261B38 shapeLayer];
      [v17 setFillColor:0];

      id v18 = +[UIColor colorWithWhite:0.0 alpha:0.5];
      uint64_t v19 = [v18 CGColor];
      double v20 = [(id)qword_1EB261B38 shapeLayer];
      [v20 setStrokeColor:v19];

      uint64_t v21 = *MEMORY[0x1E4F3A470];
      double v22 = [(id)qword_1EB261B38 shapeLayer];
      [v22 setLineJoin:v21];

      double v23 = [(id)qword_1EB261B38 shapeLayer];
      [v23 setLineDashPattern:&unk_1ED3F0748];

      [(id)qword_1EB261B40 addSubview:qword_1EB261B38];
    }
    [(UIBandSelectionInteraction *)self selectionRect];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    [(id)qword_1EB261B38 frame];
    if (v29 != v33 || v31 != v32)
    {
      v35 = [(UIBandSelectionInteraction *)self view];
      objc_msgSend(v35, "convertRect:toView:", qword_1EB261B40, v25, v27, v29, v31);
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;

      objc_msgSend((id)qword_1EB261B38, "setFrame:", v37, v39, v41, v43);
      +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v41, v43);
      id v44 = objc_claimAutoreleasedReturnValue();
      uint64_t v45 = [v44 CGPath];
      v46 = [(id)qword_1EB261B38 shapeLayer];
      [v46 setPath:v45];
    }
    if (!qword_1EB261B48)
    {
      v47 = +[UIColor systemPurpleColor];
      uint64_t v48 = +[_UIDebugDot dotWithTitle:@"Initial Location" color:v47];
      v49 = (void *)qword_1EB261B48;
      qword_1EB261B48 = v48;

      [(id)qword_1EB261B40 addSubview:qword_1EB261B48];
    }
    if (!qword_1EB261B50)
    {
      v50 = +[UIColor systemBlueColor];
      uint64_t v51 = +[_UIDebugDot dotWithTitle:@"Current Location" color:v50];
      v52 = (void *)qword_1EB261B50;
      qword_1EB261B50 = v51;

      [(id)qword_1EB261B40 addSubview:qword_1EB261B50];
    }
    v53 = [(UIBandSelectionInteraction *)self view];
    [v4 locationInView:v53];
    double v55 = v54;
    double v57 = v56;

    v58 = [(UIBandSelectionInteraction *)self view];
    objc_msgSend(v58, "convertPoint:toView:", qword_1EB261B40, self->_initialLocation.x, self->_initialLocation.y);
    objc_msgSend((id)qword_1EB261B48, "setCenter:");

    v59 = [(UIBandSelectionInteraction *)self view];
    objc_msgSend(v59, "convertPoint:toView:", qword_1EB261B40, v55, v57);
    objc_msgSend((id)qword_1EB261B50, "setCenter:");

    id v60 = (id)*MEMORY[0x1E4F39EA0];
    [(UIBandSelectionInteraction *)self selectionRect];
    CGRect v84 = CGRectInset(v83, -9.5, -9.5);
    CGFloat x = v84.origin.x;
    CGFloat y = v84.origin.y;
    CGFloat width = v84.size.width;
    CGFloat height = v84.size.height;
    if (CGRectGetHeight(v84) > 19.0
      || (v85.origin.CGFloat x = x,
          v85.origin.CGFloat y = y,
          v85.size.CGFloat width = width,
          v85.size.CGFloat height = height,
          CGRectGetWidth(v85) > 19.0))
    {
      id v65 = (id)*MEMORY[0x1E4F39EA8];

      id v60 = v65;
    }
    v86.origin.CGFloat x = x;
    v86.origin.CGFloat y = y;
    v86.size.CGFloat width = width;
    v86.size.CGFloat height = height;
    double v66 = CGRectGetMinX(v86) - v55 + 9.5;
    v87.origin.CGFloat x = x;
    v87.origin.CGFloat y = y;
    v87.size.CGFloat width = width;
    v87.size.CGFloat height = height;
    double v67 = CGRectGetMinY(v87) - v57 + 9.5;
    v88.origin.CGFloat x = x;
    v88.origin.CGFloat y = y;
    v88.size.CGFloat width = width;
    v88.size.CGFloat height = height;
    double v76 = v57;
    double v68 = v55;
    CGFloat v69 = CGRectGetWidth(v88);
    v89.origin.CGFloat x = x;
    v89.origin.CGFloat y = y;
    v89.size.CGFloat width = width;
    v89.size.CGFloat height = height;
    CGFloat v70 = CGRectGetHeight(v89);
    v71 = objc_opt_new();
    [v71 setDampingRatio:1.0 response:0.3];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke;
    v80[3] = &unk_1E52D9CD0;
    id v81 = v60;
    uint64_t v82 = 0x3FF0000000000000;
    id v72 = v60;
    +[UIView _animateUsingSpringBehavior:v71 tracking:0 animations:v80 completion:0];
    if ([(UIBandSelectionInteraction *)self _isSelecting]) {
      double v73 = 0.0001;
    }
    else {
      double v73 = 0.15;
    }
    v74 = objc_opt_new();
    [v74 setDampingRatio:1.0 response:v73];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke_2;
    v79[3] = &__block_descriptor_64_e5_v8__0l;
    *(double *)&v79[4] = v66;
    *(double *)&v79[5] = v67;
    *(CGFloat *)&v79[6] = v69;
    *(CGFloat *)&v79[7] = v70;
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke_3;
    v77[3] = &unk_1E52DA9D0;
    id v78 = v4;
    +[UIView _animateUsingSpringBehavior:v74 tracking:0 animations:v79 completion:v77];
    v75 = [(UIBandSelectionInteraction *)self view];
    objc_msgSend(v75, "convertPoint:toView:", qword_1EB261B40, v68, v76);
    objc_msgSend((id)_MergedGlobals_1133, "setCenter:");
  }
  else
  {
    [(id)_MergedGlobals_1133 removeFromSuperview];
    CGFloat v5 = (void *)_MergedGlobals_1133;
    _MergedGlobals_1133 = 0;

    [(id)qword_1EB261B38 removeFromSuperview];
    id v6 = (void *)qword_1EB261B38;
    qword_1EB261B38 = 0;

    [(id)qword_1EB261B48 removeFromSuperview];
    id v7 = (void *)qword_1EB261B48;
    qword_1EB261B48 = 0;

    [(id)qword_1EB261B50 removeFromSuperview];
    id v8 = (void *)qword_1EB261B50;
    qword_1EB261B50 = 0;
  }
}

void __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke(uint64_t a1)
{
  [(id)_MergedGlobals_1133 setAlpha:*(double *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [(id)_MergedGlobals_1133 layer];
  [v3 setCornerCurve:v2];
}

uint64_t __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke_2(double *a1)
{
  return objc_msgSend((id)_MergedGlobals_1133, "setBounds:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __56__UIBandSelectionInteraction__updateDebugUIWithGesture___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result >= 3)
  {
    uint64_t v2 = (void *)_MergedGlobals_1133;
    return [v2 setAlpha:0.0];
  }
  return result;
}

- (UIBandSelectionInteractionState)state
{
  return self->_state;
}

- (UIKeyModifierFlags)initialModifierFlags
{
  return self->_initialModifierFlags;
}

- (void)shouldBeginHandler
{
  return self->_shouldBeginHandler;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (BOOL)_debugUIEnabled
{
  return self->__debugUIEnabled;
}

- (void)set_debugUIEnabled:(BOOL)a3
{
  self->__debugUIEnabled = a3;
}

- (id)_bandVisibilityHandler
{
  return self->__bandVisibilityHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__bandVisibilityHandler, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_pressGR, 0);
  objc_storeStrong((id *)&self->_hoverGR, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong(&self->_shouldBeginHandler, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end