@interface PKContactlessInterfaceSession
+ (id)transitAppletStateFromPaymentSession:(id)a3 forPaymentApplication:(id)a4;
- (BOOL)_activatePaymentApplications:(id)a3 forPaymentPass:(id)a4 forceReactivation:(BOOL)a5;
- (BOOL)activatePaymentApplication:(id)a3 forPaymentPass:(id)a4;
- (BOOL)activatePaymentApplication:(id)a3 forPaymentPass:(id)a4 markAsDefault:(BOOL)a5;
- (BOOL)activatePaymentApplications:(id)a3 forPaymentPass:(id)a4;
- (BOOL)activateValueAddedServicePasses:(id)a3;
- (BOOL)authorizeAndStartCardEmulationWithCredential:(id)a3;
- (BOOL)authorizeAndStartCardEmulationWithCredential:(id)a3 deferAuthorization:(BOOL)a4;
- (BOOL)authorizeAndStartCardEmulationWithCredential:(id)a3 deferAuthorization:(BOOL)a4 requiresConfirmationForHandoff:(BOOL)a5 startHandoffIfPending:(BOOL)a6;
- (BOOL)cancelRKEFunction:(id)a3;
- (BOOL)fieldPresent;
- (BOOL)isWaitingOnConfirmationForHandoff;
- (BOOL)paymentApplicationSupportsAutomaticAuthorization:(id)a3;
- (BOOL)persistentCardEmulationQueued;
- (BOOL)queuePersistentCardEmulation;
- (BOOL)resetPersistentCardEmulation;
- (BOOL)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5;
- (BOOL)stopCardEmulation;
- (NSArray)activatedPaymentApplications;
- (NSArray)activatedValueAddedServicePasses;
- (PKContactlessInterfaceSession)initWithInternalSession:(id)a3 targetQueue:(id)a4;
- (PKContactlessInterfaceSessionDelegate)delegate;
- (PKFieldProperties)fieldProperties;
- (PKPaymentApplication)activatedPaymentApplication;
- (PKPaymentPass)activatedPaymentPass;
- (id)_appletForPaymentApplication:(id)a3 inInternalSession:(id)a4;
- (id)_appletWithIdentifier:(id)a3 inInternalSession:(id)a4;
- (id)_createExpressTransactionForState:(id)a3 pass:(id)a4 paymentApplications:(id)a5 date:(id)a6 shouldGenerateTransaction:(BOOL *)a7 withSession:(id)a8;
- (id)_filteredLoyaltyPassesFromVASTransactions:(id)a3 activatedPasses:(id)a4;
- (id)_paymentApplicationForEventAppletIdentifier:(id)a3 inContext:(id)a4 withSession:(id)a5;
- (id)transitAppletStateForPaymentApplication:(id)a3;
- (unint64_t)state;
- (void)_endLookup;
- (void)_endLookupAndNotify;
- (void)_endPersistentCardEmulationForPaymentPass:(id)a3 paymentApplications:(id)a4;
- (void)_processEndEvent:(id)a3 withPartialContext:(id)a4;
- (void)_session:(id)a3 didEnterFieldWithNotification:(id)a4;
- (void)_session:(id)a3 didExpireTransactionForApplet:(id)a4;
- (void)_session:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5;
- (void)_session:(id)a3 didFailDeferredAuthorization:(BOOL)a4;
- (void)_session:(id)a3 didSelectApplet:(id)a4;
- (void)_sessionDidEndUnexpectedly:(id)a3;
- (void)_sessionDidExitField:(id)a3;
- (void)_sessionDidReceiveActivityTimeout:(id)a3 result:(id)a4;
- (void)_signalWalletTransactionForContext:(id)a3;
- (void)_startLookup;
- (void)authorize18013RequestWithDataToRelease:(id)a3 credential:(id)a4;
- (void)handleSessionResumed:(id)a3;
- (void)handleSessionSuspended:(id)a3 withToken:(id)a4;
- (void)invalidateSessionWithCompletion:(id)a3;
- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didEnterFieldWithNotification:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didExpireTransactionForApplet:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5;
- (void)loyaltyAndPaymentSession:(id)a3 didFailDeferredAuthorization:(BOOL)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didFelicaStateChange:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didPerformValueAddedServiceTransactions:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didSelectApplet:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didSelectValueAddedService:(BOOL)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didStartTransaction:(id)a4;
- (void)loyaltyAndPaymentSessionDidEndUnexpectedly:(id)a3;
- (void)loyaltyAndPaymentSessionDidExitField:(id)a3;
- (void)loyaltyAndPaymentSessionDidReceiveActivityTimeout:(id)a3 result:(id)a4;
- (void)loyaltyAndPaymentSessionHasPendingServerRequest:(id)a3;
- (void)resetExpressState;
- (void)sendRKEFunction:(id)a3 action:(id)a4 withAuthorization:(id)a5 completion:(id)a6;
- (void)session:(id)a3 didEndTransaction:(id)a4;
- (void)session:(id)a3 didEnterFieldWithNotification:(id)a4;
- (void)session:(id)a3 didExpireTransactionForApplet:(id)a4;
- (void)session:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5;
- (void)session:(id)a3 didSelectApplet:(id)a4;
- (void)session:(id)a3 didStartTransaction:(id)a4;
- (void)session:(id)a3 event:(id)a4;
- (void)sessionDidEndUnexpectedly:(id)a3;
- (void)sessionDidExitField:(id)a3;
- (void)sessionDidFailDeferredAuthorization:(id)a3;
- (void)sessionDidReceiveActivityTimeout:(id)a3 result:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)stsSession:(id)a3 didChangeExpressModeWithInfo:(id)a4;
- (void)stsSession:(id)a3 didEndTransaction:(id)a4;
- (void)stsSession:(id)a3 didExpireTransaction:(BOOL)a4;
- (void)stsSession:(id)a3 didReceive18013Requests:(id)a4 readerAuthInfo:(id)a5;
- (void)stsSession:(id)a3 didReceiveActivityTimeout:(id)a4;
- (void)stsSession:(id)a3 didReceiveFieldNotification:(id)a4;
- (void)stsSession:(id)a3 didStartTransaction:(id)a4;
- (void)stsSessionDidEndUnexpectedly:(id)a3 errorCode:(unint64_t)a4;
- (void)stsSessionRequestHandoffConfirmation:(id)a3;
@end

@implementation PKContactlessInterfaceSession

- (PKContactlessInterfaceSession)initWithInternalSession:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v8 = [v6 nfSession];
  v9 = [v6 stsSession];
  if (!v8) {
    goto LABEL_6;
  }
  PKGetClassNFLoyaltyAndPaymentSession();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  PKGetClassNFDigitalCarKeySession();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = 1;
  }
  else {
LABEL_6:
  }
    uint64_t v10 = 2;
LABEL_7:
  v19.receiver = self;
  v19.super_class = (Class)PKContactlessInterfaceSession;
  v11 = [(PKPaymentSession *)&v19 initWithInternalSession:v6 targetQueue:v7];
  v12 = v11;
  if (v11)
  {
    v11->_unint64_t sessionType = v10;
    v11->_delegateLock._os_unfair_lock_opaque = 0;
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_initially_inactive(v13);

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.passkit.contactlessInterfaceSession.callbackQueue", v14);
    callbackQueue = v12->_callbackQueue;
    v12->_callbackQueue = (OS_dispatch_queue *)v15;

    if (v7) {
      dispatch_set_target_queue((dispatch_object_t)v12->_callbackQueue, v7);
    }
    dispatch_activate((dispatch_object_t)v12->_callbackQueue);
    unint64_t sessionType = v12->_sessionType;
    if (sessionType == 2)
    {
      [v9 setDelegate:v12];
    }
    else if (sessionType <= 1)
    {
      [v8 setDelegate:v12];
      [v8 setSessionDelegate:v12];
    }
  }
  return v12;
}

- (void)invalidateSessionWithCompletion:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKContactlessInterfaceSession_invalidateSessionWithCompletion___block_invoke;
  v6[3] = &unk_1E56DB628;
  v6[4] = self;
  id v4 = a3;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v6];
  v5.receiver = self;
  v5.super_class = (Class)PKContactlessInterfaceSession;
  [(PKPaymentSession *)&v5 invalidateSessionWithCompletion:v4];
}

void __65__PKContactlessInterfaceSession_invalidateSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 145));
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 146))
    {
      if (*(void *)(v5 + 40))
      {
        id v7 = v3;
        uint64_t v6 = [*(id *)(v5 + 32) count];
        id v3 = v7;
        if (v6)
        {
          [*(id *)(a1 + 32) _endPersistentCardEmulationForPaymentPass:*(void *)(*(void *)(a1 + 32) + 40) paymentApplications:*(void *)(*(void *)(a1 + 32) + 32)];
          id v3 = v7;
        }
      }
    }
  }
}

- (BOOL)activatePaymentApplication:(id)a3 forPaymentPass:(id)a4 markAsDefault:(BOOL)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a3)
  {
    id v12 = a3;
    v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = a3;
    a3 = [v8 arrayWithObjects:&v12 count:1];
  }
  BOOL v10 = -[PKContactlessInterfaceSession activatePaymentApplications:forPaymentPass:](self, "activatePaymentApplications:forPaymentPass:", a3, v7, v12, v13);

  return v10;
}

- (BOOL)activatePaymentApplication:(id)a3 forPaymentPass:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    id v11 = a3;
    id v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a3;
    a3 = [v7 arrayWithObjects:&v11 count:1];
  }
  BOOL v9 = -[PKContactlessInterfaceSession _activatePaymentApplications:forPaymentPass:forceReactivation:](self, "_activatePaymentApplications:forPaymentPass:forceReactivation:", a3, v6, 0, v11, v12);

  return v9;
}

- (BOOL)activatePaymentApplications:(id)a3 forPaymentPass:(id)a4
{
  return [(PKContactlessInterfaceSession *)self _activatePaymentApplications:a3 forPaymentPass:a4 forceReactivation:0];
}

- (BOOL)_activatePaymentApplications:(id)a3 forPaymentPass:(id)a4 forceReactivation:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  uint64_t v10 = [v8 count];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__PKContactlessInterfaceSession__activatePaymentApplications_forPaymentPass_forceReactivation___block_invoke;
  v15[3] = &unk_1E56DB670;
  v15[4] = self;
  v18 = v24;
  BOOL v23 = a5;
  id v11 = v8;
  id v16 = v11;
  objc_super v19 = &v26;
  v20 = &v30;
  v21 = &v34;
  uint64_t v22 = v10;
  id v12 = v9;
  id v17 = v12;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v15];
  BOOL v13 = *((unsigned char *)v35 + 24) && *((unsigned char *)v31 + 24) || *((unsigned char *)v27 + 24) != 0;

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v13;
}

void __95__PKContactlessInterfaceSession__activatePaymentApplications_forPaymentPass_forceReactivation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v63 = a2;
  uint64_t v64 = a1;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 80))
  {
    id v4 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
    goto LABEL_78;
  }
  if (!*(unsigned char *)(a1 + 96) && (unint64_t)(*(void *)(v3 + 128) - 1) <= 1)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = *(id *)(v3 + 32);
    id v7 = v5;
    if (v6 == v7)
    {

LABEL_17:
      id v4 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      goto LABEL_78;
    }
    id v8 = v7;
    uint64_t v9 = [v6 count];
    if (v9 == [v8 count])
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      obuint64_t j = v6;
      uint64_t v11 = [obj countByEnumeratingWithState:&v86 objects:buf count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v87;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v87 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v86 + 1) + 8 * i);
            uint64_t v82 = 0;
            v83 = &v82;
            uint64_t v84 = 0x2020000000;
            char v85 = 0;
            v81[0] = MEMORY[0x1E4F143A8];
            v81[1] = 3221225472;
            v81[2] = __PKPaymentApplicationsArrayMatch_block_invoke;
            v81[3] = &unk_1E56DBA50;
            v81[4] = v10;
            v81[5] = v14;
            v81[6] = &v82;
            [v8 enumerateObjectsUsingBlock:v81];
            int v15 = *((unsigned __int8 *)v83 + 24);
            _Block_object_dispose(&v82, 8);
            if (!v15)
            {

              goto LABEL_20;
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v86 objects:buf count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      goto LABEL_17;
    }
  }
LABEL_20:
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(v16 + 152);
  switch(v17)
  {
    case 2:
      id obja = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([*(id *)(a1 + 48) isIdentityPass])
      {
        if ([*(id *)(a1 + 48) isHybridIdentityPass]) {
          uint64_t v22 = 5;
        }
        else {
          uint64_t v22 = 2;
        }
      }
      else
      {
        uint64_t v22 = 3;
      }
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v65 = *(id *)(a1 + 40);
      uint64_t v67 = [v65 countByEnumeratingWithState:&v75 objects:v91 count:16];
      if (v67)
      {
        uint64_t v66 = *(void *)v76;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v76 != v66)
            {
              uint64_t v31 = v30;
              objc_enumerationMutation(v65);
              uint64_t v30 = v31;
            }
            uint64_t v68 = v30;
            uint64_t v32 = *(void **)(*((void *)&v75 + 1) + 8 * v30);
            char v33 = [v32 applicationIdentifier];
            if ([v32 paymentType] == 1005)
            {
              uint64_t v34 = (void *)[objc_alloc((Class)getSTSCredentialClass[0]()) initWithType:v22 identifier:v33 subIdentifier:0];
              [obja addObject:v34];
            }
            else
            {
              long long v73 = 0u;
              long long v74 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              uint64_t v34 = [v32 subcredentials];
              uint64_t v35 = [v34 countByEnumeratingWithState:&v71 objects:v90 count:16];
              if (v35)
              {
                uint64_t v36 = *(void *)v72;
                do
                {
                  for (uint64_t j = 0; j != v35; ++j)
                  {
                    if (*(void *)v72 != v36) {
                      objc_enumerationMutation(v34);
                    }
                    v38 = *(void **)(*((void *)&v71 + 1) + 8 * j);
                    id v39 = objc_alloc((Class)getSTSCredentialClass[0]());
                    v40 = [v38 identifier];
                    v41 = (void *)[v39 initWithType:v22 identifier:v33 subIdentifier:v40];

                    [obja addObject:v41];
                  }
                  uint64_t v35 = [v34 countByEnumeratingWithState:&v71 objects:v90 count:16];
                }
                while (v35);
              }
            }

            uint64_t v30 = v68 + 1;
          }
          while (v68 + 1 != v67);
          uint64_t v67 = [v65 countByEnumeratingWithState:&v75 objects:v91 count:16];
        }
        while (v67);
      }

      uint64_t v42 = [obja count];
      if ((unint64_t)(v42 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v43 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v93 = v22;
          __int16 v94 = 2048;
          uint64_t v95 = v42;
          _os_log_impl(&dword_190E10000, v43, OS_LOG_TYPE_DEFAULT, "Invalid credentials count for STS session: (t: %lu, n: %lu)", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(v64 + 72) + 8) + 24) = 0;
      }
      v44 = [v63 stsSession];
      v45 = (void *)[obja copy];
      v21 = [v44 setActiveCredentials:v45];

      *(unsigned char *)(*(void *)(*(void *)(v64 + 80) + 8) + 24) = v21 == 0;
      if (!v21)
      {
        id v4 = 0;
LABEL_76:

        a1 = v64;
        uint64_t v16 = *(void *)(v64 + 32);
        goto LABEL_77;
      }
      v46 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v93 = (uint64_t)obja;
        __int16 v94 = 2112;
        uint64_t v95 = (uint64_t)v21;
        _os_log_impl(&dword_190E10000, v46, OS_LOG_TYPE_DEFAULT, "Could not activate credentials %@ with error %@", buf, 0x16u);
      }
      id v4 = 0;
LABEL_75:

      goto LABEL_76;
    case 1:
      uint64_t v23 = *(void *)(a1 + 88);
      if (v23 == 1)
      {
        v24 = [*(id *)(a1 + 40) firstObject];
        char v25 = [v24 subcredentials];
        uint64_t v26 = [v25 count];
        if (v26 == 1)
        {
          id obja = [*(id *)(a1 + 32) _appletForPaymentApplication:v24 inInternalSession:v63];
          v27 = [v25 anyObject];
          v21 = [v27 identifier];
        }
        else
        {
          v47 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v93 = v26;
            _os_log_impl(&dword_190E10000, v47, OS_LOG_TYPE_DEFAULT, "Invalid credentials count for Car Key session: %lu", buf, 0xCu);
          }

          v21 = 0;
          id obja = 0;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        }
      }
      else
      {
        char v29 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v93 = v23;
          _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Invalid applications count for Car Key session: %lu", buf, 0xCu);
        }

        v21 = 0;
        id obja = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      }
      v46 = [v63 nfSession];
      v79 = 0;
      char v48 = [v46 setActiveApplet:obja key:v21 outError:&v79];
      v49 = v79;
      goto LABEL_74;
    case 0:
      uint64_t v18 = *(void *)(a1 + 88);
      if (v18 == 1)
      {
        objc_super v19 = [*(id *)(a1 + 40) firstObject];
        id obja = [*(id *)(a1 + 32) _appletForPaymentApplication:v19 inInternalSession:v63];
        v20 = [v19 subcredentials];
        if ([v20 count])
        {
          v21 = objc_msgSend(v20, "pk_setBySafelyApplyingBlock:", &__block_literal_global_9);
        }
        else
        {
          v21 = 0;
        }
      }
      else
      {
        uint64_t v28 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v93 = v18;
          _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "Invalid applications count for Loyalty Payment session: %lu", buf, 0xCu);
        }

        v21 = 0;
        id obja = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      }
      v46 = [v63 nfSession];
      v80 = 0;
      char v48 = [v46 setActivePaymentApplet:obja keys:v21 error:&v80];
      v49 = v80;
