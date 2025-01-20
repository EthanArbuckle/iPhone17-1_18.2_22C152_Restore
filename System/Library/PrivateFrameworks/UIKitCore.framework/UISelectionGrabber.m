@interface UISelectionGrabber
+ (Class)layerClass;
+ (id)_grabberDot;
- (BOOL)animating;
- (BOOL)autoscrolled;
- (BOOL)clipDot:(CGRect)a3;
- (BOOL)dotIsVisibleInDocument:(CGRect)a3;
- (BOOL)inputViewIsChanging;
- (BOOL)isDotted;
- (BOOL)isPointedDown;
- (BOOL)isPointedLeft;
- (BOOL)isPointedRight;
- (BOOL)isPointedUp;
- (BOOL)isRotating;
- (BOOL)isScaling;
- (BOOL)isScrolling;
- (BOOL)isVertical;
- (BOOL)scroller:(id)a3 fullyContainSelectionRect:(CGRect)a4;
- (UISelectionGrabber)initWithFrame:(CGRect)a3;
- (UISelectionGrabberCustomPath)customPath;
- (double)_defaultDotWidth;
- (id)_dotView;
- (id)bezierPathFromCustomPath:(id)a3;
- (id)fillColor;
- (int64_t)orientation;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)animateGrabberInWithCompletion:(id)a3;
- (void)animateGrabberOutWithCompletion:(id)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)drawRect:(CGRect)a3;
- (void)redrawDotForScale:(double)a3;
- (void)removeFromSuperview;
- (void)setAnimating:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setCustomPath:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsDotted:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)transitionDot:(int64_t)a3 completion:(id)a4;
- (void)updateDot;
- (void)updatePathForBoundsChangeIfNecessary;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UISelectionGrabber

- (UISelectionGrabber)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UISelectionGrabber;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->m_screenScale = 1.0;
    [(UISelectionGrabber *)v3 setIsDotted:1];
    [(UIView *)v4 setOpaque:0];
    [(UIView *)v4 setUserInteractionEnabled:1];
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  [(UIView *)self->m_dotView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)UISelectionGrabber;
  [(UIView *)&v3 dealloc];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isScrolling
{
  v2 = [(UISelectionGrabber *)self hostView];
  char v3 = [v2 isScrolling];

  return v3;
}

- (BOOL)isScaling
{
  v2 = [(UISelectionGrabber *)self hostView];
  char v3 = [v2 scaling];

  return v3;
}

- (BOOL)isRotating
{
  v2 = [(UISelectionGrabber *)self hostView];
  char v3 = [v2 rotating];

  return v3;
}

- (BOOL)inputViewIsChanging
{
  v2 = [(UISelectionGrabber *)self hostView];
  char v3 = [v2 inputViewIsChanging];

  return v3;
}

- (BOOL)autoscrolled
{
  v2 = [(UISelectionGrabber *)self hostView];
  char v3 = [v2 autoscrolled];

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIImageView setHidden:](self->m_dotView, "setHidden:");
  v5.receiver = self;
  v5.super_class = (Class)UISelectionGrabber;
  [(UIView *)&v5 setHidden:v3];
}

- (void)setCustomPath:(id)a3
{
  p_customPath = &self->_customPath;
  id v10 = a3;
  if ((-[UISelectionGrabberCustomPath isEqual:](*p_customPath, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_customPath, a3);
    v6 = [(UISelectionGrabber *)self shapeLayer];
    objc_super v7 = v6;
    if (*p_customPath)
    {
      -[UISelectionGrabber bezierPathFromCustomPath:](self, "bezierPathFromCustomPath:");
      id v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPath:", objc_msgSend(v8, "CGPath"));

      [(UISelectionGrabberCustomPath *)*p_customPath lineWidth];
      objc_msgSend(v7, "setLineWidth:");
      v9 = [(UISelectionGrabber *)self fillColor];
      objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v9, "cgColor"));
    }
    else
    {
      objc_msgSend(v6, "setPath:");
    }
    [(UIView *)self setNeedsDisplay];
  }
}

- (id)bezierPathFromCustomPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UISelectionGrabber *)self hostView];
  v6 = [v4 bezierPathForHostView:v5 targetView:self];

  return v6;
}

- (void)removeFromSuperview
{
  [(UIView *)self->m_dotView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)UISelectionGrabber;
  [(UIView *)&v3 removeFromSuperview];
}

