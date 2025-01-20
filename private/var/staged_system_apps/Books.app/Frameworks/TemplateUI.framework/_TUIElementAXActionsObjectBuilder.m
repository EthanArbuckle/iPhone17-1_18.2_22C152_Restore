@interface _TUIElementAXActionsObjectBuilder
- (id)finalizeAXActions;
- (void)addAXAction:(id)a3;
@end

@implementation _TUIElementAXActionsObjectBuilder

- (void)addAXAction:(id)a3
{
  id v4 = a3;
  actions = self->_actions;
  id v8 = v4;
  if (!actions)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_actions;
    self->_actions = v6;

    id v4 = v8;
    actions = self->_actions;
  }
  [(NSMutableArray *)actions addObject:v4];
}

- (id)finalizeAXActions
{
  return self->_actions;
}

- (void).cxx_destruct
{
}

@end