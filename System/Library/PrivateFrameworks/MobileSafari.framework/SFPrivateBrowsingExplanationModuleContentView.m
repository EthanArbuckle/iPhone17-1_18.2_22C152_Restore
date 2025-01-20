@interface SFPrivateBrowsingExplanationModuleContentView
- (BOOL)_hasMessageText;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SFPrivateBrowsingExplanationModuleContentView)initWithBanner:(id)a3;
- (WBSStartPageBanner)banner;
- (double)_preferredHeight;
- (id)_attributedMessage;
- (id)_title;
- (void)_applyMessageTextViewStyle;
- (void)_applyMessageViewLinkTextAttributes;
- (void)_bannerDidChange;
- (void)_dismissModule;
- (void)_setUpDismissButtonIfNeeded;
- (void)_setUpExplanationItemCollectionViewIfNeeded;
- (void)_setUpMessageTextIfNecessary;
- (void)_updateAllowsTitleNextToDismissButton;
- (void)setBanner:(id)a3;
@end

@implementation SFPrivateBrowsingExplanationModuleContentView

- (SFPrivateBrowsingExplanationModuleContentView)initWithBanner:(id)a3
{
  v110[8] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v103.receiver = self;
  v103.super_class = (Class)SFPrivateBrowsingExplanationModuleContentView;
  v6 = -[SFPrivateBrowsingExplanationModuleContentView initWithFrame:](&v103, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    id v101 = v5;
    objc_storeStrong((id *)&v6->_banner, a3);
    -[SFPrivateBrowsingExplanationModuleContentView setLayoutMargins:](v7, "setLayoutMargins:", 30.0, 30.0, 30.0, 30.0);
    v100 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2988] weight:*MEMORY[0x1E4FB09E0]];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1930], "sf_startPageBannerTitleLabelWithFont:");
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v8;

    [(UILabel *)v7->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFPrivateBrowsingExplanationModuleContentView *)v7 addSubview:v7->_titleLabel];
    [(SFPrivateBrowsingExplanationModuleContentView *)v7 _setUpMessageTextIfNecessary];
    [(SFPrivateBrowsingExplanationModuleContentView *)v7 _setUpExplanationItemCollectionViewIfNeeded];
    [(SFPrivateBrowsingExplanationModuleContentView *)v7 _setUpDismissButtonIfNeeded];
    LODWORD(v10) = 1132068864;
    [(UILabel *)v7->_titleLabel setContentCompressionResistancePriority:0 forAxis:v10];
    v11 = [(UICollectionView *)v7->_explanationItemCollectionView bottomAnchor];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      v14 = [(UITextView *)v7->_messageTextView bottomAnchor];
      v15 = v14;
      if (v14)
      {
        id v16 = v14;
      }
      else
      {
        id v16 = [(UILabel *)v7->_titleLabel bottomAnchor];
      }
      id v13 = v16;
    }
    v17 = [(SFPrivateBrowsingExplanationModuleContentView *)v7 readableContentGuide];
    v78 = (void *)MEMORY[0x1E4F28DC8];
    v96 = [(UILabel *)v7->_titleLabel leadingAnchor];
    v92 = [v17 leadingAnchor];
    v89 = [v96 constraintGreaterThanOrEqualToAnchor:v92];
    v110[0] = v89;
    v87 = [(UILabel *)v7->_titleLabel topAnchor];
    v85 = [v17 topAnchor];
    v83 = [v87 constraintGreaterThanOrEqualToAnchor:v85];
    v110[1] = v83;
    v82 = [(UILabel *)v7->_titleLabel topAnchor];
    v81 = [v17 topAnchor];
    v80 = [v82 constraintEqualToAnchor:v81];
    LODWORD(v18) = 1132134400;
    v79 = objc_msgSend(v80, "sf_withPriority:", v18);
    v110[2] = v79;
    v77 = [v17 trailingAnchor];
    v76 = [(UILabel *)v7->_titleLabel trailingAnchor];
    v75 = [v77 constraintGreaterThanOrEqualToAnchor:v76];
    v110[3] = v75;
    v74 = [(UILabel *)v7->_titleLabel centerXAnchor];
    v73 = [(SFPrivateBrowsingExplanationModuleContentView *)v7 centerXAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v110[4] = v72;
    v19 = [(UILabel *)v7->_titleLabel widthAnchor];
    v20 = [v17 widthAnchor];
    v21 = [v19 constraintLessThanOrEqualToAnchor:v20];
    v110[5] = v21;
    v22 = [v17 bottomAnchor];
    v23 = [v22 constraintGreaterThanOrEqualToAnchor:v13];
    v110[6] = v23;
    v102 = v17;
    v24 = [v17 bottomAnchor];
    v99 = v13;
    v25 = [v24 constraintEqualToAnchor:v13];
    LODWORD(v26) = 1132068864;
    v27 = objc_msgSend(v25, "sf_withPriority:", v26);
    v110[7] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:8];
    [v78 activateConstraints:v28];

    messageTextView = v7->_messageTextView;
    if (messageTextView)
    {
      v84 = (void *)MEMORY[0x1E4F28DC8];
      v97 = [(UITextView *)messageTextView firstBaselineAnchor];
      v93 = [(UILabel *)v7->_titleLabel lastBaselineAnchor];
      v90 = [v97 constraintEqualToSystemSpacingBelowAnchor:v93 multiplier:1.0];
      v109[0] = v90;
      v88 = [(UITextView *)v7->_messageTextView leadingAnchor];
      v86 = [v102 leadingAnchor];
      v30 = [v88 constraintGreaterThanOrEqualToAnchor:v86];
      v109[1] = v30;
      v31 = [v102 trailingAnchor];
      v32 = [(UITextView *)v7->_messageTextView trailingAnchor];
      v33 = [v31 constraintGreaterThanOrEqualToAnchor:v32];
      v109[2] = v33;
      v34 = [(UITextView *)v7->_messageTextView centerXAnchor];
      v35 = [(SFPrivateBrowsingExplanationModuleContentView *)v7 centerXAnchor];
      v36 = [v34 constraintEqualToAnchor:v35];
      v109[3] = v36;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:4];
      [v84 activateConstraints:v37];
    }
    dismissButton = v7->_dismissButton;
    if (dismissButton)
    {
      v94 = (void *)MEMORY[0x1E4F28DC8];
      v39 = [(UIButton *)dismissButton leadingAnchor];
      v40 = [(SFPrivateBrowsingExplanationModuleContentView *)v7 leadingAnchor];
      v41 = [v39 constraintEqualToAnchor:v40 constant:10.0];
      v108[0] = v41;
      v42 = [(UIButton *)v7->_dismissButton topAnchor];
      v43 = [(SFPrivateBrowsingExplanationModuleContentView *)v7 topAnchor];
      v44 = [v42 constraintEqualToAnchor:v43 constant:10.0];
      v108[1] = v44;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:2];
      [v94 activateConstraints:v45];

      v46 = [(UILabel *)v7->_titleLabel topAnchor];
      v47 = [(UIButton *)v7->_dismissButton bottomAnchor];
      v48 = [v46 constraintEqualToAnchor:v47];
      v107 = v48;
      uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
      constraintsForTitleBelowDismissButton = v7->_constraintsForTitleBelowDismissButton;
      v7->_constraintsForTitleBelowDismissButton = (NSArray *)v49;

      v51 = [(UILabel *)v7->_titleLabel leadingAnchor];
      v52 = [(UIButton *)v7->_dismissButton trailingAnchor];
      v53 = [v51 constraintGreaterThanOrEqualToAnchor:v52];
      v106 = v53;
      uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
      constraintsForTitleNextToDismissButton = v7->_constraintsForTitleNextToDismissButton;
      v7->_constraintsForTitleNextToDismissButton = (NSArray *)v54;

      [(SFPrivateBrowsingExplanationModuleContentView *)v7 _updateAllowsTitleNextToDismissButton];
    }
    explanationItemCollectionView = v7->_explanationItemCollectionView;
    if (explanationItemCollectionView)
    {
      v91 = (void *)MEMORY[0x1E4F28DC8];
      v57 = [(UICollectionView *)explanationItemCollectionView leadingAnchor];
      v95 = [v102 leadingAnchor];
      v98 = v57;
      v58 = objc_msgSend(v57, "constraintEqualToAnchor:");
      v105[0] = v58;
      v59 = [(UICollectionView *)v7->_explanationItemCollectionView topAnchor];
      v60 = [(UITextView *)v7->_messageTextView lastBaselineAnchor];
      v61 = v60;
      if (!v60)
      {
        v61 = [(UILabel *)v7->_titleLabel lastBaselineAnchor];
      }
      v62 = [v59 constraintEqualToAnchor:v61 constant:20.0];
      v105[1] = v62;
      v63 = [v102 trailingAnchor];
      v64 = [(UICollectionView *)v7->_explanationItemCollectionView trailingAnchor];
      v65 = [v63 constraintEqualToAnchor:v64];
      v105[2] = v65;
      v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:3];
      [v91 activateConstraints:v66];

      if (!v60) {
    }
      }
    [(SFPrivateBrowsingExplanationModuleContentView *)v7 _bannerDidChange];
    v67 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v67 addObserver:v7 selector:sel__applyMessageViewLinkTextAttributes name:*MEMORY[0x1E4FB2428] object:0];

    v104[0] = objc_opt_class();
    v104[1] = objc_opt_class();
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
    id v69 = (id)[(SFPrivateBrowsingExplanationModuleContentView *)v7 registerForTraitChanges:v68 withTarget:v7 action:sel__updateAllowsTitleNextToDismissButton];

    v70 = v7;
    id v5 = v101;
  }

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(SFPrivateBrowsingExplanationModuleContentView *)self bounds];
  CGFloat Width = CGRectGetWidth(v9);
  [(SFPrivateBrowsingExplanationModuleContentView *)self _preferredHeight];
  double v6 = v5;
  double v7 = Width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)_preferredHeight
{
  [(SFPrivateBrowsingExplanationModuleContentView *)self bounds];
  -[SFPrivateBrowsingExplanationModuleContentView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", CGRectGetWidth(v7), *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v4 = v3;
  [(UICollectionView *)self->_explanationItemCollectionView contentSize];
  return v4 + v5;
}

- (void)setBanner:(id)a3
{
  id v8 = a3;
  double v5 = [(WBSStartPageBanner *)self->_banner privateBrowsingExplanationItems];
  double v6 = [v8 privateBrowsingExplanationItems];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_banner, a3);
    [(SFPrivateBrowsingExplanationModuleContentView *)self _bannerDidChange];
  }
}

