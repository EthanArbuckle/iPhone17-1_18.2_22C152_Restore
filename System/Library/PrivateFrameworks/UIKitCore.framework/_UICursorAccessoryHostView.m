@interface _UICursorAccessoryHostView
- (BOOL)isCollapsed;
- (BOOL)touchFallbackEnabled;
- (CGRect)selectionRect;
- (_UIContainerWindowPortalInteraction)portalInteraction;
- (_UICursorAccessoryHostView)initWithCursorItemDataSource:(id)a3;
- (_UICursorAccessoryView)cursorAccessoryView;
- (unint64_t)preferredPlacementEdge;
- (void)_didRecognizeDismissGestureRecognizer:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)removeFromSuperview;
- (void)setCollapsed:(BOOL)a3;
- (void)setCursorAccessoryView:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setPortalInteraction:(id)a3;
- (void)setPreferredPlacementEdge:(unint64_t)a3;
- (void)setSelectionRect:(CGRect)a3;
- (void)setTouchFallbackEnabled:(BOOL)a3;
@end

@implementation _UICursorAccessoryHostView

- (_UICursorAccessoryHostView)initWithCursorItemDataSource:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_UICursorAccessoryHostView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    v9->_preferredPlacementEdge = 4;
    v9->_resolvedPlacement = 0;
    v11 = [[_UICursorAccessoryView alloc] initWithDataSource:v4];
    cursorAccessoryView = v10->_cursorAccessoryView;
    v10->_cursorAccessoryView = v11;

    [(UIView *)v10 addSubview:v10->_cursorAccessoryView];
    v13 = objc_alloc_init(_UIContainerWindowPortalInteraction);
    portalInteraction = v10->_portalInteraction;
    v10->_portalInteraction = v13;

    [(_UIContainerWindowPortalInteraction *)v10->_portalInteraction setAttemptsToUseAncestorViewContainer:0];
    [(UIView *)v10->_cursorAccessoryView addInteraction:v10->_portalInteraction];
    v15 = -[_UITouchFallbackView initWithFrame:]([_UITouchFallbackView alloc], "initWithFrame:", v5, v6, v7, v8);
    touchFallbackView = v10->_touchFallbackView;
    v10->_touchFallbackView = v15;

    [(UIView *)v10->_touchFallbackView setAutoresizingMask:18];
    v17 = [[UITapGestureRecognizer alloc] initWithTarget:v10 action:sel__didRecognizeDismissGestureRecognizer_];
    dismissGestureRecognizer = v10->_dismissGestureRecognizer;
    v10->_dismissGestureRecognizer = v17;
  }
  return v10;
}

- (void)dealloc
{
  v3 = [(UIView *)self window];
  [v3 removeGestureRecognizer:self->_dismissGestureRecognizer];

  [(UIView *)self->_touchFallbackView removeFromSuperview];
  v4.receiver = self;
  v4.super_class = (Class)_UICursorAccessoryHostView;
  [(UIView *)&v4 dealloc];
}

- (void)removeFromSuperview
{
  [(_UICursorAccessoryHostView *)self setTouchFallbackEnabled:0];
  v3.receiver = self;
  v3.super_class = (Class)_UICursorAccessoryHostView;
  [(UIView *)&v3 removeFromSuperview];
}

- (void)setSelectionRect:(CGRect)a3
{
  self->_selectionRect = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)setHidden:(BOOL)a3
{
  if (a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UICursorAccessoryHostView;
    [(UIView *)&v4 setHidden:1];
    [(_UIContainerWindowPortalInteraction *)self->_portalInteraction setEnabled:0];
  }
  else
  {
    if ([(UIView *)self isHidden]) {
      [(UIView *)self setNeedsLayout];
    }
    v4.receiver = self;
    v4.super_class = (Class)_UICursorAccessoryHostView;
    [(UIView *)&v4 setHidden:0];
  }
}

