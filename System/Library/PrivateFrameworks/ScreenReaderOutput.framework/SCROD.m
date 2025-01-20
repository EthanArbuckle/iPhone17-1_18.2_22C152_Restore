@interface SCROD
@end

@implementation SCROD

uint64_t ___SCROD_LOG_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Accessibility", "ScreenReaderOutput");
  _SCROD_LOG_log = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0);
}

uint64_t ___SCROD_BRAILLE_LOG_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Accessibility", "ScreenReaderOutput.Braille");
  _SCROD_BRAILLE_LOG_log = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0);
}

@end