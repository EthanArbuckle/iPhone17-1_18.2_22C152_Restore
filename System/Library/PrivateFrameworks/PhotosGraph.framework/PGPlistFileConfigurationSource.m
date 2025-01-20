@interface PGPlistFileConfigurationSource
- (NSDictionary)configurationData;
- (PGPlistFileConfigurationSource)initWithPlistFileURL:(id)a3;
- (id)objectForKey:(id)a3;
- (void)setConfigurationData:(id)a3;
@end

@implementation PGPlistFileConfigurationSource

- (void).cxx_destruct
{
}

- (void)setConfigurationData:(id)a3
{
}

- (NSDictionary)configurationData
{
  return self->_configurationData;
}

- (id)objectForKey:(id)a3
{
  return [(NSDictionary *)self->_configurationData objectForKeyedSubscript:a3];
}

- (PGPlistFileConfigurationSource)initWithPlistFileURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGPlistFileConfigurationSource;
  v5 = [(PGPlistFileConfigurationSource *)&v15 init];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [v4 path];
  char v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4];
    configurationData = v5->_configurationData;
    v5->_configurationData = (NSDictionary *)v9;

LABEL_4:
    v11 = v5;
    goto LABEL_8;
  }
  v12 = +[PGLogging sharedLogging];
  v13 = [v12 loggingConnection];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "[PGConfigurationSource] failed to load PlistFile at filePath: %@", buf, 0xCu);
  }

  v11 = 0;
LABEL_8:

  return v11;
}

@end