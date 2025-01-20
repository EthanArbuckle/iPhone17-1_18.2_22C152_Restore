@interface SingleResultSearchHistoryRecorder
- (SearchResult)searchResult;
- (SingleResultSearchHistoryRecorder)initWithSearchResult:(id)a3;
- (void)recordItemInHistory;
- (void)setSearchResult:(id)a3;
@end

@implementation SingleResultSearchHistoryRecorder

- (SingleResultSearchHistoryRecorder)initWithSearchResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SingleResultSearchHistoryRecorder;
  v6 = [(SingleResultSearchHistoryRecorder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchResult, a3);
  }

  return v7;
}

- (void)recordItemInHistory
{
  id v6 = +[NSUUID UUID];
  v3 = [(SingleResultSearchHistoryRecorder *)self searchResult];
  [v3 setSearchToSupersedeIfRecordedInHistory:v6];

  v4 = [(SingleResultSearchHistoryRecorder *)self searchResult];
  id v5 = [v4 mapItem];

  if (v5) {
    +[HistoryEntryRecentsItem saveMapItem:v5 superseedUUID:v6];
  }
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end