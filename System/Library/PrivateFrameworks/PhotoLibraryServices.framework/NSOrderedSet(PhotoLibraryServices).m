@interface NSOrderedSet(PhotoLibraryServices)
- (id)_pl_prettyDescriptionWithIndent:()PhotoLibraryServices;
@end

@implementation NSOrderedSet(PhotoLibraryServices)

- (id)_pl_prettyDescriptionWithIndent:()PhotoLibraryServices
{
  if ([a1 count]) {
    pl_result_with_autoreleasepool();
  }
  else {
  v1 = PLEmptyContainerDescription();
  }
  return v1;
}

@end