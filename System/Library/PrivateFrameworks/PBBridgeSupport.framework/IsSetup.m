@interface IsSetup
@end

@implementation IsSetup

void ___IsSetup_block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v1 bundleIdentifier];
  _IsSetup___isSetup = [v0 isEqualToString:@"com.apple.nanobuddy"];
}

@end