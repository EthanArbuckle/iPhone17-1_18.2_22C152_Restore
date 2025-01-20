@interface REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMFamilyChecklistFamilyGroceryListEligibility)familyGroceryListEligibility;
- (REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult)initWithCoder:(id)a3;
- (REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult)initWithFamilyGroceryListEligibility:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult)initWithFamilyGroceryListEligibility:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_familyGroceryListEligibility, a3);
  }

  return v7;
}

- (REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyGroceryListEligibility"];

  v6 = [(REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult *)self initWithFamilyGroceryListEligibility:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult *)self familyGroceryListEligibility];
  [v4 encodeObject:v5 forKey:@"familyGroceryListEligibility"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult *)self familyGroceryListEligibility];
    uint64_t v6 = [v4 familyGroceryListEligibility];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult *)self familyGroceryListEligibility];
      objc_super v9 = [v4 familyGroceryListEligibility];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(REMFamilyChecklistFamilyGroceryListEligibilityInvocationResult *)self familyGroceryListEligibility];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (REMFamilyChecklistFamilyGroceryListEligibility)familyGroceryListEligibility
{
  return self->_familyGroceryListEligibility;
}

- (void).cxx_destruct
{
}

@end