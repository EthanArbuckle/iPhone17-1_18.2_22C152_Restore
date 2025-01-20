@interface PSISuggestionOptions
- (BOOL)_wantsUnscopedSuggestions;
- (BOOL)enableNextTokenSuggestions;
- (BOOL)limitSuggestionsToExactTextMatches;
- (BOOL)optionsWantSuggestionsForAssets;
- (BOOL)optionsWantSuggestionsForCollections;
- (NSIndexSet)suggestionCategories;
- (PSISuggestionOptions)initWithSuggestionType:(unint64_t)a3 suggestionLimit:(unint64_t)a4;
- (id)_suggestionCategoriesTypeDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)locationInQueryStringForSuggestionGeneration;
- (unint64_t)minNumberOfResultsForNextTokenGeneration;
- (unint64_t)searchSuggestionLimit;
- (unint64_t)searchSuggestionType;
- (unint64_t)suggestionResultTypes;
- (void)setEnableNextTokenSuggestions:(BOOL)a3;
- (void)setLimitSuggestionsToExactTextMatches:(BOOL)a3;
- (void)setLocationInQueryStringForSuggestionGeneration:(unint64_t)a3;
- (void)setMinNumberOfResultsForNextTokenGeneration:(unint64_t)a3;
- (void)setSuggestionCategories:(id)a3;
- (void)setSuggestionResultTypes:(unint64_t)a3;
- (void)set_wantsUnscopedSuggestions:(BOOL)a3;
@end

@implementation PSISuggestionOptions

- (void).cxx_destruct
{
}

- (void)set_wantsUnscopedSuggestions:(BOOL)a3
{
  self->__wantsUnscopedSuggestions = a3;
}

- (BOOL)_wantsUnscopedSuggestions
{
  return self->__wantsUnscopedSuggestions;
}

- (void)setMinNumberOfResultsForNextTokenGeneration:(unint64_t)a3
{
  self->_minNumberOfResultsForNextTokenGeneration = a3;
}

- (unint64_t)minNumberOfResultsForNextTokenGeneration
{
  return self->_minNumberOfResultsForNextTokenGeneration;
}

- (void)setSuggestionCategories:(id)a3
{
}

- (NSIndexSet)suggestionCategories
{
  return self->_suggestionCategories;
}

- (void)setLocationInQueryStringForSuggestionGeneration:(unint64_t)a3
{
  self->_locationInQueryStringForSuggestionGeneration = a3;
}

- (unint64_t)locationInQueryStringForSuggestionGeneration
{
  return self->_locationInQueryStringForSuggestionGeneration;
}

- (void)setLimitSuggestionsToExactTextMatches:(BOOL)a3
{
  self->_limitSuggestionsToExactTextMatches = a3;
}

- (BOOL)limitSuggestionsToExactTextMatches
{
  return self->_limitSuggestionsToExactTextMatches;
}

- (void)setSuggestionResultTypes:(unint64_t)a3
{
  self->_suggestionResultTypes = a3;
}

- (unint64_t)suggestionResultTypes
{
  return self->_suggestionResultTypes;
}

- (void)setEnableNextTokenSuggestions:(BOOL)a3
{
  self->_enableNextTokenSuggestions = a3;
}

- (BOOL)enableNextTokenSuggestions
{
  return self->_enableNextTokenSuggestions;
}

- (unint64_t)searchSuggestionLimit
{
  return self->_searchSuggestionLimit;
}

- (unint64_t)searchSuggestionType
{
  return self->_searchSuggestionType;
}

- (id)_suggestionCategoriesTypeDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PSISuggestionOptions *)self suggestionCategories];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__PSISuggestionOptions__suggestionCategoriesTypeDescription__block_invoke;
  v8[3] = &unk_1E58739B0;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateIndexesUsingBlock:v8];

  v6 = (void *)[v5 copy];
  return v6;
}

