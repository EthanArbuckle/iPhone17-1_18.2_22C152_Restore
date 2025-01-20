@interface WBSResultRanker(SafariSharedUIExtras)
+ (BOOL)includeBookmarksAndHistory:()SafariSharedUIExtras;
+ (__CFString)_dropQueryPart:()SafariSharedUIExtras;
+ (id)_simplifyURLForHistoryDedupe:()SafariSharedUIExtras withMobile:;
+ (id)_urlStringWithoutQueryForMatch:()SafariSharedUIExtras;
+ (id)_visibleURLtoDisplayedURL:()SafariSharedUIExtras;
+ (id)dedupeResults:()SafariSharedUIExtras withSearchSuggestionStrings:searchProvider:;
+ (id)dedupeSameTitleHistoryResults:()SafariSharedUIExtras withMobile:withTophits:withTabs:;
+ (id)dedupeSameTitleHistoryResults:()SafariSharedUIExtras withMobile:withTophits:withTabs:cloudTabs:;
+ (id)dedupeSameURLResults:()SafariSharedUIExtras withUniversalSearchResults:;
+ (id)deduplicateTopHits:()SafariSharedUIExtras;
+ (id)filterOutUnlikelyMatchesBeforeTopHitPromotionFromMatches:()SafariSharedUIExtras forQuery:searchProvider:;
+ (id)filterOutUnlikelyMatchesFromMatches:()SafariSharedUIExtras forQuery:rewrittenQuery:;
+ (id)filterOutUnlikelyMatchesFromTopHits:()SafariSharedUIExtras forQuery:searchProvider:;
+ (id)urlStringsFromUniversalSearchResults:()SafariSharedUIExtras;
+ (uint64_t)_shouldDedupeResult:()SafariSharedUIExtras withMobile:withBase:withSimplified:;
+ (uint64_t)matchNavigationIsClientOrServerError:()SafariSharedUIExtras;
+ (uint64_t)shouldAutocompleteToURL:()SafariSharedUIExtras fromUserTypedString:withPredictedQueryString:;
+ (void)_trackTitleAndURLSingle:()SafariSharedUIExtras withMobile:withBase:withSimplified:;
+ (void)_trackTitlesAndURLs:()SafariSharedUIExtras withMobile:withBase:withSimplified:;
@end

@implementation WBSResultRanker(SafariSharedUIExtras)

+ (id)filterOutUnlikelyMatchesFromTopHits:()SafariSharedUIExtras forQuery:searchProvider:
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = [v6 queryString];
    char v9 = objc_msgSend(v8, "safari_isPrefixOfWwwDot");
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __101__WBSResultRanker_SafariSharedUIExtras__filterOutUnlikelyMatchesFromTopHits_forQuery_searchProvider___block_invoke;
    v13[3] = &unk_1E5E44770;
    char v15 = v9;
    id v10 = v8;
    id v14 = v10;
    v11 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v13);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

+ (id)filterOutUnlikelyMatchesBeforeTopHitPromotionFromMatches:()SafariSharedUIExtras forQuery:searchProvider:
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    char v9 = [v7 queryString];
    char v10 = objc_msgSend(v9, "safari_isPrefixOfWwwDot");
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __122__WBSResultRanker_SafariSharedUIExtras__filterOutUnlikelyMatchesBeforeTopHitPromotionFromMatches_forQuery_searchProvider___block_invoke;
    v14[3] = &unk_1E5E44798;
    char v17 = v10;
    id v11 = v9;
    id v15 = v11;
    uint64_t v16 = a1;
    v12 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v14);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

+ (id)filterOutUnlikelyMatchesFromMatches:()SafariSharedUIExtras forQuery:rewrittenQuery:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 searchParameters];
  char v9 = [v8 isResultFilteringDisabled];

  if ((v9 & 1) == 0)
  {
    char v10 = [v7 queryString];
    char v11 = objc_msgSend(v10, "safari_allowsLooserMatchingInSearch");
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __101__WBSResultRanker_SafariSharedUIExtras__filterOutUnlikelyMatchesFromMatches_forQuery_rewrittenQuery___block_invoke;
    v15[3] = &unk_1E5E44798;
    char v17 = a1;
    id v12 = v10;
    id v16 = v12;
    char v18 = v11;
    uint64_t v13 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v15);

    id v6 = (id)v13;
  }

  return v6;
}

+ (id)_visibleURLtoDisplayedURL:()SafariSharedUIExtras
{
  v3 = objc_msgSend(a3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 51, 1, 0);
  return v3;
}

+ (__CFString)_dropQueryPart:()SafariSharedUIExtras
{
  v3 = [a3 componentsSeparatedByString:@"?"];
  v4 = [v3 firstObject];
  id v5 = v4;
  if (!v4) {
    v4 = &stru_1F031A860;
  }
  id v6 = v4;

  return v6;
}

