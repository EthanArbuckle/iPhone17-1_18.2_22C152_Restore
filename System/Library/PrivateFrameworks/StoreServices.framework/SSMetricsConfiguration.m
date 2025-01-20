@interface SSMetricsConfiguration
+ (id)_reportingFrequencyOverride;
+ (void)getReportingFrequencyOverrideWithCompletionBlock:(id)a3;
+ (void)setReportingFrequencyOverride:(id)a3;
- (BOOL)_configBooleanForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)_decorateITMLEvents;
- (BOOL)disableEventDecoration;
- (BOOL)isDisabled;
- (BOOL)isEventTypeBlacklisted:(id)a3;
- (BOOL)isSendDisabled;
- (NSDictionary)fieldsMap;
- (SSMetricsConfiguration)childConfiguration;
- (SSMetricsConfiguration)initWithGlobalConfiguration:(id)a3;
- (SSMetricsConfiguration)initWithStorePlatformData:(id)a3;
- (double)reportingFrequency;
- (id)_initSSMetricsEventConfiguration;
- (id)blacklistedEventFields;
- (id)compoundStringWithElements:(id)a3;
- (id)cookieFields;
- (id)eventFields;
- (id)pingURLs;
- (id)reportingURLString;
- (id)tokenStringWithElements:(id)a3;
- (id)valueForConfigurationKey:(id)a3;
- (void)_setReportingFrequencyOverride:(id)a3;
- (void)dealloc;
- (void)setChildConfiguration:(id)a3;
- (void)setDisableEventDecoration:(BOOL)a3;
@end

@implementation SSMetricsConfiguration

- (id)_initSSMetricsEventConfiguration
{
  v13.receiver = self;
  v13.super_class = (Class)SSMetricsConfiguration;
  v2 = [(SSMetricsConfiguration *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSMetricsConfiguration", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_dispatchQueue;
    v6 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v5, v6);

    v7 = +[SSWeakReference weakReferenceWithObject:v2];
    v8 = v2->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__SSMetricsConfiguration__initSSMetricsEventConfiguration__block_invoke;
    handler[3] = &unk_1E5BA95E8;
    id v12 = v7;
    id v9 = v7;
    notify_register_dispatch("com.apple.StoreServices.metrics-internal-settings-change", &v2->_internalSettingsToken, v8, handler);
  }
  return v2;
}

void __58__SSMetricsConfiguration__initSSMetricsEventConfiguration__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) object];
  [v1 _setReportingFrequencyOverride:0];
}

- (SSMetricsConfiguration)initWithGlobalConfiguration:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SSMetricsConfiguration *)self _initSSMetricsEventConfiguration];
  if (v5)
  {
    if ([v4 count])
    {
      uint64_t v6 = [v4 copy];
      config = v5->_config;
      v5->_config = (NSDictionary *)v6;

      v5->_disabled = [(SSMetricsConfiguration *)v5 _configBooleanForKey:@"disabled" defaultValue:0];
      v5->_sendDisabled = [(SSMetricsConfiguration *)v5 _configBooleanForKey:@"sendDisabled" defaultValue:0];
      v8 = (SSMetricsConfiguration *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = [v4 objectForKey:@"metrics"];
      v10 = [v4 objectForKey:@"metricsBase"];
      if (!v10)
      {
        v10 = [v4 objectForKey:@"metrics_base"];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [v9 objectForKey:@"fields"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __54__SSMetricsConfiguration_initWithGlobalConfiguration___block_invoke;
          v29[3] = &unk_1E5BA9610;
          v30 = v8;
          [v11 enumerateKeysAndObjectsUsingBlock:v29];
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __54__SSMetricsConfiguration_initWithGlobalConfiguration___block_invoke_2;
        v27[3] = &unk_1E5BA9610;
        v28 = v8;
        [v10 enumerateKeysAndObjectsUsingBlock:v27];
      }
      uint64_t v12 = [(SSMetricsConfiguration *)v8 copy];
      fields = v5->_fields;
      v5->_fields = (NSDictionary *)v12;

      goto LABEL_24;
    }
    id v9 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v9)
    {
      id v9 = +[SSLogConfig sharedConfig];
    }
    int v14 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    v16 = [v9 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      int v31 = 138412290;
      id v32 = (id)objc_opt_class();
      id v17 = v32;
      LODWORD(v26) = 12;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_23:
        v8 = v5;
        v5 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v31, v26);
      free(v18);
      SSFileLog(v9, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v16);
    }

    goto LABEL_23;
  }
