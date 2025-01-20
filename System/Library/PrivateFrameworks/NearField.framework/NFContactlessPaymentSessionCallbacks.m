@interface NFContactlessPaymentSessionCallbacks
+ (id)interface;
@end

@implementation NFContactlessPaymentSessionCallbacks

+ (id)interface
{
  self;
  v25 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF37EA8];
  id v23 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v21 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v23, "initWithObjects:", v21, v0, v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [v25 setClasses:v9 forSelector:sel_didPerformValueAddedServiceTransactions_ argumentIndex:0 ofReply:0];
  id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v22 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v24, "initWithObjects:", v22, v10, v11, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
  [v25 setClasses:v19 forSelector:sel_didFelicaStateChange_ argumentIndex:0 ofReply:0];

  return v25;
}

@end