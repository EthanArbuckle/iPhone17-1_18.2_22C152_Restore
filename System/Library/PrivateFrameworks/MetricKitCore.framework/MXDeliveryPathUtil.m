@interface MXDeliveryPathUtil
- (BOOL)_createDiagnosticDirectoryForDeliveryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5;
- (BOOL)_createMetricDirectoryForDeliveryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5;
- (BOOL)createDiagnosticDirectoryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5;
- (BOOL)createMetricDirectoryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5;
- (MXBundleUtilProtocol)bundleUtil;
- (MXDeliveryPathUtil)initWithStorageUtil:(id)a3 andBundleUtil:(id)a4;
- (MXStorageUtilProtocol)storageUtil;
- (OS_os_log)logHandle;
- (id)_applicationContainerPath;
- (id)_diagnosticDeliveryDirectoryForAppContainerPath:(id)a3 forClient:(id)a4;
- (id)_filepathsFromDirectory:(id)a3 withError:(id *)a4;
- (id)_metricDeliveryDirectoryForAppContainerPath:(id)a3 forClient:(id)a4;
- (id)applicationContainerPathForBundleID:(id)a3;
- (id)diagnosticReportFilepathsFromClient:(id)a3 withError:(id *)a4;
- (id)filepathOfDiagnosticForDeliveryFromAppContainerPath:(id)a3 forClient:(id)a4 atDate:(id)a5;
- (id)filepathOfMetricForDeliveryFromAppContainerPath:(id)a3 forClient:(id)a4 atDate:(id)a5;
- (id)metricReportFilepathsFromClient:(id)a3 withError:(id *)a4;
- (void)_applicationContainerPath;
- (void)_protectDiagnosticUntilFirstUserAuthForPath:(id)a3 forClient:(id)a4 withError:(id *)a5;
- (void)_protectMetricUntilFirstUserAuthForPath:(id)a3 withError:(id *)a4;
- (void)setBundleUtil:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setStorageUtil:(id)a3;
@end

@implementation MXDeliveryPathUtil

- (id)metricReportFilepathsFromClient:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = [(MXDeliveryPathUtil *)self _applicationContainerPath];
  v8 = [(MXDeliveryPathUtil *)self _metricDeliveryDirectoryForAppContainerPath:v7 forClient:v6];

  v9 = [(MXDeliveryPathUtil *)self _filepathsFromDirectory:v8 withError:a4];

  return v9;
}

- (id)diagnosticReportFilepathsFromClient:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = [(MXDeliveryPathUtil *)self _applicationContainerPath];
  v8 = [(MXDeliveryPathUtil *)self _diagnosticDeliveryDirectoryForAppContainerPath:v7 forClient:v6];

  v9 = [(MXDeliveryPathUtil *)self _filepathsFromDirectory:v8 withError:a4];

  return v9;
}

- (id)_filepathsFromDirectory:(id)a3 withError:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8 = [(MXStorageUtilProtocol *)self->_storageUtil filesFromDirectory:v6 error:a4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [v6 stringByAppendingPathComponent:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];

  return v14;
}

- (id)_applicationContainerPath
{
  v3 = [MEMORY[0x263F55748] containerPath];
  v4 = [v3 stringByAppendingPathComponent:@"Library/Caches/MetricKit"];

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXDeliveryPathUtil _applicationContainerPath]();
  }

  return v4;
}

- (id)_metricDeliveryDirectoryForAppContainerPath:(id)a3 forClient:(id)a4
{
  id v5 = a4;
  id v6 = [a3 stringByAppendingPathComponent:@"Reports"];
  id v7 = [v6 stringByAppendingPathComponent:v5];

  return v7;
}

- (id)_diagnosticDeliveryDirectoryForAppContainerPath:(id)a3 forClient:(id)a4
{
  id v5 = a4;
  id v6 = [a3 stringByAppendingPathComponent:@"Diagnostics"];
  id v7 = [v6 stringByAppendingPathComponent:v5];

  return v7;
}

