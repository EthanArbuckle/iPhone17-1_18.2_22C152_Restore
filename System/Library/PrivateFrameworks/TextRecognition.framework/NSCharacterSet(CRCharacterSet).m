@interface NSCharacterSet(CRCharacterSet)
+ (id)_crArabicCombiningDiacriticCharacterSet;
+ (id)_crArabicDiacriticCharacterSet;
+ (id)_crArabicDigitCharacterSet;
+ (id)_crArabicTanweenDiacriticCharacterSet;
+ (id)_crBasicArabicCharacterSet;
+ (id)_crBiDiMirroredCharacterSet;
+ (id)_crJapaneseKoreanAsUnknownScriptCharacterSet;
+ (id)_crUnknownScriptCharacterSet;
@end

@implementation NSCharacterSet(CRCharacterSet)

+ (id)_crUnknownScriptCharacterSet
{
  if (qword_1EB58C9F8 != -1) {
    dispatch_once(&qword_1EB58C9F8, &__block_literal_global_72);
  }
  v0 = (void *)qword_1EB58CA00;
  return v0;
}

+ (id)_crJapaneseKoreanAsUnknownScriptCharacterSet
{
  if (qword_1EB58CA08 != -1) {
    dispatch_once(&qword_1EB58CA08, &__block_literal_global_76);
  }
  v0 = (void *)qword_1EB58CA10;
  return v0;
}

+ (id)_crBiDiMirroredCharacterSet
{
  if (qword_1EB58CA18 != -1) {
    dispatch_once(&qword_1EB58CA18, &__block_literal_global_78);
  }
  v0 = (void *)qword_1EB58CA20;
  return v0;
}

+ (id)_crBasicArabicCharacterSet
{
  if (qword_1EB58CA28 != -1) {
    dispatch_once(&qword_1EB58CA28, &__block_literal_global_83);
  }
  v0 = (void *)qword_1EB58CA30;
  return v0;
}

+ (id)_crArabicDigitCharacterSet
{
  if (qword_1EB58CA38 != -1) {
    dispatch_once(&qword_1EB58CA38, &__block_literal_global_203);
  }
  v0 = (void *)qword_1EB58CA40;
  return v0;
}

+ (id)_crArabicDiacriticCharacterSet
{
  if (qword_1EB58CA48 != -1) {
    dispatch_once(&qword_1EB58CA48, &__block_literal_global_208);
  }
  v0 = (void *)qword_1EB58CA50;
  return v0;
}

+ (id)_crArabicTanweenDiacriticCharacterSet
{
  if (qword_1EB58CA58 != -1) {
    dispatch_once(&qword_1EB58CA58, &__block_literal_global_237);
  }
  v0 = (void *)qword_1EB58CA60;
  return v0;
}

+ (id)_crArabicCombiningDiacriticCharacterSet
{
  if (qword_1EB58CA68 != -1) {
    dispatch_once(&qword_1EB58CA68, &__block_literal_global_242);
  }
  v0 = (void *)qword_1EB58CA70;
  return v0;
}

@end