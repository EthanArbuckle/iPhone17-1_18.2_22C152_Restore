@interface UIKeyboardCandidateInlineFloatingView
- (BOOL)inlineRectIsVertical;
- (BOOL)isAcceptableFrame:(CGRect)a3 afterScrollBy:(double)a4;
- (BOOL)isReducedWidth;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldExtendUpwards;
- (CGRect)adjustedFrameFromDesiredFrame:(CGRect)a3 textHeight:(double)a4;
- (CGRect)adjustedFrameFromDesiredFrame:(CGRect)a3 textWidth:(double)a4;
- (CGRect)adjustedInlineRectFromInlineText:(id)a3 inlineRect:(CGRect)a4;
- (CGRect)inlineRect;
- (CGRect)previousCollapsedFrame;
- (CGSize)preferredSize;
- (NSString)inlineText;
- (UIEdgeInsets)cellPadding;
- (UIEdgeInsets)extraInsets;
- (UIKeyboardCandidateInlineFloatingView)initWithFrame:(CGRect)a3;
- (double)extendedStateAdditionalHeight;
- (double)maxX;
- (id)traitCollection;
- (int)adjustMode;
- (int)position;
- (void)adjustFrameForInlineText:(id)a3 inlineRect:(CGRect)a4 maxX:(double)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAdjustMode:(int)a3;
- (void)setCellPadding:(UIEdgeInsets)a3;
- (void)setExtendedStateAdditionalHeight:(double)a3;
- (void)setExtraInsets:(UIEdgeInsets)a3;
- (void)setInlineRect:(CGRect)a3;
- (void)setInlineRectIsVertical:(BOOL)a3;
- (void)setInlineText:(id)a3;
- (void)setInlineText:(id)a3 inlineRect:(CGRect)a4 maxX:(double)a5 layout:(BOOL)a6;
- (void)setMaxX:(double)a3;
- (void)setPosition:(int)a3;
- (void)setPreferredSize:(CGSize)a3;
- (void)setPreviousCollapsedFrame:(CGRect)a3;
@end

@implementation UIKeyboardCandidateInlineFloatingView

- (UIKeyboardCandidateInlineFloatingView)initWithFrame:(CGRect)a3
{
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(UIView *)self size];
  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardCandidateInlineFloatingView;
  v8 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    [(UIView *)v8 setOpaque:0];
    v10 = [(UIView *)v9 layer];
    [v10 setMasksToBounds:0];

    v9->_tewObserverIsSet = 0;
  }
  return v9;
}

