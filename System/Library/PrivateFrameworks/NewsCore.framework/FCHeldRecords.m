@interface FCHeldRecords
+ (id)heldRecordsByMerging:(id)a3 with:(id)a4;
- (FCHeldRecords)initWithRecordsByID:(id)a3 interestTokensByID:(id)a4;
- (FCInterestToken)onlyInterestToken;
- (NSArray)allRecordIDs;
- (NSArray)allRecords;
- (NSDictionary)interestTokensByID;
- (NSDictionary)recordsByID;
- (NSString)onlyRecordID;
- (id)heldRecordsForIDs:(id)a3;
- (id)heldRecordsPassingTest:(id)a3;
- (id)interestTokenForID:(id)a3;
- (id)onlyRecord;
- (id)recordWithID:(id)a3;
- (id)transformRecordsByIDWithBlock:(id)a3;
- (id)transformRecordsInOrder:(id)a3 withBlock:(id)a4;
- (id)transformRecordsWithBlock:(id)a3;
- (unint64_t)count;
- (void)enumerateRecordsAndInterestTokensInOrder:(id)a3 withBlock:(id)a4;
- (void)enumerateRecordsAndInterestTokensWithBlock:(id)a3;
@end

@implementation FCHeldRecords

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestTokensByID, 0);
  objc_storeStrong((id *)&self->_recordsByID, 0);
}

void __40__FCHeldRecords_heldRecordsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)interestTokenForID:(id)a3
{
  id v4 = a3;
  v5 = [(FCHeldRecords *)self interestTokensByID];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)transformRecordsByIDWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v4)
  {
    v6 = [(FCHeldRecords *)self recordsByID];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__FCHeldRecords_transformRecordsByIDWithBlock___block_invoke;
    v8[3] = &unk_1E5B55F68;
    v8[4] = self;
    id v10 = v4;
    id v9 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v8];
  }
  return v5;
}

void __47__FCHeldRecords_transformRecordsByIDWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 interestTokensByID];
  v8 = [v7 objectForKey:v10];

  id v9 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  if (v9) {
    [*(id *)(a1 + 40) setObject:v9 forKey:v10];
  }
}

- (id)recordWithID:(id)a3
{
  id v4 = a3;
  v5 = [(FCHeldRecords *)self recordsByID];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)enumerateRecordsAndInterestTokensInOrder:(id)a3 withBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  if (v7)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          v13 = [(FCHeldRecords *)self recordsByID];
          v14 = [v13 objectForKey:v12];

          v15 = [(FCHeldRecords *)self interestTokensByID];
          v16 = [v15 objectForKey:v12];

          if (v14) {
            BOOL v17 = v16 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17) {
            v7[2](v7, v14, v16);
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
}

- (NSDictionary)recordsByID
{
  return self->_recordsByID;
}

- (NSDictionary)interestTokensByID
{
  return self->_interestTokensByID;
}

uint64_t __51__FCHeldRecords_transformRecordsInOrder_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v2 = [*(id *)(a1 + 32) addObject:v2];
    uint64_t v3 = v5;
  }
  return MEMORY[0x1F41817F8](v2, v3);
}

+ (id)heldRecordsByMerging:(id)a3 with:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 recordsByID];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  if (v8) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = MEMORY[0x1E4F1CC08];
  }
  uint64_t v12 = [v6 recordsByID];
  v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = (uint64_t)v10;
  }
  v15 = objc_msgSend(v5, "fc_dictionaryByAddingEntriesFromDictionary:toDictionary:", v11, v14);

  v16 = (void *)MEMORY[0x1E4F1C9E8];
  BOOL v17 = [v7 interestTokensByID];

  if (v17) {
    long long v18 = v17;
  }
  else {
    long long v18 = v10;
  }
  long long v19 = [v6 interestTokensByID];

  if (v19) {
    long long v20 = v19;
  }
  else {
    long long v20 = v10;
  }
  long long v21 = objc_msgSend(v16, "fc_dictionaryByAddingEntriesFromDictionary:toDictionary:", v18, v20);

  v22 = [[FCHeldRecords alloc] initWithRecordsByID:v15 interestTokensByID:v21];
  return v22;
}

