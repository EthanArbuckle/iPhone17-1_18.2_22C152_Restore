@interface PKPaymentSession
+ (id)forceContactlessInterfaceSessionWithCompletion:(id)a3;
+ (id)forceContactlessInterfaceSessionWithCompletion:(id)a3 targetQueue:(id)a4;
+ (id)startApplePayTrustSessionWithCompletion:(id)a3;
+ (id)startApplePayTrustSessionWithCompletion:(id)a3 targetQueue:(id)a4;
+ (id)startContactlessInterfaceSessionWithCompletion:(id)a3;
+ (id)startContactlessInterfaceSessionWithCompletion:(id)a3 targetQueue:(id)a4;
+ (id)startDigitalCarKeySessionWithCompletion:(id)a3;
+ (id)startDigitalCarKeySessionWithCompletion:(id)a3 targetQueue:(id)a4;
+ (id)startInAppSessionWithCompletion:(id)a3;
+ (id)startInAppSessionWithCompletion:(id)a3 targetQueue:(id)a4;
+ (id)startPeerPaymentSessionWithCompletion:(id)a3;
+ (id)startPeerPaymentSessionWithCompletion:(id)a3 targetQueue:(id)a4;
+ (id)startReaderSessionWithCompletion:(id)a3;
+ (id)startReaderSessionWithCompletion:(id)a3 targetQueue:(id)a4;
+ (id)startSTSContactlessInterfaceSessionWithDelegate:(id)a3 completion:(id)a4;
- (PKPaymentSession)init;
- (PKPaymentSession)initWithInternalSession:(id)a3 targetQueue:(id)a4;
- (unint64_t)lifecycleState;
- (void)createSessionHandoffTokenWithCompletion:(id)a3;
- (void)invalidateSession;
- (void)invalidateSessionWithCompletion:(id)a3;
- (void)performBlockAsyncOnInternalSession:(id)a3;
- (void)performBlockSyncOnInternalSession:(id)a3;
@end

@implementation PKPaymentSession

+ (id)startInAppSessionWithCompletion:(id)a3
{
  return (id)[a1 startInAppSessionWithCompletion:a3 targetQueue:0];
}

+ (id)startInAppSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting in-app session...", buf, 2u);
  }

  PKTimeProfileBegin((uint64_t)v7, @"in_app_session_start");
  v8 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__PKPaymentSession_startInAppSessionWithCompletion_targetQueue___block_invoke;
  v14[3] = &unk_1E56DFE70;
  id v15 = v6;
  id v16 = v5;
  id v9 = v5;
  id v10 = v6;
  v11 = [v8 startECommercePaymentSession:v14];
  v12 = -[PKPaymentSessionHandle initWithInternalNFSessionHandle:targetQueue:]((id *)[PKPaymentSessionHandle alloc], v11, v10);

  return v12;
}

void __64__PKPaymentSession_startInAppSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  p_super = PKLogFacilityTypeGetObject(6uLL);
  id v8 = PKTimeProfileEnd(p_super, @"in_app_session_start", @"In-App Payment Session Start");

  if (v5)
  {
    id v9 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v5];
    id v10 = [[PKInAppPaymentSession alloc] initWithInternalSession:v9 targetQueue:*(void *)(a1 + 32)];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218240;
      v13 = v10;
      __int16 v14 = 2048;
      id v15 = v5;
      _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "PKInAppPaymentSession (%p): started in-app session %p.", (uint8_t *)&v12, 0x16u);
    }

    p_super = &v9->super;
  }
  else
  {
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start in-app session - %@.", (uint8_t *)&v12, 0xCu);
    }
    id v10 = 0;
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKInAppPaymentSession *))(v11 + 16))(v11, v10);
  }
}

+ (id)startContactlessInterfaceSessionWithCompletion:(id)a3
{
  return (id)[a1 startContactlessInterfaceSessionWithCompletion:a3 targetQueue:0];
}