- (void)_bannerDidChange
{
  double v3 = [(SFPrivateBrowsingExplanationModuleContentView *)self _title];
  [(UILabel *)self->_titleLabel setText:v3];

  if ([(SFPrivateBrowsingExplanationModuleContentView *)self _hasMessageText])
  {
    double v4 = [(SFPrivateBrowsingExplanationModuleContentView *)self _attributedMessage];
    [(UITextView *)self->_messageTextView setAttributedText:v4];

    [(SFPrivateBrowsingExplanationModuleContentView *)self _applyMessageTextViewStyle];
  }
  if (self->_explanationItemCollectionView)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1360]);
    [v8 appendSectionsWithIdentifiers:&unk_1EDA42748];
    double v5 = [(WBSStartPageBanner *)self->_banner privateBrowsingExplanationItems];
    [v8 appendItemsWithIdentifiers:v5];

    double v6 = [(UICollectionView *)self->_explanationItemCollectionView indexPathsForVisibleItems];
    BOOL v7 = [v6 count] != 0;

    [(UICollectionViewDiffableDataSource *)self->_explanationItemCollectionViewDataSource applySnapshot:v8 animatingDifferences:v7];
  }
}

- (id)_title
{
  v2 = (void *)[(WBSStartPageBanner *)self->_banner privateBrowsingExplanationState];
  if ((unint64_t)v2 <= 1)
  {
    v2 = _WBSLocalizedString();
  }

  return v2;
}

