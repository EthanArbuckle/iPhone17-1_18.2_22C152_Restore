@interface PKDeviceScorer
+ (BOOL)deviceScoringSupported;
- (PKDSPContext)context;
- (PKDeviceScorer)init;
- (PKDeviceScorer)initWithContext:(id)a3;
- (double)deviceScoreTimeout;
- (id)_createScorer;
- (void)_getScoreWithNonce:(id)a3 cryptogram:(id)a4 challengeResponse:(id)a5 completion:(id)a6;
- (void)deviceScoreWithCryptogram:(id)a3 challengeResponse:(id)a4 nonce:(id)a5 completion:(id)a6;
- (void)peerPaymentDeviceScoreWithCryptogram:(id)a3 challengeResponse:(id)a4 completion:(id)a5;
- (void)setDeviceScoreTimeout:(double)a3;
@end

@implementation PKDeviceScorer

+ (BOOL)deviceScoringSupported
{
  return 1;
}

- (PKDeviceScorer)init
{
  return [(PKDeviceScorer *)self initWithContext:0];
}

- (PKDeviceScorer)initWithContext:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDeviceScorer;
  v5 = [(PKDeviceScorer *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    context = v5->_context;
    v5->_context = (PKDSPContext *)v6;

    v5->_deviceScoreTimeout = 1.8;
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    scoreCompletions = v5->_scoreCompletions;
    v5->_scoreCompletions = (NSMutableDictionary *)v8;

    uint64_t v10 = [(PKDeviceScorer *)v5 _createScorer];
    scorer = v5->_scorer;
    v5->_scorer = (CdQwUTvJnDEPQgR8 *)v10;

    [(CdQwUTvJnDEPQgR8 *)v5->_scorer prepareScoreMessage];
  }

  return v5;
}

- (void)deviceScoreWithCryptogram:(id)a3 challengeResponse:(id)a4 nonce:(id)a5 completion:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13) {
    goto LABEL_15;
  }
  if (v10)
  {
    if (v11) {
      goto LABEL_4;
    }
  }
  else
  {
    v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v20 = @"no cryptogram supplied for DSP";
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }

    if (v11)
    {
LABEL_4:
      if (v12)
      {
LABEL_5:
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __79__PKDeviceScorer_deviceScoreWithCryptogram_challengeResponse_nonce_completion___block_invoke;
        v17[3] = &unk_1E56E28F0;
        id v18 = v13;
        [(PKDeviceScorer *)self _getScoreWithNonce:v12 cryptogram:v10 challengeResponse:v11 completion:v17];

        goto LABEL_15;
      }
      goto LABEL_12;
    }
  }
  v15 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v20 = @"no challengeResponse supplied for DSP";
    _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
  }

  if (v12) {
    goto LABEL_5;
  }
LABEL_12:
  v16 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v20 = @"no nonce supplied for DSP";
    _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
  }

  (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
LABEL_15:
}

uint64_t __79__PKDeviceScorer_deviceScoreWithCryptogram_challengeResponse_nonce_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)peerPaymentDeviceScoreWithCryptogram:(id)a3 challengeResponse:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        [(PKDeviceScorer *)self _getScoreWithNonce:0 cryptogram:v8 challengeResponse:v9 completion:v10];
        goto LABEL_11;
      }
      id v11 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138477827;
        id v13 = @"no challengeResponse supplied for DSP";
        goto LABEL_9;
      }
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138477827;
        id v13 = @"no cryptogram supplied for DSP";
LABEL_9:
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v12, 0xCu);
      }
    }

    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
  }
LABEL_11:
}

- (void)_getScoreWithNonce:(id)a3 cryptogram:(id)a4 challengeResponse:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x1E4F14428];
  id v15 = MEMORY[0x1E4F14428];
  if (PKProvisioningSecurityEnhancementsDisableDeviceScore())
  {
    v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v31 = @"DSP disabled by setting";
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke;
    block[3] = &unk_1E56D8360;
    id v29 = v13;
    id v17 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v18 = v29;
  }
  else
  {
    v19 = dispatch_get_global_queue(0, 0);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_2;
    v22[3] = &unk_1E56E2968;
    v22[4] = self;
    id v20 = v14;
    v23 = v14;
    id v27 = v13;
    id v24 = v10;
    id v25 = v11;
    id v26 = v12;
    id v21 = v13;
    dispatch_async(v19, v22);

    id v18 = v23;
  }
}

