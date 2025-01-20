@interface TITypologyLog
+ (BOOL)isTraceLogFilename:(id)a3;
+ (BOOL)isTypologyLogFilename:(id)a3;
+ (id)_adjustFilename:(id)a3 oldPrefix:(id)a4 newPrefix:(id)a5 oldSuffix:(id)a6 newSuffix:(id)a7;
+ (id)traceLogFilenameFromTypologyLogFilename:(id)a3;
+ (id)traceLogURLFromTypologyLogURL:(id)a3;
+ (id)typologyLogFilenameFromTraceLogFilename:(id)a3;
+ (id)typologyLogFromTypologyLogFile:(id)a3 andTraceLogFile:(id)a4 error:(id *)a5;
+ (id)typologyLogURLFromTraceLogURL:(id)a3;
- (BOOL)_writeToTraceLogFile:(id)a3 error:(id *)a4;
- (BOOL)_writeToTypologyLogFile:(id)a3 withAccessibilityInfo:(id)a4 includeTraceLogContent:(BOOL)a5 error:(id *)a6;
- (BOOL)loggedRecordOfClass:(Class)a3;
- (BOOL)writeToTypologyLogFile:(id)a3 andTraceLogFile:(id)a4 withAccessibilityInfo:(id)a5 error:(id *)a6;
- (NSDate)date;
- (NSDictionary)config;
- (NSMutableSet)loggedRecordClasses;
- (NSString)buildVersion;
- (NSString)clientIdentifier;
- (NSString)recommendedTraceLogFilename;
- (NSString)recommendedTypologyLogFilename;
- (NSString)systemVersion;
- (NSUUID)uuid;
- (TIKeyboardState)lastKeyboardState;
- (TIRollingLog)records;
- (TIRollingLog)traceRecords;
- (TITypologyLog)init;
- (TITypologyLog)initWithPropertyList:(id)a3;
- (TITypologyLog)initWithTypologyLog:(id)a3;
- (TITypologyLog)initWithUUID:(id)a3 partIndex:(unint64_t)a4 date:(id)a5 systemVersion:(id)a6 buildVersion:(id)a7 clientIdentifier:(id)a8 config:(id)a9;
- (TITypologyLogDelegate)delegate;
- (id)_recommendedFilenameWithPrefix:(id)a3 andSuffix:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fileCreationOptions;
- (id)parsedTraceRecordMatchingUUID:(id)a3;
- (id)propertyList;
- (id)propertyListWithTrace;
- (id)recordSummary;
- (id)textSummary;
- (id)timestamp;
- (id)trace;
- (id)traceLogHeader;
- (id)traceRecordMatchingUUID:(id)a3;
- (id)typologyRecordMatchingUUID:(id)a3;
- (id)typologyRecordUUIDsIncludedInRange:(id)a3 endUUID:(id)a4;
- (id)typologyRecordsMatchingUUIDRange:(id)a3 endUUID:(id)a4;
- (unint64_t)maxNumRecords;
- (unint64_t)numTraceRecords;
- (unint64_t)numTypologyRecords;
- (unint64_t)partIndex;
- (unint64_t)traceLogVersion;
- (unint64_t)typologyLogVersion;
- (void)_logRecord:(id)a3 trace:(id)a4;
- (void)enumerateParsedTraceRecordsWithBlock:(id)a3;
- (void)enumerateParsedTraceRecordsWithBlockIncludingStop:(id)a3;
- (void)enumerateTraceRecordsWithBlock:(id)a3;
- (void)enumerateTraceRecordsWithBlockIncludingStop:(id)a3;
- (void)enumerateTypologyRecordsWithBlock:(id)a3;
- (void)enumerateTypologyRecordsWithBlockIncludingStop:(id)a3;
- (void)logRecord:(id)a3;
- (void)logRecord:(id)a3 trace:(id)a4;
- (void)parseTraceLogContent:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setConfig:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastKeyboardState:(id)a3;
- (void)setLoggedRecordClasses:(id)a3;
- (void)traceHeaderParsed:(id)a3;
- (void)traceRecordParsed:(id)a3;
@end

@implementation TITypologyLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKeyboardState, 0);
  objc_storeStrong((id *)&self->_loggedRecordClasses, 0);
  objc_storeStrong((id *)&self->_traceRecords, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLastKeyboardState:(id)a3
{
}

- (TIKeyboardState)lastKeyboardState
{
  return self->_lastKeyboardState;
}

- (void)setLoggedRecordClasses:(id)a3
{
}

- (TIRollingLog)traceRecords
{
  return self->_traceRecords;
}

- (TIRollingLog)records
{
  return self->_records;
}

- (void)setConfig:(id)a3
{
}

- (NSDictionary)config
{
  return self->_config;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)partIndex
{
  return self->_partIndex;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setDelegate:(id)a3
{
}

- (TITypologyLogDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TITypologyLogDelegate *)WeakRetained;
}

- (unint64_t)traceLogVersion
{
  return self->_traceLogVersion;
}

- (unint64_t)typologyLogVersion
{
  return self->_typologyLogVersion;
}

- (BOOL)loggedRecordOfClass:(Class)a3
{
  v4 = [(TITypologyLog *)self loggedRecordClasses];
  LOBYTE(a3) = [v4 containsObject:a3];

  return (char)a3;
}

- (NSMutableSet)loggedRecordClasses
{
  loggedRecordClasses = self->_loggedRecordClasses;
  if (!loggedRecordClasses)
  {
    v4 = [MEMORY[0x1E4F1CA80] set];
    v5 = self->_loggedRecordClasses;
    self->_loggedRecordClasses = v4;

    loggedRecordClasses = self->_loggedRecordClasses;
  }

  return loggedRecordClasses;
}

- (id)typologyRecordUUIDsIncludedInRange:(id)a3 endUUID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v8 = [(TITypologyLog *)self records];
  v9 = [v8 currentEntries];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = 0;
    uint64_t v13 = *(void *)v25;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v25 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v24 + 1) + 8 * v14);
      v16 = [v15 recordID];
      int v17 = [v16 isEqual:v6];

      v12 |= v17;
      if (v12)
      {
        v18 = [v15 recordID];
        [v23 addObject:v18];
      }
      v19 = [v15 recordID];
      char v20 = [v19 isEqual:v7];

      if (v20) {
        break;
      }
      if (v11 == ++v14)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v21 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v23];

  return v21;
}

