@interface HKSPProperty
+ (BOOL)supportsSecureCoding;
+ (NSArray)allowedSubclassesForSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRelationshipProperty;
- (HKSPProperty)initWithCoder:(id)a3;
- (HKSPProperty)initWithIdentifier:(id)a3 propertyName:(id)a4;
- (NSArray)allowedInnerClassesForSecureCoding;
- (NSString)description;
- (NSString)identifier;
- (NSString)propertyName;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)copyValueFromObject:(id)a3 toObject:(id)a4;
- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4;
- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPProperty

uint64_t __24__HKSPProperty_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) identifier];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKSPProperty *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [MEMORY[0x1E4F4F738] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
      identifier = self->_identifier;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __24__HKSPProperty_isEqual___block_invoke;
      v20[3] = &unk_1E5D32588;
      v8 = v5;
      v21 = v8;
      id v9 = (id)[v6 appendObject:identifier counterpart:v20];
      propertyName = self->_propertyName;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __24__HKSPProperty_isEqual___block_invoke_2;
      v18 = &unk_1E5D32588;
      v19 = v8;
      v11 = v8;
      id v12 = (id)[v6 appendObject:propertyName counterpart:&v15];
      char v13 = objc_msgSend(v6, "isEqual", v15, v16, v17, v18);
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v4 = [(HKSPProperty *)self identifier];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(HKSPProperty *)self propertyName];
  id v7 = (id)[v3 appendObject:v6];

  unint64_t v8 = [v3 hash];
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (HKSPProperty)initWithIdentifier:(id)a3 propertyName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPProperty;
  unint64_t v8 = [(HKSPProperty *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    propertyName = v8->_propertyName;
    v8->_propertyName = (NSString *)v11;

    char v13 = v8;
  }

  return v8;
}

+ (NSArray)allowedSubclassesForSecureCoding
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return (NSArray *)v2;
}

- (NSArray)allowedInnerClassesForSecureCoding
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HKSPChange.m" lineNumber:38 description:@"subclasses must implement"];

  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

uint64_t __24__HKSPProperty_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) propertyName];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"HKSPIdentifier"];
  [v5 encodeObject:self->_propertyName forKey:@"HKSPPropertyName"];
}

- (HKSPProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPProperty;
  id v5 = [(HKSPProperty *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKSPIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKSPPropertyName"];
    propertyName = v5->_propertyName;
    v5->_propertyName = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[(HKSPProperty *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HKSPProperty *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v4 appendString:self->_identifier withName:@"identifier"];
  id v5 = (id)[v4 appendObject:self->_propertyName withName:@"propertyName"];
  return v4;
}

- (id)succinctDescriptionBuilder
{
  return [(HKSPProperty *)self descriptionBuilderWithMultilinePrefix:0];
}

- (BOOL)isRelationshipProperty
{
  return 0;
}

- (void)copyValueFromObject:(id)a3 toObject:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"HKSPProperty+Subclasses.m" lineNumber:18 description:@"Subclass must implement"];
}

- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"HKSPProperty+Subclasses.m" lineNumber:22 description:@"Subclass must implement"];
}

- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"HKSPProperty+Subclasses.m" lineNumber:26 description:@"Subclass must implement"];
}

@end