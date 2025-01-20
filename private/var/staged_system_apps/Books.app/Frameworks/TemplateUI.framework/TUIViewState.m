@interface TUIViewState
- (NSDictionary)viewStatesByIdentifier;
- (TUIViewState)init;
- (TUIViewState)initWithDictionary:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)viewStateForIdentifier:(id)a3;
- (void)setViewStatesByIdentifier:(id)a3;
@end

@implementation TUIViewState

- (TUIViewState)init
{
  return [(TUIViewState *)self initWithDictionary:0];
}

- (TUIViewState)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIViewState;
  v6 = [(TUIViewState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewStatesByIdentifier, a3);
  }

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [TUIMutableViewState alloc];
  id v5 = [(TUIViewState *)self viewStatesByIdentifier];
  id v6 = [v5 mutableCopy];
  v7 = [(TUIViewState *)v4 initWithDictionary:v6];

  return v7;
}

- (id)viewStateForIdentifier:(id)a3
{
  if (a3)
  {
    v4 = -[NSDictionary objectForKeyedSubscript:](self->_viewStatesByIdentifier, "objectForKeyedSubscript:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSDictionary)viewStatesByIdentifier
{
  return self->_viewStatesByIdentifier;
}

- (void)setViewStatesByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end