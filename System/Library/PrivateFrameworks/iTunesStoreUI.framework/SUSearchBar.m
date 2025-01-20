@interface SUSearchBar
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)_setupCancelButtonWithAppearance:(id)a3;
- (void)removeFromSuperview;
@end

@implementation SUSearchBar

- (void)removeFromSuperview
{
  v3 = (void *)[(SUSearchBar *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4 = self;
    [v3 searchBarWillRemoveFromSuperview:self];
  }
  v5.receiver = self;
  v5.super_class = (Class)SUSearchBar;
  [(SUSearchBar *)&v5 removeFromSuperview];
}

- (void)_setupCancelButtonWithAppearance:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SUSearchBar;
  [(SUSearchBar *)&v3 _setupCancelButtonWithAppearance:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SUSearchBar;
  -[SUSearchBar sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 >= width) {
    double v4 = width;
  }
  result.height = v5;
  result.double width = v4;
  return result;
}

@end