@interface ICSearchQueryOperation(UI)
- (uint64_t)initWithSearchSuggestionsResponder:()UI searchString:performNLSearch:performTopHitSearch:tokens:;
- (void)initWithSearchSuggestionsResponder:()UI userInput:performNLSearch:performTopHitSearch:modernResultsOnly:;
@end

@implementation ICSearchQueryOperation(UI)

- (uint64_t)initWithSearchSuggestionsResponder:()UI searchString:performNLSearch:performTopHitSearch:tokens:
{
  return [a1 initWithSearchSuggestionsResponder:a3 searchString:a4 performNLSearch:a5 performTopHitSearch:a6 tokens:a7 modernResultsOnly:0];
}

- (void)initWithSearchSuggestionsResponder:()UI userInput:performNLSearch:performTopHitSearch:modernResultsOnly:
{
  id v12 = a4;
  id v13 = a3;
  v14 = [v12 searchString];
  v15 = [v12 tokens];
  v16 = (void *)[a1 initWithSearchSuggestionsResponder:v13 searchString:v14 performNLSearch:a5 performTopHitSearch:a6 tokens:v15 modernResultsOnly:a7];

  if (v16)
  {
    v17 = [v12 keyboardLanguage];
    [v16 setKeyboardLanguage:v17];
  }
  return v16;
}

@end