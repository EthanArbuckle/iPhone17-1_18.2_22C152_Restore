@interface WRM
@end

@implementation WRM

void __46__WRM_iRATInterface_processBTLQMNotification___block_invoke(uint64_t a1)
{
  xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "WRMLinkPrefBTScore_LQMScore");
  NSLog(&cfstr_ReceivedLqmUpd.isa, *(void *)(a1 + 32));
  if (*(void *)(*(void *)(a1 + 40) + 96))
  {
    NSLog(&cfstr_SendingLqmScor.isa);
    v2 = *(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 96) + 16);
    v2();
  }
  else
  {
    NSLog(&cfstr_DiscardLqmScor.isa);
  }
}

uint64_t __66__WRM_iRATInterface_processLowPowerModePeriodicWakeUpNotification__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 104))
  {
    uint64_t v1 = result;
    NSLog(&cfstr_Processlowpowe.isa);
    v2 = *(uint64_t (**)(void))(*(void *)(*(void *)(v1 + 32) + 104) + 16);
    return v2();
  }
  return result;
}

void __54__WRM_iRATInterface_processOperatingModeNotification___block_invoke(uint64_t a1)
{
  xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "WRMCommCenterOperatingModeNotifcation_EnableTelephony");
  xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "WRMCommCenterOperatingModeNotifcation_SetBBState");
  NSLog(&cfstr_ReceivedOperat.isa, *(void *)(a1 + 32));
  if (*(void *)(*(void *)(a1 + 40) + 64))
  {
    NSLog(&cfstr_SendingOperati.isa);
    v2 = *(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 64) + 16);
    v2();
  }
  else
  {
    NSLog(&cfstr_DiscardOperati.isa);
  }
}

