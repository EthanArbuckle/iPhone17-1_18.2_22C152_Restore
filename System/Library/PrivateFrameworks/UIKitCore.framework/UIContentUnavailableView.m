@interface UIContentUnavailableView
- (BOOL)_needsDoubleUpdateConstraintsPass;
- (BOOL)_prefersEqualButtonAndSecondaryButtonWidths;
- (BOOL)isScrollEnabled;
- (BOOL)shouldReparentScrollViewPanGestureRecognizer;
- (BOOL)supportsConfiguration:(id)a3;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSDirectionalEdgeInsets)_alignmentInsetsForView:(id)a3;
- (NSDirectionalEdgeInsets)_scrollViewInsets;
- (UIActivityIndicatorView)_activityIndicator;
- (UIButton)_button;
- (UIButton)_secondaryButton;
- (UIContentUnavailableConfiguration)configuration;
- (UIContentUnavailableView)initWithCoder:(NSCoder *)coder;
- (UIContentUnavailableView)initWithConfiguration:(UIContentUnavailableConfiguration *)configuration;
- (UIContentUnavailableViewLayoutInfo)_computeLayoutInfoRestrictedToSize:(SEL)a3;
- (UIImageView)_imageView;
- (UILabel)_secondaryTextLabel;
- (UILabel)_textLabel;
- (_UIContentUnavailableScrollView)_scrollView;
- (_UISystemBackgroundView)_backgroundView;
- (double)_keyboardInset;
- (double)_multilineContextWidth;
- (double)_preferredMaxLayoutWidth;
- (id)_encodableSubviews;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_applyBackgroundConfiguration:(id)a3;
- (void)_applyConfiguration:(id)a3;
- (void)_checkWhetherEmbeddedInWrapperView;
- (void)_clearInvalidFrameFlags;
- (void)_computeButtonLayoutInfo:(UIContentUnavailableViewLayoutInfo *)a3;
- (void)_computeLayoutInfoForView:(id)a3 info:(UIContentUnavailableViewElementLayoutInfo *)a4 layoutInfo:(UIContentUnavailableViewLayoutInfo *)a5;
- (void)_handleKeyboardNotification:(id)a3 aboutToHide:(BOOL)a4;
- (void)_keyboardAboutToChangeFrame:(id)a3;
- (void)_keyboardAboutToHide:(id)a3;
- (void)_keyboardAboutToShow:(id)a3;
- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3;
- (void)_prepareForFirstIntrinsicContentSizeCalculation;
- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3;
- (void)_reconfigureKeyboardLayoutAdjustment;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)setConfiguration:(UIContentUnavailableConfiguration *)configuration;
- (void)setScrollEnabled:(BOOL)scrollEnabled;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UIContentUnavailableView

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIContentUnavailableView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

uint64_t __50__UIContentUnavailableView_initWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  return (*(void *)&self->super._viewFlags >> 53) & 1;
}

- (void)layoutSubviews
{
  v114.receiver = self;
  v114.super_class = (Class)UIContentUnavailableView;
  [(UIView *)&v114 layoutSubviews];
  [(UIView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIContentUnavailableView *)self _scrollViewInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(UIContentUnavailableView *)self _keyboardInset];
  double v67 = v19;
  [(UIView *)self _currentScreenScale];
  uint64_t v64 = v20;
  v115.origin.x = v4;
  v115.origin.y = v6;
  v115.size.width = v8;
  v115.size.height = v10;
  double v62 = v18;
  double v63 = v14;
  double v21 = CGRectGetWidth(v115) - v14 - v18;
  v116.origin.x = v4;
  v116.origin.y = v6;
  v116.size.width = v8;
  v116.size.height = v10;
  double v22 = CGRectGetHeight(v116) - v12 - v16 - v67;
  memset(__src, 0, sizeof(__src));
  -[UIContentUnavailableView _computeLayoutInfoRestrictedToSize:](self, "_computeLayoutInfoRestrictedToSize:", v21, v22);
  v117.origin.x = v4;
  v117.origin.y = v6;
  v117.size.width = v8;
  v117.size.height = v10;
  double Width = CGRectGetWidth(v117);
  CGFloat v66 = v6;
  v118.origin.x = v4;
  v118.origin.y = v6;
  CGFloat v65 = v10;
  v118.size.width = v8;
  v118.size.height = v10;
  double Height = CGRectGetHeight(v118);
  if (v21 <= 0.0) {
    double v21 = *(double *)&__src[24];
  }
  if (*((double *)&__src[24] + 1) >= v22) {
    double v24 = *((double *)&__src[24] + 1);
  }
  else {
    double v24 = v22;
  }
  v25 = [(UIContentUnavailableView *)self _scrollView];
  objc_msgSend(v25, "setContentSize:", v21, v67 + v24);

  v112[0] = 0;
  v112[1] = v112;
  v112[2] = 0x3010000000;
  v112[3] = &unk_186D7DBA7;
  v112[4] = 0;
  *(double *)&v112[5] = (v24 - 0.0) * 0.5 + 0.0;
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__224;
  v110 = __Block_byref_object_dispose__224;
  id v111 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__UIContentUnavailableView_layoutSubviews__block_invoke;
  aBlock[3] = &unk_1E530CFB8;
  char v105 = 0;
  aBlock[6] = v64;
  aBlock[4] = v112;
  aBlock[5] = &v106;
  v26 = _Block_copy(aBlock);
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __42__UIContentUnavailableView_layoutSubviews__block_invoke_3;
  v89[3] = &unk_1E530CFE0;
  double v92 = v12 + 0.0;
  double v93 = v63 + v60;
  double v94 = v16 + 0.0;
  double v95 = v62 + 0.0;
  memcpy(v96, __src, sizeof(v96));
  double v97 = Width - (v63 + v60) - (v62 + 0.0);
  double v98 = Height - (v12 + 0.0) - (v16 + 0.0) - v67;
  char v103 = 0;
  CGFloat v99 = v4;
  CGFloat v100 = v66;
  CGFloat v101 = v8;
  CGFloat v102 = v65;
  id v27 = v26;
  id v90 = v27;
  v91 = v112;
  v28 = _Block_copy(v89);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __42__UIContentUnavailableView_layoutSubviews__block_invoke_4;
  v74[3] = &unk_1E530D008;
  double v77 = v12 + 0.0;
  double v78 = v63 + v60;
  double v79 = v16 + 0.0;
  double v80 = v62 + 0.0;
  memcpy(v81, __src, sizeof(v81));
  double v82 = Width - (v63 + v60) - (v62 + 0.0);
  double v83 = Height - (v12 + 0.0) - (v16 + 0.0) - v67;
  char v88 = 0;
  CGFloat v84 = v4;
  CGFloat v85 = v66;
  CGFloat v86 = v8;
  CGFloat v87 = v65;
  id v29 = v27;
  id v75 = v29;
  v76 = v112;
  v30 = _Block_copy(v74);
  v31 = [(UIContentUnavailableView *)self _imageView];
  uint64_t v32 = (*(_WORD *)&self->_contentViewFlags >> 3) & 1;
  v33 = (void (*)(void *, void *, long long *, uint64_t))v28[2];
  long long v70 = __src[0];
  long long v71 = __src[1];
  long long v72 = __src[2];
  uint64_t v73 = *(void *)&__src[3];
  v33(v28, v31, &v70, v32);

  v34 = [(UIContentUnavailableView *)self _activityIndicator];
  uint64_t v35 = (*(_WORD *)&self->_contentViewFlags >> 4) & 1;
  v36 = (void (*)(void *, void *, long long *, uint64_t))v28[2];
  long long v70 = *(_OWORD *)((char *)&__src[17] + 8);
  long long v71 = *(_OWORD *)((char *)&__src[18] + 8);
  long long v72 = *(_OWORD *)((char *)&__src[19] + 8);
  uint64_t v73 = *((void *)&__src[20] + 1);
  v36(v28, v34, &v70, v35);

  v37 = [(UIContentUnavailableView *)self _textLabel];
  uint64_t v38 = (*(_WORD *)&self->_contentViewFlags >> 5) & 1;
  v39 = (void (*)(void *, void *, long long *, uint64_t))v28[2];
  long long v70 = *(_OWORD *)((char *)&__src[3] + 8);
  long long v71 = *(_OWORD *)((char *)&__src[4] + 8);
  long long v72 = *(_OWORD *)((char *)&__src[5] + 8);
  uint64_t v73 = *((void *)&__src[6] + 1);
  v39(v28, v37, &v70, v38);

  v40 = [(UIContentUnavailableView *)self _secondaryTextLabel];
  uint64_t v41 = (*(_WORD *)&self->_contentViewFlags >> 6) & 1;
  v42 = (void (*)(void *, void *, long long *, uint64_t))v28[2];
  long long v70 = __src[7];
  long long v71 = __src[8];
  long long v72 = __src[9];
  uint64_t v73 = *(void *)&__src[10];
  v42(v28, v40, &v70, v41);

  if (LOBYTE(__src[21]))
  {
    v48 = [(UIContentUnavailableView *)self _button];
    $1B4C8A047F38094B3B36BFCC6E97ECAE contentViewFlags = self->_contentViewFlags;
    v50 = [(UIContentUnavailableView *)self _secondaryButton];
    v51 = (void (*)(void *, void *, long long *, void, void *, _OWORD *, uint64_t))v30[2];
    uint64_t v52 = HIBYTE(*(_WORD *)&self->_contentViewFlags) & 1;
    long long v70 = *(_OWORD *)((char *)&__src[10] + 8);
    long long v71 = *(_OWORD *)((char *)&__src[11] + 8);
    long long v72 = *(_OWORD *)((char *)&__src[12] + 8);
    uint64_t v73 = *((void *)&__src[13] + 1);
    v68[0] = __src[14];
    v68[1] = __src[15];
    v68[2] = __src[16];
    uint64_t v69 = *(void *)&__src[17];
    v51(v30, v48, &v70, (*(unsigned int *)&contentViewFlags >> 7) & 1, v50, v68, v52);
  }
  else
  {
    v43 = [(UIContentUnavailableView *)self _button];
    uint64_t v44 = (*(_WORD *)&self->_contentViewFlags >> 7) & 1;
    v45 = (void (*)(void *, void *, long long *, uint64_t))v28[2];
    long long v70 = *(_OWORD *)((char *)&__src[10] + 8);
    long long v71 = *(_OWORD *)((char *)&__src[11] + 8);
    long long v72 = *(_OWORD *)((char *)&__src[12] + 8);
    uint64_t v73 = *((void *)&__src[13] + 1);
    v45(v28, v43, &v70, v44);

    v48 = [(UIContentUnavailableView *)self _secondaryButton];
    uint64_t v46 = HIBYTE(*(_WORD *)&self->_contentViewFlags) & 1;
    v47 = (void (*)(void *, void *, long long *, uint64_t))v28[2];
    long long v70 = __src[14];
    long long v71 = __src[15];
    long long v72 = __src[16];
    uint64_t v73 = *(void *)&__src[17];
    v47(v28, v48, &v70, v46);
  }

  [self setAccessibilityElements:v107[5]];
  v53 = [(UIContentUnavailableConfiguration *)self->_configuration imageProperties];
  [v53 cornerRadius];
  double v55 = v54;
  v56 = [(UIContentUnavailableView *)self _imageView];
  _UIApplyCornerRadiusToView(v56, v55);

  v57 = [(UIContentUnavailableView *)self _activityIndicator];
  [v57 startAnimating];

  v58 = [(UIContentUnavailableView *)self _button];
  [v58 setNeedsUpdateConfiguration];

  v59 = [(UIContentUnavailableView *)self _secondaryButton];
  [v59 setNeedsUpdateConfiguration];

  [(UIContentUnavailableView *)self _clearInvalidFrameFlags];
  _Block_object_dispose(&v106, 8);

  _Block_object_dispose(v112, 8);
}

