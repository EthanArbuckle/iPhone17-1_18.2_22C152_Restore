@interface SFURLCompletionMatchBookmarkListData
- (BOOL)containsBookmark;
- (BOOL)containsReadingListItem;
- (BOOL)lastVisitWasFailure;
- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4;
- (BOOL)onlyContainsCloudTab;
- (BOOL)shouldPreload;
- (BOOL)visitWasClientError;
- (NSString)cloudTabDeviceName;
- (NSString)originalURLString;
- (SFURLCompletionMatchBookmarkListData)initWithBookmarkData:(id)a3 andBookmarkData:(id)a4;
- (SFURLCompletionMatchBookmarkListData)initWithBookmarkData:(id)a3 historyMatchData:(id)a4;
- (double)lastVisitedTimeInterval;
- (float)topSitesScoreForPageTitleAtTime:(double)a3;
- (float)topSitesScoreForURLStringAtIndex:(unint64_t)a3 atTime:(double)a4;
- (id)_bookmarkUserVisibleURLString;
- (id)_historyItemUserVisibleURLString;
- (id)bookmark;
- (id)matchDataByMergingWithMatchData:(id)a3;
- (id)pageTitleAtIndex:(unint64_t)a3;
- (id)pageTitleForUserVisibleURLStringAtIndex:(unint64_t)a3;
- (id)userVisibleURLStringAtIndex:(unint64_t)a3;
- (id)userVisibleURLStringForPageTitleAtIndex:(unint64_t)a3;
- (int64_t)visitCountScoreForPageTitleAtTime;
- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3;
- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3;
- (void)enumeratePageTitlesUsingBlock:(id)a3;
- (void)enumerateUserVisibleURLsUsingBlock:(id)a3;
@end

@implementation SFURLCompletionMatchBookmarkListData

- (BOOL)shouldPreload
{
  historyMatchData = self->_historyMatchData;
  if (historyMatchData)
  {
    return [(WBSURLCompletionMatchData *)historyMatchData shouldPreload];
  }
  else
  {
    v5 = [(NSMutableArray *)self->_bookmarks firstObject];
    char v6 = [v5 isBuiltinBookmark] ^ 1;

    return v6;
  }
}

- (SFURLCompletionMatchBookmarkListData)initWithBookmarkData:(id)a3 historyMatchData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFURLCompletionMatchBookmarkListData;
  v8 = [(SFURLCompletionMatchBookmarkListData *)&v15 init];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v10 = [v6 bookmark];
    uint64_t v11 = objc_msgSend(v9, "initWithObjects:", v10, 0);
    bookmarks = v8->_bookmarks;
    v8->_bookmarks = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v8->_historyMatchData, a4);
    v8->_onlyContainsCloudTab = 0;
    v8->_containsBookmark = [v6 onlyContainsCloudTab] ^ 1;
    v8->_containsReadingListItem = [v6 containsReadingListItem];
    v13 = v8;
  }

  return v8;
}

- (SFURLCompletionMatchBookmarkListData)initWithBookmarkData:(id)a3 andBookmarkData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SFURLCompletionMatchBookmarkListData;
  v8 = [(SFURLCompletionMatchBookmarkListData *)&v19 init];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v10 = [v6 bookmark];
    uint64_t v11 = [v7 bookmark];
    uint64_t v12 = objc_msgSend(v9, "initWithObjects:", v10, v11, 0);
    bookmarks = v8->_bookmarks;
    v8->_bookmarks = (NSMutableArray *)v12;

    int v14 = [v6 onlyContainsCloudTab];
    if (v14) {
      LOBYTE(v14) = [v7 onlyContainsCloudTab];
    }
    v8->_onlyContainsCloudTab = v14;
    v8->_containsBookmark = v14 ^ 1;
    v8->_containsReadingListItem = [v6 containsReadingListItem];
    uint64_t v15 = [v6 cloudTabDeviceName];
    cloudTabDeviceName = v8->_cloudTabDeviceName;
    v8->_cloudTabDeviceName = (NSString *)v15;

    v17 = v8;
  }

  return v8;
}

- (id)bookmark
{
  return (id)[(NSMutableArray *)self->_bookmarks objectAtIndex:0];
}

