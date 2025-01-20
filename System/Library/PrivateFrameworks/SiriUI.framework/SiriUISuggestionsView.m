@interface SiriUISuggestionsView
- (BOOL)_isPadHeightType;
- (BOOL)_isPortrait;
- (BOOL)isGuideHidden;
- (BOOL)isShowingSuggestions;
- (CGPoint)contentOffset;
- (SiriUISuggestionsHeaderText)headerText;
- (SiriUISuggestionsHeaderText)largeSubheaderText;
- (SiriUISuggestionsHeaderText)subheaderText;
- (SiriUISuggestionsView)initWithFrame:(CGRect)a3;
- (SiriUISuggestionsViewDelegate)delegate;
- (UIColor)textColor;
- (UIView)guideView;
- (double)_headerToLargeSubheaderOffset;
- (double)_headerToSubheaderOffset;
- (double)_suggestionFontSize;
- (double)_suggestionSpacing;
- (double)_updateSuggestionsDelay;
- (id)_createSpringAnimation:(double)a3;
- (int)_heightType;
- (int64_t)orientation;
- (unint64_t)_numberOfSuggestionsToDisplay;
- (void)_animateHeaderIn;
- (void)_animateHeaderOut;
- (void)_animateInSuggestionAtIndex:(unint64_t)a3;
- (void)_animateOutSuggestionAtIndex:(unint64_t)a3;
- (void)_loadLargeSubheaderViewIfNeeded;
- (void)_loadSubheaderViewIfNeeded;
- (void)_loadSuggestionsViewsIfNeeded;
- (void)_reallyShowAcousticIDSpinner;
- (void)_setHeaderText:(id)a3;
- (void)_setLargeSubheaderText:(id)a3;
- (void)_setSubheaderText:(id)a3;
- (void)_setSuggestionTexts:(id)a3;
- (void)_updateSuggestions;
- (void)acousticIDSpinnerDidHide:(id)a3;
- (void)animateOutWithCompletion:(id)a3;
- (void)clearCurrentSuggestions;
- (void)hideAcousticIDSpinner;
- (void)layoutSubviews;
- (void)setContentOffset:(CGPoint)a3;
- (void)setDelegate:(id)a3;
- (void)setGuideHidden:(BOOL)a3;
- (void)setGuideHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setGuideView:(id)a3;
- (void)setHeaderText:(id)a3;
- (void)setLargeSubheaderText:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setSubheaderText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)showAcousticIDSpinner;
- (void)startSuggesting;
- (void)stopSuggesting;
@end

@implementation SiriUISuggestionsView

- (SiriUISuggestionsView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SiriUISuggestionsView;
  v3 = -[SiriUISuggestionsView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SiriUISuggestionsView *)v3 setUserInteractionEnabled:0];
    v4->_firstSuggestionPresentation = 1;
    v5 = objc_msgSend(MEMORY[0x263F1C658], "siriui_dynamicTitle0Font");
    id v6 = objc_alloc(MEMORY[0x263F1CB60]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v7;

    [(SiriUISuggestionsView *)v4 addSubview:v4->_contentView];
    uint64_t v9 = [MEMORY[0x263F74480] label];
    headerLabel = v4->_headerLabel;
    v4->_headerLabel = (UILabel *)v9;

    v11 = v4->_headerLabel;
    v12 = objc_msgSend(MEMORY[0x263F1C550], "siriui_lightTextColor");
    [(UILabel *)v11 setTextColor:v12];

    [(UILabel *)v4->_headerLabel setFont:v5];
    [(UILabel *)v4->_headerLabel setNumberOfLines:0];
    [(UIView *)v4->_contentView addSubview:v4->_headerLabel];
    [(UILabel *)v4->_headerLabel setAlpha:0.0];
    uint64_t v13 = [MEMORY[0x263F74480] label];
    oldHeaderLabel = v4->_oldHeaderLabel;
    v4->_oldHeaderLabel = (UILabel *)v13;

    v15 = v4->_oldHeaderLabel;
    v16 = objc_msgSend(MEMORY[0x263F1C550], "siriui_lightTextColor");
    [(UILabel *)v15 setTextColor:v16];

    [(UILabel *)v4->_oldHeaderLabel setFont:v5];
    [(UILabel *)v4->_oldHeaderLabel setNumberOfLines:0];
    [(UIView *)v4->_contentView addSubview:v4->_oldHeaderLabel];
    [(UILabel *)v4->_oldHeaderLabel setAlpha:0.0];
    v17 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    pendedSuggestions = v4->_pendedSuggestions;
    v4->_pendedSuggestions = v17;

    v4->_orientation = 0;
    [(SiriUISuggestionsView *)v4 setOrientation:1];
    *(_OWORD *)&v4->_edgeInsets.top = kSuggestionsViewDirectionalLayoutMargins;
    *(_OWORD *)&v4->_edgeInsets.bottom = unk_22323E828;
  }
  return v4;
}

- (void)_loadSubheaderViewIfNeeded
{
  if (!self->_subheaderLabel)
  {
    v3 = [MEMORY[0x263F74480] label];
    subheaderLabel = self->_subheaderLabel;
    self->_subheaderLabel = v3;

    v5 = self->_subheaderLabel;
    id v6 = objc_msgSend(MEMORY[0x263F1C550], "siriui_lightTextColor");
    [(UILabel *)v5 setTextColor:v6];

    uint64_t v7 = self->_subheaderLabel;
    v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
    [(UILabel *)v7 setFont:v8];

    [(UILabel *)self->_subheaderLabel setNumberOfLines:0];
    [(UIView *)self->_contentView addSubview:self->_subheaderLabel];
    [(UILabel *)self->_subheaderLabel setAlpha:0.0];
    [(SiriUISuggestionsView *)self setNeedsLayout];
  }
}

