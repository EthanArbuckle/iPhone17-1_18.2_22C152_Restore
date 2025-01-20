@interface PDC
@end

@implementation PDC

uint64_t __PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI_block_invoke()
{
  PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI_log = (uint64_t)os_log_create("com.apple.PrivacyDisclosureUI", "PrivacyDisclosureUI");
  return MEMORY[0x270F9A758]();
}

@end