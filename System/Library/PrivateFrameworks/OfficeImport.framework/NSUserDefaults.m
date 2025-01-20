@interface NSUserDefaults
@end

@implementation NSUserDefaults

uint64_t __67__NSUserDefaults_NSUserDefaults_TSUAdditions__tsu_registerDefaults__block_invoke()
{
  v0 = SFUBundle();
  uint64_t v6 = [v0 URLForResource:@"Defaults" withExtension:@"plist"];

  if (v6)
  {
    v2 = objc_msgSend(NSDictionary, "dictionaryWithContentsOfURL:");
    v3 = v2;
    if (v2 && [v2 count])
    {
      v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v4 registerDefaults:v3];
    }
  }
  return MEMORY[0x270F9A790](v1);
}

@end