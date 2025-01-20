@interface PLArchiveEntry
+ (id)entryKey;
+ (id)storageQueue;
+ (void)load;
- (BOOL)fullMode;
- (BOOL)removed;
- (BOOL)syncedOff;
- (BOOL)systemTimeOffsetModified;
- (NSDate)endDate;
- (NSDate)removedDate;
- (NSDate)startDate;
- (NSDate)syncedOffDate;
- (NSString)compressedPath;
- (NSString)crPath;
- (NSString)name;
- (NSString)path;
- (NSString)uuid;
- (PLArchiveEntry)initWithMetadata:(id)a3;
- (PLArchiveEntry)initWithStartDate:(id)a3 endDate:(id)a4 andUUID:(id)a5;
- (double)systemTimeOffset;
- (id)initEntryWithRawData:(id)a3;
- (int64_t)mainDBSizeAtStart;
- (int64_t)stage;
- (unint64_t)numAttempts;
- (void)log;
- (void)setMainDBSizeAtStart:(int64_t)a3;
- (void)setNumAttempts:(unint64_t)a3;
- (void)setRemovedDate:(id)a3;
- (void)setStage:(int64_t)a3;
- (void)setSyncedOffDate:(id)a3;
- (void)setSystemTimeOffset:(double)a3;
@end

@implementation PLArchiveEntry

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLArchiveEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  return +[PLOperator entryKeyForType:@"EventPoint" andName:@"Archive"];
}

- (PLArchiveEntry)initWithStartDate:(id)a3 endDate:(id)a4 andUUID:(id)a5
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v15[0] = @"StartDate";
  v15[1] = @"EndDate";
  v16[0] = a3;
  v16[1] = a4;
  v15[2] = @"UUID";
  v16[2] = a5;
  v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 dictionaryWithObjects:v16 forKeys:v15 count:3];

  v13 = [(PLArchiveEntry *)self initEntryWithRawData:v12];
  [(PLArchiveEntry *)v13 log];

  return v13;
}

- (PLArchiveEntry)initWithMetadata:(id)a3
{
  v34[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PLArchiveEntry;
  v5 = [(PLEntry *)&v32 init];
  if (v5)
  {
    v30 = v5;
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v4];
    v7 = [v6 objectForKeyedSubscript:@"systemTimeOffset"];
    [v7 doubleValue];
    double v9 = v8;

    id v10 = (void *)MEMORY[0x1E4F1C9C8];
    id v11 = [v6 objectForKeyedSubscript:@"systemTimeStart"];
    [v11 doubleValue];
    v12 = objc_msgSend(v10, "dateWithTimeIntervalSince1970:");

    v13 = (void *)MEMORY[0x1E4F1C9C8];
    v14 = [v6 objectForKeyedSubscript:@"systemTimeEnd"];
    [v14 doubleValue];
    v15 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");

    v33[0] = @"StartDate";
    v29 = v12;
    v27 = [v12 dateByAddingTimeInterval:-v9];
    v34[0] = v27;
    v33[1] = @"EndDate";
    v28 = v15;
    v16 = [v15 dateByAddingTimeInterval:-v9];
    v34[1] = v16;
    v33[2] = @"UUID";
    id v31 = v4;
    v17 = +[PLUtilities extractDateStringAndUUIDStringFromFilePath:v4];
    v18 = [v17 lastObject];
    v34[2] = v18;
    v33[3] = @"SystemTimeOffset";
    v19 = [NSNumber numberWithDouble:v9];
    v34[3] = v19;
    v33[4] = @"SystemTimeOffsetModified";
    v20 = [v6 objectForKeyedSubscript:@"systemTimeModified"];
    v34[4] = v20;
    v33[5] = @"FullMode";
    v21 = [v6 objectForKeyedSubscript:@"fullMode"];
    v34[5] = v21;
    v33[6] = @"SyncedOffDate";
    v22 = [v6 objectForKeyedSubscript:@"hasBeenLinkedToCR"];
    if (v22) {
      [MEMORY[0x1E4F1C9C8] monotonicDate];
    }
    else {
    v24 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    }
    v34[6] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:7];

    v23 = [(PLArchiveEntry *)v30 initEntryWithRawData:v25];
    [(PLArchiveEntry *)v23 log];

    id v4 = v31;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)initEntryWithRawData:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  v5 = [v4 objectForKeyedSubscript:@"SystemTimeOffset"];

  if (!v5)
  {
    v6 = NSNumber;
    v7 = [MEMORY[0x1E4F1C9C8] date];
    double v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v7 timeIntervalSinceDate:v8];
    double v9 = objc_msgSend(v6, "numberWithDouble:");
    [v4 setObject:v9 forKeyedSubscript:@"SystemTimeOffset"];
  }
  id v10 = [v4 objectForKeyedSubscript:@"SystemTimeOffsetModified"];

  if (!v10) {
    [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"SystemTimeOffsetModified"];
  }
  id v11 = [v4 objectForKeyedSubscript:@"FullMode"];

  if (!v11)
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", +[PLDefaults fullMode](PLDefaults, "fullMode"));
    [v4 setObject:v12 forKeyedSubscript:@"FullMode"];
  }
  v13 = [v4 objectForKeyedSubscript:@"Stage"];

  if (!v13) {
    [v4 setObject:&unk_1F15805D0 forKeyedSubscript:@"Stage"];
  }
  v14 = [v4 objectForKeyedSubscript:@"NumAttempts"];

  if (!v14) {
    [v4 setObject:&unk_1F15805E8 forKeyedSubscript:@"NumAttempts"];
  }
  v15 = [v4 objectForKeyedSubscript:@"SyncedOffDate"];

  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    [v4 setObject:v16 forKeyedSubscript:@"SyncedOffDate"];
  }
  v17 = [v4 objectForKeyedSubscript:@"RemovedDate"];

  if (!v17)
  {
    v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    [v4 setObject:v18 forKeyedSubscript:@"RemovedDate"];
  }
  v19 = [v4 objectForKeyedSubscript:@"MainDBSizeAtStart"];

  if (!v19) {
    [v4 setObject:&unk_1F15805E8 forKeyedSubscript:@"MainDBSizeAtStart"];
  }
  v20 = +[PLArchiveEntry entryKey];
  v23.receiver = self;
  v23.super_class = (Class)PLArchiveEntry;
  v21 = [(PLEntry *)&v23 initWithEntryKey:v20 withRawData:v4];

  return v21;
}