void __54__WRM_iRATInterface_processMetricsNotificationReport___block_invoke(uint64_t a1)
{
  v14 = objc_alloc_init(WRM_iRATProximityRecommendationLogging);
  v2 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRssi");

  if (v2) {
    [(WRM_iRATProximityRecommendationLogging *)v14 setBtRSSI:xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRssi")];
  }
  v3 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRetransmissionRateTx");

  if (v3) {
    [(WRM_iRATProximityRecommendationLogging *)v14 setBtRetransmissionRateTx:xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRetransmissionRateTx")];
  }
  v4 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRetransmissionRateRx");

  if (v4) {
    [(WRM_iRATProximityRecommendationLogging *)v14 setBtRetransmissionRateRx:xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRetransmissionRateRx")];
  }
  v5 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtTech");

  if (v5) {
    [(WRM_iRATProximityRecommendationLogging *)v14 setBtTech:xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtTech")];
  }
  v6 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiRssi");

  if (v6) {
    [(WRM_iRATProximityRecommendationLogging *)v14 setWifiRSSI:xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiRssi")];
  }
  v7 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiSnr");

  if (v7) {
    [(WRM_iRATProximityRecommendationLogging *)v14 setWifiSNR:xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiSnr")];
  }
  v8 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiLSMBeRecommendation");

  if (v8) {
    [(WRM_iRATProximityRecommendationLogging *)v14 setLsmRecommendationBe:xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiLSMBeRecommendation")];
  }
  v9 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiExpectedThroughputVIBE");

  if (v9) {
    [(WRM_iRATProximityRecommendationLogging *)v14 setExpectedThroughputVIBE:xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiExpectedThroughputVIBE")];
  }
  v10 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiPacketLifetimeVIBE");

  if (v10) {
    [(WRM_iRATProximityRecommendationLogging *)v14 setPacketLifetimeVIBE:xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiPacketLifetimeVIBE")];
  }
  v11 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiPacketLossRateVIBE");

  if (v11) {
    [(WRM_iRATProximityRecommendationLogging *)v14 setPacketLossRateVIBE:xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiPacketLossRateVIBE")];
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v12 + 118))
  {
    uint64_t v13 = *(void *)(v12 + 88);
    if (v13)
    {
      (*(void (**)(uint64_t, WRM_iRATProximityRecommendationLogging *))(v13 + 16))(v13, v14);
      *(unsigned char *)(*(void *)(a1 + 40) + 118) = 0;
      NSLog(&cfstr_SentMetricsFor.isa);
    }
  }
}

void __56__WRM_iRATInterface_processNotificationListForTerminus___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 48))
  {
    size_t v2 = 0;
    unint64_t v3 = 0x26422A000uLL;
    do
    {
      v4 = xpc_array_get_value(*(xpc_object_t *)(v1 + 32), v2);
      id v5 = objc_alloc_init(*(Class *)(v3 + 472));
      objc_msgSend(v5, "setRecommendationType:", xpc_dictionary_get_uint64(v4, "kWRMProximityLinkRecommendationType"));
      objc_msgSend(v5, "setLinkIsRecommended:", xpc_dictionary_get_BOOL(v4, "kWRMProximityLinkisRecommended"));
      [v5 setLinkRecommendationIsValid:1];
      if ([v5 RecommendationType] == 2)
      {
        v6 = xpc_dictionary_get_value(v4, "kWRMProximityBtRssi");

        if (v6)
        {
          uint64_t uint64 = xpc_dictionary_get_uint64(v4, "kWRMProximityBtRssi");
          v8 = [v5 metrics];
          [v8 setBtRSSI:uint64];
        }
        v9 = xpc_dictionary_get_value(v4, "kWRMProximityBtRetransmissionRateTx");

        if (v9)
        {
          int64_t int64 = xpc_dictionary_get_int64(v4, "kWRMProximityBtRetransmissionRateTx");
          v11 = [v5 metrics];
          [v11 setBtRetransmissionRateTx:int64];
        }
        uint64_t v12 = xpc_dictionary_get_value(v4, "kWRMProximityBtRetransmissionRateRx");

        if (v12)
        {
          uint64_t v13 = xpc_dictionary_get_uint64(v4, "kWRMProximityBtRetransmissionRateRx");
          v14 = [v5 metrics];
          [v14 setBtRetransmissionRateRx:v13];
        }
        v15 = xpc_dictionary_get_value(v4, "kWRMProximityBtTech");

        if (v15)
        {
          int64_t v16 = xpc_dictionary_get_int64(v4, "kWRMProximityBtTech");
          v17 = [v5 metrics];
          [v17 setBtTech:v16];
        }
        v18 = xpc_dictionary_get_value(v4, "kWRMProximityWifiRssi");

        if (v18)
        {
          int64_t v19 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiRssi");
          v20 = [v5 metrics];
          [v20 setWifiRSSI:v19];
        }
        v21 = xpc_dictionary_get_value(v4, "kWRMProximityWifiSnr");

        uint64_t v1 = a1;
        if (v21)
        {
          int64_t v22 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiSnr");
          v23 = [v5 metrics];
          [v23 setWifiSNR:v22];
        }
        v24 = xpc_dictionary_get_value(v4, "kWRMProximityWifiLSMBeRecommendation");

        if (v24)
        {
          int64_t v25 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiLSMBeRecommendation");
          v26 = [v5 metrics];
          [v26 setLsmRecommendationBe:v25];
        }
        v27 = xpc_dictionary_get_value(v4, "kWRMProximityWifiExpectedThroughputVIBE");

        if (v27)
        {
          int64_t v28 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiExpectedThroughputVIBE");
          v29 = [v5 metrics];
          [v29 setExpectedThroughputVIBE:v28];
        }
        v30 = xpc_dictionary_get_value(v4, "kWRMProximityWifiPacketLifetimeVIBE");

        if (v30)
        {
          int64_t v31 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiPacketLifetimeVIBE");
          v32 = [v5 metrics];
          [v32 setPacketLifetimeVIBE:v31];
        }
        v33 = xpc_dictionary_get_value(v4, "kWRMProximityWifiPacketLossRateVIBE");

        unint64_t v3 = 0x26422A000;
        if (v33)
        {
          int64_t v34 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiPacketLossRateVIBE");
          v35 = [v5 metrics];
          [v35 setPacketLossRateVIBE:v34];
        }
      }
      [*(id *)(v1 + 40) addProximityLinkRecommendationType:v5];

      ++v2;
    }
    while (*(void *)(v1 + 48) > v2);
  }
  uint64_t v36 = *(void *)(v1 + 40);
  if (*(unsigned char *)(v36 + 117))
  {
    uint64_t v37 = *(void *)(v36 + 80);
    if (v37)
    {
      (*(void (**)(uint64_t, void))(v37 + 16))(v37, *(void *)(v36 + 128));
      *(unsigned char *)(*(void *)(v1 + 40) + 117) = 0;
      NSLog(&cfstr_CountOfRecomme.isa, [*(id *)(*(void *)(v1 + 40) + 128) count]);
      uint64_t v36 = *(void *)(v1 + 40);
    }
  }
  if (*(unsigned char *)(v36 + 116))
  {
    uint64_t v38 = *(void *)(v36 + 72);
    if (v38)
    {
      (*(void (**)(uint64_t, void))(v38 + 16))(v38, *(void *)(v36 + 128));
      NSLog(&cfstr_CountOfRecomme_0.isa, [*(id *)(*(void *)(v1 + 40) + 128) count]);
    }
  }
}

void __42__WRM_iRATInterface_registerClient_queue___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleNotification:v8 :a4];
  }
}

void __53__WRM_iRATInterface_subscribeBtLqmScoreNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = MEMORY[0x2166AEE70](*(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v2;

    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    *(_OWORD *)keys = xmmword_26422A488;
    xpc_object_t v6 = xpc_uint64_create(0x1A5uLL);
    v10[0] = v6;
    id v7 = v5;
    v10[1] = v7;
    xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, v10, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v8);
    NSLog(&cfstr_XpcMessageSent.isa, v10[0]);

    for (uint64_t i = 1; i != -1; --i)
  }
  else
  {
    NSLog(&cfstr_Subscribebtlqm.isa);
  }
}

void __58__WRM_iRATInterface_subscribeProximityLinkRecommendation___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = MEMORY[0x2166AEE70](*(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = v2;

    *(unsigned char *)(*(void *)(a1 + 32) + 116) = *(void *)(*(void *)(a1 + 32) + 72) != 0;
    if (*(unsigned char *)(*(void *)(a1 + 32) + 116))
    {
      xpc_object_t v5 = objc_alloc_init(WRM_iRATProximityRecommendation);
      [(WRM_iRATProximityRecommendation *)v5 setRecommendationType:1];
      [(WRM_iRATProximityRecommendation *)v5 setLinkRecommendationIsValid:1];
      [(WRM_iRATProximityRecommendation *)v5 setLinkIsRecommended:1];
      [*(id *)(a1 + 32) addProximityLinkRecommendationType:v5];
      xpc_object_t v6 = objc_alloc_init(WRM_iRATProximityRecommendation);
      [(WRM_iRATProximityRecommendation *)v6 setRecommendationType:0];
      [(WRM_iRATProximityRecommendation *)v6 setLinkRecommendationIsValid:1];
      [(WRM_iRATProximityRecommendation *)v6 setLinkIsRecommended:1];
      [*(id *)(a1 + 32) addProximityLinkRecommendationType:v6];
      id v7 = objc_alloc_init(WRM_iRATProximityRecommendation);
      [(WRM_iRATProximityRecommendation *)v7 setRecommendationType:2];
      [(WRM_iRATProximityRecommendation *)v7 setLinkRecommendationIsValid:1];
      [(WRM_iRATProximityRecommendation *)v7 setLinkIsRecommended:1];
      [*(id *)(a1 + 32) addProximityLinkRecommendationType:v7];
      unsigned int v8 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
      if (v8 < 0x2A && ((0x3EEEFFFFFFFuLL >> v8) & 1) != 0)
      {
        v9 = off_26422A4D8[v8];
      }
      else if (v8 == 42)
      {
        v9 = "WRMSOS";
      }
      else
      {
        v9 = "INVALID_PROC_ID!!!";
      }
      NSLog(&cfstr_SendingDefault.isa, v9);
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 72) + 16))();
      [*(id *)(*(void *)(a1 + 32) + 128) removeAllObjects];
    }
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kWRMApplicationType", 0);
    xpc_dictionary_set_uint64(v10, "kWRMSubscriptionType", 0);
    xpc_dictionary_set_BOOL(v10, "kWRMProximityLinkRecommendationSubscriptionValid", *(unsigned char *)(*(void *)(a1 + 32) + 116));
    *(_OWORD *)keys = xmmword_26422A488;
    xpc_object_t v11 = xpc_uint64_create([*(id *)(a1 + 32) getSubscribeMessageType:*(unsigned int *)(*(void *)(a1 + 32) + 16)]);
    values[0] = v11;
    id v12 = v10;
    values[1] = v12;
    xpc_object_t v13 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v13);

    for (uint64_t i = 1; i != -1; --i)
  }
  else
  {
    NSLog(&cfstr_Subscribeproxi.isa);
  }
}

