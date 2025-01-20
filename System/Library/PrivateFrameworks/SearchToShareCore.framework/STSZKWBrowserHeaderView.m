@interface STSZKWBrowserHeaderView
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4;
- (CGRect)contentRect;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)bottomSuggestions;
- (NSArray)topSuggestions;
- (STSKeyCommandDelegate)keyCommandDelegate;
- (STSZKWBrowserHeaderView)init;
- (STSZKWBrowserHeaderViewDelegate)delegate;
- (UIEdgeInsets)contentInset;
- (double)_searchBarWidthFraction;
- (id)_buttonWithTitle:(id)a3;
- (id)keyCommands;
- (id)searchQuery;
- (unint64_t)_suggestionIndexForButton:(id)a3;
- (void)_cancelButtonPressed:(id)a3;
- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)_searchButtonPressed:(id)a3;
- (void)_suggestionButtonPressed:(id)a3;
- (void)_updateTopStackView:(BOOL)a3 andBottomStackView:(BOOL)a4;
- (void)clear;
- (void)downArrowPressed;
- (void)enableSearchButton;
- (void)escapeKeyPressed;
- (void)layoutSubviews;
- (void)returnKeyPressed;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarClicked;
- (void)setBottomSuggestions:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyCommandDelegate:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setTopSuggestions:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)upArrowPressed;
@end

@implementation STSZKWBrowserHeaderView

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  id v4 = a3;
  BOOL writingInSearchBar = self->_writingInSearchBar;
  if (!self->_writingInSearchBar
    && [(STSSearchBar *)self->_searchBar isUserInteractionEnabled])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__STSZKWBrowserHeaderView_searchBarShouldBeginEditing___block_invoke;
    block[3] = &unk_264A053F0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }

  return writingInSearchBar;
}

uint64_t __55__STSZKWBrowserHeaderView_searchBarShouldBeginEditing___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 416) setUserInteractionEnabled:0];
  v2 = *(void **)(a1 + 32);

  return [v2 _searchButtonPressed:0];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
}

- (STSZKWBrowserHeaderView)init
{
  v41[1] = *MEMORY[0x263EF8340];
  v39.receiver = self;
  v39.super_class = (Class)STSZKWBrowserHeaderView;
  v2 = [(STSZKWBrowserHeaderView *)&v39 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x263F825C8], "sts_defaultBackgroundColor");
    [(STSZKWBrowserHeaderView *)v2 setBackgroundColor:v3];

    [(STSZKWBrowserHeaderView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    topZKWButtons = v2->_topZKWButtons;
    v2->_topZKWButtons = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x263EFF980] array];
    bottomZKWButtons = v2->_bottomZKWButtons;
    v2->_bottomZKWButtons = (NSMutableArray *)v6;

    v8 = objc_alloc_init(STSSearchBar);
    searchBar = v2->_searchBar;
    v2->_searchBar = v8;

    [(STSSearchBar *)v2->_searchBar setDelegate:v2];
    [(STSSearchBar *)v2->_searchBar setStsDelegate:v2];
    v10 = [(STSSearchBar *)v2->_searchBar searchTextField];
    [v10 setDelegate:v2];

    [(STSSearchBar *)v2->_searchBar setStsDelegate:v2];
    [(STSSearchBar *)v2->_searchBar setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STSSearchBar *)v2->_searchBar _setDisableDictationButton:1];
    v11 = [(STSSearchBar *)v2->_searchBar searchField];
    [(STSSearchBar *)v2->_searchBar setSearchBarStyle:2];
    v12 = v2->_searchBar;
    v13 = [MEMORY[0x263F825C8] systemPinkColor];
    [(STSSearchBar *)v12 setTintColor:v13];

    v14 = [(STSSearchBar *)v2->_searchBar searchTextField];
    v15 = objc_msgSend(MEMORY[0x263F825C8], "sts_headerZKWSearchButtonAndSearchTextFieldBackgroundColor");
    [v14 setBackgroundColor:v15];

    v16 = STSLocalizedString(@"SEARCHBAR_BUTTON_TITLE");
    id v17 = objc_alloc(MEMORY[0x263F089B8]);
    uint64_t v40 = *MEMORY[0x263F81500];
    v18 = [MEMORY[0x263F825C8] lightGrayColor];
    v41[0] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    v20 = (void *)[v17 initWithString:v16 attributes:v19];

    v38 = v11;
    [v11 setAttributedPlaceholder:v20];
    [(STSZKWBrowserHeaderView *)v2 addSubview:v2->_searchBar];
    uint64_t v21 = [MEMORY[0x263EFF980] array];
    searchBarConstraints = v2->_searchBarConstraints;
    v2->_searchBarConstraints = (NSMutableArray *)v21;

    v23 = [(STSZKWBrowserHeaderView *)v2 traitCollection];
    uint64_t v24 = [v23 horizontalSizeClass];

    v25 = [(STSZKWBrowserHeaderView *)v2 readableContentGuide];
    v26 = v2->_searchBarConstraints;
    v27 = [(STSSearchBar *)v2->_searchBar leadingAnchor];
    if (v24 == 2) {
      v28 = v25;
    }
    else {
      v28 = v2;
    }
    v29 = [(STSZKWBrowserHeaderView *)v28 leadingAnchor];
    v30 = [v27 constraintEqualToAnchor:v29];
    [(NSMutableArray *)v26 addObject:v30];

    v31 = v2->_searchBarConstraints;
    v32 = [(STSSearchBar *)v2->_searchBar trailingAnchor];
    if (v24 == 2) {
      v33 = v25;
    }
    else {
      v33 = v2;
    }
    v34 = [(STSZKWBrowserHeaderView *)v33 trailingAnchor];
    v35 = [v32 constraintEqualToAnchor:v34];
    [(NSMutableArray *)v31 addObject:v35];

    [MEMORY[0x263F08938] activateConstraints:v2->_searchBarConstraints];
    id v36 = objc_alloc_init(MEMORY[0x263F14BA0]);
    [v36 setDelegate:v2];
    [v36 setElementSource:v2];
    [(STSZKWBrowserHeaderView *)v2 addInteraction:v36];

    [(STSZKWBrowserHeaderView *)v2 _updateTopStackView:1 andBottomStackView:1];
  }
  return v2;
}

