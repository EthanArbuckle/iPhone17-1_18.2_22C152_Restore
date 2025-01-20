@interface PXVideoStabilizationRecipeSource
- (BOOL)allowsOnDemandPixelAnalysis;
- (NSDictionary)analyticsPayload;
- (NSDictionary)debugInfo;
- (PXVideoStabilizationRecipeSource)init;
- (id)_loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4;
- (id)loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4;
- (unint64_t)allowedAnalysisTypes;
- (void)setAllowedAnalysisTypes:(unint64_t)a3;
- (void)setAllowsOnDemandPixelAnalysis:(BOOL)a3;
- (void)setAnalyticsPayload:(id)a3;
- (void)setDebugInfo:(id)a3;
@end

@implementation PXVideoStabilizationRecipeSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsPayload, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
}

- (void)setAnalyticsPayload:(id)a3
{
}

- (NSDictionary)analyticsPayload
{
  return self->_analyticsPayload;
}

- (void)setDebugInfo:(id)a3
{
}

- (NSDictionary)debugInfo
{
  return self->_debugInfo;
}

- (void)setAllowsOnDemandPixelAnalysis:(BOOL)a3
{
  self->_allowsOnDemandPixelAnalysis = a3;
}

- (BOOL)allowsOnDemandPixelAnalysis
{
  return self->_allowsOnDemandPixelAnalysis;
}

- (void)setAllowedAnalysisTypes:(unint64_t)a3
{
  self->_allowedAnalysisTypes = a3;
}

- (unint64_t)allowedAnalysisTypes
{
  return self->_allowedAnalysisTypes;
}

- (id)_loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXVideoStabilizationRecipeSource.m", 121, @"Method %s is a responsibility of subclass %@", "-[PXVideoStabilizationRecipeSource _loadStabilizationRecipe:analysisType:]", v8 object file lineNumber description];

  abort();
}

- (id)loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4
{
  self->_recipeLoadSignpost = [MEMORY[0x1E4F56658] startSignpost];
  unint64_t v15 = 0;
  v7 = [(PXVideoStabilizationRecipeSource *)self _loadStabilizationRecipe:a3 analysisType:&v15];
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v9 = [(PXVideoStabilizationRecipeSource *)self analyticsPayload];
  v10 = (void *)[v8 initWithDictionary:v9];

  [v10 setObject:@"com.apple.photos.CPAnalytics.inlineStabilizationRecipeLoading" forKeyedSubscript:*MEMORY[0x1E4F56580]];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F56560]];

  v13 = PXVideoStabilizeAnalysisTypeDescription(v15);
  [v10 setObject:v13 forKeyedSubscript:@"com.apple.photos.PXVideoStabilizationRecipeSource.analysisType"];

  [MEMORY[0x1E4F56658] endSignpost:self->_recipeLoadSignpost forEventName:*MEMORY[0x1E4F56440] withPayload:v10];
  *a4 = v15;

  return v7;
}

- (PXVideoStabilizationRecipeSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXVideoStabilizationRecipeSource;
  v2 = [(PXVideoStabilizationRecipeSource *)&v6 init];
  if (v2)
  {
    v3 = +[PXInlineVideoStabilizationSettings sharedInstance];
    v2->_allowedAnalysisTypes = [v3 allowedAnalysisTypes];

    debugInfo = v2->_debugInfo;
    v2->_debugInfo = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v2->_allowsOnDemandPixelAnalysis = 0;
  }
  return v2;
}

@end