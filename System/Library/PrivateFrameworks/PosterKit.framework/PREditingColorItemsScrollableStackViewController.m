@interface PREditingColorItemsScrollableStackViewController
- (BOOL)needsScrollToSelectedItem;
- (UIScrollView)scrollView;
- (UIStackView)stackView;
- (double)estimatedHeight;
- (void)layoutWithItemViews:(id)a3;
- (void)scrollToSelectedItemAnimated:(BOOL)a3;
- (void)setNeedsScrollToSelectedItem:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setStackView:(id)a3;
- (void)updateInteritemSpacingIfNeeded;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PREditingColorItemsScrollableStackViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PREditingColorItemsScrollableStackViewController;
  [(PREditingColorItemsScrollableStackViewController *)&v4 viewWillAppear:a3];
  [(PREditingColorItemsScrollableStackViewController *)self setNeedsScrollToSelectedItem:1];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PREditingColorItemsScrollableStackViewController;
  [(PREditingColorItemsViewController *)&v4 viewDidLayoutSubviews];
  [(PREditingColorItemsScrollableStackViewController *)self updateInteritemSpacingIfNeeded];
  if ([(PREditingColorItemsScrollableStackViewController *)self needsScrollToSelectedItem])
  {
    v3 = [(PREditingColorItemsScrollableStackViewController *)self stackView];
    [v3 layoutIfNeeded];

    [(PREditingColorItemsScrollableStackViewController *)self scrollToSelectedItemAnimated:0];
    [(PREditingColorItemsScrollableStackViewController *)self setNeedsScrollToSelectedItem:0];
  }
}

- (void)layoutWithItemViews:(id)a3
{
  v46[9] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (objc_class *)MEMORY[0x1E4FB1C60];
  id v5 = a3;
  v6 = (UIStackView *)[[v4 alloc] initWithArrangedSubviews:v5];

  [(UIStackView *)v6 setAxis:0];
  [(UIStackView *)v6 setAlignment:1];
  [(UIStackView *)v6 setSpacing:14.0];
  [(UIStackView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  stackView = self->_stackView;
  self->_stackView = v6;
  v8 = v6;

  id v9 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  v10 = (UIScrollView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  -[UIScrollView setContentInset:](v10, "setContentInset:", 0.0, 31.0, 0.0, 31.0);
  [(UIScrollView *)v10 setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)v10 setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)v10 setClipsToBounds:0];
  [(UIScrollView *)v10 addSubview:v8];
  scrollView = self->_scrollView;
  self->_scrollView = v10;
  v12 = v10;

  v13 = [(PREditingColorItemsScrollableStackViewController *)self view];
  [v13 addSubview:v12];

  v45 = [(UIStackView *)v8 leadingAnchor];
  v44 = [(UIScrollView *)v12 leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v46[0] = v43;
  v41 = [(UIStackView *)v8 trailingAnchor];
  v40 = [(UIScrollView *)v12 trailingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v46[1] = v39;
  v42 = v8;
  v38 = [(UIStackView *)v8 topAnchor];
  v37 = [(UIScrollView *)v12 topAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v46[2] = v36;
  v35 = [(UIStackView *)v8 bottomAnchor];
  v34 = [(UIScrollView *)v12 bottomAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v46[3] = v33;
  v32 = [(UIScrollView *)v12 heightAnchor];
  [(PREditingColorItemsScrollableStackViewController *)self estimatedHeight];
  v31 = objc_msgSend(v32, "constraintEqualToConstant:");
  v46[4] = v31;
  v29 = [(UIScrollView *)v12 leadingAnchor];
  v30 = [(PREditingColorItemsScrollableStackViewController *)self view];
  v28 = [v30 leadingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v46[5] = v27;
  v24 = [(UIScrollView *)v12 trailingAnchor];
  v25 = [(PREditingColorItemsScrollableStackViewController *)self view];
  v23 = [v25 trailingAnchor];
  v14 = [v24 constraintEqualToAnchor:v23];
  v46[6] = v14;
  v15 = [(UIScrollView *)v12 bottomAnchor];
  v16 = [(PREditingColorItemsScrollableStackViewController *)self view];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v46[7] = v18;
  v19 = [(UIScrollView *)v12 topAnchor];
  v20 = [(PREditingColorItemsScrollableStackViewController *)self view];
  v21 = [v20 topAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  v46[8] = v22;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:9];

  [MEMORY[0x1E4F28DC8] activateConstraints:v26];
}

- (void)updateInteritemSpacingIfNeeded
{
  v3 = [(PREditingColorItemsScrollableStackViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  double v6 = (v5 + -326.0) / 5.0;
  [(UIStackView *)self->_stackView spacing];
  if (v6 != v7)
  {
    [(UIStackView *)self->_stackView setSpacing:v6];
    stackView = self->_stackView;
    [(UIStackView *)stackView setNeedsLayout];
  }
}

- (void)scrollToSelectedItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (double *)MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v22 = [(PREditingColorItemsViewController *)self selectedColorItem];
  double v7 = [(PREditingColorItemsViewController *)self selectedColorItemView];
  v8 = [(PREditingColorItemsScrollableStackViewController *)self scrollView];
  [v8 bounds];
  double v10 = v9;
  if ([v22 isFromUIKitColorPicker])
  {
    v11 = [(PREditingColorItemsViewController *)self configuration];
    uint64_t v12 = [v11 colorWellDisplayMode];

    if (v12 == 1)
    {
      v13 = [(PREditingColorItemsScrollableStackViewController *)self stackView];
      [v13 bounds];
      double v15 = v14 - (v10 + -31.0);
LABEL_6:

      goto LABEL_8;
    }
  }
  if (v7)
  {
    [v7 frame];
    [v7 bounds];
    [v8 contentSize];
    [v7 frame];
    double v17 = v16;
    v13 = [(PREditingColorItemsScrollableStackViewController *)self scrollView];
    [v13 bounds];
    double v19 = v18;
    [v7 bounds];
    double v15 = v17 + (v19 - v20) * -0.5;
    goto LABEL_6;
  }
  double v15 = *v5;
LABEL_8:
  v21 = [(PREditingColorItemsScrollableStackViewController *)self scrollView];
  objc_msgSend(v21, "setContentOffset:animated:", v3, v15, v6);
}

- (double)estimatedHeight
{
  return 44.0;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (BOOL)needsScrollToSelectedItem
{
  return self->_needsScrollToSelectedItem;
}

- (void)setNeedsScrollToSelectedItem:(BOOL)a3
{
  self->_needsScrollToSelectedItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end