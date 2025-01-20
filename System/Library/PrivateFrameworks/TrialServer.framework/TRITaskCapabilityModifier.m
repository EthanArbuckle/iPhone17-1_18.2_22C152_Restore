@interface TRITaskCapabilityModifier
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToModifier:(id)a3;
- (TRITaskCapabilityModifier)init;
- (TRITaskCapabilityModifier)initWithAdd:(unint64_t)a3 remove:(unint64_t)a4;
- (TRITaskCapabilityModifier)initWithCoder:(id)a3;
- (id)asPersistedModifier;
- (id)description;
- (id)serialize;
- (unint64_t)add;
- (unint64_t)hash;
- (unint64_t)remove;
- (unint64_t)updateCapability:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRITaskCapabilityModifier

- (TRITaskCapabilityModifier)init
{
  return [(TRITaskCapabilityModifier *)self initWithAdd:0 remove:0];
}

- (TRITaskCapabilityModifier)initWithAdd:(unint64_t)a3 remove:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TRITaskCapabilityModifier;
  result = [(TRITaskCapabilityModifier *)&v7 init];
  if (result)
  {
    result->_add = a3;
    result->_remove = a4;
  }
  return result;
}

- (unint64_t)updateCapability:(unint64_t)a3
{
  return (self->_add | a3) & ~self->_remove;
}

- (BOOL)isEqualToModifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (unint64_t add = self->_add, add == [v4 add]))
  {
    unint64_t remove = self->_remove;
    BOOL v8 = remove == [v5 remove];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRITaskCapabilityModifier *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRITaskCapabilityModifier *)self isEqualToModifier:v5];

  return v6;
}

- (unint64_t)hash
{
  return self->_remove - self->_add + 32 * self->_add;
}

- (id)asPersistedModifier
{
  v3 = objc_alloc_init(TRIPersistedTaskCapabilityModifier);
  [(TRIPersistedTaskCapabilityModifier *)v3 setAdd:self->_add];
  [(TRIPersistedTaskCapabilityModifier *)v3 setRemove:self->_remove];
  return v3;
}

- (id)serialize
{
  id v4 = [(TRITaskCapabilityModifier *)self asPersistedModifier];
  v5 = [v4 data];

  if (!v5)
  {
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRITaskCapabilityUtilities.m", 82, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  v3 = +[TRIPBMessage parseFromData:a3 error:&v12];
  id v4 = v12;
  if (!v3)
  {
    BOOL v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIPersistedTaskCapabilityModifier: %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (([v3 hasAdd] & 1) == 0)
  {
    BOOL v6 = TRILogCategory_Server();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    objc_super v7 = (objc_class *)objc_opt_class();
    BOOL v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412290;
    id v14 = v8;
    v9 = "Cannot decode message of type %@ with missing field: add";
LABEL_15:
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);

    goto LABEL_10;
  }
  if ([v3 hasRemove])
  {
    v5 = -[TRITaskCapabilityModifier initWithAdd:remove:]([TRITaskCapabilityModifier alloc], "initWithAdd:remove:", [v3 add], objc_msgSend(v3, "remove"));
    goto LABEL_11;
  }
  BOOL v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = (objc_class *)objc_opt_class();
    BOOL v8 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138412290;
    id v14 = v8;
    v9 = "Cannot decode message of type %@ with missing field: remove";
    goto LABEL_15;
  }
LABEL_10:

  v5 = 0;
LABEL_11:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRITaskCapabilityModifier)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];

  if (v5)
  {
    id v15 = 0;
    BOOL v6 = +[TRIPBMessage parseFromData:v5 error:&v15];
    id v7 = v15;
    if (!v6)
    {
      v9 = TRILogCategory_Server();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v7;
        _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIPersistedTaskCapabilityModifier: %@", buf, 0xCu);
      }
      goto LABEL_12;
    }
    if ([v6 hasAdd])
    {
      if ([v6 hasRemove])
      {
        self = -[TRITaskCapabilityModifier initWithAdd:remove:](self, "initWithAdd:remove:", [v6 add], objc_msgSend(v6, "remove"));
        BOOL v8 = self;
LABEL_13:

        goto LABEL_14;
      }
      v9 = TRILogCategory_Server();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        BOOL v8 = 0;
        goto LABEL_13;
      }
      id v14 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      id v12 = "Cannot decode message of type %@ with missing field: remove";
    }
    else
    {
      v9 = TRILogCategory_Server();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      id v12 = "Cannot decode message of type %@ with missing field: add";
    }
    _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);

    goto LABEL_12;
  }
  BOOL v8 = 0;
LABEL_14:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TRITaskCapabilityModifier *)self serialize];
  [v4 encodeObject:v5 forKey:@"pb"];
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<TRITaskCapabilityModifier | add:0x%llx remove:0x%llx", self->_add, self->_remove);
  return v2;
}

- (unint64_t)add
{
  return self->_add;
}

- (unint64_t)remove
{
  return self->_remove;
}

@end