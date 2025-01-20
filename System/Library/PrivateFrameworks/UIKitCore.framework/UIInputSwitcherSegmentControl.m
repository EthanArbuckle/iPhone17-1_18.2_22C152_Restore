@interface UIInputSwitcherSegmentControl
- (BOOL)shouldTrack;
- (BOOL)usesDarkTheme;
- (NSArray)segmentImages;
- (NSArray)segmentTitles;
- (UIInputSwitcherSegmentControl)initWithFrame:(CGRect)a3;
- (UIStackView)stackView;
- (int64_t)selectedSegmentIndex;
- (unint64_t)numberOfSegments;
- (void)_populateSegmentViewsWithCount:(unint64_t)a3;
- (void)_removeAllSegmentViews;
- (void)layoutSubviews;
- (void)setSegmentImages:(id)a3;
- (void)setSegmentTitles:(id)a3;
- (void)setSelectedSegmentIndex:(int64_t)a3;
- (void)setStackView:(id)a3;
- (void)setUsesDarkTheme:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateSelectionWithPoint:(CGPoint)a3;
@end

@implementation UIInputSwitcherSegmentControl

- (UIInputSwitcherSegmentControl)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIInputSwitcherSegmentControl;
  v3 = -[UIControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIStackView alloc];
    uint64_t v5 = [(UIStackView *)v4 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
    stackView = v3->_stackView;
    v3->_stackView = (UIStackView *)v5;

    [(UIStackView *)v3->_stackView setAxis:0];
    [(UIStackView *)v3->_stackView setDistribution:1];
    [(UIStackView *)v3->_stackView setAlignment:3];
    [(UIStackView *)v3->_stackView setSpacing:9.0];
    [(UIView *)v3->_stackView setSemanticContentAttribute:2];
    [(UIView *)v3 addSubview:v3->_stackView];
  }
  return v3;
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  self->_selectedSegmentIndex = a3;
  uint64_t v5 = [(UIInputSwitcherSegmentControl *)self stackView];
  v6 = [v5 arrangedSubviews];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [(UIInputSwitcherSegmentControl *)self stackView];
      v10 = [v9 arrangedSubviews];
      v11 = [v10 objectAtIndexedSubscript:v8];

      [v11 setSelected:a3 == v8];
      ++v8;
      v12 = [(UIInputSwitcherSegmentControl *)self stackView];
      v13 = [v12 arrangedSubviews];
      unint64_t v14 = [v13 count];
    }
    while (v8 < v14);
  }
  [(UIControl *)self sendActionsForControlEvents:4096];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIInputSwitcherSegmentControl;
  [(UIView *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_stackView, "setFrame:");
}

- (void)_removeAllSegmentViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = [(UIInputSwitcherSegmentControl *)self stackView];
  v4 = [v3 arrangedSubviews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        v10 = [(UIInputSwitcherSegmentControl *)self stackView];
        [v10 removeArrangedSubview:v9];

        [v9 removeFromSuperview];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_populateSegmentViewsWithCount:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v3 = a3;
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      v9 = -[UIInputSwitcherTableCellSegmentView initWithFrame:]([UIInputSwitcherTableCellSegmentView alloc], "initWithFrame:", v5, v6, v7, v8);
      [(UIView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
      v10 = [(UIInputSwitcherSegmentControl *)self stackView];
      [v10 addArrangedSubview:v9];

      long long v11 = [(UIInputSwitcherTableCellSegmentView *)v9 backgroundView];
      [v11 setRoundedCorners:-1];

      [(UIInputSwitcherTableCellSegmentView *)v9 setUsesDarkTheme:[(UIInputSwitcherSegmentControl *)self usesDarkTheme]];
      long long v12 = [(UIView *)v9 topAnchor];
      long long v13 = [(UIInputSwitcherSegmentControl *)self stackView];
      long long v14 = [v13 topAnchor];
      v15 = [v12 constraintEqualToAnchor:v14];
      [v15 setActive:1];

      uint64_t v16 = [(UIView *)v9 bottomAnchor];
      v17 = [(UIInputSwitcherSegmentControl *)self stackView];
      v18 = [v17 bottomAnchor];
      v19 = [v16 constraintEqualToAnchor:v18];
      [v19 setActive:1];

      --v3;
    }
    while (v3);
  }
}

- (void)setSegmentTitles:(id)a3
{
  id v4 = a3;
  [(UIInputSwitcherSegmentControl *)self _removeAllSegmentViews];
  -[UIInputSwitcherSegmentControl _populateSegmentViewsWithCount:](self, "_populateSegmentViewsWithCount:", [v4 count]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__UIInputSwitcherSegmentControl_setSegmentTitles___block_invoke;
  v5[3] = &unk_1E52E0B30;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __50__UIInputSwitcherSegmentControl_setSegmentTitles___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  double v6 = [v4 stackView];
  double v7 = [v6 arrangedSubviews];
  id v9 = [v7 objectAtIndex:a3];

  double v8 = [v9 label];
  [v8 setText:v5];
}

- (void)setSegmentImages:(id)a3
{
  id v4 = a3;
  [(UIInputSwitcherSegmentControl *)self _removeAllSegmentViews];
  -[UIInputSwitcherSegmentControl _populateSegmentViewsWithCount:](self, "_populateSegmentViewsWithCount:", [v4 count]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__UIInputSwitcherSegmentControl_setSegmentImages___block_invoke;
  v5[3] = &unk_1E52F3AB8;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __50__UIInputSwitcherSegmentControl_setSegmentImages___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  double v6 = [v4 stackView];
  double v7 = [v6 arrangedSubviews];
  id v9 = [v7 objectAtIndex:a3];

  double v8 = [v9 imageView];
  [v8 setImage:v5];
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  double x = a3.x;
  [(UIView *)self bounds];
  unint64_t v6 = (uint64_t)(x / (v5 / (double)[(UIInputSwitcherSegmentControl *)self numberOfSegments]));
  if ([(UIInputSwitcherSegmentControl *)self numberOfSegments] > v6)
  {
    [(UIInputSwitcherSegmentControl *)self setSelectedSegmentIndex:v6];
  }
}

- (unint64_t)numberOfSegments
{
  v2 = [(UIInputSwitcherSegmentControl *)self stackView];
  unint64_t v3 = [v2 arrangedSubviews];
  unint64_t v4 = [v3 count];

  return v4;
}

- (BOOL)shouldTrack
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 anyObject];
  [v8 locationInView:self];
  -[UIInputSwitcherSegmentControl updateSelectionWithPoint:](self, "updateSelectionWithPoint:");

  v9.receiver = self;
  v9.super_class = (Class)UIInputSwitcherSegmentControl;
  [(UIControl *)&v9 touchesBegan:v7 withEvent:v6];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 anyObject];
  [v8 locationInView:self];
  -[UIInputSwitcherSegmentControl updateSelectionWithPoint:](self, "updateSelectionWithPoint:");

  v9.receiver = self;
  v9.super_class = (Class)UIInputSwitcherSegmentControl;
  [(UIControl *)&v9 touchesMoved:v7 withEvent:v6];
}

- (int64_t)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (NSArray)segmentTitles
{
  return self->_segmentTitles;
}

- (NSArray)segmentImages
{
  return self->_segmentImages;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  self->_usesDarkTheme = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_segmentImages, 0);
  objc_storeStrong((id *)&self->_segmentTitles, 0);
}

@end