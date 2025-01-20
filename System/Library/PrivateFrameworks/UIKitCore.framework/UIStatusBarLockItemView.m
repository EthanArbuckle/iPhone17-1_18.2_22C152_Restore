@interface UIStatusBarLockItemView
+ (double)lockSlideAnimationDuration;
- (BOOL)_isAnimating;
- (BOOL)alongsideViewIsBecomingVisible;
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (UIView)textClippingView;
- (UIView)timeItemSnapshot;
- (UIView)viewToAnimateAlongside;
- (_UIExpandingGlyphsView)textView;
- (_UIStatusBarLockItemPadlockView)padlockView;
- (double)padlockViewCenterOffsetFromForegroundViewCenter;
- (double)timeItemSnapshotCenterOffsetFromForegroundViewCenter;
- (double)updateContentsAndWidth;
- (double)widthNeededDuringAnimation;
- (double)widthNeededForFinalState;
- (id)accessibilityHUDRepresentation;
- (id)animationCompletionBlock;
- (int)animationCount;
- (void)_beginAnimation;
- (void)_endAnimation;
- (void)animateUnlockForegroundView:(id)a3 timeItemSnapshot:(id)a4 completionBlock:(id)a5;
- (void)jiggleCompletionBlock:(id)a3;
- (void)setAlongsideViewIsBecomingVisible:(BOOL)a3;
- (void)setAnimationCompletionBlock:(id)a3;
- (void)setAnimationCount:(int)a3;
- (void)setPadlockView:(id)a3;
- (void)setPadlockViewCenterOffsetFromForegroundViewCenter:(double)a3;
- (void)setTextClippingView:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTimeItemSnapshot:(id)a3;
- (void)setTimeItemSnapshotCenterOffsetFromForegroundViewCenter:(double)a3;
- (void)setViewToAnimateAlongside:(id)a3;
- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5;
- (void)setWidthNeededDuringAnimation:(double)a3;
- (void)setWidthNeededForFinalState:(double)a3;
@end

@implementation UIStatusBarLockItemView

+ (double)lockSlideAnimationDuration
{
  return 0.91;
}

- (void)_beginAnimation
{
}

- (void)_endAnimation
{
  --self->_animationCount;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  int animationCount = self->_animationCount;
  if (has_internal_diagnostics)
  {
    if ((animationCount & 0x80000000) == 0) {
      goto LABEL_3;
    }
    v7 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Animation count is overreleased.", buf, 2u);
    }
  }
  else
  {
    if ((animationCount & 0x80000000) == 0) {
      goto LABEL_3;
    }
    v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_endAnimation___s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Animation count is overreleased.", v9, 2u);
    }
  }
  int animationCount = self->_animationCount;
LABEL_3:
  if (!animationCount)
  {
    v5 = (void (**)(void))_Block_copy(self->_animationCompletionBlock);
    id animationCompletionBlock = self->_animationCompletionBlock;
    self->_id animationCompletionBlock = 0;

    if (v5) {
      v5[2](v5);
    }
  }
}

- (BOOL)_isAnimating
{
  return self->_animationCount > 0;
}

- (double)updateContentsAndWidth
{
  if (!self->_padlockView)
  {
    v3 = [_UIStatusBarLockItemPadlockView alloc];
    v4 = -[_UIStatusBarLockItemPadlockView initWithFrame:owner:](v3, "initWithFrame:owner:", self, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    padlockView = self->_padlockView;
    self->_padlockView = v4;

    [(UIView *)self->_padlockView sizeToFit];
    [(UIView *)self->_padlockView frame];
    double v7 = v6;
    CGFloat v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(UIView *)self frame];
    double Height = CGRectGetHeight(v18);
    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.height = v13;
    -[UIView setFrame:](self->_padlockView, "setFrame:", v7, (Height - CGRectGetHeight(v19)) * 0.5 + -1.0, v11, v13);
    [(UIView *)self addSubview:self->_padlockView];
  }
  if ([(UIStatusBarLockItemView *)self _isAnimating])
  {
    double widthNeededDuringAnimation = self->_widthNeededDuringAnimation;
  }
  else
  {
    [(UIView *)self->_padlockView frame];
    double widthNeededDuringAnimation = CGRectGetWidth(v20);
  }
  [(UIStatusBarItemView *)self adjustFrameToNewSize:widthNeededDuringAnimation];
  return result;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  padlockView = self->_padlockView;
  id v7 = a3;
  [(_UIStatusBarLockItemPadlockView *)padlockView reset];
  v9.receiver = self;
  v9.super_class = (Class)UIStatusBarLockItemView;
  LOBYTE(v4) = [(UIStatusBarItemView *)&v9 updateForNewData:v7 actions:v4];

  return v4;
}

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v10 = a3;
  int v12 = [(UIStatusBarItemView *)self isVisible] ^ a3;
  if (a5 > 0.0 && v12 == 0)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__UIStatusBarLockItemView_setVisible_frame_duration___block_invoke;
    v14[3] = &unk_1E52DA520;
    v14[4] = self;
    *(double *)&v14[5] = x;
    *(double *)&v14[6] = y;
    *(double *)&v14[7] = width;
    *(double *)&v14[8] = height;
    +[UIView performWithoutAnimation:v14];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)UIStatusBarLockItemView;
    -[UIStatusBarItemView setVisible:frame:duration:](&v15, sel_setVisible_frame_duration_, v10, x, y, width, height, a5);
  }
}