- (BOOL)clipDot:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = [(UISelectionGrabber *)self hostView];
  v9 = [v8 selectionView];
  id v10 = [v9 selection];
  v11 = [v10 document];

  if [v11 _usesAsynchronousProtocol] && (objc_opt_respondsToSelector())
  {
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    id v12 = v11;
    [v12 unobscuredContentRect];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v12);
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    v21 = [(UIView *)self superview];
    [(UIView *)self frame];
    objc_msgSend(v21, "convertRect:toView:", 0);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;

    v51.origin.CGFloat x = v14;
    v51.origin.CGFloat y = v16;
    v51.size.CGFloat width = v18;
    v51.size.CGFloat height = v20;
    v55.origin.CGFloat x = v23;
    v55.origin.CGFloat y = v25;
    v55.size.CGFloat width = v27;
    v55.size.CGFloat height = v29;
    if (CGRectIntersectsRect(v51, v55))
    {
      v52.origin.CGFloat x = v14;
      v52.origin.CGFloat y = v16;
      v52.size.CGFloat width = v18;
      v52.size.CGFloat height = v20;
      BOOL v30 = CGRectContainsRect(v52, v49);
    }
    else
    {
      BOOL v30 = 1;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    [v11 visibleRect];
    objc_msgSend(v11, "convertRect:toView:", 0);
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    v39 = [(UIView *)self superview];
    [(UIView *)self frame];
    objc_msgSend(v39, "convertRect:toView:", 0);
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;

    v53.origin.CGFloat x = v32;
    v53.origin.CGFloat y = v34;
    v53.size.CGFloat width = v36;
    v53.size.CGFloat height = v38;
    v56.origin.CGFloat x = v41;
    v56.origin.CGFloat y = v43;
    v56.size.CGFloat width = v45;
    v56.size.CGFloat height = v47;
    if (CGRectIntersectsRect(v53, v56))
    {
      v54.origin.CGFloat x = v32;
      v54.origin.CGFloat y = v34;
      v54.size.CGFloat width = v36;
      v54.size.CGFloat height = v38;
      BOOL v30 = CGRectContainsRect(v54, v50);
    }
    else
    {
LABEL_8:
      BOOL v30 = 1;
    }
  }

  return v30;
}

- (BOOL)dotIsVisibleInDocument:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_super v7 = [(UISelectionGrabber *)self hostView];
  id v8 = [v7 selectionView];
  v9 = [v8 selection];
  id v10 = [v9 document];

  if [v10 _usesAsynchronousProtocol] && (objc_opt_respondsToSelector())
  {
    id v11 = v10;
    [v11 unobscuredContentRect];
    objc_msgSend(v11, "convertRect:toView:", 0);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
  }
  else
  {
    if (![v10 conformsToProtocol:&unk_1ED431E48]
      || (objc_opt_respondsToSelector() & 1) == 0)
    {
      BOOL v24 = 0;
      goto LABEL_9;
    }
    [v10 visibleRect];
    objc_msgSend(v10, "convertRect:toView:", 0);
    CGFloat v13 = v20;
    CGFloat v15 = v21;
    CGFloat v17 = v22;
    CGFloat v19 = v23;
  }
  v26.origin.CGFloat x = v13;
  v26.origin.CGFloat y = v15;
  v26.size.CGFloat width = v17;
  v26.size.CGFloat height = v19;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  BOOL v24 = CGRectContainsRect(v26, v27);
LABEL_9:

  return v24;
}

