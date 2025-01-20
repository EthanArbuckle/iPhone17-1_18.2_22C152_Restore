@interface SXComponentDependency
+ (id)componentDependencyFromComponentIdentifier:(void *)a3 toComponentIdentifier:(void *)a4 fromLayoutAttribute:(void *)a5 toAttribute:(void *)a6 withDescriptor:;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initWithComponentDependencyFromComponentIdentifier:(void *)a3 toComponentIdentifier:(void *)a4 fromLayoutAttribute:(void *)a5 toAttribute:(void *)a6 withDescriptor:;
- (unint64_t)hash;
@end

@implementation SXComponentDependency

+ (id)componentDependencyFromComponentIdentifier:(void *)a3 toComponentIdentifier:(void *)a4 fromLayoutAttribute:(void *)a5 toAttribute:(void *)a6 withDescriptor:
{
  id v10 = a6;
  id v11 = a3;
  id v12 = a2;
  self;
  v13 = -[SXComponentDependency initWithComponentDependencyFromComponentIdentifier:toComponentIdentifier:fromLayoutAttribute:toAttribute:withDescriptor:]((id *)[SXComponentDependency alloc], v12, v11, a4, a5, v10);

  return v13;
}

- (id)initWithComponentDependencyFromComponentIdentifier:(void *)a3 toComponentIdentifier:(void *)a4 fromLayoutAttribute:(void *)a5 toAttribute:(void *)a6 withDescriptor:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a6;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)SXComponentDependency;
    v15 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      a1[3] = a4;
      a1[4] = a5;
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SXComponentDependency *)a3;
  BOOL v5 = v4 == self
    || [(NSString *)self->_fromComponentIdentifier isEqualToString:v4->_fromComponentIdentifier]
    && [(NSString *)self->_toComponentIdentifier isEqualToString:v4->_toComponentIdentifier]
    && self->_fromDependencyAttribute == v4->_fromDependencyAttribute
    && self->_toDependencyAttribute == v4->_toDependencyAttribute;

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_fromComponentIdentifier hash];
  return [(NSString *)self->_toComponentIdentifier hash] ^ v3 ^ self->_fromDependencyAttribute ^ self->_toDependencyAttribute;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  if (self)
  {
    v6 = self->_fromComponentIdentifier;
    v7 = self->_toComponentIdentifier;
    v8 = NSStringFromDependencyAttribute(self->_fromDependencyAttribute);
    int64_t toDependencyAttribute = self->_toDependencyAttribute;
  }
  else
  {
    v8 = NSStringFromDependencyAttribute(0);
    v6 = 0;
    v7 = 0;
    int64_t toDependencyAttribute = 0;
  }
  id v10 = NSStringFromDependencyAttribute(toDependencyAttribute);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; from component: %@; to component: %@; dependencyAttribute: %@; toDependencyAttribute: %@>",
    v5,
    self,
    v6,
    v7,
    v8,
  id v11 = v10);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_toComponentIdentifier, 0);
  objc_storeStrong((id *)&self->_fromComponentIdentifier, 0);
}

@end