@interface NSAttributedString(SXAXAdditions)
+ (id)sxaxAttributedStringForSpeakingStringInLowerPitch:()SXAXAdditions;
@end

@implementation NSAttributedString(SXAXAdditions)

+ (id)sxaxAttributedStringForSpeakingStringInLowerPitch:()SXAXAdditions
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F086A0];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v9 = *MEMORY[0x263F217D8];
  v10[0] = MEMORY[0x263EFFA88];
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = (void *)[v5 initWithString:v4 attributes:v6];

  return v7;
}

@end