@interface SESDCKSessionInterface
+ (id)interface;
@end

@implementation SESDCKSessionInterface

+ (id)interface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C577108];
}

@end