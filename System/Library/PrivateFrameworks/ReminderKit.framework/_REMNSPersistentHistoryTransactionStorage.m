@interface _REMNSPersistentHistoryTransactionStorage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)changes;
- (NSDate)timestamp;
- (NSString)author;
- (NSString)bundleID;
- (NSString)contextName;
- (NSString)processID;
- (NSString)storeID;
- (REMNSPersistentHistoryToken)token;
- (REMObjectID)accountID;
- (_REMNSPersistentHistoryTransactionStorage)initWithCoder:(id)a3;
- (int64_t)transactionNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setChanges:(id)a3;
- (void)setContextName:(id)a3;
- (void)setProcessID:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setToken:(id)a3;
- (void)setTransactionNumber:(int64_t)a3;
@end

@implementation _REMNSPersistentHistoryTransactionStorage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_REMNSPersistentHistoryTransactionStorage *)self timestamp];
  [v4 encodeObject:v5 forKey:@"timestamp"];

  v6 = [(_REMNSPersistentHistoryTransactionStorage *)self changes];
  [v4 encodeObject:v6 forKey:@"changes"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[_REMNSPersistentHistoryTransactionStorage transactionNumber](self, "transactionNumber"), @"transactionNumber");
  v7 = [(_REMNSPersistentHistoryTransactionStorage *)self accountID];
  [v4 encodeObject:v7 forKey:@"accountID"];

  v8 = [(_REMNSPersistentHistoryTransactionStorage *)self storeID];
  [v4 encodeObject:v8 forKey:@"storeID"];

  v9 = [(_REMNSPersistentHistoryTransactionStorage *)self bundleID];
  [v4 encodeObject:v9 forKey:@"bundleID"];

  v10 = [(_REMNSPersistentHistoryTransactionStorage *)self processID];
  [v4 encodeObject:v10 forKey:@"processID"];

  v11 = [(_REMNSPersistentHistoryTransactionStorage *)self contextName];
  [v4 encodeObject:v11 forKey:@"contextName"];

  v12 = [(_REMNSPersistentHistoryTransactionStorage *)self author];
  [v4 encodeObject:v12 forKey:@"author"];

  id v13 = [(_REMNSPersistentHistoryTransactionStorage *)self token];
  [v4 encodeObject:v13 forKey:@"token"];
}

- (_REMNSPersistentHistoryTransactionStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_REMNSPersistentHistoryTransactionStorage;
  v5 = [(_REMNSPersistentHistoryTransactionStorage *)&v30 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    if (!v6)
    {
      v28 = 0;
      goto LABEL_6;
    }
    token = v5->_token;
    v5->_token = v6;
    v8 = v6;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"changes"];
    changes = v5->_changes;
    v5->_changes = (NSArray *)v14;

    v5->_transactionNumber = [v4 decodeInt64ForKey:@"transactionNumber"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (REMObjectID *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeID"];
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processID"];
    processID = v5->_processID;
    v5->_processID = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextName"];
    contextName = v5->_contextName;
    v5->_contextName = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"author"];
    author = v5->_author;
    v5->_author = (NSString *)v26;
  }
  v28 = v5;
LABEL_6:

  return v28;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSArray)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
}

- (int64_t)transactionNumber
{
  return self->_transactionNumber;
}

- (void)setTransactionNumber:(int64_t)a3
{
  self->_transactionNumber = a3;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)processID
{
  return self->_processID;
}

- (void)setProcessID:(id)a3
{
}

- (NSString)contextName
{
  return self->_contextName;
}

