@interface UIInlineTextCompletionPrompt
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSString)textCompletion;
- (NSString)typedText;
- (TIKeyboardCandidate)textCompletionCandidate;
- (UIInlineTextCompletionPrompt)initWithFrame:(CGRect)a3;
- (UITextCompletionAcceptanceDelegate)delegate;
- (int)textEffectsVisibilityLevel;
- (int)textEffectsVisibilityLevelInKeyboardWindow;
- (void)accept;
- (void)dealloc;
- (void)removePromptSubviews;
- (void)setDelegate:(id)a3;
- (void)setTextCompletion:(id)a3 inRect:(CGRect)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation UIInlineTextCompletionPrompt

- (UIInlineTextCompletionPrompt)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIInlineTextCompletionPrompt;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    typedTextViews = v3->_typedTextViews;
    v3->_typedTextViews = v4;

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
  [(UIInlineTextCompletionPrompt *)self removePromptSubviews];
  v3.receiver = self;
  v3.super_class = (Class)UIInlineTextCompletionPrompt;
  [(UIView *)&v3 dealloc];
}

- (void)removePromptSubviews
{
  [(NSMutableArray *)self->_typedTextViews makeObjectsPerformSelector:sel_removeFromSuperview];
  [(NSMutableArray *)self->_typedTextViews removeAllObjects];
  [(UIView *)self->_textCompletionView removeFromSuperview];
  textCompletionView = self->_textCompletionView;
  self->_textCompletionView = 0;
}

