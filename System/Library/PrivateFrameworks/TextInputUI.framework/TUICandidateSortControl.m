@interface TUICandidateSortControl
- (CGRect)segmentedControlFrame;
- (NSArray)titles;
- (TUICandidateSortControl)initWithCoder:(id)a3;
- (TUICandidateSortControl)initWithFrame:(CGRect)a3;
- (TUICandidateViewStyle)style;
- (UISegmentedControl)segmentedControl;
- (double)segmentedControlWidth;
- (int64_t)selectedIndex;
- (void)commonInit;
- (void)handleValueChanged;
- (void)layoutSubviews;
- (void)setSegmentedControl:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setStyle:(id)a3;
- (void)setTitles:(id)a3;
@end

@implementation TUICandidateSortControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_titles, 0);
}

- (void)setSegmentedControl:(id)a3
{
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (NSArray)titles
{
  return self->_titles;
}

- (void)handleValueChanged
{
}

- (void)setSelectedIndex:(int64_t)a3
{
  id v4 = [(TUICandidateSortControl *)self segmentedControl];
  [v4 setSelectedSegmentIndex:a3];
}

- (int64_t)selectedIndex
{
  v2 = [(TUICandidateSortControl *)self segmentedControl];
  int64_t v3 = [v2 selectedSegmentIndex];

  return v3;
}

- (void)setTitles:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSArray *)self->_titles isEqual:v4] & 1) == 0)
  {
    v5 = (NSArray *)[v4 copy];
    titles = self->_titles;
    self->_titles = v5;

    [(UISegmentedControl *)self->_segmentedControl removeAllSegments];
    unint64_t v7 = [v4 count];
    segmentedControl = self->_segmentedControl;
    if (v7 > 1)
    {
      [(UISegmentedControl *)segmentedControl setHidden:0];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      v9 = self->_titles;
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v9);
            }
            [(UISegmentedControl *)self->_segmentedControl insertSegmentWithTitle:*(void *)(*((void *)&v14 + 1) + 8 * v13++) atIndex:[(UISegmentedControl *)self->_segmentedControl numberOfSegments] animated:0];
          }
          while (v11 != v13);
          uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v11);
      }

      if ([(NSArray *)self->_titles count]) {
        [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:0];
      }
      [(TUICandidateSortControl *)self setNeedsLayout];
    }
    else
    {
      [(UISegmentedControl *)segmentedControl setHidden:1];
    }
  }
}

- (void)setStyle:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(TUICandidateViewStyle *)self->_style isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    if (v5)
    {
      v6 = [(TUICandidateSortControl *)self segmentedControl];
      uint64_t v21 = *MEMORY[0x1E4FB06F8];
      uint64_t v7 = v21;
      v8 = [v5 sortControlFont];
      v23[0] = v8;
      uint64_t v22 = *MEMORY[0x1E4FB0700];
      uint64_t v9 = v22;
      uint64_t v10 = [v5 textColor];
      v23[1] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v21 count:2];
      [v6 setTitleTextAttributes:v11 forState:0];

      uint64_t v12 = [(TUICandidateSortControl *)self segmentedControl];
      v19[0] = v7;
      uint64_t v13 = [v5 sortControlFont];
      v19[1] = v9;
      v20[0] = v13;
      long long v14 = [v5 textColor];
      v20[1] = v14;
      long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
      [v12 setTitleTextAttributes:v15 forState:4];
    }
    long long v16 = [v5 sortControlColor];
    long long v17 = [(TUICandidateSortControl *)self segmentedControl];
    [v17 setTintColor:v16];

    v18 = [v5 sortControlBackgroundColor];
    [(TUICandidateSortControl *)self setBackgroundColor:v18];

    [(TUICandidateSortControl *)self setNeedsLayout];
  }
}

- (double)segmentedControlWidth
{
  [(TUICandidateSortControl *)self bounds];
  double Width = CGRectGetWidth(v16);
  id v4 = [(TUICandidateSortControl *)self style];
  [v4 sortControlPadding];
  double v6 = Width - v5;
  uint64_t v7 = [(TUICandidateSortControl *)self style];
  [v7 sortControlPadding];
  double v9 = v6 - v8;

  uint64_t v10 = [(TUICandidateSortControl *)self style];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [(TUICandidateSortControl *)self style];
    uint64_t v12 = [v11 performSelector:sel_maximizeSortControlWidthWithPadding];

    if (v12) {
      return v9;
    }
  }
  else
  {
  }
  double v13 = v9 + -10.0;
  if (Width >= 320.0)
  {
    double v14 = 320.0;
    if (Width < 452.0) {
      double v14 = Width + -17.0;
    }
  }
  else
  {
    double v14 = Width + -10.0;
  }
  if (v14 < v13) {
    double v13 = v14;
  }
  if (v13 >= 0.0) {
    return v13;
  }
  else {
    return 0.0;
  }
}

- (CGRect)segmentedControlFrame
{
  [(TUICandidateSortControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [MEMORY[0x1E4FB1C10] defaultHeightForStyle:5];
  double v8 = v7;
  [(TUICandidateSortControl *)self segmentedControlWidth];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.size.height = v13;
  result.size.width = v10;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)TUICandidateSortControl;
  [(TUICandidateSortControl *)&v16 layoutSubviews];
  [(TUICandidateSortControl *)self segmentedControlFrame];
  -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:");
  [(TUICandidateSortControl *)self bounds];
  double MidX = CGRectGetMidX(v17);
  double v4 = [(TUICandidateSortControl *)self style];
  [v4 sortControlPadding];
  double v6 = v5;
  double v7 = [(TUICandidateSortControl *)self style];
  [v7 sortControlPadding];
  double v9 = MidX + (v6 - v8) * 0.5;
  [(TUICandidateSortControl *)self bounds];
  double MidY = CGRectGetMidY(v18);
  double v11 = [(TUICandidateSortControl *)self style];
  [v11 sortControlPadding];
  double v13 = v12;
  double v14 = [(TUICandidateSortControl *)self style];
  [v14 sortControlPadding];
  -[UISegmentedControl setCenter:](self->_segmentedControl, "setCenter:", v9, MidY + (v13 - v15) * 0.5);
}

- (TUICandidateSortControl)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateSortControl;
  double v3 = [(TUICandidateSortControl *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(TUICandidateSortControl *)v3 commonInit];
  }
  return v4;
}

- (TUICandidateSortControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateSortControl;
  double v3 = -[TUICandidateSortControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(TUICandidateSortControl *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1C10]);
  [(TUICandidateSortControl *)self segmentedControlFrame];
  double v4 = (UISegmentedControl *)objc_msgSend(v3, "initWithFrame:");
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v4;

  [(UISegmentedControl *)self->_segmentedControl addTarget:self action:sel_handleValueChanged forControlEvents:4096];
  objc_super v6 = self->_segmentedControl;
  [(TUICandidateSortControl *)self addSubview:v6];
}

@end