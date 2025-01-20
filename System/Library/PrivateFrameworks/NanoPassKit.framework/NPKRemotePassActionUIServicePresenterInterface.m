@interface NPKRemotePassActionUIServicePresenterInterface
+ (id)interface;
@end

@implementation NPKRemotePassActionUIServicePresenterInterface

+ (id)interface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D09F978];
  v3 = (void *)MEMORY[0x263EFFA08];
  v4 = self;
  v5 = [v3 setWithObject:v4];
  [v2 setClasses:v5 forSelector:sel_deactivateWithError_ argumentIndex:0 ofReply:0];

  return v2;
}

@end