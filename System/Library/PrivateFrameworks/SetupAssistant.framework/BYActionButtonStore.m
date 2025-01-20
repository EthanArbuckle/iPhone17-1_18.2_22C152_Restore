@interface BYActionButtonStore
+ (id)currentData;
+ (void)setCurrentData:(id)a3;
@end

@implementation BYActionButtonStore

+ (id)currentData
{
  v2 = (void *)CFPreferencesCopyValue(@"SBSystemActionConfiguredActionArchive", @"com.apple.springboard", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  return v2;
}

+ (void)setCurrentData:(id)a3
{
}

@end