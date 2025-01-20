@interface SFURLCompletionMatchBookmarkData
- (BOOL)containsBookmark;
- (BOOL)containsReadingListItem;
- (BOOL)lastVisitWasFailure;
- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4;
- (BOOL)onlyContainsCloudTab;
- (BOOL)shouldPreload;
- (BOOL)visitWasClientError;
- (NSString)cloudTabDeviceName;
- (NSString)originalURLString;
- (SFURLCompletionMatchBookmarkData)initWithBookmark:(id)a3;
- (SFURLCompletionMatchBookmarkData)initWithBookmark:(id)a3 shouldPreload:(BOOL)a4;
- (SFURLCompletionMatchBookmarkData)initWithCloudTab:(id)a3 deviceName:(id)a4;
- (WebBookmark)bookmark;
- (double)lastVisitedTimeInterval;
- (float)_topSitesScoreAtTime:(double)a3;
- (id)_userVisibleURLString;
- (id)matchDataByMergingWithMatchData:(id)a3;
- (id)pageTitleAtIndex:(unint64_t)a3;
- (id)pageTitleForUserVisibleURLStringAtIndex:(unint64_t)a3;
- (int64_t)visitCountScoreForPageTitleAtTime;
- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3;
- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3;
- (void)enumeratePageTitlesUsingBlock:(id)a3;
- (void)enumerateUserVisibleURLsUsingBlock:(id)a3;
@end

@implementation SFURLCompletionMatchBookmarkData

- (SFURLCompletionMatchBookmarkData)initWithBookmark:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFURLCompletionMatchBookmarkData;
  v6 = [(SFURLCompletionMatchBookmarkData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bookmark, a3);
    v7->_shouldPreload = [(WebBookmark *)v7->_bookmark isBuiltinBookmark] ^ 1;
    v7->_onlyContainsCloudTab = 0;
    v8 = v7;
  }

  return v7;
}

- (SFURLCompletionMatchBookmarkData)initWithCloudTab:(id)a3 deviceName:(id)a4
{
  id v7 = a4;
  v8 = [(SFURLCompletionMatchBookmarkData *)self initWithBookmark:a3];
  v9 = v8;
  if (v8)
  {
    v8->_onlyContainsCloudTab = 1;
    objc_storeStrong((id *)&v8->_cloudTabDeviceName, a4);
    objc_super v10 = v9;
  }

  return v9;
}

- (SFURLCompletionMatchBookmarkData)initWithBookmark:(id)a3 shouldPreload:(BOOL)a4
{
  id v5 = [(SFURLCompletionMatchBookmarkData *)self initWithBookmark:a3];
  v6 = v5;
  if (v5)
  {
    v5->_shouldPreload |= a4;
    id v7 = v5;
  }

  return v6;
}

- (id)_userVisibleURLString
{
  v2 = [(WebBookmark *)self->_bookmark address];
  if (objc_msgSend(v2, "_web_isUserVisibleURL"))
  {
    id v3 = v2;
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithDataAsString:", v2);
    objc_msgSend(v4, "_web_userVisibleString");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (NSString)originalURLString
{
  return (NSString *)[(WebBookmark *)self->_bookmark address];
}

- (id)pageTitleAtIndex:(unint64_t)a3
{
  return (id)[(WebBookmark *)self->_bookmark title];
}

- (id)pageTitleForUserVisibleURLStringAtIndex:(unint64_t)a3
{
  return (id)[(WebBookmark *)self->_bookmark title];
}

- (BOOL)containsBookmark
{
  return !self->_onlyContainsCloudTab;
}

- (BOOL)containsReadingListItem
{
  return [(WebBookmark *)self->_bookmark isReadingListItem];
}

- (double)lastVisitedTimeInterval
{
  if (![(WebBookmark *)self->_bookmark isReadingListItem]) {
    return 0.0;
  }
  id v3 = [(WebBookmark *)self->_bookmark dateLastViewed];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return v5;
}

- (BOOL)lastVisitWasFailure
{
  return [(WebBookmark *)self->_bookmark isReadingListItem];
}

- (BOOL)visitWasClientError
{
  return 0;
}

- (id)matchDataByMergingWithMatchData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = [SFURLCompletionMatchBookmarkListData alloc];
  if (isKindOfClass) {
    uint64_t v7 = [(SFURLCompletionMatchBookmarkListData *)v6 initWithBookmarkData:self andBookmarkData:v4];
  }
  else {
    uint64_t v7 = [(SFURLCompletionMatchBookmarkListData *)v6 initWithBookmarkData:self historyMatchData:v4];
  }
  v8 = (void *)v7;

  return v8;
}

- (void)enumeratePageTitlesUsingBlock:(id)a3
{
  char v7 = 0;
  bookmark = self->_bookmark;
  id v5 = a3;
  v6 = [(WebBookmark *)bookmark title];
  (*((void (**)(id, void *, void, char *))a3 + 2))(v5, v6, 0, &v7);
}

- (void)enumerateUserVisibleURLsUsingBlock:(id)a3
{
  char v7 = 0;
  id v5 = a3;
  v6 = [(SFURLCompletionMatchBookmarkData *)self _userVisibleURLString];
  (*((void (**)(id, void *, void, char *))a3 + 2))(v5, v6, 0, &v7);
}

- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3
{
  char v9 = 0;
  bookmark = self->_bookmark;
  id v6 = a3;
  char v7 = [(WebBookmark *)bookmark title];
  v8 = [(SFURLCompletionMatchBookmarkData *)self _userVisibleURLString];
  (*((void (**)(id, void *, void, void *, void, char *))a3 + 2))(v6, v7, 0, v8, 0, &v9);
}

- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4
{
  return 0;
}

- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3
{
  return -1;
}

- (int64_t)visitCountScoreForPageTitleAtTime
{
  return -1;
}

- (float)_topSitesScoreAtTime:(double)a3
{
  float v4 = 0.0;
  if ([(WebBookmark *)self->_bookmark isReadingListItem])
  {
    id v5 = [(WebBookmark *)self->_bookmark dateLastViewed];
    id v6 = v5;
    if (v5)
    {
      [v5 timeIntervalSinceReferenceDate];
    }
    else
    {
      char v7 = [(WebBookmark *)self->_bookmark dateAdded];
      if (!v7)
      {
LABEL_7:

        return v4;
      }
      v8 = v7;
      [v7 timeIntervalSinceReferenceDate];
    }
    char v9 = [(WebBookmark *)self->_bookmark address];
    WBSTopSitesScore();
    float v4 = v10;

    goto LABEL_7;
  }
  return v4;
}

- (BOOL)shouldPreload
{
  return self->_shouldPreload;
}

- (BOOL)onlyContainsCloudTab
{
  return self->_onlyContainsCloudTab;
}

- (NSString)cloudTabDeviceName
{
  return self->_cloudTabDeviceName;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);

  objc_storeStrong((id *)&self->_cloudTabDeviceName, 0);
}

@end