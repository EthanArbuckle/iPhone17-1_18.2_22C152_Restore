@interface STTelephonyStateProvider
- (BOOL)hasCellularTelephony;
- (BOOL)isCellularRadioCapabilityActive;
- (BOOL)isDualSIMEnabled;
- (BOOL)isInactiveSOSEnabled;
- (BOOL)isRadioModuleDead;
- (BOOL)isSIMPresentForSlot:(int64_t)a3;
- (BOOL)isUsingStewieConnection;
- (BOOL)isUsingStewieForSOS;
- (BOOL)needsUserIdentificationModule;
- (NSString)debugDescription;
- (NSString)description;
- (STTelephonyStateProvider)init;
- (STTelephonySubscriptionContext)_newSubscriptionContext;
- (char)_internalQueue_subscriptionContextForSlot:(char *)a1;
- (char)_subscriptionContextForCTContext:(char *)a1;
- (id)carrierBundleInfoForSlot:(int64_t)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mobileEquipmentInfoForSlot:(int64_t)a3;
- (id)subscriptionInfoForSlot:(int64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)_backgroundQueryQueue_shouldSuppressSOSOnlyWithLimitedServiceForCTContext:(void *)a1;
- (uint64_t)_internalQueue_isCellularRadioCapabilityActive;
- (uint64_t)_internalQueue_needsUserIdentificationModule;
- (uint64_t)_purgeSlot1SubscriptionState;
- (uint64_t)_purgeSlot2SubscriptionState;
- (uint64_t)_serverConnection;
- (uint64_t)_subscriptionSlotForContext:(uint64_t)a1;
- (void)_cancelFakeCellularRegistrationForContext:(void *)a1;
- (void)_cancelFakeRegistrationForContext:(void *)a1;
- (void)_cancelFakeServiceAndRegistrationForContext:(uint64_t)a1;
- (void)_cancelFakeServiceForContext:(void *)a1;
- (void)_handleNetworkReselectionNeeded:(void *)a3 forCTContext:;
- (void)_hasCTContextForSlot:(void *)result;
- (void)_internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:(uint64_t)a1;
- (void)_logSubscriptionEvent:(uint64_t)a1;
- (void)_logSubscriptionEvent:(void *)a3 forCTContext:;
- (void)_logSubscriptionEvent:(void *)a3 forContext:;
- (void)_queryCallForwardingStateForCTContext:(uint64_t)a1;
- (void)_reallySetOperatorName:(void *)a3 inSubscriptionContext:;
- (void)_serverConnectionDidError:(uint64_t)a1;
- (void)_setCallForwardingIndicator:(void *)a3 inSubscriptionContext:;
- (void)_setCellRegistrationStatus:(void *)a3 inSubscriptionContext:;
- (void)_setOperatorName:(void *)a3 inSubscriptionContext:;
- (void)_setRegistrationStatus:(void *)a3 inSubscriptionContext:;
- (void)_setSIMStatus:(void *)a3 inSubscriptionContext:;
- (void)_setSuppressesCellIndicators:(uint64_t)a1;
- (void)_stopFakeServiceForContext:(uint64_t)a1;
- (void)_updateCallForwardingIndicatorForContext:(void *)a1;
- (void)_updateDataConnectedSubscriptionContextForCTContext:(uint64_t)a1;
- (void)_updateDataConnectionType;
- (void)_updateDataConnectionTypeForContext:(uint64_t)a1;
- (void)_updateDualSIMCapabilitySendingNotification:(uint64_t)a1;
- (void)_updateLastKnownNetworkCountryCodeInContext:(void *)a3 withCTContext:;
- (void)_updateNetworkCountryCode:(void *)a3 inContext:(void *)a4 withCTContext:;
- (void)_updateRegistrationNowInSubscriptionContext:(void *)a1;
- (void)_updateState;
- (void)addObserver:(id)a3;
- (void)airplaneModeChanged;
- (void)carrierBundleChange:(id)a3;
- (void)cellChanged:(id)a3 cell:(id)a4;
- (void)currentDataSimChanged:(id)a3;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)dealloc;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)dualSimCapabilityDidChange;
- (void)invalidate;
- (void)networkReselectionNeeded:(id)a3;
- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5;
- (void)operatorBundleChange:(id)a3;
- (void)operatorNameChanged:(id)a3 name:(id)a4;
- (void)rejectCauseCodeChanged:(id)a3 causeCode:(id)a4;
- (void)removeObserver:(id)a3;
- (void)servingNetworkChanged:(id)a3;
- (void)setCachedRadioModuleDead:(uint64_t)a1;
- (void)setStewieState:(uint64_t)a1;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)stateChanged:(id)a3;
- (void)subscriptionInfoDidChange;
- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6;
@end

@implementation STTelephonyStateProvider

void __52__STTelephonyStateProvider_subscriptionInfoForSlot___block_invoke(uint64_t a1)
{
  -[STTelephonyStateProvider _internalQueue_subscriptionContextForSlot:](*(char **)(a1 + 32), *(void *)(a1 + 48));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v6 subscriptionInfo];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (char)_internalQueue_subscriptionContextForSlot:(char *)a1
{
  if (!a1)
  {
LABEL_7:
    return a1;
  }
  if (a2 == 1)
  {
    uint64_t v3 = 64;
    goto LABEL_6;
  }
  if (a2 == 2)
  {
    uint64_t v3 = 72;
LABEL_6:
    a1 = (char *)*(id *)&a1[v3];
    goto LABEL_7;
  }
  a1 = 0;
  return a1;
}

- (BOOL)hasCellularTelephony
{
  return self->_hasCellularTelephony;
}

void *__48__STTelephonyStateProvider_isSIMPresentForSlot___block_invoke(uint64_t a1)
{
  result = -[STTelephonyStateProvider _hasCTContextForSlot:](*(void **)(a1 + 32), *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

- (void)_hasCTContextForSlot:(void *)result
{
  if (result)
  {
    result = (void *)result[10];
    if (result)
    {
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __STTelephonyArrayContainsCTContextForSlot_block_invoke;
      v2[3] = &__block_descriptor_40_e48_B32__0__CTXPCServiceSubscriptionContext_8Q16_B24l;
      v2[4] = a2;
      return (void *)([result indexOfObjectPassingTest:v2] != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  return result;
}

- (char)_subscriptionContextForCTContext:(char *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 slotID];
    if (v5 == 1)
    {
      uint64_t v6 = 64;
      goto LABEL_6;
    }
    if (v5 == 2)
    {
      uint64_t v6 = 72;
LABEL_6:
      a1 = (char *)*(id *)&a1[v6];
      goto LABEL_8;
    }
    a1 = 0;
  }
LABEL_8:

  return a1;
}

uint64_t __45__STTelephonyStateProvider_isRadioModuleDead__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    LOBYTE(v1) = *(unsigned char *)(v1 + 18) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1;
  return result;
}

void __47__STTelephonyStateProvider_isUsingStewieForSOS__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[17];
  }
  id v3 = v2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 displayStewieInStatusBar];
}

- (BOOL)isSIMPresentForSlot:(int64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__STTelephonyStateProvider_isSIMPresentForSlot___block_invoke;
  block[3] = &unk_1E6AD20C0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)subscriptionInfoForSlot:(int64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__STTelephonyStateProvider_subscriptionInfoForSlot___block_invoke;
  block[3] = &unk_1E6AD20C0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __90__STTelephonyStateProvider__internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "subscriptionInfoDidChangeForStateProvider:slot:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __86__STTelephonyStateProvider__updateLastKnownNetworkCountryCodeInContext_withCTContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && !v6 && (TUISOCountryCodeForMCC(), (long long v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v9 = v8;
    -[STTelephonyStateProvider _updateNetworkCountryCode:inContext:withCTContext:](*(void *)(a1 + 32), v8, *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    long long v10 = STSystemStatusLogTelephonyState();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D8320000, v10, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider: falling back to copyLastKnownMobileCountryCode", buf, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      id v12 = *(void **)(v11 + 56);
    }
    else {
      id v12 = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86__STTelephonyStateProvider__updateLastKnownNetworkCountryCodeInContext_withCTContext___block_invoke_48;
    v14[3] = &unk_1E6AD2518;
    v14[4] = v11;
    uint64_t v13 = *(void *)(a1 + 48);
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    [v12 copyLastKnownMobileCountryCode:v13 completion:v14];
  }
}

void __78__STTelephonyStateProvider__updateNetworkCountryCode_inContext_withCTContext___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    uint64_t v4 = [*(id *)(a1 + 48) subscriptionInfo];
    [v4 setLastKnownNetworkCountryCode:*(void *)(a1 + 56)];

    id v5 = STSystemStatusLogTelephonyState();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 56);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1D8320000, v5, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider: got last known network country code: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](*(void *)(a1 + 32), [*(id *)(a1 + 40) slotID]);
  }
}

uint64_t __59__STTelephonyStateProvider_isCellularRadioCapabilityActive__block_invoke(uint64_t a1)
{
  uint64_t result = -[STTelephonyStateProvider _internalQueue_isCellularRadioCapabilityActive](*(void *)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __53__STTelephonyStateProvider_carrierBundleInfoForSlot___block_invoke(uint64_t a1)
{
  -[STTelephonyStateProvider _internalQueue_subscriptionContextForSlot:](*(char **)(a1 + 32), *(void *)(a1 + 48));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v6 carrierBundleInfo];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __51__STTelephonyStateProvider_isUsingStewieConnection__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[17];
  }
  uint64_t v3 = v2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isStewieActiveOverBB];
}

void __48__STTelephonyStateProvider_isInactiveSOSEnabled__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[17];
  }
  uint64_t v3 = v2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 displayInactiveSOSInStatusBar];
}

uint64_t __45__STTelephonyStateProvider_cellChanged_cell___block_invoke(uint64_t a1)
{
  id v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  int v7 = v2;
  if (v2)
  {
    uint64_t v4 = v2;
    if (!v3) {
      goto LABEL_6;
    }
    -[STTelephonyStateProvider _updateLastKnownNetworkCountryCodeInContext:withCTContext:](v3, v2, *(void **)(a1 + 40));
  }
  else
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider cellChanged:cell:]_block_invoke");
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v5, *(void **)(a1 + 40));
  }
  uint64_t v4 = v7;
LABEL_6:
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __44__STTelephonyStateProvider_isDualSIMEnabled__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    LOBYTE(v1) = *(unsigned char *)(v1 + 17) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1;
  return result;
}

- (BOOL)isUsingStewieForSOS
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__STTelephonyStateProvider_isUsingStewieForSOS__block_invoke;
  v5[3] = &unk_1E6AD2458;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isUsingStewieConnection
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__STTelephonyStateProvider_isUsingStewieConnection__block_invoke;
  v5[3] = &unk_1E6AD2458;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isRadioModuleDead
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__STTelephonyStateProvider_isRadioModuleDead__block_invoke;
  v5[3] = &unk_1E6AD2098;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isInactiveSOSEnabled
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__STTelephonyStateProvider_isInactiveSOSEnabled__block_invoke;
  v5[3] = &unk_1E6AD2458;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDualSIMEnabled
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__STTelephonyStateProvider_isDualSIMEnabled__block_invoke;
  v5[3] = &unk_1E6AD2098;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCellularRadioCapabilityActive
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__STTelephonyStateProvider_isCellularRadioCapabilityActive__block_invoke;
  v5[3] = &unk_1E6AD2098;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)cellChanged:(id)a3 cell:(id)a4
{
  id v5 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__STTelephonyStateProvider_cellChanged_cell___block_invoke;
  v8[3] = &unk_1E6AD1EE0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(internalQueue, v8);
}

- (id)carrierBundleInfoForSlot:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__STTelephonyStateProvider_carrierBundleInfoForSlot___block_invoke;
  block[3] = &unk_1E6AD20C0;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_updateNetworkCountryCode:(void *)a3 inContext:(void *)a4 withCTContext:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v10 = v9;
  if (a1)
  {
    uint64_t v11 = *(NSObject **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__STTelephonyStateProvider__updateNetworkCountryCode_inContext_withCTContext___block_invoke;
    v12[3] = &unk_1E6AD2540;
    v12[4] = a1;
    id v13 = v9;
    id v14 = v8;
    id v15 = v7;
    dispatch_async(v11, v12);
  }
}

- (void)_updateLastKnownNetworkCountryCodeInContext:(void *)a3 withCTContext:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = STSystemStatusLogTelephonyState();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D8320000, v7, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider: requesting copyMobileCountryCode", buf, 2u);
    }

    id v8 = *(void **)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__STTelephonyStateProvider__updateLastKnownNetworkCountryCodeInContext_withCTContext___block_invoke;
    v9[3] = &unk_1E6AD2518;
    v9[4] = a1;
    id v10 = v5;
    id v11 = v6;
    [v8 copyMobileCountryCode:v11 completion:v9];
  }
}

- (void)_internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:(uint64_t)a1
{
  if (a1)
  {
    id v4 = *(id *)(a1 + 24);
    id v5 = [v4 setRepresentation];

    id v6 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__STTelephonyStateProvider__internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot___block_invoke;
    block[3] = &unk_1E6AD2110;
    id v9 = v5;
    uint64_t v10 = a1;
    uint64_t v11 = a2;
    id v7 = v5;
    dispatch_async(v6, block);
  }
}

