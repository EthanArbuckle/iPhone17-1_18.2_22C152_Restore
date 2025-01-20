@interface PLCoreService
- (NSMutableDictionary)services;
- (PLCoreService)init;
- (void)setServices:(id)a3;
- (void)startPreUnlockServices;
- (void)startServices;
@end

@implementation PLCoreService

- (PLCoreService)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLCoreService;
  v2 = [(PLCoreOperator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    services = v2->_services;
    v2->_services = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)startServices
{
  uint64_t v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Start Powerlog Services", buf, 2u);
  }

  uint64_t v4 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)PLCoreService;
  [(PLCoreOperator *)&v5 startOperatorsOfSuperClassType:v4];
}

- (void)startPreUnlockServices
{
  uint64_t v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Start Powerlog Services for pre unlock telemetry", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLCoreService;
  [(PLCoreOperator *)&v4 startServicesForPreUnlockTelemetry];
}

- (NSMutableDictionary)services
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end