- (void)_loadLargeSubheaderViewIfNeeded
{
  if (!self->_largeSubheaderLabel)
  {
    v3 = [MEMORY[0x263F74480] label];
    largeSubheaderLabel = self->_largeSubheaderLabel;
    self->_largeSubheaderLabel = v3;

    v5 = self->_largeSubheaderLabel;
    id v6 = objc_msgSend(MEMORY[0x263F1C550], "siriui_lightTextColor");
    [(UILabel *)v5 setTextColor:v6];

    uint64_t v7 = self->_largeSubheaderLabel;
    v8 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
    [(UILabel *)v7 setFont:v8];

    [(UILabel *)self->_largeSubheaderLabel setNumberOfLines:3];
    [(UIView *)self->_contentView addSubview:self->_largeSubheaderLabel];
    [(UILabel *)self->_largeSubheaderLabel setAlpha:0.0];
    [(SiriUISuggestionsView *)self setNeedsLayout];
  }
}

- (void)_loadSuggestionsViewsIfNeeded
{
  if (!self->_suggestionLabels || !self->_oldSuggestionLabels)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__SiriUISuggestionsView__loadSuggestionsViewsIfNeeded__block_invoke;
    v8[3] = &unk_26469F7B8;
    v8[4] = self;
    v3 = (void (**)(void))MEMORY[0x223CB13F0](v8, a2);
    v3[2]();
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    suggestionLabels = self->_suggestionLabels;
    self->_suggestionLabels = v4;

    ((void (*)(void (**)(void)))v3[2])(v3);
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    oldSuggestionLabels = self->_oldSuggestionLabels;
    self->_oldSuggestionLabels = v6;

    [(SiriUISuggestionsView *)self setNeedsLayout];
  }
}

id __54__SiriUISuggestionsView__loadSuggestionsViewsIfNeeded__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF980] array];
  if (*(void *)(*(void *)(a1 + 32) + 496))
  {
    unint64_t v3 = 0;
    double v4 = *MEMORY[0x263F001A8];
    double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x263F74480]), "initWithFrame:", v4, v5, v6, v7);
      uint64_t v9 = objc_msgSend(MEMORY[0x263F1C550], "siriui_lightTextColor");
      [v8 setTextColor:v9];

      v10 = (void *)MEMORY[0x263F1C658];
      [*(id *)(a1 + 32) _suggestionFontSize];
      v11 = objc_msgSend(v10, "siriui_thinWeightFontWithSize:");
      [v8 setFont:v11];

      uint64_t v12 = *(void *)(a1 + 32);
      if (*(void *)(v12 + 568))
      {
        objc_msgSend(v8, "setTextColor:");
        uint64_t v12 = *(void *)(a1 + 32);
      }
      [*(id *)(v12 + 408) addSubview:v8];
      [v8 setAlpha:0.0];
      [v2 addObject:v8];

      ++v3;
    }
    while (v3 < *(void *)(*(void *)(a1 + 32) + 496));
  }
  return v2;
}

- (void)layoutSubviews
{
  uint64_t v132 = *MEMORY[0x263EF8340];
  [(UIView *)self recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
  v129.receiver = self;
  v129.super_class = (Class)SiriUISuggestionsView;
  [(SiriUISuggestionsView *)&v129 layoutSubviews];
  [(SiriUISuggestionsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SiriUISuggestionsView *)self frame];
  double v12 = v11;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 contentWidthForSuggestionsView:self];
    double v12 = v16;
  }
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  [(UIView *)self->_contentView frame];
  double v117 = v17;
  double v18 = v12 - (self->_edgeInsets.leading + self->_edgeInsets.trailing);
  id v19 = objc_loadWeakRetained((id *)&self->_delegate);
  char v20 = objc_opt_respondsToSelector();

  double v21 = 0.0;
  if (v20)
  {
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    [v22 statusBarHeightForSuggestionsView:self];
    double v21 = v23;
  }
  v133.origin.x = v4;
  v133.origin.y = v6;
  CGFloat rect = v8;
  v133.size.width = v8;
  v133.size.height = v10;
  double v24 = CGRectGetWidth(v133) - v18;
  v25 = [(SiriUISuggestionsHeaderText *)self->_headerText attributedStringForMainScreenTraitCollection];
  [(SiriUISuggestionsView *)self _setHeaderText:v25];

  double v116 = v21;
  if (SiriUIIsCompactWidth() || SiriUIIsCompactHeight())
  {
    if (SiriUIIsCompactWidth())
    {
      double v26 = 122.0 - v21;
      goto LABEL_12;
    }
    double v27 = v117 + v21;
    v28 = &SiriUIDefaultHeaderRegularPhoneLeadingRatio;
  }
  else
  {
    double v27 = v117 + v21;
    v28 = &SiriUIDefaultHeaderPadScreenLeadingRatio;
  }
  double v26 = -(v21 - v27 * *(double *)v28);