- (void)dealloc
{
  if (self->_tewObserverIsSet)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v4 = [(UIView *)self window];
    [v3 removeObserver:self name:0x1ED175800 object:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCandidateInlineFloatingView;
  [(UIView *)&v5 dealloc];
}

- (CGRect)adjustedInlineRectFromInlineText:(id)a3 inlineRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = [(UIView *)self superview];
  double v11 = AutocorrectAdjustedInlineRect(v9, v10, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (BOOL)isAcceptableFrame:(CGRect)a3 afterScrollBy:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = [(UIView *)self superview];
  double v10 = y - a4;
  [v9 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [(UIView *)self superview];
  [v19 safeAreaInsets];
  double v21 = v12 + v20;
  double v23 = v14 + v22;
  double v25 = v16 - (v20 + v24);
  double v27 = v18 - (v22 + v26);

  [(UIKeyboardCandidateInlineFloatingView *)self extraInsets];
  double v29 = v21 + v28;
  double v31 = v23 + v30;
  double v33 = v25 - (v28 + v32);
  double v35 = v27 - (v30 + v34);
  BOOL v36 = [(UIKeyboardCandidateInlineFloatingView *)self inlineRectIsVertical];
  double v37 = v29;
  double v38 = v31;
  double v39 = v33;
  double v40 = v35;
  CGFloat v41 = x;
  double v42 = v10;
  CGFloat v43 = width;
  if (v36)
  {
    double v44 = height;
    CGFloat v45 = height;
    if (!CGRectContainsRect(*(CGRect *)&v37, *(CGRect *)&v41)) {
      goto LABEL_7;
    }
  }
  else
  {
    double v44 = height;
    if (!_CGRectContainsRectVertically(v29, v31, v33, v35, x, v10, width, height))
    {
LABEL_7:
      BOOL v66 = 0;
      goto LABEL_17;
    }
  }
  v46 = [(UIView *)self window];
  objc_msgSend(v9, "convertRect:toView:", v46, x, v10, width, v44);
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  CGFloat v54 = v53;

  BOOL v55 = [(UIKeyboardCandidateInlineFloatingView *)self inlineRectIsVertical];
  v56 = [(UIView *)self window];
  [v56 bounds];
  CGFloat v61 = v48;
  CGFloat v62 = v50;
  CGFloat v63 = v52;
  CGFloat v64 = v54;
  if (v55)
  {
    BOOL v65 = CGRectContainsRect(*(CGRect *)&v57, *(CGRect *)&v61);

    if (!v65) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v67 = _CGRectContainsRectVertically(v57, v58, v59, v60, v48, v50, v52, v54);

    if (!v67) {
      goto LABEL_7;
    }
  }
  v68 = +[UIKeyboardImpl activeInstance];
  v69 = [v68 _window];
  v70 = [v69 screen];
  v71 = [(UIView *)self _window];
  v72 = [v71 screen];

  if (v70 != v72) {
    goto LABEL_15;
  }
  objc_msgSend(v9, "_convertViewPointToSceneSpaceForKeyboard:", x, v10, width, v44);
  CGFloat v74 = v73;
  CGFloat v76 = v75;
  CGFloat v78 = v77;
  CGFloat v80 = v79;
  v81 = [v68 superview];
  [v68 frame];
  objc_msgSend(v81, "_convertViewPointToSceneSpaceForKeyboard:");
  CGFloat v83 = v82;
  CGFloat v85 = v84;
  CGFloat v87 = v86;
  CGFloat v89 = v88;

  v90 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v91 = [v90 inputViews];
  v92 = [v91 inputAccessoryView];

  [v92 size];
  if (v93 > 0.0)
  {
    v94 = [v92 window];
    [v94 windowLevel];
    CGFloat v114 = v89;
    CGFloat v116 = v85;
    double v95 = v78;
    double v96 = v74;
    double v98 = v97;
    v99 = [(UIView *)self window];
    [v99 windowLevel];
    double v100 = v83;
    double v101 = v87;
    double v102 = v80;
    double v103 = v76;
    double v105 = v104;

    BOOL v106 = v98 <= v105;
    CGFloat v76 = v103;
    CGFloat v80 = v102;
    CGFloat v87 = v101;
    CGFloat v83 = v100;
    CGFloat v74 = v96;
    CGFloat v78 = v95;
    CGFloat v89 = v114;
    CGFloat v85 = v116;
    if (!v106)
    {
      v107 = [v92 superview];
      [v92 frame];
      objc_msgSend(v107, "_convertViewPointToSceneSpaceForKeyboard:");
      v120.origin.CGFloat x = v108;
      v120.origin.double y = v109;
      v120.size.CGFloat width = v110;
      v120.size.CGFloat height = v111;
      v117.origin.CGFloat x = v83;
      v117.origin.double y = v116;
      v117.size.CGFloat width = v87;
      v117.size.CGFloat height = v114;
      CGRect v118 = CGRectUnion(v117, v120);
      CGFloat v83 = v118.origin.x;
      CGFloat v85 = v118.origin.y;
      CGFloat v87 = v118.size.width;
      CGFloat v89 = v118.size.height;
    }
  }
  v119.origin.CGFloat x = v74;
  v119.origin.double y = v76;
  v119.size.CGFloat width = v78;
  v119.size.CGFloat height = v80;
  v121.origin.CGFloat x = v83;
  v121.origin.double y = v85;
  v121.size.CGFloat width = v87;
  v121.size.CGFloat height = v89;
  BOOL v112 = CGRectIntersectsRect(v119, v121);

  if (v112) {
    BOOL v66 = 0;
  }
  else {
LABEL_15:
  }
    BOOL v66 = 1;

LABEL_17:
  return v66;
}

- (CGRect)adjustedFrameFromDesiredFrame:(CGRect)a3 textHeight:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = a3.origin.y + a4;
  [(UIKeyboardCandidateInlineFloatingView *)self extendedStateAdditionalHeight];
  if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", x, v9, width, height + v10, 0.0))
  {
    BOOL v11 = 0;
  }
  else
  {
    double v12 = y - height + -9.0;
    if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", x, v12, width, height, 0.0))
    {
      goto LABEL_14;
    }
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v39 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v41 = *MEMORY[0x1E4F1DB28];
    CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v14 = +[UIKeyboardImpl activeInstance];
    double v15 = [v14 inputDelegateManager];
    double v16 = [v15 keyInputDelegate];

    if (v16)
    {
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (objc_opt_respondsToSelector())
        {
          [v16 visibleTextRect];
          double v19 = v18;
          double v40 = v21;
          double v42 = v20;
          double recta = v22;
          double v23 = [(UIView *)self superview];
          objc_msgSend(v16, "convertRect:toCoordinateSpace:", v23, v19, v42, v40, recta);
          CGFloat v39 = v25;
          CGFloat v41 = v24;
          double v13 = v26;
          CGFloat rect = v27;

          break;
        }
        uint64_t v17 = [v16 superview];

        double v16 = (void *)v17;
        if (!v17) {
          goto LABEL_11;
        }
      }
    }
LABEL_11:
    if (v13 > 0.0)
    {
      v43.size.double width = v39;
      v43.origin.double x = v41;
      v43.origin.double y = v13;
      v43.size.double height = rect;
      double MinY = CGRectGetMinY(v43);
      v44.origin.double x = x;
      v44.origin.double y = y - height;
      v44.size.double width = width;
      v44.size.double height = height;
      double v12 = MinY - CGRectGetHeight(v44) + -9.0;
    }
    if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", x, v12, width, height, 0.0))
    {
LABEL_14:
      BOOL v11 = 1;
      double v9 = v12;
    }
    else
    {
      double v29 = [(UIView *)self superview];
      [v29 frame];
      double v32 = (v30 + v31) * 0.5;

      BOOL v11 = y >= v32;
      if (y >= v32) {
        double v9 = v12;
      }
    }
  }
  [(UIKeyboardCandidateInlineFloatingView *)self setPosition:v11];
  double v33 = x;
  double v34 = v9;
  double v35 = width;
  double v36 = height;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (CGRect)adjustedFrameFromDesiredFrame:(CGRect)a3 textWidth:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIKeyboardCandidateInlineFloatingView *)self extendedStateAdditionalHeight];
  double v10 = height + v9;
  if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", x, y, width, height + v9, 0.0)&& ([(UIKeyboardCandidateInlineFloatingView *)self inlineRect], v31.origin.x = x, v31.origin.y = y, v31.size.width = width, v31.size.double height = v10, !CGRectIntersectsRect(v29, v31)))
  {
    uint64_t v14 = 2;
  }
  else
  {
    [(UIKeyboardCandidateInlineFloatingView *)self inlineRect];
    double v13 = v11 + v12 - height;
    if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", x, v13, width, height, 0.0))
    {
      uint64_t v14 = 1;
      double y = v13;
    }
    else
    {
      [(UIKeyboardCandidateInlineFloatingView *)self inlineRect];
      double v17 = v15 + v16;
      if (-[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", v15 + v16, y, width, height, 0.0))
      {
        uint64_t v14 = 3;
        double x = v17;
      }
      else
      {
        [(UIKeyboardCandidateInlineFloatingView *)self inlineRect];
        double v20 = v18 + v19;
        [(UIKeyboardCandidateInlineFloatingView *)self inlineRect];
        double v23 = v21 + v22 - height;
        BOOL v24 = -[UIKeyboardCandidateInlineFloatingView isAcceptableFrame:afterScrollBy:](self, "isAcceptableFrame:afterScrollBy:", v20, v23, width, height, 0.0);
        if (v24) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = 2;
        }
        if (v24)
        {
          double x = v20;
          double y = v23;
        }
      }
    }
  }
  [(UIKeyboardCandidateInlineFloatingView *)self setPosition:v14];
  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (void)adjustFrameForInlineText:(id)a3 inlineRect:(CGRect)a4 maxX:(double)a5
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  self->_reducedWidth = 0;
  -[UIKeyboardCandidateInlineFloatingView adjustedInlineRectFromInlineText:inlineRect:](self, "adjustedInlineRectFromInlineText:inlineRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v109 = v7;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(UIView *)self frame];
  double v15 = v14;
  double v17 = v16;
  [(UIKeyboardCandidateInlineFloatingView *)self preferredSize];
  double v19 = v18;
  double v21 = v20;
  CGFloat v110 = v11;
  CGFloat v107 = v17;
  CGFloat v108 = v15;
  if ([(UIKeyboardCandidateInlineFloatingView *)self adjustMode] == 1)
  {
    BOOL v22 = [(UIKeyboardCandidateInlineFloatingView *)self inlineRectIsVertical];
    [(UIKeyboardCandidateInlineFloatingView *)self cellPadding];
    double v24 = v23;
    double v25 = v19;
    double v27 = v26;
    [(UIKeyboardCandidateInlineFloatingView *)self cellPadding];
    if (v25 >= v11) {
      double v30 = v25;
    }
    else {
      double v30 = v11;
    }
    double v31 = v30 + v27 + v29;
    if (v21 >= v13) {
      double v32 = v21;
    }
    else {
      double v32 = v13;
    }
    double v33 = v32 + v24 + v28;
    if (v22) {
      double v21 = v33;
    }
    else {
      double v25 = v31;
    }
    CGFloat v112 = v25;
    CGFloat v113 = v21;
  }
  else
  {
    CGFloat v112 = v19;
    CGFloat v113 = v21;
  }
  double v34 = [(UIView *)self superview];
  [v34 bounds];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;

  CGRect v43 = [(UIView *)self superview];
  [v43 safeAreaInsets];
  double x = v36 + v44;
  double y = v38 + v46;
  double width = v40 - (v44 + v48);
  double height = v42 - (v46 + v50);

  CGFloat v52 = [(UIView *)self window];
  int v53 = [v52 _isTextEffectsWindow];

  CGFloat rect = v13;
  if (v53)
  {
    CGFloat v54 = [(UIView *)self superview];
    BOOL v55 = [(UIView *)self window];
    [v55 actualSceneBounds];
    double v57 = v56;
    double v59 = v58;
    double v105 = v9;
    double v106 = a5;
    double v61 = v60;
    double v63 = v62;
    CGFloat v64 = [(UIView *)self window];
    objc_msgSend(v54, "convertRect:fromView:", v64, v57, v59, v61, v63);
    CGFloat v66 = v65;
    CGFloat v68 = v67;
    CGFloat v70 = v69;
    CGFloat v72 = v71;

    v131.origin.double x = v66;
    v131.origin.double y = v68;
    v131.size.double width = v70;
    double v9 = v105;
    a5 = v106;
    v131.size.double height = v72;
    v144.origin.double x = x;
    v144.origin.double y = y;
    v144.size.double width = width;
    v144.size.double height = height;
    CGRect v132 = CGRectIntersection(v131, v144);
    double x = v132.origin.x;
    double y = v132.origin.y;
    double width = v132.size.width;
    double height = v132.size.height;
  }
  v133.origin.double y = v107;
  v133.origin.double x = v108;
  v133.size.double width = v112;
  double v73 = v113;
  v133.size.double height = v113;
  double v74 = CGRectGetWidth(v133);
  v134.origin.double x = x;
  v134.origin.double y = y;
  v134.size.double width = width;
  v134.size.double height = height;
  if (v74 <= CGRectGetWidth(v134))
  {
    CGFloat v78 = v110;
    double v77 = v112;
  }
  else
  {
    self->_reducedWidth = 1;
    [(UIKeyboardCandidateInlineFloatingView *)self preferredSize];
    double v73 = v75;
    v135.origin.double x = x;
    v135.origin.double y = y;
    v135.size.double width = width;
    v135.size.double height = height;
    CGFloat v76 = CGRectGetWidth(v135);
    if (v76 <= a5) {
      a5 = v76;
    }
    double v77 = 312.0;
    CGFloat v78 = v110;
  }
  v136.origin.double x = v109;
  v136.origin.double y = v9;
  v136.size.double width = v77;
  v136.size.double height = v73;
  double MaxX = CGRectGetMaxX(v136);
  if (MaxX >= a5)
  {
    double v82 = v109 - (MaxX - a5);
    if (v77 >= a5) {
      goto LABEL_28;
    }
    if (a5 - v77 > 1.0) {
      double v82 = v82 + -1.0;
    }
    if (a5 - v77 <= 2.0)
    {
LABEL_28:
      double v80 = v77;
    }
    else
    {
      double v80 = v77;
      double v82 = v82 + -1.0;
    }
    BOOL v83 = [(UIKeyboardCandidateInlineFloatingView *)self inlineRectIsVertical];
    if (v82 >= 0.0 || v83) {
      double v81 = v82;
    }
    else {
      double v81 = 0.0;
    }
  }
  else
  {
    v137.origin.double x = v109;
    v137.origin.double y = v9;
    double v80 = v77;
    v137.size.double width = v77;
    v137.size.double height = v73;
    double v81 = v109;
    if (CGRectGetMinX(v137) < 3.0) {
      double v81 = 3.0;
    }
  }
  BOOL v85 = [(UIKeyboardCandidateInlineFloatingView *)self inlineRectIsVertical];
  CGFloat v114 = v73;
  double v86 = v109;
  double v87 = v9;
  CGFloat v88 = v78;
  CGFloat v89 = rect;
  if (v85) {
    -[UIKeyboardCandidateInlineFloatingView adjustedFrameFromDesiredFrame:textWidth:](self, "adjustedFrameFromDesiredFrame:textWidth:", v81, v9, v80, v73, CGRectGetWidth(*(CGRect *)&v86));
  }
  else {
    -[UIKeyboardCandidateInlineFloatingView adjustedFrameFromDesiredFrame:textHeight:](self, "adjustedFrameFromDesiredFrame:textHeight:", v81, v9, v80, v73, CGRectGetHeight(*(CGRect *)&v86));
  }
  double v94 = v90;
  double v95 = v91;
  double v96 = v92;
  double v97 = v93;
  if (!UIRectIsDiscrete(v90, v91, v92, v93))
  {
    if (os_variant_has_internal_diagnostics())
    {
      v99 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v99, OS_LOG_TYPE_FAULT)) {
        goto LABEL_46;
      }
      v141.origin.double x = v109;
      v141.size.double width = v110;
      v141.origin.double y = v9;
      v141.size.double height = rect;
      double v100 = NSStringFromCGRect(v141);
      v142.origin.double x = v81;
      v142.origin.double y = v9;
      v142.size.double width = v80;
      v142.size.double height = v114;
      double v101 = NSStringFromCGRect(v142);
      v143.origin.double x = v94;
      v143.origin.double y = v95;
      v143.size.double width = v96;
      v143.size.double height = v97;
      double v102 = NSStringFromCGRect(v143);
      double v103 = [(UIView *)self superview];
      double v104 = [(UIView *)self window];
      *(_DWORD *)buf = 136316674;
      CGFloat v116 = "-[UIKeyboardCandidateInlineFloatingView adjustFrameForInlineText:inlineRect:maxX:]";
      __int16 v117 = 2112;
      CGRect v118 = v100;
      __int16 v119 = 2048;
      double v120 = a5;
      __int16 v121 = 2112;
      v122 = v101;
      __int16 v123 = 2112;
      v124 = v102;
      __int16 v125 = 2112;
      v126 = v103;
      __int16 v127 = 2112;
      v128 = v104;
      _os_log_fault_impl(&dword_1853B0000, v99, OS_LOG_TYPE_FAULT, "%s: invalid adjust frame, inlineRect %@, maxX %f, adjustedFrame %@, finalAdjustedFrame %@, superview %@, window %@", buf, 0x48u);
    }
    else
    {
      double v98 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &adjustFrameForInlineText_inlineRect_maxX____s_category)+ 8);
      if (!os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
        return;
      }
      v99 = v98;
      v138.origin.double x = v109;
      v138.size.double width = v110;
      v138.origin.double y = v9;
      v138.size.double height = rect;
      double v100 = NSStringFromCGRect(v138);
      v139.origin.double x = v81;
      v139.origin.double y = v9;
      v139.size.double width = v80;
      v139.size.double height = v114;
      double v101 = NSStringFromCGRect(v139);
      v140.origin.double x = v94;
      v140.origin.double y = v95;
      v140.size.double width = v96;
      v140.size.double height = v97;
      double v102 = NSStringFromCGRect(v140);
      double v103 = [(UIView *)self superview];
      double v104 = [(UIView *)self window];
      *(_DWORD *)buf = 136316674;
      CGFloat v116 = "-[UIKeyboardCandidateInlineFloatingView adjustFrameForInlineText:inlineRect:maxX:]";
      __int16 v117 = 2112;
      CGRect v118 = v100;
      __int16 v119 = 2048;
      double v120 = a5;
      __int16 v121 = 2112;
      v122 = v101;
      __int16 v123 = 2112;
      v124 = v102;
      __int16 v125 = 2112;
      v126 = v103;
      __int16 v127 = 2112;
      v128 = v104;
      _os_log_impl(&dword_1853B0000, v99, OS_LOG_TYPE_ERROR, "%s: invalid adjust frame, inlineRect %@, maxX %f, adjustedFrame %@, finalAdjustedFrame %@, superview %@, window %@", buf, 0x48u);
    }

