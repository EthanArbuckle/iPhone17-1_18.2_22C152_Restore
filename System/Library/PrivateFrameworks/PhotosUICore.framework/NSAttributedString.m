@interface NSAttributedString
@end

@implementation NSAttributedString

uint64_t __57__NSAttributedString_PhotosUICore__px_containsAttribute___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __80__NSAttributedString_PhotosUICore__px_attributedStringByApplyingCapitalization___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "px_stringByApplyingCapitalization:", *(void *)(a1 + 40));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceCharactersInRange:withString:", a3, a4, v7);
}

void __84__NSAttributedString_PhotosUICore__px_stringWithFormat_defaultAttributes_arguments___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) appendAttributedString:v4];
  }
  else
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) appendAttributedString:v3];
  }
}

uint64_t __130__NSAttributedString_PhotosUICore__px_attributedStringWithHTMLString_defaultAttributes_emphasizedAttributes_italicizedAttributes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendAttributedString:a2];
}

void __159__NSAttributedString_PXLocalization__px_localizedAttributedStringForLikesFromUser_otherPeopleFullNames_isVideo_defaultTextAttributes_emphasizedTextAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendAttributedString:*(void *)(a1 + 40)];
  }
  v5 = *(void **)(a1 + 32);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:*(void *)(a1 + 48)];
  [v5 appendAttributedString:v6];
}

void __159__NSAttributedString_PXLocalization__px_localizedAttributedStringForLikesFromUser_otherPeopleFullNames_isVideo_defaultTextAttributes_emphasizedTextAttributes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendAttributedString:*(void *)(a1 + 40)];
  }
  v5 = *(void **)(a1 + 32);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:*(void *)(a1 + 48)];
  [v5 appendAttributedString:v6];
}

@end