- (NSString)path
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = [(PLArchiveEntry *)self startDate];
  [(PLArchiveEntry *)self systemTimeOffset];
  v5 = objc_msgSend(v4, "dateByAddingTimeInterval:");
  v6 = [(PLArchiveEntry *)self endDate];
  [(PLArchiveEntry *)self systemTimeOffset];
  v7 = objc_msgSend(v6, "dateByAddingTimeInterval:");
  double v8 = [v3 filenameDateStringWithStartDate:v5 endDate:v7];

  double v9 = NSString;
  id v10 = +[PLUtilities containerPath];
  id v11 = [v10 stringByAppendingString:@"/Library/BatteryLife/Archives/powerlog_%@_%@.PLSQL"];
  v12 = [(PLArchiveEntry *)self uuid];
  v13 = objc_msgSend(v9, "stringWithFormat:", v11, v8, v12);

  return (NSString *)v13;
}

- (NSString)compressedPath
{
  objc_super v2 = [(PLArchiveEntry *)self path];
  v3 = [v2 stringByAppendingString:@".gz"];

  return (NSString *)v3;
}

- (NSString)name
{
  objc_super v2 = [(PLArchiveEntry *)self path];
  v3 = [v2 lastPathComponent];

  return (NSString *)v3;
}

- (NSDate)startDate
{
  return (NSDate *)[(PLEntry *)self objectForKeyedSubscript:@"StartDate"];
}

- (NSDate)endDate
{
  return (NSDate *)[(PLEntry *)self objectForKeyedSubscript:@"EndDate"];
}

- (NSString)uuid
{
  return (NSString *)[(PLEntry *)self objectForKeyedSubscript:@"UUID"];
}

