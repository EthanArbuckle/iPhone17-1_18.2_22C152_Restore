@interface _UISearchSuggestionItemGroup
- (NSArray)suggestionItems;
- (NSString)headerTitle;
- (_UISearchSuggestionItemGroup)initWithHeaderTitle:(id)a3 suggestionItems:(id)a4;
@end

@implementation _UISearchSuggestionItemGroup

- (_UISearchSuggestionItemGroup)initWithHeaderTitle:(id)a3 suggestionItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISearchSuggestionItemGroup;
  v8 = [(_UISearchSuggestionItemGroup *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    headerTitle = v8->_headerTitle;
    v8->_headerTitle = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    suggestionItems = v8->_suggestionItems;
    v8->_suggestionItems = (NSArray *)v11;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionItems, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSArray)suggestionItems
{
  return self->_suggestionItems;
}

@end