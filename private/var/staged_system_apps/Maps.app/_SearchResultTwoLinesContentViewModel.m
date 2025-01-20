@interface _SearchResultTwoLinesContentViewModel
- (SearchResult)observedSearchResult;
- (unint64_t)preferredAddressFormat;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setObservedSearchResult:(id)a3;
- (void)setPreferredAddressFormat:(unint64_t)a3;
@end

@implementation _SearchResultTwoLinesContentViewModel

- (void)dealloc
{
  [(_SearchResultTwoLinesContentViewModel *)self setObservedSearchResult:0];
  v3.receiver = self;
  v3.super_class = (Class)_SearchResultTwoLinesContentViewModel;
  [(_BasicTwoLinesContentViewModel *)&v3 dealloc];
}

- (void)setObservedSearchResult:(id)a3
{
  v5 = (SearchResult *)a3;
  observedSearchResult = self->_observedSearchResult;
  v7 = v5;
  if (observedSearchResult != v5)
  {
    [observedSearchResult removeObserver:self forKeyPath:@"reverseGeocoded"];
    objc_storeStrong((id *)&self->_observedSearchResult, a3);
    [(SearchResult *)v7 addObserver:self forKeyPath:@"reverseGeocoded" options:0 context:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = a3;
  id v8 = a4;
  id v9 = [(_SearchResultTwoLinesContentViewModel *)self observedSearchResult];
  if (v9 != v8) {
    goto LABEL_10;
  }
  unsigned int v10 = [v14 isEqualToString:@"reverseGeocoded"];

  if (!v10) {
    goto LABEL_11;
  }
  unint64_t v11 = [(_SearchResultTwoLinesContentViewModel *)self preferredAddressFormat];
  if (v11 == 1)
  {
    v12 = [self->_observedSearchResult mapItem];
    id v9 = [v12 _addressFormattedAsCity];
  }
  else
  {
    if (v11)
    {
      id v9 = 0;
      goto LABEL_9;
    }
    v12 = [self->_observedSearchResult mapItem];
    v13 = [v12 _addressFormattedAsShortenedAddress];
    sub_100A08D18(v13);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  [(_BasicTwoLinesContentViewModel *)self setSubtitleText:v9];
  [(_BasicTwoLinesContentViewModel *)self updateObservers];
LABEL_10:

LABEL_11:
}

- (SearchResult)observedSearchResult
{
  return self->_observedSearchResult;
}

- (unint64_t)preferredAddressFormat
{
  return self->_preferredAddressFormat;
}

- (void)setPreferredAddressFormat:(unint64_t)a3
{
  self->_preferredAddressFormat = a3;
}

- (void).cxx_destruct
{
}

@end