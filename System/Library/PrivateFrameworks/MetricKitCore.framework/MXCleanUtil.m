@interface MXCleanUtil
- (BOOL)_isDiagnosticDeliveryStaleForDirectory:(id)a3;
- (BOOL)_isDiagnosticSourceFilename:(id)a3;
- (BOOL)_isMetricDeliveryStaleForDirectory:(id)a3;
- (BOOL)_isMetricSourceFilename:(id)a3;
- (BOOL)_isStaleDiagnosticSourceForFilename:(id)a3;
- (BOOL)_isStaleForDate:(id)a3;
- (BOOL)_isStaleMetricSourceForFilename:(id)a3;
- (BOOL)_isStaleSourceForFilename:(id)a3;
- (MXCleanUtil)initWithClientUtil:(id)a3 andDeliveryPathUtil:(id)a4;
- (MXClientUtilProtocol)clientUtil;
- (MXDeliveryPathUtilProtocol)deliveryPathUtil;
- (OS_os_log)logHandle;
- (id)_clientfulSourceDirectories;
- (id)_clientlessSourceDirectory;
- (id)_dateFromDateString:(id)a3;
- (id)_dateFromDiagnosticFilename:(id)a3;
- (id)_dateFromMetricFilename:(id)a3;
- (id)_dateStringFromDiagnosticSourceFilename:(id)a3;
- (id)_dateStringFromMetricSourceFilename:(id)a3;
- (id)_dateStringFromUnprefixedFilename:(id)a3;
- (id)_datesFromDiagnosticFilenames:(id)a3;
- (id)_datesFromMetricFilenames:(id)a3;
- (id)_diagnosticDeliveryDirectories;
- (id)_diagnosticDeliveryDirectoryForClient:(id)a3;
- (id)_diagnosticDeliveryParentDirectory;
- (id)_filenamesFromDirectory:(id)a3;
- (id)_lastFileDateFromDiagnosticFilenames:(id)a3;
- (id)_lastFileDateFromMetricFilenames:(id)a3;
- (id)_latestDateFromDates:(id)a3;
- (id)_metricDeliveryDirectories;
- (id)_metricDeliveryDirectoryForClient:(id)a3;
- (id)_metricDeliveryParentDirectory;
- (id)_sourceDirectoryForSource:(id)a3 andClient:(id)a4;
- (id)_subdirectoriesFromDirectory:(id)a3;
- (void)_cleanClientfulSourceDirectoriesForStaleData;
- (void)_cleanClientlessSourceDirectoryForStaleData;
- (void)_cleanDeliveryDirectoriesForClient:(id)a3;
- (void)_cleanDeliveryDirectoriesForStaleData;
- (void)_cleanDiagnosticDeliveryDirectoriesForStaleData;
- (void)_cleanDiagnosticDeliveryDirectoryForStaleDataForDirectory:(id)a3;
- (void)_cleanDirectoriesForStaleData;
- (void)_cleanDirectoriesForUninstalledClient:(id)a3;
- (void)_cleanDirectoriesForUninstalledClients;
- (void)_cleanDirectory:(id)a3;
- (void)_cleanFileFromFilePath:(id)a3;
- (void)_cleanMetricDeliveryDirectoriesForStaleData;
- (void)_cleanMetricDeliveryDirectoryForStaleDataForDirectory:(id)a3;
- (void)_cleanSourceDirectoriesForClient:(id)a3;
- (void)_cleanSourceDirectoriesForStaleData;
- (void)_cleanSourceDirectoryForSource:(id)a3 andClient:(id)a4;
- (void)_cleanStaleDataForSourceDirectory:(id)a3;
- (void)_clientfulSourceDirectories;
- (void)_clientlessSourceDirectory;
- (void)_diagnosticDeliveryDirectories;
- (void)_diagnosticDeliveryParentDirectory;
- (void)_metricDeliveryDirectories;
- (void)_metricDeliveryParentDirectory;
- (void)cleanStaleData;
- (void)setClientUtil:(id)a3;
- (void)setDeliveryPathUtil:(id)a3;
- (void)setLogHandle:(id)a3;
@end

