@interface SUUILink
- (BOOL)isActionable;
- (NSDictionary)linkDictionary;
- (NSNumber)itemIdentifier;
- (NSString)targetString;
- (NSString)title;
- (NSURL)URL;
- (SUUIItem)item;
- (SUUILink)initWithComponentContext:(id)a3;
- (SUUILink)initWithLinkDictionary:(id)a3;
- (SUUILink)initWithURL:(id)a3;
- (SUUILink)initWithURL:(id)a3 title:(id)a4 targetString:(id)a5;
- (id)valueForMetricsField:(id)a3;
- (void)_setItem:(id)a3;
@end

@implementation SUUILink

- (SUUILink)initWithLinkDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUILink;
  v5 = [(SUUILink *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      title = v5->_title;
      v5->_title = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [NSURL URLWithString:v9];
      url = v5->_url;
      v5->_url = (NSURL *)v10;
    }
    v12 = [v4 objectForKey:@"target"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      target = v5->_target;
      v5->_target = (NSString *)v13;
    }
  }

  return v5;
}

- (SUUILink)initWithComponentContext:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SUUILink;
  v5 = [(SUUILink *)&v24 init];
  if (!v5) {
    goto LABEL_15;
  }
  v6 = [v4 componentDictionary];
  uint64_t v7 = [v6 objectForKey:@"label"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v7 copy];
    title = v5->_title;
    v5->_title = (NSString *)v8;
  }
  uint64_t v10 = [v6 objectForKey:@"url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [NSURL URLWithString:v10];
    url = v5->_url;
    v5->_url = (NSURL *)v11;
  }
  uint64_t v13 = [v6 objectForKey:@"lockupData"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [[SUUIItem alloc] initWithLookupDictionary:v13];
    item = v5->_item;
    v5->_item = v14;
    objc_super v16 = v13;
  }
  else
  {
    objc_super v16 = [v6 objectForKey:@"adamId"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    uint64_t v17 = [v4 itemForItemIdentifier:v16];
    v18 = v5->_item;
    v5->_item = (SUUIItem *)v17;

    if (v5->_item || ([v4 isUnavailableItemIdentifier:v16] & 1) != 0) {
      goto LABEL_12;
    }
    uint64_t v23 = [v16 copy];
    item = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSNumber *)v23;
  }

LABEL_12:
  v19 = [v6 objectForKey:@"target"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [v19 copy];
    target = v5->_target;
    v5->_target = (NSString *)v20;
  }
LABEL_15:

  return v5;
}

- (SUUILink)initWithURL:(id)a3
{
  return [(SUUILink *)self initWithURL:a3 title:0 targetString:0];
}

- (SUUILink)initWithURL:(id)a3 title:(id)a4 targetString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SUUILink;
  uint64_t v11 = [(SUUILink *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    target = v11->_target;
    v11->_target = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    title = v11->_title;
    v11->_title = (NSString *)v14;

    uint64_t v16 = [v8 copy];
    url = v11->_url;
    v11->_url = (NSURL *)v16;
  }
  return v11;
}

- (BOOL)isActionable
{
  return self->_url || self->_item != 0;
}

- (NSDictionary)linkDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  target = self->_target;
  if (target) {
    [v3 setObject:target forKey:@"target"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"label"];
  }
  url = self->_url;
  if (url)
  {
    id v8 = [(NSURL *)url absoluteString];
    [v4 setObject:v8 forKey:@"url"];
  }
  return (NSDictionary *)v4;
}

- (id)valueForMetricsField:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F7BB68]])
  {
    item = self->_item;
    if (item)
    {
      objc_msgSend(NSNumber, "numberWithLongLong:", -[SUUIItem itemIdentifier](item, "itemIdentifier"));
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = self->_itemIdentifier;
    }
    goto LABEL_8;
  }
  if (([v4 isEqualToString:*MEMORY[0x263F7BB78]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263F7BB80]])
  {
    v6 = [(SUUILink *)self title];
LABEL_8:
    uint64_t v7 = v6;
    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_9:

  return v7;
}

- (void)_setItem:(id)a3
{
  v5 = (SUUIItem *)a3;
  item = self->_item;
  p_item = &self->_item;
  if (item != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_item, a3);
    v5 = v8;
  }
}

- (SUUIItem)item
{
  return self->_item;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)targetString
{
  return self->_target;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_countdown, 0);
}

@end