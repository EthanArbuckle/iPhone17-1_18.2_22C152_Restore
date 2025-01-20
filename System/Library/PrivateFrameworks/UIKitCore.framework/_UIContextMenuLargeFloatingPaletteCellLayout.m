@interface _UIContextMenuLargeFloatingPaletteCellLayout
- (BOOL)allowsHighlightingOnHover;
- (BOOL)useContentShapeForSelectionHighlight;
- (NSArray)managedConstraints;
- (UIColor)preferredBackgroundColorForCurrentState;
- (UIColor)preferredContentColorForCurrentState;
- (UIHoverStyle)hoverStyle;
- (UIShape)contentShape;
- (_UIContextMenuCellContentView)contentView;
- (_UIContextMenuLargeFloatingPaletteCellLayout)initWithContentView:(id)a3;
- (_UIFloatingContentView)floatingContentView;
- (id)preferredIconFontUsingBoldFont:(BOOL)a3;
- (int64_t)focusStyle;
- (int64_t)labelTextAlignment;
- (int64_t)layoutSize;
- (unint64_t)controlState;
- (unint64_t)labelMaximumNumberOfLines;
- (void)_configureSharedFloatingContentViewStyleForImageStyle:(BOOL)a3;
- (void)installConstraints;
- (void)removeConstraints;
- (void)setContentView:(id)a3;
- (void)setControlState:(unint64_t)a3;
- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)setFloatingContentView:(id)a3;
- (void)setManagedConstraints:(id)a3;
@end

@implementation _UIContextMenuLargeFloatingPaletteCellLayout

- (_UIContextMenuLargeFloatingPaletteCellLayout)initWithContentView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuLargeFloatingPaletteCellLayout;
  v5 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(_UIContextMenuLargeFloatingPaletteCellLayout *)v5 setContentView:v4];
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(_UIContextMenuLargeFloatingPaletteCellLayout *)v6 setManagedConstraints:v7];
  }
  return v6;
}

- (int64_t)layoutSize
{
  return 2;
}

- (int64_t)labelTextAlignment
{
  return 1;
}

- (unint64_t)labelMaximumNumberOfLines
{
  v2 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self contentView];
  v3 = [v2 iconView];
  if (v3) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = 3;
  }

  return v4;
}

- (BOOL)allowsHighlightingOnHover
{
  return 0;
}

- (id)preferredIconFontUsingBoldFont:(BOOL)a3
{
  unint64_t v4 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self contentView];
  v5 = [v4 traitCollection];
  v6 = _UIContextMenuGetPlatformMetrics([v5 userInterfaceIdiom]);
  v7 = v6;
  if (a3) {
    [v6 titleEmphasizedFont];
  }
  else {
  v8 = [v6 titleFont];
  }
  objc_super v9 = [v8 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v5];

  return v9;
}

- (UIColor)preferredContentColorForCurrentState
{
  if (([(_UIContextMenuLargeFloatingPaletteCellLayout *)self controlState] & 8) != 0
    && ([(_UIContextMenuLargeFloatingPaletteCellLayout *)self contentView],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 iconView],
        unint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    v5 = +[UIColor labelColor];
  }
  else
  {
    v5 = 0;
  }
  return (UIColor *)v5;
}

- (UIColor)preferredBackgroundColorForCurrentState
{
  return +[UIColor clearColor];
}

- (UIHoverStyle)hoverStyle
{
  return 0;
}

- (UIShape)contentShape
{
  v2 = +[UIShape rectShapeWithCornerRadius:8.0];
  v3 = objc_msgSend(v2, "shapeByApplyingInsets:", 8.0, 0.0, 8.0, 0.0);

  return (UIShape *)v3;
}

- (BOOL)useContentShapeForSelectionHighlight
{
  return 0;
}

- (int64_t)focusStyle
{
  return 0;
}