- (id)typologyRecordsMatchingUUIDRange:(id)a3 endUUID:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v8 = [(TITypologyLog *)self records];
  v9 = [v8 currentEntries];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = 0;
    uint64_t v13 = *(void *)v24;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
      v16 = [v15 recordID];
      int v17 = [v16 isEqual:v6];

      v12 |= v17;
      if (v12) {
        [v22 addObject:v15];
      }
      v18 = [v15 recordID];
      char v19 = [v18 isEqual:v7];

      if (v19) {
        break;
      }
      if (v11 == ++v14)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  char v20 = (void *)[v22 copy];

  return v20;
}

- (id)parsedTraceRecordMatchingUUID:(id)a3
{
  v3 = [(TITypologyLog *)self traceRecordMatchingUUID:a3];
  [v3 parse];

  return v3;
}

- (id)traceRecordMatchingUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TITypologyLog *)self traceRecords];
  id v6 = [v5 currentEntries];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "recordUUID", (void)v15);
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)typologyRecordMatchingUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TITypologyLog *)self records];
  id v6 = [v5 currentEntries];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "recordID", (void)v15);
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)enumerateParsedTraceRecordsWithBlockIncludingStop:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__TITypologyLog_enumerateParsedTraceRecordsWithBlockIncludingStop___block_invoke;
  v6[3] = &unk_1E55597F0;
  id v7 = v4;
  id v5 = v4;
  [(TITypologyLog *)self enumerateTraceRecordsWithBlockIncludingStop:v6];
}

void __67__TITypologyLog_enumerateParsedTraceRecordsWithBlockIncludingStop___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 parse];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateParsedTraceRecordsWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__TITypologyLog_enumerateParsedTraceRecordsWithBlock___block_invoke;
  v6[3] = &unk_1E55597C8;
  id v7 = v4;
  id v5 = v4;
  [(TITypologyLog *)self enumerateTraceRecordsWithBlock:v6];
}

void __54__TITypologyLog_enumerateParsedTraceRecordsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 parse];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateTraceRecordsWithBlockIncludingStop:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  char v16 = 0;
  id v5 = [(TITypologyLog *)self traceRecords];
  id v6 = [v5 currentEntries];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v13 != v10) {
        objc_enumerationMutation(v7);
      }
      if (v16) {
        break;
      }
      v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++), &v16);
      if (v9 == v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateTraceRecordsWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = [(TITypologyLog *)self traceRecords];
  id v6 = [v5 currentEntries];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)enumerateTypologyRecordsWithBlockIncludingStop:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  char v16 = 0;
  id v5 = [(TITypologyLog *)self records];
  id v6 = [v5 currentEntries];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v13 != v10) {
        objc_enumerationMutation(v7);
      }
      if (v16) {
        break;
      }
      v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++), &v16);
      if (v9 == v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateTypologyRecordsWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = [(TITypologyLog *)self records];
  id v6 = [v5 currentEntries];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)traceRecordParsed:(id)a3
{
  id v4 = a3;
  id v5 = [(TITypologyLog *)self traceRecords];
  [v5 addEntry:v4];
}

- (void)traceHeaderParsed:(id)a3
{
  id v4 = [a3 objectForKey:@"Version"];
  if (v4)
  {
    id v5 = v4;
    self->_traceLogVersion = [v4 unsignedIntegerValue];
    id v4 = v5;
  }
}

- (void)logRecord:(id)a3 trace:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = +[TIPreferencesController sharedPreferencesController];
  int v8 = [v7 BOOLForKey:54];

  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    [(TITypologyLog *)self _logRecord:v9 trace:v6];
  }
}

- (void)logRecord:(id)a3
{
}

