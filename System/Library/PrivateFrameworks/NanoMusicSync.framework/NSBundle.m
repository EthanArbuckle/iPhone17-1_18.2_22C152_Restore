@interface NSBundle
@end

@implementation NSBundle

uint64_t __45__NSBundle_NMSAdditions__nanoMusicSyncBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMusicSync"];
  uint64_t v1 = nanoMusicSyncBundle___nanoMusicSyncBundle;
  nanoMusicSyncBundle___nanoMusicSyncBundle = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end