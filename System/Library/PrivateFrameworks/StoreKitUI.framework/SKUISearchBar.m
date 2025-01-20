@interface SKUISearchBar
- (BOOL)showsCancelButton;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUISearchBar)init;
- (double)intrinsicWidth;
- (void)setIntrinsicWidth:(double)a3;
@end

@implementation SKUISearchBar

- (SKUISearchBar)init
{
  v8.receiver = self;
  v8.super_class = (Class)SKUISearchBar;
  v2 = [(SKUISearchBar *)&v8 init];
  if (v2)
  {
    uint64_t v3 = storeSemanticContentAttribute();
    if (storeShouldReverseLayoutDirection()) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 0;
    }
    [(SKUISearchBar *)v2 setSemanticContentAttribute:v3];
    v5 = [(SKUISearchBar *)v2 searchField];
    [v5 setSemanticContentAttribute:v3];

    v6 = [(SKUISearchBar *)v2 searchField];
    [v6 setTextAlignment:v4];
  }
  return v2;
}

- (BOOL)showsCancelButton
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SKUISearchBar;
  -[SKUISearchBar sizeThatFits:](&v13, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(SKUISearchBar *)self intrinsicWidth];
  if (v8 > 0.0)
  {
    [(SKUISearchBar *)self intrinsicWidth];
    if (v9 < v5)
    {
      [(SKUISearchBar *)self intrinsicWidth];
      double v5 = v10;
    }
  }
  double v11 = v5;
  double v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)intrinsicWidth
{
  return self->_intrinsicWidth;
}

- (void)setIntrinsicWidth:(double)a3
{
  self->_intrinsicWidth = a3;
}

@end