+ (id)startContactlessInterfaceSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting contactless nearfield session...", buf, 2u);
    }

    id v8 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__PKPaymentSession_startContactlessInterfaceSessionWithCompletion_targetQueue___block_invoke;
    v13[3] = &unk_1E56DFE98;
    id v9 = v6;
    id v14 = v9;
    id v15 = v5;
    id v10 = [v8 startLoyaltyAndContactlessPaymentSession:v13];
    uint64_t v11 = -[PKPaymentSessionHandle initWithInternalNFSessionHandle:targetQueue:]((id *)[PKPaymentSessionHandle alloc], v10, v9);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __79__PKPaymentSession_startContactlessInterfaceSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v5];
    id v8 = [[PKContactlessInterfaceSession alloc] initWithInternalSession:v7 targetQueue:*(void *)(a1 + 32)];
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      uint64_t v11 = v8;
      __int16 v12 = 2048;
      id v13 = v5;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): started contactless nearfield session %p.", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = (PKTransactionSessionWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_190E10000, &v7->super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start contactless nearfield session - %@.", (uint8_t *)&v10, 0xCu);
    }
    id v8 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)startDigitalCarKeySessionWithCompletion:(id)a3
{
  return (id)[a1 startDigitalCarKeySessionWithCompletion:a3 targetQueue:0];
}

+ (id)startDigitalCarKeySessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting car key session...", buf, 2u);
    }

    id v8 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__PKPaymentSession_startDigitalCarKeySessionWithCompletion_targetQueue___block_invoke;
    v13[3] = &unk_1E56DFEC0;
    id v9 = v6;
    id v14 = v9;
    id v15 = v5;
    int v10 = [v8 startDigitalCarKeySession:v13];
    uint64_t v11 = -[PKPaymentSessionHandle initWithInternalNFSessionHandle:targetQueue:]((id *)[PKPaymentSessionHandle alloc], v10, v9);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __72__PKPaymentSession_startDigitalCarKeySessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v5];
    id v8 = [[PKContactlessInterfaceSession alloc] initWithInternalSession:v7 targetQueue:*(void *)(a1 + 32)];
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      uint64_t v11 = v8;
      __int16 v12 = 2048;
      id v13 = v5;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): started car key session %p.", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = (PKTransactionSessionWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_190E10000, &v7->super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start car key session - %@.", (uint8_t *)&v10, 0xCu);
    }
    id v8 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)forceContactlessInterfaceSessionWithCompletion:(id)a3
{
  return (id)[a1 forceContactlessInterfaceSessionWithCompletion:a3 targetQueue:0];
}

