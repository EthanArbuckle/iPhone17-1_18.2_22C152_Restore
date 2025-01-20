@interface RBSymbolContentsLayer
- (BOOL)allowsBottomLeftOrigin;
- (void)setNeedsDisplayInRect:(CGRect)a3;
@end

@implementation RBSymbolContentsLayer

- (BOOL)allowsBottomLeftOrigin
{
  return 1;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  v3 = (void *)[(RBSymbolContentsLayer *)self delegate];
  if (v3)
  {
    [v3 setNeedsLayout];
  }
}

@end