@interface MXMetricServices
- (BOOL)_isMetricSourceDataAvailable;
- (MXClientUtilProtocol)clientUtil;
- (MXMetricServices)initWithClientUtil:(id)a3 andSourcePathUtil:(id)a4;
- (MXSourcePathUtilProtocol)sourcePathUtil;
- (NSMutableSet)services;
- (OS_os_log)logHandle;
- (id)_clientMetricsFromServices;
- (id)_metricPayloadsForClient:(id)a3;
- (id)_metricsFromServicesForClient:(id)a3;
- (id)clientMetricPayloadsForAllClients;
- (void)_cleanServiceMetricsDirectories;
- (void)_createServices;
- (void)_isMetricSourceDataAvailable;
- (void)_startServices;
- (void)_stopServices;
- (void)setClientUtil:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setSourcePathUtil:(id)a3;
@end

@implementation MXMetricServices

- (MXMetricServices)initWithClientUtil:(id)a3 andSourcePathUtil:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MXMetricServices;
  v9 = [(MXMetricServices *)&v15 init];
  if (v9)
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    services = v9->_services;
    v9->_services = v10;

    objc_storeStrong((id *)&v9->_clientUtil, a3);
    objc_storeStrong((id *)&v9->_sourcePathUtil, a4);
    os_log_t v12 = os_log_create("com.apple.metrickit", "metric.service.manager");
    logHandle = v9->_logHandle;
    v9->_logHandle = (OS_os_log *)v12;

    if (!v9->_logHandle) {
      objc_storeStrong((id *)&v9->_logHandle, &_os_log_internal);
    }
  }

  return v9;
}

- (id)clientMetricPayloadsForAllClients
{
  [(MXMetricServices *)self _createServices];
  [(MXMetricServices *)self _startServices];
  if ([(MXMetricServices *)self _isMetricSourceDataAvailable])
  {
    v3 = [(MXMetricServices *)self _clientMetricsFromServices];
    [(MXMetricServices *)self _stopServices];
    [(MXMetricServices *)self _cleanServiceMetricsDirectories];
  }
  else
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_INFO, "No data available to process", v6, 2u);
    }
    [(MXMetricServices *)self _stopServices];
    v3 = 0;
  }

  return v3;
}

- (void)_createServices
{
  v3 = [(MXMetricServices *)self services];

  if (v3)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEFAULT, "Initializing MXCore Services\n", v7, 2u);
    }
    v5 = [(MXMetricServices *)self services];
    v6 = [MEMORY[0x263F55730] sharedPowerlogService];
    [v5 addObject:v6];
  }
}

- (void)_startServices
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(MXMetricServices *)self services];
  v4 = [v3 allObjects];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 138412290;
    long long v16 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v10, "startService", v16) & 1) == 0)
        {
          logHandle = self->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v22 = v10;
            _os_log_error_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_ERROR, "%@ service failed to start", buf, 0xCu);
          }
          os_log_t v12 = [(MXMetricServices *)self services];
          [v12 removeObject:v10];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  v13 = self->_logHandle;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    objc_super v15 = [(MXMetricServices *)self services];
    *(_DWORD *)buf = 138412290;
    v22 = v15;
    _os_log_impl(&dword_22BB49000, v14, OS_LOG_TYPE_INFO, "Services started:%@", buf, 0xCu);
  }
}

- (void)_stopServices
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(MXMetricServices *)self services];

  if (v3)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEFAULT, "Stopping MXCore Services\n", buf, 2u);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [(MXMetricServices *)self services];
    long long v6 = [v5 allObjects];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v17;
      *(void *)&long long v8 = 138412290;
      long long v15 = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          os_log_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v12, "stopService", v15) & 1) == 0)
          {
            v13 = self->_logHandle;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              v21 = v12;
              _os_log_error_impl(&dword_22BB49000, v13, OS_LOG_TYPE_ERROR, "%@ service failed to stop", buf, 0xCu);
            }
            v14 = [(MXMetricServices *)self services];
            [v14 removeObject:v12];
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v9);
    }
  }
}

- (void)_cleanServiceMetricsDirectories
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(MXMetricServices *)self services];

  if (v3)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEFAULT, "Cleaning MXCore Services Data Directories\n", buf, 2u);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [(MXMetricServices *)self services];
    long long v6 = [v5 allObjects];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v16;
      *(void *)&long long v8 = 138412290;
      long long v14 = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          os_log_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "isStarted", v14))
          {
            v13 = self->_logHandle;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v14;
              long long v20 = v12;
              _os_log_error_impl(&dword_22BB49000, v13, OS_LOG_TYPE_ERROR, "Cannot clean %@ data directory when service is started", buf, 0xCu);
            }
          }
          else
          {
            -[MXSourcePathUtilProtocol cleanDataDirectoryForSource:](self->_sourcePathUtil, "cleanDataDirectoryForSource:", [v12 sourceID]);
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)_isMetricSourceDataAvailable
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(MXMetricServices *)self services];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 metricsSupported] && (objc_msgSend(v8, "metricsAvailable") & 1) == 0)
        {
          logHandle = self->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
            [(MXMetricServices *)(uint64_t)v8 _isMetricSourceDataAvailable];
          }
          BOOL v9 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_14:

  return v9;
}

- (id)_metricPayloadsForClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MXMetricServices *)self _metricsFromServicesForClient:v4];
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXMetricServices _metricPayloadsForClient:]((uint64_t)v5, logHandle);
  }
  uint64_t v7 = +[MXCorePayloadConstructor buildPayloadForClient:v4 fromClientMetricsDictionary:v5];

  return v7;
}

- (id)_metricsFromServicesForClient:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [(MXMetricServices *)self services];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v8 = 138412546;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "getMetricsForClient:", v4, v17);
        if (v13)
        {
          logHandle = self->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v17;
            uint64_t v23 = v12;
            __int16 v24 = 2112;
            v25 = v13;
            _os_log_debug_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEBUG, "Service: %@ returned data: %@", buf, 0x16u);
          }
          long long v15 = objc_msgSend(&unk_26DF1F698, "objectAtIndexedSubscript:", objc_msgSend(v12, "sourceID"));
          [v5 setObject:v13 forKey:v15];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)_clientMetricsFromServices
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(MXClientUtilProtocol *)self->_clientUtil allClients];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v16;
    *(void *)&long long v6 = 138412290;
    long long v14 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = -[MXMetricServices _metricPayloadsForClient:](self, "_metricPayloadsForClient:", v10, v14);
        if ([v11 count])
        {
          [v3 setObject:v11 forKeyedSubscript:v10];
        }
        else
        {
          logHandle = self->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            uint64_t v20 = v10;
            _os_log_error_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_ERROR, "No metric report for client:%@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }

  return v3;
}

- (NSMutableSet)services
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (MXClientUtilProtocol)clientUtil
{
  return (MXClientUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientUtil:(id)a3
{
}

- (MXSourcePathUtilProtocol)sourcePathUtil
{
  return (MXSourcePathUtilProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSourcePathUtil:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_sourcePathUtil, 0);
  objc_storeStrong((id *)&self->_clientUtil, 0);

  objc_storeStrong((id *)&self->_services, 0);
}

- (void)_isMetricSourceDataAvailable
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BB49000, a2, OS_LOG_TYPE_ERROR, "Service %@ returned NO for metrics check ", (uint8_t *)&v2, 0xCu);
}

- (void)_metricPayloadsForClient:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22BB49000, a2, OS_LOG_TYPE_DEBUG, "Client Metrics to Parse:%@", (uint8_t *)&v2, 0xCu);
}

@end