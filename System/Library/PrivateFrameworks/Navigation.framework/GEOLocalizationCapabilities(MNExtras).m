@interface GEOLocalizationCapabilities(MNExtras)
+ (id)supportedPhoneticTypesForPhoneticLocaleID:()MNExtras;
@end

@implementation GEOLocalizationCapabilities(MNExtras)

+ (id)supportedPhoneticTypesForPhoneticLocaleID:()MNExtras
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if ([v3 isEqualToString:@"fr-FR"]) {
    [v4 addObject:&unk_1F0E34DE8];
  }
  if ([v3 isEqualToString:@"en-IN"]) {
    v5 = &unk_1F0E34DE8;
  }
  else {
    v5 = &unk_1F0E34E00;
  }
  [v4 addObject:v5];
  [v4 addObject:&unk_1F0E34E18];

  return v4;
}

@end