LABEL_74:
      id v4 = v49;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v48;
      goto LABEL_75;
  }
  id v4 = 0;
LABEL_77:
  *(unsigned char *)(v16 + 148) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 147) = 0;
LABEL_78:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    v50 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v93 = v51;
      v52 = "Activating Payment Applications: %@";
LABEL_88:
      _os_log_impl(&dword_190E10000, v50, OS_LOG_TYPE_DEFAULT, v52, buf, 0xCu);
      goto LABEL_89;
    }
    goto LABEL_89;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      v50 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v53 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v93 = v53;
        v52 = "Activating Payment Applications (deferred): %@";
        goto LABEL_88;
      }
LABEL_89:

      uint64_t v55 = [*(id *)(v64 + 40) copy];
      uint64_t v56 = *(void *)(v64 + 32);
      v57 = *(void **)(v56 + 32);
      *(void *)(v56 + 32) = v55;

      objc_storeStrong((id *)(*(void *)(v64 + 32) + 40), *(id *)(v64 + 48));
      if ([*(id *)(*(void *)(v64 + 32) + 32) count]
        || [*(id *)(*(void *)(v64 + 32) + 48) count])
      {
        if (!*(unsigned char *)(*(void *)(*(void *)(v64 + 64) + 8) + 24)) {
          [*(id *)(v64 + 32) setState:1];
        }
      }
      else
      {
        [*(id *)(v64 + 32) setState:0];
      }
      goto LABEL_94;
    }
LABEL_86:
    v50 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v54 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v93 = v54;
      v52 = "Skipping Activatation of Payment Applications: %@";
      goto LABEL_88;
    }
    goto LABEL_89;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    goto LABEL_86;
  }
  v58 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v59 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v93 = v59;
    __int16 v94 = 2112;
    uint64_t v95 = (uint64_t)v4;
    _os_log_impl(&dword_190E10000, v58, OS_LOG_TYPE_DEFAULT, "Failed to Activate Payment Applications: %@, Error: %@", buf, 0x16u);
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(v64 + 72) + 8) + 24))
  {
    uint64_t v60 = *(void *)(v64 + 32);
    v61 = *(void **)(v60 + 32);
    *(void *)(v60 + 32) = 0;

    v62 = *(void **)(*(void *)(v64 + 32) + 40);
    *(void *)(*(void *)(v64 + 32) + 40) = 0;
  }
LABEL_94:
}

uint64_t __95__PKContactlessInterfaceSession__activatePaymentApplications_forPaymentPass_forceReactivation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (BOOL)activateValueAddedServicePasses:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v5 = [v4 count];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__PKContactlessInterfaceSession_activateValueAddedServicePasses___block_invoke;
  v17[3] = &unk_1E56DB698;
  id v8 = v6;
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  [v4 enumerateObjectsUsingBlock:v17];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PKContactlessInterfaceSession_activateValueAddedServicePasses___block_invoke_118;
  v13[3] = &unk_1E56DB758;
  v13[4] = self;
  uint64_t v16 = &v20;
  id v10 = v8;
  id v14 = v10;
  id v11 = v9;
  id v15 = v11;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v13];
  LOBYTE(self) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)self;
}

void __65__PKContactlessInterfaceSession_activateValueAddedServicePasses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 nfcPayload];

  if (v4)
  {
    id v5 = v3;
    id v6 = [v5 passTypeIdentifier];
    id v7 = [v6 dataUsingEncoding:4];
    CFDataRef v8 = [v7 SHA256Hash];

    id v9 = [v5 nfcPayload];
    id v10 = [v9 message];
    CFDataRef v11 = [v10 dataUsingEncoding:4];

    uint64_t v12 = [v5 nfcPayload];
    BOOL v13 = [v12 encryptionPublicKeyData];

    if (v13)
    {
      id v14 = [v5 nfcPayload];
      CFDataRef v15 = (const __CFData *)PKCreateEncryptedPassPayload((const __CFData *)[v14 encryptionPublicKeyData], v11, v8, 0);
    }
    else
    {
      CFDataRef v15 = v11;
    }
    id v16 = objc_alloc_init((Class)PKGetClassNFValueAddedServiceCard());
    [v16 setIdentifier:v8];
    [v16 setData:v15];
    [v16 setUserInterventionRequired:0];
    uint64_t v17 = [MEMORY[0x1E4F1C9B8] data];
    [v16 setToken:v17];

    id v18 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v5 passTypeIdentifier];
      uint64_t v20 = [v16 identifier];
      v21 = [v5 serialNumber];
      uint64_t v22 = [v16 data];
      int v23 = 138413058;
      v24 = v19;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = v21;
      __int16 v29 = 2048;
      uint64_t v30 = [v22 length];
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Activating NFC Pass: %@(%@)/%@ with Message of Size: %tu", (uint8_t *)&v23, 0x2Au);
    }
    [*(id *)(a1 + 32) addObject:v16];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __65__PKContactlessInterfaceSession_activateValueAddedServicePasses___block_invoke_118(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = v3;
  if (*(void *)(v4 + 80) || *(void *)(v4 + 152))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v12 = [v3 nfSession];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v12 setHostCards:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v5 = [*(id *)(a1 + 48) copy];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = v5;

    uint64_t v8 = [*(id *)(a1 + 40) copy];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 56);
    *(void *)(v9 + 56) = v8;

    if ([*(id *)(*(void *)(a1 + 32) + 32) count]) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = [*(id *)(*(void *)(a1 + 32) + 48) count] != 0;
    }
    [*(id *)(a1 + 32) setState:v11];
  }
}

- (BOOL)authorizeAndStartCardEmulationWithCredential:(id)a3
{
  id v3 = self;
  activatedPaymentApplications = self->_activatedPaymentApplications;
  id v5 = a3;
  LOBYTE(v3) = [(PKContactlessInterfaceSession *)v3 authorizeAndStartCardEmulationWithCredential:v5 deferAuthorization:[(NSArray *)activatedPaymentApplications pk_containsObjectPassingTest:&__block_literal_global_121]];

  return (char)v3;
}

uint64_t __78__PKContactlessInterfaceSession_authorizeAndStartCardEmulationWithCredential___block_invoke(uint64_t a1, void *a2)
{
  return [a2 requiresDeferredAuthorization];
}

- (BOOL)authorizeAndStartCardEmulationWithCredential:(id)a3 deferAuthorization:(BOOL)a4
{
  return [(PKContactlessInterfaceSession *)self authorizeAndStartCardEmulationWithCredential:a3 deferAuthorization:a4 requiresConfirmationForHandoff:0 startHandoffIfPending:0];
}

- (BOOL)authorizeAndStartCardEmulationWithCredential:(id)a3 deferAuthorization:(BOOL)a4 requiresConfirmationForHandoff:(BOOL)a5 startHandoffIfPending:(BOOL)a6
{
  id v10 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __150__PKContactlessInterfaceSession_authorizeAndStartCardEmulationWithCredential_deferAuthorization_requiresConfirmationForHandoff_startHandoffIfPending___block_invoke;
  v14[3] = &unk_1E56DB6E0;
  v14[4] = self;
  id v16 = &v20;
  BOOL v17 = a6;
  BOOL v18 = a5;
  id v11 = v10;
  id v15 = v11;
  BOOL v19 = a4;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v14];
  char v12 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __150__PKContactlessInterfaceSession_authorizeAndStartCardEmulationWithCredential_deferAuthorization_requiresConfirmationForHandoff_startHandoffIfPending___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 80))
  {
    [(id)v4 _endLookup];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v4 + 120) = 0;
  if ([*(id *)(*(void *)(a1 + 32) + 32) count]) {
    goto LABEL_4;
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 152);
  switch(v15)
  {
    case 2:
      uint64_t v20 = [v3 stsSession];
      v21 = [v20 setActiveCredential:0];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v21 == 0;
      break;
    case 1:
      id v16 = [v3 nfSession];
      uint64_t v42 = 0;
      char v17 = [v16 setActiveApplet:0 key:0 outError:&v42];
      BOOL v18 = v42;
      goto LABEL_24;
    case 0:
      id v16 = [v3 nfSession];
      v43 = 0;
      char v17 = [v16 setActivePaymentApplet:0 error:&v43];
      BOOL v18 = v43;
LABEL_24:
      id v5 = v18;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v17;

      goto LABEL_5;
  }
LABEL_4:
  id v5 = 0;
LABEL_5:
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 152) && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && !*(void *)(v6 + 48))
  {
    BOOL v19 = [v3 nfSession];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v19 setHostCards:MEMORY[0x1E4F1CBF0]];

    uint64_t v6 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(a1 + 56))
  {
    if (*(void *)(v6 + 128) == 2)
    {
      if (*(unsigned char *)(v6 + 148))
      {
        id v7 = [v3 stsSession];
        uint64_t v8 = [v7 startHandoff];

        BOOL v9 = v8 == 0;
        id v10 = PKLogFacilityTypeGetObject(6uLL);
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v8)
        {
          if (v11)
          {
            *(_DWORD *)buf = 138412290;
            id v45 = v8;
            char v12 = "Contactless Interface Session: failed to start handoff with error %@";
            id v13 = v10;
            uint32_t v14 = 12;
LABEL_27:
            _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
          }
        }
        else if (v11)
        {
          *(_WORD *)buf = 0;
          char v12 = "Contactless Interface Session: performed hand off";
          id v13 = v10;
          uint32_t v14 = 2;
          goto LABEL_27;
        }

        uint64_t v6 = *(void *)(a1 + 32);
        goto LABEL_29;
      }
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_29:
  *(unsigned char *)(v6 + 147) = *(unsigned char *)(a1 + 57);
  *(unsigned char *)(*(void *)(a1 + 32) + 148) = 0;
  int v22 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  char v23 = PKLogFacilityTypeGetObject(6uLL);
  v24 = v23;
  if (!v9 && v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Starting Card Emulation For Transaction", buf, 2u);
    }

    if ([*(id *)(*(void *)(a1 + 32) + 32) count]) {
      __int16 v25 = *(void **)(a1 + 40);
    }
    else {
      __int16 v25 = 0;
    }
    id v26 = v25;
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void *)(v27 + 152);
    if (v28 == 2)
    {
      if (*(unsigned char *)(v27 + 147)) {
        uint64_t v35 = *(unsigned __int8 *)(a1 + 58) | 2;
      }
      else {
        uint64_t v35 = *(unsigned __int8 *)(a1 + 58);
      }
      uint64_t v36 = [v3 stsSession];
      uint64_t v31 = [v36 startTransactionWithAuthorization:v26 options:v35];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v31 == 0;
      if (v31)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v31;
          _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Could not start transaction with error %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v28 == 1)
      {
        uint64_t v31 = [v3 nfSession];
        uint64_t v34 = *(unsigned __int8 *)(a1 + 58);
        id v39 = v5;
        LOBYTE(v32) = [v31 startCardEmulationAuthorization:v26 deferred:v34 error:&v39];
        char v33 = v39;
      }
      else
      {
        if (v28)
        {
LABEL_52:

          int v22 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          goto LABEL_53;
        }
        int v29 = *(unsigned __int8 *)(a1 + 58);
        uint64_t v30 = [v3 nfSession];
        uint64_t v31 = v30;
        if (v29)
        {
          id v41 = v5;
          LOBYTE(v32) = [v30 startDeferredCardEmulation:3 authorization:v26 error:&v41];
          char v33 = v41;
        }
        else
        {
          id v40 = v5;
          int v32 = [v30 startCardEmulation:3 authorization:v26 error:&v40];
          char v33 = v40;
        }
      }
      id v37 = v33;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v32;
      id v5 = v37;
    }

    goto LABEL_52;
  }
LABEL_53:
  BOOL v38 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v38)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Started Card Emulation For Transaction", buf, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 146) = 3;
    [*(id *)(a1 + 32) setState:2];
  }
  else
  {
    if (v38)
    {
      *(_DWORD *)buf = 138543362;
      id v45 = v5;
      _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session failed to authorize and start Card Emulation. Error: %{public}@", buf, 0xCu);
    }

    if (v5 && [v5 code] == 38)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Express transaction in progress: proceeding without card emulation...", buf, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

- (void)authorize18013RequestWithDataToRelease:(id)a3 credential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__PKContactlessInterfaceSession_authorize18013RequestWithDataToRelease_credential___block_invoke;
  v10[3] = &unk_1E56DB708;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v10];
}

void __83__PKContactlessInterfaceSession_authorize18013RequestWithDataToRelease_credential___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), *(id *)(a1 + 40));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v40 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v39 + 1) + 8 * v8);
      if ([v9 paymentType] == 1002) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v9;

    if (!v10) {
      goto LABEL_27;
    }
    uint64_t v34 = v3;
    id v11 = [v10 subcredentials];
    id v12 = [v11 anyObject];
    uint64_t v13 = [v12 identifier];

    id v14 = objc_alloc((Class)getSTSCredentialClass[0]());
    uint64_t v15 = [v10 applicationIdentifier];
    char v33 = (void *)v13;
    int v32 = (void *)[v14 initWithType:2 identifier:v15 subIdentifier:v13];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    char v17 = [*(id *)(a1 + 40) elements];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v17);
          }
          int v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          char v23 = objc_msgSend(v22, "elementNamespace", v32);
          id v24 = [v16 objectForKey:v23];

          if (!v24)
          {
            id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            __int16 v25 = [v22 elementNamespace];
            [v16 setObject:v24 forKey:v25];
          }
          id v26 = [v22 identifier];
          [v24 addObject:v26];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v19);
    }

    uint64_t v27 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v16;
      _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Releasing Credential For Fields %@", buf, 0xCu);
    }

    id v3 = v34;
    uint64_t v28 = [v34 stsSession];
    uint64_t v29 = *(void *)(a1 + 48);
    uint64_t v30 = (void *)[v16 copy];
    uint64_t v31 = [v28 releaseCredential:v32 withAuthorization:v29 iso18013Selection:v30];

    if (v31)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v31;
        _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Released Credential Failed with error %@", buf, 0xCu);
      }
    }
  }
  else
  {
LABEL_9:

LABEL_27:
    id v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session authorize18013RequestWithDataToRelease Failed. No valid PKPaymentApplication is found", buf, 2u);
    }
  }
}

- (BOOL)stopCardEmulation
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PKContactlessInterfaceSession_stopCardEmulation__block_invoke;
  v4[3] = &unk_1E56DB730;
  v4[4] = self;
  v4[5] = &v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __50__PKContactlessInterfaceSession_stopCardEmulation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 146))
  {
    id v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Stopping Card Emulation", buf, 2u);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 152);
    if (v5 == 2)
    {
      id v9 = [v3 stsSession];
      id v10 = [v9 stopTransaction];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10 == 0;
      goto LABEL_13;
    }
    if (v5 == 1)
    {
      uint64_t v6 = [v3 nfSession];
      id v24 = 0;
      char v7 = [v6 stopCardEmulation:&v24];
      char v8 = v24;
    }
    else
    {
      if (v5)
      {
        id v10 = 0;
LABEL_13:
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          *(unsigned char *)(*(void *)(a1 + 32) + 146) = 0;
          uint64_t v11 = *(void *)(a1 + 32);
          id v12 = *(void **)(v11 + 48);
          *(void *)(v11 + 48) = 0;

          uint64_t v13 = *(void *)(a1 + 32);
          id v14 = *(void **)(v13 + 56);
          *(void *)(v13 + 56) = 0;

          uint64_t v15 = *(void *)(a1 + 32);
          if (*(void *)(v15 + 40)) {
            BOOL v16 = [*(id *)(v15 + 32) count] != 0;
          }
          else {
            BOOL v16 = 0;
          }
          [(id)v15 setState:v16];
          unsigned __int8 v19 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 145));
          if ((v19 & 1) == 0 || *(void *)(*(void *)(a1 + 32) + 152)) {
            goto LABEL_23;
          }
          char v17 = [v3 nfSession];
          uint64_t v20 = (unsigned __int8 *)(*(void *)(a1 + 32) + 145);
          id v23 = v10;
          char v21 = [v17 enablePlasticCardMode:0 error:&v23];
          id v18 = v23;

          atomic_store(v21 ^ 1, v20);
          uint64_t v22 = *(void *)(a1 + 32);
          if (*(void *)(v22 + 40) && [*(id *)(v22 + 32) count]) {
            [*(id *)(a1 + 32) _endPersistentCardEmulationForPaymentPass:*(void *)(*(void *)(a1 + 32) + 40) paymentApplications:*(void *)(*(void *)(a1 + 32) + 32)];
          }
          if (v18)
          {
            if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v27 = v18;
              _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to disable Persistent Card Emulation. Error: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v10;
            _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to stop Card Emulation. Error: %@", buf, 0xCu);
          }
          char v17 = v4;
          id v18 = v10;
        }

        id v10 = v18;
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v6 = [v3 nfSession];
      __int16 v25 = 0;
      char v7 = [v6 stopCardEmulation:&v25];
      char v8 = v25;
    }
    id v10 = v8;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;

    goto LABEL_13;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_24:
}

