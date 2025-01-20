@interface PSIIndexToken
- (NSString)identifier;
- (NSString)text;
- (PSIIndexToken)initWithText:(id)a3 identifier:(id)a4 category:(signed __int16)a5 owningCategory:(signed __int16)a6;
- (id)description;
- (signed)category;
- (signed)owningCategory;
@end

@implementation PSIIndexToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (signed)owningCategory
{
  return self->_owningCategory;
}

- (signed)category
{
  return self->_category;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)text
{
  return self->_text;
}

- (id)description
{
  text = self->_text;
  identifier = self->_identifier;
  if (text)
  {
    if (identifier)
    {
      [NSString stringWithFormat:@"'%@' / '%@' (%d)", text, self->_identifier, self->_category];
      goto LABEL_6;
    }
    identifier = self->_text;
  }
  [NSString stringWithFormat:@"'%@' (%d)", identifier, self->_category, v6];
  v4 = LABEL_6:;
  return v4;
}

- (PSIIndexToken)initWithText:(id)a3 identifier:(id)a4 category:(signed __int16)a5 owningCategory:(signed __int16)a6
{
  unint64_t v11 = (unint64_t)a3;
  unint64_t v12 = (unint64_t)a4;
  if (!(v11 | v12))
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PSIIndexToken.m" lineNumber:17 description:@"text and identifier cannot be both nil"];
  }
  v20.receiver = self;
  v20.super_class = (Class)PSIIndexToken;
  v13 = [(PSIIndexToken *)&v20 init];
  if (v13)
  {
    uint64_t v14 = [(id)v11 copy];
    text = v13->_text;
    v13->_text = (NSString *)v14;

    uint64_t v16 = [(id)v12 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    v13->_category = a5;
    v13->_owningCategory = a6;
  }

  return v13;
}

@end