LABEL_25:

  return v5;
}

void __54__SSMetricsConfiguration_initWithGlobalConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

void __54__SSMetricsConfiguration_initWithGlobalConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

- (SSMetricsConfiguration)initWithStorePlatformData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"metrics"];
  id v6 = [v4 objectForKey:@"metricsBase"];
  if (!v6)
  {
    id v6 = [v4 objectForKey:@"metrics_base"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v7 = [(SSMetricsConfiguration *)self _initSSMetricsEventConfiguration];
    if (v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = [v5 objectForKey:@"fields"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __52__SSMetricsConfiguration_initWithStorePlatformData___block_invoke;
        v21[3] = &unk_1E5BA9610;
        id v22 = v8;
        [v9 enumerateKeysAndObjectsUsingBlock:v21];
      }
      v10 = [v5 objectForKey:@"config"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v10 copy];
        config = v7->_config;
        v7->_config = (NSDictionary *)v11;

        v7->_disabled = [(SSMetricsConfiguration *)v7 _configBooleanForKey:@"disabled" defaultValue:0];
        v7->_sendDisabled = [(SSMetricsConfiguration *)v7 _configBooleanForKey:@"sendDisabled" defaultValue:0];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        v18 = __52__SSMetricsConfiguration_initWithStorePlatformData___block_invoke_2;
        uint64_t v19 = &unk_1E5BA9610;
        id v20 = v8;
        [v6 enumerateKeysAndObjectsUsingBlock:&v16];
      }
      uint64_t v13 = objc_msgSend(v8, "copy", v16, v17, v18, v19);
      fields = v7->_fields;
      v7->_fields = (NSDictionary *)v13;
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

void __52__SSMetricsConfiguration_initWithStorePlatformData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

void __52__SSMetricsConfiguration_initWithStorePlatformData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

- (void)dealloc
{
  notify_cancel(self->_internalSettingsToken);
  v3.receiver = self;
  v3.super_class = (Class)SSMetricsConfiguration;
  [(SSMetricsConfiguration *)&v3 dealloc];
}

- (id)blacklistedEventFields
{
  objc_super v3 = [(NSDictionary *)self->_config objectForKey:@"blacklistedFields"];
  id v4 = [(SSMetricsConfiguration *)self childConfiguration];
  id v5 = [v4 blacklistedEventFields];

  if ([v5 count] && objc_msgSend(v3, "count"))
  {
    id v6 = [MEMORY[0x1E4F1CA80] setWithArray:v5];
    [v6 addObjectsFromArray:v3];
    v7 = [v6 allObjects];
  }
  else
  {
    if ([v5 count]) {
      id v8 = v5;
    }
    else {
      id v8 = v3;
    }
    v7 = v8;
  }

  return v7;
}

- (id)cookieFields
{
  cookieFieldsUnion = self->_cookieFieldsUnion;
  if (!cookieFieldsUnion)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = self->_cookieFieldsUnion;
    self->_cookieFieldsUnion = v4;

    id v6 = (void *)MEMORY[0x1A6267F60]();
    v7 = [(SSMetricsConfiguration *)self fieldsMap];
    id v8 = [v7 objectForKey:@"cookies"];
    if ([v8 count]) {
      [(NSMutableSet *)self->_cookieFieldsUnion addObjectsFromArray:v8];
    }
    id v9 = [(SSMetricsConfiguration *)self childConfiguration];
    v10 = [v9 cookieFields];

    if ([v10 count]) {
      [(NSMutableSet *)self->_cookieFieldsUnion unionSet:v10];
    }

    cookieFieldsUnion = self->_cookieFieldsUnion;
  }
  return cookieFieldsUnion;
}

- (id)eventFields
{
  eventFieldsUnion = self->_eventFieldsUnion;
  if (!eventFieldsUnion)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = self->_eventFieldsUnion;
    self->_eventFieldsUnion = v4;

    id v6 = (void *)MEMORY[0x1A6267F60]();
    v7 = [(SSMetricsConfiguration *)self childConfiguration];
    id v8 = [v7 eventFields];

    if ([(NSDictionary *)self->_fields count]) {
      [(NSMutableDictionary *)self->_eventFieldsUnion addEntriesFromDictionary:self->_fields];
    }
    if ([v8 count]) {
      [(NSMutableDictionary *)self->_eventFieldsUnion addEntriesFromDictionary:v8];
    }

    eventFieldsUnion = self->_eventFieldsUnion;
  }
  return eventFieldsUnion;
}