- (id)_bookmarkUserVisibleURLString
{
  v2 = [(NSMutableArray *)self->_bookmarks lastObject];
  v3 = [v2 address];

  if (objc_msgSend(v3, "_web_isUserVisibleURL"))
  {
    id v4 = v3;
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithDataAsString:", v3);
    objc_msgSend(v5, "_web_userVisibleString");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_historyItemUserVisibleURLString
{
  return (id)[(WBSURLCompletionMatchData *)self->_historyMatchData userVisibleURLStringAtIndex:0];
}

- (NSString)originalURLString
{
  historyMatchData = self->_historyMatchData;
  if (historyMatchData)
  {
    id v4 = [(WBSURLCompletionMatchData *)historyMatchData originalURLString];
  }
  else
  {
    v5 = [(NSMutableArray *)self->_bookmarks lastObject];
    id v4 = [v5 address];
  }

  return (NSString *)v4;
}

- (id)pageTitleAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableArray *)self->_bookmarks count];
  if (v5 <= a3)
  {
    if (v5 == a3)
    {
      id v7 = [(WBSURLCompletionMatchData *)self->_historyMatchData pageTitleAtIndex:0];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v6 = [(NSMutableArray *)self->_bookmarks objectAtIndex:a3];
    id v7 = [v6 title];
  }

  return v7;
}

- (id)userVisibleURLStringForPageTitleAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSMutableArray *)self->_bookmarks count];
  if (v5 <= a3)
  {
    if (v5 == a3 && self->_historyMatchData)
    {
      id v6 = [(SFURLCompletionMatchBookmarkListData *)self _historyItemUserVisibleURLString];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = [(SFURLCompletionMatchBookmarkListData *)self _bookmarkUserVisibleURLString];
  }

  return v6;
}

- (id)userVisibleURLStringAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_bookmarks count];
  if (a3)
  {
    historyMatchData = self->_historyMatchData;
LABEL_3:
    id v7 = [(WBSURLCompletionMatchData *)historyMatchData userVisibleURLStringAtIndex:a3];
    goto LABEL_8;
  }
  if (v5)
  {
    id v7 = [(SFURLCompletionMatchBookmarkListData *)self _bookmarkUserVisibleURLString];
  }
  else
  {
    if (!self->_historyMatchData)
    {
      historyMatchData = 0;
      goto LABEL_3;
    }
    id v7 = [(SFURLCompletionMatchBookmarkListData *)self _historyItemUserVisibleURLString];
  }
LABEL_8:

  return v7;
}

- (id)pageTitleForUserVisibleURLStringAtIndex:(unint64_t)a3
{
  if (a3 || ![(NSMutableArray *)self->_bookmarks count])
  {
    id v4 = [(WBSURLCompletionMatchData *)self->_historyMatchData pageTitleAtIndex:0];
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_bookmarks firstObject];
    id v4 = [v5 title];
  }

  return v4;
}

- (double)lastVisitedTimeInterval
{
  historyMatchData = self->_historyMatchData;
  if (!historyMatchData) {
    return 0.0;
  }
  [(WBSURLCompletionMatchData *)historyMatchData lastVisitedTimeInterval];
  return result;
}

- (BOOL)lastVisitWasFailure
{
  historyMatchData = self->_historyMatchData;
  if (historyMatchData) {
    LOBYTE(historyMatchData) = [(WBSURLCompletionMatchData *)historyMatchData lastVisitWasFailure];
  }
  return (char)historyMatchData;
}

- (BOOL)visitWasClientError
{
  historyMatchData = self->_historyMatchData;
  if (historyMatchData) {
    LOBYTE(historyMatchData) = [(WBSURLCompletionMatchData *)historyMatchData visitWasClientError];
  }
  return (char)historyMatchData;
}

- (id)matchDataByMergingWithMatchData:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    bookmarks = self->_bookmarks;
    v8 = [v6 bookmark];
    [(NSMutableArray *)bookmarks addObject:v8];

    if (self->_containsBookmark) {
      char v9 = 1;
    }
    else {
      char v9 = [v6 containsBookmark];
    }
    self->_containsBookmark = v9;
    if (self->_onlyContainsCloudTab) {
      char v11 = [v6 onlyContainsCloudTab];
    }
    else {
      char v11 = 0;
    }
    self->_onlyContainsCloudTab = v11;
    self->_containsReadingListItem = [v6 containsReadingListItem];
    uint64_t v12 = self;
  }
  else
  {
    if (!self->_historyMatchData)
    {
      objc_storeStrong((id *)&self->_historyMatchData, a3);
      self->_onlyContainsCloudTab = 0;
    }
    v10 = self;
  }

  return self;
}

