@interface RBSAssertionDescriptor
+ (BOOL)supportsRBSXPCSecureCoding;
+ (RBSAssertionDescriptor)descriptorWithIdentifier:(id)a3 target:(id)a4 explanation:(id)a5 attributes:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)attributes;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)explanation;
- (RBSAssertionDescriptor)init;
- (RBSAssertionDescriptor)initWithRBSXPCCoder:(id)a3;
- (RBSAssertionIdentifier)identifier;
- (RBSTarget)target;
- (id)copyWithIdentifier:(id)a3;
- (unint64_t)hash;
- (void)_initWithIdentifier:(void *)a3 target:(void *)a4 explanation:(void *)a5 attributes:;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation RBSAssertionDescriptor

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSAssertionDescriptor)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"explanation"];
  uint64_t v6 = objc_opt_class();
  v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"attributes"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"target"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  v10 = (RBSAssertionDescriptor *)-[RBSAssertionDescriptor _initWithIdentifier:target:explanation:attributes:](self, v9, v8, v5, v7);
  return v10;
}

- (void)setTarget:(id)a3
{
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  explanation = self->_explanation;
  identifier = self->_identifier;
  v7 = [(RBSTarget *)self->_target shortDescription];
  v8 = (void *)[v3 initWithFormat:@"<%@| \"%@\" ID:%@ target:%@>", v4, explanation, identifier, v7];

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  explanation = self->_explanation;
  identifier = self->_identifier;
  v7 = [(RBSTarget *)self->_target shortDescription];
  v8 = [(NSArray *)self->_attributes componentsJoinedByString:@",\n\t"];
  v9 = (void *)[v3 initWithFormat:@"<%@| \"%@\" ID:%@ target:%@ attributes:[\n\t%@\n\t]>", v4, explanation, identifier, v7, v8];

  return (NSString *)v9;
}

- (id)copyWithIdentifier:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (RBSAssertionDescriptor)descriptorWithIdentifier:(id)a3 target:(id)a4 explanation:(id)a5 attributes:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = -[RBSAssertionDescriptor _initWithIdentifier:target:explanation:attributes:]([RBSAssertionDescriptor alloc], v12, v11, v10, v9);

  return (RBSAssertionDescriptor *)v13;
}

- (void)_initWithIdentifier:(void *)a3 target:(void *)a4 explanation:(void *)a5 attributes:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)RBSAssertionDescriptor;
    a1 = objc_msgSendSuper2(&v22, sel_init);
    if (a1)
    {
      uint64_t v13 = [v9 copy];
      v14 = (void *)a1[1];
      a1[1] = v13;

      uint64_t v15 = [v10 copy];
      v16 = (void *)a1[2];
      a1[2] = v15;

      uint64_t v17 = [v11 copy];
      v18 = (void *)a1[3];
      a1[3] = v17;

      uint64_t v19 = [v12 copy];
      v20 = (void *)a1[4];
      a1[4] = v19;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RBSAssertionDescriptor *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(RBSAssertionDescriptor *)self target];
  [v4 encodeObject:v6 forKey:@"target"];

  v7 = [(RBSAssertionDescriptor *)self explanation];
  [v4 encodeObject:v7 forKey:@"explanation"];

  id v8 = [(RBSAssertionDescriptor *)self attributes];
  [v4 encodeObject:v8 forKey:@"attributes"];
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (RBSAssertionIdentifier)identifier
{
  return self->_identifier;
}

- (RBSTarget)target
{
  return self->_target;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (RBSAssertionDescriptor)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSAssertionDescriptor.m" lineNumber:39 description:@"-init is not allowed on RBSAssertionDescriptor"];

  return 0;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RBSAssertionIdentifier *)self->_identifier hash];
  unint64_t v4 = [(RBSTarget *)self->_target hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_explanation hash];
  return v4 ^ v5 ^ [(NSArray *)self->_attributes hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (RBSAssertionDescriptor *)a3;
  BOOL v6 = 1;
  if (self != v4)
  {
    if ((uint64_t v5 = objc_opt_class(), v5 != objc_opt_class())
      || (identifier = self->_identifier, identifier != v4->_identifier)
      && !-[RBSAssertionIdentifier isEqual:](identifier, "isEqual:")
      || (target = self->_target, target != v4->_target) && !-[RBSTarget isEqual:](target, "isEqual:")
      || (explanation = self->_explanation, explanation != v4->_explanation)
      && !-[NSString isEqualToString:](explanation, "isEqualToString:")
      || (attributes = self->_attributes, attributes != v4->_attributes)
      && !-[NSArray isEqualToArray:](attributes, "isEqualToArray:"))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

@end