void __53__UIStatusBarLockItemView_setVisible_frame_duration___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layer];
  [v2 position];
  double v4 = v3;
  double v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v7 = [*(id *)(a1 + 32) layer];
  [v7 position];
  double v9 = v8;
  double v11 = v10;

  id v32 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
  setDefaultLockAnimationParameters(v32);
  int v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v4, v6);
  [v32 setFromValue:v12];

  double v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v9, v11);
  [v32 setToValue:v13];

  v14 = [*(id *)(a1 + 32) layer];
  [v14 addAnimation:v32 forKey:@"lock slide"];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 504));
  v16 = WeakRetained;
  if (WeakRetained)
  {
    double v17 = v9 - v4;
    int v18 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 496);
    CGRect v19 = [WeakRetained layer];
    [v19 position];
    double v21 = v20;
    double v23 = v22;

    double v24 = -0.0;
    if (!v18) {
      double v24 = v17;
    }
    double v25 = v24 + v21;
    double v26 = 0.0;
    if (v18) {
      double v26 = v17;
    }
    double v27 = v21 - v26;
    v28 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
    setDefaultLockAnimationParameters(v28);
    v29 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v27, v23);
    [v28 setFromValue:v29];

    v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v25, v23);
    [v28 setToValue:v30];

    v31 = [v16 layer];
    [v31 addAnimation:v28 forKey:@"alongside lock slide"];

    objc_storeWeak((id *)(*(void *)(a1 + 32) + 504), 0);
  }
}

