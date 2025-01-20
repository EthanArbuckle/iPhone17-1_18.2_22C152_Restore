@interface CAFDStateCaptureManager
- (CAFCarConfiguration)currentCarConfiguration;
- (CAFDStateCaptureManager)init;
- (CAFDStateCaptureManagerDelegate)delegate;
- (CAFStateCapture)carStateCapture;
- (CAFStateCapture)registrationsStateCapture;
- (NSArray)cachedValuesStateCaptures;
- (NSMutableDictionary)pluginStateCaptures;
- (id)carConfigSummary;
- (id)stateCaptureForPluginID:(id)a3;
- (id)valueCaptureIIDsFromAccessoryConfig:(id)a3;
- (void)carConfigDidUpdate;
- (void)setCachedValuesStateCaptures:(id)a3;
- (void)setCarStateCapture:(id)a3;
- (void)setCurrentCarConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPluginStateCaptures:(id)a3;
- (void)setRegistrationsStateCapture:(id)a3;
@end

@implementation CAFDStateCaptureManager

- (CAFDStateCaptureManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)CAFDStateCaptureManager;
  v2 = [(CAFDStateCaptureManager *)&v15 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pluginStateCaptures = v2->_pluginStateCaptures;
    v2->_pluginStateCaptures = (NSMutableDictionary *)v3;

    objc_initWeak(&location, v2);
    id v5 = objc_alloc((Class)CAFStateCapture);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __31__CAFDStateCaptureManager_init__block_invoke;
    v12[3] = &unk_100034BD0;
    objc_copyWeak(&v13, &location);
    id v6 = [v5 initWithIdentifier:@"Notification Registrations" capture:v12];
    [(CAFDStateCaptureManager *)v2 setRegistrationsStateCapture:v6];

    id v7 = objc_alloc((Class)CAFStateCapture);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __31__CAFDStateCaptureManager_init__block_invoke_2;
    v10[3] = &unk_100034BD0;
    objc_copyWeak(&v11, &location);
    id v8 = [v7 initWithIdentifier:@"Car" capture:v10];
    [(CAFDStateCaptureManager *)v2 setCarStateCapture:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __31__CAFDStateCaptureManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_opt_new();
    uint64_t v3 = [WeakRetained delegate];
    id v4 = [v3 pluginCount];

    if (v4)
    {
      unint64_t v5 = 0;
      do
      {
        id v6 = [WeakRetained delegate];
        id v7 = +[NSNumber numberWithUnsignedInteger:v5];
        id v8 = [v6 registrationsForPluginID:v7];
        v9 = +[NSNumber numberWithUnsignedInteger:v5];
        [v2 setObject:v8 forKeyedSubscript:v9];

        ++v5;
        v10 = [WeakRetained delegate];
        id v11 = [v10 pluginCount];
      }
      while (v5 < (unint64_t)v11);
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *__31__CAFDStateCaptureManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained currentCarConfiguration];
    id v4 = v3;
    if (v3)
    {
      v15[0] = @"name";
      uint64_t v5 = [v3 name];
      id v6 = (void *)v5;
      CFStringRef v7 = @"Unknown Name";
      if (v5) {
        CFStringRef v7 = (const __CFString *)v5;
      }
      v16[0] = v7;
      v15[1] = @"uniqueIdentifier";
      id v8 = [v4 uniqueIdentifier];
      v9 = [v8 UUIDString];
      v16[1] = v9;
      v15[2] = @"pluginCount";
      v10 = [v2 delegate];
      id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 pluginCount]);
      v16[2] = v11;
      v15[3] = @"configs";
      v12 = [v2 carConfigSummary];
      v16[3] = v12;
      id v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
    }
    else
    {
      id v13 = @"No Car";
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)setCurrentCarConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_currentCarConfiguration, a3);

  [(CAFDStateCaptureManager *)self carConfigDidUpdate];
}

