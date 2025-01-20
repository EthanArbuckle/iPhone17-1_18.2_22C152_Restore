@interface _FindableDeviceAlgorithmsContainer
+ (id)configurationForContainerObjects;
- (NINearbyUpdatesEngine)updatesEngine;
- (NIServerAnalyticsManager)analyticsManager;
- (_FindableDeviceAlgorithmsContainer)initWithToken:(id)a3 queue:(id)a4 delegate:(id)a5;
- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr;
- (id)discoveryTokenFromIdentifier:(unint64_t)a3;
- (id)objectFromIdentifier:(unint64_t)a3;
- (optional<unsigned)identifierFromDiscoveryToken:(id)a3;
- (unint64_t)currentSolutionMacAddress;
- (void)invalidate;
- (void)setCurrentSolutionMacAddress:(unint64_t)a3;
@end

@implementation _FindableDeviceAlgorithmsContainer

- (_FindableDeviceAlgorithmsContainer)initWithToken:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_FindableDeviceAlgorithmsContainer;
  v12 = [(_FindableDeviceAlgorithmsContainer *)&v29 init];
  if (v12)
  {
    uint64_t v13 = objc_opt_new();
    containerIdentifier = v12->_containerIdentifier;
    v12->_containerIdentifier = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_token, a3);
    v15 = [[NIServerAnalyticsManager alloc] initWithBundleIdentifier:@"nearbyd"];
    analyticsManager = v12->_analyticsManager;
    v12->_analyticsManager = v15;

    v12->_currentSolutionMacAddress = 0;
    v17 = [NINearbyUpdatesEngine alloc];
    v18 = [(id)objc_opt_class() configurationForContainerObjects];
    v19 = v12->_analyticsManager;
    v20 = sub_1002F6464();
    v21 = (std::__shared_weak_count *)*((void *)v20 + 21);
    uint64_t v27 = *((void *)v20 + 20);
    v28 = v21;
    if (v21) {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v26 = 0;
    v22 = [(NINearbyUpdatesEngine *)v17 initWithConfiguration:v18 queue:v10 delegate:v11 dataSource:v12 analyticsManager:v19 protobufLogger:&v27 error:&v26];
    id v23 = v26;
    updatesEngine = v12->_updatesEngine;
    v12->_updatesEngine = v22;

    if (v28) {
      sub_10001A970(v28);
    }

    if (v23 && os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10041C0A8();
    }
  }
  return v12;
}

- (void)invalidate
{
}

+ (id)configurationForContainerObjects
{
  if (qword_1008A44D8 != -1) {
    dispatch_once(&qword_1008A44D8, &stru_100858D08);
  }
  v2 = (void *)qword_1008A44D0;

  return v2;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  return self->_token;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  unint64_t currentSolutionMacAddress = self->_currentSolutionMacAddress;
  BOOL v4 = 1;
  result.__engaged_ = v4;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)currentSolutionMacAddress;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  v3 = [[NINearbyObject alloc] initWithToken:self->_token];

  return v3;
}

- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr
{
  id v4 = [*(id *)(v1 + 16) UUIDString];
  sub_100004950(retstr, (char *)[v4 UTF8String]);

  return result;
}

- (NINearbyUpdatesEngine)updatesEngine
{
  return (NINearbyUpdatesEngine *)objc_getProperty(self, a2, 24, 1);
}

- (NIServerAnalyticsManager)analyticsManager
{
  return (NIServerAnalyticsManager *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)currentSolutionMacAddress
{
  return self->_currentSolutionMacAddress;
}

- (void)setCurrentSolutionMacAddress:(unint64_t)a3
{
  self->_unint64_t currentSolutionMacAddress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_updatesEngine, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end