- (BOOL)scroller:(id)a3 fullyContainSelectionRect:(CGRect)a4
{
  double height = a4.size.height;
  CGFloat x = a4.origin.x;
  CGFloat width = a4.size.width;
  CGFloat v32 = a4.origin.y + 1.0;
  id v6 = a3;
  objc_super v7 = [(UISelectionGrabber *)self hostView];
  id v8 = [v7 selectionView];
  UIRoundToViewScale(v8);
  double rect2 = height - (v9 + 1.0);

  [v6 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [v6 contentInset];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  CGFloat v27 = v32;
  CGFloat v26 = x;
  CGFloat v28 = width;
  double v29 = rect2;
  v36.origin.CGFloat x = v11 + v21;
  v36.origin.CGFloat y = v13 + v19;
  v36.size.CGFloat width = v15 - (v21 + v25);
  v36.size.double height = v17 - (v19 + v23);
  return CGRectContainsRect(v36, *(CGRect *)&v26);
}

- (double)_defaultDotWidth
{
  double result = 11.0;
  if (self->m_screenScale == 1.0) {
    return 13.0;
  }
  return result;
}

- (void)updateDot
{
  if ([(UISelectionGrabber *)self isDotted])
  {
    objc_super v3 = [(UISelectionGrabber *)self hostView];
    id v4 = [v3 superview];

    if (v4)
    {
      objc_super v5 = [(UIView *)self window];

      if (v5)
      {
        id v6 = [(UIView *)self window];
        objc_msgSend(v6, "convertRect:toView:", self, 0.0, 0.0, 1.0, 1.0);
        double v8 = v7;
        double v10 = v9;
      }
      else
      {
        double v8 = 1.0;
        double v10 = 1.0;
      }
      [(UISelectionGrabber *)self _defaultDotWidth];
      double v13 = v12 * v8;
      double v183 = v10;
      double v14 = v12 * v10;
      if (!self->m_dotView)
      {
        double v15 = [UISelectionGrabberDot alloc];
        double v16 = [(UISelectionGrabber *)self hostView];
        double v17 = [v16 container];
        double v18 = -[UISelectionGrabberDot initWithFrame:container:](v15, "initWithFrame:container:", v17, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        m_dotView = self->m_dotView;
        self->m_dotView = v18;

        [(UISelectionGrabberDot *)self->m_dotView setGrabber:self];
        [(UIView *)self->m_dotView setOpaque:0];
        [(UIView *)self->m_dotView setUserInteractionEnabled:1];
      }
      double v20 = v13 - v8;
      [(UIView *)self bounds];
      double v23 = v22 + (v21 - v13) * 0.5;
      double v26 = v25 + (v24 - v14) * 0.5;
      double v27 = round(v23);
      double v28 = round(v26);
      if (v8 == 1.0) {
        double v29 = v27;
      }
      else {
        double v29 = v23;
      }
      if (v8 == 1.0) {
        double v30 = v28;
      }
      else {
        double v30 = v26;
      }
      if ([(UISelectionGrabber *)self isVertical])
      {
        if ([(UISelectionGrabber *)self isPointedDown])
        {
          double v30 = -v20;
LABEL_22:
          [(UIView *)self bounds];
          goto LABEL_25;
        }
        [(UIView *)self bounds];
        double v30 = v31 + v32 - v8;
      }
      else
      {
        if ([(UISelectionGrabber *)self isPointedRight])
        {
          double v29 = -v20;
          goto LABEL_22;
        }
        [(UIView *)self bounds];
        double v29 = v33 + v34 - v8;
      }
LABEL_25:
      uint64_t v35 = [(UIView *)self _enclosingScrollableScrollerIncludingSelf];
      if (v35)
      {
        CGRect v36 = [(UIView *)self _enclosingScrollerIncludingSelf];
      }
      else
      {
        CGRect v36 = 0;
      }
      objc_opt_class();
      v185 = (void *)v35;
      if (objc_opt_isKindOfClass()) {
        double v37 = (void *)v35;
      }
      else {
        double v37 = v36;
      }
      id v38 = v37;
      -[UIView convertRect:toView:](self, "convertRect:toView:", 0, v29, v30, v13, v14);
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      double v184 = v45;
      if ([(UISelectionGrabber *)self animating]) {
        goto LABEL_43;
      }
      double v46 = [(UISelectionGrabber *)self hostView];
      CGFloat v47 = [v46 selectionView];
      if ([v47 alertFlattened]) {
        goto LABEL_42;
      }
      v48 = [(UISelectionGrabber *)self hostView];
      CGRect v49 = [v48 selectionView];
      if ([v49 activeFlattened])
      {
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      CGRect v50 = [(UISelectionGrabber *)self hostView];
      CGRect v51 = [v50 selectionView];
      if ([v51 sheetFlattened])
      {
LABEL_40:

        goto LABEL_41;
      }
      v179 = v50;
      CGRect v52 = [(UISelectionGrabber *)self hostView];
      CGRect v53 = [v52 selectionView];
      if ([v53 popoverFlattened])
      {
LABEL_39:

        CGRect v50 = v179;
        goto LABEL_40;
      }
      v173 = v53;
      v176 = v52;
      v170 = [(UISelectionGrabber *)self hostView];
      CGRect v54 = [v170 selectionView];
      if (([v54 navigationTransitionFlattened] & 1) != 0
        || -[UISelectionGrabber dotIsVisibleInDocument:](self, "dotIsVisibleInDocument:", v40, v42, v44, v184))
      {

        CGRect v52 = v176;
        goto LABEL_39;
      }
      v169 = [(UIView *)self window];
      int v167 = [v169 _isTextEffectsWindow];
      if (v167)
      {
        uint64_t v157 = [(UIView *)self window];
        objc_opt_class();
        v162 = (void *)v157;
        if (objc_opt_isKindOfClass())
        {
          BOOL v168 = 1;
          goto LABEL_134;
        }
      }
      v166 = [(UISelectionGrabber *)self hostView];
      char v165 = [v166 inGesture];
      if ((v165 & 1) != 0
        || ([(UISelectionGrabber *)self hostView],
            v161 = objc_claimAutoreleasedReturnValue(),
            [v161 selectionView],
            v160 = objc_claimAutoreleasedReturnValue(),
            [v160 interactionAssistant],
            v159 = objc_claimAutoreleasedReturnValue(),
            [v159 inGesture]))
      {
        v164 = [(UISelectionGrabber *)self hostView];
        v163 = [v164 selectionView];
        v158 = [v163 interactionAssistant];
        if ([v158 containerIsTextField])
        {

          BOOL v168 = 0;
        }
        else
        {
          BOOL v168 = -[UISelectionGrabber clipDot:](self, "clipDot:", v40, v42, v44, v184);
        }
        if (v165)
        {

          if (!v167)
          {
LABEL_135:

            if (!v168)
            {
              CGRect v55 = 0;
LABEL_44:
              CGRect v56 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
              uint64_t v57 = [v56 currentState];
              if (v55) {
                goto LABEL_45;
              }
              if ((v57 & 0xFFFFFFFFFFFFFFFDLL) == 0)
              {
                v58 = [v56 inputViews];
                v59 = [v58 inputAccessoryView];

                if (![(UIView *)self isDescendantOfView:v59]) {
                  goto LABEL_52;
                }
                [v59 bounds];
                double v174 = v42;
                double v177 = v40;
                CGFloat v61 = v60;
                double v171 = v44;
                CGFloat v63 = v62;
                double v64 = v14;
                CGFloat v66 = v65;
                double v180 = v8;
                CGFloat v68 = v67;
                -[UIView convertRect:toView:](self, "convertRect:toView:", v59, v29, v30, v13, v64);
                v190.origin.CGFloat x = v69;
                v190.origin.CGFloat y = v70;
                v190.size.CGFloat width = v71;
                v190.size.double height = v72;
                v188.origin.CGFloat x = v61;
                v188.origin.CGFloat y = v63;
                double v44 = v171;
                v188.size.CGFloat width = v66;
                double v14 = v64;
                double v42 = v174;
                double v40 = v177;
                v188.size.double height = v68;
                double v8 = v180;
                if (CGRectIntersectsRect(v188, v190))
                {
                  CGRect v55 = v59;

                  if (v55) {
                    goto LABEL_45;
                  }
                }
                else
                {
LABEL_52:
                }
              }
              if ([(UISelectionGrabber *)self isRotating]
                || [(UISelectionGrabber *)self inputViewIsChanging])
              {
                v73 = [v56 inputViews];
                v74 = [v73 inputAccessoryView];

                if (![(UIView *)self isDescendantOfView:v74]) {
                  goto LABEL_57;
                }
                [(UIView *)v74 bounds];
                double v175 = v42;
                double v178 = v40;
                CGFloat v76 = v75;
                double v77 = v14;
                CGFloat v79 = v78;
                double v181 = v8;
                CGFloat v81 = v80;
                double v172 = v44;
                CGFloat v83 = v82;
                -[UIView convertRect:toView:](self, "convertRect:toView:", v74, v29, v30, v13, v77);
                v191.origin.CGFloat x = v84;
                v191.origin.CGFloat y = v85;
                v191.size.CGFloat width = v86;
                v191.size.double height = v87;
                v189.origin.CGFloat x = v76;
                v189.origin.CGFloat y = v79;
                double v14 = v77;
                double v42 = v175;
                double v40 = v178;
                v189.size.CGFloat width = v81;
                double v8 = v181;
                v189.size.double height = v83;
                double v44 = v172;
                BOOL v88 = CGRectIntersectsRect(v189, v191);
                v89 = v74;
                if (!v88)
                {
LABEL_57:
                  if (v36) {
                    v89 = v36;
                  }
                  else {
                    v89 = self;
                  }
                }
                CGRect v55 = v89;

                if (v55)
                {
LABEL_78:
                  if (!v55) {
                    goto LABEL_79;
                  }
LABEL_45:
                  if (v55 != v36) {
                    goto LABEL_82;
                  }
                  goto LABEL_67;
                }
              }
              else
              {
                CGRect v55 = 0;
              }
              if (v36)
              {
                if ([(UISelectionGrabber *)self isScrolling]
                  || [(UISelectionGrabber *)self isScaling])
                {
                  v90 = v36;
LABEL_67:
                  CGRect v55 = v36;
                  if (objc_opt_respondsToSelector())
                  {
                    v91 = [(UISelectionGrabber *)v36 _getDelegateZoomView];
                    if (([v91 _usesAsynchronousProtocol] & 1) != 0
                      || [(UIView *)self isDescendantOfView:v91]
                      && ([v91 isDescendantOfView:v36] & 1) != 0)
                    {
                      CGRect v55 = v91;

                      if (!v55)
                      {
LABEL_79:
                        v92 = [(UISelectionGrabber *)self hostView];
                        v93 = [v92 selectionView];
                        v94 = [v93 interactionAssistant];
                        v95 = [v94 externalInteractions];

                        if (v95)
                        {
                          CGRect v55 = [(UIView *)self _enclosingScrollerIncludingSelf];
                        }
                        else
                        {
                          CGRect v55 = 0;
                        }
                      }
                    }
                    else
                    {

                      CGRect v55 = v36;
                    }
                  }
LABEL_82:
                  v96 = [(UISelectionGrabber *)self customPath];
                  if (v96)
                  {
                    double v182 = v13;
                    double v97 = v8;
                    [(UIView *)self frame];
                    double v99 = v98;
                    double v101 = v100;
                    if ([(UISelectionGrabber *)self isPointedDown]) {
                      [v96 topPoint];
                    }
                    else {
                      [v96 bottomPoint];
                    }
                    double v104 = v102;
                    double v105 = v103;
                    if ([(UISelectionGrabber *)self isPointedDown]) {
                      [v96 bottomPoint];
                    }
                    else {
                      [v96 topPoint];
                    }
                    double v108 = v106;
                    double v109 = v107;
                    [v96 lineWidth];
                    double v111 = v104 - v108;
                    double v112 = v105 - v109;
                    double v113 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
                    if (v104 - v108 != *MEMORY[0x1E4F1DAD8]
                      || (double v114 = *MEMORY[0x1E4F1DAD8], v115 = *(double *)(MEMORY[0x1E4F1DAD8] + 8), v112 != v113))
                    {
                      double v116 = 1.0 / sqrt(v111 * v111 + v112 * v112);
                      double v114 = v111 * v116;
                      double v115 = v112 * v116;
                    }
                    if (v114 != *MEMORY[0x1E4F1DAD8] || v115 != v113)
                    {
                      double v117 = v14 * 0.5 + sqrt((v108 - v104) * (v108 - v104) + (v109 - v105) * (v109 - v105)) - v110;
                      double v108 = v108 + v117 * v114;
                      double v109 = v109 + v117 * v115;
                    }
                    double v8 = v97;
                    double v118 = v109 - v101;
                    double v13 = v182;
                    double v29 = v108 - v99 - v182 * 0.5;
                    double v30 = v118 - v182 * 0.5;
                    -[UIView convertRect:toView:](self, "convertRect:toView:", 0, v29, v30, v182, v14);
                    double v40 = v119;
                    double v42 = v120;
                    double v44 = v121;
                    double v184 = v122;
                  }
                  if (!v55)
                  {
                    CGRect v55 = [v56 containerView];
                  }
                  if ([(UIResponder *)v55 _usesAsynchronousProtocol]
                    && (objc_opt_respondsToSelector() & 1) != 0)
                  {
                    uint64_t v123 = [(UISelectionGrabber *)v55 unscaledView];

                    CGRect v55 = (UISelectionGrabber *)v123;
                  }
                  if (v55 == self
                    || ([(UIView *)self window],
                        v124 = objc_claimAutoreleasedReturnValue(),
                        v124,
                        !v124))
                  {
                    v127 = v38;
                  }
                  else
                  {
                    v125 = [(UIView *)v55 window];
                    v126 = [(UIView *)self window];

                    v127 = v38;
                    v128 = v55;
                    if (v125 == v126)
                    {
                      double v139 = v29;
                      double v140 = v30;
                      double v141 = v13;
                      double v142 = v14;
                      v143 = self;
                    }
                    else
                    {
                      v129 = [(UIView *)v55 window];
                      v130 = [(UIView *)self window];
                      objc_msgSend(v129, "convertRect:fromWindow:", v130, v40, v42, v44, v184);
                      double v132 = v131;
                      double v134 = v133;
                      double v136 = v135;
                      double v138 = v137;

                      v128 = v55;
                      double v139 = v132;
                      double v140 = v134;
                      double v141 = v136;
                      double v142 = v138;
                      v143 = 0;
                    }
                    -[UIView convertRect:fromView:](v128, "convertRect:fromView:", v143, v139, v140, v141, v142);
                    double v29 = v144;
                    double v30 = v145;
                    double v13 = v146;
                    double v14 = v147;
                  }
                  v148 = [(UISelectionGrabber *)self hostView];
                  v149 = [v148 selectionView];
                  v150 = [v149 interactionAssistant];
                  int v151 = [v150 cursorVisible];

                  if (v151) {
                    double v152 = 1.0;
                  }
                  else {
                    double v152 = 0.0;
                  }
                  [(UIView *)self->m_dotView setAlpha:v152];
                  [(UIView *)self setAlpha:v152];
                  if (!v96)
                  {
                    if ([(UISelectionGrabber *)self isVertical]) {
                      double v29 = v8 * 0.5 + v29;
                    }
                    else {
                      double v30 = v183 * 0.5 + v30;
                    }
                  }
                  v153 = [(UIView *)self->m_dotView superview];

                  if (v153 == v55)
                  {
                    -[UISelectionGrabberDot setFrame:](self->m_dotView, "setFrame:", v29, v30, v13, v14);
                  }
                  else
                  {
                    [(UIView *)v55 addSubview:self->m_dotView];
                    v186[0] = MEMORY[0x1E4F143A8];
                    v186[1] = 3221225472;
                    v186[2] = __31__UISelectionGrabber_updateDot__block_invoke;
                    v186[3] = &unk_1E52DA520;
                    v186[4] = self;
                    *(double *)&v186[5] = v29;
                    *(double *)&v186[6] = v30;
                    *(double *)&v186[7] = v13;
                    *(double *)&v186[8] = v14;
                    +[UIView performWithoutAnimation:v186];
                  }
                  v154 = [(UIView *)self layer];
                  v155 = [v154 contents];

                  if (!v155) {
                    [(UIView *)self setNeedsDisplay];
                  }
                  v156 = self->m_dotView;
                  [(UIView *)self _convertVisualAltitude:v156 toView:0.0];
                  -[UIView _setVisualAltitude:](v156, "_setVisualAltitude:");

                  return;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_79;
                }
                objc_msgSend(v38, "convertRect:fromView:", 0, v40, v42, v44, v184);
                if (!-[UISelectionGrabber scroller:fullyContainSelectionRect:](self, "scroller:fullyContainSelectionRect:", v38))
                {
                  [(UIView *)self bounds];
                  objc_msgSend(v38, "convertRect:fromView:", self);
                  if (-[UISelectionGrabber scroller:fullyContainSelectionRect:](self, "scroller:fullyContainSelectionRect:", v38))
                  {
                    goto LABEL_79;
                  }
                }
                CGRect v55 = (UISelectionGrabber *)v38;
              }
              goto LABEL_78;
            }
LABEL_43:
            CGRect v55 = self;
            goto LABEL_44;
          }
LABEL_134:

          goto LABEL_135;
        }
      }
      else
      {
        BOOL v168 = 0;
      }

      if ((v167 & 1) == 0) {
        goto LABEL_135;
      }
      goto LABEL_134;
    }
  }
  double v11 = self->m_dotView;
  [(UIView *)v11 removeFromSuperview];
}

uint64_t __31__UISelectionGrabber_updateDot__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)redrawDotForScale:(double)a3
{
  m_dotView = self->m_dotView;
  [(UIView *)self _currentScreenScale];
  double v6 = v5 * a3;
  [(UISelectionGrabberDot *)m_dotView redrawRasterizedImageForScale:v6];
}

- (void)animateGrabberInWithCompletion:(id)a3
{
  id v4 = a3;
  LODWORD(v5) = 1053609165;
  LODWORD(v6) = 1058642330;
  LODWORD(v7) = 1.0;
  LODWORD(v8) = 1.0;
  double v9 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v5 :v7 :v6 :v8];
  double v10 = [(UIView *)self layer];
  [v10 bounds];
  double v43 = v12;
  double v44 = v11;
  double v14 = v13;
  double v16 = v15;

  double v41 = v14 * 0.8;
  double v42 = v14;
  double v40 = (v14 - v14 * 0.8) * 0.5;
  double v17 = [(UIView *)self->m_dotView layer];
  [v17 bounds];
  double v19 = v18;
  double v39 = v20;
  double v22 = v21;
  double v24 = v23;

  double v25 = (v24 - v24 * 0.8) * 0.5;
  if ([(UISelectionGrabber *)self isPointedUp])
  {
    double v25 = v25 + (v16 - v24) * -0.2;
  }
  else if ([(UISelectionGrabber *)self isPointedDown])
  {
    double v25 = (v16 - v24) * 0.2 + v25;
  }
  double v26 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
  double v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", (v22 - v22 * 0.8) * 0.5, v25, v22 * 0.8, v24 * 0.8);
  [v26 setFromValue:v27];

  double v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v19, v39, v22, v24);
  [v26 setToValue:v28];

  [v26 setFrameInterval:0.0166666667];
  [v26 setDuration:0.25];
  [v26 setTimingFunction:v9];
  double v29 = [(UIView *)self->m_dotView layer];
  [v29 addAnimation:v26 forKey:@"dotView transition in"];

  double v30 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v30 setFromValue:&unk_1ED3F6CC0];
  [v30 setToValue:&unk_1ED3F26D8];
  [v30 setFrameInterval:0.0166666667];
  [v30 setDuration:0.25];
  [v30 setTimingFunction:v9];
  double v31 = [(UIView *)self->m_dotView layer];
  [v31 addAnimation:v30 forKey:@"dotView opacity transition in"];

  double v32 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
  double v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v40, (v16 - v16 * 0.8) * 0.5, v41, v16 * 0.8);
  [v32 setFromValue:v33];

  double v34 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v44, v43, v42, v16);
  [v32 setToValue:v34];

  [v32 setFrameInterval:0.0166666667];
  [v32 setDuration:0.25];
  [v32 setTimingFunction:v9];
  if (v4)
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __53__UISelectionGrabber_animateGrabberInWithCompletion___block_invoke;
    v45[3] = &unk_1E52D9FE8;
    id v46 = v4;
    uint64_t v35 = +[_UISelectionGrabberAnimationDelegate delegateWithCompletionBlock:v45];
    [v32 setDelegate:v35];
  }
  CGRect v36 = [(UIView *)self layer];
  [v36 addAnimation:v32 forKey:@"stemView transition in"];

  double v37 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v37 setFromValue:&unk_1ED3F6CC0];
  [v37 setToValue:&unk_1ED3F26D8];
  [v37 setFrameInterval:0.0166666667];
  [v37 setDuration:0.25];
  [v37 setTimingFunction:v9];
  id v38 = [(UIView *)self layer];
  [v38 addAnimation:v37 forKey:@"stemView opacity transition in"];
}

