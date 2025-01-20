@interface SKUIPillsControl
- (CGRect)selectedPillFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)titles;
- (NSString)moreListTitle;
- (SKUIColorScheme)colorScheme;
- (SKUIPillsControl)initWithFrame:(CGRect)a3;
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

@implementation SKUIPillsControl

- (SKUIPillsControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPillsControl initWithFrame:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIPillsControl;
  v8 = -[SKUIPillsControl initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [SKUISegmentedControl alloc];
    uint64_t v10 = [(SKUISegmentedControl *)v9 initWithItems:MEMORY[0x1E4F1CBF0]];
    segmentedControl = v8->_segmentedControl;
    v8->_segmentedControl = (SKUISegmentedControl *)v10;

    [(SKUISegmentedControl *)v8->_segmentedControl addTarget:v8 action:sel__segmentedControlAction_ forControlEvents:4096];
    v12 = v8->_segmentedControl;
    v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.588235294 alpha:1.0];
    [(SKUISegmentedControl *)v12 setTintColor:v13];

    [(SKUIPillsControl *)v8 addSubview:v8->_segmentedControl];
    v14 = [MEMORY[0x1E4FB1618] whiteColor];
    [(SKUIPillsControl *)v8 setBackgroundColor:v14];
  }
  return v8;
}

- (void)dealloc
{
  [(SKUISegmentedControl *)self->_segmentedControl removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SKUIPillsControl;
  [(SKUIPillsControl *)&v3 dealloc];
}

- (void)reloadPills
{
  [(SKUISegmentedControl *)self->_segmentedControl removeAllSegments];
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
      uint64_t v10 = [(NSArray *)self->_titles objectAtIndex:i];
      [(SKUISegmentedControl *)segmentedControl insertSegmentWithTitle:v10 atIndex:i animated:0];
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
    [(SKUISegmentedControl *)self->_segmentedControl insertSegmentWithTitle:self->_moreListTitle atIndex:v7 animated:0];
  }

  [(SKUIPillsControl *)self setNeedsLayout];
}

- (int64_t)selectedIndex
{
  return [(SKUISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
}

- (CGRect)selectedPillFrame
{
  segmentedControl = self->_segmentedControl;
  int64_t v3 = [(SKUIPillsControl *)self selectedIndex];

  [(SKUISegmentedControl *)segmentedControl frameForSegmentAtIndex:v3];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)setColorScheme:(id)a3
{
  double v4 = (SKUIColorScheme *)a3;
  if (self->_colorScheme != v4)
  {
    BOOL v11 = v4;
    double v5 = (SKUIColorScheme *)[(SKUIColorScheme *)v4 copy];
    colorScheme = self->_colorScheme;
    self->_colorScheme = v5;

    segmentedControl = self->_segmentedControl;
    if (self->_colorScheme)
    {
      v8 = [(SKUIColorScheme *)v11 secondaryTextColor];
      [(SKUISegmentedControl *)segmentedControl setTintColor:v8];

      [(SKUIColorScheme *)v11 backgroundColor];
    }
    else
    {
      v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.588235294 alpha:1.0];
      [(SKUISegmentedControl *)segmentedControl setTintColor:v9];

      [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v10 = };
    [(SKUIPillsControl *)self setBackgroundColor:v10];

    double v4 = v11;
  }
}

- (void)setSelectedIndex:(int64_t)a3
{
}

- (void)layoutSubviews
{
  [(SKUIPillsControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = v3 - self->_contentInset.left - self->_contentInset.right;
  [(SKUISegmentedControl *)self->_segmentedControl frame];
  -[SKUISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", v4, v6);
  double v9 = v8;
  segmentedControl = self->_segmentedControl;
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;

  -[SKUISegmentedControl setFrame:](segmentedControl, "setFrame:", left, top, v7, v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SKUISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)_segmentedControlAction:(id)a3
{
}

- (SKUIColorScheme)colorScheme
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPillsControl initWithFrame:]";
}

@end