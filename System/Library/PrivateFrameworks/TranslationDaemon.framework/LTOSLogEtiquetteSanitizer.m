@interface LTOSLogEtiquetteSanitizer
@end

@implementation LTOSLogEtiquetteSanitizer

uint64_t ___LTOSLogEtiquetteSanitizer_block_invoke()
{
  _LTOSLogEtiquetteSanitizer_log = (uint64_t)os_log_create("com.apple.Translation", "EtiquetteSanitizer");
  return MEMORY[0x270F9A758]();
}

@end