- (void)clear
{
  id v2 = [(STSSearchBar *)self->_searchBar searchTextField];
  [v2 setText:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4 = [(STSZKWBrowserHeaderView *)self traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  v20 = [(STSZKWBrowserHeaderView *)self readableContentGuide];
  searchBarConstraints = self->_searchBarConstraints;
  v7 = [(STSSearchBar *)self->_searchBar leadingAnchor];
  if (v5 == 2) {
    v8 = v20;
  }
  else {
    v8 = self;
  }
  v9 = [(STSZKWBrowserHeaderView *)v8 leadingAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  [(NSMutableArray *)searchBarConstraints addObject:v10];

  v11 = self->_searchBarConstraints;
  v12 = [(STSSearchBar *)self->_searchBar trailingAnchor];
  if (v5 == 2) {
    v13 = v20;
  }
  else {
    v13 = self;
  }
  v14 = [(STSZKWBrowserHeaderView *)v13 trailingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [(NSMutableArray *)v11 addObject:v15];

  v16 = self->_searchBarConstraints;
  id v17 = [(STSSearchBar *)self->_searchBar topAnchor];
  v18 = [(STSZKWBrowserHeaderView *)self topAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [(NSMutableArray *)v16 addObject:v19];

  [MEMORY[0x263F08938] activateConstraints:self->_searchBarConstraints];
}

- (void)layoutSubviews
{
  [(STSZKWBrowserHeaderView *)self bounds];
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_contentInset.right);
  double v12 = v11 - (top + self->_contentInset.bottom);
  uint64_t v13 = [(NSMutableArray *)self->_bottomZKWButtons count];
  if (v13) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  if (v13) {
    double v15 = 6.0;
  }
  else {
    double v15 = 0.0;
  }
  v45.origin.x = v6;
  v45.origin.y = v8;
  v45.size.width = v10;
  v45.size.height = v12;
  CGFloat v16 = (CGRectGetHeight(v45) - v15) / (double)v14;
  -[STSSearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", v10, v12);
  CGFloat v18 = v17;
  uint64_t v40 = 0;
  v41 = (CGRect *)&v40;
  uint64_t v42 = 0x4010000000;
  v43 = &unk_22F411A05;
  memset(&v44, 0, sizeof(v44));
  uint64_t v35 = 0;
  id v36 = (CGRect *)&v35;
  uint64_t v37 = 0x4010000000;
  v38 = &unk_22F411A05;
  memset(&v39, 0, sizeof(v39));
  v46.origin.x = v6;
  v46.origin.y = v8;
  v46.size.width = v10;
  v46.size.height = v12;
  CGRectDivide(v46, &v44, &v39, v15 + v16, CGRectMinYEdge);
  v19 = v41;
  v41[1].size.height = v18;
  v36[1].size.height = v18;
  CGSize size = v19[1].size;
  slice.origin = v19[1].origin;
  slice.CGSize size = size;
  if ([(NSMutableArray *)self->_topZKWButtons count])
  {
    double Width = CGRectGetWidth(slice);
    [(STSZKWBrowserHeaderView *)self _searchBarWidthFraction];
    CGRectDivide(v41[1], &slice, v41 + 1, Width * v22 + -3.0 + 6.0, CGRectMinXEdge);
    slice.size.width = slice.size.width + -6.0;
    UIFloorToViewScale();
    slice.size.width = v23;
    uint64_t v24 = [(NSMutableArray *)self->_topZKWButtons count];
    double v25 = CGRectGetWidth(v41[1]);
    double v26 = (v25 + (double)(unint64_t)(v24 - 1) * -6.0)
        / (double)(unint64_t)[(NSMutableArray *)self->_topZKWButtons count];
    topZKWButtons = self->_topZKWButtons;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __41__STSZKWBrowserHeaderView_layoutSubviews__block_invoke;
    v33[3] = &unk_264A05C28;
    v33[4] = self;
    v33[5] = &v40;
    *(double *)&v33[6] = v26;
    [(NSMutableArray *)topZKWButtons enumerateObjectsUsingBlock:v33];
  }
  if ([(NSMutableArray *)self->_bottomZKWButtons count])
  {
    uint64_t v28 = [(NSMutableArray *)self->_bottomZKWButtons count];
    double v29 = CGRectGetWidth(v36[1]);
    double v30 = (v29 + (double)(v28 - 1) * -6.0)
        / (double)(unint64_t)[(NSMutableArray *)self->_bottomZKWButtons count];
    bottomZKWButtons = self->_bottomZKWButtons;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __41__STSZKWBrowserHeaderView_layoutSubviews__block_invoke_2;
    v32[3] = &unk_264A05C28;
    v32[4] = self;
    v32[5] = &v35;
    *(double *)&v32[6] = v30;
    [(NSMutableArray *)bottomZKWButtons enumerateObjectsUsingBlock:v32];
  }
  -[STSSearchBar setFrame:](self->_searchBar, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v40, 8);
}

void __41__STSZKWBrowserHeaderView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5 = *(void **)(*(void *)(a1 + 32) + 432);
  id v6 = a2;
  if ([v5 count] - 1 <= a3) {
    double v7 = 0.0;
  }
  else {
    double v7 = 6.0;
  }
  CGSize v8 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v15.origin = (CGPoint)*MEMORY[0x263F001A8];
  v15.CGSize size = v8;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void *)(v9 + 32);
  v8.width = *(CGFloat *)(v9 + 40);
  v9 += 32;
  uint64_t v11 = *(void *)(v9 + 16);
  uint64_t v12 = *(void *)(v9 + 24);
  CGRectDivide(*(CGRect *)((char *)&v8 - 8), &v15, (CGRect *)v9, v7 + *(double *)(a1 + 48), CGRectMinXEdge);
  UIFloorToViewScale();
  v15.origin.x = v13;
  UIFloorToViewScale();
  v15.size.width = v14;
  objc_msgSend(v6, "setFrame:", *(_OWORD *)&v15.origin, __PAIR128__(*(unint64_t *)&v15.size.height, *(unint64_t *)&v14));
}

void __41__STSZKWBrowserHeaderView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  double v5 = *(void **)(*(void *)(a1 + 32) + 440);
  id v6 = a2;
  if ([v5 count] - 1 <= a3) {
    double v7 = 0.0;
  }
  else {
    double v7 = 6.0;
  }
  CGSize v8 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v15.origin = (CGPoint)*MEMORY[0x263F001A8];
  v15.CGSize size = v8;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void *)(v9 + 32);
  v8.width = *(CGFloat *)(v9 + 40);
  v9 += 32;
  uint64_t v11 = *(void *)(v9 + 16);
  uint64_t v12 = *(void *)(v9 + 24);
  CGRectDivide(*(CGRect *)((char *)&v8 - 8), &v15, (CGRect *)v9, v7 + *(double *)(a1 + 48), CGRectMinXEdge);
  UIFloorToViewScale();
  v15.origin.x = v13;
  UIFloorToViewScale();
  v15.size.width = v14;
  objc_msgSend(v6, "setFrame:", *(_OWORD *)&v15.origin, __PAIR128__(*(unint64_t *)&v15.size.height, *(unint64_t *)&v14));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[STSSearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", a3.width, a3.height);
  double v6 = v5;
  uint64_t v7 = [(NSMutableArray *)self->_bottomZKWButtons count];
  double v8 = 0.0;
  if (v7) {
    double v9 = v6;
  }
  else {
    double v9 = 0.0;
  }
  if (v9 > 0.0 && v6 > 0.0) {
    double v8 = 6.0;
  }
  double v11 = self->_contentInset.bottom + v9 + v6 + self->_contentInset.top + v8;
  double v12 = width;
  result.height = v11;
  result.CGFloat width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(STSZKWBrowserHeaderView *)self frame];

  -[STSZKWBrowserHeaderView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.CGFloat width = v5;
  return result;
}

- (void)_searchButtonPressed:(id)a3
{
  if (!self->_writingInSearchBar)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained headerViewDidSelectSearchButton:self];
  }
}

