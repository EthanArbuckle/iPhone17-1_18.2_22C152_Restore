@interface _UITabBarAccessoryView
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGSize)preferredSize;
- (UIView)contentView;
- (_UITabBarAccessoryView)init;
- (_UITabBarAccessoryView)initWithFrame:(CGRect)a3;
- (void)commonInit;
- (void)setPreferredSize:(CGSize)a3;
@end

@implementation _UITabBarAccessoryView

- (_UITabBarAccessoryView)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UITabBarAccessoryView;
  v2 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, 0.0, 0.0, 200.0, 68.0);
  v3 = v2;
  if (v2) {
    [(_UITabBarAccessoryView *)v2 commonInit];
  }
  return v3;
}

- (_UITabBarAccessoryView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UITabBarAccessoryView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_UITabBarAccessoryView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = objc_alloc_init(UIView);
  contentView = self->_contentView;
  self->_contentView = v3;

  [(UIView *)self bounds];
  -[UIView setFrame:](self->_contentView, "setFrame:");
  [(UIView *)self->_contentView setAutoresizingMask:18];
  objc_super v5 = self->_contentView;
  [(UIView *)self addSubview:v5];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITabBarAccessoryView;
  if ([(UIView *)&v9 shouldUpdateFocusInContext:v4])
  {
    objc_super v5 = [v4 nextFocusedView];
    if ([v5 isDescendantOfView:self])
    {
      if ([v4 focusHeading] == 4)
      {
      }
      else
      {
        uint64_t v7 = [v4 focusHeading];

        if (v7 != 8)
        {
          char v6 = 1;
          goto LABEL_10;
        }
      }
      objc_super v5 = [v4 _focusMovement];
      char v6 = [v5 _isInitialMovement];
    }
    else
    {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }
LABEL_10:

  return v6;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (void).cxx_destruct
{
}

@end