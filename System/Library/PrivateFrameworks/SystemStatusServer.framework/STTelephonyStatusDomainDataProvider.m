@interface STTelephonyStatusDomainDataProvider
- (BOOL)_shouldShowEmergencyOnlyStatusForStateProvider:(void *)a1 registrationStatus:(uint64_t)a2 bootstrap:(int)a3 hidden:(char)a4 carrierBundleInfo:(void *)a5;
- (BOOL)_simStatusMeansLocked:(void *)a1;
- (STTelephonyStatusDomainDataProvider)init;
- (STTelephonyStatusDomainDataProvider)initWithServerHandle:(id)a3;
- (STTelephonyStatusDomainDataProvider)initWithServerHandle:(id)a3 stateProvider:(id)a4;
- (STTelephonyStatusDomainDataProvider)initWithStateProvider:(id)a3;
- (id)_SIMInfoForStateProvider:(void *)a3 subscriptionInfo:(void *)a4 carrierBundleInfo:(uint64_t)a5 slot:(void *)a6 otherSlotSubscriptionInfo:;
- (uint64_t)_serviceStateForStateProvider:(void *)a1 registrationStatus:(uint64_t)a2 bootstrap:(int)a3 hidden:(char)a4 carrierBundleInfo:(void *)a5;
- (void)_updateDataForSlot:(uint64_t)a1;
- (void)carrierBundleInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4;
- (void)dealloc;
- (void)invalidate;
- (void)mobileEquipmentInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4;
- (void)stewieStateDidChangeForStateProvider:(id)a3 usingStewieForSOS:(BOOL)a4 isInactiveSOSEnabled:(BOOL)a5 usingStewieConnection:(BOOL)a6;
- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4;
@end

@implementation STTelephonyStatusDomainDataProvider

- (BOOL)_simStatusMeansLocked:(void *)a1
{
  id v1 = a1;
  if ([v1 compare:*MEMORY[0x1E4F241F8]]) {
    BOOL v2 = [v1 compare:*MEMORY[0x1E4F24200]] == 0;
  }
  else {
    BOOL v2 = 1;
  }

  return v2;
}

