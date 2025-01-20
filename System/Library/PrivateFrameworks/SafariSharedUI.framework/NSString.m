@interface NSString
@end

@implementation NSString

uint64_t __88__NSString_WBSFaviconProviderNSStringExtras__safari_urlStringVariantsForFaviconDatabase__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 length];
  if (v6 == [v4 length])
  {
    uint64_t v7 = [v5 caseInsensitiveCompare:v4];
  }
  else
  {
    unint64_t v8 = [v5 length];

    if (v8 > [v4 length]) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

uint64_t __101__NSString_WBSFaviconProviderNSStringExtras__safari_domainFaviconURLStringVariantsForFaviconDatabase__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringByAppendingString:@"/favicon.ico"];
}

uint64_t __95__NSString_WBSFaviconProviderNSStringExtras__safari_urlStringVariantsForIconControllerDatabase__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 length];
  if (v6 == [v4 length])
  {
    uint64_t v7 = [v5 caseInsensitiveCompare:v4];
  }
  else
  {
    unint64_t v8 = [v5 length];

    if (v8 > [v4 length]) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

uint64_t __79__NSString_SafariSharedUIExtras__safari_stringWithFont_forWidth_lineBreakMode___block_invoke(void *a1, uint64_t a2, _OWORD *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  *(_OWORD *)(*(void *)(a1[5] + 8) + 48) = *a3;
  id v4 = *(const void **)(*(void *)(a1[6] + 8) + 24);
  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v6 = a1[4];
    uint64_t v12 = *MEMORY[0x1E4F42508];
    v13[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    CFAttributedStringRef v8 = (const __CFAttributedString *)[v5 initWithString:@"…" attributes:v7];

    v9 = CTLineCreateWithAttributedString(v8);
    CFArrayRef GlyphRuns = CTLineGetGlyphRuns(v9);
    *(void *)(*(void *)(a1[6] + 8) + 24) = CFArrayGetValueAtIndex(GlyphRuns, 0);
    CFRetain(*(CFTypeRef *)(*(void *)(a1[6] + 8) + 24));
    CFRelease(v9);

    id v4 = *(const void **)(*(void *)(a1[6] + 8) + 24);
  }
  CFRetain(v4);
  return *(void *)(*(void *)(a1[6] + 8) + 24);
}

@end