void __50__WRM_iRATInterface_getLinkRecommendationMetrics___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    uint64_t v3 = *(void **)(v1 + 88);
    if (v3)
    {
      *(void *)(v1 + 88) = 0;
    }
    uint64_t v4 = MEMORY[0x2166AEE70](*(void *)(a1 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
    xpc_object_t v6 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v4;

    *(unsigned char *)(*(void *)(a1 + 32) + 118) = *(void *)(*(void *)(a1 + 32) + 88) != 0;
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v7, "kWRMProximityGetProximityGetMetrics", *(unsigned char *)(*(void *)(a1 + 32) + 118));
    *(_OWORD *)keys = xmmword_26422A488;
    xpc_object_t v8 = xpc_uint64_create(0x19FuLL);
    v12[0] = v8;
    id v9 = v7;
    v12[1] = v9;
    xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, v12, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v10);

    for (uint64_t i = 1; i != -1; --i)
  }
  else
  {
    NSLog(&cfstr_Getlinkrecomme.isa);
  }
}

void __67__WRM_iRATInterface_getProximityLinkRecommendation_recommendation___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    uint64_t v3 = *(void **)(v1 + 80);
    if (v3)
    {
      *(void *)(v1 + 80) = 0;
    }
    uint64_t v4 = MEMORY[0x2166AEE70](*(void *)(a1 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
    xpc_object_t v6 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v4;

    *(unsigned char *)(*(void *)(a1 + 32) + 117) = *(void *)(*(void *)(a1 + 32) + 80) != 0;
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kWRMApplicationType", 0);
    xpc_dictionary_set_uint64(v7, "kWRMSubscriptionType", 0);
    xpc_dictionary_set_BOOL(v7, "kWRMProximityGetProximityLinkRecommendation", *(unsigned char *)(*(void *)(a1 + 32) + 117));
    xpc_dictionary_set_BOOL(v7, "kWRMProximityLinkRecommendationIsRetry", *(unsigned char *)(a1 + 48));
    *(_OWORD *)keys = xmmword_26422A488;
    xpc_object_t v8 = xpc_uint64_create([*(id *)(a1 + 32) getSubscribeMessageType:*(unsigned int *)(*(void *)(a1 + 32) + 16)]);
    v12[0] = v8;
    id v9 = v7;
    v12[1] = v9;
    xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, v12, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v10);

    for (uint64_t i = 1; i != -1; --i)
  }
  else
  {
    NSLog(&cfstr_Getproximityli.isa);
  }
}

void __58__WRM_iRATInterface_statusUpdateAppLinkPreference_status___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v2, "kWRMProximityLinkRecommendationType", *(unsigned int *)(a1 + 40));
    xpc_dictionary_set_BOOL(v2, "kWRMProximityAppLinkPreferenceActive", *(unsigned char *)(a1 + 44));
    *(_OWORD *)keys = xmmword_26422A488;
    xpc_object_t v3 = xpc_uint64_create([*(id *)(a1 + 32) getStatusUpdateMessageType:*(unsigned int *)(*(void *)(a1 + 32) + 16)]);
    v7[0] = v3;
    id v4 = v2;
    v7[1] = v4;
    xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, v7, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v5);

    for (uint64_t i = 1; i != -1; --i)
  }
  else
  {
    NSLog(&cfstr_Statusupdateap.isa);
  }
}

