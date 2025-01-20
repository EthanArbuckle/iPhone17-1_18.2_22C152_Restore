@interface PSISynonym
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)text;
- (PSISynonym)initWithText:(id)a3 category:(unint64_t)a4 owningGroupId:(unint64_t)a5 identifier:(id)a6;
- (id)description;
- (unint64_t)category;
- (unint64_t)hash;
- (unint64_t)owningGroupId;
@end

@implementation PSISynonym

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)owningGroupId
{
  return self->_owningGroupId;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)text
{
  return self->_text;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"'%@' (%d) -> %d, %@", self->_text, self->_category, self->_owningGroupId, self->_identifier];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSISynonym *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      unint64_t category = self->_category;
      unint64_t owningGroupId = self->_owningGroupId;
      unint64_t v10 = v4->_category;
      unint64_t v9 = v4->_owningGroupId;
      v11 = v4;
      char IsEqual = PLObjectIsEqual();

      char v13 = PLObjectIsEqual();
      if (category == v10 && owningGroupId == v9) {
        char v15 = IsEqual;
      }
      else {
        char v15 = 0;
      }
      char v6 = v15 & v13;
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_category ^ [(NSString *)self->_text hash] ^ (self->_owningGroupId << 32);
  return v3 ^ [(NSString *)self->_identifier hash];
}

- (PSISynonym)initWithText:(id)a3 category:(unint64_t)a4 owningGroupId:(unint64_t)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PSISynonym;
  v12 = [(PSISynonym *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    text = v12->_text;
    v12->_text = (NSString *)v13;

    v12->_unint64_t category = a4;
    v12->_unint64_t owningGroupId = a5;
    uint64_t v15 = [v11 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v15;
  }
  return v12;
}

@end