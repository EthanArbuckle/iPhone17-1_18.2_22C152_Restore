@interface REMListSectionsDataViewInvocationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)accountStorages;
- (NSArray)listSectionStorages;
- (NSArray)listStorages;
- (REMListSectionsDataViewInvocationResult)initWithAccountStorages:(id)a3 listStorages:(id)a4 listSectionStorages:(id)a5;
- (REMListSectionsDataViewInvocationResult)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMListSectionsDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListSectionsDataViewInvocationResult)initWithAccountStorages:(id)a3 listStorages:(id)a4 listSectionStorages:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMListSectionsDataViewInvocationResult;
  v12 = [(REMStoreInvocationValueStorage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountStorages, a3);
    objc_storeStrong((id *)&v13->_listStorages, a4);
    objc_storeStrong((id *)&v13->_listSectionStorages, a5);
  }

  return v13;
}

- (REMListSectionsDataViewInvocationResult)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"accountStorages"];

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"listStorages"];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  objc_super v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v5 decodeObjectOfClasses:v15 forKey:@"listSectionStorages"];

  v17 = 0;
  if (v8 && v12 && v16)
  {
    self = [(REMListSectionsDataViewInvocationResult *)self initWithAccountStorages:v8 listStorages:v12 listSectionStorages:v16];
    v17 = self;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMListSectionsDataViewInvocationResult *)self accountStorages];
  [v4 encodeObject:v5 forKey:@"accountStorages"];

  uint64_t v6 = [(REMListSectionsDataViewInvocationResult *)self listStorages];
  [v4 encodeObject:v6 forKey:@"listStorages"];

  id v7 = [(REMListSectionsDataViewInvocationResult *)self listSectionStorages];
  [v4 encodeObject:v7 forKey:@"listSectionStorages"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v5 = [(REMListSectionsDataViewInvocationResult *)self accountStorages];
  uint64_t v6 = [v4 accountStorages];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    v8 = [(REMListSectionsDataViewInvocationResult *)self accountStorages];
    id v9 = [v4 accountStorages];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_8;
    }
  }
  id v11 = [(REMListSectionsDataViewInvocationResult *)self listStorages];
  uint64_t v12 = [v4 listStorages];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    uint64_t v14 = [(REMListSectionsDataViewInvocationResult *)self listStorages];
    objc_super v15 = [v4 listStorages];
    int v16 = [v14 isEqual:v15];

    if (!v16)
    {
LABEL_8:
      char v17 = 0;
      goto LABEL_14;
    }
  }
  v18 = [(REMListSectionsDataViewInvocationResult *)self listSectionStorages];
  uint64_t v19 = [v4 listSectionStorages];
  if (v18 == (void *)v19)
  {
    char v17 = 1;
    v20 = v18;
  }
  else
  {
    v20 = (void *)v19;
    v21 = [(REMListSectionsDataViewInvocationResult *)self listSectionStorages];
    v22 = [v4 listSectionStorages];
    char v17 = [v21 isEqual:v22];
  }
LABEL_14:

  return v17;
}

- (unint64_t)hash
{
  v3 = [(REMListSectionsDataViewInvocationResult *)self accountStorages];
  uint64_t v4 = [v3 hash];
  id v5 = [(REMListSectionsDataViewInvocationResult *)self listStorages];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(REMListSectionsDataViewInvocationResult *)self listSectionStorages];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSArray)accountStorages
{
  return self->_accountStorages;
}

- (NSArray)listStorages
{
  return self->_listStorages;
}

- (NSArray)listSectionStorages
{
  return self->_listSectionStorages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listSectionStorages, 0);
  objc_storeStrong((id *)&self->_listStorages, 0);

  objc_storeStrong((id *)&self->_accountStorages, 0);
}

@end