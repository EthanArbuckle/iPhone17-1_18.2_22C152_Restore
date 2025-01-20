@interface SearchResultHistoryItem
- (SearchResultHistoryItem)initWithSearchResult:(id)a3;
- (double)timestamp;
- (void)updateModel:(id)a3;
@end

@implementation SearchResultHistoryItem

- (SearchResultHistoryItem)initWithSearchResult:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchResultHistoryItem;
  v5 = [(SearchResultHistoryItem *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    [(PersistentSearchResultHistoryItem *)v5 setSearchResult:v6];
    v7 = v5;
  }
  return v5;
}

- (double)timestamp
{
  v2 = [(PersistentSearchResultHistoryItem *)self searchResult];
  [v2 timestamp];
  double v4 = v3;

  return v4;
}

- (void)updateModel:(id)a3
{
  id v4 = a3;
  v5 = [(PersistentSearchResultHistoryItem *)self searchResult];
  [v5 updateModel:v4];

  id v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = +[NSString stringWithFormat:@"[%@]", v8];
  [v4 setDebugSubtitle:v7];
}

@end