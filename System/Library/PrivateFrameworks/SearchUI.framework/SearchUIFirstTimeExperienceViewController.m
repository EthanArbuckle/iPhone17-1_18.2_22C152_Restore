@interface SearchUIFirstTimeExperienceViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSArray)supportedDomains;
- (NSString)bundleIdentifier;
- (NSString)continueButtonTitle;
- (NSString)explanationText;
- (NSString)learnMoreText;
- (SearchUIFirstTimeExperienceDelegate)delegate;
- (SearchUIFirstTimeExperienceViewController)initWithDomains:(id)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6;
- (SearchUIFirstTimeExperienceViewController)initWithStyle:(unint64_t)a3 supportedDomains:(unint64_t)a4 explanationText:(id)a5 learnMoreText:(id)a6 continueButtonTitle:(id)a7;
- (SearchUIFirstTimeExperienceViewController)initWithSupportedDomains:(unint64_t)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6;
- (void)continueButtonPressed;
- (void)makeViews;
- (void)setBundleIdentifier:(id)a3;
- (void)setContinueButtonTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExplanationText:(id)a3;
- (void)setLearnMoreText:(id)a3;
- (void)setSupportedDomains:(id)a3;
- (void)showPrivacyView;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SearchUIFirstTimeExperienceViewController

- (SearchUIFirstTimeExperienceViewController)initWithStyle:(unint64_t)a3 supportedDomains:(unint64_t)a4 explanationText:(id)a5 learnMoreText:(id)a6 continueButtonTitle:(id)a7
{
  return [(SearchUIFirstTimeExperienceViewController *)self initWithSupportedDomains:a4 explanationText:a5 learnMoreText:a6 continueButtonTitle:a7];
}

- (SearchUIFirstTimeExperienceViewController)initWithSupportedDomains:(unint64_t)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6
{
  v19[6] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v19[0] = @"web";
  v19[1] = @"itunes";
  v19[2] = @"app_store";
  v19[3] = @"movies";
  v19[4] = @"restaurants";
  v19[5] = @"maps";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:6];
  v14 = objc_opt_new();
  if ([v13 count])
  {
    unint64_t v15 = 0;
    do
    {
      if (((1 << v15) & a3) != 0)
      {
        v16 = [v13 objectAtIndexedSubscript:v15];
        [v14 addObject:v16];
      }
      ++v15;
    }
    while (v15 < [v13 count]);
  }
  v17 = [(SearchUIFirstTimeExperienceViewController *)self initWithDomains:v14 explanationText:v10 learnMoreText:v11 continueButtonTitle:v12];

  return v17;
}

- (SearchUIFirstTimeExperienceViewController)initWithDomains:(id)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SearchUIFirstTimeExperienceViewController;
  v14 = [(SearchUIFirstTimeExperienceViewController *)&v18 init];
  unint64_t v15 = v14;
  if (v14)
  {
    [(SearchUIFirstTimeExperienceViewController *)v14 setSupportedDomains:v10];
    [(SearchUIFirstTimeExperienceViewController *)v15 setExplanationText:v11];
    v16 = [v12 stringByReplacingOccurrencesOfString:@" " withString:@" "];
    [(SearchUIFirstTimeExperienceViewController *)v15 setLearnMoreText:v16];

    [(SearchUIFirstTimeExperienceViewController *)v15 setContinueButtonTitle:v13];
    [(SearchUIFirstTimeExperienceViewController *)v15 makeViews];
  }

  return v15;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SearchUIFirstTimeExperienceViewController;
  [(SearchUIFirstTimeExperienceViewController *)&v9 traitCollectionDidChange:a3];
  [(SearchUIFirstTimeExperienceViewController *)self updateTraitsIfNeeded];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__SearchUIFirstTimeExperienceViewController_traitCollectionDidChange___block_invoke;
  v8[3] = &unk_1E6E72730;
  v8[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
  v4 = (void *)MEMORY[0x1E4FAE060];
  v5 = [(SearchUIFirstTimeExperienceViewController *)self view];
  v6 = [v4 bestAppearanceForView:v5];
  v7 = [(SearchUIFirstTimeExperienceViewController *)self view];
  [v6 enableAppearanceForContainer:v7];
}

void __70__SearchUIFirstTimeExperienceViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) makeViews];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

