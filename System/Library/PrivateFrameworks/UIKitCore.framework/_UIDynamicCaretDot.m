@interface _UIDynamicCaretDot
- (_UIDynamicCaretDot)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation _UIDynamicCaretDot

- (_UIDynamicCaretDot)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDynamicCaretDot;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor whiteColor];
    [(UIView *)v3 setBackgroundColor:v4];

    [(UIView *)v3 setOpaque:0];
    [(UIView *)v3 setUserInteractionEnabled:0];
    v5 = [(UIView *)v3 layer];
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.5);
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)_UIDynamicCaretDot;
  -[UIView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [(UIView *)self layer];
  [v5 setCornerRadius:width * 0.5];
}

@end