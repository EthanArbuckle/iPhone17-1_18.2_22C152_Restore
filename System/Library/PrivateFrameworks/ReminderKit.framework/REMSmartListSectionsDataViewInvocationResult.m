@interface REMSmartListSectionsDataViewInvocationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)accountStorages;
- (NSArray)groupStorages;
- (NSArray)smartListSectionStorages;
- (NSArray)smartListStorages;
- (REMSmartListSectionsDataViewInvocationResult)initWithAccountStorages:(id)a3 smartListStorages:(id)a4 groupStorages:(id)a5 smartListSectionStorages:(id)a6;
- (REMSmartListSectionsDataViewInvocationResult)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMSmartListSectionsDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSmartListSectionsDataViewInvocationResult)initWithAccountStorages:(id)a3 smartListStorages:(id)a4 groupStorages:(id)a5 smartListSectionStorages:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)REMSmartListSectionsDataViewInvocationResult;
  v15 = [(REMStoreInvocationValueStorage *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountStorages, a3);
    objc_storeStrong((id *)&v16->_smartListStorages, a4);
    objc_storeStrong((id *)&v16->_groupStorages, a5);
    objc_storeStrong((id *)&v16->_smartListSectionStorages, a6);
  }

  return v16;
}

- (REMSmartListSectionsDataViewInvocationResult)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"accountStorages"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  id v12 = [v5 decodeObjectOfClasses:v11 forKey:@"smartListStorages"];

  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v5 decodeObjectOfClasses:v15 forKey:@"groupStorages"];

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v20 = [v5 decodeObjectOfClasses:v19 forKey:@"smartListSectionStorages"];

  v21 = 0;
  if (v12 && v20)
  {
    self = [(REMSmartListSectionsDataViewInvocationResult *)self initWithAccountStorages:v8 smartListStorages:v12 groupStorages:v16 smartListSectionStorages:v20];
    v21 = self;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMSmartListSectionsDataViewInvocationResult *)self accountStorages];
  [v4 encodeObject:v5 forKey:@"accountStorages"];

  uint64_t v6 = [(REMSmartListSectionsDataViewInvocationResult *)self smartListStorages];
  [v4 encodeObject:v6 forKey:@"smartListStorages"];

  v7 = [(REMSmartListSectionsDataViewInvocationResult *)self groupStorages];
  [v4 encodeObject:v7 forKey:@"groupStorages"];

  id v8 = [(REMSmartListSectionsDataViewInvocationResult *)self smartListSectionStorages];
  [v4 encodeObject:v8 forKey:@"smartListSectionStorages"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  id v5 = [(REMSmartListSectionsDataViewInvocationResult *)self accountStorages];
  uint64_t v6 = [v4 accountStorages];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    id v8 = [(REMSmartListSectionsDataViewInvocationResult *)self accountStorages];
    v9 = [v4 accountStorages];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_12;
    }
  }
  id v11 = [(REMSmartListSectionsDataViewInvocationResult *)self smartListStorages];
  uint64_t v12 = [v4 smartListStorages];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(REMSmartListSectionsDataViewInvocationResult *)self smartListStorages];
    v15 = [v4 smartListStorages];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  v17 = [(REMSmartListSectionsDataViewInvocationResult *)self groupStorages];
  uint64_t v18 = [v4 groupStorages];
  if (v17 == (void *)v18)
  {
  }
  else
  {
    v19 = (void *)v18;
    v20 = [(REMSmartListSectionsDataViewInvocationResult *)self groupStorages];
    v21 = [v4 groupStorages];
    int v22 = [v20 isEqual:v21];

    if (!v22)
    {
LABEL_12:
      char v23 = 0;
      goto LABEL_13;
    }
  }
  v25 = [(REMSmartListSectionsDataViewInvocationResult *)self smartListSectionStorages];
  uint64_t v26 = [v4 smartListSectionStorages];
  if (v25 == (void *)v26)
  {
    char v23 = 1;
    v27 = v25;
  }
  else
  {
    v27 = (void *)v26;
    v28 = [(REMSmartListSectionsDataViewInvocationResult *)self smartListSectionStorages];
    v29 = [v4 smartListSectionStorages];
    char v23 = [v28 isEqual:v29];
  }
LABEL_13:

  return v23;
}

- (unint64_t)hash
{
  v3 = [(REMSmartListSectionsDataViewInvocationResult *)self accountStorages];
  uint64_t v4 = [v3 hash];
  id v5 = [(REMSmartListSectionsDataViewInvocationResult *)self smartListStorages];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(REMSmartListSectionsDataViewInvocationResult *)self groupStorages];
  uint64_t v8 = [v7 hash];
  v9 = [(REMSmartListSectionsDataViewInvocationResult *)self smartListSectionStorages];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (NSArray)accountStorages
{
  return self->_accountStorages;
}

- (NSArray)smartListStorages
{
  return self->_smartListStorages;
}

- (NSArray)groupStorages
{
  return self->_groupStorages;
}

- (NSArray)smartListSectionStorages
{
  return self->_smartListSectionStorages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartListSectionStorages, 0);
  objc_storeStrong((id *)&self->_groupStorages, 0);
  objc_storeStrong((id *)&self->_smartListStorages, 0);

  objc_storeStrong((id *)&self->_accountStorages, 0);
}

@end