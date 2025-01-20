@interface MapsSubtitleHeaderView
- (CardButton)leadingButton;
- (MapsSubtitleHeaderView)initWithTitle:(id)a3 subtitle:(id)a4 leadingButton:(id)a5 trailingButtons:(id)a6 delegate:(id)a7;
- (MapsSubtitleHeaderViewDelegate)delegate;
- (NSArray)trailingButtons;
- (UIStackView)trailingButtonsStackView;
- (id)_cardButtonForUnderlyingButton:(id)a3;
- (void)_pressedHeaderView;
- (void)_pressedLeadingButton:(id)a3;
- (void)_pressedTrailingButton:(id)a3;
- (void)_userInterfaceStyleDidChange;
- (void)setTrailingButtonsStackView:(id)a3;
@end

@implementation MapsSubtitleHeaderView

- (MapsSubtitleHeaderView)initWithTitle:(id)a3 subtitle:(id)a4 leadingButton:(id)a5 trailingButtons:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v136.receiver = self;
  v136.super_class = (Class)MapsSubtitleHeaderView;
  v17 = -[MapsSubtitleHeaderView initWithFrame:](&v136, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v18 = v17;
  if (v17)
  {
    id v116 = v14;
    p_leadingButton = &v17->_leadingButton;
    objc_storeStrong((id *)&v17->_leadingButton, a5);
    p_trailingButtons = (id *)&v18->_trailingButtons;
    objc_storeStrong((id *)&v18->_trailingButtons, a6);
    objc_storeWeak((id *)&v18->_delegate, v16);
    v121 = (id *)&v18->_leadingButton;
    v126 = *p_leadingButton;
    id v129 = [v15 count];
    v21 = objc_opt_new();
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v22 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v18 action:"_pressedHeaderView"];
    [v21 addGestureRecognizer:v22];

    v123 = v21;
    [(MapsSubtitleHeaderView *)v18 addSubview:v21];
    v23 = objc_opt_new();
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v24) = 1148846080;
    [v23 setContentHuggingPriority:1 forAxis:v24];
    v25 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody weight:UIFontWeightSemibold];
    [v23 setFont:v25];

    [v23 setText:v12];
    v131 = v23;
    [(MapsSubtitleHeaderView *)v18 addSubview:v23];
    if (v13)
    {
      v26 = objc_opt_new();
      [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v27) = 1148846080;
      [v26 setContentHuggingPriority:1 forAxis:v27];
      v28 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightMedium];
      [v26 setFont:v28];

      v29 = +[UIColor secondaryLabelColor];
      [v26 setTextColor:v29];

      [v26 setText:v13];
      [(MapsSubtitleHeaderView *)v18 addSubview:v26];
      v30 = v26;
    }
    else
    {
      v30 = 0;
    }
    v120 = v30;
    objc_storeStrong((id *)&v18->_subtitleLabel, v30);
    [(MapsSubtitleHeaderView *)v18 _userInterfaceStyleDidChange];
    if (v126)
    {
      [*v121 setTranslatesAutoresizingMaskIntoConstraints:0];
      [*v121 addTarget:v18 action:"_pressedLeadingButton:" forControlEvents:64];
      [(MapsSubtitleHeaderView *)v18 addSubview:*v121];
    }
    id v117 = v12;
    id v124 = v13;
    id v114 = v16;
    id v115 = v15;
    if (v129)
    {
      v31 = (UIStackView *)objc_alloc_init((Class)UIStackView);
      trailingButtonsStackView = v18->_trailingButtonsStackView;
      v18->_trailingButtonsStackView = v31;

      [(UIStackView *)v18->_trailingButtonsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIStackView *)v18->_trailingButtonsStackView setAxis:0];
      LODWORD(v33) = 1148846080;
      [(UIStackView *)v18->_trailingButtonsStackView setContentHuggingPriority:0 forAxis:v33];
      [(MapsSubtitleHeaderView *)v18 addSubview:v18->_trailingButtonsStackView];
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      v34 = [*p_trailingButtons reverseObjectEnumerator];
      id v35 = [v34 countByEnumeratingWithState:&v132 objects:v143 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v133;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v133 != v37) {
              objc_enumerationMutation(v34);
            }
            v39 = *(void **)(*((void *)&v132 + 1) + 8 * i);
            [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
            [v39 addTarget:v18 action:"_pressedTrailingButton:" forControlEvents:64];
            [(UIStackView *)v18->_trailingButtonsStackView addArrangedSubview:v39];
          }
          id v36 = [v34 countByEnumeratingWithState:&v132 objects:v143 count:16];
        }
        while (v36);
      }
    }
    if (v126) {
      [*v121 trailingAnchor];
    }
    else {
    uint64_t v40 = [(MapsSubtitleHeaderView *)v18 leadingAnchor];
    }
    if (v129)
    {
      v41 = [*p_trailingButtons lastObject];
      uint64_t v42 = [v41 leadingAnchor];

      double v43 = 0.0;
    }
    else
    {
      uint64_t v42 = [(MapsSubtitleHeaderView *)v18 trailingAnchor];
      double v43 = -16.0;
    }
    v118 = (void *)v42;
    v110 = [v131 leadingAnchor];
    v106 = [v110 constraintGreaterThanOrEqualToAnchor:v40 constant:16.0];
    v142[0] = v106;
    v103 = [v131 trailingAnchor];
    v101 = [v103 constraintLessThanOrEqualToAnchor:v42 constant:v43];
    v142[1] = v101;
    v99 = [v131 centerXAnchor];
    v97 = [(MapsSubtitleHeaderView *)v18 centerXAnchor];
    LODWORD(v44) = 1132134400;
    v95 = [v99 constraintEqualToAnchor:v97 constant:0.0 priority:v44];
    v142[2] = v95;
    v93 = [v123 leadingAnchor];
    v92 = [v93 constraintEqualToAnchor:v40];
    v142[3] = v92;
    v45 = [v123 trailingAnchor];
    [v45 constraintEqualToAnchor:v42];
    v46 = v119 = (void *)v40;
    v142[4] = v46;
    v47 = [v123 topAnchor];
    v48 = [(MapsSubtitleHeaderView *)v18 topAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    v142[5] = v49;
    v50 = [v123 bottomAnchor];
    v51 = [(MapsSubtitleHeaderView *)v18 bottomAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    v142[6] = v52;
    v53 = +[NSArray arrayWithObjects:v142 count:7];
    id v125 = [v53 mutableCopy];

    if (v124)
    {
      v94 = [v131 topAnchor];
      v111 = [(MapsSubtitleHeaderView *)v18 topAnchor];
      v107 = [v94 constraintEqualToAnchor:16.0];
      v141[0] = v107;
      v104 = [v120 leadingAnchor];
      v102 = [v104 constraintGreaterThanOrEqualToAnchor:v119 constant:16.0];
      v141[1] = v102;
      v100 = [v120 trailingAnchor];
      v98 = [v100 constraintLessThanOrEqualToAnchor:v118 constant:-16.0];
      v141[2] = v98;
      v54 = [v120 centerXAnchor];
      v55 = [(MapsSubtitleHeaderView *)v18 centerXAnchor];
      LODWORD(v56) = 1132134400;
      v96 = v54;
      v57 = [v54 constraintEqualToAnchor:v55 constant:0.0 priority:v56];
      v141[3] = v57;
      v58 = [v120 topAnchor];
      v59 = [v131 bottomAnchor];
      v60 = [v58 constraintEqualToAnchor:v59];
      v141[4] = v60;
      v61 = [v120 bottomAnchor];
      v62 = [(MapsSubtitleHeaderView *)v18 bottomAnchor];
      v63 = [v61 constraintEqualToAnchor:v62 constant:-12.0];
      v141[5] = v63;
      v64 = +[NSArray arrayWithObjects:v141 count:6];
      [v125 addObjectsFromArray:v64];

      v65 = v94;
    }
    else
    {
      v65 = [v131 centerYAnchor];
      v111 = [(MapsSubtitleHeaderView *)v18 centerYAnchor];
      v107 = [v65 constraintEqualToAnchor:];
      v140[0] = v107;
      v66 = [v131 topAnchor];
      v102 = [(MapsSubtitleHeaderView *)v18 topAnchor];
      v104 = v66;
      v100 = [v66 constraintGreaterThanOrEqualToAnchor:v102 constant:16.0];
      v140[1] = v100;
      v67 = [v131 bottomAnchor];
      v96 = [(MapsSubtitleHeaderView *)v18 bottomAnchor];
      v98 = v67;
      v55 = [v67 constraintLessThanOrEqualToAnchor:v96 constant:-12.0];
      v140[2] = v55;
      v57 = [v131 topAnchor];
      v58 = [(MapsSubtitleHeaderView *)v18 topAnchor];
      LODWORD(v68) = 1132134400;
      v59 = [v57 constraintEqualToAnchor:v58 constant:16.0 priority:v68];
      v140[3] = v59;
      v60 = [v131 bottomAnchor];
      v61 = [(MapsSubtitleHeaderView *)v18 bottomAnchor];
      LODWORD(v69) = 1132134400;
      v62 = [v60 constraintEqualToAnchor:v61 constant:-12.0 priority:v69];
      v140[4] = v62;
      v63 = +[NSArray arrayWithObjects:v140 count:5];
      [v125 addObjectsFromArray:v63];
    }

    if (v126)
    {
      v127 = [*v121 leadingAnchor];
      v112 = [(MapsSubtitleHeaderView *)v18 leadingAnchor];
      v108 = [v127 constraintEqualToAnchor:v112];
      v139[0] = v108;
      v105 = [*v121 topAnchor];
      v70 = [(MapsSubtitleHeaderView *)v18 topAnchor];
      v71 = [v105 constraintEqualToAnchor:v70];
      v139[1] = v71;
      v72 = [*v121 bottomAnchor];
      v73 = [(MapsSubtitleHeaderView *)v18 bottomAnchor];
      LODWORD(v74) = 1132134400;
      v75 = [v72 constraintEqualToAnchor:v73 constant:0.0 priority:v74];
      v139[2] = v75;
      v76 = [*v121 bottomAnchor];
      v77 = [(MapsSubtitleHeaderView *)v18 bottomAnchor];
      v78 = [v76 constraintLessThanOrEqualToAnchor:v77 constant:0.0];
      v139[3] = v78;
      v79 = +[NSArray arrayWithObjects:v139 count:4];
      [v125 addObjectsFromArray:v79];
    }
    if (v129)
    {
      v130 = [(UIStackView *)v18->_trailingButtonsStackView trailingAnchor];
      v128 = [(MapsSubtitleHeaderView *)v18 trailingAnchor];
      v122 = [v130 constraintEqualToAnchor:v128];
      v138[0] = v122;
      v113 = [(UIStackView *)v18->_trailingButtonsStackView topAnchor];
      v109 = [(MapsSubtitleHeaderView *)v18 topAnchor];
      v80 = [v113 constraintEqualToAnchor:v109];
      v138[1] = v80;
      v81 = [(UIStackView *)v18->_trailingButtonsStackView bottomAnchor];
      v82 = [(MapsSubtitleHeaderView *)v18 bottomAnchor];
      LODWORD(v83) = 1132134400;
      v84 = [v81 constraintEqualToAnchor:v82 constant:0.0 priority:v83];
      v138[2] = v84;
      v85 = [(UIStackView *)v18->_trailingButtonsStackView bottomAnchor];
      v86 = [(MapsSubtitleHeaderView *)v18 bottomAnchor];
      v87 = [v85 constraintLessThanOrEqualToAnchor:v86 constant:0.0];
      v138[3] = v87;
      v88 = +[NSArray arrayWithObjects:v138 count:4];
      [v125 addObjectsFromArray:v88];
    }
    +[NSLayoutConstraint activateConstraints:v125];
    uint64_t v137 = objc_opt_class();
    v89 = +[NSArray arrayWithObjects:&v137 count:1];
    id v90 = [(MapsSubtitleHeaderView *)v18 registerForTraitChanges:v89 withTarget:v18 action:"_userInterfaceStyleDidChange"];

    id v14 = v116;
    id v12 = v117;
    id v13 = v124;
    id v16 = v114;
    id v15 = v115;
  }

  return v18;
}

