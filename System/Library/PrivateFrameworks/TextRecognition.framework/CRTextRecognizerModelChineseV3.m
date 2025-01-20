@interface CRTextRecognizerModelChineseV3
+ (id)defaultModelFileName;
- (BOOL)supportCharacterBoxes;
@end

@implementation CRTextRecognizerModelChineseV3

+ (id)defaultModelFileName
{
  return @"cr_tr_model_chinese_v3.mlmodelc";
}

- (BOOL)supportCharacterBoxes
{
  return 1;
}

@end