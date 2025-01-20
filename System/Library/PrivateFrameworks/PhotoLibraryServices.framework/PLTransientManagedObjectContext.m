@interface PLTransientManagedObjectContext
+ (BOOL)canMergeRemoteChanges;
@end

@implementation PLTransientManagedObjectContext

+ (BOOL)canMergeRemoteChanges
{
  return 0;
}

@end