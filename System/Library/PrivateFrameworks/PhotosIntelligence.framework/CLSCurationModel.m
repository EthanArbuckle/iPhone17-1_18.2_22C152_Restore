@interface CLSCurationModel
+ (id)baseSpecificationWithSpecification:(id)a3;
+ (id)firstReasonForAvoidForKeyAssetFromStatistics:(id *)a3;
+ (void)logInfo:(id)a3 prefix:(id)a4 avoidForKeyAssetStatistics:(id *)a5;
+ (void)logInfoInIndividualLine:(id)a3 prefix:(id)a4 avoidForKeyAssetStatistics:(id *)a5;
- (CLSCurationModel)initWithCurationModelSpecification:(id)a3;
- (CLSEntityNetModel)entityNetModel;
- (CLSIconicScoreModel)iconicScoreModel;
- (unint64_t)similarityModelVersion;
@end

@implementation CLSCurationModel

+ (void)logInfoInIndividualLine:(id)a3 prefix:(id)a4 avoidForKeyAssetStatistics:(id *)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__CLSCurationModel_logInfoInIndividualLine_prefix_avoidForKeyAssetStatistics___block_invoke;
  v12[3] = &unk_26544E8F8;
  v9 = v7;
  v13 = v9;
  id v10 = v8;
  id v14 = v10;
  v11 = (void (**)(void *, void, __CFString *))_Block_copy(v12);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v10;
    _os_log_impl(&dword_25934C000, v9, OS_LOG_TYPE_INFO, "%@ Avoided for key asset: {", buf, 0xCu);
  }
  v11[2](v11, a5->var0, @"hidden persons");
  v11[2](v11, a5->var1, @"panorama");
  v11[2](v11, a5->var2.var0, @"low sharpness");
  v11[2](v11, a5->var2.var1, @"low aesthetics");
  v11[2](v11, a5->var2.var2, @"high failure");
  v11[2](v11, a5->var2.var3, @"low tasteBlur");
  v11[2](v11, a5->var2.var4, @"unpleasant lighting");
  v11[2](v11, a5->var3, @"junkForMemories");
  v11[2](v11, a5->var7, @"risky file format");
  v11[2](v11, a5->var8, @"blocklisted importedBy");
  v11[2](v11, a5->var9, @"meme");
  v11[2](v11, a5->var10, @"wrong rotation");
  v11[2](v11, a5->var11, @"poor resolution");
  v11[2](v11, a5->var13.var0, @"explicit NSFW");
  v11[2](v11, a5->var14.var0, @"junkFailure");
  v11[2](v11, a5->var14.var1, @"blood");
  v11[2](v11, a5->var14.var2, @"funeral");
  v11[2](v11, a5->var14.var3, @"hospital");
  v11[2](v11, a5->var14.var4, @"vehicle crash");
  v11[2](v11, a5->var14.var5, @"war");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v10;
    _os_log_impl(&dword_25934C000, v9, OS_LOG_TYPE_INFO, "%@ }", buf, 0xCu);
  }
}

void __78__CLSCurationModel_logInfoInIndividualLine_prefix_avoidForKeyAssetStatistics___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_25934C000, v6, OS_LOG_TYPE_INFO, "%@ Filtered out %d for %@", (uint8_t *)&v8, 0x1Cu);
  }
}

+ (void)logInfo:(id)a3 prefix:(id)a4 avoidForKeyAssetStatistics:(id *)a5
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    unsigned int var0 = a5->var0;
    unsigned int var1 = a5->var1;
    unsigned int v10 = a5->var2.var0;
    unsigned int v11 = a5->var2.var1;
    unsigned int var2 = a5->var2.var2;
    unsigned int var3 = a5->var2.var3;
    unsigned int var4 = a5->var2.var4;
    unsigned int v15 = a5->var3;
    unsigned int var7 = a5->var7;
    unsigned int var8 = a5->var8;
    unsigned int var9 = a5->var9;
    unsigned int var10 = a5->var10;
    unsigned int var11 = a5->var11;
    unsigned int v21 = a5->var13.var0;
    unsigned int v22 = a5->var14.var0;
    unsigned int v23 = a5->var14.var1;
    unsigned int v24 = a5->var14.var2;
    unsigned int v25 = a5->var14.var3;
    unsigned int v26 = a5->var14.var4;
    unsigned int var5 = a5->var14.var5;
    int v28 = 138417410;
    id v29 = a4;
    __int16 v30 = 1024;
    unsigned int v31 = var0;
    __int16 v32 = 1024;
    unsigned int v33 = var1;
    __int16 v34 = 1024;
    unsigned int v35 = v10;
    __int16 v36 = 1024;
    unsigned int v37 = v11;
    __int16 v38 = 1024;
    unsigned int v39 = var2;
    __int16 v40 = 1024;
    unsigned int v41 = var3;
    __int16 v42 = 1024;
    unsigned int v43 = var4;
    __int16 v44 = 1024;
    unsigned int v45 = v15;
    __int16 v46 = 1024;
    unsigned int v47 = var7;
    __int16 v48 = 1024;
    unsigned int v49 = var8;
    __int16 v50 = 1024;
    unsigned int v51 = var9;
    __int16 v52 = 1024;
    unsigned int v53 = var10;
    __int16 v54 = 1024;
    unsigned int v55 = var11;
    __int16 v56 = 1024;
    unsigned int v57 = v21;
    __int16 v58 = 1024;
    unsigned int v59 = v22;
    __int16 v60 = 1024;
    unsigned int v61 = v23;
    __int16 v62 = 1024;
    unsigned int v63 = v24;
    __int16 v64 = 1024;
    unsigned int v65 = v25;
    __int16 v66 = 1024;
    unsigned int v67 = v26;
    __int16 v68 = 1024;
    unsigned int v69 = var5;
    _os_log_impl(&dword_25934C000, (os_log_t)a3, OS_LOG_TYPE_INFO, "%@ Avoided for key asset: %d for hidden persons, %d for panorama, %d for low sharpness, %d for low aesthetics, %d for high failure, %d for low tasteBlur, %d for unpleasant lighting, %d for junkForMemories, %d for risky file format, %d for blocklisted importedBy, %d for meme, %d for wrong rotation, %d for poor resolution, %d for NSFW, %d for junkFailure, %d for blood, %d for funeral, %d for hospital, %d for vehicle crash, %d for war", (uint8_t *)&v28, 0x84u);
  }
}

