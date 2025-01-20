@interface REMListPredicateDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)predicateDescriptorForAllLists;
- (BOOL)isEqual:(id)a3;
- (NSArray)objectIDs;
- (REMListPredicateDescriptor)initWithCoder:(id)a3;
- (REMListPredicateDescriptor)initWithType:(int64_t)a3;
- (REMObjectID)accountID;
- (REMObjectID)parentListID;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setObjectIDs:(id)a3;
- (void)setParentListID:(id)a3;
@end

@implementation REMListPredicateDescriptor

- (REMListPredicateDescriptor)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMListPredicateDescriptor;
  result = [(REMListPredicateDescriptor *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

+ (id)predicateDescriptorForAllLists
{
  v2 = [[REMListPredicateDescriptor alloc] initWithType:0];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListPredicateDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)REMListPredicateDescriptor;
  objc_super v5 = [(REMListPredicateDescriptor *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"type"];
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[REMListPredicateDescriptor initWithCoder:](v7, v8);
      }
    }
    v5->_type = 0;
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"objectIDs"];
    objectIDs = v5->_objectIDs;
    v5->_objectIDs = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (REMObjectID *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentListID"];
    parentListID = v5->_parentListID;
    v5->_parentListID = (REMObjectID *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListPredicateDescriptor type](self, "type"), @"type");
  objc_super v5 = [(REMListPredicateDescriptor *)self objectIDs];
  [v4 encodeObject:v5 forKey:@"objectIDs"];

  uint64_t v6 = [(REMListPredicateDescriptor *)self accountID];
  [v4 encodeObject:v6 forKey:@"accountID"];

  id v7 = [(REMListPredicateDescriptor *)self parentListID];
  [v4 encodeObject:v7 forKey:@"parentListID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMListPredicateDescriptor *)a3;
  objc_super v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    int64_t v7 = [(REMListPredicateDescriptor *)self type];
    if (v7 != [(REMListPredicateDescriptor *)v6 type]) {
      goto LABEL_11;
    }
    v8 = [(REMListPredicateDescriptor *)self accountID];
    uint64_t v9 = [(REMListPredicateDescriptor *)v6 accountID];
    if (v8 == (void *)v9)
    {
    }
    else
    {
      uint64_t v10 = (void *)v9;
      v11 = [(REMListPredicateDescriptor *)self accountID];
      uint64_t v12 = [(REMListPredicateDescriptor *)v6 accountID];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_11;
      }
    }
    v15 = [(REMListPredicateDescriptor *)self parentListID];
    uint64_t v16 = [(REMListPredicateDescriptor *)v6 parentListID];
    if (v15 == (void *)v16)
    {
    }
    else
    {
      v17 = (void *)v16;
      v18 = [(REMListPredicateDescriptor *)self parentListID];
      objc_super v19 = [(REMListPredicateDescriptor *)v6 parentListID];
      int v20 = [v18 isEqual:v19];

      if (!v20)
      {
LABEL_11:
        char v14 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    v22 = [(REMListPredicateDescriptor *)self objectIDs];
    uint64_t v23 = [(REMListPredicateDescriptor *)v6 objectIDs];
    if (v22 == (void *)v23)
    {
      char v14 = 1;
      v24 = v22;
    }
    else
    {
      v24 = (void *)v23;
      v25 = [(REMListPredicateDescriptor *)self objectIDs];
      v26 = [(REMListPredicateDescriptor *)v6 objectIDs];
      char v14 = [v25 isEqual:v26];
    }
    goto LABEL_12;
  }
  char v14 = 1;
LABEL_13:

  return v14;
}

- (int64_t)type
{
  return self->_type;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (REMObjectID)parentListID
{
  return self->_parentListID;
}

- (void)setParentListID:(id)a3
{
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void)setObjectIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDs, 0);
  objc_storeStrong((id *)&self->_parentListID, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMListPredicateDescriptorType %ld", (uint8_t *)&v2, 0xCu);
}

@end