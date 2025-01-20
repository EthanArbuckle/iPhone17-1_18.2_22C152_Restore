@interface CKRecordID
+ (id)mt_syncedFileExtension;
+ (id)mt_syncingFileExtension;
- (id)mt_syncedFileName;
- (id)mt_syncingFileName;
@end

@implementation CKRecordID

+ (id)mt_syncingFileExtension
{
  return @".local";
}

+ (id)mt_syncedFileExtension
{
  return @".cloud";
}

- (id)mt_syncingFileName
{
  v2 = [(CKRecordID *)self recordName];
  v3 = [v2 stringByAppendingString:@".local"];

  return v3;
}

- (id)mt_syncedFileName
{
  v2 = [(CKRecordID *)self recordName];
  v3 = [v2 stringByAppendingString:@".cloud"];

  return v3;
}

@end