- (void)carConfigDidUpdate
{
  uint64_t v3 = CAFStateCaptureLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(CAFDStateCaptureManager *)self pluginStateCaptures];
    uint64_t v5 = [v4 allKeys];
    id v6 = [v5 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 136315394;
    v23 = "-[CAFDStateCaptureManager carConfigDidUpdate]";
    __int16 v24 = 2112;
    unint64_t v25 = (unint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s fired, capturing [%@]", buf, 0x16u);
  }
  CFStringRef v7 = [(CAFDStateCaptureManager *)self delegate];
  id v8 = [v7 pluginCount];

  if (v8)
  {
    unint64_t v10 = 0;
    *(void *)&long long v9 = 136315394;
    long long v21 = v9;
    do
    {
      id v11 = [(CAFDStateCaptureManager *)self pluginStateCaptures];
      v12 = +[NSNumber numberWithUnsignedInteger:v10];
      id v13 = [v11 objectForKeyedSubscript:v12];

      if (!v13)
      {
        v14 = CAFStateCaptureLogging();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v21;
          v23 = "-[CAFDStateCaptureManager carConfigDidUpdate]";
          __int16 v24 = 2048;
          unint64_t v25 = v10;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s setting up captures for pluginID %lu", buf, 0x16u);
        }

        objc_super v15 = +[NSNumber numberWithUnsignedInteger:v10];
        v16 = [(CAFDStateCaptureManager *)self stateCaptureForPluginID:v15];

        if ([v16 count])
        {
          v17 = [(CAFDStateCaptureManager *)self pluginStateCaptures];
          v18 = +[NSNumber numberWithUnsignedInteger:v10];
          [v17 setObject:v16 forKeyedSubscript:v18];
        }
      }
      ++v10;
      v19 = [(CAFDStateCaptureManager *)self delegate];
      id v20 = [v19 pluginCount];
    }
    while (v10 < (unint64_t)v20);
  }
}

- (id)stateCaptureForPluginID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  objc_opt_class();
  id v6 = [(CAFDStateCaptureManager *)self currentCarConfiguration];
  CFStringRef v7 = [v6 pluginConfigs];
  id v8 = [v7 objectForKeyedSubscript:v4];
  id v9 = [v8 objectForKeyedSubscript:kCarDataConfigurationAccessoriesKey];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke;
  v15[3] = &unk_100034C48;
  id v11 = v5;
  id v16 = v11;
  id v17 = v4;
  v18 = self;
  id v12 = v4;
  [v10 enumerateObjectsUsingBlock:v15];
  id v13 = v11;

  return v13;
}

void __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  objc_opt_class();
  id v6 = [v5 objectForKeyedSubscript:kCarDataConfigurationIIDKey];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = +[CAFCarConfiguration getType:v5];
  id v9 = *(void **)(a1 + 32);
  id v10 = objc_alloc((Class)CAFStateCapture);
  id v11 = +[NSString stringWithFormat:@"PluginConfig %@.%@", *(void *)(a1 + 40), v7];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke_2;
  v24[3] = &unk_100034BF8;
  id v12 = v5;
  id v25 = v12;
  id v13 = [v10 initWithIdentifier:v11 capture:v24];
  [v9 addObject:v13];

  v14 = +[CAFAccessoryTypes stateCaptureValues];
  LODWORD(v13) = [v14 containsObject:v8];

  if (v13)
  {
    objc_super v15 = *(void **)(a1 + 32);
    id v16 = objc_alloc((Class)CAFStateCapture);
    id v17 = +[NSString stringWithFormat:@"PluginValues %@.%@", *(void *)(a1 + 40), v7];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke_3;
    v21[3] = &unk_100034C20;
    int8x16_t v20 = *(int8x16_t *)(a1 + 40);
    id v18 = (id)v20.i64[0];
    int8x16_t v22 = vextq_s8(v20, v20, 8uLL);
    id v23 = v12;
    id v19 = [v16 initWithIdentifier:v17 capture:v21];
    [v15 addObject:v19];
  }
}

id __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __51__CAFDStateCaptureManager_stateCaptureForPluginID___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [*(id *)(a1 + 40) unsignedIntegerValue];
  id v4 = [*(id *)(a1 + 32) valueCaptureIIDsFromAccessoryConfig:*(void *)(a1 + 48)];
  id v5 = [v2 valuesForPluginID:v3 iids:v4];

  return v5;
}

- (id)carConfigSummary
{
  id v3 = objc_opt_new();
  id v4 = [(CAFDStateCaptureManager *)self currentCarConfiguration];
  id v5 = [v4 pluginConfigs];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __43__CAFDStateCaptureManager_carConfigSummary__block_invoke;
  v8[3] = &unk_100034C98;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __43__CAFDStateCaptureManager_carConfigSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_opt_new();
  objc_opt_class();
  id v8 = [v5 objectForKeyedSubscript:kCarDataConfigurationAccessoriesKey];

  id v9 = v8;
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_2;
  v12[3] = &unk_100034C70;
  id v13 = v7;
  id v11 = v7;
  [v10 enumerateObjectsUsingBlock:v12];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v6];
}

