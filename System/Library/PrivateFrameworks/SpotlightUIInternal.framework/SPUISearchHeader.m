@interface SPUISearchHeader
+ (id)tokenFromSearchEntity:(id)a3;
+ (unint64_t)asYouTypeSearchQueryKind;
+ (unint64_t)committedSearchQueryKind;
+ (void)logDismissalWithReason:(unint64_t)a3;
+ (void)logInvokeWithReason:(unint64_t)a3;
- (BOOL)cancelButtonIsVisible;
- (BOOL)completionResultIsPotentiallyPunchout;
- (BOOL)currentlyPresentingWebEntity;
- (BOOL)isFirstResponder;
- (BOOL)isReturnKeyPressedInGoMode;
- (BOOL)lastQueryKindSupportsOptionKey;
- (BOOL)offersCompletions;
- (BOOL)optOutOfGoButton;
- (BOOL)searchTextScheduledForProcessing;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn;
- (BOOL)textWasCut;
- (BOOL)useClearTokens;
- (BOOL)willClear;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)cancelButtonTrailingConstraint;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)searchFieldTrailingConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)widthConstraint;
- (NSString)currentQuery;
- (NSString)lastSearchText;
- (SBIconListLayout)iconListLayout;
- (SPSearchEntity)lastSearchEntity;
- (SPSearchEntity)searchEntity;
- (SPUIHeaderBlurView)blurView;
- (SPUIHeaderInteractionDelegate)interactionDelegate;
- (SPUISearchHeader)init;
- (SPUISearchHeaderDelegate)delegate;
- (SPUITextField)searchField;
- (UIButton)cancelButton;
- (UIResponder)responderForKeyboardInput;
- (UISearchToken)lastSearchToken;
- (_UILegibilitySettings)legibilitySettings;
- (double)bottomPadding;
- (double)searchBarLeadingPadding;
- (double)searchBarTrailingPadding;
- (double)topPadding;
- (id)_searchTextField:(id)a3 itemProviderForCopyingToken:(id)a4;
- (id)currentQueryContextWithString:(id)a3;
- (id)markedTextArray;
- (int64_t)activeInterfaceOrientation;
- (unint64_t)getClearTriggerEventForQueryContext:(id)a3;
- (unint64_t)invokeReason;
- (unint64_t)previousQueryID;
- (unint64_t)queryId;
- (unint64_t)suggestionID;
- (void)_searchWithSearchEntity:(id)a3 fromSuggestion:(BOOL)a4;
- (void)addInputMethodInformationToQueryContext:(id)a3;
- (void)backButtonPressed;
- (void)beginDictation;
- (void)cancelButtonClicked:(id)a3;
- (void)clearLastSearchedText;
- (void)clearSearchFieldWhyQuery:(unint64_t)a3 allowZKW:(BOOL)a4;
- (void)commitSearch;
- (void)didMoveToWindow;
- (void)escapeKeyPressed;
- (void)focusSearchFieldAndBeginDictation:(BOOL)a3 selectAll:(BOOL)a4 withReason:(unint64_t)a5;
- (void)focusSearchFieldAndSelectAll:(BOOL)a3 withReason:(unint64_t)a4;
- (void)highlightResultAfterUnmarkingText;
- (void)performTestSearchWithQuery:(id)a3 event:(unint64_t)a4 queryKind:(unint64_t)a5;
- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)queryContextDidChange:(id)a3 fromPreviousQueryId:(unint64_t)a4 allowZKW:(BOOL)a5;
- (void)removeCompletionAndHighlightAsTyped:(BOOL)a3;
- (void)resignKeyboardForProcessState;
- (void)restoreSearchText:(id)a3 searchEntity:(id)a4;
- (void)returnKeyPressed;
- (void)searchForSuggestion:(id)a3 isBuildingQuery:(BOOL)a4;
- (void)setActiveInterfaceOrientation:(int64_t)a3;
- (void)setBlurView:(id)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCancelButtonTrailingConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconListLayout:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setInvokeReason:(unint64_t)a3;
- (void)setIsReturnKeyPressedInGoMode:(BOOL)a3;
- (void)setLastSearchEntity:(id)a3;
- (void)setLastSearchText:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setOffersCompletions:(BOOL)a3;
- (void)setPreviousQueryID:(unint64_t)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setResponderForKeyboardInput:(id)a3;
- (void)setSearchEntity:(id)a3;
- (void)setSearchEntity:(id)a3 fromSuggestion:(BOOL)a4;
- (void)setSearchField:(id)a3;
- (void)setSearchFieldTrailingConstraint:(id)a3;
- (void)setSearchTextScheduledForProcessing:(BOOL)a3;
- (void)setSuggestionID:(unint64_t)a3;
- (void)setTextWasCut:(BOOL)a3;
- (void)setTopConstraint:(id)a3;
- (void)setUseClearTokens:(BOOL)a3;
- (void)setWidthConstraint:(id)a3;
- (void)setWillClear:(BOOL)a3;
- (void)showCancelButton:(BOOL)a3 animated:(BOOL)a4;
- (void)switchToSuggestions;
- (void)textDidChange:(id)a3;
- (void)textDidChange:(id)a3 whyQuery:(unint64_t)a4 allowZKW:(BOOL)a5 queryKind:(unint64_t)a6;
- (void)textDidChange:(id)a3 whyQuery:(unint64_t)a4 allowZKW:(BOOL)a5 sourcePreference:(unint64_t)a6 searchEntities:(id)a7 queryKind:(unint64_t)a8;
- (void)textFieldDidBeginEditing;
- (void)textFieldDidClear:(id)a3;
- (void)textFieldDidReplaceTokensWithStringEquivalent:(id)a3;
- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4;
- (void)textWasCutFromTextField:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)triggerSearchForUnlock;
- (void)unfocusSearchFieldWithReason:(unint64_t)a3;
- (void)unfocusSearchFieldWithReason:(unint64_t)a3 afterCommit:(BOOL)a4;
- (void)updateFocusResult:(id)a3 cardSection:(id)a4 focusIsOnFirstResult:(BOOL)a5;
- (void)updateSearchFieldModel;
- (void)updateWithCommand:(id)a3;
@end

@implementation SPUISearchHeader

