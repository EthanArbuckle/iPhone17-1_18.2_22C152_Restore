@interface WBSPasswordBreachResultRecord
+ (id)dictionaryRepresentationsForResultRecords:(id)a3;
+ (id)resultRecordsFromDictionaryRepresentations:(id)a3;
- (NSData)persistentIdentifier;
- (NSDate)dateLastModified;
- (NSDictionary)dictionaryRepresentation;
- (WBSPasswordBreachResultRecord)initWithDictionaryRepresentation:(id)a3;
- (WBSPasswordBreachResultRecord)initWithPersistentIdentifier:(id)a3 result:(unint64_t)a4 dateLastModified:(id)a5;
- (id)description;
- (unint64_t)result;
@end

@implementation WBSPasswordBreachResultRecord

- (WBSPasswordBreachResultRecord)initWithPersistentIdentifier:(id)a3 result:(unint64_t)a4 dateLastModified:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WBSPasswordBreachResultRecord;
  v11 = [(WBSPasswordBreachResultRecord *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_persistentIdentifier, a3);
    v12->_result = a4;
    objc_storeStrong((id *)&v12->_dateLastModified, a5);
    v13 = v12;
  }

  return v12;
}

- (WBSPasswordBreachResultRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "safari_dataForKey:", @"PersistentIdentifier");
  if (v5)
  {
    v6 = objc_msgSend(v4, "safari_numberForKey:", @"Result");
    v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 unsignedIntegerValue];
      id v9 = objc_msgSend(v4, "safari_dateForKey:", @"DateLastModified");
      if (v9)
      {
        self = [(WBSPasswordBreachResultRecord *)self initWithPersistentIdentifier:v5 result:v8 dateLastModified:v9];
        id v10 = self;
      }
      else
      {
        v27 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[WBSPasswordBreachResultRecord initWithDictionaryRepresentation:](v27, v28, v29, v30, v31, v32, v33, v34);
        }
        id v10 = 0;
      }
    }
    else
    {
      v19 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[WBSPasswordBreachResultRecord initWithDictionaryRepresentation:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
      id v10 = 0;
    }
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachResultRecord initWithDictionaryRepresentation:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    id v10 = 0;
  }

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  v9[3] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = self->_result;
  v9[0] = self->_persistentIdentifier;
  v8[0] = @"PersistentIdentifier";
  v8[1] = @"Result";
  id v4 = [NSNumber numberWithUnsignedInteger:v3];
  v8[2] = @"DateLastModified";
  dateLastModified = self->_dateLastModified;
  v9[1] = v4;
  v9[2] = dateLastModified;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

+ (id)resultRecordsFromDictionaryRepresentations:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_39);
}

WBSPasswordBreachResultRecord *__76__WBSPasswordBreachResultRecord_resultRecordsFromDictionaryRepresentations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [[WBSPasswordBreachResultRecord alloc] initWithDictionaryRepresentation:v2];

  return v3;
}

+ (id)dictionaryRepresentationsForResultRecords:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_12_0);
}

uint64_t __75__WBSPasswordBreachResultRecord_dictionaryRepresentationsForResultRecords___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, persistentIdentifier: %@, result: %lu, dateLastModified: %@>", objc_opt_class(), self, self->_persistentIdentifier, self->_result, self->_dateLastModified];
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (unint64_t)result
{
  return self->_result;
}

- (NSDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end