@interface NSString(SafariSharedUIExtras)
- (id)_leadingGlyphInCTRunSafariIsRightToLeft:()SafariSharedUIExtras;
- (id)safari_leadingEmojiSafariIsRightToLeft:()SafariSharedUIExtras;
- (id)safari_stringWithFont:()SafariSharedUIExtras forWidth:lineBreakMode:;
- (uint64_t)safari_hasLeadingEmojiSafariIsRightToLeft:()SafariSharedUIExtras;
@end

@implementation NSString(SafariSharedUIExtras)

- (id)safari_stringWithFont:()SafariSharedUIExtras forWidth:lineBreakMode:
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v30 = *MEMORY[0x1E4F42508];
  v31[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  CFAttributedStringRef v7 = (const __CFAttributedString *)[v5 initWithString:a1 attributes:v6];

  CTLineRef v8 = CTLineCreateWithAttributedString(v7);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x4012000000;
  v25 = __Block_byref_object_copy__30;
  v26 = __Block_byref_object_dispose__30;
  v27 = &unk_1ABC8D48E;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  id v9 = v4;
  TruncatedLineWithTokenHandler = (const void *)CTLineCreateTruncatedLineWithTokenHandler();
  v11 = (const void *)v19[3];
  if (v11) {
    CFRelease(v11);
  }
  CFRelease(v8);
  if (TruncatedLineWithTokenHandler) {
    CFRelease(TruncatedLineWithTokenHandler);
  }
  if (v23[7])
  {
    v12 = objc_msgSend(a1, "substringToIndex:", v23[6], v16, 3221225472, __79__NSString_SafariSharedUIExtras__safari_stringWithFont_forWidth_lineBreakMode___block_invoke, &unk_1E5E45ED8, v9, &v22, &v18);
    v13 = (void *)[v12 mutableCopy];

    [v13 appendString:@"…"];
    v14 = [a1 substringFromIndex:v23[7] + v23[6]];
    [v13 appendString:v14];
  }
  else
  {
    v13 = objc_msgSend(a1, "copy", v16, 3221225472, __79__NSString_SafariSharedUIExtras__safari_stringWithFont_forWidth_lineBreakMode___block_invoke, &unk_1E5E45ED8, v9, &v22, &v18);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v13;
}

- (id)_leadingGlyphInCTRunSafariIsRightToLeft:()SafariSharedUIExtras
{
  id v5 = (const __CTLine *)CTLineCreateWithString();
  v6 = CTLineGetGlyphRuns(v5);
  CFRelease(v5);
  if ([v6 count])
  {
    if (a3) {
      [v6 lastObject];
    }
    else {
    CTLineRef v8 = [v6 firstObject];
    }

    CFRange StringRange = CTRunGetStringRange((CTRunRef)v8);
    CFAttributedStringRef v7 = objc_msgSend(a1, "substringWithRange:", StringRange.location, StringRange.length);
  }
  else
  {
    CFAttributedStringRef v7 = 0;
  }

  return v7;
}

- (uint64_t)safari_hasLeadingEmojiSafariIsRightToLeft:()SafariSharedUIExtras
{
  v1 = objc_msgSend(a1, "_leadingGlyphInCTRunSafariIsRightToLeft:");
  uint64_t v2 = [v1 _isSingleEmoji];

  return v2;
}

- (id)safari_leadingEmojiSafariIsRightToLeft:()SafariSharedUIExtras
{
  v1 = objc_msgSend(a1, "_leadingGlyphInCTRunSafariIsRightToLeft:");
  if ([v1 _isSingleEmoji]) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

@end