- (void)setTextCompletion:(id)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  BOOL v10 = a3 == 0;
  id v11 = a3;
  v12 = (TIKeyboardCandidate *)[v11 copy];
  textCompletionCandidate = self->_textCompletionCandidate;
  self->_textCompletionCandidate = v12;

  v14 = [v11 candidate];
  v15 = (NSString *)[v14 copy];
  textCompletion = self->_textCompletion;
  self->_textCompletion = v15;

  v17 = [v11 input];

  v18 = (NSString *)[v17 copy];
  typedText = self->_typedText;
  self->_typedText = v18;

  [(UIInlineTextCompletionPrompt *)self removePromptSubviews];
  [(UIView *)self setHidden:v10];
  v20 = +[UIKeyboardImpl activeInstance];
  v21 = [v20 inputOverlayContainer];

  if (a3)
  {
    v22 = [(UIView *)self superview];

    if (!v22) {
      [v21 addSubview:self];
    }
    id v23 = v21;
    v24 = +[UIKeyboard currentDocumentState];
    [v24 clientFrameInWindow];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    id v33 = v23;
    v34 = +[UIKeyboardImpl activeInstance];
    v35 = [v34 inputDelegate];

    v36 = [v35 textInputView];

    if (v33 && v36)
    {
      v37 = +[UIKeyboardImpl activeInstance];
      v38 = [v35 textInputView];
      objc_msgSend(v37, "convertRectToAutocorrectRect:delegateView:container:", v38, v33, v26, v28, v30, v32);
      double v26 = v39;
      double v28 = v40;
      double v30 = v41;
      double v32 = v42;
    }
    v129.origin.double x = v26;
    v129.origin.CGFloat y = v28;
    v129.size.CGFloat width = v30;
    v129.size.CGFloat height = v32;
    if (CGRectIsNull(v129))
    {
      v43 = [v33 window];
      [v43 frame];
      double v26 = v44;
      double v28 = v45;
      double v30 = v46;
      double v32 = v47;
    }
    aRect.origin.CGFloat y = y;
    if (+[UIKeyboard isInputSystemUI])
    {
      v48 = +[UIKeyboard keyboardApplicationIdentifier];
    }
    else
    {
      v48 = 0;
    }
    double v49 = width;
    char v50 = [v48 isEqualToString:@"com.apple.mobilemail"];
    double v51 = 20.0;
    if ((v50 & 1) == 0)
    {
      char v52 = [v48 isEqualToString:@"com.apple.MobileSMS"];
      double v51 = 6.0;
      if ((v52 & 1) == 0)
      {
        if ([v48 isEqualToString:@"com.apple.mobilenotes"]) {
          double v51 = 54.0;
        }
        else {
          double v51 = 0.0;
        }
      }
    }
    double v53 = height;
    v130.origin.double x = v26;
    v130.origin.CGFloat y = v28;
    v130.size.CGFloat width = v30;
    v130.size.CGFloat height = v32;
    CGRect v131 = CGRectInset(v130, v51, 0.0);
    CGFloat v54 = v131.origin.x;
    CGFloat v55 = v131.origin.y;
    CGFloat v56 = v131.size.width;
    CGFloat v57 = v131.size.height;

    v58 = _UIKBInlineTextCompletionLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      v140.origin.double x = v54;
      v140.origin.CGFloat y = v55;
      v140.size.CGFloat width = v56;
      v140.size.CGFloat height = v57;
      v110 = NSStringFromRect(v140);
      *(_DWORD *)buf = 138412290;
      v121 = v110;
      _os_log_debug_impl(&dword_1853B0000, v58, OS_LOG_TYPE_DEBUG, "Computed inlineTextOverlayFrame=%@", buf, 0xCu);
    }
    aRect.origin.double x = v57;

    v59 = +[UIScreen mainScreen];
    [v59 scale];
    double v61 = v60;

    CGFloat v62 = floor(x * v61) / v61;
    double v63 = floor(aRect.origin.y * v61) / v61;
    double v64 = v49 * v61;
    CGFloat v65 = v62;
    double v66 = floor(v64) / v61;
    double v67 = floor(v53 * v61) / v61;
    -[UIView setFrame:](self, "setFrame:", v62, v63, v66, v67);
    if ([(NSString *)self->_typedText length]
      && [(NSString *)self->_textCompletion hasPrefix:self->_typedText])
    {
      v68 = [(NSString *)self->_textCompletion substringFromIndex:[(NSString *)self->_typedText length]];
      v69 = self->_textCompletion;
      self->_textCompletion = v68;
    }
    v70 = self->_textCompletion;
    v71 = _documentTextFont();
    v72 = v70;
    id v73 = v71;
    if (v72 && [(NSString *)v72 length])
    {
      CGFloat v74 = v55;
      [(NSString *)v72 _legacy_sizeWithFont:v73 forWidth:2 lineBreakMode:3.40282347e38];
      double v76 = ceil(v75);
    }
    else
    {
      CGFloat v74 = v55;
      objc_msgSend(@" ", "_legacy_sizeWithFont:forWidth:lineBreakMode:", v73, 2, 3.40282347e38);
      double v76 = 0.0;
    }

    v132.origin.double x = v65;
    v132.origin.CGFloat y = v63;
    v132.size.CGFloat width = v66;
    v132.size.CGFloat height = v67;
    aRect.origin.CGFloat y = v76;
    CGFloat v77 = v76 + CGRectGetMaxX(v132);
    v133.origin.double x = v54;
    v133.origin.CGFloat y = v74;
    v133.size.CGFloat width = v56;
    v133.size.CGFloat height = aRect.origin.x;
    if (v77 <= CGRectGetMaxX(v133))
    {
      v90 = _UIKBInlineTextCompletionLog();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
      {
        v145.origin.CGFloat y = 0.0;
        v145.origin.double x = v66;
        v145.size.CGFloat width = aRect.origin.y;
        v145.size.CGFloat height = v67;
        v114 = NSStringFromRect(v145);
        *(_DWORD *)buf = 138412290;
        v121 = v114;
        _os_log_debug_impl(&dword_1853B0000, v90, OS_LOG_TYPE_DEBUG, "  correctionRect=%@", buf, 0xCu);
      }
      v91 = -[UITextCompletionView initWithFrame:string:type:edgeType:]([UITextCompletionView alloc], "initWithFrame:string:type:edgeType:", self->_textCompletion, 8, 3, v66, 0.0, aRect.origin.y, v67);
      textCompletionView = self->_textCompletionView;
      self->_textCompletionView = &v91->super;

      [(UIView *)self setUserInteractionEnabled:1];
      [(UIView *)self addSubview:self->_textCompletionView];
    }
    else
    {
      v78 = -[UITextCompletionView initWithFrame:string:type:edgeType:]([UITextCompletionView alloc], "initWithFrame:string:type:edgeType:", 0, 9, 0, 0.0, -1.0, v66 + 2.0, v67 + 2.0);
      [(UIView *)self addSubview:v78];
      [(NSMutableArray *)self->_typedTextViews addObject:v78];
      v134.origin.double x = v54;
      v134.origin.CGFloat y = v74;
      v134.size.CGFloat width = v56;
      v134.size.CGFloat height = aRect.origin.x;
      double MinX = CGRectGetMinX(v134);
      v135.origin.CGFloat y = v63;
      v135.origin.double x = v65;
      v135.size.CGFloat width = v66;
      v135.size.CGFloat height = v67;
      double v80 = MinX - CGRectGetMinX(v135);
      v81 = -[UITextCompletionView initWithFrame:string:type:edgeType:]([UITextCompletionView alloc], "initWithFrame:string:type:edgeType:", self->_typedText, 2, 0, v80, v67, v66, v67);
      [(UIView *)self addSubview:v81];
      [(NSMutableArray *)self->_typedTextViews addObject:v81];
      v136.origin.double x = v80;
      v136.origin.CGFloat y = v67;
      v136.size.CGFloat width = v66;
      v136.size.CGFloat height = v67;
      double v82 = CGRectGetMaxX(v136) + -1.0;
      v137.origin.double x = v80;
      v137.origin.CGFloat y = v67;
      v137.size.CGFloat width = v66;
      v137.size.CGFloat height = v67;
      double MinY = CGRectGetMinY(v137);
      v84 = -[UITextCompletionView initWithFrame:string:type:edgeType:]([UITextCompletionView alloc], "initWithFrame:string:type:edgeType:", self->_textCompletion, 8, 3, v82, MinY, aRect.origin.y, v67);
      v85 = self->_textCompletionView;
      self->_textCompletionView = &v84->super;

      [(UIView *)self setUserInteractionEnabled:1];
      [(UIView *)self addSubview:self->_textCompletionView];
      v138.origin.double x = v80;
      v138.origin.CGFloat y = v67;
      v138.size.CGFloat width = v66;
      v138.size.CGFloat height = v67;
      double v86 = CGRectGetMaxX(v138) + -3.0;
      v87 = _UIKBInlineTextCompletionLog();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
      {
        v141.origin.double x = 0.0;
        v141.origin.CGFloat y = -1.0;
        v141.size.CGFloat height = v67 + 2.0;
        v141.size.CGFloat width = v66 + 2.0;
        v115 = NSStringFromRect(v141);
        v142.origin.double x = v80;
        v142.origin.CGFloat y = v67;
        v142.size.CGFloat width = v66;
        v142.size.CGFloat height = v67;
        v111 = NSStringFromRect(v142);
        v143.origin.double x = v82;
        v143.origin.CGFloat y = MinY;
        v143.size.CGFloat width = aRect.origin.y;
        v143.size.CGFloat height = v67;
        v112 = NSStringFromRect(v143);
        v144.size.CGFloat width = 3.5;
        v144.origin.double x = v86;
        v144.origin.CGFloat y = v67;
        v144.size.CGFloat height = v67 + 3.5;
        v113 = NSStringFromRect(v144);
        *(_DWORD *)buf = 138413058;
        v121 = v115;
        __int16 v122 = 2112;
        v123 = v111;
        __int16 v124 = 2112;
        v125 = v112;
        __int16 v126 = 2112;
        v127 = v113;
        _os_log_debug_impl(&dword_1853B0000, v87, OS_LOG_TYPE_DEBUG, "  Will overflow trailing marging!\n    typedTextConcealingRect=%@\n    typedTextOnNextLineRect=%@\n    correctionOnNextLineRect=%@\n    fakeCaretRect=%@", buf, 0x2Au);
      }
      v88 = -[UITextCompletionView initWithFrame:string:type:edgeType:]([UITextCompletionView alloc], "initWithFrame:string:type:edgeType:", 0, 10, 0, v86, v67, 3.5, v67 + 3.5);
      [(UIView *)self addSubview:v88];
      [(NSMutableArray *)self->_typedTextViews addObject:v88];
      *(void *)&aRect.size.CGFloat width = MEMORY[0x1E4F143A8];
      *(void *)&aRect.size.CGFloat height = 3221225472;
      v117 = __57__UIInlineTextCompletionPrompt_setTextCompletion_inRect___block_invoke;
      v118 = &unk_1E52D9F70;
      v119 = v88;
      v89 = v88;
      +[UIView animateWithDuration:24 delay:&aRect.size options:0 animations:0.5 completion:0.5];
    }
    v93 = [(UIView *)self window];
    if ([v93 _isTextEffectsWindow])
    {
      v94 = +[UIPeripheralHost sharedInstance];
      [v94 _inputViewRectToAvoid];
      CGFloat v96 = v95;
      CGFloat v98 = v97;
      CGFloat v100 = v99;
      CGFloat v102 = v101;
      v103 = [(UIView *)self window];
      v104 = [(UIView *)self superview];
      [(UIView *)self frame];
      objc_msgSend(v104, "convertRect:toView:", 0);
      objc_msgSend(v103, "convertRect:toWindow:", 0);
      v146.origin.double x = v105;
      v146.origin.CGFloat y = v106;
      v146.size.CGFloat width = v107;
      v146.size.CGFloat height = v108;
      v139.origin.double x = v96;
      v139.origin.CGFloat y = v98;
      v139.size.CGFloat width = v100;
      v139.size.CGFloat height = v102;
      BOOL v109 = CGRectContainsRect(v139, v146);

      if (v109) {
        [(UIView *)self setHidden:1];
      }
    }
    else
    {
    }
  }
}

