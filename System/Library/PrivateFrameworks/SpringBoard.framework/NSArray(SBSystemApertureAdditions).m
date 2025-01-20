@interface NSArray(SBSystemApertureAdditions)
- (id)dictionaryDescription;
@end

@implementation NSArray(SBSystemApertureAdditions)

- (id)dictionaryDescription
{
  id v2 = objc_alloc(MEMORY[0x1E4F4F798]);
  v3 = [MEMORY[0x1E4F4F7C0] sortByInsertionOrder];
  v4 = (void *)[v2 initWithKeyOrderingStrategy:v3];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__NSArray_SBSystemApertureAdditions__dictionaryDescription__block_invoke;
  v7[3] = &unk_1E6B0A8E0;
  id v5 = v4;
  id v8 = v5;
  [a1 enumerateObjectsUsingBlock:v7];

  return v5;
}

@end