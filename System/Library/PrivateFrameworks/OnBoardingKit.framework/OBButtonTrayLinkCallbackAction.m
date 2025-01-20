@interface OBButtonTrayLinkCallbackAction
- (OBButtonTrayLinkCallbackAction)initWithCallback:(id)a3;
- (id)action;
- (void)performButtonTrayLinkAction;
- (void)setAction:(id)a3;
@end

@implementation OBButtonTrayLinkCallbackAction

- (OBButtonTrayLinkCallbackAction)initWithCallback:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OBButtonTrayLinkCallbackAction;
  v5 = [(OBButtonTrayLinkCallbackAction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x19F392650](v4);
    id action = v5->_action;
    v5->_id action = (id)v6;
  }
  return v5;
}

- (void)performButtonTrayLinkAction
{
  v3 = [(OBButtonTrayLinkCallbackAction *)self action];

  if (v3)
  {
    id v4 = [(OBButtonTrayLinkCallbackAction *)self action];
    v4[2]();
  }
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