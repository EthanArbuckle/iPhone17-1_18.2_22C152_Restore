@interface CRTextRecognizerModelLatinCyrillicV3
+ (id)defaultModelFileName;
- (TextBoxesOffsets)wordBoxesOffsets;
@end

@implementation CRTextRecognizerModelLatinCyrillicV3

+ (id)defaultModelFileName
{
  if (_os_feature_enabled_impl())
  {
    v2 = CROSLogForCategory(3);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DD733000, v2, OS_LOG_TYPE_ERROR, "Extended latin model is not present, using existing latincyrillic model", v4, 2u);
    }
  }
  return @"cr_tr_model_latincyrillic_v3.mlmodelc";
}

- (TextBoxesOffsets)wordBoxesOffsets
{
  v6.receiver = self;
  v6.super_class = (Class)CRTextRecognizerModelLatinCyrillicV3;
  [(CRTextSequenceRecognizerModel *)&v6 characterBoxesOffsets];
  double v5 = -1.0;
  result.var3 = v4;
  result.var2 = v3;
  result.var1 = v2;
  result.var0 = v5;
  return result;
}

@end