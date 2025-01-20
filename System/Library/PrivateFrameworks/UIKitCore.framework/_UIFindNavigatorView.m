@interface _UIFindNavigatorView
- (BOOL)_canResignIfContainsFirstResponder;
- (BOOL)_replacementEnabled;
- (BOOL)becomeFirstResponder;
- (BOOL)intrinsicHeightDerivedFromAssistantBar;
- (BOOL)matchCase;
- (BOOL)replaceButtonEnabled;
- (BOOL)resignFirstResponder;
- (BOOL)usesOpaqueBackground;
- (BOOL)wholeWords;
- (CGSize)intrinsicContentSize;
- (UIButton)doneButton;
- (UIButton)nextResultButton;
- (UIButton)previousResultButton;
- (UIButton)replaceButton;
- (UIButton)settingsButton;
- (UILabel)resultCountLabel;
- (_UIFindNavigatorSearchTextField)replaceTextField;
- (_UIFindNavigatorSearchTextField)searchTextField;
- (_UIFindNavigatorView)initWithFrame:(CGRect)a3;
- (_UIFindNavigatorViewDelegate)findNavigatorDelegate;
- (id)_createNavigatorLayoutForTraitCollection:(id)a3;
- (id)_linearFocusMovementSequences;
- (id)suggestedFindMenuItems;
- (int64_t)assistantBarStyle;
- (int64_t)mode;
- (unint64_t)visibleSeparatorEdges;
- (void)_handleSearchMenuItem:(id)a3;
- (void)_invalidateSearchSession;
- (void)_navigatorHostingTypeChanged;
- (void)_preferredBackgroundColorChanged;
- (void)_setNavigatorLayout:(id)a3;
- (void)find:(id)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setAssistantBarStyle:(int64_t)a3;
- (void)setFindNavigatorDelegate:(id)a3;
- (void)setIntrinsicHeightDerivedFromAssistantBar:(BOOL)a3;
- (void)setMatchCase:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setReplaceButtonEnabled:(BOOL)a3;
- (void)setUsesOpaqueBackground:(BOOL)a3;
- (void)setVisibleSeparatorEdges:(unint64_t)a3;
- (void)setWholeWords:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIFindNavigatorView

