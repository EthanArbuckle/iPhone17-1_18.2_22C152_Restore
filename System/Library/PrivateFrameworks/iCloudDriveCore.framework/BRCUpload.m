@interface BRCUpload
- (BOOL)progressPublished;
- (BRCItemID)itemID;
- (BRCProgress)progress;
- (BRCUpload)initWithDocument:(id)a3 stageID:(id)a4 transferSize:(unint64_t)a5;
- (CKRecord)record;
- (CKRecord)secondaryRecord;
- (CKRecordID)recordID;
- (CKRecordID)secondaryRecordID;
- (NSNumber)transferID;
- (NSString)etag;
- (NSString)stageID;
- (id)description;
- (int64_t)throttleID;
- (unint64_t)doneSize;
- (unint64_t)totalSize;
- (void)dealloc;
- (void)setDoneSize:(unint64_t)a3;
- (void)setProgressPublished:(BOOL)a3;
- (void)setRecord:(id)a3;
@end

@implementation BRCUpload

- (CKRecordID)recordID
{
  return [(CKRecord *)self->_record recordID];
}

- (CKRecordID)secondaryRecordID
{
  return 0;
}

- (CKRecord)secondaryRecord
{
  return 0;
}

- (NSString)etag
{
  return 0;
}

- (NSNumber)transferID
{
  return (NSNumber *)[NSNumber numberWithLongLong:self->_throttleID];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<upload[%lld] %@>", self->_throttleID, self->_itemID];
}

- (BRCUpload)initWithDocument:(id)a3 stageID:(id)a4 transferSize:(unint64_t)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BRCUpload;
  v10 = [(BRCUpload *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v8 itemID];
    itemID = v10->_itemID;
    v10->_itemID = (BRCItemID *)v11;

    v10->_throttleID = [v8 dbRowID];
    v10->_totalSize = a5;
    objc_storeStrong((id *)&v10->_stageID, a4);
    v19 = @"BRCSizeInfoTotalUnitCountKey";
    v13 = [NSNumber numberWithUnsignedLongLong:a5];
    v20[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];

    uint64_t v15 = +[BRCProgress uploadProgressForDocument:v8 sizeInfo:v14];
    progress = v10->_progress;
    v10->_progress = (BRCProgress *)v15;
  }
  return v10;
}

- (void)dealloc
{
  if ([(BRCUpload *)self progressPublished]) {
    [(BRCProgress *)self->_progress brc_unpublish];
  }
  v3.receiver = self;
  v3.super_class = (Class)BRCUpload;
  [(BRCUpload *)&v3 dealloc];
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (unint64_t)doneSize
{
  return self->_doneSize;
}

- (void)setDoneSize:(unint64_t)a3
{
  self->_doneSize = a3;
}

- (BRCProgress)progress
{
  return self->_progress;
}

- (BOOL)progressPublished
{
  return self->_progressPublished;
}

- (void)setProgressPublished:(BOOL)a3
{
  self->_progressPublished = a3;
}

- (int64_t)throttleID
{
  return self->_throttleID;
}

- (NSString)stageID
{
  return self->_stageID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_stageID, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

@end