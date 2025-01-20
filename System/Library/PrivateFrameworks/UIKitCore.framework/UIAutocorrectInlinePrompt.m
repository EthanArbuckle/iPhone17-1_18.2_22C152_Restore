@interface UIAutocorrectInlinePrompt
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAcceptableTextEffectsFrame:(CGRect)a3 afterScrollBy:(double)a4;
- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)prepareForAnimation:(CGRect)a3;
- (CGRect)correctionFrameFromDesiredFrame:(CGRect)a3 textHeight:(int)a4 withExtraGap:(double)a5;
- (CGRect)horizontallySquishedCorrectionFrame:(CGRect)a3;
- (CGRect)shadowFrameForFrame:(CGRect)a3;
- (UIAutocorrectInlinePrompt)initWithFrame:(CGRect)a3;
- (id)correction;
- (id)correctionAnimationView;
- (id)correctionShadowView;
- (id)correctionView;
- (id)typedText;
- (id)typedTextAnimationView;
- (id)typedTextView;
- (int)textEffectsVisibilityLevel;
- (int)textEffectsVisibilityLevelInKeyboardWindow;
- (unsigned)usageTrackingMask;
- (void)addTypedTextRect:(CGRect)a3;
- (void)dealloc;
- (void)dismiss;
- (void)removePromptSubviews;
- (void)setCorrection:(id)a3 typedText:(id)a4 inRect:(CGRect)a5 maxX:(double)a6;
- (void)setUsageTrackingMask:(unsigned int)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation UIAutocorrectInlinePrompt

- (UIAutocorrectInlinePrompt)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIAutocorrectInlinePrompt;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    m_typedTextViews = v3->m_typedTextViews;
    v3->m_typedTextViews = v4;

    [(UIView *)v3 setOpaque:0];
    [(UIView *)v3 setUserInteractionEnabled:1];
    [(UIView *)v3 setClipsToBounds:0];
  }
  return v3;
}

- (int)textEffectsVisibilityLevelInKeyboardWindow
{
  return 12;
}

- (int)textEffectsVisibilityLevel
{
  v2 = [(UIView *)self superview];
  int v3 = [v2 textEffectsVisibilityLevel];

  if (v3 <= 8) {
    return 8;
  }
  else {
    return v3;
  }
}

- (void)dealloc
{
  [(UIAutocorrectInlinePrompt *)self removePromptSubviews];
  v3.receiver = self;
  v3.super_class = (Class)UIAutocorrectInlinePrompt;
  [(UIView *)&v3 dealloc];
}

- (void)removePromptSubviews
{
  [(NSMutableArray *)self->m_typedTextViews makeObjectsPerformSelector:sel_removeFromSuperview];
  [(NSMutableArray *)self->m_typedTextViews removeAllObjects];
  [(UIView *)self->m_correctionView removeFromSuperview];
  m_correctionView = self->m_correctionView;
  self->m_correctionView = 0;

  [(UIView *)self->m_correctionAnimationView removeFromSuperview];
  m_correctionAnimationView = self->m_correctionAnimationView;
  self->m_correctionAnimationView = 0;

  [(UIView *)self->m_typedTextAnimationView removeFromSuperview];
  m_typedTextAnimationView = self->m_typedTextAnimationView;
  self->m_typedTextAnimationView = 0;

  [(UIView *)self->m_correctionShadowView removeFromSuperview];
  m_correctionShadowView = self->m_correctionShadowView;
  self->m_correctionShadowView = 0;
}

- (CGRect)shadowFrameForFrame:(CGRect)a3
{
  return CGRectInset(a3, -3.0, -5.0);
}

