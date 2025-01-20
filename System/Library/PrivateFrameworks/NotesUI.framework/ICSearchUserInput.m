@interface ICSearchUserInput
+ (id)emptyInput;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (ICSearchUserInput)initWithSearchString:(id)a3 tokens:(id)a4 keyboardLanguage:(id)a5;
- (NSArray)tokens;
- (NSString)displayString;
- (NSString)keyboardLanguage;
- (NSString)searchString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_configureEmptyInput;
@end

@implementation ICSearchUserInput

+ (id)emptyInput
{
  v2 = objc_alloc_init(ICSearchUserInput);
  [(ICSearchUserInput *)v2 _configureEmptyInput];
  return v2;
}

- (ICSearchUserInput)initWithSearchString:(id)a3 tokens:(id)a4 keyboardLanguage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICSearchUserInput;
  v12 = [(ICSearchUserInput *)&v17 init];
  if (v12)
  {
    if (v10)
    {
      if ([v9 length]) {
        BOOL v13 = 0;
      }
      else {
        BOOL v13 = [v10 count] == 0;
      }
    }
    else
    {
      BOOL v13 = 1;
    }
    v12->_isEmpty = v13;
    if (![(ICSearchUserInput *)v12 isEmpty])
    {
      objc_storeStrong((id *)&v12->_searchString, a3);
      uint64_t v14 = [v10 copy];
      tokens = v12->_tokens;
      v12->_tokens = (NSArray *)v14;

      objc_storeStrong((id *)&v12->_keyboardLanguage, a5);
    }
  }

  return v12;
}

- (void)_configureEmptyInput
{
  self->_isEmpty = 1;
  searchString = self->_searchString;
  self->_searchString = 0;

  tokens = self->_tokens;
  self->_tokens = 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();

  if (v5)
  {
    v6 = [(ICSearchUserInput *)self searchString];
    v7 = objc_msgSend(v6, "ic_trimmedString");
    v8 = [v5 searchString];
    id v9 = objc_msgSend(v8, "ic_trimmedString");
    if ([v7 isEqual:v9])
    {
      id v10 = [(ICSearchUserInput *)self tokens];
      id v11 = [v5 tokens];
      char v12 = [v10 isEqualToArray:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICSearchUserInput *)self searchString];
  v7 = [(ICSearchUserInput *)self tokens];
  v8 = [v3 stringWithFormat:@"%@ - searchString: %@, tokens: %@", v5, v6, v7];

  return v8;
}

- (NSString)displayString
{
  v3 = [(ICSearchUserInput *)self searchString];
  id v4 = objc_msgSend(v3, "ic_trimmedString");

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    v6 = [(ICSearchUserInput *)self tokens];
    uint64_t v7 = [v6 count];

    if (v7 == 1)
    {
      v8 = [(ICSearchUserInput *)self tokens];
      id v9 = [v8 firstObject];
      id v5 = [v9 title];
    }
    else
    {
      id v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ICSearchUserInput allocWithZone:a3];
  id v5 = [(ICSearchUserInput *)self searchString];
  v6 = (void *)[v5 copy];
  uint64_t v7 = [(ICSearchUserInput *)self tokens];
  v8 = (void *)[v7 copy];
  id v9 = [(ICSearchUserInput *)self keyboardLanguage];
  id v10 = (void *)[v9 copy];
  id v11 = [(ICSearchUserInput *)v4 initWithSearchString:v6 tokens:v8 keyboardLanguage:v10];

  return v11;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (BOOL)isEmpty
{
  return self->_isEmpty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end