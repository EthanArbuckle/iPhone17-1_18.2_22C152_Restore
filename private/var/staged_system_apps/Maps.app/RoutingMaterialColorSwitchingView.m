@interface RoutingMaterialColorSwitchingView
- (RoutingMaterialColorSwitchingView)initWithLightMaterial:(int64_t)a3 darkColor:(id)a4;
- (UIView)darkView;
- (UIView)lightView;
- (void)_setDarkViewVisible:(BOOL)a3;
- (void)_setLightViewVisible:(BOOL)a3;
- (void)_updateForCurrentInterfaceStyle;
- (void)setDarkView:(id)a3;
- (void)setLightView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoutingMaterialColorSwitchingView

- (RoutingMaterialColorSwitchingView)initWithLightMaterial:(int64_t)a3 darkColor:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RoutingMaterialColorSwitchingView;
  v8 = -[RoutingMaterialColorSwitchingView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    v8->_lightMaterial = a3;
    objc_storeStrong((id *)&v8->_darkColor, a4);
    [(RoutingMaterialColorSwitchingView *)v9 _updateForCurrentInterfaceStyle];
  }

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RoutingMaterialColorSwitchingView;
  id v4 = a3;
  [(RoutingMaterialColorSwitchingView *)&v8 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  v6 = [(RoutingMaterialColorSwitchingView *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(RoutingMaterialColorSwitchingView *)self _updateForCurrentInterfaceStyle];
  }
}

- (void)_updateForCurrentInterfaceStyle
{
  v3 = [(RoutingMaterialColorSwitchingView *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  [(RoutingMaterialColorSwitchingView *)self _setLightViewVisible:v4 == (id)1];

  [(RoutingMaterialColorSwitchingView *)self _setDarkViewVisible:v4 == (id)2];
}

- (UIView)lightView
{
  lightView = self->_lightView;
  if (!lightView)
  {
    id v4 = objc_alloc((Class)UIVisualEffectView);
    id v5 = +[UIBlurEffect effectWithStyle:self->_lightMaterial];
    v6 = (UIView *)[v4 initWithEffect:v5];

    [(UIView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v6 setAllowsBlurring:0];
    id v7 = self->_lightView;
    self->_lightView = v6;

    lightView = self->_lightView;
  }

  return lightView;
}

- (void)_setLightViewVisible:(BOOL)a3
{
  if (a3)
  {
    [(UIView *)self->_darkView removeFromSuperview];
    id v4 = [(RoutingMaterialColorSwitchingView *)self lightView];
    [(RoutingMaterialColorSwitchingView *)self addSubview:v4];

    id v9 = [(RoutingMaterialColorSwitchingView *)self lightView];
    LODWORD(v5) = 1148846080;
    v6 = [v9 _maps_constraintsEqualToEdgesOfView:self priority:v5];
    id v7 = [v6 allConstraints];
    +[NSLayoutConstraint activateConstraints:v7];
  }
  else
  {
    lightView = self->_lightView;
    [(UIView *)lightView removeFromSuperview];
  }
}

- (UIView)darkView
{
  darkView = self->_darkView;
  if (!darkView)
  {
    id v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_darkView;
    self->_darkView = v4;

    [(UIView *)self->_darkView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_darkView setBackgroundColor:self->_darkColor];
    darkView = self->_darkView;
  }

  return darkView;
}

- (void)_setDarkViewVisible:(BOOL)a3
{
  if (a3)
  {
    [(UIView *)self->_lightView removeFromSuperview];
    id v4 = [(RoutingMaterialColorSwitchingView *)self darkView];
    [(RoutingMaterialColorSwitchingView *)self addSubview:v4];

    id v9 = [(RoutingMaterialColorSwitchingView *)self darkView];
    LODWORD(v5) = 1148846080;
    v6 = [v9 _maps_constraintsEqualToEdgesOfView:self priority:v5];
    id v7 = [v6 allConstraints];
    +[NSLayoutConstraint activateConstraints:v7];
  }
  else
  {
    darkView = self->_darkView;
    [(UIView *)darkView removeFromSuperview];
  }
}

- (void)setLightView:(id)a3
{
}

- (void)setDarkView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkView, 0);
  objc_storeStrong((id *)&self->_lightView, 0);

  objc_storeStrong((id *)&self->_darkColor, 0);
}

@end