- (SPUISearchHeader)init
{
  v76.receiver = self;
  v76.super_class = (Class)SPUISearchHeader;
  v2 = [(SPUISearchHeader *)&v76 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SPUISearchHeader *)v2 addSubview:v3];
    v4 = objc_opt_new();
    LODWORD(v5) = 1148846080;
    [v4 setContentHuggingPriority:1 forAxis:v5];
    [v4 setDelegate:v2];
    [v4 addTarget:v2 action:sel_textDidChange_ forControlEvents:0x20000];
    LODWORD(v6) = 1144766464;
    [v4 setContentCompressionResistancePriority:0 forAxis:v6];
    [v3 addSubview:v4];
    v7 = objc_opt_new();
    [v7 setProminence:2];
    v8 = (void *)MEMORY[0x263F81708];
    uint64_t v9 = *MEMORY[0x263F83570];
    v10 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F83468]];
    v11 = [v8 preferredFontForTextStyle:v9 compatibleWithTraitCollection:v10];
    [v7 setFont:v11];

    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_26F104E28 table:0];
    [v7 setTitle:v13];

    [v7 addTarget:v2 action:sel_cancelButtonClicked_];
    LODWORD(v14) = 1148846080;
    [v7 setContentCompressionResistancePriority:0 forAxis:v14];
    LODWORD(v15) = 1144750080;
    [v7 setContentHuggingPriority:0 forAxis:v15];
    [v3 addSubview:v7];
    v16 = [v3 bottomAnchor];
    v17 = [v4 bottomAnchor];
    [(SPUISearchHeader *)v2 bottomPadding];
    v18 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);

    LODWORD(v19) = 1132068864;
    [v18 setPriority:v19];
    [v18 setActive:1];
    [(SPUISearchHeader *)v2 setBottomConstraint:v18];
    LODWORD(v20) = 1132068864;
    v21 = [MEMORY[0x263F67C10] alignView:v4 toView:v3 withAttribute:3 priority:v20];
    [(SPUISearchHeader *)v2 setTopConstraint:v21];

    id v22 = (id)[MEMORY[0x263F67C10] alignView:v4 toView:v7 withAttribute:10];
    v23 = [MEMORY[0x263F67C10] alignLeadingView:v3 toTrailingView:v4];
    [(SPUISearchHeader *)v2 setLeadingConstraint:v23];

    [(SPUISearchHeader *)v2 searchBarLeadingPadding];
    double v25 = v24;
    v26 = [(SPUISearchHeader *)v2 leadingConstraint];
    [v26 setConstant:v25];

    id v27 = (id)[MEMORY[0x263F67C10] alignLeadingView:v4 toTrailingView:v7 spacing:11.0];
    LODWORD(v28) = 1148829696;
    v29 = [MEMORY[0x263F67C10] alignLeadingView:v7 toTrailingView:v3 priority:v28];
    [(SPUISearchHeader *)v2 setCancelButtonTrailingConstraint:v29];

    LODWORD(v30) = 1148829696;
    v31 = [MEMORY[0x263F67C10] alignLeadingView:v4 toTrailingView:v3 priority:v30];
    [(SPUISearchHeader *)v2 setSearchFieldTrailingConstraint:v31];

    [(SPUISearchHeader *)v2 searchBarTrailingPadding];
    double v33 = v32;
    v34 = [(SPUISearchHeader *)v2 searchFieldTrailingConstraint];
    [v34 setConstant:v33];

    v35 = [(SPUISearchHeader *)v2 searchFieldTrailingConstraint];
    [v35 setActive:0];

    [MEMORY[0x263F67C10] constrainViewHeightContainer:v3];
    id v36 = (id)[MEMORY[0x263F67C10] alignView:v3 toView:v2 withAttribute:9];
    v37 = [v3 widthAnchor];
    [MEMORY[0x263F67C00] idealPlatterWidth];
    v38 = objc_msgSend(v37, "constraintLessThanOrEqualToConstant:");

    [v38 setActive:1];
    [(SPUISearchHeader *)v2 setWidthConstraint:v38];
    v39 = [v3 widthAnchor];
    v40 = [(SPUISearchHeader *)v2 widthAnchor];
    v41 = [v39 constraintLessThanOrEqualToAnchor:v40 multiplier:1.0];
    [v41 setActive:1];

    [(SPUISearchHeader *)v2 setSearchField:v4];
    [(SPUISearchHeader *)v2 setCancelButton:v7];
    [(SPUISearchHeader *)v2 showCancelButton:0 animated:0];
    v42 = [MEMORY[0x263F08A00] defaultCenter];
    [v42 addObserver:v2 selector:sel_resignKeyboardForProcessState name:*MEMORY[0x263F83330] object:0];

    v43 = [MEMORY[0x263F08A00] defaultCenter];
    [v43 addObserver:v2 selector:sel_tlk_updateWithCurrentAppearance name:*MEMORY[0x263F831F8] object:0];

    v44 = [(SPUISearchHeader *)v2 searchField];
    [v44 addTarget:v2 action:sel_textFieldShouldReturn forControlEvents:0x80000];

    v45 = [(SPUISearchHeader *)v2 searchField];
    [v45 addTarget:v2 action:sel_textFieldDidBeginEditing forControlEvents:0x10000];

    v46 = [(SPUISearchHeader *)v2 searchField];
    [v46 setAllowsCopyingTokens:1];

    v47 = [(SPUISearchHeader *)v2 searchField];
    [v47 setPasteDelegate:v2];

    [(SPUISearchHeader *)v2 setAccessibilityIgnoresInvertColors:1];
    [(SPUISearchHeader *)v2 setOffersCompletions:1];
    if ([MEMORY[0x263F79140] enableFloatingWindow])
    {
      [(SPUISearchHeader *)v2 bounds];
      -[SPUISearchHeader systemLayoutSizeFittingSize:](v2, "systemLayoutSizeFittingSize:", v48, 1000.0);
      [(_UINavigationBarTitleView *)v2 setHeight:v49];
    }
    else
    {
      v50 = objc_opt_new();
      [(SPUISearchHeader *)v2 setBlurView:v50];

      v51 = [(SPUISearchHeader *)v2 blurView];
      v52 = [(SPUISearchHeader *)v2 searchField];
      [v3 insertSubview:v51 belowSubview:v52];

      v53 = [(SPUISearchHeader *)v2 blurView];
      [v53 setTranslatesAutoresizingMaskIntoConstraints:0];

      v54 = [(SPUISearchHeader *)v2 blurView];
      v55 = [v54 leadingAnchor];
      v56 = [(SPUISearchHeader *)v2 searchField];
      [v56 leadingAnchor];
      v57 = v75 = v18;
      v58 = [v55 constraintEqualToAnchor:v57];
      [v58 setActive:1];

      v59 = [(SPUISearchHeader *)v2 blurView];
      v60 = [v59 trailingAnchor];
      v61 = [(SPUISearchHeader *)v2 searchField];
      v62 = [v61 trailingAnchor];
      v63 = [v60 constraintEqualToAnchor:v62];
      [v63 setActive:1];

      v64 = [(SPUISearchHeader *)v2 blurView];
      v65 = [v64 topAnchor];
      v66 = [(SPUISearchHeader *)v2 searchField];
      v67 = [v66 topAnchor];
      v68 = [v65 constraintEqualToAnchor:v67];
      [v68 setActive:1];

      v69 = [(SPUISearchHeader *)v2 blurView];
      v70 = [v69 bottomAnchor];
      v71 = [(SPUISearchHeader *)v2 searchField];
      v72 = [v71 bottomAnchor];
      v73 = [v70 constraintEqualToAnchor:v72];
      [v73 setActive:1];

      v18 = v75;
    }
  }
  return v2;
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SPUISearchHeader;
  [(SPUISearchHeader *)&v52 tlk_updateForAppearance:v4];
  double v5 = [(SPUISearchHeader *)self searchField];
  [v5 backgroundCornerRadius];
  double v7 = v6;
  v8 = [(SPUISearchHeader *)self blurView];
  [v8 _setContinuousCornerRadius:v7];

  uint64_t v9 = [(SPUISearchHeader *)self searchField];
  [v9 backgroundCornerRadius];
  double v11 = v10;
  v12 = [(SPUISearchHeader *)self blurView];
  v13 = [v12 contentView];
  [v13 _setContinuousCornerRadius:v11];

  if ([(SPUISearchHeader *)self useClearTokens]) {
    [MEMORY[0x263F825C8] clearColor];
  }
  else {
  double v14 = [v4 platterColor];
  }
  double v15 = [(SPUISearchHeader *)self searchField];
  [v15 setTokenBackgroundColor:v14];

  BOOL v16 = [(SPUISearchHeader *)self useClearTokens];
  if (v16)
  {
    v17 = [MEMORY[0x263F825C8] labelColor];
  }
  else
  {
    v17 = 0;
  }
  v18 = [(SPUISearchHeader *)self searchField];
  [v18 _setTokenForegroundColor:v17];

  if (v16) {
  uint64_t v19 = [v4 isDark];
  }
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (IsReduceTransparencyEnabled || (v19 & 1) != 0)
  {
    uint64_t v21 = [MEMORY[0x263F825C8] blackColor];
  }
  else
  {
    uint64_t v21 = [MEMORY[0x263F825C8] whiteColor];
  }
  id v22 = (void *)*MEMORY[0x263F15D50];
  if (!v19) {
    id v22 = 0;
  }
  if (IsReduceTransparencyEnabled) {
    id v22 = 0;
  }
  uint64_t v49 = v21;
  if (IsReduceTransparencyEnabled) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = v21;
  }
  id v24 = v22;
  double v25 = [(SPUISearchHeader *)self searchField];
  v26 = [v25 blurView];
  id v27 = [v26 contentView];

  [v27 setBackgroundColor:v23];
  double v28 = [v27 layer];
  [v28 setCompositingFilter:v24];

  v29 = [v4 primaryColor];
  double v30 = [v4 secondaryColor];
  v31 = [(SPUISearchHeader *)self searchField];
  [v31 updateWithPrimaryColor:v29 secondaryColor:v30 isOnDarkBackground:v19 appearance:v4];

  if (IsReduceTransparencyEnabled)
  {
    double v32 = [(SPUISearchHeader *)self legibilitySettings];
    double v33 = [v32 contentColor];

    v34 = [(SPUISearchHeader *)self searchField];
    v35 = [v34 blurView];
    [v35 setTintColor:v33];

    double v51 = 0.0;
    [v33 getHue:0 saturation:0 brightness:&v51 alpha:0];
    id v36 = [MEMORY[0x263F825C8] colorWithWhite:dbl_23D314720[v51 > 0.4] alpha:0.3];
    v37 = [(SPUISearchHeader *)self searchField];
    v38 = [v37 tintView];
    [v38 setBackgroundColor:v36];

    v39 = [(SPUISearchHeader *)self searchField];
    v40 = [v39 tintView];
    [v40 setAlpha:1.0];
  }
  else
  {
    v41 = [(SPUISearchHeader *)self searchField];
    v42 = [v41 blurView];
    v43 = [v42 contentView];
    v44 = v43;
    double v45 = 0.05;
    if (v19)
    {
      double v46 = 0.1;
    }
    else
    {
      double v45 = 0.0;
      double v46 = 0.04;
    }
    [v43 setAlpha:v45];

    v47 = [(SPUISearchHeader *)self searchField];
    double v48 = [v47 blurView];
    [v48 setTintColor:0];

    double v33 = [(SPUISearchHeader *)self searchField];
    v39 = [v33 tintView];
    [v39 setAlpha:v46];
  }
}