LABEL_12:
  double v29 = v24 * 0.5;
  id v30 = objc_loadWeakRetained((id *)&self->_delegate);
  char v31 = objc_opt_respondsToSelector();

  if ((v31 & 1) != 0
    && (id v32 = objc_loadWeakRetained((id *)&self->_delegate),
        int v33 = [v32 suggestionsViewIsInTextInputMode:self],
        v32,
        v33)
    && !SiriUIIsCompactWidth())
  {
    -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", 506.0, v117);
    double v41 = v112;
    double v39 = v113;
    v137.origin.x = v4;
    v137.origin.y = v6;
    v137.size.width = rect;
    v137.size.height = v10;
    double v37 = v117;
    double v40 = (CGRectGetWidth(v137) + -506.0) * 0.5;
    v34 = [(UILabel *)self->_headerLabel font];
    [v34 ascender];
    double v36 = v114;
  }
  else
  {
    v34 = [(UILabel *)self->_headerLabel font];
    [v34 ascender];
    double v36 = v35;
    double v37 = v117;
    -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v18, v117);
    double v39 = v38;
    double v40 = v24 * 0.5;
    double v41 = v18;
  }

  double v42 = v26 - v36;
  -[UILabel setFrame:](self->_headerLabel, "setFrame:", v40, v42, v41, v39);
  if (self->_subheaderLabel)
  {
    v43 = [(SiriUISuggestionsHeaderText *)self->_subheaderText attributedStringForMainScreenTraitCollection];
    [(SiriUISuggestionsView *)self _setSubheaderText:v43];

    -[UILabel sizeThatFits:](self->_subheaderLabel, "sizeThatFits:", v18, v37);
    double v45 = v44;
    v134.origin.x = v40;
    v134.origin.y = v42;
    v134.size.width = v41;
    v134.size.height = v39;
    double MaxY = CGRectGetMaxY(v134);
    [(SiriUISuggestionsView *)self _headerToSubheaderOffset];
    double v48 = MaxY + v47;
    double v37 = v117;
    -[UILabel setFrame:](self->_subheaderLabel, "setFrame:", v29, v48 + 0.0, v18, v45);
  }
  if (self->_largeSubheaderLabel)
  {
    v49 = [(SiriUISuggestionsHeaderText *)self->_subheaderText attributedStringForMainScreenTraitCollection];
    [(SiriUISuggestionsView *)self _setSubheaderText:v49];

    -[UILabel sizeThatFits:](self->_largeSubheaderLabel, "sizeThatFits:", v18, v37);
    double v51 = v50;
    v135.origin.x = v40;
    v135.origin.y = v42;
    v135.size.width = v41;
    v135.size.height = v39;
    double v52 = CGRectGetMaxY(v135);
    [(SiriUISuggestionsView *)self _headerToLargeSubheaderOffset];
    -[UILabel setFrame:](self->_largeSubheaderLabel, "setFrame:", v29, v52 + v53 + 0.0, v18, v51);
  }
  v54 = [(SiriUIAcousticIDSpinner *)self->_acousticIDSpinner superview];

  if (v54 == self)
  {
    -[SiriUIAcousticIDSpinner sizeThatFits:](self->_acousticIDSpinner, "sizeThatFits:", v18, v37);
    v55 = [MEMORY[0x263F1C920] mainScreen];
    [v55 scale];

    [(UIView *)self->_contentView bounds];
    UIRectCenteredXInRectScale();
    [(SiriUIAcousticIDSpinner *)self->_acousticIDSpinner setFrame:0];
  }
  v56 = [MEMORY[0x263F1C920] mainScreen];
  [v56 scale];
  double v57 = floor((v37 + v116) * 0.25);
  if (v58 >= 2.0) {
    double v59 = (v37 + v116) * 0.25;
  }
  else {
    double v59 = v57;
  }

  id v60 = objc_loadWeakRetained((id *)&self->_delegate);
  char v61 = objc_opt_respondsToSelector();

  if (v61)
  {
    id v62 = objc_loadWeakRetained((id *)&self->_delegate);
    [v62 statusViewHeightForSuggestionsView:self];
    double v64 = v63;

    double v37 = v37 - v64;
  }
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  v65 = self->_suggestionLabels;
  uint64_t v66 = [(NSArray *)v65 countByEnumeratingWithState:&v125 objects:v131 count:16];
  double v118 = v37;
  double v115 = v59;
  if (!v66)
  {
    double v69 = 0.0;
    goto LABEL_45;
  }
  uint64_t v67 = v66;
  uint64_t v68 = *(void *)v126;
  double v119 = v37 - v59;
  double v69 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v67; ++i)
    {
      if (*(void *)v126 != v68) {
        objc_enumerationMutation(v65);
      }
      v71 = *(void **)(*((void *)&v125 + 1) + 8 * i);
      [(SiriUISuggestionsView *)self _suggestionSpacing];
      [v71 setNumberOfLines:1];
      v72 = (void *)MEMORY[0x263F1C658];
      [(SiriUISuggestionsView *)self _suggestionFontSize];
      v73 = objc_msgSend(v72, "siriui_thinWeightFontWithSize:");
      [v71 setFont:v73];

      objc_msgSend(v71, "sizeThatFits:", v18, 1.79769313e308);
      if (v74 > v18)
      {
        double v76 = v75;
        [v71 setNumberOfLines:5];
        objc_msgSend(v71, "sizeThatFits:", v18, 1.79769313e308);
        double v74 = v77 - v76;
      }
      [(UIView *)self->_contentView bounds];
      UIRectCenteredXInRectScale();
      double v79 = v78;
      double v81 = v80;
      double v83 = v82;
      double v85 = v84;
      double v86 = v69 + v84;
      if (v69 + v84 > v119)
      {
        objc_msgSend(v71, "setHidden:", 1, 0);
        v87 = [v71 text];

        if (!v87) {
          goto LABEL_41;
        }
        pendedSuggestions = self->_pendedSuggestions;
        v89 = [v71 text];
        [(NSMutableOrderedSet *)pendedSuggestions addObject:v89];
        goto LABEL_39;
      }
      v90 = objc_msgSend(v71, "text", 0);

      if (v90)
      {
        v91 = self->_pendedSuggestions;
        v89 = [v71 text];
        [(NSMutableOrderedSet *)v91 removeObject:v89];
        double v69 = v86;
LABEL_39:

        goto LABEL_41;
      }
      double v69 = v86;
LABEL_41:
      objc_msgSend(v71, "setFrame:", v79, v81, v83, v85);
    }
    uint64_t v67 = [(NSArray *)v65 countByEnumeratingWithState:&v125 objects:v131 count:16];
  }
  while (v67);
LABEL_45:

  v92 = [MEMORY[0x263F1C920] mainScreen];
  [v92 scale];
  double v94 = v93;
  v95 = [MEMORY[0x263F1C920] mainScreen];
  [v95 scale];

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  v96 = self->_suggestionLabels;
  uint64_t v97 = [(NSArray *)v96 countByEnumeratingWithState:&v121 objects:v130 count:16];
  if (v97)
  {
    uint64_t v98 = v97;
    double v99 = v115 + (v118 - v116 - v115 - v69) * 0.5;
    double v100 = floor(v99);
    if (v94 < 2.0) {
      double v99 = v100;
    }
    double v101 = v99 + -10.0;
    uint64_t v102 = *(void *)v122;
    do
    {
      for (uint64_t j = 0; j != v98; ++j)
      {
        if (*(void *)v122 != v102) {
          objc_enumerationMutation(v96);
        }
        v104 = *(void **)(*((void *)&v121 + 1) + 8 * j);
        [v104 frame];
        CGFloat v106 = v105;
        CGFloat v108 = v107;
        CGFloat v110 = v109;
        objc_msgSend(v104, "setFrame:");
        v136.origin.x = v106;
        v136.origin.y = v101;
        v136.size.width = v108;
        v136.size.height = v110;
        double v101 = CGRectGetMaxY(v136);
      }
      uint64_t v98 = [(NSArray *)v96 countByEnumeratingWithState:&v121 objects:v130 count:16];
    }
    while (v98);
  }

  guideView = self->_guideView;
  [(UIView *)self->_contentView bounds];
  -[UIView setFrame:](guideView, "setFrame:");
}

