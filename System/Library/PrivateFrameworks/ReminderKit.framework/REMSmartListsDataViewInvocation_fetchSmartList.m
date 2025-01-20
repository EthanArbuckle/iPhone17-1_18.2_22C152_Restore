@interface REMSmartListsDataViewInvocation_fetchSmartList
+ (BOOL)supportsSecureCoding;
- (BOOL)createIfNeeded;
- (BOOL)isEqual:(id)a3;
- (NSString)smartListType;
- (REMObjectID)objectID;
- (REMSmartListsDataViewInvocation_fetchSmartList)initWithCoder:(id)a3;
- (REMSmartListsDataViewInvocation_fetchSmartList)initWithSmartListType:(id)a3 objectID:(id)a4 createIfNeeded:(BOOL)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreateIfNeeded:(BOOL)a3;
@end

@implementation REMSmartListsDataViewInvocation_fetchSmartList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSmartListsDataViewInvocation_fetchSmartList)initWithSmartListType:(id)a3 objectID:(id)a4 createIfNeeded:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMSmartListsDataViewInvocation_fetchSmartList;
  v11 = [(REMStoreInvocationValueStorage *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_smartListType, a3);
    objc_storeStrong((id *)&v12->_objectID, a4);
    v12->_createIfNeeded = a5;
  }

  return v12;
}

- (REMSmartListsDataViewInvocation_fetchSmartList)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smartListType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
  uint64_t v7 = [v4 decodeBoolForKey:@"createIfNeeded"];

  if (v5)
  {
    self = [(REMSmartListsDataViewInvocation_fetchSmartList *)self initWithSmartListType:v5 objectID:v6 createIfNeeded:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(REMSmartListsDataViewInvocation_fetchSmartList *)self smartListType];
  [v6 encodeObject:v4 forKey:@"smartListType"];

  v5 = [(REMSmartListsDataViewInvocation_fetchSmartList *)self objectID];
  [v6 encodeObject:v5 forKey:@"objectID"];

  objc_msgSend(v6, "encodeBool:forKey:", -[REMSmartListsDataViewInvocation_fetchSmartList createIfNeeded](self, "createIfNeeded"), @"createIfNeeded");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v5 = [(REMSmartListsDataViewInvocation_fetchSmartList *)self smartListType];
  uint64_t v6 = [v4 smartListType];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    uint64_t v7 = (void *)v6;
    v8 = [(REMSmartListsDataViewInvocation_fetchSmartList *)self smartListType];
    id v9 = [v4 smartListType];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_8;
    }
  }
  v11 = [(REMSmartListsDataViewInvocation_fetchSmartList *)self objectID];
  uint64_t v12 = [v4 objectID];
  if (v11 == (void *)v12)
  {

    goto LABEL_10;
  }
  v13 = (void *)v12;
  objc_super v14 = [(REMSmartListsDataViewInvocation_fetchSmartList *)self objectID];
  v15 = [v4 objectID];
  int v16 = [v14 isEqual:v15];

  if (v16)
  {
LABEL_10:
    BOOL v18 = [(REMSmartListsDataViewInvocation_fetchSmartList *)self createIfNeeded];
    int v17 = v18 ^ [v4 createIfNeeded] ^ 1;
    goto LABEL_11;
  }
LABEL_8:
  LOBYTE(v17) = 0;
LABEL_11:

  return v17;
}

- (unint64_t)hash
{
  v2 = [(REMSmartListsDataViewInvocation_fetchSmartList *)self smartListType];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)smartListType
{
  return self->_smartListType;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (BOOL)createIfNeeded
{
  return self->_createIfNeeded;
}

- (void)setCreateIfNeeded:(BOOL)a3
{
  self->_createIfNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);

  objc_storeStrong((id *)&self->_smartListType, 0);
}

@end