- (_UIFindNavigatorView)initWithFrame:(CGRect)a3
{
  v97[1] = *MEMORY[0x1E4F143B8];
  v96.receiver = self;
  v96.super_class = (Class)_UIFindNavigatorView;
  v3 = -[UIInputView initWithFrame:](&v96, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 traitCollection];
    v6 = [(_UIFindNavigatorView *)v4 _createNavigatorLayoutForTraitCollection:v5];

    [v6 addMaterialToViewIfNeeded:v4];
    uint64_t v7 = CreateSeparatorView();
    left = v4->_separatorViews.left;
    v4->_separatorViews.left = (UIView *)v7;

    [(UIView *)v4->_separatorViews.left setHidden:1];
    [(UIView *)v4 addSubview:v4->_separatorViews.left];
    uint64_t v9 = CreateSeparatorView();
    right = v4->_separatorViews.right;
    v4->_separatorViews.right = (UIView *)v9;

    [(UIView *)v4->_separatorViews.right setHidden:1];
    [(UIView *)v4 addSubview:v4->_separatorViews.right];
    uint64_t v11 = CreateSeparatorView();
    bottom = v4->_separatorViews.bottom;
    v4->_separatorViews.bottom = (UIView *)v11;

    [(UIView *)v4->_separatorViews.bottom setHidden:1];
    [(UIView *)v4 addSubview:v4->_separatorViews.bottom];
    v75 = _UILocalizedString(@"DONE", @"Button that's used to dismiss the parent.", @"Done");
    if ([v6 usesSymbolForDoneButton]) {
      [v6 commonButtonConfigWithImageName:@"xmark" isAccessory:0];
    }
    else {
    v77 = [v6 commonButtonConfigWithTitle:v75];
    }
    uint64_t v13 = +[UIButton buttonWithConfiguration:v77 primaryAction:0];
    doneButton = v4->_doneButton;
    v4->_doneButton = (UIButton *)v13;

    [(UIView *)v4->_doneButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4->_doneButton setAccessibilityIdentifier:@"find.doneButton"];
    [(UIControl *)v4->_doneButton setPointerInteractionEnabled:1];
    v15 = [v6 preferredMaximumContentSizeCategory];
    v16 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleBody" maximumContentSizeCategory:v15];
    [v16 pointSize];
    double v18 = v17;

    v19 = [UILabel alloc];
    double v20 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v24 = -[UILabel initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], v21, v22, v23);
    resultCountLabel = v4->_resultCountLabel;
    v4->_resultCountLabel = (UILabel *)v24;

    v26 = [off_1E52D39B8 monospacedDigitSystemFontOfSize:v18 weight:*(double *)off_1E52D6BF8];
    [(UILabel *)v4->_resultCountLabel setFont:v26];

    v27 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_resultCountLabel setTextColor:v27];

    [(UILabel *)v4->_resultCountLabel setTextAlignment:2];
    [v4->_resultCountLabel setAccessibilityIdentifier:@"find.resultLabel"];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __38___UIFindNavigatorView_initWithFrame___block_invoke;
    aBlock[3] = &unk_1E52E9328;
    id v28 = v6;
    id v95 = v28;
    v80 = (void (**)(void *, void))_Block_copy(aBlock);
    v29 = -[_UIFindNavigatorSearchTextField initWithFrame:]([_UIFindNavigatorSearchTextField alloc], "initWithFrame:", v20, v21, v22, v23);
    searchTextField = v4->_searchTextField;
    v4->_searchTextField = v29;

    ((void (**)(void *, _UIFindNavigatorSearchTextField *))v80)[2](v80, v4->_searchTextField);
    [(_UIFindNavigatorSearchTextField *)v4->_searchTextField setReturnKeyType:6];
    v31 = _UILocalizedString(@"FIND", @"Find in text", @"Find");
    [(UITextField *)v4->_searchTextField setPlaceholder:v31];

    v32 = [v28 preferredMaximumContentSizeCategory];
    [(UIView *)v4->_searchTextField setMaximumContentSizeCategory:v32];

    [v4->_searchTextField setAccessibilityIdentifier:@"find.searchField"];
    v81 = [v28 commonButtonConfigWithImageName:@"magnifyingglass.and.chevron.down" isAccessory:1];
    v33 = [v28 preferredSymbolConfigurationForImageForTextFields];
    [v81 setPreferredSymbolConfigurationForImage:v33];

    [v81 setMacIdiomStyle:2];
    id obj = +[UIButton buttonWithConfiguration:v81 primaryAction:0];
    [obj setUsesSquareIntrinsicSize:1];
    [obj setPreferredBehavioralStyle:1];
    v34 = [v28 preferredMaximumContentSizeCategory];
    [obj setMaximumContentSizeCategory:v34];

    [obj setAccessibilityIdentifier:@"find.settingsButton"];
    objc_storeStrong((id *)&v4->_settingsButton, obj);
    [(UIButton *)v4->_settingsButton setShowsMenuAsPrimaryAction:1];
    [(UITextField *)v4->_searchTextField setLeftView:v4->_settingsButton];
    [(UITextField *)v4->_searchTextField setLeftViewMode:3];
    [(UITextField *)v4->_searchTextField setRightView:v4->_resultCountLabel];
    [(UITextField *)v4->_searchTextField setRightViewMode:3];
    v35 = -[_UIFindNavigatorSearchTextField initWithFrame:]([_UIFindNavigatorSearchTextField alloc], "initWithFrame:", v20, v21, v22, v23);
    replaceTextField = v4->_replaceTextField;
    v4->_replaceTextField = v35;

    ((void (**)(void *, _UIFindNavigatorSearchTextField *))v80)[2](v80, v4->_replaceTextField);
    [(_UIFindNavigatorSearchTextField *)v4->_replaceTextField setReturnKeyType:4];
    v37 = _UILocalizedString(@"REPLACE", @"Replace text", @"Replace");
    [(UITextField *)v4->_replaceTextField setPlaceholder:v37];

    [v4->_replaceTextField setAccessibilityIdentifier:@"find.replaceField"];
    v38 = [v28 preferredMaximumContentSizeCategory];
    [(UIView *)v4->_replaceTextField setMaximumContentSizeCategory:v38];

    v79 = [v28 commonButtonConfigWithImageName:@"pencil" isAccessory:1];
    v39 = [v28 preferredSymbolConfigurationForImageForTextFields];
    [v79 setPreferredSymbolConfigurationForImage:v39];

    v40 = +[UIButton buttonWithConfiguration:v79 primaryAction:0];
    v41 = [v28 preferredMaximumContentSizeCategory];
    [v40 setMaximumContentSizeCategory:v41];

    [v40 setPreferredBehavioralStyle:1];
    [v40 setUsesSquareIntrinsicSize:1];
    [v40 setEnabled:0];
    [(UITextField *)v4->_replaceTextField setLeftView:v40];
    [(UITextField *)v4->_replaceTextField setLeftViewMode:3];
    v76 = _UILocalizedString(@"REPLACE", @"Button whose action replaces text", @"Replace");
    v78 = [v28 commonButtonConfigWithTitle:v76];
    v42 = [(UIView *)v4 traitCollection];
    LODWORD(v27) = [v42 horizontalSizeClass] == 1;

    if (v27) {
      objc_msgSend(v78, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
    }
    objc_initWeak(&location, v4);
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __38___UIFindNavigatorView_initWithFrame___block_invoke_2;
    v91[3] = &unk_1E52DDB60;
    objc_copyWeak(&v92, &location);
    v43 = +[UIAction actionWithHandler:v91];
    uint64_t v44 = +[UIButton buttonWithConfiguration:v78 primaryAction:v43];
    replaceButton = v4->_replaceButton;
    v4->_replaceButton = (UIButton *)v44;

    [(UIView *)v4->_replaceButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v46 = [v28 preferredMaximumContentSizeCategory];
    [(UIView *)v4->_replaceButton setMaximumContentSizeCategory:v46];

    [(UIButton *)v4->_replaceButton setEnabled:0];
    [v4->_replaceButton setAccessibilityIdentifier:@"find.replaceButton"];
    [(UIControl *)v4->_replaceButton setPointerInteractionEnabled:1];
    v52 = _UILocalizedFormat(@"REPLACE_ALL", @"Replace all occurrences.", @"Replace All", v47, v48, v49, v50, v51, (uint64_t)v73);
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __38___UIFindNavigatorView_initWithFrame___block_invoke_3;
    v89[3] = &unk_1E52DDB60;
    objc_copyWeak(&v90, &location);
    v53 = +[UIAction actionWithTitle:v52 image:0 identifier:0 handler:v89];
    v97[0] = v53;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:1];
    v55 = +[UIMenu menuWithChildren:v54];
    [(UIButton *)v4->_replaceButton setMenu:v55];

    int v56 = [v28 usesNextAndPreviousArrows];
    if (v56) {
      v57 = @"chevron.backward";
    }
    else {
      v57 = @"chevron.up";
    }
    v58 = [v28 commonButtonConfigWithImageName:v57 isAccessory:0];
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __38___UIFindNavigatorView_initWithFrame___block_invoke_4;
    v86[3] = &unk_1E52DD308;
    objc_copyWeak(&v88, &location);
    v59 = v4;
    v87 = v59;
    v60 = +[UIAction actionWithHandler:v86];
    uint64_t v61 = +[UIButton buttonWithConfiguration:v58 primaryAction:v60];
    id v62 = v59[98];
    v59[98] = (id)v61;

    [v59[98] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v59[98] setMinimumContentSizeCategory:@"UICTContentSizeCategoryM"];
    v63 = [v28 preferredMaximumContentSizeCategory];
    [v59[98] setMaximumContentSizeCategory:v63];

    [v59[98] setAccessibilityIdentifier:@"find.previousButton"];
    if (v56) {
      v64 = @"chevron.forward";
    }
    else {
      v64 = @"chevron.down";
    }
    v65 = objc_msgSend(v28, "commonButtonConfigWithImageName:isAccessory:", v64, 0, &v88);
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __38___UIFindNavigatorView_initWithFrame___block_invoke_5;
    v83[3] = &unk_1E52DD308;
    objc_copyWeak(&v85, &location);
    v66 = v59;
    v84 = v66;
    v67 = +[UIAction actionWithHandler:v83];
    uint64_t v68 = +[UIButton buttonWithConfiguration:v65 primaryAction:v67];
    id v69 = v66[97];
    v66[97] = (id)v68;

    [v66[97] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v66[97] setMinimumContentSizeCategory:@"UICTContentSizeCategoryM"];
    v70 = [v28 preferredMaximumContentSizeCategory];
    [v66[97] setMaximumContentSizeCategory:v70];

    [v66[97] setAccessibilityIdentifier:@"find.nextButton"];
    v71 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v71 addObserver:v66 selector:sel__preferredContentSizeDidChange name:@"UIContentSizeCategoryDidChangeNotification" object:0];

    [v66 _setNavigatorLayout:v28];
    objc_destroyWeak(&v85);

    objc_destroyWeak(v74);
    objc_destroyWeak(&v90);
    objc_destroyWeak(&v92);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)_setNavigatorLayout:(id)a3
{
  p_layout = &self->_layout;
  id v6 = a3;
  if (!-[_UIFindNavigatorViewLayout isEqual:](*p_layout, "isEqual:"))
  {
    [(UIView *)*p_layout removeFromSuperview];
    objc_storeStrong((id *)&self->_layout, a3);
    [(UIView *)self addSubview:v6];
    [v6 setNextResultButton:self->_nextResultButton];
    [v6 setPreviousResultButton:self->_previousResultButton];
    [v6 setDoneButton:self->_doneButton];
    [v6 setReplaceButton:self->_replaceButton];
    [v6 setSearchTextField:self->_searchTextField];
    [v6 setReplaceTextField:self->_replaceTextField];
    [v6 setAssistantBarStyle:self->_assistantBarStyle];
    [v6 setUsesAssistantBarHeight:self->_intrinsicHeightDerivedFromAssistantBar];
    [v6 preferredCornerRadius];
    -[UIView _setCornerRadius:](self, "_setCornerRadius:");
    [(_UIFindNavigatorView *)self _preferredBackgroundColorChanged];
    [v6 prepareForLayout];
    [v6 setReplaceFieldVisible:self->_mode == 1];
  }
}

