@interface PKCloudRecordObject
+ (BOOL)supportsSecureCoding;
- (NSSet)records;
- (PKCloudRecordObject)initWithCoder:(id)a3;
- (PKCloudRecordObject)initWithRecords:(id)a3;
- (PKCloudStoreCoding)item;
- (id)_descriptionWithDetailedOutput:(BOOL)a3;
- (id)description;
- (id)descriptionWithItem:(BOOL)a3;
- (id)primaryIdentifier;
- (void)applyCloudRecordObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKCloudRecordObject

- (PKCloudRecordObject)initWithRecords:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKCloudRecordObject;
  v5 = [(PKCloudRecordObject *)&v21 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recordIDToRecord = v5->_recordIDToRecord;
    v5->_recordIDToRecord = v6;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v14 = v5->_recordIDToRecord;
          v15 = objc_msgSend(v13, "recordID", (void)v17);
          [(NSMutableDictionary *)v14 setObject:v13 forKey:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }
  }
  return v5;
}

- (NSSet)records
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMutableDictionary *)self->_recordIDToRecord allValues];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (PKCloudStoreCoding)item
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCloudRecordObject;
  v5 = [(PKCloudRecordObject *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"recordIDToRecord"];
    recordIDToRecord = v5->_recordIDToRecord;
    v5->_recordIDToRecord = (NSMutableDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)descriptionWithItem:(BOOL)a3
{
  return [(PKCloudRecordObject *)self _descriptionWithDetailedOutput:1];
}

- (id)description
{
  return [(PKCloudRecordObject *)self _descriptionWithDetailedOutput:0];
}

- (id)_descriptionWithDetailedOutput:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F28E78] string];
  [v5 appendFormat:@"records: \n"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(PKCloudRecordObject *)self records];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (v3)
        {
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "pk_description");
          [v5 appendFormat:@" --> %@\n", v11];
        }
        else
        {
          [v5 appendFormat:@" --> %@\n", *(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)applyCloudRecordObject:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 records];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          recordIDToRecord = self->_recordIDToRecord;
          v12 = [v10 recordID];
          long long v13 = [(NSMutableDictionary *)recordIDToRecord objectForKey:v12];

          if (!v13)
          {
            long long v14 = self->_recordIDToRecord;
            long long v15 = [v10 recordID];
            [(NSMutableDictionary *)v14 setObject:v10 forKey:v15];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
}

- (id)primaryIdentifier
{
  BOOL v3 = [(PKCloudRecordObject *)self item];
  id v4 = [v3 primaryIdentifier];

  if (!v4)
  {
    v5 = [(NSMutableDictionary *)self->_recordIDToRecord allValues];
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = [v6 recordID];
    id v4 = [v7 recordName];
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end