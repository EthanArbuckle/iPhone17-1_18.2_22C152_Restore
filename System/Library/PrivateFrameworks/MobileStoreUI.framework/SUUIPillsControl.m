@interface SUUIPillsControl
- (CGRect)selectedPillFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)titles;
- (NSString)moreListTitle;
- (SUUIColorScheme)colorScheme;
- (SUUIPillsControl)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (int64_t)maximumNumberOfVisiblePills;
- (int64_t)selectedIndex;
- (void)_segmentedControlAction:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)reloadPills;
- (void)setColorScheme:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setMaximumNumberOfVisiblePills:(int64_t)a3;
- (void)setMoreListTitle:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setTitles:(id)a3;
@end

@implementation SUUIPillsControl

- (SUUIPillsControl)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SUUIPillsControl;
  v3 = -[SUUIPillsControl initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUISegmentedControl alloc];
    uint64_t v5 = [(SUUISegmentedControl *)v4 initWithItems:MEMORY[0x263EFFA68]];
    segmentedControl = v3->_segmentedControl;
    v3->_segmentedControl = (SUUISegmentedControl *)v5;

    [(SUUISegmentedControl *)v3->_segmentedControl addTarget:v3 action:sel__segmentedControlAction_ forControlEvents:4096];
    v7 = v3->_segmentedControl;
    v8 = [MEMORY[0x263F825C8] colorWithWhite:0.588235294 alpha:1.0];
    [(SUUISegmentedControl *)v7 setTintColor:v8];

    [(SUUIPillsControl *)v3 addSubview:v3->_segmentedControl];
    v9 = [MEMORY[0x263F825C8] whiteColor];
    [(SUUIPillsControl *)v3 setBackgroundColor:v9];
  }
  return v3;
}

- (void)dealloc
{
  [(SUUISegmentedControl *)self->_segmentedControl removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SUUIPillsControl;
  [(SUUIPillsControl *)&v3 dealloc];
}

- (void)reloadPills
{
  [(SUUISegmentedControl *)self->_segmentedControl removeAllSegments];
  int64_t v3 = [(NSArray *)self->_titles count];
  int64_t v4 = v3;
  int64_t maximumNumberOfVisiblePills = self->_maximumNumberOfVisiblePills;
  if (maximumNumberOfVisiblePills >= v3 || maximumNumberOfVisiblePills <= 0) {
    uint64_t v7 = v3;
  }
  else {
    uint64_t v7 = maximumNumberOfVisiblePills - 1;
  }
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      segmentedControl = self->_segmentedControl;
      v10 = [(NSArray *)self->_titles objectAtIndex:i];
      [(SUUISegmentedControl *)segmentedControl insertSegmentWithTitle:v10 atIndex:i animated:0];
    }
    int64_t maximumNumberOfVisiblePills = self->_maximumNumberOfVisiblePills;
  }
  if (maximumNumberOfVisiblePills) {
    BOOL v11 = maximumNumberOfVisiblePills < v4;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11) {
    [(SUUISegmentedControl *)self->_segmentedControl insertSegmentWithTitle:self->_moreListTitle atIndex:v7 animated:0];
  }
  [(SUUIPillsControl *)self setNeedsLayout];
}

- (int64_t)selectedIndex
{
  return [(SUUISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
}

- (CGRect)selectedPillFrame
{
  segmentedControl = self->_segmentedControl;
  int64_t v3 = [(SUUIPillsControl *)self selectedIndex];
  [(SUUISegmentedControl *)segmentedControl frameForSegmentAtIndex:v3];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setColorScheme:(id)a3
{
  double v4 = (SUUIColorScheme *)a3;
  if (self->_colorScheme != v4)
  {
    BOOL v11 = v4;
    double v5 = (SUUIColorScheme *)[(SUUIColorScheme *)v4 copy];
    colorScheme = self->_colorScheme;
    self->_colorScheme = v5;

    segmentedControl = self->_segmentedControl;
    if (self->_colorScheme)
    {
      v8 = [(SUUIColorScheme *)v11 secondaryTextColor];
      [(SUUISegmentedControl *)segmentedControl setTintColor:v8];

      [(SUUIColorScheme *)v11 backgroundColor];
    }
    else
    {
      v9 = [MEMORY[0x263F825C8] colorWithWhite:0.588235294 alpha:1.0];
      [(SUUISegmentedControl *)segmentedControl setTintColor:v9];

      [MEMORY[0x263F825C8] whiteColor];
    v10 = };
    [(SUUIPillsControl *)self setBackgroundColor:v10];

    double v4 = v11;
  }
}

- (void)setSelectedIndex:(int64_t)a3
{
}

- (void)layoutSubviews
{
  [(SUUIPillsControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = v3 - self->_contentInset.left - self->_contentInset.right;
  [(SUUISegmentedControl *)self->_segmentedControl frame];
  -[SUUISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", v4, v6);
  double v9 = v8;
  segmentedControl = self->_segmentedControl;
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  -[SUUISegmentedControl setFrame:](segmentedControl, "setFrame:", left, top, v7, v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SUUISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_segmentedControlAction:(id)a3
{
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
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

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (int64_t)maximumNumberOfVisiblePills
{
  return self->_maximumNumberOfVisiblePills;
}

- (void)setMaximumNumberOfVisiblePills:(int64_t)a3
{
  self->_int64_t maximumNumberOfVisiblePills = a3;
}

- (NSString)moreListTitle
{
  return self->_moreListTitle;
}

- (void)setMoreListTitle:(id)a3
{
}

- (NSArray)titles
{
  return self->_titles;
}

- (void)setTitles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_moreListTitle, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end