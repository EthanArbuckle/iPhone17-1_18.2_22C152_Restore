@interface CNContact
@end

@implementation CNContact

void __68__CNContact_PKAdditions__pkContactWithNameComponents_labeledValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = *(void **)(a1 + 32);
  v9 = a3;
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 arrayWithObjects:&v9 count:1];
  objc_msgSend(v4, "pkAddLabeledValues:withProperty:", v8, v7, v9, v10);
}

uint64_t __42__CNContact_PKAdditions__isSubsetOfMeCard__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualIgnoringIdentifiers:*(void *)(a1 + 32)];
}

BOOL __42__CNContact_PKAdditions__sanitizedContact__block_invoke(uint64_t a1, void *a2)
{
  return [a2 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;
}

@end