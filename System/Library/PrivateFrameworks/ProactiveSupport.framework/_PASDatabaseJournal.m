@interface _PASDatabaseJournal
+ (id)_binderForDictionary:(id)a3;
+ (id)_journalPathForDbPath:(id)a3;
+ (id)journalForInMemoryDb;
+ (id)journalWithDbPath:(id)a3;
- (BOOL)_executeFile:(id)a3 onDb:(id)a4 becameLocked:(BOOL *)a5;
- (BOOL)_executeNextRecordFromFile:(id)a3 onDb:(id)a4 becameLocked:(BOOL *)a5 deleteFile:(BOOL *)a6;
- (BOOL)deleteAllJournaledQueries;
- (BOOL)executeQueriesOnDatabase:(id)a3;
- (BOOL)journaling;
- (BOOL)startJournaling;
- (BOOL)stopJournaling;
- (id)_getCurrentFile;
- (id)description;
- (id)directoryPath;
- (void)_addCurrentFileToLog;
- (void)_clearCurrentFile;
- (void)_closeCurrentFile;
- (void)runQuery:(id)a3 values:(id)a4 onDb:(id)a5;
@end

@implementation _PASDatabaseJournal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFile, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)journaling
{
  return self->_journaling;
}

- (id)directoryPath
{
  return self->_directoryPath;
}

- (BOOL)stopJournaling
{
  if (self->_inMemory) {
    return 0;
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37___PASDatabaseJournal_stopJournaling__block_invoke;
  v5[3] = &unk_1E5AEB708;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  BOOL v2 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (BOOL)startJournaling
{
  if (self->_inMemory) {
    return 0;
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___PASDatabaseJournal_startJournaling__block_invoke;
  v5[3] = &unk_1E5AEB708;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  BOOL v2 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (BOOL)deleteAllJournaledQueries
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48___PASDatabaseJournal_deleteAllJournaledQueries__block_invoke;
  v5[3] = &unk_1E5AEB708;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)executeQueriesOnDatabase:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  BOOL v7 = 1;
  if (!self->_inMemory)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48___PASDatabaseJournal_executeQueriesOnDatabase___block_invoke;
    v10[3] = &unk_1E5AEAF08;
    v10[4] = self;
    v12 = &v14;
    SEL v13 = a2;
    id v11 = v5;
    dispatch_sync(queue, v10);
    BOOL v7 = *((unsigned char *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

- (BOOL)_executeFile:(id)a3 onDb:(id)a4 becameLocked:(BOOL *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (self->_inMemory)
  {
    char v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_PASDatabaseJournal.m", 242, @"Invalid parameter not satisfying: %@", @"!_inMemory" object file lineNumber description];
  }
  char v19 = 1;
  id v11 = [(NSString *)self->_directoryPath stringByAppendingPathComponent:v9];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "executing journal file: %@", buf, 0xCu);
  }
  for (i = [[_PASDatabaseJournalFile alloc] initWithPath:v11];
        ![(_PASDatabaseJournalFile *)i isFullyRead];
        [(_PASDatabaseJournal *)self _executeNextRecordFromFile:i onDb:v10 becameLocked:a5 deleteFile:&v19])
  {
    ;
  }
  if (!v19) {
    goto LABEL_15;
  }
  SEL v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v18 = 0;
  [v13 removeItemAtPath:v11 error:&v18];
  id v14 = v18;

  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASDatabaseJournal deleted journal file: %@", buf, 0xCu);
    }
LABEL_15:
    id v14 = 0;
    BOOL v15 = 1;
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal unable to delete journal file: %@: %@", buf, 0x16u);
  }
  BOOL v15 = 0;
LABEL_16:

  return v15;
}

- (BOOL)_executeNextRecordFromFile:(id)a3 onDb:(id)a4 becameLocked:(BOOL *)a5 deleteFile:(BOOL *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void *)MEMORY[0x1A62450A0]();
  uint64_t v12 = [v9 read];
  if (!v12)
  {
    goto LABEL_6;
  }
  SEL v13 = (void *)v12;
  id v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  id v18 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
  id v31 = 0;
  char v19 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v18 fromData:v13 error:&v31];
  id v20 = v31;

  if (!v19)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v20;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Got nil after trying to unarchive a db journal at %@: %@", buf, 0x16u);
    }

    goto LABEL_13;
  }
  v21 = [v19 objectForKeyedSubscript:@"__query"];

  if (!v21)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v9;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "No __query key set in journal file: %@", buf, 0xCu);
    }

LABEL_13:
    BOOL v25 = 0;
    goto LABEL_14;
  }
  __int16 v22 = [v19 objectForKeyedSubscript:@"__query"];
  id v23 = +[_PASDatabaseJournal _binderForDictionary:v19];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __79___PASDatabaseJournal__executeNextRecordFromFile_onDb_becameLocked_deleteFile___block_invoke;
  v27[3] = &unk_1E5AEAEB8;
  id v28 = v19;
  v29 = a6;
  v30 = a5;
  id v24 = v19;
  [v10 prepAndRunQuery:v22 onPrep:v23 onRow:0 onError:v27];