uint64_t __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    v3 = (void *)mach_absolute_time();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    id v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 40));
    double v5 = *(double *)(*(void *)(a1 + 32) + 24);
    if (v5 <= 0.0) {
      dispatch_time_t v6 = -1;
    }
    else {
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    }
    dispatch_source_set_timer(v4, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_3;
    handler[3] = &unk_1E56DF798;
    uint64_t v12 = *(void *)(a1 + 32);
    v36 = v3;
    handler[4] = v12;
    id v13 = v4;
    v35 = v13;
    dispatch_source_set_event_handler(v13, handler);
    dispatch_resume(v13);
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    id v15 = (void *)[*(id *)(a1 + 72) copy];
    v16 = _Block_copy(v15);
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v16 forKeyedSubscript:v14];

    id v17 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = NSString;
      v19 = [*(id *)(*(void *)(a1 + 32) + 32) serverEndpointIdentifier];
      id v20 = [v18 stringWithFormat:@"Fetching DSP for: %@", v19];
      *(_DWORD *)v37 = 138477827;
      v38 = v20;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "%{private}@", v37, 0xCu);
    }
    id v21 = objc_alloc_init(FZf7GLuluME5TMqw);
    v22 = [*(id *)(*(void *)(a1 + 32) + 32) secureElementID];
    [(FZf7GLuluME5TMqw *)v21 setSeid:v22];

    [(FZf7GLuluME5TMqw *)v21 setNonce:*(void *)(a1 + 48)];
    [(FZf7GLuluME5TMqw *)v21 setHostChallenge:*(void *)(a1 + 56)];
    [(FZf7GLuluME5TMqw *)v21 setChallengeResponse:*(void *)(a1 + 64)];
    objc_initWeak((id *)v37, *(id *)(a1 + 32));
    v23 = *(void **)(*(void *)(a1 + 32) + 8);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_127;
    v28[3] = &unk_1E56E2940;
    id v29 = *(id *)(a1 + 40);
    p_long long buf = &buf;
    id v24 = v13;
    v30 = v24;
    v33[1] = v3;
    objc_copyWeak(v33, (id *)v37);
    id v25 = v14;
    id v31 = v25;
    [v23 scoreWithScoreRequest:v21 completionHandler:v28];

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)v37);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = NSString;
      id v9 = [*(id *)(v2 + 32) serverEndpointIdentifier];
      id v10 = [v8 stringWithFormat:@"Error: Could not generate scorer for DSP requested by: %@", v9];
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&buf, 0xCu);
    }
    id v11 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_146;
    block[3] = &unk_1E56D8360;
    id v27 = *(id *)(a1 + 72);
    dispatch_async(v11, block);
  }
}

uint64_t __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = mach_absolute_time();
  double v3 = PKSecondsFromMachTimeInterval(v2 - *(void *)(a1 + 48));
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = NSString;
    dispatch_time_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) serverEndpointIdentifier];
    v7 = [v5 stringWithFormat:@"Timeout fetching DSP for: %@, time taken(seconds):%f ", v6, *(void *)&v3];
    *(_DWORD *)long long buf = 138477827;
    id v10 = v7;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
  }
  AnalyticsSendEvent();
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  return [*(id *)(*(void *)(a1 + 32) + 8) stop];
}

void __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_127(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_2_128;
  v16[3] = &unk_1E56E2918;
  uint64_t v22 = *(void *)(a1 + 56);
  id v10 = *(NSObject **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void **)(a1 + 72);
  id v17 = v11;
  v23[1] = v12;
  objc_copyWeak(v23, (id *)(a1 + 64));
  id v18 = v9;
  id v19 = v8;
  id v20 = v7;
  id v21 = *(id *)(a1 + 48);
  id v13 = v7;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v10, v16);

  objc_destroyWeak(v23);
}

void __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_2_128(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(a1 + 72) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    uint64_t v3 = mach_absolute_time();
    double v4 = PKSecondsFromMachTimeInterval(v3 - *(void *)(a1 + 88));
    id v21 = @"duration";
    double v5 = objc_msgSend(NSNumber, "numberWithDouble:");
    v22[0] = v5;
    dispatch_time_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    AnalyticsSendEvent();

    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
    id v8 = *(void **)(a1 + 40);
    if (v8 || (id v13 = *(void **)(a1 + 48)) == 0)
    {
      id v9 = PKLogFacilityTypeGetObject(6uLL);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      id v10 = NSString;
      id v11 = [v8 localizedDescription];
      if (WeakRetained)
      {
        uint64_t v12 = [WeakRetained[4] serverEndpointIdentifier];
      }
      else
      {
        uint64_t v12 = @"no-self";
      }
      id v15 = [v10 stringWithFormat:@"Error: Fetching DSP: %@ for: %@ time taken(seconds):%f ", v11, v12, *(void *)&v4];
      *(_DWORD *)long long buf = 138477827;
      id v20 = v15;
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject(6uLL);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      id v14 = NSString;
      id v11 = [v13 hexEncoding];
      if (WeakRetained)
      {
        uint64_t v12 = [WeakRetained[4] serverEndpointIdentifier];
      }
      else
      {
        uint64_t v12 = @"no-self";
      }
      id v15 = [v14 stringWithFormat:@"DSP: %@ for: %@ time taken(seconds): %f", v11, v12, *(void *)&v4];
      *(_DWORD *)long long buf = 138477827;
      id v20 = v15;
    }
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    if (WeakRetained) {

    }
LABEL_17:
    if (*(void *)(a1 + 56))
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(*(id *)(a1 + 56), "bytes"));
      if (!WeakRetained) {
        goto LABEL_24;
      }
    }
    else
    {
      v16 = 0;
      if (!WeakRetained)
      {
LABEL_24:

        return;
      }
    }
    uint64_t v17 = [WeakRetained[2] objectForKeyedSubscript:*(void *)(a1 + 64)];
    id v18 = (void *)v17;
    if (v17) {
      (*(void (**)(uint64_t, void *, void, void))(v17 + 16))(v17, v16, *(void *)(a1 + 48), *(void *)(a1 + 40));
    }
    [WeakRetained[2] setObject:0 forKeyedSubscript:*(void *)(a1 + 64)];

    goto LABEL_24;
  }
}

