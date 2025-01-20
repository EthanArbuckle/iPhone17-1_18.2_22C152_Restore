@interface WBSURLCompletionDatabase
+ (BOOL)_isMatchURLString:(id)a3 equivalentToBaseURLString:(id)a4;
+ (BOOL)_matchIsNotURLMatchAndTitleLooksLikeURLForBookmarkAndHistoryCompletionMatch:(const void *)a3;
+ (BOOL)_matchMistookErrorTitleForPageTitleForBookmarkAndHistoryCompletionMatch:(const void *)a3;
+ (BOOL)_redirectionChainsOfCompletionMatchData:(id)a3 containURLString:(id)a4;
+ (BOOL)_shouldPreloadTopHit:(void *)a3 forTypedString:(id)a4 withSearchParameters:(id)a5;
+ (BOOL)_topHitFromMatches:()RefPtr<SafariShared:()WTF:(WTF:(void *)a4 :(id)a5 DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>)a3 :RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch> :BookmarkAndHistoryCompletionMatch isOneOfManyUnremarkableMatchesInLocalHistoryMatches:inDomain:;
+ (BOOL)doesStringLookLikeURLHost:(id)a3;
+ (RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,)_synthesizeURLMatchWithURLString:(id)a3 title:(id)a4 topHitFromMatches:()RefPtr<SafariShared:()WTF:(WTF:(void *)a6 :(void *)a7 DefaultRefDerefTraits<SafariShared:(id)a8 :(double)a9 BookmarkAndHistoryCompletionMatch>>)a5 :(id)a10 RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch> :BookmarkAndHistoryCompletionMatch historyMatches:bookmarkMatches:typedString:timeNow:completionDataSource:;
+ (RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,)_topHitFromBaseURLMatchForTopHitFromMatches:()RefPtr<SafariShared:()WTF:(WTF:(BOOL *)a4 :(void *)a5 DefaultRefDerefTraits<SafariShared:(void *)a6 :(id)a7 BookmarkAndHistoryCompletionMatch>>)a3 :(id)a8 RawPtrTraits<SafariShared:(double)a9 :(id)a10 BookmarkAndHistoryCompletionMatch> :BookmarkAndHistoryCompletionMatch shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:;
+ (void)initializeURLCompletionOnMainThread;
- (WBSURLCompletionDataSource)dataSource;
- (WBSURLCompletionDatabase)init;
- (id).cxx_construct;
- (void)_getSortedFullTextMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(void *)a5 historyMatches:(void *)a6 historyLimit:(unint64_t)a7 bookmarkMatches:(void *)a8 bookmarkLimit:(unint64_t)a9 searchParameters:(id)a10;
- (void)_getSortedMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(void *)a5 historyMatches:(void *)a6 historyLimit:(unint64_t)a7 bookmarkMatches:(void *)a8 bookmarkLimit:(unint64_t)a9 searchParameters:(id)a10 prefixMatchesOnly:(BOOL)a11;
- (void)_getSortedPrefixMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(void *)a5 historyMatches:(void *)a6 historyLimit:(unint64_t)a7 bookmarkMatches:(void *)a8 bookmarkLimit:(unint64_t)a9 searchParameters:(id)a10;
- (void)_getUnsortedFullTextMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 historyMatches:(void *)a5 bookmarkMatches:(void *)a6 dataTypes:(unsigned int)a7;
- (void)_getUnsortedPrefixMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 historyMatches:(void *)a5 bookmarkMatches:(void *)a6;
- (void)_removeMatchesThatMistookErrorTitleForPageTitleFromMatches:(void *)a3;
- (void)_removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:(void *)a3;
- (void)clearBookmarkMatchesCaches;
- (void)clearBookmarkMatchesCachesKeepingEmptyValues:(BOOL)a3;
- (void)clearHistoryMatchesCache;
- (void)clearMatchesCaches;
- (void)getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(id *)a5 matches:(id *)a6 limit:(unint64_t)a7 forQueryID:(int64_t)a8 withSearchParameters:(id)a9;
- (void)setDataSource:(id)a3;
@end

@implementation WBSURLCompletionDatabase

- (WBSURLCompletionDatabase)init
{
  v5.receiver = self;
  v5.super_class = (Class)WBSURLCompletionDatabase;
  v2 = [(WBSURLCompletionDatabase *)&v5 init];
  if (v2)
  {
    [(id)objc_opt_class() initializeURLCompletionOnMainThread];
    v3 = v2;
  }

  return v2;
}

+ (void)initializeURLCompletionOnMainThread
{
  if (+[WBSURLCompletionDatabase initializeURLCompletionOnMainThread]::onceToken != -1) {
    dispatch_once(&+[WBSURLCompletionDatabase initializeURLCompletionOnMainThread]::onceToken, &__block_literal_global_112);
  }
}

- (void)getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(id *)a5 matches:(id *)a6 limit:(unint64_t)a7 forQueryID:(int64_t)a8 withSearchParameters:(id)a9
{
  id v15 = a3;
  id v46 = a4;
  id v16 = a9;
  v51 = 0;
  uint64_t v52 = 0;
  v49 = 0;
  uint64_t v50 = 0;
  v17 = [[WBSURLCompletionUserTypedString alloc] initWithString:v15];
  v47 = 0;
  uint64_t v48 = 0;
  if (a5) {
    v18 = &v51;
  }
  else {
    v18 = 0;
  }
  v45 = v17;
  [(WBSURLCompletionDatabase *)self _getSortedPrefixMatchesForTypedString:v17 filterResultsUsingProfileIdentifier:v46 topHits:v18 historyMatches:&v49 historyLimit:a7 bookmarkMatches:&v47 bookmarkLimit:a7 searchParameters:v16];
  unint64_t v19 = HIDWORD(v48);
  if (HIDWORD(v48) + (unint64_t)HIDWORD(v50) < a7)
  {
    if (HIDWORD(v50) < a7)
    {
      WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&v49, 0);
      unint64_t v19 = HIDWORD(v48);
    }
    if (v19 < a7) {
      WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&v47, 0);
    }
    [(WBSURLCompletionDatabase *)self _getSortedFullTextMatchesForTypedString:v45 filterResultsUsingProfileIdentifier:v46 topHits:v18 historyMatches:&v49 historyLimit:a7 bookmarkMatches:&v47 bookmarkLimit:a7 searchParameters:v16];
    LODWORD(v19) = HIDWORD(v48);
  }
  if (v19)
  {
    WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendRange<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*>((uint64_t)&v49, v47, &v47[v19]);
    v53 = compareCompletionMatches;
    unint64_t v20 = 126 - 2 * __clz(HIDWORD(v50));
    uint64_t v21 = HIDWORD(v50) ? v20 : 0;
    std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&),WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*,false>((uint64_t)v49, (uint64_t *)&v49[HIDWORD(v50)], (uint64_t (**)(uint64_t *, uint64_t *))&v53, v21, 1);
    if (HIDWORD(v50) > a7)
    {
      v22 = (uint64_t *)&v49[a7];
      unint64_t v23 = 8 * HIDWORD(v50) - 8 * a7;
      do
      {
        uint64_t v24 = *v22;
        uint64_t *v22 = 0;
        if (v24) {
          WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v24);
        }
        ++v22;
        v23 -= 8;
      }
      while (v23);
      HIDWORD(v50) = a7;
    }
  }
  v25 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    if (HIDWORD(v50))
    {
      v26 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[WBSURLCompletionDatabase getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:]();
      }
      logMatches((uint64_t)&v49);
    }
    else
    {
      v27 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[WBSURLCompletionDatabase getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:]();
      }
    }
  }
  if (a5)
  {
    v28 = a6;
    id v29 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:HIDWORD(v52)];
    *a5 = v29;
    if (HIDWORD(v52))
    {
      v30 = v51;
      uint64_t v31 = 8 * HIDWORD(v52);
      do
      {
        BOOL v32 = +[WBSURLCompletionDatabase _shouldPreloadTopHit:*v30 forTypedString:v15 withSearchParameters:v16];
        v33 = [WBSTopHitCompletionMatch alloc];
        v53 = *v30;
        *v30 = 0;
        v34 = [(WBSTopHitCompletionMatch *)v33 initWithBookmarkAndHistoryCompletionMatch:&v53 userInput:v15 forQueryID:a8 shouldPreload:v32];
        [v29 addObject:v34];

        v35 = (uint64_t (*)(uint64_t *, uint64_t *))v53;
        v53 = 0;
        if (v35) {
          WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v35);
        }
        ++v30;
        v31 -= 8;
      }
      while (v31);
    }

    a6 = v28;
  }
  id v36 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:HIDWORD(v50)];
  *a6 = v36;
  if (HIDWORD(v50))
  {
    v37 = v49;
    uint64_t v38 = 8 * HIDWORD(v50);
    do
    {
      v39 = [WBSBookmarkAndHistoryCompletionMatch alloc];
      v53 = *v37;
      *v37 = 0;
      v40 = [(WBSBookmarkAndHistoryCompletionMatch *)v39 initWithBookmarkAndHistoryCompletionMatch:&v53 userInput:v15 forQueryID:a8];
      [v36 addObject:v40];

      v41 = (uint64_t (*)(uint64_t *, uint64_t *))v53;
      v53 = 0;
      if (v41) {
        WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v41);
      }
      ++v37;
      v38 -= 8;
    }
    while (v38);
  }

  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v47, v42);
  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v49, v43);
  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v51, v44);
}

