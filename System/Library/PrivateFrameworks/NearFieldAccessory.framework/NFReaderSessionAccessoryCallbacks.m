@interface NFReaderSessionAccessoryCallbacks
+ (id)interface;
@end

@implementation NFReaderSessionAccessoryCallbacks

+ (id)interface
{
  self;
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D056BC0];
  id v1 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v1, "initWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_didDetectTags_ argumentIndex:0 ofReply:0];

  return v0;
}

@end