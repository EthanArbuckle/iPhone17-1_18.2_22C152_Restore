@interface SVXSiriActivationListenerDelegate
- (SVXSiriActivationListenerDelegate)initWithSiriActivationListener:(id)a3 mainQueuePerformer:(id)a4 siriActivationSupportPredicate:(id)a5 virtualDeviceManager:(id)a6 instrumentationUtils:(id)a7 activationUtils:(id)a8;
- (SVXSiriActivationListenerDelegate)initWithVirtualDeviceManager:(id)a3;
- (void)siriActivationListener:(id)a3 activateWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6;
- (void)siriActivationListener:(id)a3 deactivateForReason:(int64_t)a4 options:(unint64_t)a5 context:(id)a6 completion:(id)a7;
- (void)siriActivationListener:(id)a3 myriadEventWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6;
- (void)siriActivationListener:(id)a3 prewarmWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6;
- (void)start;
- (void)stop;
@end

@implementation SVXSiriActivationListenerDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationUtils, 0);
  objc_storeStrong((id *)&self->_instrumentationUtils, 0);
  objc_storeStrong((id *)&self->_siriActivationSupportPredicate, 0);
  objc_storeStrong((id *)&self->_virtualDeviceManager, 0);
  objc_storeStrong((id *)&self->_mainQueuePerformer, 0);

  objc_storeStrong((id *)&self->_siriActivationListener, 0);
}

- (void)siriActivationListener:(id)a3 myriadEventWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]";
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s requestInfo = %@, context = %@", buf, 0x20u);
  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke;
  v17[3] = &unk_264554918;
  v17[4] = self;
  id v18 = v10;
  id v19 = v9;
  id v20 = v11;
  id v14 = v9;
  id v15 = v11;
  id v16 = v10;
  [(SVXQueuePerformer *)mainQueuePerformer performBlock:v17 withOptions:2];
}

void __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke_2;
  v4[3] = &unk_264552528;
  id v5 = v2;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v3 getVirtualDeviceForActivationContext:v5 completion:v4];
}

void __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 myriadEventHandler];
    if (v5)
    {
      id v6 = [*(id *)(a1 + 40) speechRequestOptions];
      uint64_t v7 = [v6 activationEvent];

      v8 = *MEMORY[0x263F28348];
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO);
      if (v7 == 28)
      {
        if (v9)
        {
          *(_DWORD *)buf = 136315394;
          v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]_block_invoke";
          __int16 v23 = 2112;
          uint64_t v24 = (uint64_t)v4;
          _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s Handling continuous voice trigger %@...", buf, 0x16u);
        }
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke_15;
        v18[3] = &unk_2645547D8;
        id v19 = v4;
        id v20 = *(id *)(a1 + 48);
        [v5 continuousVoiceTriggerDetectedWithCompletion:v18];

        id v10 = v19;
        goto LABEL_19;
      }
      if (v9)
      {
        id v15 = *(void **)(a1 + 32);
        id v16 = v8;
        *(_DWORD *)buf = 136315650;
        v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]_block_invoke";
        __int16 v23 = 2048;
        uint64_t v24 = [v15 source];
        __int16 v25 = 2112;
        id v26 = v4;
        _os_log_impl(&dword_220062000, v16, OS_LOG_TYPE_INFO, "%s Unknown myriad source %ld or event %@...", buf, 0x20u);
      }
      uint64_t v14 = *(void *)(a1 + 48);
      if (!v14) {
        goto LABEL_20;
      }
LABEL_18:
      id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:9 userInfo:0];
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v10);
LABEL_19:

      goto LABEL_20;
    }
    v13 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v4;
      _os_log_error_impl(&dword_220062000, v13, OS_LOG_TYPE_ERROR, "%s Unable to get the myriad event handler from virtual device %@.", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      goto LABEL_18;
    }
    id v5 = 0;
LABEL_20:

    goto LABEL_21;
  }
  id v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]_block_invoke_2";
    __int16 v23 = 2112;
    uint64_t v24 = v17;
    _os_log_error_impl(&dword_220062000, v11, OS_LOG_TYPE_ERROR, "%s Unable to find a virtual device for context %@.", buf, 0x16u);
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12)
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:7 userInfo:0];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v5);
    goto LABEL_20;
  }
LABEL_21:
}

