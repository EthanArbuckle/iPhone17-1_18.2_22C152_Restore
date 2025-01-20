@interface PXSearchDisplayUtility
+ (BOOL)attributedStringFontNeedsUpdate:(id)a3 currentFont:(id)a4;
+ (BOOL)layoutDirectionIsRTL;
+ (BOOL)shouldUseAccessibilityLayout;
+ (double)automaticRowHeight;
+ (id)defaultStringAttributes;
+ (id)highlightedAttributedStringForString:(id)a3 highlightedSubstring:(id)a4 matchedColor:(id)a5 remainingColor:(id)a6;
+ (id)listStringJoiningSearchTerms:(id)a3;
+ (id)localizedListStringFromSearchTokenNames:(id)a3 searchText:(id)a4 includeQuotationDelimitersForSearchText:(BOOL)a5;
+ (id)wordEmbeddingPathColor;
+ (id)wordEmbeddingTextColor;
@end

@implementation PXSearchDisplayUtility

+ (id)listStringJoiningSearchTerms:(id)a3
{
  uint64_t v3 = sub_1AB23AADC();
  sub_1A9EFD69C(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return v4;
}

+ (double)automaticRowHeight
{
  return *MEMORY[0x1E4FB2F28];
}

+ (BOOL)shouldUseAccessibilityLayout
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v3 = [v2 preferredContentSizeCategory];

  LOBYTE(v2) = UIContentSizeCategoryIsAccessibilityCategory(v3);
  return (char)v2;
}

+ (BOOL)layoutDirectionIsRTL
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == 1;

  return v3;
}

+ (id)wordEmbeddingPathColor
{
  return (id)[MEMORY[0x1E4FB1618] tertiaryLabelColor];
}

+ (id)wordEmbeddingTextColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

+ (id)defaultStringAttributes
{
  return +[PXSearchTitlesSpec searchDefaultTitleAttributes];
}

+ (id)localizedListStringFromSearchTokenNames:(id)a3 searchText:(id)a4 includeQuotationDelimitersForSearchText:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v14 length])
        {
          if (v5)
          {
            v15 = PXLocalizedStringFromTable(@"QUOTED_SEARCH_TEXT_FORMAT", @"PhotosUICore");
            v23 = v14;
            v16 = PXStringWithValidatedFormat();
            objc_msgSend(v8, "addObject:", v16, v23);
          }
          else
          {
            [v8 addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  v17 = v24;
  if ([v24 length])
  {
    if (v5)
    {
      v18 = PXLocalizedStringFromTable(@"QUOTED_SEARCH_TEXT_FORMAT", @"PhotosUICore");
      id v22 = v24;
      uint64_t v19 = PXStringWithValidatedFormat();

      v17 = (void *)v19;
    }
    objc_msgSend(v8, "addObject:", v17, v22);
  }
  v20 = +[PXSearchDisplayUtility listStringJoiningSearchTerms:v8];

  return v20;
}

+ (id)highlightedAttributedStringForString:(id)a3 highlightedSubstring:(id)a4 matchedColor:(id)a5 remainingColor:(id)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11 && a6)
  {
    uint64_t v12 = *MEMORY[0x1E4FB0700];
    uint64_t v25 = *MEMORY[0x1E4FB0700];
    v26[0] = a6;
    v13 = (void *)MEMORY[0x1E4F1C9E8];
    id v14 = a6;
    v15 = [v13 dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v16 = objc_alloc(MEMORY[0x1E4F28E48]);

    v17 = (void *)[v16 initWithString:v9 attributes:v15];
    uint64_t v18 = [v9 rangeOfString:v10 options:129];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v17, "addAttribute:value:range:", v12, v11, v18, v19);
    }
    v20 = (void *)[v17 copy];
  }
  else
  {
    v21 = (objc_class *)MEMORY[0x1E4F28B18];
    id v22 = a6;
    id v23 = [v21 alloc];

    v20 = (void *)[v23 initWithString:&stru_1F00B0030];
  }

  return v20;
}

+ (BOOL)attributedStringFontNeedsUpdate:(id)a3 currentFont:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && [v5 length])
  {
    id v7 = [v5 attributesAtIndex:0 effectiveRange:0];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
    id v9 = [v8 fontDescriptor];
    id v10 = [v9 fontAttributes];
    uint64_t v11 = *MEMORY[0x1E4FB0920];
    uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB0920]];

    v13 = [v6 fontDescriptor];
    id v14 = [v13 fontAttributes];
    v15 = [v14 objectForKeyedSubscript:v11];

    BOOL v16 = v12 != v15;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

@end