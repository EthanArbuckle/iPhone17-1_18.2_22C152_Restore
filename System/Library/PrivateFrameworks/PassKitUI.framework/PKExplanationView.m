@interface PKExplanationView
- (BOOL)_isBuddyiPad;
- (BOOL)_showTitleLogoImageView;
- (BOOL)bodyViewPrefersSizeTransform;
- (BOOL)forceShowSetupLaterButton;
- (BOOL)heroViewPrefersSizeTransform;
- (BOOL)hideTitleText;
- (BOOL)imageIgnoresTopSafeArea;
- (BOOL)reverseBodyViewAndBodyButtonOrder;
- (BOOL)showCheckmark;
- (BOOL)showPrivacyView;
- (BOOL)showSpinner;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)titleAccessoriesEnabled;
- (CGSize)logoImageViewTargetSize;
- (NSAttributedString)attributedBodyText;
- (NSAttributedString)attributedSecondaryBodyText;
- (NSString)bodyButtonText;
- (NSString)bodyText;
- (NSString)titleText;
- (OBPrivacyLinkController)privacyLink;
- (PKExplanationView)init;
- (PKExplanationView)initWithContext:(int64_t)a3;
- (PKExplanationView)initWithContext:(int64_t)a3 delegate:(id)a4;
- (PKExplanationView)initWithDelegate:(id)a3;
- (PKExplanationViewDelegate)delegate;
- (PKPaymentSetupDockView)dockView;
- (UIColor)topBackgroundColor;
- (UIFont)bodyTextFont;
- (UIFont)titleFont;
- (UIImage)bodyImage;
- (UIImage)image;
- (UIImage)titleImage;
- (UIImageView)bodyImageView;
- (UIImageView)imageView;
- (UIImageView)logoImageView;
- (UIScrollView)scrollView;
- (UITextView)bodyTextView;
- (UIView)bodyView;
- (UIView)heroView;
- (double)_automaticHorizontalMargin;
- (double)_resolvedHorizontalMargin;
- (double)bodyViewPadding;
- (double)maxImageHeight;
- (double)titleHyphenationFactor;
- (double)topLogoPadding;
- (double)topMargin;
- (id)_createBodyTextView;
- (id)bodyViewThatFitsOverride;
- (id)heroViewSizeThatFitsOverride;
- (int64_t)bodyButtonNumberOfLines;
- (int64_t)bodyTextAlignment;
- (int64_t)titleTextAlignment;
- (int64_t)titleTextNumberOfLines;
- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4;
- (unint64_t)bodyDataDetectorTypes;
- (unint64_t)bodyViewContentMode;
- (unint64_t)heroViewContentMode;
- (unint64_t)horizontalMargin;
- (unint64_t)imageStyle;
- (unint64_t)titleLineBreakStrategy;
- (void)_bodyButtonTapped;
- (void)_calculateBlur;
- (void)_continue;
- (void)_createSubviews;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_setupLater;
- (void)_updateCheckmarkColor;
- (void)_updateIconBorderColor;
- (void)_updateImage;
- (void)_updateTitleLabel;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pk_applyAppearance:(id)a3;
- (void)setAttributedBodyText:(id)a3;
- (void)setAttributedSecondaryBodyText:(id)a3;
- (void)setBodyButtonNumberOfLines:(int64_t)a3;
- (void)setBodyButtonText:(id)a3;
- (void)setBodyDataDetectorTypes:(unint64_t)a3;
- (void)setBodyImage:(id)a3;
- (void)setBodyText:(id)a3;
- (void)setBodyTextAlignment:(int64_t)a3;
- (void)setBodyTextView:(id)a3;
- (void)setBodyView:(id)a3;
- (void)setBodyViewContentMode:(unint64_t)a3;
- (void)setBodyViewPadding:(double)a3;
- (void)setBodyViewThatFitsOverride:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceShowSetupLaterButton:(BOOL)a3;
- (void)setHeroView:(id)a3;
- (void)setHeroViewContentMode:(unint64_t)a3;
- (void)setHeroViewPrefersSizeTransform:(BOOL)a3;
- (void)setHeroViewSizeThatFitsOverride:(id)a3;
- (void)setHideTitleText:(BOOL)a3;
- (void)setHorizontalMargin:(unint64_t)a3;
- (void)setImage:(id)a3;
- (void)setImageIgnoresTopSafeArea:(BOOL)a3;
- (void)setImageStyle:(unint64_t)a3;
- (void)setLogoImageView:(id)a3;
- (void)setLogoImageViewTargetSize:(CGSize)a3;
- (void)setMaxImageHeight:(double)a3;
- (void)setPrivacyLink:(id)a3;
- (void)setReverseBodyViewAndBodyButtonOrder:(BOOL)a3;
- (void)setShowCheckmark:(BOOL)a3;
- (void)setShowPrivacyView:(BOOL)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)setTitleAccessoriesEnabled:(BOOL)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleHyphenationFactor:(double)a3;
- (void)setTitleImage:(id)a3;
- (void)setTitleLabelText;
- (void)setTitleLineBreakStrategy:(unint64_t)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleTextAlignment:(int64_t)a3;
- (void)setTitleTextNumberOfLines:(int64_t)a3;
- (void)setTopBackgroundColor:(id)a3;
- (void)setTopLogoPadding:(double)a3;
- (void)setTopMargin:(double)a3;
- (void)showCheckmark:(BOOL)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKExplanationView

- (void)pk_applyAppearance:(id)a3
{
  id v4 = a3;
  v5 = [v4 backgroundColor];
  [(PKExplanationView *)self setBackgroundColor:v5];

  v6 = [v4 tintColor];
  [(PKExplanationView *)self setTintColor:v6];

  LODWORD(v6) = [v4 hasDarkAppearance];
  if (v6)
  {
    id v12 = [(PKExplanationView *)self logoImageView];
    v7 = [v12 image];

    if (v7)
    {
      v8 = [v12 image];
      v9 = [MEMORY[0x1E4FB1618] whiteColor];
      v10 = [v8 _flatImageWithColor:v9];
      v11 = [v10 imageWithRenderingMode:1];
      [v12 setImage:v11];
    }
  }
}

- (PKExplanationView)init
{
  return [(PKExplanationView *)self initWithDelegate:0];
}

- (PKExplanationView)initWithDelegate:(id)a3
{
  return [(PKExplanationView *)self initWithContext:0];
}

- (PKExplanationView)initWithContext:(int64_t)a3
{
  return [(PKExplanationView *)self initWithContext:a3 delegate:0];
}

