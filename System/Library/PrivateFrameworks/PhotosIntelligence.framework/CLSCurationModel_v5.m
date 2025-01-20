@interface CLSCurationModel_v5
+ (id)baseSpecificationWithSpecification:(id)a3;
- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4;
- (BOOL)isShowcasingFoodWithAsset:(id)a3;
- (CLSCLIPprintModel)CLIPprintModel;
- (CLSCityNatureModel)cityNatureModel;
- (CLSCurationModel_v5)initWithCurationModelSpecification:(id)a3;
- (CLSWallpaperScoreModel)wallpaperScoreModel;
- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3;
- (void)enumerateSignalModelsUsingBlock:(id)a3;
@end

@implementation CLSCurationModel_v5

+ (id)baseSpecificationWithSpecification:(id)a3
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CLSCurationModel_v5;
  id v3 = a3;
  v4 = objc_msgSendSuper2(&v12, sel_baseSpecificationWithSpecification_, v3);
  uint64_t v5 = objc_msgSend(v3, "sceneAnalysisVersion", v12.receiver, v12.super_class);

  unint64_t v6 = [v4 sceneAnalysisVersion];
  unint64_t v7 = [MEMORY[0x263F5E108] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v7) {
    unint64_t v6 = v7;
  }
  unint64_t v8 = [MEMORY[0x263F5E088] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v8) {
    unint64_t v6 = v8;
  }
  unint64_t v9 = [MEMORY[0x263F5E090] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v9) {
    unint64_t v6 = v9;
  }
  v10 = -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:]([CLSCurationModelSpecification alloc], "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v6, [v4 mediaAnalysisVersion], objc_msgSend(v4, "faceAnalysisVersion"));

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityNatureModel, 0);
  objc_storeStrong((id *)&self->_CLIPprintModel, 0);
  objc_storeStrong((id *)&self->_wallpaperScoreModel, 0);
}

- (CLSCityNatureModel)cityNatureModel
{
  return (CLSCityNatureModel *)objc_getProperty(self, a2, 192, 1);
}

- (CLSCLIPprintModel)CLIPprintModel
{
  return (CLSCLIPprintModel *)objc_getProperty(self, a2, 184, 1);
}

- (CLSWallpaperScoreModel)wallpaperScoreModel
{
  return (CLSWallpaperScoreModel *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSCurationModel_v5;
  if ([(CLSCurationModel_v4 *)&v11 avoidIfPossibleForKeyAssetWithAsset:v6 statistics:a4])
  {
    goto LABEL_5;
  }
  unint64_t v7 = (void *)MEMORY[0x263F14F60];
  unint64_t v8 = [v6 clsFaceInformationSummary];
  [v8 userFeedbackScore];
  LOBYTE(v7) = objc_msgSend(v7, "score:meetsScoreThreshold:");

  if ((v7 & 1) == 0)
  {
    ++a4->var12;
LABEL_5:
    BOOL v9 = 1;
    goto LABEL_6;
  }
  BOOL v9 = 0;
LABEL_6:

  return v9;
}

- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__CLSCurationModel_v5_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke;
  v8[3] = &unk_26544F490;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  v7.receiver = self;
  v7.super_class = (Class)CLSCurationModel_v5;
  [(CLSCurationModel_v4 *)&v7 enumerateClassificationBasedSignalModelsUsingBlock:v8];
  if (!*((unsigned char *)v12 + 24))
  {
    cityNatureModel = self->_cityNatureModel;
    if (cityNatureModel) {
      (*((void (**)(id, CLSCityNatureModel *, uint64_t *))v5 + 2))(v5, cityNatureModel, v12 + 3);
    }
  }

  _Block_object_dispose(&v11, 8);
}

- (void)enumerateSignalModelsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__CLSCurationModel_v5_enumerateSignalModelsUsingBlock___block_invoke;
  v11[3] = &unk_26544F468;
  id v5 = v4;
  id v12 = v5;
  uint64_t v13 = &v14;
  v10.receiver = self;
  v10.super_class = (Class)CLSCurationModel_v5;
  [(CLSCurationModel_v4 *)&v10 enumerateSignalModelsUsingBlock:v11];
  id v6 = v15;
  if (!*((unsigned char *)v15 + 24))
  {
    wallpaperScoreModel = self->_wallpaperScoreModel;
    if (!wallpaperScoreModel
      || ((*((void (**)(id, CLSWallpaperScoreModel *, uint64_t *))v5 + 2))(v5, wallpaperScoreModel, v15 + 3),
          id v6 = v15,
          !*((unsigned char *)v15 + 24)))
    {
      CLIPprintModel = self->_CLIPprintModel;
      if (!CLIPprintModel
        || ((*((void (**)(id, CLSCLIPprintModel *, uint64_t *))v5 + 2))(v5, CLIPprintModel, v6 + 3),
            id v6 = v15,
            !*((unsigned char *)v15 + 24)))
      {
        cityNatureModel = self->_cityNatureModel;
        if (cityNatureModel) {
          (*((void (**)(id, CLSCityNatureModel *, uint64_t *))v5 + 2))(v5, cityNatureModel, v6 + 3);
        }
      }
    }
  }

  _Block_object_dispose(&v14, 8);
}

- (BOOL)isShowcasingFoodWithAsset:(id)a3
{
  id v3 = [a3 clsProcessedSignals];
  char v4 = [v3 isShowcasingFood];

  return v4;
}

- (CLSCurationModel_v5)initWithCurationModelSpecification:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSCurationModel_v5;
  id v5 = [(CLSCurationModel_v4 *)&v14 initWithCurationModelSpecification:v4];
  if (v5)
  {
    uint64_t v6 = [v4 sceneAnalysisVersion];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F5E108]) initWithSceneAnalysisVersion:v6];
    wallpaperScoreModel = v5->_wallpaperScoreModel;
    v5->_wallpaperScoreModel = (CLSWallpaperScoreModel *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F5E088]) initWithSceneAnalysisVersion:v6];
    CLIPprintModel = v5->_CLIPprintModel;
    v5->_CLIPprintModel = (CLSCLIPprintModel *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263F5E090]) initWithSceneAnalysisVersion:v6];
    cityNatureModel = v5->_cityNatureModel;
    v5->_cityNatureModel = (CLSCityNatureModel *)v11;
  }
  return v5;
}

@end