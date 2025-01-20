@interface UIKeyboardDockItem
+ (id)_darkStyleGlyphColor;
+ (id)_standardGlyphColor;
- (BOOL)active;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (CGPoint)touchDownPoint;
- (NSString)identifier;
- (NSString)title;
- (UIAction)customAction;
- (UIImage)image;
- (UIKeyboardDockItem)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5;
- (UIKeyboardDockItemButton)button;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UITouch)lastTouchUp;
- (void)setActive:(BOOL)a3;
- (void)setButton:(id)a3;
- (void)setCustomAction:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLastTouchUp:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setTitle:(id)a3 image:(id)a4;
- (void)setTouchDownPoint:(CGPoint)a3;
@end

@implementation UIKeyboardDockItem

+ (id)_standardGlyphColor
{
  return +[UIColor colorWithRed:0.314 green:0.333 blue:0.36 alpha:1.0];
}

+ (id)_darkStyleGlyphColor
{
  return +[UIColor whiteColor];
}

- (UIKeyboardDockItem)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UIKeyboardDockItem;
  v12 = [(UIKeyboardDockItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_image, a4);
    objc_storeStrong((id *)&v13->_identifier, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIKeyboardDockItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(UIKeyboardDockItem *)self title];
    v8 = [(UIKeyboardDockItem *)v6 title];
    if ([v7 isEqualToString:v8])
    {
      id v9 = [(UIKeyboardDockItem *)self identifier];
      id v10 = [(UIKeyboardDockItem *)v6 identifier];
      char v11 = [v9 isEqualToString:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (UIKeyboardDockItemButton)button
{
  if (!self->_button)
  {
    v3 = +[UIButton buttonWithType:1];
    button = self->_button;
    self->_button = v3;

    v5 = [(UIButton *)self->_button imageView];
    [v5 setClipsToBounds:0];

    v6 = [(UIButton *)self->_button titleLabel];
    [v6 setContentMode:4];

    v7 = [off_1E52D39B8 systemFontOfSize:16.0];
    v8 = [(UIButton *)self->_button titleLabel];
    [v8 setFont:v7];

    if (qword_1EB25B2F8 != -1) {
      dispatch_once(&qword_1EB25B2F8, &__block_literal_global_353);
    }
    if (_MergedGlobals_13_0)
    {
      id v9 = +[UIColor systemPurpleColor];
      [(UIView *)self->_button setBackgroundColor:v9];

      id v10 = +[UIColor greenColor];
      char v11 = [(UIButton *)self->_button imageView];
      [v11 setBackgroundColor:v10];
    }
  }
  BOOL v12 = [(UIView *)self->_button _lightStyleRenderConfig];
  v13 = [(UIView *)self->_button _inheritedRenderConfig];
  int v14 = [v13 animatedBackground];

  if (v12)
  {
    if (v14)
    {
      objc_super v15 = +[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.6451];
      [(UIKeyboardDockItemButton *)self->_button setTintColor:v15];

      [(UIView *)self->_button setAlpha:0.8];
      v16 = (uint64_t *)MEMORY[0x1E4F3A2E0];
LABEL_11:
      uint64_t v20 = *v16;
      v21 = [(UIView *)self->_button layer];
      [v21 setCompositingFilter:v20];

      v18 = [(UIView *)self->_button layer];
      [v18 setAllowsGroupOpacity:1];
      goto LABEL_14;
    }
    v18 = +[UIKeyboardDockItem _standardGlyphColor];
  }
  else
  {
    v17 = +[UIKeyboardDockItem _darkStyleGlyphColor];
    v18 = v17;
    if (v14)
    {
      v19 = [v17 colorWithAlphaComponent:0.6451];
      [(UIKeyboardDockItemButton *)self->_button setTintColor:v19];

      [(UIView *)self->_button setAlpha:0.8];
      v16 = (uint64_t *)MEMORY[0x1E4F3A2E8];
      goto LABEL_11;
    }
  }
  [(UIKeyboardDockItemButton *)self->_button setTintColor:v18];
LABEL_14:

  v22 = [(UIKeyboardDockItem *)self identifier];
  [(UIKeyboardDockItemButton *)self->_button setIdentifier:v22];

  [(UIKeyboardDockItemButton *)self->_button setupDictationAnimationButtonIfNeeded];
  v23 = self->_button;
  return v23;
}

- (void)setTitle:(id)a3 image:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_image, a4);
    objc_storeStrong((id *)&self->_title, a3);
    v8 = [(UIKeyboardDockItem *)self button];
    [v8 setImage:v7 forState:0];

    id v9 = [(UIKeyboardDockItem *)self button];
    [v9 setTitle:0 forState:0];
  }
  else
  {
    id v10 = [(UIKeyboardDockItem *)self button];
    [v10 setTitle:v11 forState:0];

    id v9 = [(UIKeyboardDockItem *)self button];
    [v9 setImage:0 forState:0];
  }
}

- (BOOL)enabled
{
  return ![(UIView *)self->_button isHidden];
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)active
{
  return [(UIControl *)self->_button isEnabled];
}

- (void)setActive:(BOOL)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (UIAction)customAction
{
  return self->_customAction;
}

- (void)setCustomAction:(id)a3
{
}

- (UITouch)lastTouchUp
{
  return self->_lastTouchUp;
}

- (void)setLastTouchUp:(id)a3
{
}

- (void)setButton:(id)a3
{
}

- (CGPoint)touchDownPoint
{
  double x = self->_touchDownPoint.x;
  double y = self->_touchDownPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTouchDownPoint:(CGPoint)a3
{
  self->_touchDownPoint = a3;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_lastTouchUp, 0);
  objc_storeStrong((id *)&self->_customAction, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end