- (void)resetExpressState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__PKContactlessInterfaceSession_resetExpressState__block_invoke;
  v2[3] = &unk_1E56DB628;
  v2[4] = self;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v2];
}

void __50__PKContactlessInterfaceSession_resetExpressState__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  char v2 = *(void **)(v1 + 112);
  *(void *)(v1 + 112) = 0;
}

- (BOOL)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = 0;
  uint64_t v18 = 0;
  unsigned __int8 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (self->_sessionType == 1)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__PKContactlessInterfaceSession_sendRKEFunction_action_authorization___block_invoke;
    v13[3] = &unk_1E56DB758;
    id v14 = v9;
    id v15 = v8;
    char v17 = &v18;
    id v16 = v10;
    [(PKPaymentSession *)self performBlockSyncOnInternalSession:v13];

    BOOL v11 = *((unsigned char *)v19 + 24) != 0;
  }
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __70__PKContactlessInterfaceSession_sendRKEFunction_action_authorization___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Sending RKE action %{public}@ for function %{public}@.", (uint8_t *)&v9, 0x16u);
  }

  char v7 = [v3 nfSession];
  id v8 = [v7 sendRKEFunction:a1[5] rkeAction:a1[4] authorization:a1[6]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v8 == 0;
}

- (void)sendRKEFunction:(id)a3 action:(id)a4 withAuthorization:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_sessionType == 1)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__PKContactlessInterfaceSession_sendRKEFunction_action_withAuthorization_completion___block_invoke;
    v14[3] = &unk_1E56DB7A8;
    id v15 = v11;
    id v16 = v10;
    id v17 = v12;
    id v18 = v13;
    [(PKPaymentSession *)self performBlockSyncOnInternalSession:v14];
  }
}

void __85__PKContactlessInterfaceSession_sendRKEFunction_action_withAuthorization_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v6;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Sending RKE action %{public}@ for function %{public}@.", buf, 0x16u);
  }

  char v7 = [v3 nfSession];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__PKContactlessInterfaceSession_sendRKEFunction_action_withAuthorization_completion___block_invoke_123;
  v11[3] = &unk_1E56DB780;
  uint64_t v10 = *(void *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  [v7 sendRKEFunction:v8 action:v9 authorization:v10 completion:v11];
}

uint64_t __85__PKContactlessInterfaceSession_sendRKEFunction_action_withAuthorization_completion___block_invoke_123(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  }
  return result;
}

- (BOOL)cancelRKEFunction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  BOOL v6 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (self->_sessionType == 1)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__PKContactlessInterfaceSession_cancelRKEFunction___block_invoke;
    v8[3] = &unk_1E56DB7D0;
    uint64_t v10 = &v11;
    id v9 = v4;
    [(PKPaymentSession *)self performBlockSyncOnInternalSession:v8];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __51__PKContactlessInterfaceSession_cancelRKEFunction___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 nfSession];
  id v3 = [v4 cancelRKEFunction:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 == 0;
}

- (BOOL)queuePersistentCardEmulation
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PKContactlessInterfaceSession_queuePersistentCardEmulation__block_invoke;
  v4[3] = &unk_1E56DB730;
  v4[4] = self;
  v4[5] = &v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __61__PKContactlessInterfaceSession_queuePersistentCardEmulation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 152);
  LOBYTE(v5) = atomic_load((unsigned __int8 *)(v5 + 145));
  int v7 = v5 & 1;
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
LABEL_11:

    return;
  }
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_11;
  }
  char v8 = [v3 nfSession];
  id v14 = 0;
  char v9 = [v8 enablePlasticCardMode:1 error:&v14];
  id v10 = v14;
  char v11 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(a1 + 32) + 145), (unsigned __int8 *)&v11, *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  if (!v11)
  {
    id v12 = v10;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      uint64_t v13 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v12;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Failed to enable Persistent Card Emulation. Error: %@", buf, 0xCu);
      }
    }
    goto LABEL_11;
  }
  __break(1u);
}

- (BOOL)resetPersistentCardEmulation
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PKContactlessInterfaceSession_resetPersistentCardEmulation__block_invoke;
  v4[3] = &unk_1E56DB730;
  v4[4] = self;
  v4[5] = &v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __61__PKContactlessInterfaceSession_resetPersistentCardEmulation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 152);
  LOBYTE(v5) = atomic_load((unsigned __int8 *)(v5 + 145));
  int v7 = v5 & 1;
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7 ^ 1;
LABEL_11:

    return;
  }
  if (!v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_11;
  }
  char v8 = [v3 nfSession];
  id v14 = 0;
  char v9 = [v8 enablePlasticCardMode:0 error:&v14];
  id v10 = v14;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  int v11 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(a1 + 32) + 145), (unsigned __int8 *)&v11, *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1);
  if (v11 == 1)
  {
    id v12 = v10;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      uint64_t v13 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v12;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Failed to disable Persistent Card Emulation. Error: %@", buf, 0xCu);
      }
    }
    goto LABEL_11;
  }
  __break(1u);
}

- (BOOL)paymentApplicationSupportsAutomaticAuthorization:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__PKContactlessInterfaceSession_paymentApplicationSupportsAutomaticAuthorization___block_invoke;
  v9[3] = &unk_1E56DB848;
  int v11 = &v12;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v9];
  uint64_t v6 = (void *)v13[5];
  if (v6) {
    int v7 = [v6 authTransientSupport] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __82__PKContactlessInterfaceSession_paymentApplicationSupportsAutomaticAuthorization___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _appletForPaymentApplication:*(void *)(a1 + 40) inInternalSession:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (PKPaymentApplication)activatedPaymentApplication
{
  char v2 = [(PKContactlessInterfaceSession *)self activatedPaymentApplications];
  uint64_t v3 = [v2 firstObject];

  return (PKPaymentApplication *)v3;
}

- (NSArray)activatedPaymentApplications
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__1;
  char v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PKContactlessInterfaceSession_activatedPaymentApplications__block_invoke;
  v4[3] = &unk_1E56DB7D0;
  v4[4] = self;
  v4[5] = &v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __61__PKContactlessInterfaceSession_activatedPaymentApplications__block_invoke(uint64_t a1)
{
}

- (PKPaymentPass)activatedPaymentPass
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__1;
  char v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PKContactlessInterfaceSession_activatedPaymentPass__block_invoke;
  v4[3] = &unk_1E56DB7D0;
  v4[4] = self;
  v4[5] = &v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (PKPaymentPass *)v2;
}

void __53__PKContactlessInterfaceSession_activatedPaymentPass__block_invoke(uint64_t a1)
{
}

- (void)setState:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PKContactlessInterfaceSession_setState___block_invoke;
  v3[3] = &unk_1E56DB820;
  v3[4] = self;
  v3[5] = a3;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v3];
}

void __42__PKContactlessInterfaceSession_setState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v1 + 128);
  *(void *)(v1 + 128) = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 136);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PKContactlessInterfaceSession_setState___block_invoke_2;
  block[3] = &unk_1E56DB7F8;
  block[4] = v4;
  block[5] = v3;
  block[6] = v2;
  dispatch_async(v5, block);
}

void __42__PKContactlessInterfaceSession_setState___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contactlessInterfaceSession:*(void *)(a1 + 32) didTransitionFromState:*(void *)(a1 + 40) toState:*(void *)(a1 + 48)];
  }
}

- (id)transitAppletStateForPaymentApplication:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__1;
  __int16 v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PKContactlessInterfaceSession_transitAppletStateForPaymentApplication___block_invoke;
  v8[3] = &unk_1E56DB848;
  void v8[4] = self;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __73__PKContactlessInterfaceSession_transitAppletStateForPaymentApplication___block_invoke(void *a1, void *a2)
{
  if (!*(void *)(a1[4] + 152))
  {
    id v3 = a2;
    id v4 = objc_opt_class();
    id v8 = [v3 nfSession];

    uint64_t v5 = [v4 transitAppletStateFromPaymentSession:v8 forPaymentApplication:a1[5]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

+ (id)transitAppletStateFromPaymentSession:(id)a3 forPaymentApplication:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    id v8 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = [v6 applicationIdentifier];
  id v8 = [v5 appletWithIdentifier:v7];

  if (!v8)
  {
LABEL_9:
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  id v9 = [v6 appletDataFormat];
  id v10 = v9;
  if (v9 && @"transit.felica.suica")
  {
    if (([(__CFString *)v9 isEqual:@"transit.felica.suica"] & 1) == 0) {
      goto LABEL_21;
    }
  }
  else if (v9 != @"transit.felica.suica")
  {
    goto LABEL_21;
  }
  if (objc_opt_respondsToSelector())
  {
    id v26 = 0;
    uint64_t v13 = [v5 felicaAppletState:v8 error:&v26];
    id v14 = v26;
    __int16 v15 = v14;
    if (v13)
    {
      if (PKTransitDumpStates())
      {
        id v16 = PKLogFacilityTypeGetObject(0xCuLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v6 applicationIdentifier];
          *(_DWORD *)buf = 138412546;
          uint64_t v28 = v17;
          __int16 v29 = 2112;
          uint64_t v30 = v13;
          _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Felica state for AID<%@>:\n%@", buf, 0x16u);
        }
      }
      id v18 = [[PKFelicaAppletHistory alloc] initWithDictionary:v13 source:1];
      goto LABEL_29;
    }
    if (!v14) {
      goto LABEL_39;
    }
    uint64_t v22 = PKLogFacilityTypeGetObject(0xCuLL);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v15;
    id v23 = "Failed to acquire Felica state. Error: %@";
    goto LABEL_37;
  }
LABEL_21:
  if (![(__CFString *)v10 hasPrefix:@"transit.apple"]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v13 = 0;
    __int16 v15 = 0;
LABEL_43:
    uint64_t v11 = 0;
    goto LABEL_44;
  }
  id v25 = 0;
  uint64_t v13 = [v5 transitAppletState:v8 error:&v25];
  id v19 = v25;
  __int16 v15 = v19;
  if (!v13)
  {
    if (!v19)
    {
LABEL_39:
      uint64_t v13 = 0;
      goto LABEL_43;
    }
    uint64_t v22 = PKLogFacilityTypeGetObject(0xCuLL);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
LABEL_38:

      goto LABEL_39;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v15;
    id v23 = "Failed to acquire transit state. Error: %@";
LABEL_37:
    _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
    goto LABEL_38;
  }
  if (PKTransitDumpStates())
  {
    uint64_t v20 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      char v21 = [v6 applicationIdentifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v21;
      __int16 v29 = 2112;
      uint64_t v30 = v13;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Transit state for AID<%@>:\n%@", buf, 0x16u);
    }
  }
  id v18 = [[PKTransitAppletHistory alloc] initWithDictionary:v13 source:1];
  if (!v18)
  {
    id v24 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v13;
      _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "\tFailed to create transit history from transit state: %@", buf, 0xCu);
    }

    goto LABEL_43;
  }
LABEL_29:
  uint64_t v11 = v18;
LABEL_44:

LABEL_10:
  return v11;
}

- (unint64_t)state
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__PKContactlessInterfaceSession_state__block_invoke;
  v4[3] = &unk_1E56DB7D0;
  v4[4] = self;
  v4[5] = &v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__PKContactlessInterfaceSession_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 128);
  return result;
}

- (BOOL)fieldPresent
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_fieldPresent);
  return v2 & 1;
}

- (BOOL)persistentCardEmulationQueued
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_persistentCardEmulation);
  return v2 & 1;
}

- (PKContactlessInterfaceSessionDelegate)delegate
{
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_delegateLock);
  return (PKContactlessInterfaceSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_delegateLock);
  uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 134218242;
      __int16 v15 = self;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_debug_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEBUG, "PKContactlessInterfaceSession (%p): switching to delegate of kind %{public}@.", buf, 0x16u);
    }
  }
  else if (v6)
  {
    *(_DWORD *)buf = 134217984;
    __int16 v15 = self;
    _os_log_debug_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEBUG, "PKContactlessInterfaceSession (%p): switching to nil delegate.", buf, 0xCu);
  }

  objc_storeWeak((id *)&self->_delegate, v4);
  os_unfair_lock_unlock(&self->_delegateLock);
  if (v4)
  {
    objc_initWeak((id *)buf, v4);
    objc_initWeak(&location, self);
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PKContactlessInterfaceSession_setDelegate___block_invoke;
    block[3] = &unk_1E56DB870;
    objc_copyWeak(&v11, &location);
    objc_copyWeak(&v12, (id *)buf);
    dispatch_async(callbackQueue, block);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

void __45__PKContactlessInterfaceSession_setDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[144])
  {
    uint64_t v5 = WeakRetained;
    id v3 = [WeakRetained delegate];
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));

    if (v4 == v3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v5[144] = 0;
      objc_msgSend(v3, "contactlessInterfaceSessionHasPendingServerRequest:");
    }

    id WeakRetained = v5;
  }
}

- (BOOL)isWaitingOnConfirmationForHandoff
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PKContactlessInterfaceSession_isWaitingOnConfirmationForHandoff__block_invoke;
  v4[3] = &unk_1E56DB7D0;
  v4[4] = self;
  v4[5] = &v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __66__PKContactlessInterfaceSession_isWaitingOnConfirmationForHandoff__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 148);
  return result;
}

- (id)_paymentApplicationForEventAppletIdentifier:(id)a3 inContext:(id)a4 withSession:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 paymentPass];
  [v8 activatedPaymentApplications];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  obuint64_t j = (id)[v11 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (!obj)
  {
    id v33 = 0;
    goto LABEL_55;
  }
  id v44 = v8;
  id v45 = v10;
  uint64_t v12 = *(void *)v61;
  id v49 = v9;
  uint64_t v50 = *(void *)v61;
  id v51 = v11;
LABEL_3:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v61 != v12) {
      objc_enumerationMutation(v11);
    }
    id v14 = *(void **)(*((void *)&v60 + 1) + 8 * v13);
    __int16 v15 = objc_msgSend(v14, "applicationIdentifier", v44);
    id v16 = v15;
    if (v7 && v15)
    {
      char v17 = [v15 isEqual:v7];

      if (v17) {
        goto LABEL_35;
      }
    }
    else
    {

      if (v16 == v7)
      {
LABEL_35:
        id v33 = v14;
LABEL_36:
        id v8 = v44;
        id v10 = v45;
        goto LABEL_55;
      }
    }
    uint64_t v18 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: primary applet identifiers do not match, inspecting group AIDs...", buf, 2u);
    }

    if (objc_opt_respondsToSelector())
    {
      id v19 = [v14 applicationIdentifier];
      uint64_t v20 = [v9 appletWithIdentifier:v19];

      if (v20) {
        break;
      }
    }
LABEL_32:
    if (obj == (id)++v13)
    {
      obuint64_t j = (id)[v11 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (obj) {
        goto LABEL_3;
      }
      id v33 = 0;
      goto LABEL_36;
    }
  }
  char v21 = [v20 identifier];
  uint64_t v22 = [v20 groupMemberIDs];
  id v23 = [v20 multiSEGroupMemberIDs];
  if (![v22 count])
  {
    id v24 = v23;
    id v25 = [v20 groupHeadID];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v46 = v21;
      uint64_t v26 = [v9 appletWithIdentifier:v25];
      if (v26)
      {
        id v27 = (void *)v26;
        id v52 = v25;

        uint64_t v28 = [v27 groupMemberIDs];

        uint64_t v47 = [v27 multiSEGroupMemberIDs];

        uint64_t v22 = v27;
        char v21 = v52;
        id v24 = (void *)v47;
      }
      else
      {
        uint64_t v28 = 0;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }

    uint64_t v22 = (void *)v28;
    id v23 = v24;
    id v9 = v49;
    uint64_t v12 = v50;
  }
  uint64_t v53 = v23;
  if ([v23 count])
  {
    __int16 v29 = v21;
    if (v22) {
      id v30 = (id)[v22 mutableCopy];
    }
    else {
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    uint64_t v31 = v30;
    [v30 addObjectsFromArray:v23];
    uint64_t v32 = [v31 copy];

    uint64_t v22 = (void *)v32;
    char v21 = v29;
    uint64_t v12 = v50;
  }
  if (!v7
    || (!v22 || ([v22 containsObject:v7] & 1) == 0)
    && ![v21 isEqualToString:v7])
  {

    id v11 = v51;
    goto LABEL_32;
  }
  char v48 = v21;
  [v45 devicePaymentApplications];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [obja countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v57;
LABEL_40:
    uint64_t v37 = 0;
    while (1)
    {
      if (*(void *)v57 != v36) {
        objc_enumerationMutation(obja);
      }
      long long v38 = *(void **)(*((void *)&v56 + 1) + 8 * v37);
      long long v39 = [v38 applicationIdentifier];
      char v40 = [v39 isEqualToString:v7];

      if (v40) {
        break;
      }
      if (v35 == ++v37)
      {
        uint64_t v35 = [obja countByEnumeratingWithState:&v56 objects:v68 count:16];
        if (v35) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
    }
    id v33 = v38;

    if (!v33) {
      goto LABEL_51;
    }
    id v9 = v49;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      long long v41 = [v33 applicationIdentifier];
      *(_DWORD *)buf = 138412546;
      id v65 = v41;
      __int16 v66 = 2112;
      id v67 = v7;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: Applet is member of group and actual payment application identified; aliasing (%@ ↔ %@).",
        buf,
        0x16u);
    }
    id v10 = v45;
    long long v42 = v48;
  }
  else
  {
LABEL_46:

LABEL_51:
    long long v42 = v48;
    id v9 = v49;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: Applet is member of group but failed to identify actual payment application.", buf, 2u);
    }
    id v33 = 0;
    id v10 = v45;
  }

  id v8 = v44;
  id v11 = v51;