- (id)_SIMInfoForStateProvider:(void *)a3 subscriptionInfo:(void *)a4 carrierBundleInfo:(uint64_t)a5 slot:(void *)a6 otherSlotSubscriptionInfo:
{
  id v10 = a3;
  id v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E4FA9420];
  id v13 = a4;
  id v14 = a2;
  id v15 = objc_alloc_init(v12);
  if (v10 && [v10 isHiddenSIM]) {
    int v16 = [v10 isBootstrap] ^ 1;
  }
  else {
    int v16 = 0;
  }
  int v17 = v16 ^ 1;
  objc_msgSend(v15, "setSIMPresent:", objc_msgSend(v14, "isSIMPresentForSlot:", a5) & (v16 ^ 1));
  objc_msgSend(v15, "setBootstrap:", objc_msgSend(v10, "isBootstrap"));
  v18 = [v10 SIMLabel];
  [v15 setLabel:v18];

  v19 = [v10 shortSIMLabel];
  [v15 setShortLabel:v19];

  objc_msgSend(v15, "setSignalStrengthBars:", objc_msgSend(v10, "signalStrengthBars"));
  objc_msgSend(v15, "setMaxSignalStrengthBars:", objc_msgSend(v10, "maxSignalStrengthBars"));
  LODWORD(v19) = [v10 isBootstrap];
  objc_msgSend(v15, "setServiceState:", -[STTelephonyStatusDomainDataProvider _serviceStateForStateProvider:registrationStatus:bootstrap:hidden:carrierBundleInfo:](v14, objc_msgSend(v10, "registrationStatus"), (int)v19, v16, v13));
  objc_msgSend(v15, "setCellularServiceState:", -[STTelephonyStatusDomainDataProvider _serviceStateForStateProvider:registrationStatus:bootstrap:hidden:carrierBundleInfo:](v14, objc_msgSend(v10, "cellularRegistrationStatus"), (int)v19, v16, v13));
  id v20 = v14;
  id v21 = v10;
  id v22 = v13;
  if (![v20 isUsingStewieForSOS]
    || ![v20 isUsingStewieConnection])
  {
    if ([v20 isRadioModuleDead]) {
      unint64_t v25 = 3;
    }
    else {
      unint64_t v25 = [v21 registrationStatus];
    }
    int v26 = [v21 isBootstrap];
    if (v10 && [v21 isHiddenSIM]) {
      char v27 = [v21 isBootstrap] ^ 1;
    }
    else {
      char v27 = 0;
    }
    BOOL v28 = -[STTelephonyStatusDomainDataProvider _shouldShowEmergencyOnlyStatusForStateProvider:registrationStatus:bootstrap:hidden:carrierBundleInfo:](v20, v25, v26, v27, v22);
    if (!v28 && v25 == 2)
    {
      id v24 = [v21 operatorName];
      goto LABEL_18;
    }
    id v30 = [v21 SIMStatus];
    v31 = v30;
    int v50 = v17;
    if (!v30) {
      goto LABEL_20;
    }
    if ([v30 compare:*MEMORY[0x1E4F241F0]])
    {
      if ([v31 compare:*MEMORY[0x1E4F241E8]] && objc_msgSend(v31, "compare:", *MEMORY[0x1E4F24208]))
      {
        if (!-[STTelephonyStatusDomainDataProvider _simStatusMeansLocked:](v31))
        {
LABEL_20:
          v32 = 0;
          goto LABEL_29;
        }
        v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v34 = v33;
        v35 = @"LOCKED_SIM";
      }
      else
      {
        v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v34 = v33;
        v35 = @"BAD_SIM";
      }
    }
    else
    {
      v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v34 = v33;
      v35 = @"NO_SIM";
    }
    v32 = [v33 localizedStringForKey:v35 value:&stru_1F300FB98 table:@"SystemStatusServer-Telephony"];

LABEL_29:
    if (v25 - 3 > 1)
    {
      if (v25 > 1)
      {
        v39 = 0;
        if (v28)
        {
LABEL_34:
          v40 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v41 = [v40 localizedStringForKey:@"SOS_ONLY" value:&stru_1F300FB98 table:@"SystemStatusServer-Telephony"];

          if (v32)
          {
            [v20 needsUserIdentificationModule];
            v42 = v32;
            v43 = v32;
          }
          else
          {
            v42 = 0;
            v43 = 0;
          }
LABEL_45:
          id v44 = v42;
          id v29 = v43;
          id v24 = v41;

          int v17 = v50;
          goto LABEL_46;
        }
LABEL_37:
        if (-[STTelephonyStatusDomainDataProvider _simStatusMeansLocked:](v31)
          || [v20 needsUserIdentificationModule])
        {
          v43 = 0;
          if (v32) {
            v42 = v32;
          }
          else {
            v42 = v39;
          }
          v41 = v42;
        }
        else
        {
          v43 = 0;
          v42 = v39;
          v41 = v39;
        }
        goto LABEL_45;
      }
      v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v37 = v36;
      v38 = @"SEARCHING";
    }
    else
    {
      v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v37 = v36;
      v38 = @"NO_SERVICE";
    }
    v39 = [v36 localizedStringForKey:v38 value:&stru_1F300FB98 table:@"SystemStatusServer-Telephony"];

    if (v28) {
      goto LABEL_34;
    }
    goto LABEL_37;
  }
  v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v24 = [v23 localizedStringForKey:@"SATELLITE" value:&stru_1F300FB98 table:@"SystemStatusServer-Telephony"];

LABEL_18:
  id v29 = 0;
LABEL_46:

  id v45 = v29;
  [v15 setServiceDescription:v24];
  [v15 setSecondaryServiceDescription:v45];

  uint64_t v46 = [v21 dataConnectionType];
  if (v11
    && [v11 isHiddenSIM]
    && ([v11 isBootstrap] & 1) == 0
    && [v11 isProvidingDataConnection])
  {
    uint64_t v46 = [v11 dataConnectionType];
    int v47 = 1;
  }
  else
  {
    int v47 = 0;
  }
  if ((unint64_t)(v46 - 1) >= 0x10) {
    uint64_t v48 = 0;
  }
  else {
    uint64_t v48 = v46;
  }
  [v15 setDataNetworkType:v48];
  objc_msgSend(v15, "setProvidingDataConnection:", (v47 | objc_msgSend(v21, "isProvidingDataConnection")) & v17);
  objc_msgSend(v15, "setPreferredForDataConnections:", objc_msgSend(v21, "isPreferredForDataConnections"));
  objc_msgSend(v15, "setRegisteredWithoutCellular:", objc_msgSend(v21, "isRegisteredWithoutCellular"));
  objc_msgSend(v15, "setCallForwardingEnabled:", objc_msgSend(v21, "callForwardingIndicator") == 1);

  return v15;
}