- (id)_cardButtonForUnderlyingButton:(id)a3
{
  id v4 = a3;
  id v5 = [(CardButton *)self->_leadingButton underlyingButton];

  if (v5 == v4)
  {
    id v13 = self->_leadingButton;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_trailingButtons;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v11 underlyingButton:v15];
          id v12 = (id)objc_claimAutoreleasedReturnValue();

          if (v12 == v4)
          {
            id v13 = v11;

            goto LABEL_13;
          }
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v13 = 0;
  }
LABEL_13:

  return v13;
}

- (void)_pressedHeaderView
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 headerViewTapped:self];
  }
}

- (void)_pressedLeadingButton:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = [(MapsSubtitleHeaderView *)self _cardButtonForUnderlyingButton:v8];
    [v6 leadingButtonTapped:v7];
  }
}

- (void)_pressedTrailingButton:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = [(MapsSubtitleHeaderView *)self _cardButtonForUnderlyingButton:v8];
    [v6 trailingButtonTapped:v7];
  }
}

- (void)_userInterfaceStyleDidChange
{
  v3 = [(MapsSubtitleHeaderView *)self traitCollection];
  BOOL v4 = [v3 userInterfaceStyle] != (id)2;

  subtitleLabel = self->_subtitleLabel;

  [(UILabel *)subtitleLabel _setDrawsAsBackdropOverlayWithBlendMode:v4];
}

- (CardButton)leadingButton
{
  return self->_leadingButton;
}

- (NSArray)trailingButtons
{
  return self->_trailingButtons;
}

- (MapsSubtitleHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsSubtitleHeaderViewDelegate *)WeakRetained;
}

- (UIStackView)trailingButtonsStackView
{
  return self->_trailingButtonsStackView;
}

- (void)setTrailingButtonsStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingButtonsStackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingButtons, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);

  objc_storeStrong((id *)&self->_subtitleLabel, 0);
}

@end