- (MXDeliveryPathUtil)initWithStorageUtil:(id)a3 andBundleUtil:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MXDeliveryPathUtil;
  uint64_t v9 = [(MXDeliveryPathUtil *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storageUtil, a3);
    objc_storeStrong((id *)&v10->_bundleUtil, a4);
    os_log_t v11 = os_log_create("com.apple.metrickit", "delivery.filepath.utility");
    logHandle = v10->_logHandle;
    v10->_logHandle = (OS_os_log *)v11;

    if (!v10->_logHandle) {
      objc_storeStrong((id *)&v10->_logHandle, &_os_log_internal);
    }
  }

  return v10;
}

- (id)filepathOfMetricForDeliveryFromAppContainerPath:(id)a3 forClient:(id)a4 atDate:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(MXDeliveryPathUtil *)self _metricDeliveryDirectoryForAppContainerPath:a3 forClient:a4];
  uint64_t v10 = [v8 description];

  os_log_t v11 = [@"report_" stringByAppendingString:v10];

  v12 = [v9 stringByAppendingPathComponent:v11];

  return v12;
}

- (id)filepathOfDiagnosticForDeliveryFromAppContainerPath:(id)a3 forClient:(id)a4 atDate:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(MXDeliveryPathUtil *)self _diagnosticDeliveryDirectoryForAppContainerPath:a3 forClient:a4];
  uint64_t v10 = [v8 description];

  os_log_t v11 = [@"diagnostic_report_" stringByAppendingString:v10];

  v12 = [v9 stringByAppendingPathComponent:v11];

  return v12;
}

- (id)applicationContainerPathForBundleID:(id)a3
{
  id v4 = a3;
  int v5 = [(MXBundleUtilProtocol *)self->_bundleUtil isAppInstalledForBundleID:v4];
  logHandle = self->_logHandle;
  BOOL v7 = os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[MXDeliveryPathUtil applicationContainerPathForBundleID:](logHandle);
    }
    id v8 = [(MXDeliveryPathUtil *)self _applicationContainerPath];
  }
  else
  {
    if (v7) {
      -[MXDeliveryPathUtil applicationContainerPathForBundleID:]();
    }
    id v8 = 0;
  }

  return v8;
}

- (BOOL)createMetricDirectoryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [a3 stringByAppendingPathComponent:@"Reports"];
  uint64_t v10 = [v9 stringByAppendingPathComponent:v8];

  id v17 = 0;
  BOOL v11 = [(MXDeliveryPathUtil *)self _createMetricDirectoryForDeliveryAtPath:v10 forClient:v8 withError:&v17];

  id v12 = v17;
  id v13 = v12;
  if (v11)
  {
    id v16 = v12;
    [(MXDeliveryPathUtil *)self _protectMetricUntilFirstUserAuthForPath:v10 withError:&v16];
    id v14 = v16;

    id v13 = v14;
  }
  else if (a5)
  {
    id v13 = v12;
    *a5 = v13;
  }

  return v11;
}

- (BOOL)createDiagnosticDirectoryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [a3 stringByAppendingPathComponent:@"Diagnostics"];
  uint64_t v10 = [v9 stringByAppendingPathComponent:v8];

  id v17 = 0;
  BOOL v11 = [(MXDeliveryPathUtil *)self _createDiagnosticDirectoryForDeliveryAtPath:v10 forClient:v8 withError:&v17];
  id v12 = v17;
  id v13 = v12;
  if (v11)
  {
    id v16 = v12;
    [(MXDeliveryPathUtil *)self _protectDiagnosticUntilFirstUserAuthForPath:v10 forClient:v8 withError:&v16];
    id v14 = v16;

    id v13 = v14;
  }
  else if (a5)
  {
    id v13 = v12;
    *a5 = v13;
  }

  return v11;
}

