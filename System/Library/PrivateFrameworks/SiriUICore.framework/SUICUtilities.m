@interface SUICUtilities
+ (BOOL)emojiIsValid:(__EmojiTokenWrapper *)a3;
+ (id)_emojisToNotInclude;
+ (id)substringRangesContainingEmojiInString:(id)a3;
@end

@implementation SUICUtilities

+ (id)substringRangesContainingEmojiInString:(id)a3
{
  id v3 = a3;
  if (CEMStringContainsEmoji())
  {
    uint64_t v6 = 0;
    v7 = &v6;
    uint64_t v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__1;
    v10 = __Block_byref_object_dispose__1;
    id v11 = [MEMORY[0x1E4F1CA48] array];
    [v3 length];
    CEMEnumerateEmojiTokensInStringWithBlock();
    id v4 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

void __56__SUICUtilities_substringRangesContainingEmojiInString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4 = a4 == 0x7FFFFFFFFFFFFFFFLL || a3 == 0x7FFFFFFFFFFFFFFFLL;
  if (!v4 && [*(id *)(a1 + 40) emojiIsValid:a2])
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [v8 addObject:v9];
  }
}

+ (BOOL)emojiIsValid:(__EmojiTokenWrapper *)a3
{
  BOOL v4 = CEMEmojiTokenGetString();
  v5 = [a1 _emojisToNotInclude];
  char v6 = [v5 containsObject:v4] ^ 1;

  return v6;
}

+ (id)_emojisToNotInclude
{
  if (_emojisToNotInclude_onceToken != -1) {
    dispatch_once(&_emojisToNotInclude_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)_emojisToNotInclude_emojis;

  return v2;
}

uint64_t __36__SUICUtilities__emojisToNotInclude__block_invoke()
{
  _emojisToNotInclude_emojis = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EFB50340];

  return MEMORY[0x1F41817F8]();
}

@end