+ (BOOL)doesStringLookLikeURLHost:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend(v3, "safari_containsInteriorWhitespace") & 1) != 0
    || (uint64_t v4 = objc_msgSend(v3, "safari_firstLocationOfPeriodOrHomoglyphForPeriod"), v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [v3 substringFromIndex:v4];
    BOOL v5 = ![v6 length] || (objc_msgSend(v6, "containsString:", @"/") & 1) == 0;
  }
  return v5;
}

+ (BOOL)_shouldPreloadTopHit:(void *)a3 forTypedString:(id)a4 withSearchParameters:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3)
  {
    v9 = SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)a3);
    char v10 = [v9 shouldPreload];

    if (v10)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __85__WBSURLCompletionDatabase__shouldPreloadTopHit_forTypedString_withSearchParameters___block_invoke;
      v19[3] = &unk_1E5CA0748;
      v22 = a3;
      id v11 = v7;
      id v20 = v11;
      id v21 = v8;
      v12 = (uint64_t (**)(void))MEMORY[0x1AD0C4F80](v19);
      unint64_t v13 = *((void *)a3 + 1);
      if (v13 <= 8 && ((1 << v13) & 0x1D8) != 0
        || (SafariShared::BookmarkAndHistoryCompletionMatch::originalURLString((id *)a3),
            id v15 = (__CFString *)objc_claimAutoreleasedReturnValue(),
            id v16 = [[WBSURLCompletionUserTypedString alloc] initWithString:v11], v18 = SafariShared::computeURLMatchLocation(v15, (NSString *)&v16->super.isa, v17), v16, v15, v13 != v18))
      {
        LOBYTE(a3) = v12[2](v12);
      }
      else
      {
        LOBYTE(a3) = 1;
      }
    }
    else
    {
      LOBYTE(a3) = 0;
    }
  }

  return (char)a3;
}

BOOL __85__WBSURLCompletionDatabase__shouldPreloadTopHit_forTypedString_withSearchParameters___block_invoke(uint64_t a1)
{
  v2 = SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)(a1 + 48));
  if (objc_msgSend(v2, "matchesAutocompleteTrigger:isStrengthened:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "strengthenAutocompleteTriggerExtensionMatching")))BOOL v3 = *(float *)(*(void *)(a1 + 48) + 64) >= 1.0; {
  else
  }
    BOOL v3 = 0;

  return v3;
}

- (void)clearBookmarkMatchesCachesKeepingEmptyValues:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v3) {
      goto LABEL_3;
    }
LABEL_8:
    fullTextBookmarkMatchesCacheString = self->_fullTextBookmarkMatchesCacheString;
    self->_fullTextBookmarkMatchesCacheString = 0;

    WTF::Vector<objc_object  {objcproto25WBSURLCompletionMatchData}* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&self->_fullTextBookmarkMatchesCache, 0);
LABEL_9:
    prefixBookmarkMatchesCacheString = self->_prefixBookmarkMatchesCacheString;
    self->_prefixBookmarkMatchesCacheString = 0;

    goto LABEL_10;
  }
  -[WBSURLCompletionDatabase clearBookmarkMatchesCachesKeepingEmptyValues:](v5, v6, v7, v8, v9, v10, v11, v12);
  if (!v3) {
    goto LABEL_8;
  }
LABEL_3:
  if (self->_fullTextBookmarkMatchesCache.m_size)
  {
    unint64_t v13 = self->_fullTextBookmarkMatchesCacheString;
    self->_fullTextBookmarkMatchesCacheString = 0;
  }
  WTF::Vector<objc_object  {objcproto25WBSURLCompletionMatchData}* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&self->_fullTextBookmarkMatchesCache, 0);
  if (self->_prefixBookmarkMatchesCache.m_size) {
    goto LABEL_9;
  }
LABEL_10:
  WTF::Vector<objc_object  {objcproto25WBSURLCompletionMatchData}* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&self->_prefixBookmarkMatchesCache, 0);
}

- (void)clearBookmarkMatchesCaches
{
}

- (void)clearHistoryMatchesCache
{
}

- (void)clearMatchesCaches
{
  [(WBSURLCompletionDatabase *)self clearBookmarkMatchesCaches];
  [(WBSURLCompletionDatabase *)self clearHistoryMatchesCache];
}

+ (BOOL)_matchIsNotURLMatchAndTitleLooksLikeURLForBookmarkAndHistoryCompletionMatch:(const void *)a3
{
  unint64_t v3 = *((void *)a3 + 1);
  BOOL v4 = v3 > 8;
  uint64_t v5 = (1 << v3) & 0x1C8;
  if (v4 || v5 == 0) {
    return 0;
  }
  uint64_t v8 = SafariShared::BookmarkAndHistoryCompletionMatch::title((SafariShared::BookmarkAndHistoryCompletionMatch *)a3);
  BOOL v9 = +[WBSURLCompletionDatabase doesStringLookLikeURLHost:v8]&& *((void *)a3 + 2) == 0;

  return v9;
}

+ (BOOL)_matchMistookErrorTitleForPageTitleForBookmarkAndHistoryCompletionMatch:(const void *)a3
{
  unint64_t v3 = *((void *)a3 + 1);
  if (v3 != 4)
  {
    uint64_t v5 = SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)a3);
    if ([v5 lastVisitWasFailure])
    {
      if (v3 <= 0xA)
      {
LABEL_5:
        unsigned int v4 = (0x1C8u >> v3) & 1;
LABEL_11:

        return v4;
      }
    }
    else
    {
      char v6 = [v5 visitWasClientError];
      if (v3 < 0xB) {
        char v7 = v6;
      }
      else {
        char v7 = 0;
      }
      if (v7) {
        goto LABEL_5;
      }
    }
    LOBYTE(v4) = 0;
    goto LABEL_11;
  }
  LOBYTE(v4) = 0;
  return v4;
}

