@interface CRTextRecognizerModelArabicV3
+ (id)defaultModelFileName;
- (TextBoxesOffsets)wordBoxesOffsets;
@end

@implementation CRTextRecognizerModelArabicV3

+ (id)defaultModelFileName
{
  return @"cr_tr_model_arabic_v3.mlmodelc";
}

- (TextBoxesOffsets)wordBoxesOffsets
{
  v11.receiver = self;
  v11.super_class = (Class)CRTextRecognizerModelArabicV3;
  [(CRTextSequenceRecognizerModel *)&v11 wordBoxesOffsets];
  double v3 = v2;
  double v5 = v4;
  double v7 = -v6;
  double v9 = -v8;
  double v10 = v3;
  result.var3 = v10;
  result.var2 = v5;
  result.var1 = v9;
  result.var0 = v7;
  return result;
}

@end