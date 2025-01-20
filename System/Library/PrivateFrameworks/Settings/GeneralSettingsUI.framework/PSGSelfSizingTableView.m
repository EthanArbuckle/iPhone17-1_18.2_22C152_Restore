@interface PSGSelfSizingTableView
- (CGSize)intrinsicContentSize;
- (void)setContentSize:(CGSize)a3;
@end

@implementation PSGSelfSizingTableView

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PSGSelfSizingTableView *)self contentSize];
  if (width != v7 || height != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)PSGSelfSizingTableView;
    -[PSGSelfSizingTableView setContentSize:](&v9, sel_setContentSize_, width, height);
    [(PSGSelfSizingTableView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  [(PSGSelfSizingTableView *)self layoutIfNeeded];
  double v3 = *MEMORY[0x263F83C20];
  [(PSGSelfSizingTableView *)self contentSize];
  double v5 = v3;
  result.double height = v4;
  result.double width = v5;
  return result;
}

@end