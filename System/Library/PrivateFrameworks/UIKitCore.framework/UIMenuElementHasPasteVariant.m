@interface UIMenuElementHasPasteVariant
@end

@implementation UIMenuElementHasPasteVariant

BOOL ___UIMenuElementHasPasteVariant_block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(MEMORY[0x1E4FB3418], "variantForSelector:", objc_msgSend(a2, "action"));
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL ___UIMenuElementHasPasteVariant_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4FB3418];
  BOOL v3 = [a2 identifier];
  v4 = [v2 variantForActionIdentifier:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

BOOL ___UIMenuElementHasPasteVariant_block_invoke_0(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(MEMORY[0x1E4FB3418], "variantForSelector:", objc_msgSend(a2, "action"));
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL ___UIMenuElementHasPasteVariant_block_invoke_2_0(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4FB3418];
  BOOL v3 = [a2 identifier];
  v4 = [v2 variantForActionIdentifier:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

@end