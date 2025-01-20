@interface NSManagedObjectID(RCFolderIdentifier)
- (uint64_t)__rc_folderType;
@end

@implementation NSManagedObjectID(RCFolderIdentifier)

- (uint64_t)__rc_folderType
{
  return 4;
}

@end