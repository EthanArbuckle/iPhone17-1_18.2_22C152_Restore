@interface WBSHistoryURLCompletionMatchData
- (BOOL)containsBookmark;
- (BOOL)lastVisitWasFailure;
- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4;
- (BOOL)shouldPreload;
- (BOOL)visitWasClientError;
- (NSString)originalURLString;
- (WBSHistoryURLCompletionMatchData)init;
- (WBSHistoryURLCompletionMatchData)initWithCompletionItem:(void *)a3;
- (double)lastVisitedTimeInterval;
- (float)topSitesScoreForPageTitleAtTime:(double)a3;
- (float)topSitesScoreForURLStringAtIndex:(unint64_t)a3 atTime:(double)a4;
- (id).cxx_construct;
- (id)pageTitleAtIndex:(unint64_t)a3;
- (id)pageTitleForUserVisibleURLStringAtIndex:(unint64_t)a3;
- (id)userVisibleURLStringAtIndex:(unint64_t)a3;
- (id)userVisibleURLStringForPageTitleAtIndex:(unint64_t)a3;
- (int64_t)visitCount;
- (int64_t)visitCountScore;
- (int64_t)visitCountScoreForPageTitleAtTime;
- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3;
- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3;
- (void)enumeratePageTitlesUsingBlock:(id)a3;
- (void)enumerateUserVisibleURLsUsingBlock:(id)a3;
@end

@implementation WBSHistoryURLCompletionMatchData

- (WBSHistoryURLCompletionMatchData)init
{
  return 0;
}

- (WBSHistoryURLCompletionMatchData)initWithCompletionItem:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WBSHistoryURLCompletionMatchData;
  v4 = [(WBSHistoryURLCompletionMatchData *)&v9 init];
  v5 = v4;
  if (v4)
  {
    if (a3) {
      atomic_fetch_add((atomic_uint *volatile)a3, 1u);
    }
    uint64_t m_ptr = (uint64_t)v4->_item.m_ptr;
    v5->_item.uint64_t m_ptr = (HistoryURLCompletionItem *)a3;
    if (m_ptr) {
      WTF::ThreadSafeRefCounted<SafariShared::HistoryURLCompletionItem,(WTF::DestructionThread)0>::deref(m_ptr);
    }
    v7 = v5;
  }

  return v5;
}

- (BOOL)shouldPreload
{
  return *((unsigned char *)self->_item.m_ptr + 161);
}

- (NSString)originalURLString
{
  return (NSString *)*((id *)self->_item.m_ptr + 8);
}

- (id)userVisibleURLStringAtIndex:(unint64_t)a3
{
  uint64_t m_ptr = self->_item.m_ptr;
  if (!a3) {
    goto LABEL_4;
  }
  v5 = (char *)m_ptr + 32;
  uint64_t v4 = *((void *)m_ptr + 4);
  if (a3 - 1 < (*((void *)v5 + 1) - v4) >> 3)
  {
    uint64_t m_ptr = *(HistoryURLCompletionItem **)(v4 + 8 * (a3 - 1));
LABEL_4:
    v6 = objc_msgSend(*((id *)m_ptr + 8), "safari_userVisibleURL");
    goto LABEL_6;
  }
  v6 = 0;
LABEL_6:
  return v6;
}

- (id)userVisibleURLStringForPageTitleAtIndex:(unint64_t)a3
{
  v3 = objc_msgSend(*((id *)self->_item.m_ptr + 8), "safari_userVisibleURL", a3);
  return v3;
}

- (id)pageTitleForUserVisibleURLStringAtIndex:(unint64_t)a3
{
  return *((id *)self->_item.m_ptr + 9);
}

- (id)pageTitleAtIndex:(unint64_t)a3
{
  return *((id *)self->_item.m_ptr + 9);
}

- (void)enumerateUserVisibleURLsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void, char *))a3;
  char v15 = 0;
  id v5 = *((id *)self->_item.m_ptr + 8);
  v6 = objc_msgSend(v5, "safari_userVisibleURL");
  v4[2](v4, v6, 0, &v15);

  if (!v15)
  {
    uint64_t m_ptr = self->_item.m_ptr;
    uint64_t v8 = *((void *)m_ptr + 4);
    uint64_t v9 = *((void *)m_ptr + 5);
    if (v8 != v9)
    {
      uint64_t v10 = v8 + 8;
      uint64_t v11 = 1;
      do
      {
        id v12 = *(id *)(*(void *)(v10 - 8) + 64);
        v13 = objc_msgSend(v12, "safari_userVisibleURL");
        v4[2](v4, v13, v11, &v15);

        if (v15) {
          break;
        }
        ++v11;
        BOOL v14 = v10 == v9;
        v10 += 8;
      }
      while (!v14);
    }
  }
}

- (void)enumeratePageTitlesUsingBlock:(id)a3
{
  v3 = (void (*)(void))*((void *)a3 + 2);
  id v4 = a3;
  v3();
}

- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__WBSHistoryURLCompletionMatchData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke;
  v6[3] = &unk_1E5C9DAB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSHistoryURLCompletionMatchData *)self enumerateUserVisibleURLsUsingBlock:v6];
}

uint64_t __84__WBSHistoryURLCompletionMatchData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 72), 0, a2, a3, a4);
}

- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t m_ptr = self->_item.m_ptr;
  id v7 = (void *)*((void *)m_ptr + 9);
  uint64_t v8 = *((void *)m_ptr + 18);
  id v9 = *((id *)m_ptr + 8);
  id v10 = v7;
  LOBYTE(v4) = +[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:a3 title:v10 urlString:v9 autoCompleteTriggers:v8 isStrengthened:v4];

  return v4;
}

- (float)topSitesScoreForURLStringAtIndex:(unint64_t)a3 atTime:(double)a4
{
  return WBSTopSitesScore();
}

- (float)topSitesScoreForPageTitleAtTime:(double)a3
{
  return WBSTopSitesScore();
}

- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3
{
  return *((void *)self->_item.m_ptr + 19);
}

- (int64_t)visitCountScoreForPageTitleAtTime
{
  return *((void *)self->_item.m_ptr + 19);
}

- (BOOL)containsBookmark
{
  return *((unsigned char *)self->_item.m_ptr + 162);
}

- (double)lastVisitedTimeInterval
{
  return *((double *)self->_item.m_ptr + 10);
}

- (BOOL)lastVisitWasFailure
{
  return *((unsigned char *)self->_item.m_ptr + 160) == 0;
}

- (int64_t)visitCount
{
  return *((int *)self->_item.m_ptr + 22);
}

- (int64_t)visitCountScore
{
  return *((void *)self->_item.m_ptr + 19);
}

- (BOOL)visitWasClientError
{
  return *((unsigned char *)self->_item.m_ptr + 163);
}

- (void).cxx_destruct
{
  uint64_t m_ptr = self->_item.m_ptr;
  self->_item.uint64_t m_ptr = 0;
  if (m_ptr) {
    WTF::ThreadSafeRefCounted<SafariShared::HistoryURLCompletionItem,(WTF::DestructionThread)0>::deref((uint64_t)m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end