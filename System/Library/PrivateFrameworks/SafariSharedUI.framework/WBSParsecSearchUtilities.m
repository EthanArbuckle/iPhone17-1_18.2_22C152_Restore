@interface WBSParsecSearchUtilities
+ (BOOL)anyParsecSearchResult:(id)a3 fuzzyMatchesSuggestedSiteURLString:(id)a4;
@end

@implementation WBSParsecSearchUtilities

+ (BOOL)anyParsecSearchResult:(id)a3 fuzzyMatchesSuggestedSiteURLString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_30);
  if ([v7 count])
  {
    v8 = objc_msgSend(v6, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 11, 0, 0);
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    v9 = (void *)MEMORY[0x1E4F1CB10];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__WBSParsecSearchUtilities_anyParsecSearchResult_fuzzyMatchesSuggestedSiteURLString___block_invoke_2;
    v12[3] = &unk_1E5E43C18;
    id v13 = v7;
    v14 = &v15;
    objc_msgSend(v9, "safari_enumeratePossibleURLsForUserTypedString:withBlock:", v8, v12);
    BOOL v10 = *((unsigned char *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

id __85__WBSParsecSearchUtilities_anyParsecSearchResult_fuzzyMatchesSuggestedSiteURLString___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 subtype] == 1)
  {
    v3 = [v2 urlString];
    v4 = objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 4, 0, 0);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __85__WBSParsecSearchUtilities_anyParsecSearchResult_fuzzyMatchesSuggestedSiteURLString___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  if (indexOfURLInParsecURLStrings(v10, *(void **)(a1 + 32)) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v10;
    goto LABEL_8;
  }
  char v5 = objc_msgSend(v10, "safari_hasScheme:", @"http");
  id v6 = @"https";
  if ((v5 & 1) == 0)
  {
    if (!objc_msgSend(v10, "safari_hasScheme:", @"https"))
    {
      v9 = v10;
      goto LABEL_9;
    }
    id v6 = @"http";
  }
  v7 = objc_msgSend(v10, "safari_URLByReplacingSchemeWithString:", v6);

  uint64_t v8 = indexOfURLInParsecURLStrings(v7, *(void **)(a1 + 32));
  v9 = v7;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
LABEL_9:
}

@end