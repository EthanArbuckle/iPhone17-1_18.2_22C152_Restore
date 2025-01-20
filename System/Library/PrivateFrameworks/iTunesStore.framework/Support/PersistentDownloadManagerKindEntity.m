@interface PersistentDownloadManagerKindEntity
+ (id)databaseTable;
@end

@implementation PersistentDownloadManagerKindEntity

+ (id)databaseTable
{
  return @"persistent_manager_kind";
}

@end