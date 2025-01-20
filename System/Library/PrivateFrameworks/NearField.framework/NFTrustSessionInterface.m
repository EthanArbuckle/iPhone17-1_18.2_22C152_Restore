@interface NFTrustSessionInterface
+ (id)interface;
@end

@implementation NFTrustSessionInterface

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46540];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_listKeysWithCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

@end