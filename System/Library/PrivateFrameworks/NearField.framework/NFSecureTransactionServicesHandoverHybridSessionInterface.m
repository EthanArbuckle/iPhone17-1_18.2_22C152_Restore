@interface NFSecureTransactionServicesHandoverHybridSessionInterface
+ (id)interface;
- (NFSecureTransactionServicesHandoverHybridSessionInterface)initWithProtocol:(id)a3;
- (void)setupInterface;
@end

@implementation NFSecureTransactionServicesHandoverHybridSessionInterface

+ (id)interface
{
  if (qword_1EB4D2020 != -1) {
    dispatch_once(&qword_1EB4D2020, &__block_literal_global_7);
  }
  v2 = (void *)_MergedGlobals_19;
  return v2;
}

void __70__NFSecureTransactionServicesHandoverHybridSessionInterface_interface__block_invoke()
{
  v7 = [[NFSecureTransactionServicesHandoverHybridSessionInterface alloc] initWithProtocol:&unk_1EEF469C0];
  uint64_t v0 = [(NFSecureTransactionServicesHandoverBaseSessionInterface *)v7 protocolInterface];
  v1 = (void *)_MergedGlobals_19;
  _MergedGlobals_19 = v0;

  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [(id)_MergedGlobals_19 setClasses:v5 forSelector:sel_getAppletsWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)_MergedGlobals_19 setClasses:v6 forSelector:sel_getAppletsWithCompletion_ argumentIndex:1 ofReply:1];
  [(id)_MergedGlobals_19 setClasses:v6 forSelector:sel_setActivePaymentApplet_keys_authorization_completion_ argumentIndex:0 ofReply:0];
  [(id)_MergedGlobals_19 setClasses:v6 forSelector:sel_setActivePaymentApplet_keys_authorization_completion_ argumentIndex:0 ofReply:1];
}

- (NFSecureTransactionServicesHandoverHybridSessionInterface)initWithProtocol:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionInterface;
  return [(NFSecureTransactionServicesHandoverBaseSessionInterface *)&v4 initWithProtocol:a3];
}

- (void)setupInterface
{
  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionInterface;
  [(NFSecureTransactionServicesHandoverBaseSessionInterface *)&v4 setupInterface];
  uint64_t v3 = [(NFSecureTransactionServicesHandoverBaseSessionInterface *)self protocolInterface];
  SetNFTNEPProtocolConformance(v3);
}

@end