@interface ICCloudContextSyncMetrics
- (BOOL)success;
- (ICCloudContextSyncMetrics)initWithSyncReason:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)syncReason;
- (double)cloudKitDuration;
- (id)dictionaryRepresentation;
- (int64_t)averageRecordsPerSecond;
- (int64_t)bytesDownloaded;
- (int64_t)bytesUploaded;
- (int64_t)deletedRecordsCount;
- (int64_t)fetchedRecordCount;
- (int64_t)modifiedRecordCount;
- (int64_t)operationCount;
- (int64_t)processedRecordCount;
- (int64_t)saveCount;
- (void)finishWithSuccess:(BOOL)a3;
- (void)setAverageRecordsPerSecond:(int64_t)a3;
- (void)setBytesDownloaded:(int64_t)a3;
- (void)setBytesUploaded:(int64_t)a3;
- (void)setCloudKitDuration:(double)a3;
- (void)setDeletedRecordsCount:(int64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setFetchedRecordCount:(int64_t)a3;
- (void)setModifiedRecordCount:(int64_t)a3;
- (void)setOperationCount:(int64_t)a3;
- (void)setProcessedRecordCount:(int64_t)a3;
- (void)setSaveCount:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setSyncReason:(id)a3;
@end

@implementation ICCloudContextSyncMetrics

- (ICCloudContextSyncMetrics)initWithSyncReason:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICCloudContextSyncMetrics;
  v6 = [(ICCloudContextSyncMetrics *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_syncReason, a3);
    uint64_t v8 = +[NSDate date];
    startDate = v7->_startDate;
    v7->_startDate = (NSDate *)v8;
  }
  return v7;
}

- (id)dictionaryRepresentation
{
  v3 = [(ICCloudContextSyncMetrics *)self endDate];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSDate date];
  }
  v6 = v5;

  v7 = [(ICCloudContextSyncMetrics *)self startDate];
  v40 = v6;
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  uint64_t v10 = (uint64_t)((double)[(ICCloudContextSyncMetrics *)self processedRecordCount] / v9);
  v41[0] = @"reason";
  v39 = [(ICCloudContextSyncMetrics *)self syncReason];
  v42[0] = v39;
  v41[1] = @"fetchedRecordCount";
  v38 = +[NSNumber numberWithInteger:[(ICCloudContextSyncMetrics *)self fetchedRecordCount]];
  v37 = [v38 stringValue];
  v42[1] = v37;
  v41[2] = @"deletedRecordsCount";
  v36 = +[NSNumber numberWithInteger:[(ICCloudContextSyncMetrics *)self deletedRecordsCount]];
  v35 = [v36 stringValue];
  v42[2] = v35;
  v41[3] = @"modifiedRecordCount";
  v34 = +[NSNumber numberWithInteger:[(ICCloudContextSyncMetrics *)self modifiedRecordCount]];
  v33 = [v34 stringValue];
  v42[3] = v33;
  v41[4] = @"processedRecordCount";
  v32 = +[NSNumber numberWithInteger:[(ICCloudContextSyncMetrics *)self processedRecordCount]];
  v31 = [v32 stringValue];
  v42[4] = v31;
  v41[5] = @"success";
  v30 = +[NSNumber numberWithBool:[(ICCloudContextSyncMetrics *)self success]];
  v29 = [v30 stringValue];
  v42[5] = v29;
  v41[6] = @"pid";
  v28 = +[NSProcessInfo processInfo];
  v27 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v28 processIdentifier]);
  v26 = [v27 stringValue];
  v42[6] = v26;
  v41[7] = @"startDate";
  v25 = [(ICCloudContextSyncMetrics *)self startDate];
  v24 = [v25 description];
  v42[7] = v24;
  v41[8] = @"operationCount";
  objc_super v11 = +[NSNumber numberWithInteger:[(ICCloudContextSyncMetrics *)self operationCount]];
  v12 = [v11 stringValue];
  v42[8] = v12;
  v41[9] = @"averageRecordsPerSecond";
  v13 = +[NSNumber numberWithInteger:v10];
  v14 = [v13 stringValue];
  v42[9] = v14;
  v41[10] = @"saveCount";
  v15 = +[NSNumber numberWithInteger:[(ICCloudContextSyncMetrics *)self saveCount]];
  v16 = [v15 stringValue];
  v42[10] = v16;
  v41[11] = @"duration";
  v17 = +[NSString stringWithFormat:@"%.4f", *(void *)&v9];
  v42[11] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:12];
  id v19 = [v18 mutableCopy];

  v20 = [(ICCloudContextSyncMetrics *)self endDate];

  if (v20)
  {
    v21 = [(ICCloudContextSyncMetrics *)self endDate];
    v22 = [v21 description];
    [v19 setObject:v22 forKeyedSubscript:@"endDate"];
  }

  return v19;
}

- (void)finishWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSDate date];
  [(ICCloudContextSyncMetrics *)self setEndDate:v5];

  [(ICCloudContextSyncMetrics *)self setSuccess:v3];
}

- (NSString)syncReason
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSyncReason:(id)a3
{
}

- (int64_t)fetchedRecordCount
{
  return self->_fetchedRecordCount;
}

- (void)setFetchedRecordCount:(int64_t)a3
{
  self->_fetchedRecordCount = a3;
}

- (int64_t)deletedRecordsCount
{
  return self->_deletedRecordsCount;
}

- (void)setDeletedRecordsCount:(int64_t)a3
{
  self->_deletedRecordsCount = a3;
}

- (int64_t)modifiedRecordCount
{
  return self->_modifiedRecordCount;
}

- (void)setModifiedRecordCount:(int64_t)a3
{
  self->_modifiedRecordCount = a3;
}

- (int64_t)processedRecordCount
{
  return self->_processedRecordCount;
}

- (void)setProcessedRecordCount:(int64_t)a3
{
  self->_processedRecordCount = a3;
}

- (int64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(int64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (int64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (void)setBytesUploaded:(int64_t)a3
{
  self->_bytesUploaded = a3;
}

- (int64_t)operationCount
{
  return self->_operationCount;
}

- (void)setOperationCount:(int64_t)a3
{
  self->_operationCount = a3;
}

- (int64_t)saveCount
{
  return self->_saveCount;
}

- (void)setSaveCount:(int64_t)a3
{
  self->_saveCount = a3;
}

- (int64_t)averageRecordsPerSecond
{
  return self->_averageRecordsPerSecond;
}

- (void)setAverageRecordsPerSecond:(int64_t)a3
{
  self->_averageRecordsPerSecond = a3;
}

- (double)cloudKitDuration
{
  return self->_cloudKitDuration;
}

- (void)setCloudKitDuration:(double)a3
{
  self->_cloudKitDuration = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_syncReason, 0);
}

@end