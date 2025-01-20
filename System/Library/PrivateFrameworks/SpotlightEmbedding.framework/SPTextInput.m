@interface SPTextInput
- (NSArray)tokenIDs;
- (NSAttributedString)attributedString;
- (NSString)text;
- (SPTextInput)initWithAttributedString:(id)a3;
- (SPTextInput)initWithText:(id)a3;
- (SPTextInput)initWithTokenIds:(id)a3;
- (unint64_t)tokenLength;
- (unint64_t)type;
- (void)setAttributedString:(id)a3;
- (void)setText:(id)a3;
- (void)setTokenIDs:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SPTextInput

- (SPTextInput)initWithText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPTextInput;
  v6 = [(SPTextInput *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_text, a3);
    v7->_type = 1;
  }

  return v7;
}

- (SPTextInput)initWithTokenIds:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPTextInput;
  id v5 = [(SPTextInput *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tokenIDs = v5->_tokenIDs;
    v5->_tokenIDs = (NSArray *)v6;

    v5->_type = 2;
  }

  return v5;
}

- (SPTextInput)initWithAttributedString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPTextInput;
  uint64_t v6 = [(SPTextInput *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attributedString, a3);
    v7->_type = 3;
  }

  return v7;
}

- (unint64_t)tokenLength
{
  if ([(SPTextInput *)self type] != 2) {
    return 0;
  }
  v3 = [(SPTextInput *)self tokenIDs];
  unint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(SPTextInput *)self tokenIDs];
    uint64_t v6 = [v5 firstObject];
    unsigned int v7 = [v6 isEqualToNumber:&unk_270B0F9F8];

    v4 -= v7;
    v8 = [(SPTextInput *)self tokenIDs];
    if ((unint64_t)[v8 count] <= 1)
    {
    }
    else
    {
      objc_super v9 = [(SPTextInput *)self tokenIDs];
      v10 = [v9 lastObject];
      unsigned int v11 = [v10 isEqualToNumber:&unk_270B0F9F8];

      v4 -= v11;
    }
  }
  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSArray)tokenIDs
{
  return self->_tokenIDs;
}

- (void)setTokenIDs:(id)a3
{
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_tokenIDs, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end