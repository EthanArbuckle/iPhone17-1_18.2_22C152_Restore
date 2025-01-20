@interface LTOSLogVisualTranslation
@end

@implementation LTOSLogVisualTranslation

uint64_t ___LTOSLogVisualTranslation_block_invoke()
{
  _LTOSLogVisualTranslation_log = (uint64_t)os_log_create("com.apple.Translation", "VisualTranslation");
  return MEMORY[0x1F41817F8]();
}

@end