void __47__WRM_iRATInterface_getStreamingInfo_linkType___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    unsigned int v3 = *(_DWORD *)(v1 + 16);
    if (v3 < 0x2A && ((0x3EEEFFFFFFFuLL >> v3) & 1) != 0)
    {
      id v4 = off_26422A4D8[v3];
    }
    else if (v3 == 42)
    {
      id v4 = "WRMSOS";
    }
    else
    {
      id v4 = "INVALID_PROC_ID!!!";
    }
    NSLog(&cfstr_ReceivedGetlin.isa, v4);
    if (*(void *)(a1 + 40) && (uint64_t v5 = MEMORY[0x2166AEE70]()) != 0)
    {
      id v13 = (id)v5;
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      if (v6)
      {
        xpc_object_t v7 = v6;
        xpc_dictionary_set_uint64(v6, "WRMGetStreamingMetrics_linkType", *(unsigned int *)(a1 + 48));
        *(_OWORD *)keys = xmmword_26422A488;
        values[0] = xpc_uint64_create(0x1A1uLL);
        id v8 = v7;
        values[1] = v8;
        xpc_object_t v9 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
        xpc_object_t v10 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 8);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __47__WRM_iRATInterface_getStreamingInfo_linkType___block_invoke_2;
        handler[3] = &unk_26422A288;
        id v11 = v13;
        id v15 = v11;
        xpc_connection_send_message_with_reply(v10, v9, 0, handler);

        for (uint64_t i = 1; i != -1; --i)
      }
      else
      {
      }
    }
    else
    {
      NSLog(&cfstr_ReceivedGetlin_0.isa);
    }
  }
  else
  {
    NSLog(&cfstr_Getstreamingin.isa);
  }
}

uint64_t __47__WRM_iRATInterface_getStreamingInfo_linkType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "MaxBW");
  xpc_dictionary_get_uint64(v3, "StallDetected");
  uint64_t v5 = xpc_dictionary_get_uint64(v3, "AvgRTT");
  BOOL v6 = xpc_dictionary_get_BOOL(v3, "isValid");

  NSLog(&cfstr_ReceivedStream.isa, uint64, v5, v6);
  xpc_object_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v7();
}

void __54__WRM_iRATInterface_getMLPredictedThroughput_options___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    unsigned int v3 = *(_DWORD *)(v1 + 16);
    if (v3 < 0x2A && ((0x3EEEFFFFFFFuLL >> v3) & 1) != 0)
    {
      id v4 = off_26422A4D8[v3];
    }
    else if (v3 == 42)
    {
      id v4 = "WRMSOS";
    }
    else
    {
      id v4 = "INVALID_PROC_ID!!!";
    }
    NSLog(&cfstr_ReceivedGetmlp.isa, v4);
    if (*(void *)(a1 + 48)
      && (NSLog(&cfstr_ReceivedMlpred.isa), (uint64_t v5 = MEMORY[0x2166AEE70](*(void *)(a1 + 48))) != 0))
    {
      id v16 = (id)v5;
      NSLog(&cfstr_ReceivedNotifi.isa);
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      if (v6)
      {
        xpc_object_t v7 = v6;
        NSLog(&cfstr_ReceivedArgsIs.isa);
        id v8 = *(void **)(a1 + 40);
        if (v8
          && ([v8 objectForKey:@"linkType"],
              xpc_object_t v9 = objc_claimAutoreleasedReturnValue(),
              v9,
              v9))
        {
          xpc_object_t v10 = [*(id *)(a1 + 40) objectForKey:@"linkType"];
          xpc_dictionary_set_int64(v7, "WRMMLPredictedThroughput_linkType", (int)[v10 intValue]);
        }
        else
        {
          xpc_dictionary_set_int64(v7, "WRMMLPredictedThroughput_linkType", -1);
        }
        *(_OWORD *)keys = xmmword_26422A488;
        values[0] = xpc_uint64_create(0x1A7uLL);
        id v11 = v7;
        values[1] = v11;
        xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
        id v13 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 8);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __54__WRM_iRATInterface_getMLPredictedThroughput_options___block_invoke_2;
        handler[3] = &unk_26422A288;
        id v14 = v16;
        id v18 = v14;
        xpc_connection_send_message_with_reply(v13, v12, 0, handler);

        for (uint64_t i = 1; i != -1; --i)
      }
      else
      {
      }
    }
    else
    {
      NSLog(&cfstr_ReceivedGetmlp_0.isa);
    }
  }
  else
  {
    NSLog(&cfstr_Getmlpredicted.isa);
  }
}

uint64_t __54__WRM_iRATInterface_getMLPredictedThroughput_options___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "WRMMLPredictedThroughput_CoreMedia");
  NSLog(&cfstr_Getmlpredicted_0.isa, uint64);
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void __50__WRM_iRATInterface_assertCommCenterBaseBandMode___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    unsigned int v3 = v2;
    if (v2)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 115) = 1;
      *(_DWORD *)(*(void *)(a1 + 32) + 120) = *(_DWORD *)(a1 + 40);
      xpc_dictionary_set_uint64(v2, "WRMTriggerCommCenterBasebandOperatingModeChange_AssertBasebandGPS", *(unsigned int *)(a1 + 40));
      *(_OWORD *)keys = xmmword_26422A488;
      v6[0] = xpc_uint64_create(0x19AuLL);
      v6[1] = v3;
      xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, v6, 2uLL);
      xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v4);

      for (uint64_t i = 1; i != -1; --i)
    }
  }
  else
  {
    NSLog(&cfstr_Assertcommcent.isa);
  }
}

