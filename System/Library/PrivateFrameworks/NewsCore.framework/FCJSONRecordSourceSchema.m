@interface FCJSONRecordSourceSchema
- (FCJSONRecordSourceSchema)initWithRecordType:(id)a3 recordIDPrefix:(id)a4 keys:(id)a5 localizableKeys:(id)a6;
- (FCJSONRecordSourceSchema)initWithRecordType:(id)a3 recordIDPrefix:(id)a4 keys:(id)a5 localizableKeys:(id)a6 alwaysLocalizedKeys:(id)a7;
- (NSArray)allKeys;
- (NSArray)alwaysLocalizedKeys;
- (NSArray)keys;
- (NSArray)localizableKeys;
- (NSString)recordIDPrefix;
- (NSString)recordType;
@end

@implementation FCJSONRecordSourceSchema

- (NSArray)localizableKeys
{
  return self->_localizableKeys;
}

- (NSArray)alwaysLocalizedKeys
{
  return self->_alwaysLocalizedKeys;
}

- (NSArray)allKeys
{
  return self->_allKeys;
}

- (NSArray)keys
{
  return self->_keys;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (FCJSONRecordSourceSchema)initWithRecordType:(id)a3 recordIDPrefix:(id)a4 keys:(id)a5 localizableKeys:(id)a6 alwaysLocalizedKeys:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)FCJSONRecordSourceSchema;
  v17 = [(FCJSONRecordSourceSchema *)&v32 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    recordType = v17->_recordType;
    v17->_recordType = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    recordIDPrefix = v17->_recordIDPrefix;
    v17->_recordIDPrefix = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    keys = v17->_keys;
    v17->_keys = (NSArray *)v22;

    uint64_t v24 = [v15 copy];
    localizableKeys = v17->_localizableKeys;
    v17->_localizableKeys = (NSArray *)v24;

    uint64_t v26 = [v16 copy];
    alwaysLocalizedKeys = v17->_alwaysLocalizedKeys;
    v17->_alwaysLocalizedKeys = (NSArray *)v26;

    v28 = [v14 arrayByAddingObjectsFromArray:v15];
    uint64_t v29 = [v28 arrayByAddingObjectsFromArray:v16];
    allKeys = v17->_allKeys;
    v17->_allKeys = (NSArray *)v29;
  }
  return v17;
}

- (FCJSONRecordSourceSchema)initWithRecordType:(id)a3 recordIDPrefix:(id)a4 keys:(id)a5 localizableKeys:(id)a6
{
  return [(FCJSONRecordSourceSchema *)self initWithRecordType:a3 recordIDPrefix:a4 keys:a5 localizableKeys:a6 alwaysLocalizedKeys:MEMORY[0x1E4F1CBF0]];
}

- (NSString)recordIDPrefix
{
  return self->_recordIDPrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKeys, 0);
  objc_storeStrong((id *)&self->_alwaysLocalizedKeys, 0);
  objc_storeStrong((id *)&self->_localizableKeys, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_recordIDPrefix, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

@end