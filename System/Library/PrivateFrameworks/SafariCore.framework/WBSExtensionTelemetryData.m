@interface WBSExtensionTelemetryData
- (BOOL)allWebsitesPermissionLevel;
- (BOOL)canOverrideNewTabPage;
- (BOOL)enabled;
- (NSString)identifier;
- (int64_t)manifestVersion;
- (unint64_t)websitesDeniedAccessCount;
- (unint64_t)websitesGrantedAccessCount;
- (void)setAllWebsitesPermissionLevel:(BOOL)a3;
- (void)setCanOverrideNewTabPage:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setManifestVersion:(int64_t)a3;
- (void)setWebsitesDeniedAccessCount:(unint64_t)a3;
- (void)setWebsitesGrantedAccessCount:(unint64_t)a3;
@end

@implementation WBSExtensionTelemetryData

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)manifestVersion
{
  return self->_manifestVersion;
}

- (void)setManifestVersion:(int64_t)a3
{
  self->_manifestVersion = a3;
}

- (BOOL)allWebsitesPermissionLevel
{
  return self->_allWebsitesPermissionLevel;
}

- (void)setAllWebsitesPermissionLevel:(BOOL)a3
{
  self->_allWebsitesPermissionLevel = a3;
}

- (unint64_t)websitesGrantedAccessCount
{
  return self->_websitesGrantedAccessCount;
}

- (void)setWebsitesGrantedAccessCount:(unint64_t)a3
{
  self->_websitesGrantedAccessCount = a3;
}

- (unint64_t)websitesDeniedAccessCount
{
  return self->_websitesDeniedAccessCount;
}

- (void)setWebsitesDeniedAccessCount:(unint64_t)a3
{
  self->_websitesDeniedAccessCount = a3;
}

- (BOOL)canOverrideNewTabPage
{
  return self->_canOverrideNewTabPage;
}

- (void)setCanOverrideNewTabPage:(BOOL)a3
{
  self->_canOverrideNewTabPage = a3;
}

- (void).cxx_destruct
{
}

@end