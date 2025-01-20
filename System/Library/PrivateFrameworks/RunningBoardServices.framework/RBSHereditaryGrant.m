@interface RBSHereditaryGrant
+ (id)grantWithNamespace:(id)a3 endowment:(id)a4 attributes:(id)a5;
+ (id)grantWithNamespace:(id)a3 sourceEnvironment:(id)a4 attributes:(id)a5;
+ (id)grantWithNamespace:(id)a3 sourceEnvironment:(id)a4 endowment:(id)a5 attributes:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)attributes;
- (NSString)endowmentNamespace;
- (NSString)sourceEnvironment;
- (OS_xpc_object)encodedEndowment;
- (RBSHereditaryGrant)initWithRBSXPCCoder:(id)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)_initWithNamespace:(void *)a3 sourceEnvironment:(void *)a4 endowment:(void *)a5 attributes:;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSHereditaryGrant

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RBSHereditaryGrant;
  id v4 = a3;
  [(RBSAttribute *)&v6 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_endowmentNamespace, @"_endowmentNamespace", v6.receiver, v6.super_class);
  [v4 encodeObject:self->_sourceEnvironment forKey:@"_sourceEnvironment"];
  [v4 encodeObject:self->_attributes forKey:@"_attributes"];
  v5 = RBSXPCPackObject(self->_encodedEndowment);
  [v4 encodeXPCObject:v5 forKey:@"_encodedEndowment"];
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  v5 = (void *)v4;
  sourceEnvironment = (__CFString *)self->_sourceEnvironment;
  v7 = @" ";
  v8 = &stru_1EE2E2768;
  if (!sourceEnvironment)
  {
    v7 = &stru_1EE2E2768;
    sourceEnvironment = &stru_1EE2E2768;
  }
  if (self->_encodedEndowment) {
    v8 = @" hasEncodedEndowment";
  }
  v9 = (void *)[v3 initWithFormat:@"<%@| endowmentNamespace:%@%@%@%@>", v4, self->_endowmentNamespace, v7, sourceEnvironment, v8];

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_attributes hash];
  NSUInteger v4 = [(NSString *)self->_endowmentNamespace hash] ^ v3;
  return v4 ^ [(NSString *)self->_sourceEnvironment hash];
}

- (OS_xpc_object)encodedEndowment
{
  return self->_encodedEndowment;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (NSString)sourceEnvironment
{
  return self->_sourceEnvironment;
}

+ (id)grantWithNamespace:(id)a3 sourceEnvironment:(id)a4 attributes:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[RBSHereditaryGrant _initWithNamespace:sourceEnvironment:endowment:attributes:]([RBSHereditaryGrant alloc], v9, v8, 0, v7);

  return v10;
}

- (void)_initWithNamespace:(void *)a3 sourceEnvironment:(void *)a4 endowment:(void *)a5 attributes:
{
  id v10 = a2;
  unint64_t v11 = a3;
  unint64_t v12 = a4;
  id v13 = a5;
  if (a1)
  {
    if (!v10)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:sel__initWithNamespace_sourceEnvironment_endowment_attributes_, a1, @"RBSHereditaryGrant.m", 133, @"Invalid parameter not satisfying: %@", @"endowmentNamespace" object file lineNumber description];
    }
    if (!(v11 | v12))
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:sel__initWithNamespace_sourceEnvironment_endowment_attributes_ object:a1 file:@"RBSHereditaryGrant.m" lineNumber:134 description:@"Missing source environment or endowment"];
    }
    v25.receiver = a1;
    v25.super_class = (Class)RBSHereditaryGrant;
    id v14 = objc_msgSendSuper2(&v25, sel__init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong((id *)v14 + 1, a2);
      uint64_t v15 = [(id)v11 copy];
      v16 = (void *)a1[2];
      a1[2] = v15;

      uint64_t v17 = RBSEndowmentEncode((void *)v12);
      v18 = (void *)a1[3];
      a1[3] = v17;

      uint64_t v19 = [v13 copy];
      v20 = (void *)a1[4];
      a1[4] = v19;

      if ((v12 == 0) != (a1[3] == 0))
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:sel__initWithNamespace_sourceEnvironment_endowment_attributes_, a1, @"RBSHereditaryGrant.m", 142, @"endowment encode failed : %@", v12 object file lineNumber description];
      }
    }
  }

  return a1;
}