LABEL_46:
    return;
  }
  -[UIView setFrame:](self, "setFrame:", v94, v95, v96, v97);
}

- (BOOL)shouldExtendUpwards
{
  v3 = [(UIView *)self superview];

  if (v3)
  {
    int v4 = [(UIKeyboardCandidateInlineFloatingView *)self position];
    if (v4 != 1)
    {
      [(UIView *)self frame];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      double v12 = v11;
      [(UIKeyboardCandidateInlineFloatingView *)self extendedStateAdditionalHeight];
      CGFloat v14 = v13 + v12;
      double v15 = [(UIView *)self superview];
      [v15 bounds];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;

      double v24 = [(UIView *)self superview];
      [v24 safeAreaInsets];
      CGFloat v26 = v17 + v25;
      CGFloat v28 = v19 + v27;
      CGFloat v30 = v21 - (v25 + v29);
      CGFloat v32 = v23 - (v27 + v31);

      LOBYTE(v4) = !_CGRectContainsRectVertically(v26, v28, v30, v32, v6, v8, v10, v14);
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setInlineText:(id)a3 inlineRect:(CGRect)a4 maxX:(double)a5 layout:(BOOL)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  -[UIKeyboardCandidateInlineFloatingView setInlineText:](self, "setInlineText:", a3, a6);
  -[UIKeyboardCandidateInlineFloatingView setInlineRect:](self, "setInlineRect:", x, y, width, height);
  [(UIKeyboardCandidateInlineFloatingView *)self setMaxX:a5];
  double v12 = +[UIKeyboardImpl activeInstance];
  id v93 = [v12 inputOverlayContainer];

  double v13 = [(UIView *)self superview];

  if (v13)
  {
    [v93 bringSubviewToFront:self];
  }
  else
  {
    [v93 addSubview:self];
    CGFloat v14 = +[UIKeyboardImpl activeInstance];
    double v15 = [v14 inputDelegate];
    double v16 = [v15 textInputView];
    [v16 _convertVisualAltitude:self toView:0.0];
    -[UIView _setVisualAltitude:](self, "_setVisualAltitude:");
  }
  if ([(UIKeyboardCandidateInlineFloatingView *)self inlineRectIsVertical])
  {
    [(UIKeyboardCandidateInlineFloatingView *)self inlineRect];
    [(UIKeyboardCandidateInlineFloatingView *)self setMaxX:CGRectGetMinX(v95)];
    [(UIKeyboardCandidateInlineFloatingView *)self inlineRect];
    if (v17 > 100.0)
    {
      double v18 = [(UIView *)self superview];
      [v18 bounds];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v27 = [(UIView *)self superview];
      [v27 safeAreaInsets];
      CGFloat v29 = v20 + v28;
      double v31 = v22 + v30;
      CGFloat v33 = v24 - (v28 + v32);
      double v35 = v26 - (v30 + v34);

      [(UIKeyboardCandidateInlineFloatingView *)self inlineRect];
      v100.origin.double x = v36;
      v100.origin.double y = v37;
      v100.size.double width = v38;
      v100.size.double height = v39;
      v96.origin.double x = v29;
      v96.origin.double y = v31 + 100.0;
      v96.size.double width = v33;
      v96.size.double height = v35 + -100.0;
      CGRect v97 = CGRectIntersection(v96, v100);
      -[UIKeyboardCandidateInlineFloatingView setInlineRect:](self, "setInlineRect:", v97.origin.x, v97.origin.y, v97.size.width, v97.size.height);
    }
  }
  double v40 = [(UIKeyboardCandidateInlineFloatingView *)self inlineText];
  [(UIKeyboardCandidateInlineFloatingView *)self inlineRect];
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  [(UIKeyboardCandidateInlineFloatingView *)self maxX];
  -[UIKeyboardCandidateInlineFloatingView adjustFrameForInlineText:inlineRect:maxX:](self, "adjustFrameForInlineText:inlineRect:maxX:", v40, v42, v44, v46, v48, v49);

  double v50 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v51 = [v50 containerView];

  uint64_t v52 = [(UIView *)self superview];
  if ((void *)v52 != v51)
  {
    int v53 = (void *)v52;
    CGFloat v54 = [(UIView *)self superview];
    [v54 bounds];
    CGFloat v56 = v55;
    CGFloat v58 = v57;
    CGFloat v60 = v59;
    CGFloat v62 = v61;
    [(UIView *)self frame];
    v101.origin.double x = v63;
    v101.origin.double y = v64;
    v101.size.double width = v65;
    v101.size.double height = v66;
    v98.origin.double x = v56;
    v98.origin.double y = v58;
    v98.size.double width = v60;
    v98.size.double height = v62;
    BOOL v67 = CGRectContainsRect(v98, v101);

    if (v67) {
      goto LABEL_13;
    }
    id v68 = v51;
    [(UIKeyboardCandidateInlineFloatingView *)self inlineRect];
    double v70 = v69;
    double v72 = v71;
    double v74 = v73;
    double v76 = v75;
    double v77 = [(UIView *)self superview];
    objc_msgSend(v68, "convertRect:fromView:", v77, v70, v72, v74, v76);
    -[UIKeyboardCandidateInlineFloatingView setInlineRect:](self, "setInlineRect:");

    [v68 bounds];
    [(UIKeyboardCandidateInlineFloatingView *)self setMaxX:v78 + v79];
    if ([(UIKeyboardCandidateInlineFloatingView *)self inlineRectIsVertical])
    {
      [(UIKeyboardCandidateInlineFloatingView *)self inlineRect];
      [(UIKeyboardCandidateInlineFloatingView *)self setMaxX:CGRectGetMinX(v99)];
    }
    [v68 addSubview:self];
    double v80 = +[UIKeyboardImpl activeInstance];
    double v81 = [v80 inputDelegate];
    double v82 = [v81 textInputView];
    [v82 _convertVisualAltitude:self toView:0.0];
    -[UIView _setVisualAltitude:](self, "_setVisualAltitude:");

    BOOL v83 = [(UIKeyboardCandidateInlineFloatingView *)self inlineText];
    [(UIKeyboardCandidateInlineFloatingView *)self inlineRect];
    double v85 = v84;
    double v87 = v86;
    double v89 = v88;
    double v91 = v90;
    [(UIKeyboardCandidateInlineFloatingView *)self maxX];
    -[UIKeyboardCandidateInlineFloatingView adjustFrameForInlineText:inlineRect:maxX:](self, "adjustFrameForInlineText:inlineRect:maxX:", v83, v85, v87, v89, v91, v92);
  }
LABEL_13:
  [(UIView *)self setNeedsLayout];
  [(UIView *)self layoutIfNeeded];
}

- (void)layoutSubviews
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardCandidateInlineFloatingView;
  [(UIView *)&v13 layoutSubviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(UIView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        CGFloat v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        [(UIView *)self bounds];
        objc_msgSend(v8, "setFrame:");
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  CGFloat v8 = [(UIView *)self subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
        if (objc_msgSend(v13, "pointInside:withEvent:", v7))
        {

          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardCandidateInlineFloatingView;
  BOOL v14 = -[UIView pointInside:withEvent:](&v16, sel_pointInside_withEvent_, v7, x, y);
LABEL_11:

  return v14;
}

- (id)traitCollection
{
  v3 = [(UIView *)self window];

  if (v3)
  {
    uint64_t v4 = [(UIView *)self window];
    uint64_t v5 = [v4 traitCollection];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKeyboardCandidateInlineFloatingView;
    uint64_t v5 = [(UIView *)&v7 traitCollection];
  }
  return v5;
}

- (NSString)inlineText
{
  return self->_inlineText;
}

- (void)setInlineText:(id)a3
{
}

- (CGRect)inlineRect
{
  double x = self->_inlineRect.origin.x;
  double y = self->_inlineRect.origin.y;
  double width = self->_inlineRect.size.width;
  double height = self->_inlineRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInlineRect:(CGRect)a3
{
  self->_inlineRect = a3;
}

- (BOOL)inlineRectIsVertical
{
  return self->_inlineRectIsVertical;
}

- (void)setInlineRectIsVertical:(BOOL)a3
{
  self->_inlineRectIsVertical = a3;
}

- (double)maxX
{
  return self->_maxX;
}

- (void)setMaxX:(double)a3
{
  self->_maxX = a3;
}

- (double)extendedStateAdditionalHeight
{
  return self->_extendedStateAdditionalHeight;
}

- (void)setExtendedStateAdditionalHeight:(double)a3
{
  self->_extendedStateAdditionalHeight = a3;
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (BOOL)isReducedWidth
{
  return self->_reducedWidth;
}

- (int)position
{
  return self->_position;
}

- (void)setPosition:(int)a3
{
  self->_position = a3;
}

- (CGRect)previousCollapsedFrame
{
  double x = self->_previousCollapsedFrame.origin.x;
  double y = self->_previousCollapsedFrame.origin.y;
  double width = self->_previousCollapsedFrame.size.width;
  double height = self->_previousCollapsedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousCollapsedFrame:(CGRect)a3
{
  self->_previousCollapsedFrame = a3;
}

- (int)adjustMode
{
  return self->_adjustMode;
}

- (void)setAdjustMode:(int)a3
{
  self->_adjustMode = a3;
}

- (UIEdgeInsets)extraInsets
{
  double top = self->_extraInsets.top;
  double left = self->_extraInsets.left;
  double bottom = self->_extraInsets.bottom;
  double right = self->_extraInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setExtraInsets:(UIEdgeInsets)a3
{
  self->_extraInsets = a3;
}

- (UIEdgeInsets)cellPadding
{
  double top = self->_cellPadding.top;
  double left = self->_cellPadding.left;
  double bottom = self->_cellPadding.bottom;
  double right = self->_cellPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCellPadding:(UIEdgeInsets)a3
{
  self->_cellPadding = a3;
}

- (void).cxx_destruct
{
}

@end