- (void)makeViews
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v3 = [(SearchUIFirstTimeExperienceViewController *)self view];
  v4 = [v3 subviews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v129 objects:v143 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v130;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v130 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v129 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v129 objects:v143 count:16];
    }
    while (v6);
  }

  objc_super v9 = (void *)MEMORY[0x1E4FAE060];
  id v10 = [(SearchUIFirstTimeExperienceViewController *)self view];
  id v11 = [v9 bestAppearanceForView:v10];

  v141[0] = @"web";
  v141[1] = @"itunes";
  v142[0] = @"safari";
  v142[1] = @"music";
  v141[2] = @"app_store";
  v141[3] = @"movies";
  v142[2] = @"appstore";
  v142[3] = @"film";
  v141[4] = @"restaurants";
  v141[5] = @"maps";
  v142[4] = @"fork.knife";
  v142[5] = @"mappin";
  v141[6] = @"media";
  v141[7] = @"pets";
  v142[6] = @"music";
  v142[7] = @"pawprint";
  v141[8] = @"books";
  v141[9] = @"art";
  v142[8] = @"book";
  v142[9] = @"photo";
  v141[10] = @"nature";
  v141[11] = @"landmarks";
  v142[10] = @"leaf";
  v142[11] = @"map";
  v141[12] = @"translation";
  v142[12] = @"translate";
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:v141 count:13];
  BOOL v13 = +[SearchUIUtilities isIpad];
  v14 = [(SearchUIFirstTimeExperienceViewController *)self traitCollection];
  BOOL v15 = [v14 horizontalSizeClass] == 1 && v13;

  if ([v11 style] == 3)
  {
    uint64_t v16 = [v11 platterColor];
  }
  else
  {
    if ([v11 style] == 2) {
      [v11 quaternaryColor];
    }
    else {
    uint64_t v16 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    }
  }
  v117 = (void *)v16;
  v17 = (void *)MEMORY[0x1E4FB08E0];
  unint64_t v108 = __PAIR64__(v13, v15);
  if (!v13 || v15)
  {
    uint64_t v18 = *MEMORY[0x1E4FB2928];
    v19 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    v116 = [v17 preferredFontForTextStyle:v18 compatibleWithTraitCollection:v19];
  }
  else
  {
    v116 = [MEMORY[0x1E4FB08E0] systemFontOfSize:48.0];
  }
  v115 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v108);
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  v111 = self;
  id obj = [(SearchUIFirstTimeExperienceViewController *)self supportedDomains];
  uint64_t v20 = [obj countByEnumeratingWithState:&v125 objects:v140 count:16];
  v114 = v12;
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v126;
    v112 = v11;
    uint64_t v113 = *(void *)v126;
    do
    {
      uint64_t v23 = 0;
      uint64_t v118 = v21;
      do
      {
        if (*(void *)v126 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v125 + 1) + 8 * v23);
        v25 = [v12 objectForKeyedSubscript:v24];
        if (v25)
        {
          v26 = [MEMORY[0x1E4FB1818] _systemImageNamed:v25];
          v27 = [MEMORY[0x1E4FB1818] _systemImageNamed:v25 variant:0x40000000];
          uint64_t v28 = [MEMORY[0x1E4FB1818] _systemImageNamed:v25 variant:1073741826];
          v29 = (void *)v28;
          if (v27) {
            v30 = v27;
          }
          else {
            v30 = v26;
          }
          if (v28) {
            v30 = (void *)v28;
          }
          id v31 = v30;
          if (v31)
          {
            v32 = v31;
            if (v29) {
              int v33 = 1;
            }
            else {
              int v33 = [v25 isEqualToString:@"safari"];
            }
            if (v27) {
              int v34 = 1;
            }
            else {
              int v34 = v33;
            }
            int v123 = v33;
            if ([v11 style] == 3 && (v33 & 1) != 0)
            {
              uint64_t v35 = [v11 primaryColor];
            }
            else
            {
              uint64_t v35 = [v11 secondaryColor];
            }
            v36 = (void *)v35;
            v37 = v117;
            if (!v34) {
              v37 = (void *)v35;
            }
            v38 = (void *)MEMORY[0x1E4FB1830];
            v139[0] = v35;
            v139[1] = v37;
            v139[2] = v37;
            v39 = (void *)MEMORY[0x1E4F1C978];
            id v121 = v37;
            v40 = [v39 arrayWithObjects:v139 count:3];
            v41 = [v38 _configurationWithHierarchicalColors:v40];
            v42 = [v32 imageWithSymbolConfiguration:v41];

            v43 = (void *)[objc_alloc(MEMORY[0x1E4FAE0C0]) initWithImage:v42];
            [v43 setIsTemplate:1];
            v44 = objc_opt_new();

            [v44 setTlkImage:v43];
            [v44 setSymbolFont:v116];
            if (v123) {
              uint64_t v45 = 3;
            }
            else {
              uint64_t v45 = 1;
            }
            [v44 setSymbolScale:v45];
            LODWORD(v46) = 1148846080;
            [v44 setContentHuggingPriority:0 forAxis:v46];
            [v115 addObject:v44];
            objc_msgSend(v44, "tlk_updateForAppearance:", v112);

            id v11 = v112;
            uint64_t v22 = v113;
            id v12 = v114;
            uint64_t v21 = v118;
          }
        }
        else
        {
          v26 = SearchUIGeneralLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v138 = v24;
            _os_log_error_impl(&dword_1E45B5000, v26, OS_LOG_TYPE_ERROR, "Unsupported FTE domain name: %@", buf, 0xCu);
          }
        }

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [obj countByEnumeratingWithState:&v125 objects:v140 count:16];
    }
    while (v21);
  }

  unint64_t v47 = [v115 count];
  if (v47 >= 6) {
    uint64_t v48 = 6;
  }
  else {
    uint64_t v48 = v47;
  }
  v124 = objc_msgSend(v115, "subarrayWithRange:", 0, v48);
  v49 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v124];
  [v49 setDistribution:0];
  if (v110)
  {
    BOOL v50 = 0;
    v51 = v111;
  }
  else
  {
    v51 = v111;
    v52 = [(SearchUIFirstTimeExperienceViewController *)v111 view];
    v53 = objc_msgSend(v52, "tlks_screen");
    [v53 _referenceBounds];
    BOOL v50 = CGRectGetWidth(v145) <= 320.0;
  }
  if ((v109 & 1) != 0 || !+[SearchUIUtilities isWideScreen] || v50)
  {
    BOOL v54 = !v50;
    double v55 = 3.0;
    double v56 = 2.0;
  }
  else
  {
    BOOL v54 = v110 == 0;
    double v55 = 7.0;
    double v56 = 9.0;
  }
  if (!v54) {
    double v55 = v56;
  }
  [v49 setSpacing:v55];
  v57 = [(SearchUIFirstTimeExperienceViewController *)v51 view];
  [v57 addSubview:v49];

  v58 = [(SearchUIFirstTimeExperienceViewController *)v51 view];
  id v59 = +[SearchUIAutoLayout alignView:v49 toView:v58 withAttribute:9];

  if (+[SearchUIUtilities isWideScreen]) {
    double v60 = 38.0;
  }
  else {
    double v60 = 21.0;
  }
  v61 = [(SearchUIFirstTimeExperienceViewController *)v51 view];
  id v62 = +[SearchUIAutoLayout baselineAlignBottomView:v49 toTopView:v61 spacing:v60];

  id v63 = objc_alloc(MEMORY[0x1E4F28E48]);
  v64 = [(SearchUIFirstTimeExperienceViewController *)v51 explanationText];
  v65 = (void *)[v63 initWithString:v64];

  id v66 = objc_alloc(MEMORY[0x1E4F28B18]);
  v67 = [(SearchUIFirstTimeExperienceViewController *)v51 learnMoreText];
  uint64_t v135 = *MEMORY[0x1E4FB0720];
  v68 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F40279D8];
  v136 = v68;
  v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
  uint64_t v70 = [v66 initWithString:v67 attributes:v69];

  id obja = (id)v70;
  [v65 appendAttributedString:v70];
  if ([v11 style] == 2)
  {
    id v71 = [MEMORY[0x1E4FAE060] appearanceWithStyle:0];
  }
  else
  {
    id v71 = v11;
  }
  v72 = v71;
  if ([v71 isVibrant]) {
    uint64_t v73 = 2;
  }
  else {
    uint64_t v73 = 1;
  }
  v74 = objc_opt_new();
  v122 = v65;
  [v74 setAttributedText:v65];
  [v74 setDelegate:v51];
  v75 = [v11 primaryColor];
  [v74 setTextColor:v75];

  uint64_t v133 = *MEMORY[0x1E4FB0700];
  v76 = [v72 buttonColorForProminence:v73];
  v134 = v76;
  v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
  [v74 setLinkTextAttributes:v77];

  v78 = (void *)MEMORY[0x1E4FB08E0];
  v79 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0x8000 options:0];
  v80 = [v78 fontWithDescriptor:v79 size:0.0];
  [v74 setFont:v80];

  v81 = [v74 textContainer];
  [v81 setLineFragmentPadding:0.0];

  [v74 _setInteractiveTextSelectionDisabled:1];
  [v74 setScrollEnabled:0];
  [v74 setBackgroundColor:0];
  [v74 setTextAlignment:1];
  [v74 setEditable:0];
  [v11 enableAppearanceForView:v74];
  v82 = [(SearchUIFirstTimeExperienceViewController *)v51 view];
  [v82 addSubview:v74];

  v83 = +[SearchUISymbolImage uiImageWithSymbolName:@"safari" font:v116 scale:3];
  [v83 size];
  double v85 = v84;

  [v49 spacing];
  double v87 = v86 * 5.0 + v85 * 6.0;
  v88 = [(SearchUIFirstTimeExperienceViewController *)v51 view];
  id v89 = +[SearchUIAutoLayout alignView:v74 toView:v88 withAttribute:9];

  v90 = [(SearchUIFirstTimeExperienceViewController *)v51 view];
  id v91 = +[SearchUIAutoLayout alignLeadingView:v90 toTrailingView:v74 spacing:1 minimum:16.0];

  v92 = [(SearchUIFirstTimeExperienceViewController *)v51 view];
  id v93 = +[SearchUIAutoLayout alignLeadingView:v74 toTrailingView:v92 spacing:1 minimum:16.0];

  v94 = +[SearchUIAutoLayout setWidth:v74 forView:v87];
  LODWORD(v95) = 1148829696;
  [v94 setPriority:v95];
  id v96 = +[SearchUIAutoLayout baselineAlignBottomView:v74 toTopView:v49 dynamicSpacing:34.0];
  v97 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  v98 = [(SearchUIFirstTimeExperienceViewController *)v51 continueButtonTitle];
  [v97 setTitle:v98];

  [v97 setCornerStyle:4];
  [v97 setBaseBackgroundColor:v117];
  v99 = objc_opt_new();
  [v99 setRole:1];
  [v99 setConfiguration:v97];
  v100 = v72;
  if ([v11 style] == 3)
  {
    v101 = [v11 primaryColor];
    [v99 setTintColor:v101];
  }
  else
  {
    [v99 setTintColor:0];
  }
  [v11 enableAppearanceForView:v99];
  [v99 addTarget:v51 action:sel_continueButtonPressed forControlEvents:64];
  v102 = [(SearchUIFirstTimeExperienceViewController *)v51 view];
  [v102 addSubview:v99];

  v103 = [(SearchUIFirstTimeExperienceViewController *)v51 view];
  id v104 = +[SearchUIAutoLayout alignView:v99 toView:v103 withAttribute:9];

  id v105 = +[SearchUIAutoLayout alignView:v99 attribute:3 toView:v74 attribute:4 constant:30.0];
  v106 = [(SearchUIFirstTimeExperienceViewController *)v51 view];
  id v107 = +[SearchUIAutoLayout baselineAlignBottomView:v106 toTopView:v99 spacing:1 minimum:v60];
}

