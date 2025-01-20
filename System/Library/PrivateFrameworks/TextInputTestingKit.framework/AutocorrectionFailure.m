@interface AutocorrectionFailure
- (AutocorrectionFailure)init;
- (BOOL)doesMatchResult:(id)a3;
@end

@implementation AutocorrectionFailure

- (void).cxx_destruct
{
}

- (BOOL)doesMatchResult:(id)a3
{
  id v4 = a3;
  v5 = [v4 corrected];
  v6 = [v5 componentsJoinedByString:&stru_26F2B7E50];
  v7 = [v6 lowercaseString];

  v8 = [v4 intended];
  v9 = [v8 componentsJoinedByString:&stru_26F2B7E50];
  v10 = [v9 lowercaseString];

  if ([v10 length])
  {
    unint64_t v11 = 0;
    while ([v7 length] > v11)
    {
      uint64_t v12 = [v10 characterAtIndex:v11];
      if (v12 != [v7 characterAtIndex:v11]
        && [(NSCharacterSet *)self->_letters characterIsMember:v12])
      {
        BOOL v13 = 1;
        goto LABEL_8;
      }
      if ([v10 length] <= ++v11) {
        break;
      }
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (AutocorrectionFailure)init
{
  v6.receiver = self;
  v6.super_class = (Class)AutocorrectionFailure;
  v2 = [(AutocorrectionFailure *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08708] letterCharacterSet];
    letters = v2->_letters;
    v2->_letters = (NSCharacterSet *)v3;
  }
  return v2;
}

@end