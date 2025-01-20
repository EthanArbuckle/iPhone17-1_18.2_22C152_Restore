@interface CHASActivitySetupContentSizedTableView
- (CGSize)intrinsicContentSize;
- (void)setContentSize:(CGSize)a3;
@end

@implementation CHASActivitySetupContentSizedTableView

- (void)setContentSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHASActivitySetupContentSizedTableView;
  -[CHASActivitySetupContentSizedTableView setContentSize:](&v4, "setContentSize:", a3.width, a3.height);
  [(CHASActivitySetupContentSizedTableView *)self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  [(CHASActivitySetupContentSizedTableView *)self layoutIfNeeded];
  [(CHASActivitySetupContentSizedTableView *)self contentSize];
  double v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

@end