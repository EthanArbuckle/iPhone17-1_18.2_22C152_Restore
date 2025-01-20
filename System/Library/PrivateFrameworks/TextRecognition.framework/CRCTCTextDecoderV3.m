@interface CRCTCTextDecoderV3
+ (id)lmSupportedLanguages;
- (CVNLPTextDecodingPruningPolicy)pruningPolicy;
@end

@implementation CRCTCTextDecoderV3

- (CVNLPTextDecodingPruningPolicy)pruningPolicy
{
  *(_OWORD *)&retstr->var0 = xmmword_1DD8CE648;
  *(void *)&retstr->var3 = 10;
  return self;
}

+ (id)lmSupportedLanguages
{
  v10[14] = *MEMORY[0x1E4F143B8];
  v10[0] = @"en-US";
  v10[1] = @"fr-FR";
  v10[2] = @"it-IT";
  v10[3] = @"de-DE";
  v10[4] = @"es-ES";
  v10[5] = @"pt-BR";
  v10[6] = @"ru-RU";
  v10[7] = @"uk-UA";
  v10[8] = @"ko-KR";
  v10[9] = @"ja-JP";
  v10[10] = @"th-TH";
  v10[11] = @"vi-VT";
  v10[12] = @"ar-SA";
  v10[13] = @"ars-SA";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:14];
  if (_os_feature_enabled_impl())
  {
    v9[0] = @"tr-TR";
    v9[1] = @"id-ID";
    v9[2] = @"cs-CZ";
    v9[3] = @"da-DK";
    v9[4] = @"nl-NL";
    v9[5] = @"no-NO";
    v9[6] = @"nn-NO";
    v9[7] = @"nb-NO";
    v9[8] = @"ms-MY";
    v9[9] = @"pl-PL";
    v9[10] = @"ro-RO";
    v9[11] = @"sv-SE";
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:12];
    uint64_t v4 = [v2 arrayByAddingObjectsFromArray:v3];

    v2 = (void *)v4;
  }
  if (_os_feature_enabled_impl())
  {
    v8[0] = @"zh-Hans";
    v8[1] = @"zh-Hant";
    v8[2] = @"yue-Hans";
    v8[3] = @"yue-Hant";
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
    uint64_t v6 = [v2 arrayByAddingObjectsFromArray:v5];

    v2 = (void *)v6;
  }
  return v2;
}

@end