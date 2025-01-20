@interface PHACurareShadowEvaluationFacade
- (CPAnalytics)analytics;
- (PGManager)graphManager;
- (PHACurareShadowEvaluationFacade)initWithPhotosLibrary:(id)a3 graphManagerProgress:(id)a4;
- (PHPhotoLibrary)systemPhotoLibrary;
- (void)runPFLRecipeUserInfo:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 resultBlock:(id)a8;
- (void)setAnalytics:(id)a3;
- (void)setGraphManager:(id)a3;
- (void)setSystemPhotoLibrary:(id)a3;
@end

@implementation PHACurareShadowEvaluationFacade

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

- (void)runPFLRecipeUserInfo:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 resultBlock:(id)a8
{
  v14 = (void (**)(id, id))a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [(PHACurareShadowEvaluationFacade *)self systemPhotoLibrary];
  v21 = [(PHACurareShadowEvaluationFacade *)self graphManager];
  id v26 = 0;
  v22 = +[PHACurareShadowEvaluationRecipeDecoder decodeRecipeUserInfo:v19 models:v18 photoLibrary:v20 graphManager:v21 trialDeploymentID:v17 trialExperimentID:v16 trialTreatmentID:v15 decodingError:&v26];

  id v23 = v26;
  id v25 = v23;
  [v22 runWithError:&v25];
  id v24 = v25;

  v14[2](v14, v24);
}

- (PHACurareShadowEvaluationFacade)initWithPhotosLibrary:(id)a3 graphManagerProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHACurareShadowEvaluationFacade;
  v8 = [(PHACurareShadowEvaluationFacade *)&v16 init];
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F56658]);
    [(PHACurareShadowEvaluationFacade *)v8 setAnalytics:v9];

    v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v11 = [(PHACurareShadowEvaluationFacade *)v8 analytics];
    [v11 setupWithConfigurationFilename:@"CPAnalyticsConfig-photoanalysisd" inBundle:v10];

    v12 = [(PHACurareShadowEvaluationFacade *)v8 analytics];
    [v12 setupSystemPropertyProvidersForLibrary:v6];

    v13 = [(PHACurareShadowEvaluationFacade *)v8 analytics];
    [v13 activateEventQueue];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F8D770]) initWithPhotoLibrary:v6 analytics:v8->_analytics progressBlock:v7];
    [(PHACurareShadowEvaluationFacade *)v8 setGraphManager:v14];

    [(PHACurareShadowEvaluationFacade *)v8 setSystemPhotoLibrary:v6];
  }

  return v8;
}

@end