LABEL_55:

  return v33;
}

- (id)_appletForPaymentApplication:(id)a3 inInternalSession:(id)a4
{
  id v6 = a4;
  id v7 = [a3 applicationIdentifier];
  id v8 = [(PKContactlessInterfaceSession *)self _appletWithIdentifier:v7 inInternalSession:v6];

  return v8;
}

- (id)_appletWithIdentifier:(id)a3 inInternalSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && self->_sessionType <= 1)
  {
    id v9 = [v7 nfSession];
    id v10 = [v9 appletWithIdentifier:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_filteredLoyaltyPassesFromVASTransactions:(id)a3 activatedPasses:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if ([v5 count])
  {
    id v30 = v5;
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v29 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          __int16 v15 = objc_msgSend(v14, "passTypeIdentifier", v29);
          id v16 = [v15 dataUsingEncoding:4];
          char v17 = [v16 SHA256Hash];

          uint64_t v18 = [v8 objectForKey:v17];
          if (!v18)
          {
            uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
            [v8 setObject:v18 forKey:v17];
          }
          [v18 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v11);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v30;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "merchant", v29);
          id v25 = [v24 identifier];
          uint64_t v26 = [v8 objectForKey:v25];

          if (v26) {
            [v7 addObjectsFromArray:v26];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v21);
    }

    id v6 = v29;
    id v5 = v30;
  }
  id v27 = objc_msgSend(v7, "copy", v29);

  return v27;
}

- (void)_endPersistentCardEmulationForPaymentPass:(id)a3 paymentApplications:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKContactlessInterfaceSession *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke;
    v23[3] = &unk_1E56DB898;
    id v24 = (PKContactlessInterfaceTransactionContext *)v7;
    id v25 = v6;
    uint64_t v26 = self;
    id v10 = v9;
    id v27 = v10;
    [(PKPaymentSession *)self performBlockSyncOnInternalSession:v23];
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_2;
    block[3] = &unk_1E56D8AB8;
    void block[4] = v8;
    block[5] = self;
    id v22 = v10;
    uint64_t v12 = (PKContactlessInterfaceTransactionContext *)v10;
    dispatch_async(callbackQueue, block);

    uint64_t v13 = v24;
LABEL_5:

    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    id v14 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:v6 activatedPaymentApplications:v7];
    [(PKContactlessInterfaceTransactionContext *)v14 setSuccess:1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_3;
    v19[3] = &unk_1E56DB8C0;
    v19[4] = self;
    __int16 v15 = v14;
    uint64_t v20 = v15;
    [(PKPaymentSession *)self performBlockSyncOnInternalSession:v19];
    id v16 = self->_callbackQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_4;
    v17[3] = &unk_1E56D8AB8;
    void v17[4] = v8;
    v17[5] = self;
    uint64_t v18 = v15;
    uint64_t v12 = v15;
    dispatch_async(v16, v17);

    uint64_t v13 = v20;
    goto LABEL_5;
  }
LABEL_6:
}

void __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
        id v8 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:*(void *)(a1 + 40) activatedPaymentApplications:*(void *)(a1 + 32)];
        [(PKContactlessInterfaceTransactionContext *)v8 setSuccess:1];
        [(PKContactlessInterfaceTransactionContext *)v8 setPaymentApplication:v7];
        if (!*(void *)(*(void *)(a1 + 48) + 152))
        {
          id v9 = objc_opt_class();
          id v10 = [v12 nfSession];
          uint64_t v11 = [v9 transitAppletStateFromPaymentSession:v10 forPaymentApplication:v7];

          if (v11) {
            [(PKContactlessInterfaceTransactionContext *)v8 setTransitHistory:v11];
          }
        }
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v8, v12);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

void __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (id)[*(id *)(a1 + 48) copy];
  [v1 contactlessInterfaceSession:v2 didEndPersistentCardEmulationWithContexts:v3];
}

void __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(void *)(v4 + 152))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = *(id *)(v4 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = objc_opt_class();
          id v12 = objc_msgSend(v3, "nfSession", (void)v14);
          uint64_t v13 = [v11 transitAppletStateFromPaymentSession:v12 forPaymentApplication:v10];

          [*(id *)(a1 + 40) setPaymentApplication:v10];
          if (v13)
          {
            [*(id *)(a1 + 40) setTransitHistory:v13];

            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

uint64_t __95__PKContactlessInterfaceSession__endPersistentCardEmulationForPaymentPass_paymentApplications___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) contactlessInterfaceSession:*(void *)(a1 + 40) didEndPersistentCardEmulationWithContext:*(void *)(a1 + 48)];
}

- (void)_processEndEvent:(id)a3 withPartialContext:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKContactlessInterfaceSession *)self delegate];
  id v9 = [v7 paymentPass];
  uint64_t v10 = [v7 paymentApplication];
  if (!v10)
  {
    long long v15 = [v6 applet];
    long long v16 = [v15 identifier];

    if (v8 && ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0))
    {
      long long v17 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        long long v76 = self;
        __int16 v77 = 2112;
        long long v78 = v16;
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): received event for unexpected applet identifier %@.", buf, 0x16u);
      }

      AnalyticsSendEvent();
      if (objc_opt_respondsToSelector())
      {
        uint64_t v18 = [v7 activatedPaymentApplications];
        uint64_t v19 = [v7 valueAddedServicePasses];
        [v8 contactlessInterfaceSessionDidFail:self forPaymentApplications:v18 paymentPass:v9 valueAddedServicePasses:v19];
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_80;
        }
        uint64_t v18 = [v7 activatedPaymentApplications];
        uint64_t v19 = [v18 firstObject];
        uint64_t v26 = [v7 valueAddedServicePasses];
        [v8 contactlessInterfaceSessionDidFail:self forPaymentApplication:v19 paymentPass:v9 valueAddedServicePasses:v26];
      }
      goto LABEL_80;
    }
    uint64_t v21 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      long long v76 = self;
      __int16 v77 = 2112;
      long long v78 = v16;
      _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): received event for unexpected applet identifier %@; dropped.",
        buf,
        0x16u);
    }
LABEL_57:

    AnalyticsSendEvent();
    goto LABEL_80;
  }
  char v11 = [v6 didError];
  unsigned int v12 = [v6 type];
  uint64_t v13 = [v10 paymentType];
  if ((unint64_t)(v13 - 1001) > 3 || v13 == 1002)
  {
    id v23 = [v6 transactionIdentifier];
    long long v16 = [v23 uppercaseString];

    if (v12 == 256) {
      char v24 = v11;
    }
    else {
      char v24 = 1;
    }
    if ((v24 & 1) == 0)
    {

      long long v16 = 0;
    }
    if (v11)
    {
      if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v25 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          long long v76 = self;
          __int16 v77 = 2112;
          long long v78 = v10;
          __int16 v79 = 1024;
          LODWORD(v80) = [v6 result];
          _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Failed Transaction for %@: result %d.", buf, 0x1Cu);
        }

        AnalyticsSendEvent();
        [v8 contactlessInterfaceSessionDidFailTransaction:self forPaymentApplication:v10 paymentPass:v9];
        goto LABEL_80;
      }
      uint64_t v21 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        long long v76 = self;
        __int16 v77 = 2112;
        long long v78 = v10;
        __int16 v79 = 1024;
        LODWORD(v80) = [v6 result];
        _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Failed Transaction for %@: result %d; dropped.",
          buf,
          0x1Cu);
      }
      goto LABEL_57;
    }
    [v7 setSuccess:1];
    if (v12 <= 0x22 && ((1 << v12) & 0x500000004) != 0)
    {
      [v10 supportsTransitHistory];
      v69 = 0;
      id v27 = 0;
      uint64_t v28 = 1;
      goto LABEL_47;
    }
    if ([v9 isTransitPass]) {
      uint64_t v28 = 2;
    }
    else {
      uint64_t v28 = 0;
    }
    char v35 = [v10 supportsTransitHistory];
    if (v12 != 256 || (v35 & 1) != 0)
    {
      id v27 = 0;
      v69 = 0;
      goto LABEL_70;
    }
    long long v36 = [v7 transitHistory];
    if (!v36
      || ([v10 supportsSuica] & 1) != 0
      || [v6 result] == 61443
      || [v36 source])
    {
      id v27 = 0;
      v69 = 0;
LABEL_69:

LABEL_70:
      if (v28 == 2)
      {
LABEL_71:
        if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          long long v37 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            long long v38 = [v7 transaction];
            *(_DWORD *)buf = 134218498;
            long long v76 = self;
            __int16 v77 = 2112;
            long long v78 = v10;
            __int16 v79 = 2112;
            v80 = v38;
            _os_log_impl(&dword_190E10000, v37, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Successful Transaction for %@: %@.", buf, 0x20u);
          }
          AnalyticsSendEvent();
          [(PKContactlessInterfaceSession *)self _signalWalletTransactionForContext:v7];
          [v8 contactlessInterfaceSession:self didFinishTransactionWithContext:v7];
        }
        else
        {
          long long v39 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            char v40 = [v7 transaction];
            *(_DWORD *)buf = 134218498;
            long long v76 = self;
            __int16 v77 = 2112;
            long long v78 = v10;
            __int16 v79 = 2112;
            v80 = v40;
            _os_log_impl(&dword_190E10000, v39, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Successful Transaction for %@: %@; dropped.",
              buf,
              0x20u);
          }
          AnalyticsSendEvent();
          [(PKContactlessInterfaceSession *)self _signalWalletTransactionForContext:v7];
        }

        goto LABEL_80;
      }
LABEL_47:
      if (([v9 isEMoneyPass] & 1) == 0)
      {
        [v7 setTransitHistory:0];
        id v29 = +[PKPaymentTransaction paymentTransactionWithSource:1];
        [v29 setOriginatedByDevice:1];
        [v29 setTransactionType:v28];
        id v67 = v16;
        [v29 setPaymentHash:v16];
        [v29 addUpdateReasons:1];
        [v7 paymentApplication];
        v31 = id v30 = v27;
        long long v32 = [v31 dpanIdentifier];
        [v29 setDPANIdentifier:v32];

        objc_msgSend(v29, "setPaymentNetworkIdentifier:", objc_msgSend(v31, "paymentNetworkIdentifier"));
        long long v33 = [v7 date];
        [v29 setTransactionDate:v33];

        if (([v6 informative] & 0x100) != 0) {
          uint64_t v34 = 2;
        }
        else {
          uint64_t v34 = 1;
        }
        [v29 setTechnologyType:v34];
        if (v30 && v69)
        {
          [v29 setAmount:v69];
          [v29 setCurrencyCode:v30];
        }
        [v7 setTransaction:v29];

        id v27 = v30;
        long long v16 = v67;
      }
      goto LABEL_71;
    }
    long long v63 = v36;
    uint64_t v64 = v28;
    uint64_t v41 = [v36 historyRecords];
    long long v42 = [v41 firstObject];
    v43 = [v42 felicaHistoryRecord];
    uint64_t v62 = [v43 transactionID];

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    obuint64_t j = v41;
    uint64_t v70 = [obj countByEnumeratingWithState:&v71 objects:v81 count:16];
    if (v70)
    {
      long long v61 = v9;
      char v44 = 0;
      int v66 = 0;
      uint64_t v68 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v70; ++i)
        {
          if (*(void *)v72 != v68) {
            objc_enumerationMutation(obj);
          }
          uint64_t v46 = objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * i), "felicaHistoryRecord", v61);
          uint64_t v47 = v46;
          if (v46)
          {
            char v48 = [v46 transactionType];
            unsigned __int8 v49 = [v48 unsignedIntegerValue];

            if (v49 == 240 || v49 == 74)
            {
              uint64_t v50 = [v47 amountType];
              unsigned __int8 v51 = [v50 unsignedIntegerValue];

              if (v51 != 3)
              {
                id v52 = PKLogFacilityTypeGetObject(6uLL);
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v76) = v51;
                  _os_log_impl(&dword_190E10000, v52, OS_LOG_TYPE_DEFAULT, "Invalid amount type detected for Felica transaction: %d", buf, 8u);
                }
              }
              uint64_t v53 = v49;
              uint64_t v54 = [v47 amount];
              int v55 = [v54 integerValue];

              if (v55 < 0 || v53 == 240) {
                int v57 = v55;
              }
              else {
                int v57 = -v55;
              }
              v66 += v57;
              char v44 = 1;
            }
          }
        }
        uint64_t v70 = [obj countByEnumeratingWithState:&v71 objects:v81 count:16];
      }
      while (v70);

      if (v44)
      {
        int v58 = v66;
        if (v66 >= 0) {
          uint64_t v59 = v66;
        }
        else {
          uint64_t v59 = -v66;
        }
        v69 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v59 exponent:0 isNegative:v66 >> 31];
        id v27 = [v10 appletCurrencyCode];
        if (!v27)
        {
          long long v60 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v60, OS_LOG_TYPE_DEFAULT, "Felica payment transaction missing applet currency code - will be ignored.", buf, 2u);
          }

          int v58 = v66;
        }
        uint64_t v28 = v64;
        if (v58 < 0) {
          uint64_t v28 = 1;
        }
        id v9 = v61;
        goto LABEL_117;
      }
      id v27 = 0;
      v69 = 0;
      id v9 = v61;
    }
    else
    {

      id v27 = 0;
      v69 = 0;
    }
    uint64_t v28 = v64;
LABEL_117:
    long long v16 = v62;
    long long v36 = v63;

    goto LABEL_69;
  }
  if (v11)
  {
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      long long v14 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        long long v76 = self;
        __int16 v77 = 2112;
        long long v78 = v10;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Failed Access Event for %@.", buf, 0x16u);
      }

      [v8 contactlessInterfaceSessionDidFailTransaction:self forPaymentApplication:v10 paymentPass:v9];
      goto LABEL_81;
    }
    long long v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      long long v76 = self;
      __int16 v77 = 2112;
      long long v78 = v10;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Failed Access Event for %@; dropped.",
        buf,
        0x16u);
    }
LABEL_80:

    goto LABEL_81;
  }
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v20 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      long long v76 = self;
      __int16 v77 = 2112;
      long long v78 = v10;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Successful Access Event for %@.", buf, 0x16u);
    }

    [v7 setSuccess:1];
    [(PKContactlessInterfaceSession *)self _signalWalletTransactionForContext:v7];
    [v8 contactlessInterfaceSession:self didFinishTransactionWithContext:v7];
  }
  else
  {
    id v22 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      long long v76 = self;
      __int16 v77 = 2112;
      long long v78 = v10;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): Successful Access Event for %@; dropped.",
        buf,
        0x16u);
    }

    [v7 setSuccess:1];
    [(PKContactlessInterfaceSession *)self _signalWalletTransactionForContext:v7];
  }
LABEL_81:
}

- (void)_signalWalletTransactionForContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 paymentPass];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [v4 valueAddedServicePasses];
    id v7 = [v8 firstObject];
  }
  id v9 = [v4 transaction];
  if (v7)
  {
    uint64_t outstandingTransactionType = self->_outstandingTransactionType;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PKContactlessInterfaceSession__signalWalletTransactionForContext___block_invoke;
    aBlock[3] = &unk_1E56DB8E8;
    char v11 = v7;
    long long v17 = v11;
    unsigned int v12 = _Block_copy(aBlock);
    callbackQueue = self->_callbackQueue;
    if (v9) {
      +[PKWalletTransactionSignal donateSignalForPass:v11 transaction:v9 queue:callbackQueue completion:v12];
    }
    else {
      +[PKWalletTransactionSignal donateSignalForPass:v11 transactionType:outstandingTransactionType queue:callbackQueue completion:v12];
    }

    long long v14 = v17;
  }
  else
  {
    long long v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Unable to donate signal for nil pass!", (uint8_t *)&v15, 2u);
    }
  }
}

void __68__PKContactlessInterfaceSession__signalWalletTransactionForContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) uniqueID];
      int v6 = 138412546;
      id v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Unable to donate signal for pass %@. Error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)loyaltyAndPaymentSessionHasPendingServerRequest:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Received Pending Priority Session Notification...", buf, 2u);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKContactlessInterfaceSession_loyaltyAndPaymentSessionHasPendingServerRequest___block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __81__PKContactlessInterfaceSession_loyaltyAndPaymentSessionHasPendingServerRequest___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  char v2 = objc_opt_respondsToSelector();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    *(unsigned char *)(v3 + 144) = 0;
    [v4 contactlessInterfaceSessionHasPendingServerRequest:*(void *)(a1 + 32)];
  }
  else
  {
    *(unsigned char *)(v3 + 144) = 1;
  }
}