- (SPUITextField)searchField
{
  return (SPUITextField *)objc_getProperty(self, a2, 664, 1);
}

- (SPUIHeaderBlurView)blurView
{
  return (SPUIHeaderBlurView *)objc_getProperty(self, a2, 632, 1);
}

- (BOOL)useClearTokens
{
  return self->_useClearTokens;
}

- (NSString)currentQuery
{
  v2 = [(SPUISearchHeader *)self searchField];
  v3 = [v2 searchText];

  return (NSString *)v3;
}

- (SPSearchEntity)searchEntity
{
  return self->_searchEntity;
}

- (void)updateFocusResult:(id)a3 cardSection:(id)a4 focusIsOnFirstResult:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(SPUISearchHeader *)self searchField];
  [v10 updateFocusResult:v9 cardSection:v8 focusIsOnFirstResult:v5];
}

- (void)setWidthConstraint:(id)a3
{
}

- (void)setTopConstraint:(id)a3
{
}

- (void)setSearchFieldTrailingConstraint:(id)a3
{
}

- (void)setSearchField:(id)a3
{
}

- (void)setOffersCompletions:(BOOL)a3
{
  self->_offersCompletions = a3;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (void)setCancelButtonTrailingConstraint:(id)a3
{
}

- (void)setCancelButton:(id)a3
{
}

- (void)setBottomConstraint:(id)a3
{
}

- (void)setBlurView:(id)a3
{
}

- (double)searchBarTrailingPadding
{
  return 0.0;
}

- (double)searchBarLeadingPadding
{
  return 0.0;
}

- (NSLayoutConstraint)leadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 592, 1);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SPUISearchHeader;
  [(SPUISearchHeader *)&v3 didMoveToWindow];
  [(SPUISearchHeader *)self tlk_updateWithCurrentAppearance];
}

- (void)setResponderForKeyboardInput:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUISearchHeader *)self searchField];
  [v5 setResponderForKeyboardInput:v4];
}

- (void)showCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (([MEMORY[0x263F79140] enableFloatingWindow] & 1) != 0
    || [MEMORY[0x263F79140] bottomSearchFieldEnabled])
  {
    BOOL v5 = 0;
  }
  double v7 = [(SPUISearchHeader *)self cancelButtonTrailingConstraint];
  [v7 setActive:v5];

  id v8 = [(SPUISearchHeader *)self searchFieldTrailingConstraint];
  [v8 setActive:v5 ^ 1];

  [(SPUISearchHeader *)self tlk_updateWithCurrentAppearance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__SPUISearchHeader_showCancelButton_animated___block_invoke;
  v9[3] = &unk_264E90790;
  v9[4] = self;
  BOOL v10 = v5;
  [MEMORY[0x263F67C78] performAnimatableChanges:v9 animated:v4];
}

- (NSLayoutConstraint)searchFieldTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 552, 1);
}

- (NSLayoutConstraint)cancelButtonTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 560, 1);
}

- (void)setQueryId:(unint64_t)a3
{
  id v5 = [(SPUISearchHeader *)self delegate];
  BOOL v4 = [v5 currentQueryContext];
  [v4 setQueryIdent:a3];
}

- (void)textFieldDidBeginEditing
{
  objc_super v3 = [(SPUISearchHeader *)self delegate];
  [v3 didBeginEditing];

  id v4 = [(SPUISearchHeader *)self interactionDelegate];
  [v4 didFocusHeader];
}

- (SPUISearchHeaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SPUISearchHeaderDelegate *)WeakRetained;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  [(SPUISearchHeader *)self tlk_updateWithCurrentAppearance];
}

- (void)setDelegate:(id)a3
{
}

- (SPUIHeaderInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  return (SPUIHeaderInteractionDelegate *)WeakRetained;
}

- (double)bottomPadding
{
  int v3 = [MEMORY[0x263F79140] bottomSearchFieldEnabled];
  id v4 = (void *)MEMORY[0x263F79140];
  if (v3)
  {
    [v4 bottomPaddingToKeyboard];
  }
  else
  {
    double v6 = 0.0;
    if (([MEMORY[0x263F79140] enableFloatingWindow] & 1) == 0)
    {
      double v7 = [(SPUISearchHeader *)self searchField];
      if ([v7 needsLandscapeHeight]) {
        double v6 = 7.0;
      }
      else {
        double v6 = 8.0;
      }
    }
    return v6;
  }
  return result;
}

- (double)topPadding
{
  char v3 = [MEMORY[0x263F79140] enableFloatingWindow];
  double result = 0.0;
  if ((v3 & 1) == 0)
  {
    char v5 = objc_msgSend(MEMORY[0x263F79140], "bottomSearchFieldEnabled", 0.0);
    double result = 11.0;
    if ((v5 & 1) == 0)
    {
      if (objc_msgSend(MEMORY[0x263F67C78], "isIpad", 11.0))
      {
        BOOL v6 = [MEMORY[0x263F67C78] isLargeIpad] == 0;
        double result = 8.0;
        double v7 = 4.0;
      }
      else
      {
        id v8 = [(SPUISearchHeader *)self searchField];
        int v9 = [v8 needsLandscapeHeight];

        BOOL v6 = v9 == 0;
        double result = 4.0;
        double v7 = 7.0;
      }
      if (!v6) {
        return v7;
      }
    }
  }
  return result;
}

- (BOOL)currentlyPresentingWebEntity
{
  if ([MEMORY[0x263F79140] bottomSearchFieldEnabled])
  {
    char v3 = [(SPUISearchHeader *)self searchField];
    id v4 = [v3 tokenBackgroundColor];
    char v5 = [MEMORY[0x263F825C8] clearColor];
    if ([v4 isEqual:v5])
    {
      BOOL v6 = [(SPUISearchHeader *)self searchField];
      double v7 = [v6 tokens];
      BOOL v8 = [v7 count] != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    char v3 = [(SPUISearchHeader *)self searchEntity];
    id v4 = +[SPUITextField webEntityStringForEntity:v3];
    BOOL v8 = [v4 length] != 0;
  }

  return v8;
}

uint64_t __46__SPUISearchHeader_showCancelButton_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  char v3 = [*(id *)(a1 + 32) cancelButton];
  [v3 setAlpha:v2];

  id v4 = *(void **)(a1 + 32);
  return [v4 layoutIfNeeded];
}

- (UIButton)cancelButton
{
  return (UIButton *)objc_getProperty(self, a2, 544, 1);
}

- (void)focusSearchFieldAndSelectAll:(BOOL)a3 withReason:(unint64_t)a4
{
}

- (void)focusSearchFieldAndBeginDictation:(BOOL)a3 selectAll:(BOOL)a4 withReason:(unint64_t)a5
{
  BOOL v6 = a4;
  BOOL v8 = [(SPUISearchHeader *)self searchField];
  [v8 updateRightView];

  if (v6) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 0;
  }
  BOOL v10 = [(SPUISearchHeader *)self searchField];
  [v10 setTextSelectionBehavior:v9];

  uint64_t v11 = MEMORY[0x263F79148];
  v12 = *(NSObject **)(MEMORY[0x263F79148] + 32);
  if (!v12)
  {
    SPUIInitLogging();
    v12 = *(NSObject **)(v11 + 32);
  }
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23D2E6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "firstResponder", (const char *)&unk_23D315BC7, buf, 2u);
  }
  +[SPUISearchHeader logInvokeWithReason:a5];
  [(SPUISearchHeader *)self setInvokeReason:a5];
  *(void *)buf = 0;
  uint64_t v23 = buf;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  int v13 = [MEMORY[0x263F79140] pageDotInvokeEnabled] ^ 1;
  if (a5 > 1) {
    LOBYTE(v13) = 1;
  }
  if (v13)
  {
    double v14 = [(SPUISearchHeader *)self searchField];
    uint8_t v15 = [v14 becomeFirstResponder];
    v23[24] = v15;
  }
  else
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __75__SPUISearchHeader_focusSearchFieldAndBeginDictation_selectAll_withReason___block_invoke;
    v21[3] = &unk_264E908E8;
    v21[4] = self;
    v21[5] = buf;
    [MEMORY[0x263F82E00] performWithoutAnimation:v21];
  }
  if (v23[24])
  {
    BOOL v16 = *(NSObject **)(v11 + 32);
    if (!v16)
    {
      SPUIInitLogging();
      BOOL v16 = *(NSObject **)(v11 + 32);
    }
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)double v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_23D2E6000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "firstResponder", " enableTelemetry=YES ", v20, 2u);
    }
  }
  else
  {
    v17 = *(NSObject **)(v11 + 16);
    if (!v17)
    {
      SPUIInitLogging();
      v17 = *(NSObject **)(v11 + 16);
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __34__SPUISearchHeader_beginDictation__block_invoke_cold_1(v17);
    }
  }
  v18 = [(SPUISearchHeader *)self searchField];
  [v18 setTextSelectionBehavior:0];

  uint64_t v19 = [MEMORY[0x263F08A00] defaultCenter];
  [v19 postNotificationName:SPUIBringingUpKB object:0];

  _Block_object_dispose(buf, 8);
}

