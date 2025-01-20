@interface TPSSearchQueryXPCInterfaceBuilder
+ (id)searchQueryServerInterface;
+ (void)configure:(id)a3;
@end

@implementation TPSSearchQueryXPCInterfaceBuilder

+ (void)configure:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_performQuery_completion_ argumentIndex:0 ofReply:0];
  [v4 setClasses:v8 forSelector:sel_performQuery_completion_ argumentIndex:0 ofReply:1];
}

+ (id)searchQueryServerInterface
{
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEDAD0B8];
  [a1 configure:v3];
  return v3;
}

@end