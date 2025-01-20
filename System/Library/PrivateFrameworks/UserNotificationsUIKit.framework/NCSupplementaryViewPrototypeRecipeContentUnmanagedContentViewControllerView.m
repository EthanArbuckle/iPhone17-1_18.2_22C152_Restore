@interface NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView
- (BOOL)containsUnmanagedContent;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerViewDelegate)delegate;
- (void)_unmanagedViewTapped;
- (void)layoutSubviews;
- (void)setContainsUnmanagedContent:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UISegmentedControl *)self->_unmanagedSegmentControl frame];
  double v3 = CGRectGetMaxY(v6) + 35.0;
  double v4 = 0.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v63[2] = *MEMORY[0x1E4F143B8];
  v60.receiver = self;
  v60.super_class = (Class)NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView;
  [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)&v60 layoutSubviews];
  v2 = self;
  if (!self->_unmanagedView)
  {
    double v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    unmanagedView = self->_unmanagedView;
    self->_unmanagedView = v3;

    v5 = self->_unmanagedView;
    CGRect v6 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)self addSubview:self->_unmanagedView];
    v2 = self;
  }
  if (!v2->_tapGestureRecongizer)
  {
    v7 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
    tapGestureRecongizer = self->_tapGestureRecongizer;
    self->_tapGestureRecongizer = v7;

    [(UITapGestureRecognizer *)self->_tapGestureRecongizer setDelegate:self];
    [(UIView *)self->_unmanagedView addGestureRecognizer:self->_tapGestureRecongizer];
    [(UITapGestureRecognizer *)self->_tapGestureRecongizer addTarget:self action:sel__unmanagedViewTapped];
    v2 = self;
  }
  uint64_t v52 = 424;
  if (!v2->_unmanagedTitleLabel)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    unmanagedTitleLabel = self->_unmanagedTitleLabel;
    self->_unmanagedTitleLabel = v9;

    [(UILabel *)self->_unmanagedTitleLabel setText:@"Set containsUnmanagedContent on configuration:"];
    [(UILabel *)self->_unmanagedTitleLabel setNumberOfLines:0];
    [(UILabel *)self->_unmanagedTitleLabel setTextAlignment:1];
    [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)self addSubview:self->_unmanagedTitleLabel];
    v2 = self;
  }
  if (!v2->_unmanagedSegmentControl)
  {
    objc_initWeak(&location, v2);
    v11 = (void *)MEMORY[0x1E4FB13F0];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __93__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView_layoutSubviews__block_invoke;
    v57[3] = &unk_1E6A91930;
    objc_copyWeak(&v58, &location);
    v12 = [v11 actionWithTitle:@"No" image:0 identifier:0 handler:v57];
    v13 = (void *)MEMORY[0x1E4FB13F0];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __93__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView_layoutSubviews__block_invoke_2;
    v55[3] = &unk_1E6A91930;
    objc_copyWeak(&v56, &location);
    v14 = [v13 actionWithTitle:@"Yes" image:0 identifier:0 handler:v55];
    id v15 = objc_alloc(MEMORY[0x1E4FB1C10]);
    v63[0] = v12;
    v63[1] = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
    v17 = (UISegmentedControl *)objc_msgSend(v15, "initWithFrame:actions:", v16, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    unmanagedSegmentControl = self->_unmanagedSegmentControl;
    self->_unmanagedSegmentControl = v17;

    [(UISegmentedControl *)self->_unmanagedSegmentControl setSelectedSegmentIndex:self->_containsUnmanagedContent];
    [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)self addSubview:self->_unmanagedSegmentControl];

    objc_destroyWeak(&v56);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);
    v2 = self;
  }
  if (!v2->_overflowingLabel)
  {
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    overflowingLabel = self->_overflowingLabel;
    self->_overflowingLabel = v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    double v22 = *MEMORY[0x1E4FB09B8];
    double v23 = *MEMORY[0x1E4FB09E8];
    uint64_t v24 = *MEMORY[0x1E4FB06F8];
    uint64_t v25 = *MEMORY[0x1E4FB0700];
    uint64_t v26 = 25;
    do
    {
      v27 = (void *)MEMORY[0x1E4FB08E0];
      uint32_t v28 = arc4random_uniform(0x14u);
      if (arc4random_uniform(0x14u)) {
        double v29 = v23;
      }
      else {
        double v29 = v22;
      }
      v30 = objc_msgSend(v27, "systemFontOfSize:weight:", (double)(v28 + 10), v29, v52);
      v31 = (void *)MEMORY[0x1E4FB1618];
      uint32_t v32 = arc4random_uniform(0xFFu);
      uint32_t v33 = arc4random_uniform(0xFFu);
      v34 = [v31 colorWithRed:(double)v32 / 255.0 green:(double)v33 / 255.0 blue:(double)arc4random_uniform(0xFFu) / 255.0 alpha:1.0];
      id v35 = objc_alloc(MEMORY[0x1E4F28B18]);
      v61[0] = v24;
      v61[1] = v25;
      v62[0] = v30;
      v62[1] = v34;
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
      v37 = (void *)[v35 initWithString:@"repeating str" attributes:v36];
      [v21 appendAttributedString:v37];

      --v26;
    }
    while (v26);
    [(UILabel *)self->_overflowingLabel setAttributedText:v21];
    [(UILabel *)self->_overflowingLabel setNumberOfLines:0];
    [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)self addSubview:self->_overflowingLabel];

    v2 = self;
  }
  v38 = v2->_unmanagedView;
  [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)v2 bounds];
  -[UIView setFrame:](v38, "setFrame:");
  v39 = *(Class *)((char *)&self->super.super.super.isa + v53);
  [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)self bounds];
  objc_msgSend(v39, "setFrame:", 16.0, 16.0, v40 + -32.0, 50.0);
  v41 = self->_unmanagedSegmentControl;
  [*(id *)((char *)&self->super.super.super.isa + v53) frame];
  double MaxY = CGRectGetMaxY(v64);
  [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)self bounds];
  -[UISegmentedControl setFrame:](v41, "setFrame:", 16.0, MaxY + 16.0, v43 + -32.0, 100.0);
  v44 = self->_overflowingLabel;
  [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)self bounds];
  double v46 = v45;
  [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)self bounds];
  -[UILabel sizeThatFits:](v44, "sizeThatFits:", v46 + 80.0, v47);
  double v49 = v48;
  double v51 = v50;
  [(UISegmentedControl *)self->_unmanagedSegmentControl frame];
  -[UILabel setFrame:](self->_overflowingLabel, "setFrame:", -40.0, CGRectGetMaxY(v65) + 8.0, v49, v51);
}

