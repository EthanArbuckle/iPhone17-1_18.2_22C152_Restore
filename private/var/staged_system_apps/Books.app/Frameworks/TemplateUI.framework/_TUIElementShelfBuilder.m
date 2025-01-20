@interface _TUIElementShelfBuilder
- (NSString)role;
- (void)addModel:(id)a3;
- (void)configureWithChildNode:(id)a3 attributes:(id)a4;
- (void)setRole:(id)a3;
@end

@implementation _TUIElementShelfBuilder

- (void)configureWithChildNode:(id)a3 attributes:(id)a4
{
  v5 = [a4 stringForAttribute:176 node:a3.var0];
  role = self->_role;
  self->_role = v5;
}

- (void)addModel:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[TUISingleModelContainerWithRole alloc] initWithRole:self->_role];
    id v8 = v4;
    v6 = +[NSArray arrayWithObjects:&v8 count:1];
    [(TUISingleModelContainer *)v5 updateModelChildren:v6];

    v7.receiver = self;
    v7.super_class = (Class)_TUIElementShelfBuilder;
    [(TUIBoxBuilder *)&v7 addModel:v5];
  }
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);

  objc_storeStrong((id *)&self->_models, 0);
}

@end