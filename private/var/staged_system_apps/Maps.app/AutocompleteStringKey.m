@interface AutocompleteStringKey
- (AutocompleteStringKey)init;
- (AutocompleteStringKey)initWithString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation AutocompleteStringKey

- (AutocompleteStringKey)init
{
  return 0;
}

- (AutocompleteStringKey)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AutocompleteStringKey;
  v5 = [(AutocompleteStringKey *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 lowercaseString];
    string = v5->_string;
    v5->_string = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_string hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AutocompleteStringKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(NSString *)self->_string isEqualToString:v5->_string];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  return +[NSString stringWithFormat:@"key - %@", self->_string];
}

- (void).cxx_destruct
{
}

@end