@interface REMAttachment
+ (BOOL)supportsSecureCoding;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)uti;
- (REMAttachment)initWithAttachment:(id)a3 objectID:(id)a4 accountID:(id)a5 reminderID:(id)a6;
- (REMAttachment)initWithCoder:(id)a3;
- (REMAttachment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 UTI:(id)a6;
- (REMObjectID)accountID;
- (REMObjectID)objectID;
- (REMObjectID)reminderID;
- (id)_deepCopy;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMAttachment

- (REMAttachment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 UTI:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)REMAttachment;
  v15 = [(REMAttachment *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_objectID, a3);
    objc_storeStrong((id *)&v16->_accountID, a4);
    objc_storeStrong((id *)&v16->_reminderID, a5);
    objc_storeStrong((id *)&v16->_uti, a6);
  }

  return v16;
}

- (REMAttachment)initWithAttachment:(id)a3 objectID:(id)a4 accountID:(id)a5 reminderID:(id)a6
{
  v10 = (REMObjectID *)a4;
  id v11 = (REMObjectID *)a5;
  id v12 = (REMObjectID *)a6;
  id v13 = [a3 _deepCopy];

  objectID = v13->_objectID;
  v13->_objectID = v10;
  v15 = v10;

  accountID = v13->_accountID;
  v13->_accountID = v11;
  v17 = v11;

  reminderID = v13->_reminderID;
  v13->_reminderID = v12;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reminderID"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uti"];

  v9 = [(REMAttachment *)self initWithObjectID:v5 accountID:v6 reminderID:v7 UTI:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMAttachment *)self objectID];
  [v4 encodeObject:v5 forKey:@"objectID"];

  v6 = [(REMAttachment *)self accountID];
  [v4 encodeObject:v6 forKey:@"accountID"];

  v7 = [(REMAttachment *)self reminderID];
  [v4 encodeObject:v7 forKey:@"reminderID"];

  id v8 = [(REMAttachment *)self uti];
  [v4 encodeObject:v8 forKey:@"uti"];
}

- (id)_deepCopy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(REMAttachment *)self objectID];
  v5 = [(REMAttachment *)self accountID];
  v6 = [(REMAttachment *)self reminderID];
  v7 = [(REMAttachment *)self uti];
  id v8 = (void *)[v3 initWithObjectID:v4 accountID:v5 reminderID:v6 UTI:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMAttachment *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(REMAttachment *)v5 objectID];
      uint64_t v7 = [(REMAttachment *)self objectID];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        v9 = [(REMAttachment *)v5 objectID];
        v10 = [(REMAttachment *)self objectID];
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_15;
        }
      }
      id v13 = [(REMAttachment *)v5 accountID];
      uint64_t v14 = [(REMAttachment *)self accountID];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        v15 = (void *)v14;
        v16 = [(REMAttachment *)v5 accountID];
        v17 = [(REMAttachment *)self accountID];
        int v18 = [v16 isEqual:v17];

        if (!v18) {
          goto LABEL_15;
        }
      }
      v19 = [(REMAttachment *)v5 reminderID];
      uint64_t v20 = [(REMAttachment *)self reminderID];
      if (v19 == (void *)v20)
      {
      }
      else
      {
        v21 = (void *)v20;
        v22 = [(REMAttachment *)v5 reminderID];
        v23 = [(REMAttachment *)self reminderID];
        int v24 = [v22 isEqual:v23];

        if (!v24)
        {
LABEL_15:
          char v12 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      v25 = [(REMAttachment *)v5 uti];
      v26 = [(REMAttachment *)self uti];
      if (v25 == v26)
      {
        char v12 = 1;
      }
      else
      {
        v27 = [(REMAttachment *)v5 uti];
        v28 = [(REMAttachment *)self uti];
        char v12 = [v27 isEqual:v28];
      }
      goto LABEL_21;
    }
    char v12 = 0;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  v2 = [(REMAttachment *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMAttachment *)self objectID];
  v6 = [(REMAttachment *)self uti];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p objectID: %@, uti: %@>", v4, self, v5, v6];

  return v7;
}

+ (id)newObjectID
{
  unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [a1 cdEntityName];
  v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDAttachment";
}

- (NSString)uti
{
  return self->_uti;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMObjectID)reminderID
{
  return self->_reminderID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);

  objc_storeStrong((id *)&self->_uti, 0);
}

@end