- (PKExplanationView)initWithContext:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKExplanationView;
  v7 = -[PKExplanationView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_context = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_showPrivacyView = 1;
    v8->_topMargin = 0.0;
    v8->_horizontalMargin = 0;
    v8->_bodyTextAlignment = 1;
    v8->_titleTextAlignment = 1;
    v8->_bodyDataDetectorTypes = 2;
    v8->_bodyButtonNumberOfLines = 1;
    v8->_bodyViewPadding = 10.0;
    v8->_topLogoPadding = 25.0;
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v8->_lastSeenValidBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v8->_lastSeenValidBounds.size = v9;
    v8->_imageIgnoresTopSafeArea = 0;
    [(PKExplanationView *)v8 _createSubviews];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKExplanationView;
  [(PKExplanationView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v143.receiver = self;
  v143.super_class = (Class)PKExplanationView;
  [(PKExplanationView *)&v143 layoutSubviews];
  uint64_t v3 = PKUIGetMinScreenWidthType();
  if ([(UIScrollView *)self->_scrollView isDragging])
  {
    if (CGRectIsNull(self->_lastSeenValidBounds))
    {
      [(PKExplanationView *)self bounds];
      double x = v4;
      double y = v6;
      double width = v8;
      double height = v10;
    }
    else
    {
      double x = self->_lastSeenValidBounds.origin.x;
      double y = self->_lastSeenValidBounds.origin.y;
      double width = self->_lastSeenValidBounds.size.width;
      double height = self->_lastSeenValidBounds.size.height;
    }
  }
  else
  {
    [(PKExplanationView *)self bounds];
    double x = v12;
    double y = v13;
    double width = v14;
    double height = v15;
    self->_lastSeenValidBounds.origin.double x = v12;
    self->_lastSeenValidBounds.origin.double y = v13;
    self->_lastSeenValidBounds.size.double width = v14;
    self->_lastSeenValidBounds.size.double height = v15;
  }
  [(PKExplanationView *)self safeAreaInsets];
  double v17 = v16;
  double v123 = v18;
  [(UIScrollView *)self->_scrollView frame];
  v154.origin.double x = v19;
  v154.origin.double y = v20;
  v154.size.double width = v21;
  v154.size.double height = v22;
  v144.origin.double x = x;
  v144.origin.double y = y;
  v144.size.double width = width;
  double v130 = height;
  v144.size.double height = height;
  if (!CGRectEqualToRect(v144, v154)) {
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", x, y, width, height);
  }
  double v129 = y;
  if (self->_maxImageHeight == 0.0) {
    self->_double maxImageHeight = dbl_1A0443920[PKUIGetMinScreenWidthType() == 0];
  }
  [(PKExplanationView *)self _resolvedHorizontalMargin];
  if (PKIsPad()) {
    PKPaymentSetupContextIsSetupAssistant();
  }
  if (width >= 768.0)
  {
    v23 = [(PKExplanationView *)self readableContentGuide];
    [v23 layoutFrame];
  }
  PKSizeAlignedInRect();
  double v127 = v24;
  double v128 = v25;
  uint64_t v125 = v26;
  double v126 = v27;
  uint64_t v139 = 0;
  v140 = (CGFloat *)&v139;
  uint64_t v141 = 0x2020000000;
  uint64_t v142 = 0;
  v28 = [(UIImageView *)self->_imageView superview];

  if (v28)
  {
    v29 = self->_imageView;
    [(UIImageView *)v29 frame];
    UIRectCenteredXInRect();
    CGFloat v33 = v30;
    if (self->_imageIgnoresTopSafeArea) {
      double topMargin = -v17;
    }
    else {
      double topMargin = self->_topMargin;
    }
    if (self->_image)
    {
      if (v32 >= self->_maxImageHeight) {
        double maxImageHeight = self->_maxImageHeight;
      }
      else {
        double maxImageHeight = v32;
      }
      if (v31 >= width) {
        double v39 = width;
      }
      else {
        double v39 = v31;
      }
    }
    else
    {
      double maxImageHeight = 0.0;
      double v39 = 0.0;
    }
    -[UIImageView setFrame:](v29, "setFrame:", v30, topMargin, v39, maxImageHeight);
    v145.origin.double x = v33;
    v145.origin.double y = topMargin;
    v145.size.double width = v39;
    v145.size.double height = maxImageHeight;
    v140[3] = CGRectGetMaxY(v145);
  }
  else
  {
    v35 = [(UIView *)self->_heroView superview];

    if (v35)
    {
      if (self->_imageIgnoresTopSafeArea) {
        double v37 = -v17;
      }
      else {
        double v37 = self->_topMargin;
      }
      v146.origin.double x = __35__PKExplanationView_layoutSubviews__block_invoke(x, v37, width, 1.79769313e308, v36, self->_heroView, self->_heroViewSizeThatFitsOverride, self->_heroViewContentMode, self->_heroViewPrefersSizeTransform);
      v140[3] = CGRectGetMaxY(v146);
    }
  }
  v40 = (double *)MEMORY[0x1E4F1DB30];
  if (self->_hideTitleText)
  {
    CGFloat v41 = *MEMORY[0x1E4F1DB28];
    double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v44 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    if ([(PKExplanationView *)self _showTitleLogoImageView])
    {
      v45 = self->_logoImageView;
      v46 = [(UIImageView *)v45 image];
      [v46 size];
      double v48 = v47;

      [(UIImageView *)v45 frame];
      double v49 = self->_logoImageViewTargetSize.height;
      double v50 = v40[1];
      BOOL v51 = self->_logoImageViewTargetSize.width == *v40;
      if (v49 != v50) {
        BOOL v51 = 0;
      }
      if (v3) {
        BOOL v51 = 0;
      }
      BOOL v52 = v48 > 20.0;
      if (v51 && v52) {
        double v49 = 20.0;
      }
      double v53 = 1.79769313e308;
      if (!v51 || !v52) {
        double v53 = self->_logoImageViewTargetSize.width;
      }
      if (v53 != *v40 || v49 != v50) {
        PKSizeAspectFit();
      }
      UIRectCenteredXInRect();
      CGFloat v41 = v54;
      CGFloat v44 = v55;
      double v43 = v56;
      double v42 = v140[3] + self->_topLogoPadding;
      -[UIImageView setFrame:](v45, "setFrame:", v54, v42);
    }
    else
    {
      v45 = self->_titleLabel;
      double v57 = fmax(width - v128, 0.0) * 0.5;
      -[UIImageView setContentInsets:](v45, "setContentInsets:", 0.0, v57, 0.0, v57);
      -[UIImageView sizeThatFits:](v45, "sizeThatFits:", width, 1.79769313e308);
      double v43 = v58;
      double v42 = v140[3] + self->_topLogoPadding;
      -[UIImageView setFrame:](v45, "setFrame:", x, v42, width, v58);
      v140[3] = v43 + v140[3];
      CGFloat v44 = width;
      CGFloat v41 = x;
    }
  }
  v59 = [(UIImageView *)self->_bodyImageView superview];

  double v124 = x;
  if (v59)
  {
    [(UIImageView *)self->_bodyImageView frame];
    UIRectCenteredXInRect();
    double v61 = v60;
    double v63 = v62;
    double v65 = v64;
    v147.origin.double x = v41;
    v147.origin.double y = v42;
    v147.size.double width = v44;
    v147.size.double height = v43;
    double v66 = CGRectGetMaxY(v147) + 44.0;
    if (self->_bodyImage)
    {
      if (v65 >= self->_maxImageHeight) {
        double v67 = self->_maxImageHeight;
      }
      else {
        double v67 = v65;
      }
      if (v63 >= width) {
        double v63 = width;
      }
    }
    else
    {
      double v63 = 0.0;
      double v67 = 0.0;
    }
    -[UIImageView setFrame:](self->_bodyImageView, "setFrame:", v61, v66, v63, v67);
    v149.origin.double x = v61;
    v149.origin.double y = v66;
    v149.size.double width = v63;
    v149.size.double height = v67;
    double MaxY = CGRectGetMaxY(v149);
    v69 = &PKSetupViewConstantsBodyImageBottomPadding;
  }
  else
  {
    v148.origin.double x = v41;
    v148.origin.double y = v42;
    v148.size.double width = v44;
    v148.size.double height = v43;
    double MaxY = CGRectGetMaxY(v148);
    v69 = &PKSetupViewConstantsBodyTextPadding;
  }
  v140[3] = MaxY;
  double v70 = *(double *)v69;
  v71 = self->_bodyTextView;
  [(UITextView *)v71 frame];
  -[UITextView sizeThatFits:](v71, "sizeThatFits:", v128, 1.79769313e308);
  UIRectCenteredXInRect();
  CGFloat v73 = v72;
  CGFloat v75 = v74;
  CGFloat v77 = v76;
  CGFloat v78 = v70 + v140[3];
  -[UITextView setFrame:](v71, "setFrame:", v72, v78);
  v150.origin.double x = v73;
  v150.origin.double y = v78;
  v150.size.double width = v75;
  v150.size.double height = v77;
  v140[3] = CGRectGetMaxY(v150);
  if (self->_attributedSecondaryBodyText)
  {
    [(UITextView *)self->_secondaryBodyTextView frame];
    -[UITextView sizeThatFits:](self->_secondaryBodyTextView, "sizeThatFits:", v128, 1.79769313e308);
    UIRectCenteredXInRect();
    CGFloat v80 = v79;
    CGFloat v82 = v81;
    CGFloat v84 = v83;
    CGFloat v85 = v70 + v140[3];
    -[UITextView setFrame:](self->_secondaryBodyTextView, "setFrame:", v79, v85);
    v151.origin.double x = v80;
    v151.origin.double y = v85;
    v151.size.double width = v82;
    v151.size.double height = v84;
    v140[3] = CGRectGetMaxY(v151);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PKExplanationView_layoutSubviews__block_invoke_2;
  aBlock[3] = &unk_1E59D6FC8;
  *(double *)&aBlock[6] = v127;
  aBlock[7] = v125;
  *(double *)&aBlock[8] = v128;
  *(double *)&aBlock[9] = v126;
  *(double *)&aBlock[10] = v124;
  *(double *)&aBlock[11] = v129;
  *(double *)&aBlock[12] = width;
  *(double *)&aBlock[13] = v130;
  aBlock[4] = self;
  aBlock[5] = &v139;
  v86 = (void (**)(void))_Block_copy(aBlock);
  v131[0] = MEMORY[0x1E4F143A8];
  v131[1] = 3221225472;
  v131[2] = __35__PKExplanationView_layoutSubviews__block_invoke_3;
  v131[3] = &unk_1E59D6FF0;
  double v134 = v127;
  uint64_t v135 = v125;
  double v136 = v128;
  double v137 = v126;
  v131[4] = self;
  id v132 = &__block_literal_global_123;
  v133 = &v139;
  v87 = (void (**)(void))_Block_copy(v131);
  v88 = v87;
  if (self->_reverseBodyViewAndBodyButtonOrder)
  {
    v87[2](v87);
    v89 = v86;
  }
  else
  {
    v86[2](v86);
    v89 = v88;
  }
  ((void (*)(void))v89[2])();
  double v90 = width;
  if (width >= 768.0)
  {
    v91 = [(PKExplanationView *)self readableContentGuide];
    [v91 layoutFrame];
    double v90 = v92;
  }
  v93 = [(OBPrivacyLinkController *)self->_privacyLink view];
  v94 = v93;
  if (v93 && self->_showPrivacyView)
  {
    double v96 = self->_cachedPrivacyViewSize.width;
    double v95 = self->_cachedPrivacyViewSize.height;
    if (v96 == *v40 && v95 == v40[1])
    {
      objc_msgSend(v93, "setFrame:", 0.0, 0.0, v128, 0.0);
      [v94 setNeedsLayout];
      [v94 layoutIfNeeded];
      LODWORD(v97) = 1148846080;
      LODWORD(v98) = 1112014848;
      objc_msgSend(v94, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v128, v126, v97, v98);
      double v96 = v99;
      double v95 = v100;
      self->_cachedPrivacyViewSize.double width = v99;
      self->_cachedPrivacyViewSize.double height = v100;
    }
  }
  else
  {
    double v96 = *v40;
    double v95 = v40[1];
  }
  if (self->_showPrivacyView)
  {
    -[PKPaymentSetupDockView sizeThatFitsWithoutPrivacyLink:](self->_dockView, "sizeThatFitsWithoutPrivacyLink:", v90, 1.79769313e308);
    if (v130 - (v123 + v95 + 11.0 + v101) >= v140[3])
    {
      v106 = [v94 superview];
      dockView = self->_dockView;

      if (v106 != dockView) {
        [v94 removeFromSuperview];
      }
      v108 = [(PKPaymentSetupDockView *)self->_dockView privacyLink];
      privacyLink = self->_privacyLink;

      if (v108 != privacyLink) {
        [(PKPaymentSetupDockView *)self->_dockView setPrivacyLink:self->_privacyLink];
      }
      double v105 = v140[3];
    }
    else
    {
      v102 = [(PKPaymentSetupDockView *)self->_dockView privacyLink];

      if (v102) {
        [(PKPaymentSetupDockView *)self->_dockView setPrivacyLink:0];
      }
      v103 = [v94 superview];

      if (!v103) {
        [(UIScrollView *)self->_scrollView addSubview:v94];
      }
      CGFloat v104 = v140[3] + 16.0;
      objc_msgSend(v94, "setFrame:", v127, v104, v96, v95);
      v152.origin.double x = v127;
      v152.origin.double y = v104;
      v152.size.double width = v96;
      v152.size.double height = v95;
      double v105 = CGRectGetMaxY(v152);
    }
  }
  else
  {
    double v105 = v140[3];
  }
  -[PKPaymentSetupDockView sizeThatFits:](self->_dockView, "sizeThatFits:", v90, 1.79769313e308);
  double v111 = v110;
  v153.origin.double x = v124;
  v153.origin.double y = v129;
  v153.size.double height = v130;
  v153.size.double width = width;
  -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", 0.0, CGRectGetMaxY(v153) - (v123 + v111), width);
  [(_PKVisibilityBackdropView *)self->_blurringView layoutIfNeeded];
  PKFloatRoundToPixel();
  -[PKPaymentSetupDockView setFrame:](self->_dockView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", width, v105);
  [(UIScrollView *)self->_scrollView contentInset];
  double v113 = v112;
  double v115 = v114;
  double v117 = v116;
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v113, v115, v111, v117);
  topBackgroundView = self->_topBackgroundView;
  if (topBackgroundView)
  {
    [(UIScrollView *)self->_scrollView contentOffset];
    double v120 = 0.0;
    if (self->_topMargin - v119 >= 0.0)
    {
      [(UIScrollView *)self->_scrollView contentOffset];
      double v120 = self->_topMargin - v121;
    }
    -[UIView setFrame:](topBackgroundView, "setFrame:", v124, v129, width, v120);
  }
  [(PKExplanationView *)self _calculateBlur];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained explanationViewDidUpdateLayout:self];
  }

  _Block_object_dispose(&v139, 8);
}

double __35__PKExplanationView_layoutSubviews__block_invoke(double a1, double a2, double a3, double a4, uint64_t a5, void *a6, void *a7, uint64_t a8, int a9)
{
  id v14 = a6;
  id v15 = a7;
  double v16 = v15;
  if (v15) {
    (*((void (**)(id, id, double, double))v15 + 2))(v15, v14, a3, a4);
  }
  else {
    objc_msgSend(v14, "sizeThatFits:", a3, a4);
  }
  double v19 = v17;
  double v20 = v18;
  switch(a8)
  {
    case 1:
      PKSizeScaleAspectFit();
      goto LABEL_10;
    case 2:
      PKSizeAspectFill();
      goto LABEL_10;
    case 3:
      PKSizeAspectFit();
      goto LABEL_10;
    case 4:
      PKSizeAspectFitToCover();
LABEL_10:
      double v24 = v21;
      double v23 = v22;
      break;
    default:
      double v23 = v18;
      double v24 = v17;
      break;
  }
  if (a9) {
    double v25 = v20;
  }
  else {
    double v25 = v23;
  }
  if (a9) {
    double v26 = v19;
  }
  else {
    double v26 = v24;
  }
  objc_msgSend(v14, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v26, v25);
  if (a9)
  {
    memset(&v45, 0, sizeof(v45));
    CATransform3DMakeScale(&v45, v24 / v19, v23 / v20, 1.0);
    CATransform3D v44 = v45;
    double v27 = &v44;
  }
  else
  {
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v45.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v45.m33 = v28;
    long long v29 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v45.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v45.m43 = v29;
    long long v30 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v45.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v45.m13 = v30;
    long long v31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v45.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v45.m23 = v31;
    double v27 = &v45;
  }
  objc_msgSend(v14, "setTransform3D:", v27, *(_OWORD *)&v44.m11, *(_OWORD *)&v44.m13, *(_OWORD *)&v44.m21, *(_OWORD *)&v44.m23, *(_OWORD *)&v44.m31, *(_OWORD *)&v44.m33, *(_OWORD *)&v44.m41, *(_OWORD *)&v44.m43, *(void *)&v45.m11, *(void *)&v45.m12, *(void *)&v45.m13, *(void *)&v45.m14, *(void *)&v45.m21, *(void *)&v45.m22, *(void *)&v45.m23, *(void *)&v45.m24,
    *(void *)&v45.m31,
    *(void *)&v45.m32,
    *(void *)&v45.m33,
    *(void *)&v45.m34,
    *(void *)&v45.m41,
    *(void *)&v45.m42,
    *(void *)&v45.m43,
    *(void *)&v45.m44);
  PKSizeAlignedInRect();
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  v40 = [v14 layer];
  [v40 anchorPoint];
  objc_msgSend(v14, "setCenter:", v33 + v41 * v37, v35 + v42 * v39);

  return v33;
}

void __35__PKExplanationView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 552);
  if (v2)
  {
    objc_msgSend(v2, "sizeThatFits:", *(double *)(a1 + 64), 1.79769313e308);
    UIRectCenteredXInRect();
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v9 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 10.0;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 552), "pkui_setBoundsAndPositionFromFrame:", v3, v9);
    v10.origin.double x = v4;
    v10.origin.double y = v9;
    v10.size.double width = v6;
    v10.size.double height = v8;
    *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v10);
  }
}

