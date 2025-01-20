@interface NSArray(TextInputAdditions)
- (id)_readingStringWithin:()TextInputAdditions;
- (id)_surfaceStringWithin:()TextInputAdditions;
@end

@implementation NSArray(TextInputAdditions)

- (id)_readingStringWithin:()TextInputAdditions
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8 = objc_msgSend(a1, "subarrayWithRange:", a3, a4);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__NSArray_TextInputAdditions___readingStringWithin___block_invoke;
  v12[3] = &unk_1E6E2BAD8;
  id v13 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v12];

  v10 = (void *)[v9 copy];

  return v10;
}

- (id)_surfaceStringWithin:()TextInputAdditions
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8 = objc_msgSend(a1, "subarrayWithRange:", a3, a4);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__NSArray_TextInputAdditions___surfaceStringWithin___block_invoke;
  v12[3] = &unk_1E6E2BAD8;
  id v13 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v12];

  v10 = (void *)[v9 copy];

  return v10;
}

@end