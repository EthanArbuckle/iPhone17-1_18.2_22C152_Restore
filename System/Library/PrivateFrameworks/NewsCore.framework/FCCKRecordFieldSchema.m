@interface FCCKRecordFieldSchema
+ (FCCKRecordFieldSchema)fieldWithName:(BOOL)a3 isEncrypted:;
- (BOOL)isEqual:(id)a3;
- (FCCKRecordFieldSchema)init;
- (unint64_t)hash;
@end

@implementation FCCKRecordFieldSchema

+ (FCCKRecordFieldSchema)fieldWithName:(BOOL)a3 isEncrypted:
{
  id v5 = a2;
  self;
  v6 = [FCCKRecordFieldSchema alloc];
  id v7 = v5;
  if (v6)
  {
    v10.receiver = v6;
    v10.super_class = (Class)FCCKRecordFieldSchema;
    v8 = (FCCKRecordFieldSchema *)objc_msgSendSuper2(&v10, sel_init);
    v6 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_name, a2);
      v6->_isEncrypted = a3;
    }
  }

  return v6;
}

- (FCCKRecordFieldSchema)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCKRecordFieldSchema init]";
    __int16 v9 = 2080;
    objc_super v10 = "FCCKRecordSchema.m";
    __int16 v11 = 1024;
    int v12 = 21;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCKRecordFieldSchema init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = v6;
    v8 = v7;
    if (self) {
      name = self->_name;
    }
    else {
      name = 0;
    }
    uint64_t v10 = *((void *)v7 + 2);
    __int16 v11 = name;
    if ([(NSString *)v11 isEqualToString:v10])
    {
      if (self) {
        BOOL isEncrypted = self->_isEncrypted;
      }
      else {
        BOOL isEncrypted = 0;
      }
      BOOL v13 = isEncrypted ^ (v8[8] == 0);
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v2 = self;
  if (self) {
    self = (FCCKRecordFieldSchema *)self->_name;
  }
  unint64_t v3 = [(FCCKRecordFieldSchema *)self hash];
  if (v2) {
    BOOL isEncrypted = v2->_isEncrypted;
  }
  else {
    BOOL isEncrypted = 0;
  }
  id v5 = [NSNumber numberWithBool:isEncrypted];
  unint64_t v6 = [v5 hash] ^ v3;

  return v6;
}

- (void).cxx_destruct
{
}

@end