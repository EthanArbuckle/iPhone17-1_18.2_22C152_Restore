@interface AXPhoenixAnalytics
- (AXPhoenixAnalytics)init;
- (AXPhoenixAnalytics)initWithConfiguration:(id)a3 modelVersion:(id)a4 assetVersion:(unint64_t)a5;
- (OS_dispatch_queue)queue;
- (id)_descriptionForEventType:(int64_t)a3;
- (void)_sendEvent:(id)a3 completion:(id)a4;
- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5 completion:(id)a6;
- (void)setQueue:(id)a3;
@end

@implementation AXPhoenixAnalytics

- (AXPhoenixAnalytics)init
{
  id location = self;
  objc_storeStrong(&location, 0);
  return 0;
}

- (AXPhoenixAnalytics)initWithConfiguration:(id)a3 modelVersion:(id)a4 assetVersion:(unint64_t)a5
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  unint64_t v16 = a5;
  v5 = v19;
  v19 = 0;
  v15.receiver = v5;
  v15.super_class = (Class)AXPhoenixAnalytics;
  v19 = [(AXPhoenixAnalytics *)&v15 init];
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    if (v17) {
      objc_storeStrong((id *)&v19->_modelVersion, v17);
    }
    else {
      objc_storeStrong((id *)&v19->_modelVersion, &stru_26EA3C2C8);
    }
    v19->_assetVersion = v16;
    v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v19->_dateFormatter;
    v19->_dateFormatter = v6;

    [(NSDateFormatter *)v19->_dateFormatter setDateFormat:@"yyyy-MM-dd'_'HH:mm:ss:SSS"];
    objc_storeStrong((id *)&v19->_configuration, location[0]);
    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.accessibility.analyticswriter", v14);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v14, 0);
  }
  v11 = v19;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v11;
}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5 completion:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v39 = self;
  SEL v38 = a2;
  int64_t v37 = a3;
  location[1] = (id)a4;
  location[0] = 0;
  objc_storeStrong(location, a5);
  id v35 = 0;
  objc_storeStrong(&v35, a6);
  if ([MEMORY[0x263F08900] isValidJSONObject:location[0]])
  {
    id v21 = objc_alloc(MEMORY[0x263EFF9A0]);
    v41[0] = @"configFileMajorVersion";
    v22 = [(AXPhoenixConfiguration *)v39->_configuration majorVersion];
    if (v22) {
      v20 = v22;
    }
    else {
      v20 = &stru_26EA3C2C8;
    }
    v42[0] = v20;
    v41[1] = @"configFileMinorVersion";
    v19 = [(AXPhoenixConfiguration *)v39->_configuration minorVersion];
    if (v19) {
      v18 = v19;
    }
    else {
      v18 = &stru_26EA3C2C8;
    }
    v42[1] = v18;
    v41[2] = @"assetVersion";
    id v15 = (id)[NSNumber numberWithUnsignedInteger:v39->_assetVersion];
    v42[2] = v15;
    v41[3] = @"eventType";
    id v14 = [(AXPhoenixAnalytics *)v39 _descriptionForEventType:v37];
    v42[3] = v14;
    id v13 = (id)[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
    id v31 = (id)objc_msgSend(v21, "initWithDictionary:");

    memset(__b, 0, sizeof(__b));
    id v16 = (id)[location[0] allKeys];
    uint64_t v17 = [v16 countByEnumeratingWithState:__b objects:v40 count:16];
    if (v17)
    {
      uint64_t v10 = *(void *)__b[2];
      uint64_t v11 = 0;
      unint64_t v12 = v17;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(v16);
        }
        uint64_t v30 = *(void *)(__b[1] + 8 * v11);
        id v7 = v31;
        id v8 = (id)[location[0] objectForKeyedSubscript:v30];
        objc_msgSend(v7, "setValue:forKey:");

        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [v16 countByEnumeratingWithState:__b objects:v40 count:16];
          if (!v12) {
            break;
          }
        }
      }
    }

    v6 = [AXPhoenixAnalyticsEvent alloc];
    v28 = [(AXPhoenixAnalyticsEvent *)v6 initWithEventType:v37 eventInfo:v31];
    [(AXPhoenixAnalytics *)v39 _sendEvent:v28 completion:v35];
    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong(&v31, 0);
    int v32 = 0;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v45, (uint64_t)"-[AXPhoenixAnalytics logEventWithType:machAbsoluteTime:context:completion:]", (uint64_t)location[0]);
      _os_log_error_impl(&dword_2372C8000, oslog, type, "[PHOENIX] %s Dictionary is not valid json: %@", v45, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v35)
    {
      v24 = (void (**)(id, void))v35;
      v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v43 = *MEMORY[0x263F08320];
      v44 = @"Dictionary is not valid json";
      id v26 = (id)[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      id v25 = (id)objc_msgSend(v23, "errorWithDomain:code:userInfo:", @"AXPhoenixErrorDomain", 1003);
      v24[2](v24, 0);
    }
    int v32 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

- (void)_sendEvent:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = (id)[location[0] description];
  id v7 = (id)AXLogBackTap();
  os_log_type_t v6 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v11, (uint64_t)"-[AXPhoenixAnalytics _sendEvent:completion:]", (uint64_t)v8);
    _os_log_impl(&dword_2372C8000, (os_log_t)v7, v6, "[PHOENIX] %s Back Tap Event: %{public}@", v11, 0x16u);
  }
  objc_storeStrong(&v7, 0);
  id v5 = location[0];
  AnalyticsSendEventLazy();
  if (v9) {
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __44__AXPhoenixAnalytics__sendEvent_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventInfo", a1, a1);
}

- (id)_descriptionForEventType:(int64_t)a3
{
  if ((unint64_t)a3 <= 1)
  {
    int64_t v4 = a3 - 1;
    char v3 = 0;
  }
  else
  {
    int64_t v4 = a3 - 1;
    char v3 = 1;
  }
  if (v3)
  {
    os_log_type_t v6 = @"AXPhoenixAnalyticsEventTypeUnspecified";
  }
  else
  {
    switch(v4)
    {
      case 0:
        os_log_type_t v6 = @"AXPhoenixAnalyticsEventTypeDoubleTap";
        break;
      case 1:
        os_log_type_t v6 = @"AXPhoenixAnalyticsEventTypeDoubleTapMitigated";
        break;
      case 2:
        os_log_type_t v6 = @"AXPhoenixAnalyticsEventTypeTripleTap";
        break;
      case 3:
        os_log_type_t v6 = @"AXPhoenixAnalyticsEventTypeTripleTapMitigated";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end