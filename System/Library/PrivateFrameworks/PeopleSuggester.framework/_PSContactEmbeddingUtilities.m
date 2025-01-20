@interface _PSContactEmbeddingUtilities
+ (id)loadModelFromUrlResource:(id)a3;
+ (id)modelFeatures;
+ (id)modelFeaturesBackup;
+ (id)prepareFeatureInputFromFeatureDict:(id)a3;
+ (void)modelFeatures;
@end

@implementation _PSContactEmbeddingUtilities

+ (id)loadModelFromUrlResource:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 URLForResource:v3 withExtension:@"mlmodelc"];

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v6 = (void *)getMLModelClass_softClass_3;
  uint64_t v18 = getMLModelClass_softClass_3;
  if (!getMLModelClass_softClass_3)
  {
    v13[1] = (id)MEMORY[0x1E4F143A8];
    v13[2] = (id)3221225472;
    v13[3] = __getMLModelClass_block_invoke_3;
    v13[4] = &unk_1E5ADE858;
    v14 = &v15;
    CoreMLLibraryCore_2();
    v16[3] = (uint64_t)objc_getClass("MLModel");
    getMLModelClass_softClass_3 = *(void *)(v14[1] + 24);
    v6 = (void *)v16[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v15, 8);
  v13[0] = 0;
  v8 = [v7 modelWithContentsOfURL:v5 error:v13];
  id v9 = v13[0];
  if (v9)
  {
    v10 = +[_PSLogging contactEmbeddingChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[_PSContactEmbeddingUtilities loadModelFromUrlResource:v10];
    }

    id v11 = 0;
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

+ (id)prepareFeatureInputFromFeatureDict:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 modelFeatures];
  uint64_t v6 = [v5 count];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v7 = (void *)getMLMultiArrayClass_softClass_0;
  uint64_t v25 = getMLMultiArrayClass_softClass_0;
  if (!getMLMultiArrayClass_softClass_0)
  {
    v20[1] = (id)MEMORY[0x1E4F143A8];
    v20[2] = (id)3221225472;
    v20[3] = __getMLMultiArrayClass_block_invoke_0;
    v20[4] = &unk_1E5ADE858;
    v21 = &v22;
    CoreMLLibraryCore_2();
    v23[3] = (uint64_t)objc_getClass("MLMultiArray");
    getMLMultiArrayClass_softClass_0 = *(void *)(v21[1] + 24);
    id v7 = (void *)v23[3];
  }
  v8 = v7;
  _Block_object_dispose(&v22, 8);
  id v9 = [v8 alloc];
  v10 = [NSNumber numberWithUnsignedInteger:v6];
  v26[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v20[0] = 0;
  v12 = (void *)[v9 initWithShape:v11 dataType:65600 error:v20];
  id v13 = v20[0];

  if (v13)
  {
    v14 = +[_PSLogging contactEmbeddingChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[_PSContactEmbeddingUtilities prepareFeatureInputFromFeatureDict:]((uint64_t)v13, v14);
    }

LABEL_7:
    id v15 = 0;
    goto LABEL_13;
  }
  if (v6)
  {
    uint64_t v16 = 0;
    do
    {
      uint64_t v17 = [v5 objectAtIndexedSubscript:v16];
      uint64_t v18 = [v4 objectForKeyedSubscript:v17];

      if (!v18) {
        goto LABEL_7;
      }
      [v12 setObject:v18 atIndexedSubscript:v16];
    }
    while (v6 != ++v16);
  }
  id v15 = v12;
LABEL_13:

  return v15;
}

+ (id)modelFeatures
{
  id v3 = +[_PSConfig contactEmbeddingConfig];
  id v4 = [v3 objectForKeyedSubscript:@"_PSContactEmbeddingFeatures"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = +[_PSLogging contactEmbeddingChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[_PSContactEmbeddingUtilities modelFeatures](v7);
    }

    id v6 = [a1 modelFeaturesBackup];
  }
  v8 = v6;

  return v8;
}

+ (id)modelFeaturesBackup
{
  return &unk_1EF675FD8;
}

+ (void)loadModelFromUrlResource:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 absoluteString];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A314B000, a3, OS_LOG_TYPE_ERROR, "Error loading compiled CoreML Model from path %@ : %@", (uint8_t *)&v6, 0x16u);
}

+ (void)prepareFeatureInputFromFeatureDict:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Error while creating input MultiArray : %@", (uint8_t *)&v2, 0xCu);
}

+ (void)modelFeatures
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "Error while trying to fetch ordered features from plist.", v1, 2u);
}

@end