void __54__WRM_iRATInterface_expediteCellularForReason_reason___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Expeditecellul.isa, *(unsigned __int8 *)(a1 + 48));
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__WRM_iRATInterface_expediteCellularForReason_reason___block_invoke_2;
  v4[3] = &unk_26422A418;
  unsigned int v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_expediteBBAssertionBGAppActive_sync:handler:", v2, v4);
}

uint64_t __54__WRM_iRATInterface_expediteCellularForReason_reason___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __41__WRM_iRATInterface_setTelephonyEnabled___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    unsigned int v3 = v2;
    if (v2)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 113) = 1;
      *(unsigned char *)(*(void *)(a1 + 32) + 114) = *(unsigned char *)(a1 + 40);
      xpc_dictionary_set_uint64(v2, "WRMTriggerCommCenterBasebandOperatingModeChange_AssertTelephony", *(unsigned __int8 *)(a1 + 40));
      *(_OWORD *)keys = xmmword_26422A488;
      v6[0] = xpc_uint64_create(0x19AuLL);
      v6[1] = v3;
      xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, v6, 2uLL);
      xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v4);

      for (uint64_t i = 1; i != -1; --i)
    }
  }
  else
  {
    NSLog(&cfstr_Settelephonyen.isa);
  }
}

void __47__WRM_iRATInterface_subscribeAppType_observer___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    xpc_object_t v2 = [MEMORY[0x263F08D40] valueWithBytes:a1 + 48 objCType:"{?=iiii}"];
    uint64_t v3 = MEMORY[0x2166AEE70](*(void *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    if (![*(id *)(*(void *)(a1 + 32) + 40) count]) {
      [*(id *)(a1 + 32) addAppType:v2];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
    xpc_object_t v6 = xpc_array_create(0, 0);
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kWRMApplicationType", *(unsigned int *)(a1 + 48));
    xpc_dictionary_set_uint64(v7, "kWRMSubscriptionType", *(unsigned int *)(a1 + 60));
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kWRMPolicyInfoHoAlgorithmType", *(unsigned int *)(a1 + 52));
    xpc_dictionary_set_uint64(v8, "kWRMPolicyInfoServiceType", *(unsigned int *)(a1 + 56));
    xpc_dictionary_set_value(v7, "kWRMPolicyInfo", v8);
    xpc_array_append_value(v6, v7);
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v9, "kWRMApplicationTypeList", v6);
    *(_OWORD *)keys = xmmword_26422A488;
    xpc_object_t v10 = xpc_uint64_create([*(id *)(a1 + 32) getSubscribeMessageType:*(unsigned int *)(*(void *)(a1 + 32) + 16)]);
    v14[0] = v10;
    id v11 = v9;
    v14[1] = v11;
    xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, v14, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v12);

    for (uint64_t i = 1; i != -1; --i)
  }
  else
  {
    NSLog(&cfstr_Subscribeappty.isa);
  }
}

void __56__WRM_iRATInterface_subscribeMultipleAppTypes_observer___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = MEMORY[0x2166AEE70](*(void *)(a1 + 48));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = v2;

    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(v5);
          }
          xpc_object_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          keys[0] = 0;
          keys[1] = 0;
          [v10 getValue:keys];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v7);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
    if (![*(id *)(*(void *)(a1 + 32) + 40) count]) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = *(id *)(*(void *)(a1 + 32) + 40);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          keys[0] = 0;
          keys[1] = 0;
          [v16 getValue:keys];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v13);
    }

    xpc_object_t v17 = xpc_array_create(0, 0);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = *(id *)(*(void *)(a1 + 32) + 40);
    uint64_t v18 = [obj countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(obj);
          }
          int64_t v22 = *(void **)(*((void *)&v31 + 1) + 8 * k);
          keys[0] = 0;
          keys[1] = 0;
          [v22 getValue:keys];
          xpc_object_t v23 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v23, "kWRMApplicationType", LODWORD(keys[0]));
          xpc_dictionary_set_uint64(v23, "kWRMSubscriptionType", HIDWORD(keys[1]));
          xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v24, "kWRMPolicyInfoHoAlgorithmType", HIDWORD(keys[0]));
          xpc_dictionary_set_uint64(v24, "kWRMPolicyInfoServiceType", LODWORD(keys[1]));
          xpc_dictionary_set_value(v23, "kWRMPolicyInfo", v24);
          xpc_array_append_value(v17, v23);
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v19);
    }

    xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v25, "kWRMApplicationTypeList", v17);
    *(_OWORD *)keys = xmmword_26422A488;
    xpc_object_t v26 = xpc_uint64_create([*(id *)(a1 + 32) getSubscribeMessageType:*(unsigned int *)(*(void *)(a1 + 32) + 16)]);
    values[0] = v26;
    id v27 = v25;
    values[1] = v27;
    xpc_object_t v28 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v28);

    for (uint64_t m = 1; m != -1; --m)
  }
  else
  {
    NSLog(&cfstr_Subscribemulti.isa);
  }
}