- (void)_animateHeaderIn
{
  id v11 = [(SiriUISuggestionsView *)self _createSpringAnimation:2.0];
  [v11 setKeyPath:@"transform.translation.y"];
  double v3 = [NSNumber numberWithDouble:224.0];
  [v11 setFromValue:v3];

  [v11 setToValue:&unk_26D658168];
  double v4 = [(SiriUISuggestionsView *)self _createSpringAnimation:2.0];
  [v4 setFromValue:&unk_26D658168];
  [v4 setToValue:&unk_26D658178];
  [(UILabel *)self->_headerLabel setAlpha:1.0];
  [(UILabel *)self->_subheaderLabel setAlpha:1.0];
  [(UILabel *)self->_largeSubheaderLabel setAlpha:1.0];
  [v4 setKeyPath:@"opacity"];
  double v5 = [(UILabel *)self->_headerLabel layer];
  [v5 addAnimation:v4 forKey:@"HeaderLabelOpacityAnimation"];

  double v6 = [(UILabel *)self->_headerLabel layer];
  [v6 addAnimation:v11 forKey:@"HeaderLabelTranslationAnimation"];

  double v7 = [(UILabel *)self->_subheaderLabel layer];
  [v7 addAnimation:v4 forKey:@"HeaderLabelOpacityAnimation"];

  double v8 = [(UILabel *)self->_subheaderLabel layer];
  [v8 addAnimation:v11 forKey:@"HeaderLabelTranslationAnimation"];

  double v9 = [(UILabel *)self->_largeSubheaderLabel layer];
  [v9 addAnimation:v4 forKey:@"HeaderLabelOpacityAnimation"];

  double v10 = [(UILabel *)self->_largeSubheaderLabel layer];
  [v10 addAnimation:v11 forKey:@"HeaderLabelTranslationAnimation"];
}

- (void)_animateHeaderOut
{
  id v16 = [(SiriUISuggestionsView *)self _createSpringAnimation:2.0];
  [v16 setKeyPath:@"transform.translation.y"];
  [v16 setFromValue:&unk_26D658168];
  double v3 = [NSNumber numberWithDouble:-564.0];
  [v16 setToValue:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F15760]);
  LODWORD(v5) = 1036831949;
  LODWORD(v6) = 0.25;
  LODWORD(v7) = 0.25;
  LODWORD(v8) = 1.0;
  double v9 = [MEMORY[0x263F15808] functionWithControlPoints:v6 :v5 :v7 :v8];
  [v4 setTimingFunction:v9];
  [v4 setDuration:0.2];
  [v4 setBeginTime:CACurrentMediaTime()];
  [v4 setKeyPath:@"opacity"];
  [v4 setFromValue:&unk_26D658178];
  [v4 setToValue:&unk_26D658168];
  [(UILabel *)self->_headerLabel setAlpha:0.0];
  [(UILabel *)self->_subheaderLabel setAlpha:0.0];
  [(UILabel *)self->_largeSubheaderLabel setAlpha:0.0];
  double v10 = [(UILabel *)self->_headerLabel layer];
  [v10 addAnimation:v16 forKey:@"HeaderLabelTranslationAnimation"];

  id v11 = [(UILabel *)self->_headerLabel layer];
  [v11 addAnimation:v4 forKey:@"HeaderLabelOpacityAnimation"];

  double v12 = [(UILabel *)self->_subheaderLabel layer];
  [v12 addAnimation:v16 forKey:@"HeaderLabelTranslationAnimation"];

  uint64_t v13 = [(UILabel *)self->_subheaderLabel layer];
  [v13 addAnimation:v4 forKey:@"HeaderLabelOpacityAnimation"];

  char v14 = [(UILabel *)self->_largeSubheaderLabel layer];
  [v14 addAnimation:v16 forKey:@"HeaderLabelTranslationAnimation"];

  id v15 = [(UILabel *)self->_largeSubheaderLabel layer];
  [v15 addAnimation:v4 forKey:@"HeaderLabelOpacityAnimation"];
}

- (void)_animateInSuggestionAtIndex:(unint64_t)a3
{
  double v5 = CACurrentMediaTime();
  BOOL firstSuggestionPresentation = self->_firstSuggestionPresentation;
  uint64_t v21 = 3221225472;
  uint64_t v20 = MEMORY[0x263EF8330];
  id v22 = __53__SiriUISuggestionsView__animateInSuggestionAtIndex___block_invoke;
  double v23 = &__block_descriptor_48_e24___CASpringAnimation_8__0l;
  if (firstSuggestionPresentation) {
    double v7 = v5;
  }
  else {
    double v7 = v5 + 0.41;
  }
  double v24 = v7;
  unint64_t v25 = a3;
  double v8 = (void (**)(void, void, void, void))MEMORY[0x223CB13F0](&v20);
  double v12 = v8[2](v8, v9, v10, v11);
  objc_msgSend(v12, "setKeyPath:", @"transform.translation.y", v20, v21, v22, v23);
  uint64_t v13 = [NSNumber numberWithDouble:292.0];
  [v12 setFromValue:v13];

  [v12 setToValue:&unk_26D658168];
  [v12 setAdditive:1];
  char v14 = ((void (*)(void (**)(void, void, void, void)))v8[2])(v8);
  [v14 setKeyPath:@"opacity"];
  [v14 setFromValue:&unk_26D658168];
  [v14 setToValue:&unk_26D658178];
  id v15 = [(NSArray *)self->_suggestionLabels objectAtIndex:a3];
  [v15 setAlpha:1.0];
  id v16 = objc_alloc_init(MEMORY[0x263F15760]);
  [(SiriUISuggestionsView *)self _updateSuggestionsDelay];
  objc_msgSend(v16, "setDuration:");
  [v16 setBeginTime:v7];
  [v16 setAdditive:1];
  [v16 setKeyPath:@"transform.translation.y"];
  [v16 setFromValue:&unk_26D658188];
  [v16 setToValue:&unk_26D658168];
  double v17 = [v15 layer];
  [v17 addAnimation:v16 forKey:@"SuggestionLabelSecondaryTranslationAnimation"];

  double v18 = [v15 layer];
  [v18 addAnimation:v12 forKey:@"SuggestionLabelTranslationAnimation"];

  id v19 = [v15 layer];
  [v19 addAnimation:v14 forKey:@"SuggestionLabelOpacityAnimation"];
}