- (id)_createNavigatorLayoutForTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = off_1E52D56B8;
  if ([v3 userInterfaceIdiom] && objc_msgSend(v3, "horizontalSizeClass") != 1) {
    v4 = off_1E52D56B0;
  }
  id v5 = objc_alloc(*v4);
  id v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  [(_UIFindNavigatorView *)self _navigatorHostingTypeChanged];
  v4 = [(UIView *)self traitCollection];
  id v5 = [(_UIFindNavigatorView *)self _createNavigatorLayoutForTraitCollection:v4];

  [(_UIFindNavigatorView *)self _setNavigatorLayout:v5];
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFindNavigatorView;
  [(UIView *)&v3 safeAreaInsetsDidChange];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIFindNavigatorView;
  [(UIView *)&v4 willMoveToWindow:a3];
  [(_UIFindNavigatorView *)self _navigatorHostingTypeChanged];
}

- (void)_navigatorHostingTypeChanged
{
  objc_super v3 = [(UIResponder *)self _ui_findNavigatorResponder];
  objc_super v4 = [(UIView *)self traitCollection];
  uint64_t v5 = [v3 hostingTypeForTraitCollection:v4];

  [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:v5 != 1];
  [(UIInputView *)self setAllowsSelfSizing:v5 == 1];
}

