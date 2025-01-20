@interface CKRecordID(SyncState)
+ (__CFString)mt_syncedFileExtension;
+ (__CFString)mt_syncingFileExtension;
- (id)mt_syncedFileName;
- (id)mt_syncingFileName;
@end

@implementation CKRecordID(SyncState)

+ (__CFString)mt_syncingFileExtension
{
  return @".local";
}

+ (__CFString)mt_syncedFileExtension
{
  return @".cloud";
}

- (id)mt_syncingFileName
{
  v1 = [a1 recordName];
  v2 = [v1 stringByAppendingString:@".local"];

  return v2;
}

- (id)mt_syncedFileName
{
  v1 = [a1 recordName];
  v2 = [v1 stringByAppendingString:@".cloud"];

  return v2;
}

@end