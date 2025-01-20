@interface NSRunLoop(WebPrivacy)
- (void)_wp_runUntil:()WebPrivacy;
@end

@implementation NSRunLoop(WebPrivacy)

- (void)_wp_runUntil:()WebPrivacy
{
  uint64_t v5 = *MEMORY[0x263EFF478];
  do
  {
    v6 = [MEMORY[0x263EFF910] distantPast];
    char v7 = [a1 runMode:v5 beforeDate:v6];

    if (*a3) {
      char v8 = 0;
    }
    else {
      char v8 = v7;
    }
  }
  while ((v8 & 1) != 0);
}

@end