void __64__WRM_iRATInterface_statusUpdateAppType_linkType_serviceStatus___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    xpc_object_t v2 = xpc_array_create(0, 0);
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v3, "kWRMApplicationType", *(unsigned int *)(a1 + 40));
    xpc_dictionary_set_uint64(v3, "kWRMLinkType", *(unsigned int *)(a1 + 40));
    xpc_dictionary_set_uint64(v3, "kWRMServiceStatus", *(unsigned __int8 *)(a1 + 44));
    xpc_array_append_value(v2, v3);
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v4, "kWRMApplicationTypeList", v2);
    *(_OWORD *)keys = xmmword_26422A488;
    xpc_object_t v5 = xpc_uint64_create([*(id *)(a1 + 32) getStatusUpdateMessageType:*(unsigned int *)(*(void *)(a1 + 32) + 16)]);
    v9[0] = v5;
    id v6 = v4;
    v9[1] = v6;
    xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, v9, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v7);

    for (uint64_t i = 1; i != -1; --i)
  }
  else
  {
    NSLog(&cfstr_Statusupdateap_0.isa);
  }
}

void __66__WRM_iRATInterface__expediteBBAssertionBGAppActive_sync_handler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    if (*(unsigned __int8 *)(v1 + 136) == *(unsigned __int8 *)(a1 + 48))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      if (v3)
      {
        xpc_object_t v4 = *(void (**)(void))(v3 + 16);
        v4();
      }
    }
    else
    {
      xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
      id v6 = v5;
      if (v5)
      {
        xpc_dictionary_set_uint64(v5, "WRMProcessIdKey", *(unsigned int *)(*(void *)(a1 + 32) + 16));
        xpc_dictionary_set_BOOL(v6, "WRMBBAssertionBGAppActiveKey", *(unsigned char *)(a1 + 48));
        *(_OWORD *)keys = xmmword_26422A488;
        xpc_object_t v7 = xpc_uint64_create(0x19BuLL);
        values[0] = v7;
        values[1] = v6;
        xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
        uint64_t v9 = *(void *)(a1 + 40);
        if (v7 && v8)
        {
          xpc_object_t v10 = (void *)MEMORY[0x2166AEE70](v9);
          NSLog(&cfstr_Expeditebbasse_0.isa);
          uint64_t v11 = *(void *)(a1 + 32);
          uint64_t v12 = *(_xpc_connection_s **)(v11 + 8);
          uint64_t v13 = *(NSObject **)(v11 + 24);
          handler[0] = MEMORY[0x263EF8330];
          handler[1] = 3221225472;
          handler[2] = __66__WRM_iRATInterface__expediteBBAssertionBGAppActive_sync_handler___block_invoke_2;
          handler[3] = &unk_26422A4A0;
          char v19 = *(unsigned char *)(a1 + 48);
          void handler[4] = v11;
          id v18 = v10;
          id v14 = v10;
          xpc_connection_send_message_with_reply(v12, v8, v13, handler);
        }
        else if (v9)
        {
          (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
        }

        for (uint64_t i = 1; i != -1; --i)
      }
      else
      {
        uint64_t v15 = *(void *)(a1 + 40);
        if (v15) {
          (*(void (**)(uint64_t, void))(v15 + 16))(v15, 0);
        }
      }
    }
  }
  else
  {
    NSLog(&cfstr_Expeditebbasse.isa);
  }
}

void __66__WRM_iRATInterface__expediteBBAssertionBGAppActive_sync_handler___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict && MEMORY[0x2166AF130]() == MEMORY[0x263EF8708])
  {
    if (*(unsigned char *)(a1 + 48)) {
      *(unsigned char *)(*(void *)(a1 + 32) + 136) = xpc_dictionary_get_BOOL(xdict, "WRMBBAssertionBGAppActiveResultKey");
    }
    else {
      *(unsigned char *)(*(void *)(a1 + 32) + 136) = 0;
    }
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  }
}

void __60__WRM_iRATInterface_expediteBBAssertionBGAppActive_handler___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Expeditebbasse_1.isa, *(unsigned __int8 *)(a1 + 48));
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__WRM_iRATInterface_expediteBBAssertionBGAppActive_handler___block_invoke_2;
  v4[3] = &unk_26422A418;
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_expediteBBAssertionBGAppActive_sync:handler:", v2, v4);
}

uint64_t __60__WRM_iRATInterface_expediteBBAssertionBGAppActive_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __37__WRM_iRATInterface_unregisterClient__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 112) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 113) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 115) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 120) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 114) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 116) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 117) = 0;
  [*(id *)(*(void *)(a1 + 32) + 128) removeAllObjects];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 40);
  if (v5)
  {
    *(void *)(v4 + 40) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    xpc_object_t v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = 0;

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 56);
    if (v9)
    {
      *(void *)(v8 + 56) = 0;
    }
  }
}

void __41__WRM_UCMInterface_registerClient_queue___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  xpc_object_t v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleNotification:v8 :a4];
  }
}

void __41__WRM_UCMInterface_registerClient_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained && WeakRetained[2])
  {
    uint64_t v5 = MEMORY[0x2166AF130](v8);
    if (v5 == MEMORY[0x263EF8708])
    {
      xpc_object_t v7 = *(void (**)(void))(v4[2] + 16);
LABEL_9:
      v7();
      goto LABEL_10;
    }
    if (v5 != MEMORY[0x263EF8720])
    {
      uint64_t v6 = (void *)MEMORY[0x2166AF060](v8);
      free(v6);
      goto LABEL_10;
    }
    NSLog(&cfstr_XpcErrorDetect.isa);
    if (v8 == (id)MEMORY[0x263EF86A0])
    {
      NSLog(&cfstr_ConnectionInte.isa);
      xpc_object_t v7 = *(void (**)(void))(v4[2] + 16);
      goto LABEL_9;
    }
  }
