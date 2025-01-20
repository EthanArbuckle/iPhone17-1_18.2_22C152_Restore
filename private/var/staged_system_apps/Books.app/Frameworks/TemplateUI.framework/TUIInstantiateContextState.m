@interface TUIInstantiateContextState
- (NSDictionary)viewStateMapping;
- (TUIInstantiateContextState)initWithViewStateMapping:(id)a3;
@end

@implementation TUIInstantiateContextState

- (TUIInstantiateContextState)initWithViewStateMapping:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIInstantiateContextState;
  v5 = [(TUIInstantiateContextState *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    viewStateMapping = v5->_viewStateMapping;
    v5->_viewStateMapping = v6;
  }
  return v5;
}

- (NSDictionary)viewStateMapping
{
  return self->_viewStateMapping;
}

- (void).cxx_destruct
{
}

@end