uint64_t __53__UISelectionGrabber_animateGrabberInWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)animateGrabberOutWithCompletion:(id)a3
{
  id v50 = a3;
  LODWORD(v4) = 1053609165;
  LODWORD(v5) = 1058642330;
  LODWORD(v6) = 1.0;
  LODWORD(v7) = 1.0;
  double v8 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v4 :v6 :v5 :v7];
  double v9 = [(UIView *)self layer];
  [v9 bounds];
  double v48 = v11;
  double v49 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = [(UIView *)self->m_dotView layer];
  [v16 bounds];
  double v47 = v17;
  double v46 = v18;
  double v20 = v19;
  double v22 = v21;

  double v23 = (v22 - v22 * 0.8) * 0.5;
  if ([(UISelectionGrabber *)self isPointedUp])
  {
    double v23 = v23 + (v15 - v22) * -0.2;
  }
  else if ([(UISelectionGrabber *)self isPointedDown])
  {
    double v23 = (v15 - v22) * 0.2 + v23;
  }
  double v45 = (v15 - v15 * 0.8) * 0.5;
  double v24 = [(UIView *)self->m_dotView layer];
  objc_msgSend(v24, "setBounds:", (v20 - v20 * 0.8) * 0.5, v23, v20 * 0.8, v22 * 0.8);

  double v25 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
  double v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v47, v46, v20, v22);
  [v25 setFromValue:v26];

  double v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", (v20 - v20 * 0.8) * 0.5, v23, v20 * 0.8, v22 * 0.8);
  [v25 setToValue:v27];

  [v25 setFrameInterval:0.0166666667];
  [v25 setDuration:0.2];
  [v25 setTimingFunction:v8];
  uint64_t v28 = *MEMORY[0x1E4F39FA0];
  [v25 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v25 setRemovedOnCompletion:0];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke;
  v59[3] = &unk_1E530ABB0;
  v59[4] = self;
  *(double *)&v59[5] = v47;
  *(double *)&v59[6] = v46;
  *(double *)&v59[7] = v20;
  *(double *)&v59[8] = v22;
  double v29 = +[_UISelectionGrabberAnimationDelegate delegateWithCompletionBlock:v59];
  [v25 setDelegate:v29];

  double v30 = [(UIView *)self->m_dotView layer];
  [v30 addAnimation:v25 forKey:@"dotView transition out"];

  double v31 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v31 setFromValue:&unk_1ED3F26D8];
  [v31 setToValue:&unk_1ED3F6CC0];
  [v31 setFrameInterval:0.0166666667];
  [v31 setDuration:0.2];
  [v31 setTimingFunction:v8];
  [v31 setFillMode:v28];
  [v31 setRemovedOnCompletion:0];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_2;
  v58[3] = &unk_1E52DC3A0;
  v58[4] = self;
  double v32 = +[_UISelectionGrabberAnimationDelegate delegateWithCompletionBlock:v58];
  [v31 setDelegate:v32];

  double v33 = [(UIView *)self->m_dotView layer];
  [v33 addAnimation:v31 forKey:@"dotView opacity transition out"];

  double v34 = [(UIView *)self layer];
  double v35 = (v13 - v13 * 0.8) * 0.5;
  objc_msgSend(v34, "setBounds:", v35, v45, v13 * 0.8, v15 * 0.8);

  CGRect v36 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
  double v37 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v49, v48, v13, v15);
  [v36 setFromValue:v37];

  id v38 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v35, v45, v13 * 0.8, v15 * 0.8);
  [v36 setToValue:v38];

  [v36 setFrameInterval:0.0166666667];
  [v36 setDuration:0.2];
  [v36 setTimingFunction:v8];
  [v36 setFillMode:v28];
  [v36 setRemovedOnCompletion:0];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_3;
  v52[3] = &unk_1E530ABD8;
  double v54 = v49;
  double v55 = v48;
  double v56 = v13;
  double v57 = v15;
  v52[4] = self;
  id v53 = v50;
  id v39 = v50;
  double v40 = +[_UISelectionGrabberAnimationDelegate delegateWithCompletionBlock:v52];
  [v36 setDelegate:v40];

  double v41 = [(UIView *)self layer];
  [v41 addAnimation:v36 forKey:@"stemView transition out"];

  double v42 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v42 setFromValue:&unk_1ED3F26D8];
  [v42 setToValue:&unk_1ED3F6CC0];
  [v42 setFrameInterval:0.0166666667];
  [v42 setDuration:0.2];
  [v42 setTimingFunction:v8];
  [v42 setFillMode:v28];
  [v42 setRemovedOnCompletion:0];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_4;
  v51[3] = &unk_1E52DC3A0;
  v51[4] = self;
  double v43 = +[_UISelectionGrabberAnimationDelegate delegateWithCompletionBlock:v51];
  [v42 setDelegate:v43];

  double v44 = [(UIView *)self layer];
  [v44 addAnimation:v42 forKey:@"stemView opacity transition out"];
}