- (void)setInvokeReason:(unint64_t)a3
{
  self->_invokeReason = a3;
}

+ (void)logInvokeWithReason:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3 > 5) {
    char v3 = 0;
  }
  else {
    char v3 = off_264E909F8[a3];
  }
  uint64_t v4 = MEMORY[0x263F79148];
  char v5 = *(NSObject **)(MEMORY[0x263F79148] + 16);
  if (!v5)
  {
    SPUIInitLogging();
    char v5 = *(NSObject **)(v4 + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    double v7 = v3;
    _os_log_impl(&dword_23D2E6000, v5, OS_LOG_TYPE_DEFAULT, "invoke reason %@", (uint8_t *)&v6, 0xCu);
  }
}

void __75__SPUISearchHeader_focusSearchFieldAndBeginDictation_selectAll_withReason___block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x263F828D0] activeKeyboardSceneDelegate];
  [v2 _beginDisablingAnimations];

  char v3 = [*(id *)(a1 + 32) searchField];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 becomeFirstResponder];

  id v4 = [MEMORY[0x263F828D0] activeKeyboardSceneDelegate];
  [v4 _endDisablingAnimations];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPUISearchHeader;
  [(SPUISearchHeader *)&v9 traitCollectionDidChange:v4];
  char v5 = [(SPUISearchHeader *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SPUISearchHeader *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  int v6 = [(SPUISearchHeader *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)clearLastSearchedText
{
  [(SPUISearchHeader *)self setLastSearchText:0];
  [(SPUISearchHeader *)self setLastSearchEntity:0];
}

- (UISearchToken)lastSearchToken
{
  char v3 = [(SPUISearchHeader *)self searchEntity];
  id v4 = [v3 tokenText];
  if (v4)
  {
    char v5 = objc_opt_class();
    int v6 = [(SPUISearchHeader *)self searchEntity];
    uint64_t v7 = [v5 tokenFromSearchEntity:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (UISearchToken *)v7;
}

- (UIResponder)responderForKeyboardInput
{
  double v2 = [(SPUISearchHeader *)self searchField];
  char v3 = [v2 responderForKeyboardInput];

  return (UIResponder *)v3;
}

+ (unint64_t)asYouTypeSearchQueryKind
{
  return 2;
}

+ (unint64_t)committedSearchQueryKind
{
  uint64_t v2 = SPCommittedScreenMatchingBehavior();
  if ((unint64_t)(v2 - 2) >= 3) {
    return 5;
  }
  else {
    return 10 - v2;
  }
}

- (void)backButtonPressed
{
  id v2 = [(SPUISearchHeader *)self delegate];
  [v2 backButtonPressed];
}

- (void)returnKeyPressed
{
  char v3 = [(SPUISearchHeader *)self searchField];
  if ([v3 optOutOfGoButton])
  {
    BOOL v4 = [(SPUISearchHeader *)self textFieldShouldReturn];

    if (v4)
    {
      uint64_t v5 = MEMORY[0x263F79148];
      int v6 = *(NSObject **)(MEMORY[0x263F79148] + 8);
      if (!v6)
      {
        SPUIInitLogging();
        int v6 = *(NSObject **)(v5 + 8);
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D2E6000, v6, OS_LOG_TYPE_DEFAULT, "As typed suggestion hit", buf, 2u);
      }
      return;
    }
  }
  else
  {
  }
  id v7 = [(SPUISearchHeader *)self delegate];
  [v7 returnKeyPressed];
}

- (void)highlightResultAfterUnmarkingText
{
  id v2 = [(SPUISearchHeader *)self delegate];
  [v2 highlightResultAfterUnmarkingText];
}

- (BOOL)optOutOfGoButton
{
  id v2 = [(SPUISearchHeader *)self searchField];
  char v3 = [v2 optOutOfGoButton];

  return v3;
}

- (void)removeCompletionAndHighlightAsTyped:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SPUISearchHeader *)self delegate];
  [v4 removeCompletionAndHighlightAsTyped:v3];
}

- (void)setActiveInterfaceOrientation:(int64_t)a3
{
  if (self->_activeInterfaceOrientation != a3)
  {
    self->_activeInterfaceOrientation = a3;
    uint64_t v5 = [(SPUISearchHeader *)self searchField];
    [v5 setActiveInterfaceOrientation:a3];

    [MEMORY[0x263F67C00] idealPlatterWidthForOrientation:a3];
    double v7 = v6;
    uint64_t v8 = [(SPUISearchHeader *)self widthConstraint];
    [v8 setConstant:v7];

    [(SPUISearchHeader *)self topPadding];
    double v10 = v9;
    uint64_t v11 = [(SPUISearchHeader *)self topConstraint];
    [v11 setConstant:v10];

    [(SPUISearchHeader *)self bottomPadding];
    double v13 = v12;
    double v14 = [(SPUISearchHeader *)self bottomConstraint];
    [v14 setConstant:v13];

    uint8_t v15 = [(SPUISearchHeader *)self searchField];
    [v15 invalidateIntrinsicContentSize];

    [(SPUISearchHeader *)self invalidateIntrinsicContentSize];
  }
}

- (void)addInputMethodInformationToQueryContext:(id)a3
{
  id v13 = a3;
  id v4 = [(SPUISearchHeader *)self textInputMode];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double v6 = [v5 primaryLanguage];
    [v13 setKeyboardPrimaryLanguage:v6];

    double v7 = [v5 identifier];
    if ([(__CFString *)v7 isEqualToString:@"dictation"])
    {
      uint64_t v8 = v13;
      double v9 = v7;
    }
    else
    {
      double v10 = [v5 extension];

      if (!v10)
      {
        uint64_t v11 = [v5 normalizedIdentifierLevels];
        double v12 = [v11 firstObject];
        [v13 setKeyboardLanguage:v12];

        goto LABEL_8;
      }
      double v9 = @"custom";
      uint64_t v8 = v13;
    }
    [v8 setKeyboardLanguage:v9];
LABEL_8:
  }
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 1;
}

- (unint64_t)queryId
{
  id v2 = [(SPUISearchHeader *)self delegate];
  unint64_t v3 = [v2 currentQueryId];

  return v3;
}

- (void)textWasCutFromTextField:(id)a3
{
}

- (void)textDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUISearchHeader *)self searchField];
  if (([v5 ignoreTokensUpdate] & 1) == 0
    && ![(SPUISearchHeader *)self searchTextScheduledForProcessing])
  {
    double v6 = [v5 textIncludingTokens];
    unint64_t v7 = [v6 length];

    if (v7 >= 0x3E9)
    {
      uint64_t v8 = [v5 textIncludingTokens];
      uint64_t v9 = [v8 length];
      double v10 = [v5 text];
      unint64_t v11 = v9 - [v10 length];

      double v12 = [v5 textualRange];
      if (v11 > 0x3E7)
      {
        [v5 replaceRange:v12 withText:&stru_26F104E28];
      }
      else
      {
        id v13 = [v5 text];
        double v14 = [v13 substringToIndex:1000 - v11];
        [v5 replaceRange:v12 withText:v14];
      }
    }
    uint8_t v15 = [v5 searchText];
    BOOL v16 = +[SPUITextField removeDictationCharacterInString:v15];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __34__SPUISearchHeader_textDidChange___block_invoke;
    v18[3] = &unk_264E90960;
    id v19 = v16;
    double v20 = self;
    id v21 = v5;
    id v22 = v4;
    id v17 = v16;
    dispatch_async(MEMORY[0x263EF83A0], v18);
  }
}

