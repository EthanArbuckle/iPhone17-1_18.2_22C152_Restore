@interface HKSPChange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSPChange)initWithCoder:(id)a3;
- (HKSPChange)initWithProperty:(id)a3 changedValue:(id)a4 originalValue:(id)a5;
- (HKSPProperty)property;
- (NSObject)changedValue;
- (NSObject)originalValue;
- (NSString)description;
- (id)deepCopy;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPChange

- (HKSPProperty)property
{
  return self->_property;
}

- (HKSPChange)initWithProperty:(id)a3 changedValue:(id)a4 originalValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKSPChange;
  v11 = [(HKSPChange *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    property = v11->_property;
    v11->_property = (HKSPProperty *)v12;

    objc_storeStrong((id *)&v11->_changedValue, a4);
    objc_storeStrong((id *)&v11->_originalValue, a5);
    v14 = v11;
  }

  return v11;
}

- (NSObject)changedValue
{
  return self->_changedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_changedValue, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKSPChange *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [MEMORY[0x1E4F4F738] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
      v7 = [(HKSPChange *)self property];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __22__HKSPChange_isEqual___block_invoke;
      v22[3] = &unk_1E5D31C70;
      id v8 = v5;
      v23 = v8;
      id v9 = (id)[v6 appendObject:v7 counterpart:v22];

      id v10 = [(HKSPChange *)self originalValue];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __22__HKSPChange_isEqual___block_invoke_2;
      v20[3] = &unk_1E5D31C98;
      v11 = v8;
      v21 = v11;
      id v12 = (id)[v6 appendObject:v10 counterpart:v20];

      v13 = [(HKSPChange *)self changedValue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __22__HKSPChange_isEqual___block_invoke_3;
      v18[3] = &unk_1E5D31C98;
      v19 = v11;
      v14 = v11;
      id v15 = (id)[v6 appendObject:v13 counterpart:v18];

      char v16 = [v6 isEqual];
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

uint64_t __22__HKSPChange_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) property];
}

uint64_t __22__HKSPChange_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) originalValue];
}

uint64_t __22__HKSPChange_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) changedValue];
}

- (id)deepCopy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = (void *)[(HKSPProperty *)self->_property copy];
  v5 = (void *)[self->_changedValue copyWithZone:0];
  v6 = (void *)[self->_originalValue copyWithZone:0];
  v7 = (void *)[v3 initWithProperty:v4 changedValue:v5 originalValue:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  property = self->_property;
  id v5 = a3;
  [v5 encodeObject:property forKey:@"HKSPProperty"];
  [v5 encodeObject:self->_changedValue forKey:@"HKSPChangedValue"];
  [v5 encodeObject:self->_originalValue forKey:@"HKSPOriginalValue"];
}

- (HKSPChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKSPChange;
  id v5 = [(HKSPChange *)&v23 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v7 = +[HKSPProperty allowedSubclassesForSecureCoding];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HKSPProperty"];
    property = v5->_property;
    v5->_property = (HKSPProperty *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    id v12 = [(HKSPProperty *)v5->_property allowedInnerClassesForSecureCoding];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"HKSPChangedValue"];
    changedValue = v5->_changedValue;
    v5->_changedValue = v14;

    char v16 = (void *)MEMORY[0x1E4F1CAD0];
    v17 = [(HKSPProperty *)v5->_property allowedInnerClassesForSecureCoding];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"HKSPOriginalValue"];
    originalValue = v5->_originalValue;
    v5->_originalValue = v19;

    v21 = v5;
  }

  return v5;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(HKSPChange *)self property];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(HKSPChange *)self changedValue];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = [(HKSPChange *)self originalValue];
  id v9 = (id)[v3 appendObject:v8];

  unint64_t v10 = [v3 hash];
  return v10;
}

- (NSString)description
{
  return (NSString *)[(HKSPChange *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(HKSPChange *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [(HKSPProperty *)self->_property identifier];
  [v4 appendString:v5 withName:@"identifier"];

  id v6 = (id)[v4 appendObject:self->_changedValue withName:@"changedValue"];
  id v7 = (id)[v4 appendObject:self->_originalValue withName:@"originalValue"];
  return v4;
}

- (id)succinctDescriptionBuilder
{
  return [(HKSPChange *)self descriptionBuilderWithMultilinePrefix:0];
}

- (NSObject)originalValue
{
  return self->_originalValue;
}

@end