@interface TransparencyIDSSupportInterface
+ (id)interface;
@end

@implementation TransparencyIDSSupportInterface

+ (id)interface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DA1F5C8];
}

@end