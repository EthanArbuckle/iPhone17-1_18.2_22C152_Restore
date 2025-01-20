@interface NSCountedSet(Additions)
- (uint64_t)mf_debugDescription;
@end

@implementation NSCountedSet(Additions)

- (uint64_t)mf_debugDescription
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(a1);
        }
        objc_msgSend(v2, "ef_insertObject:usingComparator:allowDuplicates:", objc_msgSend(NSString, "stringWithFormat:", @"\t\"%@\" : %lu", *(void *)(*((void *)&v8 + 1) + 8 * v6), objc_msgSend(a1, "countForObject:", *(void *)(*((void *)&v8 + 1) + 8 * v6))), &__block_literal_global_20, 1);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return [NSString stringWithFormat:@"{\n%@\n}", objc_msgSend(v2, "componentsJoinedByString:", @",\n"];
}

@end