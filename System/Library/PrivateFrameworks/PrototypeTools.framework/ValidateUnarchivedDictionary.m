@interface ValidateUnarchivedDictionary
@end

@implementation ValidateUnarchivedDictionary

void ___ValidateUnarchivedDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = (void *)MEMORY[0x1E4F28498];
  if ((isKindOfClass & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"Dictionary validation failed: expected key class %@, found %@", *(void *)(a1 + 32), v8 format];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*v7, @"Dictionary validation failed: expected value class %@, found %@", *(void *)(a1 + 40), v5 format];
  }
}

@end