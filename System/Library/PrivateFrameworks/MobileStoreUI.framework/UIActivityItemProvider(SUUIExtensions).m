@interface UIActivityItemProvider(SUUIExtensions)
+ (uint64_t)activityTypeShouldProvideImage:()SUUIExtensions;
@end

@implementation UIActivityItemProvider(SUUIExtensions)

+ (uint64_t)activityTypeShouldProvideImage:()SUUIExtensions
{
  uint64_t v3 = *MEMORY[0x263F1CFA0];
  id v4 = a3;
  LODWORD(v3) = [v4 isEqualToString:v3];
  int v5 = v3 | [v4 isEqualToString:*MEMORY[0x263F1CFB0]];
  LODWORD(v3) = [v4 isEqualToString:*MEMORY[0x263F1CFC8]];
  int v6 = v5 | v3 | [v4 isEqualToString:*MEMORY[0x263F1CFD8]];
  LODWORD(v3) = [v4 isEqualToString:*MEMORY[0x263F1D000]];

  return (v6 | v3) ^ 1;
}

@end