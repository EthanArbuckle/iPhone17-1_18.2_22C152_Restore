@interface CustomSearchResultHistoryItem
- (BOOL)isEqual:(id)a3;
- (CustomSearchResultHistoryItem)initWithSearchResult:(id)a3;
- (SearchResult)customSearchResult;
- (double)timestamp;
@end

@implementation CustomSearchResultHistoryItem

- (CustomSearchResultHistoryItem)initWithSearchResult:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CustomSearchResultHistoryItem;
  v6 = [(CustomSearchResultHistoryItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_customSearchResult, a3);
    v8 = v7;
  }

  return v7;
}

- (double)timestamp
{
  [(SearchResultRepr *)self->_customSearchResult timestamp];
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CustomSearchResultHistoryItem *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_customSearchResult == self->_customSearchResult;
  }

  return v5;
}

- (SearchResult)customSearchResult
{
  return self->_customSearchResult;
}

- (void).cxx_destruct
{
}

@end