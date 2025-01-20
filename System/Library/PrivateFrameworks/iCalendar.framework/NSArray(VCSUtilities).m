@interface NSArray(VCSUtilities)
- (id)VCS_filter:()VCSUtilities;
- (id)VCS_map:()VCSUtilities;
@end

@implementation NSArray(VCSUtilities)

- (id)VCS_map:()VCSUtilities
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11)
        {
          [v5 addObject:v11];
        }
        else
        {
          v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v14);
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)VCS_filter:()VCSUtilities
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__NSArray_VCSUtilities__VCS_filter___block_invoke;
  v9[3] = &unk_1E6C259B8;
  id v10 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v9];
  uint64_t v7 = [a1 objectsAtIndexes:v6];

  return v7;
}

@end