@interface REMSmartListsDataViewInvocationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)smartListStorages;
- (NSDictionary)accountStorages;
- (NSDictionary)parentListStorages;
- (REMSmartListsDataViewInvocationResult)initWithCoder:(id)a3;
- (REMSmartListsDataViewInvocationResult)initWithSmartListStorages:(id)a3;
- (REMSmartListsDataViewInvocationResult)initWithSmartListStorages:(id)a3 accountStorages:(id)a4 parentListStorages:(id)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMSmartListsDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSmartListsDataViewInvocationResult)initWithSmartListStorages:(id)a3
{
  return [(REMSmartListsDataViewInvocationResult *)self initWithSmartListStorages:a3 accountStorages:MEMORY[0x1E4F1CC08] parentListStorages:MEMORY[0x1E4F1CC08]];
}

- (REMSmartListsDataViewInvocationResult)initWithSmartListStorages:(id)a3 accountStorages:(id)a4 parentListStorages:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMSmartListsDataViewInvocationResult;
  v12 = [(REMStoreInvocationValueStorage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_smartListStorages, a3);
    objc_storeStrong((id *)&v13->_accountStorages, a4);
    objc_storeStrong((id *)&v13->_parentListStorages, a5);
  }

  return v13;
}

- (REMSmartListsDataViewInvocationResult)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"smartListStorages"];

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v13 = [v5 decodeObjectOfClasses:v12 forKey:@"accountStorages"];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
  v18 = [v5 decodeObjectOfClasses:v17 forKey:@"parentListStorages"];

  if (v8)
  {
    if (v13 && v18) {
      v19 = [(REMSmartListsDataViewInvocationResult *)self initWithSmartListStorages:v8 accountStorages:v13 parentListStorages:v18];
    }
    else {
      v19 = [(REMSmartListsDataViewInvocationResult *)self initWithSmartListStorages:v8];
    }
    self = v19;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMSmartListsDataViewInvocationResult *)self smartListStorages];
  [v4 encodeObject:v5 forKey:@"smartListStorages"];

  uint64_t v6 = [(REMSmartListsDataViewInvocationResult *)self accountStorages];
  [v4 encodeObject:v6 forKey:@"accountStorages"];

  id v7 = [(REMSmartListsDataViewInvocationResult *)self parentListStorages];
  [v4 encodeObject:v7 forKey:@"parentListStorages"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v5 = [(REMSmartListsDataViewInvocationResult *)self smartListStorages];
  uint64_t v6 = [v4 smartListStorages];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    v8 = [(REMSmartListsDataViewInvocationResult *)self smartListStorages];
    id v9 = [v4 smartListStorages];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_8;
    }
  }
  uint64_t v11 = [(REMSmartListsDataViewInvocationResult *)self accountStorages];
  uint64_t v12 = [v4 accountStorages];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    v14 = [(REMSmartListsDataViewInvocationResult *)self accountStorages];
    uint64_t v15 = [v4 accountStorages];
    int v16 = [v14 isEqual:v15];

    if (!v16)
    {
LABEL_8:
      char v17 = 0;
      goto LABEL_14;
    }
  }
  v18 = [(REMSmartListsDataViewInvocationResult *)self parentListStorages];
  uint64_t v19 = [v4 parentListStorages];
  if (v18 == (void *)v19)
  {
    char v17 = 1;
    v20 = v18;
  }
  else
  {
    v20 = (void *)v19;
    v21 = [(REMSmartListsDataViewInvocationResult *)self parentListStorages];
    v22 = [v4 parentListStorages];
    char v17 = [v21 isEqual:v22];
  }
LABEL_14:

  return v17;
}

- (unint64_t)hash
{
  v3 = [(REMSmartListsDataViewInvocationResult *)self smartListStorages];
  uint64_t v4 = [v3 hash];
  id v5 = [(REMSmartListsDataViewInvocationResult *)self accountStorages];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(REMSmartListsDataViewInvocationResult *)self parentListStorages];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSArray)smartListStorages
{
  return self->_smartListStorages;
}

- (NSDictionary)accountStorages
{
  return self->_accountStorages;
}

- (NSDictionary)parentListStorages
{
  return self->_parentListStorages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentListStorages, 0);
  objc_storeStrong((id *)&self->_accountStorages, 0);

  objc_storeStrong((id *)&self->_smartListStorages, 0);
}

@end