void __35__PKExplanationView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 760))
  {
    v3.origin.double x = (*(double (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 56), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + *(double *)(v1 + 784), *(double *)(a1 + 72), 1.79769313e308);
    *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CGRectGetMaxY(v3);
  }
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)bodyImageView
{
  return self->_bodyImageView;
}

- (void)setShowPrivacyView:(BOOL)a3
{
  if (self->_showPrivacyView != a3)
  {
    self->_showPrivacyView = a3;
    privacyLink = self->_privacyLink;
    if (privacyLink)
    {
      double v5 = [(OBPrivacyLinkController *)privacyLink view];
      CGFloat v6 = v5;
      if (!self->_showPrivacyView)
      {
        [v5 removeFromSuperview];
        [(PKPaymentSetupDockView *)self->_dockView setPrivacyLink:0];
      }
    }
    self->_cachedPrivacyViewSize = (CGSize)*MEMORY[0x1E4F1DB30];
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setPrivacyLink:(id)a3
{
  p_privacyLink = &self->_privacyLink;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    CGFloat v6 = [(OBPrivacyLinkController *)*p_privacyLink view];
    [v6 removeFromSuperview];

    [(PKPaymentSetupDockView *)self->_dockView setPrivacyLink:0];
    objc_storeStrong((id *)&self->_privacyLink, a3);
    self->_cachedPrivacyViewSize = (CGSize)*MEMORY[0x1E4F1DB30];
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setHideTitleText:(BOOL)a3
{
  if (self->_hideTitleText != a3)
  {
    self->_hideTitleText = a3;
    [(PKExplanationView *)self _updateTitleLabel];
  }
}

- (void)setForceShowSetupLaterButton:(BOOL)a3
{
  if (self->_forceShowSetupLaterButton != a3)
  {
    self->_forceShowSetupLaterButton = a3;
    CGFloat v4 = [(PKExplanationView *)self dockView];
    id v7 = [v4 footerView];

    [v7 setForceShowSetupLaterButton:self->_forceShowSetupLaterButton];
    double v5 = [v7 setupLaterButton];

    if (v5)
    {
      CGFloat v6 = [v7 setupLaterButton];
      [v6 addTarget:self action:sel__setupLater forControlEvents:0x2000];
    }
  }
}

- (void)setImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    id v7 = v5;
    CGFloat v6 = [(UIImageView *)self->_imageView superview];

    if (v6) {
      [(UIImageView *)self->_imageView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_image, a3);
    [(PKExplanationView *)self _updateImage];
    double v5 = v7;
  }
}

- (void)setImageStyle:(unint64_t)a3
{
  if (self->_imageStyle != a3)
  {
    self->_imageStyle = a3;
    [(PKExplanationView *)self _updateImage];
  }
}

- (void)setHeroView:(id)a3
{
  double v5 = (UIView *)a3;
  p_heroView = &self->_heroView;
  heroView = self->_heroView;
  if (heroView != v5)
  {
    CGRect v10 = v5;
    CGFloat v8 = [(UIView *)heroView superview];

    if (v8) {
      [(UIView *)*p_heroView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_heroView, a3);
    CGFloat v9 = [(UIView *)*p_heroView superview];

    if (!v9) {
      [(UIScrollView *)self->_scrollView addSubview:*p_heroView];
    }
    [(UIImageView *)self->_imageView removeFromSuperview];
    [(PKExplanationView *)self setNeedsLayout];
    double v5 = v10;
  }
}

- (void)setHeroViewSizeThatFitsOverride:(id)a3
{
  CGFloat v4 = _Block_copy(a3);
  id heroViewSizeThatFitsOverride = self->_heroViewSizeThatFitsOverride;
  self->_id heroViewSizeThatFitsOverride = v4;

  [(PKExplanationView *)self setNeedsLayout];
}

- (void)setHeroViewContentMode:(unint64_t)a3
{
  if (self->_heroViewContentMode != a3)
  {
    self->_heroViewContentMode = a3;
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setHeroViewPrefersSizeTransform:(BOOL)a3
{
  if (((!self->_heroViewPrefersSizeTransform ^ a3) & 1) == 0)
  {
    self->_heroViewPrefersSizeTransform = a3;
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setTopBackgroundColor:(id)a3
{
  id v4 = a3;
  topBackgroundView = self->_topBackgroundView;
  id v9 = v4;
  if (v4)
  {
    if (!topBackgroundView)
    {
      CGFloat v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      id v7 = self->_topBackgroundView;
      self->_topBackgroundView = v6;

      [(PKExplanationView *)self insertSubview:self->_topBackgroundView belowSubview:self->_scrollView];
      topBackgroundView = self->_topBackgroundView;
    }
    [(UIView *)topBackgroundView setBackgroundColor:v9];
    [(PKExplanationView *)self setNeedsLayout];
  }
  else
  {
    [(UIView *)topBackgroundView removeFromSuperview];
    CGFloat v8 = self->_topBackgroundView;
    self->_topBackgroundView = 0;
  }
}

- (void)setTitleText:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_titleText] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    [(PKExplanationView *)self _updateTitleLabel];
  }
}

- (void)setTitleFont:(id)a3
{
  id v5 = (UIFont *)a3;
  if (self->_titleFont != v5)
  {
    CGFloat v6 = v5;
    objc_storeStrong((id *)&self->_titleFont, a3);
    [(PKExplanationView *)self setTitleLabelText];
    [(PKExplanationView *)self setNeedsLayout];
    id v5 = v6;
  }
}

- (void)setTitleTextNumberOfLines:(int64_t)a3
{
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(PKTrailingAccessoryLabel *)titleLabel setMaximumNumberOfLines:a3];
    [(PKExplanationView *)self _updateTitleLabel];
  }
}

- (void)setTitleLineBreakStrategy:(unint64_t)a3
{
  if (self->_titleLineBreakStrategy != a3)
  {
    self->_titleLineBreakStrategdouble y = a3;
    [(PKExplanationView *)self _updateTitleLabel];
  }
}

- (void)setShowSpinner:(BOOL)a3
{
  if (((!self->_showSpinner ^ a3) & 1) == 0)
  {
    self->_showSpinner = a3;
    activityIndicator = self->_activityIndicator;
    if (a3)
    {
      [(UIActivityIndicatorView *)activityIndicator setHidden:0];
      id v5 = self->_activityIndicator;
      [(UIActivityIndicatorView *)v5 startAnimating];
    }
    else
    {
      [(UIActivityIndicatorView *)activityIndicator stopAnimating];
    }
  }
}

- (void)setShowCheckmark:(BOOL)a3
{
}

- (void)showCheckmark:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_showCheckmark ^ a3) & 1) == 0)
  {
    self->_showCheckmark = a3;
    -[LAUICheckmarkLayer setRevealed:animated:](self->_checkmarkLayer, "setRevealed:animated:");
  }
}

