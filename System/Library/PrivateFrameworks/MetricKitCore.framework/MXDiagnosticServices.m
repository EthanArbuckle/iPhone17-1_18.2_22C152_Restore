@interface MXDiagnosticServices
- (MXDateUtil)dateUtil;
- (MXDiagnosticServices)initWithSourcePathUtil:(id)a3 andDateUtil:(id)a4;
- (MXSourcePathUtilProtocol)sourcePathUtil;
- (NSMutableSet)services;
- (OS_os_log)logHandle;
- (id)_diagnosticPayloadForClient:(id)a3 andDate:(id)a4;
- (id)_diagnosticsFromServicesForClient:(id)a3 dateString:(id)a4;
- (id)diagnosticPayloadForClient:(id)a3 andDate:(id)a4;
- (id)diagnosticPayloadForClient:(id)a3 isExtension:(BOOL)a4 andMainAppBundleID:(id)a5 andDate:(id)a6;
- (void)_createServicesForClient:(id)a3;
- (void)_startServices;
- (void)_stopServices;
- (void)cleanServiceDiagnosticsDirectoriesForClient:(id)a3;
- (void)setDateUtil:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setSourcePathUtil:(id)a3;
@end

@implementation MXDiagnosticServices

- (void)cleanServiceDiagnosticsDirectoriesForClient:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MXDiagnosticServices *)self services];

  if (v5)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEFAULT, "Cleaning MXSource Services Data Directories\n", buf, 2u);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = [(MXDiagnosticServices *)self services];
    v8 = [v7 allObjects];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v18;
      *(void *)&long long v10 = 138412290;
      long long v16 = v10;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "isStarted", v16))
          {
            v15 = self->_logHandle;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v16;
              v22 = v14;
              _os_log_error_impl(&dword_22BB49000, v15, OS_LOG_TYPE_ERROR, "Cannot clean %@ data directory when service is started", buf, 0xCu);
            }
          }
          else
          {
            -[MXSourcePathUtilProtocol cleanDiagnosticsDirectoryForSource:andClient:](self->_sourcePathUtil, "cleanDiagnosticsDirectoryForSource:andClient:", [v14 sourceID], v4);
          }
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v11);
    }
  }
}

- (NSMutableSet)services
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (MXDiagnosticServices)initWithSourcePathUtil:(id)a3 andDateUtil:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MXDiagnosticServices;
  uint64_t v9 = [(MXDiagnosticServices *)&v15 init];
  if (v9)
  {
    long long v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    services = v9->_services;
    v9->_services = v10;

    objc_storeStrong((id *)&v9->_sourcePathUtil, a3);
    objc_storeStrong((id *)&v9->_dateUtil, a4);
    os_log_t v12 = os_log_create("com.apple.metrickit", "diagnostic.service.manager");
    logHandle = v9->_logHandle;
    v9->_logHandle = (OS_os_log *)v12;

    if (!v9->_logHandle) {
      objc_storeStrong((id *)&v9->_logHandle, &_os_log_internal);
    }
  }

  return v9;
}

- (id)diagnosticPayloadForClient:(id)a3 andDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x263F55748] verifySDKVersionForClient:v6])
  {
    [(MXDiagnosticServices *)self _createServicesForClient:v6];
    [(MXDiagnosticServices *)self _startServices];
    id v8 = [(MXDiagnosticServices *)self _diagnosticPayloadForClient:v6 andDate:v7];
    [(MXDiagnosticServices *)self _stopServices];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_createServicesForClient:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MXDiagnosticServices *)self services];

  if (v5)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEFAULT, "Initializing MXSource Services\n", buf, 2u);
    }
    id v7 = [(MXDiagnosticServices *)self services];
    id v8 = [MEMORY[0x263F55728] sharedHangTracerService];
    [v7 addObject:v8];

    uint64_t v9 = [(MXDiagnosticServices *)self services];
    long long v10 = [MEMORY[0x263F55740] sharedSpinTracerService];
    [v9 addObject:v10];

    uint64_t v11 = [(MXDiagnosticServices *)self services];
    os_log_t v12 = [MEMORY[0x263F55738] sharedReportCrashService];
    [v11 addObject:v12];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v13 = [(MXDiagnosticServices *)self services];
    v14 = [v13 allObjects];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) setCurrentClient:v4];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v16);
    }
  }
}

