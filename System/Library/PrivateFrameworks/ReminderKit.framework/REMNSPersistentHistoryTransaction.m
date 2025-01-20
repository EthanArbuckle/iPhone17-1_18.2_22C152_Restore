@interface REMNSPersistentHistoryTransaction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMNSPersistentHistoryTransaction)initWithCoder:(id)a3;
- (REMNSPersistentHistoryTransaction)initWithStorage:(id)a3;
- (_REMNSPersistentHistoryTransactionStorage)storage;
- (id)accountID;
- (id)author;
- (id)changes;
- (id)description;
- (id)storeID;
- (id)timestamp;
- (id)token;
- (void)_resolveAccountID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setStorage:(id)a3;
@end

@implementation REMNSPersistentHistoryTransaction

- (REMNSPersistentHistoryTransaction)initWithStorage:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)REMNSPersistentHistoryTransaction;
    v6 = [(REMNSPersistentHistoryTransaction *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_storage, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_resolveAccountID:(id)a3
{
  id v4 = a3;
  id v5 = [(REMNSPersistentHistoryTransaction *)self storage];
  [v5 setAccountID:v4];
}

- (id)description
{
  v15 = NSString;
  v3 = [(REMNSPersistentHistoryTransaction *)self storage];
  uint64_t v4 = [v3 transactionNumber];
  id v5 = [(REMNSPersistentHistoryTransaction *)self timestamp];
  v6 = [(REMNSPersistentHistoryTransaction *)self storeID];
  v7 = [(REMNSPersistentHistoryTransaction *)self storage];
  v8 = [v7 contextName];
  v9 = [(REMNSPersistentHistoryTransaction *)self author];
  objc_super v10 = [(REMNSPersistentHistoryTransaction *)self changes];
  uint64_t v11 = [v10 count];
  v12 = [(REMNSPersistentHistoryTransaction *)self token];
  v13 = [v15 stringWithFormat:@"<REMNSPersistentHistoryTransaction - txnNo(%lld) timestamp(%@) storeID(%@) contextName(%@) author(%@) chgCount(%ld) token(%@)>", v4, v5, v6, v8, v9, v11, v12];

  return v13;
}

- (id)timestamp
{
  v2 = [(REMNSPersistentHistoryTransaction *)self storage];
  v3 = [v2 timestamp];

  return v3;
}

- (id)changes
{
  v2 = [(REMNSPersistentHistoryTransaction *)self storage];
  v3 = [v2 changes];

  return v3;
}

- (id)token
{
  v2 = [(REMNSPersistentHistoryTransaction *)self storage];
  v3 = [v2 token];

  return v3;
}

- (id)accountID
{
  v2 = [(REMNSPersistentHistoryTransaction *)self storage];
  v3 = [v2 accountID];

  return v3;
}

- (id)storeID
{
  v2 = [(REMNSPersistentHistoryTransaction *)self storage];
  v3 = [v2 storeID];

  return v3;
}

- (id)author
{
  v2 = [(REMNSPersistentHistoryTransaction *)self storage];
  v3 = [v2 author];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMNSPersistentHistoryTransaction *)self storage];
  [v4 encodeObject:v5 forKey:@"storage"];
}

- (REMNSPersistentHistoryTransaction)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storage"];
  v6 = [(REMNSPersistentHistoryTransaction *)self initWithStorage:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = [(REMNSPersistentHistoryTransaction *)v6 storage];
  v8 = [v7 changes];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "setInternal_ChangeTransaction:", v6);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v6;
}

- (_REMNSPersistentHistoryTransactionStorage)storage
{
  return (_REMNSPersistentHistoryTransactionStorage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMNSPersistentHistoryTransaction *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(REMNSPersistentHistoryTransaction *)self storage];
      uint64_t v8 = [(REMNSPersistentHistoryTransaction *)v6 storage];
      if (v7 == (void *)v8)
      {
        char v12 = 1;
        uint64_t v9 = v7;
      }
      else
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = [(REMNSPersistentHistoryTransaction *)self storage];
        uint64_t v11 = [(REMNSPersistentHistoryTransaction *)v6 storage];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

@end