@interface XPCInterface
+ (id)interface;
@end

@implementation XPCInterface

+ (id)interface
{
  v2 = self;
  id v3 = objc_msgSend(v2, sel_interfaceWithProtocol_, &unk_26DF910F8);
  id v4 = objc_msgSend(v2, sel_interfaceWithProtocol_, &unk_26DF91098);
  objc_msgSend(v3, sel_setInterface_forSelector_argumentIndex_ofReply_, v4, sel_runWithClient_, 0, 0);

  return v3;
}

@end