@implementation MXCleanUtil

- (MXCleanUtil)initWithClientUtil:(id)a3 andDeliveryPathUtil:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MXCleanUtil;
  v9 = [(MXCleanUtil *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientUtil, a3);
    objc_storeStrong((id *)&v10->_deliveryPathUtil, a4);
    os_log_t v11 = os_log_create("com.apple.metrickit", "cache.clean.utility");
    logHandle = v10->_logHandle;
    v10->_logHandle = (OS_os_log *)v11;

    if (!v10->_logHandle) {
      objc_storeStrong((id *)&v10->_logHandle, &_os_log_internal);
    }
  }

  return v10;
}

- (void)cleanStaleData
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Start guard clean", v2, v3, v4, v5, v6);
}

- (void)_cleanDirectoriesForUninstalledClients
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Start clean directories for uninstalled clients", v2, v3, v4, v5, v6);
}

- (void)_cleanDirectoriesForUninstalledClient:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x263F55748] isAppInstalledForBundleID:v4] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
      -[MXCleanUtil _cleanDirectoriesForUninstalledClient:]();
    }
    [(MXCleanUtil *)self _cleanDeliveryDirectoriesForClient:v4];
    [(MXCleanUtil *)self _cleanSourceDirectoriesForClient:v4];
  }
}

- (void)_cleanDeliveryDirectoriesForClient:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _cleanDeliveryDirectoriesForClient:]();
  }
  uint64_t v5 = [(MXCleanUtil *)self _metricDeliveryDirectoryForClient:v4];
  [(MXCleanUtil *)self _cleanDirectory:v5];
  uint8_t v6 = [(MXCleanUtil *)self _diagnosticDeliveryDirectoryForClient:v4];
  [(MXCleanUtil *)self _cleanDirectory:v6];
}

- (id)_metricDeliveryDirectoryForClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MXCleanUtil *)self _metricDeliveryParentDirectory];
  uint8_t v6 = [v5 stringByAppendingPathComponent:v4];

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _metricDeliveryDirectoryForClient:]();
  }

  return v6;
}

- (id)_metricDeliveryParentDirectory
{
  uint64_t v3 = [(MXDeliveryPathUtilProtocol *)self->_deliveryPathUtil applicationContainerPath];
  id v4 = [v3 stringByAppendingPathComponent:@"Reports"];

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _metricDeliveryParentDirectory]();
  }

  return v4;
}

- (id)_diagnosticDeliveryDirectoryForClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MXCleanUtil *)self _diagnosticDeliveryParentDirectory];
  uint8_t v6 = [v5 stringByAppendingPathComponent:v4];

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _diagnosticDeliveryDirectoryForClient:]();
  }

  return v6;
}

- (id)_diagnosticDeliveryParentDirectory
{
  uint64_t v3 = [(MXDeliveryPathUtilProtocol *)self->_deliveryPathUtil applicationContainerPath];
  id v4 = [v3 stringByAppendingPathComponent:@"Diagnostics"];

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _diagnosticDeliveryParentDirectory]();
  }

  return v4;
}

- (void)_cleanSourceDirectoriesForClient:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _cleanSourceDirectoriesForClient:]();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v5 = [&unk_26DF1F608 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(&unk_26DF1F608);
        }
        [(MXCleanUtil *)self _cleanSourceDirectoryForSource:*(void *)(*((void *)&v9 + 1) + 8 * v8++) andClient:v4];
      }
      while (v6 != v8);
      uint64_t v6 = [&unk_26DF1F608 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_cleanSourceDirectoryForSource:(id)a3 andClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _cleanSourceDirectoryForSource:andClient:]();
  }
  uint64_t v8 = [(MXCleanUtil *)self _sourceDirectoryForSource:v6 andClient:v7];
  [(MXCleanUtil *)self _cleanDirectory:v8];
}

