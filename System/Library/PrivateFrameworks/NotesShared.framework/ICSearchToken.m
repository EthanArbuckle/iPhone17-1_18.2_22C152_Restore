@interface ICSearchToken
+ (id)iconImageNameForCSToken:(id)a3;
+ (id)iconImageNameForSuggestionType:(unint64_t)a3;
+ (unint64_t)suggestionTypeOfFirstItemInTokens:(id)a3;
- (BOOL)hasMultipleScopes;
- (ICSearchToken)initWithCSSuggestionToken:(id)a3;
- (ICSearchToken)initWithTitle:(id)a3 subQueryString:(id)a4 suggestionType:(unint64_t)a5;
- (NSArray)availableScopes;
- (NSString)iconImageName;
- (NSString)scopeName;
- (NSString)subQueryString;
- (NSString)title;
- (_CSSuggestionToken)csToken;
- (unint64_t)selectedScopeIndex;
- (unint64_t)suggestionType;
- (void)scopeName;
- (void)setCsToken:(id)a3;
- (void)setIconImageName:(id)a3;
@end

@implementation ICSearchToken

- (ICSearchToken)initWithTitle:(id)a3 subQueryString:(id)a4 suggestionType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICSearchToken;
  v11 = [(ICSearchToken *)&v17 init];
  v12 = v11;
  if (v11)
  {
    csToken = v11->_csToken;
    v11->_csToken = 0;

    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v12->_subQueryString, a4);
    v12->_suggestionType = a5;
    uint64_t v14 = +[ICSearchToken iconImageNameForSuggestionType:a5];
    iconImageName = v12->_iconImageName;
    v12->_iconImageName = (NSString *)v14;
  }
  return v12;
}

- (ICSearchToken)initWithCSSuggestionToken:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICSearchToken;
  v6 = [(ICSearchToken *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_csToken, a3);
    v8 = [v5 displayText];
    uint64_t v9 = [v8 string];
    title = v7->_title;
    v7->_title = (NSString *)v9;

    subQueryString = v7->_subQueryString;
    v7->_subQueryString = 0;

    v7->_suggestionType = 0;
    uint64_t v12 = +[ICSearchToken iconImageNameForCSToken:v5];
    iconImageName = v7->_iconImageName;
    v7->_iconImageName = (NSString *)v12;
  }
  return v7;
}

- (NSString)scopeName
{
  p_csToken = &self->_csToken;
  csToken = self->_csToken;
  if (csToken)
  {
    unint64_t v5 = [(_CSSuggestionToken *)csToken selectedScope];
    v6 = [(_CSSuggestionToken *)*p_csToken scopes];
    unint64_t v7 = [v6 count];

    if (v5 < v7)
    {
      v8 = [(_CSSuggestionToken *)*p_csToken scopes];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v5];

      goto LABEL_8;
    }
    id v10 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(ICSearchToken *)(uint64_t)self scopeName];
    }
  }
  uint64_t v9 = 0;
LABEL_8:
  return (NSString *)v9;
}

- (unint64_t)selectedScopeIndex
{
  unint64_t result = (unint64_t)self->_csToken;
  if (result) {
    return [(id)result selectedScope];
  }
  return result;
}

- (NSArray)availableScopes
{
  csToken = self->_csToken;
  if (csToken)
  {
    csToken = [csToken scopes];
  }
  return (NSArray *)csToken;
}

- (BOOL)hasMultipleScopes
{
  csToken = self->_csToken;
  if (!csToken) {
    return 0;
  }
  v3 = [(_CSSuggestionToken *)csToken scopes];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

+ (unint64_t)suggestionTypeOfFirstItemInTokens:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    BOOL v4 = [v3 objectAtIndexedSubscript:0];
    unint64_t v5 = v4;
    if (v4) {
      unint64_t v6 = [v4 suggestionType];
    }
    else {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)iconImageNameForSuggestionType:(unint64_t)a3
{
  id result = @"person.crop.circle";
  switch(a3)
  {
    case 0uLL:
      if (+[ICSearchSuggestionsContext supportsSearchSuggestions])
      {
        id result = @"magnifyingglass";
      }
      else
      {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"+[ICSearchToken iconImageNameForSuggestionType:]" simulateCrash:1 showAlert:0 format:@"Undefined token type"];
        id result = @"camera.metering.unknown";
      }
      break;
    case 2uLL:
      id result = @"lock.fill";
      break;
    case 3uLL:
      id result = @"checklist";
      break;
    case 4uLL:
      id result = @"number";
      break;
    case 5uLL:
      id result = @"pencil.tip.crop.circle";
      break;
    case 6uLL:
      id result = @"doc.viewfinder";
      break;
    case 7uLL:
      id result = @"paperclip";
      break;
    default:
      return result;
  }
  return result;
}

+ (id)iconImageNameForCSToken:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 tokenKind];
    switch(v5)
    {
      case 2:
        unint64_t v6 = @"paperclip";
        break;
      case 3:
        unint64_t v6 = @"music.note";
        break;
      case 4:
      case 9:
      case 11:
      case 12:
      case 13:
      case 14:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
LABEL_18:
        v8 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v14 = 134217984;
          uint64_t v15 = [v4 tokenKind];
          _os_log_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_INFO, "Got token kind with unknown icon image name: %ld", (uint8_t *)&v14, 0xCu);
        }

        unint64_t v6 = @"magnifyingglass";
        break;
      case 5:
      case 7:
        unint64_t v6 = @"calendar";
        break;
      case 6:
        unint64_t v6 = @"doc";
        break;
      case 8:
        unint64_t v6 = @"folder";
        break;
      case 10:
      case 17:
        unint64_t v6 = @"photo";
        break;
      case 15:
        unint64_t v6 = @"note";
        break;
      case 16:
        unint64_t v6 = @"person";
        break;
      case 24:
        unint64_t v6 = @"number";
        break;
      default:
        unint64_t v6 = 0;
        switch(v5)
        {
          case '""':
            unint64_t v6 = @"textformat.size.larger";
            break;
          case '$':
            unint64_t v6 = @"video";
            break;
          case '%':
            unint64_t v6 = @"link";
            break;
          case '+':
            uint64_t v9 = (void *)MEMORY[0x1E4F1CA20];
            id v10 = [MEMORY[0x1E4F1CA20] currentLocale];
            v11 = [v10 languageCode];
            uint64_t v12 = [v9 lineDirectionForLanguage:v11];
            v13 = @"text.alignright";
            if (v12 == 1) {
              v13 = @"text.alignleft";
            }
            unint64_t v6 = v13;

            break;
          case '-':
            goto LABEL_5;
          default:
            goto LABEL_18;
        }
        break;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
LABEL_5:

  return v6;
}

- (_CSSuggestionToken)csToken
{
  return self->_csToken;
}

- (void)setCsToken:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subQueryString
{
  return self->_subQueryString;
}

- (unint64_t)suggestionType
{
  return self->_suggestionType;
}

- (NSString)iconImageName
{
  return self->_iconImageName;
}

- (void)setIconImageName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageName, 0);
  objc_storeStrong((id *)&self->_subQueryString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_csToken, 0);
}

- (void)scopeName
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*a2 selectedScope];
  unint64_t v7 = [*a2 scopes];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2048;
  uint64_t v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = [v7 count];
  _os_log_error_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_ERROR, "Search token %@ has selected scope out of range of available scopes (%lu/%lu).", (uint8_t *)&v8, 0x20u);
}

@end