@interface CRTextRecognizerModelThaiV3
+ (id)defaultModelFileName;
- (BOOL)supportCharacterBoxes;
- (TextBoxesOffsets)characterBoxesOffsets;
- (TextBoxesOffsets)wordBoxesOffsets;
@end

@implementation CRTextRecognizerModelThaiV3

+ (id)defaultModelFileName
{
  return @"cr_tr_model_thai_v3.mlmodelc";
}

- (BOOL)supportCharacterBoxes
{
  return 1;
}

- (TextBoxesOffsets)characterBoxesOffsets
{
  v6.receiver = self;
  v6.super_class = (Class)CRTextRecognizerModelThaiV3;
  [(CRTextSequenceRecognizerModel *)&v6 characterBoxesOffsets];
  double v5 = -0.5;
  result.var3 = v4;
  result.var2 = v3;
  result.var1 = v2;
  result.var0 = v5;
  return result;
}

- (TextBoxesOffsets)wordBoxesOffsets
{
  v6.receiver = self;
  v6.super_class = (Class)CRTextRecognizerModelThaiV3;
  [(CRTextSequenceRecognizerModel *)&v6 characterBoxesOffsets];
  double v5 = -2.0;
  result.var3 = v4;
  result.var2 = v3;
  result.var1 = v2;
  result.var0 = v5;
  return result;
}

@end