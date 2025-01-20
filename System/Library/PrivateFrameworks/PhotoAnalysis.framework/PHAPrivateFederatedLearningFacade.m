@interface PHAPrivateFederatedLearningFacade
- (CPAnalytics)analytics;
- (PGManager)graphManager;
- (PHAPrivateFederatedLearningFacade)initWithPhotosLibrary:(id)a3 graphManagerProgress:(id)a4;
- (PHPhotoLibrary)systemPhotoLibrary;
- (void)runPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 resultBlock:(id)a5;
- (void)setAnalytics:(id)a3;
- (void)setGraphManager:(id)a3;
- (void)setSystemPhotoLibrary:(id)a3;
@end

@implementation PHAPrivateFederatedLearningFacade

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);

  objc_storeStrong((id *)&self->_analytics, 0);
}

- (void)setSystemPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)systemPhotoLibrary
{
  return self->_systemPhotoLibrary;
}

- (void)setGraphManager:(id)a3
{
}

- (PGManager)graphManager
{
  return self->_graphManager;
}

- (void)setAnalytics:(id)a3
{
}

- (CPAnalytics)analytics
{
  return self->_analytics;
}

- (void)runPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 resultBlock:(id)a5
{
  v8 = (void (**)(id, void *, void *, id))a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PHAPrivateFederatedLearningFacade *)self systemPhotoLibrary];
  v12 = [(PHAPrivateFederatedLearningFacade *)self graphManager];
  id v25 = 0;
  v13 = +[PHAPrivateFederatedLearningRecipeDecoder decodeRecipeUserInfo:v9 attachmentURLs:v10 photoLibrary:v11 graphManager:v12 decodingError:&v25];

  id v14 = v25;
  v15 = [v13 options];
  v16 = [v15 learningFramework];
  LODWORD(v9) = [v16 isEqualToString:@"coreML"];

  if (v9)
  {
    id v24 = v14;
    v17 = &v24;
    uint64_t v18 = [v13 runCoreMLModelWithError:&v24];
  }
  else
  {
    id v23 = v14;
    v17 = &v23;
    uint64_t v18 = [v13 runWithError:&v23];
  }
  v19 = (void *)v18;
  id v20 = *v17;

  v21 = [v19 dataPackage];
  v22 = [v19 trainingMetrics];
  v8[2](v8, v21, v22, v20);
}

- (PHAPrivateFederatedLearningFacade)initWithPhotosLibrary:(id)a3 graphManagerProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHAPrivateFederatedLearningFacade;
  v8 = [(PHAPrivateFederatedLearningFacade *)&v16 init];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F56658]);
    [(PHAPrivateFederatedLearningFacade *)v8 setAnalytics:v9];

    id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v11 = [(PHAPrivateFederatedLearningFacade *)v8 analytics];
    [v11 setupWithConfigurationFilename:@"CPAnalyticsConfig-photoanalysisd" inBundle:v10];

    v12 = [(PHAPrivateFederatedLearningFacade *)v8 analytics];
    [v12 setupSystemPropertyProvidersForLibrary:v6];

    v13 = [(PHAPrivateFederatedLearningFacade *)v8 analytics];
    [v13 activateEventQueue];

    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F8D770]) initWithPhotoLibrary:v6 analytics:v8->_analytics progressBlock:v7];
    [(PHAPrivateFederatedLearningFacade *)v8 setGraphManager:v14];

    [(PHAPrivateFederatedLearningFacade *)v8 setSystemPhotoLibrary:v6];
  }

  return v8;
}

@end