- (void)loyaltyAndPaymentSession:(id)a3 didStartTransaction:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  kdebug_trace();
  int v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Started Transaction Event: %@", buf, 0xCu);
  }

  AnalyticsSendEvent();
  PKTimeProfileBegin((uint64_t)v6, @"contactless_transaction");

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didStartTransaction___block_invoke;
  v8[3] = &unk_1E56DB8C0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v8];
}

void __78__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didStartTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(a1 + 32) + 80))
  {
    *(void *)(*(void *)(a1 + 32) + 96) = mach_absolute_time();
    if ([*(id *)(a1 + 40) paymentMode] == 2)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(NSObject **)(v4 + 136);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didStartTransaction___block_invoke_2;
      block[3] = &unk_1E56D8AB8;
      void block[4] = v4;
      id v7 = *(id *)(a1 + 40);
      id v8 = v3;
      dispatch_async(v5, block);
    }
  }
}

void __78__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didStartTransaction___block_invoke_2(id *a1)
{
  id v8 = [a1[4] delegate];
  if (objc_opt_respondsToSelector())
  {
    char v2 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:*((void *)a1[4] + 5) activatedPaymentApplications:*((void *)a1[4] + 4)];
    id v3 = [a1[5] applet];
    uint64_t v4 = [v3 identifier];

    id v5 = a1[4];
    int v6 = [a1[6] nfSession];
    id v7 = [v5 _paymentApplicationForEventAppletIdentifier:v4 inContext:v2 withSession:v6];
    [(PKContactlessInterfaceTransactionContext *)v2 setPaymentApplication:v7];

    [v8 contactlessInterfaceSessionDidStartTransaction:a1[4] withContext:v2];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v8 contactlessInterfaceSessionDidStartTransaction:a1[4]];
  }
}

- (void)loyaltyAndPaymentSessionDidReceiveActivityTimeout:(id)a3 result:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v7];

  [(PKContactlessInterfaceSession *)self _sessionDidReceiveActivityTimeout:v8 result:v6];
}

- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 result] != 61443)
  {
    kdebug_trace();
    id v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v7;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Finished Transaction Event: %@", buf, 0xCu);
    }

    id v9 = PKTimeProfileEnd(v8, @"contactless_transaction", @"Transaction Event");
    uint64_t v10 = mach_absolute_time();
    double v11 = PKSecondsFromMachTimeInterval(v10 - self->_transactionStartTime);
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v20 = @"duration";
    uint64_t v13 = [NSNumber numberWithDouble:v11];
    uint64_t v21 = v13;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    AnalyticsSendEvent();

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didEndTransaction___block_invoke;
    v16[3] = &unk_1E56DB898;
    v16[4] = self;
    id v17 = v7;
    id v18 = v12;
    id v19 = v6;
    id v15 = v12;
    [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v16];
  }
}

void __76__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didEndTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 80);
  if (!v5)
  {
    id v6 = *(id *)(v4 + 40);
    id v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
    id v8 = *(id *)(*(void *)(a1 + 32) + 64);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = 0;

    [*(id *)(a1 + 32) setState:1];
    double v11 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:v6 activatedPaymentApplications:*(void *)(*(void *)(a1 + 32) + 32)];
    [(PKContactlessInterfaceTransactionContext *)v11 setDate:*(void *)(a1 + 48)];
    uint64_t v12 = [*(id *)(a1 + 32) _filteredLoyaltyPassesFromVASTransactions:v8 activatedPasses:v7];
    [(PKContactlessInterfaceTransactionContext *)v11 setValueAddedServicePasses:v12];

    [(PKContactlessInterfaceTransactionContext *)v11 setValueAddedServiceTransactions:v8];
    uint64_t v13 = *(void **)(a1 + 32);
    long long v14 = [*(id *)(a1 + 40) applet];
    id v15 = [v14 identifier];
    long long v16 = [v3 nfSession];
    id v17 = [v13 _paymentApplicationForEventAppletIdentifier:v15 inContext:v11 withSession:v16];
    [(PKContactlessInterfaceTransactionContext *)v11 setPaymentApplication:v17];

    id v18 = [(PKContactlessInterfaceTransactionContext *)v11 paymentApplication];
    id v19 = v18;
    if (v18)
    {
      int v20 = [v18 supportsTransitHistory];
      if ([*(id *)(a1 + 40) type] == 256 && (v20 & 1) == 0)
      {
        if ([v19 supportsSuica])
        {
          uint64_t v21 = *(void **)(a1 + 56);
          id v22 = [v21 activeApplet];
          id v41 = 0;
          id v23 = [v21 felicaAppletState:v22 error:&v41];
          id v24 = v41;

          uint64_t v25 = 1;
          if (!v23) {
            goto LABEL_16;
          }
        }
        else
        {
          id v23 = [*(id *)(a1 + 40) felicaInfo];
          uint64_t v25 = 0;
          id v24 = 0;
          if (!v23)
          {
LABEL_16:
            id v36 = v24;
            id v30 = PKLogFacilityTypeGetObject(0xCuLL);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v43 = v36;
              _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "\tFailed to acquire Felica state for transaction. Error: %@", buf, 0xCu);
            }

            id v24 = v36;
          }
        }
        uint64_t v28 = [[PKFelicaAppletHistory alloc] initWithDictionary:v23 source:v25];
        [(PKContactlessInterfaceTransactionContext *)v11 setTransitHistory:v28];
        goto LABEL_20;
      }
      if (v20)
      {
        uint64_t v26 = *(void **)(a1 + 56);
        id v27 = [v26 activeApplet];
        id v40 = 0;
        id v23 = [v26 transitAppletState:v27 error:&v40];
        id v24 = v40;

        if (!v23)
        {
          PKLogFacilityTypeGetObject(0xCuLL);
          uint64_t v28 = (PKFelicaAppletHistory *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v28->super.super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v43 = v24;
            _os_log_impl(&dword_190E10000, &v28->super.super, OS_LOG_TYPE_DEFAULT, "\tFailed to acquire transit state for transaction. Error: %@", buf, 0xCu);
          }
          id v23 = 0;
          goto LABEL_20;
        }
        uint64_t v28 = [[PKTransitAppletHistory alloc] initWithDictionary:v23 source:1];
        if (v28)
        {
          [(PKContactlessInterfaceTransactionContext *)v11 setTransitHistory:v28];
          if (!PKTransitDumpStates())
          {
LABEL_20:

            goto LABEL_21;
          }
          log = PKLogFacilityTypeGetObject(0xCuLL);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            [v19 applicationIdentifier];
            id v29 = v35 = v24;
            *(_DWORD *)buf = 138412546;
            id v43 = v29;
            __int16 v44 = 2112;
            id v45 = v23;
            _os_log_impl(&dword_190E10000, log, OS_LOG_TYPE_DEFAULT, "Transit state for AID<%@>:\n%@", buf, 0x16u);

            id v24 = v35;
          }
        }
        else
        {
          log = PKLogFacilityTypeGetObject(0xCuLL);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v43 = v23;
            _os_log_impl(&dword_190E10000, log, OS_LOG_TYPE_DEFAULT, "\tFailed to create transit history from transit state: %@", buf, 0xCu);
          }
        }

        goto LABEL_20;
      }
    }
LABEL_21:
    uint64_t v31 = *(void *)(a1 + 32);
    long long v32 = *(NSObject **)(v31 + 136);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didEndTransaction___block_invoke_180;
    block[3] = &unk_1E56D8AB8;
    void block[4] = v31;
    id v38 = *(id *)(a1 + 40);
    long long v39 = v11;
    long long v33 = v11;
    dispatch_async(v32, block);

    goto LABEL_22;
  }
  PKFieldPropertiesResolveSecondaryLookup(v5, *(void **)(a1 + 40));
  [*(id *)(a1 + 32) _endLookupAndNotify];
LABEL_22:
}

uint64_t __76__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didEndTransaction___block_invoke_180(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processEndEvent:*(void *)(a1 + 40) withPartialContext:*(void *)(a1 + 48)];
}

- (void)loyaltyAndPaymentSession:(id)a3 didExpireTransactionForApplet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v7];

  [(PKContactlessInterfaceSession *)self _session:v8 didExpireTransactionForApplet:v6];
}

- (void)loyaltyAndPaymentSessionDidEndUnexpectedly:(id)a3
{
  id v4 = a3;
  id v5 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v4];

  [(PKContactlessInterfaceSession *)self _sessionDidEndUnexpectedly:v5];
}

- (void)loyaltyAndPaymentSession:(id)a3 didPerformValueAddedServiceTransactions:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session got Value Added Service Transactions: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke;
  v8[3] = &unk_1E56DB8C0;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v8];
}

void __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  id v5 = *(void **)(a1 + 32);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_2;
  v26[3] = &unk_1E56DB910;
  id v6 = v4;
  id v27 = v6;
  uint64_t v28 = &v29;
  [v5 enumerateObjectsUsingBlock:v26];
  id v7 = *(void **)(*(void *)(a1 + 40) + 80);
  if (v7)
  {
    PKFieldPropertiesResolveSecondaryLookup(v7, *(void **)(a1 + 32));
    [*(id *)(a1 + 40) _endLookupAndNotify];
  }
  else if (!*((unsigned char *)v30 + 24))
  {
    id v8 = [v6 firstObject];
    uint64_t v9 = [v8 terminalMode];

    uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 32) count];
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_3;
    v21[3] = &unk_1E56DB938;
    v21[4] = &v22;
    [v6 enumerateObjectsUsingBlock:v21];
    double v11 = [v3 nfSession];
    [v11 setHostCards:0];

    if (v10 && v9 == 3 && *((unsigned char *)v23 + 24))
    {
      uint64_t v12 = [v6 copy];
      uint64_t v13 = *(void *)(a1 + 40);
      long long v14 = *(PKContactlessInterfaceTransactionContext **)(v13 + 64);
      *(void *)(v13 + 64) = v12;
    }
    else
    {
      id v15 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:*(void *)(*(void *)(a1 + 40) + 40) activatedPaymentApplications:*(void *)(*(void *)(a1 + 40) + 32)];
      [(PKContactlessInterfaceTransactionContext *)v15 setValueAddedServiceTransactions:v6];
      long long v16 = [*(id *)(a1 + 40) _filteredLoyaltyPassesFromVASTransactions:v6 activatedPasses:*(void *)(*(void *)(a1 + 40) + 48)];
      [(PKContactlessInterfaceTransactionContext *)v15 setValueAddedServicePasses:v16];

      [*(id *)(a1 + 40) _signalWalletTransactionForContext:v15];
      uint64_t v17 = *(void *)(a1 + 40);
      id v18 = *(NSObject **)(v17 + 136);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_4;
      block[3] = &unk_1E56D8A90;
      void block[4] = v17;
      int v20 = v15;
      long long v14 = v15;
      dispatch_async(v18, block);
    }
    _Block_object_dispose(&v22, 8);
  }

  _Block_object_dispose(&v29, 8);
}

void __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v3 = objc_alloc_init(PKValueAddedServiceTransaction);
  id v4 = objc_alloc_init(PKValueAddedMerchant);
  id v5 = [v17 merchantId];
  [(PKValueAddedMerchant *)v4 setIdentifier:v5];

  [(PKValueAddedServiceTransaction *)v3 setMerchant:v4];
  id v6 = [v17 signupUrl];
  [(PKValueAddedServiceTransaction *)v3 setMerchantURL:v6];

  id v7 = [v17 terminalAppVersion];
  [(PKValueAddedServiceTransaction *)v3 setTerminalApplicationVersion:v7];

  id v8 = [v17 terminalMode];
  unint64_t v9 = [v8 unsignedIntegerValue] - 1;
  if (v9 > 7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_1916732D0[v9];
  }
  [(PKValueAddedServiceTransaction *)v3 setTerminalMode:v10];

  double v11 = [v17 error];
  uint64_t v12 = [v11 code];
  if (v12 == 27012) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = v12 == 27267;
  }
  if (v12 == 25223) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = v13;
  }
  [(PKValueAddedServiceTransaction *)v3 setError:v14];

  id v15 = [v17 didSucceed];
  -[PKValueAddedServiceTransaction setDidSucceed:](v3, "setDidSucceed:", [v15 BOOLValue]);

  long long v16 = [MEMORY[0x1E4F1C9C8] date];
  [(PKValueAddedServiceTransaction *)v3 setTransactionDate:v16];

  [*(id *)(a1 + 32) addObject:v3];
  if (![(PKValueAddedServiceTransaction *)v3 didSucceed]
    && [(PKValueAddedServiceTransaction *)v3 error] == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 didSucceed];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __98__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didPerformValueAddedServiceTransactions___block_invoke_4(uint64_t a1)
{
  char v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session VAS transaction finished.", v4, 2u);
  }

  id v3 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 contactlessInterfaceSession:*(void *)(a1 + 32) didFinishTransactionWithContext:*(void *)(a1 + 40)];
  }
}

- (void)loyaltyAndPaymentSession:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v7];

  [(PKContactlessInterfaceSession *)self _session:v8 didEnterFieldWithNotification:v6];
}

- (void)loyaltyAndPaymentSessionDidExitField:(id)a3
{
  id v4 = a3;
  id v5 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v4];

  [(PKContactlessInterfaceSession *)self _sessionDidExitField:v5];
}

- (void)loyaltyAndPaymentSession:(id)a3 didSelectApplet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v7];

  [(PKContactlessInterfaceSession *)self _session:v8 didSelectApplet:v6];
}

- (void)loyaltyAndPaymentSession:(id)a3 didSelectValueAddedService:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Did Select Value Added Service", buf, 2u);
    }

    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didSelectValueAddedService___block_invoke;
    block[3] = &unk_1E56D8AE0;
    void block[4] = self;
    dispatch_async(callbackQueue, block);
  }
}

void __85__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didSelectValueAddedService___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contactlessInterfaceSessionDidSelectValueAddedService:*(void *)(a1 + 32)];
  }
}

- (void)loyaltyAndPaymentSession:(id)a3 didFailDeferredAuthorization:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v6];

  [(PKContactlessInterfaceSession *)self _session:v7 didFailDeferredAuthorization:v4];
}

- (void)loyaltyAndPaymentSession:(id)a3 didFelicaStateChange:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didFelicaStateChange___block_invoke;
  v4[3] = &unk_1E56DB628;
  v4[4] = self;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v4, a4);
}

uint64_t __79__PKContactlessInterfaceSession_loyaltyAndPaymentSession_didFelicaStateChange___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 120) = 1;
  return result;
}

- (void)loyaltyAndPaymentSession:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v9];

  [(PKContactlessInterfaceSession *)self _session:v10 didExpressModeStateChange:v5 withObject:v8];
}

- (void)session:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSString;
  if (PKGetConstantStringNF_SECURE_XPC_EVENT_KEY_EVENT_NAME_onceToken != -1) {
    dispatch_once(&PKGetConstantStringNF_SECURE_XPC_EVENT_KEY_EVENT_NAME_onceToken, &__block_literal_global_109_0);
  }
  id v9 = [v8 stringWithUTF8String:PKGetConstantStringNF_SECURE_XPC_EVENT_KEY_EVENT_NAME_constant];
  uint64_t v10 = [v7 objectForKey:v9];
  double v11 = [v10 stringValue];

  if ([v11 isEqualToString:@"com.apple.secureelementservice.dck.event.vehicle.did.lock"])
  {
    uint64_t v12 = 1;
  }
  else
  {
    if (![v11 isEqualToString:@"com.apple.secureelementservice.dck.event.vehicle.did.unlock"])goto LABEL_13; {
    uint64_t v12 = 2;
    }
  }
  uint64_t v13 = PKGetConstantStringNF_DCK_EVENT_KEY_APPLET_IDENTIFIER();
  uint64_t v14 = [v7 objectForKey:v13];
  id v15 = [v14 stringValue];

  if (v15)
  {
    uint64_t v31 = v12;
    long long v16 = PKGetConstantStringNF_DCK_EVENT_KEY_KEY_IDENTIFIER();
    id v17 = [v7 objectForKey:v16];
    id v18 = [v17 stringValue];

    id v19 = self->_activatedPaymentPass;
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v21 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:v19 activatedPaymentApplications:self->_activatedPaymentApplications];
    char v32 = (void *)v20;
    [(PKContactlessInterfaceTransactionContext *)v21 setDate:v20];
    [(PKContactlessInterfaceTransactionContext *)v21 setAppletIdentifier:v15];
    [(PKContactlessInterfaceTransactionContext *)v21 setCredentialIdentifier:v18];
    uint64_t v22 = [(PKContactlessInterfaceSession *)self _paymentApplicationForEventAppletIdentifier:v15 inContext:v21 withSession:v6];
    [(PKContactlessInterfaceTransactionContext *)v21 setPaymentApplication:v22];

    id v23 = [(PKContactlessInterfaceTransactionContext *)v21 paymentApplication];

    if (v23)
    {
      [(PKObject *)v19 uniqueID];
      id v30 = v19;
      char v25 = v24 = v6;
      id v26 = +[PKExpressTransactionState createForStandaloneTransaction:v31 applicationIdentifier:v15 keyIdentifier:v18 passUniqueIdentifier:v25];

      id v6 = v24;
      id v19 = v30;
    }
    else
    {
      id v26 = +[PKExpressTransactionState createForStandaloneTransaction:v31 applicationIdentifier:v15 keyIdentifier:v18 passUniqueIdentifier:0];
    }
    uint64_t v27 = [v26 status];
    [(PKContactlessInterfaceTransactionContext *)v21 setExpressState:v26];
    [(PKContactlessInterfaceTransactionContext *)v21 setSuccess:v27 == 1];
    [(PKContactlessInterfaceTransactionContext *)v21 setIncompatible:v27 == 3];
    [(PKContactlessInterfaceSession *)self _signalWalletTransactionForContext:v21];
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PKContactlessInterfaceSession_session_event___block_invoke;
    block[3] = &unk_1E56D8A90;
    void block[4] = self;
    uint64_t v34 = v21;
    uint64_t v29 = v21;
    dispatch_async(callbackQueue, block);
  }
