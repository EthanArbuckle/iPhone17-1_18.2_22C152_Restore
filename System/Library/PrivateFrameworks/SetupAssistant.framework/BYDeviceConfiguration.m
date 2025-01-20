@interface BYDeviceConfiguration
+ (id)currentConfiguration;
- (BYDeviceConfiguration)init;
- (NSString)buildVersion;
- (NSString)productVersion;
- (void)setBuildVersion:(id)a3;
- (void)setProductVersion:(id)a3;
@end

@implementation BYDeviceConfiguration

- (BYDeviceConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)BYDeviceConfiguration;
  v2 = [(BYDeviceConfiguration *)&v6 init];
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();

    v2->_productVersion = (NSString *)v3;
    v4 = (void *)MGCopyAnswer();

    v2->_buildVersion = (NSString *)v4;
  }
  return v2;
}

+ (id)currentConfiguration
{
  if (currentConfiguration_onceToken != -1) {
    dispatch_once(&currentConfiguration_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)currentConfiguration_configuration;
  return v2;
}

uint64_t __45__BYDeviceConfiguration_currentConfiguration__block_invoke()
{
  currentConfiguration_configuration = objc_alloc_init(BYDeviceConfiguration);
  return MEMORY[0x1F41817F8]();
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  self->_productVersion = (NSString *)a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  self->_buildVersion = (NSString *)a3;
}

@end