uint64_t __42__UIContentUnavailableView_layoutSubviews__block_invoke_3(uint64_t a1, __n128 a2, uint64_t a3, uint64_t a4)
{
  double v6 = *(double *)(a4 + 8);
  double v7 = *(double *)(a4 + 24);
  double v8 = *(double *)(a4 + 40);
  double v9 = *(double *)a4 + *(double *)(a4 + 32) + *(double *)(a4 + 48);
  a2.n128_u64[0] = *(void *)(a1 + 56);
  if (*(void *)(a1 + 424))
  {
    if (*(unsigned char *)(a1 + 544)) {
      a2.n128_f64[0] = CGRectGetWidth(*(CGRect *)(a1 + 512)) - v9 - *(double *)(a1 + 72);
    }
  }
  else
  {
    a2.n128_f64[0] = a2.n128_f64[0] + (*(double *)(a1 + 496) - v9) * 0.5;
  }
  uint64_t result = (*(uint64_t (**)(__n128, double))(*(void *)(a1 + 32) + 16))(a2, 0.0);
  if (*(unsigned char *)(a4 + 16)) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v6
  }
                                                                + v7
                                                                + v8
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 40);
  return result;
}

uint64_t __42__UIContentUnavailableView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4, double a5, double a6)
{
  int v9 = *(unsigned __int8 *)(a3 + 16);
  if (*(unsigned char *)(a1 + 56)) {
    CGFloat v10 = (double *)(a3 + 48);
  }
  else {
    CGFloat v10 = (double *)(a3 + 32);
  }
  double v11 = UIRectIntegralWithScale(a5 + *v10 + *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), a6 + *(double *)(a3 + 24) + *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)a3, *(double *)(a3 + 8), *(double *)(a1 + 48));
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if (v9
    && a4
    && +[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__UIContentUnavailableView_layoutSubviews__block_invoke_2;
    v19[3] = &unk_1E52DA520;
    v19[4] = a2;
    *(double *)&v19[5] = v11;
    *(double *)&v19[6] = v13;
    *(double *)&v19[7] = v15;
    *(double *)&v19[8] = v17;
    +[UIView performWithoutAnimation:v19];
LABEL_9:
    [a2 setAlpha:1.0];
    return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:a2];
  }
  objc_msgSend(a2, "setFrame:", v11, v13, v15, v17);
  if (v9) {
    goto LABEL_9;
  }
  return [a2 setAlpha:0.0];
}