- (void)_logRecord:(id)a3 trace:(id)a4
{
  long long v23 = (TITypologyRecord *)a3;
  id v6 = a4;
  id v7 = v23;
  if (!v23) {
    id v7 = objc_alloc_init(TITypologyRecord);
  }
  long long v24 = v7;
  int v8 = [(TITypologyLog *)self clientIdentifier];
  if (!v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    int v8 = [(TITypologyRecord *)v24 keyboardState];
    id v9 = [v8 clientIdentifier];
    [(TITypologyLog *)self setClientIdentifier:v9];
  }
LABEL_7:
  uint64_t v10 = [(TITypologyRecord *)v24 currentKeyboardState];

  if (v10)
  {
    [(TITypologyRecord *)v24 removeContextFromKeyboardState];
    uint64_t v11 = [(TITypologyRecord *)v24 currentKeyboardState];
    [(TITypologyLog *)self setLastKeyboardState:v11];
  }
  long long v12 = [TITraceLogRecord alloc];
  long long v13 = [(TITypologyRecord *)v24 recordID];
  long long v14 = [(TITraceLogRecord *)v12 initWithRecordUUID:v13 logText:v6 logVersion:3];

  long long v15 = [(TITypologyLog *)self records];
  [v15 addEntry:v24];

  char v16 = [(TITypologyLog *)self traceRecords];
  [v16 addEntry:v14];

  uint64_t v17 = [(TITypologyLog *)self loggedRecordClasses];
  [v17 addObject:objc_opt_class()];

  uint64_t v18 = [(TITypologyLog *)self records];
  uint64_t v19 = [v18 count];
  uint64_t v20 = [(TITypologyLog *)self records];
  uint64_t v21 = [v20 maxCount];

  if (v19 == v21)
  {
    id v22 = [(TITypologyLog *)self delegate];
    [v22 didReachMaximumEntries:self];
  }
}

- (id)recordSummary
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"\n"];
  [v3 appendString:@"TYPOLOGY LOG\n"];
  [v3 appendString:@"------------\n"];
  id v4 = [(TITypologyLog *)self uuid];
  uint64_t v5 = [v4 UUIDString];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_1EDBDCE38;
  }
  [v3 appendFormat:@"uuid = %@\n", v7];

  uint64_t v8 = [(TITypologyLog *)self date];
  id v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = &stru_1EDBDCE38;
  }
  [v3 appendFormat:@"date = %@\n", v10];

  uint64_t v11 = [(TITypologyLog *)self systemVersion];
  long long v12 = (void *)v11;
  if (v11) {
    long long v13 = (__CFString *)v11;
  }
  else {
    long long v13 = &stru_1EDBDCE38;
  }
  [v3 appendFormat:@"systemVersion = %@\n", v13];

  uint64_t v14 = [(TITypologyLog *)self clientIdentifier];
  long long v15 = (void *)v14;
  if (v14) {
    char v16 = (__CFString *)v14;
  }
  else {
    char v16 = &stru_1EDBDCE38;
  }
  [v3 appendFormat:@"clientIdentifier = %@\n", v16];

  uint64_t v17 = [(TITypologyLog *)self textSummary];
  [v3 appendFormat:@"textSummary = %@\n", v17];

  [v3 appendString:@"------------\n"];
  uint64_t v18 = [(TITypologyLog *)self records];
  uint64_t v19 = [v18 currentEntries];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = [*(id *)(*((void *)&v27 + 1) + 8 * i) shortDescription];
        [v3 appendFormat:@"%@\n", v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }

  [v3 appendString:@"\n"];

  return v3;
}

- (id)textSummary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(TITypologyLog *)self records];
  uint64_t v5 = [v4 currentEntries];
  id v6 = [v5 lastObject];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [(TITypologyLog *)self lastKeyboardState];

    if (v7)
    {
      uint64_t v8 = objc_alloc_init(TITypologyRecordGroupMarker);
      id v9 = [(TITypologyLog *)self lastKeyboardState];
      [(TITypologyRecordGroupMarker *)v8 setKeyboardState:v9];

      [(TITypologyLog *)self logRecord:v8];
    }
  }
  uint64_t v10 = [(TITypologyLog *)self records];
  uint64_t v11 = [v10 currentEntries];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __28__TITypologyLog_textSummary__block_invoke;
  v14[3] = &unk_1E55597A0;
  id v12 = v3;
  id v15 = v12;
  [v11 enumerateObjectsUsingBlock:v14];

  return v12;
}

void __28__TITypologyLog_textSummary__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 textSummary];
    [v3 appendString:v4];
  }
}

- (id)_recommendedFilenameWithPrefix:(id)a3 andSuffix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TITypologyLog *)self uuid];
  id v9 = [v8 UUIDString];

  uint64_t v10 = [(TITypologyLog *)self timestamp];
  if ([(TITypologyLog *)self partIndex]) {
    [NSString stringWithFormat:@"%@-%@-%@.%lu.%@", v6, v10, v9, -[TITypologyLog partIndex](self, "partIndex"), v7];
  }
  else {
  uint64_t v11 = [NSString stringWithFormat:@"%@-%@-%@.%@", v6, v10, v9, v7, v13];
  }

  return v11;
}

- (NSString)recommendedTraceLogFilename
{
  return (NSString *)[(TITypologyLog *)self _recommendedFilenameWithPrefix:@"typologyTrace" andSuffix:@"log"];
}

- (NSString)recommendedTypologyLogFilename
{
  return (NSString *)[(TITypologyLog *)self _recommendedFilenameWithPrefix:@"typology" andSuffix:@"plist"];
}