- (void)_cancelButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained headerDidSelectCancelButton:self];
}

- (unint64_t)_suggestionIndexForButton:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSMutableArray *)self->_topZKWButtons indexOfObject:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v5 = [(NSMutableArray *)self->_bottomZKWButtons indexOfObject:v4];
  }

  return v5;
}

- (void)_suggestionButtonPressed:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  unint64_t v6 = [(STSZKWBrowserHeaderView *)self _suggestionIndexForButton:v5];

  [WeakRetained headerView:self didSelectSuggestionButtonAtIndex:v6];
}

- (CGRect)contentRect
{
  id v2 = [(STSSearchBar *)self->_searchBar searchField];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.CGFloat width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setTopSuggestions:(id)a3
{
  if (self->_topSuggestions != a3)
  {
    double v4 = (NSArray *)[a3 copy];
    topSuggestions = self->_topSuggestions;
    self->_topSuggestions = v4;

    [(STSZKWBrowserHeaderView *)self _updateTopStackView:1 andBottomStackView:0];
  }
}

- (void)setBottomSuggestions:(id)a3
{
  if (self->_bottomSuggestions != a3)
  {
    double v4 = (NSArray *)[a3 copy];
    bottomSuggestions = self->_bottomSuggestions;
    self->_bottomSuggestions = v4;

    [(STSZKWBrowserHeaderView *)self _updateTopStackView:0 andBottomStackView:1];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(STSZKWBrowserHeaderView *)self setNeedsLayout];
  }
}