- (void)enumeratePageTitlesUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, char *))a3;
  char v10 = 0;
  uint64_t v5 = [(NSMutableArray *)self->_bookmarks count];
  if (v5)
  {
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(NSMutableArray *)self->_bookmarks objectAtIndex:v6];
      v8 = [v7 title];
      v4[2](v4, v8, v6, &v10);

      if (v10) {
        break;
      }
      if (v5 == ++v6) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    char v9 = [(WBSURLCompletionMatchData *)self->_historyMatchData pageTitleAtIndex:0];
    if (v9) {
      v4[2](v4, v9, v5, &v10);
    }
  }
}

- (void)enumerateUserVisibleURLsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void, char *))a3;
  uint64_t v5 = [(NSMutableArray *)self->_bookmarks count];
  char v8 = 0;
  if (v5)
  {
    uint64_t v6 = [(SFURLCompletionMatchBookmarkListData *)self _bookmarkUserVisibleURLString];
  }
  else
  {
    if (!self->_historyMatchData) {
      goto LABEL_6;
    }
    uint64_t v6 = [(SFURLCompletionMatchBookmarkListData *)self _historyItemUserVisibleURLString];
  }
  id v7 = (void *)v6;
  v4[2](v4, v6, 0, &v8);

LABEL_6:
  if (!v8) {
    [(WBSURLCompletionMatchData *)self->_historyMatchData enumerateUserVisibleURLsUsingBlock:v4];
  }
}

- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, void *, void, char *))a3;
  char v14 = 0;
  uint64_t v5 = [(NSMutableArray *)self->_bookmarks count];
  if (v5)
  {
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(NSMutableArray *)self->_bookmarks objectAtIndexedSubscript:v6];
      char v8 = [v7 title];
      char v9 = [(SFURLCompletionMatchBookmarkListData *)self _bookmarkUserVisibleURLString];
      v4[2](v4, v8, v6, v9, 0, &v14);

      if (v14) {
        break;
      }
      if (v5 == ++v6) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    historyMatchData = self->_historyMatchData;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__SFURLCompletionMatchBookmarkListData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke;
    v11[3] = &unk_1E54EACD8;
    v11[4] = self;
    uint64_t v12 = v4;
    uint64_t v13 = v5;
    [(WBSURLCompletionMatchData *)historyMatchData enumeratePageTitlesAndUserVisibleURLsUsingBlock:v11];
  }
}

void __88__SFURLCompletionMatchBookmarkListData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = a1[5];
  char v10 = *(void **)(a1[4] + 16);
  id v11 = a4;
  id v12 = [v10 pageTitleAtIndex:0];
  (*(void (**)(uint64_t, id, void, id, uint64_t, uint64_t))(v9 + 16))(v9, v12, a1[6], v11, a5, a6);
}

- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4
{
  return [(WBSURLCompletionMatchData *)self->_historyMatchData matchesAutocompleteTrigger:a3 isStrengthened:a4];
}

- (float)topSitesScoreForURLStringAtIndex:(unint64_t)a3 atTime:(double)a4
{
  historyMatchData = self->_historyMatchData;
  if (a3)
  {
    unint64_t v5 = a3 - 1;
LABEL_3:
    [(WBSURLCompletionMatchData *)historyMatchData topSitesScoreForURLStringAtIndex:v5 atTime:a4];
    return result;
  }
  if (historyMatchData)
  {
    unint64_t v5 = 0;
    goto LABEL_3;
  }
  return 0.0;
}

- (float)topSitesScoreForPageTitleAtTime:(double)a3
{
  [(WBSURLCompletionMatchData *)self->_historyMatchData topSitesScoreForPageTitleAtTime:a3];
  return result;
}

- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3
{
  historyMatchData = self->_historyMatchData;
  if (a3)
  {
    unint64_t v4 = a3 - 1;
    return [(WBSURLCompletionMatchData *)historyMatchData visitCountScoreForURLStringAtIndex:v4];
  }
  if (historyMatchData)
  {
    unint64_t v4 = 0;
    return [(WBSURLCompletionMatchData *)historyMatchData visitCountScoreForURLStringAtIndex:v4];
  }
  return -1;
}

- (int64_t)visitCountScoreForPageTitleAtTime
{
  return [(WBSURLCompletionMatchData *)self->_historyMatchData visitCountScoreForPageTitleAtTime];
}

- (BOOL)onlyContainsCloudTab
{
  return self->_onlyContainsCloudTab;
}

- (BOOL)containsBookmark
{
  return self->_containsBookmark;
}

- (BOOL)containsReadingListItem
{
  return self->_containsReadingListItem;
}

- (NSString)cloudTabDeviceName
{
  return self->_cloudTabDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudTabDeviceName, 0);
  objc_storeStrong((id *)&self->_historyMatchData, 0);

  objc_storeStrong((id *)&self->_bookmarks, 0);
}

@end