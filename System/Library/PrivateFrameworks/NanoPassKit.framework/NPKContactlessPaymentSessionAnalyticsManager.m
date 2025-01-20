@interface NPKContactlessPaymentSessionAnalyticsManager
- (NPKContactlessPaymentSessionAnalyticsManager)init;
- (NPKContactlessPaymentSessionState)previousState;
- (void)contactlessPaymentSessionManager:(id)a3 didChangeSessionState:(id)a4;
- (void)setPreviousState:(id)a3;
@end

@implementation NPKContactlessPaymentSessionAnalyticsManager

- (NPKContactlessPaymentSessionAnalyticsManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)NPKContactlessPaymentSessionAnalyticsManager;
  v2 = [(NPKContactlessPaymentSessionAnalyticsManager *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(NPKContactlessPaymentSessionState);
    previousState = v2->_previousState;
    v2->_previousState = v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.NanoPassKit.NPKContactlessPaymentSessionAnalyticsManager", v5);
    analyticsQueue = v2->_analyticsQueue;
    v2->_analyticsQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)contactlessPaymentSessionManager:(id)a3 didChangeSessionState:(id)a4
{
  id v5 = a4;
  analyticsQueue = self->_analyticsQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __103__NPKContactlessPaymentSessionAnalyticsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke;
  v8[3] = &unk_2644D2E08;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(analyticsQueue, v8);
}

void __103__NPKContactlessPaymentSessionAnalyticsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke(uint64_t a1)
{
  v42[2] = *MEMORY[0x263EF8340];
  if (NPKIsRunningInCarousel()) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = 2;
  }
  id v3 = (id)*MEMORY[0x263F5C3F0];
  v4 = [*(id *)(a1 + 32) transactionContext];
  if ([v4 releaseDataStatus] == 6)
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 16) transactionContext];
    uint64_t v6 = [v5 releaseDataStatus];

    if (v6 != 6)
    {
      id v7 = (void *)MEMORY[0x263F5BD40];
      uint64_t v8 = *MEMORY[0x263F5C4C8];
      v42[0] = *MEMORY[0x263F5C4A8];
      v42[1] = v8;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
      uint64_t v10 = *MEMORY[0x263F5C380];
      uint64_t v11 = *MEMORY[0x263F5C360];
      v40[0] = *MEMORY[0x263F5C378];
      v40[1] = v11;
      v41[0] = v10;
      v41[1] = @"userCancelled";
      v12 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
      [v7 subjects:v9 sendEvent:v12];
      goto LABEL_13;
    }
  }
  else
  {
  }
  if ([*(id *)(*(void *)(a1 + 40) + 16) failureType]
    || ![*(id *)(a1 + 32) failureType])
  {
    id v9 = [*(id *)(*(void *)(a1 + 40) + 16) transactionContext];
    if ([v9 transactionStatus] == 2)
    {
LABEL_14:

LABEL_15:
      v13 = @"other";
      goto LABEL_16;
    }
    v12 = [*(id *)(a1 + 32) transactionContext];
    if ([v12 transactionStatus] == 2)
    {
      if ([*(id *)(a1 + 32) completionReason] == 3)
      {
      }
      else
      {
        uint64_t v15 = [*(id *)(a1 + 32) completionReason];

        if (v15) {
          goto LABEL_15;
        }
      }
      v16 = (void *)MEMORY[0x263F5BD40];
      uint64_t v17 = *MEMORY[0x263F5C4C8];
      v36[0] = *MEMORY[0x263F5C4A8];
      v36[1] = v17;
      v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
      uint64_t v19 = *MEMORY[0x263F5C480];
      v34[0] = *MEMORY[0x263F5C378];
      v34[1] = v19;
      v35[0] = v3;
      v35[1] = @"success";
      uint64_t v20 = *MEMORY[0x263F5C360];
      v34[2] = *MEMORY[0x263F5C448];
      v34[3] = v20;
      v35[2] = v19;
      v35[3] = @"unknown";
      v21 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
      [v16 subjects:v18 sendEvent:v21];

      v22 = [*(id *)(a1 + 32) currentPass];
      LODWORD(v18) = NPKIsValidVASPass(v22);

      if (v18)
      {
        v23 = [MEMORY[0x263F08AB0] processInfo];
        uint64_t v24 = [v23 isLowPowerModeEnabled];

        uint64_t IsTinker = NPKPairedOrPairingDeviceIsTinker();
        NPKTrackSETransactionDetails(v2, 5, v24, IsTinker);
      }
      goto LABEL_15;
    }
LABEL_13:

    goto LABEL_14;
  }
  switch([*(id *)(a1 + 32) failureType])
  {
    case 1:
    case 5:
      v14 = @"failure";
      v13 = @"sessionFailed";
      break;
    case 2:
    case 6:
    case 8:
    case 9:
      v14 = @"failure";
      v13 = @"transactionFailed";
      break;
    case 3:
    case 4:
    case 7:
      v14 = @"failure";
      v13 = @"userCancelled";
      break;
    case 10:
      v13 = (__CFString *)(id)*MEMORY[0x263F5C370];
      v26 = (id *)MEMORY[0x263F5C3F8];
      goto LABEL_27;
    case 11:
      v13 = @"unlockIPhone";
      v26 = (id *)MEMORY[0x263F5C388];
LABEL_27:
      id v27 = *v26;

      v14 = @"failure";
      id v3 = v27;
      break;
    default:
      v14 = @"unknown";
      v13 = @"other";
      break;
  }
  v28 = (void *)MEMORY[0x263F5BD40];
  uint64_t v29 = *MEMORY[0x263F5C4C8];
  v39[0] = *MEMORY[0x263F5C4A8];
  v39[1] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
  uint64_t v31 = *MEMORY[0x263F5C480];
  v37[0] = *MEMORY[0x263F5C378];
  v37[1] = v31;
  v38[0] = v3;
  v38[1] = v14;
  uint64_t v32 = *MEMORY[0x263F5C360];
  v37[2] = *MEMORY[0x263F5C448];
  v37[3] = v32;
  v38[2] = v31;
  v38[3] = v13;
  v33 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
  [v28 subjects:v30 sendEvent:v33];

LABEL_16:
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), *(id *)(a1 + 32));
}

- (NPKContactlessPaymentSessionState)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
}

@end