- (void)_cleanDirectory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  id v7 = 0;
  [v5 removeItemAtPath:v4 error:&v7];
  id v6 = v7;
  if (v6 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
    -[MXCleanUtil _cleanDirectory:]();
  }
}

- (id)_sourceDirectoryForSource:(id)a3 andClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F55748] containerPath];
  long long v9 = [v8 stringByAppendingPathComponent:v6];
  long long v10 = [v9 stringByAppendingPathComponent:v7];

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _sourceDirectoryForSource:andClient:]();
  }

  return v10;
}

- (void)_cleanDirectoriesForStaleData
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Start cleaning directories for stale data", v2, v3, v4, v5, v6);
}

- (void)_cleanDeliveryDirectoriesForStaleData
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Start cleaning delivery directories for stale data", v2, v3, v4, v5, v6);
}

- (void)_cleanMetricDeliveryDirectoriesForStaleData
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Start cleaning delivery directories for stale metrics data", v2, v3, v4, v5, v6);
}

- (id)_metricDeliveryDirectories
{
  uint64_t v3 = [(MXCleanUtil *)self _metricDeliveryParentDirectory];
  uint64_t v4 = [(MXCleanUtil *)self _subdirectoriesFromDirectory:v3];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _metricDeliveryDirectories]();
  }

  return v4;
}

- (id)_subdirectoriesFromDirectory:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  id v22 = 0;
  uint8_t v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v22];
  id v7 = v22;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
      -[MXCleanUtil _subdirectoriesFromDirectory:]();
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          char v17 = 0;
          if ([v5 fileExistsAtPath:v14 isDirectory:&v17]) {
            BOOL v15 = v17 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }
  }

  return v8;
}

- (void)_cleanMetricDeliveryDirectoryForStaleDataForDirectory:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _cleanMetricDeliveryDirectoryForStaleDataForDirectory:]();
  }
  if ([(MXCleanUtil *)self _isMetricDeliveryStaleForDirectory:v4]) {
    [(MXCleanUtil *)self _cleanDirectory:v4];
  }
}

- (BOOL)_isMetricDeliveryStaleForDirectory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MXCleanUtil *)self _filenamesFromDirectory:v4];
  uint8_t v6 = [(MXCleanUtil *)self _lastFileDateFromMetricFilenames:v5];
  BOOL v7 = [(MXCleanUtil *)self _isStaleForDate:v6];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _isMetricDeliveryStaleForDirectory:]();
  }

  return v7;
}

- (id)_filenamesFromDirectory:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  id v25 = 0;
  uint8_t v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v25];
  id v7 = v25;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
      -[MXCleanUtil _filenamesFromDirectory:]();
    }
    uint64_t v8 = 0;
  }
  else
  {
    long long v19 = self;
    uint64_t v8 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v18 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          BOOL v15 = [v4 stringByAppendingPathComponent:v14];
          char v20 = 0;
          if ([v5 fileExistsAtPath:v15 isDirectory:&v20]) {
            BOOL v16 = v20 == 0;
          }
          else {
            BOOL v16 = 0;
          }
          if (v16) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
    }

    if (os_log_type_enabled((os_log_t)v19->_logHandle, OS_LOG_TYPE_DEBUG)) {
      -[MXCleanUtil _filenamesFromDirectory:]();
    }
    uint8_t v6 = v18;
  }

  return v8;
}

- (id)_lastFileDateFromMetricFilenames:(id)a3
{
  id v4 = [(MXCleanUtil *)self _datesFromMetricFilenames:a3];
  uint64_t v5 = [(MXCleanUtil *)self _latestDateFromDates:v4];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _lastFileDateFromMetricFilenames:]();
  }

  return v5;
}