void __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke(double *a1, char a2)
{
  if (a2)
  {
    double v3 = a1[5];
    double v4 = a1[6];
    double v5 = a1[7];
    double v6 = a1[8];
    double v7 = [*(id *)(*((void *)a1 + 4) + 416) layer];
    objc_msgSend(v7, "setBounds:", v3, v4, v5, v6);
  }
  id v8 = [*(id *)(*((void *)a1 + 4) + 416) layer];
  [v8 removeAnimationForKey:@"dotView transition out"];
}

void __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    double v3 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
    LODWORD(v4) = 1.0;
    [v3 setOpacity:v4];
  }
  id v5 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  [v5 removeAnimationForKey:@"dotView opacity transition out"];
}

uint64_t __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = *(double *)(a1 + 48);
    double v4 = *(double *)(a1 + 56);
    double v5 = *(double *)(a1 + 64);
    double v6 = *(double *)(a1 + 72);
    double v7 = [*(id *)(a1 + 32) layer];
    objc_msgSend(v7, "setBounds:", v3, v4, v5, v6);
  }
  id v8 = [*(id *)(a1 + 32) layer];
  [v8 removeAnimationForKey:@"stemView transition out"];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

void __54__UISelectionGrabber_animateGrabberOutWithCompletion___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = [*(id *)(a1 + 32) layer];
    LODWORD(v4) = 1.0;
    [v3 setOpacity:v4];
  }
  id v5 = [*(id *)(a1 + 32) layer];
  [v5 removeAnimationForKey:@"stemView opacity transition out"];
}

