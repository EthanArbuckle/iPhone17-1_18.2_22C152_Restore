@interface PNAssetSafeForDisplayModelSet
- (CLSIVSNSFWModel)ivsNSFWModel;
- (CLSNSFWModel)nsfwModel;
- (CLSTabooEventModel)tabooEventModel;
- (PNAssetSafeForDisplayModelSet)initWithSceneAnalysisVersion:(signed __int16)a3;
- (signed)sceneAnalysisVersion;
@end

@implementation PNAssetSafeForDisplayModelSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabooEventModel, 0);
  objc_storeStrong((id *)&self->_nsfwModel, 0);
  objc_storeStrong((id *)&self->_ivsNSFWModel, 0);
}

- (CLSTabooEventModel)tabooEventModel
{
  return self->_tabooEventModel;
}

- (CLSNSFWModel)nsfwModel
{
  return self->_nsfwModel;
}

- (CLSIVSNSFWModel)ivsNSFWModel
{
  return self->_ivsNSFWModel;
}

- (signed)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (PNAssetSafeForDisplayModelSet)initWithSceneAnalysisVersion:(signed __int16)a3
{
  int v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PNAssetSafeForDisplayModelSet;
  v4 = [(PNAssetSafeForDisplayModelSet *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_sceneAnalysisVersion = v3;
    uint64_t v6 = [objc_alloc(MEMORY[0x263F5E0A8]) initWithSceneAnalysisVersion:v3];
    ivsNSFWModel = v5->_ivsNSFWModel;
    v5->_ivsNSFWModel = (CLSIVSNSFWModel *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F5E0D8]) initWithSceneAnalysisVersion:v3];
    nsfwModel = v5->_nsfwModel;
    v5->_nsfwModel = (CLSNSFWModel *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F5E0F8]) initWithSceneAnalysisVersion:v3];
    tabooEventModel = v5->_tabooEventModel;
    v5->_tabooEventModel = (CLSTabooEventModel *)v10;
  }
  return v5;
}

@end