LABEL_10:
}

void __58__WRM_UCMInterface_subscribeBtConnectedLinksNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  *(_OWORD *)keys = xmmword_26422A728;
  xpc_object_t v6 = xpc_uint64_create(0x8FCuLL);
  v10[0] = v6;
  id v7 = v5;
  v10[1] = v7;
  xpc_object_t v8 = xpc_dictionary_create((const char *const *)keys, v10, 2uLL);
  xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 56), v8);
  NSLog(&cfstr_XpcMessageSent_0.isa, v10[0]);

  for (uint64_t i = 1; i != -1; --i)
}

void __56__WRM_UCMInterface_processBTConnectedLinksNotification___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_ReceivedBtConn.isa, *(void *)(a1 + 32));
  unsigned __int8 int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumA2DP");
  unsigned __int8 v3 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumSCO");
  unsigned __int8 v4 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumESCO");
  unsigned __int8 v5 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumHID");
  unsigned __int8 v6 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumLE");
  unsigned __int8 v7 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumLEA");
  if (*(void *)(*(void *)(a1 + 40) + 8))
  {
    unsigned __int8 v8 = v7;
    id v9 = objc_alloc(NSDictionary);
    xpc_object_t v10 = [NSNumber numberWithUnsignedChar:int64];
    uint64_t v11 = [NSNumber numberWithUnsignedChar:v3];
    uint64_t v12 = [NSNumber numberWithUnsignedChar:v4];
    uint64_t v13 = [NSNumber numberWithUnsignedChar:v5];
    id v14 = [NSNumber numberWithUnsignedChar:v6];
    uint64_t v15 = [NSNumber numberWithUnsignedChar:v8];
    uint64_t v16 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, @"kWCMBTNumA2DP", v11, @"kWCMBTNumSCO", v12, @"kWCMBTNumESCO", v13, @"kWCMBTNumHID", v14, @"kWCMBTNumLE", v15, @"kWCMBTNumLEA", 0);

    NSLog(&cfstr_SendingBtConne.isa);
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 8) + 16))();
  }
  else
  {
    NSLog(&cfstr_DiscardBtConne.isa);
  }
}

void __31__WRM_UCMInterface_sendBtLoad___block_invoke(uint64_t a1)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "kWRMHomeKitBtLoad");
  unsigned int v3 = uint64;
  NSLog(&cfstr_Getwirelessrad.isa, uint64);
  unsigned __int8 v4 = *(void (**)(void))(*(void *)(a1 + 40) + 24);
  if (v4)
  {
    v4(v3);
  }
}

void __34__WRM_UCMInterface_getInstantLoad__block_invoke(int8x16_t *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1[3].i64[0] + 8) + 40))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    if (v2)
    {
      *(_OWORD *)keys = xmmword_26422A728;
      xpc_object_t v3 = xpc_uint64_create(0xAF2uLL);
      values[0] = v3;
      values[1] = 0;
      xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
      unsigned __int8 v5 = *(_xpc_connection_s **)(*(void *)(a1[3].i64[0] + 8) + 40);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __34__WRM_UCMInterface_getInstantLoad__block_invoke_2;
      handler[3] = &unk_26422A668;
      uint64_t v12 = a1[3].i64[1];
      int8x16_t v9 = a1[2];
      id v6 = (id)v9.i64[0];
      int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
      xpc_connection_send_message_with_reply(v5, v4, 0, handler);

      for (uint64_t i = 1; i != -1; --i)
    }
  }
  else
  {
    NSLog(&cfstr_InvalidXpcConn.isa);
    unsigned __int8 v8 = a1[2].i64[0];
    dispatch_semaphore_signal(v8);
  }
}

void __34__WRM_UCMInterface_getInstantLoad__block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkConnection:"))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kWRMHomeKitBtLoad");
    NSLog(&cfstr_Getwirelessrad_0.isa, *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __29__WRM_UCMInterface_stopTimer__block_invoke(int8x16_t *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  NSLog(&cfstr_Getwirelessrad_1.isa);
  if (*(void *)(*(void *)(a1[3].i64[0] + 8) + 40))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    if (v2)
    {
      *(_OWORD *)keys = xmmword_26422A728;
      xpc_object_t v3 = xpc_uint64_create(0xAF4uLL);
      xpc_dictionary_set_BOOL(v2, "kWRMHomeKitEnable", 0);
      id v4 = v3;
      values[0] = v4;
      values[1] = v2;
      xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
      id v6 = *(_xpc_connection_s **)(*(void *)(a1[3].i64[0] + 8) + 40);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __29__WRM_UCMInterface_stopTimer__block_invoke_2;
      handler[3] = &unk_26422A668;
      uint64_t v13 = a1[3].i64[1];
      int8x16_t v10 = a1[2];
      id v7 = (id)v10.i64[0];
      int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
      xpc_connection_send_message_with_reply(v6, v5, 0, handler);

      for (uint64_t i = 1; i != -1; --i)
    }
  }
  else
  {
    NSLog(&cfstr_InvalidXpcConn.isa);
    int8x16_t v9 = a1[2].i64[0];
    dispatch_semaphore_signal(v9);
  }
}