- (void)transitionDot:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (a3 == 2)
  {
    id v8 = v6;
    [(UISelectionGrabber *)self animateGrabberOutWithCompletion:v6];
  }
  else if (a3 == 1)
  {
    id v8 = v6;
    [(UISelectionGrabber *)self animateGrabberInWithCompletion:v6];
  }
  else
  {
    if (!v6) {
      goto LABEL_8;
    }
    id v8 = v6;
    (*((void (**)(id))v6 + 2))(v6);
  }
  double v7 = v8;
LABEL_8:
}

- (BOOL)isVertical
{
  return self->m_orientation < 2uLL;
}

- (BOOL)isPointedDown
{
  return self->m_orientation == 0;
}

- (BOOL)isPointedUp
{
  return self->m_orientation == 1;
}

- (BOOL)isPointedRight
{
  return self->m_orientation == 2;
}

- (BOOL)isPointedLeft
{
  return self->m_orientation == 3;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)UISelectionGrabber;
  [(UIView *)&v7 _dynamicUserInterfaceTraitDidChange];
  double v3 = [(UISelectionGrabber *)self customPath];

  if (v3)
  {
    double v4 = [(UISelectionGrabber *)self fillColor];
    uint64_t v5 = [v4 cgColor];
    id v6 = [(UISelectionGrabber *)self shapeLayer];
    [v6 setStrokeColor:v5];
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISelectionGrabber;
  [(UIView *)&v9 willMoveToWindow:v4];
  if (v4)
  {
    uint64_t v5 = [v4 screen];
    [v5 scale];
    self->m_screenScale = v6;

    [(UISelectionGrabber *)self updatePathForBoundsChangeIfNecessary];
  }
  else
  {
    objc_super v7 = +[UIScreen mainScreen];
    [v7 scale];
    self->m_screenScale = v8;
  }
}