uint64_t __106__SVXSiriActivationListenerDelegate_siriActivationListener_myriadEventWithRequestInfo_context_completion___block_invoke_15(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SVXSiriActivationListenerDelegate siriActivationListener:myriadEventWithRequestInfo:context:completion:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s Continuous voice trigger handled %@.", (uint8_t *)&v5, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)siriActivationListener:(id)a3 deactivateForReason:(int64_t)a4 options:(unint64_t)a5 context:(id)a6 completion:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v11 = a6;
  id v12 = a7;
  v13 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v13;
    id v15 = AFSiriDeactivationReasonGetName();
    id v16 = AFSiriDeactivationOptionsGetNames();
    *(_DWORD *)buf = 136315906;
    id v26 = "-[SVXSiriActivationListenerDelegate siriActivationListener:deactivateForReason:options:context:completion:]";
    __int16 v27 = 2112;
    v28 = v15;
    __int16 v29 = 2112;
    v30 = v16;
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s reason = %@, options = %@, context = %@", buf, 0x2Au);
  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke;
  v20[3] = &unk_264552500;
  v20[4] = self;
  id v21 = v11;
  id v22 = v12;
  int64_t v23 = a4;
  unint64_t v24 = a5;
  id v18 = v12;
  id v19 = v11;
  [(SVXQueuePerformer *)mainQueuePerformer performBlock:v20 withOptions:2];
}

void __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke_2;
  v5[3] = &unk_2645524D8;
  id v6 = v2;
  id v4 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v4;
  long long v9 = *(_OWORD *)(a1 + 56);
  [v3 getVirtualDeviceForActivationContext:v6 completion:v5];
}

void __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 deactivationHandler];
    id v6 = *MEMORY[0x263F28348];
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:deactivateForReason:options:context:completion:]_block_invoke";
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Deactivating %@...", buf, 0x16u);
      }
      uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 48) createDeactivationContextWithReason:*(void *)(a1 + 56) options:*(void *)(a1 + 64) context:*(void *)(a1 + 32)];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke_13;
      v13[3] = &unk_2645547D8;
      id v14 = v4;
      id v15 = *(id *)(a1 + 48);
      [v5 deactivateWithContext:v7 completion:v13];

      id v8 = v14;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:deactivateForReason:options:context:completion:]_block_invoke";
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s Unable to get the deactivation handler from virtual device %@.", buf, 0x16u);
      }
      uint64_t v11 = *(void *)(a1 + 48);
      if (!v11)
      {
        int v5 = 0;
        goto LABEL_15;
      }
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:10 userInfo:0];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v8);
    }

LABEL_15:
    goto LABEL_16;
  }
  long long v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    id v12 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:deactivateForReason:options:context:completion:]_block_invoke_2";
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_error_impl(&dword_220062000, v9, OS_LOG_TYPE_ERROR, "%s Unable to find a virtual device for context %@.", buf, 0x16u);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10)
  {
    int v5 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:7 userInfo:0];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v5);
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __107__SVXSiriActivationListenerDelegate_siriActivationListener_deactivateForReason_options_context_completion___block_invoke_13(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[SVXSiriActivationListenerDelegate siriActivationListener:deactivateForReason:options:context:completion:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s Deactivated %@.", (uint8_t *)&v5, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)siriActivationListener:(id)a3 activateWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]";
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s requestInfo = %@, context = %@", buf, 0x20u);
  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke;
  v17[3] = &unk_264554918;
  v17[4] = self;
  id v18 = v10;
  id v19 = v9;
  id v20 = v11;
  id v14 = v9;
  id v15 = v11;
  id v16 = v10;
  [(SVXQueuePerformer *)mainQueuePerformer performBlock:v17 withOptions:2];
}

void __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2;
  v6[3] = &unk_2645524B0;
  id v7 = v2;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 48);
  [v3 getVirtualDeviceForActivationContext:v7 completion:v6];
}

void __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 activationHandler];
    if (v5)
    {
      int v6 = [*(id *)(*(void *)(a1 + 40) + 48) wantsActivation:*(void *)(a1 + 32)];
      id v7 = *MEMORY[0x263F28348];
      if (v6)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke";
          __int16 v23 = 2112;
          id v24 = v4;
          _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s Activating %@...", buf, 0x16u);
        }
        uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 48) createActivationContextWithRequestInfo:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_10;
        v18[3] = &unk_264553BF0;
        id v19 = v4;
        id v20 = *(id *)(a1 + 56);
        [v5 activateWithContext:v8 completion:v18];

        id v9 = v19;
        goto LABEL_20;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        id v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke";
        __int16 v23 = 2112;
        id v24 = v17;
        __int16 v25 = 2112;
        id v26 = v4;
        _os_log_error_impl(&dword_220062000, v7, OS_LOG_TYPE_ERROR, "%s Unable to activate with context %@ for virtual device %@.", buf, 0x20u);
      }
      uint64_t v13 = *(void *)(a1 + 56);
      if (!v13) {
        goto LABEL_21;
      }
      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = 4;
    }
    else
    {
      id v12 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke";
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_error_impl(&dword_220062000, v12, OS_LOG_TYPE_ERROR, "%s Unable to get the activation handler from virtual device %@.", buf, 0x16u);
      }
      uint64_t v13 = *(void *)(a1 + 56);
      if (!v13)
      {
        uint64_t v5 = 0;
        goto LABEL_21;
      }
      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = 9;
    }
    id v9 = [v14 errorWithDomain:@"SiriVOXErrorDomain" code:v15 userInfo:0];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v9);
