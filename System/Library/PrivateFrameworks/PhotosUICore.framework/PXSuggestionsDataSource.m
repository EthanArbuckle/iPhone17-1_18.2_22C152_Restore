@interface PXSuggestionsDataSource
- (PXDisplaySuggestionFetchResult)suggestions;
- (PXSuggestionsDataSource)init;
- (PXSuggestionsDataSource)initWithSuggestionsFetchResult:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
@end

@implementation PXSuggestionsDataSource

- (void).cxx_destruct
{
}

- (PXDisplaySuggestionFetchResult)suggestions
{
  return self->_suggestions;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item = a3->item;
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSuggestionsDataSource.m", 39, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];

    int64_t item = a3->item;
  }
  if (item >= [(PXDisplaySuggestionFetchResult *)self->_suggestions count])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSuggestionsDataSource.m", 40, @"Invalid parameter not satisfying: %@", @"indexPath.item < _suggestions.count" object file lineNumber description];
  }
  suggestions = self->_suggestions;
  int64_t v10 = a3->item;
  return (id)[(PXDisplaySuggestionFetchResult *)suggestions objectAtIndex:v10];
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if (a3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXSuggestionsDataSource.m", 30, @"Invalid parameter not satisfying: %@", @"section == 0" object file lineNumber description];
  }
  suggestions = self->_suggestions;
  return [(PXDisplaySuggestionFetchResult *)suggestions count];
}

- (int64_t)numberOfSections
{
  return 1;
}

- (PXSuggestionsDataSource)initWithSuggestionsFetchResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSuggestionsDataSource;
  v6 = [(PXSuggestionsDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_suggestions, a3);
  }

  return v7;
}

- (PXSuggestionsDataSource)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSuggestionsDataSource.m", 14, @"%s is not available as initializer", "-[PXSuggestionsDataSource init]");

  abort();
}

@end