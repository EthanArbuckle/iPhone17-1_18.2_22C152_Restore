@interface NSHashTable(WBSNSHashTableExtras)
- (BOOL)safari_isEmpty;
@end

@implementation NSHashTable(WBSNSHashTableExtras)

- (BOOL)safari_isEmpty
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(v2, 0, sizeof(v2));
  return [a1 countByEnumeratingWithState:v2 objects:v3 count:16] == 0;
}

@end