- (void)_preferredBackgroundColorChanged
{
  if (self->_usesOpaqueBackground)
  {
    id v3 = [(_UIFindNavigatorViewLayout *)self->_layout preferredOpaqueBackgroundColor];
    [(UIView *)self setBackgroundColor:v3];
  }
  else
  {
    [(UIView *)self setBackgroundColor:0];
  }
}

- (void)setMode:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_5;
    }
    a3 = 1;
  }
  [(_UIFindNavigatorViewLayout *)self->_layout setReplaceFieldVisible:a3];
LABEL_5:
  if (self->_mode != v3)
  {
    self->_mode = v3;
    [(UIView *)self invalidateIntrinsicContentSize];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorDelegate);
    [WeakRetained findNavigator:self didChangeMode:v3];
  }
}

- (BOOL)_replacementEnabled
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorDelegate);
  LOBYTE(v2) = [WeakRetained findNavigatorShouldShowReplacementOption:v2];

  return (char)v2;
}

- (void)setReplaceButtonEnabled:(BOOL)a3
{
  self->_replaceButtonEnabled = a3;
  -[UIButton setEnabled:](self->_replaceButton, "setEnabled:");
}

- (void)setAssistantBarStyle:(int64_t)a3
{
  uint64_t v5 = [(UIView *)self traitCollection];
  id v6 = [(_UIFindNavigatorView *)self _createNavigatorLayoutForTraitCollection:v5];

  [(_UIFindNavigatorView *)self _setNavigatorLayout:v6];
  self->_assistantBarStyle = a3;
  [(_UIFindNavigatorViewLayout *)self->_layout setAssistantBarStyle:a3];
  [(UIView *)self setNeedsLayout];
}