- (BOOL)_writeToTraceLogFile:(id)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 URLByDeletingLastPathComponent];
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v51 = 0;
  int v9 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v51];
  id v10 = v51;

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v14 = [v6 path];
    id v15 = [(TITypologyLog *)self traceLogHeader];
    char v16 = [v15 dataUsingEncoding:4];
    uint64_t v17 = [(TITypologyLog *)self fileCreationOptions];
    char v18 = [v13 createFileAtPath:v14 contents:v16 attributes:v17];

    if (v18)
    {
      id v50 = 0;
      uint64_t v19 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v6 error:&v50];
      id v20 = v50;
      id v10 = v20;
      if (!v19 || v20)
      {
        BOOL v12 = 0;
        if (a4 && v20)
        {
          id v10 = v20;
          BOOL v12 = 0;
          *a4 = v10;
        }
      }
      else
      {
        id v48 = 0;
        uint64_t v49 = 0;
        [v19 seekToEndReturningOffset:&v49 error:&v48];
        id v10 = v48;
        uint64_t v21 = [MEMORY[0x1E4F28E78] string];
        uint64_t v22 = v21;
        if (!v10)
        {
          uint64_t v42 = 0;
          v43 = &v42;
          uint64_t v44 = 0x3032000000;
          v45 = __Block_byref_object_copy__6794;
          v46 = __Block_byref_object_dispose__6795;
          id v47 = 0;
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __44__TITypologyLog__writeToTraceLogFile_error___block_invoke;
          v38[3] = &unk_1E5559778;
          id v23 = v21;
          id v39 = v23;
          id v24 = v19;
          id v40 = v24;
          v41 = &v42;
          [(TITypologyLog *)self enumerateTraceRecordsWithBlockIncludingStop:v38];
          id v10 = (id)v43[5];

          _Block_object_dispose(&v42, 8);
          if (!v10)
          {
            long long v25 = [v23 dataUsingEncoding:4];
            id v37 = 0;
            [v24 writeData:v25 error:&v37];
            id v10 = v37;
          }
        }
        id v36 = 0;
        [v19 closeAndReturnError:&v36];
        id v26 = v36;
        long long v27 = v26;
        if (v26 && !v10) {
          id v10 = v26;
        }
        if (a4 && v10) {
          *a4 = v10;
        }
        BOOL v12 = v10 == 0;
      }
    }
    else
    {
      if (a4)
      {
        long long v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = *MEMORY[0x1E4F281F8];
        uint64_t v30 = *__error();
        v52 = @"Error";
        v31 = NSString;
        uint64_t v32 = __error();
        v33 = [v31 stringWithCString:strerror(*v32) encoding:1];
        v53[0] = v33;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
        *a4 = [v28 errorWithDomain:v29 code:v30 userInfo:v34];
      }
      id v10 = 0;
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
    if (a4 && v10)
    {
      id v10 = v10;
      BOOL v12 = 0;
      *a4 = v10;
    }
  }

  return v12;
}

void __44__TITypologyLog__writeToTraceLogFile_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x192F9B3D0]();
  id v5 = *(void **)(a1 + 32);
  id v6 = [v3 logTextWithHeader];
  [v5 appendString:v6];

  if ((unint64_t)[*(id *)(a1 + 32) length] >= 0x7D1)
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) dataUsingEncoding:4];
    int v9 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id obj = 0;
    [v7 writeData:v8 error:&obj];
    objc_storeStrong(v9, obj);

    [*(id *)(a1 + 32) setString:&stru_1EDBDCE38];
  }
}

- (BOOL)_writeToTypologyLogFile:(id)a3 withAccessibilityInfo:(id)a4 includeTraceLogContent:(BOOL)a5 error:(id *)a6
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (a5) {
    [(TITypologyLog *)self propertyListWithTrace];
  }
  else {
  BOOL v12 = [(TITypologyLog *)self propertyList];
  }
  uint64_t v13 = (void *)[v12 mutableCopy];

  if (v11)
  {
    uint64_t v14 = [v13 objectForKey:@"config"];
    id v15 = (void *)[v14 mutableCopy];

    [v15 addEntriesFromDictionary:v11];
    [v13 setObject:v15 forKey:@"config"];
  }
  char v16 = [v10 URLByDeletingLastPathComponent];
  uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v41 = 0;
  int v18 = [v17 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v41];
  id v19 = v41;

  if (!v18 || v19)
  {
    BOOL v27 = 0;
    if (a6 && v19)
    {
      id v19 = v19;
      BOOL v27 = 0;
      *a6 = v19;
    }
  }
  else
  {
    id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v21 = [v10 path];
    uint64_t v22 = [MEMORY[0x1E4F1C9B8] data];
    id v23 = [(TITypologyLog *)self fileCreationOptions];
    char v24 = [v20 createFileAtPath:v21 contents:v22 attributes:v23];

    if (v24)
    {
      long long v25 = [MEMORY[0x1E4F1CAA8] outputStreamWithURL:v10 append:1];
      [v25 open];
      id v26 = [v25 streamError];
      if (v26)
      {
        id v19 = v26;
        if (a6)
        {
          id v19 = v26;
          BOOL v27 = 0;
          *a6 = v19;
        }
        else
        {
          BOOL v27 = 0;
        }
      }
      else
      {
        id v40 = 0;
        uint64_t v35 = [MEMORY[0x1E4F28F98] writePropertyList:v13 toStream:v25 format:100 options:0 error:&v40];
        id v36 = v40;
        id v19 = v36;
        if (!v35 && !v36)
        {
          id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:&unk_1EDC2C3A0];
        }
        [v25 close];
        id v37 = [v25 streamError];
        v38 = v37;
        if (v37 && !v19) {
          id v19 = v37;
        }
        if (a6 && v19) {
          *a6 = v19;
        }
        BOOL v27 = v19 == 0;
      }
    }
    else
    {
      if (a6)
      {
        long long v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = *MEMORY[0x1E4F281F8];
        uint64_t v30 = *__error();
        uint64_t v42 = @"Error";
        v31 = NSString;
        uint64_t v32 = __error();
        v33 = [v31 stringWithCString:strerror(*v32) encoding:1];
        v43[0] = v33;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
        *a6 = [v28 errorWithDomain:v29 code:v30 userInfo:v34];
      }
      id v19 = 0;
      BOOL v27 = 0;
    }
  }

  return v27;
}

