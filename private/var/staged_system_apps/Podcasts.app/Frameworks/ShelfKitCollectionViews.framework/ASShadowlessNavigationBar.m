@interface ASShadowlessNavigationBar
- (ASShadowlessNavigationBar)init;
- (BOOL)hidesBackButton;
- (void)pushNavigationItem:(id)a3 animated:(BOOL)a4;
- (void)setHidesBackButton:(BOOL)a3;
@end

@implementation ASShadowlessNavigationBar

- (ASShadowlessNavigationBar)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASShadowlessNavigationBar;
  v2 = [(ASShadowlessNavigationBar *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(ASShadowlessNavigationBar *)v2 standardAppearance];
    [v4 setShadowColor:0];
    [(ASShadowlessNavigationBar *)v3 setStandardAppearance:v4];
  }
  return v3;
}

- (void)pushNavigationItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(ASShadowlessNavigationBar *)self _setTitleOpacity:1.0];
  v7.receiver = self;
  v7.super_class = (Class)ASShadowlessNavigationBar;
  [(ASShadowlessNavigationBar *)&v7 pushNavigationItem:v6 animated:v4];
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (void)setHidesBackButton:(BOOL)a3
{
  self->_hidesBackButton = a3;
}

@end