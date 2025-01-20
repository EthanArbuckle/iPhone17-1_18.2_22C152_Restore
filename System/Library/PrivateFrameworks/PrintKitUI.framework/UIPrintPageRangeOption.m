@interface UIPrintPageRangeOption
- (BOOL)shouldShow;
- (NSString)multiPageRangeTitle;
- (UIPrintPageRangeOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (UIPrintRangeView)pageRangeView;
- (id)printOptionDetailView;
- (id)printOptionTableViewCell;
- (id)summary;
- (void)dealloc;
- (void)didSelectPrintOption;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMultiPageRangeTitle:(id)a3;
- (void)setPageRangeView:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintPageRangeOption

- (UIPrintPageRangeOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIPrintPageRangeOption;
  v4 = [(UIPrintOption *)&v9 initWithPrintInfo:a3 printPanelViewController:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"RANGE_SHEET_TITLE" value:@"Page Range" table:@"Localizable"];
    [(UIPrintOption *)v4 setTitle:v6];

    v7 = [(UIPrintOption *)v4 printInfo];
    [v7 addObserver:v4 forKeyPath:0x1F3C9DEB8 options:0 context:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DEB8];

  v4.receiver = self;
  v4.super_class = (Class)UIPrintPageRangeOption;
  [(UIPrintPageRangeOption *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__UIPrintPageRangeOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__UIPrintPageRangeOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (BOOL)shouldShow
{
  v2 = [(UIPrintOption *)self printPanelViewController];
  char v3 = [v2 shouldShowPageRange];

  return v3;
}

- (void)updateFromPrintInfo
{
  char v3 = [(UIPrintOption *)self tableViewCell];
  id v6 = [v3 contentConfiguration];

  objc_super v4 = [(UIPrintPageRangeOption *)self summary];
  [v6 setSecondaryText:v4];

  v5 = [(UIPrintOption *)self tableViewCell];
  [v5 setContentConfiguration:v6];
}

- (id)printOptionTableViewCell
{
  char v3 = [(UIPrintOption *)self printPanelViewController];
  objc_super v4 = [v3 printOptionsTableView];
  v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionViewCell"];

  [(UIPrintOption *)self setTableViewCell:v5];
  id v6 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"Range" value:@"Range" table:@"Localizable"];
  [v6 setText:v8];

  objc_super v9 = [(UIPrintPageRangeOption *)self summary];
  [v6 setSecondaryText:v9];

  v10 = [v6 secondaryTextProperties];
  [v10 setNumberOfLines:1];

  [v5 setContentConfiguration:v6];
  [v5 setAccessoryType:1];
  [v5 setOptionViewDelegate:self];

  return v5;
}

- (id)printOptionDetailView
{
  char v3 = [UIPrintRangeView alloc];
  objc_super v4 = [(UIPrintOption *)self printInfo];
  v5 = -[UIPrintRangeView initWithFrame:printInfo:](v3, "initWithFrame:printInfo:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIPrintPageRangeOption *)self setPageRangeView:v5];

  return [(UIPrintPageRangeOption *)self pageRangeView];
}

- (id)summary
{
  v2 = [(UIPrintOption *)self printInfo];
  char v3 = [v2 pageRanges];
  objc_super v4 = SummaryForRange(v3);

  return v4;
}

- (void)didSelectPrintOption
{
  id v2 = [(UIPrintOption *)self tableViewCell];
  [v2 printOptionCellTapped];
}

- (UIPrintRangeView)pageRangeView
{
  return self->_pageRangeView;
}

- (void)setPageRangeView:(id)a3
{
}

- (NSString)multiPageRangeTitle
{
  return self->_multiPageRangeTitle;
}

- (void)setMultiPageRangeTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiPageRangeTitle, 0);
  objc_storeStrong((id *)&self->_pageRangeView, 0);
}

@end