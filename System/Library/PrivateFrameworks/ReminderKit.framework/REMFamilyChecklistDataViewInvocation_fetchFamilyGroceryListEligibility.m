@interface REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)localeIdentifier;
- (REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility)initWithCoder:(id)a3;
- (REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility)initWithLocaleIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility)initWithLocaleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localeIdentifier, a3);
  }

  return v7;
}

- (REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];

  if (v5)
  {
    self = [(REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility *)self initWithLocaleIdentifier:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility *)self localeIdentifier];
  [v4 encodeObject:v5 forKey:@"localeIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility *)self localeIdentifier];
    uint64_t v6 = [v4 localeIdentifier];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility *)self localeIdentifier];
      objc_super v9 = [v4 localeIdentifier];
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
  v3.receiver = self;
  v3.super_class = (Class)REMFamilyChecklistDataViewInvocation_fetchFamilyGroceryListEligibility;
  return [(REMStoreInvocationValueStorage *)&v3 hash];
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
}

@end