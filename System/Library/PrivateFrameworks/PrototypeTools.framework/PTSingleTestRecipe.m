@interface PTSingleTestRecipe
+ (id)recipeWithTitle:(id)a3 action:(id)a4;
+ (id)recipeWithTitle:(id)a3 prepareBlock:(id)a4 action:(id)a5 cleanupBlock:(id)a6;
- (BOOL)_wantsEvent:(int64_t)a3;
- (id)action;
- (void)_handleEvent:(int64_t)a3;
- (void)invalidate;
- (void)setAction:(id)a3;
@end

@implementation PTSingleTestRecipe

+ (id)recipeWithTitle:(id)a3 action:(id)a4
{
  return (id)[a1 recipeWithTitle:a3 prepareBlock:0 action:a4 cleanupBlock:0];
}

+ (id)recipeWithTitle:(id)a3 prepareBlock:(id)a4 action:(id)a5 cleanupBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) _initWithTitle:v13 prepareBlock:v12 cleanupBlock:v10];

  [v14 setAction:v11];
  return v14;
}

- (BOOL)_wantsEvent:(int64_t)a3
{
  return a3 == 2;
}

- (void)_handleEvent:(int64_t)a3
{
  if (a3 == 2)
  {
    action = (void (**)(void))self->_action;
    if (action) {
      action[2]();
    }
  }
}

- (void)invalidate
{
  id action = self->_action;
  self->_id action = 0;

  v4.receiver = self;
  v4.super_class = (Class)PTSingleTestRecipe;
  [(PTTestRecipe *)&v4 invalidate];
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end