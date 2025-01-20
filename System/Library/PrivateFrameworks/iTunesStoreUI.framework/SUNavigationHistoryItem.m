@interface SUNavigationHistoryItem
- (NSString)title;
- (SSURLRequestProperties)URLRequestProperties;
- (SUNavigationHistoryItem)init;
- (SUNavigationHistoryItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation SUNavigationHistoryItem

- (SUNavigationHistoryItem)init
{
  return [(SUNavigationHistoryItem *)self initWithDictionary:0];
}

- (SUNavigationHistoryItem)initWithDictionary:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUNavigationHistoryItem;
  v4 = [(SUNavigationHistoryItem *)&v10 init];
  if (v4)
  {
    v5 = (void *)[a3 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_title = (NSString *)v5;
    }
    uint64_t v6 = [a3 objectForKey:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [objc_alloc(NSURL) initWithString:v6];
      if (v7)
      {
        v8 = (void *)v7;
        v4->_urlRequestProperties = (SSURLRequestProperties *)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:v7];
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUNavigationHistoryItem;
  [(SUNavigationHistoryItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSString *)self->_title copyWithZone:a3];
  v5[2] = [(SSURLRequestProperties *)self->_urlRequestProperties copyWithZone:a3];
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (SSURLRequestProperties)URLRequestProperties
{
  return self->_urlRequestProperties;
}

@end