@interface RUISetupAssistantStyle
- (BOOL)supportActivityIndicatorInPinView;
- (RUISetupAssistantStyle)init;
- (RUISetupAssitantLayout)setupAssistantLayout;
- (id)_backgroundColor;
- (id)barBackgroundImageForUserInterfaceStyle:(int64_t)a3;
- (id)insetGroupedCellBackgroundColor;
- (void)_applyToFooter:(id)a3 view:(id)a4;
- (void)_applyToTitleLabel:(id)a3;
- (void)applyToLabel:(id)a3;
- (void)applyToNavigationBar:(id)a3;
- (void)applyToObjectModel:(id)a3;
- (void)setSetupAssistantLayout:(id)a3;
@end

@implementation RUISetupAssistantStyle

- (RUISetupAssistantStyle)init
{
  v9.receiver = self;
  v9.super_class = (Class)RUISetupAssistantStyle;
  v2 = [(RUIStyle *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F825C8] _labelColor];
    [(RUIStyle *)v2 setHeaderLabelTextColor:v3];

    [(RUIStyle *)v2 setHeaderLabelAlignment:1];
    v4 = [MEMORY[0x263F825C8] _labelColor];
    [(RUIStyle *)v2 setSubHeaderLabelTextColor:v4];

    [(RUIStyle *)v2 setSubHeaderLabelAlignment:1];
    v5 = [MEMORY[0x263F825C8] _labelColor];
    [(RUIStyle *)v2 setDetailHeaderLabelTextColor:v5];

    [(RUIStyle *)v2 setFooterLabelAlignment:1];
    v6 = objc_alloc_init(RUISetupAssitantLayout);
    setupAssistantLayout = v2->_setupAssistantLayout;
    v2->_setupAssistantLayout = v6;
  }
  return v2;
}

- (id)barBackgroundImageForUserInterfaceStyle:(int64_t)a3
{
  v3 = objc_msgSend(MEMORY[0x263F825C8], "systemBackgroundColor", a3);
  v7.width = 1.0;
  v7.height = 1.0;
  UIGraphicsBeginImageContext(v7);
  [v3 set];
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 1.0;
  v8.size.height = 1.0;
  UIRectFill(v8);
  v4 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v4;
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

- (id)_backgroundColor
{
  v2 = [getBFFStyleClass() sharedStyle];
  id v3 = [v2 backgroundColor];

  return v3;
}

- (void)_applyToFooter:(id)a3 view:(id)a4
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v7 linkButton];
    v5 = [v4 titleLabel];
    v6 = UISystemFontForSize();
    [v5 setFont:v6];
  }
}

- (id)insetGroupedCellBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_255];
}

id __57__RUISetupAssistantStyle_insetGroupedCellBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] secondarySystemGroupedBackgroundColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  }
  return v2;
}

