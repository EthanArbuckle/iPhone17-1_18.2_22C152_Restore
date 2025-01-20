@interface NSAttributedString(MTMPUDynamicType)
- (BOOL)MTMPU_hasUniformFont;
- (id)MTMPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts;
- (id)MTMPU_tallestFontFromAttributes;
@end

@implementation NSAttributedString(MTMPUDynamicType)

- (id)MTMPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts
{
  v2 = (void *)[a1 mutableCopy];
  uint64_t v3 = *MEMORY[0x1E4FB06F8];
  uint64_t v4 = [a1 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__NSAttributedString_MTMPUDynamicType__MTMPU_attributedStringByUpdatingTextStyleFontsToPreferredTextStyleFonts__block_invoke;
  v7[3] = &unk_1E6E20798;
  id v5 = v2;
  id v8 = v5;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v4, 0, v7);

  return v5;
}

- (BOOL)MTMPU_hasUniformFont
{
  uint64_t v2 = [a1 length];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2;
  long long v7 = xmmword_1E3E85460;
  id v4 = (id)objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4FB06F8], 0, &v7, 0, v2);
  return !(void)v7 && *((void *)&v7 + 1) == v3;
}

- (id)MTMPU_tallestFontFromAttributes
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  id v13 = 0;
  uint64_t v2 = [a1 length];
  if (v2)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 0x10000000000000;
    uint64_t v3 = *MEMORY[0x1E4FB06F8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__NSAttributedString_MTMPUDynamicType__MTMPU_tallestFontFromAttributes__block_invoke;
    v6[3] = &unk_1E6E207C0;
    v6[4] = v7;
    v6[5] = &v8;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v2, 0, v6);
    _Block_object_dispose(v7, 8);
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

@end