- (id)fileCreationOptions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(TITypologyLog *)self delegate];
  char v3 = [v2 isInternalDeviceWithForcedTypologyLoggingForTesting];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4F28370];
    v7[0] = *MEMORY[0x1E4F28340];
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }

  return v4;
}

- (BOOL)writeToTypologyLogFile:(id)a3 andTraceLogFile:(id)a4 withAccessibilityInfo:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v22 = 0;
    BOOL v13 = [(TITypologyLog *)self _writeToTypologyLogFile:v10 withAccessibilityInfo:v12 includeTraceLogContent:v11 == 0 error:&v22];
    id v14 = v22;
    id v15 = v14;
    if (v13)
    {
      if (v11)
      {
        id v21 = v14;
        BOOL v16 = [(TITypologyLog *)self _writeToTraceLogFile:v11 error:&v21];
        id v17 = v21;

        if (v16)
        {
          BOOL v18 = 1;
LABEL_18:
          id v15 = v17;
          goto LABEL_19;
        }
        if (!a6)
        {
          BOOL v18 = 0;
          goto LABEL_18;
        }
        id v14 = v17;
        goto LABEL_15;
      }
      BOOL v18 = 1;
    }
    else
    {
      if (a6)
      {
LABEL_15:
        id v19 = v14;
        id v15 = v19;
        goto LABEL_16;
      }
      BOOL v18 = 0;
    }
  }
  else
  {
    if (a6)
    {
      id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:*__error() userInfo:&unk_1EDC2C378];
      id v15 = 0;
LABEL_16:
      BOOL v18 = 0;
      *a6 = v19;
      goto LABEL_19;
    }
    BOOL v18 = 0;
    id v15 = 0;
  }
LABEL_19:

  return v18;
}

- (void)parseTraceLogContent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(TITraceLogParser);
  [(TITraceLogParser *)v5 setDelegate:self];
  [(TITraceLogParser *)v5 parseTraceLogContent:v4];

  [(TITraceLogParser *)v5 setDelegate:0];
}

- (id)timestamp
{
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setLocale:v3];
  [v4 setDateFormat:@"yyyyMMdd'T'HHmmss"];
  id v5 = [(TITypologyLog *)self date];
  uint64_t v6 = [v4 stringFromDate:v5];

  return v6;
}

- (id)traceLogHeader
{
  char v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"Version: %lu\n", 3);
  id v4 = [(TITypologyLog *)self date];
  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v6 = [v4 descriptionWithLocale:v5];
  [v3 appendFormat:@"Date: %@\n", v6];

  id v7 = [(TITypologyLog *)self systemVersion];
  uint64_t v8 = [(TITypologyLog *)self buildVersion];
  [v3 appendFormat:@"iOS version: %@ (%@)\n", v7, v8];

  [v3 appendString:@"\n"];

  return v3;
}

- (id)trace
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__6794;
  id v12 = __Block_byref_object_dispose__6795;
  id v13 = [MEMORY[0x1E4F28E78] string];
  char v3 = (void *)v9[5];
  id v4 = [(TITypologyLog *)self traceLogHeader];
  [v3 appendString:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __22__TITypologyLog_trace__block_invoke;
  v7[3] = &unk_1E5559750;
  v7[4] = &v8;
  [(TITypologyLog *)self enumerateTraceRecordsWithBlock:v7];
  id v5 = (void *)[(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __22__TITypologyLog_trace__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 logTextWithHeader];
  [v2 appendString:v3];
}

- (id)propertyListWithTrace
{
  id v3 = [(TITypologyLog *)self propertyList];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(TITypologyLog *)self trace];
  [v4 setObject:v5 forKey:@"traceLogs"];

  return v4;
}

