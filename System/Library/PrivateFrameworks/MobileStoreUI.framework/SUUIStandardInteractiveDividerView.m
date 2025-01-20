@interface SUUIStandardInteractiveDividerView
+ (double)defaultWidth;
- (SUUIStandardInteractiveDividerView)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation SUUIStandardInteractiveDividerView

- (SUUIStandardInteractiveDividerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIStandardInteractiveDividerView;
  v3 = -[SUUIStandardInteractiveDividerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SUUIStandardInteractiveDividerView *)v3 tintColor];
    [(SUUIStandardInteractiveDividerView *)v4 setBackgroundColor:v5];
  }
  return v4;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIStandardInteractiveDividerView;
  [(SUUIStandardInteractiveDividerView *)&v4 tintColorDidChange];
  v3 = [(SUUIStandardInteractiveDividerView *)self tintColor];
  [(SUUIStandardInteractiveDividerView *)self setBackgroundColor:v3];
}

+ (double)defaultWidth
{
  return 1.0;
}

@end