- (void)didMoveToSuperview
{
  [(UISelectionGrabber *)self updateDot];
  [(UISelectionGrabber *)self updatePathForBoundsChangeIfNecessary];
}

- (void)setIsDotted:(BOOL)a3
{
  self->m_isDotted = a3;
  [(UISelectionGrabber *)self updateDot];
}

- (void)setOrientation:(int64_t)a3
{
  self->m_orientation = a3;
  [(UISelectionGrabber *)self updateDot];
}

- (void)setAnimating:(BOOL)a3
{
  self->m_animating = a3;
  [(UISelectionGrabber *)self updateDot];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(UIView *)self window];
  objc_msgSend(v8, "convertRect:toView:", self, 0.0, 0.0, 1.0, 1.0);
  double v10 = v9;

  if (v10 == 1.0)
  {
    double v11 = [(UIView *)self window];
    double x = pixelAlignedRectForRect(v11);
    double y = v12;
    double width = v13;
    double height = v14;
  }
  v15.receiver = self;
  v15.super_class = (Class)UISelectionGrabber;
  -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  [(UISelectionGrabber *)self updateDot];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UISelectionGrabber;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UISelectionGrabber *)self updatePathForBoundsChangeIfNecessary];
}

- (void)setCenter:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UISelectionGrabber;
  -[UIView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  [(UISelectionGrabber *)self updatePathForBoundsChangeIfNecessary];
}

