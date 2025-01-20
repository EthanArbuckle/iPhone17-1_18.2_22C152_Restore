@interface STSSuggestionViewController
- (STSSearchModel)searchModel;
- (STSSuggestionViewController)init;
- (STSSuggestionViewControllerDelegate)selectionDelegate;
- (UIEdgeInsets)contentInset;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_hideNoticeOverlay;
- (void)_updateFooterOrigin;
- (void)_updateFooterOriginForBoundsHeight:(double)a3;
- (void)clearSuggestions;
- (void)searchModelUpdatedQuerySuggestions:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setSearchModel:(id)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)suggestionViewDidTapLogo:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateContentOffset:(double)a3;
- (void)updateQuerySuggestions:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation STSSuggestionViewController

- (STSSuggestionViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)STSSuggestionViewController;
  v2 = [(STSSuggestionViewController *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(STSSuggestionView);
    [(STSSuggestionView *)v3 setDelegate:v2];
    v4 = [(STSSuggestionView *)v3 tableView];
    [v4 setDataSource:v2];

    v5 = [(STSSuggestionView *)v3 tableView];
    [v5 setDelegate:v2];

    v6 = [(STSSuggestionView *)v3 tableView];
    [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"SuggestionCell"];

    v7 = [(STSSuggestionView *)v3 tableView];
    [v7 setSeparatorStyle:1];

    [(STSSuggestionViewController *)v2 setView:v3];
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v5 = [(STSSuggestionViewController *)self view];
  v3 = +[STSImageCache sharedCache];
  v4 = [v3 searchProviderImage];
  [v5 updateFooterImage:v4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(STSSuggestionViewController *)self _updateFooterOriginForBoundsHeight:height];
  [v7 animateAlongsideTransition:0 completion:0];
  v8.receiver = self;
  v8.super_class = (Class)STSSuggestionViewController;
  -[STSSuggestionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (UIEdgeInsets)contentInset
{
  v2 = [(STSSuggestionViewController *)self view];
  [v2 contentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v8 = [(STSSuggestionViewController *)self view];
  objc_msgSend(v8, "setContentInset:", top, left, bottom, right);

  [MEMORY[0x263F82E00] setAnimationsEnabled:0];
  [(STSSuggestionViewController *)self _updateFooterOrigin];
  double v9 = (void *)MEMORY[0x263F82E00];

  [v9 setAnimationsEnabled:1];
}

- (void)updateContentOffset:(double)a3
{
  id v9 = [(STSSuggestionViewController *)self view];
  double v5 = [v9 tableView];
  double v6 = [(STSSuggestionViewController *)self view];
  double v7 = [v6 tableView];
  [v7 contentInset];
  objc_msgSend(v5, "setContentOffset:", -v8, a3);
}

- (void)clearSuggestions
{
  [(STSSearchModel *)self->_searchModel removeQuerySuggestions];
  double v3 = [(STSSuggestionViewController *)self view];
  double v4 = [v3 tableView];
  [v4 reloadData];

  [(STSSuggestionViewController *)self _updateFooterOrigin];
}

- (void)updateQuerySuggestions:(id)a3
{
  [(STSSearchModel *)self->_searchModel setQuerySuggestions:a3];
  double v4 = [(STSSuggestionViewController *)self view];
  double v5 = [v4 tableView];
  [v5 reloadData];

  [(STSSuggestionViewController *)self _updateFooterOrigin];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(STSSearchModel *)self->_searchModel querySuggestions];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"SuggestionCell" forIndexPath:v6];
  double v8 = [MEMORY[0x263F825C8] clearColor];
  [v7 setBackgroundColor:v8];

  id v9 = [v7 textLabel];
  double v10 = [(STSSearchModel *)self->_searchModel querySuggestions];
  uint64_t v11 = [v6 row];

  double v12 = [v10 objectAtIndex:v11];
  double v13 = [v12 suggestion];
  [v9 setText:v13];

  double v14 = [v7 textLabel];
  v15 = [MEMORY[0x263F825C8] systemPinkColor];
  [v14 setTextColor:v15];

  v16 = [v7 textLabel];
  v17 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v16 setFont:v17];

  v18 = _UIImageGetSearchGlass();
  v19 = (void *)MEMORY[0x263F827E8];
  [v18 size];
  double v21 = v20;
  double v23 = v22;
  v24 = objc_msgSend(MEMORY[0x263F825C8], "sts_magnifyingGlassGrayTintColor");
  v25 = _UIImageGetSearchGlass();
  v26 = objc_msgSend(v19, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v24, 0, v25, 0, v21, v23);

  v27 = [v7 imageView];
  [v27 setImage:v26];

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x263F839B8];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v7 = [(STSSuggestionViewController *)self selectionDelegate];
  uint64_t v6 = [v5 row];

  [v7 suggestionViewController:self didSelectSuggestionAtIndex:v6];
}