- (UIContentUnavailableViewLayoutInfo)_computeLayoutInfoRestrictedToSize:(SEL)a3
{
  double height = a4.height;
  double width = a4.width;
  id v59 = [(UIView *)self traitCollection];
  double v8 = self->_configuration;
  v58 = _UIContentUnavailableConstantsForTraitCollection(v59);
  BOOL v9 = [(UIView *)self effectiveUserInterfaceLayoutDirection] == UIUserInterfaceLayoutDirectionRightToLeft;
  BOOL v10 = [(UIContentUnavailableView *)self isScrollEnabled];
  [(UIView *)self directionalLayoutMargins];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(UIContentUnavailableView *)self _scrollViewInsets];
  double v21 = v12 - v20;
  double v22 = v14 - v19;
  double v24 = v16 - v23;
  double v26 = v18 - v25;
  if (v14 - v19 + v26 >= width) {
    double v27 = width;
  }
  else {
    double v27 = v14 - v19 + v26;
  }
  if (v21 + v24 < height || v10) {
    double v29 = v21 + v24;
  }
  else {
    double v29 = height;
  }
  double v30 = 2777777.0;
  if (*(_WORD *)&self->_contentViewFlags)
  {
    double v56 = v22;
    double v31 = v21;
    double v32 = v26;
    double v33 = v24;
    double v34 = v29;
    double v35 = v27;
    double v30 = __UIViewReadableWidthForFont(0);
    double v27 = v35;
    double v29 = v34;
    double v24 = v33;
    double v26 = v32;
    double v21 = v31;
    double v22 = v56;
  }
  v36 = (CGSize *)MEMORY[0x1E4F1DB30];
  double v57 = v27;
  if (width - v27 < v30) {
    double v30 = width - v27;
  }
  double v37 = *MEMORY[0x1E4F1DB30];
  double v38 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  retstr->var2.var0 = 0u;
  double v39 = fmax(v37, fmin(v30, width));
  retstr->var11 = 0u;
  retstr->var12 = 0u;
  double v40 = fmax(v38, fmin(fmin(height - v29, 2777777.0), height));
  *(_OWORD *)&retstr->var10.top = 0u;
  *(_OWORD *)&retstr->var10.bottom = 0u;
  *(_OWORD *)&retstr->var5.var2.bottom = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var5.var0.double height = 0u;
  *(_OWORD *)&retstr->var5.var2.top = 0u;
  *(_OWORD *)&retstr->var4.var2.leading = 0u;
  *(_OWORD *)&retstr->var4.var2.trailing = 0u;
  retstr->var4.var0 = 0u;
  *(_OWORD *)&retstr->var4.BOOL var1 = 0u;
  *(_OWORD *)&retstr->var3.var2.top = 0u;
  *(_OWORD *)&retstr->var3.var2.bottom = 0u;
  *(_OWORD *)&retstr->var2.var2.trailing = 0u;
  *(_OWORD *)&retstr->var3.var0.double height = 0u;
  *(_OWORD *)&retstr->var2.BOOL var1 = 0u;
  *(_OWORD *)&retstr->var2.var2.leading = 0u;
  *(_OWORD *)&retstr->var1.var2.top = 0u;
  *(_OWORD *)&retstr->var1.var2.bottom = 0u;
  *(_OWORD *)&retstr->var0.var2.trailing = 0u;
  *(_OWORD *)&retstr->var1.var0.double height = 0u;
  *(_OWORD *)&retstr->var0.BOOL var1 = 0u;
  *(_OWORD *)&retstr->var0.var2.leading = 0u;
  retstr->var0.var0 = 0u;
  if (v8) {
    BOOL prefersSideBySideButtonAndSecondaryButton = v8->_prefersSideBySideButtonAndSecondaryButton;
  }
  else {
    BOOL prefersSideBySideButtonAndSecondaryButton = 0;
  }
  retstr->var6 = prefersSideBySideButtonAndSecondaryButton;
  retstr->var7 = v9;
  retstr->var8 = v10;
  retstr->var9 = [(UIContentUnavailableConfiguration *)v8 alignment];
  retstr->var10.top = v21;
  retstr->var10.leading = v22;
  retstr->var10.bottom = v24;
  retstr->var10.trailing = v26;
  retstr->var11 = *v36;
  retstr->var12.double width = v39;
  retstr->var12.double height = v40;
  v42 = [(UIContentUnavailableView *)self _textLabel];
  uint64_t v43 = [(UIContentUnavailableView *)self _button];
  uint64_t v44 = [(UIContentUnavailableView *)self _secondaryButton];
  v45 = [(UIContentUnavailableView *)self _secondaryTextLabel];
  uint64_t v46 = [(UIContentUnavailableView *)self _imageView];
  v47 = [(UIContentUnavailableView *)self _activityIndicator];
  if (v42)
  {
    retstr->var1.BOOL var1 = 1;
    [(UIContentUnavailableView *)self _computeLayoutInfoForView:v42 info:&retstr->var1 layoutInfo:retstr];
  }
  if (v43 | v44)
  {
    retstr->var3.BOOL var1 = v43 != 0;
    retstr->var4.BOOL var1 = v44 != 0;
    [(UIContentUnavailableView *)self _computeButtonLayoutInfo:retstr];
  }
  if (v45)
  {
    BOOL var1 = retstr->var1.var1;
    if (v42) {
      BOOL v50 = !var1;
    }
    else {
      BOOL v50 = 0;
    }
    BOOL v51 = !v50;
    retstr->var2.BOOL var1 = v51;
    double v52 = 0.0;
    if (!var1
      || ([(UIContentUnavailableConfiguration *)v8 textToSecondaryTextPadding],
          double v52 = v53,
          double v48 = 0.0,
          !retstr->var1.var1))
    {
      if (retstr->var3.var1 || retstr->var4.var1) {
        [(UIContentUnavailableConfiguration *)v8 textToButtonPadding];
      }
      else {
        double v48 = 0.0;
      }
    }
    retstr->var2.var2.top = v52 + retstr->var2.var2.top;
    retstr->var2.var2.bottom = v48 + retstr->var2.var2.bottom;
    [(UIContentUnavailableView *)self _computeLayoutInfoForView:v45 info:&retstr->var2 layoutInfo:retstr];
  }
  if (v46)
  {
    retstr->var0.BOOL var1 = 1;
    if (retstr->var1.var1 || retstr->var2.var1 || retstr->var3.var1 || (double v48 = 0.0, retstr->var4.var1)) {
      [(UIContentUnavailableConfiguration *)v8 imageToTextPadding];
    }
    retstr->var0.var2.bottom = v48 + retstr->var0.var2.bottom;
    [(UIContentUnavailableView *)self _computeLayoutInfoForView:v46 info:retstr layoutInfo:retstr];
  }
  if (v47)
  {
    retstr->var5.BOOL var1 = 1;
    if (retstr->var1.var1 || retstr->var2.var1 || retstr->var3.var1 || (double v48 = 0.0, retstr->var4.var1)) {
      [(UIContentUnavailableConfiguration *)v8 imageToTextPadding];
    }
    retstr->var5.var2.bottom = v48 + retstr->var5.var2.bottom;
    [(UIContentUnavailableView *)self _computeLayoutInfoForView:v47 info:&retstr->var5 layoutInfo:retstr];
  }
  CGFloat v54 = v29 + retstr->var11.height;
  retstr->var11.double width = v57 + retstr->var11.width;
  retstr->var11.double height = v54;

  return result;
}

- (UILabel)_secondaryTextLabel
{
  if ([(UIView *)self->_secondaryTextLabel isHidden]) {
    secondaryTextLabel = 0;
  }
  else {
    secondaryTextLabel = self->_secondaryTextLabel;
  }
  return secondaryTextLabel;
}

- (void)_computeLayoutInfoForView:(id)a3 info:(UIContentUnavailableViewElementLayoutInfo *)a4 layoutInfo:(UIContentUnavailableViewLayoutInfo *)a5
{
  -[UIContentUnavailableView _alignmentInsetsForView:](self, "_alignmentInsetsForView:");
  double v10 = a4->var2.top + v9;
  double v12 = v11 + a4->var2.leading;
  double v14 = v13 + a4->var2.bottom;
  double v16 = v15 + a4->var2.trailing;
  a4->var2.top = v10;
  a4->var2.leading = v12;
  a4->var2.bottom = v14;
  a4->var2.trailing = v16;
  double v17 = fmax(*MEMORY[0x1E4F1DB30], fmin(a5->var12.width - v12 - v16, a5->var12.width));
  id v18 = [(UIContentUnavailableView *)self _textLabel];
  if (v18 == a3)
  {
  }
  else
  {
    double v19 = v18;
    id v20 = [(UIContentUnavailableView *)self _secondaryTextLabel];

    if (v20 != a3)
    {
      objc_msgSend(a3, "_intrinsicSizeWithinSize:", v17, 2777777.0);
      double v22 = v21;
      double v24 = v23;
      goto LABEL_6;
    }
  }
  double v25 = *MEMORY[0x1E4F1DAD8];
  double v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v27 = a3;
  objc_msgSend(v27, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v27, "numberOfLines"), v25, v26, v17, 2777777.0);
  double v22 = v28;
  double v24 = v29;

LABEL_6:
  id v30 = [(UIContentUnavailableView *)self _imageView];
  if (v30 == a3)
  {
  }
  else
  {
    double v31 = v30;
    id v32 = [(UIContentUnavailableView *)self _activityIndicator];

    if (v32 != a3) {
      goto LABEL_21;
    }
  }
  double v33 = [(UIContentUnavailableConfiguration *)self->_configuration imageProperties];
  [v33 maximumSize];
  if (v22 >= v34) {
    double v36 = v34;
  }
  else {
    double v36 = v22;
  }
  if (v34 > 0.0) {
    double v22 = v36;
  }
  if (v24 >= v35) {
    double v37 = v35;
  }
  else {
    double v37 = v24;
  }
  if (v35 > 0.0) {
    double v24 = v37;
  }