LABEL_13:
}

void __47__PKContactlessInterfaceSession_session_event___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contactlessInterfaceSession:*(void *)(a1 + 32) didFinishTransactionWithContext:*(void *)(a1 + 40)];
  }
}

- (void)session:(id)a3 didStartTransaction:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  kdebug_trace();
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Started Transaction Event: %@", buf, 0xCu);
  }

  AnalyticsSendEvent();
  PKTimeProfileBegin((uint64_t)v6, @"contactless_transaction");

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PKContactlessInterfaceSession_session_didStartTransaction___block_invoke;
  v8[3] = &unk_1E56DB8C0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v8];
}

void __61__PKContactlessInterfaceSession_session_didStartTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(a1 + 32) + 80))
  {
    *(void *)(*(void *)(a1 + 32) + 96) = mach_absolute_time();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(NSObject **)(v4 + 136);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PKContactlessInterfaceSession_session_didStartTransaction___block_invoke_2;
    block[3] = &unk_1E56D8AB8;
    void block[4] = v4;
    id v7 = *(id *)(a1 + 40);
    id v8 = v3;
    dispatch_async(v5, block);
  }
}

void __61__PKContactlessInterfaceSession_session_didStartTransaction___block_invoke_2(id *a1)
{
  id v8 = [a1[4] delegate];
  if (objc_opt_respondsToSelector())
  {
    id v2 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:*((void *)a1[4] + 5) activatedPaymentApplications:*((void *)a1[4] + 4)];
    id v3 = [a1[5] applet];
    uint64_t v4 = [v3 identifier];

    id v5 = a1[4];
    id v6 = [a1[6] nfSession];
    id v7 = [v5 _paymentApplicationForEventAppletIdentifier:v4 inContext:v2 withSession:v6];
    [(PKContactlessInterfaceTransactionContext *)v2 setPaymentApplication:v7];

    [v8 contactlessInterfaceSessionDidStartTransaction:a1[4] withContext:v2];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v8 contactlessInterfaceSessionDidStartTransaction:a1[4]];
  }
}

- (void)session:(id)a3 didEndTransaction:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  kdebug_trace();
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Finished Transaction Event: %@", buf, 0xCu);
  }

  id v7 = PKTimeProfileEnd(v6, @"contactless_transaction", @"Transaction Event");
  uint64_t v8 = mach_absolute_time();
  double v9 = PKSecondsFromMachTimeInterval(v8 - self->_transactionStartTime);
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  id v18 = @"duration";
  id v11 = [NSNumber numberWithDouble:v9];
  id v19 = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  AnalyticsSendEvent();

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__PKContactlessInterfaceSession_session_didEndTransaction___block_invoke;
  v15[3] = &unk_1E56DB708;
  v15[4] = self;
  id v16 = v5;
  id v17 = v10;
  id v13 = v10;
  id v14 = v5;
  [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v15];
}

void __59__PKContactlessInterfaceSession_session_didEndTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 80);
  if (v5)
  {
    PKFieldPropertiesResolveSecondaryLookup(v5, *(void **)(a1 + 40));
    [*(id *)(a1 + 32) _endLookupAndNotify];
  }
  else
  {
    id v6 = *(id *)(v4 + 40);
    [*(id *)(a1 + 32) setState:1];
    id v7 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:v6 activatedPaymentApplications:*(void *)(*(void *)(a1 + 32) + 32)];
    [(PKContactlessInterfaceTransactionContext *)v7 setDate:*(void *)(a1 + 48)];
    uint64_t v8 = [*(id *)(a1 + 40) applet];
    double v9 = [v8 identifier];

    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [v3 nfSession];
    uint64_t v12 = [v10 _paymentApplicationForEventAppletIdentifier:v9 inContext:v7 withSession:v11];
    [(PKContactlessInterfaceTransactionContext *)v7 setPaymentApplication:v12];

    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(NSObject **)(v13 + 136);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PKContactlessInterfaceSession_session_didEndTransaction___block_invoke_2;
    block[3] = &unk_1E56DB960;
    void block[4] = v13;
    id v19 = v7;
    id v20 = *(id *)(a1 + 40);
    id v21 = v6;
    id v22 = v9;
    id v15 = v9;
    id v16 = v6;
    id v17 = v7;
    dispatch_async(v14, block);
  }
}

void __59__PKContactlessInterfaceSession_session_didEndTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [*(id *)(a1 + 40) paymentApplication];
  if (!v3)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = *(void **)(a1 + 64);
      int v19 = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Received an Unexpected Applet Identifier: %@", (uint8_t *)&v19, 0xCu);
    }

    AnalyticsSendEvent();
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [*(id *)(a1 + 40) activatedPaymentApplications];
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = [*(id *)(a1 + 40) valueAddedServicePasses];
      [v2 contactlessInterfaceSessionDidFail:v10 forPaymentApplications:v11 paymentPass:v12 valueAddedServicePasses:v13];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v15 = *(void *)(a1 + 32);
      id v11 = [*(id *)(a1 + 40) activatedPaymentApplications];
      id v16 = [v11 firstObject];
      uint64_t v17 = *(void *)(a1 + 56);
      id v18 = [*(id *)(a1 + 40) valueAddedServicePasses];
      [v2 contactlessInterfaceSessionDidFail:v15 forPaymentApplication:v16 paymentPass:v17 valueAddedServicePasses:v18];
    }
    goto LABEL_22;
  }
  char v4 = [*(id *)(a1 + 48) didError];
  unint64_t v5 = [v3 paymentType] - 1001;
  if (v5 <= 3 && v5 != 1)
  {
    if (v4)
    {
      id v7 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v3;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Reported Failed Access Event (Payment Application: %@)", (uint8_t *)&v19, 0xCu);
      }

      if (objc_opt_respondsToSelector()) {
        [v2 contactlessInterfaceSessionDidFailTransaction:*(void *)(a1 + 32) forPaymentApplication:v3 paymentPass:*(void *)(a1 + 56)];
      }
    }
    else
    {
      [*(id *)(a1 + 40) setSuccess:1];
      id v14 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v3;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Reported Successful Access Event (Payment Application: %@)", (uint8_t *)&v19, 0xCu);
      }

      [*(id *)(a1 + 32) _signalWalletTransactionForContext:*(void *)(a1 + 40)];
      if (objc_opt_respondsToSelector()) {
        [v2 contactlessInterfaceSession:*(void *)(a1 + 32) didFinishTransactionWithContext:*(void *)(a1 + 40)];
      }
    }
  }
LABEL_22:
}

- (void)session:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v7];

  [(PKContactlessInterfaceSession *)self _session:v8 didEnterFieldWithNotification:v6];
}

- (void)sessionDidExitField:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v4];

  [(PKContactlessInterfaceSession *)self _sessionDidExitField:v5];
}

- (void)session:(id)a3 didSelectApplet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v7];

  [(PKContactlessInterfaceSession *)self _session:v8 didSelectApplet:v6];
}

- (void)session:(id)a3 didExpireTransactionForApplet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v7];

  [(PKContactlessInterfaceSession *)self _session:v8 didExpireTransactionForApplet:v6];
}

- (void)sessionDidEndUnexpectedly:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v4];

  [(PKContactlessInterfaceSession *)self _sessionDidEndUnexpectedly:v5];
}

- (void)sessionDidFailDeferredAuthorization:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v4];

  [(PKContactlessInterfaceSession *)self _session:v5 didFailDeferredAuthorization:1];
}

- (void)sessionDidReceiveActivityTimeout:(id)a3 result:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v7];

  [(PKContactlessInterfaceSession *)self _sessionDidReceiveActivityTimeout:v8 result:v6];
}

- (void)session:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v9];

  [(PKContactlessInterfaceSession *)self _session:v10 didExpressModeStateChange:v5 withObject:v8];
}

- (void)stsSession:(id)a3 didReceiveFieldNotification:(id)a4
{
  id v5 = a4;
  kdebug_trace();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKContactlessInterfaceSession_stsSession_didReceiveFieldNotification___block_invoke;
  v7[3] = &unk_1E56DB8C0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v7];
}

void __72__PKContactlessInterfaceSession_stsSession_didReceiveFieldNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 104));
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 40);
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Did Enter Field: %@", (uint8_t *)&v13, 0xCu);
  }

  id v6 = +[PKFieldProperties fieldPropertiesForSTSFieldNotification:*(void *)(a1 + 40)];
  BOOL v7 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v7)
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session did identify field properties: %@", (uint8_t *)&v13, 0xCu);
    }

    unint64_t v8 = [v6 terminalType];
    if (v8 >= 6)
    {
      __break(1u);
      return;
    }
    int v9 = dword_191673310[v8];
  }
  else
  {
    if (v7)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session did not identify field properties", (uint8_t *)&v13, 2u);
    }

    int v9 = PKWalletTransactionTypeForSTSTerminalType([*(id *)(a1 + 40) terminalType]);
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 168) = v9;
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(void *)(v10 + 128) != 2)
  {
    objc_storeStrong((id *)(v10 + 80), v6);
    BOOL CanLookupSecondaryProperties = PKFieldPropertiesCanLookupSecondaryProperties(*(void **)(*(void *)(a1 + 32) + 80));
    uint64_t v12 = *(id **)(a1 + 32);
    if (CanLookupSecondaryProperties)
    {
      [v12[10] setSecondaryPropertiesRequired:1];
      [*(id *)(a1 + 32) _startLookup];
    }
    else
    {
      [v12 _endLookupAndNotify];
    }
  }
}

- (void)stsSession:(id)a3 didStartTransaction:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  kdebug_trace();
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = [v5 credential];
    *(_DWORD *)buf = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Started Transaction Event: %@, credential: %@", buf, 0x16u);
  }
  AnalyticsSendEvent();
  PKTimeProfileBegin((uint64_t)v6, @"contactless_transaction");

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PKContactlessInterfaceSession_stsSession_didStartTransaction___block_invoke;
  v9[3] = &unk_1E56DB8C0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v9];
}

void __64__PKContactlessInterfaceSession_stsSession_didStartTransaction___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 80))
  {
    *(void *)(*(void *)(a1 + 32) + 96) = mach_absolute_time();
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(NSObject **)(v2 + 136);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __64__PKContactlessInterfaceSession_stsSession_didStartTransaction___block_invoke_2;
    v4[3] = &unk_1E56D8A90;
    v4[4] = v2;
    id v5 = *(id *)(a1 + 40);
    dispatch_async(v3, v4);
  }
}

void __64__PKContactlessInterfaceSession_stsSession_didStartTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = *(id *)(*(void *)(a1 + 32) + 40);
    id v4 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:v3 activatedPaymentApplications:*(void *)(*(void *)(a1 + 32) + 32)];
    id v5 = [*(id *)(a1 + 40) credential];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = objc_msgSend(v3, "devicePaymentApplications", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (PKPaymentApplicationMatchesSTSEventCredential(v11, v5))
          {
            [(PKContactlessInterfaceTransactionContext *)v4 setPaymentApplication:v11];
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    [v2 contactlessInterfaceSessionDidStartTransaction:*(void *)(a1 + 32) withContext:v4];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v2 contactlessInterfaceSessionDidStartTransaction:*(void *)(a1 + 32)];
  }
}

- (void)stsSession:(id)a3 didEndTransaction:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = (PKPaymentPass *)a4;
  kdebug_trace();
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v48 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Finished Transaction Event: %@", buf, 0xCu);
  }

  id v7 = PKTimeProfileEnd(v6, @"contactless_transaction", @"Transaction Event");
  uint64_t v8 = mach_absolute_time();
  double v9 = PKSecondsFromMachTimeInterval(v8 - self->_transactionStartTime);
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  id v11 = self->_activatedPaymentPass;
  long long v12 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:v11 activatedPaymentApplications:self->_activatedPaymentApplications];
  uint64_t v31 = (void *)v10;
  [(PKContactlessInterfaceTransactionContext *)v12 setDate:v10];
  char v32 = v5;
  long long v13 = [(PKPaymentPass *)v5 credential];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v14 = [(PKSecureElementPass *)v11 devicePaymentApplications];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        int v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (PKPaymentApplicationMatchesSTSEventCredential(v19, v13))
        {
          [(PKContactlessInterfaceTransactionContext *)v12 setPaymentApplication:v19];
          goto LABEL_13;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  id v20 = [(PKContactlessInterfaceTransactionContext *)v12 paymentApplication];

  if (v20)
  {
    __int16 v44 = @"duration";
    uint64_t v21 = [NSNumber numberWithDouble:v9];
    id v45 = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    AnalyticsSendEvent();

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke;
    v36[3] = &unk_1E56DB898;
    v36[4] = self;
    id v23 = (id *)&v37;
    id v24 = v32;
    char v25 = (id *)&v38;
    long long v37 = v32;
    id v38 = v12;
    long long v39 = v11;
    id v26 = v11;
    uint64_t v27 = v12;
    [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v36];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      char v48 = v11;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: STS event does not match active pass %@", buf, 0xCu);
    }

    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke_197;
    block[3] = &unk_1E56D8AB8;
    id v23 = (id *)&v34;
    void block[4] = self;
    uint64_t v34 = v12;
    char v25 = (id *)&v35;
    id v35 = v11;
    uint64_t v29 = v11;
    id v30 = v12;
    dispatch_async(callbackQueue, block);
    id v24 = v32;
  }
}

void __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 136);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke_2;
  v4[3] = &unk_1E56DB988;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  dispatch_async(v3, v4);
}

void __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if ([*(id *)(a1 + 40) status])
  {
    id v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 48) paymentApplication];
      int v13 = 138412290;
      long long v14 = v4;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Reported Failed Transaction Event (Payment Application: %@)", (uint8_t *)&v13, 0xCu);
    }
    if ([*(id *)(a1 + 40) status] == 4)
    {
      if (objc_opt_respondsToSelector()) {
        [v2 contactlessInterfaceSessionDidReceiveUntrustedTerminal:*(void *)(a1 + 32)];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = *(void *)(a1 + 32);
      long long v12 = [*(id *)(a1 + 48) paymentApplication];
      [v2 contactlessInterfaceSessionDidFailTransaction:v11 forPaymentApplication:v12 paymentPass:*(void *)(a1 + 56)];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setState:1];
    [*(id *)(a1 + 48) setSuccess:1];
    if (*(void *)(*(void *)(a1 + 32) + 160))
    {
      id v5 = objc_alloc_init(PKPaymentTransaction);
      [(PKPaymentTransaction *)v5 setTransactionSource:1];
      [(PKPaymentTransaction *)v5 setTransactionType:15];
      id v6 = [MEMORY[0x1E4F1C9C8] date];
      [(PKPaymentTransaction *)v5 setTransactionDate:v6];

      [(PKPaymentTransaction *)v5 setTransactionStatus:1];
      id v7 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v8 = [v7 UUIDString];
      [(PKPaymentTransaction *)v5 setIdentifier:v8];

      [(PKPaymentTransaction *)v5 setOriginatedByDevice:1];
      [(PKPaymentTransaction *)v5 setReleasedData:*(void *)(*(void *)(a1 + 32) + 160)];
      [(PKPaymentTransaction *)v5 setHasNotificationServiceData:1];
      [*(id *)(a1 + 48) setTransaction:v5];
    }
    double v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 48) paymentApplication];
      int v13 = 138412290;
      long long v14 = v10;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Reported Successful Transaction Event (Payment Application: %@)", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 32) _signalWalletTransactionForContext:*(void *)(a1 + 48)];
    if (objc_opt_respondsToSelector()) {
      [v2 contactlessInterfaceSession:*(void *)(a1 + 32) didFinishTransactionWithContext:*(void *)(a1 + 48)];
    }
  }
}

