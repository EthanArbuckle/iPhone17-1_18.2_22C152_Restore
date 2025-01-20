@interface MXDeliveryDataCacher
- (BOOL)_writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6;
- (BOOL)_writeMetricReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6;
- (BOOL)saveDiagnostic:(id)a3 toDeliveryDirectoryForBundleID:(id)a4;
- (BOOL)saveMetrics:(id)a3 toDeliveryDirectoryForBundleID:(id)a4;
- (MXClientUtilProtocol)clientUtil;
- (MXDeliveryDataCacher)initWithClientUtil:(id)a3 andDeliveryPathUtil:(id)a4 andStorageUtil:(id)a5;
- (MXDeliveryPathUtilProtocol)deliveryPathUtil;
- (MXStorageUtilProtocol)storageUtil;
- (OS_os_log)logHandle;
- (id)_diagnosticsFromFilepaths:(id)a3;
- (id)_metricsFromFilepaths:(id)a3;
- (id)diagnosticsForClient:(id)a3;
- (id)metricsForClient:(id)a3;
- (void)notifyDataAvailableForDelivery;
- (void)setClientUtil:(id)a3;
- (void)setDeliveryPathUtil:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setStorageUtil:(id)a3;
@end

@implementation MXDeliveryDataCacher

- (id)metricsForClient:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXDeliveryDataCacher metricsForClient:]();
  }
  deliveryPathUtil = self->_deliveryPathUtil;
  uint64_t v9 = 0;
  v6 = [(MXDeliveryPathUtilProtocol *)deliveryPathUtil metricReportFilepathsFromClient:v4 withError:&v9];
  v7 = 0;
  if (!v9)
  {
    v7 = [(MXDeliveryDataCacher *)self _metricsFromFilepaths:v6];
    if (![v7 count])
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)diagnosticsForClient:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXDeliveryDataCacher diagnosticsForClient:]();
  }
  deliveryPathUtil = self->_deliveryPathUtil;
  uint64_t v9 = 0;
  v6 = [(MXDeliveryPathUtilProtocol *)deliveryPathUtil diagnosticReportFilepathsFromClient:v4 withError:&v9];
  v7 = 0;
  if (!v9)
  {
    v7 = [(MXDeliveryDataCacher *)self _diagnosticsFromFilepaths:v6];
    if (![v7 count])
    {

      v7 = 0;
    }
  }

  return v7;
}

- (MXDeliveryDataCacher)initWithClientUtil:(id)a3 andDeliveryPathUtil:(id)a4 andStorageUtil:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MXDeliveryDataCacher;
  v12 = [(MXDeliveryDataCacher *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientUtil, a3);
    objc_storeStrong((id *)&v13->_deliveryPathUtil, a4);
    objc_storeStrong((id *)&v13->_storageUtil, a5);
    os_log_t v14 = os_log_create("com.apple.metrickit", "delivery.cache.manager");
    logHandle = v13->_logHandle;
    v13->_logHandle = (OS_os_log *)v14;

    if (!v13->_logHandle) {
      objc_storeStrong((id *)&v13->_logHandle, &_os_log_internal);
    }
  }

  return v13;
}

- (BOOL)saveMetrics:(id)a3 toDeliveryDirectoryForBundleID:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MXDeliveryPathUtilProtocol *)self->_deliveryPathUtil applicationContainerPathForBundleID:v7];
  if (v8)
  {
    deliveryPathUtil = self->_deliveryPathUtil;
    id v31 = 0;
    char v10 = [(MXDeliveryPathUtilProtocol *)deliveryPathUtil createMetricDirectoryAtPath:v8 forClient:v7 withError:&v31];
    id v11 = v31;
    if (v10)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (!v13)
      {

        BOOL v23 = 1;
        goto LABEL_27;
      }
      uint64_t v14 = v13;
      id v25 = v6;
      int v15 = 0;
      uint64_t v16 = *(void *)v28;
      do
      {
        uint64_t v17 = 0;
        v18 = v11;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * v17);
          id v26 = v18;
          [(MXDeliveryDataCacher *)self _writeMetricReport:v19 atAppContainerPath:v8 forClient:v7 withError:&v26];
          id v11 = v26;

          if (v11)
          {
            logHandle = self->_logHandle;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v33 = v11;
              __int16 v34 = 2112;
              id v35 = v7;
              _os_log_error_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_ERROR, "Encountered error: %@ while writing payload for client: %@", buf, 0x16u);
            }
            ++v15;
          }
          ++v17;
          v18 = v11;
        }
        while (v14 != v17);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v14);

      if (v15 < 1)
      {
        BOOL v23 = 1;
        id v6 = v25;
        goto LABEL_27;
      }
      v21 = self->_logHandle;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[MXDeliveryDataCacher saveMetrics:toDeliveryDirectoryForBundleID:]((uint64_t)v8, v15, v21);
      }
      v22 = self->_logHandle;
      id v6 = v25;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[MXDeliveryDataCacher saveMetrics:toDeliveryDirectoryForBundleID:]((uint64_t)v11, (uint64_t)v7, v22);
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
    {
      -[MXDeliveryDataCacher saveMetrics:toDeliveryDirectoryForBundleID:].cold.4();
    }
    BOOL v23 = 0;
