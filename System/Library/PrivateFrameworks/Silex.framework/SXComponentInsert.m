@interface SXComponentInsert
- (SXComponent)component;
- (SXComponentInsert)initWithComponent:(id)a3 componentLayout:(id)a4;
- (SXComponentLayout)componentLayout;
- (id)description;
@end

@implementation SXComponentInsert

- (SXComponentInsert)initWithComponent:(id)a3 componentLayout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXComponentInsert;
  v9 = [(SXComponentInsert *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_component, a3);
    objc_storeStrong((id *)&v10->_componentLayout, a4);
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = [(SXComponentInsert *)self component];
  [v3 appendFormat:@"component: %@", v4];

  [v3 appendString:@">"];
  return v3;
}

- (SXComponent)component
{
  return self->_component;
}

- (SXComponentLayout)componentLayout
{
  return self->_componentLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentLayout, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end