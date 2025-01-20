@interface _UIButtonBarButtonVisualProviderCarPlay
- (BOOL)supportsBackButtons;
- (NSArray)buttonConstraints;
- (NSArray)titleAlternatives;
- (NSLayoutConstraint)backViewToContentConstraint;
- (NSLayoutConstraint)maxTitleViewWidthConstraint;
- (NSMutableDictionary)titleAlterntativeLookup;
- (UIImageView)backView;
- (UIImageView)imageView;
- (UILabel)titleView;
- (UIView)focusedView;
- (_UIButtonBarAppearanceDelegate)appearanceDelegate;
- (id)_titleAlternativeForTitle:(id)a3;
- (id)contentView;
- (void)_setupAlternateTitlesFromBarButtonItem:(id)a3;
- (void)buttonLayoutSubviews:(id)a3 baseImplementation:(id)a4;
- (void)configureButton:(id)a3 fromBarButtonItem:(id)a4;
- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5;
- (void)setAppearanceDelegate:(id)a3;
- (void)setBackView:(id)a3;
- (void)setBackViewToContentConstraint:(id)a3;
- (void)setButtonConstraints:(id)a3;
- (void)setFocusedView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setMaxTitleViewWidthConstraint:(id)a3;
- (void)setTitleAlternatives:(id)a3;
- (void)setTitleAlterntativeLookup:(id)a3;
- (void)setTitleView:(id)a3;
- (void)updateButton:(id)a3 forFocusedState:(BOOL)a4;
- (void)updateButton:(id)a3 forHighlightedState:(BOOL)a4;
@end

@implementation _UIButtonBarButtonVisualProviderCarPlay

- (id)contentView
{
  v3 = [(_UIButtonBarButtonVisualProviderCarPlay *)self imageView];
  v4 = [v3 superview];

  if (v4) {
    [(_UIButtonBarButtonVisualProviderCarPlay *)self imageView];
  }
  else {
  v5 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
  }
  return v5;
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  [(_UIButtonBarButtonVisualProviderCarPlay *)self setAppearanceDelegate:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(_UIButtonBarButtonVisualProviderCarPlay *)self configureButton:v9 fromBarButtonItem:v8];
  }
}

