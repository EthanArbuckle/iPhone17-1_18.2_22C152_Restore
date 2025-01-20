@interface REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)commonSharees;
- (REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists)initWithCoder:(id)a3;
- (REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists)initWithCommonSharees:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists)initWithCommonSharees:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_commonSharees, a3);
  }

  return v7;
}

- (REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"commonSharees"];

  if (v8)
  {
    self = [(REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists *)self initWithCommonSharees:v8];
    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists *)self commonSharees];
  [v4 encodeObject:v5 forKey:@"commonSharees"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists *)self commonSharees];
    uint64_t v6 = [v4 commonSharees];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists *)self commonSharees];
      objc_super v9 = [v4 commonSharees];
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
  v3.super_class = (Class)REMFamilyChecklistDataViewInvocation_fetchSharedGroceryLists;
  return [(REMStoreInvocationValueStorage *)&v3 hash];
}

- (NSArray)commonSharees
{
  return self->_commonSharees;
}

- (void).cxx_destruct
{
}

@end