uint64_t __57__UIInlineTextCompletionPrompt_setTextCompletion_inRect___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  return -[UIView pointInside:forEvent:](self->_textCompletionView, "pointInside:forEvent:", a4, a3.x, a3.y);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v6 = self;
  textCompletionView = self->_textCompletionView;
  id v8 = a4;
  -[UIView convertPoint:fromView:](textCompletionView, "convertPoint:fromView:", v6, x, y);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](textCompletionView, "pointInside:withEvent:", v8);

  return (char)v6;
}

- (void)accept
{
  objc_super v3 = [(UIInlineTextCompletionPrompt *)self textCompletionCandidate];

  if (v3)
  {
    id v5 = [(UIInlineTextCompletionPrompt *)self delegate];
    v4 = [(UIInlineTextCompletionPrompt *)self textCompletionCandidate];
    [v5 acceptTextCompletion:v4];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_touchDown = 1;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  textCompletionView = self->_textCompletionView;
  id v6 = a4;
  [(UIView *)textCompletionView origin];
  BOOL v7 = -[UIInlineTextCompletionPrompt pointInside:withEvent:](self, "pointInside:withEvent:", v6);

  if (self->_touchDown && v7) {
    [(UIInlineTextCompletionPrompt *)self accept];
  }
  self->_touchDown = 0;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  self->_touchDown = 0;
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
    v7.super_class = (Class)UIInlineTextCompletionPrompt;
    BOOL v5 = [(UIView *)&v7 gestureRecognizerShouldBegin:v4];
  }

  return v5;
}

- (UITextCompletionAcceptanceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UITextCompletionAcceptanceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TIKeyboardCandidate)textCompletionCandidate
{
  return self->_textCompletionCandidate;
}

- (NSString)textCompletion
{
  return self->_textCompletion;
}

- (NSString)typedText
{
  return self->_typedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typedText, 0);
  objc_storeStrong((id *)&self->_textCompletion, 0);
  objc_storeStrong((id *)&self->_textCompletionCandidate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_typedTextViews, 0);
  objc_storeStrong((id *)&self->_textCompletionView, 0);
}

@end