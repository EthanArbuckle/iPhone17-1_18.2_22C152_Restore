@interface SKUILink
- (BOOL)isActionable;
- (NSDictionary)linkDictionary;
- (NSNumber)itemIdentifier;
- (NSString)targetString;
- (NSString)title;
- (NSURL)URL;
- (SKUIItem)item;
- (SKUILink)initWithComponentContext:(id)a3;
- (SKUILink)initWithLinkDictionary:(id)a3;
- (SKUILink)initWithURL:(id)a3;
- (SKUILink)initWithURL:(id)a3 title:(id)a4 targetString:(id)a5;
- (id)valueForMetricsField:(id)a3;
- (void)_setItem:(id)a3;
@end

@implementation SKUILink

- (SKUILink)initWithLinkDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUILink initWithLinkDictionary:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUILink;
  v13 = [(SKUILink *)&v24 init];
  if (v13)
  {
    v14 = [v4 objectForKey:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 copy];
      title = v13->_title;
      v13->_title = (NSString *)v15;
    }
    v17 = [v4 objectForKey:@"url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
      url = v13->_url;
      v13->_url = (NSURL *)v18;
    }
    v20 = [v4 objectForKey:@"target"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = [v20 copy];
      target = v13->_target;
      v13->_target = (NSString *)v21;
    }
  }

  return v13;
}

- (SKUILink)initWithComponentContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUILink initWithComponentContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)SKUILink;
  v13 = [(SKUILink *)&v32 init];
  if (v13)
  {
    v14 = [v4 componentDictionary];
    uint64_t v15 = [v14 objectForKey:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v15 copy];
      title = v13->_title;
      v13->_title = (NSString *)v16;
    }
    uint64_t v18 = [v14 objectForKey:@"url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
      url = v13->_url;
      v13->_url = (NSURL *)v19;
    }
    uint64_t v21 = [v14 objectForKey:@"lockupData"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[SKUIItem alloc] initWithLookupDictionary:v21];
      item = v13->_item;
      v13->_item = v22;
      objc_super v24 = v21;
    }
    else
    {
      objc_super v24 = [v14 objectForKey:@"adamId"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
      uint64_t v25 = [v4 itemForItemIdentifier:v24];
      v26 = v13->_item;
      v13->_item = (SKUIItem *)v25;

      if (v13->_item || ([v4 isUnavailableItemIdentifier:v24] & 1) != 0) {
        goto LABEL_16;
      }
      uint64_t v31 = [v24 copy];
      item = v13->_itemIdentifier;
      v13->_itemIdentifier = (NSNumber *)v31;
    }

LABEL_16:
    v27 = [v14 objectForKey:@"target"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v28 = [v27 copy];
      target = v13->_target;
      v13->_target = (NSString *)v28;
    }
  }

  return v13;
}

- (SKUILink)initWithURL:(id)a3
{
  return [(SKUILink *)self initWithURL:a3 title:0 targetString:0];
}

- (SKUILink)initWithURL:(id)a3 title:(id)a4 targetString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v11) {
        -[SKUILink initWithURL:title:targetString:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUILink;
  uint64_t v19 = [(SKUILink *)&v27 init];
  if (v19)
  {
    uint64_t v20 = [v10 copy];
    target = v19->_target;
    v19->_target = (NSString *)v20;

    uint64_t v22 = [v9 copy];
    title = v19->_title;
    v19->_title = (NSString *)v22;

    uint64_t v24 = [v8 copy];
    url = v19->_url;
    v19->_url = (NSURL *)v24;
  }
  return v19;
}

- (BOOL)isActionable
{
  return self->_url || self->_item != 0;
}

- (NSDictionary)linkDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
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
  if ([v4 isEqualToString:*MEMORY[0x1E4FA8890]])
  {
    item = self->_item;
    if (item)
    {
      objc_msgSend(NSNumber, "numberWithLongLong:", -[SKUIItem itemIdentifier](item, "itemIdentifier"));
      uint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = self->_itemIdentifier;
    }
    goto LABEL_8;
  }
  if (([v4 isEqualToString:*MEMORY[0x1E4FA88A0]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x1E4FA88A8]])
  {
    uint64_t v6 = [(SKUILink *)self title];
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
  BOOL v5 = (SKUIItem *)a3;
  item = self->_item;
  p_item = &self->_item;
  if (item != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_item, a3);
    BOOL v5 = v8;
  }
}

- (SKUIItem)item
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

- (void)initWithLinkDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithComponentContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithURL:(uint64_t)a3 title:(uint64_t)a4 targetString:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end