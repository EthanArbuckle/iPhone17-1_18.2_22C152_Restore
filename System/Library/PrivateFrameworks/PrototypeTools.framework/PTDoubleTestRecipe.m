@interface PTDoubleTestRecipe
+ (id)recipeWithTitle:(id)a3 increaseAction:(id)a4 decreaseAction:(id)a5;
+ (id)recipeWithTitle:(id)a3 prepareBlock:(id)a4 increaseAction:(id)a5 decreaseAction:(id)a6 cleanupBlock:(id)a7;
- (BOOL)_wantsEvent:(int64_t)a3;
- (id)decreaseAction;
- (id)increaseAction;
- (void)_handleEvent:(int64_t)a3;
- (void)invalidate;
- (void)setDecreaseAction:(id)a3;
- (void)setIncreaseAction:(id)a3;
@end

@implementation PTDoubleTestRecipe

+ (id)recipeWithTitle:(id)a3 increaseAction:(id)a4 decreaseAction:(id)a5
{
  return (id)[a1 recipeWithTitle:a3 prepareBlock:0 increaseAction:a4 decreaseAction:a5 cleanupBlock:0];
}

+ (id)recipeWithTitle:(id)a3 prepareBlock:(id)a4 increaseAction:(id)a5 decreaseAction:(id)a6 cleanupBlock:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) _initWithTitle:v16 prepareBlock:v15 cleanupBlock:v12];

  [v17 setIncreaseAction:v14];
  [v17 setDecreaseAction:v13];

  return v17;
}

- (BOOL)_wantsEvent:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (void)_handleEvent:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = 56;
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    uint64_t v3 = 48;
  }
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa + v3);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

- (void)invalidate
{
  id increaseAction = self->_increaseAction;
  self->_id increaseAction = 0;

  id decreaseAction = self->_decreaseAction;
  self->_id decreaseAction = 0;

  v5.receiver = self;
  v5.super_class = (Class)PTDoubleTestRecipe;
  [(PTTestRecipe *)&v5 invalidate];
}

- (id)increaseAction
{
  return self->_increaseAction;
}

- (void)setIncreaseAction:(id)a3
{
}

- (id)decreaseAction
{
  return self->_decreaseAction;
}

- (void)setDecreaseAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_decreaseAction, 0);
  objc_storeStrong(&self->_increaseAction, 0);
}

@end