LABEL_6:
  BOOL v25 = 1;
LABEL_14:

  return v25;
}

- (void)runQuery:(id)a3 values:(id)a4 onDb:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_inMemory)
  {
    id v11 = +[_PASDatabaseJournal _binderForDictionary:v9];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke_33;
    v14[3] = &unk_1E5AEB988;
    uint64_t v12 = &v15;
    id v15 = v8;
    [v10 prepAndRunQuery:v15 onPrep:v11 onRow:0 onError:v14];
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44___PASDatabaseJournal_runQuery_values_onDb___block_invoke;
    block[3] = &unk_1E5AEAE90;
    uint64_t v12 = &v17;
    id v17 = v8;
    id v18 = v9;
    char v19 = self;
    id v20 = v10;
    dispatch_sync(queue, block);

    id v11 = v18;
  }
}

- (void)_closeCurrentFile
{
  [(_PASDatabaseJournalFile *)self->_currentFile destroyAndUnlinkIfEmpty];
  currentFile = self->_currentFile;
  self->_currentFile = 0;
}

- (void)_addCurrentFileToLog
{
  currentFile = self->_currentFile;
  if (!currentFile
    || ![(_PASDatabaseJournalFile *)currentFile isAlive]
    || [(_PASDatabaseJournalFile *)self->_currentFile length] >= 0x100000)
  {
    v4 = NSString;
    directoryPath = self->_directoryPath;
    unint64_t serialNumber = self->_serialNumber;
    self->_unint64_t serialNumber = serialNumber + 1;
    BOOL v7 = [v4 stringWithFormat:@"J-%20llu.%@.dbJournal", serialNumber, self->_uuid];
    id v10 = [(NSString *)directoryPath stringByAppendingPathComponent:v7];

    id v8 = [[_PASDatabaseJournalFile alloc] initWithPath:v10];
    id v9 = self->_currentFile;
    self->_currentFile = v8;
  }
}

- (void)_clearCurrentFile
{
}

- (id)_getCurrentFile
{
  currentFile = self->_currentFile;
  if (!currentFile)
  {
    [(_PASDatabaseJournal *)self _addCurrentFileToLog];
    currentFile = self->_currentFile;
  }

  return currentFile;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@ in %@>", v5, self->_directoryPath];

  return v6;
}

+ (id)_binderForDictionary:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44___PASDatabaseJournal__binderForDictionary___block_invoke;
  v7[3] = &unk_1E5AEB938;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1A6245320](v7);

  return v5;
}

+ (id)journalForInMemoryDb
{
  uint64_t v2 = objc_opt_new();
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.proactive.databasejournal.inmemory", 0);
  id v4 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = v3;

  id v5 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  *(void *)(v2 + 24) = 0;
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [v6 UUIDString];
  id v8 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = v7;

  *(unsigned char *)(v2 + 41) = 1;

  return (id)v2;
}

+ (id)journalWithDbPath:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pthread_mutex_lock(&journalWithDbPath__lock);
  if (!journalWithDbPath__instances)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:1];
    uint64_t v6 = (void *)journalWithDbPath__instances;
    journalWithDbPath__instances = v5;
  }
  uint64_t v7 = [a1 _journalPathForDbPath:v4];
  id v8 = [v7 lastPathComponent];
  id v9 = [v8 stringByDeletingPathExtension];

  uint64_t v10 = [(id)journalWithDbPath__instances objectForKey:v9];
  if (!v10)
  {
    uint64_t v10 = objc_opt_new();
    id v11 = [@"com.apple.proactive.databasejournal." stringByAppendingString:v9];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    SEL v13 = *(void **)(v10 + 8);
    *(void *)(v10 + 8) = v12;

    objc_storeStrong((id *)(v10 + 16), v7);
    *(void *)(v10 + 24) = 0;
    id v14 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v15 = [v14 UUIDString];
    uint64_t v16 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = v15;

    id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v18 = *(void *)(v10 + 16);
    id v22 = 0;
    char v19 = [v17 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:&v22];
    id v20 = v22;

    if (v19)
    {
      [(id)journalWithDbPath__instances setObject:v10 forKey:v9];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v20;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASDatabaseJournal unable to create directory for storing journals: %@", buf, 0xCu);
      }

      uint64_t v10 = 0;
    }
  }
  pthread_mutex_unlock(&journalWithDbPath__lock);

  return (id)v10;
}

+ (id)_journalPathForDbPath:(id)a3
{
  return (id)[a3 stringByAppendingString:@".journal"];
}

@end