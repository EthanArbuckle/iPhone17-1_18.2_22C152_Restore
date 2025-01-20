@interface STUIStatusBarIdentifier
+ (id)displayIdentifierFromStringRepresentation:(id)a3;
+ (id)identifierForObject:(id)a3 string:(id)a4;
+ (id)uninternedIdentifierForObject:(id)a3 string:(id)a4;
- (NSString)string;
- (NSString)stringRepresentation;
- (id)description;
- (id)object;
- (void)setObject:(id)a3;
- (void)setString:(id)a3;
@end

@implementation STUIStatusBarIdentifier

+ (id)identifierForObject:(id)a3 string:(id)a4
{
  id v5 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  v8 = &stru_1F2F86950;
  if (v6) {
    v8 = v6;
  }
  v9 = v8;
  v10 = objc_getAssociatedObject(v5, &STUIStatusBarIdentifiers);
  if (v10)
  {
    v11 = v10;
    v12 = [v10 objectForKeyedSubscript:v9];
    if (v12) {
      goto LABEL_8;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_setAssociatedObject(v5, &STUIStatusBarIdentifiers, v11, (void *)1);
  }
  v12 = objc_alloc_init(STUIStatusBarIdentifier);
  [(STUIStatusBarIdentifier *)v12 setObject:v5];
  [(STUIStatusBarIdentifier *)v12 setString:v7];
  [v11 setObject:v12 forKeyedSubscript:v9];
LABEL_8:

  return v12;
}

- (id)object
{
  return self->_object;
}

+ (id)uninternedIdentifierForObject:(id)a3 string:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(STUIStatusBarIdentifier);
  [(STUIStatusBarIdentifier *)v7 setObject:v6];

  [(STUIStatusBarIdentifier *)v7 setString:v5];
  return v7;
}

- (void)setString:(id)a3
{
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong(&self->_object, 0);
}

- (id)description
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(STUIStatusBarIdentifier *)self stringRepresentation];
  }
  else
  {
    v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
    id v5 = [(STUIStatusBarIdentifier *)self object];
    id v6 = (id)[v4 appendObject:v5 withName:@"object"];

    v7 = [(STUIStatusBarIdentifier *)self string];
    [v4 appendString:v7 withName:@"string"];

    v3 = [v4 build];
  }
  return v3;
}

- (NSString)string
{
  return self->_string;
}

+ (id)displayIdentifierFromStringRepresentation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"."];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v3;
    v7 = 0;
  }
  else
  {
    uint64_t v8 = v4;
    uint64_t v9 = v5;
    id v6 = [v3 substringToIndex:v4];
    v7 = [v3 substringFromIndex:v8 + v9];
  }
  id v10 = v6;
  uint64_t v11 = [v10 rangeOfString:@"/"];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
    v14 = (NSString *)v10;
  }
  else
  {
    uint64_t v15 = v11;
    uint64_t v16 = v12;
    v14 = [v10 substringToIndex:v11];

    v13 = [v10 substringFromIndex:v15 + v16];
  }
  Class v17 = NSClassFromString(v14);
  if (v17)
  {
    v18 = +[STUIStatusBarIdentifier identifierForObject:v17 string:v13];
    v19 = +[STUIStatusBarIdentifier identifierForObject:v18 string:v7];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)stringRepresentation
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id object = self->_object;
  if (isKindOfClass)
  {
    id v5 = object;
    id v6 = [v5 string];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      uint64_t v8 = NSString;
      uint64_t v9 = NSStringFromClass((Class)[v5 object]);
      id v10 = [v5 string];
      uint64_t v11 = [v8 stringWithFormat:@"%@/%@", v9, v10];
    }
    else
    {
      uint64_t v11 = NSStringFromClass((Class)[v5 object]);
    }
    if ([(NSString *)self->_string length])
    {
      id v13 = [NSString stringWithFormat:@"%@.%@", v11, self->_string];
    }
    else
    {
      id v13 = v11;
    }
    uint64_t v12 = v13;
  }
  else
  {
    uint64_t v12 = NSStringFromClass((Class)object);
  }
  return (NSString *)v12;
}

@end