uint64_t __77__PKDeviceScorer__getScoreWithNonce_cryptogram_challengeResponse_completion___block_invoke_146(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, 0);
  }
  return result;
}

- (id)_createScorer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [jprL7AuZZkLkFoBK alloc];
  double v4 = [(PKDSPContext *)self->_context serverEndpointIdentifier];
  double v5 = [(jprL7AuZZkLkFoBK *)v3 initWithServerEndpointIdentifier:v4];

  if (!v5)
  {
    dispatch_time_t v6 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138477827;
      v28 = @"Could not generate context for DSP";
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
    }
  }
  id v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [(PKDSPContext *)self->_context cardholderName];
  if (v8)
  {
    id v9 = [[PawuKFL8icsLHMZd alloc] initWithFullName:v8 source:2];
    [v7 addObject:v9];
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    id v9 = (PawuKFL8icsLHMZd *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138477827;
      v28 = @"no card holder name supplied for DSP";
      _os_log_impl(&dword_190E10000, &v9->super, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
    }
  }

  id v10 = [(PKDSPContext *)self->_context primaryAppleAccountFirstName];
  uint64_t v11 = [(PKDSPContext *)self->_context primaryAppleAccountLastName];
  uint64_t v12 = (void *)v11;
  if (v10 && v11)
  {
    id v13 = [[PawuKFL8icsLHMZd alloc] initWithFirstName:v10 lastName:v11 source:1];
    [v7 addObject:v13];
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    id v13 = (PawuKFL8icsLHMZd *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138477827;
      v28 = @"no account supplied for DSP";
      _os_log_impl(&dword_190E10000, &v13->super, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
    }
  }

  id v14 = [(PKDSPContext *)self->_context peerPaymentRecipientAddress];
  if (v14)
  {
    id v15 = v14;
    v16 = PKIDSNormalizedAddress(v14);

    int v17 = [v16 hasPrefix:@"mailto:"];
    int v18 = [v16 hasPrefix:@"tel:"];
    if ((v17 & 1) != 0 || v18)
    {
      if (v17)
      {
        uint64_t v20 = -[NSObject substringFromIndex:](v16, "substringFromIndex:", [@"mailto:" length]);

        id v21 = [[PawuKFL8icsLHMZd alloc] initWithEmailAddress:v20 source:3];
      }
      else
      {
        uint64_t v20 = -[NSObject substringFromIndex:](v16, "substringFromIndex:", [@"tel:" length]);

        id v21 = [[PawuKFL8icsLHMZd alloc] initWithPhoneNumber:v20 source:3];
      }
      p_super = &v21->super;
      v16 = v20;
      [(PawuKFL8icsLHMZd *)v21 setType:1];
      [v7 addObject:p_super];
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 138477827;
        v28 = @"unknown peer payment recipient address type supplied for DSP";
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
      }
    }
  }
  else
  {
    v16 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138477827;
      v28 = @"no peer payment recipient address supplied for DSP";
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
    }
  }

  [(jprL7AuZZkLkFoBK *)v5 setIdentities:v7];
  unint64_t v22 = [(PKDSPContext *)self->_context eventFrequency];
  if (v22 <= 2) {
    [(jprL7AuZZkLkFoBK *)v5 setEventFrequency:v22];
  }
  v23 = [(PKDSPContext *)self->_context phoneNumber];
  if (v23)
  {
    [(jprL7AuZZkLkFoBK *)v5 setPhoneNumber:v23];
  }
  else
  {
    id v24 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138477827;
      v28 = @"no phonenumber supplied for DSP";
      _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v27, 0xCu);
    }
  }
  id v25 = +[CdQwUTvJnDEPQgR8 scorerWithContext:v5];

  return v25;
}

- (double)deviceScoreTimeout
{
  return self->_deviceScoreTimeout;
}

- (void)setDeviceScoreTimeout:(double)a3
{
  self->_deviceScoreTimeout = a3;
}

- (PKDSPContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_scoreCompletions, 0);
  objc_storeStrong((id *)&self->_scorer, 0);
}

@end