- (void)configureButton:(id)a3 fromBarButtonItem:(id)a4
{
  v131[10] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F5B268];
  id v9 = [(_UIButtonBarButtonVisualProviderCarPlay *)self buttonConstraints];
  [v8 deactivateConstraints:v9];

  v10 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backView];
  [v10 removeFromSuperview];

  v11 = [(_UIButtonBarButtonVisualProviderCarPlay *)self imageView];
  [v11 removeFromSuperview];

  v12 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
  [v12 removeFromSuperview];

  v13 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
  [v13 removeFromSuperview];

  [(_UIButtonBarButtonVisualProviderCarPlay *)self setBackViewToContentConstraint:0];
  v14 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];

  if (!v14)
  {
    v15 = [UIView alloc];
    v16 = -[UIView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(_UIButtonBarButtonVisualProviderCarPlay *)self setFocusedView:v16];

    v17 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    v19 = [v18 layer];
    [v19 setCornerRadius:4.5];

    uint64_t v20 = *MEMORY[0x1E4F39EA8];
    v21 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    v22 = [v21 layer];
    [v22 setCornerCurve:v20];

    v23 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    [v23 setUserInteractionEnabled:0];
  }
  v24 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
  [v6 addSubview:v24];

  v25 = [v7 _imageForState:0 compact:0 type:0];
  if (v25)
  {
    v26 = [(_UIButtonBarButtonVisualProviderCarPlay *)self imageView];

    if (!v26)
    {
      v27 = [UIImageView alloc];
      v28 = -[UIImageView initWithFrame:](v27, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(_UIButtonBarButtonVisualProviderCarPlay *)self setImageView:v28];

      v29 = [(_UIButtonBarButtonVisualProviderCarPlay *)self imageView];
      [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

      v30 = +[UIColor _carSystemFocusColor];
      v31 = [(_UIButtonBarButtonVisualProviderCarPlay *)self imageView];
      [v31 setTintColor:v30];

      v32 = [(_UIButtonBarButtonVisualProviderCarPlay *)self imageView];
      [v32 setUserInteractionEnabled:0];
    }
    v33 = [(_UIButtonBarButtonVisualProviderCarPlay *)self imageView];
    [v33 setImage:v25];

    uint64_t v34 = [(_UIButtonBarButtonVisualProviderCarPlay *)self imageView];
  }
  else
  {
    v35 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];

    if (!v35)
    {
      v36 = [UILabel alloc];
      v37 = -[UILabel initWithFrame:](v36, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(_UIButtonBarButtonVisualProviderCarPlay *)self setTitleView:v37];

      v38 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
      [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

      v39 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCallout"];
      v40 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
      [v40 setFont:v39];

      v41 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
      [v41 setAdjustsFontForContentSizeCategory:1];

      v42 = +[UIColor _carSystemFocusColor];
      v43 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
      [v43 setTextColor:v42];

      v44 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
      [v44 setUserInteractionEnabled:0];
    }
    v45 = [v7 resolvedTitle];
    v46 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
    [v46 setText:v45];

    uint64_t v34 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
  }
  v47 = (void *)v34;
  [v6 addSubview:v34];

  if (([v6 isBackButton] & 1) != 0 || objc_msgSend(v7, "_showsChevron"))
  {
    v107 = v25;
    v48 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backView];

    if (!v48)
    {
      v49 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleCallout" variant:1024];
      v50 = +[UIImageSymbolConfiguration configurationWithFont:v49 scale:2];
      v51 = [UIImageView alloc];
      v52 = +[UIImage systemImageNamed:@"chevron.backward.circle.fill" withConfiguration:v50];
      v53 = [(UIImageView *)v51 initWithImage:v52];
      [(_UIButtonBarButtonVisualProviderCarPlay *)self setBackView:v53];

      v54 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backView];
      [v54 setTranslatesAutoresizingMaskIntoConstraints:0];

      v55 = +[UIColor _carSystemFocusColor];
      v56 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backView];
      [v56 setTintColor:v55];

      v57 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backView];
      [v57 setUserInteractionEnabled:0];

      v58 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backView];
      LODWORD(v59) = 1148846080;
      [v58 setContentCompressionResistancePriority:0 forAxis:v59];
    }
    v60 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backView];
    [v6 addSubview:v60];

    [(_UIButtonBarButtonVisualProviderCarPlay *)self _setupAlternateTitlesFromBarButtonItem:v7];
    v61 = [v6 widthAnchor];
    v62 = [v61 constraintGreaterThanOrEqualToConstant:44.0];

    LODWORD(v63) = 1148846080;
    v64 = v62;
    v106 = v62;
    [v62 setPriority:v63];
    v65 = [(_UIButtonBarButtonVisualProviderCarPlay *)self contentView];
    v66 = [v65 leadingAnchor];
    v67 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backView];
    v68 = [v67 trailingAnchor];
    [v66 constraintEqualToAnchor:v68 constant:3.0];
    v69 = id v108 = v7;
    [(_UIButtonBarButtonVisualProviderCarPlay *)self setBackViewToContentConstraint:v69];

    v131[0] = v64;
    v105 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backView];
    v104 = [v105 firstBaselineAnchor];
    uint64_t v102 = [v6 topAnchor];
    uint64_t v103 = [v104 constraintEqualToAnchor:v102 constant:28.0];
    v131[1] = v103;
    v129 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backView];
    v70 = [v129 leadingAnchor];
    v127 = [v6 leadingAnchor];
    v128 = v70;
    v126 = [v70 constraintEqualToAnchor:v127 constant:12.0];
    v131[2] = v126;
    v125 = [(_UIButtonBarButtonVisualProviderCarPlay *)self contentView];
    v71 = [v125 firstBaselineAnchor];
    v123 = [v6 topAnchor];
    v124 = v71;
    v122 = [v71 constraintEqualToAnchor:v123 constant:28.0];
    v131[3] = v122;
    v121 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backViewToContentConstraint];
    v131[4] = v121;
    v120 = [(_UIButtonBarButtonVisualProviderCarPlay *)self contentView];
    v72 = [v120 trailingAnchor];
    v118 = [v6 trailingAnchor];
    v119 = v72;
    v117 = [v72 constraintEqualToAnchor:v118 constant:-12.0];
    v131[5] = v117;
    v116 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    v73 = [v116 topAnchor];
    v114 = [v6 topAnchor];
    v115 = v73;
    v113 = [v73 constraintEqualToAnchor:v114 constant:5.0];
    v131[6] = v113;
    v112 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    v74 = [v112 leadingAnchor];
    v110 = [v6 leadingAnchor];
    v111 = v74;
    v109 = [v74 constraintEqualToAnchor:v110 constant:5.0];
    v131[7] = v109;
    v101 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    v75 = [v101 trailingAnchor];
    v76 = [v6 trailingAnchor];
    v77 = [v75 constraintEqualToAnchor:v76 constant:-5.0];
    v131[8] = v77;
    v78 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    v79 = [v78 bottomAnchor];
    v80 = [v6 bottomAnchor];
    v81 = [v79 constraintEqualToAnchor:v80 constant:-5.0];
    v131[9] = v81;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:10];
    v83 = id v82 = v6;
    [(_UIButtonBarButtonVisualProviderCarPlay *)self setButtonConstraints:v83];

    id v6 = v82;
    id v7 = v108;

    v84 = (void *)v102;
    v85 = v104;

    v86 = (void *)v103;
    v87 = v106;

    v88 = v105;
    unint64_t v89 = 0x1E4F5B000;
    v25 = v107;
  }
  else
  {
    if (v25 && ([v25 hasBaseline] & 1) == 0)
    {
      v90 = [(_UIButtonBarButtonVisualProviderCarPlay *)self contentView];
      v91 = [v90 centerYAnchor];
      v92 = [v6 centerYAnchor];
      uint64_t v93 = [v91 constraintEqualToAnchor:v92];
    }
    else
    {
      v90 = [(_UIButtonBarButtonVisualProviderCarPlay *)self contentView];
      v91 = [v90 firstBaselineAnchor];
      v92 = [v6 topAnchor];
      uint64_t v93 = [v91 constraintEqualToAnchor:v92 constant:28.0];
    }
    v87 = (void *)v93;

    v88 = [(_UIButtonBarButtonVisualProviderCarPlay *)self contentView];
    v85 = [v88 leadingAnchor];
    v84 = [v6 leadingAnchor];
    v86 = [v85 constraintEqualToAnchor:v84 constant:12.0];
    v130[0] = v86;
    v129 = [(_UIButtonBarButtonVisualProviderCarPlay *)self contentView];
    v94 = [v129 trailingAnchor];
    v127 = [v6 trailingAnchor];
    v128 = v94;
    v126 = [v94 constraintEqualToAnchor:v127 constant:-12.0];
    v130[1] = v126;
    v130[2] = v87;
    v125 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    v95 = [v125 topAnchor];
    v123 = [v6 topAnchor];
    v124 = v95;
    v122 = [v95 constraintEqualToAnchor:v123 constant:5.0];
    v130[3] = v122;
    v121 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    v96 = [v121 leadingAnchor];
    v119 = [v6 leadingAnchor];
    v120 = v96;
    v118 = [v96 constraintEqualToAnchor:v119 constant:5.0];
    v130[4] = v118;
    v117 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    v97 = [v117 trailingAnchor];
    v115 = [v6 trailingAnchor];
    v116 = v97;
    v114 = [v97 constraintEqualToAnchor:v115 constant:-5.0];
    v130[5] = v114;
    v113 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    v98 = [v113 bottomAnchor];
    v111 = [v6 bottomAnchor];
    v112 = v98;
    v110 = [v98 constraintEqualToAnchor:v111 constant:-5.0];
    v130[6] = v110;
    v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:7];
    -[_UIButtonBarButtonVisualProviderCarPlay setButtonConstraints:](self, "setButtonConstraints:");
    unint64_t v89 = 0x1E4F5B000uLL;
  }

  v99 = *(void **)(v89 + 616);
  v100 = [(_UIButtonBarButtonVisualProviderCarPlay *)self buttonConstraints];
  [v99 activateConstraints:v100];
}