- (void)setTouchFallbackEnabled:(BOOL)a3
{
  if (self->_touchFallbackEnabled != a3)
  {
    BOOL v3 = a3;
    double v5 = [(UIView *)self window];
    double v6 = v5;
    dismissGestureRecognizer = self->_dismissGestureRecognizer;
    if (v3)
    {
      [v5 addGestureRecognizer:dismissGestureRecognizer];

      double v8 = [(UIView *)self window];
      [v8 bounds];
      -[UIView setFrame:](self->_touchFallbackView, "setFrame:");

      v9 = [(UIView *)self window];
      [v9 insertSubview:self->_touchFallbackView atIndex:0];
    }
    else
    {
      [v5 removeGestureRecognizer:dismissGestureRecognizer];

      [(UIView *)self->_touchFallbackView removeFromSuperview];
    }
    self->_touchFallbackEnabled = v3;
  }
}

- (void)layoutSubviews
{
  v122.receiver = self;
  v122.super_class = (Class)_UICursorAccessoryHostView;
  [(UIView *)&v122 layoutSubviews];
  if (![(UIView *)self isHidden])
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    cursorAccessoryView = self->_cursorAccessoryView;
    [(UIView *)self bounds];
    -[_UICursorAccessoryView sizeThatFits:](cursorAccessoryView, "sizeThatFits:", v6, v7);
    CGFloat v9 = v8;
    double v11 = v10;
    -[UIView setBounds:](self->_cursorAccessoryView, "setBounds:", v3, v4, v8, v10);
    v123.origin.x = v3;
    v123.origin.y = v4;
    v123.size.width = v9;
    v123.size.height = v11;
    [(_UIContainerWindowPortalInteraction *)self->_portalInteraction setEnabled:!CGRectIsEmpty(v123)];
    p_selectionRect = &self->_selectionRect;
    if (CGRectIsEmpty(self->_selectionRect))
    {
LABEL_23:
      [(UIView *)self->_cursorAccessoryView layoutIfNeeded];
      [(_UIContainerWindowPortalInteraction *)self->_portalInteraction ensureVisibilityInContainerWindow];
      return;
    }
    v13 = [(UIView *)self keyboardSceneDelegate];
    [v13 visibleFrameInView:self];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    v22 = [(UIView *)self window];
    v23 = [v22 windowScene];
    v24 = [v23 coordinateSpace];
    -[UIView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v24, v15, v17, v19, v21);
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    CGFloat v114 = v28;
    CGFloat v115 = v26;
    v124.origin.x = v26;
    v124.origin.y = v28;
    CGFloat v112 = v32;
    CGFloat v113 = v30;
    v124.size.width = v30;
    v124.size.height = v32;
    double Height = CGRectGetHeight(v124);
    CGFloat v118 = v3;
    CGFloat rect = v4;
    v125.origin.x = v3;
    v125.origin.y = v4;
    v125.size.width = v9;
    v125.size.height = v11;
    double v33 = CGRectGetHeight(v125) * 0.5 + 3.0;
    v126.origin.x = p_selectionRect->origin.x;
    v126.origin.y = self->_selectionRect.origin.y;
    v126.size.width = self->_selectionRect.size.width;
    v126.size.height = self->_selectionRect.size.height;
    double MidX = CGRectGetMidX(v126);
    [(_UICursorAccessoryView *)self->_cursorAccessoryView activeAccessoryXOffset];
    double v120 = MidX + v35;
    unint64_t preferredPlacementEdge = self->_preferredPlacementEdge;
    if (preferredPlacementEdge != 1)
    {
      if (preferredPlacementEdge != 4)
      {
        double v117 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        goto LABEL_11;
      }
      v127.origin.x = p_selectionRect->origin.x;
      v127.origin.y = self->_selectionRect.origin.y;
      v127.size.width = self->_selectionRect.size.width;
      v127.size.height = self->_selectionRect.size.height;
      double v117 = v33 + CGRectGetMaxY(v127);
      double v37 = v11 * 0.5 + v117;
      double MinY = Height;
      if (Height <= 0.0
        || (v128.origin.y = v28,
            v128.origin.x = v115,
            v128.size.height = v32,
            v128.size.width = v30,
            double MinY = CGRectGetMinY(v128),
            v37 <= MinY))
      {
        v39 = [(UIView *)self window];
        [v39 safeAreaInsets];
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;
        double v47 = v46;

        v48 = [(UIView *)self window];
        [v48 frame];
        double v110 = v41 + v50;
        double v111 = v43 + v49;
        double v52 = v51 - (v43 + v47);
        double v54 = v53 - (v41 + v45);

        v55 = [(UIView *)self window];
        v56 = [v55 windowScene];
        v57 = [v56 coordinateSpace];
        -[UIView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v57, v111, v110, v52, v54);
        CGFloat v59 = v58;
        CGFloat v61 = v60;
        CGFloat v63 = v62;
        CGFloat v65 = v64;

        v129.origin.x = v59;
        v129.origin.y = v61;
        v129.size.width = v63;
        v129.size.height = v65;
        if (v37 <= CGRectGetMaxY(v129))
        {
          unint64_t preferredPlacementEdge = 4;
          goto LABEL_11;
        }
      }
    }
    v130.origin.x = p_selectionRect->origin.x;
    v130.origin.y = self->_selectionRect.origin.y;
    v130.size.width = self->_selectionRect.size.width;
    v130.size.height = self->_selectionRect.size.height;
    double v117 = CGRectGetMinY(v130) - v33;
    unint64_t preferredPlacementEdge = 1;
LABEL_11:
    self->_resolvedPlacement = preferredPlacementEdge;
    v66 = [(UIView *)self->_cursorAccessoryView window];
    [v66 bounds];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", 0);
    CGFloat v68 = v67;
    CGFloat v70 = v69;
    CGFloat v72 = v71;
    CGFloat v74 = v73;
    v131.origin.x = v118;
    v131.origin.y = rect;
    v131.size.width = v9;
    v131.size.height = v11;
    double v75 = CGRectGetWidth(v131) * 0.5;
    v132.origin.x = v68;
    v132.origin.y = v70;
    v132.size.width = v72;
    v132.size.height = v74;
    CGFloat v76 = CGRectGetMinX(v132) + -1.0;
    v133.origin.x = v68;
    v133.origin.y = v70;
    v133.size.width = v72;
    v133.size.height = v74;
    double MaxX = CGRectGetMaxX(v133);
    double v78 = v120;
    if (v120 - v75 >= v76)
    {
      if (v120 + v75 > MaxX + 1.0)
      {
        v135.origin.x = v68;
        v135.origin.y = v70;
        v135.size.width = v72;
        v135.size.height = v74;
        double v78 = CGRectGetMaxX(v135) - v75;
      }
    }
    else
    {
      v134.origin.x = v68;
      v134.origin.y = v70;
      v134.size.width = v72;
      v134.size.height = v74;
      double v78 = v75 + CGRectGetMinX(v134);
    }
    double v121 = v78;
    v79 = [(UIView *)self _scroller];
    if ([v79 _canScrollY])
    {
      [v79 safeAreaInsets];
      double v83 = v82;
      double v85 = v84;
      double v87 = v86;
      double v89 = v88;
      [v79 visibleBounds];
      double v91 = v85 + v90;
      double v93 = v83 + v92;
      double v95 = v94 - (v85 + v89);
      double v97 = v96 - (v83 + v87);
      if (Height > 0.0)
      {
        v136.origin.x = v91;
        v136.origin.y = v93;
        v136.size.width = v95;
        v136.size.height = v97;
        v143.origin.y = v114;
        v143.origin.x = v115;
        v143.size.height = v112;
        v143.size.width = v113;
        CGRect v137 = CGRectIntersection(v136, v143);
        double v97 = v97 - v137.size.height;
      }
      v138.origin.x = v91;
      v138.origin.y = v93;
      v138.size.width = v95;
      v138.size.height = v97;
      CGRect v139 = CGRectInset(v138, 3.0, 3.0);
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v79, v139.origin.x, v139.origin.y, v139.size.width, v139.size.height);
      CGFloat v99 = v98;
      CGFloat v101 = v100;
      CGFloat v103 = v102;
      CGFloat v105 = v104;
      v140.origin.x = v118;
      v140.origin.y = rect;
      v140.size.width = v9;
      v140.size.height = v11;
      double v106 = CGRectGetHeight(v140) * 0.5;
      v141.origin.x = v99;
      v141.origin.y = v101;
      v141.size.width = v103;
      v141.size.height = v105;
      double v107 = CGRectGetMinY(v141);
      v142.origin.x = v99;
      v142.origin.y = v101;
      v142.size.width = v103;
      v142.size.height = v105;
      double v108 = CGRectGetMaxY(v142) - v106;
      double v81 = v117;
      double v109 = v121;
      if (v117 <= v108)
      {
        double v80 = v107 + v106;
        double v108 = v117;
        if (v117 < v107 + v106) {
          double v108 = v107 + v106;
        }
      }
    }
    else
    {
      double v108 = v117;
      double v109 = v121;
    }
    -[UIView setCenter:](self->_cursorAccessoryView, "setCenter:", v109, v108, v80, v81);

    goto LABEL_23;
  }
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
  if (a3)
  {
    [(UIView *)self layoutIfNeeded];
    double v4 = 3.0;
    if (self->_resolvedPlacement == 1) {
      double v4 = -3.0;
    }
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeTranslation(&v14, 0.0, -v4);
    CGAffineTransform v13 = v14;
    CGAffineTransformScale(&t2, &v13, 0.4, 0.4);
    CGAffineTransform t1 = v14;
    CGAffineTransformConcat(&v13, &t1, &t2);
    CGAffineTransform v14 = v13;
    CGAffineTransform v10 = v13;
    [(UIView *)self->_cursorAccessoryView setTransform:&v10];
    cursorAccessoryView = self->_cursorAccessoryView;
    double v6 = 0.0;
  }
  else
  {
    double v7 = self->_cursorAccessoryView;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v9[0] = *MEMORY[0x1E4F1DAB8];
    v9[1] = v8;
    v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIView *)v7 setTransform:v9];
    cursorAccessoryView = self->_cursorAccessoryView;
    double v6 = 1.0;
  }
  [(UIView *)cursorAccessoryView setAlpha:v6];
}

- (void)_didRecognizeDismissGestureRecognizer:(id)a3
{
  if (([a3 state] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v3 = +[UIKeyboardImpl sharedInstance];
    [v3 dismissCursorAccessory];
  }
}

- (CGRect)selectionRect
{
  double x = self->_selectionRect.origin.x;
  double y = self->_selectionRect.origin.y;
  double width = self->_selectionRect.size.width;
  double height = self->_selectionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)preferredPlacementEdge
{
  return self->_preferredPlacementEdge;
}

- (void)setPreferredPlacementEdge:(unint64_t)a3
{
  self->_unint64_t preferredPlacementEdge = a3;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (_UICursorAccessoryView)cursorAccessoryView
{
  return self->_cursorAccessoryView;
}

- (void)setCursorAccessoryView:(id)a3
{
}

- (BOOL)touchFallbackEnabled
{
  return self->_touchFallbackEnabled;
}

- (_UIContainerWindowPortalInteraction)portalInteraction
{
  return self->_portalInteraction;
}

- (void)setPortalInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalInteraction, 0);
  objc_storeStrong((id *)&self->_cursorAccessoryView, 0);
  objc_storeStrong((id *)&self->_touchFallbackView, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
}

@end