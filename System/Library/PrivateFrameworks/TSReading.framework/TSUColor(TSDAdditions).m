@interface TSUColor(TSDAdditions)
+ (uint64_t)highContrastBackgroundColorForPreset:()TSDAdditions;
@end

@implementation TSUColor(TSDAdditions)

+ (uint64_t)highContrastBackgroundColorForPreset:()TSDAdditions
{
  return [MEMORY[0x263F7C808] colorWithWhite:0.5 alpha:1.0];
}

@end