@interface TVRCRapportLog
@end

@implementation TVRCRapportLog

uint64_t ___TVRCRapportLog_block_invoke()
{
  _TVRCRapportLog_log = (uint64_t)os_log_create("com.apple.TVRemoteCore", "Rapport");

  return MEMORY[0x270F9A758]();
}

@end