id __53__SiriUISuggestionsView__animateInSuggestionAtIndex___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F15890] animation];
  [v2 setMass:4.0];
  [v2 setStiffness:400.0];
  [v2 setDamping:800.0];
  [v2 setFillMode:*MEMORY[0x263F15AA0]];
  [v2 setBeginTime:*(double *)(a1 + 32) + (double)(unint64_t)(*(void *)(a1 + 40) + 1) * 0.03];
  [v2 setDuration:2.0];
  return v2;
}

- (void)_animateOutSuggestionAtIndex:(unint64_t)a3
{
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__SiriUISuggestionsView__animateOutSuggestionAtIndex___block_invoke;
  v15[3] = &__block_descriptor_40_e24___CASpringAnimation_8__0l;
  v15[4] = a3;
  double v5 = (void (**)(void))MEMORY[0x223CB13F0](v15, a2);
  double v6 = v5[2]();
  uint64_t v7 = *MEMORY[0x263F15EB0];
  double v8 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
  [v6 setTimingFunction:v8];

  [v6 setKeyPath:@"transform.translation.y"];
  [v6 setFromValue:&unk_26D658168];
  uint64_t v9 = [NSNumber numberWithDouble:-584.0];
  [v6 setToValue:v9];

  [v6 setDuration:2.0];
  id v10 = objc_alloc_init(MEMORY[0x263F15760]);
  uint64_t v11 = [MEMORY[0x263F15808] functionWithName:v7];
  [v10 setTimingFunction:v11];

  [v10 setKeyPath:@"opacity"];
  [v10 setFromValue:&unk_26D658178];
  [v10 setToValue:&unk_26D658168];
  [v10 setFillMode:*MEMORY[0x263F15AA0]];
  [v10 setBeginTime:CACurrentMediaTime() + (double)a3 * 0.03];
  [v10 setDuration:0.34];
  double v12 = [(NSArray *)self->_suggestionLabels objectAtIndex:a3];
  [v12 setAlpha:0.0];
  uint64_t v13 = [v12 layer];
  [v13 addAnimation:v6 forKey:@"SuggestionLabelTranslationAnimation"];

  char v14 = [v12 layer];
  [v14 addAnimation:v10 forKey:@"SuggestionLabelOpacityAnimation"];
}

id __54__SiriUISuggestionsView__animateOutSuggestionAtIndex___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F15890] animation];
  [v2 setMass:4.0];
  [v2 setStiffness:400.0];
  [v2 setDamping:800.0];
  [v2 setFillMode:*MEMORY[0x263F15AA0]];
  [v2 setBeginTime:CACurrentMediaTime() + (double)*(unint64_t *)(a1 + 32) * 0.03];
  return v2;
}

- (void)animateOutWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(UILabel *)self->_headerLabel layer];
  [v5 removeAnimationForKey:@"HeaderLabelOpacityAnimation"];

  double v6 = [(UILabel *)self->_subheaderLabel layer];
  [v6 removeAnimationForKey:@"HeaderLabelOpacityAnimation"];

  uint64_t v7 = [(UILabel *)self->_largeSubheaderLabel layer];
  [v7 removeAnimationForKey:@"HeaderLabelOpacityAnimation"];

  [(NSArray *)self->_suggestionLabels enumerateObjectsUsingBlock:&__block_literal_global_8];
  double v8 = [(UIView *)self->_guideView layer];
  [v8 removeAnimationForKey:@"GuideOpacityAnimation"];

  uint64_t v9 = (void *)MEMORY[0x263F1CB60];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_2;
  v13[3] = &unk_26469EFA8;
  v13[4] = self;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_5;
  v11[3] = &unk_26469F840;
  id v12 = v4;
  id v10 = v4;
  [v9 animateWithDuration:v13 animations:v11 completion:0.25];
}

void __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 layer];
  [v2 removeAnimationForKey:@"SuggestionLabelOpacityAnimation"];
}

uint64_t __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 448) enumerateObjectsUsingBlock:&__block_literal_global_54];
  [*(id *)(*(void *)(a1 + 32) + 456) enumerateObjectsUsingBlock:&__block_literal_global_56];
  [*(id *)(*(void *)(a1 + 32) + 536) setAlpha:0.0];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 488) isShowing];
  if (result)
  {
    double v3 = *(void **)(*(void *)(a1 + 32) + 488);
    return [v3 animateOut];
  }
  return result;
}

uint64_t __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setAlpha:0.0];
}

uint64_t __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setAlpha:0.0];
}

uint64_t __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setGuideView:(id)a3
{
  id v4 = (UIView *)a3;
  [(UIView *)self->_guideView removeFromSuperview];
  guideView = self->_guideView;
  self->_guideView = v4;
  double v6 = v4;

  [(UIView *)self->_guideView setHidden:1];
  [(UIView *)self->_contentView addSubview:self->_guideView];

  [(SiriUISuggestionsView *)self setNeedsLayout];
}

- (void)setGuideHidden:(BOOL)a3
{
}