- (id)_datesFromMetricFilenames:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[MXCleanUtil _dateFromMetricFilename:](self, "_dateFromMetricFilename:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _datesFromMetricFilenames:]();
  }

  return v5;
}

- (void)_cleanDiagnosticDeliveryDirectoriesForStaleData
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Start cleaning delivery directories for stale diagnostics data", v2, v3, v4, v5, v6);
}

- (id)_diagnosticDeliveryDirectories
{
  uint64_t v3 = [(MXCleanUtil *)self _diagnosticDeliveryParentDirectory];
  uint64_t v4 = [(MXCleanUtil *)self _subdirectoriesFromDirectory:v3];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _diagnosticDeliveryDirectories]();
  }

  return v4;
}

- (void)_cleanDiagnosticDeliveryDirectoryForStaleDataForDirectory:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _cleanDiagnosticDeliveryDirectoryForStaleDataForDirectory:]();
  }
  if ([(MXCleanUtil *)self _isDiagnosticDeliveryStaleForDirectory:v4]) {
    [(MXCleanUtil *)self _cleanDirectory:v4];
  }
}

- (BOOL)_isDiagnosticDeliveryStaleForDirectory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MXCleanUtil *)self _filenamesFromDirectory:v4];
  uint8_t v6 = [(MXCleanUtil *)self _lastFileDateFromDiagnosticFilenames:v5];
  BOOL v7 = [(MXCleanUtil *)self _isStaleForDate:v6];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _isDiagnosticDeliveryStaleForDirectory:]();
  }

  return v7;
}

- (id)_lastFileDateFromDiagnosticFilenames:(id)a3
{
  id v4 = [(MXCleanUtil *)self _datesFromDiagnosticFilenames:a3];
  uint64_t v5 = [(MXCleanUtil *)self _latestDateFromDates:v4];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _lastFileDateFromDiagnosticFilenames:]();
  }

  return v5;
}

- (id)_datesFromDiagnosticFilenames:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[MXCleanUtil _dateFromDiagnosticFilename:](self, "_dateFromDiagnosticFilename:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _datesFromDiagnosticFilenames:]();
  }

  return v5;
}

- (id)_dateFromDiagnosticFilename:(id)a3
{
  id v4 = [a3 stringByReplacingOccurrencesOfString:@"diagnostic_report_" withString:&stru_26DF1BAE0];
  uint64_t v5 = [(MXCleanUtil *)self _dateStringFromUnprefixedFilename:v4];
  id v6 = [(MXCleanUtil *)self _dateFromDateString:v5];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _dateFromDiagnosticFilename:]();
  }

  return v6;
}

- (id)_dateFromMetricFilename:(id)a3
{
  id v4 = [a3 stringByReplacingOccurrencesOfString:@"report_" withString:&stru_26DF1BAE0];
  uint64_t v5 = [(MXCleanUtil *)self _dateStringFromUnprefixedFilename:v4];
  id v6 = [(MXCleanUtil *)self _dateFromDateString:v5];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _dateFromMetricFilename:]();
  }

  return v6;
}

- (id)_dateFromDateString:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F08790];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v6 setLocale:v7];
  [v6 setDateFormat:@"yyyy-MM-dd"];
  uint64_t v8 = [v6 dateFromString:v5];

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _dateFromDateString:]();
  }

  return v8;
}

- (id)_latestDateFromDates:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!v7) {
          id v7 = v10;
        }
        uint64_t v11 = v7;
        id v7 = [v10 laterDate:v7];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _latestDateFromDates:]();
  }

  return v7;
}

- (BOOL)_isStaleForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF910] now];
  uint64_t v6 = [v4 dateByAddingTimeInterval:1209600.0];
  id v7 = [v5 laterDate:v6];
  char v8 = [v7 isEqualToDate:v5];

  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG)) {
    [(MXCleanUtil *)v8 _isStaleForDate:logHandle];
  }

  return v8;
}

