@interface NSMutableArray(PhotoLibraryServices)
- (uint64_t)_pl_insertObject:()PhotoLibraryServices atBinarySearchingInsertionIndexWithComparator:;
- (void)_pl_addNonNilObject:()PhotoLibraryServices;
@end

@implementation NSMutableArray(PhotoLibraryServices)

- (void)_pl_addNonNilObject:()PhotoLibraryServices
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (uint64_t)_pl_insertObject:()PhotoLibraryServices atBinarySearchingInsertionIndexWithComparator:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(a1, "count"), 1024, v6);

  [a1 insertObject:v7 atIndex:v8];
  return v8;
}

@end