- (id)suggestedFindMenuItems
{
  v33[1] = *MEMORY[0x1E4F143B8];
  p_searchMenu = &self->_searchMenu;
  if (!self->_searchMenu.initialized)
  {
    objc_initWeak(&location, self);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __46___UIFindNavigatorView_suggestedFindMenuItems__block_invoke;
    id v28 = &unk_1E52DDB60;
    objc_copyWeak(&v29, &location);
    objc_super v4 = _Block_copy(&v25);
    uint64_t v5 = _UILocalizedString(@"FIND", @"Find text", @"Find");
    uint64_t v6 = +[UIAction actionWithTitle:v5, 0, @"find", v4, v25, v26, v27, v28 image identifier handler];
    find = p_searchMenu->find;
    p_searchMenu->find = (UIAction *)v6;

    v8 = _UILocalizedString(@"FIND_AND_REPLACE", @"Find and replace text", @"Find & Replace");
    uint64_t v9 = +[UIAction actionWithTitle:v8 image:0 identifier:@"replace" handler:v4];
    replace = p_searchMenu->replace;
    p_searchMenu->replace = (UIAction *)v9;

    uint64_t v11 = _UILocalizedString(@"WHOLE_WORDS", @"Match whole words", @"Whole Words");
    uint64_t v12 = +[UIAction actionWithTitle:v11 image:0 identifier:@"wholeWords" handler:v4];
    wholeWords = p_searchMenu->wholeWords;
    p_searchMenu->wholeWords = (UIAction *)v12;

    v14 = _UILocalizedString(@"MATCH_CASE", @"Match, case sensitive", @"Match Case");
    uint64_t v15 = +[UIAction actionWithTitle:v14 image:0 identifier:@"matchCase" handler:v4];
    matchCase = p_searchMenu->matchCase;
    p_searchMenu->matchCase = (UIAction *)v15;

    p_searchMenu->initialized = 1;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  [(UIAction *)p_searchMenu->find setState:self->_mode == 0];
  [(UIAction *)p_searchMenu->replace setState:self->_mode == 1];
  [(UIAction *)p_searchMenu->matchCase setState:self->_matchCase];
  [(UIAction *)p_searchMenu->wholeWords setState:self->_wholeWords];
  if ([(_UIFindNavigatorView *)self _replacementEnabled]
    && [(_UIFindNavigatorViewLayout *)self->_layout showsReplaceInOptionsMenu])
  {
    double v17 = p_searchMenu->replace;
    v32[0] = p_searchMenu->find;
    v32[1] = v17;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    v19 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:0 options:1 children:v18];
    v33[0] = v19;
    double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  }
  else
  {
    double v20 = (void *)MEMORY[0x1E4F1CBF0];
  }
  double v21 = p_searchMenu->wholeWords;
  v31[0] = p_searchMenu->matchCase;
  v31[1] = v21;
  double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  double v23 = [v20 arrayByAddingObjectsFromArray:v22];

  return v23;
}

- (void)_invalidateSearchSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorDelegate);
  [WeakRetained findNavigatorDidInvalidateSearchSession:self];
}