- (void)animateUnlockForegroundView:(id)a3 timeItemSnapshot:(id)a4 completionBlock:(id)a5
{
  v180[2] = *MEMORY[0x1E4F143B8];
  id v171 = a3;
  id v166 = a4;
  id v8 = a5;
  if ([(UIStatusBarLockItemView *)self _isAnimating])
  {
    if (v8) {
      dispatch_async(MEMORY[0x1E4F14428], v8);
    }
  }
  else
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &_MergedGlobals_3_21);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v162 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1853B0000, v162, OS_LOG_TYPE_ERROR, "Starting unlock animation", (uint8_t *)location, 2u);
      }
    }
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    padlockView = self->_padlockView;
    if (has_internal_diagnostics)
    {
      if (!padlockView)
      {
        v163 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_FAULT))
        {
          LOWORD(location[0]) = 0;
          _os_log_fault_impl(&dword_1853B0000, v163, OS_LOG_TYPE_FAULT, "padlockView must have been created before unlock is called", (uint8_t *)location, 2u);
        }
      }
    }
    else if (!padlockView)
    {
      v164 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25CF38) + 8);
      if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1853B0000, v164, OS_LOG_TYPE_ERROR, "padlockView must have been created before unlock is called", (uint8_t *)location, 2u);
      }
    }
    textClippingView = self->_textClippingView;
    if (!textClippingView)
    {
      double v13 = objc_alloc_init(_UIExpandingGlyphsView);
      textView = self->_textView;
      self->_textView = v13;

      objc_super v15 = [(UIStatusBarItemView *)self foregroundStyle];
      v16 = [v15 textFontForStyle:3];

      double v17 = [(UIStatusBarItemView *)self foregroundStyle];
      int v18 = [v17 textColorForStyle:3];

      id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v20 = _UILocalizedStringInSystemLanguage(@"UIStatusBar: Unlocked", @"Unlocked");
      uint64_t v21 = *(void *)off_1E52D2048;
      v179[0] = *(void *)off_1E52D2040;
      v179[1] = v21;
      v180[0] = v16;
      v180[1] = v18;
      double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v180 forKeys:v179 count:2];
      double v23 = (void *)[v19 initWithString:v20 attributes:v22];

      [(_UIExpandingGlyphsView *)self->_textView setAttributedString:v23];
      [(UIView *)self->_textView sizeToFit];
      double v24 = objc_alloc_init(UIView);
      double v25 = self->_textClippingView;
      self->_textClippingView = v24;

      [(UIView *)self->_textClippingView setClipsToBounds:1];
      [(UIView *)self->_textView frame];
      double rect = v26;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      double v32 = v31;
      [(UIView *)self->_textClippingView frame];
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      CGFloat v40 = v39;
      if ([(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
      {
        v181.origin.double x = v34;
        v181.origin.double y = v36;
        v181.size.double width = v38;
        v181.size.double height = v40;
        double MinX = CGRectGetMinX(v181);
      }
      else
      {
        v182.origin.double x = v34;
        v182.origin.double y = v36;
        v182.size.double width = v38;
        v182.size.double height = v40;
        double v42 = CGRectGetMinX(v182);
        v183.origin.double x = v34;
        v183.origin.double y = v36;
        v183.size.double width = v38;
        v183.size.double height = v40;
        double Width = CGRectGetWidth(v183);
        v184.origin.double x = v28;
        v184.origin.double y = v30;
        v184.size.double width = rect;
        v184.size.double height = v32;
        double MinX = v42 + Width - CGRectGetWidth(v184);
      }
      v44 = [(UIStatusBarItemView *)self foregroundStyle];
      [v44 baselineOffsetForStyle:3];
      double v46 = v45;

      [(_UIExpandingGlyphsView *)self->_textView baselineOffset];
      -[UIView setFrame:](self->_textView, "setFrame:", MinX, v46 - v47, rect, v32);
      [(UIView *)self->_textClippingView addSubview:self->_textView];

      textClippingView = self->_textClippingView;
    }
    [(UIView *)self addSubview:textClippingView];
    [v171 bounds];
    double MidX = CGRectGetMidX(v185);
    v49 = [(UIView *)self->_padlockView superview];
    [(UIView *)self->_padlockView frame];
    objc_msgSend(v49, "convertRect:toCoordinateSpace:", v171);
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    CGFloat v57 = v56;

    v186.origin.double x = v51;
    v186.origin.double y = v53;
    v186.size.double width = v55;
    v186.size.double height = v57;
    double v58 = MidX + 2.0;
    self->_double padlockViewCenterOffsetFromForegroundViewCenter = CGRectGetMidX(v186) - (MidX + 2.0);
    v187.origin.double x = v51;
    v187.origin.double y = v53;
    v187.size.double width = v55;
    v187.size.double height = v57;
    double v59 = CGRectGetMinX(v187);
    v188.origin.double x = v51;
    v188.origin.double y = v53;
    v188.size.double width = v55;
    v188.size.double height = v57;
    double MaxX = CGRectGetMaxX(v188);
    double v61 = vabdd_f64(v59, v58);
    double v62 = vabdd_f64(MaxX, v58);
    if (v61 >= v62) {
      double v63 = v61;
    }
    else {
      double v63 = v62;
    }
    [(UIView *)self->_padlockView frame];
    double v64 = CGRectGetWidth(v189);
    v65 = [(UIStatusBarItemView *)self foregroundStyle];
    [v65 standardPadding];
    double v67 = v66;
    [(UIView *)self->_textView frame];
    self->_double widthNeededForFinalState = v64 + v67 + CGRectGetWidth(v190);

    double v68 = self->_widthNeededForFinalState * 0.5;
    if (v63 >= v68) {
      double v68 = v63;
    }
    self->_double widthNeededDuringAnimation = v68 + v68;
    if (v166)
    {
      [v166 frame];
      self->_double timeItemSnapshotCenterOffsetFromForegroundViewCenter = vabdd_f64(CGRectGetMidX(v191), v58);
      objc_storeStrong((id *)&self->_timeItemSnapshot, a4);
      [(UIView *)self insertSubview:v166 atIndex:0];
    }
    [(UIStatusBarLockItemView *)self _beginAnimation];
    [(UIStatusBarLockItemView *)self updateContentsAndWidth];
    [v171 reflowItemViewsForgettingEitherSideItemHistory];
    objc_initWeak(location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke;
    aBlock[3] = &unk_1E52FD268;
    objc_copyWeak(&v177, location);
    id v69 = v171;
    id v175 = v69;
    id v176 = v8;
    v70 = _Block_copy(aBlock);
    id animationCompletionBlock = self->_animationCompletionBlock;
    self->_id animationCompletionBlock = v70;

    [(UIStatusBarLockItemView *)self _beginAnimation];
    v72 = self->_padlockView;
    v173[0] = MEMORY[0x1E4F143A8];
    v173[1] = 3221225472;
    v173[2] = __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke_2;
    v173[3] = &unk_1E52D9F70;
    v173[4] = self;
    [(_UIStatusBarLockItemPadlockView *)v72 animateUnlockCompletionBlock:v173];
    timeItemSnapshot = self->_timeItemSnapshot;
    if (timeItemSnapshot)
    {
      double timeItemSnapshotCenterOffsetFromForegroundViewCenter = self->_timeItemSnapshotCenterOffsetFromForegroundViewCenter;
      [(UIView *)timeItemSnapshot frame];
      double v75 = CGRectGetWidth(v192);
      [(UIView *)self->_timeItemSnapshot frame];
      double MinY = CGRectGetMinY(v193);
      [(UIView *)self->_timeItemSnapshot frame];
      double v77 = CGRectGetWidth(v194);
      [(UIView *)self->_timeItemSnapshot frame];
      double Height = CGRectGetHeight(v195);
      v79 = [(UIView *)self->_timeItemSnapshot superview];
      objc_msgSend(v79, "convertRect:fromCoordinateSpace:", v69, v58 + timeItemSnapshotCenterOffsetFromForegroundViewCenter + v75 * -0.5, MinY, v77, Height);
      double v81 = v80;
      double v83 = v82;
      double v85 = v84;
      double v87 = v86;

      -[UIView setFrame:](self->_timeItemSnapshot, "setFrame:", v81, v83, v85, v87);
      [(UIStatusBarLockItemView *)self _beginAnimation];
      [(UIView *)self->_timeItemSnapshot setAlpha:0.0];
      v88 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
      setDefaultLockAnimationParameters(v88);
      [v88 setFromValue:&unk_1ED3F2368];
      [v88 setToValue:&unk_1ED3F2378];
      LODWORD(v89) = 3.0;
      [v88 setSpeed:v89];
      v90 = +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:self];
      [v88 setDelegate:v90];

      v91 = [(UIView *)self->_timeItemSnapshot layer];
      [v91 addAnimation:v88 forKey:@"fade"];
    }
    double padlockViewCenterOffsetFromForegroundViewCenter = self->_padlockViewCenterOffsetFromForegroundViewCenter;
    [(UIView *)self->_padlockView frame];
    double v93 = CGRectGetWidth(v196);
    [(UIView *)self->_padlockView frame];
    double v94 = CGRectGetMinY(v197);
    [(UIView *)self->_padlockView frame];
    double v95 = CGRectGetWidth(v198);
    [(UIView *)self->_padlockView frame];
    double v96 = CGRectGetHeight(v199);
    v97 = [(UIView *)self->_padlockView superview];
    objc_msgSend(v97, "convertRect:fromCoordinateSpace:", v69, v58 + padlockViewCenterOffsetFromForegroundViewCenter + v93 * -0.5, v94, v95, v96);
    CGFloat v165 = v98;
    CGFloat v168 = v100;
    CGFloat recta = v99;
    CGFloat v167 = v101;

    if ([(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
    {
      [(UIView *)self bounds];
      double v102 = CGRectGetMidX(v200);
      double widthNeededForFinalState = self->_widthNeededForFinalState;
      v201.origin.double x = v165;
      v201.size.double width = v168;
      v201.origin.double y = recta;
      v201.size.double height = v167;
      double v104 = v102 + widthNeededForFinalState * 0.5 - CGRectGetWidth(v201);
    }
    else
    {
      [(UIView *)self bounds];
      double v104 = CGRectGetMidX(v202) + self->_widthNeededForFinalState * -0.5;
    }
    v105 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
    setDefaultLockAnimationParameters(v105);
    v106 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", centerOfRect(v165, recta, v168, v167));
    [v105 setFromValue:v106];

    v107 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", centerOfRect(v104, recta, v168, v167));
    [v105 setToValue:v107];

    v108 = +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:self];
    [v105 setDelegate:v108];

    [(UIStatusBarLockItemView *)self _beginAnimation];
    v109 = [(UIView *)self->_padlockView layer];
    [v109 addAnimation:v105 forKey:@"padlock translation"];

    -[UIView setFrame:](self->_padlockView, "setFrame:", v104, recta, v168, v167);
    [(UIView *)self bounds];
    double v110 = CGRectGetHeight(v203);
    if ([(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
    {
      v204.origin.double x = v165;
      v204.size.double width = v168;
      v204.origin.double y = recta;
      v204.size.double height = v167;
      double v111 = CGRectGetMinX(v204);
    }
    else
    {
      v205.origin.double x = v165;
      v205.size.double width = v168;
      v205.origin.double y = recta;
      v205.size.double height = v167;
      double v111 = CGRectGetMaxX(v205);
    }
    CGFloat v112 = v111;
    if ([(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
    {
      [(UIView *)self bounds];
      double v113 = CGRectGetMidX(v206);
      double v114 = self->_widthNeededForFinalState;
      v207.origin.double x = v104;
      v207.size.double width = v168;
      v207.origin.double y = recta;
      v207.size.double height = v167;
      double v115 = CGRectGetWidth(v207);
      double v116 = 0.0;
    }
    else
    {
      v208.origin.double x = v104;
      v208.size.double width = v168;
      v208.origin.double y = recta;
      v208.size.double height = v167;
      double v116 = CGRectGetMaxX(v208);
      [(UIView *)self bounds];
      double v113 = CGRectGetMidX(v209);
      double v114 = self->_widthNeededForFinalState;
      v210.origin.double y = 0.0;
      v210.size.double width = 0.0;
      v210.origin.double x = v116;
      v210.size.double height = v110;
      double v115 = CGRectGetMinX(v210);
    }
    double v117 = v113 + v114 * 0.5 - v115;
    -[UIView setFrame:](self->_textClippingView, "setFrame:", v116, 0.0, v117, v110);
    v118 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
    setDefaultLockAnimationParameters(v118);
    v119 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", centerOfRect(v112, 0.0, 0.0, v110));
    [v118 setFromValue:v119];

    v120 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", centerOfRect(v116, 0.0, v117, v110));
    [v118 setToValue:v120];

    v121 = +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:self];
    [v118 setDelegate:v121];

    [(UIStatusBarLockItemView *)self _beginAnimation];
    v122 = [(UIView *)self->_textClippingView layer];
    [v122 addAnimation:v118 forKey:@"text clipping translation"];

    v123 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"bounds"];
    setDefaultLockAnimationParameters(v123);
    v124 = (void *)MEMORY[0x1E4F29238];
    v211.origin.double y = 0.0;
    v211.size.double width = 0.0;
    v211.origin.double x = v112;
    v211.size.double height = v110;
    double v125 = CGRectGetWidth(v211);
    v212.origin.double y = 0.0;
    v212.size.double width = 0.0;
    v212.origin.double x = v112;
    v212.size.double height = v110;
    v126 = objc_msgSend(v124, "valueWithCGRect:", 0.0, 0.0, v125, CGRectGetHeight(v212));
    [v123 setFromValue:v126];

    v127 = (void *)MEMORY[0x1E4F29238];
    v213.origin.double y = 0.0;
    v213.origin.double x = v116;
    v213.size.double width = v117;
    v213.size.double height = v110;
    double v128 = CGRectGetWidth(v213);
    v214.origin.double y = 0.0;
    v214.origin.double x = v116;
    v214.size.double width = v117;
    v214.size.double height = v110;
    v129 = objc_msgSend(v127, "valueWithCGRect:", 0.0, 0.0, v128, CGRectGetHeight(v214));
    [v123 setToValue:v129];

    v130 = +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:self];
    [v123 setDelegate:v130];

    [(UIStatusBarLockItemView *)self _beginAnimation];
    v131 = [(UIView *)self->_textClippingView layer];
    [v131 addAnimation:v123 forKey:@"text clipping bounds"];

    [(UIView *)self->_textView frame];
    CGFloat v133 = v132;
    double v135 = v134;
    CGFloat v137 = v136;
    double v139 = v138;
    double v140 = 0.0;
    if (![(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
    {
      v215.origin.double x = v133;
      v215.origin.double y = v135;
      v215.size.double width = v137;
      v215.size.double height = v139;
      double v140 = -CGRectGetWidth(v215);
    }
    if ([(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
    {
      v216.origin.double y = 0.0;
      v216.origin.double x = v116;
      v216.size.double width = v117;
      v216.size.double height = v110;
      double v141 = CGRectGetWidth(v216);
      v142 = [(UIStatusBarItemView *)self foregroundStyle];
      [v142 standardPadding];
      double v144 = v141 - v143;
      double v145 = v140;
    }
    else
    {
      v142 = [(UIStatusBarItemView *)self foregroundStyle];
      [v142 standardPadding];
      double v145 = v146;
      double v144 = v137;
    }

    -[UIView setFrame:](self->_textView, "setFrame:", v145, v135, v144, v139);
    v147 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
    setDefaultLockAnimationParameters(v147);
    v148 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", centerOfRect(v140, v135, v137, v139));
    [v147 setFromValue:v148];

    v149 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", centerOfRect(v145, v135, v144, v139));
    [v147 setToValue:v149];

    v150 = +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:self];
    [v147 setDelegate:v150];

    [(UIStatusBarLockItemView *)self _beginAnimation];
    v151 = [(UIView *)self->_textView layer];
    [v151 addAnimation:v147 forKey:@"text translation"];

    v152 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"bounds"];
    setDefaultLockAnimationParameters(v152);
    v153 = (void *)MEMORY[0x1E4F29238];
    v217.origin.double x = v140;
    v217.origin.double y = v135;
    v217.size.double width = v137;
    v217.size.double height = v139;
    double v154 = CGRectGetWidth(v217);
    v218.origin.double x = v140;
    v218.origin.double y = v135;
    v218.size.double width = v137;
    v218.size.double height = v139;
    v155 = objc_msgSend(v153, "valueWithCGRect:", 0.0, 0.0, v154, CGRectGetHeight(v218));
    [v152 setFromValue:v155];

    v156 = (void *)MEMORY[0x1E4F29238];
    v219.origin.double x = v145;
    v219.origin.double y = v135;
    v219.size.double width = v144;
    v219.size.double height = v139;
    double v157 = CGRectGetWidth(v219);
    v220.origin.double x = v145;
    v220.origin.double y = v135;
    v220.size.double width = v144;
    v220.size.double height = v139;
    v158 = objc_msgSend(v156, "valueWithCGRect:", 0.0, 0.0, v157, CGRectGetHeight(v220));
    [v152 setToValue:v158];

    v159 = +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:self];
    [v152 setDelegate:v159];

    [(UIStatusBarLockItemView *)self _beginAnimation];
    v160 = [(UIView *)self->_textView layer];
    [v160 addAnimation:v152 forKey:@"text bounds"];

    [(UIStatusBarLockItemView *)self _beginAnimation];
    [(_UIExpandingGlyphsView *)self->_textView setExpandsFromLeftToRight:[(UIStatusBarItemView *)self _shouldReverseLayoutDirection]];
    v161 = self->_textView;
    v172[0] = MEMORY[0x1E4F143A8];
    v172[1] = 3221225472;
    v172[2] = __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke_3;
    v172[3] = &unk_1E52DA520;
    v172[4] = self;
    *(CGFloat *)&v172[5] = v165;
    *(CGFloat *)&v172[6] = recta;
    *(CGFloat *)&v172[7] = v168;
    *(CGFloat *)&v172[8] = v167;
    [(_UIExpandingGlyphsView *)v161 animateCompletionBlock:v172];
    [(UIStatusBarLockItemView *)self _endAnimation];

    objc_destroyWeak(&v177);
    objc_destroyWeak(location);
  }
}

void __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v3 = WeakRetained;
  v14 = WeakRetained;
  if (WeakRetained)
  {
    double v4 = [WeakRetained padlockView];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;

    double v11 = [v14 padlockView];
    objc_msgSend(v11, "setFrame:", 0.0, v6, v8, v10);

    int v12 = [v14 timeItemSnapshot];
    [v12 removeFromSuperview];

    [v14 setTimeItemSnapshot:0];
    [v14 updateContentsAndWidth];
    [*(id *)(a1 + 32) reflowItemViewsForgettingEitherSideItemHistory];
    double v3 = v14;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v3);
    double v3 = v14;
  }
}

uint64_t __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endAnimation];
}

uint64_t __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 520) removeFromSuperview];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 512), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  return [v2 _endAnimation];
}