+ (BOOL)_redirectionChainsOfCompletionMatchData:(id)a3 containURLString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 entries];
    uint64_t v9 = [v8 count] - 1;
    do
    {
      BOOL v10 = (int)v9 > 0;
      if ((int)v9 <= 0) {
        break;
      }
      uint64_t v11 = [v8 objectAtIndexedSubscript:v9];
      uint64_t v12 = [v11 url];
      char v13 = [a1 _isMatchURLString:v12 equivalentToBaseURLString:v7];

      --v9;
    }
    while ((v13 & 1) == 0);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,)_topHitFromBaseURLMatchForTopHitFromMatches:()RefPtr<SafariShared:()WTF:(WTF:(BOOL *)a4 :(void *)a5 DefaultRefDerefTraits<SafariShared:(void *)a6 :(id)a7 BookmarkAndHistoryCompletionMatch>>)a3 :(id)a8 RawPtrTraits<SafariShared:(double)a9 :(id)a10 BookmarkAndHistoryCompletionMatch> :BookmarkAndHistoryCompletionMatch shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:
{
  id v16 = v10;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  v17 = (id *)a7;
  id v18 = a8;
  id v19 = a10;
  if (*(void *)a3.m_ptr && *((_DWORD *)a5 + 3) | *((_DWORD *)a6 + 3))
  {
    v103 = objc_msgSend(v17[1], "safari_bestURLForUserTypedString");
    if (!v103
      || (objc_msgSend(v103, "safari_userVisibleString"),
          id v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = [v20 localizedCaseInsensitiveContainsString:v17[1]],
          v20,
          (v21 & 1) == 0))
    {
      *id v16 = 0;
      goto LABEL_13;
    }
    v102 = [v103 path];
    if ([v102 length] && !objc_msgSend(v102, "isEqualToString:", @"/")
      || (objc_msgSend(v103, "safari_hasCharactersBeyondPath") & 1) != 0
      || [v17[1] hasSuffix:@"?"])
    {
      *id v16 = 0;
LABEL_11:

LABEL_13:
      goto LABEL_14;
    }
    unint64_t v23 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v24 = SafariShared::BookmarkAndHistoryCompletionMatch::userVisibleURLString(*(SafariShared::BookmarkAndHistoryCompletionMatch **)a3.m_ptr);
    v25 = objc_msgSend(v23, "safari_URLWithUserTypedString:", v24);

    v101 = v25;
    if (!v25)
    {
      uint64_t v38 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = SafariShared::BookmarkAndHistoryCompletionMatch::userVisibleURLString(*(SafariShared::BookmarkAndHistoryCompletionMatch **)a3.m_ptr);
        +[WBSURLCompletionDatabase _topHitFromBaseURLMatchForTopHitFromMatches:shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:](v39, &buf, v38);
      }

      *id v16 = 0;
      goto LABEL_43;
    }
    v100 = [v25 path];
    if (*(void *)(*(void *)a3.m_ptr + 8) == 9
      && [v100 length]
      && (![v100 isEqualToString:@"/"]
       || objc_msgSend(v25, "safari_hasCharactersBeyondPath")))
    {
      v26 = [v25 host];
      if ([v26 length])
      {
        int v27 = [v101 isFileURL];

        if (!v27)
        {
          v28 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:relativeToURL:", @"/", v101);
          id v29 = objc_msgSend(v28, "safari_originalDataAsString");

          v99 = v29;
          if (objc_msgSend(v29, "safari_hasCaseInsensitivePrefix:", @"feed:")
            && (objc_msgSend(v17[1], "safari_hasCaseInsensitivePrefix:", @"feed:") & 1) == 0)
          {
            uint64_t v30 = objc_msgSend(v29, "stringByReplacingCharactersInRange:withString:", 0, 5, @"https:");

            v99 = (void *)v30;
          }
          uint64_t v31 = objc_opt_class();
          BOOL v32 = SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)a3.m_ptr);
          int v33 = [v31 _redirectionChainsOfCompletionMatchData:v32 containURLString:v99];

          if (v33)
          {
            v34 = SafariShared::BookmarkAndHistoryCompletionMatch::title(*(SafariShared::BookmarkAndHistoryCompletionMatch **)a3.m_ptr);
            v35 = v34;
            if (!v34)
            {
              v35 = objc_msgSend(v101, "safari_userVisibleHost");
            }
            id v36 = *(_DWORD **)a3.m_ptr;
            if (*(void *)a3.m_ptr) {
              ++*v36;
            }
            v109 = v36;
            [a1 _synthesizeURLMatchWithURLString:v99 title:v35 topHitFromMatches:&v109 historyMatches:a5 bookmarkMatches:a6 typedString:v17 timeNow:a9 completionDataSource:v19];
            uint64_t v37 = (uint64_t)v109;
            v109 = 0;
            if (v37) {
              WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v37);
            }
            if (!v34) {

            }
            if (*v16)
            {
              logCompletionMatchToDebugChannel(&cfstr_WillReplaceTop.isa, *(SafariShared::BookmarkAndHistoryCompletionMatch **)a3.m_ptr);
LABEL_36:
              *a4 = 1;
LABEL_115:

              goto LABEL_42;
            }
            *id v16 = 0;
          }
          LODWORD(v40) = *((_DWORD *)a5 + 3);
          if (v40)
          {
            unint64_t v41 = 0;
            uint64_t v42 = -8;
            while (1)
            {
              v95 = (void *)v42;
              v43 = *(id **)(*(void *)a5 + 8 * v41);
              if (v43) {
                ++*(_DWORD *)v43;
              }
              *id v16 = (uint64_t)v43;
              v44 = SafariShared::BookmarkAndHistoryCompletionMatch::data(v43);
              v45 = [v44 originalURLString];
              int v96 = [a1 _isMatchURLString:v45 equivalentToBaseURLString:v99];

              if (v96) {
                break;
              }
              uint64_t v46 = *v16;
              *id v16 = 0;
              if (v46) {
                WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v46);
              }
              ++v41;
              unint64_t v40 = *((unsigned int *)a5 + 3);
              uint64_t v42 = (uint64_t)v95 - 8;
              if (v41 >= v40) {
                goto LABEL_53;
              }
            }
            if (v41)
            {
              v79 = *(void **)a5;
              v80 = (uint64_t *)(*(void *)a5 + 8 * v41);
              uint64_t v81 = *v80;
              uint64_t *v80 = 0;
              if (v81) {
                WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v81);
              }
              memmove(v80, v80 + 1, (size_t)v95 + *(void *)a5 + 8 * *((unsigned int *)a5 + 3) - (void)v79);
              int v82 = *((_DWORD *)a5 + 2);
              uint64_t v83 = (*((_DWORD *)a5 + 3) - 1);
              *((_DWORD *)a5 + 3) = v83;
              if (v83 == v82)
              {
                unint64_t v84 = WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a5, v83 + 1, (unint64_t)v16);
                LODWORD(v83) = *((_DWORD *)a5 + 3);
                id v16 = (uint64_t *)v84;
              }
              v85 = *(void **)a5;
              memmove((void *)(*(void *)a5 + 8), *(const void **)a5, 8 * v83);
              v86 = (_DWORD *)*v16;
              if (*v16) {
                ++*v86;
              }
              void *v85 = v86;
              ++*((_DWORD *)a5 + 3);
            }
            goto LABEL_115;
          }
LABEL_53:
          if (*((_DWORD *)a6 + 3))
          {
            unint64_t v47 = 0;
            uint64_t v48 = -8;
            while (1)
            {
              v95 = (void *)v48;
              v49 = *(id **)(*(void *)a6 + 8 * v47);
              if (v49) {
                ++*(_DWORD *)v49;
              }
              *id v16 = (uint64_t)v49;
              uint64_t v50 = SafariShared::BookmarkAndHistoryCompletionMatch::data(v49);
              v51 = [v50 originalURLString];
              int v97 = [a1 _isMatchURLString:v51 equivalentToBaseURLString:v99];

              if (v97) {
                break;
              }
              uint64_t v52 = *v16;
              *id v16 = 0;
              if (v52) {
                WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v52);
              }
              ++v47;
              uint64_t v48 = (uint64_t)v95 - 8;
              if (v47 >= *((unsigned int *)a6 + 3))
              {
                LODWORD(v40) = *((_DWORD *)a5 + 3);
                goto LABEL_62;
              }
            }
            if (v47)
            {
              v87 = *(void **)a6;
              v88 = (uint64_t *)(*(void *)a6 + 8 * v47);
              uint64_t v89 = *v88;
              uint64_t *v88 = 0;
              if (v89) {
                WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v89);
              }
              memmove(v88, v88 + 1, (size_t)v95 + *(void *)a6 + 8 * *((unsigned int *)a6 + 3) - (void)v87);
              int v90 = *((_DWORD *)a6 + 2);
              uint64_t v91 = (*((_DWORD *)a6 + 3) - 1);
              *((_DWORD *)a6 + 3) = v91;
              if (v91 == v90)
              {
                unint64_t v92 = WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a6, v91 + 1, (unint64_t)v16);
                LODWORD(v91) = *((_DWORD *)a6 + 3);
                id v16 = (uint64_t *)v92;
              }
              v93 = *(void **)a6;
              memmove((void *)(*(void *)a6 + 8), *(const void **)a6, 8 * v91);
              v94 = (_DWORD *)*v16;
              if (*v16) {
                ++*v94;
              }
              void *v93 = v94;
              ++*((_DWORD *)a6 + 3);
            }
            goto LABEL_115;
          }
