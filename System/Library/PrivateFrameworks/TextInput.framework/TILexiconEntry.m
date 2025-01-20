@interface TILexiconEntry
+ (BOOL)supportsSecureCoding;
+ (id)entryWithDocumentText:(id)a3 userInput:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)documentText;
- (NSString)userInput;
- (TILexiconEntry)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TILexiconEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentText, 0);

  objc_storeStrong((id *)&self->_userInput, 0);
}

- (NSString)documentText
{
  return self->_documentText;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  userInput = self->_userInput;
  id v7 = v4;
  if (userInput)
  {
    [v4 encodeObject:userInput forKey:@"userInput"];
    id v4 = v7;
  }
  documentText = self->_documentText;
  if (documentText)
  {
    [v7 encodeObject:documentText forKey:@"documentText"];
    id v4 = v7;
  }
}

- (TILexiconEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TILexiconEntry;
  v5 = [(TILexiconEntry *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userInput"];
    userInput = v5->_userInput;
    v5->_userInput = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentText"];
    documentText = v5->_documentText;
    v5->_documentText = (NSString *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(TILexiconEntry *)self userInput];
    uint64_t v7 = [v5 userInput];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      v9 = [(TILexiconEntry *)self userInput];
      v10 = [v5 userInput];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(TILexiconEntry *)self documentText];
    v14 = [v5 documentText];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(TILexiconEntry *)self documentText];
      v16 = [v5 documentText];
      char v12 = [v15 isEqual:v16];
    }
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(TILexiconEntry);
  uint64_t v5 = [(NSString *)self->_userInput copy];
  userInput = v4->_userInput;
  v4->_userInput = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_documentText copy];
  documentText = v4->_documentText;
  v4->_documentText = (NSString *)v7;

  return v4;
}

+ (id)entryWithDocumentText:(id)a3 userInput:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(TILexiconEntry);
  uint64_t v8 = [v6 copy];

  documentText = v7->_documentText;
  v7->_documentText = (NSString *)v8;

  uint64_t v10 = [v5 copy];
  userInput = v7->_userInput;
  v7->_userInput = (NSString *)v10;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end