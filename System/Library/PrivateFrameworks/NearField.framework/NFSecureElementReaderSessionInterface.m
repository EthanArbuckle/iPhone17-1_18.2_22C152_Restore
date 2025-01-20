@interface NFSecureElementReaderSessionInterface
+ (id)interface;
+ (void)_configureInterface:(id)a3;
@end

@implementation NFSecureElementReaderSessionInterface

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46DE0];
  +[NFSecureElementReaderSessionInterface _configureInterface:v2];
  return v2;
}

+ (void)_configureInterface:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v15 = (id)objc_msgSend([v3 alloc], "initWithObjects:", objc_opt_class(), 0);
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  [v4 setClasses:v7 forSelector:sel_selectApplets_completion_ argumentIndex:0 ofReply:0];

  [v4 setClasses:v15 forSelector:sel_connect_completion_ argumentIndex:0 ofReply:0];
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v8, "initWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
  [v4 setClasses:v14 forSelector:sel_performVAS_select_completion_ argumentIndex:0 ofReply:0];
  [v4 setClasses:v14 forSelector:sel_performVAS_select_completion_ argumentIndex:1 ofReply:1];
}

@end