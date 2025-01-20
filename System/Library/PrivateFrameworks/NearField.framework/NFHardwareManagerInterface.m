@interface NFHardwareManagerInterface
+ (id)interface;
+ (void)updateContactlessInterface:(uint64_t)a1;
+ (void)updateHandoverInterface:(uint64_t)a1;
+ (void)updateReaderInterface:(uint64_t)a1;
+ (void)updateSEMInterface:(uint64_t)a1;
+ (void)updateSeshatInterface:(uint64_t)a1;
@end

@implementation NFHardwareManagerInterface

void __39__NFHardwareManagerInterface_interface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46A20];
  v1 = (void *)_MergedGlobals_20;
  _MergedGlobals_20 = v0;

  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v86 = objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  [(id)_MergedGlobals_20 setClasses:v86 forSelector:sel_checkExpressPassCompatibilityDeprecated_callback_ argumentIndex:0 ofReply:0];
  [(id)_MergedGlobals_20 setClasses:v86 forSelector:sel_checkExpressPassCompatibility_callback_ argumentIndex:0 ofReply:0];
  v11 = (void *)_MergedGlobals_20;
  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  [v11 setClasses:v14 forSelector:sel_secureElementsWithCompletion_ argumentIndex:0 ofReply:1];

  self;
  if (qword_1EB4D2050 != -1) {
    dispatch_once(&qword_1EB4D2050, &__block_literal_global_324);
  }
  id v85 = (id)qword_1EB4D2048;
  [(id)_MergedGlobals_20 setInterface:v85 forSelector:sel_registerForCallbacks_ argumentIndex:0 ofReply:0];
  [(id)_MergedGlobals_20 setInterface:v85 forSelector:sel_unregisterForCallbacks_ argumentIndex:0 ofReply:0];
  v15 = (void *)_MergedGlobals_20;
  v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF367D8];
  [v15 setInterface:v16 forSelector:sel_queueSecureElementManagerSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];

  uint64_t v17 = +[NFContactlessPaymentSessionCallbacks interface]();
  [(id)_MergedGlobals_20 setInterface:v17 forSelector:sel_queueContactlessPaymentSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];
  v83 = (void *)v17;
  [(id)_MergedGlobals_20 setInterface:v17 forSelector:sel_queueLoyaltyAndPaymentSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];
  v84 = +[NFContactlessSessionCallbacks interface];
  objc_msgSend((id)_MergedGlobals_20, "setInterface:forSelector:argumentIndex:ofReply:", v84);
  v18 = (void *)_MergedGlobals_20;
  v19 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF38D48];
  objc_msgSend(v18, "setInterface:forSelector:argumentIndex:ofReply:", v19);

  v20 = (void *)_MergedGlobals_20;
  v21 = +[NFFieldDetectSessionInterfaceCallbacks interface];
  objc_msgSend(v20, "setInterface:forSelector:argumentIndex:ofReply:", v21);

  v22 = (void *)_MergedGlobals_20;
  v23 = +[NFReaderSessionInternalCallbacks interface];
  [v22 setInterface:v23 forSelector:sel_queueReaderSessionInternal_sessionAttribute_completion_ argumentIndex:0 ofReply:0];

  v24 = (void *)_MergedGlobals_20;
  v25 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF3D8D0];
  [v24 setInterface:v25 forSelector:sel_queueSeshatSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];

  v26 = (void *)_MergedGlobals_20;
  v27 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46A80];
  objc_msgSend(v26, "setInterface:forSelector:argumentIndex:ofReply:", v27);

  v28 = (void *)_MergedGlobals_20;
  v29 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46AE0];
  objc_msgSend(v28, "setInterface:forSelector:argumentIndex:ofReply:", v29);

  v30 = (void *)_MergedGlobals_20;
  v31 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF3E250];
  [v30 setInterface:v31 forSelector:sel_queueNdefTagSession_sessionAttribute_data_completion_ argumentIndex:0 ofReply:0];

  v32 = (void *)_MergedGlobals_20;
  v33 = +[NFHostEmulationSessionCallbacks interface];
  objc_msgSend(v32, "setInterface:forSelector:argumentIndex:ofReply:", v33);

  v34 = (void *)_MergedGlobals_20;
  v35 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46B40];
  [v34 setInterface:v35 forSelector:sel_queueSecureElementAndHostEmulationSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];

  v36 = (void *)_MergedGlobals_20;
  v37 = +[NFSecureElementReaderSessionCallbacks interface];
  [v36 setInterface:v37 forSelector:sel_queueSecureElementReaderSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];

  v38 = (void *)_MergedGlobals_20;
  v39 = +[NFSecureTransactionServicesHandoverSessionCallbacksInterface interface];
  [v38 setInterface:v39 forSelector:sel_queueSecureTransactionServicesSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];

  v40 = (void *)_MergedGlobals_20;
  v41 = +[NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface interface];
  [v40 setInterface:v41 forSelector:sel_queueSecureTransactionServicesHybridSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];

  [(id)_MergedGlobals_20 setInterface:v17 forSelector:sel_queueUnifiedAccessSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];
  v42 = (void *)_MergedGlobals_20;
  v43 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF40EB0];
  [v42 setInterface:v43 forSelector:sel_queueSecureElementLoggingSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];

  v44 = (void *)_MergedGlobals_20;
  v45 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46BA0];
  [v44 setInterface:v45 forSelector:sel_queueLPEMConfigSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];

  v46 = (void *)_MergedGlobals_20;
  v47 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF3D188];
  [v46 setInterface:v47 forSelector:sel_queueCredentialSession_sessionAttribute_completion_ argumentIndex:0 ofReply:0];

  v48 = (void *)_MergedGlobals_20;
  v49 = +[NFECommercePaymentSessionInterface interface];
  [v48 setInterface:v49 forSelector:sel_queueECommercePaymentSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  v50 = (void *)_MergedGlobals_20;
  v51 = +[NFContactlessSessionInterface interface];
  [v50 setInterface:v51 forSelector:sel_queueContactlessSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  v52 = (void *)_MergedGlobals_20;
  v53 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46C00];
  [v52 setInterface:v53 forSelector:sel_queueFieldDetectSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  v54 = (void *)_MergedGlobals_20;
  v55 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46C60];
  [v54 setInterface:v55 forSelector:sel_queuePeerPaymentSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  v56 = (void *)_MergedGlobals_20;
  v57 = +[NFTrustSessionInterface interface];
  [v56 setInterface:v57 forSelector:sel_queueTrustSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  v58 = (void *)_MergedGlobals_20;
  v59 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46CC0];
  [v58 setInterface:v59 forSelector:sel_queueNdefTagSession_sessionAttribute_data_completion_ argumentIndex:0 ofReply:1];

  v60 = (void *)_MergedGlobals_20;
  v61 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF43E18];
  [v60 setInterface:v61 forSelector:sel_queueHostEmulationSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  v62 = (void *)_MergedGlobals_20;
  v63 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46D20];
  [v62 setInterface:v63 forSelector:sel_queueSecureElementAndHostEmulationSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  v64 = (void *)_MergedGlobals_20;
  v65 = +[NFSecureElementReaderSessionInterface interface];
  [v64 setInterface:v65 forSelector:sel_queueSecureElementReaderSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  v66 = (void *)_MergedGlobals_20;
  v67 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46960];
  [v66 setInterface:v67 forSelector:sel_queueSecureElementLoggingSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  v68 = (void *)_MergedGlobals_20;
  v69 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46D80];
  [v68 setInterface:v69 forSelector:sel_queueLPEMConfigSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  v70 = (void *)_MergedGlobals_20;
  v71 = +[NFCredentialSessionInterface interface];
  [v70 setInterface:v71 forSelector:sel_queueCredentialSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  v72 = (void *)_MergedGlobals_20;
  id v73 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v74 = objc_opt_class();
  uint64_t v75 = objc_opt_class();
  uint64_t v76 = objc_opt_class();
  uint64_t v77 = objc_opt_class();
  uint64_t v78 = objc_opt_class();
  uint64_t v79 = objc_opt_class();
  uint64_t v80 = objc_opt_class();
  uint64_t v81 = objc_opt_class();
  v82 = objc_msgSend(v73, "initWithObjects:", v74, v75, v76, v77, v78, v79, v80, v81, objc_opt_class(), 0);
  [v72 setClasses:v82 forSelector:sel_stateInfoWithCompletion_ argumentIndex:0 ofReply:1];
}

+ (id)interface
{
  self;
  if (qword_1EB4D2040 != -1) {
    dispatch_once(&qword_1EB4D2040, &__block_literal_global_8);
  }
  uint64_t v0 = (void *)_MergedGlobals_20;
  return v0;
}

+ (void)updateSEMInterface:(uint64_t)a1
{
  id v2 = a2;
  self;
  +[NFSecureElementManagerSessionInterface interface]();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setInterface:v3 forSelector:sel_queueSecureElementManagerSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];
}

+ (void)updateSeshatInterface:(uint64_t)a1
{
  id v2 = a2;
  self;
  +[NFSeshatSessionInterface interface]();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setInterface:v3 forSelector:sel_queueSeshatSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];
}

+ (void)updateReaderInterface:(uint64_t)a1
{
  id v2 = a2;
  self;
  +[NFReaderSessionInternalInterface interface]();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setInterface:v3 forSelector:sel_queueReaderSessionInternal_sessionAttribute_completion_ argumentIndex:0 ofReply:1];
}

+ (void)updateContactlessInterface:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = +[NFContactlessPaymentSessionInterface interface]();
  [v2 setInterface:v3 forSelector:sel_queueContactlessPaymentSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  uint64_t v4 = +[NFContactlessPaymentSessionInterface interface]();
  [v2 setInterface:v4 forSelector:sel_queueLoyaltyAndPaymentSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  +[NFContactlessPaymentSessionInterface interface]();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setInterface:v5 forSelector:sel_queueUnifiedAccessSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];
}

+ (void)updateHandoverInterface:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = +[NFSecureTransactionServicesHandoverSessionInterface interface];
  [v2 setInterface:v3 forSelector:sel_queueSecureTransactionServicesSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];

  id v4 = +[NFSecureTransactionServicesHandoverHybridSessionInterface interface];
  [v2 setInterface:v4 forSelector:sel_queueSecureTransactionServicesHybridSession_sessionAttribute_completion_ argumentIndex:0 ofReply:1];
}

@end