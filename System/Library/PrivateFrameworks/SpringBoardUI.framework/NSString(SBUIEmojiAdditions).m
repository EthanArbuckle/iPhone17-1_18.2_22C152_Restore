@interface NSString(SBUIEmojiAdditions)
- (id)sbui_rangesOfEmojiTokens:()SBUIEmojiAdditions;
@end

@implementation NSString(SBUIEmojiAdditions)

- (id)sbui_rangesOfEmojiTokens:()SBUIEmojiAdditions
{
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  if (a3) {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  else {
    id v5 = 0;
  }
  id v27 = v5;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3010000000;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  v19 = "";
  [a1 length];
  CEMEnumerateEmojiTokensInStringWithBlock();
  if (a3 && v23[5])
  {
    uint64_t v6 = v17[4];
    uint64_t v7 = v17[5];
    if (v7 + v6 < (unint64_t)[a1 length])
    {
      uint64_t v8 = v17[4];
      uint64_t v9 = v17[5];
      uint64_t v10 = [a1 length];
      NSUInteger v11 = v9 + v8;
      v35.length = v10 - (v17[4] + v17[5]);
      v12 = (void *)v23[5];
      v35.location = v11;
      v13 = NSStringFromRange(v35);
      [v12 addObject:v13];
    }
    *a3 = (id) v23[5];
  }
  id v14 = (id)v29[5];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);

  return v14;
}

@end