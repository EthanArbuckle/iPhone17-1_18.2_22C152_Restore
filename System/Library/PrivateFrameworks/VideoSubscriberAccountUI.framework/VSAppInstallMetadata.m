@interface VSAppInstallMetadata
- (BOOL)isBeta;
- (BOOL)isManaged;
- (BOOL)isProfileValidated;
- (NSString)sourceApp;
- (VSAppInstallMetadata)init;
- (VSAppInstallMetadata)initWithApplicationRecord:(id)a3;
- (int64_t)installSource;
- (void)setBeta:(BOOL)a3;
- (void)setManaged:(BOOL)a3;
- (void)setProfileValidated:(BOOL)a3;
- (void)setSourceApp:(id)a3;
@end

@implementation VSAppInstallMetadata

- (VSAppInstallMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)VSAppInstallMetadata;
  return [(VSAppInstallMetadata *)&v3 init];
}

- (VSAppInstallMetadata)initWithApplicationRecord:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VSAppInstallMetadata;
  v5 = [(VSAppInstallMetadata *)&v12 init];
  if (v5)
  {
    v5->_beta = [v4 isBeta];
    v6 = [v4 iTunesMetadata];
    uint64_t v7 = [v6 sourceApp];
    sourceApp = v5->_sourceApp;
    v5->_sourceApp = (NSString *)v7;

    v5->_profileValidated = [v4 isProfileValidated];
    v9 = [MEMORY[0x263F53C50] sharedConnection];
    v10 = [v4 bundleIdentifier];
    v5->_managed = [v9 isAppManaged:v10];
  }
  return v5;
}

- (int64_t)installSource
{
  objc_super v3 = [(VSAppInstallMetadata *)self sourceApp];
  char v4 = [v3 isEqualToString:@"com.apple.AppStore"];

  if (v4) {
    return 0;
  }
  v6 = [(VSAppInstallMetadata *)self sourceApp];
  char v7 = [v6 isEqualToString:@"com.apple.Magellan"];

  if (v7) {
    return 1;
  }
  if ([(VSAppInstallMetadata *)self isBeta]) {
    return 3;
  }
  if ([(VSAppInstallMetadata *)self isManaged]) {
    return 2;
  }
  if ([(VSAppInstallMetadata *)self isProfileValidated]) {
    return 4;
  }
  return 5;
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (void)setBeta:(BOOL)a3
{
  self->_beta = a3;
}

- (NSString)sourceApp
{
  return self->_sourceApp;
}

- (void)setSourceApp:(id)a3
{
}

- (BOOL)isProfileValidated
{
  return self->_profileValidated;
}

- (void)setProfileValidated:(BOOL)a3
{
  self->_profileValidated = a3;
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (void)setManaged:(BOOL)a3
{
  self->_managed = a3;
}

- (void).cxx_destruct
{
}

@end