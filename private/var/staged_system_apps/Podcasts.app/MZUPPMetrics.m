@interface MZUPPMetrics
- (BOOL)success;
- (NSString)errorDomain;
- (double)bagLookupEndTime;
- (double)bagLookupStartTime;
- (double)syncTaskEndTime;
- (double)syncTaskStartTime;
- (id)metricsDictionary;
- (int64_t)errorCode;
- (int64_t)numMetadataItemsFromDataSource;
- (int64_t)numMetadataItemsFromKVSStorage;
- (int64_t)numMetadataItemsToCommitToDataSource;
- (int64_t)numMetadataItemsToCommitToKVSStorage;
- (unint64_t)latestUPPSubtask;
- (void)setBagLookupEndTime:(double)a3;
- (void)setBagLookupStartTime:(double)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setLatestUPPSubtask:(unint64_t)a3;
- (void)setNumMetadataItemsFromDataSource:(int64_t)a3;
- (void)setNumMetadataItemsFromKVSStorage:(int64_t)a3;
- (void)setNumMetadataItemsToCommitToDataSource:(int64_t)a3;
- (void)setNumMetadataItemsToCommitToKVSStorage:(int64_t)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setSyncTaskEndTime:(double)a3;
- (void)setSyncTaskStartTime:(double)a3;
@end

@implementation MZUPPMetrics

- (id)metricsDictionary
{
  v28[0] = @"success";
  v3 = +[NSNumber numberWithBool:[(MZUPPMetrics *)self success]];
  v29[0] = v3;
  v28[1] = @"synctaskfailingsubtask";
  v4 = +[NSNumber numberWithUnsignedInteger:[(MZUPPMetrics *)self latestUPPSubtask]];
  v29[1] = v4;
  v28[2] = @"numlocalitems";
  v5 = +[NSNumber numberWithInteger:[(MZUPPMetrics *)self numMetadataItemsFromDataSource]];
  v29[2] = v5;
  v28[3] = @"numremoteitems";
  v6 = +[NSNumber numberWithInteger:[(MZUPPMetrics *)self numMetadataItemsFromKVSStorage]];
  v29[3] = v6;
  v28[4] = @"numitemstocommitlocally";
  v7 = +[NSNumber numberWithInteger:[(MZUPPMetrics *)self numMetadataItemsToCommitToDataSource]];
  v29[4] = v7;
  v28[5] = @"numitemstocommitremotely";
  v8 = +[NSNumber numberWithInteger:[(MZUPPMetrics *)self numMetadataItemsToCommitToKVSStorage]];
  v29[5] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
  v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];

  v11 = [(MZUPPMetrics *)self errorDomain];
  if (v11)
  {

LABEL_4:
    v12 = [(MZUPPMetrics *)self errorDomain];
    [v10 setObject:v12 forKey:@"errordomain"];

    v13 = +[NSNumber numberWithInteger:[(MZUPPMetrics *)self errorCode]];
    [v10 setObject:v13 forKey:@"errorcode"];

    goto LABEL_5;
  }
  if ([(MZUPPMetrics *)self errorCode]) {
    goto LABEL_4;
  }
LABEL_5:
  [(MZUPPMetrics *)self bagLookupStartTime];
  if (v14 != 0.0)
  {
    [(MZUPPMetrics *)self bagLookupEndTime];
    if (v15 != 0.0)
    {
      [(MZUPPMetrics *)self bagLookupEndTime];
      double v17 = v16;
      [(MZUPPMetrics *)self bagLookupStartTime];
      v19 = +[NSNumber numberWithDouble:v17 - v18];
      [v10 setObject:v19 forKey:@"bagloadduration"];
    }
  }
  [(MZUPPMetrics *)self syncTaskStartTime];
  if (v20 != 0.0)
  {
    [(MZUPPMetrics *)self syncTaskEndTime];
    if (v21 != 0.0)
    {
      [(MZUPPMetrics *)self syncTaskEndTime];
      double v23 = v22;
      [(MZUPPMetrics *)self syncTaskStartTime];
      v25 = +[NSNumber numberWithDouble:v23 - v24];
      [v10 setObject:v25 forKey:@"synctaskduration"];
    }
  }
  id v26 = [v10 copy];

  return v26;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (unint64_t)latestUPPSubtask
{
  return self->_latestUPPSubtask;
}

- (void)setLatestUPPSubtask:(unint64_t)a3
{
  self->_latestUPPSubtask = a3;
}

- (int64_t)numMetadataItemsFromDataSource
{
  return self->_numMetadataItemsFromDataSource;
}

- (void)setNumMetadataItemsFromDataSource:(int64_t)a3
{
  self->_numMetadataItemsFromDataSource = a3;
}

- (int64_t)numMetadataItemsFromKVSStorage
{
  return self->_numMetadataItemsFromKVSStorage;
}

- (void)setNumMetadataItemsFromKVSStorage:(int64_t)a3
{
  self->_numMetadataItemsFromKVSStorage = a3;
}

- (int64_t)numMetadataItemsToCommitToDataSource
{
  return self->_numMetadataItemsToCommitToDataSource;
}

- (void)setNumMetadataItemsToCommitToDataSource:(int64_t)a3
{
  self->_numMetadataItemsToCommitToDataSource = a3;
}

- (int64_t)numMetadataItemsToCommitToKVSStorage
{
  return self->_numMetadataItemsToCommitToKVSStorage;
}

- (void)setNumMetadataItemsToCommitToKVSStorage:(int64_t)a3
{
  self->_numMetadataItemsToCommitToKVSStorage = a3;
}

- (double)bagLookupStartTime
{
  return self->_bagLookupStartTime;
}

- (void)setBagLookupStartTime:(double)a3
{
  self->_bagLookupStartTime = a3;
}

- (double)bagLookupEndTime
{
  return self->_bagLookupEndTime;
}

- (void)setBagLookupEndTime:(double)a3
{
  self->_bagLookupEndTime = a3;
}

- (double)syncTaskStartTime
{
  return self->_syncTaskStartTime;
}

- (void)setSyncTaskStartTime:(double)a3
{
  self->_syncTaskStartTime = a3;
}

- (double)syncTaskEndTime
{
  return self->_syncTaskEndTime;
}

- (void)setSyncTaskEndTime:(double)a3
{
  self->_syncTaskEndTime = a3;
}

- (void).cxx_destruct
{
}

@end