- (uint64_t)_internalQueue_isCellularRadioCapabilityActive
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(unsigned char *)(result + 19)) {
      return 0;
    }
    uint64_t v2 = *(void *)(result + 96);
    if ((v2 & 0x8000000000000000) == 0) {
      return v2 != 1;
    }
    if (-[STTelephonyStateProvider _serverConnection](result))
    {
      unint64_t v3 = _CTServerConnectionHideDataIndicator();
      if (!HIDWORD(v3))
      {
        id v4 = STSystemStatusLogTelephonyState();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          id v5 = STTelephonyCachedBooleanDebugName(1);
          *(_DWORD *)buf = 138543362;
          uint64_t v10 = v5;
          _os_log_impl(&dword_1D8320000, v4, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider-isCellularRadioCapabilityActive - queried for suppressesCellIndicators with new state=%{public}@", buf, 0xCu);
        }
        if (*(void *)(v1 + 96) == -1) {
          *(void *)(v1 + 96) = 1;
        }
        else {
          -[STTelephonyStateProvider _setSuppressesCellIndicators:](v1, 1);
        }
        goto LABEL_17;
      }
      -[STTelephonyStateProvider _serverConnectionDidError:](v1, v3);
      *(void *)(v1 + 96) = -2;
      id v6 = STSystemStatusLogTelephonyState();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = STTelephonyCachedBooleanDebugName(*(void *)(v1 + 96));
        *(_DWORD *)buf = 138543362;
        uint64_t v10 = v7;
        id v8 = "STTelephonyStateProvider-isCellularRadioCapabilityActive - queried for suppressesCellIndicators with new state=%{public}@";
        goto LABEL_15;
      }
    }
    else
    {
      *(void *)(v1 + 96) = -2;
      id v6 = STSystemStatusLogTelephonyState();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = STTelephonyCachedBooleanDebugName(*(void *)(v1 + 96));
        *(_DWORD *)buf = 138543362;
        uint64_t v10 = v7;
        id v8 = "STTelephonyStateProvider-isCellularRadioCapabilityActive - queried for _suppressesCellIndicators with new state=%{public}@";
LABEL_15:
        _os_log_impl(&dword_1D8320000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
      }
    }

LABEL_17:
    uint64_t v2 = *(void *)(v1 + 96);
    return v2 != 1;
  }
  return result;
}

- (STTelephonyStateProvider)init
{
  v37.receiver = self;
  v37.super_class = (Class)STTelephonyStateProvider;
  uint64_t v2 = [(STTelephonyStateProvider *)&v37 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    uint64_t v7 = BSDispatchQueueCreateSerial();
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = BSDispatchQueueCreateSerial();
    backgroundQueryQueue = v2->_backgroundQueryQueue;
    v2->_backgroundQueryQueue = (OS_dispatch_queue *)v9;

    v2->_containsCellularRadio = MGGetBoolAnswer();
    v2->_hasCellularTelephony = MGGetBoolAnswer();
    v2->_cachedSuppressesCellDataIndicator = -1;
    v2->_cachedSuppressesCellIndicators = -1;
    v2->_cachedNeedsUserIdentificationModule = -1;
    -[STTelephonyStateProvider _purgeSlot1SubscriptionState]((uint64_t)v2);
    -[STTelephonyStateProvider _purgeSlot2SubscriptionState]((uint64_t)v2);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v2->_backgroundQueryQueue];
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v11;

    [(CoreTelephonyClient *)v2->_coreTelephonyClient setDelegate:v2];
    -[STTelephonyStateProvider _serverConnection]((uint64_t)v2);
    objc_initWeak(&location, v2);
    v44[1] = (id)MEMORY[0x1E4F143A8];
    v44[2] = (id)3221225472;
    v44[3] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke;
    v44[4] = &unk_1E6AD24A0;
    objc_copyWeak(&v45, &location);
    _CTServerConnectionRegisterBlockForNotification();
    v43[1] = (id)MEMORY[0x1E4F143A8];
    v43[2] = (id)3221225472;
    v43[3] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_3;
    v43[4] = &unk_1E6AD24A0;
    objc_copyWeak(v44, &location);
    _CTServerConnectionRegisterBlockForNotification();
    v42[1] = (id)MEMORY[0x1E4F143A8];
    v42[2] = (id)3221225472;
    v42[3] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_5;
    v42[4] = &unk_1E6AD24A0;
    objc_copyWeak(v43, &location);
    _CTServerConnectionRegisterBlockForNotification();
    uint64_t v38 = MEMORY[0x1E4F143A8];
    uint64_t v39 = 3221225472;
    v40 = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_7;
    v41 = &unk_1E6AD24A0;
    objc_copyWeak(v42, &location);
    _CTServerConnectionRegisterBlockForNotification();
    objc_destroyWeak(v42);
    objc_destroyWeak(v43);
    objc_destroyWeak(v44);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __32__STTelephonyStateProvider_init__block_invoke;
    v35 = &unk_1E6AD2070;
    id v13 = v2;
    v36 = v13;
    id v14 = (id)BSLogAddStateCaptureBlockWithTitle();
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F4BE78]) initWithQueue:v2->_backgroundQueryQueue];
    id v16 = v13[14];
    v13[14] = (id)v15;

    [v13[14] setDelegate:v13];
    v17 = v2->_backgroundQueryQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__STTelephonyStateProvider_init__block_invoke_2;
    block[3] = &unk_1E6AD2430;
    v18 = v13;
    v31 = v18;
    dispatch_async(v17, block);
    v19 = v2->_internalQueue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __32__STTelephonyStateProvider_init__block_invoke_3;
    v28[3] = &unk_1E6AD2430;
    v20 = v18;
    v29 = v20;
    dispatch_async(v19, v28);
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F23A60]) initWithDelegate:v20 queue:v2->_observerQueue];
    objc_storeStrong(v20 + 16, v21);
    v22 = v2->_observerQueue;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __32__STTelephonyStateProvider_init__block_invoke_4;
    v25[3] = &unk_1E6AD1EE0;
    id v26 = v21;
    v27 = v20;
    id v23 = v21;
    dispatch_async(v22, v25);
  }
  return v2;
}

uint64_t __32__STTelephonyStateProvider_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) debugDescription];
}

uint64_t __32__STTelephonyStateProvider_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) airplaneModeChanged];
}

void __32__STTelephonyStateProvider_init__block_invoke_3(uint64_t a1)
{
}

- (void)_updateState
{
  if (a1)
  {
    char v6 = 0;
    if (!*(unsigned char *)(a1 + 19))
    {
      BOOL v3 = 0;
      goto LABEL_6;
    }
    -[STTelephonyStateProvider _serverConnection](a1);
    unint64_t IsDead = _CTServerConnectionGetRadioModuleIsDead();
    if (!HIDWORD(IsDead))
    {
      BOOL v3 = v6 == 1;
LABEL_6:
      -[STTelephonyStateProvider setCachedRadioModuleDead:](a1, v3);
      -[STTelephonyStateProvider _updateDualSIMCapabilitySendingNotification:](a1, 0);
      id v4 = *(NSObject **)(a1 + 48);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __40__STTelephonyStateProvider__updateState__block_invoke;
      v5[3] = &unk_1E6AD2430;
      v5[4] = a1;
      dispatch_async(v4, v5);
      return;
    }
    -[STTelephonyStateProvider _serverConnectionDidError:](a1, IsDead);
  }
}

void __32__STTelephonyStateProvider_init__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) start];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) getState];
  -[STTelephonyStateProvider setStewieState:](v2, v3);
}

- (void)setStewieState:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1 && *(id *)(a1 + 136) != v4)
  {
    objc_storeStrong((id *)(a1 + 136), a2);
    uint64_t v5 = [v4 displayStewieInStatusBar];
    uint64_t v6 = [v4 displayInactiveSOSInStatusBar];
    uint64_t v7 = [v4 isStewieActiveOverBB];
    id v8 = STSystemStatusLogTelephonyState();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
      uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
      uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
      *(_DWORD *)v20 = 138544130;
      *(void *)&v20[4] = v9;
      *(_WORD *)&v20[12] = 2114;
      *(void *)&v20[14] = v10;
      *(_WORD *)&v20[22] = 2114;
      v21 = v11;
      LOWORD(v22) = 2114;
      *(void *)((char *)&v22 + 2) = v4;
      _os_log_impl(&dword_1D8320000, v8, OS_LOG_TYPE_DEFAULT, "[STTelephonyStateProvider] Stewie state changed, displayStewieInStatusBar: %{public}@, displayInactiveSOSInStatusBar: %{public}@, usingStewieConnection: %{public}@, %{public}@", v20, 0x2Au);
    }
    id v12 = *(id *)(a1 + 24);
    id v13 = [v12 setRepresentation];

    id v14 = *(NSObject **)(a1 + 40);
    *(void *)v20 = MEMORY[0x1E4F143A8];
    *(void *)&v20[8] = 3221225472;
    *(void *)&v20[16] = __119__STTelephonyStateProvider__internalQueue_notifyObserversOfStewieStateChangedToUsingStewieForSOS_isInactiveSOSEnabled___block_invoke;
    v21 = &unk_1E6AD2568;
    *(void *)&long long v22 = v13;
    *((void *)&v22 + 1) = a1;
    char v23 = v5;
    char v24 = v6;
    id v15 = v13;
    dispatch_async(v14, v20);

    id v16 = *(id *)(a1 + 24);
    v17 = [v16 setRepresentation];

    v18 = *(NSObject **)(a1 + 40);
    *(void *)v20 = MEMORY[0x1E4F143A8];
    *(void *)&v20[8] = 3221225472;
    *(void *)&v20[16] = __141__STTelephonyStateProvider__internalQueue_notifyObserversOfStewieStateChangedToUsingStewieForSOS_isInactiveSOSEnabled_usingStewieConnection___block_invoke;
    v21 = &unk_1E6AD2590;
    *(void *)&long long v22 = v17;
    *((void *)&v22 + 1) = a1;
    char v23 = v5;
    char v24 = v6;
    char v25 = v7;
    id v19 = v17;
    dispatch_async(v18, v20);
  }
}

- (void)dealloc
{
  [(STTelephonyStateProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STTelephonyStateProvider;
  [(STTelephonyStateProvider *)&v3 dealloc];
}

- (BOOL)needsUserIdentificationModule
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__STTelephonyStateProvider_needsUserIdentificationModule__block_invoke;
  v5[3] = &unk_1E6AD2098;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__STTelephonyStateProvider_needsUserIdentificationModule__block_invoke(uint64_t a1)
{
  uint64_t result = -[STTelephonyStateProvider _internalQueue_needsUserIdentificationModule](*(void *)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (uint64_t)_internalQueue_needsUserIdentificationModule
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if ((*(void *)(result + 104) & 0x8000000000000000) != 0
      && -[STTelephonyStateProvider _serverConnection](result))
    {
      unint64_t IsUserIdentityModuleRequired = _CTServerConnectionIsUserIdentityModuleRequired();
      if (HIDWORD(IsUserIdentityModuleRequired))
      {
        -[STTelephonyStateProvider _serverConnectionDidError:](v1, IsUserIdentityModuleRequired);
      }
      else
      {
        *(void *)(v1 + 104) = 0;
        char v3 = STSystemStatusLogTelephonyState();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          id v4 = STTelephonyCachedBooleanDebugName(*(void *)(v1 + 104));
          *(_DWORD *)buf = 138543362;
          uint64_t v6 = v4;
          _os_log_impl(&dword_1D8320000, v3, OS_LOG_TYPE_DEFAULT, "STelephonyStateProvider updated _needsUserIdentificationModule to %{public}@", buf, 0xCu);
        }
      }
    }
    return *(void *)(v1 + 104) == 1;
  }
  return result;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__STTelephonyStateProvider_addObserver___block_invoke;
  v7[3] = &unk_1E6AD1EE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __40__STTelephonyStateProvider_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[3];
  }
  return [v1 addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__STTelephonyStateProvider_removeObserver___block_invoke;
  v7[3] = &unk_1E6AD1EE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __43__STTelephonyStateProvider_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[3];
  }
  return [v1 removeObject:*(void *)(a1 + 40)];
}

- (id)mobileEquipmentInfoForSlot:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__STTelephonyStateProvider_mobileEquipmentInfoForSlot___block_invoke;
  block[3] = &unk_1E6AD20C0;
  void block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__STTelephonyStateProvider_mobileEquipmentInfoForSlot___block_invoke(uint64_t a1)
{
  -[STTelephonyStateProvider _internalQueue_subscriptionContextForSlot:](*(char **)(a1 + 32), *(void *)(a1 + 48));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v6 mobileEquipmentInfo];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)invalidate
{
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__STTelephonyStateProvider_invalidate__block_invoke;
  block[3] = &unk_1E6AD2430;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __38__STTelephonyStateProvider_invalidate__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    _CTServerConnectionUnregisterForAllNotifications();
    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 8));
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
}

- (uint64_t)_serverConnection
{
  uint64_t result = *(void *)(a1 + 8);
  if (!result)
  {
    uint64_t result = _CTServerConnectionCreateOnTargetQueue();
    *(void *)(a1 + 8) = result;
    if (!result)
    {
      uint64_t v3 = STSystemStatusLogTelephonyState();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_error_impl(&dword_1D8320000, v3, OS_LOG_TYPE_ERROR, "Unable to create CTServerConnection. Telephony state may be incorrect.", v4, 2u);
      }

      return *(void *)(a1 + 8);
    }
  }
  return result;
}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    uint64_t v2 = WeakRetained[4];
  }
  else {
    uint64_t v2 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_2;
  block[3] = &unk_1E6AD2430;
  id v5 = WeakRetained;
  uint64_t v3 = WeakRetained;
  dispatch_async(v2, block);
}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    -[STTelephonyStateProvider _updateState](v1);
  }
}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    uint64_t v2 = WeakRetained[4];
  }
  else {
    uint64_t v2 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_4;
  block[3] = &unk_1E6AD2430;
  id v5 = WeakRetained;
  uint64_t v3 = WeakRetained;
  dispatch_async(v2, block);
}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_4(uint64_t a1)
{
}

