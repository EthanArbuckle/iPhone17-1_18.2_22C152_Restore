@interface VUIDebugViewDataSource
- (NSArray)defaultsDataSource;
- (NSArray)metricsDataSource;
- (VUIDebugViewDataSource)init;
- (id)_createDefaultsDataSource;
- (id)_createMetricsDataSource;
- (void)setDefaultsDataSource:(id)a3;
- (void)setMetricsDataSource:(id)a3;
@end

@implementation VUIDebugViewDataSource

- (VUIDebugViewDataSource)init
{
  v9.receiver = self;
  v9.super_class = (Class)VUIDebugViewDataSource;
  v2 = [(VUIDebugViewDataSource *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(VUIDebugViewDataSource *)v2 _createMetricsDataSource];
    metricsDataSource = v3->_metricsDataSource;
    v3->_metricsDataSource = (NSArray *)v4;

    uint64_t v6 = [(VUIDebugViewDataSource *)v3 _createDefaultsDataSource];
    defaultsDataSource = v3->_defaultsDataSource;
    v3->_defaultsDataSource = (NSArray *)v6;
  }
  return v3;
}

- (id)_createDefaultsDataSource
{
  v2 = objc_opt_new();
  v3 = [VUIDebugViewDefaults alloc];
  uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 bundleIdentifier];
  uint64_t v6 = [(VUIDebugViewDefaults *)v3 initWithTitle:@"Enable Debug UI" subtitle:0 domain:v5 defaultName:*MEMORY[0x1E4FB3DB8] BOOLType:1];
  [v2 addObject:v6];

  v7 = [VUIDebugViewDefaults alloc];
  v8 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v9 = [v8 bundleIdentifier];
  v10 = [(VUIDebugViewDefaults *)v7 initWithTitle:@"Stage Demo" subtitle:0 domain:v9 defaultName:*MEMORY[0x1E4FB3DC0] BOOLType:1];
  [v2 addObject:v10];

  v11 = [[VUIDebugViewDefaults alloc] initWithTitle:@"Ignore HTTP Cache" subtitle:0 domain:@"com.apple.ITMLKit" defaultName:@"IgnoreHTTPCache" BOOLType:1];
  [v2 addObject:v11];

  v12 = [[VUIDebugViewDefaults alloc] initWithTitle:@"Print Document XML" subtitle:0 domain:@"com.apple.ITMLKit" defaultName:@"LogDocumentXML" BOOLType:1];
  [v2 addObject:v12];

  v13 = [[VUIDebugViewDefaults alloc] initWithTitle:@"JS Console Logging" subtitle:0 domain:@"com.apple.ITMLKit" defaultName:@"LogJSConsole" BOOLType:1];
  [v2 addObject:v13];

  v14 = [[VUIDebugViewDefaults alloc] initWithTitle:@"Purge Images on Launch" subtitle:0 domain:@"com.apple.TVMLKit" defaultName:@"PurgeImageCache" BOOLType:1];
  [v2 addObject:v14];

  v15 = [[VUIDebugViewDefaults alloc] initWithTitle:@"Page Perf UI" subtitle:0 domain:@"com.apple.TVMLKit" defaultName:@"PagePerformanceUIEnabled" BOOLType:1];
  [v2 addObject:v15];

  v16 = [[VUIDebugViewDefaults alloc] initWithTitle:@"UI Animation Coefficient" subtitle:@"Values (0, 2, 5, 10, 25)" domain:@"com.apple.UIKit" defaultName:@"UIAnimationDragCoefficient" BOOLType:0];
  [v2 addObject:v16];
  v17 = (void *)[v2 copy];

  return v17;
}

- (id)_createMetricsDataSource
{
  v2 = objc_opt_new();
  v3 = [VUIDebugViewDefaults alloc];
  uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 bundleIdentifier];
  uint64_t v6 = [(VUIDebugViewDefaults *)v3 initWithTitle:@"Show logging in Console" subtitle:0 domain:v5 defaultName:*MEMORY[0x1E4FB3DD8] BOOLType:1];
  [v2 addObject:v6];

  v7 = [VUIDebugViewDefaults alloc];
  v8 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v9 = [v8 bundleIdentifier];
  v10 = [(VUIDebugViewDefaults *)v7 initWithTitle:@"Show expanded logging in Console" subtitle:0 domain:v9 defaultName:*MEMORY[0x1E4FB3DD0] BOOLType:1];
  [v2 addObject:v10];

  v11 = [VUIDebugViewDefaults alloc];
  v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v13 = [v12 bundleIdentifier];
  v14 = [(VUIDebugViewDefaults *)v11 initWithTitle:@"Metrics Expanded Click Logging" subtitle:0 domain:v13 defaultName:*MEMORY[0x1E4FB3DC8] BOOLType:1];
  [v2 addObject:v14];

  v15 = [VUIDebugViewDefaults alloc];
  v16 = [MEMORY[0x1E4F28B50] mainBundle];
  v17 = [v16 bundleIdentifier];
  v18 = [(VUIDebugViewDefaults *)v15 initWithTitle:@"Log pageRender events" subtitle:0 domain:v17 defaultName:*MEMORY[0x1E4FB3DE0] BOOLType:1];
  [v2 addObject:v18];

  v19 = (void *)[v2 copy];
  return v19;
}

- (NSArray)metricsDataSource
{
  return self->_metricsDataSource;
}

- (void)setMetricsDataSource:(id)a3
{
}

- (NSArray)defaultsDataSource
{
  return self->_defaultsDataSource;
}

- (void)setDefaultsDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDataSource, 0);
  objc_storeStrong((id *)&self->_metricsDataSource, 0);
}

@end