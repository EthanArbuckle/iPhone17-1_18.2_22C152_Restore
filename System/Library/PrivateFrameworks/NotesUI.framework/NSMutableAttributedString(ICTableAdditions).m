@interface NSMutableAttributedString(ICTableAdditions)
- (void)ic_addTextBlocks:()ICTableAdditions range:;
- (void)ic_convertParagraphStyleToBodyInRange:()ICTableAdditions;
@end

@implementation NSMutableAttributedString(ICTableAdditions)

- (void)ic_addTextBlocks:()ICTableAdditions range:
{
  id v8 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (a4 < a4 + a5)
  {
    v9 = 0;
    uint64_t v10 = *MEMORY[0x1E4FB0738];
    unint64_t v11 = a4;
    do
    {
      v12 = v9;
      v9 = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v10, v11, &v15, a4, a5);

      if (v9)
      {
        v13 = (void *)[v9 mutableCopy];
      }
      else
      {
        v14 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
        v13 = (void *)[v14 mutableCopy];
      }
      objc_msgSend(v13, "setTextBlocks:", v8, v15, v16);
      objc_msgSend(a1, "addAttribute:value:range:", v10, v13, v15, v16);
      unint64_t v11 = v16 + v15;
    }
    while (v11 < a4 + a5);
  }
}

- (void)ic_convertParagraphStyleToBodyInRange:()ICTableAdditions
{
  v7 = [MEMORY[0x1E4F834E8] paragraphStyleNamed:3];
  uint64_t v8 = *MEMORY[0x1E4F83220];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__NSMutableAttributedString_ICTableAdditions__ic_convertParagraphStyleToBodyInRange___block_invoke;
  v10[3] = &unk_1E5FDC748;
  v10[4] = a1;
  id v11 = v7;
  id v9 = v7;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, a3, a4, 0, v10);
}

@end