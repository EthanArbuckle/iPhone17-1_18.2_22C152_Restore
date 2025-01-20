@interface SFPerSiteSettingsEntity
- (BOOL)contentBlockersEnabled;
- (NSString)domain;
- (void)setContentBlockersEnabled:(BOOL)a3;
- (void)setDomain:(id)a3;
@end

@implementation SFPerSiteSettingsEntity

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (BOOL)contentBlockersEnabled
{
  return self->_contentBlockersEnabled;
}

- (void)setContentBlockersEnabled:(BOOL)a3
{
  self->_contentBlockersEnabled = a3;
}

- (void).cxx_destruct
{
}

@end