- (RBSHereditaryGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeStringForKey:@"_endowmentNamespace"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceEnvironment"];
    id v7 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"_encodedEndowment"];
    uint64_t v8 = RBSXPCUnpackObject(v7);

    if (v6 | v8)
    {
      v17.receiver = self;
      v17.super_class = (Class)RBSHereditaryGrant;
      unint64_t v11 = [(RBSAttribute *)&v17 initWithRBSXPCCoder:v4];
      unint64_t v12 = v11;
      if (v11)
      {
        objc_storeStrong((id *)&v11->_endowmentNamespace, v5);
        objc_storeStrong((id *)&v12->_sourceEnvironment, (id)v6);
        objc_storeStrong((id *)&v12->_encodedEndowment, (id)v8);
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = [v4 decodeCollectionOfClass:v13 containingClass:objc_opt_class() forKey:@"_attributes"];
        attributes = v12->_attributes;
        v12->_attributes = (NSArray *)v14;
      }
      self = v12;
      id v10 = self;
    }
    else
    {
      id v9 = rbs_assertion_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[RBSHereditaryGrant initWithRBSXPCCoder:]((uint64_t)self, v9);
      }

      id v10 = 0;
    }
  }
  else
  {
    uint64_t v6 = rbs_assertion_log();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      -[RBSHereditaryGrant initWithRBSXPCCoder:]((uint64_t)self, v6);
    }
    id v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_encodedEndowment, 0);
  objc_storeStrong((id *)&self->_sourceEnvironment, 0);
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
}

+ (id)grantWithNamespace:(id)a3 endowment:(id)a4 attributes:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = -[RBSHereditaryGrant _initWithNamespace:sourceEnvironment:endowment:attributes:]([RBSHereditaryGrant alloc], v9, 0, v8, v7);

  return v10;
}

+ (id)grantWithNamespace:(id)a3 sourceEnvironment:(id)a4 endowment:(id)a5 attributes:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = -[RBSHereditaryGrant _initWithNamespace:sourceEnvironment:endowment:attributes:]([RBSHereditaryGrant alloc], v12, v11, v10, v9);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSHereditaryGrant;
  BOOL v11 = 0;
  if ([(RBSAttribute *)&v13 isEqual:v4])
  {
    endowmentNamespace = self->_endowmentNamespace;
    if (endowmentNamespace == (NSString *)v4[1] || -[NSString isEqual:](endowmentNamespace, "isEqual:"))
    {
      sourceEnvironment = self->_sourceEnvironment;
      if (sourceEnvironment == (NSString *)v4[2] || -[NSString isEqualToString:](sourceEnvironment, "isEqualToString:"))
      {
        encodedEndowment = self->_encodedEndowment;
        id v8 = (OS_xpc_object *)v4[3];
        if (encodedEndowment == v8 || (encodedEndowment ? (BOOL v9 = v8 == 0) : (BOOL v9 = 1), !v9))
        {
          attributes = self->_attributes;
          if (attributes == (NSArray *)v4[4] || -[NSArray isEqualToArray:](attributes, "isEqualToArray:")) {
            BOOL v11 = 1;
          }
        }
      }
    }
  }

  return v11;
}

- (id)debugDescription
{
  id v16 = [NSString alloc];
  uint64_t v3 = [(id)objc_opt_class() description];
  endowmentNamespace = self->_endowmentNamespace;
  sourceEnvironment = self->_sourceEnvironment;
  if (sourceEnvironment) {
    uint64_t v6 = @" sourceEnvironment:";
  }
  else {
    uint64_t v6 = &stru_1EE2E2768;
  }
  if (sourceEnvironment) {
    id v7 = (__CFString *)self->_sourceEnvironment;
  }
  else {
    id v7 = &stru_1EE2E2768;
  }
  if (self->_encodedEndowment) {
    id v8 = @" hasEncodedEndowment";
  }
  else {
    id v8 = &stru_1EE2E2768;
  }
  attributes = self->_attributes;
  if (attributes) {
    id v10 = @"attributes: [\n\t";
  }
  else {
    id v10 = &stru_1EE2E2768;
  }
  uint64_t v11 = [(NSArray *)attributes componentsJoinedByString:@",\n\t"];
  id v12 = (void *)v11;
  if (self->_attributes) {
    objc_super v13 = @"\n\t]";
  }
  else {
    objc_super v13 = &stru_1EE2E2768;
  }
  uint64_t v14 = (void *)[v16 initWithFormat:@"<%@| endowmentNamespace:%@%@%@%@%@%@%@>", v3, endowmentNamespace, v6, v7, v8, v10, v11, v13];

  return v14;
}

- (void)initWithRBSXPCCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191FE8000, a2, OS_LOG_TYPE_ERROR, "RBSHereditaryGrant has no namespace: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithRBSXPCCoder:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191FE8000, a2, OS_LOG_TYPE_ERROR, "RBSHereditaryGrant is missing both source environment and endowment: %@", (uint8_t *)&v2, 0xCu);
}

@end