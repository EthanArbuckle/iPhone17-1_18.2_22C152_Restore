@interface TIKeyboardFeatureSpecialization_es_419
- (id)dictionaryInputMode;
@end

@implementation TIKeyboardFeatureSpecialization_es_419

- (id)dictionaryInputMode
{
  v3 = (void *)MEMORY[0x263F7EA88];
  v4 = [NSString stringWithUTF8String:"es_MX"];
  v5 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  uint64_t v6 = [v5 isSiriMode];
  v7 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  v8 = [v7 originalIdentifier];
  v9 = [v3 inputModeWithIdentifier:v4 isSiriMode:v6 originalIdentifier:v8];

  return v9;
}

@end