- (void)_setUpMessageTextIfNecessary
{
  if ([(SFPrivateBrowsingExplanationModuleContentView *)self _hasMessageText])
  {
    double v3 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    messageTextView = self->_messageTextView;
    self->_messageTextView = v3;

    [(UITextView *)self->_messageTextView setAdjustsFontForContentSizeCategory:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__SFPrivateBrowsingExplanationModuleContentView__setUpMessageTextIfNecessary__block_invoke;
    v6[3] = &unk_1E54E9858;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
    [(UITextView *)self->_messageTextView setDelegate:self];
    [(UITextView *)self->_messageTextView setEditable:0];
    [(UITextView *)self->_messageTextView _setInteractiveTextSelectionDisabled:1];
    [(UITextView *)self->_messageTextView setScrollEnabled:0];
    double v5 = [(UITextView *)self->_messageTextView textContainer];
    [v5 setLineFragmentPadding:0.0];

    -[UITextView setTextContainerInset:](self->_messageTextView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(UITextView *)self->_messageTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFPrivateBrowsingExplanationModuleContentView *)self _applyMessageViewLinkTextAttributes];
    [(SFPrivateBrowsingExplanationModuleContentView *)self addSubview:self->_messageTextView];
  }
}

uint64_t __77__SFPrivateBrowsingExplanationModuleContentView__setUpMessageTextIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) setBackgroundColor:0];
}

