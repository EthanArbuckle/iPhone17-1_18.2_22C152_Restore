@interface ODDLayoutNode
- (id)description;
- (id)variableList;
- (void)setVariableList:(id)a3;
@end

@implementation ODDLayoutNode

- (id)variableList
{
  return self->mVariableList;
}

- (void)setVariableList:(id)a3
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)ODDLayoutNode;
  v2 = [(ODDLayoutObject *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end