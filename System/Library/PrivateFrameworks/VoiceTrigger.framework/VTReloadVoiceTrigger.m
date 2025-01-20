@interface VTReloadVoiceTrigger
@end

@implementation VTReloadVoiceTrigger

uint64_t ___VTReloadVoiceTrigger_block_invoke()
{
  return +[VTUtilities forceReload];
}

@end