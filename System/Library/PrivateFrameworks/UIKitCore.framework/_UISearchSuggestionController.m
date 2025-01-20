@interface _UISearchSuggestionController
- (NSArray)suggestionGroups;
- (NSArray)suggestions;
- (_UISearchSuggestionControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setSuggestionGroups:(id)a3;
- (void)setSuggestions:(id)a3;
@end

@implementation _UISearchSuggestionController

- (void)setDelegate:(id)a3
{
}

- (NSArray)suggestionGroups
{
  return self->_suggestionGroups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionGroups, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (_UISearchSuggestionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UISearchSuggestionControllerDelegate *)WeakRetained;
}

- (void)setSuggestionGroups:(id)a3
{
}

@end