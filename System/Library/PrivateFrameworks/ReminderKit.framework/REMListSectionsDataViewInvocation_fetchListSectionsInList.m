@interface REMListSectionsDataViewInvocation_fetchListSectionsInList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMListSectionsDataViewInvocation_fetchListSectionsInList)initWithCoder:(id)a3;
- (REMListSectionsDataViewInvocation_fetchListSectionsInList)initWithParentListObjectID:(id)a3;
- (REMObjectID)listObjectID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMListSectionsDataViewInvocation_fetchListSectionsInList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListSectionsDataViewInvocation_fetchListSectionsInList)initWithParentListObjectID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListSectionsDataViewInvocation_fetchListSectionsInList;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listObjectID, a3);
  }

  return v7;
}

- (REMListSectionsDataViewInvocation_fetchListSectionsInList)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listObjectID"];

  if (v5)
  {
    self = [(REMListSectionsDataViewInvocation_fetchListSectionsInList *)self initWithParentListObjectID:v5];
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
  id v5 = [(REMListSectionsDataViewInvocation_fetchListSectionsInList *)self listObjectID];
  [v4 encodeObject:v5 forKey:@"listObjectID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMListSectionsDataViewInvocation_fetchListSectionsInList *)self listObjectID];
    uint64_t v6 = [v4 listObjectID];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMListSectionsDataViewInvocation_fetchListSectionsInList *)self listObjectID];
      objc_super v9 = [v4 listObjectID];
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
  v2 = [(REMListSectionsDataViewInvocation_fetchListSectionsInList *)self listObjectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (REMObjectID)listObjectID
{
  return self->_listObjectID;
}

- (void).cxx_destruct
{
}

@end