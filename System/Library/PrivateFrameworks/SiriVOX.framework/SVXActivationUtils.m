@interface SVXActivationUtils
- (BOOL)wantsActivation:(id)a3;
- (id)createActivationContextWithRequestInfo:(id)a3 context:(id)a4;
- (id)createDeactivationContextWithReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5;
@end

@implementation SVXActivationUtils

- (id)createDeactivationContextWithReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [v6 timestamp];
  if (!v7) {
    uint64_t v7 = mach_absolute_time();
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__SVXActivationUtils_createDeactivationContextWithReason_options_context___block_invoke;
  v11[3] = &unk_264553218;
  int64_t v13 = a3;
  uint64_t v14 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = +[SVXDeactivationContext newWithBuilder:v11];

  return v9;
}

void __74__SVXActivationUtils_createDeactivationContextWithReason_options_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  v5 = v4;
  if (v3 == 3) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = 2;
  }
  [v4 setSource:v6];
  [v5 setTimestamp:*(void *)(a1 + 48)];
  id v7 = [*(id *)(a1 + 32) userInfo];
  [v5 setUserInfo:v7];
}

- (id)createActivationContextWithRequestInfo:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 speechRequestOptions];
  uint64_t v8 = [v7 activationEventMachAbsoluteTime];
  if (!v8)
  {
    uint64_t v8 = [v5 timestamp];
    if (!v8)
    {
      uint64_t v8 = [v6 timestamp];
      if (!v8) {
        uint64_t v8 = mach_absolute_time();
      }
    }
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__SVXActivationUtils_createActivationContextWithRequestInfo_context___block_invoke;
  v13[3] = &unk_2645531F0;
  id v14 = v5;
  id v15 = v6;
  uint64_t v16 = v8;
  id v9 = v6;
  id v10 = v5;
  id v11 = +[SVXActivationContext newWithBuilder:v13];

  return v11;
}

void __69__SVXActivationUtils_createActivationContextWithRequestInfo_context___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3 && ![v3 isSpeechRequest])
  {
    uint64_t v5 = 7;
    goto LABEL_14;
  }
  uint64_t v4 = [*(id *)(a1 + 40) event];
  if (v4 <= 7)
  {
    if ((unint64_t)(v4 - 2) < 3)
    {
      uint64_t v5 = 6;
      goto LABEL_14;
    }
LABEL_12:
    uint64_t v5 = 2;
    goto LABEL_14;
  }
  if (v4 == 17)
  {
    uint64_t v5 = 8;
    goto LABEL_14;
  }
  if (v4 != 9)
  {
    if (v4 == 8)
    {
      uint64_t v5 = 1;
      id v6 = [[SVXButtonEvent alloc] initWithType:1 timestamp:*(void *)(a1 + 48)];
      [v8 setButtonEvent:v6];

      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v7 = [[SVXButtonEvent alloc] initWithType:2 timestamp:*(void *)(a1 + 48)];
  [v8 setButtonEvent:v7];

  uint64_t v5 = 1;
LABEL_14:
  [v8 setSource:v5];
  [v8 setTimestamp:*(void *)(a1 + 48)];
  [v8 setRequestInfo:*(void *)(a1 + 32)];
}

- (BOOL)wantsActivation:(id)a3
{
  return 1;
}

@end