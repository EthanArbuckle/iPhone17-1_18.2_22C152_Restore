@interface CRTextRecognizerModelKoreanV3
+ (id)defaultModelFileName;
- (TextBoxesOffsets)characterBoxesOffsets;
- (TextBoxesOffsets)wordBoxesOffsets;
@end

@implementation CRTextRecognizerModelKoreanV3

+ (id)defaultModelFileName
{
  return @"cr_tr_model_korean_v3.mlmodelc";
}

- (TextBoxesOffsets)characterBoxesOffsets
{
  v6.receiver = self;
  v6.super_class = (Class)CRTextRecognizerModelKoreanV3;
  [(CRTextSequenceRecognizerModel *)&v6 characterBoxesOffsets];
  double v5 = -1.0;
  result.var3 = v4;
  result.var2 = v3;
  result.var1 = v2;
  result.var0 = v5;
  return result;
}

- (TextBoxesOffsets)wordBoxesOffsets
{
  v6.receiver = self;
  v6.super_class = (Class)CRTextRecognizerModelKoreanV3;
  [(CRTextSequenceRecognizerModel *)&v6 characterBoxesOffsets];
  double v5 = -3.0;
  result.var3 = v4;
  result.var2 = v3;
  result.var1 = v2;
  result.var0 = v5;
  return result;
}

@end