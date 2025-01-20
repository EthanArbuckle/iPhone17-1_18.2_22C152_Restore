@interface PSGInternalRequestHandler
- (NSString)clientProcessName;
- (PSGInternalRequestHandler)init;
- (_PASBundleIdResolver)bundleIdResolver;
- (id)_getPreferredLanguages;
- (id)_getWordBoundaryExperimentInfo:(id)a3;
- (id)_getZKWExperimentInfo:(id)a3;
- (id)_initWithExperimentResolver:(id)a3;
- (void)setBundleIdResolver:(id)a3;
- (void)setClientProcessName:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)sysdiagnoseInformationWithCompletion:(id)a3;
@end

@implementation PSGInternalRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdResolver, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_experimentResolver, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

- (void)setBundleIdResolver:(id)a3
{
}

- (_PASBundleIdResolver)bundleIdResolver
{
  return self->_bundleIdResolver;
}

- (void)setClientProcessName:(id)a3
{
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)sysdiagnoseInformationWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v18 = (void (**)(id, void *, id))a3;
  uint64_t v16 = objc_opt_new();
  v4 = objc_opt_new();
  [(PSGInternalRequestHandler *)self _getPreferredLanguages];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v25[0] = @"WB";
        v10 = -[PSGInternalRequestHandler _getWordBoundaryExperimentInfo:](self, "_getWordBoundaryExperimentInfo:", v9, v16);
        v25[1] = @"ZKW";
        v26[0] = v10;
        v11 = [(PSGInternalRequestHandler *)self _getZKWExperimentInfo:v9];
        v26[1] = v11;
        v12 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
        [v4 setObject:v12 forKeyedSubscript:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v6);
  }
  if (!objc_msgSend(v4, "count", v16)) {
    [v4 setObject:@"No preferredLanguages" forKeyedSubscript:@"Error"];
  }
  [v17 setObject:v4 forKeyedSubscript:@"ExperimentInfo"];

  id v20 = 0;
  v13 = [MEMORY[0x263F08900] dataWithJSONObject:v17 options:3 error:&v20];
  id v14 = v20;
  if (v13)
  {
    v15 = (void *)[[NSString alloc] initWithData:v13 encoding:4];
    v18[2](v18, v15, v14);
  }
  else
  {
    v18[2](v18, 0, v14);
  }
}

- (id)_getPreferredLanguages
{
  return (id)[MEMORY[0x263F5D478] userLanguages];
}

- (id)_getWordBoundaryExperimentInfo:(id)a3
{
  v22[6] = *MEMORY[0x263EF8340];
  v3 = [(PSGExperimentResolver *)self->_experimentResolver getWordBoundarySuggestionsExperimentConfig:a3 shouldDownloadAssets:0];
  v21[0] = @"treatment";
  id v20 = [v3 treatmentName];
  v22[0] = v20;
  v21[1] = @"experiment-id";
  v4 = [v3 experimentIdentifiers];
  uint64_t v5 = [v4 experimentId];
  v22[1] = v5;
  v21[2] = @"treatment-id";
  uint64_t v6 = [v3 experimentIdentifiers];
  uint64_t v7 = [v6 treatmentId];
  v22[2] = v7;
  v21[3] = @"ml-enabled";
  int v8 = [v3 isMLModelEnabled];
  uint64_t v9 = @"NO";
  if (v8) {
    uint64_t v9 = @"YES";
  }
  v22[3] = v9;
  v21[4] = @"model-config";
  v10 = [v3 inferenceModelConfigPath];
  uint64_t v11 = [v10 lastPathComponent];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = @"nil";
  }
  v22[4] = v13;
  v21[5] = @"model-file";
  id v14 = [v3 espressoBinFilePath];
  uint64_t v15 = [v14 lastPathComponent];
  uint64_t v16 = (void *)v15;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  else {
    v17 = @"nil";
  }
  v22[5] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:6];

  return v18;
}

- (id)_getZKWExperimentInfo:(id)a3
{
  v22[6] = *MEMORY[0x263EF8340];
  v3 = [(PSGExperimentResolver *)self->_experimentResolver getResponseSuggestionsExperimentConfig:a3 shouldDownloadAssets:0];
  v21[0] = @"treatment";
  id v20 = [v3 treatmentName];
  v22[0] = v20;
  v21[1] = @"experiment-id";
  v4 = [v3 experimentIdentifiers];
  uint64_t v5 = [v4 experimentId];
  v22[1] = v5;
  v21[2] = @"treatment-id";
  uint64_t v6 = [v3 experimentIdentifiers];
  uint64_t v7 = [v6 treatmentId];
  v22[2] = v7;
  v21[3] = @"ml-enabled";
  int v8 = [v3 isMLModelEnabled];
  uint64_t v9 = @"NO";
  if (v8) {
    uint64_t v9 = @"YES";
  }
  v22[3] = v9;
  v21[4] = @"model-config";
  v10 = [v3 inferenceModelConfigPath];
  uint64_t v11 = [v10 lastPathComponent];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = @"nil";
  }
  v22[4] = v13;
  v21[5] = @"model-file";
  id v14 = [v3 espressoBinFilePath];
  uint64_t v15 = [v14 lastPathComponent];
  uint64_t v16 = (void *)v15;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  else {
    v17 = @"nil";
  }
  v22[5] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:6];

  return v18;
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (id)_initWithExperimentResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSGInternalRequestHandler;
  uint64_t v6 = [(PSGInternalRequestHandler *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_experimentResolver, a3);
  }

  return v7;
}

- (PSGInternalRequestHandler)init
{
  v3 = +[PSGExperimentResolver sharedInstance];
  v4 = [(PSGInternalRequestHandler *)self _initWithExperimentResolver:v3];

  return v4;
}

@end