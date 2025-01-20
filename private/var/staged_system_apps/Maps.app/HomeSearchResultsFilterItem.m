@interface HomeSearchResultsFilterItem
- (BOOL)isEqual:(id)a3;
- (GEORelatedSearchSuggestion)currentSuggestion;
- (HomeSearchResultsFilterItem)initWithSuggestions:(id)a3 currentSuggestion:(id)a4 delegate:(id)a5;
- (HomeSearchResultsFilterItemDelegate)delegate;
- (NSArray)suggestions;
- (NSString)_maps_diffableDataSourceIdentifier;
- (SmallDropDownOutlineCellModel)cellModel;
- (unint64_t)hash;
- (void)smallDropDownOutlineCell:(id)a3 didSelectItemAtIndex:(int64_t)a4;
@end

@implementation HomeSearchResultsFilterItem

- (HomeSearchResultsFilterItem)initWithSuggestions:(id)a3 currentSuggestion:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HomeSearchResultsFilterItem;
  v11 = [(HomeSearchResultsFilterItem *)&v15 init];
  if (v11)
  {
    v12 = (NSArray *)[v8 copy];
    suggestions = v11->_suggestions;
    v11->_suggestions = v12;

    objc_storeStrong((id *)&v11->_currentSuggestion, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSArray *)self->_suggestions hash];
  return (unint64_t)[(GEORelatedSearchSuggestion *)self->_currentSuggestion hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HomeSearchResultsFilterItem *)a3;
  if (v4 == self)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HomeSearchResultsFilterItem *)v5 suggestions];
      v7 = v6;
      if (v6 == self->_suggestions || -[NSArray isEqual:](v6, "isEqual:"))
      {
        id v8 = [(HomeSearchResultsFilterItem *)v5 currentSuggestion];
        id v9 = v8;
        if (v8 == self->_currentSuggestion || -[GEORelatedSearchSuggestion isEqual:](v8, "isEqual:"))
        {
          id v10 = [(HomeSearchResultsFilterItem *)v5 delegate];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if (v10 == WeakRetained) {
            unsigned __int8 v12 = 1;
          }
          else {
            unsigned __int8 v12 = [v10 isEqual:WeakRetained];
          }
        }
        else
        {
          unsigned __int8 v12 = 0;
        }
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  return v12;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return (NSString *)@"HomeSearchFilterItem";
}

- (SmallDropDownOutlineCellModel)cellModel
{
  unint64_t v3 = [(GEORelatedSearchSuggestion *)self->_currentSuggestion displayString];
  v4 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_suggestions;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) displayString:(void)v13];
        [v4 addObject:v10];
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = [[SmallDropDownOutlineCellModel alloc] initWithButtonTitle:v3 dropDownTitles:v4 selectedIndex:[(NSArray *)self->_suggestions indexOfObject:self->_currentSuggestion] delegate:self backgroundModel:0];

  return v11;
}

- (void)smallDropDownOutlineCell:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  id v6 = [(NSArray *)self->_suggestions objectAtIndexedSubscript:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained searchResultsFilterItem:self didSelectSuggestion:v6];
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (GEORelatedSearchSuggestion)currentSuggestion
{
  return self->_currentSuggestion;
}

- (HomeSearchResultsFilterItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HomeSearchResultsFilterItemDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);

  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end