LABEL_27:

    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
    -[MXDeliveryDataCacher saveMetrics:toDeliveryDirectoryForBundleID:]();
  }
  [(MXClientUtilProtocol *)self->_clientUtil removeClientFromPersistenceForBundleID:v7];
  BOOL v23 = 0;
LABEL_28:

  return v23;
}

- (BOOL)saveDiagnostic:(id)a3 toDeliveryDirectoryForBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MXDeliveryPathUtilProtocol *)self->_deliveryPathUtil applicationContainerPathForBundleID:v7];
  deliveryPathUtil = self->_deliveryPathUtil;
  id v16 = 0;
  char v10 = [(MXDeliveryPathUtilProtocol *)deliveryPathUtil createDiagnosticDirectoryAtPath:v8 forClient:v7 withError:&v16];
  id v11 = v16;
  if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
    -[MXDeliveryDataCacher saveMetrics:toDeliveryDirectoryForBundleID:].cold.4();
  }
  id v15 = v11;
  BOOL v12 = [(MXDeliveryDataCacher *)self _writeDiagnosticReport:v6 atAppContainerPath:v8 forClient:v7 withError:&v15];
  id v13 = v15;

  if (!v12 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
    -[MXDeliveryDataCacher saveDiagnostic:toDeliveryDirectoryForBundleID:]();
  }

  return v12;
}

- (void)notifyDataAvailableForDelivery
{
}

- (BOOL)_writeMetricReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v13 = [(MXStorageUtilProtocol *)self->_storageUtil archivedDataWithObject:v10 error:a6];
    if (v13 && !*a6)
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG)) {
        -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:].cold.5(logHandle);
      }
      if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
        -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:].cold.4();
      }
      deliveryPathUtil = self->_deliveryPathUtil;
      v24 = [v10 timeStampEnd];
      id v25 = [(MXDeliveryPathUtilProtocol *)deliveryPathUtil filepathOfMetricForDeliveryFromAppContainerPath:v11 forClient:v12 atDate:v24];

      if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
        -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:]();
      }
      char v21 = [(MXStorageUtilProtocol *)self->_storageUtil saveData:v13 withFilePath:v25];
      if ((v21 & 1) == 0)
      {
        id v26 = self->_logHandle;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:](v26);
        }
      }
    }
    else
    {
      uint64_t v14 = self->_logHandle;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:]((uint64_t)a6, v14, v15, v16, v17, v18, v19, v20);
      }
      char v21 = 0;
    }
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

- (BOOL)_writeDiagnosticReport:(id)a3 atAppContainerPath:(id)a4 forClient:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v13 = [(MXStorageUtilProtocol *)self->_storageUtil archivedDataWithObject:v10 error:a6];
    if (v13 && !*a6)
    {
      deliveryPathUtil = self->_deliveryPathUtil;
      BOOL v23 = [v10 timeStampEnd];
      v24 = [(MXDeliveryPathUtilProtocol *)deliveryPathUtil filepathOfDiagnosticForDeliveryFromAppContainerPath:v11 forClient:v12 atDate:v23];

      if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
        -[MXDeliveryDataCacher _writeDiagnosticReport:atAppContainerPath:forClient:withError:]();
      }
      char v21 = [(MXStorageUtilProtocol *)self->_storageUtil saveData:v13 withFilePath:v24];
      if ((v21 & 1) == 0 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
        -[MXDeliveryDataCacher _writeDiagnosticReport:atAppContainerPath:forClient:withError:]();
      }
    }
    else
    {
      logHandle = self->_logHandle;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
        -[MXDeliveryDataCacher _writeMetricReport:atAppContainerPath:forClient:withError:]((uint64_t)a6, logHandle, v15, v16, v17, v18, v19, v20);
      }
      char v21 = 0;
    }
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

- (id)_metricsFromFilepaths:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = v10;
          _os_log_debug_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEBUG, "Metric report: %@", buf, 0xCu);
        }
        id v12 = [(MXStorageUtilProtocol *)self->_storageUtil dataFromPath:v10];
        storageUtil = self->_storageUtil;
        uint64_t v14 = objc_opt_class();
        id v25 = v7;
        uint64_t v15 = [(MXStorageUtilProtocol *)storageUtil unarchivedObjectOfClass:v14 fromData:v12 error:&v25];
        id v16 = v25;

        if (v15) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          [v22 addObject:v15];
        }
        else if (v16)
        {
          uint64_t v18 = self->_logHandle;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[MXDeliveryDataCacher _metricsFromFilepaths:](&v30, v18, v16, &v31);
          }
        }
        uint64_t v19 = self->_storageUtil;
        id v24 = v16;
        [(MXStorageUtilProtocol *)v19 removeFile:v10 error:&v24];
        id v7 = v24;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v6);
  }
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithArray:v22];

  return v20;
}

