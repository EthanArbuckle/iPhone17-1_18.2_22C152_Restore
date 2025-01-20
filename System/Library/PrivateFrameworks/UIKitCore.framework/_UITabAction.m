@interface _UITabAction
- (BOOL)_isAction;
- (_UITabAction)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5 handler:(id)a6;
- (id)_actionHandler;
- (int64_t)_tabPlacement;
- (int64_t)preferredPlacement;
- (void)_performAction;
@end

@implementation _UITabAction

- (_UITabAction)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5 handler:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)_UITabAction;
  v11 = [(UITab *)&v15 initWithTitle:a4 image:a5 identifier:a3 viewControllerProvider:0];
  if (v11)
  {
    v12 = _Block_copy(v10);
    id actionHandler = v11->_actionHandler;
    v11->_id actionHandler = v12;
  }
  return v11;
}

- (BOOL)_isAction
{
  return 1;
}

- (int64_t)preferredPlacement
{
  return 6;
}

- (int64_t)_tabPlacement
{
  return 6;
}

- (void)_performAction
{
  id actionHandler = (void (**)(id, _UITabAction *))self->_actionHandler;
  if (actionHandler) {
    actionHandler[2](actionHandler, self);
  }
}

- (id)_actionHandler
{
  return self->_actionHandler;
}

- (void).cxx_destruct
{
}

@end