- (void)setCorrection:(id)a3 typedText:(id)a4 inRect:(CGRect)a5 maxX:(double)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v13 = a3 == 0;
  id v14 = a4;
  v15 = (NSString *)[a3 copy];
  m_correction = self->m_correction;
  self->m_correction = v15;

  v17 = (NSString *)[v14 copy];
  m_typedText = self->m_typedText;
  self->m_typedText = v17;

  [(UIAutocorrectInlinePrompt *)self removePromptSubviews];
  [(UIView *)self setHidden:v13];
  if (a3)
  {
    v19 = [(UIView *)self superview];

    if (!v19)
    {
      v20 = +[UIKeyboardImpl activeInstance];
      v21 = [v20 inputOverlayContainer];

      [v21 addSubview:self];
    }
  }
  if (self->m_correction)
  {
    self->m_fits = 1;
    self->m_originalTypedTextRectCorrectionAmount = 0.0;
    v22 = self->m_typedText;
    v23 = [(UIView *)self superview];
    double v24 = AutocorrectAdjustedInlineRect(v22, v23, x, y, width, height);
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;

    self->m_originalTypedTextRectCorrectionAmount = vabdd_f64(y, v26);
    v31 = +[UIScreen mainScreen];
    [v31 scale];
    double v33 = v32;

    CGFloat v34 = floor(v24 * v33) / v33;
    CGFloat v35 = floor(v26 * v33) / v33;
    double v36 = floor(v28 * v33) / v33;
    double v37 = floor(v30 * v33) / v33;
    -[UIView setFrame:](self, "setFrame:", v34, v35, v36, v37);
    self->m_originalTypedTextRect.origin.double x = v34;
    self->m_originalTypedTextRect.origin.double y = v35;
    self->m_originalTypedTextRect.size.double width = v36;
    self->m_originalTypedTextRect.size.double height = v37;
    id v106 = [(UIView *)self superview];
    double v104 = v34;
    double v105 = a6;
    if (objc_opt_respondsToSelector())
    {
      [v106 selectionClipRect];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        double v42 = *MEMORY[0x1E4F1DB20];
        double v43 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v44 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v45 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_12:
        double v46 = v37 + 2.0;
        v108.origin.double x = v42;
        v108.origin.double y = v43;
        v108.size.double width = v44;
        v108.size.double height = v45;
        double v47 = 0.0;
        if (CGRectIsNull(v108))
        {
          double v48 = 0.0;
        }
        else
        {
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v106, v42, v43, v44, v45);
          v112.origin.double x = 0.0;
          v112.origin.double y = 0.0;
          v112.size.double width = v36;
          v112.size.double height = v37 + 2.0;
          CGRect v110 = CGRectIntersection(v109, v112);
          double v48 = v110.origin.x;
          double v47 = v110.origin.y;
          double v36 = v110.size.width;
          double v46 = v110.size.height;
        }
        v49 = -[UIAutocorrectTextView initWithFrame:string:type:edgeType:]([UIAutocorrectTextView alloc], "initWithFrame:string:type:edgeType:", self->m_typedText, 2, 0, v48, v47, v36, v46);
        [(UIView *)self addSubview:v49];
        [(NSMutableArray *)self->m_typedTextViews addObject:v49];
        [(UIView *)v49 origin];
        double v51 = v50;
        v52 = self->m_typedText;
        v53 = inlinePromptTextFont();
        v54 = v52;
        id v55 = v53;
        if (v54 && [(NSString *)v54 length])
        {
          [(NSString *)v54 _legacy_sizeWithFont:v55 forWidth:2 lineBreakMode:3.40282347e38];
          double v57 = v56;
          double v59 = ceil(v58);
        }
        else
        {
          objc_msgSend(@" ", "_legacy_sizeWithFont:forWidth:lineBreakMode:", v55, 2, 3.40282347e38);
          double v57 = v60;
          double v59 = 0.0;
        }

        v61 = -[UIAutocorrectTextView initWithFrame:string:type:edgeType:]([UIAutocorrectTextView alloc], "initWithFrame:string:type:edgeType:", self->m_correction, 1, 1, v48, v51, v59, v57 + 2.0);
        m_correctionView = self->m_correctionView;
        self->m_correctionView = &v61->super;

        [(UIView *)self->m_correctionView frame];
        double v64 = v63;
        double v66 = v65;
        double v68 = v67;
        double v70 = v69;
        double v71 = v104 + v63 + v67;
        if (v71 > v105)
        {
          [(UIView *)v49 frame];
          double v64 = v72 + v73 - v68;
          double v74 = v104 + v64;
          if (v104 + v64 <= 0.0)
          {
            if (v68 <= v105)
            {
              double v64 = v105 - v68 - v104;
            }
            else
            {
              -[UIView setIsLongString:](self->m_correctionView, "setIsLongString:", 1, v74);
              double v64 = -v104;
              double v68 = v105;
            }
          }
          else
          {
            -[UIView setEdgeType:](self->m_correctionView, "setEdgeType:", 2, v74);
          }
          -[UIView setFrame:](self->m_correctionView, "setFrame:", v64, v66, v68, v70);
          if (v71 + v70 * -0.68 > v105) {
            self->m_fits = 0;
          }
        }
        -[UIAutocorrectInlinePrompt horizontallySquishedCorrectionFrame:](self, "horizontallySquishedCorrectionFrame:", v64, v66, v68, v70);
        double v76 = v75;
        double v78 = v77;
        double v80 = v79;
        double v82 = v81;
        [(UIView *)v49 size];
        -[UIAutocorrectInlinePrompt correctionFrameFromDesiredFrame:textHeight:withExtraGap:](self, "correctionFrameFromDesiredFrame:textHeight:withExtraGap:", (int)v83, v76, v78, v80, v82, 0.0);
        -[UIView setFrame:](self->m_correctionView, "setFrame:");
        v84 = +[UIKeyboardImpl activeInstance];
        if ([v84 isPredictionViewControllerVisible])
        {
        }
        else
        {
          v85 = +[UIKeyboardImpl activeInstance];
          int v86 = [v85 accessibilityUsesExtendedKeyboardPredictionsEnabled];

          if (!v86)
          {
            [(UIView *)self setUserInteractionEnabled:1];
            [(UIView *)self addSubview:self->m_correctionView];
            goto LABEL_32;
          }
        }
        [(UIView *)self->m_correctionView removeFromSuperview];
        [(UIView *)self setUserInteractionEnabled:0];
LABEL_32:
        v87 = [(UIView *)self window];
        if ([v87 _isTextEffectsWindow])
        {
          v88 = +[UIPeripheralHost sharedInstance];
          [v88 _inputViewRectToAvoid];
          CGFloat v90 = v89;
          CGFloat v92 = v91;
          CGFloat v94 = v93;
          CGFloat v96 = v95;
          v97 = [(UIView *)self window];
          v98 = [(UIView *)self superview];
          [(UIView *)self frame];
          objc_msgSend(v98, "convertRect:toView:", 0);
          objc_msgSend(v97, "convertRect:toWindow:", 0);
          v113.origin.double x = v99;
          v113.origin.double y = v100;
          v113.size.double width = v101;
          v113.size.double height = v102;
          v111.origin.double x = v90;
          v111.origin.double y = v92;
          v111.size.double width = v94;
          v111.size.double height = v96;
          BOOL v103 = CGRectContainsRect(v111, v113);

          if (v103) {
            [(UIView *)self setHidden:1];
          }
        }
        else
        {
        }

        return;
      }
      [v106 _selectionClipRect];
    }
    double v42 = v38;
    double v43 = v39;
    double v44 = v40;
    double v45 = v41;
    goto LABEL_12;
  }
}

