@interface Settings
@end

@implementation Settings

uint64_t __nanophotos_log_Settings_block_invoke()
{
  qword_267EA4BE0 = (uint64_t)os_log_create("com.apple.NanoPhotos", "Settings");
  return MEMORY[0x270F9A758]();
}

@end