- (id)compoundStringWithElements:(id)a3
{
  id v4 = a3;
  id v5 = [(SSMetricsConfiguration *)self childConfiguration];
  id v6 = [v5 compoundStringWithElements:v4];

  if (!v6)
  {
    uint64_t v7 = [(NSDictionary *)self->_config objectForKey:@"compoundSeparator"];
    if (v7) {
      id v8 = (__CFString *)v7;
    }
    else {
      id v8 = @"_";
    }
    id v6 = [v4 componentsJoinedByString:v8];
  }
  return v6;
}

- (NSDictionary)fieldsMap
{
  objc_super v3 = [(NSDictionary *)self->_config objectForKey:@"fieldsMap"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [(SSMetricsConfiguration *)self childConfiguration];
    uint64_t v5 = [v4 fieldsMap];

    objc_super v3 = (void *)v5;
  }
  return (NSDictionary *)v3;
}

- (BOOL)isDisabled
{
  if (self->_disabled) {
    return 1;
  }
  objc_super v3 = [(SSMetricsConfiguration *)self childConfiguration];
  char v4 = [v3 isDisabled];

  return v4;
}

- (BOOL)isEventTypeBlacklisted:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_disabled) {
    goto LABEL_2;
  }
  if (![v4 length]) {
    goto LABEL_19;
  }
  blacklistedEvents = self->_blacklistedEvents;
  if (!blacklistedEvents)
  {
    id v8 = [(NSDictionary *)self->_config objectForKey:@"blacklistedEvents"];
    id v9 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
    v10 = self->_blacklistedEvents;
    self->_blacklistedEvents = v9;

    blacklistedEvents = self->_blacklistedEvents;
  }
  if (![(NSSet *)blacklistedEvents containsObject:v5])
  {
LABEL_19:
    uint64_t v23 = [(SSMetricsConfiguration *)self childConfiguration];
    char v6 = [v23 isEventTypeBlacklisted:v5];

    goto LABEL_20;
  }
  uint64_t v11 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v11)
  {
    uint64_t v11 = +[SSLogConfig sharedConfig];
  }
  int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  int v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    v13 &= 2u;
  }
  if (!v13) {
    goto LABEL_17;
  }
  *(_DWORD *)uint64_t v26 = 138412546;
  *(void *)&v26[4] = objc_opt_class();
  *(_WORD *)&v26[12] = 2112;
  *(void *)&v26[14] = v5;
  id v15 = *(id *)&v26[4];
  LODWORD(v25) = 22;
  uint64_t v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    int v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, v26, v25, *(_OWORD *)v26, *(void *)&v26[16], v27);
    free(v16);
    SSFileLog(v11, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
LABEL_17:
  }
LABEL_2:
  char v6 = 1;
LABEL_20:

  return v6;
}

- (BOOL)isSendDisabled
{
  if (self->_sendDisabled) {
    return 1;
  }
  objc_super v3 = [(SSMetricsConfiguration *)self childConfiguration];
  char v4 = [v3 isSendDisabled];

  return v4;
}

- (id)pingURLs
{
  objc_super v3 = [(NSDictionary *)self->_config objectForKey:@"pingUrls"];
  char v4 = [(SSMetricsConfiguration *)self childConfiguration];
  uint64_t v5 = [v4 pingURLs];

  if ([v3 count] || objc_msgSend(v5, "count"))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __34__SSMetricsConfiguration_pingURLs__block_invoke;
    v9[3] = &unk_1E5BA9638;
    id v7 = v6;
    id v10 = v7;
    [v3 enumerateObjectsUsingBlock:v9];
    [v7 addObjectsFromArray:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __34__SSMetricsConfiguration_pingURLs__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithString:v4];

  uint64_t v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
    uint64_t v5 = v6;
  }
}

