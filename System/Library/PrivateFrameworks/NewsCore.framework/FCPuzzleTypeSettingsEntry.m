@interface FCPuzzleTypeSettingsEntry
- (CKRecord)asCKRecord;
- (FCPuzzleTypeSettingsEntry)initWithEntryID:(id)a3 puzzleTypeID:(id)a4 settingsData:(id)a5 lastSeenPuzzleIDs:(id)a6;
- (NSArray)lastSeenPuzzleIDs;
- (NSData)settingsData;
- (NSString)identifier;
- (NSString)puzzleTypeID;
- (id)initWithEntryID:(void *)a3 dictionaryRepresentation:;
@end

@implementation FCPuzzleTypeSettingsEntry

- (FCPuzzleTypeSettingsEntry)initWithEntryID:(id)a3 puzzleTypeID:(id)a4 settingsData:(id)a5 lastSeenPuzzleIDs:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)[[NSString alloc] initWithFormat:@"puzzleTypeSettings entry must have an entryID"];
    *(_DWORD *)buf = 136315906;
    v29 = "-[FCPuzzleTypeSettingsEntry initWithEntryID:puzzleTypeID:settingsData:lastSeenPuzzleIDs:]";
    __int16 v30 = 2080;
    v31 = "FCPuzzleTypeSettingsEntry.m";
    __int16 v32 = 1024;
    int v33 = 19;
    __int16 v34 = 2114;
    v35 = v25;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v11) {
      goto LABEL_6;
    }
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)[[NSString alloc] initWithFormat:@"puzzleTypeSettings entry must have a puzzleTypeID"];
    *(_DWORD *)buf = 136315906;
    v29 = "-[FCPuzzleTypeSettingsEntry initWithEntryID:puzzleTypeID:settingsData:lastSeenPuzzleIDs:]";
    __int16 v30 = 2080;
    v31 = "FCPuzzleTypeSettingsEntry.m";
    __int16 v32 = 1024;
    int v33 = 20;
    __int16 v34 = 2114;
    v35 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v27.receiver = self;
  v27.super_class = (Class)FCPuzzleTypeSettingsEntry;
  v14 = [(FCPuzzleTypeSettingsEntry *)&v27 init];
  v15 = v14;
  if (v14)
  {
    if (v10 && v11)
    {
      uint64_t v16 = [v10 copy];
      identifier = v15->_identifier;
      v15->_identifier = (NSString *)v16;

      uint64_t v18 = [v11 copy];
      puzzleTypeID = v15->_puzzleTypeID;
      v15->_puzzleTypeID = (NSString *)v18;

      uint64_t v20 = [v12 copy];
      settingsData = v15->_settingsData;
      v15->_settingsData = (NSData *)v20;

      uint64_t v22 = [v13 copy];
      lastSeenPuzzleIDs = v15->_lastSeenPuzzleIDs;
      v15->_lastSeenPuzzleIDs = (NSArray *)v22;
    }
    else
    {
      lastSeenPuzzleIDs = v14;
      v15 = 0;
    }
  }
  return v15;
}

- (CKRecord)asCKRecord
{
  if (qword_1EB5D12B0 != -1) {
    dispatch_once(&qword_1EB5D12B0, &__block_literal_global_53);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v4 = [(FCPuzzleTypeSettingsEntry *)self identifier];
  v5 = (void *)[v3 initWithRecordName:v4 zoneID:_MergedGlobals_162];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"PuzzleTypeSettings" recordID:v5];
  v7 = [(FCPuzzleTypeSettingsEntry *)self puzzleTypeID];
  [v6 setValue:v7 forKey:@"puzzleTypeID"];

  v8 = [(FCPuzzleTypeSettingsEntry *)self settingsData];
  [v6 setValue:v8 forKey:@"settingsData"];

  v9 = [(FCPuzzleTypeSettingsEntry *)self lastSeenPuzzleIDs];
  [v6 setValue:v9 forKey:@"lastSeenPuzzleIDs"];

  return (CKRecord *)v6;
}

uint64_t __39__FCPuzzleTypeSettingsEntry_asCKRecord__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v1 = [v0 initWithZoneName:@"UserInfo" ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v2 = _MergedGlobals_162;
  _MergedGlobals_162 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)puzzleTypeID
{
  return self->_puzzleTypeID;
}

- (NSData)settingsData
{
  return self->_settingsData;
}

- (NSArray)lastSeenPuzzleIDs
{
  return self->_lastSeenPuzzleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenPuzzleIDs, 0);
  objc_storeStrong((id *)&self->_settingsData, 0);
  objc_storeStrong((id *)&self->_puzzleTypeID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)initWithEntryID:(void *)a3 dictionaryRepresentation:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    v7 = [v5 objectForKeyedSubscript:@"puzzleTypeID"];
    v8 = [v5 objectForKeyedSubscript:@"settingsData"];
    v9 = [v5 objectForKeyedSubscript:@"lastSeenPuzzleIDs"];

    id v10 = (void *)[v3 initWithEntryID:v6 puzzleTypeID:v7 settingsData:v8 lastSeenPuzzleIDs:v9];
    id v3 = v10;
  }
  return v3;
}

@end