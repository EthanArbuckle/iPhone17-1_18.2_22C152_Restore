@interface PISensitiveContentAnalysisResult
@end

@implementation PISensitiveContentAnalysisResult

void __48___PISensitiveContentAnalysisResult_description__block_invoke(uint64_t a1, void *a2, double a3)
{
  gotLoadHelper_x8__OBJC_CLASS___SCMLImageLabelCoder(a3);
  v6 = *(void **)(v5 + 1568);
  id v8 = v7;
  id v13 = a2;
  v9 = [v6 instance];
  v10 = [v9 decodeFromP1:v13];
  if (v10) {
    v11 = v10;
  }
  else {
    v11 = v13;
  }
  id v12 = v11;

  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v12];
}

uint64_t __48___PISensitiveContentAnalysisResult_description__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end