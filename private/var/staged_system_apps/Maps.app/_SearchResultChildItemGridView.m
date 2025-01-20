@interface _SearchResultChildItemGridView
- (void)removeAllArrangedSubviews;
@end

@implementation _SearchResultChildItemGridView

- (void)removeAllArrangedSubviews
{
  if ((uint64_t)[(_SearchResultChildItemGridView *)self numberOfRows] >= 1)
  {
    do
      [(_SearchResultChildItemGridView *)self removeRowAtIndex:0];
    while ((uint64_t)[(_SearchResultChildItemGridView *)self numberOfRows] > 0);
  }
  id v3 = [(_SearchResultChildItemGridView *)self subviews];
  [v3 makeObjectsPerformSelector:"removeFromSuperview"];
}

@end