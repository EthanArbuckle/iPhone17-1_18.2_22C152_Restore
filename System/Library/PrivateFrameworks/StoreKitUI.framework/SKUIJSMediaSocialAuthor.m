@interface SKUIJSMediaSocialAuthor
- (NSArray)permissions;
- (NSDictionary)storePlatformData;
- (NSString)dsId;
- (NSString)entityIdentifier;
- (NSString)entityType;
- (NSString)name;
- (SKUIJSMediaSocialAuthor)initWithSKUIMediaSocialAuthor:(id)a3;
@end

@implementation SKUIJSMediaSocialAuthor

- (SKUIJSMediaSocialAuthor)initWithSKUIMediaSocialAuthor:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIJSMediaSocialAuthor initWithSKUIMediaSocialAuthor:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIJSMediaSocialAuthor;
  v6 = [(SKUIJSMediaSocialAuthor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaSocialAuthor, a3);
  }

  return v7;
}

- (NSString)dsId
{
  return [(SKUIMediaSocialAuthor *)self->_mediaSocialAuthor dsid];
}

- (NSString)entityIdentifier
{
  return [(SKUIMediaSocialAuthor *)self->_mediaSocialAuthor identifier];
}

- (NSString)entityType
{
  return [(SKUIMediaSocialAuthor *)self->_mediaSocialAuthor authorType];
}

- (NSString)name
{
  return [(SKUIMediaSocialAuthor *)self->_mediaSocialAuthor name];
}

- (NSArray)permissions
{
  return [(SKUIMediaSocialAuthor *)self->_mediaSocialAuthor permissions];
}

- (NSDictionary)storePlatformData
{
  return [(SKUIMediaSocialAuthor *)self->_mediaSocialAuthor storePlatformData];
}

- (void).cxx_destruct
{
}

- (void)initWithSKUIMediaSocialAuthor:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIJSMediaSocialAuthor initWithSKUIMediaSocialAuthor:]";
}

@end