@interface SUCompletionItem
- (NSString)alternateTitle;
- (NSString)title;
- (NSURL)URL;
- (SUCompletionItem)init;
- (SUCompletionItem)initWithPropertyList:(id)a3;
- (void)dealloc;
@end

@implementation SUCompletionItem

- (SUCompletionItem)init
{
  return [(SUCompletionItem *)self initWithPropertyList:0];
}

- (SUCompletionItem)initWithPropertyList:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUCompletionItem;
  v4 = [(SUCompletionItem *)&v9 init];
  if (v4)
  {
    v5 = (void *)[a3 objectForKey:@"search-field-term"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_alternateTitle = (NSString *)v5;
    }
    v6 = (void *)[a3 objectForKey:@"term"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_title = (NSString *)v6;
    }
    uint64_t v7 = [a3 objectForKey:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_url = (NSURL *)[objc_alloc(NSURL) initWithString:v7];
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUCompletionItem;
  [(SUCompletionItem *)&v3 dealloc];
}

- (NSString)alternateTitle
{
  return self->_alternateTitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_url;
}

@end