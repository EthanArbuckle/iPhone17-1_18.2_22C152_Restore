@interface NFContactlessSessionCallbacks
+ (id)interface;
@end

@implementation NFContactlessSessionCallbacks

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF37D20];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_didDetectFieldNotification_ argumentIndex:0 ofReply:0];

  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v15 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v16, "initWithObjects:", v15, v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  [v2 setClasses:v13 forSelector:sel_didFelicaStateChange_ argumentIndex:0 ofReply:0];

  return v2;
}

@end