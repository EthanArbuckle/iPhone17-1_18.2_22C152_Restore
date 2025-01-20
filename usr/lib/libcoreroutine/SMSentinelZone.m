@interface SMSentinelZone
- (SMSentinelZone)initWithQueue:(id)a3;
- (void)saveZoneWithXPCActivity:(id)a3 completion:(id)a4;
@end

@implementation SMSentinelZone

- (SMSentinelZone)initWithQueue:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1A320];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithZoneName:@"SentinelZone" ownerName:*MEMORY[0x1E4F19C08]];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v7];
  v11.receiver = self;
  v11.super_class = (Class)SMSentinelZone;
  v9 = [(SMCloudKitZone *)&v11 initWithZone:v8 queue:v5];

  return v9;
}

- (void)saveZoneWithXPCActivity:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:0 masqueradeBundleID:0 xpcActivity:v8];

  v10 = [(SMCloudKitZone *)self privateDatabase];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__SMSentinelZone_saveZoneWithXPCActivity_completion___block_invoke;
  v12[3] = &unk_1E6B90DD0;
  id v13 = v7;
  SEL v14 = a2;
  v12[4] = self;
  id v11 = v7;
  [(SMCloudKitZone *)self saveZoneToDatabase:v10 qos:v9 withCompletion:v12];
}

void __53__SMSentinelZone_saveZoneWithXPCActivity_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  id v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    id v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v12 = 138413314;
    id v13 = v10;
    __int16 v14 = 2112;
    v15 = v11;
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,success,%d,error,%@,underlying error,%@", (uint8_t *)&v12, 0x30u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end