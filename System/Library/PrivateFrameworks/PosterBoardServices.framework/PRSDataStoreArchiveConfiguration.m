@interface PRSDataStoreArchiveConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)cliOptions;
+ (id)dataStoreArchiveConfigurationFromArgs:(id)a3;
- (BOOL)reapNonLatestEntries;
- (BOOL)stripContentsOfConfigurations;
- (BOOL)stripDescriptors;
- (BOOL)stripScreenshots;
- (PRSDataStoreArchiveConfiguration)init;
- (PRSDataStoreArchiveConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setReapNonLatestEntries:(BOOL)a3;
- (void)setStripContentsOfConfigurations:(BOOL)a3;
- (void)setStripDescriptors:(BOOL)a3;
- (void)setStripScreenshots:(BOOL)a3;
@end

@implementation PRSDataStoreArchiveConfiguration

+ (id)cliOptions
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = kPRSDataStoreArchiveConfigurationKeyStripScreenshots;
  v4[1] = kPRSDataStoreArchiveConfigurationKeyStripDescriptors;
  v4[2] = kPRSDataStoreArchiveConfigurationKeyStripContentsOfConfigurations;
  v4[3] = kPRSDataStoreArchiveConfigurationKeyReapNonLatestEntries;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

+ (id)dataStoreArchiveConfigurationFromArgs:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = objc_opt_new();
  v5 = [v3 objectForKeyedSubscript:kPRSDataStoreArchiveConfigurationKeyStripScreenshots];
  uint64_t v6 = [v5 BOOLValue];

  v7 = [v3 objectForKeyedSubscript:kPRSDataStoreArchiveConfigurationKeyStripDescriptors];
  uint64_t v8 = [v7 BOOLValue];

  v9 = [v3 objectForKeyedSubscript:kPRSDataStoreArchiveConfigurationKeyStripContentsOfConfigurations];
  uint64_t v10 = [v9 BOOLValue];

  v11 = [v3 objectForKeyedSubscript:kPRSDataStoreArchiveConfigurationKeyReapNonLatestEntries];

  uint64_t v12 = [v11 BOOLValue];
  [v4 setStripScreenshots:v6];
  [v4 setStripDescriptors:v8];
  [v4 setStripContentsOfConfigurations:v10];
  [v4 setReapNonLatestEntries:v12];
  return v4;
}

- (PRSDataStoreArchiveConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PRSDataStoreArchiveConfiguration;
  return [(PRSDataStoreArchiveConfiguration *)&v3 init];
}

- (PRSDataStoreArchiveConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PRSDataStoreArchiveConfiguration;
  v5 = [(PRSDataStoreArchiveConfiguration *)&v7 init];
  if (v5)
  {
    v5->_stripScreenshots = [v4 decodeBoolForKey:kPRSDataStoreArchiveConfigurationKeyStripScreenshots];
    v5->_stripDescriptors = [v4 decodeBoolForKey:kPRSDataStoreArchiveConfigurationKeyStripDescriptors];
    v5->_stripContentsOfConfigurations = [v4 decodeBoolForKey:kPRSDataStoreArchiveConfigurationKeyStripContentsOfConfigurations];
    v5->_reapNonLatestEntries = [v4 decodeBoolForKey:kPRSDataStoreArchiveConfigurationKeyReapNonLatestEntries];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL stripScreenshots = self->_stripScreenshots;
  uint64_t v5 = kPRSDataStoreArchiveConfigurationKeyStripScreenshots;
  id v6 = a3;
  [v6 encodeBool:stripScreenshots forKey:v5];
  [v6 encodeBool:self->_stripDescriptors forKey:kPRSDataStoreArchiveConfigurationKeyStripDescriptors];
  [v6 encodeBool:self->_stripContentsOfConfigurations forKey:kPRSDataStoreArchiveConfigurationKeyStripContentsOfConfigurations];
  [v6 encodeBool:self->_reapNonLatestEntries forKey:kPRSDataStoreArchiveConfigurationKeyReapNonLatestEntries];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PRSDataStoreArchiveConfiguration allocWithZone:a3] init];
  [(PRSDataStoreArchiveConfiguration *)v4 setStripScreenshots:self->_stripScreenshots];
  [(PRSDataStoreArchiveConfiguration *)v4 setStripDescriptors:self->_stripDescriptors];
  [(PRSDataStoreArchiveConfiguration *)v4 setStripContentsOfConfigurations:self->_stripContentsOfConfigurations];
  [(PRSDataStoreArchiveConfiguration *)v4 setReapNonLatestEntries:self->_reapNonLatestEntries];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(PRSDataStoreArchiveConfiguration *)+[PRSMutableDataStoreArchiveConfiguration allocWithZone:a3] init];
  [(PRSDataStoreArchiveConfiguration *)v4 setStripScreenshots:self->_stripScreenshots];
  [(PRSDataStoreArchiveConfiguration *)v4 setStripDescriptors:self->_stripDescriptors];
  [(PRSDataStoreArchiveConfiguration *)v4 setStripContentsOfConfigurations:self->_stripContentsOfConfigurations];
  [(PRSDataStoreArchiveConfiguration *)v4 setReapNonLatestEntries:self->_reapNonLatestEntries];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)stripScreenshots
{
  return self->_stripScreenshots;
}

- (void)setStripScreenshots:(BOOL)a3
{
  self->_BOOL stripScreenshots = a3;
}

- (BOOL)stripDescriptors
{
  return self->_stripDescriptors;
}

- (void)setStripDescriptors:(BOOL)a3
{
  self->_stripDescriptors = a3;
}

- (BOOL)stripContentsOfConfigurations
{
  return self->_stripContentsOfConfigurations;
}

- (void)setStripContentsOfConfigurations:(BOOL)a3
{
  self->_stripContentsOfConfigurations = a3;
}

- (BOOL)reapNonLatestEntries
{
  return self->_reapNonLatestEntries;
}

- (void)setReapNonLatestEntries:(BOOL)a3
{
  self->_reapNonLatestEntries = a3;
}

@end