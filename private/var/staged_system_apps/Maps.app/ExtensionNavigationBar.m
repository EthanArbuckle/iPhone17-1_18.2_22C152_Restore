@interface ExtensionNavigationBar
- (BOOL)supressTransition;
- (ExtensionNavigationBar)initWithFrame:(CGRect)a3;
- (MKViewWithHairline)hairlineView;
- (void)layoutSubviews;
- (void)setHairlineView:(id)a3;
- (void)setSupressTransition:(BOOL)a3;
@end

@implementation ExtensionNavigationBar

- (ExtensionNavigationBar)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ExtensionNavigationBar;
  v3 = -[ExtensionNavigationBar initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init((Class)MKViewWithHairline);
    [(ExtensionNavigationBar *)v3 setHairlineView:v4];

    v5 = [(ExtensionNavigationBar *)v3 hairlineView];
    [v5 setUserInteractionEnabled:0];

    v6 = [(ExtensionNavigationBar *)v3 theme];
    v7 = [v6 hairlineColor];
    v8 = [(ExtensionNavigationBar *)v3 hairlineView];
    [v8 setHairlineColor:v7];

    v9 = [(ExtensionNavigationBar *)v3 hairlineView];
    [(ExtensionNavigationBar *)v3 addSubview:v9];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)ExtensionNavigationBar;
  [(ExtensionNavigationBar *)&v13 layoutSubviews];
  [(ExtensionNavigationBar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(ExtensionNavigationBar *)self hairlineView];
  [v11 setFrame:v4, v6, v8, v10];

  v12 = [(ExtensionNavigationBar *)self hairlineView];
  [(ExtensionNavigationBar *)self bringSubviewToFront:v12];
}

- (MKViewWithHairline)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
}

- (BOOL)supressTransition
{
  return self->_supressTransition;
}

- (void)setSupressTransition:(BOOL)a3
{
  self->_supressTransition = a3;
}

- (void).cxx_destruct
{
}

@end