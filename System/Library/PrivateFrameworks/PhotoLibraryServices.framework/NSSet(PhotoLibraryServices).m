@interface NSSet(PhotoLibraryServices)
- (id)_pl_filter:()PhotoLibraryServices;
- (id)_pl_firstObjectPassingTest:()PhotoLibraryServices;
- (id)_pl_map:()PhotoLibraryServices;
- (id)_pl_prettyDescriptionWithIndent:()PhotoLibraryServices;
@end

@implementation NSSet(PhotoLibraryServices)

- (id)_pl_map:()PhotoLibraryServices
{
  id v6 = a3;
  id v3 = v6;
  v4 = pl_result_with_autoreleasepool();

  return v4;
}

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

- (id)_pl_filter:()PhotoLibraryServices
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__NSSet_PhotoLibraryServices___pl_filter___block_invoke;
  v8[3] = &unk_1E5870EC0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 objectsPassingTest:v8];

  return v6;
}

- (id)_pl_firstObjectPassingTest:()PhotoLibraryServices
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end