void __93__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView_layoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 unmanagedContentViewControllerView:v3 setContainsUnmanagedContent:0];

    id WeakRetained = v3;
  }
}

void __93__NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 unmanagedContentViewControllerView:v3 setContainsUnmanagedContent:1];

    id WeakRetained = v3;
  }
}

- (void)setContainsUnmanagedContent:(BOOL)a3
{
  self->_containsUnmanagedContent = a3;
  [(UISegmentedControl *)self->_unmanagedSegmentControl setSelectedSegmentIndex:a3];

  [(NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerView *)self setNeedsLayout];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_tapGestureRecongizer == a3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  tapGestureRecongizer = self->_tapGestureRecongizer;
  return tapGestureRecongizer == a3 || tapGestureRecongizer != a4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  tapGestureRecongizer = self->_tapGestureRecongizer;
  return tapGestureRecongizer == a3 || tapGestureRecongizer != a4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  tapGestureRecongizer = self->_tapGestureRecongizer;
  return tapGestureRecongizer == a4 || tapGestureRecongizer != a3;
}

- (void)_unmanagedViewTapped
{
  id v3 = [(UIView *)self->_unmanagedView backgroundColor];
  double v4 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  if ([v3 isEqual:v4]) {
    [MEMORY[0x1E4FB1618] systemMintColor];
  }
  else {
  id v5 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  }

  [(UIView *)self->_unmanagedView setBackgroundColor:v5];
}

- (NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCSupplementaryViewPrototypeRecipeContentUnmanagedContentViewControllerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)containsUnmanagedContent
{
  return self->_containsUnmanagedContent;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overflowingLabel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecongizer, 0);
  objc_storeStrong((id *)&self->_unmanagedTitleLabel, 0);
  objc_storeStrong((id *)&self->_unmanagedSegmentControl, 0);

  objc_storeStrong((id *)&self->_unmanagedView, 0);
}

@end