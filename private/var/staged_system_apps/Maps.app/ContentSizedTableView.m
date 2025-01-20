@interface ContentSizedTableView
- (CGSize)intrinsicContentSize;
- (ContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)setAlwaysBounceVertical:(BOOL)a3;
- (void)setContentSize:(CGSize)a3;
@end

@implementation ContentSizedTableView

- (ContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ContentSizedTableView;
  v4 = -[ContentSizedTableView initWithFrame:style:](&v7, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4) {
    [(ContentSizedTableView *)v4 setAlwaysBounceVertical:0];
  }
  return v5;
}

- (void)setContentSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ContentSizedTableView;
  -[ContentSizedTableView setContentSize:](&v4, "setContentSize:", a3.width, a3.height);
  [(ContentSizedTableView *)self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  [(ContentSizedTableView *)self layoutIfNeeded];
  [(ContentSizedTableView *)self contentSize];
  double v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)setAlwaysBounceVertical:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ContentSizedTableView;
  [(ContentSizedTableView *)&v3 setAlwaysBounceVertical:0];
}

@end