+ (id)firstReasonForAvoidForKeyAssetFromStatistics:(id *)a3
{
  if (a3->var0) {
    return @"Hidden Persons";
  }
  if (a3->var1) {
    return @"Panorama";
  }
  if (a3->var2.var0) {
    return @"Low Sharpness Score";
  }
  if (a3->var2.var1) {
    return @"Low Aesthetics Score";
  }
  if (a3->var2.var2) {
    return @"Low Failure Score";
  }
  if (a3->var2.var3) {
    return @"Low TastefullyBlurred Score";
  }
  if (a3->var2.var4) {
    return @"Low Lighting Score";
  }
  if (a3->var3) {
    return @"Junk for Memories";
  }
  if (a3->var4) {
    return @"Uninteresting Video";
  }
  if (a3->var5) {
    return @"Low Autoplay Score";
  }
  if (a3->var6) {
    return @"Poor Video Res + No Loc";
  }
  if (a3->var7) {
    return @"Risky File Format";
  }
  if (a3->var8) {
    return @"Blocklisted Imported By";
  }
  if (a3->var9) {
    return @"Meme";
  }
  if (a3->var10) {
    return @"Wrong Rotation";
  }
  if (a3->var11) {
    return @"Poor Photo Resolution";
  }
  if (a3->var12) {
    return @"Unacceptable User Feedback";
  }
  if (a3->var13.var0) {
    return @"NSFW";
  }
  if (a3->var14.var0) {
    return @"Junk Failure";
  }
  if (a3->var14.var1) {
    return @"Blood";
  }
  if (a3->var14.var2) {
    return @"Funeral";
  }
  if (a3->var14.var3) {
    return @"Hospital";
  }
  if (a3->var14.var4) {
    return @"Vehicle Crash";
  }
  if (a3->var14.var5) {
    return @"War";
  }
  return @"Unknown Reason";
}

+ (id)baseSpecificationWithSpecification:(id)a3
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CLSCurationModel;
  id v3 = a3;
  v4 = objc_msgSendSuper2(&v12, sel_baseSpecificationWithSpecification_, v3);
  uint64_t v5 = objc_msgSend(v3, "sceneAnalysisVersion", v12.receiver, v12.super_class);

  unint64_t v6 = [v4 sceneAnalysisVersion];
  unint64_t v7 = [MEMORY[0x263F5E098] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v7) {
    unint64_t v6 = v7;
  }
  unint64_t v8 = [MEMORY[0x263F5E0B0] baseSceneAnalysisVersionWithSceneAnalysisVersion:v5];
  if (v6 <= v8) {
    unint64_t v6 = v8;
  }
  unint64_t v9 = SimilarityModelVersionFromSceneAnalysisVersion();
  if (v6 <= v9) {
    unint64_t v6 = v9;
  }
  unsigned int v10 = -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:]([CLSCurationModelSpecification alloc], "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v6, [v4 mediaAnalysisVersion], objc_msgSend(v4, "faceAnalysisVersion"));

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconicScoreModel, 0);
  objc_storeStrong((id *)&self->_entityNetModel, 0);
}

- (unint64_t)similarityModelVersion
{
  return self->_similarityModelVersion;
}

- (CLSIconicScoreModel)iconicScoreModel
{
  return (CLSIconicScoreModel *)objc_getProperty(self, a2, 208, 1);
}

- (CLSEntityNetModel)entityNetModel
{
  return (CLSEntityNetModel *)objc_getProperty(self, a2, 200, 1);
}

- (CLSCurationModel)initWithCurationModelSpecification:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSCurationModel;
  uint64_t v5 = [(CLSCurationModel_v5 *)&v12 initWithCurationModelSpecification:v4];
  if (v5)
  {
    uint64_t v6 = [v4 sceneAnalysisVersion];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F5E098]) initWithSceneAnalysisVersion:v6];
    entityNetModel = v5->_entityNetModel;
    v5->_entityNetModel = (CLSEntityNetModel *)v7;

    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263F5E0B0]), "initWithSceneAnalysisVersion:", objc_msgSend(v4, "sceneAnalysisVersion"));
    iconicScoreModel = v5->_iconicScoreModel;
    v5->_iconicScoreModel = (CLSIconicScoreModel *)v9;

    v5->_similarityModelVersion = SimilarityModelVersionFromSceneAnalysisVersion();
  }

  return v5;
}

uint64_t __74__CLSCurationModel_v3_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

uint64_t __55__CLSCurationModel_v3_enumerateSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

uint64_t __51__CLSCurationModel_v3_processedSignalsFromSignals___block_invoke(uint64_t a1, void *a2)
{
  return [a2 processSignals:*(void *)(a1 + 32) intoProcessedSignals:*(void *)(a1 + 40)];
}

uint64_t __74__CLSCurationModel_v5_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

uint64_t __55__CLSCurationModel_v5_enumerateSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

uint64_t __74__CLSCurationModel_v4_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

uint64_t __55__CLSCurationModel_v4_enumerateSignalModelsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

@end