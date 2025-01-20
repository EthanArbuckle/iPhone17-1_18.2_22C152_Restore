@interface SFCustomUserAgentStringIfNeeded
@end

@implementation SFCustomUserAgentStringIfNeeded

void ___SFCustomUserAgentStringIfNeeded_block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v1 = [v0 stringForKey:@"UserAgent"];

  v2 = (void *)_SFCustomUserAgentStringIfNeeded::customUserAgentString;
  _SFCustomUserAgentStringIfNeeded::customUserAgentString = v1;
}

@end