@interface TransparencyAccountsSupportInterface
+ (id)interface;
@end

@implementation TransparencyAccountsSupportInterface

+ (id)interface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DA1F628];
}

@end