@interface MKDiagnosticsMigrator
- (MKDiagnosticsMigrator)init;
- (id)pathForPerformanceMetrics;
- (id)saveData:(id)a3 toFile:(id)a4;
- (void)saveData:(id)a3 fileName:(id)a4;
- (void)savePerformanceMetrics:(id)a3;
@end

@implementation MKDiagnosticsMigrator

- (MKDiagnosticsMigrator)init
{
  v7.receiver = self;
  v7.super_class = (Class)MKDiagnosticsMigrator;
  v2 = [(MKMigrator *)&v7 init];
  if (v2)
  {
    v3 = NSHomeDirectory();
    uint64_t v4 = [v3 stringByAppendingPathComponent:@"/Library/MigrationKit/Diagnostics"];
    basePath = v2->_basePath;
    v2->_basePath = (NSString *)v4;
  }
  return v2;
}

- (void)saveData:(id)a3 fileName:(id)a4
{
  id v4 = [(MKDiagnosticsMigrator *)self saveData:a3 toFile:a4];
}

- (void)savePerformanceMetrics:(id)a3
{
  self->_performanceMetricsPath = [(MKDiagnosticsMigrator *)self saveData:a3 toFile:@"performance.json"];
  MEMORY[0x270F9A758]();
}

- (id)saveData:(id)a3 toFile:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_super v7 = (void *)MEMORY[0x263F08850];
  id v8 = a3;
  v9 = [v7 defaultManager];
  basePath = self->_basePath;
  id v20 = 0;
  char v11 = [v9 createDirectoryAtPath:basePath withIntermediateDirectories:1 attributes:0 error:&v20];
  id v12 = v20;

  if ((v11 & 1) == 0)
  {
    v13 = +[MKLog log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MKDiagnosticsMigrator saveData:toFile:]((uint64_t)self, (uint64_t)v12, v13);
    }
  }
  v14 = [(NSString *)self->_basePath stringByAppendingPathComponent:v6];
  int v15 = [v8 writeToFile:v14 atomically:0];

  v16 = +[MKLog log];
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v22 = self;
      __int16 v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_22BFAC000, v17, OS_LOG_TYPE_INFO, "%@: Saved data to file: %@", buf, 0x16u);
    }

    id v18 = v14;
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MKDiagnosticsMigrator saveData:toFile:]((uint64_t)self, v17);
    }

    id v18 = 0;
  }

  return v18;
}

- (id)pathForPerformanceMetrics
{
  return self->_performanceMetricsPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetricsPath, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
}

- (void)saveData:(uint64_t)a1 toFile:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "%@ Failed to save data to file", (uint8_t *)&v2, 0xCu);
}

- (void)saveData:(os_log_t)log toFile:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "%@: Failed to create directories: %@", (uint8_t *)&v3, 0x16u);
}

@end