- (void)setSystemTimeOffset:(double)a3
{
  [(PLArchiveEntry *)self systemTimeOffset];
  if (v5 != a3)
  {
    v6 = [(PLArchiveEntry *)self path];
    v7 = [(PLArchiveEntry *)self compressedPath];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    objc_super v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    double v8 = self;
    v25 = v8;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    *(double *)&v19[3] = a3;
    double v9 = +[PowerlogCore sharedCore];
    id v10 = [v9 storage];
    uint64_t v11 = v21[5];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __38__PLArchiveEntry_setSystemTimeOffset___block_invoke;
    v18[3] = &unk_1E6253A50;
    v18[4] = &v20;
    v18[5] = v19;
    [v10 updateEntry:v11 withBlock:v18];

    v12 = +[PowerlogCore sharedCore];
    v13 = [v12 storage];
    [v13 flushCachesWithReason:@"ArchiveEntryUpdate"];

    v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    v15 = [(PLArchiveEntry *)v8 path];
    [v14 moveItemAtPath:v6 toPath:v15 error:0];

    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    v17 = [(PLArchiveEntry *)v8 compressedPath];
    [v16 moveItemAtPath:v7 toPath:v17 error:0];

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(&v20, 8);
  }
}

uint64_t __38__PLArchiveEntry_setSystemTimeOffset___block_invoke(uint64_t a1)
{
  objc_super v2 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v2 forKeyedSubscript:@"SystemTimeOffset"];

  v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  return [v3 setObject:v4 forKeyedSubscript:@"SystemTimeOffsetModified"];
}

- (double)systemTimeOffset
{
  objc_super v2 = [(PLEntry *)self objectForKeyedSubscript:@"SystemTimeOffset"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (BOOL)fullMode
{
  objc_super v2 = [(PLEntry *)self objectForKeyedSubscript:@"FullMode"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setStage:(int64_t)a3
{
  if ([(PLArchiveEntry *)self stage] != a3)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = self;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = a3;
    double v5 = +[PowerlogCore sharedCore];
    v6 = [v5 storage];
    uint64_t v7 = v13[5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27__PLArchiveEntry_setStage___block_invoke;
    v10[3] = &unk_1E6253A50;
    v10[4] = &v12;
    v10[5] = v11;
    [v6 updateEntry:v7 withBlock:v10];

    double v8 = +[PowerlogCore sharedCore];
    double v9 = [v8 storage];
    [v9 flushCachesWithReason:@"ArchiveEntryUpdate"];

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(&v12, 8);
  }
}

void __27__PLArchiveEntry_setStage___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v2 forKeyedSubscript:@"Stage"];
}

- (int64_t)stage
{
  id v2 = [(PLEntry *)self objectForKeyedSubscript:@"Stage"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setNumAttempts:(unint64_t)a3
{
  if ([(PLArchiveEntry *)self numAttempts] != a3)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = self;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = a3;
    double v5 = +[PowerlogCore sharedCore];
    v6 = [v5 storage];
    uint64_t v7 = v13[5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33__PLArchiveEntry_setNumAttempts___block_invoke;
    v10[3] = &unk_1E6253A50;
    v10[4] = &v12;
    v10[5] = v11;
    [v6 updateEntry:v7 withBlock:v10];

    double v8 = +[PowerlogCore sharedCore];
    double v9 = [v8 storage];
    [v9 flushCachesWithReason:@"ArchiveEntryUpdate"];

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(&v12, 8);
  }
}

void __33__PLArchiveEntry_setNumAttempts___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v2 forKeyedSubscript:@"NumAttempts"];
}

- (unint64_t)numAttempts
{
  id v2 = [(PLEntry *)self objectForKeyedSubscript:@"NumAttempts"];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setSyncedOffDate:(id)a3
{
  id v4 = a3;
  double v5 = [(PLArchiveEntry *)self syncedOffDate];
  if (([v4 isEqualToDate:v5] & 1) != 0
    || !+[PLDefaults fullMode])
  {
  }
  else
  {
    uint64_t v6 = [(PLArchiveEntry *)self stage];

    if (v6 >= 5)
    {
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__0;
      v19 = __Block_byref_object_dispose__0;
      uint64_t v20 = self;
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x3032000000;
      v13[3] = __Block_byref_object_copy__0;
      v13[4] = __Block_byref_object_dispose__0;
      id v14 = v4;
      uint64_t v7 = +[PowerlogCore sharedCore];
      double v8 = [v7 storage];
      uint64_t v9 = v16[5];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __35__PLArchiveEntry_setSyncedOffDate___block_invoke;
      v12[3] = &unk_1E6253A50;
      v12[4] = &v15;
      v12[5] = v13;
      [v8 updateEntry:v9 withBlock:v12];

      id v10 = +[PowerlogCore sharedCore];
      uint64_t v11 = [v10 storage];
      [v11 flushCachesWithReason:@"ArchiveEntryUpdate"];

      _Block_object_dispose(v13, 8);
      _Block_object_dispose(&v15, 8);
    }
  }
}

uint64_t __35__PLArchiveEntry_setSyncedOffDate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:@"SyncedOffDate"];
}

- (NSDate)syncedOffDate
{
  return (NSDate *)[(PLEntry *)self objectForKeyedSubscript:@"SyncedOffDate"];
}

- (BOOL)syncedOff
{
  id v2 = [(PLArchiveEntry *)self syncedOffDate];
  [v2 timeIntervalSince1970];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)setRemovedDate:(id)a3
{
  id v4 = a3;
  double v5 = [(PLArchiveEntry *)self removedDate];
  if ([v4 isEqualToDate:v5])
  {
  }
  else
  {
    uint64_t v6 = [(PLArchiveEntry *)self stage];

    if (v6 >= 5)
    {
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__0;
      v19 = __Block_byref_object_dispose__0;
      uint64_t v20 = self;
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x3032000000;
      v13[3] = __Block_byref_object_copy__0;
      v13[4] = __Block_byref_object_dispose__0;
      id v14 = v4;
      uint64_t v7 = +[PowerlogCore sharedCore];
      double v8 = [v7 storage];
      uint64_t v9 = v16[5];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __33__PLArchiveEntry_setRemovedDate___block_invoke;
      v12[3] = &unk_1E6253A50;
      v12[4] = &v15;
      v12[5] = v13;
      [v8 updateEntry:v9 withBlock:v12];

      id v10 = +[PowerlogCore sharedCore];
      uint64_t v11 = [v10 storage];
      [v11 flushCachesWithReason:@"ArchiveEntryUpdate"];

      _Block_object_dispose(v13, 8);
      _Block_object_dispose(&v15, 8);
    }
  }
}

uint64_t __33__PLArchiveEntry_setRemovedDate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:@"RemovedDate"];
}