void __29__WRM_UCMInterface_stopTimer__block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkConnection:"))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kWRMHomeKitBtLoad");
    NSLog(&cfstr_Getwirelessrad_2.isa, *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __31__WRM_UCMInterface_startTimer___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  NSLog(&cfstr_Getwirelessrad_3.isa);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    if (v2)
    {
      NSLog(&cfstr_ReceivedArgsIs.isa);
      *(_OWORD *)keys = xmmword_26422A728;
      xpc_object_t v3 = xpc_uint64_create(0xAF4uLL);
      xpc_dictionary_set_double(v2, "kWRMHomeKitDuration", *(double *)(a1 + 64));
      xpc_dictionary_set_BOOL(v2, "kWRMHomeKitEnable", 1);
      id v4 = v3;
      values[0] = v4;
      values[1] = v2;
      xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
      id v6 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __31__WRM_UCMInterface_startTimer___block_invoke_2;
      handler[3] = &unk_26422A668;
      uint64_t v13 = *(void *)(a1 + 56);
      int8x16_t v10 = *(int8x16_t *)(a1 + 32);
      id v7 = (id)v10.i64[0];
      int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
      xpc_connection_send_message_with_reply(v6, v5, 0, handler);

      for (uint64_t i = 1; i != -1; --i)
    }
  }
  else
  {
    NSLog(&cfstr_InvalidXpcConn.isa);
    int8x16_t v9 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v9);
  }
}

void __31__WRM_UCMInterface_startTimer___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkConnection:"))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kWRMHomeKitBtLoad");
    NSLog(&cfstr_Getwirelessrad_2.isa, *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __48__WRM_UCMInterface_sendNRFrequencyUpdateForMic___block_invoke(uint64_t a1)
{
  xpc_object_t v9[2] = *MEMORY[0x263EF8340];
  BOOL v2 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "kWRMNR41FreuquencyUpdate");
  BOOL v3 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "kWRMNR7xFreuquencyUpdate");
  NSLog(&cfstr_Sendnr41update.isa, v2, v3);
  id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 32);
  if (v4)
  {
    v8[0] = @"NRBand41Enabled";
    xpc_object_t v5 = [NSNumber numberWithBool:v2];
    v8[1] = @"NRBand7xEnabled";
    v9[0] = v5;
    id v6 = [NSNumber numberWithBool:v3];
    v9[1] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    v4();
  }
}

void __58__WRM_UCMInterface_getWirelessFrequencyBandUpdatesForMIC___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    if (v2)
    {
      NSLog(&cfstr_ReceivedArgsIs.isa);
      *(_OWORD *)keys = xmmword_26422A728;
      xpc_object_t v3 = xpc_uint64_create(0xAF5uLL);
      values[0] = v3;
      values[1] = v2;
      xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
      xpc_object_t v5 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __58__WRM_UCMInterface_getWirelessFrequencyBandUpdatesForMIC___block_invoke_2;
      handler[3] = &unk_26422A6E0;
      long long v12 = *(_OWORD *)(a1 + 56);
      int8x16_t v9 = *(int8x16_t *)(a1 + 32);
      id v6 = (id)v9.i64[0];
      int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
      xpc_connection_send_message_with_reply(v5, v4, 0, handler);

      for (uint64_t i = 1; i != -1; --i)
    }
  }
  else
  {
    NSLog(&cfstr_InvalidXpcConn.isa);
    unsigned __int8 v8 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v8);
  }
}

void __58__WRM_UCMInterface_getWirelessFrequencyBandUpdatesForMIC___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkConnection:"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "kWRMNR41FreuquencyUpdate");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "kWRMNR7xFreuquencyUpdate");
    NSLog(&cfstr_Getwirelessfre.isa, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __42__WRM_UCMInterface_sendULFrequencyUpdate___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Sendulfrequenc.isa);
  id v12 = [MEMORY[0x263EFF9A0] dictionary];
  xpc_object_t v2 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMULFrequencyUpdate");
  xpc_object_t v3 = v2;
  if (v2)
  {
    int64_t int64 = xpc_dictionary_get_int64(v2, "kWRMULBandInfoType");
    double v5 = xpc_dictionary_get_double(v3, "kWRMULCenterFrequency");
    double v6 = xpc_dictionary_get_double(v3, "kWRMULBandwidth");
    id v7 = [NSNumber numberWithUnsignedLongLong:int64];
    [v12 setObject:v7 forKeyedSubscript:@"BandInfoType"];

    unsigned __int8 v8 = [NSNumber numberWithDouble:v5];
    [v12 setObject:v8 forKeyedSubscript:@"ULCenterFrequency"];

    int8x16_t v9 = [NSNumber numberWithDouble:v6];
    [v12 setObject:v9 forKeyedSubscript:@"ULBandwidth"];

    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 40);
    if (v10)
    {
      int8x16_t v11 = (void *)[v12 copy];
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
  }
}

void __54__WRM_UCMInterface_getWirelessULFrequencyBandUpdates___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    if (v2)
    {
      NSLog(&cfstr_ReceivedArgsIs.isa);
      *(_OWORD *)keys = xmmword_26422A728;
      xpc_object_t v3 = xpc_uint64_create(0xAF7uLL);
      v6[0] = v3;
      v6[1] = v2;
      xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, v6, 2uLL);
      xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v4);

      for (uint64_t i = 1; i != -1; --i)
    }
  }
  else
  {
    NSLog(&cfstr_InvalidXpcConn.isa);
  }
}

@end