- (double)reportingFrequency
{
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__18;
  id v15 = __Block_byref_object_dispose__18;
  id v16 = 0;
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__SSMetricsConfiguration_reportingFrequency__block_invoke;
  v10[3] = &unk_1E5BA6FC8;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(dispatchQueue, v10);
  id v4 = (void *)v12[5];
  if (v4)
  {
    [v4 doubleValue];
    double v6 = v5 * 1000.0;
  }
  else
  {
    id v7 = [(SSMetricsConfiguration *)self childConfiguration];
    id v8 = [v7 valueForConfigurationKey:@"postFrequency"];

    if (!v8)
    {
      id v8 = [(NSDictionary *)self->_config objectForKey:@"postFrequency"];
    }
    objc_opt_class();
    double v6 = 0.0;
    if (objc_opt_isKindOfClass()) {
      double v6 = (double)[v8 longLongValue];
    }
  }
  _Block_object_dispose(&v11, 8);

  return v6 / 1000.0;
}

void __44__SSMetricsConfiguration_reportingFrequency__block_invoke(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 80);
  if (isKindOfClass)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  }
  else if (!v3)
  {
    if (SSVUserDefaultsIsReadable(@"com.apple.itunesstored"))
    {
      id v4 = [(id)objc_opt_class() _reportingFrequencyOverride];
      id v14 = v4;
      if (v4)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), v4);
        double v5 = *(void **)(*(void *)(a1 + 32) + 80);
        uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
        id v7 = v5;
        id v8 = *(void **)(v6 + 40);
        *(void *)(v6 + 40) = v7;
      }
      else
      {
        uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
        uint64_t v13 = *(void *)(a1 + 32);
        id v8 = *(void **)(v13 + 80);
        *(void *)(v13 + 80) = v12;
      }
    }
    else
    {
      id v9 = +[SSWeakReference weakReferenceWithObject:*(void *)(a1 + 32)];
      id v10 = objc_opt_class();
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __44__SSMetricsConfiguration_reportingFrequency__block_invoke_2;
      v15[3] = &unk_1E5BA9660;
      id v16 = v9;
      id v11 = v9;
      [v10 getReportingFrequencyOverrideWithCompletionBlock:v15];
    }
  }
}

void __44__SSMetricsConfiguration_reportingFrequency__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 object];
  [v4 _setReportingFrequencyOverride:v3];
}

- (id)reportingURLString
{
  id v3 = [(SSMetricsConfiguration *)self childConfiguration];
  id v4 = [v3 reportingURLString];

  if (!v4)
  {
    id v4 = [(NSDictionary *)self->_config objectForKey:@"metricsUrl"];
  }
  return v4;
}

- (void)setChildConfiguration:(id)a3
{
  double v5 = (SSMetricsConfiguration *)a3;
  if (self->_childConfiguration != v5)
  {
    eventFieldsUnion = self->_eventFieldsUnion;
    self->_eventFieldsUnion = 0;
    id v8 = v5;

    cookieFieldsUnion = self->_cookieFieldsUnion;
    self->_cookieFieldsUnion = 0;

    objc_storeStrong((id *)&self->_childConfiguration, a3);
    double v5 = v8;
  }
}

- (id)tokenStringWithElements:(id)a3
{
  id v4 = a3;
  double v5 = [(SSMetricsConfiguration *)self childConfiguration];
  uint64_t v6 = [v5 tokenStringWithElements:v4];

  if (!v6)
  {
    uint64_t v7 = [(NSDictionary *)self->_config objectForKey:@"tokenSeparator"];
    if (v7) {
      id v8 = (__CFString *)v7;
    }
    else {
      id v8 = @"_";
    }
    uint64_t v6 = [v4 componentsJoinedByString:v8];
  }
  return v6;
}

- (id)valueForConfigurationKey:(id)a3
{
  id v4 = a3;
  double v5 = [(NSDictionary *)self->_config objectForKey:v4];
  if (!v5)
  {
    uint64_t v6 = [(SSMetricsConfiguration *)self childConfiguration];
    double v5 = [v6 valueForConfigurationKey:v4];
  }
  return v5;
}

+ (void)getReportingFrequencyOverrideWithCompletionBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!SSVUserDefaultsIsReadable(@"com.apple.itunesstored"))
  {
    if (!SSIsInternalBuild() || !_os_feature_enabled_impl()) {
      goto LABEL_18;
    }
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v27 = 136446210;
      v28 = "+[SSMetricsConfiguration getReportingFrequencyOverrideWithCompletionBlock:]";
      LODWORD(v21) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_17:

LABEL_18:
        uint64_t v6 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
        xpc_object_t v7 = SSXPCCreateMessageDictionary(128);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __75__SSMetricsConfiguration_getReportingFrequencyOverrideWithCompletionBlock___block_invoke_80;
        v22[3] = &unk_1E5BA92C8;
        id v23 = v4;
        id v20 = v4;
        [(SSXPCConnection *)v6 sendMessage:v7 withReply:v22];

        goto LABEL_19;
      }
      id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v27, v21);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_17;
  }
  double v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SSMetricsConfiguration_getReportingFrequencyOverrideWithCompletionBlock___block_invoke;
  block[3] = &unk_1E5BA9688;
  id v25 = v4;
  id v26 = a1;
  uint64_t v6 = (SSXPCConnection *)v4;
  dispatch_async(v5, block);

  xpc_object_t v7 = v25;