- (void)applyToObjectModel:(id)a3
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v110.receiver = self;
  v110.super_class = (Class)RUISetupAssistantStyle;
  [(RUIStyle *)&v110 applyToObjectModel:v4];
  [v4 setNextButtonStyle:2];
  v84 = v4;
  [v4 allPages];
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v106 objects:v113 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v107;
    double v85 = *MEMORY[0x263F83978];
    uint64_t v86 = *(void *)v107;
    do
    {
      uint64_t v8 = 0;
      uint64_t v87 = v6;
      do
      {
        if (*(void *)v107 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v106 + 1) + 8 * v8);
        [v9 setShowsTitlesAsHeaderViews:1];
        [v9 loadViewIfNeeded];
        if ([v9 hasWebView])
        {
          v10 = [v9 webViewOM];
          v11 = [v10 webView];

          v12 = [v11 scrollView];
          [v12 setDecelerationRate:v85];

          objc_msgSend(v11, "evaluateJavaScript:completionHandler:", @"document.body.style.webkitUserSelect='none';",
            0);
        }
        v13 = [v9 attributes];
        v14 = [v13 objectForKeyedSubscript:@"horizontalMargin"];

        if (v14)
        {
          v15 = [v9 attributes];
          v16 = [v15 objectForKeyedSubscript:@"horizontalMargin"];
          [v16 floatValue];
          double v18 = v17;
LABEL_10:
          [v9 setCustomMargin:v18];

LABEL_11:
          goto LABEL_12;
        }
        v15 = [v9 view];
        uint64_t v49 = [v15 superview];
        if (!v49) {
          goto LABEL_11;
        }
        v50 = (void *)v49;
        char v51 = [v9 hasTableView];

        if ((v51 & 1) == 0)
        {
          v52 = [v9 view];
          v53 = [v52 traitCollection];
          uint64_t v54 = [v53 horizontalSizeClass];

          if (v54 == 1)
          {
            v15 = [getBFFStyleClass() sharedStyle];
            v16 = [v9 view];
            [v15 horizontalMarginForView:v16];
            goto LABEL_10;
          }
          [v9 setCustomMargin:0.0];
        }
LABEL_12:
        v19 = [v9 titleLabel];
        [(RUISetupAssistantStyle *)self _applyToTitleLabel:v19];

        v20 = [(RUISetupAssistantStyle *)self _backgroundColor];

        if (v20)
        {
          v21 = [(RUISetupAssistantStyle *)self _backgroundColor];
          v22 = [v9 view];
          [v22 setBackgroundColor:v21];
        }
        if ([v9 hasTableView])
        {
          v90 = v9;
          uint64_t v91 = v8;
          v23 = [v9 tableViewOM];
          v24 = [v23 tableView];
          v25 = [MEMORY[0x263F825C8] clearColor];
          [v24 setBackgroundColor:v25];

          [v24 setBackgroundView:0];
          v26 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.3];
          [v24 setSeparatorBottomShadowColor:v26];

          v89 = v23;
          v27 = [v23 sections];
          long long v102 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          id v92 = v27;
          uint64_t v94 = [v27 countByEnumeratingWithState:&v102 objects:v112 count:16];
          if (v94)
          {
            uint64_t v93 = *(void *)v103;
            do
            {
              uint64_t v28 = 0;
              do
              {
                v29 = self;
                if (*(void *)v103 != v93) {
                  objc_enumerationMutation(v92);
                }
                v95 = *(void **)(*((void *)&v102 + 1) + 8 * v28);
                uint64_t v96 = v28;
                v30 = [v95 rows];
                long long v98 = 0u;
                long long v99 = 0u;
                long long v100 = 0u;
                long long v101 = 0u;
                uint64_t v31 = [v30 countByEnumeratingWithState:&v98 objects:v111 count:16];
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = *(void *)v99;
                  do
                  {
                    for (uint64_t i = 0; i != v32; ++i)
                    {
                      if (*(void *)v99 != v33) {
                        objc_enumerationMutation(v30);
                      }
                      v35 = *(void **)(*((void *)&v98 + 1) + 8 * i);
                      v36 = [v35 tableCell];
                      if ([v24 style] == 2)
                      {
                        v37 = [v36 backgroundColor];
                        if (v37)
                        {
                          [v36 setBackgroundColor:v37];
                        }
                        else
                        {
                          v38 = [(RUISetupAssistantStyle *)v29 insetGroupedCellBackgroundColor];
                          [v36 setBackgroundColor:v38];
                        }
                      }
                      v39 = [v35 attributes];
                      v40 = [v39 objectForKey:@"class"];
                      int v41 = [v40 isEqualToString:@"label"];

                      if (v41)
                      {
                        v42 = [v36 ruiTextLabel];
                        [v42 setAdjustsFontSizeToFitWidth:1];
                        [v42 setMinimumScaleFactor:0.70588237];
                      }
                    }
                    uint64_t v32 = [v30 countByEnumeratingWithState:&v98 objects:v111 count:16];
                  }
                  while (v32);
                }
                v43 = [v95 footer];
                v44 = [v95 footerView];
                self = v29;
                [(RUISetupAssistantStyle *)v29 _applyToFooter:v43 view:v44];

                uint64_t v28 = v96 + 1;
              }
              while (v96 + 1 != v94);
              uint64_t v94 = [v92 countByEnumeratingWithState:&v102 objects:v112 count:16];
            }
            while (v94);
          }

          uint64_t v7 = v86;
          uint64_t v6 = v87;
          objc_super v9 = v90;
          uint64_t v8 = v91;
          v45 = v89;
          goto LABEL_45;
        }
        if ([v9 hasPasscodeView])
        {
          v45 = [v9 passcodeViewOM];
          v46 = [v45 passcodeView];
          v47 = [(RUISetupAssistantStyle *)self _backgroundColor];
          [v46 setBackgroundColor:v47];

          v24 = [v45 footer];
          v48 = [v45 footerView];
          [(RUISetupAssistantStyle *)self _applyToFooter:v24 view:v48];

LABEL_45:
          goto LABEL_46;
        }
        v55 = [(RUISetupAssistantStyle *)self _backgroundColor];

        if (v55)
        {
          v45 = [v9 containerView];
          v24 = [(RUISetupAssistantStyle *)self _backgroundColor];
          [v45 setBackgroundColor:v24];
          goto LABEL_45;
        }
