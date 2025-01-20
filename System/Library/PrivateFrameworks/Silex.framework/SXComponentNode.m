@interface SXComponentNode
- (BOOL)isEqual:(id)a3;
- (id)dependencies;
- (id)description;
- (uint64_t)addComponentDependency:(uint64_t)result;
- (uint64_t)hasDependencyToComponentIdentifier:(uint64_t)a3 attribute:;
- (unint64_t)hash;
- (void)initWithComponentIdentifier:(uint64_t)a3 andAttribute:;
@end

@implementation SXComponentNode

- (void)initWithComponentIdentifier:(uint64_t)a3 andAttribute:
{
  id v6 = a2;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)SXComponentNode;
    id v7 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[2] = a3;
      uint64_t v8 = [MEMORY[0x263EFF9C0] set];
      v9 = (void *)a1[3];
      a1[3] = v8;

      uint64_t v10 = [MEMORY[0x263EFF9C0] set];
      v11 = (void *)a1[4];
      a1[4] = v10;

      uint64_t v12 = [MEMORY[0x263EFF9C0] set];
      v13 = (void *)a1[5];
      a1[5] = v12;
    }
  }

  return a1;
}

- (uint64_t)addComponentDependency:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  v3 = *(void **)(result + 24);
  v4 = a2;
  [v3 addObject:v4];
  uint64_t v5 = v4[4];
  id v6 = (void *)v4[2];

  id v7 = v6;
  id v8 = v7;
  if (v5 == 1)
  {
    uint64_t v9 = 32;
    goto LABEL_6;
  }
  if (v5 == 2)
  {
    uint64_t v9 = 40;
LABEL_6:
    id v10 = v7;
    id v7 = (id)[*(id *)(v2 + v9) addObject:v7];
    id v8 = v10;
  }
  return MEMORY[0x270F9A758](v7, v8);
}

- (id)dependencies
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)hasDependencyToComponentIdentifier:(uint64_t)a3 attribute:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = 40;
    if (a3 == 1) {
      uint64_t v6 = 32;
    }
    a1 = [*(id *)(a1 + v6) containsObject:v5];
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SXComponentNode *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4->_attribute == self->_attribute)
  {
    char v6 = [(NSString *)v4->_componentIdentifier isEqualToString:self->_componentIdentifier];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_attribute ^ [(NSString *)self->_componentIdentifier hash];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self)
  {
    id v5 = self->_componentIdentifier;
    int64_t attribute = self->_attribute;
  }
  else
  {
    id v5 = 0;
    int64_t attribute = 0;
  }
  id v7 = NSStringFromDependencyAttribute(attribute);
  id v8 = [v3 stringWithFormat:@"<%@: %p; componentIdentifier: %@>; attribute: %@>", v4, self, v5, v7];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toSizeDependencies, 0);
  objc_storeStrong((id *)&self->_toPositionDependencies, 0);
  objc_storeStrong((id *)&self->_mutableDependencies, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
}

@end