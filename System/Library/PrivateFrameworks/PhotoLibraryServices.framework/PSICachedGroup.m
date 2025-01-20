@interface PSICachedGroup
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)text;
- (PSICachedGroup)initWithText:(id)a3 identifier:(id)a4 category:(unint64_t)a5 owningGroupId:(unint64_t)a6;
- (id)description;
- (unint64_t)category;
- (unint64_t)groupId;
- (unint64_t)hash;
- (unint64_t)owningGroupId;
- (void)setGroupId:(unint64_t)a3;
@end

@implementation PSICachedGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setGroupId:(unint64_t)a3
{
  self->_groupId = a3;
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (unint64_t)owningGroupId
{
  return self->_owningGroupId;
}

- (unint64_t)category
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
  if (text)
  {
    v3 = @"text";
  }
  else
  {
    text = self->_identifier;
    v3 = @"identifier";
  }
  return (id)[NSString stringWithFormat:@"'%@' (%@, %d) -> %d", text, v3, self->_category, self->_owningGroupId];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSICachedGroup *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = v7;
      if (self->_category == v7->_category
        && self->_owningGroupId == v7->_owningGroupId
        && ((text = self->_text, text == v8->_text) || -[NSString isEqualToString:](text, "isEqualToString:")))
      {
        identifier = self->_identifier;
        if (identifier == v8->_identifier) {
          char v6 = 1;
        }
        else {
          char v6 = -[NSString isEqualToString:](identifier, "isEqualToString:");
        }
      }
      else
      {
        char v6 = 0;
      }
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
  NSUInteger v3 = [(NSString *)self->_text hash];
  return [(NSString *)self->_identifier hash] ^ v3 ^ self->_category ^ (self->_owningGroupId << 32);
}

- (PSICachedGroup)initWithText:(id)a3 identifier:(id)a4 category:(unint64_t)a5 owningGroupId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PSICachedGroup;
  v12 = [(PSICachedGroup *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    text = v12->_text;
    v12->_text = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v15;

    v12->_category = a5;
    v12->_owningGroupId = a6;
  }

  return v12;
}

@end