- (void)updatePathForBoundsChangeIfNecessary
{
  double v3 = [(UISelectionGrabber *)self customPath];

  if (v3)
  {
    id v7 = [(UISelectionGrabber *)self customPath];
    id v4 = [(UISelectionGrabber *)self bezierPathFromCustomPath:v7];
    uint64_t v5 = [v4 CGPath];
    double v6 = [(UISelectionGrabber *)self shapeLayer];
    [v6 setPath:v5];
  }
}

- (void)drawRect:(CGRect)a3
{
  id v4 = [(UISelectionGrabber *)self customPath];

  if (!v4)
  {
    id v17 = [(UISelectionGrabber *)self fillColor];
    [(UIView *)self bounds];
    CGFloat x = v5;
    CGFloat y = v7;
    CGFloat width = v9;
    CGFloat height = v11;
    double v13 = [(UIView *)self _screen];
    [v13 scale];
    double v15 = v14;

    if (v15 <= 1.0)
    {
      double v16 = [v17 colorWithAlphaComponent:0.5];
      [v16 set];

      UIRectFillUsingOperation(1, x, y, width, height);
      [v17 set];
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      CGRect v20 = CGRectInset(v19, 1.0, 0.0);
      CGFloat x = v20.origin.x;
      CGFloat y = v20.origin.y;
      CGFloat width = v20.size.width;
      CGFloat height = v20.size.height;
    }
    else
    {
      [v17 set];
    }
    UIRectFillUsingOperation(1, x, y, width, height);
  }
}

- (id)fillColor
{
  v2 = [(UISelectionGrabber *)self hostView];
  double v3 = [v2 container];

  if (objc_opt_respondsToSelector()) {
    [v3 selectionBarColor];
  }
  else {
  id v4 = +[UIColor selectionGrabberColor];
  }

  return v4;
}

- (BOOL)isDotted
{
  return self->m_isDotted;
}

- (BOOL)animating
{
  return self->m_animating;
}

- (int64_t)orientation
{
  return self->m_orientation;
}

- (UISelectionGrabberCustomPath)customPath
{
  return self->_customPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customPath, 0);
  objc_storeStrong((id *)&self->m_dotView, 0);
}

+ (id)_grabberDot
{
  v2 = -[UIImageView initWithFrame:]([UISelectionGrabberDot alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  return v2;
}

- (id)_dotView
{
  return self->m_dotView;
}

@end