@interface BRCUserDownloadEvent
- (BOOL)didSucceed;
- (BOOL)isDownloadingForBackup;
- (BOOL)isRecursiveDownload;
- (BRCUserDownloadEvent)init;
- (NSMutableSet)fileObjectIDs;
- (NSUUID)operationID;
- (id)additionalPayload;
- (id)associatedAppTelemetryEvent;
- (id)subDescription;
- (unint64_t)itemCount;
- (unint64_t)totalContentSize;
- (void)setDidSucceed:(BOOL)a3;
- (void)setFileObjectIDs:(id)a3;
- (void)setIsDownloadingForBackup:(BOOL)a3;
- (void)setIsRecursiveDownload:(BOOL)a3;
- (void)setItemCount:(unint64_t)a3;
- (void)setOperationID:(id)a3;
- (void)setTotalContentSize:(unint64_t)a3;
@end

@implementation BRCUserDownloadEvent

- (BRCUserDownloadEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)BRCUserDownloadEvent;
  v2 = [(BRCUserDownloadEvent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    fileObjectIDs = v2->_fileObjectIDs;
    v2->_fileObjectIDs = (NSMutableSet *)v3;
  }
  return v2;
}

- (id)additionalPayload
{
  v11[5] = *MEMORY[0x263EF8340];
  v10[0] = @"didSucceed";
  uint64_t v3 = [NSNumber numberWithBool:self->_didSucceed];
  v11[0] = v3;
  v10[1] = @"isDownloadingForBackup";
  v4 = [NSNumber numberWithBool:self->_isDownloadingForBackup];
  v11[1] = v4;
  v10[2] = @"isRecursiveDownload";
  v5 = [NSNumber numberWithBool:self->_isRecursiveDownload];
  v11[2] = v5;
  v10[3] = @"itemCount";
  objc_super v6 = [NSNumber numberWithUnsignedLongLong:self->_itemCount];
  v11[3] = v6;
  v10[4] = @"totalContentSize";
  v7 = [NSNumber numberWithUnsignedLongLong:self->_totalContentSize];
  v11[4] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (id)subDescription
{
  if (self->_isRecursiveDownload) {
    v2 = "recursive ";
  }
  else {
    v2 = "";
  }
  if (self->_isDownloadingForBackup) {
    uint64_t v3 = "for-backup";
  }
  else {
    uint64_t v3 = "";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @" sz:%lld cnt:%lld %s%s", self->_totalContentSize, self->_itemCount, v2, v3);
}

- (id)associatedAppTelemetryEvent
{
  [(BRCEventMetric *)self duration];
  id v2 = +[AppTelemetryTimeSeriesEvent newUserDownloadEventWithDuration:](AppTelemetryTimeSeriesEvent, "newUserDownloadEventWithDuration:");
  return v2;
}

- (NSUUID)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
}

- (NSMutableSet)fileObjectIDs
{
  return self->_fileObjectIDs;
}

- (void)setFileObjectIDs:(id)a3
{
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (BOOL)isDownloadingForBackup
{
  return self->_isDownloadingForBackup;
}

- (void)setIsDownloadingForBackup:(BOOL)a3
{
  self->_isDownloadingForBackup = a3;
}

- (BOOL)isRecursiveDownload
{
  return self->_isRecursiveDownload;
}

- (void)setIsRecursiveDownload:(BOOL)a3
{
  self->_isRecursiveDownload = a3;
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(unint64_t)a3
{
  self->_itemCount = a3;
}

- (unint64_t)totalContentSize
{
  return self->_totalContentSize;
}

- (void)setTotalContentSize:(unint64_t)a3
{
  self->_totalContentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileObjectIDs, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

@end