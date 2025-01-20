@interface ICASSearchSuggestionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSearchSuggestionData)initWithSearchSuggestionType:(id)a3;
- (ICASSearchSuggestionType)searchSuggestionType;
- (id)toDict;
@end

@implementation ICASSearchSuggestionData

- (ICASSearchSuggestionData)initWithSearchSuggestionType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSearchSuggestionData;
  v6 = [(ICASSearchSuggestionData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchSuggestionType, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SearchSuggestionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"searchSuggestionType";
  v3 = [(ICASSearchSuggestionData *)self searchSuggestionType];
  if (v3)
  {
    uint64_t v4 = [(ICASSearchSuggestionData *)self searchSuggestionType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v5 = (void *)v4;
  v9[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (ICASSearchSuggestionType)searchSuggestionType
{
  return self->_searchSuggestionType;
}

- (void).cxx_destruct
{
}

@end