@interface SKUICompletion
- (NSMutableDictionary)cacheRepresentation;
- (NSString)URLString;
- (NSString)alternateTitle;
- (NSString)title;
- (SKUICompletion)initWithCacheRepresentation:(id)a3;
- (SKUICompletion)initWithCompletionDictionary:(id)a3;
@end

@implementation SKUICompletion

- (SKUICompletion)initWithCompletionDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICompletion initWithCompletionDictionary:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUICompletion;
  v13 = [(SKUICompletion *)&v24 init];
  if (v13)
  {
    v14 = [v4 objectForKey:@"term"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 copy];
      title = v13->_title;
      v13->_title = (NSString *)v15;
    }
    v17 = [v4 objectForKey:@"search-field-term"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v17 copy];
      alternateTitle = v13->_alternateTitle;
      v13->_alternateTitle = (NSString *)v18;
    }
    v20 = [v4 objectForKey:@"url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = [v20 copy];
      URLString = v13->_URLString;
      v13->_URLString = (NSString *)v21;
    }
  }

  return v13;
}

- (SKUICompletion)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICompletion initWithCacheRepresentation:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUICompletion;
  v13 = [(SKUICompletion *)&v23 init];
  if (v13)
  {
    v14 = [v4 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 copy];
      title = v13->_title;
      v13->_title = (NSString *)v15;
    }
    v17 = [v4 objectForKey:@"alttitle"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v17 copy];
      alternateTitle = v13->_alternateTitle;
      v13->_alternateTitle = (NSString *)v18;
    }
    self = [v4 objectForKey:@"url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [(SKUICompletion *)self copy];
      URLString = v13->_URLString;
      v13->_URLString = (NSString *)v20;
    }
    goto LABEL_14;
  }
LABEL_15:

  return v13;
}

- (NSMutableDictionary)cacheRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
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

- (void)initWithCompletionDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCacheRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end