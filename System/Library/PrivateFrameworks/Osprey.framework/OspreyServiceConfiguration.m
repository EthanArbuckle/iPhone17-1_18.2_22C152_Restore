@interface OspreyServiceConfiguration
+ (id)sharedConfiguration;
- (OspreyConnectionPool)connectionPool;
- (OspreyServiceConfiguration)init;
@end

@implementation OspreyServiceConfiguration

- (OspreyServiceConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)OspreyServiceConfiguration;
  v2 = [(OspreyServiceConfiguration *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(OspreyConnectionPool);
    connectionPool = v2->_connectionPool;
    v2->_connectionPool = v3;
  }
  return v2;
}

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1) {
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedConfiguration_shared;

  return v2;
}

uint64_t __49__OspreyServiceConfiguration_sharedConfiguration__block_invoke()
{
  sharedConfiguration_shared = objc_alloc_init(OspreyServiceConfiguration);

  return MEMORY[0x1F41817F8]();
}

- (OspreyConnectionPool)connectionPool
{
  return (OspreyConnectionPool *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end