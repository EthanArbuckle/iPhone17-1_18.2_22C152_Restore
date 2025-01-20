@interface ICASSearchSuggestionType
- (ICASSearchSuggestionType)initWithSearchSuggestionType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)searchSuggestionType;
@end

@implementation ICASSearchSuggestionType

- (ICASSearchSuggestionType)initWithSearchSuggestionType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASSearchSuggestionType;
  result = [(ICASSearchSuggestionType *)&v5 init];
  if (result) {
    result->_searchSuggestionType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASSearchSuggestionType *)self searchSuggestionType];
  if ((unint64_t)(v3 - 1) > 6) {
    return @"unknown";
  }
  else {
    return off_1E64B98A8[v3 - 1];
  }
}

- (int64_t)searchSuggestionType
{
  return self->_searchSuggestionType;
}

@end