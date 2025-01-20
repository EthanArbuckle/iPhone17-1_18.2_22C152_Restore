@interface SUUICompletion
- (NSMutableDictionary)cacheRepresentation;
- (NSString)URLString;
- (NSString)alternateTitle;
- (NSString)title;
- (SUUICompletion)initWithCacheRepresentation:(id)a3;
- (SUUICompletion)initWithCompletionDictionary:(id)a3;
@end

@implementation SUUICompletion

- (SUUICompletion)initWithCompletionDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUICompletion;
  v5 = [(SUUICompletion *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"term"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      title = v5->_title;
      v5->_title = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"search-field-term"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      alternateTitle = v5->_alternateTitle;
      v5->_alternateTitle = (NSString *)v10;
    }
    v12 = [v4 objectForKey:@"url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      URLString = v5->_URLString;
      v5->_URLString = (NSString *)v13;
    }
  }

  return v5;
}

- (SUUICompletion)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16.receiver = self;
    v16.super_class = (Class)SUUICompletion;
    v5 = [(SUUICompletion *)&v16 init];
    if (v5)
    {
      v6 = [v4 objectForKey:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v6 copy];
        title = v5->_title;
        v5->_title = (NSString *)v7;
      }
      v9 = [v4 objectForKey:@"alttitle"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 copy];
        alternateTitle = v5->_alternateTitle;
        v5->_alternateTitle = (NSString *)v10;
      }
      v12 = [v4 objectForKey:@"url"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 copy];
        URLString = v5->_URLString;
        v5->_URLString = (NSString *)v13;
      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  alternateTitle = self->_alternateTitle;
  if (alternateTitle) {
    [v4 setObject:alternateTitle forKey:@"alttitle"];
  }
  URLString = self->_URLString;
  if (URLString) {
    [v4 setObject:URLString forKey:@"url"];
  }
  return (NSMutableDictionary *)v4;
}

- (NSString)alternateTitle
{
  return self->_alternateTitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alternateTitle, 0);
}

@end