uint64_t __34__SPUISearchHeader_textDidChange___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) lastSearchText];
  if (![v2 isEqualToString:v3]) {
    goto LABEL_4;
  }
  id v4 = [*(id *)(a1 + 48) searchEntity];
  id v5 = [*(id *)(a1 + 40) lastSearchEntity];
  if (v4 != v5)
  {

LABEL_4:
    goto LABEL_5;
  }
  uint64_t v23 = [*(id *)(a1 + 32) length];

  if (v23) {
    goto LABEL_23;
  }
LABEL_5:
  [*(id *)(a1 + 40) setLastSearchText:*(void *)(a1 + 32)];
  double v6 = [*(id *)(a1 + 48) searchEntity];
  [*(id *)(a1 + 40) setLastSearchEntity:v6];

  unint64_t v7 = *(void **)(a1 + 56);
  if (v7 != *(void **)(a1 + 48))
  {
    uint64_t v8 = 0;
LABEL_7:
    int v9 = 1;
LABEL_8:
    uint64_t v10 = [(id)objc_opt_class() asYouTypeSearchQueryKind];
    if (v9) {
      [*(id *)(a1 + 40) setOffersCompletions:1];
    }
    if (![*(id *)(a1 + 40) offersCompletions]) {
      uint64_t v10 = 9;
    }
    unint64_t v11 = [*(id *)(a1 + 40) textInputMode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      uint64_t v13 = 5;
    }
    else {
      uint64_t v13 = 1;
    }
    double v14 = [*(id *)(a1 + 40) searchField];
    uint8_t v15 = [v14 searchEntity];

    BOOL v16 = [*(id *)(a1 + 40) delegate];
    id v17 = [v16 currentQueryContext];

    uint64_t v18 = [*(id *)(a1 + 40) previousQueryID];
    id v19 = [MEMORY[0x263F79160] updateQueryContext:v17 withSearchString:*(void *)(a1 + 32) showSuggestions:1 view:*(void *)(a1 + 56)];

    if (v15)
    {
      v24[0] = v15;
      double v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
      [v19 setSearchEntities:v20];
    }
    else
    {
      [v19 setSearchEntities:0];
    }
    [v19 setWhyQuery:v13];
    [v19 setQueryKind:v10];
    [*(id *)(a1 + 40) queryContextDidChange:v19 fromPreviousQueryId:v18 allowZKW:1];

    goto LABEL_22;
  }
  uint64_t v8 = [v7 searchEntity];
  if (!v8) {
    goto LABEL_7;
  }
  id v21 = [*(id *)(a1 + 40) searchEntity];

  if (v8 == v21)
  {
    int v9 = 0;
    goto LABEL_8;
  }
  [*(id *)(a1 + 40) setSearchEntity:v8 fromSuggestion:0];
LABEL_22:
  [*(id *)(a1 + 48) setNeedsLayout];

LABEL_23:
  [*(id *)(a1 + 40) updateSearchFieldModel];
  return [*(id *)(a1 + 40) setSearchTextScheduledForProcessing:0];
}

- (void)textDidChange:(id)a3 whyQuery:(unint64_t)a4 allowZKW:(BOOL)a5 sourcePreference:(unint64_t)a6 searchEntities:(id)a7 queryKind:(unint64_t)a8
{
  BOOL v26 = a5;
  id v13 = a7;
  id v14 = a3;
  uint8_t v15 = [(SPUISearchHeader *)self searchEntity];
  BOOL v16 = +[SPUITextField webEntityStringForEntity:v15];

  id v27 = +[SPUITextField removeDictationCharacterInString:v14];

  id v17 = [(SPUISearchHeader *)self searchField];
  uint64_t v18 = [v17 searchText];
  if ([v18 length])
  {
    id v19 = [(SPUISearchHeader *)self searchField];
    id v20 = [v19 searchText];
  }
  else
  {
    id v20 = v27;
  }

  if (v16) {
    id v21 = v16;
  }
  else {
    id v21 = v20;
  }
  id v22 = [(SPUISearchHeader *)self currentQueryContextWithString:v21];
  [v22 setSearchEntities:v13];

  [v22 setQueryKind:a8];
  if ([v27 length]) {
    unint64_t v23 = a4;
  }
  else {
    unint64_t v23 = 9;
  }
  [v22 setWhyQuery:v23];
  uint64_t v24 = [(SPUISearchHeader *)self currentQuery];
  char v25 = [v24 isEqualToString:v20];

  if ((v25 & 1) == 0) {
    [v22 setSearchString:v20];
  }
  if (a6 - 1 <= 1) {
    [v22 setPromoteParsecResults:1];
  }
  [(SPUISearchHeader *)self queryContextDidChange:v22 fromPreviousQueryId:[(SPUISearchHeader *)self previousQueryID] allowZKW:v26];
}

- (void)updateSearchFieldModel
{
  unint64_t v3 = [SPUICompletionStringModel alloc];
  id v12 = [(SPUISearchHeader *)self searchField];
  id v4 = [v12 text];
  id v5 = [(SPUISearchHeader *)self searchField];
  double v6 = [v5 tokens];
  BOOL v7 = [v6 count] != 0;
  unint64_t v8 = [(SPUISearchHeader *)self queryId];
  int v9 = [(SPUISearchHeader *)self searchField];
  uint64_t v10 = -[SPUICompletionStringModel initWithTypedString:hasTokens:queryId:hasMarkedText:](v3, "initWithTypedString:hasTokens:queryId:hasMarkedText:", v4, v7, v8, [v9 hasMarkedText]);
  unint64_t v11 = [(SPUISearchHeader *)self searchField];
  [v11 setSearchFieldModel:v10];
}

- (void)textDidChange:(id)a3 whyQuery:(unint64_t)a4 allowZKW:(BOOL)a5 queryKind:(unint64_t)a6
{
  BOOL v7 = a5;
  v16[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  unint64_t v11 = [(SPUISearchHeader *)self searchField];
  id v12 = [v11 searchEntity];
  if (v12)
  {
    id v13 = [(SPUISearchHeader *)self searchField];
    id v14 = [v13 searchEntity];
    v16[0] = v14;
    uint8_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [(SPUISearchHeader *)self textDidChange:v10 whyQuery:a4 allowZKW:v7 sourcePreference:0 searchEntities:v15 queryKind:a6];
  }
  else
  {
    [(SPUISearchHeader *)self textDidChange:v10 whyQuery:a4 allowZKW:v7 sourcePreference:0 searchEntities:0 queryKind:a6];
  }
}

- (void)cancelButtonClicked:(id)a3
{
  id v3 = [(SPUISearchHeader *)self delegate];
  [v3 cancelButtonPressed];
}

- (void)escapeKeyPressed
{
  id v2 = [(SPUISearchHeader *)self delegate];
  [v2 cancelButtonPressed];
}

- (BOOL)textFieldShouldReturn
{
  id v3 = [(SPUISearchHeader *)self searchField];
  uint64_t v4 = [v3 returnKeyType];

  if (v4 == 1)
  {
    [(SPUISearchHeader *)self setIsReturnKeyPressedInGoMode:1];
    id v5 = [(SPUISearchHeader *)self delegate];
    [v5 returnKeyPressed];

    [(SPUISearchHeader *)self setIsReturnKeyPressedInGoMode:0];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F67878]);
    BOOL v7 = [(SPUISearchHeader *)self searchField];
    unint64_t v8 = [v7 text];
    int v9 = (void *)[v6 initWithInput:v8 endpoint:6];

    id v10 = +[SPUIFeedbackManager feedbackListener];
    objc_msgSend(v10, "reportFeedback:queryId:", v9, -[SPUISearchHeader queryId](self, "queryId"));

    if (([MEMORY[0x263F828A0] isInHardwareKeyboardMode] & 1) == 0) {
      [(SPUISearchHeader *)self unfocusSearchFieldWithReason:2];
    }
    [(SPUISearchHeader *)self commitSearch];
  }
  return 1;
}

- (void)triggerSearchForUnlock
{
  id v4 = [(SPUISearchHeader *)self searchField];
  id v3 = [v4 textIncludingTokens];
  -[SPUISearchHeader textDidChange:whyQuery:allowZKW:queryKind:](self, "textDidChange:whyQuery:allowZKW:queryKind:", v3, 17, 1, [(id)objc_opt_class() asYouTypeSearchQueryKind]);
}

- (BOOL)lastQueryKindSupportsOptionKey
{
  id v2 = [(SPUISearchHeader *)self delegate];
  id v3 = [v2 currentQueryContext];
  uint64_t v4 = [v3 queryKind];
  BOOL v5 = v4 == [(id)objc_opt_class() asYouTypeSearchQueryKind];

  return v5;
}

- (void)commitSearch
{
  if (!self->_searchEntity)
  {
    id v4 = [(SPUISearchHeader *)self searchField];
    id v3 = [v4 textIncludingTokens];
    -[SPUISearchHeader textDidChange:whyQuery:allowZKW:queryKind:](self, "textDidChange:whyQuery:allowZKW:queryKind:", v3, 23, 1, [(id)objc_opt_class() committedSearchQueryKind]);
  }
}