LABEL_21:
  if (v22 >= v17) {
    double v22 = v17;
  }
  a4->var0.double width = v22;
  a4->var0.double height = v24;
  if (a4->var1)
  {
    double v38 = v14 + v10 + v24;
    BOOL v39 = v24 > 0.0 && v22 > 0.0;
    double v40 = round(v38);
    double v41 = round(a5->var12.height);
    if (a5->var8)
    {
      id v42 = [(UIContentUnavailableView *)self _imageView];
      BOOL v43 = v42 != a3;
    }
    else
    {
      BOOL v43 = 0;
    }
    int v44 = v40 <= v41 || v43;
    int v45 = v39 & v44;
    a4->BOOL var1 = v45;
    if (v45 == 1)
    {
      double width = v16 + v12 + v22;
      double height = a5->var11.height;
      if (a5->var11.width >= width) {
        double width = a5->var11.width;
      }
      a5->var11.double width = width;
      a5->var11.double height = v38 + height;
      a5->var12.double height = a5->var12.height - v38;
    }
  }
}

- (UIImageView)_imageView
{
  if ([(UIView *)self->_imageView isHidden]) {
    imageView = 0;
  }
  else {
    imageView = self->_imageView;
  }
  return imageView;
}

- (UIActivityIndicatorView)_activityIndicator
{
  if ([(UIView *)self->_activityIndicator isHidden]) {
    activityIndicator = 0;
  }
  else {
    activityIndicator = self->_activityIndicator;
  }
  return activityIndicator;
}

- (UILabel)_textLabel
{
  if ([(UIView *)self->_textLabel isHidden]) {
    textLabel = 0;
  }
  else {
    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (NSDirectionalEdgeInsets)_alignmentInsetsForView:(id)a3
{
  objc_opt_class();
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    id v8 = a3;
    if ([v8 behavioralStyle] == 2
      || ([v8 _currentConfiguration],
          double v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 _hasObscuringBackground],
          v9,
          (v10 & 1) != 0))
    {
      uint64_t v11 = [v8 effectiveUserInterfaceLayoutDirection];
      [v8 alignmentRectInsets];
      if (v11 == 1) {
        double v16 = v15;
      }
      else {
        double v16 = v13;
      }
      if (v11 != 1) {
        double v13 = v15;
      }
      double v7 = -v12;
      double v6 = -v16;
      double v5 = -v14;
      double v4 = -v13;
    }
    else
    {
      double v17 = [v8 _currentConfiguration];
      [v17 contentInsets];
      double v7 = -v18;
      double v6 = -v19;
      double v5 = -v20;
      double v4 = -v21;
    }
  }
  double v22 = v7;
  double v23 = v6;
  double v24 = v5;
  double v25 = v4;
  result.trailing = v25;
  result.bottom = v24;
  result.leading = v23;
  result.top = v22;
  return result;
}

- (BOOL)isScrollEnabled
{
  return (*(_WORD *)&self->_contentViewFlags & 1) != 0 || self->_scrollEnabled;
}

- (UIButton)_secondaryButton
{
  if ([(UIView *)self->_secondaryButton isHidden]) {
    secondaryButton = 0;
  }
  else {
    secondaryButton = self->_secondaryButton;
  }
  return secondaryButton;
}

- (UIButton)_button
{
  if ([(UIView *)self->_button isHidden]) {
    button = 0;
  }
  else {
    button = self->_button;
  }
  return button;
}

- (NSDirectionalEdgeInsets)_scrollViewInsets
{
  double v3 = [(UIContentUnavailableView *)self _scrollView];
  if (v3)
  {
    double v4 = [(UIView *)self traitCollection];
    uint64_t v5 = [v4 layoutDirection];

    [v3 adjustedContentInset];
    double v9 = v8;
    double v11 = v10;
    if (v5 == 1) {
      double v12 = v7;
    }
    else {
      double v12 = v6;
    }
    if (v5 == 1) {
      double v13 = v6;
    }
    else {
      double v13 = v7;
    }
  }
  else
  {
    double v13 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v9 = 0.0;
  }

  double v14 = v9;
  double v15 = v12;
  double v16 = v11;
  double v17 = v13;
  result.trailing = v17;
  result.bottom = v16;
  result.leading = v15;
  result.top = v14;
  return result;
}

- (_UIContentUnavailableScrollView)_scrollView
{
  return self->_scrollView;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  if (a3.width >= self->_preferredMaxLayoutWidth) {
    a3.double width = self->_preferredMaxLayoutWidth;
  }
  -[UIContentUnavailableView _computeLayoutInfoRestrictedToSize:](self, "_computeLayoutInfoRestrictedToSize:", a3.width, a3.height, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  double v4 = 0.0;
  double v3 = 0.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (double)_keyboardInset
{
  double v2 = 0.0;
  if ((*(_WORD *)&self->_contentViewFlags & 4) != 0)
  {
    double v4 = [(UIView *)self keyboardSceneDelegate];
    uint64_t v5 = v4;
    if ((*(_WORD *)&self->_contentViewFlags & 2) != 0)
    {
      CGFloat x = self->_keyboardFrame.origin.x;
      CGFloat y = self->_keyboardFrame.origin.y;
      CGFloat width = self->_keyboardFrame.size.width;
      CGFloat height = self->_keyboardFrame.size.height;
    }
    else
    {
      if (![v4 isOnScreen])
      {
LABEL_7:
        [(UIContentUnavailableView *)self _scrollViewInsets];
        double v2 = fmax(v2 - v10, 0.0);

        return v2;
      }
      [v5 visibleFrameInView:0];
      +[_UIKeyboardLayoutAlignmentView _frameInBoundsForKeyboardFrame:inView:](_UIKeyboardLayoutAlignmentView, "_frameInBoundsForKeyboardFrame:inView:", self);
    }
    double v2 = CGRectGetHeight(*(CGRect *)&x);
    goto LABEL_7;
  }
  return v2;
}

- (void)_clearInvalidFrameFlags
{
  *(_WORD *)&self->_contentViewFlags &= 0xFE07u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)UIContentUnavailableView;
  [(UIView *)&v3 didMoveToWindow];
  [(UIContentUnavailableView *)self _checkWhetherEmbeddedInWrapperView];
  [(UIContentUnavailableView *)self _reconfigureKeyboardLayoutAdjustment];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)UIContentUnavailableView;
  [(UIView *)&v3 didMoveToSuperview];
  [(UIContentUnavailableView *)self _checkWhetherEmbeddedInWrapperView];
  [(UIContentUnavailableView *)self _reconfigureKeyboardLayoutAdjustment];
}

