@interface TIKeyboardFeatureSpecialization_ja
- (BOOL)shouldConvertAutocorrectionCandidatesToFullWidth;
@end

@implementation TIKeyboardFeatureSpecialization_ja

- (BOOL)shouldConvertAutocorrectionCandidatesToFullWidth
{
  return 1;
}

@end