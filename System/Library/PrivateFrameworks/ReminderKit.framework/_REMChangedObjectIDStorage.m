@interface _REMChangedObjectIDStorage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)entityName;
- (NSUUID)uuid;
- (_REMChangedObjectIDStorage)initWithCoder:(id)a3;
- (_REMChangedObjectIDStorage)initWithUUID:(id)a3 entityName:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation _REMChangedObjectIDStorage

- (_REMChangedObjectIDStorage)initWithUUID:(id)a3 entityName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    v9 = +[REMLog changeTracking];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_REMChangedObjectIDStorage initWithUUID:entityName:](v6, (uint64_t)v8, v9);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)_REMChangedObjectIDStorage;
  v10 = [(_REMChangedObjectIDStorage *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v6 copy];
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;

    uint64_t v13 = [v8 copy];
    entityName = v10->_entityName;
    v10->_entityName = (NSString *)v13;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_REMChangedObjectIDStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];

  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(_REMChangedObjectIDStorage *)self initWithUUID:v6 entityName:v5];
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_REMChangedObjectIDStorage *)self entityName];
  [v4 encodeObject:v5 forKey:@"entityName"];

  id v6 = [(_REMChangedObjectIDStorage *)self uuid];
  [v4 encodeObject:v6 forKey:@"uuid"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_REMChangedObjectIDStorage *)a3;
  v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [(_REMChangedObjectIDStorage *)self entityName];
      uint64_t v8 = [(_REMChangedObjectIDStorage *)v6 entityName];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(_REMChangedObjectIDStorage *)self entityName];
        uint64_t v11 = [(_REMChangedObjectIDStorage *)v6 entityName];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      v14 = [(_REMChangedObjectIDStorage *)self uuid];
      uint64_t v15 = [(_REMChangedObjectIDStorage *)v6 uuid];
      if (v14 == (void *)v15)
      {
        char v13 = 1;
        objc_super v16 = v14;
      }
      else
      {
        objc_super v16 = (void *)v15;
        v17 = [(_REMChangedObjectIDStorage *)self uuid];
        v18 = [(_REMChangedObjectIDStorage *)v6 uuid];
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

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithUUID:(NSObject *)a3 entityName:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = [a1 UUIDString];
  OUTLINED_FUNCTION_2();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_FAULT, "_REMChangedObjectIDStorage: nil value passed to non-nil parameter. Something must have gone wrong. {uuid: %{public}@, entityName: %{public}@}", v6, 0x16u);
}

@end