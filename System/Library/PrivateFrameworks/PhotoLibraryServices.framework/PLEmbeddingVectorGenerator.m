@interface PLEmbeddingVectorGenerator
+ (id)CLIPEmbeddingVectorForAsset:(id)a3 error:(id *)a4;
+ (id)_TextCLIPEmbeddingVectorForString:(id)a3 error:(id *)a4;
- (id)embeddingVectorForString:(id)a3 embeddingType:(unint64_t)a4 error:(id *)a5;
@end

@implementation PLEmbeddingVectorGenerator

+ (id)CLIPEmbeddingVectorForAsset:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PLEmbeddingVectorGenerator.m", 59, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  v8 = [v7 additionalAttributes];
  v9 = [v8 sceneprint];

  v10 = [v9 data];
  v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v19 = 0;
  v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v11 fromData:v10 error:&v19];
  id v13 = v19;
  v14 = v13;
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    v16 = +[PLEmbeddingUtilities extractNumericalValuesForScenePrint:v12];
    if (![v16 count])
    {

      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
    if (a4 && v13)
    {
      v16 = 0;
      *a4 = v13;
    }
  }

  return v16;
}

+ (id)_TextCLIPEmbeddingVectorForString:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_alloc_init(CLIPInferenceEngine);
  v6 = [(CLIPInferenceEngine *)v5 encodeQuery:v4];

  if ([v6 count])
  {
    id v7 = +[PLEmbeddingUtilities padVector:v6 withZeroesForVectorWithNumberOfDimensions:768];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)embeddingVectorForString:(id)a3 embeddingType:(unint64_t)a4 error:(id *)a5
{
  if (a4)
  {
    v5 = 0;
  }
  else
  {
    id v7 = a3;
    v5 = [(id)objc_opt_class() _TextCLIPEmbeddingVectorForString:v7 error:a5];
  }
  return v5;
}

@end