- (void)jiggleCompletionBlock:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  padlockView = self->_padlockView;
  if (has_internal_diagnostics)
  {
    if (!padlockView)
    {
      double v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "padlockView must have been created before jiggle is called", buf, 2u);
      }
    }
  }
  else if (!padlockView)
  {
    double v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &jiggleCompletionBlock____s_category_164) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "padlockView must have been created before jiggle is called", buf, 2u);
    }
  }
  if ([(UIStatusBarLockItemView *)self _isAnimating])
  {
    if (v4) {
      dispatch_async(MEMORY[0x1E4F14428], v4);
    }
  }
  else
  {
    double v7 = _Block_copy(v4);
    id animationCompletionBlock = self->_animationCompletionBlock;
    self->_id animationCompletionBlock = v7;

    [(UIStatusBarLockItemView *)self _beginAnimation];
    double v9 = self->_padlockView;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__UIStatusBarLockItemView_jiggleCompletionBlock___block_invoke;
    v12[3] = &unk_1E52D9F70;
    v12[4] = self;
    [(_UIStatusBarLockItemPadlockView *)v9 jiggleCompletionBlock:v12];
  }
}

uint64_t __49__UIStatusBarLockItemView_jiggleCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endAnimation];
}

- (id)accessibilityHUDRepresentation
{
  v2 = [UIAccessibilityHUDItem alloc];
  double v3 = +[UIImage kitImageNamed:@"LockScreen_Lock"];
  id v4 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:](v2, "initWithTitle:image:imageInsets:scaleImage:", 0, v3, 1, 0.0, 0.0, 0.0, 0.0);

  return v4;
}

