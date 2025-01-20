@interface ICSearchSuggestionsContext
+ (BOOL)supportsSearchSuggestions;
- (BOOL)isEmpty;
- (CSSuggestion)searchSuggestion;
- (ICSearchSuggestionsContext)init;
- (ICSearchSuggestionsContext)initWithSearchSuggestion:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)changeScopeOfToken:(id)a3 toScopeAtIndex:(unint64_t)a4;
- (void)setSearchSuggestion:(id)a3;
- (void)updateSearchSuggestion:(id)a3 interaction:(int64_t)a4;
- (void)updateTypedString:(id)a3 tokens:(id)a4;
@end

@implementation ICSearchSuggestionsContext

- (ICSearchSuggestionsContext)init
{
  v3 = [MEMORY[0x1E4F23870] emptySuggestion];
  v4 = [(ICSearchSuggestionsContext *)self initWithSearchSuggestion:v3];

  return v4;
}

- (ICSearchSuggestionsContext)initWithSearchSuggestion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSearchSuggestionsContext;
  v6 = [(ICSearchSuggestionsContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchSuggestion, a3);
  }

  return v7;
}

- (BOOL)isEmpty
{
  v3 = [(CSSuggestion *)self->_searchSuggestion suggestionTokens];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(CSSuggestion *)self->_searchSuggestion userQueryString];
    BOOL v4 = [v5 length] == 0;
  }
  return v4;
}

+ (BOOL)supportsSearchSuggestions
{
  return MEMORY[0x1F4139D20](a1, a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[ICSearchSuggestionsContext allocWithZone:](ICSearchSuggestionsContext, "allocWithZone:");
  v6 = [(ICSearchSuggestionsContext *)self searchSuggestion];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = [(ICSearchSuggestionsContext *)v5 initWithSearchSuggestion:v7];

  return v8;
}

- (void)updateTypedString:(id)a3 tokens:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 length] || objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x1E4F23870];
    v8 = [(ICSearchSuggestionsContext *)self searchSuggestion];
    objc_super v9 = objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_30);
    v10 = [v7 updatedSuggestionWithCurrentSuggestion:v8 userString:v11 tokens:v9];
    [(ICSearchSuggestionsContext *)self setSearchSuggestion:v10];
  }
  else
  {
    v8 = [MEMORY[0x1E4F23870] emptySuggestion];
    [(ICSearchSuggestionsContext *)self setSearchSuggestion:v8];
  }
}

uint64_t __55__ICSearchSuggestionsContext_updateTypedString_tokens___block_invoke(uint64_t a1, void *a2)
{
  return [a2 csToken];
}

- (void)updateSearchSuggestion:(id)a3 interaction:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  id v13 = v6;
  switch(a4)
  {
    case 2:
      objc_super v9 = (void *)MEMORY[0x1E4F23870];
      id v10 = v7;
      uint64_t v11 = 9;
LABEL_7:
      id v8 = [v9 updatedSuggestionWithCurrentSuggestion:v10 interaction:v11];
      goto LABEL_8;
    case 1:
      objc_super v9 = (void *)MEMORY[0x1E4F23870];
      id v10 = v7;
      uint64_t v11 = 0;
      goto LABEL_7;
    case 0:
      id v8 = v6;
LABEL_8:
      v12 = v8;
      goto LABEL_10;
  }
  v12 = 0;
LABEL_10:
  [(ICSearchSuggestionsContext *)self setSearchSuggestion:v12];
}

- (void)changeScopeOfToken:(id)a3 toScopeAtIndex:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F23870];
  id v7 = a3;
  id v8 = [(ICSearchSuggestionsContext *)self searchSuggestion];
  objc_super v9 = [v7 csToken];

  id v10 = [v6 updatedSuggestionWithCurrentSuggestion:v8 token:v9 scopeSelection:a4];

  [(ICSearchSuggestionsContext *)self setSearchSuggestion:v10];
}

- (CSSuggestion)searchSuggestion
{
  return self->_searchSuggestion;
}

- (void)setSearchSuggestion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end