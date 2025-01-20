@interface NSString(SXAXAdditions)
- (id)sxaxAttributedStringWithLowPitchPrefix:()SXAXAdditions;
- (uint64_t)sxaxLowPitchAttributedString;
@end

@implementation NSString(SXAXAdditions)

- (uint64_t)sxaxLowPitchAttributedString
{
  return [MEMORY[0x263F086A0] sxaxAttributedStringForSpeakingStringInLowerPitch:a1];
}

- (id)sxaxAttributedStringWithLowPitchPrefix:()SXAXAdditions
{
  v11[2] = *MEMORY[0x263EF8340];
  v11[0] = a3;
  v11[1] = a1;
  v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:v11 count:2];
  v6 = [v5 componentsJoinedByString:@", "];

  v7 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6];
  uint64_t v8 = [v4 length];

  objc_msgSend(v7, "sxaxApplyLowerPitchTokenToRange:", 0, v8);
  v9 = (void *)[v7 copy];

  return v9;
}

@end