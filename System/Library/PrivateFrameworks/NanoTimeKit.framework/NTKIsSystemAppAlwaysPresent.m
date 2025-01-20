@interface NTKIsSystemAppAlwaysPresent
@end

@implementation NTKIsSystemAppAlwaysPresent

void ___NTKIsSystemAppAlwaysPresent_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F16E9B20];
  v1 = (void *)_NTKIsSystemAppAlwaysPresent___alwaysPresentAppBundleIdentifiers;
  _NTKIsSystemAppAlwaysPresent___alwaysPresentAppBundleIdentifiers = v0;
}

@end