- (void)setCachedRadioModuleDead:(uint64_t)a1
{
  if (a1)
  {
    char v2 = a2;
    if (*(unsigned __int8 *)(a1 + 18) != a2)
    {
      uint64_t v4 = NSString;
      id v5 = NSStringFromBOOL();
      id v6 = [v4 stringWithFormat:@"Setting radio module dead: %@", v5];
      -[STTelephonyStateProvider _logSubscriptionEvent:](a1, v6);

      *(unsigned char *)(a1 + 18) = v2;
      -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, 0);
    }
  }
}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_5(uint64_t a1, void *a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = a2;
  if (WeakRetained) {
    id v5 = WeakRetained[4];
  }
  else {
    id v5 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_6;
  v8[3] = &unk_1E6AD1EE0;
  id v9 = WeakRetained;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = WeakRetained;
  dispatch_async(v5, v8);
}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_6(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    uint64_t v3 = STSystemStatusLogTelephonyState();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSStringFromSelector(sel__hideDataIndicatorChanged_);
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2114;
      id v12 = v2;
      _os_log_impl(&dword_1D8320000, v3, OS_LOG_TYPE_DEFAULT, "%@ received status info -> %{public}@", (uint8_t *)&v9, 0x16u);
    }
    if (v2)
    {
      id v5 = [v2 objectForKey:*MEMORY[0x1E4F241B8]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = [v5 BOOLValue];
      }
      else {
        uint64_t v6 = -1;
      }
      id v8 = [v2 objectForKey:*MEMORY[0x1E4F24010]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = [v8 BOOLValue];
      }
      else {
        uint64_t v7 = -1;
      }
    }
    else
    {
      uint64_t v6 = -1;
      uint64_t v7 = -1;
    }
    if (*(void *)(v1 + 88) != v6)
    {
      *(void *)(v1 + 88) = v6;
      -[STTelephonyStateProvider _updateDataConnectionType](v1);
    }
    -[STTelephonyStateProvider _setSuppressesCellIndicators:](v1, v7);
  }
}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_7(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    id v2 = WeakRetained[4];
  }
  else {
    id v2 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_8;
  block[3] = &unk_1E6AD2430;
  id v5 = WeakRetained;
  uint64_t v3 = WeakRetained;
  dispatch_async(v2, block);
}

void __69__STTelephonyStateProvider__registerForServerConnectionNotifications__block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (*(void *)(v1 + 104) != -1)
    {
      *(void *)(v1 + 104) = -1;
      id v2 = STSystemStatusLogTelephonyState();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v3 = 0;
        _os_log_impl(&dword_1D8320000, v2, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider resetting _needsUserIdentificationModule (for postponement change)", v3, 2u);
      }
    }
    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](v1, 0);
  }
}

- (void)_serverConnectionDidError:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = STSystemStatusLogTelephonyState();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = [MEMORY[0x1E4F29060] callStackReturnAddresses];
    *(_DWORD *)buf = 67109634;
    int v9 = a2;
    __int16 v10 = 1024;
    int v11 = HIDWORD(a2);
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_error_impl(&dword_1D8320000, v4, OS_LOG_TYPE_ERROR, "CTServerConnection returned error: (%i, %i). Destroying connection. (Callstack: %{public}@)", buf, 0x18u);
  }
  id v5 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__STTelephonyStateProvider__serverConnectionDidError___block_invoke;
  block[3] = &unk_1E6AD2430;
  void block[4] = a1;
  dispatch_async(v5, block);
}

void __54__STTelephonyStateProvider__serverConnectionDidError___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (unsigned char *)v2[15];
    if (v3)
    {
      *uint64_t v3 = 1;
      uint64_t v4 = *(void *)(a1 + 32);
      if (v4)
      {
        *(void *)(v4 + 120) = 0;
        id v2 = *(void **)(a1 + 32);
      }
      else
      {
        id v2 = 0;
      }
    }
  }
  objc_initWeak(&location, v2);
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6) {
    uint64_t v6 = (void *)v6[4];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__STTelephonyStateProvider__serverConnectionDidError___block_invoke_2;
  block[3] = &unk_1E6AD24C8;
  void block[4] = &v11;
  uint64_t v7 = v6;
  objc_copyWeak(&v10, &location);
  dispatch_after(v5, v7, block);

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    *(void *)(v8 + 120) = v12 + 3;
  }
  objc_destroyWeak(&v10);
  _Block_object_dispose(&v11, 8);
  objc_destroyWeak(&location);
}

void __54__STTelephonyStateProvider__serverConnectionDidError___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      WeakRetained[15] = 0;
      id v2 = WeakRetained;
      -[STTelephonyStateProvider _updateState]((uint64_t)WeakRetained);
      WeakRetained = v2;
    }
  }
}

- (void)_setCallForwardingIndicator:(void *)a3 inSubscriptionContext:
{
  id v5 = a3;
  if (a1)
  {
    id v11 = v5;
    uint64_t v6 = [v5 subscriptionInfo];
    if ([v6 callForwardingIndicator] != a2)
    {
      [v6 setCallForwardingIndicator:a2];
      uint64_t v7 = NSString;
      uint64_t v8 = STTelephonyCallForwardingIndicatorDebugName(a2);
      int v9 = [v7 stringWithFormat:@"updated callForwardingIndicator to %@", v8];
      -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](a1, v9, v11);

      uint64_t v10 = -[STTelephonyStateProvider _subscriptionSlotForContext:](a1, v11);
      -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, v10);
    }

    id v5 = v11;
  }
}

- (void)_stopFakeServiceForContext:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v5 = v3;
    -[STTelephonyStateProvider _cancelFakeServiceForContext:](v3);
    uint64_t v4 = [v5 cachedCTOperatorName];
    if ([v4 length]) {
      -[STTelephonyStateProvider _setOperatorName:inSubscriptionContext:](a1, v4, v5);
    }
    else {
      -[STTelephonyStateProvider _reallySetOperatorName:inSubscriptionContext:](a1, 0, v5);
    }

    id v3 = v5;
  }
}

- (void)_setRegistrationStatus:(void *)a3 inSubscriptionContext:
{
  id v13 = a3;
  id v5 = [v13 subscriptionInfo];
  uint64_t v6 = [v5 registrationStatus];
  if (v6 != a2)
  {
    unint64_t v7 = v6;
    [v5 setRegistrationStatus:a2];
    if (a2 != 1) {
      [v13 setPretendingToSearch:0];
    }
    uint64_t v8 = NSString;
    int v9 = STTelephonyRegistrationStatusDebugName(v7);
    uint64_t v10 = STTelephonyRegistrationStatusDebugName(a2);
    id v11 = [v8 stringWithFormat:@"registration status changed from %@ to %@", v9, v10];
    -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)a1, v11, v13);

    if (a2 == 2) {
      -[STTelephonyStateProvider _updateCallForwardingIndicatorForContext:](a1, v13);
    }
    else {
      -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:]((uint64_t)a1, 0, v13);
    }
  }
  -[STTelephonyStateProvider _cancelFakeRegistrationForContext:](v13);
  uint64_t v12 = -[STTelephonyStateProvider _subscriptionSlotForContext:]((uint64_t)a1, v13);
  -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:]((uint64_t)a1, v12);
}

void __51__STTelephonyStateProvider__airplaneModeDidChange___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPretendingToSearch])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[STTelephonyStateProvider _updateRegistrationNowInSubscriptionContext:](WeakRetained, *(void **)(a1 + 32));
  }
}

- (void)_updateRegistrationNowInSubscriptionContext:(void *)a1
{
  if (a1)
  {
    id v5 = a2;
    id v3 = [v5 cachedCTRegistrationDisplayStatus];
    unint64_t v4 = STTelephonyRegistrationStatusForStatus(v3);
    -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:](a1, v4, v5);

    [v5 setPretendingToSearch:0];
  }
}

- (void)_updateCallForwardingIndicatorForContext:(void *)a1
{
  id v3 = a2;
  unint64_t v4 = [v3 subscriptionInfo];
  id v5 = [v4 SIMStatus];
  if ([v5 isEqualToString:*MEMORY[0x1E4F241F0]])
  {
    int v6 = -[STTelephonyStateProvider _internalQueue_needsUserIdentificationModule]((uint64_t)a1);

    if (v6)
    {
      uint64_t v7 = (uint64_t)a1;
      unint64_t v8 = 2;
LABEL_9:
      -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:](v7, v8, v3);
      goto LABEL_10;
    }
  }
  else
  {
  }
  if ([v4 registrationStatus] != 2 || !objc_msgSend(a1, "hasCellularTelephony"))
  {
    uint64_t v7 = (uint64_t)a1;
    unint64_t v8 = 0;
    goto LABEL_9;
  }
  int v9 = (void *)a1[7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke;
  v10[3] = &unk_1E6AD27E0;
  v10[4] = a1;
  id v11 = v3;
  [v9 getSubscriptionInfo:v10];

LABEL_10:
}

void __51__STTelephonyStateProvider__airplaneModeDidChange___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPretendingToSearch])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[STTelephonyStateProvider _updateRegistrationNowInSubscriptionContext:](WeakRetained, *(void **)(a1 + 32));
  }
}

- (void)_updateDataConnectionTypeForContext:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  int v3 = *(unsigned __int8 *)(a1 + 20);
  int isCellularRadioCapability = -[STTelephonyStateProvider _internalQueue_isCellularRadioCapabilityActive](a1);
  uint64_t v5 = *(void *)(a1 + 88);
  if (v5 < 0)
  {
    -[STTelephonyStateProvider _serverConnection](a1);
    unint64_t v6 = _CTServerConnectionHideRatIndicator();
    if (HIDWORD(v6))
    {
      -[STTelephonyStateProvider _serverConnectionDidError:](a1, v6);
      *(void *)(a1 + 88) = -2;
      uint64_t v10 = STSystemStatusLogTelephonyState();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = STTelephonyCachedBooleanDebugName(*(void *)(a1 + 88));
        *(_DWORD *)buf = 138543362;
        char v25 = v11;
        _os_log_impl(&dword_1D8320000, v10, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider - queried for _suppressesCellDataIndicator with new state=%{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v7 = STSystemStatusLogTelephonyState();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = STTelephonyCachedBooleanDebugName(0);
        *(_DWORD *)buf = 138543362;
        char v25 = v8;
        _os_log_impl(&dword_1D8320000, v7, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider - queried for _suppressesCellDataIndicator with new state=%{public}@", buf, 0xCu);
      }
      uint64_t v9 = *(void *)(a1 + 88);
      if (v9 == -1)
      {
        *(void *)(a1 + 88) = 0;
      }
      else if (v9)
      {
        *(void *)(a1 + 88) = 0;
        -[STTelephonyStateProvider _updateDataConnectionType](a1);
      }
    }
    uint64_t v5 = *(void *)(a1 + 88);
  }
  uint64_t v12 = 0;
  unsigned int v13 = isCellularRadioCapability ^ 1;
  if (!v3)
  {
    char v14 = v23;
    if ((v13 & 1) != 0 || v5 == 1) {
      goto LABEL_26;
    }
    uint64_t v15 = [v23 modemDataConnectionType];
    uint64_t v16 = v15;
    if ((unint64_t)(v15 - 7) <= 3)
    {
      v17 = [v23 carrierBundleInfo];
      int v18 = [v17 LTEConnectionShows4G];

      if (v18) {
        uint64_t v16 = 6;
      }
      goto LABEL_21;
    }
    if (v15)
    {
LABEL_21:
      BOOL v19 = [v23 isSatelliteSystem] == 0;
      char v14 = v23;
      if (v19) {
        uint64_t v12 = v16;
      }
      else {
        uint64_t v12 = 15;
      }
      goto LABEL_26;
    }
    uint64_t v12 = 0;
  }
  char v14 = v23;
LABEL_26:
  if (v5 == 1) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v13;
  }
  v21 = [v14 subscriptionInfo];
  [v21 setBootstrap:v20];
  [v21 setDataConnectionType:v12];
  -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](a1, @"updated data connection type", v23);
  uint64_t v22 = -[STTelephonyStateProvider _subscriptionSlotForContext:](a1, v23);
  -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, v22);
}

- (void)_updateDualSIMCapabilitySendingNotification:(uint64_t)a1
{
  if (a1)
  {
    id v4 = *(id *)(a1 + 56);
    uint64_t v5 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__STTelephonyStateProvider__updateDualSIMCapabilitySendingNotification___block_invoke;
    block[3] = &unk_1E6AD2720;
    id v8 = v4;
    uint64_t v9 = a1;
    char v10 = a2;
    id v6 = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __40__STTelephonyStateProvider__updateState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) subscriptionInfoDidChange];
}

