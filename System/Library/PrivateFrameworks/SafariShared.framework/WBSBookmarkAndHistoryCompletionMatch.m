@interface WBSBookmarkAndHistoryCompletionMatch
- (BOOL)containsBookmark;
- (BOOL)containsReadingListItem;
- (BOOL)matchesAutocompleteTrigger;
- (BOOL)onlyContainsCloudTab;
- (WBSBookmarkAndHistoryCompletionMatch)initWithBookmarkAndHistoryCompletionMatch:(void *)a3 userInput:(id)a4 forQueryID:(int64_t)a5;
- (WBSURLCompletionMatchData)data;
- (double)lastVisitTimeInterval;
- (float)topSitesScore;
- (float)weight;
- (id).cxx_construct;
- (id)cloudTabDeviceName;
- (id)originalURLString;
- (id)parsecDomainIdentifier;
- (id)title;
- (id)userVisibleURLString;
- (id)uuidString;
- (int64_t)visitCountScore;
@end

@implementation WBSBookmarkAndHistoryCompletionMatch

- (WBSBookmarkAndHistoryCompletionMatch)initWithBookmarkAndHistoryCompletionMatch:(void *)a3 userInput:(id)a4 forQueryID:(int64_t)a5
{
  uint64_t v6 = *(void *)(*(void *)a3 + 8);
  v13.receiver = self;
  v13.super_class = (Class)WBSBookmarkAndHistoryCompletionMatch;
  v7 = [(WBSURLCompletionMatch *)&v13 initWithMatchLocation:v6 userInput:a4 forQueryID:a5];
  v8 = v7;
  if (v7)
  {
    v9 = *(BookmarkAndHistoryCompletionMatch **)a3;
    *(void *)a3 = 0;
    uint64_t m_ptr = (uint64_t)v7->_match.m_ptr;
    v8->_match.uint64_t m_ptr = v9;
    if (m_ptr) {
      WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(m_ptr);
    }
    v11 = v8;
  }

  return v8;
}

- (WBSURLCompletionMatchData)data
{
  return (WBSURLCompletionMatchData *)SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)self->_match.m_ptr);
}

- (BOOL)matchesAutocompleteTrigger
{
  v3 = [(WBSBookmarkAndHistoryCompletionMatch *)self data];
  v4 = [(WBSURLCompletionMatch *)self userInput];
  char v5 = [v3 matchesAutocompleteTrigger:v4 isStrengthened:0];

  return v5;
}

- (id)originalURLString
{
  return (id)SafariShared::BookmarkAndHistoryCompletionMatch::originalURLString((id *)self->_match.m_ptr);
}

- (id)title
{
  return SafariShared::BookmarkAndHistoryCompletionMatch::title((SafariShared::BookmarkAndHistoryCompletionMatch *)self->_match.m_ptr);
}

- (id)userVisibleURLString
{
  return SafariShared::BookmarkAndHistoryCompletionMatch::userVisibleURLString((SafariShared::BookmarkAndHistoryCompletionMatch *)self->_match.m_ptr);
}

- (BOOL)containsBookmark
{
  v2 = SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)self->_match.m_ptr);
  char v3 = [v2 containsBookmark];

  return v3;
}

- (id)uuidString
{
  return SafariShared::BookmarkAndHistoryCompletionMatch::uuidString((SafariShared::BookmarkAndHistoryCompletionMatch *)self->_match.m_ptr);
}

- (BOOL)containsReadingListItem
{
  v2 = SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)self->_match.m_ptr);
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 containsReadingListItem];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)onlyContainsCloudTab
{
  v2 = SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)self->_match.m_ptr);
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 onlyContainsCloudTab];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)cloudTabDeviceName
{
  v2 = SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)self->_match.m_ptr);
  if (objc_opt_respondsToSelector())
  {
    char v3 = [v2 cloudTabDeviceName];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (double)lastVisitTimeInterval
{
  v2 = SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)self->_match.m_ptr);
  [v2 lastVisitedTimeInterval];
  double v4 = v3;

  return v4;
}

- (id)parsecDomainIdentifier
{
  v2 = [(WBSBookmarkAndHistoryCompletionMatch *)self data];
  int v3 = [v2 containsBookmark];
  double v4 = WBSParsecDomainSafariBookmark;
  if (!v3) {
    double v4 = WBSParsecDomainSafariHistory;
  }
  char v5 = *v4;

  return v5;
}

- (float)weight
{
  return *((float *)self->_match.m_ptr + 12);
}

- (int64_t)visitCountScore
{
  return *((void *)self->_match.m_ptr + 7);
}

- (float)topSitesScore
{
  return *((float *)self->_match.m_ptr + 16);
}

- (void).cxx_destruct
{
  uint64_t m_ptr = self->_match.m_ptr;
  self->_match.uint64_t m_ptr = 0;
  if (m_ptr) {
    WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

@end