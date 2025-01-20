@interface WBSResultRanker
@end

@implementation WBSResultRanker

uint64_t __101__WBSResultRanker_SafariSharedUIExtras__filterOutUnlikelyMatchesFromTopHits_forQuery_searchProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 originalURLString];
  if (*(unsigned char *)(a1 + 40)
    && [v3 matchLocation] == 9
    && (objc_msgSend(v4, "safari_urlStringSuppressingHTTPFamilySchemeAndWWWSubdomain"),
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 hasPrefix:*(void *)(a1 + 32)],
        v5,
        (v6 & 1) == 0))
  {
    logCompletionMatchToDebugChannel(&cfstr_ExcludingTophi.isa, (WBSURLCompletionMatch *)v3);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __122__WBSResultRanker_SafariSharedUIExtras__filterOutUnlikelyMatchesBeforeTopHitPromotionFromMatches_forQuery_searchProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 originalURLString];
  if (*(unsigned char *)(a1 + 48) && [v3 matchLocation] == 9)
  {
    v5 = objc_msgSend(v4, "safari_urlStringSuppressingHTTPFamilySchemeAndWWWSubdomain");
    if ([v5 hasPrefix:*(void *)(a1 + 32)])
    {
    }
    else
    {
      char v6 = [MEMORY[0x1E4F98318] isStreamlinedCompletionListEnabled];

      if (v6)
      {
        uint64_t v7 = @"Excluding URL that matches www subdomain";
        goto LABEL_9;
      }
    }
  }
  if (![*(id *)(a1 + 40) matchNavigationIsClientOrServerError:v3])
  {
    uint64_t v8 = 1;
    goto LABEL_11;
  }
  uint64_t v7 = @"Excluding URL match that is a client or server error";
LABEL_9:
  logCompletionMatchToDebugChannel(&v7->isa, (WBSURLCompletionMatch *)v3);
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

uint64_t __101__WBSResultRanker_SafariSharedUIExtras__filterOutUnlikelyMatchesFromMatches_forQuery_rewrittenQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 40) matchNavigationIsClientOrServerError:v3])
  {
    logCompletionMatchToDebugChannel(&cfstr_ExcludingUnlik.isa, v3);
  }
  else
  {
    if (([(WBSURLCompletionMatch *)v3 isTopHit] & 1) != 0
      || ((unint64_t v5 = [(WBSURLCompletionMatch *)v3 matchLocation],
           char v6 = (void *)MEMORY[0x1E4F983B8],
           [*(id *)(a1 + 40) searchParameters],
           uint64_t v7 = objc_claimAutoreleasedReturnValue(),
           char v8 = [v6 allowMatch:v7 forMatch:v3 forQueryString:*(void *)(a1 + 32)],
           v7,
           *(unsigned char *)(a1 + 48))
        ? (BOOL v9 = v5 > 1)
        : (BOOL v9 = v8),
          v9))
    {
      uint64_t v4 = 1;
      goto LABEL_10;
    }
    logCompletionMatchToDebugChannel(&cfstr_ExcludingUnlik_0.isa, v3);
  }
  uint64_t v4 = 0;
LABEL_10:

  return v4;
}

uint64_t __113__WBSResultRanker_SafariSharedUIExtras__dedupeSameTitleHistoryResults_withMobile_withTophits_withTabs_cloudTabs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchNavigationIsClientOrServerError:a2];
}

uint64_t __113__WBSResultRanker_SafariSharedUIExtras__dedupeSameTitleHistoryResults_withMobile_withTophits_withTabs_cloudTabs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 title];
  if (!v4) {
    goto LABEL_6;
  }
  unint64_t v5 = [v3 userVisibleURLString];

  if (!v5) {
    goto LABEL_6;
  }
  if (![*(id *)(a1 + 48) _shouldDedupeResult:v3 withMobile:*(unsigned __int8 *)(a1 + 56) withBase:*(void *)(a1 + 32) withSimplified:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 48) _trackTitleAndURLSingle:v3 withMobile:*(unsigned __int8 *)(a1 + 56) withBase:*(void *)(a1 + 32) withSimplified:*(void *)(a1 + 40)];
LABEL_6:
    uint64_t v6 = 1;
    goto LABEL_7;
  }
  logCompletionMatchToDebugChannel(&cfstr_ExcludingDupli.isa, (WBSURLCompletionMatch *)v3);
  uint64_t v6 = 0;
LABEL_7:

  return v6;
}

uint64_t __89__WBSResultRanker_SafariSharedUIExtras__dedupeSameURLResults_withUniversalSearchResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 originalURLString];
  unint64_t v5 = objc_msgSend(v4, "safari_urlStringForCompletionDeduplication");

  int v6 = [*(id *)(a1 + 32) containsObject:v5];
  if (v6) {
    logCompletionMatchToDebugChannel(&cfstr_ExcludingDupli_1.isa, (WBSURLCompletionMatch *)v3);
  }

  return v6 ^ 1u;
}

uint64_t __98__WBSResultRanker_SafariSharedUIExtras__dedupeResults_withSearchSuggestionStrings_searchProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  unint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  int v6 = [v3 originalURLString];
  uint64_t v7 = [v5 URLWithString:v6];
  char v8 = [v4 userVisibleQueryFromSearchURL:v7];

  if (v8
    && (BOOL v9 = *(void **)(a1 + 40),
        [v8 lowercaseString],
        v10 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = [v9 containsObject:v10],
        v10,
        v9))
  {
    logCompletionMatchToDebugChannel(&cfstr_ExcludingDupli_2.isa, (WBSURLCompletionMatch *)v3);
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

@end