- (STTelephonySubscriptionContext)_newSubscriptionContext
{
  v0 = objc_alloc_init(STTelephonySubscriptionContext);
  uint64_t v1 = objc_alloc_init(STMutableTelephonySubscriptionInfo);
  [(STTelephonySubscriptionContext *)v0 setSubscriptionInfo:v1];
  id v2 = objc_alloc_init(STMutableTelephonyCarrierBundleInfo);
  [(STTelephonySubscriptionContext *)v0 setCarrierBundleInfo:v2];
  int v3 = objc_alloc_init(STMutableTelephonyMobileEquipmentInfo);
  [(STTelephonySubscriptionContext *)v0 setMobileEquipmentInfo:v3];

  return v0;
}

- (uint64_t)_purgeSlot1SubscriptionState
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = *(void **)(result + 64);
    if (v2) {
      -[STTelephonyStateProvider _cancelFakeServiceAndRegistrationForContext:](result, v2);
    }
    int v3 = -[STTelephonyStateProvider _newSubscriptionContext]();
    uint64_t v4 = *(void *)(v1 + 64);
    *(void *)(v1 + 64) = v3;
    return MEMORY[0x1F41817F8](v3, v4);
  }
  return result;
}

- (uint64_t)_purgeSlot2SubscriptionState
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = *(void **)(result + 72);
    if (v2) {
      -[STTelephonyStateProvider _cancelFakeServiceAndRegistrationForContext:](result, v2);
    }
    int v3 = -[STTelephonyStateProvider _newSubscriptionContext]();
    uint64_t v4 = *(void *)(v1 + 72);
    *(void *)(v1 + 72) = v3;
    return MEMORY[0x1F41817F8](v3, v4);
  }
  return result;
}

- (void)_cancelFakeServiceAndRegistrationForContext:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    -[STTelephonyStateProvider _cancelFakeServiceForContext:](v2);
    -[STTelephonyStateProvider _cancelFakeRegistrationForContext:](v2);
    -[STTelephonyStateProvider _cancelFakeCellularRegistrationForContext:](v2);
  }
}

- (void)_cancelFakeServiceForContext:(void *)a1
{
  id v2 = a1;
  uint64_t v1 = (unsigned char *)[v2 fakeServiceCanceled];
  if (v1)
  {
    *uint64_t v1 = 1;
    [v2 setFakeServiceCanceled:0];
  }
}

- (void)_cancelFakeRegistrationForContext:(void *)a1
{
  id v2 = a1;
  uint64_t v1 = (unsigned char *)[v2 fakeRegistrationCanceled];
  if (v1)
  {
    *uint64_t v1 = 1;
    [v2 setFakeRegistrationCanceled:0];
  }
}

- (void)_cancelFakeCellularRegistrationForContext:(void *)a1
{
  id v2 = a1;
  uint64_t v1 = (unsigned char *)[v2 fakeCellularRegistrationCanceled];
  if (v1)
  {
    *uint64_t v1 = 1;
    [v2 setFakeCellularRegistrationCanceled:0];
  }
}

void __86__STTelephonyStateProvider__updateLastKnownNetworkCountryCodeInContext_withCTContext___block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    TUISOCountryCodeForMCC();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _updateNetworkCountryCode:inContext:withCTContext:](*(void *)(a1 + 32), v4, *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
}

- (void)_logSubscriptionEvent:(uint64_t)a1
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = STSystemStatusLogTelephonyState();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543618;
      id v6 = v3;
      __int16 v7 = 2114;
      uint64_t v8 = a1;
      _os_log_impl(&dword_1D8320000, v4, OS_LOG_TYPE_DEFAULT, "[STTelephonyStateProvider]: %{public}@ -- manager: %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)_updateDataConnectionType
{
  -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](a1, *(void **)(a1 + 64));
  id v2 = *(void **)(a1 + 72);
  -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](a1, v2);
}

- (void)_setSuppressesCellIndicators:(uint64_t)a1
{
  if (*(void *)(a1 + 96) != a2)
  {
    *(void *)(a1 + 96) = a2;
    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, 0);
    -[STTelephonyStateProvider _updateDataConnectionType](a1);
  }
}

void __91__STTelephonyStateProvider__internalQueue_notifyObserversOfCarrierBundleInfoChangeForSlot___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        __int16 v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "carrierBundleInfoDidChangeForStateProvider:slot:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __119__STTelephonyStateProvider__internalQueue_notifyObserversOfStewieStateChangedToUsingStewieForSOS_isInactiveSOSEnabled___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        __int16 v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "stewieStateDidChangeForStateProvider:usingStewieForSOS:isInactiveSOSEnabled:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __141__STTelephonyStateProvider__internalQueue_notifyObserversOfStewieStateChangedToUsingStewieForSOS_isInactiveSOSEnabled_usingStewieConnection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        __int16 v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "stewieStateDidChangeForStateProvider:usingStewieForSOS:isInactiveSOSEnabled:usingStewieConnection:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_logSubscriptionEvent:(void *)a3 forCTContext:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = [a3 slotID];
    __int16 v7 = @"Unknown Slot";
    if (v6 == 2) {
      __int16 v7 = @"Slot 2";
    }
    if (v6 == 1) {
      __int16 v7 = @"Slot 1";
    }
    long long v8 = v7;
    long long v9 = STSystemStatusLogTelephonyState();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543874;
      long long v11 = v8;
      __int16 v12 = 2114;
      id v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = a1;
      _os_log_impl(&dword_1D8320000, v9, OS_LOG_TYPE_DEFAULT, "[STTelephonyStateProvider %{public}@]: %{public}@ -- manager: %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)_logSubscriptionEvent:(void *)a3 forContext:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = -[STTelephonyStateProvider _subscriptionSlotForContext:](a1, a3);
  __int16 v7 = @"Unknown Slot";
  if (v6 == 2) {
    __int16 v7 = @"Slot 2";
  }
  if (v6 == 1) {
    __int16 v7 = @"Slot 1";
  }
  long long v8 = v7;
  long long v9 = STSystemStatusLogTelephonyState();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543874;
    long long v11 = v8;
    __int16 v12 = 2114;
    id v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = a1;
    _os_log_impl(&dword_1D8320000, v9, OS_LOG_TYPE_DEFAULT, "[STTelephonyStateProvider %{public}@]: %{public}@ -- manager: %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

- (uint64_t)_subscriptionSlotForContext:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (*(id *)(a1 + 64) == v3) {
      a1 = 1;
    }
    else {
      a1 = 2 * (*(void *)(a1 + 72) == (void)v3);
    }
  }

  return a1;
}

- (void)subscriptionInfoDidChange
{
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke;
  block[3] = &unk_1E6AD2430;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    id v2 = *(void **)(v1 + 56);
  }
  else {
    id v2 = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_2;
  v4[3] = &unk_1E6AD2608;
  v4[4] = v1;
  return [v2 getSubscriptionInfo:v4];
}

void __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  if (a3)
  {
    if (v6) {
      __int16 v7 = v6[4];
    }
    else {
      __int16 v7 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_2_76;
    block[3] = &unk_1E6AD2430;
    void block[4] = v6;
    dispatch_async(v7, block);
  }
  else
  {
    if (v6) {
      uint64_t v6 = (void *)v6[7];
    }
    long long v8 = v6;
    long long v9 = [v8 getCurrentDataSubscriptionContextSync:0];

    int v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v11 = [v5 subscriptions];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_3;
    v22[3] = &unk_1E6AD25B8;
    v22[4] = *(void *)(a1 + 32);
    id v12 = v10;
    id v23 = v12;
    [v11 enumerateObjectsUsingBlock:v22];

    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      __int16 v14 = *(NSObject **)(v13 + 32);
    }
    else {
      __int16 v14 = 0;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_4;
    v18[3] = &unk_1E6AD2540;
    v18[4] = v13;
    id v19 = v5;
    id v20 = v12;
    id v21 = v9;
    id v15 = v9;
    id v16 = v12;
    dispatch_async(v14, v18);
  }
}

void __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_3(uint64_t a1, void *a2)
{
  id v35 = a2;
  if ([v35 slotID])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v4 = v35;
      id v5 = -[STTelephonyStateProvider _newSubscriptionContext]();
      uint64_t v6 = [(STTelephonySubscriptionContext *)v5 subscriptionInfo];
      id v7 = v4;
      long long v8 = *(void **)(v3 + 56);
      id v38 = 0;
      id v9 = v8;
      int v10 = [v9 getSIMStatus:v7 error:&v38];
      id v11 = v38;

      if (v11)
      {
        id v12 = *(NSObject **)(v3 + 32);
        block[0] = (id)MEMORY[0x1E4F143A8];
        block[1] = (id)3221225472;
        block[2] = __72__STTelephonyStateProvider__backgroundQueryQueue_SIMStatusForCTContext___block_invoke;
        block[3] = &unk_1E6AD1EE0;
        void block[4] = (id)v3;
        id v37 = v7;
        dispatch_async(v12, block);

        id v13 = 0;
      }
      else
      {
        id v13 = v10;
      }

      [v6 setSIMStatus:v13];
      id v14 = v7;
      id v15 = objc_alloc_init(STMutableTelephonyMobileEquipmentInfo);
      id v16 = *(void **)(v3 + 56);
      block[0] = 0;
      id v17 = v16;
      int v18 = [v17 getMobileEquipmentInfoFor:v14 error:block];

      id v19 = block[0];
      if (!v19)
      {
        id v20 = [v18 MEID];
        [(STMutableTelephonyMobileEquipmentInfo *)v15 setMEID:v20];

        id v21 = [v18 IMEI];
        [(STMutableTelephonyMobileEquipmentInfo *)v15 setIMEI:v21];

        uint64_t v22 = [v18 ICCID];
        [(STMutableTelephonyMobileEquipmentInfo *)v15 setICCID:v22];

        id v23 = [v18 CSN];
        [(STMutableTelephonyMobileEquipmentInfo *)v15 setCSN:v23];

        char v24 = [v18 baseId];
        [(STMutableTelephonyMobileEquipmentInfo *)v15 setBootstrapICCID:v24];
      }
      [(STTelephonySubscriptionContext *)v5 setMobileEquipmentInfo:v15];
      char v25 = [(STTelephonySubscriptionContext *)v5 carrierBundleInfo];
      objc_msgSend(v25, "setSuppressSOSOnlyWithLimitedService:", -[STTelephonyStateProvider _backgroundQueryQueue_shouldSuppressSOSOnlyWithLimitedServiceForCTContext:](*(void **)(v3 + 56), v14));

      uint64_t v26 = *(void **)(v3 + 56);
      block[0] = 0;
      id v27 = v26;
      v28 = [v27 getShortLabel:v14 error:block];
      id v29 = block[0];

      id v30 = 0;
      if (!v29) {
        id v30 = v28;
      }

      [v6 setShortSIMLabel:v30];
      v31 = [v14 userDataPreferred];
      objc_msgSend(v6, "setPreferredForDataConnections:", objc_msgSend(v31, "BOOLValue"));

      uint64_t v32 = [v14 uuid];
      uint64_t v33 = [v32 UUIDString];
      [v6 setIdentifier:v33];

      uint64_t v34 = [v14 isSimHidden];
      [v6 setHiddenSIM:v34];
    }
    else
    {
      id v5 = 0;
    }
    [*(id *)(a1 + 40) setObject:v5 forKey:v35];
  }
}