void __60__PSISuggestionOptions__suggestionCategoriesTypeDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) > 0x28) {
    id v3 = @"PLSearchSuggestionCategoriesTypeUndefined";
  }
  else {
    id v3 = off_1E586DC20[a2 - 1];
  }
  v4 = v3;
  [*(id *)(a1 + 32) addObject:v4];
}

- (id)description
{
  unsigned __int8 v3 = [(PSISuggestionOptions *)self suggestionResultTypes];
  char v4 = [(PSISuggestionOptions *)self suggestionResultTypes];
  id v5 = NSString;
  unint64_t v6 = self->_searchSuggestionType - 1;
  if (v6 > 3) {
    v7 = @"PLSearchSuggestionTypeNone";
  }
  else {
    v7 = off_1E5869EC8[v6];
  }
  v8 = @"collections";
  if ((v4 & 2) == 0) {
    v8 = 0;
  }
  if ((v3 & ((v4 & 2) >> 1)) != 0) {
    id v9 = @"assets & collections";
  }
  else {
    id v9 = @"assets";
  }
  if (v3) {
    v10 = v9;
  }
  else {
    v10 = v8;
  }
  v11 = v7;
  unint64_t searchSuggestionLimit = self->_searchSuggestionLimit;
  v13 = [(PSISuggestionOptions *)self _suggestionCategoriesTypeDescription];
  if (self->_limitSuggestionsToExactTextMatches) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  if (self->__wantsUnscopedSuggestions) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  if (self->_enableNextTokenSuggestions) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  v17 = v15;
  v18 = v14;
  v19 = [v5 stringWithFormat:@"Suggestion type: %@,\nsuggestion limit: %tu,\nsuggestion result types: %@,\nsuggestionCategories:%@,\nlimit suggestions to exact matches only: %@,\nwants unscoped suggestions:%@,\nenable next token suggestions: %@\n", v11, searchSuggestionLimit, v10, v13, v18, v17, v16];

  return v19;
}

- (BOOL)optionsWantSuggestionsForCollections
{
  return ([(PSISuggestionOptions *)self suggestionResultTypes] >> 1) & 1;
}

- (BOOL)optionsWantSuggestionsForAssets
{
  return [(PSISuggestionOptions *)self suggestionResultTypes] & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = [[PSISuggestionOptions alloc] initWithSuggestionType:self->_searchSuggestionType suggestionLimit:self->_searchSuggestionLimit];
  [(PSISuggestionOptions *)v4 setSuggestionResultTypes:self->_suggestionResultTypes];
  [(PSISuggestionOptions *)v4 setLimitSuggestionsToExactTextMatches:self->_limitSuggestionsToExactTextMatches];
  [(PSISuggestionOptions *)v4 set_wantsUnscopedSuggestions:self->__wantsUnscopedSuggestions];
  [(PSISuggestionOptions *)v4 setMinNumberOfResultsForNextTokenGeneration:self->_minNumberOfResultsForNextTokenGeneration];
  [(PSISuggestionOptions *)v4 setEnableNextTokenSuggestions:self->_enableNextTokenSuggestions];
  [(PSISuggestionOptions *)v4 setSuggestionCategories:self->_suggestionCategories];
  return v4;
}

- (PSISuggestionOptions)initWithSuggestionType:(unint64_t)a3 suggestionLimit:(unint64_t)a4
{
  if (a4)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PSISuggestionOptions.m", 19, @"Invalid parameter not satisfying: %@", @"suggestionLimit != 0" object file lineNumber description];

    if (a3) {
      goto LABEL_3;
    }
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"PSISuggestionOptions.m", 20, @"Invalid parameter not satisfying: %@", @"suggestionType != PLSearchSuggestionTypeNone" object file lineNumber description];

LABEL_3:
  v11.receiver = self;
  v11.super_class = (Class)PSISuggestionOptions;
  result = [(PSISuggestionOptions *)&v11 init];
  if (result)
  {
    result->_searchSuggestionType = a3;
    result->_unint64_t searchSuggestionLimit = a4;
    result->_locationInQueryStringForSuggestionGeneration = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

@end