- (void)setBodyImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_bodyImage = &self->_bodyImage;
  if (self->_bodyImage != v5)
  {
    CGRect v10 = v5;
    id v7 = [(UIImageView *)self->_bodyImageView superview];

    if (v7) {
      [(UIImageView *)self->_imageView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_bodyImage, a3);
    [(UIImageView *)self->_bodyImageView setImage:*p_bodyImage];
    [(UIImageView *)self->_bodyImageView sizeToFit];
    bodyImageView = self->_bodyImageView;
    if (*p_bodyImage)
    {
      id v9 = [(UIImageView *)bodyImageView superview];

      if (!v9) {
        [(UIScrollView *)self->_scrollView addSubview:self->_bodyImageView];
      }
      bodyImageView = (UIImageView *)self->_heroView;
    }
    [(UIImageView *)bodyImageView removeFromSuperview];
    [(PKExplanationView *)self setNeedsLayout];
    id v5 = v10;
  }
}

- (void)setBodyTextAlignment:(int64_t)a3
{
  if (self->_bodyTextAlignment != a3)
  {
    self->_bodyTextAlignment = a3;
    -[UITextView setTextAlignment:](self->_bodyTextView, "setTextAlignment:");
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setTitleTextAlignment:(int64_t)a3
{
  if (self->_titleTextAlignment != a3)
  {
    self->_titleTextAlignment = a3;
    [(PKExplanationView *)self setTitleLabelText];
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (UIFont)bodyTextFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

- (void)setBodyText:(id)a3
{
  p_bodyText = &self->_bodyText;
  id v11 = a3;
  if (([v11 isEqualToString:*p_bodyText] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bodyText, a3);
    attributedBodyText = self->_attributedBodyText;
    self->_attributedBodyText = 0;

    bodyTextView = self->_bodyTextView;
    if (*p_bodyText)
    {
      if (!bodyTextView)
      {
        CGFloat v8 = [(PKExplanationView *)self _createBodyTextView];
        id v9 = self->_bodyTextView;
        self->_bodyTextView = v8;

        [(UIScrollView *)self->_scrollView addSubview:self->_bodyTextView];
        bodyTextView = self->_bodyTextView;
      }
      -[UITextView setText:](bodyTextView, "setText:");
    }
    else
    {
      [(UITextView *)bodyTextView removeFromSuperview];
      CGRect v10 = self->_bodyTextView;
      self->_bodyTextView = 0;
    }
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setAttributedSecondaryBodyText:(id)a3
{
  p_attributedSecondaryBodyText = (id *)&self->_attributedSecondaryBodyText;
  id v10 = a3;
  if ((objc_msgSend(*p_attributedSecondaryBodyText, "isEqualToAttributedString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_attributedSecondaryBodyText, a3);
    secondaryBodyTextView = self->_secondaryBodyTextView;
    if (*p_attributedSecondaryBodyText)
    {
      if (!secondaryBodyTextView)
      {
        id v7 = [(PKExplanationView *)self _createBodyTextView];
        CGFloat v8 = self->_secondaryBodyTextView;
        self->_secondaryBodyTextView = v7;

        [(UIScrollView *)self->_scrollView addSubview:self->_secondaryBodyTextView];
        secondaryBodyTextView = self->_secondaryBodyTextView;
      }
      -[UITextView setAttributedText:](secondaryBodyTextView, "setAttributedText:");
    }
    else
    {
      [(UITextView *)secondaryBodyTextView removeFromSuperview];
      id v9 = self->_secondaryBodyTextView;
      self->_secondaryBodyTextView = 0;
    }
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setAttributedBodyText:(id)a3
{
  id v16 = a3;
  char v4 = [v16 isEqualToAttributedString:self->_attributedBodyText];
  id v5 = v16;
  if ((v4 & 1) == 0)
  {
    CGFloat v6 = (NSAttributedString *)[v16 copy];
    attributedBodyText = self->_attributedBodyText;
    self->_attributedBodyText = v6;

    bodyText = self->_bodyText;
    self->_bodyText = 0;

    id v9 = self->_attributedBodyText;
    bodyTextView = self->_bodyTextView;
    if (v9)
    {
      if (!bodyTextView)
      {
        id v11 = [(PKExplanationView *)self _createBodyTextView];
        CGFloat v12 = self->_bodyTextView;
        self->_bodyTextView = v11;

        [(UIScrollView *)self->_scrollView addSubview:self->_bodyTextView];
        bodyTextView = self->_bodyTextView;
        id v9 = self->_attributedBodyText;
      }
      [(UITextView *)bodyTextView setAttributedText:v9];
      CGFloat v13 = self->_bodyTextView;
      id v14 = [(PKExplanationView *)self bodyTextFont];
      [(UITextView *)v13 setFont:v14];

      [(UITextView *)self->_bodyTextView setTextAlignment:self->_bodyTextAlignment];
    }
    else
    {
      [(UITextView *)bodyTextView removeFromSuperview];
      id v15 = self->_bodyTextView;
      self->_bodyTextView = 0;
    }
    [(PKExplanationView *)self setNeedsLayout];
    id v5 = v16;
  }
}

- (void)setBodyView:(id)a3
{
  id v5 = (UIView *)a3;
  bodyView = self->_bodyView;
  if (bodyView != v5)
  {
    id v7 = v5;
    [(UIView *)bodyView removeFromSuperview];
    objc_storeStrong((id *)&self->_bodyView, a3);
    if (self->_bodyView) {
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:");
    }
    [(PKExplanationView *)self setNeedsLayout];
    id v5 = v7;
  }
}

- (void)setBodyButtonText:(id)a3
{
  id v4 = a3;
  id v5 = [(UIButton *)self->_bodyButton configuration];
  CGFloat v6 = [v5 attributedTitle];
  id v7 = [v6 string];
  id v8 = v4;
  id v9 = v7;
  if (v9 == v8)
  {
  }
  else
  {
    id v10 = v9;
    if (v8 && v9)
    {
      char v11 = [v8 isEqualToString:v9];

      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {

      if (!v8)
      {
        [(UIButton *)self->_bodyButton removeFromSuperview];
        bodyButton = self->_bodyButton;
        self->_bodyButton = 0;

        goto LABEL_13;
      }
    }
    CGFloat v12 = self->_bodyButton;
    if (v12)
    {
      [(UIButton *)v12 pkui_updateConfigurationWithTitle:v8];
    }
    else
    {
      CGFloat v13 = (void *)MEMORY[0x1E4FB14D8];
      id v14 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
      id v15 = objc_msgSend(v13, "pkui_plainConfigurationWithTitle:font:", v8, v14);

      objc_initWeak(&location, self);
      id v16 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      double v23 = __39__PKExplanationView_setBodyButtonText___block_invoke;
      double v24 = &unk_1E59CBEE0;
      objc_copyWeak(&v25, &location);
      double v17 = [v16 actionWithHandler:&v21];
      objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v15, v17, v21, v22, v23, v24);
      double v18 = (UIButton *)objc_claimAutoreleasedReturnValue();
      double v19 = self->_bodyButton;
      self->_bodyButton = v18;

      [(UIButton *)self->_bodyButton setConfigurationUpdateHandler:&__block_literal_global_70];
      [(UIButton *)self->_bodyButton setAccessibilityIdentifier:*MEMORY[0x1E4F85300]];
      [(UIScrollView *)self->_scrollView addSubview:self->_bodyButton];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    [(UIButton *)self->_bodyButton sizeToFit];
  }
LABEL_13:
}

void __39__PKExplanationView_setBodyButtonText___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _bodyButtonTapped];
}

void __39__PKExplanationView_setBodyButtonText___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  CGRect v3 = [v2 titleLabel];
  [v3 setTextAlignment:1];

  id v4 = [v2 titleLabel];
  [v4 setLineBreakMode:4];

  id v5 = [v2 titleLabel];

  [v5 setNumberOfLines:2];
}

- (void)setBodyButtonNumberOfLines:(int64_t)a3
{
  if (self->_bodyButtonNumberOfLines != a3)
  {
    self->_bodyButtonNumberOfLines = a3;
    bodyButton = self->_bodyButton;
    if (bodyButton)
    {
      id v5 = [(UIButton *)bodyButton titleLabel];
      [v5 setNumberOfLines:self->_bodyButtonNumberOfLines];

      [(PKExplanationView *)self setNeedsLayout];
    }
  }
}

- (void)setHorizontalMargin:(unint64_t)a3
{
  if (self->_horizontalMargin != a3)
  {
    self->_horizontalMargin = a3;
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setTopMargin:(double)a3
{
  if (self->_topMargin != a3)
  {
    self->_double topMargin = a3;
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setTitleHyphenationFactor:(double)a3
{
  if (self->_titleHyphenationFactor != a3)
  {
    self->_titleHyphenationFactor = a3;
    [(PKExplanationView *)self setTitleLabelText];
  }
}

- (void)setTitleImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_titleImage != v5)
  {
    CGFloat v6 = v5;
    objc_storeStrong((id *)&self->_titleImage, a3);
    [(UIImageView *)self->_logoImageView setImage:self->_titleImage];
    [(UIImageView *)self->_logoImageView sizeToFit];
    [(PKExplanationView *)self setNeedsLayout];
    id v5 = v6;
  }
}

- (void)setTitleAccessoriesEnabled:(BOOL)a3
{
  if (((!self->_titleAccessoriesEnabled ^ a3) & 1) == 0)
  {
    self->_titleAccessoriesEnabled = a3;
    titleLabel = self->_titleLabel;
    if (a3)
    {
      checkmarkLayer = self->_checkmarkLayer;
      [(LAUICheckmarkLayer *)checkmarkLayer aspectSize];
      PKSizeScaleAspectFit();
      -[PKTrailingAccessoryLabel registerAccessoryWithLayer:withSize:for:](titleLabel, "registerAccessoryWithLayer:withSize:for:", checkmarkLayer, @"checkmark");
      CGFloat v6 = self->_titleLabel;
      activityIndicator = self->_activityIndicator;
      [(UIActivityIndicatorView *)activityIndicator intrinsicContentSize];
      -[PKTrailingAccessoryLabel registerAccessoryWithView:withSize:for:](v6, "registerAccessoryWithView:withSize:for:", activityIndicator, @"activityIndicator");
    }
    else
    {
      [(PKTrailingAccessoryLabel *)self->_titleLabel unregisterAccessories];
    }
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setLogoImageViewTargetSize:(CGSize)a3
{
  if (self->_logoImageViewTargetSize.width != a3.width || self->_logoImageViewTargetSize.height != a3.height)
  {
    self->_logoImageViewTargetSize = a3;
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setBodyDataDetectorTypes:(unint64_t)a3
{
  if (self->_bodyDataDetectorTypes != a3)
  {
    self->_bodyDataDetectorTypes = a3;
    -[UITextView setDataDetectorTypes:](self->_bodyTextView, "setDataDetectorTypes:");
    [(UITextView *)self->_secondaryBodyTextView setDataDetectorTypes:self->_bodyDataDetectorTypes];
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setBodyViewPadding:(double)a3
{
  if (self->_bodyViewPadding != a3)
  {
    self->_bodyViewPadding = a3;
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setBodyViewThatFitsOverride:(id)a3
{
  id v4 = _Block_copy(a3);
  id bodyViewThatFitsOverride = self->_bodyViewThatFitsOverride;
  self->_id bodyViewThatFitsOverride = v4;

  [(PKExplanationView *)self setNeedsLayout];
}

- (void)setBodyViewContentMode:(unint64_t)a3
{
  if (self->_bodyViewContentMode != a3)
  {
    self->_bodyViewContentMode = a3;
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)setReverseBodyViewAndBodyButtonOrder:(BOOL)a3
{
  if (self->_reverseBodyViewAndBodyButtonOrder != a3)
  {
    self->_reverseBodyViewAndBodyButtonOrder = a3;
    [(PKExplanationView *)self setNeedsLayout];
  }
}

- (void)_continue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained explanationViewDidSelectContinue:self];
  }
}

- (void)_setupLater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained explanationViewDidSelectSetupLater:self];
  }
}

- (void)_bodyButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained explanationViewDidSelectBodyButton:self];
  }
}

- (void)_calculateBlur
{
  scrollView = self->_scrollView;
  [(_PKVisibilityBackdropView *)self->_blurringView bounds];
  -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", self->_blurringView);
  double v5 = v4;
  [(UIScrollView *)self->_scrollView bounds];
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  [(UIScrollView *)self->_scrollView contentSize];
  v18.size.double height = fmin(v13, v14 - v9);
  v18.origin.double x = v7;
  v18.origin.double y = v9;
  v18.size.double width = v11;
  double v15 = fmin(fmax(CGRectGetMaxY(v18) - v5, 0.0), 30.0) / 30.0;
  blurringView = self->_blurringView;

  [(_PKVisibilityBackdropView *)blurringView pkui_setVisibility:0 animated:v15];
}

- (void)setTitleLabelText
{
  v15[3] = *MEMORY[0x1E4F143B8];
  if (self->_titleText)
  {
    titleFont = self->_titleFont;
    if (titleFont)
    {
      double v4 = titleFont;
    }
    else
    {
      PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2928], (void *)*MEMORY[0x1E4FB2788], 2, 0);
      double v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    }
    double v6 = v4;
    id v7 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v7 setAlignment:self->_titleTextAlignment];
    [v7 setLineBreakMode:0];
    [v7 setLineBreakStrategy:self->_titleLineBreakStrategy];
    double titleHyphenationFactor = self->_titleHyphenationFactor;
    *(float *)&double titleHyphenationFactor = titleHyphenationFactor;
    [v7 setHyphenationFactor:titleHyphenationFactor];
    id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
    titleText = self->_titleText;
    uint64_t v11 = *MEMORY[0x1E4FB06F8];
    v14[0] = *MEMORY[0x1E4FB0738];
    v14[1] = v11;
    v15[0] = v7;
    v15[1] = v6;
    v14[2] = *MEMORY[0x1E4FB0700];
    double v12 = [MEMORY[0x1E4FB1618] labelColor];
    v15[2] = v12;
    double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    double v5 = (void *)[v9 initWithString:titleText attributes:v13];
  }
  else
  {
    double v5 = 0;
  }
  [(PKTrailingAccessoryLabel *)self->_titleLabel setAttributedText:v5];
}

- (void)_createSubviews
{
  CGRect v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  [(UIScrollView *)self->_scrollView setDelegate:self];
  double v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  imageView = self->_imageView;
  self->_imageView = v5;

  [(UIImageView *)self->_imageView setContentMode:1];
  [(UIImageView *)self->_imageView setClipsToBounds:1];
  id v7 = objc_alloc_init(PKTrailingAccessoryLabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  [(PKExplanationView *)self setTitleLabelText];
  id v9 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v9;

  [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
  [(UIActivityIndicatorView *)self->_activityIndicator sizeToFit];
  [(UIActivityIndicatorView *)self->_activityIndicator setHidden:1];
  uint64_t v11 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E4F72FB8]);
  checkmarkLayer = self->_checkmarkLayer;
  self->_checkmarkLayer = v11;

  [(LAUICheckmarkLayer *)self->_checkmarkLayer setLineWidthScale:1.4];
  [(LAUICheckmarkLayer *)self->_checkmarkLayer setRevealed:0 animated:0];
  [(PKExplanationView *)self _updateCheckmarkColor];
  if ([(PKExplanationView *)self _isBuddyiPad]) {
    double v13 = @"Payment_SetupLogoBuddyPad";
  }
  else {
    double v13 = @"Payment_SetupLogo";
  }
  double v14 = PKUIImageNamed(v13);
  objc_storeStrong((id *)&self->_titleImage, v14);

  double v15 = [(UIImage *)self->_titleImage imageWithRenderingMode:2];
  titleImage = self->_titleImage;
  self->_titleImage = v15;

  double v17 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:self->_titleImage];
  logoImageView = self->_logoImageView;
  self->_logoImageView = v17;

  double v19 = self->_logoImageView;
  double v20 = [MEMORY[0x1E4FB1618] labelColor];
  [(UIImageView *)v19 setTintColor:v20];

  uint64_t v21 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  bodyImageView = self->_bodyImageView;
  self->_bodyImageView = v21;

  [(UIImageView *)self->_bodyImageView setContentMode:1];
  double v23 = [PKPaymentSetupDockView alloc];
  double v24 = *MEMORY[0x1E4F1DB28];
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v28 = -[PKPaymentSetupDockView initWithFrame:context:](v23, "initWithFrame:context:", self->_context, *MEMORY[0x1E4F1DB28], v25, v26, v27);
  dockView = self->_dockView;
  self->_dockView = v28;

  long long v30 = [(PKPaymentSetupDockView *)self->_dockView primaryButton];
  long long v31 = PKLocalizedPaymentString(&cfstr_Continue.isa);
  [v30 setTitle:v31 forState:0];

  double v32 = [(PKPaymentSetupDockView *)self->_dockView primaryButton];
  [v32 addTarget:self action:sel__continue forControlEvents:0x2000];

  [(PKPaymentSetupDockView *)self->_dockView setPrivacyLink:0];
  int IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  double v34 = self->_dockView;
  if (IsSetupAssistant)
  {
    double v35 = [(PKPaymentSetupDockView *)v34 footerView];
    double v36 = [v35 setupLaterButton];
    [v36 addTarget:self action:sel__setupLater forControlEvents:0x2000];
  }
  else
  {
    [(PKPaymentSetupDockView *)v34 setFooterView:0];
  }
  double v37 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:]([_PKVisibilityBackdropView alloc], "initWithFrame:privateStyle:", -2, v24, v25, v26, v27);
  blurringView = self->_blurringView;
  self->_blurringView = v37;

  [(_PKVisibilityBackdropView *)self->_blurringView setDelegate:self];
  [(_PKVisibilityBackdropView *)self->_blurringView setUserInteractionEnabled:1];
  [(_PKVisibilityBackdropView *)self->_blurringView pkui_setVisibility:0 animated:self->_backdropWeight];
  double v39 = [(_UIBackdropView *)self->_blurringView contentView];
  [v39 addSubview:self->_dockView];

  [(PKExplanationView *)self addSubview:self->_scrollView];
  [(PKExplanationView *)self addSubview:self->_blurringView];
  [(UIScrollView *)self->_scrollView addSubview:self->_imageView];
  if ([(PKExplanationView *)self _showTitleLogoImageView]) {
    p_logoImageView = &self->_logoImageView;
  }
  else {
    p_logoImageView = &self->_titleLabel;
  }
  [(UIScrollView *)self->_scrollView addSubview:*p_logoImageView];

  [(PKExplanationView *)self setTitleAccessoriesEnabled:1];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKExplanationView;
  [(PKExplanationView *)&v3 tintColorDidChange];
  [(PKExplanationView *)self _updateCheckmarkColor];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKExplanationView;
  [(PKExplanationView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKExplanationView *)self _updateCheckmarkColor];
  [(PKExplanationView *)self _updateIconBorderColor];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKExplanationView;
  [(PKExplanationView *)&v4 traitCollectionDidChange:a3];
  self->_cachedPrivacyViewSize = (CGSize)*MEMORY[0x1E4F1DB30];
  [(PKExplanationView *)self setNeedsLayout];
}

- (void)_updateCheckmarkColor
{
  objc_super v3 = [(PKExplanationView *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__PKExplanationView__updateCheckmarkColor__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __42__PKExplanationView__updateCheckmarkColor__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (void *)v1[57];
  id v3 = [v1 tintColor];
  objc_msgSend(v2, "setColor:animated:", objc_msgSend(v3, "CGColor"), 0);
}

- (void)_updateTitleLabel
{
  if (self->_hideTitleText)
  {
    [(UIImageView *)self->_logoImageView removeFromSuperview];
LABEL_6:
    [(PKTrailingAccessoryLabel *)self->_titleLabel removeFromSuperview];
    goto LABEL_7;
  }
  if ([(PKExplanationView *)self _showTitleLogoImageView])
  {
    id v3 = [(UIImageView *)self->_logoImageView superview];

    if (!v3) {
      [(UIScrollView *)self->_scrollView addSubview:self->_logoImageView];
    }
    goto LABEL_6;
  }
  objc_super v4 = [(PKTrailingAccessoryLabel *)self->_titleLabel superview];

  if (!v4) {
    [(UIScrollView *)self->_scrollView addSubview:self->_titleLabel];
  }
  [(UIImageView *)self->_logoImageView removeFromSuperview];
  [(PKExplanationView *)self setTitleLabelText];
LABEL_7:

  [(PKExplanationView *)self setNeedsLayout];
}

- (BOOL)_showTitleLogoImageView
{
  return [(NSString *)self->_titleText length] == 0;
}

- (BOOL)_isBuddyiPad
{
  id v2 = [(PKExplanationView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  BOOL result = PKPaymentSetupContextIsSetupAssistant();
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  return result;
}

- (id)_createBodyTextView
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setDataDetectorTypes:self->_bodyDataDetectorTypes];
  [v3 setDelegate:self];
  objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v3 setEditable:0];
  [v3 setSelectable:1];
  [v3 setScrollingEnabled:0];
  [v3 _setInteractiveTextSelectionDisabled:1];
  uint64_t v8 = *MEMORY[0x1E4FB0700];
  if (PKPaymentSetupContextIsBridge()) {
    BPSBridgeTintColor();
  }
  else {
  objc_super v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  v9[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v3 setLinkTextAttributes:v5];

  double v6 = [(PKExplanationView *)self bodyTextFont];
  [v3 setFont:v6];

  [v3 setTextAlignment:self->_bodyTextAlignment];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];

  return v3;
}

- (double)_resolvedHorizontalMargin
{
  if (self->_horizontalMargin) {
    return 24.0;
  }
  [(PKExplanationView *)self _automaticHorizontalMargin];
  return result;
}

- (double)_automaticHorizontalMargin
{
  if ([(UIView *)self pkui_userInterfaceIdiomSupportsLargeLayouts]) {
    return 44.0;
  }
  uint64_t v3 = PKUIGetMinScreenWidthType();
  double result = 24.0;
  if (!v3) {
    return 16.0;
  }
  return result;
}

- (void)_updateImage
{
  p_imageView = (id *)&self->_imageView;
  [(UIImageView *)self->_imageView setImage:self->_image];
  if (self->_image)
  {
    unint64_t imageStyle = self->_imageStyle;
    if (imageStyle == 1)
    {
      objc_msgSend(*p_imageView, "setFrame:", 0.0, 0.0, 80.0, 80.0);
      [*p_imageView setClipsToBounds:1];
      [*p_imageView _setContinuousCornerRadius:14.0];
      double v6 = [*p_imageView layer];
      [v6 setBorderWidth:0.5];

      [(PKExplanationView *)self _updateIconBorderColor];
    }
    else if (!imageStyle)
    {
      [*p_imageView sizeToFit];
      [*p_imageView setClipsToBounds:0];
      [*p_imageView _setContinuousCornerRadius:0.0];
      double v5 = [*p_imageView layer];
      [v5 setBorderColor:0];
      [v5 setBorderWidth:0.0];
    }
    id v7 = [*p_imageView superview];

    if (!v7) {
      [(UIScrollView *)self->_scrollView addSubview:*p_imageView];
    }
    p_imageView = (id *)&self->_heroView;
  }
  [*p_imageView removeFromSuperview];

  [(PKExplanationView *)self setNeedsLayout];
}

- (void)_updateIconBorderColor
{
  if (self->_imageStyle == 1)
  {
    uint64_t v3 = [(PKExplanationView *)self traitCollection];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __43__PKExplanationView__updateIconBorderColor__block_invoke;
    v4[3] = &unk_1E59CA7D0;
    v4[4] = self;
    PKUIPerformWithEffectiveTraitCollection(v3, v4);
  }
}

void __43__PKExplanationView__updateIconBorderColor__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v3 = [v2 colorWithAlphaComponent:0.13];

  objc_super v4 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  id v5 = v3;
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return PKPaymentSetupContextIsSetupAssistant() ^ 1;
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  id v4 = a4;
  if (PKPaymentSetupForceBridgeAppearance() & 1) != 0 || (PKPaymentSetupContextIsBridge())
  {
    int64_t v5 = 2030;
  }
  else if ([v4 userInterfaceStyle] == 2)
  {
    int64_t v5 = 2030;
  }
  else
  {
    int64_t v5 = 2010;
  }

  return v5;
}

- (PKExplanationViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKExplanationViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showPrivacyView
{
  return self->_showPrivacyView;
}

- (BOOL)forceShowSetupLaterButton
{
  return self->_forceShowSetupLaterButton;
}

- (double)topMargin
{
  return self->_topMargin;
}

- (unint64_t)horizontalMargin
{
  return self->_horizontalMargin;
}

- (double)titleHyphenationFactor
{
  return self->_titleHyphenationFactor;
}

- (double)topLogoPadding
{
  return self->_topLogoPadding;
}

- (void)setTopLogoPadding:(double)a3
{
  self->_topLogoPadding = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (unint64_t)imageStyle
{
  return self->_imageStyle;
}

- (BOOL)imageIgnoresTopSafeArea
{
  return self->_imageIgnoresTopSafeArea;
}

- (void)setImageIgnoresTopSafeArea:(BOOL)a3
{
  self->_imageIgnoresTopSafeArea = a3;
}

- (UIView)heroView
{
  return self->_heroView;
}

- (id)heroViewSizeThatFitsOverride
{
  return self->_heroViewSizeThatFitsOverride;
}

- (unint64_t)heroViewContentMode
{
  return self->_heroViewContentMode;
}

- (BOOL)heroViewPrefersSizeTransform
{
  return self->_heroViewPrefersSizeTransform;
}

- (UIColor)topBackgroundColor
{
  return self->_topBackgroundColor;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (BOOL)hideTitleText
{
  return self->_hideTitleText;
}

- (int64_t)titleTextAlignment
{
  return self->_titleTextAlignment;
}

- (int64_t)titleTextNumberOfLines
{
  return self->_titleTextNumberOfLines;
}

- (unint64_t)titleLineBreakStrategy
{
  return self->_titleLineBreakStrategy;
}

- (UIImage)bodyImage
{
  return self->_bodyImage;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (NSAttributedString)attributedBodyText
{
  return self->_attributedBodyText;
}

- (NSAttributedString)attributedSecondaryBodyText
{
  return self->_attributedSecondaryBodyText;
}

- (NSString)bodyButtonText
{
  return self->_bodyButtonText;
}

- (int64_t)bodyButtonNumberOfLines
{
  return self->_bodyButtonNumberOfLines;
}

- (UIView)bodyView
{
  return self->_bodyView;
}

- (id)bodyViewThatFitsOverride
{
  return self->_bodyViewThatFitsOverride;
}

- (unint64_t)bodyViewContentMode
{
  return self->_bodyViewContentMode;
}

- (BOOL)bodyViewPrefersSizeTransform
{
  return self->_bodyViewPrefersSizeTransform;
}

- (BOOL)reverseBodyViewAndBodyButtonOrder
{
  return self->_reverseBodyViewAndBodyButtonOrder;
}

- (double)bodyViewPadding
{
  return self->_bodyViewPadding;
}

- (int64_t)bodyTextAlignment
{
  return self->_bodyTextAlignment;
}

- (unint64_t)bodyDataDetectorTypes
{
  return self->_bodyDataDetectorTypes;
}

- (OBPrivacyLinkController)privacyLink
{
  return self->_privacyLink;
}

- (PKPaymentSetupDockView)dockView
{
  return self->_dockView;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (BOOL)titleAccessoriesEnabled
{
  return self->_titleAccessoriesEnabled;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (BOOL)showCheckmark
{
  return self->_showCheckmark;
}

- (UIImageView)logoImageView
{
  return self->_logoImageView;
}

- (void)setLogoImageView:(id)a3
{
}

- (CGSize)logoImageViewTargetSize
{
  double width = self->_logoImageViewTargetSize.width;
  double height = self->_logoImageViewTargetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UITextView)bodyTextView
{
  return self->_bodyTextView;
}

- (void)setBodyTextView:(id)a3
{
}

- (double)maxImageHeight
{
  return self->_maxImageHeight;
}

- (void)setMaxImageHeight:(double)a3
{
  self->_double maxImageHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong(&self->_bodyViewThatFitsOverride, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
  objc_storeStrong((id *)&self->_bodyButtonText, 0);
  objc_storeStrong((id *)&self->_attributedSecondaryBodyText, 0);
  objc_storeStrong((id *)&self->_attributedBodyText, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_topBackgroundColor, 0);
  objc_storeStrong(&self->_heroViewSizeThatFitsOverride, 0);
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topBackgroundView, 0);
  objc_storeStrong((id *)&self->_secondaryBodyTextView, 0);
  objc_storeStrong((id *)&self->_bodyButton, 0);
  objc_storeStrong((id *)&self->_bodyImageView, 0);
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_dockView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end