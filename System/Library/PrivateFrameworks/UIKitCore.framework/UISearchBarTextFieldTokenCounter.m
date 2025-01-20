@interface UISearchBarTextFieldTokenCounter
@end

@implementation UISearchBarTextFieldTokenCounter

void __57___UISearchBarTextFieldTokenCounter_initWithTextStorage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleProcessEditing];
}

void __84___UISearchBarTextFieldTokenCounter__addCharacterIndexesOfTokensInRange_toIndexSet___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addIndex:a3];
    }
  }
}

void *__86___UISearchBarTextFieldTokenCounter_characterIndexForSelectingOrRemovingTokenAtIndex___block_invoke(void *result, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(result[4] + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  if (v4 == result[6])
  {
    *(void *)(*(void *)(result[5] + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

uint64_t __71___UISearchBarTextFieldTokenCounter_characterRangeOfTextAfterLastToken__block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)(v4 - a2) >= 2)
  {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 32) = a2 + 1;
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                            + 8)
                                                                                + 24)
                                                                    + ~a2;
    *a3 = 1;
  }
  else
  {
    *(void *)(v3 + 24) = a2;
  }
  return result;
}

@end