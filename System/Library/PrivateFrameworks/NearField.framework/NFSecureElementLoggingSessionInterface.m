@interface NFSecureElementLoggingSessionInterface
+ (id)interface;
@end

@implementation NFSecureElementLoggingSessionInterface

+ (id)interface
{
  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v16, "initWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46960];
  v14 = [v12 setByAddingObject:objc_opt_class()];
  [v13 setClasses:v14 forSelector:sel_getLogs_forSEID_completion_ argumentIndex:0 ofReply:1];

  return v13;
}

@end