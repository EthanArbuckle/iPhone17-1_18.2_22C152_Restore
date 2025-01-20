@interface SESACWGSessionInterface
+ (id)interface;
@end

@implementation SESACWGSessionInterface

+ (id)interface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C576F28];
}

@end