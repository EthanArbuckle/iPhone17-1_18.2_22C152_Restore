@interface TIKeyboardFeatureSpecialization_en_JP
- (BOOL)shouldConvertAutocorrectionCandidatesToFullWidth;
@end

@implementation TIKeyboardFeatureSpecialization_en_JP

- (BOOL)shouldConvertAutocorrectionCandidatesToFullWidth
{
  return 1;
}

@end