- (void)searchModelUpdatedQuerySuggestions:(id)a3
{
  double v4 = [(STSSuggestionViewController *)self view];
  id v5 = [v4 tableView];
  [v5 reloadData];

  [(STSSuggestionViewController *)self _updateFooterOrigin];
}

- (void)suggestionViewDidTapLogo:(id)a3
{
  id v4 = [(STSSuggestionViewController *)self selectionDelegate];
  [v4 suggestionViewControllerDidTapLogo:self];
}

- (void)_hideNoticeOverlay
{
  id v2 = [(STSSuggestionViewController *)self view];
  [v2 setOverlayView:0 animated:1];
}

- (void)_updateFooterOrigin
{
  id v3 = [(STSSuggestionViewController *)self view];
  [v3 bounds];
  [(STSSuggestionViewController *)self _updateFooterOriginForBoundsHeight:CGRectGetHeight(v5)];
}

- (void)_updateFooterOriginForBoundsHeight:(double)a3
{
  CGRect v5 = [(STSSuggestionViewController *)self view];
  uint64_t v6 = [v5 readableContentGuide];
  [v6 layoutFrame];
  double MinX = CGRectGetMinX(v55);
  double v8 = [(STSSuggestionViewController *)self view];
  [v8 footerSize];
  double v9 = 20.0;
  double v11 = v10 + 20.0 + 10.0;

  if (MinX >= v11)
  {
    [(STSSuggestionViewController *)self contentInset];
    double v42 = a3 - v41;
    v43 = [(STSSuggestionViewController *)self view];
    [v43 footerSize];
    double v45 = v42 - v44;

    BOOL v20 = 1;
  }
  else
  {
    double v12 = [(STSSearchModel *)self->_searchModel querySuggestions];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      double v14 = (void *)MEMORY[0x263F088C8];
      v15 = [(STSSearchModel *)self->_searchModel querySuggestions];
      v16 = objc_msgSend(v14, "indexPathForRow:inSection:", objc_msgSend(v15, "count") - 1, 0);

      v17 = [(STSSuggestionViewController *)self view];
      v18 = [v17 tableView];
      v19 = [v18 cellForRowAtIndexPath:v16];

      BOOL v20 = v19 != 0;
      double MaxY = a3;
      if (v19)
      {
        double v22 = [(STSSuggestionViewController *)self view];
        [v19 frame];
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;
        v31 = [(STSSuggestionViewController *)self view];
        v32 = [v31 tableView];
        objc_msgSend(v22, "convertRect:fromView:", v32, v24, v26, v28, v30);
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        CGFloat v40 = v39;

        v56.origin.x = v34;
        v56.origin.y = v36;
        v56.size.double width = v38;
        v56.size.double height = v40;
        double MaxY = CGRectGetMaxY(v56);
      }
    }
    else
    {
      BOOL v20 = 0;
      double MaxY = a3;
    }
    v46 = [(STSSuggestionViewController *)self view];
    v47 = [v46 readableContentGuide];
    [v47 layoutFrame];
    double v9 = CGRectGetMinX(v57);

    [(STSSuggestionViewController *)self contentInset];
    double v49 = a3 - v48;
    v50 = [(STSSuggestionViewController *)self view];
    [v50 footerSize];
    double v45 = v49 - v51;

    if (MaxY >= v45) {
      double v45 = MaxY;
    }
  }
  v52 = [(STSSuggestionViewController *)self view];
  objc_msgSend(v52, "setFooterOffset:", v9, v45);

  id v53 = [(STSSuggestionViewController *)self view];
  [v53 setShowingFooter:v20];
}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (void)setSearchModel:(id)a3
{
}

- (STSSuggestionViewControllerDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (STSSuggestionViewControllerDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectionDelegate);

  objc_storeStrong((id *)&self->_searchModel, 0);
}

@end