- (void)searchBarClicked
{
}

- (id)searchQuery
{
  return (id)[(STSSearchBar *)self->_searchBar text];
}

- (void)setSearchQuery:(id)a3
{
}

- (void)_updateTopStackView:(BOOL)a3 andBottomStackView:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__STSZKWBrowserHeaderView__updateTopStackView_andBottomStackView___block_invoke;
  v9[3] = &unk_264A05C70;
  v9[4] = self;
  uint64_t v7 = MEMORY[0x230FB7F40](v9, a2);
  double v8 = (void (**)(void, void, void))v7;
  if (v5) {
    (*(void (**)(uint64_t, NSMutableArray *, NSArray *))(v7 + 16))(v7, self->_topZKWButtons, self->_topSuggestions);
  }
  if (v4) {
    ((void (**)(void, NSMutableArray *, NSArray *))v8)[2](v8, self->_bottomZKWButtons, self->_bottomSuggestions);
  }
  [(STSZKWBrowserHeaderView *)self setNeedsLayout];
  [(STSZKWBrowserHeaderView *)self layoutIfNeeded];
}

void __66__STSZKWBrowserHeaderView__updateTopStackView_andBottomStackView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_0];
  [v5 removeAllObjects];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__STSZKWBrowserHeaderView__updateTopStackView_andBottomStackView___block_invoke_3;
  v8[3] = &unk_264A05440;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __66__STSZKWBrowserHeaderView__updateTopStackView_andBottomStackView___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

void __66__STSZKWBrowserHeaderView__updateTopStackView_andBottomStackView___block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  BOOL v4 = [a2 suggestion];
  id v5 = [v3 _buttonWithTitle:v4];

  [v5 addTarget:*(void *)(a1 + 32) action:sel__suggestionButtonPressed_ forControlEvents:64];
  [*(id *)(a1 + 32) addSubview:v5];
  [*(id *)(a1 + 40) addObject:v5];
}

