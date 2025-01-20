@interface NFECommercePaymentSessionInterface
+ (id)interface;
@end

@implementation NFECommercePaymentSessionInterface

+ (id)interface
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46780];
  [v6 setClasses:v5 forSelector:sel_getAppletsWithCompletion_ argumentIndex:0 ofReply:1];

  return v6;
}

@end