- (void)_reconfigureKeyboardLayoutAdjustment
{
  $1B4C8A047F38094B3B36BFCC6E97ECAE contentViewFlags = self->_contentViewFlags;
  double v4 = [(UIView *)self _viewControllerForAncestor];
  int v5 = [v4 _isInViewControllerThatHandlesKeyboardAvoidance];

  int v6 = ((_UIApplicationIsMessagesExtension() | v5) ^ 1) & *(_DWORD *)&contentViewFlags;
  __int16 v7 = (__int16)self->_contentViewFlags;
  if (((v6 ^ ((v7 & 4) == 0)) & 1) == 0)
  {
    if (v6) {
      __int16 v8 = 4;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_$1B4C8A047F38094B3B36BFCC6E97ECAE contentViewFlags = v8 | v7 & 0xFFFB;
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if (v6)
    {
      [v9 addObserver:self selector:sel__keyboardAboutToShow_ name:@"UIKeyboardPrivateWillShowNotification" object:0];
      [v9 addObserver:self selector:sel__keyboardAboutToHide_ name:@"UIKeyboardPrivateWillHideNotification" object:0];
      [v9 addObserver:self selector:sel__keyboardAboutToChangeFrame_ name:@"UIKeyboardPrivateWillChangeFrameNotification" object:0];
    }
    else
    {
      [v9 removeObserver:self name:@"UIKeyboardPrivateWillShowNotification" object:0];
      [v9 removeObserver:self name:@"UIKeyboardPrivateWillHideNotification" object:0];
      [v9 removeObserver:self name:@"UIKeyboardPrivateWillChangeFrameNotification" object:0];
    }
  }
}

- (void)_checkWhetherEmbeddedInWrapperView
{
  objc_super v3 = [(UIView *)self superview];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();

  __int16 contentViewFlags = (__int16)self->_contentViewFlags;
  if (((isKindOfClass ^ ((contentViewFlags & 1) == 0)) & 1) == 0)
  {
    *(_WORD *)&self->___int16 contentViewFlags = contentViewFlags & 0xFFFE | isKindOfClass & 1;
    configuration = self->_configuration;
    [(UIContentUnavailableView *)self _applyConfiguration:configuration];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  if ((*(_WORD *)&self->_contentViewFlags & 1) == 0)
  {
    double v4 = [(UIView *)self window];

    if (v4)
    {
      int v5 = [(UIView *)self _viewControllerForAncestor];
      id v7 = [v5 contentUnavailableConfigurationState];

      int v6 = [(UIContentUnavailableConfiguration *)self->_configuration updatedConfigurationForState:v7];
      [(UIContentUnavailableView *)self _applyConfiguration:v6];
    }
  }
}

- (void)setConfiguration:(UIContentUnavailableConfiguration *)configuration
{
  if (!configuration)
  {
    __int16 v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIContentUnavailableView.m", 96, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  int v5 = self->_configuration;
  if ((-[UIContentUnavailableConfiguration _isEqualToConfigurationQuick:]((uint64_t)v5, configuration) & 1) == 0)
  {
    int v6 = (void *)[(UIContentUnavailableConfiguration *)configuration copy];
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__UIContentUnavailableView_setConfiguration___block_invoke;
      v9[3] = &unk_1E530CF90;
      objc_copyWeak(&v11, &location);
      double v10 = v5;
      +[UIView _addCompletionWithPosition:v9];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    [(UIContentUnavailableView *)self _applyConfiguration:v6];
  }
}

- (void)_applyConfiguration:(id)a3
{
  if (!a3)
  {
    CGFloat v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, self, @"UIContentUnavailableView.m", 114, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_configuration, a3);
  uint64_t v5 = [a3 axesPreservingSuperviewLayoutMargins];
  if ((v5 & 2) != 0) {
    uint64_t v6 = (v5 << 63 >> 63) & 0xA | 5;
  }
  else {
    uint64_t v6 = (v5 << 63 >> 63) & 0xA;
  }
  [(UIView *)self setEdgesPreservingSuperviewLayoutMargins:v6];
  [a3 directionalLayoutMargins];
  [(UIView *)self setDirectionalLayoutMargins:"setDirectionalLayoutMargins:"];
  if (!self->_scrollView)
  {
    id v7 = [_UIContentUnavailableScrollView alloc];
    [(UIView *)self bounds];
    __int16 v8 = -[_UIContentUnavailableScrollView initWithFrame:](v7, "initWithFrame:");
    scrollView = self->_scrollView;
    self->_scrollView = v8;

    [(UIView *)self->_scrollView setAutoresizingMask:18];
    [(UIScrollView *)self->_scrollView setDelegate:self];
    [(UIView *)self addSubview:self->_scrollView];
  }
  id v55 = [(UIView *)self traitCollection];
  if (a3) {
    BOOL v10 = *((void *)a3 + 7) == 1;
  }
  else {
    BOOL v10 = 0;
  }
  [(UIScrollView *)self->_scrollView setScrollEnabled:[(UIContentUnavailableView *)self isScrollEnabled]];
  [(UIScrollView *)self->_scrollView _setIsTransientScrollView:v10];
  id v11 = self->_scrollView;
  double v12 = [a3 imageProperties];
  double v13 = v11;
  double v14 = self->_imageView;
  double v15 = v14;
  if (!v12 || (!v12[2] ? (char v16 = 1) : (char v16 = v10), (v16 & 1) != 0))
  {
    if (v14 && ![(UIView *)v14 isHidden])
    {
      int v17 = 1;
      [(UIImageView *)v15 setHidden:1];
    }
    else
    {
      int v17 = 0;
    }
    goto LABEL_28;
  }
  if (v14)
  {
    if (![(UIView *)v14 isHidden])
    {
      int v17 = 0;
      goto LABEL_25;
    }
    [(UIImageView *)v15 setHidden:0];
  }
  else
  {
    double v15 = objc_alloc_init(UIImageView);
    objc_storeStrong((id *)&self->_imageView, v15);
  }
  int v17 = 1;
LABEL_25:
  double v18 = [(UIView *)v15 superview];

  if (v18 != v13) {
    [(UIView *)v13 addSubview:v15];
  }
  -[UIContentUnavailableImageProperties _applyToImageView:]((uint64_t)v12, v15);
LABEL_28:

  __int16 contentViewFlags = (__int16)self->_contentViewFlags;
  if (v17 | ((contentViewFlags & 8) >> 3)) {
    __int16 v20 = 8;
  }
  else {
    __int16 v20 = 0;
  }
  *(_WORD *)&self->___int16 contentViewFlags = v20 | contentViewFlags & 0xFFF7;

  double v21 = self->_scrollView;
  double v22 = [a3 imageProperties];
  double v23 = v21;
  id v24 = v22;
  double v25 = self->_activityIndicator;
  double v26 = v25;
  if (!v10)
  {
    if (v25 && ![(UIView *)v25 isHidden])
    {
      int v27 = 1;
      [(UIView *)v26 setHidden:1];
    }
    else
    {
      int v27 = 0;
    }
    goto LABEL_45;
  }
  if (v25)
  {
    if (![(UIView *)v25 isHidden])
    {
      int v27 = 0;
      goto LABEL_41;
    }
    [(UIView *)v26 setHidden:0];
  }
  else
  {
    double v26 = objc_alloc_init(UIActivityIndicatorView);
    [(UIActivityIndicatorView *)v26 setHidesWhenStopped:0];
    objc_storeStrong((id *)&self->_activityIndicator, v26);
  }
  int v27 = 1;
LABEL_41:
  double v28 = [(UIView *)v26 superview];

  if (v28 != v23) {
    [(UIView *)v23 addSubview:v26];
  }
  -[UIContentUnavailableImageProperties _applyToActivityIndicatorView:]((uint64_t)v24, v26);
LABEL_45:

  __int16 v29 = (__int16)self->_contentViewFlags;
  if (v27 | ((v29 & 0x10) >> 4)) {
    __int16 v30 = 16;
  }
  else {
    __int16 v30 = 0;
  }
  *(_WORD *)&self->___int16 contentViewFlags = v30 | v29 & 0xFFEF;

  double v31 = self->_scrollView;
  id v32 = [a3 textProperties];
  int updated = _UIContentUnavailableUpdateLabelUsingTextConfiguration(v31, (id *)&self->_textLabel, v32);
  __int16 v34 = (__int16)self->_contentViewFlags;
  if (updated | ((v34 & 0x20) >> 5)) {
    __int16 v35 = 32;
  }
  else {
    __int16 v35 = 0;
  }
  *(_WORD *)&self->___int16 contentViewFlags = v35 | v34 & 0xFFDF;

  double v36 = self->_scrollView;
  double v37 = [a3 secondaryTextProperties];
  int v38 = _UIContentUnavailableUpdateLabelUsingTextConfiguration(v36, (id *)&self->_secondaryTextLabel, v37);
  __int16 v39 = (__int16)self->_contentViewFlags;
  if (v38 | ((v39 & 0x40) >> 6)) {
    __int16 v40 = 64;
  }
  else {
    __int16 v40 = 0;
  }
  *(_WORD *)&self->___int16 contentViewFlags = v40 | v39 & 0xFFBF;

  double v41 = self->_scrollView;
  id v42 = [a3 buttonProperties];
  int v43 = _UIUpdateButtonUsingButtonConfiguration(v41, (id *)&self->_button, v42);
  __int16 v44 = (__int16)self->_contentViewFlags;
  if (v43 | ((v44 & 0x80) >> 7)) {
    __int16 v45 = 128;
  }
  else {
    __int16 v45 = 0;
  }
  *(_WORD *)&self->___int16 contentViewFlags = v45 | v44 & 0xFF7F;

  uint64_t v46 = self->_scrollView;
  v47 = [a3 secondaryButtonProperties];
  int v48 = _UIUpdateButtonUsingButtonConfiguration(v46, (id *)&self->_secondaryButton, v47);
  __int16 v49 = (__int16)self->_contentViewFlags;
  if (v48 | ((unsigned __int16)(v49 & 0x100) >> 8)) {
    __int16 v50 = 256;
  }
  else {
    __int16 v50 = 0;
  }
  *(_WORD *)&self->___int16 contentViewFlags = v50 | v49 & 0xFEFF;

  BOOL v51 = _UIContentUnavailableConstantsForTraitCollection(v55);
  -[UIView _setOverrideUserInterfaceRenderingMode:](self, "_setOverrideUserInterfaceRenderingMode:", [v51 defaultUserInterfaceRenderingMode]);
  double v52 = [a3 background];
  [(UIContentUnavailableView *)self _applyBackgroundConfiguration:v52];

  self->_preferredMaxLayoutdouble Width = 1.79769313e308;
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

- (void)_applyBackgroundConfiguration:(id)a3
{
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
LABEL_2:
    [(_UISystemBackgroundView *)backgroundView setConfiguration:a3];
    [(_UISystemBackgroundView *)self->_backgroundView frameInContainerView:self];
    uint64_t v6 = self->_backgroundView;
    -[_UISystemBackgroundView setFrame:](v6, "setFrame:");
    return;
  }
  if (![a3 _hasBackgroundFill])
  {
    backgroundView = self->_backgroundView;
    if (!backgroundView) {
      return;
    }
    goto LABEL_2;
  }
  id v7 = [[_UISystemBackgroundView alloc] initWithConfiguration:a3];
  __int16 v8 = self->_backgroundView;
  self->_backgroundView = v7;

  [(_UISystemBackgroundView *)self->_backgroundView frameInContainerView:self];
  -[_UISystemBackgroundView setFrame:](self->_backgroundView, "setFrame:");
  [(UIView *)self->_backgroundView setAutoresizingMask:18];
  id v9 = self->_backgroundView;
  [(UIView *)self insertSubview:v9 atIndex:0];
}

- (UIContentUnavailableConfiguration)configuration
{
  double v2 = (void *)[(UIContentUnavailableConfiguration *)self->_configuration copy];
  return (UIContentUnavailableConfiguration *)v2;
}

- (UIContentUnavailableView)initWithConfiguration:(UIContentUnavailableConfiguration *)configuration
{
  if (!configuration)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIContentUnavailableView.m", 55, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)UIContentUnavailableView;
  uint64_t v5 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__UIContentUnavailableView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E52D9F98;
    id v11 = v5;
    double v12 = configuration;
    +[UIView performWithoutAnimation:v10];
  }
  return v6;
}

- (BOOL)shouldReparentScrollViewPanGestureRecognizer
{
  if (*(_WORD *)&self->_contentViewFlags)
  {
    objc_super v3 = [(UIContentUnavailableConfiguration *)self->_configuration background];
    int v2 = [v3 _hasBackgroundFill] ^ 1;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  [(UIView *)self setNeedsLayout];
  double v4 = [(UIView *)self _viewControllerForAncestor];
  uint64_t v5 = v4;
  if (*(_WORD *)&self->_contentViewFlags)
  {
    if ([v4 _hasAppeared])
    {
      uint64_t v6 = [v5 transitionCoordinator];

      if (v6)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __68__UIContentUnavailableView_scrollViewDidChangeAdjustedContentInset___block_invoke;
        v7[3] = &unk_1E52D9F70;
        v7[4] = self;
        +[UIView _performWithAnimation:v7];
      }
    }
  }
}

- (void)setScrollEnabled:(BOOL)scrollEnabled
{
  if (self->_scrollEnabled != scrollEnabled)
  {
    self->_scrollEnabled = scrollEnabled;
    [(UIContentUnavailableView *)self _reconfigureKeyboardLayoutAdjustment];
    BOOL v4 = self->_scrollEnabled;
    scrollView = self->_scrollView;
    [(UIScrollView *)scrollView setScrollEnabled:v4];
  }
}

- (UIContentUnavailableView)initWithCoder:(NSCoder *)coder
{
  uint64_t v5 = [(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
  if (!v5)
  {

    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)UIContentUnavailableView;
  uint64_t v6 = [(UIView *)&v12 initWithCoder:coder];
  if (!v6)
  {
LABEL_5:
    id v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__UIContentUnavailableView_initWithCoder___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v7 = v6;
  BOOL v10 = v7;
  id v11 = v5;
  +[UIView performWithoutAnimation:v9];

LABEL_6:
  return v7;
}

uint64_t __42__UIContentUnavailableView_initWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIContentUnavailableView;
  -[UIView encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_configuration forKey:@"configuration"];
}

- (id)_encodableSubviews
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsConfiguration:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

void __45__UIContentUnavailableView_setConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a3)
  {
    id v6 = WeakRetained;
    [WeakRetained _applyConfiguration:*(void *)(a1 + 32)];
    id WeakRetained = v6;
  }
}

uint64_t __68__UIContentUnavailableView_scrollViewDidChangeAdjustedContentInset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_handleKeyboardNotification:(id)a3 aboutToHide:(BOOL)a4
{
  if (a4)
  {
    CGFloat v6 = *MEMORY[0x1E4F1DB20];
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    BOOL v10 = [(UIContentUnavailableView *)self _scrollView];
    +[_UIKeyboardLayoutAlignmentView _endFrameForNotification:a3 inView:v10];
    CGFloat v6 = v11;
    CGFloat v7 = v12;
    CGFloat v8 = v13;
    CGFloat v9 = v14;
  }
  v23.origin.CGFloat x = v6;
  v23.origin.CGFloat y = v7;
  v23.size.CGFloat width = v8;
  v23.size.CGFloat height = v9;
  if (!CGRectEqualToRect(v23, self->_keyboardFrame))
  {
    self->_keyboardFrame.origin.CGFloat x = v6;
    self->_keyboardFrame.origin.CGFloat y = v7;
    self->_keyboardFrame.size.CGFloat width = v8;
    self->_keyboardFrame.size.CGFloat height = v9;
    *(_WORD *)&self->_contentViewFlags |= 2u;
    [(UIView *)self setNeedsLayout];
    double v15 = [a3 userInfo];
    char v16 = [v15 objectForKeyedSubscript:@"UIKeyboardAnimationDurationUserInfoKey"];
    [v16 doubleValue];
    uint64_t v18 = v17;

    double v19 = [a3 userInfo];
    __int16 v20 = [v19 objectForKeyedSubscript:@"UIKeyboardAnimationCurveUserInfoKey"];
    uint64_t v21 = (int)[v20 intValue];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__UIContentUnavailableView__handleKeyboardNotification_aboutToHide___block_invoke;
    v22[3] = &unk_1E52DD178;
    v22[5] = v18;
    v22[6] = (v21 << 16) | 6;
    v22[4] = self;
    +[UIView _performWithAnimation:v22];
    *(_WORD *)&self->_contentViewFlags &= ~2u;
  }
}

uint64_t __68__UIContentUnavailableView__handleKeyboardNotification_aboutToHide___block_invoke(double *a1)
{
  double v1 = a1[5];
  uint64_t v2 = *((void *)a1 + 6);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__UIContentUnavailableView__handleKeyboardNotification_aboutToHide___block_invoke_2;
  v4[3] = &unk_1E52D9F70;
  *(double *)&v4[4] = a1[4];
  return +[UIView animateWithDuration:v2 delay:v4 options:0 animations:v1 completion:0.0];
}

uint64_t __68__UIContentUnavailableView__handleKeyboardNotification_aboutToHide___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_keyboardAboutToShow:(id)a3
{
  objc_super v5 = [a3 userInfo];
  CGFloat v6 = [v5 objectForKeyedSubscript:@"UIKeyboardOriginatedFromRotationUserInfoKey"];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    [(UIContentUnavailableView *)self _handleKeyboardNotification:a3 aboutToHide:0];
  }
}

- (void)_keyboardAboutToChangeFrame:(id)a3
{
}

- (void)_keyboardAboutToHide:(id)a3
{
  objc_super v5 = [a3 userInfo];
  CGFloat v6 = [v5 objectForKeyedSubscript:@"UIKeyboardOriginatedFromRotationUserInfoKey"];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    [(UIContentUnavailableView *)self _handleKeyboardNotification:a3 aboutToHide:1];
  }
}

