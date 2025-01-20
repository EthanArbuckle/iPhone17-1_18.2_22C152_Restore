@interface NSFetchedResultsController(RCAdditions)
- (id)rc_sectionsByName;
@end

@implementation NSFetchedResultsController(RCAdditions)

- (id)rc_sectionsByName
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a1, "sections", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v9 = [v8 name];
        [v2 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

@end