- (NSDate)removedDate
{
  return (NSDate *)[(PLEntry *)self objectForKeyedSubscript:@"RemovedDate"];
}

- (BOOL)removed
{
  id v2 = [(PLArchiveEntry *)self removedDate];
  [v2 timeIntervalSince1970];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)setMainDBSizeAtStart:(int64_t)a3
{
  if ([(PLArchiveEntry *)self mainDBSizeAtStart] != a3)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    uint64_t v17 = self;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = a3;
    double v5 = +[PowerlogCore sharedCore];
    uint64_t v6 = [v5 storage];
    uint64_t v7 = v13[5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__PLArchiveEntry_setMainDBSizeAtStart___block_invoke;
    v10[3] = &unk_1E6253A50;
    v10[4] = &v12;
    v10[5] = v11;
    [v6 updateEntry:v7 withBlock:v10];

    double v8 = +[PowerlogCore sharedCore];
    uint64_t v9 = [v8 storage];
    [v9 flushCachesWithReason:@"ArchiveEntryUpdate"];

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(&v12, 8);
  }
}

void __39__PLArchiveEntry_setMainDBSizeAtStart___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithLongLong:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v2 forKeyedSubscript:@"MainDBSizeAtStart"];
}

- (int64_t)mainDBSizeAtStart
{
  id v2 = [(PLEntry *)self objectForKeyedSubscript:@"MainDBSizeAtStart"];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (void)log
{
  id v4 = +[PowerlogCore sharedCore];
  int64_t v3 = [v4 storage];
  [v3 writeEntry:self withCompletionBlock:&__block_literal_global_4];
}

+ (id)storageQueue
{
  id v2 = +[PLCoreStorage storageQueueNameForClass:objc_opt_class()];
  int64_t v3 = +[PLUtilities workQueueForKey:v2];

  return v3;
}

- (NSString)crPath
{
  return self->_crPath;
}

- (BOOL)systemTimeOffsetModified
{
  return self->_systemTimeOffsetModified;
}

- (void).cxx_destruct
{
}

@end