+ (id)forceContactlessInterfaceSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: force starting contactless nearfield session...", buf, 2u);
    }

    id v8 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__PKPaymentSession_forceContactlessInterfaceSessionWithCompletion_targetQueue___block_invoke;
    v13[3] = &unk_1E56DFE98;
    id v9 = v6;
    id v14 = v9;
    id v15 = v5;
    int v10 = [v8 forceLoyaltyAndContactlessPaymentSession:v13];
    uint64_t v11 = -[PKPaymentSessionHandle initWithInternalNFSessionHandle:targetQueue:]((id *)[PKPaymentSessionHandle alloc], v10, v9);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __79__PKPaymentSession_forceContactlessInterfaceSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v5];
    id v8 = [[PKContactlessInterfaceSession alloc] initWithInternalSession:v7 targetQueue:*(void *)(a1 + 32)];
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      uint64_t v11 = v8;
      __int16 v12 = 2048;
      id v13 = v5;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): force started contactless nearfield session %p.", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = (PKTransactionSessionWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_190E10000, &v7->super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to force start contactless nearfield session - %@.", (uint8_t *)&v10, 0xCu);
    }
    id v8 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)startSTSContactlessInterfaceSessionWithDelegate:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    id v6 = (Class (__cdecl *)())getSTSSessionClass[0];
    id v7 = a3;
    id v8 = objc_alloc_init(v6());
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v26 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting contactless STS session %p...", buf, 0xCu);
    }

    buf[0] = 0;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __79__PKPaymentSession_startSTSContactlessInterfaceSessionWithDelegate_completion___block_invoke;
    v22 = &unk_1E56D8770;
    id v23 = v8;
    id v24 = v5;
    id v10 = v8;
    [v10 startWithDelegate:v7 isFirstInQueue:buf completion:&v19];

    uint64_t v11 = [PKPaymentSessionHandle alloc];
    uint8_t v12 = buf[0];
    id v13 = v10;
    uint64_t v14 = v13;
    if (v11 && v13)
    {
      id v15 = -[PKPaymentSessionHandle _initWithQueue:](v11, 0);
      uint64_t v16 = v15;
      if (v15)
      {
        objc_storeStrong((id *)v15 + 3, v8);
        v16[32] = v12;
      }
      else
      {
        objc_msgSend(v14, "endSessionWithCompletion:", 0, v19, v20, v21, v22, v23, v24);
      }
      uint64_t v11 = v16;
      v17 = v11;
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __79__PKPaymentSession_startSTSContactlessInterfaceSessionWithDelegate_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (v3)
  {
    v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start contactless STS session - %@.", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = [[PKTransactionSessionWrapper alloc] initWithSTSSession:*(void *)(a1 + 32)];
    id v6 = [[PKContactlessInterfaceSession alloc] initWithInternalSession:v5 targetQueue:0];
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(PKTransactionSessionWrapper *)v5 stsSession];
      int v9 = 134218240;
      id v10 = v6;
      __int16 v11 = 2048;
      uint8_t v12 = v8;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSession (%p): started contactless STS session %p.", (uint8_t *)&v9, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)startReaderSessionWithCompletion:(id)a3
{
  return (id)[a1 startReaderSessionWithCompletion:a3 targetQueue:0];
}

+ (id)startReaderSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting reader nearfield session...", buf, 2u);
  }

  id v8 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__PKPaymentSession_startReaderSessionWithCompletion_targetQueue___block_invoke;
  v14[3] = &unk_1E56DFEE8;
  id v15 = v6;
  id v16 = v5;
  id v9 = v5;
  id v10 = v6;
  __int16 v11 = [v8 startReaderSession:v14];
  uint8_t v12 = -[PKPaymentSessionHandle initWithInternalNFSessionHandle:targetQueue:]((id *)[PKPaymentSessionHandle alloc], v11, v10);

  return v12;
}

void __65__PKPaymentSession_startReaderSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v5];
    id v8 = [[PKNFCTagReaderSession alloc] initWithInternalSession:v7 targetQueue:*(void *)(a1 + 32)];
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218240;
      uint8_t v12 = v8;
      __int16 v13 = 2048;
      id v14 = v5;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKNFCTagReaderSession (%p): started reader nearfield session %p.", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    id v7 = (PKTransactionSessionWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint8_t v12 = v6;
      _os_log_impl(&dword_190E10000, &v7->super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start reader nearfield session - %@.", (uint8_t *)&v11, 0xCu);
    }
    id v8 = 0;
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, PKNFCTagReaderSession *, PKNFCTagReaderSession *))(v10 + 16))(v10, v8, v6);
  }
}

+ (id)startPeerPaymentSessionWithCompletion:(id)a3
{
  return (id)[a1 startPeerPaymentSessionWithCompletion:a3 targetQueue:0];
}

+ (id)startPeerPaymentSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting peer-payment session...", buf, 2u);
  }

  PKTimeProfileBegin((uint64_t)v7, @"peer_payment_session_start");
  id v8 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__PKPaymentSession_startPeerPaymentSessionWithCompletion_targetQueue___block_invoke;
  v14[3] = &unk_1E56DFF10;
  id v15 = v6;
  id v16 = v5;
  id v9 = v5;
  id v10 = v6;
  int v11 = [v8 startPeerPaymentSession:v14];
  uint8_t v12 = -[PKPaymentSessionHandle initWithInternalNFSessionHandle:targetQueue:]((id *)[PKPaymentSessionHandle alloc], v11, v10);

  return v12;
}