- (UIView)viewToAnimateAlongside
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToAnimateAlongside);
  return (UIView *)WeakRetained;
}

- (void)setViewToAnimateAlongside:(id)a3
{
}

- (BOOL)alongsideViewIsBecomingVisible
{
  return self->_alongsideViewIsBecomingVisible;
}

- (void)setAlongsideViewIsBecomingVisible:(BOOL)a3
{
  self->_alongsideViewIsBecomingVisible = a3;
}

- (_UIStatusBarLockItemPadlockView)padlockView
{
  return self->_padlockView;
}

- (void)setPadlockView:(id)a3
{
}

- (UIView)textClippingView
{
  return self->_textClippingView;
}

- (void)setTextClippingView:(id)a3
{
}

- (_UIExpandingGlyphsView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (double)padlockViewCenterOffsetFromForegroundViewCenter
{
  return self->_padlockViewCenterOffsetFromForegroundViewCenter;
}

- (void)setPadlockViewCenterOffsetFromForegroundViewCenter:(double)a3
{
  self->_double padlockViewCenterOffsetFromForegroundViewCenter = a3;
}

- (UIView)timeItemSnapshot
{
  return self->_timeItemSnapshot;
}

- (void)setTimeItemSnapshot:(id)a3
{
}

- (double)timeItemSnapshotCenterOffsetFromForegroundViewCenter
{
  return self->_timeItemSnapshotCenterOffsetFromForegroundViewCenter;
}

- (void)setTimeItemSnapshotCenterOffsetFromForegroundViewCenter:(double)a3
{
  self->_double timeItemSnapshotCenterOffsetFromForegroundViewCenter = a3;
}

- (double)widthNeededDuringAnimation
{
  return self->_widthNeededDuringAnimation;
}

- (void)setWidthNeededDuringAnimation:(double)a3
{
  self->_double widthNeededDuringAnimation = a3;
}

- (double)widthNeededForFinalState
{
  return self->_widthNeededForFinalState;
}

- (void)setWidthNeededForFinalState:(double)a3
{
  self->_double widthNeededForFinalState = a3;
}

- (int)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(int)a3
{
  self->_int animationCount = a3;
}

- (id)animationCompletionBlock
{
  return self->_animationCompletionBlock;
}

- (void)setAnimationCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_timeItemSnapshot, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textClippingView, 0);
  objc_storeStrong((id *)&self->_padlockView, 0);
  objc_destroyWeak((id *)&self->_viewToAnimateAlongside);
}

@end