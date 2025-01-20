@interface UIInterfaceActionVisualStyleViewState
- (BOOL)_stateEqualToVisualStyleViewState:(id)a3;
- (BOOL)isEqual:(id)a3;
- (UIColor)tintColor;
- (UIInterfaceActionVisualStyleViewState)init;
- (UIInterfaceActionVisualStyleViewState)initWithPropertiesFromTopLevelView:(id)a3;
- (UIScreen)screen;
- (UITraitCollection)traitCollection;
- (id)copyWithScreen:(id)a3;
- (id)copyWithTraitCollection:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_collectStateFromScreen:(id)a3;
- (void)_collectStateFromView:(id)a3;
- (void)_collectStateFromVisualStyleViewState:(id)a3;
@end

@implementation UIInterfaceActionVisualStyleViewState

- (UIInterfaceActionVisualStyleViewState)init
{
  return [(UIInterfaceActionVisualStyleViewState *)self initWithPropertiesFromTopLevelView:0];
}

- (UIInterfaceActionVisualStyleViewState)initWithPropertiesFromTopLevelView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIInterfaceActionVisualStyleViewState;
  v5 = [(UIInterfaceActionVisualStyleViewState *)&v9 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      [(UIInterfaceActionVisualStyleViewState *)v5 _collectStateFromView:v4];
    }
    else
    {
      v7 = +[UIScreen mainScreen];
      [(UIInterfaceActionVisualStyleViewState *)v6 _collectStateFromScreen:v7];
    }
  }

  return v6;
}

- (id)copyWithTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(UIInterfaceActionVisualStyleViewState *)self copy];
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (id)copyWithScreen:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(UIInterfaceActionVisualStyleViewState *)self copy];
  v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)UIInterfaceActionVisualStyleViewState;
  id v4 = [(UIInterfaceActionVisualStyleViewState *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ traitCollection = %@, screen = %@", v4, self->_traitCollection, self->_screen];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 _collectStateFromVisualStyleViewState:self];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(UIInterfaceActionVisualStyleViewState *)self _stateEqualToVisualStyleViewState:v4];

  return v5;
}

- (void)_collectStateFromView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 window];
  v6 = [v5 screen];
  objc_super v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v8 = +[UIScreen mainScreen];
  }
  screen = self->_screen;
  self->_screen = v8;

  v10 = [v4 traitCollection];
  traitCollection = self->_traitCollection;
  self->_traitCollection = v10;

  v12 = [v4 tintColor];

  tintColor = self->_tintColor;
  self->_tintColor = v12;
}

- (void)_collectStateFromScreen:(id)a3
{
  id v4 = +[UIScreen mainScreen];
  screen = self->_screen;
  self->_screen = v4;

  v6 = [(UIScreen *)self->_screen traitCollection];
  traitCollection = self->_traitCollection;
  self->_traitCollection = v6;

  v8 = +[UIColor systemBlueColor];
  tintColor = self->_tintColor;
  self->_tintColor = v8;
}

- (void)_collectStateFromVisualStyleViewState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 screen];
  screen = self->_screen;
  self->_screen = v5;

  objc_super v7 = [v4 traitCollection];
  traitCollection = self->_traitCollection;
  self->_traitCollection = v7;

  objc_super v9 = [v4 tintColor];

  tintColor = self->_tintColor;
  self->_tintColor = v9;
}

- (BOOL)_stateEqualToVisualStyleViewState:(id)a3
{
  id v4 = a3;
  screen = self->_screen;
  v6 = [v4 screen];
  if ([(UIScreen *)screen isEqual:v6])
  {
    traitCollection = self->_traitCollection;
    v8 = [v4 traitCollection];
    if ([(UITraitCollection *)traitCollection isEqual:v8])
    {
      tintColor = self->_tintColor;
      v10 = [v4 tintColor];
      BOOL v11 = [(UIColor *)tintColor isEqual:v10];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end