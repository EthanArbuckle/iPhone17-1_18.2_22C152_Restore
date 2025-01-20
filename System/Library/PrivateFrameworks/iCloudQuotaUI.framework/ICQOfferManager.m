@interface ICQOfferManager
@end

@implementation ICQOfferManager

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      v13 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v12;
      __int16 v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "Failed to load offer for event: %@, error: %@", buf, 0x16u);
    }
    v14 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_14;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.cloud.quota"];
  int v8 = [v7 BOOLForKey:@"debug-trigger-event"];

  if (!v8)
  {
    v15 = *(void **)(a1 + 48);
    v16 = [v5 appLaunchLink];
    LODWORD(v15) = [v15 shouldPresentAppLaunchLink:v16];

    if (v15)
    {
      v17 = *(void **)(a1 + 48);
      v18 = [v5 appLaunchLink];
      v19 = [v18 link];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3;
      v23[3] = &unk_264923518;
      id v27 = *(id *)(a1 + 56);
      id v24 = v5;
      int8x16_t v22 = *(int8x16_t *)(a1 + 40);
      id v20 = (id)v22.i64[0];
      int8x16_t v25 = vextq_s8(v22, v22, 8uLL);
      id v26 = *(id *)(a1 + 32);
      [v17 _getCachedLinkData:v19 completion:v23];

      goto LABEL_17;
    }
    v21 = _ICQGetLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_cold_1(a1, v21);
    }

    v14 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_14:
    v14();
    goto LABEL_17;
  }
  v9 = [v5 messageSpecificationForReason:*(void *)(a1 + 32) bundleId:*(void *)(a1 + 40) placement:@"InApp"];
  v10 = *(unsigned int (**)(void))(*(void *)(a1 + 56) + 16);
  if (v9)
  {
    if (v10())
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_2;
      block[3] = &unk_264922568;
      block[4] = *(void *)(a1 + 48);
      id v29 = v5;
      id v30 = v9;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    v10();
  }

LABEL_17:
}

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_2(uint64_t a1)
{
  v2 = [[ICQUpgradeFlowManager alloc] initWithOffer:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setFlowManager:v2];

  v3 = *(void **)(a1 + 32);
  v4 = [v3 flowManager];
  [v4 setDelegate:v3];

  id v7 = [*(id *)(a1 + 32) flowManager];
  id v5 = [*(id *)(a1 + 48) links];
  id v6 = [v5 firstObject];
  [v7 beginRemoteUpgradeFlowWithICQLink:v6];
}

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3_cold_2(v4);
  }

  if ((*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_46;
    v9[3] = &unk_264923418;
    v10 = *(id *)(a1 + 32);
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    id v11 = v5;
    uint64_t v12 = v6;
    id v13 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v9);

    int v8 = v10;
  }
  else
  {
    int v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3_cold_1(a1, v8);
    }
  }
}

uint64_t __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_46(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) appLaunchLink];
    v4 = [v3 link];
    BOOL v5 = *(void *)(a1 + 40) != 0;
    int v16 = 138412546;
    v17 = v4;
    __int16 v18 = 1024;
    BOOL v19 = v5;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Presenting app launch link %@, has prefetched data %d", (uint8_t *)&v16, 0x12u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) appLaunchLink];
  int v8 = [v7 link];
  [v8 setServerUIContent:v6];

  v9 = [[ICQUpgradeFlowManager alloc] initWithOffer:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) setFlowManager:v9];

  v10 = *(void **)(a1 + 48);
  id v11 = [v10 flowManager];
  [v11 setDelegate:v10];

  uint64_t v12 = [*(id *)(a1 + 48) flowManager];
  id v13 = [*(id *)(a1 + 32) appLaunchLink];
  v14 = [v13 link];
  [v12 beginRemoteUpgradeFlowWithICQLink:v14];

  return [*(id *)(a1 + 48) appLaunchLinkDidPresentForBundleIdentifier:*(void *)(a1 + 56)];
}

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_22C821000, a2, OS_LOG_TYPE_DEBUG, "No AppLaunchLink found for bundle %@", (uint8_t *)&v3, 0xCu);
}

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Presenting app launch link for bundle %@, event %@, was cancelled by calling app", (uint8_t *)&v4, 0x16u);
}

void __84__ICQOfferManager_ICQUI__fetchAndPresentUpsellForBundleIdentifier_event_completion___block_invoke_3_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "Found offer with app launch link", v1, 2u);
}

@end