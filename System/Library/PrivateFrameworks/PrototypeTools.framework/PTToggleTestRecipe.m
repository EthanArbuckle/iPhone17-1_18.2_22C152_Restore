@interface PTToggleTestRecipe
+ (id)recipeWithTitle:(id)a3 prepareBlock:(id)a4 toggleAction:(id)a5 cleanupBlock:(id)a6;
+ (id)recipeWithTitle:(id)a3 toggleAction:(id)a4;
- (BOOL)_wantsEvent:(int64_t)a3;
- (BOOL)isOn;
- (id)toggleAction;
- (void)_activate;
- (void)_deactivate;
- (void)_handleEvent:(int64_t)a3;
- (void)invalidate;
- (void)setToggleAction:(id)a3;
@end

@implementation PTToggleTestRecipe

+ (id)recipeWithTitle:(id)a3 toggleAction:(id)a4
{
  return (id)[a1 recipeWithTitle:a3 prepareBlock:0 toggleAction:a4 cleanupBlock:0];
}

+ (id)recipeWithTitle:(id)a3 prepareBlock:(id)a4 toggleAction:(id)a5 cleanupBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) _initWithTitle:v13 prepareBlock:v12 cleanupBlock:v10];

  [v14 setToggleAction:v11];

  return v14;
}

- (BOOL)_wantsEvent:(int64_t)a3
{
  return a3 == 2;
}

- (void)_activate
{
  self->_on = 0;
  v2.receiver = self;
  v2.super_class = (Class)PTToggleTestRecipe;
  [(PTTestRecipe *)&v2 _activate];
}

- (void)_deactivate
{
  self->_on = 0;
  v2.receiver = self;
  v2.super_class = (Class)PTToggleTestRecipe;
  [(PTTestRecipe *)&v2 _deactivate];
}

- (void)_handleEvent:(int64_t)a3
{
  if (a3 == 2)
  {
    BOOL on = self->_on;
    self->_BOOL on = !on;
    toggleActiBOOL on = (void (**)(id, BOOL))self->_toggleAction;
    if (toggleAction) {
      toggleAction[2](toggleAction, !on);
    }
  }
}

- (void)invalidate
{
  toggleActiBOOL on = self->_toggleAction;
  self->_toggleActiBOOL on = 0;

  v4.receiver = self;
  v4.super_class = (Class)PTToggleTestRecipe;
  [(PTTestRecipe *)&v4 invalidate];
}

- (id)toggleAction
{
  return self->_toggleAction;
}

- (void)setToggleAction:(id)a3
{
}

- (BOOL)isOn
{
  return self->_on;
}

- (void).cxx_destruct
{
}

@end