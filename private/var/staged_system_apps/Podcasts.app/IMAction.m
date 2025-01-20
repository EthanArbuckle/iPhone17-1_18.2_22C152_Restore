@interface IMAction
- (BOOL)isAllowedForController:(id)a3;
- (BOOL)isDestructive;
- (IMAction)initWithTitle:(id)a3 icon:(id)a4;
- (IMActionController)controller;
- (NSString)title;
- (UIImage)icon;
- (id)actionBlock;
- (id)button;
- (id)buttonBlock;
- (id)buttonItem;
- (id)buttonItemBlock;
- (id)conditionBlock;
- (void)buttonTapped:(id)a3;
- (void)setActionBlock:(id)a3;
- (void)setButtonBlock:(id)a3;
- (void)setButtonItemBlock:(id)a3;
- (void)setConditionBlock:(id)a3;
- (void)setController:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation IMAction

- (IMAction)initWithTitle:(id)a3 icon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMAction;
  v9 = [(IMAction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_icon, a4);
  }

  return v10;
}

- (id)button
{
  buttonBlock = (void (**)(id, SEL))self->_buttonBlock;
  if (buttonBlock)
  {
    v4 = buttonBlock[2](buttonBlock, a2);
  }
  else
  {
    v5 = +[UIButton buttonWithType:0];
    v6 = [(IMAction *)self icon];
    [v5 setImage:v6 forState:0];

    id v7 = [(IMAction *)self title];
    [v5 setTitle:v7 forState:0];

    v4 = 0;
  }
  [v4 addTarget:self action:"buttonTapped:" forControlEvents:64];

  return v4;
}

- (id)buttonItem
{
  buttonItemBlock = (void (**)(id, SEL))self->_buttonItemBlock;
  if (buttonItemBlock)
  {
    buttonItemBlock[2](buttonItemBlock, a2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 setTarget:self];
    [v4 setAction:"buttonTapped:"];
  }
  else
  {
    id v5 = objc_alloc((Class)UIBarButtonItem);
    v6 = [(IMAction *)self button];
    id v4 = [v5 initWithCustomView:v6];
  }

  return v4;
}

- (BOOL)isAllowedForController:(id)a3
{
  conditionBlock = (uint64_t (**)(id, id))self->_conditionBlock;
  if (conditionBlock) {
    LOBYTE(conditionBlock) = conditionBlock[2](conditionBlock, a3);
  }
  return (char)conditionBlock;
}

- (void)buttonTapped:(id)a3
{
  actionBlock = (void (**)(id, id, id))self->_actionBlock;
  if (actionBlock)
  {
    p_controller = &self->_controller;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_controller);
    actionBlock[2](actionBlock, WeakRetained, v5);
  }
}

- (IMActionController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (IMActionController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (id)conditionBlock
{
  return self->_conditionBlock;
}

- (void)setConditionBlock:(id)a3
{
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (id)buttonBlock
{
  return self->_buttonBlock;
}

- (void)setButtonBlock:(id)a3
{
}

- (id)buttonItemBlock
{
  return self->_buttonItemBlock;
}

- (void)setButtonItemBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_buttonItemBlock, 0);
  objc_storeStrong(&self->_buttonBlock, 0);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong(&self->_conditionBlock, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end