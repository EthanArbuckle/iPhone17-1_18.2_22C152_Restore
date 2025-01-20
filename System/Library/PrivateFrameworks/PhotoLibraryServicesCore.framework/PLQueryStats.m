@interface PLQueryStats
+ (BOOL)allowedToTrack;
+ (id)byteCountFormatter;
+ (id)startedQueryStatsWithContext:(id)a3;
- (PLQueryStats)initWithContext:(id)a3;
- (id)stopRecordingDescriptionWithFetchCount:(int64_t)a3;
@end

@implementation PLQueryStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preStats, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (id)stopRecordingDescriptionWithFetchCount:(int64_t)a3
{
  v5 = [(NSManagedObjectContext *)self->_context databaseStatistics];
  [(NSManagedObjectContext *)self->_context setTrackSQLiteDatabaseStatistics:1];
  v6 = [v5 databaseStatisticsBySubtracting:self->_preStats];
  v7 = +[PLQueryStats byteCountFormatter];
  v8 = objc_msgSend(v7, "stringFromByteCount:", objc_msgSend(v6, "totalCachePages") * objc_msgSend(v6, "pageSize"));

  v9 = +[PLQueryStats byteCountFormatter];
  if (a3 < 1)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = [v6 pageSize];
    uint64_t v11 = (uint64_t)((double)([v6 totalCachePages] * v10) / (double)a3);
  }
  v12 = [v9 stringFromByteCount:v11];

  v13 = [NSString stringWithFormat:@"Total I/O=%@, rows=%td [%@ / row]", v8, a3, v12];

  return v13;
}

- (PLQueryStats)initWithContext:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLQueryStats.m", 24, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PLQueryStats;
  v7 = [(PLQueryStats *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_context, a3);
    [(NSManagedObjectContext *)v8->_context setTrackSQLiteDatabaseStatistics:1];
    uint64_t v9 = [(NSManagedObjectContext *)v8->_context databaseStatistics];
    preStats = v8->_preStats;
    v8->_preStats = (NSSQLiteDatabaseStatistics *)v9;
  }
  return v8;
}

+ (id)byteCountFormatter
{
  if (byteCountFormatter_sOnceToken != -1) {
    dispatch_once(&byteCountFormatter_sOnceToken, &__block_literal_global_1236);
  }
  v2 = (void *)byteCountFormatter_sByteCountFormatter;
  return v2;
}

uint64_t __34__PLQueryStats_byteCountFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28B68]);
  v1 = (void *)byteCountFormatter_sByteCountFormatter;
  byteCountFormatter_sByteCountFormatter = (uint64_t)v0;

  [(id)byteCountFormatter_sByteCountFormatter setCountStyle:3];
  v2 = (void *)byteCountFormatter_sByteCountFormatter;
  return [v2 setAllowsNonnumericFormatting:0];
}

+ (BOOL)allowedToTrack
{
  int HasInternalDiagnostics = PFOSVariantHasInternalDiagnostics();
  if (HasInternalDiagnostics)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v4 = [v3 BOOLForKey:@"enableSQLStatisticTracking"];

    LOBYTE(HasInternalDiagnostics) = v4;
  }
  return HasInternalDiagnostics;
}

+ (id)startedQueryStatsWithContext:(id)a3
{
  id v4 = a3;
  if (v4 && [a1 allowedToTrack]) {
    v5 = [[PLQueryStats alloc] initWithContext:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

@end