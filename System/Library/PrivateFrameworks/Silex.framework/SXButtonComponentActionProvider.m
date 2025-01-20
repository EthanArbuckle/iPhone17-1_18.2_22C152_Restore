@interface SXButtonComponentActionProvider
- (SXAction)action;
- (SXButtonComponentActionProvider)initWithAction:(id)a3;
@end

@implementation SXButtonComponentActionProvider

- (SXButtonComponentActionProvider)initWithAction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXButtonComponentActionProvider;
  v6 = [(SXButtonComponentActionProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_action, a3);
  }

  return v7;
}

- (SXAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
}

@end