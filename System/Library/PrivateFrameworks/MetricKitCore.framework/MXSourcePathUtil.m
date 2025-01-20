@interface MXSourcePathUtil
- (MXDateUtil)dateUtil;
- (MXSourcePathUtil)initWithDateUtil:(id)a3 andStorageUtil:(id)a4;
- (MXStorageUtilProtocol)storageUtil;
- (OS_os_log)logHandle;
- (id)_filePathOfDiagnosticSourcePayloadForDate:(id)a3 andSourceDirectory:(id)a4;
- (id)_filePathOfMetricSourcePayloadForDate:(id)a3 andSourceDirectory:(id)a4;
- (id)_setupSourceDirectoryForSourceID:(int64_t)a3 andBundleID:(id)a4;
- (id)_sourceDirectoryForSource:(int64_t)a3 andBundleID:(id)a4;
- (id)filePathOfDiagnosticSourcePayloadForSourceID:(int64_t)a3 andBundleID:(id)a4 andDate:(id)a5;
- (id)filePathOfMetricSourcePayloadForSourceID:(int64_t)a3 andBundleID:(id)a4 andDate:(id)a5;
- (void)_removeFilesForSourceID:(int64_t)a3;
- (void)_removeFilesForSourceID:(int64_t)a3 andClient:(id)a4;
- (void)cleanDataDirectoryForSource:(int64_t)a3;
- (void)cleanDiagnosticsDirectoryForSource:(int64_t)a3 andClient:(id)a4;
- (void)removeDeliveredDiagnosticsForSourceID:(int64_t)a3 forDate:(id)a4;
- (void)setDateUtil:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setStorageUtil:(id)a3;
@end

@implementation MXSourcePathUtil

- (MXSourcePathUtil)initWithDateUtil:(id)a3 andStorageUtil:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MXSourcePathUtil;
  v9 = [(MXSourcePathUtil *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateUtil, a3);
    objc_storeStrong((id *)&v10->_storageUtil, a4);
    os_log_t v11 = os_log_create("com.apple.metrickit", "source.filepath.utility");
    logHandle = v10->_logHandle;
    v10->_logHandle = (OS_os_log *)v11;

    if (!v10->_logHandle) {
      objc_storeStrong((id *)&v10->_logHandle, &_os_log_internal);
    }
  }

  return v10;
}

- (id)filePathOfMetricSourcePayloadForSourceID:(int64_t)a3 andBundleID:(id)a4 andDate:(id)a5
{
  id v8 = a5;
  v9 = [(MXSourcePathUtil *)self _setupSourceDirectoryForSourceID:a3 andBundleID:a4];
  if (v9)
  {
    v10 = [(MXSourcePathUtil *)self _filePathOfMetricSourcePayloadForDate:v8 andSourceDirectory:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)filePathOfDiagnosticSourcePayloadForSourceID:(int64_t)a3 andBundleID:(id)a4 andDate:(id)a5
{
  id v8 = a5;
  v9 = [(MXSourcePathUtil *)self _setupSourceDirectoryForSourceID:a3 andBundleID:a4];
  if (v9)
  {
    v10 = [(MXSourcePathUtil *)self _filePathOfDiagnosticSourcePayloadForDate:v8 andSourceDirectory:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)cleanDataDirectoryForSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) <= 3) {
    -[MXSourcePathUtil _removeFilesForSourceID:](self, "_removeFilesForSourceID:");
  }
}

- (void)cleanDiagnosticsDirectoryForSource:(int64_t)a3 andClient:(id)a4
{
  if ((unint64_t)(a3 - 3) <= 2) {
    -[MXSourcePathUtil _removeFilesForSourceID:andClient:](self, "_removeFilesForSourceID:andClient:");
  }
}

- (void)removeDeliveredDiagnosticsForSourceID:(int64_t)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = [&unk_26DF1F6B0 objectAtIndexedSubscript:a3];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:]();
  }
  id v8 = [MEMORY[0x263F55748] containerPath];
  v9 = [v8 stringByAppendingPathComponent:v7];
  storageUtil = self->_storageUtil;
  id v18 = 0;
  os_log_t v11 = [(MXStorageUtilProtocol *)storageUtil filesFromDirectory:v9 error:&v18];
  id v12 = v18;
  logHandle = self->_logHandle;
  if (v12)
  {
    id v14 = v12;
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:]();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:](logHandle, v11);
    }
    v15 = [(MXDateUtil *)self->_dateUtil stringFromDate:v6];
    v16 = self->_storageUtil;
    id v17 = 0;
    [(MXStorageUtilProtocol *)v16 removeFiles:v11 withFilenameContainsSubstring:v15 fromDirectory:v9 error:&v17];
    id v14 = v17;
  }
}

- (id)_filePathOfMetricSourcePayloadForDate:(id)a3 andSourceDirectory:(id)a4
{
  dateUtil = self->_dateUtil;
  id v6 = a4;
  id v7 = [(MXDateUtil *)dateUtil stringFromDate:a3];
  id v8 = [NSString stringWithFormat:@"log-%@", v7];
  v9 = [v6 stringByAppendingPathComponent:v8];

  return v9;
}

