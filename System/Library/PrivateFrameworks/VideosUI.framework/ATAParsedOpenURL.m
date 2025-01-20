@interface ATAParsedOpenURL
+ (id)_logStringForType:(unint64_t)a3;
+ (id)parsedOpenURLWithURL:(id)a3 andOptions:(id)a4;
- (ATAParsedOpenURL)init;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)options;
- (NSString)tabBarItemIdentifier;
- (NSURL)URL;
- (id)_initWithURL:(id)a3 options:(id)a4 type:(unint64_t)a5;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setOptions:(id)a3;
- (void)setTabBarItemIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setURL:(id)a3;
@end

@implementation ATAParsedOpenURL

+ (id)parsedOpenURLWithURL:(id)a3 andOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:0];
    v8 = [v7 host];
    if (v8)
    {
      id v9 = [[ATAParsedOpenURL alloc] _initWithURL:v5 options:v6 type:0];
      [v9 setTabBarItemIdentifier:v8];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (ATAParsedOpenURL)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (id)_initWithURL:(id)a3 options:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATAParsedOpenURL;
  v10 = [(ATAParsedOpenURL *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    URL = v10->_URL;
    v10->_URL = (NSURL *)v11;

    uint64_t v13 = [v9 copy];
    options = v10->_options;
    v10->_options = (NSDictionary *)v13;

    v10->_type = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ATAParsedOpenURL *)self type];
  uint64_t v4 = [(ATAParsedOpenURL *)self URL];
  uint64_t v5 = [v4 hash] ^ v3;

  id v6 = [(ATAParsedOpenURL *)self options];
  uint64_t v7 = [v6 hash];

  id v8 = [(ATAParsedOpenURL *)self tabBarItemIdentifier];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATAParsedOpenURL *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        unint64_t v7 = [(ATAParsedOpenURL *)self type];
        if (v7 != [(ATAParsedOpenURL *)v6 type])
        {
LABEL_17:
          char v13 = 0;
LABEL_25:

          goto LABEL_26;
        }
        id v8 = [(ATAParsedOpenURL *)self URL];
        unint64_t v9 = [(ATAParsedOpenURL *)v6 URL];
        id v10 = v8;
        id v11 = v9;
        if (v10 == v11)
        {
        }
        else
        {
          v12 = v11;
          char v13 = 0;
          if (!v10 || !v11) {
            goto LABEL_24;
          }
          char v14 = [v10 isEqual:v11];

          if ((v14 & 1) == 0) {
            goto LABEL_17;
          }
        }
        v15 = [(ATAParsedOpenURL *)self options];
        objc_super v16 = [(ATAParsedOpenURL *)v6 options];
        id v10 = v15;
        id v17 = v16;
        if (v10 == v17)
        {

LABEL_19:
          v19 = [(ATAParsedOpenURL *)self tabBarItemIdentifier];
          v20 = [(ATAParsedOpenURL *)v6 tabBarItemIdentifier];
          id v10 = v19;
          id v21 = v20;
          v12 = v21;
          if (v10 == v21)
          {
            char v13 = 1;
          }
          else
          {
            char v13 = 0;
            if (v10 && v21) {
              char v13 = [v10 isEqual:v21];
            }
          }
          goto LABEL_24;
        }
        v12 = v17;
        char v13 = 0;
        if (v10 && v17)
        {
          char v18 = [v10 isEqual:v17];

          if ((v18 & 1) == 0) {
            goto LABEL_17;
          }
          goto LABEL_19;
        }
LABEL_24:

        goto LABEL_25;
      }
    }
    char v13 = 0;
  }
LABEL_26:

  return v13;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21.receiver = self;
  v21.super_class = (Class)ATAParsedOpenURL;
  uint64_t v4 = [(ATAParsedOpenURL *)&v21 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  id v6 = [(ATAParsedOpenURL *)self URL];
  unint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"URL", v6];
  [v3 addObject:v7];

  id v8 = NSString;
  unint64_t v9 = [(ATAParsedOpenURL *)self options];
  id v10 = [v8 stringWithFormat:@"%@=%@", @"options", v9];
  [v3 addObject:v10];

  id v11 = NSString;
  v12 = objc_msgSend((id)objc_opt_class(), "_logStringForType:", -[ATAParsedOpenURL type](self, "type"));
  char v13 = [v11 stringWithFormat:@"%@=%@", @"type", v12];
  [v3 addObject:v13];

  char v14 = NSString;
  v15 = [(ATAParsedOpenURL *)self tabBarItemIdentifier];
  objc_super v16 = [v14 stringWithFormat:@"%@=%@", @"tabBarItemIdentifier", v15];
  [v3 addObject:v16];

  id v17 = NSString;
  char v18 = [v3 componentsJoinedByString:@", "];
  v19 = [v17 stringWithFormat:@"<%@>", v18];

  return v19;
}

+ (id)_logStringForType:(unint64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return @"ATAParsedOpenURLTypeSwitchToTabBarItem";
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
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

- (NSString)tabBarItemIdentifier
{
  return self->_tabBarItemIdentifier;
}

- (void)setTabBarItemIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarItemIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end