- (id)propertyList
{
  v38[10] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(TITypologyLogArchiverDelegate);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  id v36 = v3;
  [v4 setDelegate:v3];
  id v5 = [(TITypologyLog *)self records];
  uint64_t v6 = [v5 currentEntries];
  id v7 = (void *)[v6 mutableCopy];
  [v4 encodeObject:v7 forKey:*MEMORY[0x1E4F284E8]];

  [v4 finishEncoding];
  uint64_t v8 = [v4 encodedData];
  v37[0] = @"versionNumber";
  uint64_t v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TITypologyLog typologyLogVersion](self, "typologyLogVersion"));
  v38[0] = v35;
  v37[1] = @"uuid";
  v34 = [(TITypologyLog *)self uuid];
  uint64_t v9 = [v34 UUIDString];
  v33 = (void *)v9;
  if (v9) {
    uint64_t v10 = (__CFString *)v9;
  }
  else {
    uint64_t v10 = &stru_1EDBDCE38;
  }
  v38[1] = v10;
  v37[2] = @"partIndex";
  uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TITypologyLog partIndex](self, "partIndex"));
  v38[2] = v32;
  v37[3] = @"date";
  uint64_t v11 = [(TITypologyLog *)self date];
  id v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  }
  v38[3] = v11;
  v37[4] = @"systemVersion";
  uint64_t v13 = [(TITypologyLog *)self systemVersion];
  id v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = &stru_1EDBDCE38;
  }
  void v38[4] = v15;
  v37[5] = @"buildVersion";
  uint64_t v16 = [(TITypologyLog *)self buildVersion];
  id v17 = (void *)v16;
  if (v16) {
    BOOL v18 = (__CFString *)v16;
  }
  else {
    BOOL v18 = &stru_1EDBDCE38;
  }
  v38[5] = v18;
  v37[6] = @"clientIdentifier";
  uint64_t v19 = [(TITypologyLog *)self clientIdentifier];
  id v20 = (void *)v19;
  if (v19) {
    id v21 = (__CFString *)v19;
  }
  else {
    id v21 = &stru_1EDBDCE38;
  }
  v38[6] = v21;
  v37[7] = @"records";
  id v22 = v8;
  if (!v8)
  {
    id v22 = [MEMORY[0x1E4F1C9B8] data];
  }
  v38[7] = v22;
  v37[8] = @"config";
  uint64_t v23 = [(TITypologyLog *)self config];
  char v24 = (void *)v23;
  uint64_t v25 = MEMORY[0x1E4F1CC08];
  if (v23) {
    uint64_t v25 = v23;
  }
  v38[8] = v25;
  v37[9] = @"textSummary";
  uint64_t v26 = [(TITypologyLog *)self textSummary];
  BOOL v27 = (void *)v26;
  if (v26) {
    long long v28 = (__CFString *)v26;
  }
  else {
    long long v28 = &stru_1EDBDCE38;
  }
  v38[9] = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:10];

  if (!v8) {
  if (!v12)
  }

  return v29;
}

- (unint64_t)maxNumRecords
{
  return [(TIRollingLog *)self->_records maxCount];
}

- (unint64_t)numTraceRecords
{
  return [(TIRollingLog *)self->_traceRecords count];
}

- (unint64_t)numTypologyRecords
{
  return [(TIRollingLog *)self->_records count];
}

- (TITypologyLog)initWithPropertyList:(id)a3
{
  id v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)TITypologyLog;
  id v5 = [(TITypologyLog *)&v66 init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
    uint64_t v8 = [v7 objectForKey:@"version"];
    uint64_t v9 = (void *)v8;
    uint64_t v10 = &unk_1EDC38558;
    if (v8) {
      uint64_t v10 = (void *)v8;
    }
    id v11 = v10;

    objc_opt_class();
    v57 = v11;
    char isKindOfClass = objc_opt_isKindOfClass();
    v63 = [v7 objectForKey:@"uuid"];
    if (isKindOfClass)
    {
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();
    }
    else
    {
      char v13 = 0;
    }
    uint64_t v14 = [v7 objectForKey:@"partIndex"];
    id v15 = (void *)v14;
    uint64_t v16 = &unk_1EDC38570;
    if (v14) {
      uint64_t v16 = (void *)v14;
    }
    id v17 = v16;

    v62 = v17;
    if (v13)
    {
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();
      v61 = [v7 objectForKey:@"date"];
      if (v18)
      {
        objc_opt_class();
        char v19 = objc_opt_isKindOfClass();
        v60 = [v7 objectForKey:@"systemVersion"];
        if (v19)
        {
          objc_opt_class();
          char v20 = objc_opt_isKindOfClass();
          uint64_t v21 = [v7 objectForKey:@"buildVersion"];
          if (v20)
          {
            objc_opt_class();
            char v22 = objc_opt_isKindOfClass();
            uint64_t v23 = [v7 objectForKey:@"clientIdentifier"];
            if (v22)
            {
              objc_opt_class();
              char v24 = objc_opt_isKindOfClass();
              [v7 objectForKey:@"records"];
              v58 = (void *)v23;
              uint64_t v64 = v59 = (void *)v21;
              if (v24)
              {
                objc_opt_class();
                char v25 = objc_opt_isKindOfClass();
LABEL_25:
                uint64_t v26 = (void *)MEMORY[0x1E4F1CA80];
                uint64_t v27 = objc_opt_class();
                uint64_t v28 = objc_opt_class();
                uint64_t v29 = objc_opt_class();
                uint64_t v30 = objc_opt_class();
                v31 = objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, objc_opt_class(), 0);
                uint64_t v32 = +[TITypologyRecord recordClasses];
                [v31 addObjectsFromArray:v32];

                v33 = 0;
                id v34 = 0;
                uint64_t v35 = (void *)v64;
                if ((v25 & 1) != 0
                  && (id v65 = 0,
                      [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v31 fromData:v64 error:&v65],
                      v33 = objc_claimAutoreleasedReturnValue(),
                      id v34 = v65,
                      objc_opt_class(),
                      (objc_opt_isKindOfClass() & 1) != 0))
                {
                  uint64_t v36 = [v33 indexOfObjectPassingTest:&__block_literal_global_6856];
                  uint64_t v37 = [v7 objectForKey:@"traceLogs"];
                  v38 = (void *)v37;
                  id v39 = v57;
                  if (v36 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (v37)
                    {
                      objc_opt_class();
                      char v40 = objc_opt_isKindOfClass();
                      id v41 = [v7 objectForKey:@"config"];
                      if ((v40 & 1) == 0)
                      {
LABEL_42:
                        uint64_t v35 = (void *)v64;
                        goto LABEL_33;
                      }
                    }
                    else
                    {
                      id v41 = [v7 objectForKey:@"config"];
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v5->_typologyLogVersion = [v57 unsignedIntegerValue];
                      v5->_traceLogVersion = 3;
                      uint64_t v43 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v63];
                      uuid = v5->_uuid;
                      v5->_uuid = (NSUUID *)v43;

                      v5->_partIndex = [v62 unsignedIntegerValue];
                      uint64_t v45 = [v61 copy];
                      date = v5->_date;
                      v5->_date = (NSDate *)v45;

                      uint64_t v47 = [v60 copy];
                      systemVersion = v5->_systemVersion;
                      v5->_systemVersion = (NSString *)v47;

                      uint64_t v49 = [v59 copy];
                      buildVersion = v5->_buildVersion;
                      v5->_buildVersion = (NSString *)v49;

                      uint64_t v51 = [v58 copy];
                      clientIdentifier = v5->_clientIdentifier;
                      v5->_clientIdentifier = (NSString *)v51;

                      v53 = [[TIRollingLog alloc] initWithMaxCount:750];
                      records = v5->_records;
                      v5->_records = v53;

                      [(TIRollingLog *)v5->_records addEntries:v33];
                      v55 = [[TIRollingLog alloc] initWithMaxCount:750];
                      traceRecords = v5->_traceRecords;
                      v5->_traceRecords = v55;

                      if (v38) {
                        [(TITypologyLog *)v5 parseTraceLogContent:v38];
                      }
                      objc_storeStrong((id *)&v5->_config, v41);
                      uint64_t v35 = (void *)v64;
                      goto LABEL_34;
                    }
                    goto LABEL_42;
                  }
                  uint64_t v35 = (void *)v64;
                }
                else
                {
                  v38 = [v7 objectForKey:@"traceLogs"];
                  id v39 = v57;
                }
                id v41 = [v7 objectForKey:@"config"];
LABEL_33:

                id v5 = 0;
LABEL_34:

                goto LABEL_35;
              }
LABEL_24:
              char v25 = 0;
              goto LABEL_25;
            }
LABEL_23:
            v58 = (void *)v23;
            v59 = (void *)v21;
            uint64_t v64 = [v7 objectForKey:@"records"];
            goto LABEL_24;
          }
LABEL_22:
          uint64_t v23 = [v7 objectForKey:@"clientIdentifier"];
          goto LABEL_23;
        }
LABEL_21:
        uint64_t v21 = [v7 objectForKey:@"buildVersion"];
        goto LABEL_22;
      }
    }
    else
    {
      v61 = [v7 objectForKey:@"date"];
    }
    v60 = [v7 objectForKey:@"systemVersion"];
    goto LABEL_21;
  }
