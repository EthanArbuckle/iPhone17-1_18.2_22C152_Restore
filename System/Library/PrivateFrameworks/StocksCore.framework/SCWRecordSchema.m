@interface SCWRecordSchema
- (BOOL)isValidRecord:(id)a3;
- (NSArray)fieldNames;
- (NSArray)fieldSchemas;
- (NSString)recordType;
- (SCWRecordSchema)initWithRecordType:(id)a3 fieldSchemas:(id)a4;
- (id)schemaForFieldName:(id)a3;
@end

@implementation SCWRecordSchema

- (NSString)recordType
{
  return self->_recordType;
}

- (BOOL)isValidRecord:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 recordType];
  v6 = [(SCWRecordSchema *)self recordType];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = [(SCWRecordSchema *)self fieldSchemas];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (![*(id *)(*((void *)&v15 + 1) + 8 * i) isValidRecord:v4])
          {
            BOOL v13 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_13:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (NSArray)fieldSchemas
{
  return self->_fieldSchemas;
}

- (SCWRecordSchema)initWithRecordType:(id)a3 fieldSchemas:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWRecordSchema;
  v8 = [(SCWRecordSchema *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    recordType = v8->_recordType;
    v8->_recordType = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    fieldSchemas = v8->_fieldSchemas;
    v8->_fieldSchemas = (NSArray *)v11;
  }
  return v8;
}

- (NSArray)fieldNames
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(SCWRecordSchema *)self fieldSchemas];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) name];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)schemaForFieldName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(SCWRecordSchema *)self fieldSchemas];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 name];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldSchemas, 0);

  objc_storeStrong((id *)&self->_recordType, 0);
}

@end