- (void)installConstraints
{
  v2 = self;
  v164[6] = *MEMORY[0x1E4F143B8];
  [(_UIContextMenuLargeFloatingPaletteCellLayout *)self removeConstraints];
  v3 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v4 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)v2 contentView];
  v5 = [v4 labelStackView];
  [v5 removeFromSuperview];

  v6 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)v2 floatingContentView];

  if (!v6)
  {
    v7 = [_UIFloatingContentView alloc];
    v8 = -[_UIFloatingContentView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIContextMenuLargeFloatingPaletteCellLayout *)v2 setFloatingContentView:v8];
  }
  objc_super v9 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)v2 floatingContentView];
  [v4 addSubview:v9];

  v10 = [v4 iconView];
  v11 = [v4 titleLabel];
  v12 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)v2 floatingContentView];
  v156 = v11;
  v151 = v10;
  if (v10)
  {
    [(_UIContextMenuLargeFloatingPaletteCellLayout *)v2 _configureSharedFloatingContentViewStyleForImageStyle:1];
    [v4 addSubview:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v142 = v2;
      id v152 = v10;
      v138 = [v152 _currentImage];
      v132 = [v12 topAnchor];
      v126 = [v4 topAnchor];
      v120 = [v132 constraintEqualToAnchor:v126 constant:30.0];
      v164[0] = v120;
      v115 = [v12 widthAnchor];
      [v138 size];
      v112 = objc_msgSend(v115, "constraintEqualToConstant:");
      v164[1] = v112;
      v109 = [v12 heightAnchor];
      [v138 size];
      v106 = [v109 constraintEqualToConstant:v13];
      v164[2] = v106;
      [v12 centerXAnchor];
      v104 = v14 = v4;
      [v4 centerXAnchor];
      v15 = v3;
      v16 = v147 = v3;
      v17 = [v104 constraintEqualToAnchor:v16];
      v164[3] = v17;
      v18 = [v12 leadingAnchor];
      v19 = [v14 leadingAnchor];
      v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19];
      v164[4] = v20;
      v21 = [v12 trailingAnchor];
      v149 = v14;
      v22 = [v14 trailingAnchor];
      [v21 constraintLessThanOrEqualToAnchor:v22];
      v23 = v146 = v12;
      v164[5] = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:6];
      [v15 addObjectsFromArray:v24];

      v25 = [v146 contentView];
      [v25 addSubview:v152];

      v133 = [v152 widthAnchor];
      [v138 size];
      v127 = objc_msgSend(v133, "constraintEqualToConstant:");
      v163[0] = v127;
      v121 = [v152 heightAnchor];
      [v138 size];
      v27 = [v121 constraintEqualToConstant:v26];
      v163[1] = v27;
      v28 = [v152 centerXAnchor];
      v29 = [v146 contentView];
      v30 = [v29 centerXAnchor];
      v31 = [v28 constraintEqualToAnchor:v30];
      v163[2] = v31;
      v32 = [v152 centerYAnchor];
      v33 = [v146 contentView];
      v34 = [v33 centerYAnchor];
      v35 = [v32 constraintEqualToAnchor:v34];
      v163[3] = v35;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v163 count:4];
      [v147 addObjectsFromArray:v36];

      v37 = v156;
      if (v156)
      {
        v38 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption1"];
        [v156 setFont:v38];

        BOOL v39 = ([(_UIContextMenuLargeFloatingPaletteCellLayout *)v142 controlState] & 8) == 0
           && ([(_UIContextMenuLargeFloatingPaletteCellLayout *)v142 controlState] & 1) == 0;
        [v156 setHidden:v39];
        [v149 addSubview:v156];
        v137 = [v156 topAnchor];
        v131 = [v146 bottomAnchor];
        v125 = [v137 constraintEqualToAnchor:v131 constant:5.0];
        v162[0] = v125;
        v119 = [v156 bottomAnchor];
        v95 = [v149 bottomAnchor];
        v96 = [v119 constraintLessThanOrEqualToAnchor:v95 constant:-16.0];
        v162[1] = v96;
        v97 = [v156 centerXAnchor];
        v98 = [v146 centerXAnchor];
        v99 = [v97 constraintEqualToAnchor:v98];
        v162[2] = v99;
        v100 = [v156 widthAnchor];
        v101 = [v146 widthAnchor];
        v102 = [v100 constraintEqualToAnchor:v101];
        v162[3] = v102;
        v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:4];
        [v147 addObjectsFromArray:v103];

        v37 = v156;
        v67 = v147;

        unint64_t v4 = v149;
        [v156 setPreferredMaxLayoutWidth:0.0];
      }
      else
      {
        v91 = [v146 bottomAnchor];
        unint64_t v4 = v149;
        v92 = [v149 bottomAnchor];
        v93 = [v91 constraintLessThanOrEqualToAnchor:v92 constant:-46.0];
        v161 = v93;
        v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v161 count:1];
        v67 = v147;
        [v147 addObjectsFromArray:v94];
      }
      v2 = v142;

      v74 = v151;
      v66 = v152;
      v12 = v146;
    }
    else
    {
      [v4 addSubview:v10];
      v154 = [v10 centerYAnchor];
      v144 = [v4 centerYAnchor];
      v68 = [v154 constraintEqualToAnchor:v144];
      v160[0] = v68;
      v69 = [v10 centerXAnchor];
      v70 = [v4 centerXAnchor];
      [v69 constraintEqualToAnchor:v70];
      v72 = v71 = v12;
      v160[1] = v72;
      v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v160 count:2];
      v67 = (void *)[v73 mutableCopy];

      v12 = v71;
      v74 = v151;
      v66 = v154;

      v37 = v156;
    }
  }
  else
  {
    v148 = v3;
    v150 = v4;
    if (v11)
    {
      v40 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption1"];
      [v11 setFont:v40];

      [(_UIContextMenuLargeFloatingPaletteCellLayout *)v2 _configureSharedFloatingContentViewStyleForImageStyle:0];
      v41 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)v2 contentView];
      v42 = [v41 traitCollection];
      uint64_t v43 = [v42 userInterfaceIdiom];

      v153 = _UIContextMenuGetPlatformMetrics(v43);
      [v153 paletteMinimumItemSize];
      double v45 = v44;
      double v47 = v46;
      v139 = [v12 topAnchor];
      v134 = [v4 topAnchor];
      v128 = [v139 constraintEqualToAnchor:v134 constant:30.0];
      v159[0] = v128;
      v122 = [v12 bottomAnchor];
      v116 = [v4 bottomAnchor];
      v113 = [v122 constraintEqualToAnchor:v116 constant:-46.0];
      v159[1] = v113;
      v110 = [v12 leadingAnchor];
      v107 = [v4 leadingAnchor];
      v48 = [v110 constraintEqualToAnchor:v107];
      v159[2] = v48;
      v49 = [v12 trailingAnchor];
      v50 = [v150 trailingAnchor];
      v51 = [v49 constraintEqualToAnchor:v50];
      v159[3] = v51;
      v52 = [v12 widthAnchor];
      v53 = [v52 constraintGreaterThanOrEqualToConstant:v45];
      v159[4] = v53;
      v54 = [v12 heightAnchor];
      v55 = [v54 constraintGreaterThanOrEqualToConstant:v47];
      v159[5] = v55;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v159 count:6];
      v56 = v143 = v2;
      [v148 addObjectsFromArray:v56];

      v57 = [v12 contentView];
      [v57 addSubview:v156];

      v140 = [v156 topAnchor];
      v135 = [v12 topAnchor];
      v129 = [v140 constraintEqualToAnchor:v135 constant:19.0];
      v158[0] = v129;
      v123 = [v156 bottomAnchor];
      v117 = [v12 bottomAnchor];
      v58 = [v123 constraintEqualToAnchor:v117 constant:-19.0];
      v158[1] = v58;
      v59 = [v156 centerXAnchor];
      v60 = [v12 centerXAnchor];
      v61 = [v59 constraintEqualToAnchor:v60];
      v158[2] = v61;
      v62 = [v156 widthAnchor];
      v63 = [v12 widthAnchor];
      v64 = [v62 constraintLessThanOrEqualToAnchor:v63 constant:-20.0];
      v158[3] = v64;
      v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v158 count:4];
      [v148 addObjectsFromArray:v65];

      v37 = v156;
      v66 = v153;

      v67 = v148;
      unint64_t v4 = v150;

      v2 = v143;
      [v156 setPreferredMaxLayoutWidth:208.0];
    }
    else
    {
      [(_UIContextMenuLargeFloatingPaletteCellLayout *)v2 _configureSharedFloatingContentViewStyleForImageStyle:0];
      v75 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)v2 contentView];
      v76 = [v75 traitCollection];
      uint64_t v77 = [v76 userInterfaceIdiom];

      v155 = _UIContextMenuGetPlatformMetrics(v77);
      [v155 paletteMinimumItemSize];
      double v79 = v78;
      double v81 = v80;
      v145 = [v12 topAnchor];
      v141 = [v4 topAnchor];
      v136 = [v145 constraintEqualToAnchor:v141 constant:30.0];
      v157[0] = v136;
      v130 = [v12 bottomAnchor];
      v124 = [v4 bottomAnchor];
      v118 = [v130 constraintEqualToAnchor:v124 constant:-46.0];
      v157[1] = v118;
      v114 = [v12 leadingAnchor];
      v111 = [v4 leadingAnchor];
      v108 = [v114 constraintEqualToAnchor:v111];
      v157[2] = v108;
      v105 = [v12 trailingAnchor];
      v82 = [v4 trailingAnchor];
      v83 = [v105 constraintEqualToAnchor:v82];
      v157[3] = v83;
      v84 = [v12 widthAnchor];
      v85 = [v84 constraintEqualToConstant:v79];
      v157[4] = v85;
      v86 = [v12 heightAnchor];
      v87 = [v86 constraintEqualToConstant:v81];
      v157[5] = v87;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v157 count:6];
      v88 = v12;
      v90 = v89 = v2;
      v67 = v148;
      [v148 addObjectsFromArray:v90];

      v2 = v89;
      v12 = v88;

      v37 = v156;
      v66 = v155;

      unint64_t v4 = v150;
    }
    v74 = 0;
  }

  [MEMORY[0x1E4F5B268] activateConstraints:v67];
  [(_UIContextMenuLargeFloatingPaletteCellLayout *)v2 setManagedConstraints:v67];
}

