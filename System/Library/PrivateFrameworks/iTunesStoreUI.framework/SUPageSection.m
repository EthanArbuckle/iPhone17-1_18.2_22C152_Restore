@interface SUPageSection
- (BOOL)isEqual:(id)a3;
- (BOOL)loadFromDictionary:(id)a3;
- (NSString)identifier;
- (NSString)title;
- (SSURLRequestProperties)URLRequestProperties;
- (SUPageSection)init;
- (UIImage)image;
- (double)expirationTime;
- (id)segmentedControlItem;
- (id)userInfo;
- (int64_t)structuredPageType;
- (void)_setURL:(id)a3;
- (void)_setURLBagKey:(id)a3;
- (void)dealloc;
- (void)setExpirationTime:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setStructuredPageType:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setURLRequestProperties:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation SUPageSection

- (SUPageSection)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUPageSection;
  result = [(SUPageSection *)&v3 init];
  if (result) {
    result->_expirationTime = 1.79769313e308;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUPageSection;
  [(SUPageSection *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = [(SUPageSection *)self identifier];
  uint64_t v7 = [a3 identifier];
  if (isKindOfClass) {
    int v8 = v6 == (NSString *)v7 || [(NSString *)v6 isEqualToString:v7];
  }
  else {
    int v8 = 0;
  }
  v9 = [(SUPageSection *)self title];
  uint64_t v10 = [a3 title];
  if (!v8) {
    return 0;
  }
  uint64_t v11 = v10;
  if (v9 != (NSString *)v10 && ![(NSString *)v9 isEqualToString:v10]) {
    return 0;
  }
  v12 = [(SUPageSection *)self URLRequestProperties];
  uint64_t v13 = [a3 URLRequestProperties];

  return [(SSURLRequestProperties *)v12 isEqual:v13];
}

- (BOOL)loadFromDictionary:(id)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F7B2D0]) initWithDictionary:a3];
  v5 = (void *)[v4 dictionaryByEvaluatingConditions];

  uint64_t v6 = [v5 objectForKey:@"template-name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUPageSection *)self setStructuredPageType:+[SUStructuredPage pageTypeForStorePageString:v6]];
  }
  uint64_t v7 = [v5 objectForKey:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUPageSection *)self setTitle:v7];
  }
  uint64_t v8 = [v5 objectForKey:@"url-bag-key"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUPageSection *)self _setURLBagKey:v8];
  }
  uint64_t v9 = [v5 objectForKey:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [objc_alloc(NSURL) initWithString:v9];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      [(SUPageSection *)self _setURL:v10];
    }
  }
  NSUInteger v12 = [(NSString *)[(SUPageSection *)self title] length];
  if (v12) {
    LOBYTE(v12) = ((uint64_t)self->_urlRequestProperties | v6) != 0;
  }
  return v12;
}

- (id)segmentedControlItem
{
  id result = self->_image;
  if (!result) {
    return self->_title;
  }
  return result;
}

- (void)setURLRequestProperties:(id)a3
{
  urlRequestProperties = self->_urlRequestProperties;
  if (urlRequestProperties != a3)
  {

    self->_urlRequestProperties = (SSMutableURLRequestProperties *)[a3 mutableCopy];
  }
}

- (void)_setURL:(id)a3
{
  urlRequestProperties = self->_urlRequestProperties;
  if (!urlRequestProperties)
  {
    urlRequestProperties = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x263F7B290]);
    self->_urlRequestProperties = urlRequestProperties;
  }

  [(SSMutableURLRequestProperties *)urlRequestProperties setURL:a3];
}

- (void)_setURLBagKey:(id)a3
{
  urlRequestProperties = self->_urlRequestProperties;
  if (!urlRequestProperties)
  {
    urlRequestProperties = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x263F7B290]);
    self->_urlRequestProperties = urlRequestProperties;
  }

  [(SSMutableURLRequestProperties *)urlRequestProperties setURLBagKey:a3];
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(double)a3
{
  self->_expirationTime = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (int64_t)structuredPageType
{
  return self->_structuredPageType;
}

- (void)setStructuredPageType:(int64_t)a3
{
  self->_structuredPageType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (SSURLRequestProperties)URLRequestProperties
{
  return self->_urlRequestProperties;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

@end