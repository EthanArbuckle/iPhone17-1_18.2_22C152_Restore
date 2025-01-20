@interface CarContentSizedTableView
- (CGSize)intrinsicContentSize;
- (CarContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (id)accessoryViewAtEdge:(int64_t)a3;
- (void)setAlwaysBounceHorizontal:(BOOL)a3;
- (void)setAlwaysBounceVertical:(BOOL)a3;
- (void)setContentSize:(CGSize)a3;
@end

@implementation CarContentSizedTableView

- (CarContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CarContentSizedTableView;
  v4 = -[CarContentSizedTableView initWithFrame:style:](&v7, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(CarContentSizedTableView *)v4 setAlwaysBounceHorizontal:0];
    [(CarContentSizedTableView *)v5 setAlwaysBounceVertical:0];
    [(CarContentSizedTableView *)v5 setShowsHorizontalScrollIndicator:0];
    [(CarContentSizedTableView *)v5 setShowsVerticalScrollIndicator:0];
  }
  return v5;
}

- (void)setContentSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarContentSizedTableView;
  -[CarContentSizedTableView setContentSize:](&v4, "setContentSize:", a3.width, a3.height);
  [(CarContentSizedTableView *)self invalidateIntrinsicContentSize];
}

- (id)accessoryViewAtEdge:(int64_t)a3
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  [(CarContentSizedTableView *)self layoutIfNeeded];
  [(CarContentSizedTableView *)self contentSize];
  double v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)setAlwaysBounceHorizontal:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CarContentSizedTableView;
  [(CarContentSizedTableView *)&v3 setAlwaysBounceHorizontal:0];
}

- (void)setAlwaysBounceVertical:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CarContentSizedTableView;
  [(CarContentSizedTableView *)&v3 setAlwaysBounceVertical:0];
}

@end