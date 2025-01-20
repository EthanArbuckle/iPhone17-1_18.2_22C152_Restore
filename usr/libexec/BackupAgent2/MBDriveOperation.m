@interface MBDriveOperation
+ (id)operationForContentsOfDirectory;
+ (id)operationToC0pyItemWithCount:(int64_t)a3 size:(int64_t)a4;
+ (id)operationToCreateDirectory;
+ (id)operationToDownloadFileWithSize:(int64_t)a3;
+ (id)operationToDownloadFilesWithCount:(int64_t)a3 size:(int64_t)a4;
+ (id)operationToMoveItem;
+ (id)operationToMoveItemsWithCount:(int64_t)a3;
+ (id)operationToRemoveItem;
+ (id)operationToRemoveItemsWithCount:(int64_t)a3;
+ (id)operationToUploadFileWithSize:(int64_t)a3;
+ (id)operationToUploadFilesWithCount:(int64_t)a3 size:(int64_t)a4;
+ (id)operationWithType:(int)a3 count:(int64_t)a4 duration:(double)a5;
+ (id)operationWithType:(int)a3 count:(int64_t)a4 size:(int64_t)a5 duration:(double)a6;
+ (id)operationWithType:(int)a3 duration:(double)a4;
+ (id)stringForType:(int)a3;
- (MBDriveOperation)initWithType:(int)a3 count:(int64_t)a4 size:(int64_t)a5 duration:(double)a6;
- (double)duration;
- (id)description;
- (int)count;
- (int)type;
- (int64_t)size;
@end

@implementation MBDriveOperation

+ (id)stringForType:(int)a3
{
  if (a3 > 6) {
    return 0;
  }
  else {
    return off_1000F1F70[a3];
  }
}

+ (id)operationToCreateDirectory
{
  return +[MBDriveOperation operationWithType:0 duration:0.01];
}

+ (id)operationForContentsOfDirectory
{
  return +[MBDriveOperation operationWithType:1 duration:0.01];
}

+ (id)operationToUploadFileWithSize:(int64_t)a3
{
  return +[MBDriveOperation operationToUploadFilesWithCount:1 size:a3];
}

+ (id)operationToUploadFilesWithCount:(int64_t)a3 size:(int64_t)a4
{
  return +[MBDriveOperation operationWithType:count:size:duration:](MBDriveOperation, "operationWithType:count:size:duration:", 2, a3, (double)a3 * 0.004 + 0.01 + (double)a4 / 10485760.0);
}

+ (id)operationToDownloadFileWithSize:(int64_t)a3
{
  return +[MBDriveOperation operationToDownloadFilesWithCount:1 size:a3];
}

+ (id)operationToDownloadFilesWithCount:(int64_t)a3 size:(int64_t)a4
{
  return +[MBDriveOperation operationWithType:count:size:duration:](MBDriveOperation, "operationWithType:count:size:duration:", 3, a3, (double)a3 * 0.004 + 0.01 + (double)a4 / 10485760.0);
}

+ (id)operationToMoveItem
{
  return +[MBDriveOperation operationToMoveItemsWithCount:1];
}

+ (id)operationToMoveItemsWithCount:(int64_t)a3
{
  return +[MBDriveOperation operationWithType:4 count:a3 duration:(double)a3 * 0.0015 + 0.01];
}

+ (id)operationToRemoveItem
{
  return +[MBDriveOperation operationToRemoveItemsWithCount:1];
}

+ (id)operationToRemoveItemsWithCount:(int64_t)a3
{
  return +[MBDriveOperation operationWithType:5 count:a3 duration:(double)a3 * 0.0005 + 0.01];
}

+ (id)operationToC0pyItemWithCount:(int64_t)a3 size:(int64_t)a4
{
  return +[MBDriveOperation operationWithType:count:size:duration:](MBDriveOperation, "operationWithType:count:size:duration:", 6, a3, (double)a3 * 0.003 + 0.01 + (double)a4 / 12582912.0);
}

+ (id)operationWithType:(int)a3 duration:(double)a4
{
  v4 = [[MBDriveOperation alloc] initWithType:*(void *)&a3 count:1 size:-1 duration:a4];

  return v4;
}

+ (id)operationWithType:(int)a3 count:(int64_t)a4 duration:(double)a5
{
  v5 = [[MBDriveOperation alloc] initWithType:*(void *)&a3 count:a4 size:-1 duration:a5];

  return v5;
}

+ (id)operationWithType:(int)a3 count:(int64_t)a4 size:(int64_t)a5 duration:(double)a6
{
  v6 = [[MBDriveOperation alloc] initWithType:*(void *)&a3 count:a4 size:a5 duration:a6];

  return v6;
}

- (MBDriveOperation)initWithType:(int)a3 count:(int64_t)a4 size:(int64_t)a5 duration:(double)a6
{
  int v8 = a4;
  if (a4 < -1)
  {
    uint64_t v13 = 115;
  }
  else
  {
    if (a4 < 0x80000000) {
      goto LABEL_3;
    }
    uint64_t v13 = 116;
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBDriveOperation.m" lineNumber:v13 description:@"Invalid count"];
LABEL_3:
  if (a5 <= -2) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBDriveOperation.m" lineNumber:117 description:@"Invalid size"];
  }
  if (a6 < 0.0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBDriveOperation.m" lineNumber:118 description:@"Negative duration"];
  }
  v14.receiver = self;
  v14.super_class = (Class)MBDriveOperation;
  result = [(MBDriveOperation *)&v14 init];
  if (result)
  {
    result->_type = a3;
    result->_count = v8;
    result->_size = a5;
    result->_duration = a6;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[MBDriveOperation type=%@ count=%ld size=%lld duration=%0.3f]", +[MBDriveOperation stringForType:self->_type], self->_count, self->_size, *(void *)&self->_duration);
}

- (int)type
{
  return self->_type;
}

- (int)count
{
  return self->_count;
}

- (int64_t)size
{
  return self->_size;
}

- (double)duration
{
  return self->_duration;
}

@end