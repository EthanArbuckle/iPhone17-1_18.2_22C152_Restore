@interface NFCredentialSessionInterface
+ (id)interface;
@end

@implementation NFCredentialSessionInterface

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46F00];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_requestApplets_selectOnStart_AIDAllowList_externalAuth_mode_completion_ argumentIndex:0 ofReply:0];
  v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_requestApplets_selectOnStart_AIDAllowList_externalAuth_mode_completion_ argumentIndex:1 ofReply:0];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_requestApplets_selectOnStart_AIDAllowList_externalAuth_mode_completion_ argumentIndex:2 ofReply:0];

  [v2 setClasses:v5 forSelector:sel_deleteApplets_completion_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v5 forSelector:sel_listAppletsAndRefreshCache_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

@end