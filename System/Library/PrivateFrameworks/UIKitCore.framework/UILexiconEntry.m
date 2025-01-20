@interface UILexiconEntry
+ (id)_entryWithTILexiconEntry:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)documentText;
- (NSString)userInput;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation UILexiconEntry

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(UILexiconEntry);
  uint64_t v5 = [(NSString *)self->_userInput copy];
  userInput = v4->_userInput;
  v4->_userInput = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_documentText copy];
  documentText = v4->_documentText;
  v4->_documentText = (NSString *)v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [(UILexiconEntry *)self userInput];
    uint64_t v7 = [v5 userInput];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(UILexiconEntry *)self userInput];
      v10 = [v5 userInput];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(UILexiconEntry *)self documentText];
    v14 = [v5 documentText];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(UILexiconEntry *)self documentText];
      v16 = [v5 documentText];
      char v12 = [v15 isEqual:v16];
    }
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

+ (id)_entryWithTILexiconEntry:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(UILexiconEntry);
  id v5 = [v3 documentText];
  uint64_t v6 = [v5 copy];
  documentText = v4->_documentText;
  v4->_documentText = (NSString *)v6;

  v8 = [v3 userInput];

  uint64_t v9 = [v8 copy];
  userInput = v4->_userInput;
  v4->_userInput = (NSString *)v9;

  if (!v4->_userInput) {
    objc_storeStrong((id *)&v4->_userInput, v4->_documentText);
  }
  return v4;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (NSString)documentText
{
  return self->_documentText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentText, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
}

@end