@interface NFPrivateServiceInterface
+ (id)interface;
@end

@implementation NFPrivateServiceInterface

+ (id)interface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270653D70];
}

@end