LABEL_62:
          if (v40)
          {
            uint64_t v53 = 0;
            do
            {
              v54 = *(id **)(*(void *)a5 + 8 * v53);
              if (v54) {
                ++*(_DWORD *)v54;
              }
              v98 = v54;
              if (*(id **)a3.m_ptr == v54)
              {
                int v57 = 12;
              }
              else
              {
                v55 = objc_opt_class();
                v56 = SafariShared::BookmarkAndHistoryCompletionMatch::data(v98);
                int v57 = [v55 _redirectionChainsOfCompletionMatchData:v56 containURLString:v99];

                if (v57)
                {
                  v58 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
                    +[WBSURLCompletionDatabase _topHitFromBaseURLMatchForTopHitFromMatches:shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:](&buf, v111, v58);
                  }
                  v59 = SafariShared::BookmarkAndHistoryCompletionMatch::title((SafariShared::BookmarkAndHistoryCompletionMatch *)v98);
                  v60 = v59;
                  if (!v59)
                  {
                    v95 = objc_msgSend(v101, "safari_userVisibleHost");
                    v60 = v95;
                  }
                  v61 = *(_DWORD **)a3.m_ptr;
                  if (*(void *)a3.m_ptr) {
                    ++*v61;
                  }
                  v108 = v61;
                  [a1 _synthesizeURLMatchWithURLString:v99 title:v60 topHitFromMatches:&v108 historyMatches:a5 bookmarkMatches:a6 typedString:v17 timeNow:a9 completionDataSource:v19];
                  uint64_t v62 = (uint64_t)v108;
                  v108 = 0;
                  if (v62) {
                    WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v62);
                  }
                  if (!v59) {

                  }
                  int v57 = 1;
                }
              }
              if (v98) {
                WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v98);
              }
              if (v57 != 12 && v57) {
                goto LABEL_115;
              }
            }
            while (++v53 < (unint64_t)*((unsigned int *)a5 + 3));
          }
          v63 = objc_opt_class();
          v64 = *(_DWORD **)a3.m_ptr;
          if (*(void *)a3.m_ptr) {
            ++*v64;
          }
          v107 = v64;
          v65 = [v101 host];
          int v66 = [v63 _topHitFromMatches:&v107 isOneOfManyUnremarkableMatchesInLocalHistoryMatches:a5 inDomain:v65];

          uint64_t v67 = (uint64_t)v107;
          v107 = 0;
          if (v67) {
            WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v67);
          }
          if (v66)
          {
            v68 = objc_msgSend(v101, "safari_userVisibleHost");
            v69 = *(_DWORD **)a3.m_ptr;
            if (*(void *)a3.m_ptr) {
              ++*v69;
            }
            v106 = v69;
            [a1 _synthesizeURLMatchWithURLString:v99 title:v68 topHitFromMatches:&v106 historyMatches:a5 bookmarkMatches:a6 typedString:v17 timeNow:a9 completionDataSource:v19];
            uint64_t v70 = (uint64_t)v106;
            v106 = 0;
            if (v70) {
              WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v70);
            }

            if (*v16)
            {
              v71 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
                +[WBSURLCompletionDatabase _topHitFromBaseURLMatchForTopHitFromMatches:shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:](v71, v72, v73, v74, v75, v76, v77, v78);
              }
              goto LABEL_36;
            }
            *id v16 = 0;
          }
          *id v16 = 0;
          goto LABEL_115;
        }
      }
      else
      {
      }
    }
    *id v16 = 0;
LABEL_42:

LABEL_43:
    goto LABEL_11;
  }
  *id v16 = 0;
LABEL_14:

  return v22;
}

+ (BOOL)_isMatchURLString:(id)a3 equivalentToBaseURLString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 length];
  if (v7 == [v6 length] - 1) {
    char v8 = [v6 hasPrefix:v5];
  }
  else {
    char v8 = [v6 isEqualToString:v5];
  }
  BOOL v9 = v8;

  return v9;
}

+ (BOOL)_topHitFromMatches:()RefPtr<SafariShared:()WTF:(WTF:(void *)a4 :(id)a5 DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>)a3 :RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch> :BookmarkAndHistoryCompletionMatch isOneOfManyUnremarkableMatchesInLocalHistoryMatches:inDomain:
{
  id v7 = a5;
  char v8 = SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)a3.m_ptr);
  char v9 = [v8 containsBookmark];

  if (v9)
  {
    BOOL v10 = 0;
    goto LABEL_20;
  }
  if (!*((_DWORD *)a4 + 3))
  {
LABEL_15:
    int v17 = 2;
    goto LABEL_19;
  }
  uint64_t v11 = 0;
  double v12 = *(float *)(*(void *)a3.m_ptr + 48);
  while (1)
  {
    uint64_t v13 = *(void *)(*(void *)a4 + 8 * v11);
    if (!v13) {
      break;
    }
    ++*(_DWORD *)v13;
    if (*(void *)a3.m_ptr != v13) {
      goto LABEL_7;
    }
LABEL_10:
    WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v13);
LABEL_11:
    if (++v11 >= (unint64_t)*((unsigned int *)a4 + 3)) {
      goto LABEL_15;
    }
  }
  if (!*(void *)a3.m_ptr) {
    goto LABEL_11;
  }
LABEL_7:
  double v14 = v12 - *(float *)(v13 + 48);
  if (v14 < 0.0) {
    goto LABEL_10;
  }
  if (v14 > 0.5)
  {
    int v17 = 2;
    goto LABEL_18;
  }
  id v15 = SafariShared::BookmarkAndHistoryCompletionMatch::originalURLString((id *)v13);
  char v16 = [v15 containsString:v7];

  if ((v16 & 1) == 0) {
    goto LABEL_10;
  }
  int v17 = 1;
LABEL_18:
  WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v13);
LABEL_19:
  BOOL v10 = v17 != 2;
LABEL_20:

  return v10;
}

+ (RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,)_synthesizeURLMatchWithURLString:(id)a3 title:(id)a4 topHitFromMatches:()RefPtr<SafariShared:()WTF:(WTF:(void *)a6 :(void *)a7 DefaultRefDerefTraits<SafariShared:(id)a8 :(double)a9 BookmarkAndHistoryCompletionMatch>>)a5 :(id)a10 RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch> :BookmarkAndHistoryCompletionMatch historyMatches:bookmarkMatches:typedString:timeNow:completionDataSource:
{
  int v17 = v10;
  id v18 = a3;
  id v19 = a4;
  id v20 = a8;
  id v21 = a10;
  RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch, WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>, WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> v22 = SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)a5.m_ptr);
  unint64_t v23 = objc_msgSend(v21, "fakeBookmarkMatchDataWithURLString:title:shouldPreload:", v18, v19, objc_msgSend(v22, "shouldPreload"));

  if (v23
    && (uint64_t v33 = 0,
        uint64_t v34 = 0,
        (uint64_t matched = SafariShared::BookmarkAndHistoryCompletionMatch::computeMatchLocation(v23, v20, &v34, &v33)) != 0))
  {
    SafariShared::BookmarkAndHistoryCompletionMatch::create((uint64_t)v23, 0, matched, v33, v34, (uint64_t *)&v32, a9);
    v25 = (id *)v32;
    void *v17 = v32;
    v26 = SafariShared::BookmarkAndHistoryCompletionMatch::data(v25);
    if (![v26 containsBookmark]) {
      a7 = a6;
    }
    uint64_t v27 = *((unsigned int *)a7 + 3);
    if (v27 == *((_DWORD *)a7 + 2))
    {
      unint64_t v28 = WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a7, v27 + 1, (unint64_t)v17);
      LODWORD(v27) = *((_DWORD *)a7 + 3);
      int v17 = (void *)v28;
    }
    id v29 = *(void **)a7;
    memmove((void *)(*(void *)a7 + 8), *(const void **)a7, 8 * v27);
    uint64_t v30 = (_DWORD *)*v17;
    if (*v17) {
      ++*v30;
    }
    *id v29 = v30;
    ++*((_DWORD *)a7 + 3);
  }
  else
  {
    void *v17 = 0;
  }

  return v31;
}

- (void)_getSortedFullTextMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(void *)a5 historyMatches:(void *)a6 historyLimit:(unint64_t)a7 bookmarkMatches:(void *)a8 bookmarkLimit:(unint64_t)a9 searchParameters:(id)a10
{
  LOBYTE(v10) = 0;
  [(WBSURLCompletionDatabase *)self _getSortedMatchesForTypedString:a3 filterResultsUsingProfileIdentifier:a4 topHits:a5 historyMatches:a6 historyLimit:a7 bookmarkMatches:a8 bookmarkLimit:a9 searchParameters:a10 prefixMatchesOnly:v10];
}

- (void)_getSortedPrefixMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(void *)a5 historyMatches:(void *)a6 historyLimit:(unint64_t)a7 bookmarkMatches:(void *)a8 bookmarkLimit:(unint64_t)a9 searchParameters:(id)a10
{
  LOBYTE(v10) = 1;
  [(WBSURLCompletionDatabase *)self _getSortedMatchesForTypedString:a3 filterResultsUsingProfileIdentifier:a4 topHits:a5 historyMatches:a6 historyLimit:a7 bookmarkMatches:a8 bookmarkLimit:a9 searchParameters:a10 prefixMatchesOnly:v10];
}

