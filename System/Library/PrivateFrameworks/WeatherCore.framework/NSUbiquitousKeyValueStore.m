@interface NSUbiquitousKeyValueStore
@end

@implementation NSUbiquitousKeyValueStore

uint64_t __59__NSUbiquitousKeyValueStore_WeatherCore__wc_sharedInstance__block_invoke()
{
  wc_sharedInstance_sSharedInstance = [objc_alloc(MEMORY[0x1E4F29130]) _initWithStoreIdentifier:@"com.apple.weather" usingEndToEndEncryption:1];
  return MEMORY[0x1F41817F8]();
}

@end