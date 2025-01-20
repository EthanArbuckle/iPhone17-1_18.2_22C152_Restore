@interface SCLSingleGroupTableView
- (CGSize)intrinsicContentSize;
- (SCLSingleGroupTableView)initWithFrame:(CGRect)a3;
- (void)reloadData;
- (void)setBounds:(CGRect)a3;
- (void)setContentSize:(CGSize)a3;
@end

@implementation SCLSingleGroupTableView

- (SCLSingleGroupTableView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCLSingleGroupTableView;
  v3 = -[SCLSingleGroupTableView initWithFrame:style:](&v7, sel_initWithFrame_style_, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];

    [(SCLSingleGroupTableView *)v3 setScrollEnabled:0];
    v5 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(SCLSingleGroupTableView *)v3 setBackgroundColor:v5];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = [(SCLSingleGroupTableView *)self numberOfRowsInSection:0];
  v4 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  [(SCLSingleGroupTableView *)self rectForRowAtIndexPath:v4];
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;

  if (v3 >= 2)
  {
    for (uint64_t i = 1; i != v3; ++i)
    {
      v14 = [MEMORY[0x263F088C8] indexPathForRow:i inSection:0];
      [(SCLSingleGroupTableView *)self rectForRowAtIndexPath:v14];
      v24.origin.CGFloat x = v15;
      v24.origin.CGFloat y = v16;
      v24.size.CGFloat width = v17;
      v24.size.CGFloat height = v18;
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      CGRect v23 = CGRectUnion(v22, v24);
      CGFloat x = v23.origin.x;
      CGFloat y = v23.origin.y;
      CGFloat width = v23.size.width;
      CGFloat height = v23.size.height;
    }
  }
  double v19 = width;
  double v20 = height;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCLSingleGroupTableView;
  -[SCLSingleGroupTableView setContentSize:](&v4, sel_setContentSize_, a3.width, a3.height);
  [(SCLSingleGroupTableView *)self invalidateIntrinsicContentSize];
}

- (void)reloadData
{
  v3.receiver = self;
  v3.super_class = (Class)SCLSingleGroupTableView;
  [(SCLSingleGroupTableView *)&v3 reloadData];
  [(SCLSingleGroupTableView *)self invalidateIntrinsicContentSize];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(SCLSingleGroupTableView *)self numberOfRowsInSection:0] >= 1)
  {
    v8 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
    [(SCLSingleGroupTableView *)self rectForRowAtIndexPath:v8];
    double y = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)SCLSingleGroupTableView;
  -[SCLSingleGroupTableView setBounds:](&v10, sel_setBounds_, x, y, width, height);
}

@end