- (void)_removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:(void *)a3
{
  *(void *)&v18[5] = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  unint64_t v16 = 0;
  unsigned int v4 = *(SafariShared::BookmarkAndHistoryCompletionMatch ***)a3;
  uint64_t v5 = *((unsigned int *)a3 + 3);
  if (v5)
  {
    uint64_t v6 = 8 * v5;
    do
    {
      if ([(id)objc_opt_class() _matchIsNotURLMatchAndTitleLooksLikeURLForBookmarkAndHistoryCompletionMatch:*v4])
      {
        id v7 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          char v8 = SafariShared::BookmarkAndHistoryCompletionMatch::title(*v4);
          -[WBSURLCompletionDatabase _removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:](v8, buf, v18, v7);
        }
      }
      else
      {
        uint64_t v9 = HIDWORD(v16);
        if (HIDWORD(v16) == v16)
        {
          WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&>((uint64_t)&v15, (unint64_t)v4);
        }
        else
        {
          uint64_t v10 = v15;
          uint64_t v11 = *v4;
          if (*v4) {
            ++*(_DWORD *)v11;
          }
          v10[v9] = v11;
          HIDWORD(v16) = v9 + 1;
        }
      }
      ++v4;
      v6 -= 8;
    }
    while (v6);
    unsigned int v4 = *(SafariShared::BookmarkAndHistoryCompletionMatch ***)a3;
    double v12 = v15;
    LODWORD(v5) = *((_DWORD *)a3 + 3);
    unint64_t v13 = v16;
  }
  else
  {
    double v12 = 0;
    unint64_t v13 = 0;
  }
  *(void *)a3 = v12;
  id v15 = v4;
  unsigned int v14 = *((_DWORD *)a3 + 2);
  *((void *)a3 + 1) = v13;
  unint64_t v16 = __PAIR64__(v5, v14);
  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v15, (void *)a2);
}

- (void)_removeMatchesThatMistookErrorTitleForPageTitleFromMatches:(void *)a3
{
  unint64_t v13 = 0;
  unint64_t v14 = 0;
  unsigned int v4 = *(void **)a3;
  uint64_t v5 = *((unsigned int *)a3 + 3);
  if (v5)
  {
    uint64_t v6 = 8 * v5;
    do
    {
      if (([(id)objc_opt_class() _matchMistookErrorTitleForPageTitleForBookmarkAndHistoryCompletionMatch:*v4] & 1) == 0)
      {
        uint64_t v7 = HIDWORD(v14);
        if (HIDWORD(v14) == v14)
        {
          WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&>((uint64_t)&v13, (unint64_t)v4);
        }
        else
        {
          char v8 = v13;
          uint64_t v9 = (_DWORD *)*v4;
          if (*v4) {
            ++*v9;
          }
          v8[v7] = v9;
          HIDWORD(v14) = v7 + 1;
        }
      }
      ++v4;
      v6 -= 8;
    }
    while (v6);
    unsigned int v4 = *(void **)a3;
    uint64_t v10 = v13;
    LODWORD(v5) = *((_DWORD *)a3 + 3);
    unint64_t v11 = v14;
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
  }
  *(void *)a3 = v10;
  unint64_t v13 = v4;
  unsigned int v12 = *((_DWORD *)a3 + 2);
  *((void *)a3 + 1) = v11;
  unint64_t v14 = __PAIR64__(v5, v12);
  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, (void *)a2);
}

- (void)_getSortedMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(void *)a5 historyMatches:(void *)a6 historyLimit:(unint64_t)a7 bookmarkMatches:(void *)a8 bookmarkLimit:(unint64_t)a9 searchParameters:(id)a10 prefixMatchesOnly:(BOOL)a11
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  v104 = a3;
  id v103 = a4;
  id v101 = a10;
  double Current = CFAbsoluteTimeGetCurrent();
  v111 = 0;
  uint64_t v112 = 0;
  v109 = 0;
  uint64_t v110 = 0;
  if (a11)
  {
    [(WBSURLCompletionDatabase *)self _getUnsortedPrefixMatchesForTypedString:v104 filterResultsUsingProfileIdentifier:v103 historyMatches:&v111 bookmarkMatches:&v109];
    unint64_t v16 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_33;
    }
    uint64_t v17 = v104[1];
    CFAbsoluteTime v18 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)uint8_t buf = 138740739;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v114 = 2048;
    *(double *)v115 = (v18 - Current) * 1000.0;
    *(_WORD *)&v115[8] = 1024;
    int v116 = HIDWORD(v112);
    __int16 v117 = 1024;
    int v118 = HIDWORD(v110);
    id v19 = "Unsorted word prefix match for typed string \"%{sensitive}@\" took %.3f milliseconds, found %d history matches"
          ", %d bookmark matches";
    goto LABEL_123;
  }
  int v20 = *((_DWORD *)a6 + 3);
  if (v20)
  {
    v111 = *(uint64_t **)a6;
    LODWORD(v112) = *((_DWORD *)a6 + 2);
    HIDWORD(v112) = v20;
    *(void *)a6 = 0;
    *((void *)a6 + 1) = 0;
    if (a5 && *((_DWORD *)a5 + 3))
    {
      uint64_t v21 = 0;
      unint64_t v22 = 0;
      do
      {
        unint64_t v23 = SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)(*(void *)a5 + 8 * v22));
        char v24 = [v23 containsBookmark];

        unint64_t v25 = *((unsigned int *)a5 + 3);
        if ((v24 & 1) == 0)
        {
          if (v22 >= v25)
          {
            __break(0xC471u);
            JUMPOUT(0x1A6CDB6ECLL);
          }
          uint64_t v26 = *(void *)a5;
          uint64_t v27 = HIDWORD(v112);
          if (HIDWORD(v112) == v112)
          {
            WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&>((uint64_t)&v111, v26 + v21);
            unint64_t v25 = *((unsigned int *)a5 + 3);
          }
          else
          {
            unint64_t v28 = v111;
            id v29 = *(_DWORD **)(v26 + 8 * v22);
            if (v29) {
              ++*v29;
            }
            v28[v27] = (uint64_t)v29;
            HIDWORD(v112) = v27 + 1;
          }
        }
        ++v22;
        v21 += 8;
      }
      while (v22 < v25);
    }
    uint64_t v30 = 0;
  }
  else
  {
    uint64_t v30 = 1;
  }
  int v31 = *((_DWORD *)a8 + 3);
  if (v31)
  {
    BOOL v32 = v109;
    v109 = *(uint64_t **)a8;
    *(void *)a8 = v32;
    uint64_t v33 = v110;
    LODWORD(v110) = *((_DWORD *)a8 + 2);
    HIDWORD(v110) = v31;
    *((void *)a8 + 1) = v33;
    if (a5 && *((_DWORD *)a5 + 3))
    {
      uint64_t v34 = 0;
      for (unint64_t i = 0; i < v38; ++i)
      {
        id v36 = SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)(*(void *)a5 + 8 * i));
        int v37 = [v36 containsBookmark];

        unint64_t v38 = *((unsigned int *)a5 + 3);
        if (v37)
        {
          if (i >= v38)
          {
            __break(0xC471u);
            goto LABEL_127;
          }
          uint64_t v39 = *(void *)a5;
          uint64_t v40 = HIDWORD(v110);
          if (HIDWORD(v110) == v110)
          {
            WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&>((uint64_t)&v109, v39 + v34);
            unint64_t v38 = *((unsigned int *)a5 + 3);
          }
          else
          {
            unint64_t v41 = v109;
            uint64_t v42 = *(_DWORD **)(v39 + 8 * i);
            if (v42) {
              ++*v42;
            }
            v41[v40] = (uint64_t)v42;
            HIDWORD(v110) = v40 + 1;
          }
        }
        v34 += 8;
      }
    }
  }
  else
  {
    uint64_t v30 = v30 | 2;
  }
  [(WBSURLCompletionDatabase *)self _getUnsortedFullTextMatchesForTypedString:v104 filterResultsUsingProfileIdentifier:v103 historyMatches:&v111 bookmarkMatches:&v109 dataTypes:v30];
  unint64_t v16 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v98 = v104[1];
    CFAbsoluteTime v99 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)uint8_t buf = 138740739;
    *(void *)&uint8_t buf[4] = v98;
    __int16 v114 = 2048;
    *(double *)v115 = (v99 - Current) * 1000.0;
    *(_WORD *)&v115[8] = 1024;
    int v116 = HIDWORD(v112);
    __int16 v117 = 1024;
    int v118 = HIDWORD(v110);
    id v19 = "Unsorted URL match for typed string \"%{sensitive}@\" took %.3f milliseconds, found %d history matches, %d bookmark matches";