void __70__PKPaymentSession_startPeerPaymentSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  p_super = PKLogFacilityTypeGetObject(6uLL);
  id v8 = PKTimeProfileEnd(p_super, @"peer_payment_session_start", @"Peer Payment Session Start");

  if (v5)
  {
    id v9 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v5];
    id v10 = [[PKPeerPaymentSession alloc] initWithInternalSession:v9 targetQueue:*(void *)(a1 + 32)];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218240;
      __int16 v13 = v10;
      __int16 v14 = 2048;
      id v15 = v5;
      _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentSession (%p): started peer-payment session %p.", (uint8_t *)&v12, 0x16u);
    }

    p_super = &v9->super;
  }
  else
  {
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      __int16 v13 = v6;
      _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start peer-payment session - %@.", (uint8_t *)&v12, 0xCu);
    }
    id v10 = 0;
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentSession *))(v11 + 16))(v11, v10);
  }
}

+ (id)startApplePayTrustSessionWithCompletion:(id)a3
{
  return (id)[a1 startApplePayTrustSessionWithCompletion:a3 targetQueue:0];
}

+ (id)startApplePayTrustSessionWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: starting trust session...", buf, 2u);
  }

  id v8 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PKPaymentSession_startApplePayTrustSessionWithCompletion_targetQueue___block_invoke;
  v14[3] = &unk_1E56DFF38;
  id v15 = v6;
  id v16 = v5;
  id v9 = v5;
  id v10 = v6;
  uint64_t v11 = [v8 startTrustSession:v14];
  int v12 = -[PKPaymentSessionHandle initWithInternalNFSessionHandle:targetQueue:]((id *)[PKPaymentSessionHandle alloc], v11, v10);

  return v12;
}

void __72__PKPaymentSession_startApplePayTrustSessionWithCompletion_targetQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [[PKTransactionSessionWrapper alloc] initWithNFSession:v5];
    id v8 = [[PKApplePayTrustSession alloc] initWithInternalSession:v7 targetQueue:*(void *)(a1 + 32)];
    id v9 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218240;
      int v12 = v8;
      __int16 v13 = 2048;
      id v14 = v5;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKApplePayTrustSession (%p): started trust session %p.", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    id v7 = (PKTransactionSessionWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      int v12 = v6;
      _os_log_impl(&dword_190E10000, &v7->super, OS_LOG_TYPE_DEFAULT, "PKPaymentSession: failed to start trust session - %@.", (uint8_t *)&v11, 0xCu);
    }
    id v8 = 0;
  }

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, PKApplePayTrustSession *))(v10 + 16))(v10, v8);
  }
}

- (PKPaymentSession)init
{
  return 0;
}

- (PKPaymentSession)initWithInternalSession:(id)a3 targetQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSession;
  id v9 = [(PKPaymentSession *)&v15 init];
  if (v9)
  {
    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v11 = dispatch_queue_attr_make_initially_inactive(v10);

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.passkit.paymentsession.internalSession", v11);
    __int16 v13 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v12;

    if (v8) {
      dispatch_set_target_queue(*((dispatch_object_t *)v9 + 1), v8);
    }
    dispatch_activate(*((dispatch_object_t *)v9 + 1));
    objc_storeStrong((id *)v9 + 2, a3);
    dispatch_queue_set_specific(*((dispatch_queue_t *)v9 + 1), @"context", v9, 0);
  }
  else
  {
    [v7 endSession];
  }

  return (PKPaymentSession *)v9;
}

- (void)invalidateSession
{
}

- (void)invalidateSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PKPaymentSession_invalidateSessionWithCompletion___block_invoke;
  v6[3] = &unk_1E56DFF60;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v6];
}