void __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_4(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  -[STTelephonyStateProvider _logSubscriptionEvent:](*(void *)(a1 + 32), @"got new subscription info");
  id v2 = [*(id *)(a1 + 40) subscriptionsInUse];
  v47 = (void *)[v2 mutableCopy];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v54 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v9 = [v8 slotID];
        if (v47)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v60 = __STTelephonyArrayContainsCTContextForSlot_block_invoke;
          v61 = &__block_descriptor_40_e48_B32__0__CTXPCServiceSubscriptionContext_8Q16_B24l;
          uint64_t v62 = v9;
          if ([v47 indexOfObjectPassingTest:&buf] != 0x7FFFFFFFFFFFFFFFLL) {
            continue;
          }
        }
        int v10 = [v8 labelID];

        if (v10) {
          [v47 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v5);
  }

  unsigned int v11 = -[STTelephonyStateProvider _hasCTContextForSlot:](*(void **)(a1 + 32), 1);
  unsigned int v12 = -[STTelephonyStateProvider _hasCTContextForSlot:](*(void **)(a1 + 32), 2);
  id v13 = *(void **)(a1 + 32);
  id v15 = (void *)[v47 copy];
  if (v13) {
    objc_setProperty_nonatomic_copy(v13, v14, v15, 80);
  }

  unsigned __int8 v16 = -[STTelephonyStateProvider _hasCTContextForSlot:](*(void **)(a1 + 32), 1);
  unsigned int v17 = -[STTelephonyStateProvider _hasCTContextForSlot:](*(void **)(a1 + 32), 2);
  uint64_t v18 = *(void *)(a1 + 32);
  if (!v11 || (v16 & 1) != 0)
  {
    if (v18) {
      id v19 = *(void **)(v18 + 64);
    }
    else {
      id v19 = 0;
    }
    -[STTelephonyStateProvider _cancelFakeServiceAndRegistrationForContext:](v18, v19);
  }
  else
  {
    -[STTelephonyStateProvider _purgeSlot1SubscriptionState](v18);
  }
  uint64_t v20 = *(void *)(a1 + 32);
  if ((v12 ^ 1 | v17))
  {
    if (v20) {
      id v21 = *(void **)(v20 + 72);
    }
    else {
      id v21 = 0;
    }
    -[STTelephonyStateProvider _cancelFakeServiceAndRegistrationForContext:](v20, v21);
  }
  else
  {
    -[STTelephonyStateProvider _purgeSlot2SubscriptionState](v20);
  }
  uint64_t v22 = STSystemStatusLogTelephonyState();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v47;
    _os_log_impl(&dword_1D8320000, v22, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider: cached new SIM subscriptions: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v46 = *(void *)v50;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v50 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v49 + 1) + 8 * v25);
        id v27 = [*(id *)(a1 + 48) objectForKey:v26];
        v28 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), v26);
        id v29 = v28;
        id v30 = *(void **)(a1 + 32);
        if (v30)
        {
          id v31 = v28;
          id v32 = v27;
          uint64_t v33 = [v32 mobileEquipmentInfo];
          [v31 setMobileEquipmentInfo:v33];

          uint64_t v34 = [v32 carrierBundleInfo];
          [v31 setCarrierBundleInfo:v34];

          id v35 = [v32 subscriptionInfo];

          v36 = [v35 SIMStatus];
          -[STTelephonyStateProvider _setSIMStatus:inSubscriptionContext:](v30, v36, v31);

          id v37 = [v31 subscriptionInfo];

          id v38 = [v35 shortSIMLabel];
          [v37 setShortSIMLabel:v38];

          objc_msgSend(v37, "setPreferredForDataConnections:", objc_msgSend(v35, "isPreferredForDataConnections"));
          uint64_t v39 = [v35 identifier];
          [v37 setIdentifier:v39];

          objc_msgSend(v37, "setHiddenSIM:", objc_msgSend(v35, "isHiddenSIM"));
          uint64_t v40 = *(void *)(a1 + 32);
          id v41 = v26;
          if (v40)
          {
            v42 = *(void **)(v40 + 56);
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v60 = __65__STTelephonyStateProvider__queryRegistrationStatusForCTContext___block_invoke;
            v61 = &unk_1E6AD26F8;
            uint64_t v62 = v40;
            id v63 = v41;
            [v42 copyRegistrationDisplayStatus:v63 completion:&buf];
          }
        }
        else
        {
          id v43 = v26;
        }

        ++v25;
      }
      while (v24 != v25);
      uint64_t v44 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
      uint64_t v24 = v44;
    }
    while (v44);
  }

  -[STTelephonyStateProvider _updateDataConnectedSubscriptionContextForCTContext:](*(void *)(a1 + 32), *(void **)(a1 + 56));
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_72;
  v48[3] = &unk_1E6AD25E0;
  v48[4] = *(void *)(a1 + 32);
  [v47 enumerateObjectsUsingBlock:v48];
  -[STTelephonyStateProvider _logSubscriptionEvent:](*(void *)(a1 + 32), @"kicked off updates for new subscription info");
}

- (void)_updateDataConnectedSubscriptionContextForCTContext:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v17 = v3;
    if (v3)
    {
      uint64_t v4 = [v3 slotID];
      if (v4)
      {
        uint64_t v5 = v4;
        if (-[STTelephonyStateProvider _hasCTContextForSlot:]((void *)a1, v4))
        {
          if (v5 == 2)
          {
            id v14 = *(void **)(a1 + 64);
            id v15 = *(id *)(a1 + 72);
            id v8 = v14;
            unsigned __int8 v16 = [v8 subscriptionInfo];
            [v16 setProvidingDataConnection:0];

            int v10 = [v15 subscriptionInfo];

            unsigned int v11 = v10;
            uint64_t v12 = 1;
            goto LABEL_14;
          }
          if (v5 == 1)
          {
            uint64_t v6 = *(void **)(a1 + 64);
            id v7 = *(id *)(a1 + 72);
            id v8 = v6;
            uint64_t v9 = [v8 subscriptionInfo];
            [v9 setProvidingDataConnection:1];

            int v10 = [v7 subscriptionInfo];

            unsigned int v11 = v10;
            uint64_t v12 = 0;
LABEL_14:
            [v11 setProvidingDataConnection:v12];

            goto LABEL_9;
          }
        }
      }
    }
    id v13 = [*(id *)(a1 + 64) subscriptionInfo];
    [v13 setProvidingDataConnection:0];

    id v8 = [*(id *)(a1 + 72) subscriptionInfo];
    [v8 setProvidingDataConnection:0];
LABEL_9:

    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, 0);
    id v3 = v17;
  }
}

void __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_72(uint64_t a1, void *a2)
{
  id v3 = *(char **)(a1 + 32);
  id v4 = a2;
  -[STTelephonyStateProvider _subscriptionContextForCTContext:](v3, v4);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v18 subscriptionInfo];
  uint64_t v6 = [v4 label];
  [v5 setSIMLabel:v6];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v8;
  if (v7)
  {
    int v10 = *(void **)(v7 + 56);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke;
    v29[3] = &unk_1E6AD2630;
    v29[4] = v7;
    id v11 = v8;
    id v30 = v11;
    id v12 = v10;
    [v12 getSignalStrengthInfo:v11 completion:v29];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_2;
    v27[3] = &unk_1E6AD2658;
    v27[4] = v7;
    id v13 = v11;
    id v28 = v13;
    [v12 copyOperatorName:v13 completion:v27];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_3;
    v25[3] = &unk_1E6AD2680;
    void v25[4] = v7;
    id v14 = v13;
    id v26 = v14;
    [v12 getDataStatus:v14 completion:v25];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_4;
    v23[3] = &unk_1E6AD26A8;
    v23[4] = v7;
    id v15 = v14;
    id v24 = v15;
    [v12 isNetworkReselectionNeeded:v15 completion:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_5;
    v21[3] = &unk_1E6AD26D0;
    v21[4] = v7;
    id v16 = v15;
    id v22 = v16;
    [v12 copyRejectCauseCode:v16 completion:v21];
    -[STTelephonyStateProvider _queryCallForwardingStateForCTContext:](v7, v16);
    id v17 = *(NSObject **)(v7 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_6;
    block[3] = &unk_1E6AD1EE0;
    void block[4] = v7;
    id v20 = v16;
    dispatch_async(v17, block);
  }
}

void __53__STTelephonyStateProvider_subscriptionInfoDidChange__block_invoke_2_76(uint64_t a1)
{
}

- (uint64_t)_backgroundQueryQueue_shouldSuppressSOSOnlyWithLimitedServiceForCTContext:(void *)a1
{
  id v3 = a1;
  id v4 = (objc_class *)MEMORY[0x1E4F23938];
  id v5 = a2;
  uint64_t v6 = (void *)[[v4 alloc] initWithBundleType:6];
  uint64_t v10 = 0;
  uint64_t v7 = (void *)[v3 copyCarrierBundleValueWithDefault:v5 key:@"SuppressSOSOnlyWithLimitedService" bundleType:v6 error:&v10];

  if (v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = [v7 BOOLValue];
  }

  return v8;
}

void __72__STTelephonyStateProvider__backgroundQueryQueue_SIMStatusForCTContext___block_invoke(uint64_t a1)
{
}

- (void)_setSIMStatus:(void *)a3 inSubscriptionContext:
{
  id v11 = a2;
  if (a1)
  {
    id v5 = a3;
    uint64_t v6 = [v5 subscriptionInfo];
    uint64_t v7 = [v6 SIMStatus];
    if ([v7 isEqualToString:v11])
    {
      uint64_t v8 = [NSString stringWithFormat:@"SIM status not changing (%@) - firing notification anyway", v7];
      -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)a1, v8, v5);
    }
    else
    {
      [v6 setSIMStatus:v11];
      uint64_t v9 = [NSString stringWithFormat:@"SIM status changed from %@ to %@", v7, v11];
      -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)a1, v9, v5);

      -[STTelephonyStateProvider _updateCallForwardingIndicatorForContext:](a1, v5);
    }
    uint64_t v10 = -[STTelephonyStateProvider _subscriptionSlotForContext:]((uint64_t)a1, v5);

    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:]((uint64_t)a1, v10);
  }
}

uint64_t __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return [*(id *)(result + 32) signalStrengthChanged:*(void *)(result + 40) info:a2];
  }
  return result;
}

uint64_t __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return [*(id *)(result + 32) operatorNameChanged:*(void *)(result + 40) name:a2];
  }
  return result;
}

uint64_t __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return [*(id *)(result + 32) dataStatus:*(void *)(result + 40) dataStatusInfo:a2];
  }
  return result;
}

void __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_4(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3) {
    -[STTelephonyStateProvider _handleNetworkReselectionNeeded:forCTContext:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40));
  }
}

- (void)_handleNetworkReselectionNeeded:(void *)a3 forCTContext:
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__STTelephonyStateProvider__handleNetworkReselectionNeeded_forCTContext___block_invoke;
    block[3] = &unk_1E6AD2720;
    void block[4] = a1;
    id v9 = v5;
    char v10 = a2;
    dispatch_async(v7, block);
  }
}

uint64_t __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_5(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return [*(id *)(result + 32) rejectCauseCodeChanged:*(void *)(result + 40) causeCode:a2];
  }
  return result;
}

- (void)_queryCallForwardingStateForCTContext:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 56);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__STTelephonyStateProvider__queryCallForwardingStateForCTContext___block_invoke;
    v6[3] = &unk_1E6AD26A8;
    v6[4] = a1;
    id v7 = v3;
    [v5 isUnconditionalCallForwardingActive:v7 completion:v6];
  }
}

uint64_t __64__STTelephonyStateProvider__querySubscriptionStateForCTContext___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) operatorBundleChange:*(void *)(a1 + 40)];
}

uint64_t __65__STTelephonyStateProvider__queryRegistrationStatusForCTContext___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return [*(id *)(result + 32) displayStatusChanged:*(void *)(result + 40) status:a2];
  }
  return result;
}

void __66__STTelephonyStateProvider__queryCallForwardingStateForCTContext___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v11 = v3;
    uint64_t v12 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      id v7 = *(NSObject **)(v6 + 32);
    }
    else {
      id v7 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__STTelephonyStateProvider__queryCallForwardingStateForCTContext___block_invoke_2;
    block[3] = &unk_1E6AD2720;
    void block[4] = v6;
    id v9 = *(id *)(a1 + 40);
    char v10 = a2;
    dispatch_async(v7, block);
  }
}

void __66__STTelephonyStateProvider__queryCallForwardingStateForCTContext___block_invoke_2(uint64_t a1)
{
  id v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  id v6 = v2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 48)) {
      unint64_t v3 = 1;
    }
    else {
      unint64_t v3 = 2;
    }
    -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:](*(void *)(a1 + 32), v3, v2);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider _queryCallForwardingStateForCTContext:]_block_invoke_2");
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v4, v5, *(void **)(a1 + 40));
  }
}

- (void)dualSimCapabilityDidChange
{
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__STTelephonyStateProvider_dualSimCapabilityDidChange__block_invoke;
  block[3] = &unk_1E6AD2430;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __54__STTelephonyStateProvider_dualSimCapabilityDidChange__block_invoke(uint64_t a1)
{
}

void __72__STTelephonyStateProvider__updateDualSIMCapabilitySendingNotification___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v12 = 0;
  uint64_t v3 = [v2 getDualSimCapability:&v12];
  id v4 = v12;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    id v6 = *(NSObject **)(v5 + 32);
  }
  else {
    id v6 = 0;
  }
  if (v4) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v3 == 2;
  }
  char v8 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__STTelephonyStateProvider__updateDualSIMCapabilitySendingNotification___block_invoke_2;
  block[3] = &unk_1E6AD2748;
  void block[4] = v5;
  char v10 = v8;
  char v11 = *(unsigned char *)(a1 + 48);
  dispatch_async(v6, block);
}

void __72__STTelephonyStateProvider__updateDualSIMCapabilitySendingNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = NSString;
  id v4 = NSStringFromBOOL();
  uint64_t v5 = [v3 stringWithFormat:@"Setting dual SIM enabled: %@", v4];
  -[STTelephonyStateProvider _logSubscriptionEvent:](v2, v5);

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    *(unsigned char *)(v6 + 17) = *(unsigned char *)(a1 + 40);
  }
  if (*(unsigned char *)(a1 + 41))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](v7, 0);
  }
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__STTelephonyStateProvider_signalStrengthChanged_info___block_invoke;
  block[3] = &unk_1E6AD2248;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __55__STTelephonyStateProvider_signalStrengthChanged_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v15 = v2;
  if (v2)
  {
    -[STTelephonyStateProvider _updateLastKnownNetworkCountryCodeInContext:withCTContext:](v3, v2, *(void **)(a1 + 40));
    id v4 = [*(id *)(a1 + 48) displayBars];
    uint64_t v5 = [v4 unsignedIntegerValue];

    id v6 = [*(id *)(a1 + 48) maxDisplayBars];
    uint64_t v7 = [v6 unsignedIntegerValue];

    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = v15;
    id v10 = v9;
    if (v8)
    {
      char v11 = [v9 subscriptionInfo];
      uint64_t v12 = [v11 signalStrengthBars];
      if (v12 != v5 || [v11 maxSignalStrengthBars] != v7)
      {
        [v11 setSignalStrengthBars:v5];
        [v11 setMaxSignalStrengthBars:v7];
        id v13 = objc_msgSend(NSString, "stringWithFormat:", @"updated signal strength from %lu to %lu", v12, v5);
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](v8, v13, v10);

        uint64_t v14 = -[STTelephonyStateProvider _subscriptionSlotForContext:](v8, v10);
        -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](v8, v14);
      }
    }
  }
  else
  {
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider signalStrengthChanged:info:]_block_invoke");
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v10, *(void **)(a1 + 40));
  }
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__STTelephonyStateProvider_operatorNameChanged_name___block_invoke;
  block[3] = &unk_1E6AD2248;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __53__STTelephonyStateProvider_operatorNameChanged_name___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = (id)v2;
  if (v2)
  {
    id v4 = [NSString stringWithFormat:@"got new operator name: %@", *(void *)(a1 + 48)];
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v4, *(void **)(a1 + 40));

    [v6 setCachedCTOperatorName:*(void *)(a1 + 48)];
    -[STTelephonyStateProvider _setOperatorName:inSubscriptionContext:](*(unsigned __int8 **)(a1 + 32), *(void **)(a1 + 48), v6);
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider operatorNameChanged:name:]_block_invoke");
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v5, *(void **)(a1 + 40));
  }
}

