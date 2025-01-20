@interface COSContentSizedTableView
- (CGSize)intrinsicContentSize;
- (COSContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)setContentSize:(CGSize)a3;
@end

@implementation COSContentSizedTableView

- (COSContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)COSContentSizedTableView;
  v4 = -[COSContentSizedTableView initWithFrame:style:](&v7, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4) {
    [(COSContentSizedTableView *)v4 setScrollEnabled:0];
  }
  return v5;
}

- (void)setContentSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSContentSizedTableView;
  -[COSContentSizedTableView setContentSize:](&v4, "setContentSize:", a3.width, a3.height);
  [(COSContentSizedTableView *)self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  [(COSContentSizedTableView *)self layoutIfNeeded];
  [(COSContentSizedTableView *)self contentSize];
  double v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

@end