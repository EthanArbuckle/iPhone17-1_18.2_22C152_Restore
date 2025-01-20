@interface VGLogSharedInstance
@end

@implementation VGLogSharedInstance

uint64_t ____VGLogSharedInstance_block_invoke()
{
  objc_msgSend(MEMORY[0x263F086E0], "vg_bundleIdentifier");
  id v0 = objc_claimAutoreleasedReturnValue();
  v1 = (const char *)[v0 UTF8String];

  sharedInstance = (uint64_t)os_log_create(v1, "Visage");

  return MEMORY[0x270F9A758]();
}

@end