LABEL_46:
        v56 = [v9 toolbar];
        v57 = v56;
        if (v56)
        {
          [v56 setTranslucent:1];
          [v57 _setHidesShadow:1];
          v58 = [v9 traitCollection];
          v59 = -[RUISetupAssistantStyle barBackgroundImageForUserInterfaceStyle:](self, "barBackgroundImageForUserInterfaceStyle:", [v58 userInterfaceStyle]);
          [v57 setBackgroundImage:v59 forToolbarPosition:0 barMetrics:0];

          v60 = [MEMORY[0x263F82B60] mainScreen];
          v61 = [v60 traitCollection];
          uint64_t v62 = [v61 userInterfaceStyle];

          if (v62 == 2)
          {
            v63 = [MEMORY[0x263F825C8] lightGrayColor];
            [v57 setBackgroundColor:v63];
          }
        }
        v64 = [v9 view];
        [v64 setEdgesPreservingSuperviewLayoutMargins:15];

        v65 = [v9 view];
        [v65 directionalLayoutMargins];
        double v67 = v66;
        double v69 = v68;
        double v97 = v70;
        double v72 = v71;

        v73 = [(RUISetupAssistantStyle *)self setupAssistantLayout];
        [v73 directionalLayoutMarginsForViewController:v9];
        double v75 = v74;
        double v77 = v76;
        double v79 = v78;
        double v81 = v80;

        if (v69 != v77 || v67 != v75 || v72 != v81 || v97 != v79)
        {
          v82 = [v9 view];
          objc_msgSend(v82, "setDirectionalLayoutMargins:", v75, v77, v79, v81);
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v83 = [obj countByEnumeratingWithState:&v106 objects:v113 count:16];
      uint64_t v6 = v83;
    }
    while (v83);
  }
}

- (void)applyToNavigationBar:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RUISetupAssistantStyle;
  id v3 = a3;
  [(RUIStyle *)&v7 applyToNavigationBar:v3];
  objc_msgSend(v3, "_setHidesShadow:", 1, v7.receiver, v7.super_class);
  id v4 = objc_opt_new();
  [v3 setBackgroundImage:v4 forBarMetrics:0];

  uint64_t v5 = [MEMORY[0x263F824D8] effectWithStyle:4];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v5];
  [v3 _setBackgroundView:v6];
}

- (BOOL)supportActivityIndicatorInPinView
{
  return 1;
}

- (RUISetupAssitantLayout)setupAssistantLayout
{
  return self->_setupAssistantLayout;
}

- (void)setSetupAssistantLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end