- (void)switchToSuggestions
{
  uint64_t v3 = [(id)objc_opt_class() asYouTypeSearchQueryKind];
  if (![(SPUISearchHeader *)self offersCompletions]) {
    uint64_t v3 = 9;
  }
  [(SPUISearchHeader *)self setSearchEntity:0];
  id v4 = [(SPUISearchHeader *)self searchField];
  BOOL v5 = [v4 text];
  [(SPUISearchHeader *)self textDidChange:v5 whyQuery:1 allowZKW:1 queryKind:v3];

  [(SPUISearchHeader *)self setLastSearchEntity:0];
  id v7 = [(SPUISearchHeader *)self searchField];
  id v6 = [v7 searchText];
  [(SPUISearchHeader *)self setLastSearchText:v6];
}

- (void)textFieldDidReplaceTokensWithStringEquivalent:(id)a3
{
}

- (void)textFieldDidClear:(id)a3
{
}

- (id)markedTextArray
{
  v25[3] = *MEMORY[0x263EF8340];
  id v2 = [(SPUISearchHeader *)self searchField];
  uint64_t v3 = [v2 markedTextRange];

  if (v3)
  {
    id v4 = [v2 markedTextRange];
    BOOL v5 = [v2 textInRange:v4];

    if ([v5 length])
    {
      id v6 = [v2 beginningOfDocument];
      id v7 = [v2 markedTextRange];
      unint64_t v8 = [v7 start];
      int v9 = [v2 textRangeFromPosition:v6 toPosition:v8];

      uint64_t v10 = [v2 textInRange:v9];
      unint64_t v11 = (void *)v10;
      id v12 = &stru_26F104E28;
      if (v10) {
        id v13 = (__CFString *)v10;
      }
      else {
        id v13 = &stru_26F104E28;
      }
      id v14 = v13;

      uint8_t v15 = [v2 markedTextRange];
      BOOL v16 = [v15 end];
      id v17 = [v2 positionFromPosition:v16 offset:1];

      if (v17)
      {
        uint64_t v18 = [v2 endOfDocument];
        id v19 = [v2 textRangeFromPosition:v17 toPosition:v18];

        uint64_t v20 = [v2 textInRange:v19];
        id v21 = (void *)v20;
        if (v20) {
          id v22 = (__CFString *)v20;
        }
        else {
          id v22 = &stru_26F104E28;
        }
        id v12 = v22;
      }
      v25[0] = v14;
      v25[1] = v5;
      v25[2] = v12;
      unint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
    }
    else
    {
      unint64_t v23 = 0;
    }
  }
  else
  {
    unint64_t v23 = 0;
  }

  return v23;
}

- (id)currentQueryContextWithString:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F78DB0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithSearchString:v5];
  objc_msgSend(v6, "setDeviceAuthenticationState:", objc_msgSend(MEMORY[0x263F79178], "deviceAuthenticationStateForView:", self));
  id v7 = [(SPUISearchHeader *)self markedTextArray];
  [v6 setMarkedTextArray:v7];

  unint64_t v8 = (void *)MEMORY[0x263F02B08];
  int v9 = [MEMORY[0x263F02B08] emptySuggestion];
  uint64_t v10 = [v8 updatedSuggestionWithCurrentSuggestion:v9 userString:v5 tokens:MEMORY[0x263EFFA68]];

  [v6 setBackingSearchModel:v10];
  [(SPUISearchHeader *)self addInputMethodInformationToQueryContext:v6];
  [(SPUISearchHeader *)self tlks_scale];
  objc_msgSend(v6, "setScaleFactor:");
  return v6;
}

- (void)setSearchEntity:(id)a3
{
}

+ (id)tokenFromSearchEntity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 symbolName];
  if (v4)
  {
    id v5 = [MEMORY[0x263F67C70] uiImageWithSymbolName:v4];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = (void *)MEMORY[0x263F82BA8];
  id v7 = [v3 tokenText];
  unint64_t v8 = [v6 tokenWithIcon:v5 text:v7];

  [v8 setRepresentedObject:v3];
  return v8;
}

- (void)restoreSearchText:(id)a3 searchEntity:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  [(SPUISearchHeader *)self setSearchEntity:v6];
  [(SPUISearchHeader *)self setLastSearchText:v11];
  id v7 = [(SPUISearchHeader *)self searchField];
  unint64_t v8 = v7;
  if (v6)
  {
    int v9 = [v6 searchString];
    [v8 updateTextRange:v9];

    unint64_t v8 = [(SPUISearchHeader *)self searchField];
    uint64_t v10 = +[SPUISearchHeader tokenFromSearchEntity:v6];
    [v8 updateToken:v10];
  }
  else
  {
    [v7 setText:v11];
  }
}

- (void)setSearchEntity:(id)a3 fromSuggestion:(BOOL)a4
{
  id v6 = (SPSearchEntity *)a3;
  searchEntity = self->_searchEntity;
  if (searchEntity != v6)
  {
    id v17 = v6;
    if (([(SPSearchEntity *)searchEntity isEqual:v6] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_searchEntity, a3);
      if (v17)
      {
        unint64_t v8 = [(SPSearchEntity *)v17 tokenText];
        if (!v8)
        {
          id v11 = [(SPUISearchHeader *)self searchField];
          id v13 = [(SPSearchEntity *)v17 searchString];
          [v11 updateTextRange:v13];
LABEL_10:

          goto LABEL_11;
        }
        [(SPUISearchHeader *)self setOffersCompletions:0];
        int v9 = [(SPUISearchHeader *)self searchField];
        uint64_t v10 = [v9 tokens];
        id v11 = [(id)v10 firstObject];

        id v12 = [v11 representedObject];
        LOBYTE(v10) = [v12 isEqual:v17];

        if ((v10 & 1) == 0)
        {
          id v13 = [(id)objc_opt_class() tokenFromSearchEntity:v17];
          if (v13)
          {
            id v14 = [(SPUISearchHeader *)self searchField];
            uint8_t v15 = [(SPSearchEntity *)v17 searchString];
            [v14 updateTextRange:v15];

            BOOL v16 = [(SPUISearchHeader *)self searchField];
            [v16 updateToken:v13];
          }
          goto LABEL_10;
        }
      }
      else
      {
        unint64_t v8 = [(SPUISearchHeader *)self currentQuery];
        id v11 = [(SPUISearchHeader *)self searchField];
        [v11 setText:v8];
      }
LABEL_11:
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)_searchWithSearchEntity:(id)a3 fromSuggestion:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = 1;
  }
  id v7 = [(SPUISearchHeader *)self searchField];
  id v6 = [v7 textIncludingTokens];
  [(SPUISearchHeader *)self textDidChange:v6 whyQuery:v5 allowZKW:1 queryKind:9];
}

- (id)_searchTextField:(id)a3 itemProviderForCopyingToken:(id)a4
{
  id v4 = objc_msgSend(a4, "representedObject", a3);
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F088E0]) initWithItem:v4 typeIdentifier:@"com.apple.spotlight.searchEntity"];
  id v6 = [v4 tokenText];
  [v5 registerObject:v6 visibility:0];

  return v5;
}

- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4
{
  id v5 = a4;
  id v6 = [v5 itemProvider];
  if ([v6 hasItemConformingToTypeIdentifier:@"com.apple.spotlight.searchEntity"])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __72__SPUISearchHeader_textPasteConfigurationSupporting_transformPasteItem___block_invoke;
    v8[3] = &unk_264E909B0;
    v8[4] = self;
    id v9 = v5;
    id v7 = (id)[v6 loadDataRepresentationForTypeIdentifier:@"com.apple.spotlight.searchEntity" completionHandler:v8];
  }
  else
  {
    [v5 setDefaultResult];
  }
}

void __72__SPUISearchHeader_textPasteConfigurationSupporting_transformPasteItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F67C78];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__SPUISearchHeader_textPasteConfigurationSupporting_transformPasteItem___block_invoke_2;
  v8[3] = &unk_264E90988;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  [v4 dispatchMainIfNecessary:v8];
}

void __72__SPUISearchHeader_textPasteConfigurationSupporting_transformPasteItem___block_invoke_2(uint64_t a1)
{
  id v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:*(void *)(a1 + 32) error:0];
  id v2 = [*(id *)(a1 + 40) searchField];
  id v3 = [(id)objc_opt_class() tokenFromSearchEntity:v6];
  id v4 = [*(id *)(a1 + 40) searchField];
  uint64_t v5 = [v4 tokens];
  objc_msgSend(v2, "insertToken:atIndex:", v3, objc_msgSend(v5, "count"));

  [*(id *)(a1 + 40) setLastSearchEntity:v6];
  [*(id *)(a1 + 40) commitSearch];
  [*(id *)(a1 + 48) setNoResult];
}

