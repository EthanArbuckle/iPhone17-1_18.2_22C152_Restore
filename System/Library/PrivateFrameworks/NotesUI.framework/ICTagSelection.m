@interface ICTagSelection
@end

@implementation ICTagSelection

void __81__ICTagSelection_UI__summaryWithJoinOperatorMenu_usingTextStyle_foregroundColor___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = NSString;
  id v6 = a2;
  v7 = objc_msgSend(v5, "ic_attachmentCharacterString");
  id v8 = [v5 stringWithFormat:@"%@_%lu", v7, a3];

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v8];
  [*(id *)(a1 + 40) addObject:v8];
}

void __81__ICTagSelection_UI__summaryWithJoinOperatorMenu_usingTextStyle_foregroundColor___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v18[0] = *MEMORY[0x1E4FB06F8];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = a2;
  v9 = [v6 boldFontForTextStyle:v7];
  v18[1] = *MEMORY[0x1E4FB0700];
  v19[0] = v9;
  v19[1] = *(void *)(a1 + 48);
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v11 = (void *)[v10 mutableCopy];

  v12 = [*(id *)(a1 + 32) excludedHashtagPrefixedDisplayTexts];
  LODWORD(v10) = [v12 containsObject:v5];

  if (v10) {
    [v11 setObject:&unk_1F09A42C8 forKeyedSubscript:*MEMORY[0x1E4FB0768]];
  }
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v11];
  v14 = [*(id *)(a1 + 56) string];
  uint64_t v15 = [v14 rangeOfString:v8];
  uint64_t v17 = v16;

  if (v15 != 0x7FFFFFFFFFFFFFFFLL && v15 + v17 <= (unint64_t)[*(id *)(a1 + 56) length]) {
    objc_msgSend(*(id *)(a1 + 56), "replaceCharactersInRange:withAttributedString:", v15, v17, v13);
  }
}

@end