- (void)buttonLayoutSubviews:(id)a3 baseImplementation:(id)a4
{
  v28 = (void (**)(void))a4;
  v5 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleAlternatives];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
    objc_msgSend(v7, "_nsis_bounds");
    double v9 = v8;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    [WeakRetained backButtonMaximumWidth];
    double v12 = v11;

    if (v9 >= v12) {
      double v13 = v12;
    }
    else {
      double v13 = v9;
    }
    if (v12 > 0.0) {
      double v9 = v13;
    }
    v14 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleAlternatives];
    uint64_t v15 = [v14 count];

    if (!v15) {
      goto LABEL_14;
    }
    unint64_t v16 = 0;
    v17 = &stru_1ED0E84C0;
    do
    {
      v18 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleAlternatives];
      v19 = [v18 objectAtIndexedSubscript:v16];

      [v19 width];
      if (v20 <= v9) {
        break;
      }

      ++v16;
      v21 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleAlternatives];
      unint64_t v22 = [v21 count];
    }
    while (v16 < v22);
    if (v19)
    {
      v17 = [v19 title];
    }
    else
    {
LABEL_14:
      v17 = &stru_1ED0E84C0;
    }
    uint64_t v23 = [(__CFString *)v17 length];
    v24 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backViewToContentConstraint];
    v25 = v24;
    double v26 = 3.0;
    if (!v23) {
      double v26 = 0.0;
    }
    [v24 setConstant:v26];

    v27 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
    [v27 setText:v17];
  }
  v28[2]();
}