- (void)beginDictation
{
  id v3 = [(SPUISearchHeader *)self searchField];
  [v3 updateRightView];

  id v4 = [(SPUISearchHeader *)self searchField];
  char v5 = [v4 isFirstResponder];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = MEMORY[0x263F79148];
    id v7 = *(NSObject **)(MEMORY[0x263F79148] + 32);
    if (!v7)
    {
      SPUIInitLogging();
      id v7 = *(NSObject **)(v6 + 32);
    }
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23D2E6000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "firstResponder", (const char *)&unk_23D315BC7, buf, 2u);
    }
    [(SPUISearchHeader *)self setInvokeReason:2];
  }
  unint64_t v8 = [MEMORY[0x263F828C0] sharedInputModeController];
  id v9 = [(SPUISearchHeader *)self searchField];
  uint64_t v10 = [MEMORY[0x263F82688] dictationInputModeOptionsWithInvocationSource:@"UIDictationInputModeInvocationSourceMicButtonMicButtonInFirstResponderSearchBar"];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __34__SPUISearchHeader_beginDictation__block_invoke;
  v11[3] = &unk_264E90660;
  v11[4] = self;
  [v8 toggleDictationForResponder:v9 withOption:v10 firstResponderSetupCompletion:v11];
}

void __34__SPUISearchHeader_beginDictation__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) searchField];
  int v3 = [v2 isFirstResponder];

  if (v3)
  {
    uint64_t v4 = MEMORY[0x263F79148];
    char v5 = *(NSObject **)(MEMORY[0x263F79148] + 32);
    if (!v5)
    {
      SPUIInitLogging();
      char v5 = *(NSObject **)(v4 + 32);
    }
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)id v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_23D2E6000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "firstResponder", " enableTelemetry=YES ", v14, 2u);
    }
    uint64_t v6 = [*(id *)(a1 + 32) searchField];
    id v7 = [v6 tokens];
    if ([v7 count])
    {
    }
    else
    {
      uint64_t v10 = [*(id *)(a1 + 32) searchField];
      id v11 = [v10 text];
      uint64_t v12 = [v11 length];

      if (!v12) {
        return;
      }
    }
    id v13 = [*(id *)(a1 + 32) searchField];
    [v13 selectAll:0];
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F79148];
    id v9 = *(NSObject **)(MEMORY[0x263F79148] + 16);
    if (!v9)
    {
      SPUIInitLogging();
      id v9 = *(NSObject **)(v8 + 16);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __34__SPUISearchHeader_beginDictation__block_invoke_cold_1(v9);
    }
  }
}

+ (void)logDismissalWithReason:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3 > 5) {
    int v3 = 0;
  }
  else {
    int v3 = off_264E90A28[a3];
  }
  uint64_t v4 = MEMORY[0x263F79148];
  char v5 = *(NSObject **)(MEMORY[0x263F79148] + 16);
  if (!v5)
  {
    SPUIInitLogging();
    char v5 = *(NSObject **)(v4 + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_23D2E6000, v5, OS_LOG_TYPE_DEFAULT, "dismissal reason %@", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)isFirstResponder
{
  id v2 = [(SPUISearchHeader *)self searchField];
  char v3 = [v2 isFirstResponder];

  return v3;
}

- (void)unfocusSearchFieldWithReason:(unint64_t)a3
{
}

- (void)unfocusSearchFieldWithReason:(unint64_t)a3 afterCommit:(BOOL)a4
{
  if (!objc_msgSend(MEMORY[0x263F828A0], "isInHardwareKeyboardMode", a3, a4)
    || ([MEMORY[0x263F79140] enableFloatingWindow] & 1) == 0)
  {
    if (a3 || [(SPUISearchHeader *)self invokeReason] != 1)
    {
      if ([(SPUISearchHeader *)self isFirstResponder])
      {
        +[SPUISearchHeader logDismissalWithReason:a3];
        id v8 = [(SPUISearchHeader *)self searchField];
        [v8 resignFirstResponder];
      }
    }
    else
    {
      int v6 = *(NSObject **)(MEMORY[0x263F79148] + 16);
      if (!v6)
      {
        uint64_t v7 = MEMORY[0x263F79148];
        SPUIInitLogging();
        int v6 = *(NSObject **)(v7 + 16);
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D2E6000, v6, OS_LOG_TYPE_DEFAULT, "ignoring keyboard dismissal since viewDidAppear", buf, 2u);
      }
      [(SPUISearchHeader *)self isFirstResponder];
    }
  }
}

- (void)resignKeyboardForProcessState
{
  if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    [(SPUISearchHeader *)self unfocusSearchFieldWithReason:4];
  }
}

- (void)updateWithCommand:(id)a3
{
  id v19 = a3;
  [(SPUISearchHeader *)self setLastSearchText:0];
  [(SPUISearchHeader *)self setLastSearchEntity:0];
  [(SPUISearchHeader *)self setUseClearTokens:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v19;
    uint64_t v5 = [(id)objc_opt_class() committedSearchQueryKind];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 queryKind];
      uint64_t v7 = objc_opt_class();
      if (v6 == 1) {
        uint64_t v8 = [v7 asYouTypeSearchQueryKind];
      }
      else {
        uint64_t v8 = [v7 committedSearchQueryKind];
      }
      uint64_t v5 = v8;
    }
    uint64_t v12 = [v4 searchString];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      id v14 = [(SPUISearchHeader *)self searchField];
      [v14 updateToken:0];

      uint8_t v15 = [v4 searchString];
      BOOL v16 = [(SPUISearchHeader *)self searchField];
      [v16 setText:v15];

      id v17 = [v4 searchString];
      [(SPUISearchHeader *)self setLastSearchText:v17];

      uint64_t v18 = [v4 searchString];
      [(SPUISearchHeader *)self textDidChange:v18 whyQuery:8 allowZKW:1 sourcePreference:2 searchEntities:0 queryKind:v5];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v19 person];
      id v9 = [v4 contactIdentifier];

      if (v9)
      {
        uint64_t v10 = (void *)MEMORY[0x263F78DA8];
        id v11 = [v4 contactIdentifier];
        id v9 = [v10 searchEntityWithContactIdentifier:v11 fromSuggestion:0];
      }
      [(SPUISearchHeader *)self setSearchEntity:v9 fromSuggestion:1];
      [(SPUISearchHeader *)self _searchWithSearchEntity:v9 fromSuggestion:1];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
      id v4 = [MEMORY[0x263F79160] queryContextWithPerformEntityQueryCommand:v19 view:self];
      [(SPUISearchHeader *)self queryContextDidChange:v4 fromPreviousQueryId:[(SPUISearchHeader *)self queryId] allowZKW:1];
    }
  }

LABEL_16:
  if (([MEMORY[0x263F828A0] isInHardwareKeyboardMode] & 1) == 0) {
    [(SPUISearchHeader *)self unfocusSearchFieldWithReason:3];
  }
}

- (unint64_t)getClearTriggerEventForQueryContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SPUISearchHeader *)self willClear];
  [(SPUISearchHeader *)self setWillClear:0];
  BOOL v6 = [(SPUISearchHeader *)self textWasCut];
  [(SPUISearchHeader *)self setTextWasCut:0];
  uint64_t v7 = [v4 searchEntities];
  if (v7)
  {

    unint64_t v8 = 0;
  }
  else
  {
    id v9 = [v4 searchString];
    uint64_t v10 = [v9 length];

    if (v10) {
      int v11 = 1;
    }
    else {
      int v11 = v5;
    }
    if (v11) {
      unint64_t v8 = v10 == 0;
    }
    else {
      unint64_t v8 = 2;
    }
    if (((v11 | v6) & 1) == 0)
    {
      if ([v4 whyQuery] == 1) {
        unint64_t v8 = 3;
      }
      else {
        unint64_t v8 = 0;
      }
    }
  }

  return v8;
}

