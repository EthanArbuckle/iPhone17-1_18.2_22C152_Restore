@interface SUUIIPadSearchSeparatorView
- (SUUIIPadSearchSeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation SUUIIPadSearchSeparatorView

- (SUUIIPadSearchSeparatorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIIPadSearchSeparatorView;
  v3 = -[SUUIIPadSearchSeparatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] colorWithWhite:0.8 alpha:1.0];
    [(SUUIIPadSearchSeparatorView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

@end