- (void)_setOperatorName:(void *)a3 inSubscriptionContext:
{
  v50[10] = *(id *)MEMORY[0x1E4F143B8];
  id v39 = a2;
  id v5 = a3;
  val = a1;
  if (!a1) {
    goto LABEL_40;
  }
  id v38 = v5;
  uint64_t v40 = [v5 subscriptionInfo];
  v36 = [v40 operatorName];
  id v6 = v39;
  id v37 = v38;
  id obj = [v37 statusBarImages];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = 0;
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:block count:16];
  if (!v8) {
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)v43;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v43 != v9) {
        objc_enumerationMutation(obj);
      }
      char v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      id v12 = [v11 objectForKey:@"CarrierName"];
      id v13 = [v11 objectForKey:@"AllowPrefixMatching"];
      int v14 = [v13 BOOLValue];

      id v15 = v6;
      id v16 = v12;
      id v17 = v16;
      if (v16 == v15)
      {

LABEL_16:
        [v11 objectForKey:@"StatusBarCarrierName"];
        id v7 = v15 = v7;
LABEL_17:

        goto LABEL_18;
      }
      if (!v6 || !v16)
      {

        goto LABEL_17;
      }
      id v18 = [v15 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F300FB98];

      id v19 = [v17 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F300FB98];

      if (v14) {
        uint64_t v20 = [v18 rangeOfString:v19 options:1];
      }
      else {
        uint64_t v20 = [v18 compare:v19 options:1];
      }
      BOOL v21 = v20 == 0;

      if (v21) {
        goto LABEL_16;
      }
LABEL_18:
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:block count:16];
  }
  while (v8);
LABEL_20:

  if (v7) {
    id v22 = v7;
  }
  else {
    id v22 = v6;
  }
  id v23 = v22;

  id v24 = v36;
  if ([v23 isEqualToString:v36])
  {
    -[STTelephonyStateProvider _cancelFakeServiceForContext:](v37);
  }
  else
  {
    if ([v36 length]) {
      BOOL v25 = [v23 length] != 0;
    }
    else {
      BOOL v25 = 1;
    }
    int v26 = val[20];
    uint64_t v27 = [v23 length];
    int v28 = v27 == 0;
    if (!v26 && !v27)
    {
      id v29 = [v40 SIMStatus];
      if ([v29 isEqual:*MEMORY[0x1E4F241F0]]) {
        int v28 = -[STTelephonyStateProvider _internalQueue_needsUserIdentificationModule]((uint64_t)val);
      }
      else {
        int v28 = 0;
      }
      id v24 = v36;
    }
    if ((v25 | v28))
    {
      -[STTelephonyStateProvider _reallySetOperatorName:inSubscriptionContext:]((uint64_t)val, v23, v37);
    }
    else
    {
      id v30 = v37;
      if (![v30 fakeServiceCanceled])
      {
        objc_initWeak(&location, val);
        *(void *)&long long v42 = 0;
        *((void *)&v42 + 1) = &v42;
        *(void *)&long long v43 = 0x2020000000;
        BYTE8(v43) = 0;
        dispatch_time_t v31 = dispatch_time(0, 10000000000);
        id v32 = (void *)*((void *)val + 4);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__STTelephonyStateProvider__startFakeServiceIfNecessaryForContext___block_invoke;
        block[3] = &unk_1E6AD2770;
        long long v49 = &v42;
        id v33 = v30;
        id v48 = v33;
        uint64_t v34 = v32;
        objc_copyWeak(v50, &location);
        dispatch_after(v31, v34, block);

        [v33 setFakeServiceCanceled:*((void *)&v42 + 1) + 24];
        objc_destroyWeak(v50);

        _Block_object_dispose(&v42, 8);
        objc_destroyWeak(&location);
      }

      id v24 = v36;
    }
  }

  id v5 = v38;
LABEL_40:
}

- (void)_reallySetOperatorName:(void *)a3 inSubscriptionContext:
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [v5 subscriptionInfo];
  id v7 = [v6 operatorName];
  if (([v10 isEqualToString:v7] & 1) == 0)
  {
    [v6 setOperatorName:v10];
    uint64_t v8 = [NSString stringWithFormat:@"operatorName changed from '%@' to '%@'", v7, v10];
    -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](a1, v8, v5);
  }
  -[STTelephonyStateProvider _cancelFakeServiceForContext:](v5);
  uint64_t v9 = -[STTelephonyStateProvider _subscriptionSlotForContext:](a1, v5);
  -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, v9);
}

void __67__STTelephonyStateProvider__startFakeServiceIfNecessaryForContext___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) setFakeServiceCanceled:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[STTelephonyStateProvider _stopFakeServiceForContext:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
  }
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke;
  block[3] = &unk_1E6AD2248;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 56);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke_2;
  v5[3] = &unk_1E6AD2518;
  v5[4] = v2;
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 copyRegistrationStatus:v6 completion:v5];
}

void __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      id v7 = *(NSObject **)(v6 + 32);
    }
    else {
      id v7 = 0;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke_3;
    v8[3] = &unk_1E6AD2540;
    void v8[4] = v6;
    id v9 = *(id *)(a1 + 40);
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v7, v8);
  }
}

void __56__STTelephonyStateProvider_displayStatusChanged_status___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 32);
  id v57 = (id)v2;
  if (v2)
  {
    id v4 = *(void **)(a1 + 48);
    id v5 = [*(id *)(a1 + 56) registrationDisplayStatus];
    uint64_t v6 = [*(id *)(a1 + 56) isRegistrationForcedHome];
    char v7 = [*(id *)(a1 + 56) changedDueToSimRemoval];
    unsigned int v54 = [*(id *)(a1 + 56) isSatelliteSystem];
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = v57;
    if (v3)
    {
      long long v53 = v5;
      id v10 = v5;
      id v11 = v4;
      -[STTelephonyStateProvider _updateLastKnownNetworkCountryCodeInContext:withCTContext:]((uint64_t)v3, v9, v8);
      unint64_t v52 = STTelephonyRegistrationStatusForStatus(v10);
      id v12 = v11;
      id v13 = v10;
      id v55 = v9;
      id v14 = v9;
      id v15 = [v14 subscriptionInfo];
      [v14 cachedCTRegistrationCellularStatus];
      v56 = unint64_t v16 = 0x1E4F29000uLL;
      if (!v56 || ([v56 isEqualToString:v12] & 1) == 0)
      {
        unint64_t v17 = STTelephonyRegistrationStatusForStatus(v12);
        if (v17 == 2 || [v15 cellularRegistrationStatus] != 2)
        {
          -[STTelephonyStateProvider _setCellRegistrationStatus:inSubscriptionContext:]((uint64_t)v3, v17, v14);
        }
        else
        {
          id v18 = v14;
          if (![v18 fakeCellularRegistrationCanceled])
          {
            objc_initWeak(location, v3);
            uint64_t v65 = 0;
            v66 = &v65;
            uint64_t v67 = 0x2020000000;
            char v68 = 0;
            dispatch_time_t when = dispatch_time(0, 10000000000);
            id v19 = (void *)v3[4];
            uint64_t block = MEMORY[0x1E4F143A8];
            uint64_t v59 = 3221225472;
            v60 = __80__STTelephonyStateProvider__startFakeCellularRegistrationIfNecessaryForContext___block_invoke;
            v61 = &unk_1E6AD2770;
            id v63 = &v65;
            id v49 = v18;
            id v20 = v18;
            id v62 = v20;
            BOOL v21 = v19;
            objc_copyWeak(&v64, location);
            dispatch_after(when, v21, &block);

            [v20 setFakeCellularRegistrationCanceled:v66 + 3];
            objc_destroyWeak(&v64);

            _Block_object_dispose(&v65, 8);
            objc_destroyWeak(location);
            unint64_t v16 = 0x1E4F29000;
            id v18 = v49;
          }
        }
        [v14 setCachedCTRegistrationCellularStatus:v12];
        id v22 = [*(id *)(v16 + 24) stringWithFormat:@"cached cell status changed from %@ to %@", v56, v12];
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)v3, v22, v14);
      }
      id v23 = [v14 cachedCTRegistrationDisplayStatus];
      id v24 = v23;
      if (!v23 || ([v23 isEqualToString:v13] & 1) == 0)
      {
        [v14 setCachedCTRegistrationDisplayStatus:v13];
        BOOL v25 = [*(id *)(v16 + 24) stringWithFormat:@"cached display status changed from %@ to %@", v24, v13];
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)v3, v25, v14);
      }
      if (v6 != [v15 isRegisteredWithoutCellular])
      {
        [v15 setRegisteredWithoutCellular:v6];
        dispatch_time_t whena = (dispatch_time_t)v12;
        id v26 = v13;
        uint64_t v27 = v15;
        char v28 = v7;
        unint64_t v29 = v16;
        id v30 = *(void **)(v16 + 24);
        dispatch_time_t v31 = NSStringFromBOOL();
        id v32 = NSStringFromBOOL();
        id v33 = [v30 stringWithFormat:@"forcedHome status changed from %@ to %@", v31, v32];
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)v3, v33, v14);

        unint64_t v16 = v29;
        char v7 = v28;
        id v15 = v27;
        id v13 = v26;
        id v12 = (id)whena;
      }
      if (v52 == 2)
      {
        -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:](v3, 2uLL, v14);
        id v9 = v55;
        uint64_t v34 = v54;
      }
      else
      {
        id v35 = [v14 subscriptionInfo];
        id v9 = v55;
        uint64_t v34 = v54;
        switch([v35 registrationStatus])
        {
          case 0:
            goto LABEL_27;
          case 1:
            if (![v14 isPretendingToSearch]) {
              goto LABEL_21;
            }
            if (v52 != 1) {
              break;
            }
            goto LABEL_27;
          case 2:
            if (v7) {
              goto LABEL_27;
            }
            if (-[STTelephonyStateProvider _internalQueue_needsUserIdentificationModule]((uint64_t)v3))
            {
              [v35 SIMStatus];
              v41 = unint64_t v40 = v16;
              int v42 = [v41 isEqual:*MEMORY[0x1E4F241F0]];

              unint64_t v16 = v40;
              if (v42) {
                goto LABEL_27;
              }
            }
            id v43 = v14;
            if (![v43 fakeRegistrationCanceled])
            {
              unint64_t v44 = v16;
              objc_initWeak(location, v3);
              uint64_t v65 = 0;
              v66 = &v65;
              uint64_t v67 = 0x2020000000;
              char v68 = 0;
              dispatch_time_t v45 = dispatch_time(0, 10000000000);
              uint64_t v46 = (void *)v3[4];
              uint64_t block = MEMORY[0x1E4F143A8];
              uint64_t v59 = 3221225472;
              v60 = __72__STTelephonyStateProvider__startFakeRegistrationIfNecessaryForContext___block_invoke;
              v61 = &unk_1E6AD2770;
              id v63 = &v65;
              id v47 = v43;
              id v62 = v47;
              id v48 = v46;
              objc_copyWeak(&v64, location);
              dispatch_after(v45, v48, &block);

              [v47 setFakeRegistrationCanceled:v66 + 3];
              objc_destroyWeak(&v64);

              _Block_object_dispose(&v65, 8);
              objc_destroyWeak(location);
              id v9 = v55;
              unint64_t v16 = v44;
            }

            break;
          case 3:
          case 4:
LABEL_21:
            if (v52 == 1) {
LABEL_27:
            }
              -[STTelephonyStateProvider _updateRegistrationNowInSubscriptionContext:](v3, v14);
            else {
              -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:](v3, v52, v14);
            }
            break;
          default:
            break;
        }
      }
      id v36 = v14;
      unsigned int v37 = [v36 isSatelliteSystem];
      if (v34 != v37)
      {
        unsigned int v38 = v37;
        [v36 setIsSatelliteSystem:v34];
        -[STTelephonyStateProvider _updateDataConnectionTypeForContext:]((uint64_t)v3, v36);
        id v39 = objc_msgSend(*(id *)(v16 + 24), "stringWithFormat:", @"satellite system changed from %b to %b", v38, v34);
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:]((uint64_t)v3, v39, v36);
      }
      id v5 = v53;
    }
  }
  else
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider displayStatusChanged:status:]_block_invoke_3");
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:]((uint64_t)v3, v5, *(void **)(a1 + 40));
  }
}

