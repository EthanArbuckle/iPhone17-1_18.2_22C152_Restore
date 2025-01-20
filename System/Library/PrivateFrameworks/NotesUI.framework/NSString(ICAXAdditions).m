@interface NSString(ICAXAdditions)
- (id)icaxAttributedStringWithLowPitchPrefix:()ICAXAdditions;
- (uint64_t)icaxLowPitchAttributedString;
@end

@implementation NSString(ICAXAdditions)

- (uint64_t)icaxLowPitchAttributedString
{
  return [MEMORY[0x1E4F28B18] icaxAttributedStringForSpeakingStringInLowerPitch:a1];
}

- (id)icaxAttributedStringWithLowPitchPrefix:()ICAXAdditions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v11[0] = a3;
  v11[1] = a1;
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:v11 count:2];
  v6 = [v5 componentsJoinedByString:@", "];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v6];
  uint64_t v8 = [v4 length];

  objc_msgSend(v7, "icaxApplyLowerPitchTokenToRange:", 0, v8);
  v9 = (void *)[v7 copy];

  return v9;
}

@end