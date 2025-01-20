@interface IMTableView
- (IMTableView)initWithCoder:(id)a3;
- (IMTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)quickScroller;
- (int64_t)quickScrollerMinimumDisplayRowCount;
- (int64_t)totalRowCount;
- (void)initCommon;
- (void)layoutSubviews;
- (void)quickScroll:(id)a3;
- (void)reloadData;
- (void)setContentOffset:(CGPoint)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setQuickScrollerMinimumDisplayRowCount:(int64_t)a3;
- (void)updateQuickScroller;
@end

@implementation IMTableView

- (void)initCommon
{
}

- (IMTableView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMTableView;
  v3 = [(IMTableView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(IMTableView *)v3 initCommon];
  }
  return v4;
}

- (IMTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IMTableView;
  v4 = -[IMTableView initWithFrame:style:](&v7, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4) {
    [(IMTableView *)v4 initCommon];
  }
  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  quickScroller = self->_quickScroller;
  -[IMQuickScroller convertPoint:fromView:](quickScroller, "convertPoint:fromView:", self, x, y);
  -[IMQuickScroller hitTest:withEvent:](quickScroller, "hitTest:withEvent:", v7);
  v9 = (IMQuickScroller *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && v9 == self->_quickScroller)
  {
    [(IMTableView *)self setDelaysContentTouches:0];
    v11 = v10;
  }
  else
  {
    [(IMTableView *)self setDelaysContentTouches:1];
    v14.receiver = self;
    v14.super_class = (Class)IMTableView;
    -[IMTableView hitTest:withEvent:](&v14, "hitTest:withEvent:", v7, x, y);
    v11 = (IMQuickScroller *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (void)reloadData
{
  v3.receiver = self;
  v3.super_class = (Class)IMTableView;
  [(IMTableView *)&v3 reloadData];
  [(IMTableView *)self updateQuickScroller];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)IMTableView;
  [(IMTableView *)&v5 setEditing:a3 animated:a4];
  [(IMTableView *)self updateQuickScroller];
}

- (void)setContentOffset:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IMTableView;
  -[IMTableView setContentOffset:](&v4, "setContentOffset:", a3.x, a3.y);
  if (self->_quickScroller) {
    -[IMTableView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)IMTableView;
  [(IMTableView *)&v7 layoutSubviews];
  if (self->_quickScroller)
  {
    [(IMTableView *)self bounds];
    double v4 = v3 + -32.0;
    [(IMTableView *)self contentOffset];
    double v6 = v5;
    [(IMTableView *)self bounds];
    -[IMQuickScroller setFrame:](self->_quickScroller, "setFrame:", v4, v6, 32.0);
    [(IMTableView *)self bringSubviewToFront:self->_quickScroller];
  }
}

- (int64_t)totalRowCount
{
  double v3 = (char *)[(IMTableView *)self numberOfSections];
  if ((uint64_t)v3 < 1) {
    return 0;
  }
  double v4 = v3;
  double v5 = 0;
  int64_t v6 = 0;
  do
    v6 += (int64_t)[(IMTableView *)self numberOfRowsInSection:v5++];
  while (v4 != v5);
  return v6;
}

- (id)quickScroller
{
  quickScroller = self->_quickScroller;
  if (!quickScroller)
  {
    double v4 = -[IMQuickScroller initWithFrame:]([IMQuickScroller alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    double v5 = self->_quickScroller;
    self->_quickScroller = v4;

    [(IMQuickScroller *)self->_quickScroller setAutoresizingMask:17];
    [(IMQuickScroller *)self->_quickScroller addTarget:self action:"quickScroll:" forControlEvents:4096];
    quickScroller = self->_quickScroller;
  }

  return quickScroller;
}

- (void)quickScroll:(id)a3
{
  [a3 value];
  float v5 = v4;
  [(IMTableView *)self contentOffset];
  double v7 = v6;
  [(IMTableView *)self contentSize];
  double v9 = v8;
  [(IMTableView *)self bounds];

  -[IMTableView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v7, (v9 - v10) * v5);
}

- (void)updateQuickScroller
{
  uint64_t v3 = [(IMTableView *)self totalRowCount];
  int64_t v4 = [(IMTableView *)self quickScrollerMinimumDisplayRowCount];
  if (v3 < v4
    || v4 == 0x7FFFFFFFFFFFFFFFLL
    || ([(IMTableView *)self isEditing] & 1) != 0
    || v3 > (uint64_t)[(IMTableView *)self sectionIndexMinimumDisplayRowCount])
  {
    quickScroller = self->_quickScroller;
    [(IMQuickScroller *)quickScroller removeFromSuperview];
  }
  else
  {
    double v6 = [(IMQuickScroller *)self->_quickScroller superview];

    if (v6 != self)
    {
      id v7 = [(IMTableView *)self quickScroller];
      [(IMTableView *)self addSubview:v7];
    }
  }
}

- (int64_t)quickScrollerMinimumDisplayRowCount
{
  return self->_quickScrollerMinimumDisplayRowCount;
}

- (void)setQuickScrollerMinimumDisplayRowCount:(int64_t)a3
{
  self->_quickScrollerMinimumDisplayRowCount = a3;
}

- (void).cxx_destruct
{
}

@end