- (void)updateButton:(id)a3 forFocusedState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(_UIButtonBarButtonVisualProviderCarPlay *)self backView];
  if (v4)
  {
    id v7 = +[UIColor _carSystemFocusLabelColor];
    [v6 setTintColor:v7];

    double v8 = [(_UIButtonBarButtonVisualProviderCarPlay *)self imageView];
    double v9 = +[UIColor _carSystemFocusLabelColor];
    [v8 setTintColor:v9];

    v10 = +[UIColor _carSystemFocusLabelColor];
    double v11 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
    [v11 setTextColor:v10];

    id v18 = +[UIColor _carSystemFocusColor];
    double v12 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    [v12 setBackgroundColor:v18];
  }
  else
  {
    double v13 = +[UIColor _carSystemFocusColor];
    [v6 setTintColor:v13];

    v14 = [(_UIButtonBarButtonVisualProviderCarPlay *)self imageView];
    uint64_t v15 = +[UIColor _carSystemFocusColor];
    [v14 setTintColor:v15];

    unint64_t v16 = +[UIColor _carSystemFocusColor];
    v17 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
    [v17 setTextColor:v16];

    id v18 = [(_UIButtonBarButtonVisualProviderCarPlay *)self focusedView];
    [v18 setBackgroundColor:0];
  }
}

- (void)updateButton:(id)a3 forHighlightedState:(BOOL)a4
{
  double v4 = 0.2;
  if (!a4) {
    double v4 = 1.0;
  }
  [a3 setAlpha:v4];
}

- (BOOL)supportsBackButtons
{
  return 1;
}

- (id)_titleAlternativeForTitle:(id)a3
{
  id v4 = a3;
  v5 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleAlterntativeLookup];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
  if (v6) {
    id v7 = {;
  }
    [v6 updateWithLabel:v7];
  }
  else {
    double v8 = {;
  }
    uint64_t v6 = +[_CarTitleAlternative alternativeWithTitle:v4 label:v8];

    id v7 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleAlterntativeLookup];
    [v7 setObject:v6 forKeyedSubscript:v4];
  }

  return v6;
}

- (void)_setupAlternateTitlesFromBarButtonItem:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_UIButtonBarButtonVisualProviderCarPlay *)self contentView];
  uint64_t v6 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];

  if (v5 == v6)
  {
    id v7 = [v4 _backButtonAlternateTitles];
    if (![v7 count])
    {
      [(_UIButtonBarButtonVisualProviderCarPlay *)self setTitleAlternatives:0];
      [(_UIButtonBarButtonVisualProviderCarPlay *)self setTitleAlterntativeLookup:0];
      goto LABEL_23;
    }
    double v8 = objc_opt_new();
    double v9 = [v4 title];
    v10 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleAlterntativeLookup];

    if (v10)
    {
      if (v9)
      {
LABEL_6:
        double v11 = [(_UIButtonBarButtonVisualProviderCarPlay *)self _titleAlternativeForTitle:v9];
        [v8 addObject:v11];
        [v11 width];
        double v13 = v12;

        goto LABEL_10;
      }
    }
    else
    {
      v14 = objc_opt_new();
      [(_UIButtonBarButtonVisualProviderCarPlay *)self setTitleAlterntativeLookup:v14];

      if (v9) {
        goto LABEL_6;
      }
    }
    double v13 = 1.79769313e308;
