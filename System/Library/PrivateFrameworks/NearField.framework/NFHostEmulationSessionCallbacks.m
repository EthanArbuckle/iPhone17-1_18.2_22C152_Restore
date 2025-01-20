@interface NFHostEmulationSessionCallbacks
+ (id)interface;
@end

@implementation NFHostEmulationSessionCallbacks

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF3CB18];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "initWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_didReceiveField_ argumentIndex:0 ofReply:0];

  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
  [v2 setClasses:v10 forSelector:sel_suspensionStateUpdate_triggeredByField_ argumentIndex:1 ofReply:0];

  return v2;
}

@end