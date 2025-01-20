@interface RTFavoritesEntry
- (NSString)value;
- (RTContact)contact;
- (RTFavoritesEntry)initWithContact:(id)a3 value:(id)a4;
- (id)description;
@end

@implementation RTFavoritesEntry

- (RTFavoritesEntry)initWithContact:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTFavoritesEntry;
  v8 = [(RTFavoritesEntry *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    contact = v8->_contact;
    v8->_contact = (RTContact *)v9;

    uint64_t v11 = [v7 copy];
    value = v8->_value;
    v8->_value = (NSString *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = objc_opt_new();
  v4 = [(RTFavoritesEntry *)self contact];
  v5 = [(RTFavoritesEntry *)self value];
  [v3 appendFormat:@"contact, %@, value, %@", v4, v5];

  return v3;
}

- (RTContact)contact
{
  return self->_contact;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end