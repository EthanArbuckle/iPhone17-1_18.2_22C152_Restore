@interface SuggestionsDataSource
- (BOOL)isGroupRow:(int64_t)a3;
- (BOOL)isScrolling;
- (BOOL)rowHasClearButton:(int64_t)a3;
- (STSSearchModel)searchModel;
- (STSSearchModelUpdateDelegate)updateDelgate;
- (STSSuggestionSelectionDelegate)selectionDelegate;
- (SuggestionsDataSource)initWithSearchModel:(id)a3;
- (id)headerTitleForRow:(int64_t)a3;
- (id)stringValueForRowAtIndex:(int64_t)a3;
- (int64_t)numberOfRows;
- (void)clearSuggestions;
- (void)didSelectItemAtIndex:(int64_t)a3;
- (void)setIsScrolling:(BOOL)a3;
- (void)setSearchModel:(id)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setUpdateDelgate:(id)a3;
- (void)updateQuerySuggestions:(id)a3;
@end

@implementation SuggestionsDataSource

- (SuggestionsDataSource)initWithSearchModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SuggestionsDataSource;
  v6 = [(SuggestionsDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchModel, a3);
  }

  return v7;
}

- (void)clearSuggestions
{
}

- (void)updateQuerySuggestions:(id)a3
{
  [(STSSearchModel *)self->_searchModel setQuerySuggestions:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelgate);
  [WeakRetained searchModelUpdated];
}

- (id)headerTitleForRow:(int64_t)a3
{
  return &stru_26E2ACAA8;
}

- (BOOL)isGroupRow:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfRows
{
  v2 = [(STSSearchModel *)self->_searchModel querySuggestions];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)stringValueForRowAtIndex:(int64_t)a3
{
  if (a3 < 0)
  {
    v6 = &stru_26E2ACAA8;
  }
  else
  {
    v4 = [(STSSearchModel *)self->_searchModel querySuggestions];
    id v5 = [v4 objectAtIndex:a3];
    v6 = [v5 suggestion];
  }

  return v6;
}

- (void)didSelectItemAtIndex:(int64_t)a3
{
  id v5 = [(STSSearchModel *)self->_searchModel querySuggestions];
  id v7 = [v5 objectAtIndex:a3];

  v6 = [(SuggestionsDataSource *)self selectionDelegate];
  [v6 suggestionViewController:self didSelectSuggestion:v7 suggested:0];
}

- (BOOL)rowHasClearButton:(int64_t)a3
{
  return 0;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
}

- (STSSearchModelUpdateDelegate)updateDelgate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelgate);

  return (STSSearchModelUpdateDelegate *)WeakRetained;
}

- (void)setUpdateDelgate:(id)a3
{
}

- (STSSuggestionSelectionDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (STSSuggestionSelectionDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (void)setSearchModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);

  objc_destroyWeak((id *)&self->_updateDelgate);
}

@end