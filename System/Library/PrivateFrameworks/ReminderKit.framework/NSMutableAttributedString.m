@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

uint64_t __95__NSMutableAttributedString_IC__ic_replaceCharactersInRange_withAttributedSubstring_fromRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3 - *(void *)(a1 + 40) + *(void *)(a1 + 56), a4);
}

void __92__NSMutableAttributedString_ReminderKitAdditions__rem_replaceTTREMHashtag_withTTREMHashtag___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v16 = [*(id *)(a1 + 32) attributesAtIndex:a3 effectiveRange:0];
  uint64_t v9 = objc_opt_class();
  v10 = [v16 objectForKeyedSubscript:@"_TTREMHashtag"];
  v11 = REMDynamicCast(v9, (uint64_t)v10);

  v12 = [v11 objectIdentifier];
  v13 = [*(id *)(a1 + 40) objectIdentifier];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    *(void *)(v15 + 32) = a3;
    *(void *)(v15 + 40) = a4;
    *a5 = 1;
  }
}

void __96__NSMutableAttributedString_REMCRMergeableStringDocument_Styling__rem_setFontHint_isOn_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v15 = v7;
  if (v7)
  {
    v8 = (void *)[v7 mutableCopy];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v9 = v8;
  v10 = [v8 objectForKeyedSubscript:TTAttributeNameFontHints];
  unsigned int v11 = [v10 intValue];

  uint64_t v12 = *(void *)(a1 + 40);
  unsigned int v13 = v11;
  if (v12)
  {
    if (*(unsigned char *)(a1 + 48)) {
      unsigned int v13 = v11 | 1;
    }
    else {
      unsigned int v13 = v11 & 0xFFFFFFFE;
    }
  }
  if ((v12 & 2) != 0)
  {
    if (*(unsigned char *)(a1 + 48)) {
      v13 |= 2u;
    }
    else {
      v13 &= ~2u;
    }
  }
  if (v13 != v11)
  {
    if (v13)
    {
      int v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      [v9 setObject:v14 forKey:TTAttributeNameFontHints];
    }
    else
    {
      [v9 removeObjectForKey:TTAttributeNameFontHints];
    }
    objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v9, a3, a4);
  }
}

void __92__NSMutableAttributedString_REMCRMergeableStringDocument_Styling__rem_setUnderline_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v13 = a2;
  id v7 = [v13 objectForKeyedSubscript:TTAttributeNameUnderline];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = v13;
  if (*(unsigned __int8 *)(a1 + 40) != v8)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (v13)
      {
        uint64_t v10 = [v13 mutableCopy];
      }
      else
      {
        uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      unsigned int v11 = (void *)v10;
      uint64_t v12 = [NSNumber numberWithBool:1];
      [v11 setObject:v12 forKey:TTAttributeNameUnderline];

      objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v11, a3, a4);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", TTAttributeNameUnderline, a3, a4);
    }
    uint64_t v9 = v13;
  }
}

@end