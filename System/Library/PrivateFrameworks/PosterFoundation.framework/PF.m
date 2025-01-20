@interface PF
@end

@implementation PF

void __PF_IS_PAD_DEVICE_block_invoke()
{
  id v0 = [MEMORY[0x263F29CA0] sharedInstance];
  PF_IS_PAD_DEVICE_isPad = [v0 deviceClass] == 2;
}

@end