void __52__PKPaymentSession_invalidateSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ (%p): invalidating...", buf, 0x16u);
    }

    id v8 = *(void **)(*(void *)(a1 + 32) + 16);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__PKPaymentSession_invalidateSessionWithCompletion___block_invoke_91;
    v15[3] = &unk_1E56D8B58;
    id v16 = v5;
    uint64_t v18 = v6;
    id v17 = *(id *)(a1 + 40);
    id v9 = v5;
    [v8 endSessionWithCompletion:v15];
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = *(void **)(v10 + 16);
    *(void *)(v10 + 16) = 0;

    goto LABEL_7;
  }
  dispatch_queue_t v12 = *(void **)(a1 + 40);
  if (v12)
  {
    id v9 = dispatch_get_global_queue(21, 0);
    id v13 = v12;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __dispatch_async_ar_block_invoke_4;
    uint64_t v20 = &unk_1E56D8360;
    id v21 = v13;
    id v14 = v13;
    dispatch_async(v9, buf);

LABEL_7:
  }
}

void __52__PKPaymentSession_invalidateSessionWithCompletion___block_invoke_91(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[6];
    *(_DWORD *)id v9 = 138543618;
    *(void *)&v9[4] = v3;
    *(_WORD *)&v9[12] = 2048;
    *(void *)&v9[14] = v4;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (%p): invalidated.", v9, 0x16u);
  }

  id v5 = (void *)a1[5];
  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(21, 0);
    id v7 = v5;
    *(void *)id v9 = MEMORY[0x1E4F143A8];
    *(void *)&v9[8] = 3221225472;
    *(void *)&v9[16] = __dispatch_async_ar_block_invoke_4;
    uint64_t v10 = &unk_1E56D8360;
    id v11 = v7;
    id v8 = v7;
    dispatch_async(v6, v9);
  }
}

- (void)createSessionHandoffTokenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PKPaymentSession_createSessionHandoffTokenWithCompletion___block_invoke;
    v6[3] = &unk_1E56DFF60;
    v6[4] = self;
    id v7 = v4;
    [(PKPaymentSession *)self performBlockSyncOnInternalSession:v6];
  }
}

void __60__PKPaymentSession_createSessionHandoffTokenWithCompletion___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) nfSession];

  if (v2)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) nfSession];
    id v9 = 0;
    id v4 = [v3 createSessionHandoffToken:&v9];
    id v5 = v9;

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28228];
    v11[0] = @"createSessionHandoffTokenWithCompletion: only works for NFSession";
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v4 = [v8 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v5];
    uint64_t v6 = *(void (**)(void))(v7 + 16);
  }
  v6();
}

- (void)performBlockAsyncOnInternalSession:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    internalSessionSerialQueue = self->_internalSessionSerialQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__PKPaymentSession_performBlockAsyncOnInternalSession___block_invoke;
    v8[3] = &unk_1E56D83D8;
    v8[4] = self;
    id v9 = v4;
    uint64_t v7 = v8;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_4;
    block[3] = &unk_1E56D8360;
    id v11 = v7;
    dispatch_async(internalSessionSerialQueue, block);
  }
}

uint64_t __55__PKPaymentSession_performBlockAsyncOnInternalSession___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (void)performBlockSyncOnInternalSession:(id)a3
{
  id v4 = (void (**)(id, PKTransactionSessionWrapper *))a3;
  if (v4)
  {
    if (dispatch_get_specific(@"context") == self)
    {
      v4[2](v4, self->_internalSession);
    }
    else
    {
      internalSessionSerialQueue = self->_internalSessionSerialQueue;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __54__PKPaymentSession_performBlockSyncOnInternalSession___block_invoke;
      v6[3] = &unk_1E56D83D8;
      v6[4] = self;
      uint64_t v7 = v4;
      dispatch_sync(internalSessionSerialQueue, v6);
    }
  }
}

uint64_t __54__PKPaymentSession_performBlockSyncOnInternalSession___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (unint64_t)lifecycleState
{
  return self->_lifecycleState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSession, 0);
  objc_storeStrong((id *)&self->_internalSessionSerialQueue, 0);
}

@end