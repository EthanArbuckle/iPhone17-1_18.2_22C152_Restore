@interface WBSMetadataDictionaryReaderDelegate
- (BOOL)jsonReader:(id)a3 appendKey:(id)a4;
- (BOOL)jsonReader:(id)a3 error:(id)a4;
- (BOOL)jsonReader:(id)a3 scalarValue:(id)a4;
- (BOOL)jsonReaderBeginArray:(id)a3;
- (BOOL)jsonReaderBeginObject:(id)a3;
- (BOOL)jsonReaderEndArray:(id)a3;
- (BOOL)jsonReaderEndObject:(id)a3;
- (NSError)error;
- (NSMutableDictionary)metadataDictionary;
- (WBSMetadataDictionaryReaderDelegate)init;
- (void)setError:(id)a3;
- (void)setMetadataDictionary:(id)a3;
@end

@implementation WBSMetadataDictionaryReaderDelegate

- (WBSMetadataDictionaryReaderDelegate)init
{
  v13.receiver = self;
  v13.super_class = (Class)WBSMetadataDictionaryReaderDelegate;
  v2 = [(WBSMetadataDictionaryReaderDelegate *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    metadataDictionary = v2->_metadataDictionary;
    v2->_metadataDictionary = v3;

    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"browser_name", @"browser_version", @"data_type", @"export_time_usec", @"schema_version", 0);
    validKeys = v2->_validKeys;
    v2->_validKeys = (NSSet *)v5;

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"browser_name", @"browser_version", @"data_type", 0);
    stringKeys = v2->_stringKeys;
    v2->_stringKeys = (NSSet *)v7;

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"export_time_usec", @"schema_version", 0);
    numberKeys = v2->_numberKeys;
    v2->_numberKeys = (NSSet *)v9;

    v11 = v2;
  }

  return v2;
}

- (BOOL)jsonReader:(id)a3 scalarValue:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_level != 2
    || !self->_insideMetadata
    || ![(NSSet *)self->_validKeys containsObject:self->_lastKey])
  {
    goto LABEL_9;
  }
  if ([(NSSet *)self->_stringKeys containsObject:self->_lastKey])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28798];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v12 = [NSString stringWithFormat:@"Expected a string for %@, got a %@", self->_lastKey, objc_opt_class()];
      v22[0] = v12;
      objc_super v13 = (void *)MEMORY[0x1E4F1C9E8];
      v14 = (void **)v22;
      v15 = &v21;
LABEL_13:
      v16 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
      v17 = [v10 errorWithDomain:v11 code:22 userInfo:v16];
      error = self->_error;
      self->_error = v17;

      BOOL v8 = 0;
      goto LABEL_10;
    }
  }
  if ([(NSSet *)self->_numberKeys containsObject:self->_lastKey])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28798];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v12 = [NSString stringWithFormat:@"Expected a number for %@, got a %@", self->_lastKey, objc_opt_class()];
      v20 = v12;
      objc_super v13 = (void *)MEMORY[0x1E4F1C9E8];
      v14 = &v20;
      v15 = &v19;
      goto LABEL_13;
    }
  }
  [(NSMutableDictionary *)self->_metadataDictionary setObject:v7 forKeyedSubscript:self->_lastKey];
LABEL_9:
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)jsonReaderBeginObject:(id)a3
{
  unint64_t v3 = self->_level + 1;
  self->_level = v3;
  if (v3 == 2 && [(NSString *)self->_lastKey isEqualToString:@"metadata"]) {
    self->_insideMetadata = 1;
  }
  return 1;
}

- (BOOL)jsonReader:(id)a3 appendKey:(id)a4
{
  return 1;
}

- (BOOL)jsonReaderEndObject:(id)a3
{
  BOOL insideMetadata = self->_insideMetadata;
  if (!self->_insideMetadata) {
    --self->_level;
  }
  return !insideMetadata;
}

- (BOOL)jsonReaderBeginArray:(id)a3
{
  unint64_t v3 = self->_level + 1;
  self->_level = v3;
  if (v3 == 2)
  {
    if ([(NSString *)self->_lastKey isEqualToString:@"Browser History"])
    {
      uint64_t v5 = @"chrome_history";
LABEL_7:
      [(NSMutableDictionary *)self->_metadataDictionary setObject:v5 forKeyedSubscript:@"data_type"];
      return 0;
    }
    if (self->_level == 2 && [(NSString *)self->_lastKey isEqualToString:@"Extensions"])
    {
      uint64_t v5 = @"chrome_extensions";
      goto LABEL_7;
    }
  }
  return 1;
}

- (BOOL)jsonReaderEndArray:(id)a3
{
  return 1;
}

- (BOOL)jsonReader:(id)a3 error:(id)a4
{
  return 0;
}

- (NSMutableDictionary)metadataDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetadataDictionary:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  objc_storeStrong((id *)&self->_numberKeys, 0);
  objc_storeStrong((id *)&self->_stringKeys, 0);
  objc_storeStrong((id *)&self->_validKeys, 0);
  objc_storeStrong((id *)&self->_lastKey, 0);
}

@end