- (void)_setCellRegistrationStatus:(void *)a3 inSubscriptionContext:
{
  id v13 = a3;
  if (a1)
  {
    id v5 = [v13 subscriptionInfo];
    uint64_t v6 = [v5 cellularRegistrationStatus];
    if (v6 != a2)
    {
      unint64_t v7 = v6;
      [v5 setCellularRegistrationStatus:a2];
      uint64_t v8 = NSString;
      id v9 = STTelephonyRegistrationStatusDebugName(v7);
      id v10 = STTelephonyRegistrationStatusDebugName(a2);
      id v11 = [v8 stringWithFormat:@"cell status changed from %@ to %@", v9, v10];
      -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](a1, v11, v13);

      uint64_t v12 = -[STTelephonyStateProvider _subscriptionSlotForContext:](a1, v13);
      -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](a1, v12);
    }
    -[STTelephonyStateProvider _cancelFakeCellularRegistrationForContext:](v13);
  }
}

void __72__STTelephonyStateProvider__startFakeRegistrationIfNecessaryForContext___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) setFakeRegistrationCanceled:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[STTelephonyStateProvider _updateRegistrationNowInSubscriptionContext:](WeakRetained, *(void **)(a1 + 32));
  }
}

void __80__STTelephonyStateProvider__startFakeCellularRegistrationIfNecessaryForContext___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) setFakeCellularRegistrationCanceled:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v2 = [*(id *)(a1 + 32) cachedCTRegistrationCellularStatus];
    unint64_t v3 = STTelephonyRegistrationStatusForStatus(v2);
    -[STTelephonyStateProvider _setCellRegistrationStatus:inSubscriptionContext:]((uint64_t)WeakRetained, v3, *(void **)(a1 + 32));
  }
}

- (void)networkReselectionNeeded:(id)a3
{
}

- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5
{
  if (a4) {
    -[STTelephonyStateProvider _handleNetworkReselectionNeeded:forCTContext:]((uint64_t)self, 0, a3);
  }
}

void __73__STTelephonyStateProvider__handleNetworkReselectionNeeded_forCTContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v10 = (id)v2;
  if (v2)
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);
    id v5 = *(id *)(a1 + 40);
    if (v3)
    {
      uint64_t v6 = [v10 subscriptionInfo];
      if ((v4 != 0) != [v6 isNetworkReselectionNeeded])
      {
        [v6 setNetworkReselectionNeeded:v4 != 0];
        unint64_t v7 = NSString;
        uint64_t v8 = NSStringFromBOOL();
        id v9 = [v7 stringWithFormat:@"Set network reselection needed: %@", v8];
        -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v9, v5);

        -[STTelephonyStateProvider _internalQueue_notifyObserversOfSubscriptionInfoChangeForSlot:](v3, [v5 slotID]);
      }
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider _handleNetworkReselectionNeeded:forCTContext:]_block_invoke");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v5, *(void **)(a1 + 40));
  }
}

- (void)rejectCauseCodeChanged:(id)a3 causeCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__STTelephonyStateProvider_rejectCauseCodeChanged_causeCode___block_invoke;
  block[3] = &unk_1E6AD2248;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __61__STTelephonyStateProvider_rejectCauseCodeChanged_causeCode___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v11 = (id)v2;
  if (v2)
  {
    uint64_t v4 = [*(id *)(a1 + 48) integerValue];
    id v5 = v11;
    id v6 = v5;
    if (v3)
    {
      id v7 = [v5 subscriptionInfo];
      uint64_t v8 = [v7 registrationRejectionCauseCode];
      if (v8 != v4)
      {
        uint64_t v9 = v8;
        [v7 setRegistrationRejectionCauseCode:v4];
        id v10 = objc_msgSend(NSString, "stringWithFormat:", @"Registration rejection cause code changed from %ld to %ld", v9, v4);
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](v3, v10, v6);
      }
    }
  }
  else
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider rejectCauseCodeChanged:causeCode:]_block_invoke");
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v6, *(void **)(a1 + 40));
  }
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__STTelephonyStateProvider_simStatusDidChange_status___block_invoke;
  block[3] = &unk_1E6AD2248;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __54__STTelephonyStateProvider_simStatusDidChange_status___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = v2;
  if (v2)
  {
    -[STTelephonyStateProvider _setSIMStatus:inSubscriptionContext:](v3, *(void **)(a1 + 48), v2);
  }
  else
  {
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider simStatusDidChange:status:]_block_invoke");
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:]((uint64_t)v3, v4, *(void **)(a1 + 40));
  }
}

- (void)servingNetworkChanged:(id)a3
{
  id v4 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__STTelephonyStateProvider_servingNetworkChanged___block_invoke;
  v7[3] = &unk_1E6AD1EE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __50__STTelephonyStateProvider_servingNetworkChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = v2;
  if (v2)
  {
    id v4 = v2;
    if (!v3) {
      goto LABEL_6;
    }
    -[STTelephonyStateProvider _updateLastKnownNetworkCountryCodeInContext:withCTContext:](v3, v2, *(void **)(a1 + 40));
  }
  else
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider servingNetworkChanged:]_block_invoke");
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v5, *(void **)(a1 + 40));
  }
  id v4 = v7;
LABEL_6:
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)currentDataSimChanged:(id)a3
{
  id v4 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__STTelephonyStateProvider_currentDataSimChanged___block_invoke;
  v7[3] = &unk_1E6AD1EE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __50__STTelephonyStateProvider_currentDataSimChanged___block_invoke(uint64_t a1)
{
  -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](*(void *)(a1 + 32), @"current data SIM changed to this slot", *(void **)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  -[STTelephonyStateProvider _updateDataConnectedSubscriptionContextForCTContext:](v2, v3);
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__STTelephonyStateProvider_dataStatus_dataStatusInfo___block_invoke;
  block[3] = &unk_1E6AD2248;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __54__STTelephonyStateProvider_dataStatus_dataStatusInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v21 = v2;
  if (v2)
  {
    id v4 = *(void **)(a1 + 48);
    id v5 = v2;
    if (v3)
    {
      id v6 = v4;
      int v7 = [v6 indicator];
      int v8 = [v6 indicatorOverride];
      int v9 = [v6 radioTechnology];

      uint64_t v10 = STTelephonyDataConnectionTypeForIndicatorNameAndRadioTechnology(v7, v9);
      uint64_t v11 = STTelephonyDataConnectionTypeForIndicatorNameAndRadioTechnology(v8, v9);
      unint64_t v12 = v11;
      uint64_t v13 = v11 - 11;
      if (unint64_t)(v11 - 11) < 6 && ((0x2Fu >> v13))
      {
        unint64_t v12 = qword_1D833D240[v13];
      }
      else if (v10 != 7 || (unint64_t)(v11 - 7) >= 4)
      {
        if (v8 == 7 && (v10 & 0x1E) == 4) {
          unint64_t v12 = 6;
        }
        else {
          unint64_t v12 = v10;
        }
      }
      uint64_t v15 = [v5 modemDataConnectionType];
      if (v15 != v12)
      {
        unint64_t v16 = v15;
        [v5 setModemDataConnectionType:v12];
        unint64_t v17 = NSString;
        id v18 = STTelephonyDataConnectionTypeDebugName(v16);
        id v19 = STTelephonyDataConnectionTypeDebugName(v12);
        id v20 = [v17 stringWithFormat:@"_updateModemDataConnectionTypeWithCTInfo: - cellular data connection changed from %@ to %@", v18, v19];
        -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](v3, v20, v5);
      }
      -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](v3, v5);
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider dataStatus:dataStatusInfo:]_block_invoke");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v5, *(void **)(a1 + 40));
  }
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self)
  {
    id v6 = objc_alloc_init(STMutableTelephonyCarrierBundleInfo);
    int v7 = self->_coreTelephonyClient;
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
    uint64_t v33 = 0;
    int v9 = (void *)[(CoreTelephonyClient *)v7 copyCarrierBundleValueWithDefault:v5 key:@"DataIndicatorOverrideForLTE" bundleType:v8 error:&v33];
    if (!v33)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = [v9 isEqualToString:@"4G"];
      }
      else {
        uint64_t v10 = 0;
      }
      [(STMutableTelephonyCarrierBundleInfo *)v6 setLTEConnectionShows4G:v10];
    }
    uint64_t v32 = 0;
    uint64_t v11 = (void *)[(CoreTelephonyClient *)v7 copyCarrierBundleValueWithDefault:v5 key:@"UserCanReinitiateActivation" bundleType:v8 error:&v32];
    uint64_t v12 = v32;

    if (!v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v13 = [v11 BOOLValue] ^ 1;
      }
      else {
        uint64_t v13 = 0;
      }
      [(STMutableTelephonyCarrierBundleInfo *)v6 setReinitiatingActivationDisabled:v13];
    }
    uint64_t v31 = 0;
    id v14 = (void *)[(CoreTelephonyClient *)v7 copyCarrierBundleValueWithDefault:v5 key:@"CustomerServicePhoneNumber" bundleType:v8 error:&v31];
    uint64_t v15 = v31;

    if (!v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(STMutableTelephonyCarrierBundleInfo *)v6 setCustomerServicePhoneNumber:v14];
      }
    }
    uint64_t v30 = 0;
    unint64_t v16 = (void *)[(CoreTelephonyClient *)v7 copyCarrierBundleValueWithDefault:v5 key:@"DisabledApplications" bundleType:v8 error:&v30];
    uint64_t v17 = v30;

    if (!v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(STMutableTelephonyCarrierBundleInfo *)v6 setDisabledApplicationIDs:v16];
      }
    }
    uint64_t v29 = 0;
    id v18 = (void *)[(CoreTelephonyClient *)v7 copyCarrierBundleValueWithDefault:v5 key:@"CarrierName" bundleType:v8 error:&v29];
    uint64_t v19 = v29;

    if (!v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(STMutableTelephonyCarrierBundleInfo *)v6 setCarrierName:v18];
      }
    }
    uint64_t v28 = 0;
    id v20 = (void *)[(CoreTelephonyClient *)v7 copyCarrierBundleValueWithDefault:v5 key:@"HomeCountryCode" bundleType:v8 error:&v28];
    uint64_t v21 = v28;

    if (!v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(STMutableTelephonyCarrierBundleInfo *)v6 setHomeCountryCode:v20];
      }
    }
    -[STMutableTelephonyCarrierBundleInfo setSuppressSOSOnlyWithLimitedService:](v6, "setSuppressSOSOnlyWithLimitedService:", -[STTelephonyStateProvider _backgroundQueryQueue_shouldSuppressSOSOnlyWithLimitedServiceForCTContext:](self->_coreTelephonyClient, v5));

    internalQueue = self->_internalQueue;
  }
  else
  {

    id v6 = 0;
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__STTelephonyStateProvider_carrierBundleChange___block_invoke;
  block[3] = &unk_1E6AD2248;
  void block[4] = self;
  id v26 = v5;
  uint64_t v27 = v6;
  id v23 = v6;
  id v24 = v5;
  dispatch_async(internalQueue, block);
}

void __48__STTelephonyStateProvider_carrierBundleChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v14 = (id)v2;
  if (v2)
  {
    id v4 = *(id *)(a1 + 48);
    id v5 = v14;
    if (v3)
    {
      if (*(void *)(v3 + 104) != -1)
      {
        *(void *)(v3 + 104) = -1;
        id v6 = STSystemStatusLogTelephonyState();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1D8320000, v6, OS_LOG_TYPE_DEFAULT, "STTelephonyStateProvider resetting _needsUserIdentificationModule (for carrier bundle change)", buf, 2u);
        }
      }
      int v7 = (void *)[v4 mutableCopy];
      [v5 setCarrierBundleInfo:v7];

      -[STTelephonyStateProvider _logSubscriptionEvent:forContext:](v3, @"carrier bundle changed", v5);
      uint64_t v8 = -[STTelephonyStateProvider _subscriptionSlotForContext:](v3, v5);
      id v9 = *(id *)(v3 + 24);
      uint64_t v10 = [v9 setRepresentation];

      uint64_t v11 = *(NSObject **)(v3 + 40);
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __91__STTelephonyStateProvider__internalQueue_notifyObserversOfCarrierBundleInfoChangeForSlot___block_invoke;
      id v18 = &unk_1E6AD2110;
      id v19 = v10;
      uint64_t v20 = v3;
      uint64_t v21 = v8;
      id v12 = v10;
      dispatch_async(v11, buf);

      -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](v3, v5);
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider carrierBundleChange:]_block_invoke");
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v3, v13, *(void **)(a1 + 40));
  }
}

- (void)operatorBundleChange:(id)a3
{
  id v4 = a3;
  [(STTelephonyStateProvider *)self carrierBundleChange:v4];
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__STTelephonyStateProvider_operatorBundleChange___block_invoke;
  v7[3] = &unk_1E6AD1EE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __49__STTelephonyStateProvider_operatorBundleChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:2];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    id v4 = *(void **)(v3 + 56);
  }
  else {
    id v4 = 0;
  }
  id v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__STTelephonyStateProvider_operatorBundleChange___block_invoke_2;
  v6[3] = &unk_1E6AD2798;
  v6[4] = v3;
  id v7 = v5;
  [v4 copyCarrierBundleValueWithDefault:v7 key:@"StatusBarImages" bundleType:v2 completion:v6];
}

void __49__STTelephonyStateProvider_operatorBundleChange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v17;
        while (2)
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_15;
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        id v12 = *(NSObject **)(v11 + 32);
      }
      else {
        id v12 = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__STTelephonyStateProvider_operatorBundleChange___block_invoke_3;
      block[3] = &unk_1E6AD2248;
      void block[4] = v11;
      id v14 = *(id *)(a1 + 40);
      id v15 = v6;
      dispatch_async(v12, block);

LABEL_15:
    }
  }
}