- (BOOL)_hasMessageText
{
  return [(WBSStartPageBanner *)self->_banner privateBrowsingExplanationState] == 1;
}

- (id)_attributedMessage
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(SFPrivateBrowsingExplanationModuleContentView *)self _hasMessageText])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v2 setParagraphSpacing:8.0];
    double v3 = _WBSLocalizedString();
    v12[0] = v3;
    double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

    id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
    double v6 = [v4 componentsJoinedByString:@"\n"];
    uint64_t v10 = *MEMORY[0x1E4FB0738];
    id v11 = v2;
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v8 = (void *)[v5 initWithString:v6 attributes:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_applyMessageViewLinkTextAttributes
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  double v4 = [MEMORY[0x1E4FB1618] labelColor];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  double v6 = [v3 dictionaryWithDictionary:v5];

  if (UIAccessibilityButtonShapesEnabled()) {
    [v6 setObject:&unk_1EDA421B0 forKeyedSubscript:*MEMORY[0x1E4FB0808]];
  }
  [(UITextView *)self->_messageTextView setLinkTextAttributes:v6];
}

- (void)_applyMessageTextViewStyle
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(UITextView *)self->_messageTextView setFont:v3];

  [(UITextView *)self->_messageTextView setTextAlignment:1];
  double v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UITextView *)self->_messageTextView setTextColor:v4];

  uint64_t v7 = *MEMORY[0x1E4FB0700];
  id v5 = [MEMORY[0x1E4FB1618] linkColor];
  v8[0] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(UITextView *)self->_messageTextView setLinkTextAttributes:v6];
}

- (void)_setUpDismissButtonIfNeeded
{
  if (![(WBSStartPageBanner *)self->_banner privateBrowsingExplanationState])
  {
    objc_initWeak(&location, self);
    double v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v3 setButtonSize:3];
    objc_msgSend(v3, "setContentInsets:", 10.0, 5.0, 10.0, 5.0);
    double v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill"];
    [v3 setImage:v4];

    id v5 = [MEMORY[0x1E4FB1830] configurationWithWeight:9];
    [v3 setPreferredSymbolConfigurationForImage:v5];

    double v6 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __76__SFPrivateBrowsingExplanationModuleContentView__setUpDismissButtonIfNeeded__block_invoke;
    v14 = &unk_1E54EA728;
    objc_copyWeak(&v15, &location);
    uint64_t v7 = [v6 actionWithHandler:&v11];
    objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v3, v7, v11, v12, v13, v14);
    id v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
    dismissButton = self->_dismissButton;
    self->_dismissButton = v8;

    [(UIButton *)self->_dismissButton setPointerStyleProvider:&__block_literal_global_8];
    [(UIButton *)self->_dismissButton setTintAdjustmentMode:1];
    uint64_t v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIButton *)self->_dismissButton setTintColor:v10];

    [(UIButton *)self->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UIButton _setTouchInsets:](self->_dismissButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    [(SFPrivateBrowsingExplanationModuleContentView *)self addSubview:self->_dismissButton];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __76__SFPrivateBrowsingExplanationModuleContentView__setUpDismissButtonIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissModule];
}

id __76__SFPrivateBrowsingExplanationModuleContentView__setUpDismissButtonIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if (UIAccessibilityButtonShapesEnabled())
  {
    CGRect v9 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v7 shape:v8];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FB1AD0];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v6];
    uint64_t v12 = [v10 effectWithPreview:v11];

    id v13 = (void *)MEMORY[0x1E4FB1AE0];
    v14 = (void *)MEMORY[0x1E4FB14C0];
    id v15 = [v6 imageView];
    [v15 frame];
    id v16 = objc_msgSend(v14, "bezierPathWithOvalInRect:");
    v17 = [v13 shapeWithPath:v16];

    CGRect v9 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v12 shape:v17];
  }

  return v9;
}

