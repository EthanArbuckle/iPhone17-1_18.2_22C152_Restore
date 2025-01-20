@interface RUIOsloStyle
- (RUIOsloStyle)init;
- (id)_backgroundColor;
- (int64_t)tableViewStyle;
- (void)_applyToTitleLabel:(id)a3;
- (void)applyToLabel:(id)a3;
- (void)applyToNavigationBar:(id)a3;
- (void)applyToObjectModel:(id)a3;
@end

@implementation RUIOsloStyle

- (RUIOsloStyle)init
{
  v13.receiver = self;
  v13.super_class = (Class)RUIOsloStyle;
  v2 = [(RUIStyle *)&v13 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F825C8] _labelColor];
    [(RUIStyle *)v2 setFooterLabelTextColor:v3];

    v4 = [MEMORY[0x263F825C8] _labelColor];
    [(RUIStyle *)v2 setHeaderLabelTextColor:v4];

    [(RUIStyle *)v2 setHeaderLabelAlignment:1];
    v5 = [MEMORY[0x263F825C8] _labelColor];
    [(RUIStyle *)v2 setSubHeaderLabelTextColor:v5];

    [(RUIStyle *)v2 setSubHeaderLabelAlignment:1];
    v6 = [MEMORY[0x263F825C8] _labelColor];
    [(RUIStyle *)v2 setDetailHeaderLabelTextColor:v6];

    [(RUIStyle *)v2 setFooterLabelAlignment:1];
    v7 = [(RUIOsloStyle *)v2 _backgroundColor];
    [(RUIStyle *)v2 setBackgroundColor:v7];

    v8 = [MEMORY[0x263F81708] systemFontOfSize:15.0 weight:*MEMORY[0x263F81838]];
    [(RUIStyle *)v2 setFooterFont:v8];

    [(RUIStyle *)v2 setHeaderImagePadding:16.0];
    [(RUIStyle *)v2 setUseNonOBStyleButton:1];
    v9 = [MEMORY[0x263F825C8] _secondaryLabelColor];
    [(RUIStyle *)v2 setSpinnerLabelColor:v9];

    v10 = [MEMORY[0x263F81708] systemFontOfSize:15.0];
    [(RUIStyle *)v2 setSpinnerLabelFont:v10];

    v11 = [MEMORY[0x263F81708] systemFontOfSize:18.0 weight:*MEMORY[0x263F81840]];
    [(RUIStyle *)v2 setNavBarButtonLabelFont:v11];

    [(RUIStyle *)v2 setNavBarLabelSpacingWithImage:6.0];
    [(RUIStyle *)v2 setFooterTopMargin:22.0];
    [(RUIStyle *)v2 setSubHeaderTopMargin:16.0];
    -[RUIStyle setHeaderMargin:](v2, "setHeaderMargin:", 0.0, 0.0, 0.0, 0.0);
    [(RUIStyle *)v2 setMultiChoiceStackViewElementSpacing:10.0];
    [(RUIStyle *)v2 setMultiChoiceStackViewTopAndBottomMargin:5.0];
    [(RUIStyle *)v2 setSectionHeaderHeight:22.0];
    [(RUIStyle *)v2 setHeaderContainerSideMargin:16.0];
    [(RUIStyle *)v2 setMinimumHeightOfAdaptiveSheet:505.0];
  }
  return v2;
}

- (void)_applyToTitleLabel:(id)a3
{
  id v3 = a3;
  id v4 = [getBFFStyleClass() sharedStyle];
  [v4 applyThemeToTitleLabel:v3];
}

- (void)applyToLabel:(id)a3
{
  id v3 = a3;
  id v4 = [getBFFStyleClass() sharedStyle];
  [v4 applyThemeToLabel:v3];
}

- (void)applyToNavigationBar:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RUIOsloStyle;
  id v4 = a3;
  [(RUIStyle *)&v7 applyToNavigationBar:v4];
  v5 = objc_opt_new();
  objc_msgSend(v4, "setBackgroundImage:forBarMetrics:", v5, 0, v7.receiver, v7.super_class);

  v6 = [(RUIStyle *)self backgroundColor];
  [v4 setBackgroundColor:v6];
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)_backgroundColor
{
  return (id)[MEMORY[0x263F825C8] systemGroupedBackgroundColor];
}