- (void)addTypedTextRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(UIView *)self superview];
  objc_msgSend(v8, "convertRect:toView:", self, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v18 = -[UIAutocorrectTextView initWithFrame:string:type:edgeType:]([UIAutocorrectTextView alloc], "initWithFrame:string:type:edgeType:", 0, 2, 0, v10, v12, v14, v16 + 2.0);
  v17 = [(UIAutocorrectInlinePrompt *)self typedTextView];
  [(UIView *)self _addSubview:v18 positioned:-3 relativeTo:v17];

  [(NSMutableArray *)self->m_typedTextViews addObject:v18];
}

- (BOOL)isAcceptableTextEffectsFrame:(CGRect)a3 afterScrollBy:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  CGFloat v8 = a3.origin.y - a4;
  double v9 = [(UIView *)self superview];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v9, x, v8, width, height);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v18 = [(UIView *)self superview];
  [v18 bounds];
  IsEmptdouble y = CGRectIsEmpty(v66);
  v20 = [(UIView *)self superview];
  v21 = v20;
  double v64 = width;
  double v65 = height;
  double v62 = v8;
  double v63 = x;
  if (IsEmpty)
  {
    v22 = [v20 superview];
    [v22 bounds];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
  }
  else
  {
    [v20 bounds];
    CGFloat v24 = v31;
    CGFloat v26 = v32;
    CGFloat v28 = v33;
    CGFloat v30 = v34;
  }

  if (!_CGRectContainsRectVertically(v24, v26, v28, v30, v11, v13, v15, v17)) {
    return 0;
  }
  CGFloat v35 = +[UIKeyboardImpl activeInstance];
  double v36 = [v35 _window];
  double v37 = [v36 screen];
  double v38 = [(UIView *)self _window];
  double v39 = [v38 screen];

  if (v37 != v39) {
    goto LABEL_9;
  }
  double v40 = [(UIView *)self _window];
  double v41 = [v40 screen];
  double v42 = [v41 coordinateSpace];

  -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v42, v63, v62, v64, v65);
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  uint64_t v51 = [v35 _rootInputWindowController];
  [(id)v51 visibleInputViewFrame];
  CGFloat v53 = v52;
  CGFloat v55 = v54;
  CGFloat v57 = v56;
  CGFloat v59 = v58;

  v67.origin.double x = v44;
  v67.origin.double y = v46;
  v67.size.double width = v48;
  v67.size.double height = v50;
  v68.origin.double x = v53;
  v68.origin.double y = v55;
  v68.size.double width = v57;
  v68.size.double height = v59;
  LOBYTE(v51) = CGRectIntersectsRect(v67, v68);

  if (v51) {
    BOOL v60 = 0;
  }
  else {
LABEL_9:
  }
    BOOL v60 = 1;

  return v60;
}

- (CGRect)horizontallySquishedCorrectionFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v8 = +[UIKeyboardImpl activeInstance];
  double v9 = [v8 inputDelegateManager];
  double v10 = [v9 keyInputDelegate];

  CGFloat v11 = +[UIKeyboardImpl activeInstance];
  double v12 = [v11 textInputTraits];
  int v13 = [v12 isSingleLineDocument];

  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v14 = [(UIView *)self window];
    -[UIView convertRect:toView:](self, "convertRect:toView:", v14, x, y, width, height);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    double v23 = [(UIView *)self window];
    objc_msgSend(v23, "convertRect:toWindow:", 0, v16, v18, v20, v22);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    double v32 = [v10 window];
    objc_msgSend(v32, "convertRect:fromWindow:", 0, v25, v27, v29, v31);
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;

    double v41 = [v10 window];
    objc_msgSend(v10, "convertRect:fromView:", v41, v34, v36, v38, v40);
    double v112 = v43;
    double v113 = v42;
    double v114 = v44;
    double v111 = v45;

    [v10 bounds];
    double v47 = v46;
    double v49 = v48;
    double v110 = v50;
    double v52 = v51 + 6.0;
    CGFloat v53 = UIRectGetMaxX;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v54 = [v10 effectiveUserInterfaceLayoutDirection];
      BOOL v55 = v54 == 1;
      if (v54 == 1) {
        double v56 = UIRectGetMaxX;
      }
      else {
        double v56 = (double (*)(double, double, double))UIRectGetMinX;
      }
      if (v54 == 1) {
        CGFloat v53 = (double (*)(double, double, double))UIRectGetMinX;
      }
      else {
        CGFloat v53 = UIRectGetMaxX;
      }
    }
    else
    {
      double v56 = (double (*)(double, double, double))UIRectGetMinX;
      BOOL v55 = 0;
    }
    double v57 = v47 + -3.0;
    double v58 = v49 + 0.0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__UIAutocorrectInlinePrompt_horizontallySquishedCorrectionFrame___block_invoke;
    aBlock[3] = &__block_descriptor_33_e42_v48__0_CGRect__CGPoint_dd__CGSize_dd__8d40l;
    BOOL v120 = v55;
    CGFloat v59 = _Block_copy(aBlock);
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __65__UIAutocorrectInlinePrompt_horizontallySquishedCorrectionFrame___block_invoke_2;
    v117[3] = &__block_descriptor_33_e42_v48__0_CGRect__CGPoint_dd__CGSize_dd__8d40l;
    BOOL v118 = v55;
    BOOL v60 = _Block_copy(v117);
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __65__UIAutocorrectInlinePrompt_horizontallySquishedCorrectionFrame___block_invoke_3;
    v115[3] = &__block_descriptor_33_e11_B24__0d8d16l;
    BOOL v116 = v55;
    v61 = (unsigned int (**)(void, double, double))_Block_copy(v115);
    double v62 = v114;
    if (v114 <= v52)
    {
      double v70 = ((double (*)(double, double, double, double))v56)(v113, v112, v114, v111);
      double v71 = ((double (*)(double, double, double, double))v56)(v57, v58, v52, v110);
      if (v61[2](v61, v70, v71))
      {
        v63.n128_u64[0] = ((double (*)(double, double, double, double))v56)(v57, v58, v52, v110);
        double v64 = (void (*)(void *, __n128, __n128, double, double, __n128))v59[2];
        double v65 = v59;
      }
      else
      {
        double v72 = ((double (*)(double, double, double, double))v53)(v57, v58, v52, v110);
        double v73 = ((double (*)(double, double, double, double))v53)(v113, v112, v114, v111);
        if (!v61[2](v61, v72, v73))
        {
LABEL_19:

          goto LABEL_20;
        }
        v63.n128_u64[0] = ((double (*)(double, double, double, double))v53)(v57, v58, v52, v110);
        double v64 = (void (*)(void *, __n128, __n128, double, double, __n128))v60[2];
        double v65 = v60;
      }
      double v67 = v112;
      double v66 = v113;
      v68.n128_f64[0] = v113;
      v69.n128_f64[0] = v112;
      double v62 = v114;
    }
    else
    {
      v63.n128_u64[0] = ((double (*)(double, double, double, double))v56)(v57, v58, v52, v110);
      double v64 = (void (*)(void *, __n128, __n128, double, double, __n128))v59[2];
      double v65 = v59;
      double v67 = v112;
      double v66 = v113;
      v68.n128_f64[0] = v113;
      v69.n128_f64[0] = v112;
    }
    v64(v65, v68, v69, v62, v111, v63);
    double v74 = [v10 window];
    objc_msgSend(v10, "convertRect:toView:", v74, v66, v67, v62, v111);
    double v76 = v75;
    double v78 = v77;
    double v80 = v79;
    double v82 = v81;

    double v83 = [v10 window];
    objc_msgSend(v83, "convertRect:toWindow:", 0, v76, v78, v80, v82);
    double v85 = v84;
    double v87 = v86;
    double v89 = v88;
    double v91 = v90;

    CGFloat v92 = [(UIView *)self window];
    objc_msgSend(v92, "convertRect:fromWindow:", 0, v85, v87, v89, v91);
    double v94 = v93;
    double v96 = v95;
    double v98 = v97;
    double v100 = v99;

    CGFloat v101 = [(UIView *)self window];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v101, v94, v96, v98, v100);
    double x = v102;
    double y = v103;
    double width = v104;
    double height = v105;

    goto LABEL_19;
  }
