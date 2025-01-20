@interface NFContactlessPaymentSessionInterface
+ (id)interface;
@end

@implementation NFContactlessPaymentSessionInterface

+ (id)interface
{
  self;
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v38 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  id v36 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v36, "initWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v16 = objc_opt_class();
  v37 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v18 = objc_opt_class();
  v34 = objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
  v19 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF431A8];
  [v19 setClasses:v14 forSelector:sel_setActivePaymentApplet_keys_authorization_completion_ argumentIndex:0 ofReply:0];
  [v19 setClasses:v14 forSelector:sel_setActivePaymentApplet_keys_authorization_completion_ argumentIndex:0 ofReply:1];
  [v19 setClasses:v37 forSelector:sel_setActivePaymentApplets_authorization_completion_ argumentIndex:0 ofReply:0];
  [v19 setClasses:v35 forSelector:sel_setActivePaymentApplets_authorization_completion_ argumentIndex:1 ofReply:0];
  v33 = (void *)v14;
  [v19 setClasses:v14 forSelector:sel_setActivePaymentApplets_authorization_completion_ argumentIndex:0 ofReply:1];
  [v19 setClasses:v34 forSelector:sel_setActivePaymentApplets_authorization_completion_ argumentIndex:1 ofReply:1];
  [v19 setClasses:v38 forSelector:sel_getAppletsWithCompletion_ argumentIndex:0 ofReply:1];
  [v19 setClasses:v14 forSelector:sel_getAppletsWithCompletion_ argumentIndex:1 ofReply:1];
  [v19 setClasses:v38 forSelector:sel_getFelicaAppletState_completion_ argumentIndex:0 ofReply:0];
  v32 = (void *)v13;
  [v19 setClasses:v13 forSelector:sel_getFelicaAppletState_completion_ argumentIndex:0 ofReply:1];
  [v19 setClasses:v38 forSelector:sel_getTransitAppletState_completion_ argumentIndex:0 ofReply:0];
  [v19 setClasses:v13 forSelector:sel_getTransitAppletState_completion_ argumentIndex:0 ofReply:1];
  id v31 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  v29 = objc_msgSend(v31, "initWithObjects:", v20, v21, v22, v23, v24, v25, v26, v27, v28, objc_opt_class(), 0);
  [v19 setClasses:v29 forSelector:sel_setHostCards_ argumentIndex:0 ofReply:0];

  return v19;
}

@end