LABEL_10:
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v41 = v7;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v21 = [(_UIButtonBarButtonVisualProviderCarPlay *)self _titleAlternativeForTitle:v20];
          [v21 width];
          if (v22 < v13 && ([v20 isEqualToString:v9] & 1) == 0) {
            [v8 addObject:v21];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v17);
    }

    uint64_t v23 = (void *)[v8 copy];
    [(_UIButtonBarButtonVisualProviderCarPlay *)self setTitleAlternatives:v23];

    v24 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleAlternatives];
    unint64_t v25 = [v24 count];

    id v7 = v41;
    if (v25 > (v9 != 0))
    {
      double v26 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
      LODWORD(v27) = 1132068864;
      [v26 setContentCompressionResistancePriority:0 forAxis:v27];

      v28 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleAlternatives];
      v29 = [v28 firstObject];
      [v29 width];
      double v31 = v30;

      v32 = [(_UIButtonBarButtonVisualProviderCarPlay *)self maxTitleViewWidthConstraint];

      if (v32)
      {
        v33 = [(_UIButtonBarButtonVisualProviderCarPlay *)self maxTitleViewWidthConstraint];
        [v33 setConstant:v31];
      }
      else
      {
        v33 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
        v39 = [v33 widthAnchor];
        v40 = [v39 constraintLessThanOrEqualToConstant:v31];
        [(_UIButtonBarButtonVisualProviderCarPlay *)self setMaxTitleViewWidthConstraint:v40];
      }
      v36 = [(_UIButtonBarButtonVisualProviderCarPlay *)self maxTitleViewWidthConstraint];
      v37 = v36;
      uint64_t v38 = 1;
      goto LABEL_26;
    }
LABEL_23:
    uint64_t v34 = [(_UIButtonBarButtonVisualProviderCarPlay *)self titleView];
    LODWORD(v35) = 1144913920;
    [v34 setContentCompressionResistancePriority:0 forAxis:v35];

    v36 = [(_UIButtonBarButtonVisualProviderCarPlay *)self maxTitleViewWidthConstraint];
    v37 = v36;
    uint64_t v38 = 0;
LABEL_26:
    [v36 setActive:v38];

    goto LABEL_27;
  }
  [(_UIButtonBarButtonVisualProviderCarPlay *)self setTitleAlternatives:0];
  [(_UIButtonBarButtonVisualProviderCarPlay *)self setTitleAlterntativeLookup:0];
LABEL_27:
}

- (_UIButtonBarAppearanceDelegate)appearanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  return (_UIButtonBarAppearanceDelegate *)WeakRetained;
}

- (void)setAppearanceDelegate:(id)a3
{
}

- (UIView)focusedView
{
  return self->_focusedView;
}

- (void)setFocusedView:(id)a3
{
}

- (UIImageView)backView
{
  return self->_backView;
}

- (void)setBackView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (NSArray)titleAlternatives
{
  return self->_titleAlternatives;
}

- (void)setTitleAlternatives:(id)a3
{
}

- (NSMutableDictionary)titleAlterntativeLookup
{
  return self->_titleAlterntativeLookup;
}

- (void)setTitleAlterntativeLookup:(id)a3
{
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
}

- (NSLayoutConstraint)maxTitleViewWidthConstraint
{
  return self->_maxTitleViewWidthConstraint;
}

- (void)setMaxTitleViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)backViewToContentConstraint
{
  return self->_backViewToContentConstraint;
}

- (void)setBackViewToContentConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backViewToContentConstraint, 0);
  objc_storeStrong((id *)&self->_maxTitleViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_titleAlterntativeLookup, 0);
  objc_storeStrong((id *)&self->_titleAlternatives, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backView, 0);
  objc_storeStrong((id *)&self->_focusedView, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
}

@end