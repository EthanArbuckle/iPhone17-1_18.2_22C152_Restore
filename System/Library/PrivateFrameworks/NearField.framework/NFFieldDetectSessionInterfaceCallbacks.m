@interface NFFieldDetectSessionInterfaceCallbacks
+ (id)interface;
@end

@implementation NFFieldDetectSessionInterfaceCallbacks

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF3ADE0];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_didDetectFieldNotification_ argumentIndex:0 ofReply:0];

  return v2;
}

@end