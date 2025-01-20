@interface NSString(SBAdditions)
+ (id)sb_emojiWithoutVS16Set;
- (BOOL)sb_containsEmoji;
- (id)_adjustedFontForScripts:()SBAdditions forFont:withPointAdjustment:ignoringContent:;
- (uint64_t)_adjustedFontForScripts:()SBAdditions forFont:;
- (uint64_t)_adjustedFontForScripts:()SBAdditions forFont:ignoringContent:;
- (uint64_t)_adjustedFontForScripts:()SBAdditions forFont:withPointAdjustment:;
- (uint64_t)_isEntirelyCharactersInScript:()SBAdditions;
- (uint64_t)_isEntirelyCommon;
- (uint64_t)_isInScript:()SBAdditions useLocaleOnly:;
- (uint64_t)sb_isEntirelyCharactersInSet:()SBAdditions;
@end

@implementation NSString(SBAdditions)

- (uint64_t)_adjustedFontForScripts:()SBAdditions forFont:
{
  return [a1 _adjustedFontForScripts:a3 forFont:a4 withPointAdjustment:0 ignoringContent:-1.0];
}

- (id)_adjustedFontForScripts:()SBAdditions forFont:withPointAdjustment:ignoringContent:
{
  id v10 = a5;
  int v11 = [a1 _isInScript:1 useLocaleOnly:a6];
  int v12 = [a1 _isInScript:2 useLocaleOnly:a6];
  int v13 = [a1 _isInScript:4 useLocaleOnly:a6];
  int v14 = [a1 _isInScript:8 useLocaleOnly:a6];
  if ((a4 & 3) != 0
    && ((v12 & (a4 >> 1) & 1) != 0 || (a4 & v11 & 1) != 0 || (v13 & (a4 >> 2) & 1) != 0 || (v14 & (a4 >> 3)) != 0))
  {
    double v16 = 2.0;
    if (v12) {
      double v16 = 1.0;
    }
    if (a2 >= 0.0) {
      int v17 = 1;
    }
    else {
      int v17 = v12;
    }
    int v18 = v17 | v11;
    if (a2 >= 0.0) {
      double v16 = a2;
    }
    double v19 = 0.0;
    if (!(v13 | v14)) {
      double v19 = a2;
    }
    if (v18) {
      double v20 = v16;
    }
    else {
      double v20 = v19;
    }
    [v10 pointSize];
    id v15 = [v10 fontWithSize:v20 + v21];
  }
  else
  {
    id v15 = v10;
  }
  v22 = v15;

  return v22;
}

- (uint64_t)_isInScript:()SBAdditions useLocaleOnly:
{
  if (a4)
  {
    v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    v6 = [v5 localeIdentifier];
    v7 = v6;
    if ((unint64_t)(a3 - 1) >= 8) {
      v8 = 0;
    }
    else {
      v8 = off_1E548D768[a3 - 1];
    }
    uint64_t v10 = [v6 hasPrefix:v8];

    return v10;
  }
  else
  {
    return objc_msgSend(a1, "_isEntirelyCharactersInScript:");
  }
}

- (uint64_t)_isEntirelyCharactersInScript:()SBAdditions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__NSString_SBAdditions___isEntirelyCharactersInScript___block_invoke;
  block[3] = &unk_1E548D708;
  block[5] = a3;
  block[6] = a2;
  block[4] = a1;
  if (_isEntirelyCharactersInScript__onceToken != -1) {
    dispatch_once(&_isEntirelyCharactersInScript__onceToken, block);
  }
  uint64_t result = objc_msgSend(a1, "sb_isEntirelyCharactersInSet:", _isEntirelyCharactersInScript____set);
  if (result) {
    return [a1 _isEntirelyCommon] ^ 1;
  }
  return result;
}

- (uint64_t)sb_isEntirelyCharactersInSet:()SBAdditions
{
  uint64_t result = [a1 length];
  if (result)
  {
    uint64_t v6 = result;
    v7 = malloc_type_malloc(2 * result, 0x1000040BDFB0063uLL);
    objc_msgSend(a1, "getCharacters:range:", v7, 0, v6);
    int v8 = MEMORY[0x18C1334E0](a3, v7, v6, 1);
    free(v7);
    return v6 == v8;
  }
  return result;
}

- (BOOL)sb_containsEmoji
{
  v2 = objc_msgSend(NSString, "sb_emojiWithoutVS16Set");
  uint64_t v3 = [a1 rangeOfCharacterFromSet:v2];

  return v3 != 0x7FFFFFFFFFFFFFFFLL || CEMStringContainsEmoji() != 0;
}

+ (id)sb_emojiWithoutVS16Set
{
  if (sb_emojiWithoutVS16Set_onceToken != -1) {
    dispatch_once(&sb_emojiWithoutVS16Set_onceToken, &__block_literal_global_17);
  }
  v0 = (void *)sb_emojiWithoutVS16Set___emojiWithoutVS16Set;
  return v0;
}

- (uint64_t)_isEntirelyCommon
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __42__NSString_SBAdditions___isEntirelyCommon__block_invoke;
  v7 = &unk_1E548D3B8;
  int v8 = a1;
  uint64_t v9 = a2;
  if (_isEntirelyCommon_onceToken != -1) {
    dispatch_once(&_isEntirelyCommon_onceToken, &v4);
  }
  return objc_msgSend(a1, "sb_isEntirelyCharactersInSet:", _isEntirelyCommon___charSet, v4, v5, v6, v7, v8, v9);
}

- (uint64_t)_adjustedFontForScripts:()SBAdditions forFont:withPointAdjustment:
{
  return objc_msgSend(a1, "_adjustedFontForScripts:forFont:withPointAdjustment:ignoringContent:", a3, a4, 0);
}

- (uint64_t)_adjustedFontForScripts:()SBAdditions forFont:ignoringContent:
{
  return objc_msgSend(a1, "_adjustedFontForScripts:forFont:withPointAdjustment:ignoringContent:", -1.0);
}

@end