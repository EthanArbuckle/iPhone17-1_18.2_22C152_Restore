@interface NSAttributedString(ICAXAdditions)
+ (id)icaxAttributedStringForSpeakingStringInLowerPitch:()ICAXAdditions;
@end

@implementation NSAttributedString(ICAXAdditions)

+ (id)icaxAttributedStringForSpeakingStringInLowerPitch:()ICAXAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F28B18];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v9 = *MEMORY[0x1E4F48A48];
  v10[0] = MEMORY[0x1E4F1CC38];
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = (void *)[v5 initWithString:v4 attributes:v6];

  return v7;
}

@end