void __62__PKContactlessInterfaceSession_stsSession_didEndTransaction___block_invoke_197(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  AnalyticsSendEvent();
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) activatedPaymentApplications];
    [v6 contactlessInterfaceSessionDidFail:v2 forPaymentApplications:v3 paymentPass:*(void *)(a1 + 48) valueAddedServicePasses:0];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) activatedPaymentApplications];
    id v5 = [v3 firstObject];
    [v6 contactlessInterfaceSessionDidFail:v4 forPaymentApplication:v5 paymentPass:*(void *)(a1 + 48) valueAddedServicePasses:0];
  }
LABEL_6:
}

- (void)stsSessionDidEndUnexpectedly:(id)a3 errorCode:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    unint64_t v11 = a4;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session did end unexpectedly, error: %lu", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = [(PKContactlessInterfaceSession *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = 1;
    switch(a4)
    {
      case 3uLL:
        break;
      case 4uLL:
        uint64_t v9 = 3;
        goto LABEL_8;
      case 5uLL:
        goto LABEL_8;
      case 6uLL:
        uint64_t v9 = 2;
        goto LABEL_8;
      default:
        uint64_t v9 = 0;
LABEL_8:
        [v8 contactlessInterfaceSessionDidTerminate:self withErrorCode:v9];
        break;
    }
  }
}

- (void)stsSession:(id)a3 didReceiveActivityTimeout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PKTransactionSessionWrapper alloc] initWithSTSSession:v7];

  [(PKContactlessInterfaceSession *)self _sessionDidReceiveActivityTimeout:v8 result:v6];
}

- (void)stsSession:(id)a3 didChangeExpressModeWithInfo:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 state];
  switch((int)v7)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      goto LABEL_2;
    case 9:
    case 10:
      uint64_t v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v10 = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session dropping lock / unlock event.", v10, 2u);
      }

      break;
    default:
      uint64_t v7 = 0;
LABEL_2:
      uint64_t v8 = [[PKTransactionSessionWrapper alloc] initWithSTSSession:v6];
      [(PKContactlessInterfaceSession *)self _session:v8 didExpressModeStateChange:v7 withObject:0];

      break;
  }
}

- (void)stsSession:(id)a3 didExpireTransaction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"N";
    if (v4) {
      uint64_t v8 = @"Y";
    }
    int v10 = 138412290;
    unint64_t v11 = v8;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session didExpireTransaction: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v4)
  {
    uint64_t v9 = [[PKTransactionSessionWrapper alloc] initWithSTSSession:v6];
    [(PKContactlessInterfaceSession *)self _session:v9 didExpireTransactionForApplet:0];
  }
}

- (void)stsSession:(id)a3 didReceive18013Requests:(id)a4 readerAuthInfo:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v8 = a4;
  id v39 = a5;
  kdebug_trace();
  uint64_t v9 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v73 = v8;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Received ISO18013 Requests %@", buf, 0xCu);
  }
  long long v43 = v8;

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v40 = self;
  obuint64_t j = self->_activatedPaymentApplications;
  uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v65 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * i), "subcredentials", v39);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v61 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = [*(id *)(*((void *)&v60 + 1) + 8 * j) identifier];
              objc_msgSend(v10, "pk_safelyAddObject:", v20);
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v60 objects:v70 count:16];
          }
          while (v17);
        }
      }
      uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v71 count:16];
    }
    while (v12);
  }

  id v45 = (void *)[v10 copy];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  long long v56 = 0u;
  id v42 = v43;
  uint64_t v21 = [v42 countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    id obja = 0;
    uint64_t v44 = *(void *)v57;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v57 != v44) {
          objc_enumerationMutation(v42);
        }
        id v24 = *(void **)(*((void *)&v56 + 1) + 8 * k);
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v25 = v45;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v68 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v53;
          while (2)
          {
            for (uint64_t m = 0; m != v27; ++m)
            {
              if (*(void *)v53 != v28) {
                objc_enumerationMutation(v25);
              }
              id v30 = *(void **)(*((void *)&v52 + 1) + 8 * m);
              objc_msgSend(v24, "credentialIdentifier", v39);
              id v31 = (id)objc_claimAutoreleasedReturnValue();
              id v32 = v30;
              long long v33 = v32;
              if (v31 == v32)
              {

LABEL_39:
                id v36 = v24;

                id obja = v36;
                goto LABEL_40;
              }
              if (v32) {
                BOOL v34 = v31 == 0;
              }
              else {
                BOOL v34 = 1;
              }
              if (v34)
              {
              }
              else
              {
                int v35 = [v31 isEqualToString:v32];

                if (v35) {
                  goto LABEL_39;
                }
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v52 objects:v68 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }
LABEL_40:
      }
      uint64_t v22 = [v42 countByEnumeratingWithState:&v56 objects:v69 count:16];
    }
    while (v22);
  }
  else
  {
    id obja = 0;
  }

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __83__PKContactlessInterfaceSession_stsSession_didReceive18013Requests_readerAuthInfo___block_invoke;
  v48[3] = &unk_1E56DB708;
  id v49 = obja;
  uint64_t v50 = v40;
  id v51 = v39;
  id v37 = v39;
  id v38 = obja;
  [(PKPaymentSession *)v40 performBlockAsyncOnInternalSession:v48];
}

void __83__PKContactlessInterfaceSession_stsSession_didReceive18013Requests_readerAuthInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(NSObject **)(v5 + 136);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__PKContactlessInterfaceSession_stsSession_didReceive18013Requests_readerAuthInfo___block_invoke_207;
    block[3] = &unk_1E56D8AB8;
    void block[4] = v5;
    id v11 = v4;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v6, block);
  }
  else
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Stopping Transaction", buf, 2u);
    }

    id v8 = [v3 stsSession];
    uint64_t v9 = [v8 stopTransaction];

    if (v9)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v14 = v9;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Could Not Stop Transaction with Error %@", buf, 0xCu);
      }
    }
  }
}

void __83__PKContactlessInterfaceSession_stsSession_didReceive18013Requests_readerAuthInfo___block_invoke_207(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contactlessInterfaceSession:*(void *)(a1 + 32) didReceive18013Request:*(void *)(a1 + 40) readerAuthInfo:*(void *)(a1 + 48)];
  }
}

- (void)stsSessionRequestHandoffConfirmation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: Requested handoff confirmation", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKContactlessInterfaceSession_stsSessionRequestHandoffConfirmation___block_invoke;
  v7[3] = &unk_1E56DB8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v7];
}

void __70__PKContactlessInterfaceSession_stsSessionRequestHandoffConfirmation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 147))
  {
    *(unsigned char *)(v4 + 148) = 1;
    uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session waiting to confirm handoff", buf, 2u);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) startHandoff];
    if (v5)
    {
      id v6 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v5;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session: failed to start handoff with error %@", buf, 0xCu);
      }

      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(NSObject **)(v7 + 136);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__PKContactlessInterfaceSession_stsSessionRequestHandoffConfirmation___block_invoke_210;
      block[3] = &unk_1E56D8AE0;
      void block[4] = v7;
      dispatch_async(v8, block);
    }
  }
}

void __70__PKContactlessInterfaceSession_stsSessionRequestHandoffConfirmation___block_invoke_210(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 32) firstObject];
    [v3 contactlessInterfaceSessionDidFailTransaction:*(void *)(a1 + 32) forPaymentApplication:v2 paymentPass:*(void *)(*(void *)(a1 + 32) + 40)];
  }
}

- (void)handleSessionSuspended:(id)a3 withToken:(id)a4
{
  id v5 = a4;
  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PKContactlessInterfaceSession_handleSessionSuspended_withToken___block_invoke;
  v8[3] = &unk_1E56D8A90;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(callbackQueue, v8);
}

void __66__PKContactlessInterfaceSession_handleSessionSuspended_withToken___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contactlessInterfaceSession:*(void *)(a1 + 32) didSuspendWithToken:*(void *)(a1 + 40)];
  }
}

- (void)handleSessionResumed:(id)a3
{
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKContactlessInterfaceSession_handleSessionResumed___block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __54__PKContactlessInterfaceSession_handleSessionResumed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contactlessInterfaceSessionDidResume:*(void *)(a1 + 32)];
  }
}

- (void)_session:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5 = a4;
  kdebug_trace();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKContactlessInterfaceSession__session_didEnterFieldWithNotification___block_invoke;
  v7[3] = &unk_1E56DB8C0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v7];
}

void __72__PKContactlessInterfaceSession__session_didEnterFieldWithNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 104));
  uint64_t v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 40);
    int v14 = 138412290;
    uint64_t v15 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Did Enter Field: %@", (uint8_t *)&v14, 0xCu);
  }

  id v6 = +[PKFieldProperties fieldPropertiesForFieldNotification:*(void *)(a1 + 40)];
  BOOL v7 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v7)
    {
      int v14 = 138412290;
      uint64_t v15 = v6;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session did identify field properties: %@", (uint8_t *)&v14, 0xCu);
    }

    unint64_t v8 = [v6 terminalType];
    if (v8 < 6)
    {
      id v9 = &dword_191673310[v8];
      goto LABEL_12;
    }
LABEL_17:
    __break(1u);
  }
  if (v7)
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session did not identify field properties", (uint8_t *)&v14, 2u);
  }

  uint64_t v10 = [*(id *)(a1 + 40) notificationType];
  if ((unint64_t)(v10 - 1) >= 3) {
    goto LABEL_17;
  }
  id v9 = (_DWORD *)((char *)&unk_191673328 + 4 * v10 - 4);
LABEL_12:
  *(_DWORD *)(*(void *)(a1 + 32) + 168) = *v9;
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(void *)(v11 + 128) != 2)
  {
    objc_storeStrong((id *)(v11 + 80), v6);
    BOOL CanLookupSecondaryProperties = PKFieldPropertiesCanLookupSecondaryProperties(*(void **)(*(void *)(a1 + 32) + 80));
    uint64_t v13 = *(id **)(a1 + 32);
    if (CanLookupSecondaryProperties)
    {
      [v13[10] setSecondaryPropertiesRequired:1];
      [*(id *)(a1 + 32) _startLookup];
    }
    else
    {
      [v13 _endLookupAndNotify];
    }
  }
}

- (void)_sessionDidExitField:(id)a3
{
  kdebug_trace();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PKContactlessInterfaceSession__sessionDidExitField___block_invoke;
  v4[3] = &unk_1E56DB628;
  v4[4] = self;
  [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v4];
}

void __54__PKContactlessInterfaceSession__sessionDidExitField___block_invoke(uint64_t a1)
{
  int v2 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(a1 + 32) + 104), (unsigned __int8 *)&v2, 0);
  BOOL v3 = v2 == 1;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0;

  id v6 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    unint64_t v8 = "Contactless Interface Session Did Exit Field";
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    unint64_t v8 = "Contactless Interface Session Did Exit Field (unbalanced)";
  }
  _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
LABEL_7:

  id v9 = *(void **)(a1 + 32);
  if (v9[10]) {
    [v9 _endLookup];
  }
  if (v3)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(NSObject **)(v10 + 136);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PKContactlessInterfaceSession__sessionDidExitField___block_invoke_215;
    block[3] = &unk_1E56D8AE0;
    void block[4] = v10;
    dispatch_async(v11, block);
  }
}

void __54__PKContactlessInterfaceSession__sessionDidExitField___block_invoke_215(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contactlessInterfaceSessionDidExitField:*(void *)(a1 + 32)];
  }
}

- (void)_session:(id)a3 didSelectApplet:(id)a4
{
  id v5 = objc_msgSend(a4, "identifier", a3);
  int v6 = [v5 isEqualToString:@"325041592E5359532E4444463031"];

  if (v6)
  {
    BOOL v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Did Select Payment (PPSE)", buf, 2u);
    }

    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PKContactlessInterfaceSession__session_didSelectApplet___block_invoke;
    block[3] = &unk_1E56D8AE0;
    void block[4] = self;
    dispatch_async(callbackQueue, block);
  }
}

void __58__PKContactlessInterfaceSession__session_didSelectApplet___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contactlessInterfaceSessionDidSelectPayment:*(void *)(a1 + 32)];
  }
}

- (void)_session:(id)a3 didExpireTransactionForApplet:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__PKContactlessInterfaceSession__session_didExpireTransactionForApplet___block_invoke;
  v4[3] = &unk_1E56DB628;
  v4[4] = self;
  -[PKPaymentSession performBlockAsyncOnInternalSession:](self, "performBlockAsyncOnInternalSession:", v4, a4);
}

void __72__PKContactlessInterfaceSession__session_didExpireTransactionForApplet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) setState:1];
  uint64_t v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 32);
    *(_DWORD *)buf = 138412290;
    id v23 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Timed Out (Payment Applications: %@)", buf, 0xCu);
  }

  id v6 = *(id *)(*(void *)(a1 + 32) + 40);
  id v7 = *(id *)(*(void *)(a1 + 32) + 48);
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 145));
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(void *)(v9 + 152))
    {
      id v10 = 0;
    }
    else
    {
      uint64_t v11 = (unsigned __int8 *)(v9 + 145);
      uint64_t v12 = [v3 nfSession];
      id v21 = 0;
      char v13 = [v12 enablePlasticCardMode:0 error:&v21];
      id v10 = v21;
      atomic_store(v13 ^ 1, v11);

      if (v10)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v10;
          _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to disable Persistent Card Emulation. Error: %@", buf, 0xCu);
        }
      }
    }
    if (v6 && [*(id *)(*(void *)(a1 + 32) + 32) count]) {
      [*(id *)(a1 + 32) _endPersistentCardEmulationForPaymentPass:v6 paymentApplications:*(void *)(*(void *)(a1 + 32) + 32)];
    }
  }
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(NSObject **)(v14 + 136);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__PKContactlessInterfaceSession__session_didExpireTransactionForApplet___block_invoke_220;
  v18[3] = &unk_1E56D8AB8;
  v18[4] = v14;
  id v19 = v6;
  id v20 = v7;
  id v16 = v7;
  id v17 = v6;
  dispatch_async(v15, v18);
}

void __72__PKContactlessInterfaceSession__session_didExpireTransactionForApplet___block_invoke_220(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    [v4 contactlessInterfaceSessionDidTimeout:*(void *)(a1 + 32) forPaymentApplications:*(void *)(*(void *)(a1 + 32) + 32) paymentPass:*(void *)(a1 + 40) valueAddedServicePasses:*(void *)(a1 + 48)];
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(v2 + 32) firstObject];
    [v4 contactlessInterfaceSessionDidTimeout:v2 forPaymentApplication:v3 paymentPass:*(void *)(a1 + 40) valueAddedServicePasses:*(void *)(a1 + 48)];
  }
}

- (void)_sessionDidEndUnexpectedly:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__PKContactlessInterfaceSession__sessionDidEndUnexpectedly___block_invoke;
  v3[3] = &unk_1E56DB628;
  v3[4] = self;
  [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v3];
}

void __60__PKContactlessInterfaceSession__sessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:3];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Ended Unexpectedly", buf, 2u);
  }

  unsigned __int8 v3 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 145));
  char v4 = v3 & 1;
  id v5 = *(id *)(*(void *)(a1 + 32) + 40);
  id v6 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  unsigned __int8 v8 = *(NSObject **)(v7 + 136);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PKContactlessInterfaceSession__sessionDidEndUnexpectedly___block_invoke_225;
  v11[3] = &unk_1E56DB9B0;
  char v14 = v4;
  void v11[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

void __60__PKContactlessInterfaceSession__sessionDidEndUnexpectedly___block_invoke_225(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v3 + 146))
    {
      if (*(void *)(a1 + 40) && [*(id *)(v3 + 32) count])
      {
        if (objc_opt_respondsToSelector())
        {
          uint64_t v18 = v2;
          char v4 = (PKContactlessInterfaceTransactionContext *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v5 = *(id *)(*(void *)(a1 + 32) + 32);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v20;
            do
            {
              uint64_t v9 = 0;
              do
              {
                if (*(void *)v20 != v8) {
                  objc_enumerationMutation(v5);
                }
                uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v9);
                uint64_t v11 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:*(void *)(a1 + 40) activatedPaymentApplications:*(void *)(*(void *)(a1 + 32) + 32)];
                [(PKContactlessInterfaceTransactionContext *)v11 setSuccess:1];
                [(PKContactlessInterfaceTransactionContext *)v11 setPaymentApplication:v10];
                [(PKContactlessInterfaceTransactionContext *)v4 addObject:v11];

                ++v9;
              }
              while (v7 != v9);
              uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
            }
            while (v7);
          }

          uint64_t v12 = *(void *)(a1 + 32);
          id v13 = (void *)[(PKContactlessInterfaceTransactionContext *)v4 copy];
          uint64_t v2 = v18;
          [v18 contactlessInterfaceSession:v12 didEndPersistentCardEmulationWithContexts:v13];
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_17;
          }
          char v4 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:*(void *)(a1 + 40) activatedPaymentApplications:*(void *)(*(void *)(a1 + 32) + 32)];
          [(PKContactlessInterfaceTransactionContext *)v4 setSuccess:1];
          char v14 = [(PKContactlessInterfaceTransactionContext *)v4 activatedPaymentApplications];
          uint64_t v15 = [v14 firstObject];
          [(PKContactlessInterfaceTransactionContext *)v4 setPaymentApplication:v15];

          [v2 contactlessInterfaceSession:*(void *)(a1 + 32) didEndPersistentCardEmulationWithContext:v4];
        }
      }
    }
  }