LABEL_123:
    _os_log_debug_impl(&dword_1A6B5F000, v16, OS_LOG_TYPE_DEBUG, v19, buf, 0x22u);
  }
LABEL_33:

  [(WBSURLCompletionDatabase *)self _removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:&v111];
  [(WBSURLCompletionDatabase *)self _removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:&v109];
  [(WBSURLCompletionDatabase *)self _removeMatchesThatMistookErrorTitleForPageTitleFromMatches:&v111];
  if (a7 + 1 < HIDWORD(v112)) {
    unint64_t v43 = a7 + 1;
  }
  else {
    unint64_t v43 = HIDWORD(v112);
  }
  *(void *)uint8_t buf = compareCompletionMatches;
  if (v43) {
    std::__partial_sort_impl[abi:sn180100]<std::_ClassicAlgPolicy,BOOL (*&)(WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&),WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*>(v111, &v111[v43], &v111[HIDWORD(v112)], (unsigned int (**)(uint64_t *, uint64_t *))buf);
  }
  unint64_t v44 = a9;
  if (a9 + 1 < HIDWORD(v110)) {
    unint64_t v45 = a9 + 1;
  }
  else {
    unint64_t v45 = HIDWORD(v110);
  }
  *(void *)uint8_t buf = compareCompletionMatches;
  if (v45) {
    std::__partial_sort_impl[abi:sn180100]<std::_ClassicAlgPolicy,BOOL (*&)(WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&),WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*>(v109, &v109[v45], &v109[HIDWORD(v110)], (unsigned int (**)(uint64_t *, uint64_t *))buf);
  }
  uint64_t v46 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    if (HIDWORD(v112))
    {
      unint64_t v47 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        -[WBSURLCompletionDatabase _getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:]();
      }
      logMatches((uint64_t)&v111);
    }
    if (HIDWORD(v110))
    {
      uint64_t v48 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
        -[WBSURLCompletionDatabase _getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:]();
      }
      logMatches((uint64_t)&v109);
    }
  }
  if (a5)
  {
    v49 = v104;
    id v50 = v101;
    if (v49[8])
    {
      firstTopHitCandidate((uint64_t)&v111, v49, v50);
      uint64_t v52 = v51;
      firstTopHitCandidate((uint64_t)&v109, v49, v50);
      v54 = v53;
      v55 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        logCompletionMatchToDebugChannel(&cfstr_HistorymatchCa.isa, v52);
        logCompletionMatchToDebugChannel(&cfstr_BookmarkmatchC.isa, v54);
      }
      if (v52)
      {
        if (v54)
        {
          ++*(_DWORD *)v52;
          ++*(_DWORD *)v54;
          if ((int)SafariShared::BookmarkAndHistoryCompletionMatch::compare(v52, v54) >= 0) {
            v56 = v54;
          }
          else {
            v56 = v52;
          }
          WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v54);
          WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v52);
          v54 = v56;
        }
        else
        {
          v54 = v52;
        }
      }
    }
    else
    {
      v54 = 0;
    }

    *(void *)uint8_t buf = v54;
    char v108 = 0;
    int v57 = objc_opt_class();
    uint64_t v58 = *(void *)buf;
    if (*(void *)buf) {
      ++**(_DWORD **)buf;
    }
    uint64_t v106 = v58;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v60 = WeakRetained;
    if (v57) {
      [v57 _topHitFromBaseURLMatchForTopHitFromMatches:&v106 shouldReplaceTopHitFromMatches:&v108 historyMatches:&v111 bookmarkMatches:&v109 typedString:v49 searchParameters:v50 timeNow:Current completionDataSource:WeakRetained];
    }
    else {
      v107 = 0;
    }

    uint64_t v61 = v106;
    uint64_t v106 = 0;
    if (v61) {
      WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v61);
    }
    if (v107)
    {
      v105 = v107;
      logCompletionMatchToDebugChannel(&cfstr_BaseurlTophit.isa, v107);
      if (v108) {
        *(void *)uint8_t buf = 0;
      }
    }
    else
    {
      v105 = 0;
    }
    WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)a5, 0);
    uint64_t v62 = v105;
    if (v105)
    {
      uint64_t v63 = *((unsigned int *)a5 + 3);
      if (v63 == *((_DWORD *)a5 + 2))
      {
        WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,SafariShared::BookmarkAndHistoryCompletionMatch*&>((uint64_t)a5, (_DWORD **)&v105);
      }
      else
      {
        uint64_t v64 = *(void *)a5;
        ++*(_DWORD *)v105;
        *(void *)(v64 + 8 * v63) = v62;
        *((_DWORD *)a5 + 3) = v63 + 1;
      }
    }
    uint64_t v65 = *(void *)buf;
    if (*(void *)buf)
    {
      uint64_t v66 = *((unsigned int *)a5 + 3);
      if (v66 == *((_DWORD *)a5 + 2))
      {
        WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,SafariShared::BookmarkAndHistoryCompletionMatch*&>((uint64_t)a5, (_DWORD **)buf);
      }
      else
      {
        uint64_t v67 = *(void *)a5;
        ++**(_DWORD **)buf;
        *(void *)(v67 + 8 * v66) = v65;
        *((_DWORD *)a5 + 3) = v66 + 1;
      }
    }
    if (*((_DWORD *)a5 + 3))
    {
      unint64_t v68 = 0;
      while (1)
      {
        v69 = SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)(*(void *)a5 + 8 * v68));
        int v70 = [v69 containsBookmark];
        v71 = v70 ? &v109 : &v111;

        unint64_t v72 = *((unsigned int *)a5 + 3);
        if (v68 >= v72) {
          break;
        }
        if (v70) {
          uint64_t v73 = &v109;
        }
        else {
          uint64_t v73 = &v111;
        }
        uint64_t v74 = *((unsigned int *)v73 + 3);
        if (v74)
        {
          uint64_t v75 = *v71;
          uint64_t v76 = *(void *)(*(void *)a5 + 8 * v68);
          uint64_t v77 = (uint64_t)(*v71 + 1);
          uint64_t v78 = *((unsigned int *)v73 + 3);
          while (*v75 != v76)
          {
            ++v75;
            v77 += 8;
            if (!--v78) {
              goto LABEL_100;
            }
          }
          *uint64_t v75 = 0;
          if (v76)
          {
            WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v76);
            uint64_t v74 = *((unsigned int *)v73 + 3);
          }
          memmove(v75, v75 + 1, (size_t)&(*v71)[v74] - v77);
          --*((_DWORD *)v73 + 3);
          unint64_t v72 = *((unsigned int *)a5 + 3);
        }
LABEL_100:
        if (++v68 >= v72) {
          goto LABEL_101;
        }
      }
      __break(0xC471u);
LABEL_127:
      JUMPOUT(0x1A6CDB6E4);
    }