- (void)setGuideHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(SiriUISuggestionsView *)self isGuideHidden] != a3)
  {
    [(SiriUISuggestionsView *)self setUserInteractionEnabled:!v5];
    if (v5)
    {
      if (v4)
      {
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __49__SiriUISuggestionsView_setGuideHidden_animated___block_invoke;
        v14[3] = &unk_26469EFA8;
        v14[4] = self;
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __49__SiriUISuggestionsView_setGuideHidden_animated___block_invoke_2;
        v13[3] = &unk_26469F020;
        v13[4] = self;
        [MEMORY[0x263F1CB60] animateWithDuration:v14 animations:v13 completion:0.25];
      }
      else
      {
        guideView = self->_guideView;
        [(UIView *)guideView setHidden:1];
      }
    }
    else
    {
      [(UIView *)self->_guideView setHidden:0];
      [(UIView *)self->_guideView setAlpha:1.0];
      if (v4)
      {
        id v12 = [(SiriUISuggestionsView *)self _createSpringAnimation:2.0];
        [v12 setKeyPath:@"transform.translation.y"];
        uint64_t v7 = [NSNumber numberWithDouble:224.0];
        [v12 setFromValue:v7];

        [v12 setToValue:&unk_26D658168];
        double v8 = [(SiriUISuggestionsView *)self _createSpringAnimation:2.0];
        [v8 setFromValue:&unk_26D658168];
        [v8 setToValue:&unk_26D658178];
        [v8 setKeyPath:@"opacity"];
        uint64_t v9 = [(UIView *)self->_guideView layer];
        [v9 addAnimation:v8 forKey:@"GuideOpacityAnimation"];

        id v10 = [(UIView *)self->_guideView layer];
        [v10 addAnimation:v12 forKey:@"GuideTranslationAnimation"];
      }
    }
  }
}

uint64_t __49__SiriUISuggestionsView_setGuideHidden_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 536) setAlpha:0.0];
}

uint64_t __49__SiriUISuggestionsView_setGuideHidden_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 536) setHidden:1];
}

- (BOOL)isGuideHidden
{
  guideView = self->_guideView;
  return !guideView || [(UIView *)guideView isHidden];
}

- (void)setHeaderText:(id)a3
{
  id v9 = a3;
  if (!-[SiriUISuggestionsHeaderText isEqual:](self->_headerText, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_headerText, a3);
    [(SiriUISuggestionsView *)self _animateHeaderOut];
    BOOL v5 = self->_headerLabel;
    objc_storeStrong((id *)&self->_headerLabel, self->_oldHeaderLabel);
    oldHeaderLabel = self->_oldHeaderLabel;
    self->_oldHeaderLabel = v5;
    uint64_t v7 = v5;

    double v8 = [v9 attributedStringForMainScreenTraitCollection];
    [(SiriUISuggestionsView *)self _setHeaderText:v8];

    [(SiriUISuggestionsView *)self setNeedsLayout];
    [(SiriUISuggestionsView *)self _animateHeaderIn];
  }
}

- (void)setSubheaderText:(id)a3
{
  id v6 = a3;
  if (!-[SiriUISuggestionsHeaderText isEqual:](self->_subheaderText, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_subheaderText, a3);
    [(SiriUISuggestionsView *)self _loadSubheaderViewIfNeeded];
    BOOL v5 = [v6 attributedStringForMainScreenTraitCollection];
    [(SiriUISuggestionsView *)self _setLargeSubheaderText:v5];

    [(SiriUISuggestionsView *)self setNeedsLayout];
  }
}

- (void)setLargeSubheaderText:(id)a3
{
  id v6 = a3;
  if (!-[SiriUISuggestionsHeaderText isEqual:](self->_largeSubheaderText, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_largeSubheaderText, a3);
    [(SiriUISuggestionsView *)self _loadLargeSubheaderViewIfNeeded];
    BOOL v5 = [v6 attributedStringForMainScreenTraitCollection];
    [(SiriUISuggestionsView *)self _setLargeSubheaderText:v5];

    [(SiriUISuggestionsView *)self setNeedsLayout];
  }
}

- (void)_setHeaderText:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(UILabel *)self->_headerLabel attributedText];
  char v5 = [v4 isEqualToAttributedString:v6];

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_headerLabel setAttributedText:v6];
  }
}

- (void)_setSubheaderText:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(UILabel *)self->_subheaderLabel attributedText];
  char v5 = [v4 isEqualToAttributedString:v6];

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_subheaderLabel setAttributedText:v6];
  }
}

- (void)_setLargeSubheaderText:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(UILabel *)self->_largeSubheaderLabel attributedText];
  char v5 = [v4 isEqualToAttributedString:v6];

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_largeSubheaderLabel setAttributedText:v6];
  }
}

- (void)_setSuggestionTexts:(id)a3
{
  id v4 = a3;
  [(SiriUISuggestionsView *)self _loadSuggestionsViewsIfNeeded];
  suggestionLabels = self->_suggestionLabels;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__SiriUISuggestionsView__setSuggestionTexts___block_invoke;
  v10[3] = &unk_26469F868;
  v10[4] = self;
  [(NSArray *)suggestionLabels enumerateObjectsUsingBlock:v10];
  id v6 = self->_suggestionLabels;
  objc_storeStrong((id *)&self->_suggestionLabels, self->_oldSuggestionLabels);
  oldSuggestionLabels = self->_oldSuggestionLabels;
  self->_oldSuggestionLabels = v6;
  double v8 = v6;

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__SiriUISuggestionsView__setSuggestionTexts___block_invoke_2;
  v9[3] = &unk_26469F890;
  v9[4] = self;
  [v4 enumerateObjectsUsingBlock:v9];
}

uint64_t __45__SiriUISuggestionsView__setSuggestionTexts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animateOutSuggestionAtIndex:");
}

void __45__SiriUISuggestionsView__setSuggestionTexts___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  v15[1] = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 496) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    id v6 = (objc_class *)MEMORY[0x263F1C350];
    id v7 = a2;
    id v8 = objc_alloc_init(v6);
    [v8 setLineSpacing:0.0];
    [v8 setAlignment:1];
    id v9 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v14 = *MEMORY[0x263F1C268];
    v15[0] = v8;
    id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v11 = (void *)[v9 initWithString:v7 attributes:v10];

    [*(id *)(a1 + 32) setNeedsLayout];
    if ([*(id *)(*(void *)(a1 + 32) + 448) count] > a3)
    {
      id v12 = [*(id *)(*(void *)(a1 + 32) + 448) objectAtIndex:a3];
      [v12 setAttributedText:v11];

      uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 448) objectAtIndex:a3];
      [v13 setHidden:0];

      [*(id *)(a1 + 32) _animateInSuggestionAtIndex:a3];
    }
  }
}

