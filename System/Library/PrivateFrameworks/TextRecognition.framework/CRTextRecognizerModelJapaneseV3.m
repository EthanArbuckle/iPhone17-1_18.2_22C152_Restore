@interface CRTextRecognizerModelJapaneseV3
+ (id)defaultModelFileName;
- (BOOL)supportCharacterBoxes;
- (TextBoxesOffsets)characterBoxesOffsets;
@end

@implementation CRTextRecognizerModelJapaneseV3

+ (id)defaultModelFileName
{
  return @"cr_tr_model_japanese_v3.mlmodelc";
}

- (BOOL)supportCharacterBoxes
{
  return 1;
}

- (TextBoxesOffsets)characterBoxesOffsets
{
  v6.receiver = self;
  v6.super_class = (Class)CRTextRecognizerModelJapaneseV3;
  [(CRTextSequenceRecognizerModel *)&v6 characterBoxesOffsets];
  double v5 = -1.7;
  result.var3 = v4;
  result.var2 = v3;
  result.var1 = v2;
  result.var0 = v5;
  return result;
}

@end