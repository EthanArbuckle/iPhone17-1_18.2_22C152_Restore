@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

void __162__NSMutableAttributedString_MutableAttributedStringSRCSTextEditing__adjustCapsAndSpacingUsingLeadingText_localeIdentifier_vocabularyEntries_spellingGuessesBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v10 = a2;
  unint64_t v11 = *(void *)(a1 + 48);
  if (v11 == a5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a7 = 1;
  }
  else if (v11 > a5)
  {
    id v16 = v10;
    v12 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a5, v11 - a5);
    v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v14 = [v12 stringByTrimmingCharactersInSet:v13];
    uint64_t v15 = [v14 length];

    if (!v15)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a7 = 1;
    }

    id v10 = v16;
  }
}

@end