LABEL_101:
    v79 = v107;
    v107 = 0;
    if (v79) {
      WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v79);
    }
  }
  if (HIDWORD(v112) >= a7) {
    unint64_t v80 = a7;
  }
  else {
    unint64_t v80 = HIDWORD(v112);
  }
  if (HIDWORD(v112) > a7)
  {
    uint64_t v81 = &v111[v80];
    uint64_t v82 = 8 * HIDWORD(v112) - 8 * v80;
    do
    {
      uint64_t v83 = *v81;
      *uint64_t v81 = 0;
      if (v83) {
        WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v83);
      }
      ++v81;
      v82 -= 8;
    }
    while (v82);
  }
  HIDWORD(v112) = v80;
  unint64_t v84 = v109;
  if (HIDWORD(v110) < a9) {
    unint64_t v44 = HIDWORD(v110);
  }
  if (HIDWORD(v110) > a9)
  {
    v85 = &v109[v44];
    uint64_t v86 = 8 * HIDWORD(v110) - 8 * v44;
    do
    {
      uint64_t v87 = *v85;
      uint64_t *v85 = 0;
      if (v87) {
        WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v87);
      }
      ++v85;
      v86 -= 8;
    }
    while (v86);
    LODWORD(v80) = HIDWORD(v112);
    unint64_t v84 = v109;
  }
  v88 = *(uint64_t **)a6;
  *(void *)a6 = v111;
  v111 = v88;
  uint64_t v89 = *((void *)a6 + 1);
  *((_DWORD *)a6 + 2) = v112;
  *((_DWORD *)a6 + 3) = v80;
  uint64_t v112 = v89;
  int v90 = *(uint64_t **)a8;
  *(void *)a8 = v84;
  v109 = v90;
  uint64_t v91 = *((void *)a8 + 1);
  *((_DWORD *)a8 + 2) = v110;
  *((_DWORD *)a8 + 3) = v44;
  uint64_t v110 = v91;
  unint64_t v92 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
  {
    CFAbsoluteTime v95 = CFAbsoluteTimeGetCurrent();
    int v96 = *((_DWORD *)a6 + 3);
    int v97 = *((_DWORD *)a8 + 3);
    *(_DWORD *)uint8_t buf = 134218496;
    *(double *)&uint8_t buf[4] = (v95 - Current) * 1000.0;
    __int16 v114 = 1024;
    *(_DWORD *)v115 = v96;
    *(_WORD *)&v115[4] = 1024;
    *(_DWORD *)&v115[6] = v97;
    _os_log_debug_impl(&dword_1A6B5F000, v92, OS_LOG_TYPE_DEBUG, "Final sorted auto-complete query took %.3f milliseconds, found %d history matches, %d bookmark matches", buf, 0x18u);
  }

  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v109, v93);
  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v111, v94);
}

- (void)_getUnsortedFullTextMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 historyMatches:(void *)a5 bookmarkMatches:(void *)a6 dataTypes:(unsigned int)a7
{
  unsigned int v12 = (id *)a3;
  id v13 = a4;
  if ((a7 & 3) != 0)
  {
    unint64_t v38 = self->_fullTextHistoryMatchesCacheString;
    m_buffer = 0;
    uint64_t v52 = 0;
    id v37 = v13;
    if (a7)
    {
      m_buffer = self->_fullTextHistoryMatchesCache.m_buffer;
      uint64_t v52 = *(void *)&self->_fullTextHistoryMatchesCache.var0;
      self->_fullTextHistoryMatchesCache.m_buffer = 0;
      *(void *)&self->_fullTextHistoryMatchesCache.var0 = 0;
      unint64_t v14 = (NSString *)[v12[1] copy];
      fullTextHistoryMatchesCacheString = self->_fullTextHistoryMatchesCacheString;
      self->_fullTextHistoryMatchesCacheString = v14;
    }
    unint64_t v16 = self->_fullTextBookmarkMatchesCacheString;
    v49 = 0;
    uint64_t v50 = 0;
    id v36 = v16;
    if ((a7 & 2) != 0)
    {
      v49 = self->_fullTextBookmarkMatchesCache.m_buffer;
      uint64_t v50 = *(void *)&self->_fullTextBookmarkMatchesCache.var0;
      self->_fullTextBookmarkMatchesCache.m_buffer = 0;
      *(void *)&self->_fullTextBookmarkMatchesCache.var0 = 0;
      uint64_t v17 = (NSString *)[v12[1] copy];
      fullTextBookmarkMatchesCacheString = self->_fullTextBookmarkMatchesCacheString;
      self->_fullTextBookmarkMatchesCacheString = v17;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    int v20 = objc_msgSend(v12[1], "safari_hasPrefix:", v16);
    id obj = a4;
    if ([(NSString *)self->_fullTextHistoryMatchesCacheStringProfileIdentifier isEqualToString:v13])
    {
      int v22 = objc_msgSend(v12[1], "safari_hasPrefix:", v38);
    }
    else
    {
      int v22 = 0;
    }
    if ((v20 & (a7 >> 1)) == 1)
    {
      unint64_t v23 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[WBSURLCompletionDatabase _getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:].cold.4();
      }
      if (HIDWORD(v50))
      {
        unint64_t v24 = 0;
        do
          recordItemIfFullTextMatch(v49[v24++], v12, (uint64_t)a6, (uint64_t)&self->_fullTextBookmarkMatchesCache, Current);
        while (v24 < HIDWORD(v50));
      }
    }
    if ((a7 & v22) == 1)
    {
      unint64_t v25 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[WBSURLCompletionDatabase _getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:]();
      }
      if (HIDWORD(v52))
      {
        unint64_t v26 = 0;
        do
          recordItemIfFullTextMatch(m_buffer[v26++], v12, (uint64_t)a5, (uint64_t)&self->_fullTextHistoryMatchesCache, Current);
        while (v26 < HIDWORD(v52));
      }
    }
    unsigned int v27 = (v20 ^ 1) & (a7 >> 1);
    unsigned int v28 = a7 & (v22 ^ 1);
    if ((v27 & 1) == 0 && !v28) {
      goto LABEL_29;
    }
    if (v27 && (id v29 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete(), os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)))
    {
      -[WBSURLCompletionDatabase _getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:]();
      if (v28)
      {
LABEL_26:
        uint64_t v30 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[WBSURLCompletionDatabase _getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:]();
        }
      }
    }
    else if (v28)
    {
      goto LABEL_26;
    }
    objc_storeStrong((id *)&self->_fullTextHistoryMatchesCacheStringProfileIdentifier, obj);
    int v31 = [MEMORY[0x1E4F1CA60] dictionary];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __147__WBSURLCompletionDatabase__getUnsortedFullTextMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches_dataTypes___block_invoke;
    v47[3] = &unk_1E5CA0770;
    id v33 = v31;
    id v48 = v33;
    [WeakRetained enumerateMatchDataForTypedStringHint:v12 filterResultsUsingProfileIdentifier:v37 options:2 withBlock:v47];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __147__WBSURLCompletionDatabase__getUnsortedFullTextMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches_dataTypes___block_invoke_2;
    v39[3] = &unk_1E5CA0798;
    char v45 = v28;
    unint64_t v41 = self;
    uint64_t v42 = a5;
    uint64_t v40 = v12;
    double v43 = Current;
    char v46 = v27;
    unint64_t v44 = a6;
    [v33 enumerateKeysAndObjectsUsingBlock:v39];

LABEL_29:
    WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v49, v21);

    WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&m_buffer, v34);
    id v13 = v37;
  }
}

void __147__WBSURLCompletionDatabase__getUnsortedFullTextMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches_dataTypes___block_invoke(uint64_t a1, void *a2)
{
}

void __147__WBSURLCompletionDatabase__getUnsortedFullTextMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches_dataTypes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ([v6 containsBookmark])
  {
    if (!*(unsigned char *)(a1 + 73)) {
      goto LABEL_7;
    }
    unsigned int v4 = (uint64_t *)(a1 + 64);
    uint64_t v5 = 8;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 72)) {
      goto LABEL_7;
    }
    unsigned int v4 = (uint64_t *)(a1 + 48);
    uint64_t v5 = 24;
  }
  recordItemIfFullTextMatch(v6, *(void **)(a1 + 32), *v4, *(void *)(a1 + 40) + v5, *(double *)(a1 + 56));
LABEL_7:
}