+ (id)_urlStringWithoutQueryForMatch:()SafariSharedUIExtras
{
  v4 = [a3 userVisibleURLString];
  id v5 = [a1 _dropQueryPart:v4];

  return v5;
}

+ (id)_simplifyURLForHistoryDedupe:()SafariSharedUIExtras withMobile:
{
  id v6 = a3;
  if (a4) {
    [a1 _visibleURLtoDisplayedURL:v6];
  }
  else {
  id v7 = [a1 _dropQueryPart:v6];
  }

  return v7;
}

+ (void)_trackTitlesAndURLs:()SafariSharedUIExtras withMobile:withBase:withSimplified:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(a1, "_trackTitleAndURLSingle:withMobile:withBase:withSimplified:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), a4, v11, v12, (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

+ (void)_trackTitleAndURLSingle:()SafariSharedUIExtras withMobile:withBase:withSimplified:
{
  id v23 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v23 title];
  if (v12)
  {
    id v13 = [v23 userVisibleURLString];

    if (v13)
    {
      uint64_t v14 = [v23 userVisibleURLString];
      uint64_t v15 = [a1 _simplifyURLForHistoryDedupe:v14 withMobile:a4];

      uint64_t v16 = [v23 titlePrefix];
      long long v17 = [v10 objectForKeyedSubscript:v16];

      if (!v17)
      {
        long long v17 = [MEMORY[0x1E4F1CA48] array];
      }
      long long v18 = [v23 userVisibleURLString];
      [v17 addObject:v18];

      long long v19 = [v23 titlePrefix];
      [v10 setObject:v17 forKeyedSubscript:v19];

      long long v20 = [v23 titlePrefix];
      v21 = [v11 objectForKeyedSubscript:v20];

      if (!v21)
      {
        v21 = [MEMORY[0x1E4F1CA48] array];
      }
      [v21 addObject:v15];
      uint64_t v22 = [v23 titlePrefix];
      [v11 setObject:v21 forKeyedSubscript:v22];
    }
  }
}

+ (uint64_t)_shouldDedupeResult:()SafariSharedUIExtras withMobile:withBase:withSimplified:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v26 = a5;
  id v11 = a6;
  if (a4)
  {
    id v12 = [v10 userVisibleURLString];
    id v13 = [a1 _simplifyURLForHistoryDedupe:v12 withMobile:1];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v14 = [v10 titlePrefix];
    uint64_t v15 = [v11 objectForKeyedSubscript:v14];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v15);
          }
          if ([*(id *)(*((void *)&v31 + 1) + 8 * i) isEqualToString:v13])
          {
            uint64_t v16 = 1;
            goto LABEL_21;
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v19 = [v10 titlePrefix];
    id v13 = [v26 objectForKeyedSubscript:v19];

    uint64_t v16 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v16)
    {
      uint64_t v20 = *(void *)v28;
      while (2)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v13);
          }
          uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          id v23 = (void *)MEMORY[0x1E4F983B8];
          v24 = [v10 userVisibleURLString];
          LOBYTE(v22) = [v23 hostAreEqual:v24 forSecondURLString:v22];

          if (v22)
          {
            uint64_t v16 = 1;
            goto LABEL_23;
          }
        }
        uint64_t v16 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
LABEL_23:

  return v16;
}

+ (id)dedupeSameTitleHistoryResults:()SafariSharedUIExtras withMobile:withTophits:withTabs:
{
  id v6 = [a1 dedupeSameTitleHistoryResults:a3 withMobile:a4 withTophits:a5 withTabs:a6 cloudTabs:MEMORY[0x1E4F1CBF0]];
  return v6;
}

