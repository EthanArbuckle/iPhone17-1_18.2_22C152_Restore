@interface ChildItemCatalystButton
+ (CGColor)extraShadowLayerBackgroundColorWithDarkMode:(BOOL)a3 isbuttonEnabled:(BOOL)a4;
+ (UIEdgeInsets)contentEdgeInsets;
+ (UIFont)buttonTitleFont;
+ (id)childItemCatalystButton;
+ (id)titleFont;
- (CGSize)sizeThatFits:(CGSize)a3;
- (ChildItemButtonDelegate)delegate;
- (GEOMapItemChildItem)childItem;
- (void)setChildItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3 tapHandler:(id)a4;
@end

@implementation ChildItemCatalystButton

+ (id)childItemCatalystButton
{
  v2 = +[ChildItemCatalystButton buttonWithType:1];
  [(id)objc_opt_class() contentEdgeInsets];
  [v2 setContentEdgeInsets:];
  v3 = [v2 titleLabel];
  [v3 setLineBreakMode:0];

  return v2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)ChildItemCatalystButton;
  -[ChildItemCatalystButton sizeThatFits:](&v6, "sizeThatFits:", a3.width, a3.height);
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

+ (UIEdgeInsets)contentEdgeInsets
{
  double v2 = 5.0;
  double v3 = 10.0;
  double v4 = 7.0;
  double v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (UIFont)buttonTitleFont
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ChildItemCatalystButton;
  double v2 = objc_msgSend(objc_msgSendSuper2(&v4, "class"), "titleFont");

  return (UIFont *)v2;
}

- (void)setChildItem:(id)a3
{
  double v5 = (GEOMapItemChildItem *)a3;
  childItem = v5;
  if (self->_childItem != v5)
  {
    objc_storeStrong((id *)&self->_childItem, a3);
    childItem = self->_childItem;
  }
  v7 = +[ChildItemButton buttonTitleWithChildItem:childItem];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007F33B4;
  v8[3] = &unk_1012E6708;
  objc_copyWeak(&v9, &location);
  [(ChildItemCatalystButton *)self setTitle:v7 tapHandler:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setTitle:(id)a3 tapHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)_MKPlaceActionButtonController);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1007F3530;
  v12[3] = &unk_1012F9818;
  id v13 = v6;
  id v9 = v6;
  v10 = (_MKPlaceActionButtonController *)[v8 initWithTitle:v7 subTitle:0 selectedBlock:v12];

  buttonController = self->_buttonController;
  self->_buttonController = v10;

  [(ChildItemCatalystButton *)self setButtonController:self->_buttonController];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    id v6 = obj;
  }
}

+ (id)titleFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody];
}

+ (CGColor)extraShadowLayerBackgroundColorWithDarkMode:(BOOL)a3 isbuttonEnabled:(BOOL)a4
{
  id v4 = +[UIColor clearColor];
  double v5 = (CGColor *)[v4 CGColor];

  return v5;
}

- (ChildItemButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ChildItemButtonDelegate *)WeakRetained;
}

- (GEOMapItemChildItem)childItem
{
  return self->_childItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childItem, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_buttonController, 0);
}

@end