- (id)_buttonWithTitle:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F824E8];
  id v5 = a3;
  id v6 = [v4 buttonWithType:1];
  if ([(STSSearchBar *)self->_searchBar effectiveUserInterfaceLayoutDirection]) {
    double v7 = 0.0;
  }
  else {
    double v7 = 8.0;
  }
  objc_msgSend(v6, "setContentEdgeInsets:", 9.0, v7);
  [v6 setTitle:v5 forState:0];

  double v8 = [v6 titleLabel];
  id v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v8 setFont:v9];

  double v10 = [v6 layer];
  id v11 = [MEMORY[0x263F825C8] whiteColor];
  objc_msgSend(v10, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  double v12 = [v6 layer];
  [v12 setCornerRadius:6.0];

  return v6;
}

- (double)_searchBarWidthFraction
{
  NSUInteger v2 = [(NSArray *)self->_topSuggestions count];
  double result = 0.5;
  if (v2 == 1) {
    return 0.75;
  }
  return result;
}

- (void)enableSearchButton
{
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  [(STSSearchBar *)self->_searchBar frame];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  self->_BOOL writingInSearchBar = 1;
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  id v6 = [(STSSearchBar *)self->_searchBar text];
  self->_BOOL writingInSearchBar = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained headerView:self didSearchFor:v6];
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  [(STSSearchBar *)self->_searchBar frame];
  result.size.height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v10 = (void (**)(id, void *))a6;
  [(STSSearchBar *)self->_searchBar frame];
  v12.CGFloat x = x;
  v12.CGFloat y = y;
  if (CGRectContainsPoint(v13, v12))
  {
    self->_BOOL writingInSearchBar = 1;
    id v9 = [(STSSearchBar *)self->_searchBar searchTextField];
    v10[2](v10, v9);
  }
  else
  {
    v10[2](v10, 0);
  }
}

- (id)keyCommands
{
  void v9[5] = *MEMORY[0x263EF8340];
  NSUInteger v2 = [MEMORY[0x263F82890] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_returnKeyPressed];
  double v3 = objc_msgSend(MEMORY[0x263F82890], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x263F83750], 0, sel_downArrowPressed, v2);
  v9[1] = v3;
  double v4 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83770] modifierFlags:0 action:sel_upArrowPressed];
  v9[2] = v4;
  double v5 = [MEMORY[0x263F82890] keyCommandWithInput:@"\t" modifierFlags:0 action:sel_downArrowPressed];
  v9[3] = v5;
  double v6 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83758] modifierFlags:0 action:sel_escapeKeyPressed];
  v9[4] = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:5];

  return v7;
}

- (void)returnKeyPressed
{
  if ([(STSSearchBar *)self->_searchBar isFirstResponder])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyCommandDelegate);
    double v3 = [(STSSearchBar *)self->_searchBar searchField];
    double v4 = [v3 text];
    [WeakRetained didPressReturnKey:v4];
  }
}

- (void)downArrowPressed
{
  if ([(STSSearchBar *)self->_searchBar isFirstResponder])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyCommandDelegate);
    [WeakRetained didPressDownKey];
  }
}

- (void)upArrowPressed
{
  if ([(STSSearchBar *)self->_searchBar isFirstResponder])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyCommandDelegate);
    [WeakRetained didPressUpKey];
  }
}

- (void)escapeKeyPressed
{
  if ([(STSSearchBar *)self->_searchBar isFirstResponder])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyCommandDelegate);
    [WeakRetained didRequestClose];
  }
}

- (STSZKWBrowserHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STSZKWBrowserHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STSKeyCommandDelegate)keyCommandDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyCommandDelegate);

  return (STSKeyCommandDelegate *)WeakRetained;
}

- (void)setKeyCommandDelegate:(id)a3
{
}

- (NSArray)topSuggestions
{
  return self->_topSuggestions;
}

- (NSArray)bottomSuggestions
{
  return self->_bottomSuggestions;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSuggestions, 0);
  objc_storeStrong((id *)&self->_topSuggestions, 0);
  objc_destroyWeak((id *)&self->_keyCommandDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchBarConstraints, 0);
  objc_storeStrong((id *)&self->_bottomZKWButtons, 0);
  objc_storeStrong((id *)&self->_topZKWButtons, 0);
  objc_storeStrong((id *)&self->_feedbackButton, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);

  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end