- (void)_getUnsortedPrefixMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 historyMatches:(void *)a5 bookmarkMatches:(void *)a6
{
  uint64_t v10 = (id *)a3;
  id v35 = a4;
  uint64_t v34 = self->_prefixHistoryMatchesCacheString;
  Vector<id<WBSURLCompletionMatchData>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> prefixHistoryMatchesCache = self->_prefixHistoryMatchesCache;
  self->_prefixHistoryMatchesCache.m_buffer = 0;
  *(void *)&self->_prefixHistoryMatchesCache.var0 = 0;
  unint64_t v11 = (NSString *)[v10[1] copy];
  prefixHistoryMatchesCacheString = self->_prefixHistoryMatchesCacheString;
  self->_prefixHistoryMatchesCacheString = v11;

  id v13 = self->_prefixBookmarkMatchesCacheString;
  Vector<id<WBSURLCompletionMatchData>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> prefixBookmarkMatchesCache = self->_prefixBookmarkMatchesCache;
  self->_prefixBookmarkMatchesCache.m_buffer = 0;
  *(void *)&self->_prefixBookmarkMatchesCache.var0 = 0;
  id v33 = v13;
  unint64_t v14 = (NSString *)[v10[1] copy];
  prefixBookmarkMatchesCacheString = self->_prefixBookmarkMatchesCacheString;
  self->_prefixBookmarkMatchesCacheString = v14;

  double Current = CFAbsoluteTimeGetCurrent();
  int v17 = objc_msgSend(v10[1], "safari_hasPrefix:", v13);
  if ([(NSString *)self->_prefixHistoryMatchesCacheProfileIdentifier isEqualToString:v35])
  {
    int v18 = objc_msgSend(v10[1], "safari_hasPrefix:", v34);
    char v19 = v18;
    if ((v17 & 1) == 0)
    {
      if (v18) {
        goto LABEL_16;
      }
LABEL_14:
      char v22 = 1;
      char v23 = 1;
      goto LABEL_23;
    }
  }
  else
  {
    char v19 = 0;
    if (!v17) {
      goto LABEL_14;
    }
  }
  int v20 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[WBSURLCompletionDatabase _getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:].cold.4();
  }
  if (prefixBookmarkMatchesCache.m_size)
  {
    unint64_t v21 = 0;
    do
      recordItemIfPrefixMatch((uint64_t)prefixBookmarkMatchesCache.m_buffer[v21++], v10, (uint64_t)a6, (uint64_t)&self->_prefixBookmarkMatchesCache, Current);
    while (v21 < prefixBookmarkMatchesCache.m_size);
    if ((v19 & 1) == 0)
    {
      char v22 = v17 ^ 1;
      char v23 = 1;
      if (v17) {
        goto LABEL_27;
      }
      char v19 = 0;
      goto LABEL_23;
    }
  }
  else if ((v19 & 1) == 0)
  {
    char v22 = 0;
    char v23 = 1;
    goto LABEL_27;
  }
LABEL_16:
  unint64_t v24 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[WBSURLCompletionDatabase _getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:]();
  }
  if (prefixHistoryMatchesCache.m_size)
  {
    unint64_t v26 = 0;
    do
      recordItemIfPrefixMatch((uint64_t)prefixHistoryMatchesCache.m_buffer[v26++], v10, (uint64_t)a5, (uint64_t)&self->_prefixHistoryMatchesCache, Current);
    while (v26 < prefixHistoryMatchesCache.m_size);
  }
  if ((v17 & 1) == 0)
  {
    char v23 = 0;
    char v19 = 1;
    char v22 = 1;
LABEL_23:
    unsigned int v27 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      -[WBSURLCompletionDatabase _getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:]();
      if (v19) {
        goto LABEL_29;
      }
    }
    else if (v19)
    {
LABEL_29:
      objc_storeStrong((id *)&self->_prefixHistoryMatchesCacheProfileIdentifier, a4);
      id v29 = [MEMORY[0x1E4F1CA60] dictionary];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __135__WBSURLCompletionDatabase__getUnsortedPrefixMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches___block_invoke;
      v44[3] = &unk_1E5CA0770;
      id v31 = v29;
      id v45 = v31;
      [WeakRetained enumerateMatchDataForTypedStringHint:v10 filterResultsUsingProfileIdentifier:v35 options:1 withBlock:v44];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __135__WBSURLCompletionDatabase__getUnsortedPrefixMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches___block_invoke_2;
      v36[3] = &unk_1E5CA0798;
      char v42 = v23;
      unint64_t v38 = self;
      uint64_t v39 = a5;
      id v37 = v10;
      double v40 = Current;
      char v43 = v22;
      unint64_t v41 = a6;
      [v31 enumerateKeysAndObjectsUsingBlock:v36];

      goto LABEL_30;
    }
LABEL_27:
    unsigned int v28 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[WBSURLCompletionDatabase _getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:]();
    }
    goto LABEL_29;
  }
LABEL_30:
  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&prefixBookmarkMatchesCache, v25);

  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&prefixHistoryMatchesCache, v32);
}

void __135__WBSURLCompletionDatabase__getUnsortedPrefixMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches___block_invoke(uint64_t a1, void *a2)
{
}

void __135__WBSURLCompletionDatabase__getUnsortedPrefixMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ([v6 containsBookmark])
  {
    if (!*(unsigned char *)(a1 + 73)) {
      goto LABEL_7;
    }
    unsigned int v4 = (uint64_t *)(a1 + 64);
    uint64_t v5 = 40;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 72)) {
      goto LABEL_7;
    }
    unsigned int v4 = (uint64_t *)(a1 + 48);
    uint64_t v5 = 56;
  }
  recordItemIfPrefixMatch((uint64_t)v6, *(void **)(a1 + 32), *v4, *(void *)(a1 + 40) + v5, *(double *)(a1 + 56));
LABEL_7:
}

- (WBSURLCompletionDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (WBSURLCompletionDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_fullTextHistoryMatchesCacheStringProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_prefixHistoryMatchesCacheProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_prefixHistoryMatchesCacheString, 0);
  objc_storeStrong((id *)&self->_prefixBookmarkMatchesCacheString, 0);
  objc_storeStrong((id *)&self->_fullTextHistoryMatchesCacheString, 0);
  objc_storeStrong((id *)&self->_fullTextBookmarkMatchesCacheString, 0);
  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_prefixHistoryMatchesCache, v3);
  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_prefixBookmarkMatchesCache, v4);
  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_fullTextHistoryMatchesCache, v5);
  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_fullTextBookmarkMatchesCache, v6);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:.cold.1()
{
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_2_3(&dword_1A6B5F000, v0, v1, "No matches for \"%{sensitive}@\"", v2, v3, v4, v5, v6);
}

- (void)getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:.cold.2()
{
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_2_3(&dword_1A6B5F000, v0, v1, "Combined history and bookmark matches for \"%{sensitive}@\":", v2, v3, v4, v5, v6);
}

- (void)clearBookmarkMatchesCachesKeepingEmptyValues:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_topHitFromBaseURLMatchForTopHitFromMatches:(os_log_t)log shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 141558275;
  *(void *)(buf + 4) = 1752392040;
  *((_WORD *)buf + 6) = 2117;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Best match in URL autocomplete list is not a URL: %{sensitive, mask.hash}@", buf, 0x16u);
}

+ (void)_topHitFromBaseURLMatchForTopHitFromMatches:(NSObject *)a1 shouldReplaceTopHitFromMatches:(uint64_t)a2 historyMatches:(uint64_t)a3 bookmarkMatches:(uint64_t)a4 typedString:(uint64_t)a5 searchParameters:(uint64_t)a6 timeNow:(uint64_t)a7 completionDataSource:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_topHitFromBaseURLMatchForTopHitFromMatches:(os_log_t)log shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:.cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Found redirection result of baseURL in History matches.", buf, 2u);
}

- (void)_removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:(void *)a3 .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 138739971;
  *a3 = a1;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Excluding title match that looks like a URL: \"%{sensitive}@\":", buf, 0xCu);
}

- (void)_getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:.cold.1()
{
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_2_3(&dword_1A6B5F000, v0, v1, "Bookmark matches for \"%{sensitive}@\":", v2, v3, v4, v5, v6);
}

- (void)_getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:.cold.2()
{
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_2_3(&dword_1A6B5F000, v0, v1, "History matches for \"%{sensitive}@\":", v2, v3, v4, v5, v6);
}

- (void)_getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:.cold.1()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "typed string \"%{sensitive}@\" is not an extension of cached string \"%{sensitive}@\", so checking full text of all history items");
}

- (void)_getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:.cold.2()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "typed string \"%{sensitive}@\" is not an extension of cached string \"%{sensitive}@\", so checking full text of all bookmarks");
}

- (void)_getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:.cold.3()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "typed string \"%{sensitive}@\" is an extension of cached string \"%{sensitive}@\", so using full-text cache for history items");
}

- (void)_getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:.cold.4()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "typed string \"%{sensitive}@\" is an extension of cached string \"%{sensitive}@\", so using full-text cache for bookmarks");
}

- (void)_getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:.cold.1()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "typed string \"%{sensitive}@\" is not an extension of cached string \"%{sensitive}@\", so checking word prefixes of all history items");
}

- (void)_getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:.cold.2()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "typed string \"%{sensitive}@\" is not an extension of cached string \"%{sensitive}@\", so checking word prefixes of all bookmarks");
}

- (void)_getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:.cold.3()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "typed string \"%{sensitive}@\" is an extension of cached string \"%{sensitive}@\", so using prefix cache for history items");
}

- (void)_getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:.cold.4()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_8(&dword_1A6B5F000, v0, v1, "typed string \"%{sensitive}@\" is an extension of cached string \"%{sensitive}@\", so using prefix cache for bookmarks");
}

@end