- (void)_handleSearchMenuItem:(id)a3
{
  id v10 = a3;
  objc_super v4 = [v10 identifier];

  if (v4 == @"find")
  {
    v8 = self;
    uint64_t v9 = 0;
LABEL_8:
    [(_UIFindNavigatorView *)v8 setMode:v9];
    goto LABEL_11;
  }
  uint64_t v5 = [v10 identifier];

  if (v5 == @"replace")
  {
    v8 = self;
    uint64_t v9 = 1;
    goto LABEL_8;
  }
  uint64_t v6 = [v10 identifier];

  if (v6 == @"matchCase")
  {
    [(_UIFindNavigatorView *)self setMatchCase:[(_UIFindNavigatorView *)self matchCase] ^ 1];
  }
  else
  {
    uint64_t v7 = [v10 identifier];

    if (v7 != @"wholeWords") {
      goto LABEL_11;
    }
    [(_UIFindNavigatorView *)self setWholeWords:[(_UIFindNavigatorView *)self wholeWords] ^ 1];
  }
  [(_UIFindNavigatorView *)self _invalidateSearchSession];
LABEL_11:
}

- (CGSize)intrinsicContentSize
{
  [(_UIFindNavigatorViewLayout *)self->_layout preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setVisibleSeparatorEdges:(unint64_t)a3
{
  char v3 = a3;
  self->_visibleSeparatorEdges = a3;
  p_separatorViews = &self->_separatorViews;
  [(UIView *)self->_separatorViews.left setHidden:(a3 & 2) == 0];
  [(UIView *)p_separatorViews->right setHidden:(v3 & 8) == 0];
  bottom = p_separatorViews->bottom;
  [(UIView *)bottom setHidden:(v3 & 4) == 0];
}

- (void)setUsesOpaqueBackground:(BOOL)a3
{
  self->_usesOpaqueBackground = a3;
  [(_UIFindNavigatorView *)self _preferredBackgroundColorChanged];
}

- (BOOL)becomeFirstResponder
{
  BOOL v3 = [(UIView *)self->_searchTextField isFirstResponder];
  BOOL v4 = [(UISearchTextField *)self->_searchTextField becomeFirstResponder];
  BOOL v5 = v4;
  if (!v3 && v4)
  {
    uint64_t v6 = [(_UIFindNavigatorSearchTextField *)self->_searchTextField text];
    uint64_t v7 = [v6 length];

    if (v7) {
      [(UITextField *)self->_searchTextField selectAll];
    }
  }
  return v5;
}

- (BOOL)resignFirstResponder
{
  uint64_t v3 = 760;
  if ([(UIView *)self->_searchTextField isFirstResponder]
    || (uint64_t v3 = 768, [(UIView *)self->_replaceTextField isFirstResponder]))
  {
    BOOL v4 = *(Class *)((char *)&self->super.super.super.super.isa + v3);
    return [v4 resignFirstResponder];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIFindNavigatorView;
    return [(UIResponder *)&v6 resignFirstResponder];
  }
}

- (BOOL)_canResignIfContainsFirstResponder
{
  return 0;
}

- (id)_linearFocusMovementSequences
{
  v8[1] = *MEMORY[0x1E4F143B8];
  replaceTextField = self->_replaceTextField;
  v7[0] = self->_searchTextField;
  v7[1] = replaceTextField;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  BOOL v4 = +[_UIFocusLinearMovementSequence sequenceWithItems:v3 loops:1];
  v8[0] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v5;
}

- (void)find:(id)a3
{
  if (![(UIView *)self->_searchTextField isFirstResponder]) {
    [(UISearchTextField *)self->_searchTextField becomeFirstResponder];
  }
  searchTextField = self->_searchTextField;
  [(UITextField *)searchTextField selectAll];
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)_UIFindNavigatorView;
  [(UIView *)&v33 layoutSubviews];
  if ([(_UIFindNavigatorView *)self visibleSeparatorEdges])
  {
    uint64_t v3 = [(UIView *)self traitCollection];
    [v3 displayScale];
    double v5 = 1.0 / v4;

    [(UIView *)self bounds];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    void v32[2] = __38___UIFindNavigatorView_layoutSubviews__block_invoke;
    v32[3] = &__block_descriptor_48_e19_v24__0__UIView_8d16l;
    *(double *)&v32[4] = v5;
    v32[5] = v6;
    uint64_t v7 = (void (**)(void *, UIView *, double))_Block_copy(v32);
    v7[2](v7, self->_separatorViews.left, 0.0);
    right = self->_separatorViews.right;
    [(UIView *)self bounds];
    v7[2](v7, right, v9 - v5);
    [(UIView *)self bounds];
    double v11 = v10 - v5;
    [(UIView *)self bounds];
    -[UIView setFrame:](self->_separatorViews.bottom, "setFrame:", 0.0, v11);
  }
  [(UIView *)self safeAreaInsets];
  double v13 = v12;
  [(UIView *)self safeAreaInsets];
  double v15 = v13 + v14;
  [(UIView *)self bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  [(_UIFindNavigatorViewLayout *)self->_layout preferredHorizontalPadding];
  CGFloat v25 = v15 + v24;
  [(_UIFindNavigatorViewLayout *)self->_layout preferredVerticalPadding];
  CGFloat v27 = v26;
  v34.origin.double x = v17;
  v34.origin.double y = v19;
  v34.size.double width = v21;
  v34.size.double height = v23;
  CGRect v35 = CGRectInset(v34, v25, v27);
  double x = v35.origin.x;
  double y = v35.origin.y;
  double width = v35.size.width;
  double height = v35.size.height;
  if (!CGRectIsNull(v35)) {
    -[UIView setFrame:](self->_layout, "setFrame:", x, y, width, height);
  }
}

- (_UIFindNavigatorViewDelegate)findNavigatorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorDelegate);
  return (_UIFindNavigatorViewDelegate *)WeakRetained;
}