- (uint64_t)_serviceStateForStateProvider:(void *)a1 registrationStatus:(uint64_t)a2 bootstrap:(int)a3 hidden:(char)a4 carrierBundleInfo:(void *)a5
{
  BOOL v9 = a2 == 2;
  id v10 = a1;
  id v11 = a5;
  BOOL v12 = -[STTelephonyStatusDomainDataProvider _shouldShowEmergencyOnlyStatusForStateProvider:registrationStatus:bootstrap:hidden:carrierBundleInfo:](v10, a2, a3, a4, v11);
  uint64_t v13 = 2 * v9;
  if (a2 == 1) {
    uint64_t v13 = 1;
  }
  if (v12) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = v13;
  }

  return v14;
}

- (BOOL)_shouldShowEmergencyOnlyStatusForStateProvider:(void *)a1 registrationStatus:(uint64_t)a2 bootstrap:(int)a3 hidden:(char)a4 carrierBundleInfo:(void *)a5
{
  id v9 = a1;
  id v10 = a5;
  BOOL v12 = 0;
  if ((a4 & 1) == 0 && [v9 hasCellularTelephony])
  {
    int v11 = a2 == 2 ? a3 : 0;
    if ((a2 == 4 || v11) && ![v10 suppressSOSOnlyWithLimitedService]) {
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (void)_updateDataForSlot:(uint64_t)a1
{
  if (a1)
  {
    id v4 = *(id *)(a1 + 8);
    v5 = [v4 subscriptionInfoForSlot:1];
    v6 = [v4 subscriptionInfoForSlot:2];
    v7 = v6;
    unint64_t v25 = v6;
    int v26 = v5;
    if (a2 == 2)
    {
      if (!v6
        || ![v6 isHiddenSIM]
        || ([v7 isBootstrap] & 1) != 0
        || ![v7 isProvidingDataConnection])
      {
        id v10 = 0;
        objc_msgSend(v4, "carrierBundleInfoForSlot:", 2, 0);
        goto LABEL_21;
      }
    }
    else
    {
      if (a2 != 1)
      {
        uint64_t v8 = 0;
        if (a2 > 1)
        {
          uint64_t v23 = 0;
          id v10 = 0;
          goto LABEL_18;
        }
LABEL_15:
        id v9 = objc_msgSend(v4, "carrierBundleInfoForSlot:", 1, 1, v25, v5);
        id v10 = -[STTelephonyStatusDomainDataProvider _SIMInfoForStateProvider:subscriptionInfo:carrierBundleInfo:slot:otherSlotSubscriptionInfo:](a1, v4, v5, v9, 1, v7);

        a2 = v8;
LABEL_18:
        if ((a2 & 0xFFFFFFFFFFFFFFFDLL) != 0)
        {
          char v11 = 0;
          BOOL v12 = 0;
LABEL_22:
          char v14 = objc_msgSend(v4, "isCellularRadioCapabilityActive", v23);
          char v15 = [v4 isDualSIMEnabled];
          char v16 = [v4 isRadioModuleDead];
          char v17 = [v4 isUsingStewieForSOS];
          char v18 = [v4 isInactiveSOSEnabled];
          char v19 = [v4 isUsingStewieConnection];
          id v20 = *(void **)(a1 + 16);
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __58__STTelephonyStatusDomainDataProvider__updateDataForSlot___block_invoke;
          v27[3] = &unk_1E6AD1F08;
          char v30 = v24;
          char v31 = v11;
          id v28 = v10;
          id v29 = v12;
          char v32 = v14;
          char v33 = v15;
          char v34 = v16;
          char v35 = v17;
          char v36 = v18;
          char v37 = v19;
          id v21 = v12;
          id v22 = v10;
          [v20 updateDataWithBlock:v27];

          return;
        }
        objc_msgSend(v4, "carrierBundleInfoForSlot:", 2, v23);
        uint64_t v13 = LABEL_21:;
        BOOL v12 = -[STTelephonyStatusDomainDataProvider _SIMInfoForStateProvider:subscriptionInfo:carrierBundleInfo:slot:otherSlotSubscriptionInfo:](a1, v4, v7, v13, 2, v5);

        char v11 = 1;
        goto LABEL_22;
      }
      if (!v5
        || ![v5 isHiddenSIM]
        || ([v5 isBootstrap] & 1) != 0
        || ([v5 isProvidingDataConnection] & 1) == 0)
      {
        uint64_t v8 = 1;
        goto LABEL_15;
      }
    }
    uint64_t v8 = 0;
    goto LABEL_15;
  }
}

void __58__STTelephonyStatusDomainDataProvider__updateDataForSlot___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    [v3 setSIMOneInfo:*(void *)(a1 + 32)];
    id v3 = v4;
  }
  if (*(unsigned char *)(a1 + 49))
  {
    [v4 setSIMTwoInfo:*(void *)(a1 + 40)];
    id v3 = v4;
  }
  [v3 setCellularRadioCapabilityEnabled:*(unsigned __int8 *)(a1 + 50)];
  [v4 setDualSIMEnabled:*(unsigned __int8 *)(a1 + 51)];
  [v4 setRadioModuleDead:*(unsigned __int8 *)(a1 + 52)];
  [v4 setUsingStewieForSOS:*(unsigned __int8 *)(a1 + 53)];
  [v4 setInactiveSOSEnabled:*(unsigned __int8 *)(a1 + 54)];
  [v4 setUsingStewieConnection:*(unsigned __int8 *)(a1 + 55)];
}

- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
}