- (void)_cleanSourceDirectoriesForStaleData
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Start clean Source Directories for stale data", v2, v3, v4, v5, v6);
}

- (void)_cleanClientlessSourceDirectoryForStaleData
{
  id v3 = [(MXCleanUtil *)self _clientlessSourceDirectory];
  [(MXCleanUtil *)self _cleanStaleDataForSourceDirectory:v3];
}

- (void)_cleanStaleDataForSourceDirectory:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _cleanStaleDataForSourceDirectory:]();
  }
  uint64_t v5 = [(MXCleanUtil *)self _filenamesFromDirectory:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([(MXCleanUtil *)self _isStaleSourceForFilename:v10])
        {
          uint64_t v11 = [v4 stringByAppendingPathComponent:v10];
          [(MXCleanUtil *)self _cleanFileFromFilePath:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (BOOL)_isStaleSourceForFilename:(id)a3
{
  id v4 = a3;
  if ([(MXCleanUtil *)self _isMetricSourceFilename:v4]) {
    BOOL v5 = [(MXCleanUtil *)self _isStaleMetricSourceForFilename:v4];
  }
  else {
    BOOL v5 = 0;
  }
  BOOL v6 = [(MXCleanUtil *)self _isDiagnosticSourceFilename:v4];
  if (v6) {
    LOBYTE(v6) = [(MXCleanUtil *)self _isStaleDiagnosticSourceForFilename:v4];
  }
  BOOL v7 = v5 || v6;
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _isStaleSourceForFilename:]();
  }

  return v7;
}

- (BOOL)_isMetricSourceFilename:(id)a3
{
  char v4 = [a3 containsString:@"log-"];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _isMetricSourceFilename:]();
  }
  return v4;
}

- (BOOL)_isStaleMetricSourceForFilename:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MXCleanUtil *)self _dateStringFromMetricSourceFilename:v4];
  BOOL v6 = [(MXCleanUtil *)self _dateFromDateString:v5];
  BOOL v7 = [(MXCleanUtil *)self _isStaleForDate:v6];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _isStaleMetricSourceForFilename:]();
  }

  return v7;
}

- (id)_dateStringFromMetricSourceFilename:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 stringByReplacingOccurrencesOfString:@"log-" withString:&stru_26DF1BAE0];
  BOOL v6 = [(MXCleanUtil *)self _dateStringFromUnprefixedFilename:v5];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _dateStringFromMetricSourceFilename:]();
  }

  return v6;
}

- (id)_dateStringFromUnprefixedFilename:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 substringToIndex:objc_msgSend(@"yyyy-MM-dd", "length")];

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _dateStringFromUnprefixedFilename:]();
  }

  return v5;
}

- (BOOL)_isDiagnosticSourceFilename:(id)a3
{
  char v4 = [a3 containsString:@"diag-log-"];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _isDiagnosticSourceFilename:]();
  }
  return v4;
}

- (BOOL)_isStaleDiagnosticSourceForFilename:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MXCleanUtil *)self _dateStringFromDiagnosticSourceFilename:v4];
  BOOL v6 = [(MXCleanUtil *)self _dateFromDateString:v5];
  BOOL v7 = [(MXCleanUtil *)self _isStaleForDate:v6];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _isStaleDiagnosticSourceForFilename:]();
  }

  return v7;
}

- (id)_dateStringFromDiagnosticSourceFilename:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 stringByReplacingOccurrencesOfString:@"diag-log-" withString:&stru_26DF1BAE0];
  BOOL v6 = [(MXCleanUtil *)self _dateStringFromUnprefixedFilename:v5];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _dateStringFromDiagnosticSourceFilename:]();
  }

  return v6;
}

- (id)_clientlessSourceDirectory
{
  id v3 = [MEMORY[0x263F55748] containerPath];
  id v4 = [&unk_26DF1F620 objectAtIndexedSubscript:2];
  BOOL v5 = [v3 stringByAppendingPathComponent:v4];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _clientlessSourceDirectory]();
  }

  return v5;
}