LABEL_19:
}

void __75__SSMetricsConfiguration_getReportingFrequencyOverrideWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) _reportingFrequencyOverride];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__SSMetricsConfiguration_getReportingFrequencyOverrideWithCompletionBlock___block_invoke_80(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6 && MEMORY[0x1A62689E0]() == MEMORY[0x1E4F14590])
  {
    uint64_t v4 = [@"SSVMetricsInternalSettingReportingFrequency" UTF8String];
    uint64_t v5 = objc_opt_class();
    id v3 = (void *)SSXPCDictionaryCopyObjectWithClass(v6, v4, v5);
  }
  else
  {
    id v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)setReportingFrequencyOverride:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (SSVUserDefaultsIsWritable(@"com.apple.itunesstored"))
  {
    CFStringRef v4 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
    if (v4)
    {
      CFStringRef v5 = v4;
      CFPreferencesSetAppValue(@"SSVMetricsInternalSettingReportingFrequency", v3, v4);
      CFPreferencesAppSynchronize(v5);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.StoreServices.metrics-internal-settings-change", 0, 0, 1u);
      CFRelease(v5);
    }
    goto LABEL_23;
  }
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    xpc_object_t v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      xpc_object_t v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    int v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (v11)
    {
      int v25 = 136446210;
      id v26 = "+[SSMetricsConfiguration setReportingFrequencyOverride:]";
      LODWORD(v24) = 12;
      int v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_18:

        goto LABEL_19;
      }
      int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v25, v24);
      free(v12);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_18;
  }
LABEL_19:
  uint64_t v19 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v20 = SSXPCCreateMessageDictionary(129);
  xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
  uint64_t v22 = [@"SSVMetricsInternalSettingReportingFrequency" UTF8String];
  if (v3)
  {
    SSXPCDictionarySetObject(v21, v22, v3);
  }
  else
  {
    id v23 = [MEMORY[0x1E4F1CA98] null];
    SSXPCDictionarySetObject(v21, v22, v23);
  }
  xpc_dictionary_set_value(v20, "1", v21);
  [(SSXPCConnection *)v19 sendMessage:v20 withReply:&__block_literal_global_7];

LABEL_23:
}

void __56__SSMetricsConfiguration_setReportingFrequencyOverride___block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.StoreServices.metrics-internal-settings-change", 0, 0, 1u);
}

- (BOOL)_decorateITMLEvents
{
  return [(SSMetricsConfiguration *)self _configBooleanForKey:@"decorateITMLEvents" defaultValue:0];
}

+ (id)_reportingFrequencyOverride
{
  CFStringRef v2 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v2)
  {
    CFStringRef v3 = v2;
    CFPreferencesAppSynchronize(v2);
    CFStringRef v4 = (void *)CFPreferencesCopyAppValue(@"SSVMetricsInternalSettingReportingFrequency", v3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      CFStringRef v4 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    CFStringRef v4 = 0;
  }
  return v4;
}

- (BOOL)_configBooleanForKey:(id)a3 defaultValue:(BOOL)a4
{
  CFStringRef v5 = [(NSDictionary *)self->_config objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (void)_setReportingFrequencyOverride:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SSMetricsConfiguration__setReportingFrequencyOverride___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __57__SSMetricsConfiguration__setReportingFrequencyOverride___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  CFStringRef v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 80) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v4;
  }
}

- (SSMetricsConfiguration)childConfiguration
{
  return self->_childConfiguration;
}

- (BOOL)disableEventDecoration
{
  return self->_disableEventDecoration;
}

- (void)setDisableEventDecoration:(BOOL)a3
{
  self->_disableEventDecoration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reportingFrequencyOverride, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_eventFieldsUnion, 0);
  objc_storeStrong((id *)&self->_cookieFieldsUnion, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_childConfiguration, 0);
  objc_storeStrong((id *)&self->_blacklistedEvents, 0);
}

@end