LABEL_20:

    goto LABEL_21;
  }
  id v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    id v16 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke_2";
    __int16 v23 = 2112;
    id v24 = v16;
    _os_log_error_impl(&dword_220062000, v10, OS_LOG_TYPE_ERROR, "%s Unable to find a virtual device for context %@.", buf, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11)
  {
    uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:7 userInfo:0];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v5);
LABEL_21:
  }
}

void __103__SVXSiriActivationListenerDelegate_siriActivationListener_activateWithRequestInfo_context_completion___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 136315650;
      id v9 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s Failed to activate %@. (error = %@)", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 136315394;
    id v9 = "-[SVXSiriActivationListenerDelegate siriActivationListener:activateWithRequestInfo:context:completion:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Activated %@.", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)siriActivationListener:(id)a3 prewarmWithRequestInfo:(id)a4 context:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  __int16 v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v22 = "-[SVXSiriActivationListenerDelegate siriActivationListener:prewarmWithRequestInfo:context:completion:]";
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s requestInfo = %@, context = %@", buf, 0x20u);
  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke;
  v17[3] = &unk_264554918;
  v17[4] = self;
  id v18 = v10;
  id v19 = v9;
  id v20 = v11;
  id v14 = v9;
  id v15 = v11;
  id v16 = v10;
  [(SVXQueuePerformer *)mainQueuePerformer performBlock:v17 withOptions:2];
}

void __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_2;
  v6[3] = &unk_2645524B0;
  id v7 = v2;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 48);
  [v3 getVirtualDeviceForActivationContext:v7 completion:v6];
}

void __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 prewarmHandler];
    uint64_t v6 = *MEMORY[0x263F28348];
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:prewarmWithRequestInfo:context:completion:]_block_invoke";
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Prewarming %@...", buf, 0x16u);
      }
      id v7 = [*(id *)(*(void *)(a1 + 40) + 48) createActivationContextWithRequestInfo:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_7;
      v13[3] = &unk_2645547D8;
      id v14 = v4;
      id v15 = *(id *)(a1 + 56);
      [v5 prewarmWithContext:v7 completion:v13];

      uint64_t v8 = v14;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:prewarmWithRequestInfo:context:completion:]_block_invoke";
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s Unable to get the prewarm handler from virtual device %@.", buf, 0x16u);
      }
      uint64_t v11 = *(void *)(a1 + 56);
      if (!v11)
      {
        uint64_t v5 = 0;
        goto LABEL_15;
      }
      uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:8 userInfo:0];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v8);
    }

LABEL_15:
    goto LABEL_16;
  }
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = "-[SVXSiriActivationListenerDelegate siriActivationListener:prewarmWithRequestInfo:context:completion:]_block_invoke_2";
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_error_impl(&dword_220062000, v9, OS_LOG_TYPE_ERROR, "%s Unable to find a virtual device for context %@.", buf, 0x16u);
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10)
  {
    uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:7 userInfo:0];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v5);
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __102__SVXSiriActivationListenerDelegate_siriActivationListener_prewarmWithRequestInfo_context_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "-[SVXSiriActivationListenerDelegate siriActivationListener:prewarmWithRequestInfo:context:completion:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s Prewarmed %@.", (uint8_t *)&v5, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)stop
{
}

- (void)start
{
}

- (SVXSiriActivationListenerDelegate)initWithSiriActivationListener:(id)a3 mainQueuePerformer:(id)a4 siriActivationSupportPredicate:(id)a5 virtualDeviceManager:(id)a6 instrumentationUtils:(id)a7 activationUtils:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SVXSiriActivationListenerDelegate;
  __int16 v18 = [(SVXSiriActivationListenerDelegate *)&v24 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_siriActivationListener, a3);
    objc_storeStrong((id *)&v19->_mainQueuePerformer, a4);
    objc_storeStrong((id *)&v19->_siriActivationSupportPredicate, a5);
    objc_storeStrong((id *)&v19->_virtualDeviceManager, a6);
    objc_storeStrong((id *)&v19->_instrumentationUtils, a7);
    objc_storeStrong((id *)&v19->_activationUtils, a8);
  }

  return v19;
}

- (SVXSiriActivationListenerDelegate)initWithVirtualDeviceManager:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F285F0];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithServicePort:2];
  __int16 v7 = +[SVXQueuePerformer sharedMainQueuePerformer];
  uint64_t v8 = objc_alloc_init(SVXSiriActivationSupportPredicate);
  uint64_t v9 = objc_alloc_init(SVXInstrumentationUtilities);
  uint64_t v10 = objc_alloc_init(SVXActivationUtils);
  uint64_t v11 = [(SVXSiriActivationListenerDelegate *)self initWithSiriActivationListener:v6 mainQueuePerformer:v7 siriActivationSupportPredicate:v8 virtualDeviceManager:v5 instrumentationUtils:v9 activationUtils:v10];

  return v11;
}

@end