- (id)_filePathOfDiagnosticSourcePayloadForDate:(id)a3 andSourceDirectory:(id)a4
{
  dateUtil = self->_dateUtil;
  id v6 = a4;
  id v7 = [(MXDateUtil *)dateUtil stringFromDate:a3];
  id v8 = NSString;
  v9 = [MEMORY[0x263F08C38] UUID];
  v10 = [v9 UUIDString];
  os_log_t v11 = [v8 stringWithFormat:@"diag-log-%@-%@", v7, v10];
  id v12 = [v6 stringByAppendingPathComponent:v11];

  return v12;
}

- (id)_setupSourceDirectoryForSourceID:(int64_t)a3 andBundleID:(id)a4
{
  id v6 = [(MXSourcePathUtil *)self _sourceDirectoryForSource:a3 andBundleID:a4];
  if ([(MXStorageUtilProtocol *)self->_storageUtil isDataExistAsDirectoryForPath:v6])
  {
    if (a3 == 2)
    {
      if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
        -[MXSourcePathUtil _setupSourceDirectoryForSourceID:andBundleID:]();
      }
      if (([(MXStorageUtilProtocol *)self->_storageUtil removeExistingFilesFromDirectory:v6] & 1) == 0)
      {
        id v7 = 0;
        goto LABEL_11;
      }
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXSourcePathUtil _setupSourceDirectoryForSourceID:andBundleID:]();
  }
  storageUtil = self->_storageUtil;
  uint64_t v10 = 0;
  id v7 = 0;
  if ([(MXStorageUtilProtocol *)storageUtil createDirectory:v6 error:&v10]) {
LABEL_10:
  }
    id v7 = v6;
LABEL_11:

  return v7;
}

- (id)_sourceDirectoryForSource:(int64_t)a3 andBundleID:(id)a4
{
  id v5 = a4;
  id v6 = [&unk_26DF1F6C8 objectAtIndexedSubscript:a3];
  id v7 = [MEMORY[0x263F55748] containerPath];
  id v8 = v7;
  if (a3 == 2)
  {
    v9 = [v7 stringByAppendingPathComponent:v6];
  }
  else if ((unint64_t)(a3 - 3) > 2)
  {
    v9 = 0;
  }
  else
  {
    uint64_t v10 = [v7 stringByAppendingPathComponent:v6];
    v9 = [v10 stringByAppendingPathComponent:v5];
  }

  return v9;
}

- (void)_removeFilesForSourceID:(int64_t)a3
{
  v4 = [&unk_26DF1F6E0 objectAtIndexedSubscript:a3];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:]();
  }
  id v5 = [MEMORY[0x263F55748] containerPath];
  id v6 = [v5 stringByAppendingPathComponent:v4];
  storageUtil = self->_storageUtil;
  id v14 = 0;
  id v8 = [(MXStorageUtilProtocol *)storageUtil filesFromDirectory:v6 error:&v14];
  id v9 = v14;
  logHandle = self->_logHandle;
  if (v9)
  {
    id v11 = v9;
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:]();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:](logHandle, v8);
    }
    id v12 = self->_storageUtil;
    id v13 = 0;
    [(MXStorageUtilProtocol *)v12 removeFiles:v8 fromDirectory:v6 error:&v13];
    id v11 = v13;
  }
}

- (void)_removeFilesForSourceID:(int64_t)a3 andClient:(id)a4
{
  id v6 = a4;
  id v7 = [&unk_26DF1F6F8 objectAtIndexedSubscript:a3];
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:]();
  }
  id v8 = [MEMORY[0x263F55748] containerPath];
  id v9 = [v8 stringByAppendingPathComponent:v7];
  uint64_t v10 = [v9 stringByAppendingPathComponent:v6];

  storageUtil = self->_storageUtil;
  id v18 = 0;
  id v12 = [(MXStorageUtilProtocol *)storageUtil filesFromDirectory:v10 error:&v18];
  id v13 = v18;
  logHandle = self->_logHandle;
  if (v13)
  {
    id v15 = v13;
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR)) {
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:]();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
      -[MXSourcePathUtil removeDeliveredDiagnosticsForSourceID:forDate:](logHandle, v12);
    }
    v16 = self->_storageUtil;
    id v17 = 0;
    [(MXStorageUtilProtocol *)v16 removeFiles:v12 fromDirectory:v10 error:&v17];
    id v15 = v17;
  }
}

- (MXDateUtil)dateUtil
{
  return (MXDateUtil *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDateUtil:(id)a3
{
}

- (MXStorageUtilProtocol)storageUtil
{
  return (MXStorageUtilProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStorageUtil:(id)a3
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
  objc_storeStrong((id *)&self->_storageUtil, 0);

  objc_storeStrong((id *)&self->_dateUtil, 0);
}

- (void)removeDeliveredDiagnosticsForSourceID:(void *)a1 forDate:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_22BB49000, v4, v5, "Found %lu files to clean for source: %@", v6, v7, v8, v9, v10);
}

- (void)removeDeliveredDiagnosticsForSourceID:forDate:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22BB49000, v0, v1, "Failed to read contents of %@ source directory: %@");
}

- (void)removeDeliveredDiagnosticsForSourceID:forDate:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Cleaning %@ Directory", v2, v3, v4, v5, v6);
}

- (void)_setupSourceDirectoryForSourceID:andBundleID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Source Directory %@ exists", v2, v3, v4, v5, v6);
}

- (void)_setupSourceDirectoryForSourceID:andBundleID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Creating Source Directory at path %@", v2, v3, v4, v5, v6);
}

@end