- (void)setFindNavigatorDelegate:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)matchCase
{
  return self->_matchCase;
}

- (void)setMatchCase:(BOOL)a3
{
  self->_matchCase = a3;
}

- (BOOL)wholeWords
{
  return self->_wholeWords;
}

- (void)setWholeWords:(BOOL)a3
{
  self->_wholeWords = a3;
}

- (BOOL)usesOpaqueBackground
{
  return self->_usesOpaqueBackground;
}

- (unint64_t)visibleSeparatorEdges
{
  return self->_visibleSeparatorEdges;
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (UIButton)settingsButton
{
  return self->_settingsButton;
}

- (UILabel)resultCountLabel
{
  return self->_resultCountLabel;
}

- (BOOL)replaceButtonEnabled
{
  return self->_replaceButtonEnabled;
}

- (BOOL)intrinsicHeightDerivedFromAssistantBar
{
  return self->_intrinsicHeightDerivedFromAssistantBar;
}

- (void)setIntrinsicHeightDerivedFromAssistantBar:(BOOL)a3
{
  self->_intrinsicHeightDerivedFromAssistantBar = a3;
}

- (int64_t)assistantBarStyle
{
  return self->_assistantBarStyle;
}

- (_UIFindNavigatorSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (_UIFindNavigatorSearchTextField)replaceTextField
{
  return self->_replaceTextField;
}

- (UIButton)nextResultButton
{
  return self->_nextResultButton;
}

- (UIButton)previousResultButton
{
  return self->_previousResultButton;
}

- (UIButton)replaceButton
{
  return self->_replaceButton;
}

- (void).cxx_destruct
{
  double v2 = self;
  objc_storeStrong((id *)&self->_replaceButton, 0);
  objc_storeStrong((id *)&v2->_previousResultButton, 0);
  objc_storeStrong((id *)&v2->_nextResultButton, 0);
  objc_storeStrong((id *)&v2->_replaceTextField, 0);
  objc_storeStrong((id *)&v2->_searchTextField, 0);
  objc_storeStrong((id *)&v2->_resultCountLabel, 0);
  objc_storeStrong((id *)&v2->_settingsButton, 0);
  objc_storeStrong((id *)&v2->_doneButton, 0);
  objc_destroyWeak((id *)&v2->_findNavigatorDelegate);
  objc_storeStrong((id *)&v2->_layout, 0);

  double v2 = (_UIFindNavigatorView *)((char *)v2 + 624);
  layeringSceneIdentitdouble y = v2->super.super.super.__layeringSceneIdentity;
}

@end