void __49__STTelephonyStateProvider_operatorBundleChange___block_invoke_3(uint64_t a1)
{
  -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v2 = (void *)[*(id *)(a1 + 48) copy];
    [v6 setStatusBarImages:v2];

    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](*(void *)(a1 + 32), @"operator bundle changed", *(void **)(a1 + 40));
    uint64_t v3 = *(unsigned __int8 **)(a1 + 32);
    id v4 = [v6 cachedCTOperatorName];
    -[STTelephonyStateProvider _setOperatorName:inSubscriptionContext:](v3, v4, v6);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider operatorBundleChange:]_block_invoke_3");
    -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v5, v4, *(void **)(a1 + 40));
  }
}

- (void)suppServicesEvent:(id)a3 event:(int)a4 settingsType:(int)a5 data:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__STTelephonyStateProvider_suppServicesEvent_event_settingsType_data___block_invoke;
  v15[3] = &unk_1E6AD20E8;
  int v18 = a4;
  int v19 = a5;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(internalQueue, v15);
}

void __70__STTelephonyStateProvider_suppServicesEvent_event_settingsType_data___block_invoke(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 56) | 4) == 5 && *(_DWORD *)(a1 + 60) == 2)
  {
    -[STTelephonyStateProvider _subscriptionContextForCTContext:](*(char **)(a1 + 32), *(void **)(a1 + 40));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      uint64_t v2 = [*(id *)(a1 + 48) active];
      if ([v2 BOOLValue]) {
        unint64_t v3 = 1;
      }
      else {
        unint64_t v3 = 2;
      }

      -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:](*(void *)(a1 + 32), v3, v6);
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s -- did not have matching context", "-[STTelephonyStateProvider suppServicesEvent:event:settingsType:data:]_block_invoke");
      -[STTelephonyStateProvider _logSubscriptionEvent:forCTContext:](v4, v5, *(void **)(a1 + 40));
    }
  }
}

void __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v8 = *(NSObject **)(v7 + 32);
    }
    else {
      uint64_t v8 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke_2;
    block[3] = &unk_1E6AD2248;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    id v13 = v9;
    uint64_t v14 = v10;
    id v15 = v11;
    dispatch_async(v8, block);
  }
}

void __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) subscriptionsInUse];
  uint64_t v3 = -[STTelephonyStateProvider _subscriptionSlotForContext:](*(void *)(a1 + 40), *(void **)(a1 + 48));
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke_3;
    v7[3] = &__block_descriptor_40_e48_B32__0__CTXPCServiceSubscriptionContext_8Q16_B24l;
    v7[4] = v3;
    uint64_t v4 = [v2 indexOfObjectPassingTest:v7];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = [v2 objectAtIndex:v4];
      if (v5)
      {
        id v6 = v5;
        -[STTelephonyStateProvider _queryCallForwardingStateForCTContext:](*(void *)(a1 + 40), v5);
      }
    }
  }
}

BOOL __69__STTelephonyStateProvider__updateCallForwardingIndicatorForContext___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 slotID] == *(void *)(a1 + 32);
}

- (void)airplaneModeChanged
{
  if (self) {
    radiosPreferences = self->_radiosPreferences;
  }
  else {
    radiosPreferences = 0;
  }
  uint64_t v4 = radiosPreferences;
  [(RadiosPreferences *)v4 refresh];
  char v5 = [(RadiosPreferences *)v4 airplaneMode];
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__STTelephonyStateProvider_airplaneModeChanged__block_invoke;
  v7[3] = &unk_1E6AD2808;
  char v8 = v5;
  v7[4] = self;
  dispatch_async(internalQueue, v7);
}

void __47__STTelephonyStateProvider_airplaneModeChanged__block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (v1 != *(unsigned __int8 *)(v2 + 20))
    {
      *(unsigned char *)(v2 + 20) = v1;
      uint64_t v3 = *(void *)(a1 + 32);
      if (v3)
      {
        int v4 = *(unsigned __int8 *)(a1 + 40);
        id v5 = *(id *)(v3 + 64);
        id v6 = *(id *)(v3 + 72);
        if (v4)
        {
          -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:](v3, 0, v5);
          if ([v5 isFakingService]) {
            -[STTelephonyStateProvider _stopFakeServiceForContext:](v3, v5);
          }
          -[STTelephonyStateProvider _setCallForwardingIndicator:inSubscriptionContext:](v3, 0, v6);
          if ([v6 isFakingService]) {
            -[STTelephonyStateProvider _stopFakeServiceForContext:](v3, v6);
          }
        }
        else
        {
          objc_initWeak(&location, (id)v3);
          uint64_t v7 = [v5 cachedCTRegistrationDisplayStatus];
          unint64_t v8 = STTelephonyRegistrationStatusForStatus(v7);

          if (v8 - 3 > 0xFFFFFFFFFFFFFFFDLL)
          {
            id v12 = [v5 subscriptionInfo];
            uint64_t v13 = [v12 registrationStatus];

            [v5 setPretendingToSearch:0];
            -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:]((void *)v3, v8, v5);
            if (v13 == v8) {
              -[STTelephonyStateProvider _updateCallForwardingIndicatorForContext:]((void *)v3, v5);
            }
          }
          else
          {
            [v5 setPretendingToSearch:1];
            -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:]((void *)v3, 1uLL, v5);
            dispatch_time_t v9 = dispatch_time(0, 15000000000);
            uint64_t v10 = *(void **)(v3 + 32);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __51__STTelephonyStateProvider__airplaneModeDidChange___block_invoke;
            block[3] = &unk_1E6AD24F0;
            id v25 = v5;
            id v11 = v10;
            objc_copyWeak(&v26, &location);
            dispatch_after(v9, v11, block);

            objc_destroyWeak(&v26);
          }
          uint64_t v14 = [v6 cachedCTRegistrationDisplayStatus];
          unint64_t v15 = STTelephonyRegistrationStatusForStatus(v14);

          if (v15 - 3 > 0xFFFFFFFFFFFFFFFDLL)
          {
            int v19 = [v6 subscriptionInfo];
            uint64_t v20 = [v19 registrationStatus];

            [v6 setPretendingToSearch:0];
            -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:]((void *)v3, v15, v6);
            if (v20 == v15) {
              -[STTelephonyStateProvider _updateCallForwardingIndicatorForContext:]((void *)v3, v6);
            }
          }
          else
          {
            [v6 setPretendingToSearch:1];
            -[STTelephonyStateProvider _setRegistrationStatus:inSubscriptionContext:]((void *)v3, 1uLL, v6);
            dispatch_time_t v16 = dispatch_time(0, 15000000000);
            id v17 = *(void **)(v3 + 32);
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __51__STTelephonyStateProvider__airplaneModeDidChange___block_invoke_2;
            v21[3] = &unk_1E6AD24F0;
            id v22 = v6;
            int v18 = v17;
            objc_copyWeak(&v23, &location);
            dispatch_after(v16, v18, v21);

            objc_destroyWeak(&v23);
          }
          objc_destroyWeak(&location);
        }
        -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](v3, v5);
        -[STTelephonyStateProvider _updateDataConnectionTypeForContext:](v3, v6);
      }
    }
  }
}

- (void)stateChanged:(id)a3
{
  id v4 = a3;
  if (self) {
    observerQueue = self->_observerQueue;
  }
  else {
    observerQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__STTelephonyStateProvider_stateChanged___block_invoke;
  v7[3] = &unk_1E6AD1EE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

void __41__STTelephonyStateProvider_stateChanged___block_invoke(uint64_t a1)
{
}

- (NSString)description
{
  return (NSString *)[(STTelephonyStateProvider *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STTelephonyStateProvider *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(STTelephonyStateProvider *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = v3;
  if (self)
  {
    id v5 = (id)[v3 appendBool:self->_cachedDualSIMEnabled withName:@"dualSIMEnabled"];
    slot1SubscriptionContext = self->_slot1SubscriptionContext;
  }
  else
  {
    id v13 = (id)[v3 appendBool:0 withName:@"dualSIMEnabled"];
    slot1SubscriptionContext = 0;
  }
  uint64_t v7 = [(STTelephonySubscriptionContext *)slot1SubscriptionContext subscriptionInfo];
  id v8 = [v7 succinctDescription];
  [v4 appendString:v8 withName:@"slot1SubscriptionInfo"];

  if (self) {
    slot2SubscriptionContext = self->_slot2SubscriptionContext;
  }
  else {
    slot2SubscriptionContext = 0;
  }
  uint64_t v10 = [(STTelephonySubscriptionContext *)slot2SubscriptionContext subscriptionInfo];
  id v11 = [v10 succinctDescription];
  [v4 appendString:v11 withName:@"slot2SubscriptionInfo"];

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STTelephonyStateProvider *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__STTelephonyStateProvider_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AD1EE0;
  id v7 = v6;
  id v11 = v7;
  id v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __66__STTelephonyStateProvider_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    BOOL v4 = *(unsigned __int8 *)(v3 + 17) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = (id)[v2 appendBool:v4 withName:@"dualSIMEnabled"];
  id v7 = *(void **)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  if (v6) {
    id v6 = (void *)v6[8];
  }
  id v8 = v6;
  dispatch_time_t v9 = [v8 subscriptionInfo];
  id v10 = (id)[v7 appendObject:v9 withName:@"slot1SubscriptionInfo"];

  id v12 = *(void **)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  if (v11) {
    id v11 = (void *)v11[9];
  }
  unint64_t v15 = v11;
  id v13 = [v15 subscriptionInfo];
  id v14 = (id)[v12 appendObject:v13 withName:@"slot2SubscriptionInfo"];
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = self;
  if (self)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F4F718];
    id v5 = a3;
    id v6 = [v4 builderWithObject:v3];
    [v6 setUseDebugDescription:1];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __71__STTelephonyStateProvider_debugDescriptionBuilderWithMultilinePrefix___block_invoke;
    id v13 = &unk_1E6AD1EE0;
    id v7 = v6;
    id v14 = v7;
    unint64_t v15 = v3;
    [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:&v10];

    uint64_t v3 = (STTelephonyStateProvider *)v7;
  }
  id v8 = [(STTelephonyStateProvider *)v3 build];

  return v8;
}

void __71__STTelephonyStateProvider_debugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    BOOL v4 = *(unsigned __int8 *)(v3 + 19) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = (id)[v2 appendBool:v4 withName:@"containsCellularRadio"];
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "hasCellularTelephony"), @"hasCellularTelephony");
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    BOOL v8 = *(unsigned __int8 *)(v7 + 18) != 0;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = (id)[*(id *)(a1 + 32) appendBool:v8 withName:@"radioModuleDead"];
  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUsingStewieForSOS"), @"usingStewieForSOS");
  id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isInactiveSOSEnabled"), @"inactiveSOSEnabled");
  id v13 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    uint64_t v14 = *(void *)(v12 + 88);
  }
  else {
    uint64_t v14 = 0;
  }
  unint64_t v15 = STTelephonyCachedBooleanDebugName(v14);
  [v13 appendString:v15 withName:@"suppressesCellDataIndicator"];

  id v17 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    uint64_t v18 = *(void *)(v16 + 96);
  }
  else {
    uint64_t v18 = 0;
  }
  int v19 = STTelephonyCachedBooleanDebugName(v18);
  [v17 appendString:v19 withName:@"suppressesCellIndicators"];

  uint64_t v20 = *(void *)(a1 + 40);
  if (v20) {
    BOOL v21 = *(unsigned __int8 *)(v20 + 17) != 0;
  }
  else {
    BOOL v21 = 0;
  }
  id v22 = (id)[*(id *)(a1 + 32) appendBool:v21 withName:@"dualSIMEnabled"];
  uint64_t v23 = *(void *)(a1 + 40);
  if (v23) {
    uint64_t v24 = *(void *)(v23 + 64);
  }
  else {
    uint64_t v24 = 0;
  }
  id v25 = (id)[*(id *)(a1 + 32) appendObject:v24 withName:@"slot1SubscriptionContext"];
  uint64_t v26 = *(void *)(a1 + 40);
  if (v26) {
    uint64_t v27 = *(void *)(v26 + 72);
  }
  else {
    uint64_t v27 = 0;
  }
  id v28 = (id)[*(id *)(a1 + 32) appendObject:v27 withName:@"slot2SubscriptionContext"];
  uint64_t v29 = *(void *)(a1 + 40);
  if (v29) {
    uint64_t v30 = *(void *)(v29 + 80);
  }
  else {
    uint64_t v30 = 0;
  }
  [*(id *)(a1 + 32) appendArraySection:v30 withName:@"cachedCTContexts" skipIfEmpty:0];
  uint64_t v32 = *(void **)(a1 + 32);
  uint64_t v31 = *(void *)(a1 + 40);
  if (v31) {
    uint64_t v33 = *(void *)(v31 + 104);
  }
  else {
    uint64_t v33 = 0;
  }
  STTelephonyCachedBooleanDebugName(v33);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  [v32 appendString:v34 withName:@"needsUserIdentificationModule"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stewieState, 0);
  objc_storeStrong((id *)&self->_stewieStateMonitor, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_cachedCTContexts, 0);
  objc_storeStrong((id *)&self->_slot2SubscriptionContext, 0);
  objc_storeStrong((id *)&self->_slot1SubscriptionContext, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_backgroundQueryQueue, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end