- (STTelephonyStatusDomainDataProvider)init
{
  id v3 = STDefaultStatusDomainPublisherServerHandle();
  id v4 = [(STTelephonyStatusDomainDataProvider *)self initWithServerHandle:v3];

  return v4;
}

- (STTelephonyStatusDomainDataProvider)initWithServerHandle:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(STTelephonyStateProvider);
  v6 = [(STTelephonyStatusDomainDataProvider *)self initWithServerHandle:v4 stateProvider:v5];

  return v6;
}

- (STTelephonyStatusDomainDataProvider)initWithStateProvider:(id)a3
{
  id v4 = a3;
  v5 = STDefaultStatusDomainPublisherServerHandle();
  v6 = [(STTelephonyStatusDomainDataProvider *)self initWithServerHandle:v5 stateProvider:v4];

  return v6;
}

- (STTelephonyStatusDomainDataProvider)initWithServerHandle:(id)a3 stateProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STTelephonyStatusDomainDataProvider;
  uint64_t v8 = [(STTelephonyStatusDomainDataProvider *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_telephonyStateProvider, a4);
    [v7 addObserver:v9];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FA9560]) initWithServerHandle:v6];
    telephonyDomainPublisher = v9->_telephonyDomainPublisher;
    v9->_telephonyDomainPublisher = (STTelephonyStatusDomainPublisher *)v10;

    -[STTelephonyStatusDomainDataProvider _updateDataForSlot:]((uint64_t)v9, 0);
  }

  return v9;
}

- (void)dealloc
{
  BOOL v2 = self;
  if (self) {
    self = (STTelephonyStatusDomainDataProvider *)self->_telephonyDomainPublisher;
  }
  [(STTelephonyStatusDomainDataProvider *)self invalidate];
  [(STTelephonyStatusDomainDataProvider *)v2 invalidate];
  v3.receiver = v2;
  v3.super_class = (Class)STTelephonyStatusDomainDataProvider;
  [(STTelephonyStatusDomainDataProvider *)&v3 dealloc];
}

- (void)invalidate
{
  BOOL v2 = self;
  if (self) {
    self = (STTelephonyStatusDomainDataProvider *)self->_telephonyStateProvider;
  }
  [(STTelephonyStatusDomainDataProvider *)self removeObserver:v2];
}

- (void)carrierBundleInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
}

- (void)mobileEquipmentInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
}

- (void)stewieStateDidChangeForStateProvider:(id)a3 usingStewieForSOS:(BOOL)a4 isInactiveSOSEnabled:(BOOL)a5 usingStewieConnection:(BOOL)a6
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyDomainPublisher, 0);
  objc_storeStrong((id *)&self->_telephonyStateProvider, 0);
}

@end