LABEL_35:

  return v5;
}

BOOL __38__TITypologyLog_initWithPropertyList___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithTypologyLog:self];
}

- (TITypologyLog)initWithTypologyLog:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)TITypologyLog;
  id v5 = [(TITypologyLog *)&v32 init];
  uint64_t v6 = (TITypologyLog *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_18D2C3CF0;
    id v7 = [v4 uuid];
    uint64_t v8 = [v7 copy];
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v8;

    v6->_partIndex = [v4 partIndex];
    uint64_t v10 = [v4 date];
    uint64_t v11 = [v10 copy];
    date = v6->_date;
    v6->_date = (NSDate *)v11;

    char v13 = [v4 systemVersion];
    uint64_t v14 = [v13 copy];
    systemVersion = v6->_systemVersion;
    v6->_systemVersion = (NSString *)v14;

    uint64_t v16 = [v4 buildVersion];
    uint64_t v17 = [v16 copy];
    buildVersion = v6->_buildVersion;
    v6->_buildVersion = (NSString *)v17;

    char v19 = [v4 clientIdentifier];
    uint64_t v20 = [v19 copy];
    clientIdentifier = v6->_clientIdentifier;
    v6->_clientIdentifier = (NSString *)v20;

    char v22 = [v4 records];
    uint64_t v23 = [v22 copy];
    records = v6->_records;
    v6->_records = (TIRollingLog *)v23;

    char v25 = [v4 traceRecords];
    uint64_t v26 = [v25 copy];
    traceRecords = v6->_traceRecords;
    v6->_traceRecords = (TIRollingLog *)v26;

    uint64_t v28 = [v4 config];
    uint64_t v29 = [v28 copy];
    config = v6->_config;
    v6->_config = (NSDictionary *)v29;
  }
  return v6;
}

- (TITypologyLog)initWithUUID:(id)a3 partIndex:(unint64_t)a4 date:(id)a5 systemVersion:(id)a6 buildVersion:(id)a7 clientIdentifier:(id)a8 config:(id)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  v36.receiver = self;
  v36.super_class = (Class)TITypologyLog;
  char v19 = [(TITypologyLog *)&v36 init];
  uint64_t v20 = (TITypologyLog *)v19;
  if (v19)
  {
    *(_OWORD *)(v19 + 8) = xmmword_18D2C3CF0;
    uint64_t v21 = [v15 copy];
    date = v20->_date;
    v20->_date = (NSDate *)v21;

    uint64_t v23 = [[TIRollingLog alloc] initWithMaxCount:750];
    records = v20->_records;
    v20->_records = v23;

    char v25 = [[TIRollingLog alloc] initWithMaxCount:750];
    traceRecords = v20->_traceRecords;
    v20->_traceRecords = v25;

    uint64_t v27 = [v14 copy];
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v27;

    v20->_partIndex = a4;
    uint64_t v29 = [v16 copy];
    systemVersion = v20->_systemVersion;
    v20->_systemVersion = (NSString *)v29;

    uint64_t v31 = [v17 copy];
    buildVersion = v20->_buildVersion;
    v20->_buildVersion = (NSString *)v31;

    uint64_t v33 = [v18 copy];
    config = v20->_config;
    v20->_config = (NSDictionary *)v33;
  }
  return v20;
}