- (id)heldRecordsPassingTest:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "test");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCHeldRecords heldRecordsPassingTest:]";
    __int16 v17 = 2080;
    long long v18 = "FCHeldRecords.m";
    __int16 v19 = 1024;
    int v20 = 146;
    __int16 v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = objc_opt_new();
  id v6 = [(FCHeldRecords *)self recordsByID];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__FCHeldRecords_heldRecordsPassingTest___block_invoke;
  v12[3] = &unk_1E5B55F90;
  id v13 = v5;
  id v14 = v4;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v9 = [(FCHeldRecords *)self heldRecordsForIDs:v7];

  return v9;
}

- (id)heldRecordsForIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "recordIDs");
    *(_DWORD *)buf = 136315906;
    id v14 = "-[FCHeldRecords heldRecordsForIDs:]";
    __int16 v15 = 2080;
    v16 = "FCHeldRecords.m";
    __int16 v17 = 1024;
    int v18 = 163;
    __int16 v19 = 2114;
    int v20 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = [FCHeldRecords alloc];
  id v6 = [(FCHeldRecords *)self recordsByID];
  id v7 = objc_msgSend(v6, "fc_subdictionaryForKeys:", v4);
  id v8 = [(FCHeldRecords *)self interestTokensByID];
  uint64_t v9 = objc_msgSend(v8, "fc_subdictionaryForKeys:", v4);
  uint64_t v10 = [(FCHeldRecords *)v5 initWithRecordsByID:v7 interestTokensByID:v9];

  return v10;
}

- (NSArray)allRecordIDs
{
  uint64_t v2 = [(FCHeldRecords *)self recordsByID];
  uint64_t v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (NSArray)allRecords
{
  uint64_t v2 = [(FCHeldRecords *)self recordsByID];
  uint64_t v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (FCHeldRecords)initWithRecordsByID:(id)a3 interestTokensByID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCHeldRecords;
  uint64_t v9 = [(FCHeldRecords *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordsByID, a3);
    objc_storeStrong((id *)&v10->_interestTokensByID, a4);
  }

  return v10;
}

- (id)transformRecordsWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCHeldRecords *)self recordsByID];
  id v6 = [v5 allKeys];
  id v7 = [(FCHeldRecords *)self transformRecordsInOrder:v6 withBlock:v4];

  return v7;
}

- (id)transformRecordsInOrder:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__FCHeldRecords_transformRecordsInOrder_withBlock___block_invoke;
    v10[3] = &unk_1E5B55F40;
    id v12 = v7;
    id v11 = v8;
    [(FCHeldRecords *)self enumerateRecordsAndInterestTokensInOrder:v6 withBlock:v10];
  }
  return v8;
}

- (void)enumerateRecordsAndInterestTokensWithBlock:(id)a3
{
  id v4 = a3;
  id v6 = [(FCHeldRecords *)self recordsByID];
  uint64_t v5 = [v6 allKeys];
  [(FCHeldRecords *)self enumerateRecordsAndInterestTokensInOrder:v5 withBlock:v4];
}

- (unint64_t)count
{
  uint64_t v2 = [(FCHeldRecords *)self recordsByID];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)onlyRecord
{
  uint64_t v2 = [(FCHeldRecords *)self recordsByID];
  unint64_t v3 = [v2 allValues];
  id v4 = objc_msgSend(v3, "fc_onlyObject");

  return v4;
}

- (NSString)onlyRecordID
{
  uint64_t v2 = [(FCHeldRecords *)self recordsByID];
  unint64_t v3 = [v2 allKeys];
  id v4 = objc_msgSend(v3, "fc_onlyObject");

  return (NSString *)v4;
}

- (FCInterestToken)onlyInterestToken
{
  uint64_t v2 = [(FCHeldRecords *)self interestTokensByID];
  unint64_t v3 = [v2 allValues];
  id v4 = objc_msgSend(v3, "fc_onlyObject");

  return (FCInterestToken *)v4;
}

@end