- (double)_multilineContextWidth
{
  return -1.0;
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  self->_preferredMaxLayoutdouble Width = 1.79769313e308;
  v2.receiver = self;
  v2.super_class = (Class)UIContentUnavailableView;
  [(UIView *)&v2 _prepareForFirstIntrinsicContentSizeCalculation];
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  self->_preferredMaxLayoutdouble Width = v8;
  v9.receiver = self;
  v9.super_class = (Class)UIContentUnavailableView;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (double)_preferredMaxLayoutWidth
{
  double result = 0.0;
  if ((*(void *)&self->super._viewFlags & 0x4000000000000) == 0) {
    return self->_preferredMaxLayoutWidth;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (a3.width <= 0.0) {
    a3.double width = 1.79769313e308;
  }
  if (a3.height <= 0.0) {
    a3.double height = 1.79769313e308;
  }
  -[UIContentUnavailableView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = 1.79769313e308;
  if (a3.width <= 0.0) {
    a3.double width = 1.79769313e308;
  }
  if (height > 0.0) {
    double v9 = height;
  }
  -[UIContentUnavailableView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
  if (a4 >= 1000.0) {
    double v10 = width;
  }
  if (a5 >= 1000.0) {
    double v11 = height;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIContentUnavailableView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  objc_super v5 = (UIContentUnavailableView *)objc_claimAutoreleasedReturnValue();
  CGFloat v6 = v5;
  if (v5 == self) {
    char v7 = 0;
  }
  else {
    char v7 = v5;
  }

  return v7;
}

- (void)_computeButtonLayoutInfo:(UIContentUnavailableViewLayoutInfo *)a3
{
  id v94 = [(UIContentUnavailableView *)self _button];
  objc_super v5 = [(UIContentUnavailableView *)self _secondaryButton];
  CGFloat v6 = self->_configuration;
  BOOL var1 = a3->var3.var1;
  BOOL v8 = a3->var4.var1;
  [(UIContentUnavailableConfiguration *)v6 buttonToSecondaryButtonPadding];
  double v10 = v9;
  if (a3->var1.var1 || a3->var2.var1)
  {
    [(UIContentUnavailableConfiguration *)v6 textToButtonPadding];
    double v12 = v11;
  }
  else
  {
    double v12 = 0.0;
  }
  BOOL v13 = [(UIContentUnavailableView *)self _prefersEqualButtonAndSecondaryButtonWidths];
  BOOL v14 = !v8 || !var1;
  int v15 = !v14;
  BOOL v16 = !v14 && v13;
  if (a3->var6) {
    BOOL v17 = v15;
  }
  else {
    BOOL v17 = 0;
  }
  [(UIContentUnavailableView *)self _alignmentInsetsForView:v94];
  double v19 = v18;
  double v88 = v20;
  double top = a3->var3.var2.top;
  double bottom = a3->var3.var2.bottom;
  double v23 = v22 + a3->var3.var2.leading;
  double v25 = v24 + a3->var3.var2.trailing;
  [(UIContentUnavailableView *)self _alignmentInsetsForView:v5];
  double v29 = v27 + a3->var4.var2.leading;
  double v31 = v30 + a3->var4.var2.trailing;
  double v92 = v23;
  double v93 = v25;
  double v91 = v31;
  if (var1 && v8)
  {
    if (v17)
    {
      double v90 = v10 + v29;
      double v32 = v23 + v10 + v29 + 0.0;
      double v33 = v25 + v31 + 0.0;
      double v86 = v12;
    }
    else
    {
      double v86 = v10;
      double v90 = v27 + a3->var4.var2.leading;
      if (v23 >= v29) {
        double v35 = v23;
      }
      else {
        double v35 = v27 + a3->var4.var2.leading;
      }
      double v32 = v35 + 0.0;
      if (v25 >= v31) {
        double v31 = v25;
      }
      double v33 = v31 + 0.0;
    }
  }
  else
  {
    if (var1) {
      double v34 = -0.0;
    }
    else {
      double v34 = v12;
    }
    double v86 = v34;
    if (var1)
    {
      double v33 = v25;
    }
    else
    {
      double v12 = -0.0;
      double v33 = v31;
    }
    double v90 = v27 + a3->var4.var2.leading;
    if (var1) {
      double v32 = v23;
    }
    else {
      double v32 = v27 + a3->var4.var2.leading;
    }
  }
  double v36 = top + v19;
  double v37 = a3->var4.var2.bottom;
  double v38 = a3->var4.var2.top + v26;
  double v40 = *MEMORY[0x1E4F1DB30];
  double v39 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v41 = fmax(*MEMORY[0x1E4F1DB30], fmin(a3->var12.width - v32 - v33, a3->var12.width));
  double v42 = v39;
  double v43 = *MEMORY[0x1E4F1DB30];
  if (var1)
  {
    double v44 = v28;
    objc_msgSend(v94, "_intrinsicSizeWithinSize:", v41, 2777777.0);
    double v28 = v44;
    double v43 = v45;
  }
  double v81 = v42;
  double v83 = v36 + v12;
  double v85 = v88 + bottom;
  double v87 = v38 + v86;
  double v89 = v28 + v37;
  if (v8)
  {
    objc_msgSend(v5, "_intrinsicSizeWithinSize:", v41, 2777777.0);
    double v40 = v46;
    double v39 = v47;
  }
  int v48 = [(UIContentUnavailableConfiguration *)v6 buttonProperties];
  [v48 minimumSize];
  double v50 = v49;
  double v52 = v51;

  double v53 = [(UIContentUnavailableConfiguration *)v6 secondaryButtonProperties];
  [v53 minimumSize];
  double v55 = v54;
  double v57 = v56;

  if (v43 >= v50) {
    double v58 = v43;
  }
  else {
    double v58 = v50;
  }
  if (v82 >= v52) {
    double v59 = v82;
  }
  else {
    double v59 = v52;
  }
  if (v40 >= v55) {
    double v60 = v40;
  }
  else {
    double v60 = v55;
  }
  if (v39 >= v57) {
    double v61 = v39;
  }
  else {
    double v61 = v57;
  }
  if (v58 >= v41) {
    double v58 = v41;
  }
  if (v60 >= v41) {
    double v60 = v41;
  }
  if (v58 >= v60) {
    double v62 = v58;
  }
  else {
    double v62 = v60;
  }
  if (v16) {
    double v63 = v62;
  }
  else {
    double v63 = v60;
  }
  if (!v16) {
    double v62 = v58;
  }
  double v64 = v93 + v92 + v62;
  double v65 = v85 + v83 + v59;
  double v66 = v91 + v90 + v63;
  double v67 = v89 + v87 + v61;
  if (v64 >= v66) {
    double v68 = v93 + v92 + v62;
  }
  else {
    double v68 = v91 + v90 + v63;
  }
  double v69 = v65 + v67;
  double v70 = v64 + v66;
  if (v65 >= v67) {
    double v71 = v85 + v83 + v59;
  }
  else {
    double v71 = v89 + v87 + v61;
  }
  if (v17) {
    double v72 = v70;
  }
  else {
    double v72 = v68;
  }
  if (v17) {
    double v73 = v71;
  }
  else {
    double v73 = v69;
  }
  if (v17 && round(v72) > round(a3->var12.width))
  {
    a3->var6 = 0;
    [(UIContentUnavailableView *)self _computeButtonLayoutInfo:a3];
    goto LABEL_99;
  }
  if (var1 && v62 > 0.0 && v59 > 0.0)
  {
    double v74 = round(v73);
    double height = a3->var12.height;
  }
  else
  {
    BOOL v76 = 0;
    double height = a3->var12.height;
    if (!v8 || v63 <= 0.0 || v61 <= 0.0) {
      goto LABEL_92;
    }
    double v74 = round(v73);
  }
  BOOL v76 = v74 <= round(height) || a3->var8;
LABEL_92:
  a3->var3.var0.double width = v62;
  a3->var3.var0.double height = v59;
  a3->var3.var1 &= v76;
  a3->var3.var2.double top = v83;
  a3->var3.var2.leading = v92;
  a3->var3.var2.double bottom = v85;
  a3->var3.var2.trailing = v93;
  a3->var4.var0.double width = v63;
  a3->var4.var0.double height = v61;
  BOOL v78 = a3->var4.var1 && v76;
  a3->var4.BOOL var1 = v78;
  a3->var4.var2.double top = v87;
  a3->var4.var2.leading = v90;
  a3->var4.var2.double bottom = v89;
  a3->var4.var2.trailing = v91;
  a3->var6 = v17;
  if (v76)
  {
    double width = a3->var11.width;
    if (width < v72) {
      double width = v72;
    }
    CGFloat v80 = v73 + a3->var11.height;
    a3->var11.double width = width;
    a3->var11.double height = v80;
    a3->var12.double height = height - v73;
  }
LABEL_99:
}

- (BOOL)_prefersEqualButtonAndSecondaryButtonWidths
{
  double v3 = [(UIContentUnavailableView *)self _button];
  double v4 = [(UIContentUnavailableView *)self _secondaryButton];
  objc_super v5 = [v3 _currentConfiguration];
  if ([v5 _hasObscuringBackground])
  {
    CGFloat v6 = [v4 _currentConfiguration];
    char v7 = [v6 _hasObscuringBackground];
  }
  else
  {
    char v7 = 0;
  }

  BOOL v8 = [v3 behavioralStyle] == 2 && objc_msgSend(v4, "behavioralStyle") == 2;
  char v9 = v7 | v8;

  return v9;
}

uint64_t __42__UIContentUnavailableView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 setAlpha:0.0];
}

double __42__UIContentUnavailableView_layoutSubviews__block_invoke_4(uint64_t a1, uint64_t a2, double *a3, uint64_t a4, uint64_t a5, double *a6, uint64_t a7)
{
  double v12 = a3[1];
  double v13 = a3[3];
  double v14 = a3[5];
  double v15 = *a3 + a3[4] + a3[6];
  double v16 = a6[1];
  double v17 = a6[3];
  double v18 = a6[5];
  double v19 = v15 + *a6 + a6[4] + a6[6];
  double v20 = *(double *)(a1 + 56);
  if (*(void *)(a1 + 424))
  {
    if (*(unsigned char *)(a1 + 544)) {
      double v20 = CGRectGetWidth(*(CGRect *)(a1 + 512)) - v19 - *(double *)(a1 + 72);
    }
  }
  else
  {
    double v20 = v20 + (*(double *)(a1 + 496) - v19) * 0.5;
  }
  double v21 = v16 + v17 + v18;
  if (v12 + v13 + v14 >= v21) {
    double v22 = v12 + v13 + v14;
  }
  else {
    double v22 = v16 + v17 + v18;
  }
  double v23 = v15 + v20;
  double v24 = (v22 - v21) * 0.5;
  uint64_t v25 = *(void *)(a1 + 32);
  double v26 = *(void (**)(uint64_t, uint64_t, long long *, uint64_t, uint64_t, double *, uint64_t))(v25 + 16);
  long long v27 = *((_OWORD *)a3 + 1);
  long long v32 = *(_OWORD *)a3;
  long long v33 = v27;
  long long v34 = *((_OWORD *)a3 + 2);
  uint64_t v35 = *((void *)a3 + 6);
  v26(v25, a2, &v32, a4, a5, a6, a7);
  double v28 = *(void (**)(double, double))(*(void *)(a1 + 32) + 16);
  long long v29 = *((_OWORD *)a6 + 1);
  long long v32 = *(_OWORD *)a6;
  long long v33 = v29;
  long long v34 = *((_OWORD *)a6 + 2);
  uint64_t v35 = *((void *)a6 + 6);
  v28(v23, v24);
  uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v22 + *(double *)(v30 + 40);
  *(double *)(v30 + 40) = result;
  return result;
}

- (_UISystemBackgroundView)_backgroundView
{
  return self->_backgroundView;
}

void __73___UIContentUnavailableView__buttonBackgroundImageForStyle_controlState___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  double v1 = (void *)_MergedGlobals_9_8;
  _MergedGlobals_9_8 = (uint64_t)v0;
}

void __73___UIContentUnavailableView__buttonBackgroundImageForStyle_controlState___block_invoke_2(uint64_t a1)
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v3 = 0;
  }
  else {
    double v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSetFillColorWithColor(v3, *(CGColorRef *)(a1 + 32));
  double v4 = GetContextStack(0);
  if (*(int *)v4 < 1) {
    objc_super v5 = 0;
  }
  else {
    objc_super v5 = (CGContext *)v4[3 * (*(_DWORD *)v4 - 1) + 1];
  }
  CGContextSetStrokeColorWithColor(v5, *(CGColorRef *)(a1 + 32));
  double v6 = *(double *)(a1 + 40);
  double v7 = *(double *)(a1 + 48);
  double v8 = *(double *)(a1 + 56);
  double v9 = *(double *)(a1 + 64);
  double v10 = *(double *)(a1 + 72);
  if (!*(void *)(a1 + 80))
  {
    *(CGRect *)&double v6 = CGRectInset(*(CGRect *)&v6, 0.5, 0.5);
    double v10 = v10 + -0.5;
  }
  double v11 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v6, v7, v8, v9, v10);
  uint64_t v12 = *(void *)(a1 + 80);
  if (v12)
  {
    if (v12 != 1) {
      goto LABEL_14;
    }
    id v13 = v11;
    [v11 fill];
  }
  else
  {
    id v13 = v11;
    [v11 stroke];
  }
  double v11 = v13;
LABEL_14:
}