- (void)continueButtonPressed
{
  id v2 = [(SearchUIFirstTimeExperienceViewController *)self delegate];
  [v2 firstTimeExperienceContinueButtonPressed];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  if (!a6) {
    [(SearchUIFirstTimeExperienceViewController *)self showPrivacyView];
  }
  return a6 == 0;
}

- (void)showPrivacyView
{
  uint64_t v6 = objc_alloc_init(SearchUIPrivacyDetailsViewController);
  if ([(SearchUIFirstTimeExperienceViewController *)self _isInPopoverPresentation])
  {
    uint64_t v3 = 0;
  }
  else
  {
    v4 = [(SearchUIFirstTimeExperienceViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = [(SearchUIFirstTimeExperienceViewController *)self delegate];
      if ([v5 firstTimeExperienceIsInPopoverPresentation]) {
        uint64_t v3 = 0;
      }
      else {
        uint64_t v3 = 2;
      }
    }
    else
    {
      uint64_t v3 = 2;
    }
  }
  [(SearchUIPrivacyDetailsViewController *)v6 setModalPresentationStyle:v3];
  [(SearchUIFirstTimeExperienceViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SearchUIFirstTimeExperienceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIFirstTimeExperienceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)supportedDomains
{
  return self->_supportedDomains;
}

- (void)setSupportedDomains:(id)a3
{
}

- (NSString)explanationText
{
  return self->_explanationText;
}

- (void)setExplanationText:(id)a3
{
}

- (NSString)learnMoreText
{
  return self->_learnMoreText;
}

- (void)setLearnMoreText:(id)a3
{
}

- (NSString)continueButtonTitle
{
  return self->_continueButtonTitle;
}

- (void)setContinueButtonTitle:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_continueButtonTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreText, 0);
  objc_storeStrong((id *)&self->_explanationText, 0);
  objc_storeStrong((id *)&self->_supportedDomains, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end