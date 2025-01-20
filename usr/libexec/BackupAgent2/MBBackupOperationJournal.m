@interface MBBackupOperationJournal
+ (MBBackupOperationJournal)backupOperationJournalWithBatchSize:(unint64_t)a3;
+ (id)driveOperationWithBackupOperationType:(int)a3 count:(unint64_t)a4 size:(unint64_t)a5;
- (MBBackupOperationJournal)initWithBatchSize:(unint64_t)a3;
- (id)driveOperationsForType:(int)a3;
- (id)operationEnumeratorWithDomainManager:(id)a3;
- (unint64_t)countForType:(int)a3;
- (unint64_t)size;
- (unint64_t)sizeExcludingHardlinksAndClonesForType:(int)a3;
- (unint64_t)sizeForType:(int)a3;
- (void)addOperation:(id)a3;
- (void)close;
- (void)commit;
@end

@implementation MBBackupOperationJournal

+ (id)driveOperationWithBackupOperationType:(int)a3 count:(unint64_t)a4 size:(unint64_t)a5
{
  uint64_t v5 = *(void *)&a3;
  switch(a3)
  {
    case 0:
    case 3:
      v6 = +[MBDriveOperation operationToMoveItemsWithCount:a4];
      break;
    case 1:
    case 4:
      v6 = +[MBDriveOperation operationToRemoveItemsWithCount:a4];
      break;
    case 2:
      v6 = +[MBDriveOperation operationToUploadFilesWithCount:a4 size:a5];
      break;
    default:
      v9 = +[NSAssertionHandler currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"MBBackupOperationJournal.m" lineNumber:53 description:@"Invalid backup operation type: %u"];

      v6 = 0;
      break;
  }

  return v6;
}

+ (MBBackupOperationJournal)backupOperationJournalWithBatchSize:(unint64_t)a3
{
  v3 = [[MBBackupOperationJournal alloc] initWithBatchSize:a3];

  return v3;
}

- (MBBackupOperationJournal)initWithBatchSize:(unint64_t)a3
{
  uint64_t v5 = MBTemporaryPath();
  v6 = +[MBEncoder encoderToFile:v5 error:0];
  if (!v6) {
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:100 format:@"Error opening backup operation journal"]);
  }
  v7 = v6;
  [v6 encodeInt32:1835166318];
  [v7 encodeVersion:2.0];
  v15.receiver = self;
  v15.super_class = (Class)MBBackupOperationJournal;
  v8 = [(MBBackupOperationJournal *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, v5);
    objc_storeStrong((id *)&v9->_encoder, v7);
    uint64_t v10 = 0;
    v9->_batchSize = a3;
    driveOperationsByType = v9->_driveOperationsByType;
    do
    {
      v12 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
      v13 = driveOperationsByType[v10];
      driveOperationsByType[v10] = v12;

      ++v10;
    }
    while (v10 != 5);
  }

  return v9;
}

- (unint64_t)size
{
  v3 = +[NSFileManager defaultManager];
  v4 = [v3 attributesOfItemAtPath:self->_path error:0];
  id v5 = [v4 fileSize];

  return (unint64_t)v5;
}

- (id)operationEnumeratorWithDomainManager:(id)a3
{
  id v4 = a3;
  id v5 = [[MBBackupOperationJournalEnumerator alloc] initWithFile:self->_path domainManager:v4];

  return v5;
}

- (unint64_t)countForType:(int)a3
{
  return self->_countByType[a3];
}

- (unint64_t)sizeForType:(int)a3
{
  return self->_sizeByType[a3];
}

- (unint64_t)sizeExcludingHardlinksAndClonesForType:(int)a3
{
  return self->_sizeExcludingHardlinksAndClonesForType[a3];
}

- (id)driveOperationsForType:(int)a3
{
  return self->_driveOperationsByType[a3];
}

- (void)addOperation:(id)a3
{
  id v8 = a3;
  unsigned int v4 = [v8 type];
  [v8 encode:self->_encoder];
  uint64_t v5 = v4;
  v6 = &self->super.isa + v4;
  v6[3] = (Class)((char *)v6[3] + 1);
  v6[8] = (Class)((char *)[v8 size] + (void)v6[8]);
  if (([v8 flags] & 3) == 0) {
    self->_sizeExcludingHardlinksAndClonesForType[v5] += (unint64_t)[v8 size];
  }
  ++self->_batchCountByType[v5];
  self->_batchSizeByType[v5] += (unint64_t)[v8 size];
  if (self->_batchCountByType[v5] == self->_batchSize)
  {
    v7 = +[MBBackupOperationJournal driveOperationWithBackupOperationType:count:size:](MBBackupOperationJournal, "driveOperationWithBackupOperationType:count:size:", v5);
    [(NSMutableArray *)self->_driveOperationsByType[v5] addObject:v7];
    self->_batchCountByType[v5] = 0;
    self->_batchSizeByType[v5] = 0;
  }
}

- (void)commit
{
  [(MBEncoder *)self->_encoder close];
  for (uint64_t i = 0; i != 5; ++i)
  {
    unsigned int v4 = &self->super.isa + i;
    Class v5 = v4[23];
    if (v5)
    {
      v6 = +[MBBackupOperationJournal driveOperationWithBackupOperationType:i count:v5 size:v4[28]];
      [(objc_class *)v4[18] addObject:v6];
    }
  }
}

- (void)close
{
  id v3 = +[NSFileManager defaultManager];
  [v3 removeItemAtPath:self->_path error:0];
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  unsigned int v4 = &self->_driveOperationsByType[4];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -5);
  objc_storeStrong((id *)&self->_encoder, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end