void __48___UIContentUnavailableView__rebuildConstraints__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F5B268] constraintWithItem:a2 attribute:4 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 32) + 432) attribute:4 multiplier:1.0 constant:0.0];
  [*(id *)(*(void *)(a1 + 32) + 520) addObject:v3];
}

void __65___UIContentUnavailableView_windowWillAnimateRotateNotification___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 488) setHidden:1];
  obj = -[UISnapshotView initWithFrame:]([UISnapshotView alloc], "initWithFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  -[UISnapshotView captureSnapshotRect:fromView:withSnapshotType:](obj, "captureSnapshotRect:fromView:withSnapshotType:", *(void *)(*(void *)(a1 + 32) + 432), 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(*(void *)(a1 + 32) + 488) setHidden:0];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 496), obj);
  [*(id *)(*(void *)(a1 + 32) + 496) bounds];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(*(void *)(a1 + 32) + 496) bounds];
  CGFloat Width = CGRectGetWidth(v26);
  uint64_t v7 = *(void *)(a1 + 32);
  if (Width > *(double *)(v7 + 504))
  {
    [*(id *)(v7 + 496) bounds];
    double v8 = CGRectGetWidth(v27);
    [*(id *)(*(void *)(a1 + 32) + 488) bounds];
    double v9 = v8 - CGRectGetWidth(v28);
    [*(id *)(*(void *)(a1 + 32) + 496) bounds];
    CGFloat v10 = CGRectGetMidX(v29) + v9 * -0.5;
    double v11 = *(void **)(*(void *)(a1 + 32) + 496);
    [v11 bounds];
    objc_msgSend(v11, "_setContentStretchInPixels:forContentSize:shouldTile:", 0, v10, v3, v9, v5, v12, v13);
    uint64_t v7 = *(void *)(a1 + 32);
  }
  [*(id *)(v7 + 448) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:0.0];
  double v14 = [*(id *)(*(void *)(a1 + 32) + 432) layer];
  double v15 = [v14 presentationLayer];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 496), "setFrame:", v17, v19, v21, v23);
  [*(id *)(*(void *)(a1 + 32) + 432) addSubview:*(void *)(*(void *)(a1 + 32) + 496)];
}

@end