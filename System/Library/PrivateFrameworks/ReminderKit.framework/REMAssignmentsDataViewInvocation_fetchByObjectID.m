@interface REMAssignmentsDataViewInvocation_fetchByObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)allowConcealedObjects;
- (BOOL)isEqual:(id)a3;
- (NSArray)objectIDs;
- (REMAssignmentsDataViewInvocation_fetchByObjectID)initWithCoder:(id)a3;
- (REMAssignmentsDataViewInvocation_fetchByObjectID)initWithObjectIDs:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowConcealedObjects:(BOOL)a3;
@end

@implementation REMAssignmentsDataViewInvocation_fetchByObjectID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAssignmentsDataViewInvocation_fetchByObjectID)initWithObjectIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAssignmentsDataViewInvocation_fetchByObjectID;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_objectIDs, a3);
    v7->_allowConcealedObjects = 0;
  }

  return v7;
}

- (REMAssignmentsDataViewInvocation_fetchByObjectID)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"objectIDs"];

  uint64_t v9 = [v5 decodeBoolForKey:@"allowConcealedObjects"];
  if (v8)
  {
    v10 = [(REMAssignmentsDataViewInvocation_fetchByObjectID *)self initWithObjectIDs:v8];
    [(REMAssignmentsDataViewInvocation_fetchByObjectID *)v10 setAllowConcealedObjects:v9];
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(REMAssignmentsDataViewInvocation_fetchByObjectID *)self objectIDs];
  [v5 encodeObject:v4 forKey:@"objectIDs"];

  objc_msgSend(v5, "encodeBool:forKey:", -[REMAssignmentsDataViewInvocation_fetchByObjectID allowConcealedObjects](self, "allowConcealedObjects"), @"allowConcealedObjects");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v5 = [(REMAssignmentsDataViewInvocation_fetchByObjectID *)self objectIDs];
  uint64_t v6 = [v4 objectIDs];
  if (v5 == (void *)v6)
  {

    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = [(REMAssignmentsDataViewInvocation_fetchByObjectID *)self objectIDs];
  uint64_t v9 = [v4 objectIDs];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
LABEL_6:
    BOOL v12 = [(REMAssignmentsDataViewInvocation_fetchByObjectID *)self allowConcealedObjects];
    int v11 = v12 ^ [v4 allowConcealedObjects] ^ 1;
    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v11) = 0;
LABEL_7:

  return v11;
}

- (unint64_t)hash
{
  v2 = [(REMAssignmentsDataViewInvocation_fetchByObjectID *)self objectIDs];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (BOOL)allowConcealedObjects
{
  return self->_allowConcealedObjects;
}

- (void)setAllowConcealedObjects:(BOOL)a3
{
  self->_allowConcealedObjects = a3;
}

- (void).cxx_destruct
{
}

@end