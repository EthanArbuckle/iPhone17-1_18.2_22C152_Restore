@interface WBBookmarksDatabaseHealthInformation
- (WBBookmarksDatabaseHealthInformation)initWithTopLevelDuplicateBookmarksCount:(unint64_t)a3 allDuplicateBookmarksCount:(unint64_t)a4;
- (unint64_t)allDuplicateBookmarksCount;
- (unint64_t)topLevelDuplicateBookmarksCount;
@end

@implementation WBBookmarksDatabaseHealthInformation

- (WBBookmarksDatabaseHealthInformation)initWithTopLevelDuplicateBookmarksCount:(unint64_t)a3 allDuplicateBookmarksCount:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WBBookmarksDatabaseHealthInformation;
  v6 = [(WBBookmarksDatabaseHealthInformation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_topLevelDuplicateBookmarksCount = a3;
    v6->_allDuplicateBookmarksCount = a4;
    v8 = v6;
  }

  return v7;
}

- (unint64_t)topLevelDuplicateBookmarksCount
{
  return self->_topLevelDuplicateBookmarksCount;
}

- (unint64_t)allDuplicateBookmarksCount
{
  return self->_allDuplicateBookmarksCount;
}

@end