@interface _UISceneLayerTargetWithContext
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesLayer:(id)a3;
- (NSString)description;
- (_UISceneLayerTargetWithContext)initWithContext:(id)a3 equalityType:(unint64_t)a4 matchingBlock:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation _UISceneLayerTargetWithContext

- (_UISceneLayerTargetWithContext)initWithContext:(id)a3 equalityType:(unint64_t)a4 matchingBlock:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_UISceneLayerTargetWithContext.m", 25, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"_UISceneLayerTargetWithContext.m", 26, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)_UISceneLayerTargetWithContext;
  v13 = [(_UISceneLayerTargetWithContext *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_context, a3);
    v14->_equalityType = a4;
    v15 = _Block_copy(v12);
    id block = v14->_block;
    v14->_id block = v15;
  }
  return v14;
}

- (unint64_t)hash
{
  p_id context = &self->_context;
  id context = self->_context;
  if (p_context[1]) {
    return [context hash];
  }
  else {
    return 7 * (void)context;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UISceneLayerTargetWithContext *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id context = self->_context;
      id v6 = v4->_context;
      if (self->_equalityType == 1) {
        char v7 = [context isEqual:v6];
      }
      else {
        char v7 = context == v6;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)matchesLayer:(id)a3
{
  return (*((uint64_t (**)(id, id, id))self->_block + 2))(self->_block, self->_context, a3);
}

- (NSString)description
{
  return (NSString *)[(_UISceneLayerTargetWithContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UISceneLayerTargetWithContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UISceneLayerTargetWithContext *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(_UISceneLayerTargetWithContext *)self succinctDescriptionBuilder];
  v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  char v7 = NSStringFromClass(v6);
  v8 = [v5 stringWithFormat:@"<%@:%p>", v7, self->_context];
  id v9 = (id)[v4 appendObject:v8 withName:@"context"];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_context, 0);
}

@end