- (void)_startServices
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [(MXDiagnosticServices *)self services];

  if (v3)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = [(MXDiagnosticServices *)self services];
    v5 = [v4 allObjects];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v19;
      *(void *)&long long v7 = 138412290;
      long long v17 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v11, "startService", v17) & 1) == 0)
          {
            logHandle = self->_logHandle;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              v23 = v11;
              _os_log_error_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_ERROR, "%@ service failed to start", buf, 0xCu);
            }
            v13 = [(MXDiagnosticServices *)self services];
            [v13 removeObject:v11];
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v8);
    }

    v14 = self->_logHandle;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = v14;
      uint64_t v16 = [(MXDiagnosticServices *)self services];
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_22BB49000, v15, OS_LOG_TYPE_INFO, "Services started:%@", buf, 0xCu);
    }
  }
}

- (void)_stopServices
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(MXDiagnosticServices *)self services];

  if (v3)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEFAULT, "Stopping MXSource Services\n", buf, 2u);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [(MXDiagnosticServices *)self services];
    uint64_t v6 = [v5 allObjects];

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
              long long v21 = v12;
              _os_log_error_impl(&dword_22BB49000, v13, OS_LOG_TYPE_ERROR, "%@ service failed to stop", buf, 0xCu);
            }
            v14 = [(MXDiagnosticServices *)self services];
            [v14 removeObject:v12];
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v9);
    }
  }
}

- (id)_diagnosticPayloadForClient:(id)a3 andDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(MXDiagnosticServices *)self dateUtil];
  uint64_t v9 = [v8 stringFromDate:v7];

  uint64_t v10 = [(MXDiagnosticServices *)self _diagnosticsFromServicesForClient:v6 dateString:v9];
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXDiagnosticServices _diagnosticPayloadForClient:andDate:]((uint64_t)v10, logHandle);
  }
  os_log_t v12 = +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:v6 fromClientDiagnosticsDictionary:v10 withDateString:v9];

  return v12;
}

- (id)_diagnosticsFromServicesForClient:(id)a3 dateString:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v8 = self;
  uint64_t v9 = [(MXDiagnosticServices *)self services];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v23;
    *(void *)&long long v11 = 138412546;
    long long v20 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v16 = objc_msgSend(v15, "getDiagnosticsForClient:dateString:", v6, v7, v20);
        if (v16)
        {
          logHandle = v8->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            v27 = v15;
            __int16 v28 = 2112;
            v29 = v16;
            _os_log_debug_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEBUG, "Service: %@ returned data: %@", buf, 0x16u);
          }
          long long v18 = objc_msgSend(&unk_26DF1F5F0, "objectAtIndexedSubscript:", objc_msgSend(v15, "sourceID"));
          [v21 setObject:v16 forKey:v18];
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v12);
  }

  return v21;
}

- (id)diagnosticPayloadForClient:(id)a3 isExtension:(BOOL)a4 andMainAppBundleID:(id)a5 andDate:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v8) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v10;
  }
  id v14 = v13;
  id v15 = a6;
  [(MXDiagnosticServices *)self _createServicesForClient:v14];
  [(MXDiagnosticServices *)self _startServices];
  long long v16 = [(MXDiagnosticServices *)self _diagnosticPayloadForClient:v10 andDate:v15];

  [(MXDiagnosticServices *)self _stopServices];

  return v16;
}

- (MXSourcePathUtilProtocol)sourcePathUtil
{
  return (MXSourcePathUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSourcePathUtil:(id)a3
{
}

- (MXDateUtil)dateUtil
{
  return (MXDateUtil *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDateUtil:(id)a3
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
  objc_storeStrong((id *)&self->_dateUtil, 0);
  objc_storeStrong((id *)&self->_sourcePathUtil, 0);

  objc_storeStrong((id *)&self->_services, 0);
}

- (void)_diagnosticPayloadForClient:(uint64_t)a1 andDate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22BB49000, a2, OS_LOG_TYPE_DEBUG, "Client Diagnostics to Parse: %@", (uint8_t *)&v2, 0xCu);
}

@end