- (void)_cleanClientfulSourceDirectoriesForStaleData
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(MXCleanUtil *)self _clientfulSourceDirectories];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(MXCleanUtil *)self _cleanStaleDataForSourceDirectory:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_clientfulSourceDirectories
{
  v22[3] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F55748] containerPath];
  uint64_t v4 = [&unk_26DF1F638 objectAtIndexedSubscript:4];
  v22[0] = v4;
  uint64_t v5 = [&unk_26DF1F650 objectAtIndexedSubscript:3];
  v22[1] = v5;
  uint64_t v6 = [&unk_26DF1F668 objectAtIndexedSubscript:5];
  v22[2] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];

  long long v8 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(v3, "stringByAppendingPathComponent:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        long long v15 = [(MXCleanUtil *)self _subdirectoriesFromDirectory:v14];
        [v8 addObjectsFromArray:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _clientfulSourceDirectories]();
  }

  return v8;
}

- (void)_cleanFileFromFilePath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXCleanUtil _cleanFileFromFilePath:]();
  }
  id v7 = 0;
  [v5 removeItemAtPath:v4 error:&v7];
  id v6 = v7;
  if (v6 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
    -[MXCleanUtil _cleanFileFromFilePath:]();
  }
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
  objc_storeStrong((id *)&self->_deliveryPathUtil, 0);

  objc_storeStrong((id *)&self->_clientUtil, 0);
}

- (void)_cleanDirectoriesForUninstalledClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Client: %@ is not installed", v2, v3, v4, v5, v6);
}

- (void)_cleanDeliveryDirectoriesForClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Start clean delivery directory for client: %@", v2, v3, v4, v5, v6);
}

- (void)_metricDeliveryDirectoryForClient:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_22BB49000, v0, v1, "Metric Delivery directory: %@ for client %@");
}

- (void)_metricDeliveryParentDirectory
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Metric Delivery directory: %@", v2, v3, v4, v5, v6);
}

- (void)_diagnosticDeliveryDirectoryForClient:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_22BB49000, v0, v1, "Diagnostic Delivery directory: %@ for client %@");
}

- (void)_diagnosticDeliveryParentDirectory
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Diagnostics Delivery directory: %@", v2, v3, v4, v5, v6);
}

- (void)_cleanSourceDirectoriesForClient:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Start clean Source directories for client: %@", v2, v3, v4, v5, v6);
}

- (void)_cleanSourceDirectoryForSource:andClient:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_22BB49000, v0, v1, "Start clean Source:%@ directory for client: %@");
}

- (void)_cleanDirectory:.cold.1()
{
  OUTLINED_FUNCTION_13();
  id v2 = v1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_22BB49000, v4, v5, "Error removing directory: %@ with error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_sourceDirectoryForSource:andClient:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_22BB49000, v0, v1, "Source: %@ directory for client: %@");
}

- (void)_metricDeliveryDirectories
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Metric delivery directories: %@", v2, v3, v4, v5, v6);
}

- (void)_subdirectoriesFromDirectory:.cold.1()
{
  OUTLINED_FUNCTION_13();
  id v2 = v1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_22BB49000, v4, v5, "Error searching contents of directory: %@ with error %{public}@", v6, v7, v8, v9, v10);
}

- (void)_cleanMetricDeliveryDirectoryForStaleDataForDirectory:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Start clean Metric delivery for stale data for directory: %@", v2, v3, v4, v5, v6);
}

- (void)_isMetricDeliveryStaleForDirectory:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_22BB49000, v0, v1, "Metric delivery directory: %@ stale state: %d");
}

- (void)_filenamesFromDirectory:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_22BB49000, v0, v1, "filenames: %@ from delivery directory: %@");
}

