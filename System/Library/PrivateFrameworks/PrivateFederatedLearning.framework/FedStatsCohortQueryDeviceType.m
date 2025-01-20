@interface FedStatsCohortQueryDeviceType
+ (id)cohortInstance;
- (FedStatsCohortQueryDeviceType)initWithDeviceType:(id)a3;
- (NSString)deviceType;
- (void)setDeviceType:(id)a3;
@end

@implementation FedStatsCohortQueryDeviceType

- (FedStatsCohortQueryDeviceType)initWithDeviceType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCohortQueryDeviceType;
  v6 = [(FedStatsCohortQueryDeviceType *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deviceType, a3);
  }

  return v7;
}

+ (id)cohortInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__FedStatsCohortQueryDeviceType_cohortInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cohortInstance_onceToken[0] != -1) {
    dispatch_once(cohortInstance_onceToken, block);
  }
  v2 = (void *)cohortInstance_cohortInstance;
  return v2;
}

void __47__FedStatsCohortQueryDeviceType_cohortInstance__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(&v6, 0, 512);
  uname(&v6);
  id v2 = objc_alloc(*(Class *)(a1 + 32));
  v3 = [NSString stringWithCString:v6.machine encoding:4];
  uint64_t v4 = [v2 initWithDeviceType:v3];
  id v5 = (void *)cohortInstance_cohortInstance;
  cohortInstance_cohortInstance = v4;
}

- (NSString)deviceType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end