LABEL_17:
  if (objc_opt_respondsToSelector())
  {
    [v2 contactlessInterfaceSessionDidTerminate:*(void *)(a1 + 32)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v2 contactlessInterfaceSessionDidFail:*(void *)(a1 + 32) forPaymentApplications:*(void *)(*(void *)(a1 + 32) + 32) paymentPass:*(void *)(a1 + 40) valueAddedServicePasses:*(void *)(a1 + 48)];
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = [*(id *)(v16 + 32) firstObject];
    [v2 contactlessInterfaceSessionDidFail:v16 forPaymentApplication:v17 paymentPass:*(void *)(a1 + 40) valueAddedServicePasses:*(void *)(a1 + 48)];
  }
}

- (void)_session:(id)a3 didFailDeferredAuthorization:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @" Not";
    if (v4) {
      uint64_t v8 = &stru_1EE0F5368;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v8;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Did%@ Fail Authorization", buf, 0xCu);
  }

  if (v4)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PKContactlessInterfaceSession__session_didFailDeferredAuthorization___block_invoke;
    block[3] = &unk_1E56D8AE0;
    void block[4] = self;
    dispatch_async(callbackQueue, block);
  }
}

void __71__PKContactlessInterfaceSession__session_didFailDeferredAuthorization___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contactlessInterfaceSessionDidFailDeferredAuthorization:*(void *)(a1 + 32)];
  }
}

- (void)_sessionDidReceiveActivityTimeout:(id)a3 result:(id)a4
{
  id v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Received Transaction Activity Timeout.", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__PKContactlessInterfaceSession__sessionDidReceiveActivityTimeout_result___block_invoke;
  v6[3] = &unk_1E56DB628;
  v6[4] = self;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v6];
}

void __74__PKContactlessInterfaceSession__sessionDidReceiveActivityTimeout_result___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 80))
  {
    id v2 = *(NSObject **)(v1 + 136);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PKContactlessInterfaceSession__sessionDidReceiveActivityTimeout_result___block_invoke_2;
    block[3] = &unk_1E56D8AE0;
    void block[4] = v1;
    dispatch_async(v2, block);
  }
}

void __74__PKContactlessInterfaceSession__sessionDidReceiveActivityTimeout_result___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contactlessInterfaceSessionDidReceiveActivityTimeout:*(void *)(a1 + 32)];
  }
}

- (void)_session:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__PKContactlessInterfaceSession__session_didExpressModeStateChange_withObject___block_invoke;
  v11[3] = &unk_1E56DBA00;
  unsigned int v14 = a4;
  void v11[4] = self;
  id v12 = v8;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  [(PKPaymentSession *)self performBlockAsyncOnInternalSession:v11];
}

void __79__PKContactlessInterfaceSession__session_didExpressModeStateChange_withObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    int v42 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Received Express Mode State: %u", buf, 8u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 112);
  id v8 = *(id *)(v6 + 40);
  id v9 = *(id *)(*(void *)(a1 + 32) + 112);
  id v10 = v9;
  char v40 = 0;
  switch(*(_DWORD *)(a1 + 56))
  {
    case 1:
      if (*(void *)(*(void *)(a1 + 32) + 112)) {
        goto LABEL_22;
      }
      id v11 = +[PKExpressTransactionState createForExpressType:0];
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 112);
      *(void *)(v12 + 112) = v11;

      id v14 = *(id *)(*(void *)(a1 + 32) + 112);
      uint64_t v15 = 0;
      char v16 = 1;
      id v10 = v14;
      goto LABEL_24;
    case 2:
      if (!*(void *)(*(void *)(a1 + 32) + 112)) {
        goto LABEL_22;
      }
      uint64_t v17 = 1;
      goto LABEL_21;
    case 3:
      if (!*(void *)(*(void *)(a1 + 32) + 112)) {
        goto LABEL_22;
      }
      uint64_t v17 = 2;
      goto LABEL_21;
    case 4:
      uint64_t v18 = *(void **)(a1 + 32);
      if (!v18[14]) {
        goto LABEL_22;
      }
      uint64_t v15 = (void *)[v18 _createExpressTransactionForState:v10 pass:v8 paymentApplications:v18[4] date:*(void *)(a1 + 40) shouldGenerateTransaction:&v40 withSession:*(void *)(a1 + 48)];
      [v10 resolve];
      uint64_t v19 = *(void *)(a1 + 32);
      long long v20 = *(void **)(v19 + 112);
      *(void *)(v19 + 112) = 0;

      char v16 = 1;
      goto LABEL_24;
    case 5:
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "API CONTRACT VIOLATION: NFLoyaltyAndPaymentSession returned NFExpressModeStateServiceRequested.", buf, 2u);
      }

      goto LABEL_22;
    case 6:
      if (!*(void *)(*(void *)(a1 + 32) + 112)) {
        goto LABEL_22;
      }
      uint64_t v17 = 4;
      goto LABEL_21;
    case 7:
      if (!*(void *)(*(void *)(a1 + 32) + 112)) {
        goto LABEL_22;
      }
      uint64_t v17 = 512;
      goto LABEL_21;
    case 8:
      if (!*(void *)(*(void *)(a1 + 32) + 112)) {
        goto LABEL_22;
      }
      uint64_t v17 = 256;
LABEL_21:
      char v16 = [v9 receiveEvents:v17];
      break;
    case 9:
      uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 112);
      if (v26)
      {
        char v16 = [v9 receiveEvents:1024];
      }
      else
      {
        id v27 = +[PKExpressTransactionState createForExpressType:0];
        uint64_t v28 = *(void *)(a1 + 32);
        uint64_t v29 = *(void **)(v28 + 112);
        *(void *)(v28 + 112) = v27;

        id v30 = *(id *)(*(void *)(a1 + 32) + 112);
        char v16 = [v30 receiveEvents:1024];
        [v30 resolve];
        uint64_t v31 = *(void *)(a1 + 32);
        id v32 = *(void **)(v31 + 112);
        *(void *)(v31 + 112) = 0;

        id v10 = v30;
      }
      uint64_t v15 = 0;
      if (!v26) {
        char v16 = 1;
      }
      goto LABEL_24;
    default:
LABEL_22:
      char v16 = 0;
      break;
  }
  uint64_t v15 = 0;
LABEL_24:
  if ([v10 isProcessing])
  {
    uint64_t v21 = [v10 copy];

    id v10 = (void *)v21;
  }
  uint64_t v22 = *(void *)(a1 + 32);
  id v23 = *(NSObject **)(v22 + 136);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __79__PKContactlessInterfaceSession__session_didExpressModeStateChange_withObject___block_invoke_238;
  v33[3] = &unk_1E56DB9D8;
  char v37 = v40;
  v33[4] = v22;
  id v34 = v15;
  BOOL v38 = v7 != 0;
  char v39 = v16;
  id v35 = v10;
  int v36 = *(_DWORD *)(a1 + 56);
  id v24 = v10;
  id v25 = v15;
  dispatch_async(v23, v33);
}

void __79__PKContactlessInterfaceSession__session_didExpressModeStateChange_withObject___block_invoke_238(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  if (!*(unsigned char *)(a1 + 60)) {
    goto LABEL_22;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 && v2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32);
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Created Express Transaction (Payment Applications: %@)", (uint8_t *)&v10, 0xCu);
    }

    AnalyticsSendEvent();
    [*(id *)(a1 + 32) _signalWalletTransactionForContext:*(void *)(a1 + 40)];
    if (objc_opt_respondsToSelector()) {
      [v2 contactlessInterfaceSession:*(void *)(a1 + 32) didFinishTransactionWithContext:*(void *)(a1 + 40)];
    }
    goto LABEL_22;
  }
  if (v5)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Failed to handle Express Mode Exit. Dropping!!", (uint8_t *)&v10, 2u);
  }

  if (*(unsigned char *)(a1 + 61))
  {
    if (*(void *)(a1 + 40)) {
      goto LABEL_18;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      uint64_t v7 = "\tAID mismatch (this should happen extremely rarely).";
LABEL_16:
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    uint64_t v7 = "\tUnmatched Express Mode exited...";
    goto LABEL_16;
  }

LABEL_18:
  if (!v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "\tLost delegate before delivery of Express Mode Exit state.", (uint8_t *)&v10, 2u);
    }
  }
LABEL_22:
  if (*(unsigned char *)(a1 + 62))
  {
    if (objc_opt_respondsToSelector())
    {
      [v2 contactlessInterfaceSession:*(void *)(a1 + 32) didReceiveExpressTransactionState:*(void *)(a1 + 48)];
    }
    else
    {
      int v8 = *(_DWORD *)(a1 + 56) - 1;
      if (v8 > 7) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = qword_191673338[v8];
      }
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v2, "contactlessInterfaceSession:didReceiveExpressState:expressTransactionEvent:", *(void *)(a1 + 32), v9, objc_msgSend(*(id *)(a1 + 48), "receivedEvents"));
      }
      else if (objc_opt_respondsToSelector())
      {
        [v2 contactlessInterfaceSession:*(void *)(a1 + 32) didReceiveExpressState:v9];
      }
    }
  }
}

- (id)_createExpressTransactionForState:(id)a3 pass:(id)a4 paymentApplications:(id)a5 date:(id)a6 shouldGenerateTransaction:(BOOL *)a7 withSession:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = [v14 status];
  if (v14) {
    BOOL v20 = v19 == 1;
  }
  else {
    BOOL v20 = 0;
  }
  BOOL v21 = v20;
  *a7 = v21;
  if (v20)
  {
    unint64_t sessionType = self->_sessionType;
    if (sessionType >= 2)
    {
      id v25 = 0;
      int v38 = 0;
      int v24 = sessionType == 2;
    }
    else
    {
      id v23 = [v18 nfSession];
      id v25 = [v23 activeApplet];

      if (v25)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __135__PKContactlessInterfaceSession__createExpressTransactionForState_pass_paymentApplications_date_shouldGenerateTransaction_withSession___block_invoke;
        v39[3] = &unk_1E56DBA28;
        id v35 = (id *)&v40;
        id v25 = v25;
        char v40 = v25;
        int v24 = objc_msgSend(v16, "pk_containsObjectPassingTest:", v39);
        int v38 = 1;
      }
      else
      {
        int v38 = 0;
        int v24 = 0;
      }
    }
    id v27 = [[PKContactlessInterfaceTransactionContext alloc] initWithPaymentPass:v15 activatedPaymentApplications:self->_activatedPaymentApplications];
    if (v24)
    {
      id v37 = v16;
      uint64_t v28 = [v18 nfSession];
      if (v25)
      {
        uint64_t v29 = [v25 identifier];
        id v30 = [(PKContactlessInterfaceSession *)self _paymentApplicationForEventAppletIdentifier:v29 inContext:v27 withSession:v28];
      }
      else
      {
        id v30 = [(NSArray *)self->_activatedPaymentApplications firstObject];
      }
      [(PKContactlessInterfaceTransactionContext *)v27 setSuccess:1];
      [(PKContactlessInterfaceTransactionContext *)v27 setIncompatible:0];
      id v36 = v17;
      [(PKContactlessInterfaceTransactionContext *)v27 setDate:v17];
      [(PKContactlessInterfaceTransactionContext *)v27 setPaymentApplication:v30];
      uint64_t v31 = [v30 applicationIdentifier];
      id v32 = [v15 uniqueID];
      [v14 associateWithApplicationIdentifier:v31 keyIdentifier:0 terminalReaderIdentifier:0 passUniqueIdentifier:v32];

      [(PKContactlessInterfaceTransactionContext *)v27 setExpressState:v14];
      if (v28)
      {
        long long v33 = [(id)objc_opt_class() transitAppletStateFromPaymentSession:v28 forPaymentApplication:v30];
        if (v33) {
          [(PKContactlessInterfaceTransactionContext *)v27 setTransitHistory:v33];
        }
      }
      id v17 = v36;
      id v16 = v37;
    }
    if (v38) {
  }
    }
  else
  {
    id v25 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v42 = [v14 receivedEvents];
      _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session not generating transaction because missing prerequisite express activity. Activity: %lu", buf, 0xCu);
    }
    id v27 = 0;
  }

  return v27;
}

uint64_t __135__PKContactlessInterfaceSession__createExpressTransactionForState_pass_paymentApplications_date_shouldGenerateTransaction_withSession___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 applicationIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  BOOL v5 = (void *)v4;
  if (v3 && v4) {
    uint64_t v6 = [v3 isEqual:v4];
  }
  else {
    uint64_t v6 = v3 == (void *)v4;
  }

  return v6;
}

- (void)_startLookup
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__PKContactlessInterfaceSession__startLookup__block_invoke;
  v2[3] = &unk_1E56DB628;
  v2[4] = self;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v2];
}

void __45__PKContactlessInterfaceSession__startLookup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Starting Field Properties Lookup", buf, 2u);
  }

  char v15 = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 152);
  switch(v6)
  {
    case 0:
      int v10 = *(void **)(v5 + 80);
      int v8 = [v3 nfSession];
      char started = PKFieldPropertiesStartSecondaryLookup(v10, v8, &v15);
LABEL_8:
      char v11 = started;

      *(unsigned char *)(*(void *)(a1 + 32) + 88) = v15;
      if (v11) {
        goto LABEL_16;
      }
      goto LABEL_15;
    case 2:
      uint64_t v12 = *(void *)(v5 + 80);
      id v13 = [v3 nfSession];
      if (v12) {
        char v15 = 0;
      }

      char v14 = v15;
      uint64_t v5 = *(void *)(a1 + 32);
      break;
    case 1:
      uint64_t v7 = *(void **)(v5 + 80);
      int v8 = [v3 nfSession];
      char started = PKFieldPropertiesStartSecondaryLookup(v7, v8, &v15);
      goto LABEL_8;
    default:
      char v14 = 0;
      break;
  }
  *(unsigned char *)(v5 + 88) = v14;
LABEL_15:
  [*(id *)(a1 + 32) _endLookupAndNotify];
LABEL_16:
}

- (void)_endLookupAndNotify
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  fieldPropertiesToLookup = self->_fieldPropertiesToLookup;
  uint64_t v4 = fieldPropertiesToLookup;
  [(PKContactlessInterfaceSession *)self _endLookup];
  objc_storeStrong((id *)&self->_fieldProperties, fieldPropertiesToLookup);
  uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v11 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Contactless Interface Did Enter Field With Properties: %@", buf, 0xCu);
  }

  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PKContactlessInterfaceSession__endLookupAndNotify__block_invoke;
  v8[3] = &unk_1E56D8A90;
  void v8[4] = self;
  uint64_t v9 = v4;
  uint64_t v7 = v4;
  dispatch_async(callbackQueue, v8);
}

void __52__PKContactlessInterfaceSession__endLookupAndNotify__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contactlessInterfaceSessionDidEnterField:*(void *)(a1 + 32) withProperties:*(void *)(a1 + 40)];
  }
}

- (void)_endLookup
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__PKContactlessInterfaceSession__endLookup__block_invoke;
  v2[3] = &unk_1E56DB628;
  v2[4] = self;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v2];
}

void __43__PKContactlessInterfaceSession__endLookup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Contactless Interface Session Ending Lookup & Stopping Card Emulation", buf, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 80);
  if (v6)
  {
    *(void *)(v5 + 80) = 0;

    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 152);
    int v8 = [v3 nfSession];
    uint64_t v9 = v8;
    if (v7)
    {
      uint64_t v14 = 0;
      int v10 = (id *)&v14;
    }
    else
    {
      uint64_t v15 = 0;
      int v10 = (id *)&v15;
    }
    objc_msgSend(v8, "stopCardEmulation:", v10, v14, v15);
    id v11 = *v10;

    if (v11)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to stop Card Emulation: %@", buf, 0xCu);
      }
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (!*(void *)(v12 + 152))
    {
      id v13 = [v3 nfSession];
      [v13 setHostCards:*(void *)(*(void *)(a1 + 32) + 56)];

      uint64_t v12 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(v12 + 88))
    {
      *(unsigned char *)(v12 + 88) = 0;
      if ([*(id *)(*(void *)(a1 + 32) + 32) count]) {
        [*(id *)(a1 + 32) _activatePaymentApplications:*(void *)(*(void *)(a1 + 32) + 32) forPaymentPass:*(void *)(*(void *)(a1 + 32) + 40) forceReactivation:1];
      }
    }
  }
}

- (NSArray)activatedValueAddedServicePasses
{
  return self->_activatedValueAddedServicePasses;
}

- (PKFieldProperties)fieldProperties
{
  return self->_fieldProperties;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataToRelease, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_expressTransactionState, 0);
  objc_storeStrong((id *)&self->_fieldPropertiesToLookup, 0);
  objc_storeStrong((id *)&self->_fieldProperties, 0);
  objc_storeStrong((id *)&self->_valueAddedServiceTransactions, 0);
  objc_storeStrong((id *)&self->_activatedHostCards, 0);
  objc_storeStrong((id *)&self->_activatedValueAddedServicePasses, 0);
  objc_storeStrong((id *)&self->_activatedPaymentPass, 0);
  objc_storeStrong((id *)&self->_activatedPaymentApplications, 0);
}

@end