- (void)setContextName:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (REMNSPersistentHistoryToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_contextName, 0);
  objc_storeStrong((id *)&self->_processID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_changes, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_REMNSPersistentHistoryTransactionStorage *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(_REMNSPersistentHistoryTransactionStorage *)self timestamp];
      uint64_t v8 = [(_REMNSPersistentHistoryTransactionStorage *)v6 timestamp];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        uint64_t v9 = (void *)v8;
        v10 = [(_REMNSPersistentHistoryTransactionStorage *)self timestamp];
        v11 = [(_REMNSPersistentHistoryTransactionStorage *)v6 timestamp];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_35;
        }
      }
      uint64_t v14 = [(_REMNSPersistentHistoryTransactionStorage *)self changes];
      uint64_t v15 = [(_REMNSPersistentHistoryTransactionStorage *)v6 changes];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        uint64_t v16 = (void *)v15;
        v17 = [(_REMNSPersistentHistoryTransactionStorage *)self changes];
        uint64_t v18 = [(_REMNSPersistentHistoryTransactionStorage *)v6 changes];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_35;
        }
      }
      int64_t v20 = [(_REMNSPersistentHistoryTransactionStorage *)self transactionNumber];
      if (v20 == [(_REMNSPersistentHistoryTransactionStorage *)v6 transactionNumber])
      {
        v21 = [(_REMNSPersistentHistoryTransactionStorage *)self accountID];
        uint64_t v22 = [(_REMNSPersistentHistoryTransactionStorage *)v6 accountID];
        if (v21 == (void *)v22)
        {
        }
        else
        {
          v23 = (void *)v22;
          uint64_t v24 = [(_REMNSPersistentHistoryTransactionStorage *)self accountID];
          v25 = [(_REMNSPersistentHistoryTransactionStorage *)v6 accountID];
          int v26 = [v24 isEqual:v25];

          if (!v26) {
            goto LABEL_35;
          }
        }
        v27 = [(_REMNSPersistentHistoryTransactionStorage *)self storeID];
        uint64_t v28 = [(_REMNSPersistentHistoryTransactionStorage *)v6 storeID];
        if (v27 == (void *)v28)
        {
        }
        else
        {
          v29 = (void *)v28;
          objc_super v30 = [(_REMNSPersistentHistoryTransactionStorage *)self storeID];
          v31 = [(_REMNSPersistentHistoryTransactionStorage *)v6 storeID];
          int v32 = [v30 isEqual:v31];

          if (!v32) {
            goto LABEL_35;
          }
        }
        v33 = [(_REMNSPersistentHistoryTransactionStorage *)self bundleID];
        uint64_t v34 = [(_REMNSPersistentHistoryTransactionStorage *)v6 bundleID];
        if (v33 == (void *)v34)
        {
        }
        else
        {
          v35 = (void *)v34;
          v36 = [(_REMNSPersistentHistoryTransactionStorage *)self bundleID];
          v37 = [(_REMNSPersistentHistoryTransactionStorage *)v6 bundleID];
          int v38 = [v36 isEqual:v37];

          if (!v38) {
            goto LABEL_35;
          }
        }
        v39 = [(_REMNSPersistentHistoryTransactionStorage *)self processID];
        uint64_t v40 = [(_REMNSPersistentHistoryTransactionStorage *)v6 processID];
        if (v39 == (void *)v40)
        {
        }
        else
        {
          v41 = (void *)v40;
          v42 = [(_REMNSPersistentHistoryTransactionStorage *)self processID];
          v43 = [(_REMNSPersistentHistoryTransactionStorage *)v6 processID];
          int v44 = [v42 isEqual:v43];

          if (!v44) {
            goto LABEL_35;
          }
        }
        v45 = [(_REMNSPersistentHistoryTransactionStorage *)self contextName];
        uint64_t v46 = [(_REMNSPersistentHistoryTransactionStorage *)v6 contextName];
        if (v45 == (void *)v46)
        {
        }
        else
        {
          v47 = (void *)v46;
          v48 = [(_REMNSPersistentHistoryTransactionStorage *)self contextName];
          v49 = [(_REMNSPersistentHistoryTransactionStorage *)v6 contextName];
          int v50 = [v48 isEqual:v49];

          if (!v50) {
            goto LABEL_35;
          }
        }
        v51 = [(_REMNSPersistentHistoryTransactionStorage *)self author];
        uint64_t v52 = [(_REMNSPersistentHistoryTransactionStorage *)v6 author];
        if (v51 == (void *)v52)
        {
        }
        else
        {
          v53 = (void *)v52;
          v54 = [(_REMNSPersistentHistoryTransactionStorage *)self author];
          v55 = [(_REMNSPersistentHistoryTransactionStorage *)v6 author];
          int v56 = [v54 isEqual:v55];

          if (!v56) {
            goto LABEL_35;
          }
        }
        v58 = [(_REMNSPersistentHistoryTransactionStorage *)self token];
        uint64_t v59 = [(_REMNSPersistentHistoryTransactionStorage *)v6 token];
        if (v58 == (void *)v59)
        {
          char v13 = 1;
          v60 = v58;
        }
        else
        {
          v60 = (void *)v59;
          v61 = [(_REMNSPersistentHistoryTransactionStorage *)self token];
          v62 = [(_REMNSPersistentHistoryTransactionStorage *)v6 token];
          char v13 = [v61 isEqual:v62];
        }
        goto LABEL_36;
      }
    }
LABEL_35:
    char v13 = 0;
LABEL_36:

    goto LABEL_37;
  }
  char v13 = 1;
LABEL_37:

  return v13;
}

@end