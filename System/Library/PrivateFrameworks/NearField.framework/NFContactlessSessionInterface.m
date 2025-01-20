@interface NFContactlessSessionInterface
+ (id)interface;
@end

@implementation NFContactlessSessionInterface

+ (id)interface
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46900];
  [v7 setClasses:v6 forSelector:sel_setActiveApplet_completion_ argumentIndex:0 ofReply:0];
  [v7 setClasses:v6 forSelector:sel_setActiveApplet_completion_ argumentIndex:0 ofReply:1];
  [v7 setClasses:v5 forSelector:sel_getAppletsWithCompletion_ argumentIndex:0 ofReply:1];
  [v7 setClasses:v6 forSelector:sel_getAppletsWithCompletion_ argumentIndex:1 ofReply:1];

  return v7;
}

@end