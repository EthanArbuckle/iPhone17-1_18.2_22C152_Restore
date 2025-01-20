@interface TSKToolbarTitleView
- (NSString)title;
- (UIColor)titleColor;
- (void)dealloc;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
@end

@implementation TSKToolbarTitleView

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKToolbarTitleView;
  [(TSKToolbarTitleView *)&v3 dealloc];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

@end