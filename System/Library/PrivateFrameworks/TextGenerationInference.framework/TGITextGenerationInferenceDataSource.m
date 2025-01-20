@interface TGITextGenerationInferenceDataSource
- (TGTextGenerationConfiguration)defaultConfiguration;
- (id)createInferenceRunnerWithQueue:(id)a3 executionUUID:(id)a4 operation:(id)a5 session:(id)a6;
- (shared_ptr<TGITextGenerationInferenceModelInterface>)createModelWithConfiguration:(id)a3;
@end

@implementation TGITextGenerationInferenceDataSource

- (TGTextGenerationConfiguration)defaultConfiguration
{
  return (TGTextGenerationConfiguration *)[MEMORY[0x263F7E4E8] defaultConfiguration];
}

- (shared_ptr<TGITextGenerationInferenceModelInterface>)createModelWithConfiguration:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    [v3 modelConfiguration];
  }
  else
  {
    uint64_t v9 = 0;
    long long v7 = 0u;
    *(_OWORD *)__p = 0u;
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)v6 = 0u;
  }
  TGITextGenerationInferenceModel::createWithConfiguration((TGITextGenerationInferenceModel *)v5, v4);
}

- (id)createInferenceRunnerWithQueue:(id)a3 executionUUID:(id)a4 operation:(id)a5 session:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [[TGITextGenerationInferenceRunner alloc] initWithQueue:v9 executionUUID:v10 operation:v11 session:v12];

  return v13;
}

@end