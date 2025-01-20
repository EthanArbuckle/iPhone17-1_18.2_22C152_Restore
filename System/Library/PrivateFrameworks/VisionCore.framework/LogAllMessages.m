@interface LogAllMessages
@end

@implementation LogAllMessages

void ___LogAllMessages_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v0 addSuiteNamed:@"com.apple.VisionCore"];
  _LogAllMessages__logAllMessages = [v0 BOOLForKey:@"VISIONCORE_LOG_ALL_MESSAGES"];
}

@end