- (TITypologyLog)init
{
  v17.receiver = self;
  v17.super_class = (Class)TITypologyLog;
  id v2 = [(TITypologyLog *)&v17 init];
  id v3 = (TITypologyLog *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_18D2C3CF0;
    id v4 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    date = v3->_date;
    v3->_date = v4;

    uint64_t v6 = [[TIRollingLog alloc] initWithMaxCount:750];
    records = v3->_records;
    v3->_records = v6;

    uint64_t v8 = [[TIRollingLog alloc] initWithMaxCount:750];
    traceRecords = v3->_traceRecords;
    v3->_traceRecords = v8;

    uint64_t v10 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    uuid = v3->_uuid;
    v3->_uuid = v10;

    v3->_partIndex = 0;
    uint64_t v12 = MGCopyAnswer();
    systemVersion = v3->_systemVersion;
    v3->_systemVersion = (NSString *)v12;

    uint64_t v14 = MGCopyAnswer();
    buildVersion = v3->_buildVersion;
    v3->_buildVersion = (NSString *)v14;
  }
  return v3;
}

+ (id)typologyLogURLFromTraceLogURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lastPathComponent];
  uint64_t v6 = [a1 typologyLogFilenameFromTraceLogFilename:v5];
  if (v6)
  {
    id v7 = [v4 URLByDeletingLastPathComponent];
    uint64_t v8 = [v7 URLByAppendingPathComponent:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)traceLogURLFromTypologyLogURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lastPathComponent];
  uint64_t v6 = [a1 traceLogFilenameFromTypologyLogFilename:v5];
  if (v6)
  {
    id v7 = [v4 URLByDeletingLastPathComponent];
    uint64_t v8 = [v7 URLByAppendingPathComponent:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)_adjustFilename:(id)a3 oldPrefix:(id)a4 newPrefix:(id)a5 oldSuffix:(id)a6 newSuffix:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:options:range:", v14, v13, 8, 0, objc_msgSend(v15, "length"));

  objc_super v17 = objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:options:range:", v12, v11, 12, 0, objc_msgSend(v16, "length"));

  return v17;
}

+ (id)typologyLogFilenameFromTraceLogFilename:(id)a3
{
  id v4 = a3;
  if ([a1 isTraceLogFilename:v4])
  {
    id v5 = [a1 _adjustFilename:v4 oldPrefix:@"typologyTrace-" newPrefix:@"typology-" oldSuffix:@".log" newSuffix:@".plist"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)traceLogFilenameFromTypologyLogFilename:(id)a3
{
  id v4 = a3;
  if ([a1 isTypologyLogFilename:v4])
  {
    id v5 = [a1 _adjustFilename:v4 oldPrefix:@"typology-" newPrefix:@"typologyTrace-" oldSuffix:@".plist" newSuffix:@".log"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)isTraceLogFilename:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"typologyTrace"]) {
    char v4 = [v3 hasSuffix:@".log"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)isTypologyLogFilename:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"typology"]) {
    char v4 = [v3 hasSuffix:@".plist"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)typologyLogFromTypologyLogFile:(id)a3 andTraceLogFile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v24 = 0;
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v8 error:&v24];
    id v11 = v24;
    if (v11)
    {
      id v12 = v11;
      if (a5)
      {
        id v12 = v11;
        id v13 = 0;
        *a5 = v12;
      }
      else
      {
        id v13 = 0;
      }
      goto LABEL_29;
    }
    id v14 = [[TITypologyLog alloc] initWithPropertyList:v10];
    id v15 = [v10 objectForKey:@"traceLogs"];

    if (v9 && v15)
    {
      if (a5)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:*__error() userInfo:&unk_1EDC2C350];
        id v12 = 0;
        id v13 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      id v12 = 0;
LABEL_20:
      id v13 = 0;
      goto LABEL_28;
    }
    id v16 = [v10 objectForKey:@"traceLogs"];

    if (v16) {
      goto LABEL_14;
    }
    if (!v9)
    {
      id v9 = [a1 traceLogURLFromTypologyLogURL:v8];
      char v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v20 = [v9 path];
      int v21 = [v19 fileExistsAtPath:v20];

      if (!v21)
      {
        id v12 = 0;
        objc_super v17 = v9;
        id v9 = 0;
LABEL_26:

        goto LABEL_27;
      }
      if (!v9)
      {
LABEL_14:
        id v12 = 0;
LABEL_27:
        id v13 = v14;
        goto LABEL_28;
      }
    }
    id v23 = 0;
    objc_super v17 = [NSString stringWithContentsOfURL:v9 encoding:4 error:&v23];
    id v18 = v23;
    id v12 = v18;
    if (a5 && v18)
    {
      id v12 = v18;
      *a5 = v12;

      goto LABEL_20;
    }
    [(TITypologyLog *)v14 parseTraceLogContent:v17];
    goto LABEL_26;
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:*__error() userInfo:&unk_1EDC2C328];
    id v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
LABEL_30:

  return v13;
}

@end