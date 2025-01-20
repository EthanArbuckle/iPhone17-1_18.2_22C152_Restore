@interface REMReplicaIDSource
+ (BOOL)supportsSecureCoding;
+ (id)crdtIDWithObjectID:(id)a3 property:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)crdtID;
- (REMObjectID)accountID;
- (REMReplicaIDSource)initWithAccountID:(id)a3 crdtID:(id)a4;
- (REMReplicaIDSource)initWithAccountID:(id)a3 objectID:(id)a4 property:(id)a5;
- (REMReplicaIDSource)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMReplicaIDSource

+ (id)crdtIDWithObjectID:(id)a3 property:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  v7 = [a3 uuid];
  v8 = [v5 stringWithFormat:@"%@/%@", v7, v6];

  return v8;
}

- (REMReplicaIDSource)initWithAccountID:(id)a3 objectID:(id)a4 property:(id)a5
{
  id v8 = a3;
  v9 = +[REMReplicaIDSource crdtIDWithObjectID:a4 property:a5];
  v10 = [(REMReplicaIDSource *)self initWithAccountID:v8 crdtID:v9];

  return v10;
}

- (REMReplicaIDSource)initWithAccountID:(id)a3 crdtID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMReplicaIDSource;
  v9 = [(REMReplicaIDSource *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountID, a3);
    uint64_t v11 = [v8 copy];
    crdtID = v10->_crdtID;
    v10->_crdtID = (NSString *)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMReplicaIDSource *)self accountID];
  [v4 encodeObject:v5 forKey:@"accountID"];

  id v6 = [(REMReplicaIDSource *)self crdtID];
  [v4 encodeObject:v6 forKey:@"crdtID"];
}

- (REMReplicaIDSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"crdtID"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    self = [(REMReplicaIDSource *)self initWithAccountID:v5 crdtID:v6];
    id v8 = self;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [REMReplicaIDSource alloc];
  v5 = [(REMReplicaIDSource *)self accountID];
  id v6 = [(REMReplicaIDSource *)self crdtID];
  BOOL v7 = [(REMReplicaIDSource *)v4 initWithAccountID:v5 crdtID:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMReplicaIDSource *)a3;
  v5 = v4;
  if (v4 != self)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [(REMReplicaIDSource *)self accountID];
      uint64_t v8 = [(REMReplicaIDSource *)v6 accountID];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(REMReplicaIDSource *)self accountID];
        uint64_t v11 = [(REMReplicaIDSource *)v6 accountID];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      objc_super v14 = [(REMReplicaIDSource *)self crdtID];
      uint64_t v15 = [(REMReplicaIDSource *)v6 crdtID];
      if (v14 == (void *)v15)
      {
        char v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMReplicaIDSource *)self crdtID];
        v18 = [(REMReplicaIDSource *)v6 crdtID];
        char v13 = [v17 isEqual:v18];
      }
      goto LABEL_12;
    }
LABEL_5:
    char v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v13 = 1;
LABEL_13:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMReplicaIDSource *)self accountID];
  id v6 = [(REMReplicaIDSource *)self crdtID];
  BOOL v7 = [v3 stringWithFormat:@"<%@: %p> (account=%@, crdtId=%@)", v4, self, v5, v6];

  return v7;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (NSString)crdtID
{
  return self->_crdtID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crdtID, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end