- (void)_updateAllowsTitleNextToDismissButton
{
  if (self->_dismissButton)
  {
    id v8 = [(SFPrivateBrowsingExplanationModuleContentView *)self traitCollection];
    double v3 = &OBJC_IVAR___SFPrivateBrowsingExplanationModuleContentView__constraintsForTitleNextToDismissButton;
    double v4 = &OBJC_IVAR___SFPrivateBrowsingExplanationModuleContentView__constraintsForTitleBelowDismissButton;
    if ([v8 horizontalSizeClass] == 1)
    {
      id v5 = [v8 preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

      if (IsAccessibilityCategory) {
        id v7 = &OBJC_IVAR___SFPrivateBrowsingExplanationModuleContentView__constraintsForTitleNextToDismissButton;
      }
      else {
        id v7 = &OBJC_IVAR___SFPrivateBrowsingExplanationModuleContentView__constraintsForTitleBelowDismissButton;
      }
      if (IsAccessibilityCategory) {
        double v3 = &OBJC_IVAR___SFPrivateBrowsingExplanationModuleContentView__constraintsForTitleBelowDismissButton;
      }
      double v4 = v7;
    }
    [MEMORY[0x1E4F28DC8] deactivateConstraints:*(Class *)((char *)&self->super.super.super.isa + *v4)];
    [MEMORY[0x1E4F28DC8] activateConstraints:*(Class *)((char *)&self->super.super.super.isa + *v3)];
  }
}

- (void)_dismissModule
{
  id v2 = [(WBSStartPageBanner *)self->_banner privateBrowsingExplanationDismissHandler];
  if (v2)
  {
    double v3 = v2;
    v2[2]();
    id v2 = v3;
  }
}

- (void)_setUpExplanationItemCollectionViewIfNeeded
{
  if (![(WBSStartPageBanner *)self->_banner privateBrowsingExplanationState])
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1568]);
    [(SFPrivateBrowsingExplanationModuleContentView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSectionProvider:&__block_literal_global_235];
    id v13 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v12, v5, v7, v9, v11);
    explanationItemCollectionView = self->_explanationItemCollectionView;
    self->_explanationItemCollectionView = v13;

    [(UICollectionView *)self->_explanationItemCollectionView setAllowsSelection:0];
    [(UICollectionView *)self->_explanationItemCollectionView setClipsToBounds:0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __92__SFPrivateBrowsingExplanationModuleContentView__setUpExplanationItemCollectionViewIfNeeded__block_invoke;
    v23[3] = &unk_1E54E9858;
    v23[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v23];
    [(UICollectionView *)self->_explanationItemCollectionView setScrollEnabled:0];
    [(UICollectionView *)self->_explanationItemCollectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFPrivateBrowsingExplanationModuleContentView *)self addSubview:self->_explanationItemCollectionView];
    id v15 = [MEMORY[0x1E4FB1578] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_79];
    id v16 = objc_alloc(MEMORY[0x1E4FB1598]);
    v17 = self->_explanationItemCollectionView;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __92__SFPrivateBrowsingExplanationModuleContentView__setUpExplanationItemCollectionViewIfNeeded__block_invoke_3;
    v21[3] = &unk_1E54EA790;
    id v22 = v15;
    id v18 = v15;
    v19 = (UICollectionViewDiffableDataSource *)[v16 initWithCollectionView:v17 cellProvider:v21];
    explanationItemCollectionViewDataSource = self->_explanationItemCollectionViewDataSource;
    self->_explanationItemCollectionViewDataSource = v19;
  }
}

uint64_t __92__SFPrivateBrowsingExplanationModuleContentView__setUpExplanationItemCollectionViewIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setBackgroundColor:0];
}

uint64_t __92__SFPrivateBrowsingExplanationModuleContentView__setUpExplanationItemCollectionViewIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 setItem:a4];
}

uint64_t __92__SFPrivateBrowsingExplanationModuleContentView__setUpExplanationItemCollectionViewIfNeeded__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

- (WBSStartPageBanner)banner
{
  return self->_banner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
  objc_storeStrong((id *)&self->_explanationItemCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_explanationItemCollectionView, 0);
  objc_storeStrong((id *)&self->_constraintsForTitleNextToDismissButton, 0);
  objc_storeStrong((id *)&self->_constraintsForTitleBelowDismissButton, 0);

  objc_storeStrong((id *)&self->_banner, 0);
}

@end