+ (id)dedupeSameTitleHistoryResults:()SafariSharedUIExtras withMobile:withTophits:withTabs:cloudTabs:
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [a1 searchParameters];
  char v17 = [v16 isResultFilteringDisabled];

  if ((v17 & 1) == 0)
  {
    long long v18 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v19 = [MEMORY[0x1E4F1CA60] dictionary];
    [a1 _trackTitlesAndURLs:v13 withMobile:a4 withBase:v18 withSimplified:v19];
    [a1 _trackTitlesAndURLs:v15 withMobile:a4 withBase:v18 withSimplified:v19];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __113__WBSResultRanker_SafariSharedUIExtras__dedupeSameTitleHistoryResults_withMobile_withTophits_withTabs_cloudTabs___block_invoke;
    v32[3] = &__block_descriptor_40_e31_B16__0__WBSURLCompletionMatch_8l;
    v32[4] = a1;
    uint64_t v20 = objc_msgSend(v12, "safari_filterObjectsUsingBlock:", v32);
    [a1 _trackTitlesAndURLs:v20 withMobile:a4 withBase:v18 withSimplified:v19];

    v21 = [a1 searchParameters];
    int v22 = [v21 enableCompletionListHistoryDeduplicationSwitchToTabValue];

    if (v22) {
      [a1 _trackTitlesAndURLs:v14 withMobile:a4 withBase:v18 withSimplified:v19];
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __113__WBSResultRanker_SafariSharedUIExtras__dedupeSameTitleHistoryResults_withMobile_withTophits_withTabs_cloudTabs___block_invoke_2;
    v27[3] = &unk_1E5E447E0;
    long long v30 = a1;
    char v31 = a4;
    id v23 = v18;
    id v28 = v23;
    id v24 = v19;
    id v29 = v24;
    uint64_t v25 = objc_msgSend(v12, "safari_filterObjectsUsingBlock:", v27);

    id v12 = (id)v25;
  }

  return v12;
}

+ (id)deduplicateTopHits:()SafariSharedUIExtras
{
  id v4 = a3;
  id v5 = [a1 searchParameters];
  if (([v5 isResultFilteringDisabled] & 1) == 0)
  {
    unint64_t v6 = [v4 count];

    if (v6 < 2) {
      goto LABEL_11;
    }
    id v7 = [v4 firstObject];
    v8 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
    char v9 = (void *)MEMORY[0x1E4F1CA80];
    id v10 = [a1 _urlStringWithoutQueryForMatch:v7];
    id v11 = [v9 setWithObject:v10];

    for (unint64_t i = 1; i < [v4 count]; ++i)
    {
      id v13 = [v4 objectAtIndexedSubscript:i];
      id v14 = [a1 _urlStringWithoutQueryForMatch:v13];
      if ([v11 containsObject:v14])
      {
        logCompletionMatchToDebugChannel(&cfstr_ExcludingDupli_0.isa, v13);
      }
      else
      {
        [v11 addObject:v14];
        [v8 addObject:v13];
      }
    }
    id v5 = v4;
    id v4 = v8;
  }

LABEL_11:
  return v4;
}

+ (uint64_t)matchNavigationIsClientOrServerError:()SafariSharedUIExtras
{
  id v4 = a3;
  id v5 = [a1 searchParameters];
  char v6 = [v5 isResultFilteringDisabled];

  if ((v6 & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v7 = [v4 data];
    uint64_t v8 = [v7 visitWasClientError];
  }
  return v8;
}

+ (BOOL)includeBookmarksAndHistory:()SafariSharedUIExtras
{
  id v3 = a3;
  BOOL v4 = ![v3 isCFSearch] || objc_msgSend(v3, "maxBookmarksAndHistoryItems");

  return v4;
}

+ (id)urlStringsFromUniversalSearchResults:()SafariSharedUIExtras
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "url", (void)v14);
        id v10 = objc_msgSend(v9, "safari_userVisibleString");
        id v11 = objc_msgSend(v10, "safari_urlStringForCompletionDeduplication");

        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = (void *)[v4 copy];
  return v12;
}

+ (id)dedupeSameURLResults:()SafariSharedUIExtras withUniversalSearchResults:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 urlStringsFromUniversalSearchResults:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__WBSResultRanker_SafariSharedUIExtras__dedupeSameURLResults_withUniversalSearchResults___block_invoke;
  v12[3] = &unk_1E5E44808;
  id v13 = v8;
  id v9 = v8;
  id v10 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v12);

  return v10;
}

+ (id)dedupeResults:()SafariSharedUIExtras withSearchSuggestionStrings:searchProvider:
{
  id v7 = a4;
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__WBSResultRanker_SafariSharedUIExtras__dedupeResults_withSearchSuggestionStrings_searchProvider___block_invoke;
  v13[3] = &unk_1E5E44830;
  id v14 = v8;
  id v15 = v7;
  id v9 = v7;
  id v10 = v8;
  id v11 = objc_msgSend(a3, "safari_filterObjectsUsingBlock:", v13);

  return v11;
}

+ (uint64_t)shouldAutocompleteToURL:()SafariSharedUIExtras fromUserTypedString:withPredictedQueryString:
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_msgSend(a3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 15, 0, 0);
  uint64_t v10 = WBSUnifiedFieldInputTypeForString();
  if ((unint64_t)(v10 - 1) < 2
    || (uint64_t v11 = 1, v10) && v10 != 4 && (unint64_t)(WBSUnifiedFieldInputTypeForString() - 1) <= 3)
  {
    uint64_t v11 = [v9 hasPrefix:v7];
  }

  return v11;
}

@end