- (void)startSuggesting
{
  BOOL v3 = [(SiriUIAcousticIDSpinner *)self->_acousticIDSpinner isShowing];
  if (!self->_updateSuggestionsTimer && !v3)
  {
    [(SiriUISuggestionsView *)self _updateSuggestions];
  }
}

- (void)stopSuggesting
{
  updateSuggestionsTimer = self->_updateSuggestionsTimer;
  if (updateSuggestionsTimer)
  {
    [(NSTimer *)updateSuggestionsTimer invalidate];
    id v4 = self->_updateSuggestionsTimer;
    self->_updateSuggestionsTimer = 0;
  }
}

- (BOOL)isShowingSuggestions
{
  return [(NSTimer *)self->_updateSuggestionsTimer isValid];
}

- (void)clearCurrentSuggestions
{
  BOOL v3 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_numberOfSuggestions];
  id v5 = v3;
  if (self->_numberOfSuggestions)
  {
    unint64_t v4 = 0;
    do
    {
      [v3 addObject:&stru_26D647E48];
      BOOL v3 = v5;
      ++v4;
    }
    while (v4 < self->_numberOfSuggestions);
  }
  [(SiriUISuggestionsView *)self _setSuggestionTexts:v3];
}

- (void)_updateSuggestions
{
  updateSuggestionsTimer = self->_updateSuggestionsTimer;
  if (updateSuggestionsTimer) {
    [(NSTimer *)updateSuggestionsTimer invalidate];
  }
  BOOL firstSuggestionPresentation = self->_firstSuggestionPresentation;
  id v5 = (void *)MEMORY[0x263EFFA20];
  [(SiriUISuggestionsView *)self _updateSuggestionsDelay];
  if (!firstSuggestionPresentation) {
    double v6 = v6 + 0.41;
  }
  id v7 = [v5 scheduledTimerWithTimeInterval:self target:sel__updateSuggestions selector:0 userInfo:0 repeats:v6];
  id v8 = self->_updateSuggestionsTimer;
  self->_updateSuggestionsTimer = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v10 & 1) != 0 || (v12)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__1;
    double v23 = __Block_byref_object_dispose__1;
    id v24 = [(NSMutableOrderedSet *)self->_pendedSuggestions array];
    [(NSMutableOrderedSet *)self->_pendedSuggestions removeAllObjects];
    unint64_t numberOfSuggestions = self->_numberOfSuggestions;
    uint64_t v14 = numberOfSuggestions - [(id)v20[5] count];
    if (v14 < 1)
    {
LABEL_14:
      _Block_object_dispose(&v19, 8);

      goto LABEL_15;
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__SiriUISuggestionsView__updateSuggestions__block_invoke;
    v18[3] = &unk_26469F8E0;
    v18[4] = self;
    v18[5] = &v19;
    id v15 = (void (**)(void, void))MEMORY[0x223CB13F0](v18);
    if (v10)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 getNextSuggestionsForSuggestionsView:self maxSuggestions:v14 completion:v15];
    }
    else
    {
      if ((v12 & 1) == 0)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      id v16 = [v17 nextSuggestionsForSuggestionsView:self maxSuggestions:v14];

      ((void (**)(void, void *))v15)[2](v15, v16);
    }

    goto LABEL_13;
  }
LABEL_15:
  self->_BOOL firstSuggestionPresentation = 0;
}

void __43__SiriUISuggestionsView__updateSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__SiriUISuggestionsView__updateSuggestions__block_invoke_2;
    block[3] = &unk_26469F8B8;
    uint64_t v10 = *(void *)(a1 + 40);
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __43__SiriUISuggestionsView__updateSuggestions__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) arrayByAddingObjectsFromArray:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 40) _setSuggestionTexts:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 576));
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 576));
    [v7 didShowSuggestionsForSuggestionsView:*(void *)(a1 + 40)];
  }
}

- (void)showAcousticIDSpinner
{
  uint64_t v3 = [(SiriUIAcousticIDSpinner *)self->_acousticIDSpinner superview];

  if (v3 != self) {
    [(SiriUISuggestionsView *)self setNeedsLayout];
  }
  if (self->_updateSuggestionsTimer)
  {
    [MEMORY[0x263F158F8] begin];
    [(SiriUISuggestionsView *)self stopSuggesting];
    [(SiriUISuggestionsView *)self clearCurrentSuggestions];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __46__SiriUISuggestionsView_showAcousticIDSpinner__block_invoke;
    v4[3] = &unk_26469EFA8;
    v4[4] = self;
    [MEMORY[0x263F158F8] setCompletionBlock:v4];
    [MEMORY[0x263F158F8] commit];
  }
  else
  {
    [(SiriUISuggestionsView *)self _reallyShowAcousticIDSpinner];
  }
}

uint64_t __46__SiriUISuggestionsView_showAcousticIDSpinner__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallyShowAcousticIDSpinner];
}

- (void)_reallyShowAcousticIDSpinner
{
}

- (void)hideAcousticIDSpinner
{
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  [(UILabel *)self->_headerLabel setTextColor:v4];
  [(UILabel *)self->_oldHeaderLabel setTextColor:v4];
  [(UILabel *)self->_subheaderLabel setTextColor:v4];
  [(UILabel *)self->_largeSubheaderLabel setTextColor:v4];
  suggestionLabels = self->_suggestionLabels;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__SiriUISuggestionsView_setTextColor___block_invoke;
  v13[3] = &unk_26469F868;
  id v6 = v4;
  id v14 = v6;
  [(NSArray *)suggestionLabels enumerateObjectsUsingBlock:v13];
  oldSuggestionLabels = self->_oldSuggestionLabels;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__SiriUISuggestionsView_setTextColor___block_invoke_2;
  v11[3] = &unk_26469F868;
  id v8 = (UIColor *)v6;
  char v12 = v8;
  [(NSArray *)oldSuggestionLabels enumerateObjectsUsingBlock:v11];
  textColor = self->_textColor;
  self->_textColor = v8;
  uint64_t v10 = v8;
}

