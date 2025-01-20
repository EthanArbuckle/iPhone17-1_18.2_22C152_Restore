@interface PXPeopleSuggestionsDataSource
- (id)personSuggestionAtIndexPath:(id)a3;
- (id)personSuggestionAtItemIndexPath:(PXSimpleIndexPath *)a3;
@end

@implementation PXPeopleSuggestionsDataSource

- (id)personSuggestionAtIndexPath:(id)a3
{
  long long v6 = 0u;
  long long v7 = 0u;
  id v4 = a3;
  [(PXPeopleSuggestionsDataSource *)self identifier];
  PXSimpleIndexPathFromIndexPath();
}

- (id)personSuggestionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  id v4 = [(PXPeopleSuggestionsDataSource *)self objectAtIndexPath:v6];
  return v4;
}

@end