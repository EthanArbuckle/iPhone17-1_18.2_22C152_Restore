@interface NDOClientConfiguration
- (NDOClientConfiguration)initWithConfigDictionary:(id)a3;
- (unint64_t)generalAboutPolicy;
- (void)setGeneralAboutPolicy:(unint64_t)a3;
@end

@implementation NDOClientConfiguration

- (NDOClientConfiguration)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDOClientConfiguration;
  v5 = [(NDOClientConfiguration *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(NDOClientConfiguration *)v5 setGeneralAboutPolicy:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v4 objectForKey:@"alwaysRefreshGeneralAbout"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(NDOClientConfiguration *)v6 setGeneralAboutPolicy:2];
      }
    }
  }

  return v6;
}

- (unint64_t)generalAboutPolicy
{
  return self->_generalAboutPolicy;
}

- (void)setGeneralAboutPolicy:(unint64_t)a3
{
  self->_generalAboutPolicy = a3;
}

@end