uint64_t __38__SiriUISuggestionsView_setTextColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTextColor:*(void *)(a1 + 32)];
}

uint64_t __38__SiriUISuggestionsView_setTextColor___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setTextColor:*(void *)(a1 + 32)];
}

- (void)setOrientation:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_orientation != a3)
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int64_t orientation = self->_orientation;
      int v7 = 136315650;
      id v8 = "-[SiriUISuggestionsView setOrientation:]";
      __int16 v9 = 2048;
      int64_t v10 = orientation;
      __int16 v11 = 2048;
      int64_t v12 = a3;
      _os_log_impl(&dword_2231EF000, v5, OS_LOG_TYPE_DEFAULT, "%s %zd from:%zd", (uint8_t *)&v7, 0x20u);
    }
    self->_int64_t orientation = a3;
    self->_unint64_t numberOfSuggestions = [(SiriUISuggestionsView *)self _numberOfSuggestionsToDisplay];
  }
}

- (BOOL)_isPortrait
{
  return (unint64_t)(self->_orientation - 1) < 2;
}

- (double)_updateSuggestionsDelay
{
  return (double)self->_numberOfSuggestions;
}

- (int)_heightType
{
  uint64_t v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 _referenceBounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  BOOL v12 = [(SiriUISuggestionsView *)self _isPortrait];
  uint64_t v13 = v5;
  uint64_t v14 = v7;
  uint64_t v15 = v9;
  uint64_t v16 = v11;
  if (v12) {
    double Height = CGRectGetHeight(*(CGRect *)&v13);
  }
  else {
    double Height = CGRectGetWidth(*(CGRect *)&v13);
  }
  double v18 = Height;
  if (Height >= 1366.0 && !SiriUIIsCompactWidth() && !SiriUIIsCompactHeight()) {
    return 6;
  }
  if (v18 >= 768.0 && !SiriUIIsCompactWidth() && !SiriUIIsCompactHeight()) {
    return 5;
  }
  if (v18 >= 736.0) {
    return 4;
  }
  if (v18 >= 667.0) {
    return 3;
  }
  if (v18 >= 568.0) {
    return 2;
  }
  return v18 > 414.0;
}

- (BOOL)_isPadHeightType
{
  return [(SiriUISuggestionsView *)self _heightType] > 4;
}

- (double)_suggestionSpacing
{
  switch([(SiriUISuggestionsView *)self _heightType])
  {
    case 0:
    case 2:
    case 4:
      uint64_t v3 = 0x4046000000000000;
      goto LABEL_9;
    case 1:
      double v4 = 37.0;
      break;
    case 3:
      uint64_t v3 = 0x404B000000000000;
LABEL_9:
      double v4 = *(double *)&v3;
      break;
    case 5:
    case 6:
      if ([(SiriUISuggestionsView *)self _isPortrait]) {
        double v4 = 70.0;
      }
      else {
        double v4 = 60.0;
      }
      break;
    default:
      double v4 = 0.0;
      break;
  }
  uint64_t v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 scale];
  double v6 = floor(v4);
  if (v7 < 2.0) {
    double v4 = v6;
  }

  return v4;
}

- (unint64_t)_numberOfSuggestionsToDisplay
{
  int v2 = [(SiriUISuggestionsView *)self _heightType];
  if (v2 > 6) {
    return 0;
  }
  else {
    return qword_22323E838[v2];
  }
}

- (double)_headerToSubheaderOffset
{
  if ([(SiriUISuggestionsView *)self _isPadHeightType]) {
    double v2 = 0.0;
  }
  else {
    double v2 = 5.0;
  }
  uint64_t v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 scale];
  double v4 = ceil(v2);
  if (v5 < 2.0) {
    double v2 = v4;
  }

  return v2;
}

- (double)_headerToLargeSubheaderOffset
{
  [(SiriUISuggestionsView *)self _isPadHeightType];
  double v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 scale];

  return 10.0;
}

- (double)_suggestionFontSize
{
  int v2 = [(SiriUISuggestionsView *)self _heightType];
  double result = 24.0;
  if (v2 <= 4) {
    return dbl_22323E870[v2];
  }
  return result;
}

- (id)_createSpringAnimation:(double)a3
{
  double v4 = [MEMORY[0x263F15890] animation];
  [v4 setRemovedOnCompletion:0];
  [v4 setMass:4.0];
  [v4 setStiffness:400.0];
  [v4 setDamping:800.0];
  [v4 setFillMode:*MEMORY[0x263F15AA0]];
  [v4 setBeginTime:CACurrentMediaTime()];
  [v4 setDuration:a3];
  return v4;
}

- (void)acousticIDSpinnerDidHide:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 suggestionsView:self didHideVibrantView:v7];
  }
}

- (UIView)guideView
{
  return self->_guideView;
}

- (SiriUISuggestionsHeaderText)headerText
{
  return self->_headerText;
}

- (SiriUISuggestionsHeaderText)subheaderText
{
  return self->_subheaderText;
}

- (SiriUISuggestionsHeaderText)largeSubheaderText
{
  return self->_largeSubheaderText;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (SiriUISuggestionsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUISuggestionsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_largeSubheaderText, 0);
  objc_storeStrong((id *)&self->_subheaderText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_guideView, 0);
  objc_storeStrong((id *)&self->_acousticIDSpinner, 0);
  objc_storeStrong((id *)&self->_pendedSuggestions, 0);
  objc_storeStrong((id *)&self->_updateSuggestionsTimer, 0);
  objc_storeStrong((id *)&self->_oldSuggestionLabels, 0);
  objc_storeStrong((id *)&self->_suggestionLabels, 0);
  objc_storeStrong((id *)&self->_largeSubheaderLabel, 0);
  objc_storeStrong((id *)&self->_subheaderLabel, 0);
  objc_storeStrong((id *)&self->_oldHeaderLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end