@interface NFCredentialSessionCallbackInterface
+ (id)interface;
@end

@implementation NFCredentialSessionCallbackInterface

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF3D188];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_didExpireTransactionForApplet_ argumentIndex:0 ofReply:0];

  return v2;
}

@end