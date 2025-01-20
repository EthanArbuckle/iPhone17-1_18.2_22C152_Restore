@interface WBBookmarkSyncData
+ (BOOL)supportsSecureCoding;
+ (id)positionFromContentsOfData:(id)a3;
+ (id)syncDataWithContentsOfData:(id)a3;
- (BOOL)hasGenerationForKey:(id)a3;
- (BOOL)hasRecordExpired;
- (BOOL)isDeletingRecordZone;
- (CKRecord)record;
- (CKRecordID)parentRecordID;
- (CKShare)shareRecord;
- (NSArray)auxiliaryRecordIDs;
- (NSData)encodedBookmarkSyncData;
- (NSDictionary)positionDictionaryRepresentation;
- (WBBookmarkSyncData)init;
- (WBBookmarkSyncData)initWithCoder:(id)a3;
- (WBSCRDTPosition)position;
- (id)auxiliaryRecordForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generationForKey:(id)a3;
- (int64_t)minimumAPIVersion;
- (int64_t)state;
- (unint64_t)modifiedAttributeMask;
- (void)clearAllCKRecords;
- (void)clearAllGenerationsExceptState;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateGenerationsUsingBlock:(id)a3;
- (void)incrementGenerationForKey:(id)a3 withDeviceIdentifier:(id)a4;
- (void)setAuxiliaryRecord:(id)a3 forKey:(id)a4;
- (void)setGeneration:(id)a3 forKey:(id)a4;
- (void)setHasRecordExpired:(BOOL)a3;
- (void)setIsDeletingRecordZone:(BOOL)a3;
- (void)setMinimumAPIVersion:(int64_t)a3;
- (void)setModifiedAttributeMask:(unint64_t)a3;
- (void)setParentRecordID:(id)a3;
- (void)setPosition:(id)a3;
- (void)setPositionDictionaryRepresentation:(id)a3;
- (void)setRecord:(id)a3;
- (void)setShareRecord:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation WBBookmarkSyncData

- (id)generationForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_generations objectForKeyedSubscript:a3];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x263F66610]);
  }
  v6 = v5;

  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)minimumAPIVersion
{
  return self->_minimumAPIVersion;
}

- (CKShare)shareRecord
{
  v2 = (void *)[(CKShare *)self->_shareRecord copy];
  return (CKShare *)v2;
}

- (WBSCRDTPosition)position
{
  return self->_position;
}

+ (id)syncDataWithContentsOfData:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = (void *)MEMORY[0x21D4A0FE0]();
    id v5 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v3 error:0];
    [v5 setClass:objc_opt_class() forClassName:@"CloudBookmarkSyncData"];
    [v5 setClass:objc_opt_class() forClassName:@"CloudBookmarkGeneration"];
    [v5 setClass:objc_opt_class() forClassName:@"CloudBookmarkPosition"];
    [v5 setClass:objc_opt_class() forClassName:@"CloudBookmarkPositionSortValue"];
    v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
    [v5 finishDecoding];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WBBookmarkSyncData)initWithCoder:(id)a3
{
  v42[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)WBBookmarkSyncData;
  id v5 = [(WBBookmarkSyncData *)&v40 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFD7C8]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EncodedCKRecordSystemFields"];
    uint64_t v8 = objc_msgSend(v6, "safari_initWithEncodedRecordData:", v7);
    record = v5->_record;
    v5->_record = (CKRecord *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v42[2] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:3];
    v12 = [v10 setWithArray:v11];
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"Generations"];
    uint64_t v14 = [v13 mutableCopy];
    generations = v5->_generations;
    v5->_generations = (NSMutableDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Position"];
    position = v5->_position;
    v5->_position = (WBSCRDTPosition *)v16;

    v5->_minimumAPIVersion = [v4 decodeIntegerForKey:@"MinimumAPIVersion"];
    v5->_state = [v4 decodeIntegerForKey:@"Deleted"];
    v5->_modifiedAttributeMask = [v4 decodeIntegerForKey:@"ModifiedAttributeMask"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ParentRecordID"];
    parentRecordID = v5->_parentRecordID;
    v5->_parentRecordID = (CKRecordID *)v18;

    v5->_isDeletingRecordZone = [v4 decodeBoolForKey:@"IsDeletedRecordZone"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ShareRecord"];
    shareRecord = v5->_shareRecord;
    v5->_shareRecord = (CKShare *)v20;

    v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v22, "setWithObjects:", v23, v24, v25, objc_opt_class(), 0);
    v27 = [v4 decodeObjectOfClasses:v26 forKey:@"AuxiliaryRecords"];
    v28 = (void *)[v27 mutableCopy];
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      v30 = [MEMORY[0x263EFF9A0] dictionary];
    }
    auxiliaryRecords = v5->_auxiliaryRecords;
    v5->_auxiliaryRecords = v30;

    v32 = (void *)MEMORY[0x263EFFA08];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    v41[2] = objc_opt_class();
    v41[3] = objc_opt_class();
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:4];
    v34 = [v32 setWithArray:v33];

    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"ExtraPositionData"];
    extraPositionData = v5->_extraPositionData;
    v5->_extraPositionData = (NSDictionary *)v35;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v37 = v5->_extraPositionData;
      v5->_extraPositionData = (NSDictionary *)MEMORY[0x263EFFA78];
    }
    v38 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)positionFromContentsOfData:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)MEMORY[0x21D4A0FE0]();
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v4 error:0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = NSStringFromClass((Class)a1);
    [v6 setClass:v7 forClassName:v8];

    [v6 setClass:objc_opt_class() forClassName:@"CloudBookmarkPosition"];
    [v6 setClass:objc_opt_class() forClassName:@"CloudBookmarkPositionSortValue"];
    v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
    v10 = [v9 position];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSData)encodedBookmarkSyncData
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  [v3 encodeObject:self forKey:*MEMORY[0x263F081D0]];
  id v4 = [v3 encodedData];

  return (NSData *)v4;
}