void __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  objc_opt_class();
  id v6 = [v5 objectForKeyedSubscript:kCarDataConfigurationIIDKey];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = objc_opt_new();
  objc_opt_class();
  uint64_t v9 = kCarDataConfigurationServicesKey;
  id v10 = [v5 objectForKeyedSubscript:kCarDataConfigurationServicesKey];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  objc_super v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_3;
  id v18 = &unk_100034C70;
  id v19 = v8;
  id v12 = v8;
  [v11 enumerateObjectsUsingBlock:&v15];
  v20[0] = kCarDataConfigurationTypeKey;
  id v13 = +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v5, v15, v16, v17, v18);
  v20[1] = v9;
  v21[0] = v13;
  v21[1] = v12;
  v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v7];
}

void __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  objc_opt_class();
  id v6 = [v5 objectForKeyedSubscript:kCarDataConfigurationIIDKey];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = objc_opt_new();
  objc_opt_class();
  uint64_t v9 = kCarDataConfigurationCharacteristicsKey;
  id v10 = [v5 objectForKeyedSubscript:kCarDataConfigurationCharacteristicsKey];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  objc_super v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_4;
  id v18 = &unk_100034C70;
  id v19 = v8;
  id v12 = v8;
  [v11 enumerateObjectsUsingBlock:&v15];
  v20[0] = kCarDataConfigurationTypeKey;
  id v13 = +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v5, v15, v16, v17, v18);
  v20[1] = v9;
  v21[0] = v13;
  v21[1] = v12;
  v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v7];
}

void __43__CAFDStateCaptureManager_carConfigSummary__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  id v9 = v4;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v9;
    }
    else {
      id v5 = 0;
    }
    id v4 = v9;
  }
  else
  {
    id v5 = 0;
  }

  objc_opt_class();
  id v6 = [v5 objectForKeyedSubscript:kCarDataConfigurationIIDKey];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = +[CAFCarConfiguration getType:v5];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

- (id)valueCaptureIIDsFromAccessoryConfig:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_opt_class();
  id v5 = [v3 objectForKeyedSubscript:kCarDataConfigurationServicesKey];

  id v6 = v5;
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __63__CAFDStateCaptureManager_valueCaptureIIDsFromAccessoryConfig___block_invoke;
  v10[3] = &unk_100034C70;
  id v8 = v4;
  id v11 = v8;
  [v7 enumerateObjectsUsingBlock:v10];

  return v8;
}

void __63__CAFDStateCaptureManager_valueCaptureIIDsFromAccessoryConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = +[CAFCarConfiguration getType:v5];
  id v7 = +[CAFServiceTypes stateCaptureValues];
  unsigned int v8 = [v7 containsObject:v6];

  if (v8)
  {
    objc_opt_class();
    id v9 = [v5 objectForKeyedSubscript:kCarDataConfigurationCharacteristicsKey];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __63__CAFDStateCaptureManager_valueCaptureIIDsFromAccessoryConfig___block_invoke_2;
    v11[3] = &unk_100034C70;
    id v12 = *(id *)(a1 + 32);
    [v10 enumerateObjectsUsingBlock:v11];
  }
}

void __63__CAFDStateCaptureManager_valueCaptureIIDsFromAccessoryConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  id v11 = v4;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v11;
    }
    else {
      id v5 = 0;
    }
    id v4 = v11;
  }
  else
  {
    id v5 = 0;
  }

  id v6 = +[CAFCarConfiguration getType:v5];
  id v7 = +[CAFCharacteristicTypes stateCaptureValues];
  unsigned int v8 = [v7 containsObject:v6];

  if (v8)
  {
    objc_opt_class();
    id v9 = [v5 objectForKeyedSubscript:kCarDataConfigurationIIDKey];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    [*(id *)(a1 + 32) addObject:v10];
  }
}

- (CAFDStateCaptureManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CAFDStateCaptureManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CAFCarConfiguration)currentCarConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentCarConfiguration);

  return (CAFCarConfiguration *)WeakRetained;
}

- (CAFStateCapture)registrationsStateCapture
{
  return self->_registrationsStateCapture;
}

- (void)setRegistrationsStateCapture:(id)a3
{
}

- (CAFStateCapture)carStateCapture
{
  return self->_carStateCapture;
}

- (void)setCarStateCapture:(id)a3
{
}

- (NSArray)cachedValuesStateCaptures
{
  return self->_cachedValuesStateCaptures;
}

- (void)setCachedValuesStateCaptures:(id)a3
{
}

- (NSMutableDictionary)pluginStateCaptures
{
  return self->_pluginStateCaptures;
}

- (void)setPluginStateCaptures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginStateCaptures, 0);
  objc_storeStrong((id *)&self->_cachedValuesStateCaptures, 0);
  objc_storeStrong((id *)&self->_carStateCapture, 0);
  objc_storeStrong((id *)&self->_registrationsStateCapture, 0);
  objc_destroyWeak((id *)&self->_currentCarConfiguration);

  objc_destroyWeak((id *)&self->_delegate);
}

@end