LABEL_20:

  double v106 = x;
  double v107 = y;
  double v108 = width;
  double v109 = height;
  result.size.double height = v109;
  result.size.double width = v108;
  result.origin.double y = v107;
  result.origin.double x = v106;
  return result;
}

BOOL __65__UIAutocorrectInlinePrompt_horizontallySquishedCorrectionFrame___block_invoke_3(uint64_t a1, double a2, double a3)
{
  if (*(unsigned char *)(a1 + 32)) {
    return a2 > a3;
  }
  else {
    return a2 < a3;
  }
}

- (CGRect)correctionFrameFromDesiredFrame:(CGRect)a3 textHeight:(int)a4 withExtraGap:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = a3.origin.y + (double)a4 + a5 + -1.0;
  if (!-[UIAutocorrectInlinePrompt isAcceptableTextEffectsFrame:afterScrollBy:](self, "isAcceptableTextEffectsFrame:afterScrollBy:", a3.origin.x, v10, a3.size.width, a3.size.height, 0.0))
  {
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    if (v11 <= 0.0) {
      double v11 = 1.0;
    }
    double v12 = y - height + v11;
    int v13 = [(UIView *)self window];
    -[UIView convertRect:toView:](self, "convertRect:toView:", v13, x, v12, width, height);
    double v15 = v14;

    double v16 = [(UIView *)self window];
    double v17 = __UIStatusBarManagerForWindow(v16);
    [v17 statusBarHeight];
    double v19 = v18;

    double v20 = v19 - v15;
    if (v15 >= v19) {
      double v20 = -0.0;
    }
    double v21 = v12 + v20;
    if (-[UIAutocorrectInlinePrompt isAcceptableTextEffectsFrame:afterScrollBy:](self, "isAcceptableTextEffectsFrame:afterScrollBy:", x, v21, width, height, 1.0))
    {
      double v10 = v21;
    }
  }
  double v22 = x;
  double v23 = v10;
  double v24 = width;
  double v25 = height;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (id)correction
{
  return self->m_correction;
}