- (WBBookmarkSyncData)init
{
  v10.receiver = self;
  v10.super_class = (Class)WBBookmarkSyncData;
  v2 = [(WBBookmarkSyncData *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    generations = v2->_generations;
    v2->_generations = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    auxiliaryRecords = v2->_auxiliaryRecords;
    v2->_auxiliaryRecords = (NSMutableDictionary *)v5;

    extraPositionData = v2->_extraPositionData;
    v2->_extraPositionData = (NSDictionary *)MEMORY[0x263EFFA78];

    uint64_t v8 = v2;
  }

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(CKRecord *)self->_record safari_encodedSystemFieldsData];
  [v9 encodeObject:v4 forKey:@"EncodedCKRecordSystemFields"];

  [v9 encodeObject:self->_generations forKey:@"Generations"];
  [v9 encodeObject:self->_position forKey:@"Position"];
  [v9 encodeInteger:self->_minimumAPIVersion forKey:@"MinimumAPIVersion"];
  [v9 encodeObject:self->_extraPositionData forKey:@"ExtraPositionData"];
  [v9 encodeObject:self->_parentRecordID forKey:@"ParentRecordID"];
  [v9 encodeObject:self->_shareRecord forKey:@"ShareRecord"];
  [v9 encodeBool:self->_isDeletingRecordZone forKey:@"IsDeletedRecordZone"];
  if ([(NSMutableDictionary *)self->_auxiliaryRecords count])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_auxiliaryRecords safari_mapAndFilterKeysAndObjectsUsingBlock:&__block_literal_global_151];
    [v9 encodeObject:v5 forKey:@"AuxiliaryRecords"];
  }
  int64_t state = self->_state;
  if (state) {
    [v9 encodeInteger:state forKey:@"Deleted"];
  }
  unint64_t modifiedAttributeMask = self->_modifiedAttributeMask;
  uint64_t v8 = v9;
  if (modifiedAttributeMask)
  {
    [v9 encodeInteger:modifiedAttributeMask forKey:@"ModifiedAttributeMask"];
    uint64_t v8 = v9;
  }
}

id __38__WBBookmarkSyncData_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  uint64_t v5 = [(WBBookmarkSyncData *)self encodedBookmarkSyncData];
  id v6 = [v4 syncDataWithContentsOfData:v5];

  return v6;
}

- (CKRecord)record
{
  v2 = (void *)[(CKRecord *)self->_record copy];
  return (CKRecord *)v2;
}

- (NSDictionary)positionDictionaryRepresentation
{
  id v3 = (void *)[(NSDictionary *)self->_extraPositionData mutableCopy];
  position = self->_position;
  if (position)
  {
    uint64_t v5 = [(WBSCRDTPosition *)position dictionaryRepresentation];
    [v3 setObject:v5 forKeyedSubscript:@"default"];
  }
  return (NSDictionary *)v3;
}

