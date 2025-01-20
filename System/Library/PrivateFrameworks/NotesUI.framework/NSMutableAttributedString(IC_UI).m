@interface NSMutableAttributedString(IC_UI)
- (void)ic_addForegroundColorInRangesWhereNoColorAlreadyExists:()IC_UI;
- (void)ic_setParagraphStyleForWritingDirection:()IC_UI andAlignment:;
@end

@implementation NSMutableAttributedString(IC_UI)

- (void)ic_setParagraphStyleForWritingDirection:()IC_UI andAlignment:
{
  id v7 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  id v12 = v7;
  if (a3 == -1)
  {
    v8 = [a1 string];
    v14.length = [a1 length];
    v14.location = 0;
    v9 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v8, v14);

    if (v9) {
      a3 = [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v9] == 2;
    }
    else {
      a3 = -1;
    }

    id v7 = v12;
  }
  if ((a4 & (a3 != -1)) != 0) {
    uint64_t v10 = 2 * (a3 != 0);
  }
  else {
    uint64_t v10 = 4;
  }
  [v7 setAlignment:v10];
  [v12 setBaseWritingDirection:a3];
  uint64_t v11 = *MEMORY[0x1E4FB0738];
  objc_msgSend(a1, "removeAttribute:range:", *MEMORY[0x1E4FB0738], 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "addAttribute:value:range:", v11, v12, 0, objc_msgSend(a1, "length"));
}

- (void)ic_addForegroundColorInRangesWhereNoColorAlreadyExists:()IC_UI
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v6 = *MEMORY[0x1E4FB0700];
    uint64_t v7 = [a1 length];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__NSMutableAttributedString_IC_UI__ic_addForegroundColorInRangesWhereNoColorAlreadyExists___block_invoke;
    v11[3] = &unk_1E5FDA3C8;
    id v12 = v5;
    id v8 = v5;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v11);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__NSMutableAttributedString_IC_UI__ic_addForegroundColorInRangesWhereNoColorAlreadyExists___block_invoke_2;
    v9[3] = &unk_1E5FDDB98;
    v9[4] = a1;
    id v10 = v4;
    [v8 enumerateRangesUsingBlock:v9];
  }
}

@end