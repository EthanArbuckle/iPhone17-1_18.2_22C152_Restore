@interface PLSearchResultSection
- (NSArray)assetSearchResultsForCompletions;
- (NSArray)searchResults;
- (PLSearchResultSection)initWithResultTypes:(unint64_t)a3 categoryMask:(unint64_t)a4 searchResults:(id)a5 assetSearchResultsForCompletions:(id)a6;
- (unint64_t)categoryMask;
- (unint64_t)resultTypes;
@end

@implementation PLSearchResultSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSearchResultsForCompletions, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
}

- (NSArray)assetSearchResultsForCompletions
{
  return self->_assetSearchResultsForCompletions;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (unint64_t)categoryMask
{
  return self->_categoryMask;
}

- (unint64_t)resultTypes
{
  return self->_resultTypes;
}

- (PLSearchResultSection)initWithResultTypes:(unint64_t)a3 categoryMask:(unint64_t)a4 searchResults:(id)a5 assetSearchResultsForCompletions:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PLSearchResultSection;
  v13 = [(PLSearchResultSection *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_resultTypes = a3;
    v13->_categoryMask = a4;
    objc_storeStrong((id *)&v13->_searchResults, a5);
    objc_storeStrong((id *)&v14->_assetSearchResultsForCompletions, a6);
  }

  return v14;
}

@end