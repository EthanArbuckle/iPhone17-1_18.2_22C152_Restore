@interface REMListSectionsDataViewInvocation_fetchByObjectIDs
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)objectIDs;
- (REMListSectionsDataViewInvocation_fetchByObjectIDs)initWithCoder:(id)a3;
- (REMListSectionsDataViewInvocation_fetchByObjectIDs)initWithObjectIDs:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMListSectionsDataViewInvocation_fetchByObjectIDs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListSectionsDataViewInvocation_fetchByObjectIDs)initWithObjectIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListSectionsDataViewInvocation_fetchByObjectIDs;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_objectIDs, a3);
  }

  return v7;
}

- (REMListSectionsDataViewInvocation_fetchByObjectIDs)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"objectIDs"];

  if (v8)
  {
    self = [(REMListSectionsDataViewInvocation_fetchByObjectIDs *)self initWithObjectIDs:v8];
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
  id v5 = [(REMListSectionsDataViewInvocation_fetchByObjectIDs *)self objectIDs];
  [v4 encodeObject:v5 forKey:@"objectIDs"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMListSectionsDataViewInvocation_fetchByObjectIDs *)self objectIDs];
    uint64_t v6 = [v4 objectIDs];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMListSectionsDataViewInvocation_fetchByObjectIDs *)self objectIDs];
      objc_super v9 = [v4 objectIDs];
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
  v2 = [(REMListSectionsDataViewInvocation_fetchByObjectIDs *)self objectIDs];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void).cxx_destruct
{
}

@end