- (void)queryContextDidChange:(id)a3 fromPreviousQueryId:(unint64_t)a4 allowZKW:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [v8 searchEntities];
  uint64_t v10 = [v9 firstObject];
  [(SPUISearchHeader *)self setSearchEntity:v10];

  int v11 = [(SPUISearchHeader *)self searchEntity];
  -[SPUISearchHeader setUseClearTokens:](self, "setUseClearTokens:", [v11 isServerEntitySearch]);

  uint64_t v12 = [(SPUISearchHeader *)self searchEntity];

  if (!v12) {
    [(SPUISearchHeader *)self setOffersCompletions:1];
  }
  unint64_t v13 = [(SPUISearchHeader *)self getClearTriggerEventForQueryContext:v8];
  id v14 = [v8 searchString];
  if ([v14 length] || !v5) {
    goto LABEL_7;
  }
  uint8_t v15 = [v8 searchEntities];
  uint64_t v16 = [v15 count];

  if (!v16)
  {
    +[SPUIFeedbackManager didClearInputWithEvent:v13 withQueryId:a4];
    id v14 = +[SPUISearchModel sharedGeneralInstance];
    [v14 clear];
LABEL_7:
  }
  kdebug_trace();
  id v17 = objc_msgSend(objc_alloc(MEMORY[0x263F67808]), "initWithEvent:timeInterval:queryId:", @"com.apple.spotlight.keystroke", 0, objc_msgSend(v8, "queryIdent"));
  uint64_t v18 = +[SPUIFeedbackManager feedbackListener];
  objc_msgSend(v18, "reportFeedback:queryId:", v17, objc_msgSend(v8, "queryIdent"));

  id v19 = SPLogForSPLogCategoryTelemetry();
  uint64_t v20 = [v8 queryIdent];
  if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v21 = v20;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)char v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_23D2E6000, v19, OS_SIGNPOST_EVENT, v21, "keystroke", " enableTelemetry=YES ", v25, 2u);
    }
  }

  [v8 setWhyClear:v13];
  id v22 = [(SPUISearchHeader *)self markedTextArray];
  [v8 setMarkedTextArray:v22];

  [(SPUISearchHeader *)self addInputMethodInformationToQueryContext:v8];
  unint64_t v23 = [(SPUISearchHeader *)self searchField];
  [v23 updateRightView];

  [(SPUISearchHeader *)self updateSearchFieldModel];
  -[SPUISearchHeader setPreviousQueryID:](self, "setPreviousQueryID:", [v8 queryIdent]);
  uint64_t v24 = [(SPUISearchHeader *)self delegate];
  [v24 queryContextDidChange:v8 fromSearchHeader:self allowZKW:v5];
}

- (void)setUseClearTokens:(BOOL)a3
{
  if (self->_useClearTokens != a3)
  {
    self->_useClearTokens = a3;
    [(SPUISearchHeader *)self tlk_updateWithCurrentAppearance];
  }
}

- (void)clearSearchFieldWhyQuery:(unint64_t)a3 allowZKW:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(SPUISearchHeader *)self searchField];
  [v7 setText:0];

  id v8 = [(SPUISearchHeader *)self searchField];
  [v8 clearAllTokens];

  id v9 = [(SPUISearchHeader *)self searchField];
  uint64_t v10 = [v9 textIncludingTokens];
  -[SPUISearchHeader textDidChange:whyQuery:allowZKW:queryKind:](self, "textDidChange:whyQuery:allowZKW:queryKind:", v10, a3, v4, [(id)objc_opt_class() asYouTypeSearchQueryKind]);

  [(SPUISearchHeader *)self setSearchEntity:0];
  [(SPUISearchHeader *)self clearLastSearchedText];
}

- (BOOL)cancelButtonIsVisible
{
  id v2 = [(SPUISearchHeader *)self cancelButtonTrailingConstraint];
  char v3 = [v2 isActive];

  return v3;
}

- (void)searchForSuggestion:(id)a3 isBuildingQuery:(BOOL)a4
{
  BOOL v4 = a4;
  id v20 = a3;
  if ([v20 type] == 17) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  if (v4) {
    uint64_t v7 = 25;
  }
  else {
    uint64_t v7 = 8;
  }
  id v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v10 = 0;
    if (!v4) {
      goto LABEL_9;
    }
LABEL_13:
    uint64_t v12 = [(SPUISearchHeader *)self searchField];
    [v12 becomeFirstResponder];

    int v11 = @" ";
    goto LABEL_14;
  }
  uint64_t v10 = [v20 searchEntities];
  uint64_t v6 = 0;
  uint64_t v7 = 22;
  if (v4) {
    goto LABEL_13;
  }
LABEL_9:
  if (([MEMORY[0x263F828A0] isInHardwareKeyboardMode] & 1) == 0) {
    [(SPUISearchHeader *)self unfocusSearchFieldWithReason:3];
  }
  int v11 = &stru_26F104E28;
LABEL_14:
  unint64_t v13 = [(SPUISearchHeader *)self searchField];
  [v13 updateToken:0];

  id v14 = [v20 title];
  uint8_t v15 = [v14 text];
  uint64_t v16 = [v15 stringByAppendingString:v11];

  id v17 = [(SPUISearchHeader *)self searchField];
  [v17 setText:v16];

  uint64_t v18 = objc_opt_class();
  if (v4) {
    uint64_t v19 = [v18 asYouTypeSearchQueryKind];
  }
  else {
    uint64_t v19 = [v18 committedSearchQueryKind];
  }
  [(SPUISearchHeader *)self textDidChange:v16 whyQuery:v7 allowZKW:1 sourcePreference:v6 searchEntities:v10 queryKind:v19];
}

- (void)performTestSearchWithQuery:(id)a3 event:(unint64_t)a4 queryKind:(unint64_t)a5
{
  id v8 = a3;
  [(SPUISearchHeader *)self textDidChange:v8 whyQuery:a4 allowZKW:1 sourcePreference:0 searchEntities:0 queryKind:a5];
  id v9 = [(SPUISearchHeader *)self searchField];
  [v9 setText:v8];
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  id v2 = [(SPUISearchHeader *)self searchField];
  char v3 = [v2 completionResultIsPotentiallyPunchout];

  return v3;
}

- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SPUISearchHeader_performTransition_willBeDisplayed___block_invoke;
  v4[3] = &unk_264E909D8;
  BOOL v5 = a4;
  v4[4] = self;
  v4[5] = a3;
  [MEMORY[0x263F82E00] performWithoutAnimation:v4];
}

id __54__SPUISearchHeader_performTransition_willBeDisplayed___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)SPUISearchHeader;
  return objc_msgSendSuper2(&v4, sel_performTransition_willBeDisplayed_, v1, v2);
}

- (void)setInteractionDelegate:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (int64_t)activeInterfaceOrientation
{
  return self->_activeInterfaceOrientation;
}

- (BOOL)isReturnKeyPressedInGoMode
{
  return self->_isReturnKeyPressedInGoMode;
}

- (void)setIsReturnKeyPressedInGoMode:(BOOL)a3
{
  self->_isReturnKeyPressedInGoMode = a3;
}

- (NSString)lastSearchText
{
  return (NSString *)objc_getProperty(self, a2, 536, 1);
}

- (void)setLastSearchText:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 568, 1);
}

- (NSLayoutConstraint)topConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 576, 1);
}

- (NSLayoutConstraint)bottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 584, 1);
}

- (BOOL)willClear
{
  return self->_willClear;
}

- (void)setWillClear:(BOOL)a3
{
  self->_willClear = a3;
}

- (BOOL)textWasCut
{
  return self->_textWasCut;
}

- (void)setTextWasCut:(BOOL)a3
{
  self->_textWasCut = a3;
}

- (BOOL)searchTextScheduledForProcessing
{
  return self->_searchTextScheduledForProcessing;
}

- (void)setSearchTextScheduledForProcessing:(BOOL)a3
{
  self->_searchTextScheduledForProcessing = a3;
}

- (unint64_t)previousQueryID
{
  return self->_previousQueryID;
}

- (void)setPreviousQueryID:(unint64_t)a3
{
  self->_previousQueryID = a3;
}

- (SPSearchEntity)lastSearchEntity
{
  return (SPSearchEntity *)objc_getProperty(self, a2, 608, 1);
}

- (void)setLastSearchEntity:(id)a3
{
}

- (SBIconListLayout)iconListLayout
{
  return (SBIconListLayout *)objc_getProperty(self, a2, 616, 1);
}

- (void)setIconListLayout:(id)a3
{
}

- (unint64_t)invokeReason
{
  return self->_invokeReason;
}

- (unint64_t)suggestionID
{
  return self->_suggestionID;
}

- (void)setSuggestionID:(unint64_t)a3
{
  self->_suggestionID = a3;
}

- (BOOL)offersCompletions
{
  return self->_offersCompletions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_searchEntity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_iconListLayout, 0);
  objc_storeStrong((id *)&self->_lastSearchEntity, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_cancelButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_searchFieldTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_lastSearchText, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
}

void __34__SPUISearchHeader_beginDictation__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23D2E6000, log, OS_LOG_TYPE_ERROR, "Failed becomeFirstResponder", v1, 2u);
}

@end