- (void)_filenamesFromDirectory:.cold.2()
{
  OUTLINED_FUNCTION_13();
  id v2 = v1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_22BB49000, v4, v5, "Error searching contents of directory: %@ with error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_lastFileDateFromMetricFilenames:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "last file date: %@ from metric filenames", v2, v3, v4, v5, v6);
}

- (void)_datesFromMetricFilenames:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "dates: %@ from metric filenames", v2, v3, v4, v5, v6);
}

- (void)_diagnosticDeliveryDirectories
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Diagnostic delivery directories: %@", v2, v3, v4, v5, v6);
}

- (void)_cleanDiagnosticDeliveryDirectoryForStaleDataForDirectory:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Start clean Diagnostic delivery for stale data for directory: %@", v2, v3, v4, v5, v6);
}

- (void)_isDiagnosticDeliveryStaleForDirectory:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_22BB49000, v0, v1, "Diagnostic delivery directory: %@ stale state: %d");
}

- (void)_lastFileDateFromDiagnosticFilenames:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "last file date: %@ from diagnostic filenames", v2, v3, v4, v5, v6);
}

- (void)_datesFromDiagnosticFilenames:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "diagnostic filenames dates: %@", v2, v3, v4, v5, v6);
}

- (void)_dateFromDiagnosticFilename:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "diagnostic filename date: %@", v2, v3, v4, v5, v6);
}

- (void)_dateFromMetricFilename:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "metric filename date: %@", v2, v3, v4, v5, v6);
}

- (void)_dateFromDateString:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Convert string to date: %@", v2, v3, v4, v5, v6);
}

- (void)_latestDateFromDates:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_22BB49000, v0, v1, "latest date %@ from dates: %@");
}

- (void)_isStaleForDate:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3[0] = 67109634;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  __int16 v6 = 1024;
  int v7 = 2;
  _os_log_debug_impl(&dword_22BB49000, log, OS_LOG_TYPE_DEBUG, "Stale state: %d for date: %@ for %d weeks", (uint8_t *)v3, 0x18u);
}

- (void)_cleanStaleDataForSourceDirectory:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Start clean stale data for source directory: %@", v2, v3, v4, v5, v6);
}

- (void)_isStaleSourceForFilename:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_22BB49000, v0, v1, "Source filename stale state: %d", v2, v3, v4, v5, v6);
}

- (void)_isMetricSourceFilename:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_22BB49000, v0, v1, "is source filename for metric? state: %d", v2, v3, v4, v5, v6);
}

- (void)_isStaleMetricSourceForFilename:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_22BB49000, v0, v1, "Metric Source filename: %@ stale state: %d");
}

- (void)_dateStringFromMetricSourceFilename:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_22BB49000, v0, v1, "Metric Source filename: %@ date string: %@");
}

- (void)_dateStringFromUnprefixedFilename:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "date string: %@", v2, v3, v4, v5, v6);
}

- (void)_isDiagnosticSourceFilename:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_22BB49000, v0, v1, "is source filename for diagnostic? state: %d", v2, v3, v4, v5, v6);
}

- (void)_isStaleDiagnosticSourceForFilename:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_22BB49000, v0, v1, "Diagnostic Source filename: %@ stale state: %d");
}

- (void)_dateStringFromDiagnosticSourceFilename:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_22BB49000, v0, v1, "Diagnostic Source filename: %@ date string: %@");
}

- (void)_clientlessSourceDirectory
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Source Directory: %@", v2, v3, v4, v5, v6);
}

- (void)_clientfulSourceDirectories
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Source Directories: %@", v2, v3, v4, v5, v6);
}

- (void)_cleanFileFromFilePath:.cold.1()
{
  OUTLINED_FUNCTION_13();
  id v2 = v1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_22BB49000, v4, v5, "Error clean file from path: %@ with error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_cleanFileFromFilePath:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Remove item at path: %@", v2, v3, v4, v5, v6);
}

@end