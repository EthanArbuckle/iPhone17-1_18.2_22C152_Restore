@interface RBSInheritance
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)endowmentNamespace;
- (NSString)environment;
- (OS_xpc_object)encodedEndowment;
- (RBSAssertionIdentifier)originatingIdentifier;
- (RBSInheritance)init;
- (RBSInheritance)initWithRBSXPCCoder:(id)a3;
- (id)_initWithNamespace:(id)a3 environment:(id)a4 encodedEndowment:(id)a5 originatingIdentifier:(id)a6 attributePath:(unint64_t)a7;
- (id)endowment;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSInheritance

- (unint64_t)hash
{
  return self->_hash;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  endowmentNamespace = self->_endowmentNamespace;
  id v6 = a3;
  [v6 encodeObject:endowmentNamespace forKey:@"namespace"];
  [v6 encodeObject:self->_environment forKey:@"environment"];
  v5 = RBSXPCPackObject(self->_encodedEndowment);
  [v6 encodeXPCObject:v5 forKey:@"encodedEndowment"];

  [v6 encodeObject:self->_originatingIdentifier forKey:@"originatingIdentifier"];
  [v6 encodeUInt64:self->_originatingAttributePath forKey:@"originatingAttributePath"];
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (RBSAssertionIdentifier)originatingIdentifier
{
  return self->_originatingIdentifier;
}

- (NSString)environment
{
  return self->_environment;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  v5 = (void *)v4;
  environment = @"(none)";
  if (self->_environment) {
    environment = (__CFString *)self->_environment;
  }
  v7 = @" payload";
  if (!self->_encodedEndowment) {
    v7 = &stru_1EE2E2768;
  }
  v8 = (void *)[v3 initWithFormat:@"<%@| environment:%@ name:%@ origID:%@%@ %lu>", v4, environment, self->_endowmentNamespace, self->_originatingIdentifier, v7, self->_encodedEndowmentHash];

  return (NSString *)v8;
}

- (RBSInheritance)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"namespace"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
  v7 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"encodedEndowment"];
  v8 = RBSXPCUnpackObject(v7);
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingIdentifier"];
  uint64_t v10 = [v4 decodeUInt64ForKey:@"originatingAttributePath"];

  v11 = [(RBSInheritance *)self _initWithNamespace:v5 environment:v6 encodedEndowment:v8 originatingIdentifier:v9 attributePath:v10];
  return v11;
}

- (id)_initWithNamespace:(id)a3 environment:(id)a4 encodedEndowment:(id)a5 originatingIdentifier:(id)a6 attributePath:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v13)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"RBSInheritance.m", 50, @"Invalid parameter not satisfying: %@", @"endowmentNamespace != nil" object file lineNumber description];
  }
  v31.receiver = self;
  v31.super_class = (Class)RBSInheritance;
  v17 = [(RBSInheritance *)&v31 init];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    endowmentNamespace = v17->_endowmentNamespace;
    v17->_endowmentNamespace = (NSString *)v18;

    uint64_t v20 = [v14 copy];
    environment = v17->_environment;
    v17->_environment = (NSString *)v20;

    objc_storeStrong((id *)&v17->_encodedEndowment, a5);
    uint64_t v22 = [v16 copy];
    originatingIdentifier = v17->_originatingIdentifier;
    v17->_originatingIdentifier = (RBSAssertionIdentifier *)v22;

    v17->_originatingAttributePath = a7;
    uint64_t v24 = [(RBSAssertionIdentifier *)v17->_originatingIdentifier hash];
    unint64_t v25 = 0xBF58476D1CE4E5B9 * (v17->_originatingAttributePath ^ (v17->_originatingAttributePath >> 30));
    unint64_t v26 = 0x94D049BB133111EBLL * (v25 ^ (v25 >> 27));
    uint64_t v27 = [(NSString *)v17->_endowmentNamespace hash];
    v17->_hash = v27 ^ v24 ^ [(NSString *)v17->_environment hash] ^ (v26 >> 31) ^ v26;
    v28 = [(OS_xpc_object *)v17->_encodedEndowment description];
    v17->_encodedEndowmentHash = [v28 hash];
  }
  return v17;
}

- (OS_xpc_object)encodedEndowment
{
  return self->_encodedEndowment;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSInheritance *)a3;
  if (self == v4) {
    goto LABEL_21;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_20;
  }
  if (self->_hash != v4->_hash) {
    goto LABEL_20;
  }
  if (self->_originatingAttributePath != v4->_originatingAttributePath) {
    goto LABEL_20;
  }
  if (self->_encodedEndowment)
  {
    if (v4->_encodedEndowment)
    {
      uint64_t v6 = MEMORY[0x192FECA30]();
      if (v6 != MEMORY[0x192FECA30](v4->_encodedEndowment)) {
        goto LABEL_20;
      }
    }
  }
  originatingIdentifier = self->_originatingIdentifier;
  v8 = v4->_originatingIdentifier;
  if (originatingIdentifier != v8)
  {
    char v9 = 0;
    if (!originatingIdentifier || !v8) {
      goto LABEL_22;
    }
    if (!-[RBSAssertionIdentifier isEqual:](originatingIdentifier, "isEqual:")) {
      goto LABEL_20;
    }
  }
  environment = self->_environment;
  v11 = v4->_environment;
  if (environment != v11)
  {
    char v9 = 0;
    if (!environment || !v11) {
      goto LABEL_22;
    }
    if (!-[NSString isEqual:](environment, "isEqual:"))
    {
LABEL_20:
      char v9 = 0;
      goto LABEL_22;
    }
  }
  endowmentNamespace = self->_endowmentNamespace;
  id v13 = v4->_endowmentNamespace;
  if (endowmentNamespace == v13)
  {
LABEL_21:
    char v9 = 1;
    goto LABEL_22;
  }
  char v9 = 0;
  if (endowmentNamespace && v13) {
    char v9 = -[NSString isEqual:](endowmentNamespace, "isEqual:");
  }
LABEL_22:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingIdentifier, 0);
  objc_storeStrong((id *)&self->_encodedEndowment, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
}

- (RBSInheritance)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSInheritance.m" lineNumber:41 description:@"cannot call -init on RBSInheritance"];

  return 0;
}

- (id)endowment
{
  return RBSEndowmentDecode(self->_encodedEndowment);
}

@end