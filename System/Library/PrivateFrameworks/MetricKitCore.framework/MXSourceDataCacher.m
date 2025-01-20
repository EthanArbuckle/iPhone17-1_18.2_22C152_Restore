@interface MXSourceDataCacher
- (BOOL)saveToSourceDirectoryWithDiagnosticSourcePayload:(id)a3;
- (BOOL)saveToSourceDirectoryWithMetricSourcePayload:(id)a3;
- (MXBundleUtilProtocol)bundleUtil;
- (MXSourceDataCacher)initWithSourcePathUtil:(id)a3 andStorageUtil:(id)a4 andBundleUtil:(id)a5;
- (MXSourcePathUtilProtocol)sourcePathUtil;
- (MXStorageUtilProtocol)storageUtil;
- (OS_os_log)logHandle;
- (void)setBundleUtil:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setSourcePathUtil:(id)a3;
- (void)setStorageUtil:(id)a3;
@end

@implementation MXSourceDataCacher

- (MXSourceDataCacher)initWithSourcePathUtil:(id)a3 andStorageUtil:(id)a4 andBundleUtil:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MXSourceDataCacher;
  v12 = [(MXSourceDataCacher *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourcePathUtil, a3);
    objc_storeStrong((id *)&v13->_storageUtil, a4);
    objc_storeStrong((id *)&v13->_bundleUtil, a5);
    os_log_t v14 = os_log_create("com.apple.metrickit", "source.cache.manager");
    logHandle = v13->_logHandle;
    v13->_logHandle = (OS_os_log *)v14;

    if (!v13->_logHandle) {
      objc_storeStrong((id *)&v13->_logHandle, &_os_log_internal);
    }
  }

  return v13;
}

- (BOOL)saveToSourceDirectoryWithMetricSourcePayload:(id)a3
{
  id v4 = a3;
  storageUtil = self->_storageUtil;
  id v19 = 0;
  v6 = [(MXStorageUtilProtocol *)storageUtil archivedDataWithObject:v4 error:&v19];
  id v7 = v19;
  v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
      -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.5();
    }
    sourcePathUtil = self->_sourcePathUtil;
    uint64_t v11 = [v4 sourceID];
    v12 = [v4 bundleID];
    v13 = [v4 datestamp];
    os_log_t v14 = [(MXSourcePathUtilProtocol *)sourcePathUtil filePathOfMetricSourcePayloadForSourceID:v11 andBundleID:v12 andDate:v13];

    if (!v14)
    {
      BOOL v17 = 0;
      goto LABEL_19;
    }
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
      -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.4();
    }
    if (([(MXStorageUtilProtocol *)self->_storageUtil saveData:v6 withFilePath:v14] & 1) == 0)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
        -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:](logHandle);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
  {
    -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:]();
  }
  v16 = self->_logHandle;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:](v16, v4);
  }
  BOOL v17 = 1;
LABEL_19:

  return v17;
}

- (BOOL)saveToSourceDirectoryWithDiagnosticSourcePayload:(id)a3
{
  id v4 = a3;
  storageUtil = self->_storageUtil;
  id v21 = 0;
  v6 = [(MXStorageUtilProtocol *)storageUtil archivedDataWithObject:v4 error:&v21];
  id v7 = v21;
  v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
      -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.5();
    }
    id v10 = [v4 bundleID];
    if ([(MXBundleUtilProtocol *)self->_bundleUtil isAppExtensionFromBundleID:v10]&& ([(MXBundleUtilProtocol *)self->_bundleUtil mainAppBundleIDforExtension:v10], v11 = objc_claimAutoreleasedReturnValue(), v10, (id v10 = (void *)v11) == 0))
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
        -[MXSourceDataCacher saveToSourceDirectoryWithDiagnosticSourcePayload:](logHandle, v4);
      }
    }
    else
    {
      sourcePathUtil = self->_sourcePathUtil;
      uint64_t v13 = [v4 sourceID];
      os_log_t v14 = [v4 datestamp];
      v15 = [(MXSourcePathUtilProtocol *)sourcePathUtil filePathOfDiagnosticSourcePayloadForSourceID:v13 andBundleID:v10 andDate:v14];

      if (v15)
      {
        if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
          -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:].cold.4();
        }
        if (([(MXStorageUtilProtocol *)self->_storageUtil saveData:v6 withFilePath:v15] & 1) == 0)
        {
          v16 = self->_logHandle;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:](v16);
          }
        }

        goto LABEL_18;
      }
    }
    BOOL v18 = 0;
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
    -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:]();
  }
LABEL_18:
  BOOL v17 = self->_logHandle;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[MXSourceDataCacher saveToSourceDirectoryWithMetricSourcePayload:](v17, v4);
  }
  BOOL v18 = 1;
LABEL_25:

  return v18;
}

- (MXSourcePathUtilProtocol)sourcePathUtil
{
  return (MXSourcePathUtilProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSourcePathUtil:(id)a3
{
}

- (MXStorageUtilProtocol)storageUtil
{
  return (MXStorageUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStorageUtil:(id)a3
{
}

- (MXBundleUtilProtocol)bundleUtil
{
  return (MXBundleUtilProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleUtil:(id)a3
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
  objc_storeStrong((id *)&self->_bundleUtil, 0);
  objc_storeStrong((id *)&self->_storageUtil, 0);

  objc_storeStrong((id *)&self->_sourcePathUtil, 0);
}

- (void)saveToSourceDirectoryWithMetricSourcePayload:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 metrics];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_22BB49000, v5, v6, "Interested source data is now available : %@", v7, v8, v9, v10, v11);
}

- (void)saveToSourceDirectoryWithMetricSourcePayload:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22BB49000, v0, OS_LOG_TYPE_ERROR, "Error archiving data: %@", v1, 0xCu);
}

- (void)saveToSourceDirectoryWithMetricSourcePayload:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Log filename: %@", v2, v3, v4, v5, v6);
}

- (void)saveToSourceDirectoryWithMetricSourcePayload:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Writing data: %@", v2, v3, v4, v5, v6);
}

- (void)saveToSourceDirectoryWithDiagnosticSourcePayload:(void *)a1 .cold.3(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 bundleID];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22BB49000, v3, OS_LOG_TYPE_ERROR, "Could not resolve Main App bunldeID for extension: %@", v5, 0xCu);
}

@end