- (BOOL)_createMetricDirectoryForDeliveryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5
{
  if ([(MXStorageUtilProtocol *)self->_storageUtil createDirectory:a3 error:a5]) {
    return 1;
  }
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
    -[MXDeliveryPathUtil _createMetricDirectoryForDeliveryAtPath:forClient:withError:]((uint64_t)a5, logHandle, v8, v9, v10, v11, v12, v13);
  }
  id v14 = [*a5 domain];
  if ([v14 isEqualToString:*MEMORY[0x263F07F70]])
  {
    uint64_t v15 = [*a5 code];

    if (v15 == 516) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)_createDiagnosticDirectoryForDeliveryAtPath:(id)a3 forClient:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x263F55748] verifySDKVersionForClient:v9])
  {
    if (([(MXStorageUtilProtocol *)self->_storageUtil createDirectory:v8 error:a5] & 1) == 0)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
        -[MXDeliveryPathUtil _createDiagnosticDirectoryForDeliveryAtPath:forClient:withError:]((uint64_t)a5, logHandle, v11, v12, v13, v14, v15, v16);
      }
      id v17 = [*a5 domain];
      if (![v17 isEqualToString:*MEMORY[0x263F07F70]])
      {

LABEL_13:
        BOOL v19 = 0;
        goto LABEL_11;
      }
      uint64_t v18 = [*a5 code];

      if (v18 != 516) {
        goto LABEL_13;
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
  {
    -[MXDeliveryPathUtil _createDiagnosticDirectoryForDeliveryAtPath:forClient:withError:]();
  }
  BOOL v19 = 1;
LABEL_11:

  return v19;
}

- (void)_protectMetricUntilFirstUserAuthForPath:(id)a3 withError:(id *)a4
{
  storageUtil = self->_storageUtil;
  id v7 = a3;
  id v8 = [(MXStorageUtilProtocol *)storageUtil attributesOfItemAtPath:v7 error:a4];
  [(MXStorageUtilProtocol *)self->_storageUtil setAuthProtectionForPath:v7 fromAttributes:v8];
}

- (void)_protectDiagnosticUntilFirstUserAuthForPath:(id)a3 forClient:(id)a4 withError:(id *)a5
{
  id v11 = a3;
  storageUtil = self->_storageUtil;
  id v9 = a4;
  uint64_t v10 = [(MXStorageUtilProtocol *)storageUtil attributesOfItemAtPath:v11 error:a5];
  LODWORD(storageUtil) = [MEMORY[0x263F55748] verifySDKVersionForClient:v9];

  if (storageUtil) {
    [(MXStorageUtilProtocol *)self->_storageUtil setAuthProtectionForPath:v11 fromAttributes:v10];
  }
}

- (MXStorageUtilProtocol)storageUtil
{
  return (MXStorageUtilProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStorageUtil:(id)a3
{
}

- (MXBundleUtilProtocol)bundleUtil
{
  return (MXBundleUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleUtil:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_bundleUtil, 0);

  objc_storeStrong((id *)&self->_storageUtil, 0);
}

- (void)applicationContainerPathForBundleID:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263F55748];
  v2 = a1;
  v3 = [v1 containerPath];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22BB49000, v2, OS_LOG_TYPE_DEBUG, "Container Path: %@", v4, 0xCu);
}

- (void)applicationContainerPathForBundleID:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22BB49000, v0, OS_LOG_TYPE_DEBUG, "Application: %@ uninstalled", v1, 0xCu);
}

- (void)_applicationContainerPath
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22BB49000, v0, OS_LOG_TYPE_DEBUG, "Application Container Path: %@", v1, 0xCu);
}

- (void)_createMetricDirectoryForDeliveryAtPath:(uint64_t)a3 forClient:(uint64_t)a4 withError:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createDiagnosticDirectoryForDeliveryAtPath:(uint64_t)a3 forClient:(uint64_t)a4 withError:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createDiagnosticDirectoryForDeliveryAtPath:forClient:withError:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_22BB49000, v0, v1, "failed to verify SDK version for client: %@", v2, v3, v4, v5, v6);
}

@end