- (void)removeConstraints
{
  v3 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v3 removeFromSuperview];

  unint64_t v4 = (void *)MEMORY[0x1E4F5B268];
  v5 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self managedConstraints];
  [v4 deactivateConstraints:v5];

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;
}

- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  char v4 = a3;
  self->_controlState = a3;
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:](self->_floatingContentView, "setControlState:withAnimationCoordinator:");
  v6 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self contentView];
  v7 = [v6 iconView];

  if (v7)
  {
    id v9 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self contentView];
    v8 = [v9 titleLabel];
    [v8 setHidden:(v4 & 9) == 0];
  }
}

- (void)_configureSharedFloatingContentViewStyleForImageStyle:(BOOL)a3
{
  v5 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  v6 = +[_UIFocusAnimationConfiguration configurationWithStyle:2];
  [v5 setFocusAnimationConfiguration:v6];

  v7 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v7 setCornerRadius:24.0];

  v8 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v8 setRoundContentWhenDeselected:1];

  id v9 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v9 setClipsContentToBounds:1];

  v10 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v10 setFocusedSizeIncrease:20.0];

  v11 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v11 setUseShadowImage:0];

  v12 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v12 setShadowRadius:10.0];

  double v13 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v13 setShadowVerticalOffset:15.0];

  v14 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  objc_msgSend(v14, "setContentMotionRotation:translation:", 0.0, 0.0, 4.0, 4.0);

  v15 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  objc_msgSend(v15, "setFocusScaleAnchorPoint:", 0.5, 1.0);

  v16 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self contentView];
  v17 = [v16 traitCollection];
  uint64_t v18 = [v17 userInterfaceIdiom];

  v19 = _UIContextMenuGetPlatformMetrics(v18);
  id v32 = v19;
  if (a3)
  {
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
  }
  else
  {
    v24 = [v19 itemBackgroundColorProvider];
    v22 = v24[2](v24, 0, 0);

    v25 = [v32 itemBackgroundColorProvider];
    v21 = v25[2](v25, 8, 0);

    double v26 = [v32 itemBackgroundColorProvider];
    v23 = v26[2](v26, 1, 0);

    v27 = [v32 itemBackgroundColorProvider];
    v20 = v27[2](v27, 4, 0);
  }
  v28 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v28 setBackgroundColor:v22 forState:0];

  v29 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v29 setBackgroundColor:v21 forState:8];

  v30 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v30 setBackgroundColor:v23 forState:1];

  v31 = [(_UIContextMenuLargeFloatingPaletteCellLayout *)self floatingContentView];
  [v31 setBackgroundColor:v20 forState:4];
}

- (_UIContextMenuCellContentView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  return (_UIContextMenuCellContentView *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (NSArray)managedConstraints
{
  return self->_managedConstraints;
}

- (void)setManagedConstraints:(id)a3
{
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void)setFloatingContentView:(id)a3
{
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (void)setControlState:(unint64_t)a3
{
  self->_controlState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingContentView, 0);
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end