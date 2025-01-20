@interface RAPSearchAutocompleteResult
- (MKMapItem)selectedMapItem;
- (NSString)searchBarText;
- (void)setSearchBarText:(id)a3;
- (void)setSelectedMapItem:(id)a3;
@end

@implementation RAPSearchAutocompleteResult

- (NSString)searchBarText
{
  return self->_searchBarText;
}

- (void)setSearchBarText:(id)a3
{
}

- (MKMapItem)selectedMapItem
{
  return self->_selectedMapItem;
}

- (void)setSelectedMapItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedMapItem, 0);

  objc_storeStrong((id *)&self->_searchBarText, 0);
}

@end