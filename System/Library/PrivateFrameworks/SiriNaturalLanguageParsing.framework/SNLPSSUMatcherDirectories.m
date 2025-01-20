@interface SNLPSSUMatcherDirectories
+ (id)directoriesWithCacheDirectoryURL:(id)a3 modelAssetsDirectoryURL:(id)a4 datasetAssetsDirectoryURL:(id)a5 error:(id *)a6;
- (NSURL)cacheDirectoryURL;
- (NSURL)datasetAssetsDirectoryURL;
- (NSURL)modelAssetsDirectoryURL;
- (SNLPSSUMatcherDirectories)initWithCacheDirectoryURL:(id)a3 modelAssetsDirectoryURL:(id)a4 datasetAssetsDirectoryURL:(id)a5;
@end

@implementation SNLPSSUMatcherDirectories

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasetAssetsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_modelAssetsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
}

- (NSURL)datasetAssetsDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)modelAssetsDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)cacheDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (SNLPSSUMatcherDirectories)initWithCacheDirectoryURL:(id)a3 modelAssetsDirectoryURL:(id)a4 datasetAssetsDirectoryURL:(id)a5
{
  v8 = (NSURL *)a3;
  v9 = (NSURL *)a4;
  v10 = (NSURL *)a5;
  v18.receiver = self;
  v18.super_class = (Class)SNLPSSUMatcherDirectories;
  v11 = [(SNLPSSUMatcherDirectories *)&v18 init];
  cacheDirectoryURL = v11->_cacheDirectoryURL;
  v11->_cacheDirectoryURL = v8;
  v13 = v8;

  modelAssetsDirectoryURL = v11->_modelAssetsDirectoryURL;
  v11->_modelAssetsDirectoryURL = v9;
  v15 = v9;

  datasetAssetsDirectoryURL = v11->_datasetAssetsDirectoryURL;
  v11->_datasetAssetsDirectoryURL = v10;

  return v11;
}

+ (id)directoriesWithCacheDirectoryURL:(id)a3 modelAssetsDirectoryURL:(id)a4 datasetAssetsDirectoryURL:(id)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v30[0] = v10;
  v30[1] = v11;
  v30[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_super v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (([v18 isFileURL] & 1) == 0)
        {
          if (a6)
          {
            uint64_t v20 = *MEMORY[0x1E4F28588];
            v28[0] = *MEMORY[0x1E4F28568];
            v28[1] = v20;
            v29[0] = @"Could not build an SNLPSSUMatcherDirectories object";
            v21 = [NSString stringWithFormat:@"The given directory is not a file URL: %@.", v18];
            v29[1] = v21;
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

            *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SNLPSSUErrorDomain" code:1 userInfo:v22];
          }
          v19 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  v19 = (void *)[objc_alloc((Class)a1) initWithCacheDirectoryURL:v10 modelAssetsDirectoryURL:v11 datasetAssetsDirectoryURL:v12];
LABEL_13:

  return v19;
}

@end