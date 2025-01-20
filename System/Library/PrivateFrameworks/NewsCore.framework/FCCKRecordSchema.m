@interface FCCKRecordSchema
+ (FCCKRecordSchema)recordWithType:(void *)a3 fields:;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFieldEncrypted:(uint64_t)a1;
- (BOOL)isFieldKnown:(uint64_t)a1;
- (FCCKRecordSchema)init;
- (id)allEncryptedFieldNames;
- (id)allUnencryptedFieldNames;
- (unint64_t)hash;
@end

@implementation FCCKRecordSchema

+ (FCCKRecordSchema)recordWithType:(void *)a3 fields:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = [FCCKRecordSchema alloc];
  id v7 = v5;
  id v8 = v4;
  if (v6)
  {
    v25.receiver = v6;
    v25.super_class = (Class)FCCKRecordSchema;
    v9 = (FCCKRecordSchema *)objc_msgSendSuper2(&v25, sel_init);
    v6 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_recordType, a2);
      v10 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
            if (v16) {
              uint64_t v17 = *(void *)(v16 + 16);
            }
            else {
              uint64_t v17 = 0;
            }
            -[NSDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v16, v17, (void)v21);
            ++v15;
          }
          while (v13 != v15);
          uint64_t v18 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
          uint64_t v13 = v18;
        }
        while (v18);
      }

      fieldSchemasByName = v6->_fieldSchemasByName;
      v6->_fieldSchemasByName = v10;
    }
  }

  return v6;
}

- (FCCKRecordSchema)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCCKRecordSchema init]";
    __int16 v9 = 2080;
    v10 = "FCCKRecordSchema.m";
    __int16 v11 = 1024;
    int v12 = 68;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCKRecordSchema init]"];
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
    id v7 = (id *)v6;
    if (self) {
      recordType = self->_recordType;
    }
    else {
      recordType = 0;
    }
    __int16 v9 = recordType;
    id v10 = v7[2];
    if ([(NSString *)v9 isEqualToString:v10]) {
      BOOL v11 = [(NSDictionary *)self->_fieldSchemasByName isEqualToDictionary:v7[1]];
    }
    else {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  if (self) {
    recordType = self->_recordType;
  }
  else {
    recordType = 0;
  }
  id v4 = recordType;
  uint64_t v5 = [(NSString *)v4 hash];
  uint64_t v6 = [(NSDictionary *)self->_fieldSchemasByName hash];

  return v6 ^ v5;
}

- (id)allEncryptedFieldNames
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 8) allValues];
    v2 = objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_28_3);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id __42__FCCKRecordSchema_allEncryptedFieldNames__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  v3 = v2;
  if (v2 && *((unsigned char *)v2 + 8)) {
    id v4 = v2[2];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)allUnencryptedFieldNames
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 8) allValues];
    v2 = objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_30_0);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id __44__FCCKRecordSchema_allUnencryptedFieldNames__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (*((unsigned char *)v2 + 8))
    {
      id v4 = 0;
      goto LABEL_6;
    }
    uint64_t v5 = (void *)*((void *)v2 + 2);
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v4 = v5;
LABEL_6:

  return v4;
}

- (BOOL)isFieldKnown:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v2 = [*(id *)(a1 + 8) objectForKeyedSubscript:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isFieldEncrypted:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v2 = [*(id *)(a1 + 8) objectForKeyedSubscript:a2];
  if (v2) {
    BOOL v3 = v2[8] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_fieldSchemasByName, 0);
}

@end