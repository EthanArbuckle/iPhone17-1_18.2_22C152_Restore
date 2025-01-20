@interface PersistentDownloadEntity
+ (id)databaseTable;
@end

@implementation PersistentDownloadEntity

+ (id)databaseTable
{
  return @"persistent_download";
}

@end