@interface SKUISearchController
- (SKUISearchBar)searchBar;
- (void)_setSuffix:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUISearchController

- (void)_setSuffix:(id)a3
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_suffixLabel)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    suffixLabel = self->_suffixLabel;
    self->_suffixLabel = v5;

    [(UILabel *)self->_suffixLabel setAutoresizingMask:1];
    v7 = self->_suffixLabel;
    v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    [(UILabel *)v7 setTextColor:v8];

    v9 = self->_suffixLabel;
    v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [(UILabel *)v9 setFont:v10];

    v11 = self->_suffixLabel;
    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v11 setBackgroundColor:v12];

    [(UILabel *)self->_suffixLabel setHidden:[(SKUISearchController *)self isActive]];
    v13 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v13 userInterfaceIdiom] == 1)
    {
      v14 = [MEMORY[0x1E4FB1438] sharedApplication];
      v15 = [v14 keyWindow];
      [v15 bounds];
      if (v16 > SKUICompactThreshold())
      {
        [(SKUISearchController *)self delegate];
        v18 = id v17 = v4;
        v19 = [v18 searchControllerClientContext:self];
        char v20 = [v19 shouldForceTransientSearchControllerBahavior];

        id v4 = v17;
        if ((v20 & 1) == 0)
        {
          v21 = [(SKUISearchController *)self searchBar];
          v22 = [v21 searchField];
          [v22 addSubview:self->_suffixLabel];
LABEL_9:

          goto LABEL_10;
        }
LABEL_8:
        v21 = [(SKUISearchController *)self searchBar];
        v22 = [v21 searchField];
        v23 = [v22 _clearButton];
        [v23 addSubview:self->_suffixLabel];

        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
LABEL_10:
  [(UILabel *)self->_suffixLabel setText:v4];
  [(UILabel *)self->_suffixLabel sizeToFit];
  [(UILabel *)self->_suffixLabel frame];
  double v25 = v24;
  double v27 = v26;
  v28 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v28 userInterfaceIdiom] != 1)
  {
LABEL_15:

    goto LABEL_16;
  }
  v29 = [MEMORY[0x1E4FB1438] sharedApplication];
  v30 = [v29 keyWindow];
  [v30 bounds];
  if (v31 <= SKUICompactThreshold())
  {

    goto LABEL_15;
  }
  [(SKUISearchController *)self delegate];
  v33 = id v32 = v4;
  v34 = [v33 searchControllerClientContext:self];
  char v35 = [v34 shouldForceTransientSearchControllerBahavior];

  id v4 = v32;
  if ((v35 & 1) == 0)
  {
    v36 = [(UILabel *)self->_suffixLabel superview];
    [v36 frame];
    double v38 = v37 - v25 + -30.0;

    double v39 = 8.0;
    goto LABEL_17;
  }
LABEL_16:
  double v38 = -5.0 - v25;
  double v39 = 3.0;
LABEL_17:
  -[UILabel setFrame:](self->_suffixLabel, "setFrame:", v38, v39, v25, v27);
  v40 = [(SKUISearchController *)self searchBar];
  v59 = [v40 searchField];

  v41 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  paddingString = self->_paddingString;
  self->_paddingString = v41;

  v43 = v4;
  if ([v4 length])
  {
    unint64_t v44 = 0;
    uint64_t v45 = *MEMORY[0x1E4FB06F8];
    do
    {
      [(NSMutableString *)self->_paddingString appendString:@"_", v59];
      v46 = self->_paddingString;
      uint64_t v61 = v45;
      v47 = [v59 font];
      v62[0] = v47;
      v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
      [(NSMutableString *)v46 sizeWithAttributes:v48];
      double v50 = v49;

      if (v50 > v25) {
        break;
      }
      ++v44;
    }
    while (v44 < [v43 length]);
  }
  v51 = [(SKUISearchController *)self searchBar];
  v52 = [v51 searchField];
  v53 = [v52 text];
  char v54 = [v53 isNaturallyRTL];

  if ((v54 & 1) == 0)
  {
    v55 = [(SKUISearchController *)self searchBar];
    v56 = [v55 searchField];
    if ([(SKUISearchController *)self isActive]) {
      v57 = 0;
    }
    else {
      v57 = self->_paddingString;
    }
    v58 = [MEMORY[0x1E4FB1618] clearColor];
    [v56 _setSuffix:v57 withColor:v58];
  }
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SKUISearchController *)self searchBar];
  v6 = [v5 text];
  v15.receiver = self;
  v15.super_class = (Class)SKUISearchController;
  [(SKUISearchController *)&v15 setActive:v3];
  v7 = [v5 searchField];
  [v7 setText:v6];

  [v5 setShowsSearchResultsButton:0];
  [(UILabel *)self->_suffixLabel setHidden:v3];
  v8 = [v5 searchField];
  if ([(SKUISearchController *)self isActive]) {
    paddingString = 0;
  }
  else {
    paddingString = self->_paddingString;
  }
  v10 = [MEMORY[0x1E4FB1618] clearColor];
  [v8 _setSuffix:paddingString withColor:v10];

  if (!v3)
  {
    dispatch_time_t v11 = dispatch_time(0, 300000000);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__SKUISearchController_setActive___block_invoke;
    v12[3] = &unk_1E6421FF8;
    id v13 = v5;
    v14 = self;
    dispatch_after(v11, MEMORY[0x1E4F14428], v12);
  }
}

void __34__SKUISearchController_setActive___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) searchField];
  if ([*(id *)(a1 + 40) isActive]) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 1328);
  }
  BOOL v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 _setSuffix:v2 withColor:v3];
}

- (SKUISearchBar)searchBar
{
  searchBar = self->_searchBar;
  if (!searchBar)
  {
    id v4 = objc_alloc_init(SKUISearchBar);
    v5 = self->_searchBar;
    self->_searchBar = v4;

    searchBar = self->_searchBar;
  }

  return searchBar;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SKUISearchController;
  id v7 = a4;
  -[SKUISearchController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = [(SKUISearchController *)self delegate];
  objc_msgSend(v8, "searchControllerWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_paddingString, 0);

  objc_storeStrong((id *)&self->_suffixLabel, 0);
}

@end