- (void)applyToObjectModel:(id)a3
{
  uint64_t v162 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v158.receiver = self;
  v158.super_class = (Class)RUIOsloStyle;
  [(RUIStyle *)&v158 applyToObjectModel:v4];
  [v4 setNextButtonStyle:2];
  v131 = v4;
  [v4 allPages];
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v154 objects:v161 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v155;
    double v8 = *MEMORY[0x263F81800];
    double v9 = *MEMORY[0x263F81840];
    uint64_t v132 = *(void *)v155;
    v133 = self;
    do
    {
      uint64_t v10 = 0;
      uint64_t v134 = v6;
      do
      {
        if (*(void *)v155 != v7) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v154 + 1) + 8 * v10);
        [v11 setShowsTitlesAsHeaderViews:0];
        [v11 setExtendedLayoutIncludesOpaqueBars:1];
        [v11 setEdgesForExtendedLayout:1];
        [v11 loadViewIfNeeded];
        v12 = [v11 titleLabel];
        [(RUIOsloStyle *)self _applyToTitleLabel:v12];

        objc_super v13 = [v11 attributes];
        v14 = [v13 objectForKeyedSubscript:@"horizontalMargin"];

        if (v14)
        {
          v15 = [v11 attributes];
          v16 = [v15 objectForKeyedSubscript:@"horizontalMargin"];
          [v16 floatValue];
          double v18 = v17;
LABEL_8:
          [v11 setCustomMargin:v18];

LABEL_9:
          goto LABEL_10;
        }
        v15 = [v11 view];
        uint64_t v124 = [v15 superview];
        if (!v124) {
          goto LABEL_9;
        }
        v125 = (void *)v124;
        char v126 = [v11 hasTableView];

        if ((v126 & 1) == 0)
        {
          v127 = [v11 view];
          v128 = [v127 traitCollection];
          uint64_t v129 = [v128 horizontalSizeClass];

          if (v129 == 1)
          {
            v15 = [getBFFStyleClass() sharedStyle];
            v16 = [v11 view];
            [v15 horizontalMarginForView:v16];
            goto LABEL_8;
          }
          [v11 setCustomMargin:0.0];
        }
LABEL_10:
        if ([v11 hasTableView])
        {
          uint64_t v140 = v10;
          v19 = [v11 tableViewOM];
          v138 = [v19 tableView];
          [v138 setBounces:0];
          v20 = [v19 headerView];
          v21 = [v20 headerLabel];

          [v21 setAdjustsFontSizeToFitWidth:1];
          [v21 setMinimumScaleFactor:0.70588237];
          v22 = [MEMORY[0x263F81708] systemFontOfSize:24.0 weight:v8];
          v137 = v21;
          [v21 setFont:v22];

          v23 = [v19 headerView];
          v24 = [v23 subHeaderLabel];

          [v24 setAdjustsFontSizeToFitWidth:1];
          [v24 setMinimumScaleFactor:0.70588237];
          v25 = [MEMORY[0x263F81708] systemFontOfSize:15.0];
          v136 = v24;
          [v24 setFont:v25];

          v139 = v19;
          v26 = [v19 sections];
          long long v150 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          long long v153 = 0u;
          id v141 = v26;
          uint64_t v143 = [v26 countByEnumeratingWithState:&v150 objects:v160 count:16];
          if (!v143) {
            goto LABEL_58;
          }
          uint64_t v142 = *(void *)v151;
          while (1)
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v151 != v142) {
                objc_enumerationMutation(v141);
              }
              uint64_t v144 = v27;
              v28 = [*(id *)(*((void *)&v150 + 1) + 8 * v27) rows];
              long long v146 = 0u;
              long long v147 = 0u;
              long long v148 = 0u;
              long long v149 = 0u;
              id v145 = v28;
              uint64_t v29 = [v28 countByEnumeratingWithState:&v146 objects:v159 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v147;
                do
                {
                  uint64_t v32 = 0;
                  do
                  {
                    if (*(void *)v147 != v31) {
                      objc_enumerationMutation(v145);
                    }
                    v33 = *(void **)(*((void *)&v146 + 1) + 8 * v32);
                    v34 = [v33 tableCell];
                    v35 = [v33 attributes];
                    v36 = [v35 objectForKey:@"class"];
                    if ([v36 isEqualToString:@"label"])
                    {
                      v37 = [v33 attributes];
                      v38 = [v37 objectForKey:@"detailLinkURL"];

                      if (!v38)
                      {
                        v39 = [v34 ruiTextLabel];
                        v40 = [v39 text];
                        uint64_t v41 = [v40 length];

                        if (v41)
                        {
                          [v39 setAdjustsFontSizeToFitWidth:1];
                          [v39 setMinimumScaleFactor:0.70588237];
                          v42 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
                          [v39 setFont:v42];

                          [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
                          if ([v33 hasImage]
                            && ([v33 attributes],
                                v43 = objc_claimAutoreleasedReturnValue(),
                                [v43 objectForKey:@"accessory"],
                                v44 = objc_claimAutoreleasedReturnValue(),
                                v44,
                                v43,
                                !v44))
                          {
                            v45 = [v34 ruiImageView];
                            [v45 setTranslatesAutoresizingMaskIntoConstraints:0];
                            v113 = [v45 leadingAnchor];
                            v114 = [v34 leadingAnchor];
                            v115 = [v113 constraintEqualToAnchor:v114 constant:16.0];
                            [v115 setActive:1];

                            v116 = [v45 centerYAnchor];
                            v117 = [v34 centerYAnchor];
                            v118 = [v116 constraintEqualToAnchor:v117];
                            [v118 setActive:1];

                            v46 = [v39 leadingAnchor];
                            v47 = [v45 trailingAnchor];
                            v119 = [v46 constraintEqualToAnchor:v47 constant:15.0];
                            [v119 setActive:1];
                          }
                          else
                          {
                            v45 = [v39 leadingAnchor];
                            v46 = [v34 leadingAnchor];
                            v47 = [v45 constraintEqualToAnchor:v46 constant:16.0];
                            [v47 setActive:1];
                          }

                          v48 = [v39 centerYAnchor];
                          v49 = [v34 centerYAnchor];
                          v50 = [v48 constraintEqualToAnchor:v49];
                          [v50 setActive:1];

                          v51 = [v34 detailTextLabel];
                          v52 = [v51 text];
                          uint64_t v53 = [v52 length];

                          if (v53)
                          {
                            v54 = [MEMORY[0x263F81708] systemFontOfSize:15.0 weight:v9];
                            [v51 setFont:v54];

                            [v51 setTranslatesAutoresizingMaskIntoConstraints:0];
                            v55 = [v51 leadingAnchor];
                            v56 = [v39 trailingAnchor];
                            v57 = [v55 constraintEqualToAnchor:v56 constant:16.0];
                            [v57 setActive:1];

                            v58 = [v51 bottomAnchor];
                            v59 = [v39 bottomAnchor];
                            v60 = [v58 constraintEqualToAnchor:v59];
                            [v60 setActive:1];
                          }
                          v61 = [v33 attributes];
                          v62 = [v61 objectForKey:@"labelAlign"];

                          if (v62) {
                            objc_msgSend(v39, "setTextAlignment:", +[RUIParser textAlignmentForString:](RUIParser, "textAlignmentForString:", v62));
                          }
                          goto LABEL_49;
                        }
                        goto LABEL_51;
                      }
                    }
                    else
                    {
                    }
                    v63 = [v33 attributes];
                    v64 = [v63 objectForKey:@"class"];
                    int v65 = [v64 isEqualToString:@"editableText"];

                    if (v65)
                    {
                      v39 = [v34 ruiTextLabel];
                      v66 = [v39 text];
                      uint64_t v67 = [v66 length];

                      if (v67)
                      {
                        [v39 setAdjustsFontSizeToFitWidth:1];
                        [v39 setMinimumScaleFactor:0.70588237];
                        v68 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
                        [v39 setFont:v68];

                        [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
                        v69 = [v39 centerYAnchor];
                        v70 = [v34 centerYAnchor];
                        v71 = [v69 constraintEqualToAnchor:v70];
                        [v71 setActive:1];

                        v72 = [v39 leadingAnchor];
                        v73 = [v34 leadingAnchor];
                        v74 = [v72 constraintEqualToAnchor:v73 constant:16.0];
                        [v74 setActive:1];

                        v75 = [v39 trailingAnchor];
                        v76 = [v34 leadingAnchor];
                        v77 = [v75 constraintEqualToAnchor:v76 constant:66.0];
                        [v77 setActive:1];

                        v78 = [v33 attributes];
                        v51 = [v78 objectForKey:@"labelAlign"];

                        if (v51) {
                          objc_msgSend(v39, "setTextAlignment:", +[RUIParser textAlignmentForString:](RUIParser, "textAlignmentForString:", v51));
                        }
                        v79 = [v34 ruiEditableTextField];
                        v80 = [MEMORY[0x263F81708] systemFontOfSize:15.0];
                        [v79 setFont:v80];

                        v81 = [MEMORY[0x263F825C8] _labelColor];
                        [v79 setTextColor:v81];

                        [v79 setTranslatesAutoresizingMaskIntoConstraints:0];
                        v82 = [v79 leadingAnchor];
                        v83 = [v39 trailingAnchor];
                        v84 = [v82 constraintEqualToAnchor:v83 constant:16.0];
                        [v84 setActive:1];

                        v85 = [v79 bottomAnchor];
                        v86 = [v39 bottomAnchor];
                        v87 = [v85 constraintEqualToAnchor:v86];
                        [v87 setActive:1];

                        goto LABEL_50;
                      }
                    }
                    else
                    {
                      v88 = [v33 attributes];
                      v89 = [v88 objectForKey:@"class"];
                      int v90 = [v89 isEqualToString:@"link"];

                      if (!v90)
                      {
                        v39 = [v33 attributes];
                        v51 = [v39 objectForKey:@"class"];
                        if ([v51 isEqualToString:@"label"])
                        {
                          v101 = [v33 attributes];
                          v102 = [v101 objectForKey:@"customDetailLink"];
                          int v103 = [v102 isEqualToString:@"true"];

                          if (!v103) {
                            goto LABEL_52;
                          }
                          v39 = [v34 ruiTextLabel];
                          v104 = [v33 attributes];
                          v51 = [v104 objectForKey:@"labelAlign"];

                          if (v51) {
                            objc_msgSend(v39, "setTextAlignment:", +[RUIParser textAlignmentForString:](RUIParser, "textAlignmentForString:", v51));
                          }
                        }
                        goto LABEL_50;
                      }
                      v39 = [v34 ruiTextLabel];
                      v91 = [v39 text];
                      uint64_t v92 = [v91 length];

                      if (v92)
                      {
                        [v39 setAdjustsFontSizeToFitWidth:1];
                        [v39 setMinimumScaleFactor:0.70588237];
                        v93 = [MEMORY[0x263F81708] systemFontOfSize:15.0];
                        [v39 setFont:v93];

                        if ([v33 hasImage])
                        {
                          v94 = [v34 ruiImageView];
                          [v94 setTranslatesAutoresizingMaskIntoConstraints:0];
                          v95 = [v94 centerYAnchor];
                          v96 = [v34 centerYAnchor];
                          v97 = [v95 constraintEqualToAnchor:v96];
                          [v97 setActive:1];

                          v98 = [v94 trailingAnchor];
                          v99 = [v39 leadingAnchor];
                          v100 = [v98 constraintEqualToAnchor:v99 constant:-6.0];
                          [v100 setActive:1];
                        }
                        else
                        {
                          v94 = [v39 leadingAnchor];
                          v98 = [v34 leadingAnchor];
                          v99 = [v94 constraintEqualToAnchor:v98 constant:15.0];
                          [v99 setActive:1];
                        }

                        v105 = [v33 attributes];
                        v106 = [v105 objectForKeyedSubscript:@"labelBold"];
                        int v107 = [v106 BOOLValue];

                        if (v107)
                        {
                          v108 = (void *)MEMORY[0x263F81708];
                          v109 = [v34 ruiTextLabel];
                          v110 = [v109 font];
                          [v110 pointSize];
                          v111 = objc_msgSend(v108, "boldSystemFontOfSize:");
                          [v39 setFont:v111];
                        }
                        v51 = [v39 centerYAnchor];
                        v62 = [v34 centerYAnchor];
                        v112 = [v51 constraintEqualToAnchor:v62];
                        [v112 setActive:1];

LABEL_49:
LABEL_50:
                      }
                    }
LABEL_51:

LABEL_52:
                    ++v32;
                  }
                  while (v30 != v32);
                  uint64_t v120 = [v145 countByEnumeratingWithState:&v146 objects:v159 count:16];
                  uint64_t v30 = v120;
                }
                while (v120);
              }

              uint64_t v27 = v144 + 1;
            }
            while (v144 + 1 != v143);
            uint64_t v143 = [v141 countByEnumeratingWithState:&v150 objects:v160 count:16];
            if (!v143)
            {
LABEL_58:

              self = v133;
              uint64_t v6 = v134;
              uint64_t v7 = v132;
              v121 = v139;
              uint64_t v10 = v140;
              v122 = v138;
              goto LABEL_61;
            }
          }
        }
        v123 = [(RUIOsloStyle *)self _backgroundColor];

        if (v123)
        {
          v121 = [v11 containerView];
          v122 = [(RUIOsloStyle *)self _backgroundColor];
          [v121 setBackgroundColor:v122];
LABEL_61:
        }
        ++v10;
      }
      while (v10 != v6);
      uint64_t v130 = [obj countByEnumeratingWithState:&v154 objects:v161 count:16];
      uint64_t v6 = v130;
    }
    while (v130);
  }
}

@end