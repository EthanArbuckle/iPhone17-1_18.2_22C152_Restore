@interface CarFocusContainerGuide
+ (id)focusContainerGuideInstalledInView:(id)a3;
- (CarFocusContainerGuide)init;
- (NSArray)activationConstraints;
- (UIView)debugView;
- (void)setActivationConstraints:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation CarFocusContainerGuide

- (CarFocusContainerGuide)init
{
  v14.receiver = self;
  v14.super_class = (Class)CarFocusContainerGuide;
  v2 = [(CarFocusContainerGuide *)&v14 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    v4 = +[NSUserDefaults standardUserDefaults];
    unsigned int v5 = [v4 BOOLForKey:@"__internal_CarVisualizeFocusGuidesDebug"];

    if (v5)
    {
      v6 = [[CarFocusGuideDebugView alloc] initWithDirection:0];
      debugView = v2->_debugView;
      v2->_debugView = (UIView *)v6;

      [(UIView *)v2->_debugView setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v8) = 1148846080;
      v9 = -[UIView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](v2->_debugView, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v2, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v8);
      v10 = [v9 allConstraints];
      [v3 addObjectsFromArray:v10];
    }
    v11 = (NSArray *)[v3 copy];
    activationConstraints = v2->_activationConstraints;
    v2->_activationConstraints = v11;
  }
  return v2;
}

+ (id)focusContainerGuideInstalledInView:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CarFocusContainerGuide);
  unsigned int v5 = +[NSMutableArray array];
  LODWORD(v6) = 1148846080;
  v7 = [(CarFocusContainerGuide *)v4 _maps_constraintsEqualToEdgesOfView:v3 priority:v6];

  double v8 = [v7 allConstraints];
  [v5 addObjectsFromArray:v8];

  v9 = [(CarFocusContainerGuide *)v4 activationConstraints];
  v10 = [v9 arrayByAddingObjectsFromArray:v5];
  [(CarFocusContainerGuide *)v4 setActivationConstraints:v10];

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarFocusContainerGuide;
  -[CarFocusContainerGuide setEnabled:](&v6, "setEnabled:");
  unsigned int v5 = [(CarFocusContainerGuide *)self debugView];
  [v5 setUserInteractionEnabled:v3];
}

- (UIView)debugView
{
  return self->_debugView;
}

- (NSArray)activationConstraints
{
  return self->_activationConstraints;
}

- (void)setActivationConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationConstraints, 0);

  objc_storeStrong((id *)&self->_debugView, 0);
}

@end