- (id)typedText
{
  return self->m_typedText;
}

- (id)typedTextView
{
  objc_super v3 = (void *)[(NSMutableArray *)self->m_typedTextViews count];
  if (v3)
  {
    objc_super v3 = [(NSMutableArray *)self->m_typedTextViews objectAtIndex:0];
  }
  return v3;
}

- (id)correctionView
{
  return self->m_correctionView;
}

- (id)correctionAnimationView
{
  return self->m_correctionAnimationView;
}

- (id)typedTextAnimationView
{
  return self->m_typedTextAnimationView;
}

- (id)correctionShadowView
{
  return self->m_correctionShadowView;
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  return -[UIView pointInside:forEvent:](self->m_correctionView, "pointInside:forEvent:", a4, a3.x, a3.y);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v6 = self;
  m_correctionView = self->m_correctionView;
  id v8 = a4;
  -[UIView convertPoint:fromView:](m_correctionView, "convertPoint:fromView:", v6, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](m_correctionView, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (void)dismiss
{
  id v2 = +[UIKeyboardImpl activeInstance];
  [v2 fadeAutocorrectPrompt];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->m_mouseDown = 1;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  m_correctionView = self->m_correctionView;
  id v6 = a4;
  [(UIView *)m_correctionView origin];
  BOOL v7 = -[UIAutocorrectInlinePrompt pointInside:withEvent:](self, "pointInside:withEvent:", v6);

  if (self->m_mouseDown && v7) {
    [(UIAutocorrectInlinePrompt *)self dismiss];
  }
  self->m_mouseDown = 0;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  self->m_mouseDown = 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if ([v4 _isGestureType:0]
    && [v4 numberOfTouchesRequired] == 1
    && [v4 numberOfTapsRequired] == 1
    || [v4 _isGestureType:1] && objc_msgSend(v4, "numberOfTouchesRequired") == 1)
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAutocorrectInlinePrompt;
    BOOL v5 = [(UIView *)&v7 gestureRecognizerShouldBegin:v4];
  }

  return v5;
}

- (BOOL)prepareForAnimation:(CGRect)a3
{
  if (!self->m_fits
    || vabdd_f64(self->m_originalTypedTextRect.origin.y, a3.origin.y) > self->m_originalTypedTextRectCorrectionAmount
                                                                      + 0.00000011920929)
  {
    return 0;
  }
  BOOL v5 = [(UIAutocorrectInlinePrompt *)self typedTextView];
  [v5 reduceWidth:3.0];
  id v6 = [UIAutocorrectTextView alloc];
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v11 = -[UIAutocorrectTextView initWithFrame:string:type:edgeType:](v6, "initWithFrame:string:type:edgeType:", self->m_typedText, 4, 0, *MEMORY[0x1E4F1DB28], v8, v9, v10);
  m_typedTextAnimationView = self->m_typedTextAnimationView;
  self->m_typedTextAnimationView = v11;

  int v13 = self->m_typedTextAnimationView;
  [v5 frame];
  -[UIView setFrame:](v13, "setFrame:");
  [(UIView *)self _addSubview:self->m_typedTextAnimationView positioned:-2 relativeTo:v5];
  [(NSMutableArray *)self->m_typedTextViews makeObjectsPerformSelector:sel_removeFromSuperview];
  if ((unint64_t)[(NSMutableArray *)self->m_typedTextViews count] >= 2) {
    -[NSMutableArray removeObjectsInRange:](self->m_typedTextViews, "removeObjectsInRange:", 1, [(NSMutableArray *)self->m_typedTextViews count] - 1);
  }
  [(UIView *)self->m_correctionShadowView removeFromSuperview];
  [(UIView *)self->m_correctionView setEdgeType:0];
  [(UIView *)self->m_correctionView setAnimating:1];
  [(UIView *)self->m_correctionView reduceWidth:3.0];
  [(UIView *)self->m_correctionView size];
  double v15 = v14;
  double v17 = v16;
  [v5 size];
  if (v15 >= v18)
  {
    if (v18 < v15)
    {
      -[UIView setSize:](self->m_typedTextAnimationView, "setSize:", v15, v17);
      objc_msgSend(v5, "setSize:", v15, v17);
    }
  }
  else
  {
    -[UIView setSize:](self->m_correctionView, "setSize:");
    [(UIView *)self->m_correctionView setNeedsDisplay];
  }
  double v19 = -[UIAutocorrectTextView initWithFrame:string:type:edgeType:]([UIAutocorrectTextView alloc], "initWithFrame:string:type:edgeType:", self->m_correction, 3, 0, v7, v8, v9, v10);
  m_correctionAnimationView = self->m_correctionAnimationView;
  self->m_correctionAnimationView = &v19->super;

  double v21 = self->m_correctionAnimationView;
  [(UIView *)self->m_correctionView frame];
  -[UIView setFrame:](v21, "setFrame:");
  [(UIView *)self _addSubview:self->m_correctionAnimationView positioned:-3 relativeTo:self->m_correctionView];

  return 1;
}

- (unsigned)usageTrackingMask
{
  return self->m_usageTrackingMask;
}

- (void)setUsageTrackingMask:(unsigned int)a3
{
  self->m_usageTrackingMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_correctionShadowView, 0);
  objc_storeStrong((id *)&self->m_typedTextAnimationView, 0);
  objc_storeStrong((id *)&self->m_correctionAnimationView, 0);
  objc_storeStrong((id *)&self->m_correctionView, 0);
  objc_storeStrong((id *)&self->m_typedTextViews, 0);
  objc_storeStrong((id *)&self->m_correction, 0);
  objc_storeStrong((id *)&self->m_typedText, 0);
}

@end