- (id)_diagnosticsFromFilepaths:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        logHandle = self->_logHandle;
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = v10;
          _os_log_debug_impl(&dword_22BB49000, logHandle, OS_LOG_TYPE_DEBUG, "Diagnostic report: %@", buf, 0xCu);
        }
        id v12 = [(MXStorageUtilProtocol *)self->_storageUtil dataFromPath:v10];
        storageUtil = self->_storageUtil;
        uint64_t v14 = objc_opt_class();
        id v25 = v7;
        uint64_t v15 = [(MXStorageUtilProtocol *)storageUtil unarchivedObjectOfClass:v14 fromData:v12 error:&v25];
        id v16 = v25;

        if (v15) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          [v22 addObject:v15];
        }
        else if (v16)
        {
          uint64_t v18 = self->_logHandle;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[MXDeliveryDataCacher _diagnosticsFromFilepaths:](&v30, v18, v16, &v31);
          }
        }
        uint64_t v19 = self->_storageUtil;
        id v24 = v16;
        [(MXStorageUtilProtocol *)v19 removeFile:v10 error:&v24];
        id v7 = v24;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v6);
  }
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithArray:v22];

  return v20;
}

- (MXClientUtilProtocol)clientUtil
{
  return (MXClientUtilProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClientUtil:(id)a3
{
}

- (MXDeliveryPathUtilProtocol)deliveryPathUtil
{
  return (MXDeliveryPathUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeliveryPathUtil:(id)a3
{
}

- (MXStorageUtilProtocol)storageUtil
{
  return (MXStorageUtilProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStorageUtil:(id)a3
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
  objc_storeStrong((id *)&self->_storageUtil, 0);
  objc_storeStrong((id *)&self->_deliveryPathUtil, 0);

  objc_storeStrong((id *)&self->_clientUtil, 0);
}

- (void)saveMetrics:toDeliveryDirectoryForBundleID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_22BB49000, v0, v1, "Client %@ container does not exist or is not installed.", v2, v3, v4, v5, v6);
}

- (void)saveMetrics:(NSObject *)a3 toDeliveryDirectoryForBundleID:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_0_0(&dword_22BB49000, a2, a3, "Failed to write metric report for %@ with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)saveMetrics:(os_log_t)log toDeliveryDirectoryForBundleID:.cold.3(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_22BB49000, log, OS_LOG_TYPE_DEBUG, "Error count: %d, log path: %@", (uint8_t *)v3, 0x12u);
}

- (void)saveMetrics:toDeliveryDirectoryForBundleID:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22BB49000, v0, v1, "Failed to create file directory for %@ with error: %@");
}

- (void)saveDiagnostic:toDeliveryDirectoryForBundleID:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22BB49000, v0, v1, "Failed to write diagnostic report for %@ with error: %@");
}

- (void)_writeMetricReport:(uint64_t)a3 atAppContainerPath:(uint64_t)a4 forClient:(uint64_t)a5 withError:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_writeMetricReport:(os_log_t)log atAppContainerPath:forClient:withError:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_22BB49000, log, OS_LOG_TYPE_ERROR, "Error writing file.", v1, 2u);
}

- (void)_writeMetricReport:atAppContainerPath:forClient:withError:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_22BB49000, v0, v1, "File to Write: %@", v2, v3, v4, v5, v6);
}

- (void)_writeMetricReport:atAppContainerPath:forClient:withError:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Data: %@", v2, v3, v4, v5, v6);
}

- (void)_writeMetricReport:(os_log_t)log atAppContainerPath:forClient:withError:.cold.5(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_22BB49000, log, OS_LOG_TYPE_DEBUG, "Writing data to file.", v1, 2u);
}

- (void)_writeDiagnosticReport:atAppContainerPath:forClient:withError:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22BB49000, v0, v1, "Error writing data of diagnostic payload: %@ to path: %@ for delivery.");
}

- (void)_writeDiagnosticReport:atAppContainerPath:forClient:withError:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_22BB49000, v0, OS_LOG_TYPE_DEBUG, "Writing data of diagnostic payload: %@ to path: %@ for delivery.", v1, 0x16u);
}

- (void)metricsForClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Delivering metrics for client: %@", v2, v3, v4, v5, v6);
}

- (void)_metricsFromFilepaths:(void *)a3 .cold.1(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 description];
  *a1 = 138543362;
  *a4 = v8;
  OUTLINED_FUNCTION_5_0(&dword_22BB49000, v9, v10, "Error while processing metric data on disk: %{public}@");
}

- (void)diagnosticsForClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Delivering diagnostics for client: %@", v2, v3, v4, v5, v6);
}

- (void)_diagnosticsFromFilepaths:(void *)a3 .cold.1(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 description];
  *a1 = 138543362;
  *a4 = v8;
  OUTLINED_FUNCTION_5_0(&dword_22BB49000, v9, v10, "Error while processing diagnostic data on disk: %{public}@");
}

@end