- (void)setPositionDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v11 = (id)[v4 mutableCopy];
  [v11 removeObjectForKey:@"default"];
  uint64_t v5 = [v11 copy];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (void *)v5;
  }
  else {
    uint64_t v7 = (void *)MEMORY[0x263EFFA78];
  }
  objc_storeStrong((id *)&self->_extraPositionData, v7);

  uint64_t v8 = objc_msgSend(v4, "safari_dictionaryForKey:", @"default");

  if (v8)
  {
    id v9 = (WBSCRDTPosition *)[objc_alloc(MEMORY[0x263F66618]) initWithDictionaryRepresentation:v8];
    position = self->_position;
    self->_position = v9;
  }
  else
  {
    position = self->_position;
    self->_position = 0;
  }
}

- (void)clearAllCKRecords
{
  record = self->_record;
  self->_record = 0;

  shareRecord = self->_shareRecord;
  self->_shareRecord = 0;

  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  auxiliaryRecords = self->_auxiliaryRecords;
  self->_auxiliaryRecords = v5;
  MEMORY[0x270F9A758](v5, auxiliaryRecords);
}

- (NSArray)auxiliaryRecordIDs
{
  v2 = [(NSMutableDictionary *)self->_auxiliaryRecords allValues];
  id v3 = objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_154);

  return (NSArray *)v3;
}

uint64_t __40__WBBookmarkSyncData_auxiliaryRecordIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

- (id)auxiliaryRecordForKey:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_auxiliaryRecords objectForKeyedSubscript:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)setAuxiliaryRecord:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_auxiliaryRecords setObject:v7 forKeyedSubscript:v6];
}

- (BOOL)hasGenerationForKey:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_generations objectForKeyedSubscript:a3];
  char v4 = [v3 isValid];

  return v4;
}

- (void)setGeneration:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int v7 = [v9 isValid];
  generations = self->_generations;
  if (v7) {
    [(NSMutableDictionary *)generations setObject:v9 forKeyedSubscript:v6];
  }
  else {
    [(NSMutableDictionary *)generations removeObjectForKey:v6];
  }
}

- (void)incrementGenerationForKey:(id)a3 withDeviceIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(WBBookmarkSyncData *)self generationForKey:v7];
  uint64_t v8 = [v9 incrementedGenerationWithDeviceIdentifier:v6];

  [(NSMutableDictionary *)self->_generations setObject:v8 forKeyedSubscript:v7];
}

- (void)clearAllGenerationsExceptState
{
  uint64_t v3 = [(NSMutableDictionary *)self->_generations objectForKeyedSubscript:@"Deleted"];
  id v6 = (id)v3;
  if (v3) {
    [MEMORY[0x263EFF9A0] dictionaryWithObject:v3 forKey:@"Deleted"];
  }
  else {
  char v4 = [MEMORY[0x263EFF9A0] dictionary];
  }
  generations = self->_generations;
  self->_generations = v4;
}

- (void)enumerateGenerationsUsingBlock:(id)a3
{
}

- (void)setRecord:(id)a3
{
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (void)setPosition:(id)a3
{
}

- (void)setMinimumAPIVersion:(int64_t)a3
{
  self->_minimumAPIVersion = a3;
}

- (unint64_t)modifiedAttributeMask
{
  return self->_modifiedAttributeMask;
}

- (void)setModifiedAttributeMask:(unint64_t)a3
{
  self->_unint64_t modifiedAttributeMask = a3;
}

- (CKRecordID)parentRecordID
{
  return self->_parentRecordID;
}

- (void)setParentRecordID:(id)a3
{
}

- (BOOL)hasRecordExpired
{
  return self->_hasRecordExpired;
}

- (void)setHasRecordExpired:(BOOL)a3
{
  self->_hasRecordExpired = a3;
}

- (void)setShareRecord:(id)a3
{
}

- (BOOL)isDeletingRecordZone
{
  return self->_isDeletingRecordZone;
}

- (void)setIsDeletingRecordZone:(BOOL)a3
{
  self->_isDeletingRecordZone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareRecord, 0);
  objc_storeStrong((id *)&self->_parentRecordID, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_extraPositionData, 0);
  objc_storeStrong((id *)&self->_auxiliaryRecords, 0);
  objc_storeStrong((id *)&self->_generations, 0);
}

+ (void)positionFromContentsOfData:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Failed to decode _WBBookmarkSyncDataForPositionDecoding with exception: %{public}@", buf, 0xCu);
}

+ (void)syncDataWithContentsOfData:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "Failed to decode WBBookmarkSyncData with exception: %{public}@", buf, 0xCu);
}

@end