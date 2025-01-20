@interface BRCFSEventToSyncUpEvent
- (BOOL)isPackage;
- (BRCItemID)itemID;
- (id)additionalPayload;
- (id)associatedAppTelemetryEvent;
- (id)subDescription;
- (unint64_t)contentSize;
- (unint64_t)fileID;
- (unint64_t)mtime;
- (unint64_t)syncUpBatchSize;
- (unsigned)genID;
- (void)setContentSize:(unint64_t)a3;
- (void)setFileID:(unint64_t)a3;
- (void)setGenID:(unsigned int)a3;
- (void)setIsPackage:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setMtime:(unint64_t)a3;
- (void)setSyncUpBatchSize:(unint64_t)a3;
@end

@implementation BRCFSEventToSyncUpEvent

- (id)additionalPayload
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"isPackage";
  v3 = [NSNumber numberWithBool:self->_isPackage];
  v9[0] = v3;
  v8[1] = @"contentSize";
  v4 = [NSNumber numberWithUnsignedLongLong:self->_contentSize];
  v9[1] = v4;
  v8[2] = @"syncUpBatchSize";
  v5 = [NSNumber numberWithUnsignedLongLong:self->_syncUpBatchSize];
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)subDescription
{
  v3 = NSString;
  uint64_t v4 = [(BRCItemID *)self->_itemID debugItemIDString];
  v5 = (void *)v4;
  if (self->_isPackage) {
    v6 = "pkg ";
  }
  else {
    v6 = "";
  }
  v7 = [v3 stringWithFormat:@" i:%@ %ssz:%lld su-batch:%lld", v4, v6, self->_contentSize, self->_syncUpBatchSize];

  return v7;
}

- (id)associatedAppTelemetryEvent
{
  [(BRCEventMetric *)self duration];
  id v2 = +[AppTelemetryTimeSeriesEvent newFSEventToSyncUpEventWithDuration:](AppTelemetryTimeSeriesEvent, "newFSEventToSyncUpEventWithDuration:");
  return v2;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (void)setFileID:(unint64_t)a3
{
  self->_fileID = a3;
}

- (unsigned)genID
{
  return self->_genID;
}

- (void)setGenID:(unsigned int)a3
{
  self->_genID = a3;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (unint64_t)mtime
{
  return self->_mtime;
}

- (void)setMtime:(unint64_t)a3
{
  self->_mtime = a3;
}

- (unint64_t)contentSize
{
  return self->_contentSize;
}

- (void)setContentSize:(unint64_t)a3
{
  self->_contentSize = a3;
}

- (BOOL)isPackage
{
  return self->_isPackage;
}

- (void)setIsPackage:(BOOL)a3
{
  self->_isPackage = a3;
}

- (unint64_t)syncUpBatchSize
{
  return self->_syncUpBatchSize;
}

- (void)setSyncUpBatchSize:(unint64_t)a3
{
  self->_syncUpBatchSize = a3;
}

- (void).cxx_destruct
{
}

@end