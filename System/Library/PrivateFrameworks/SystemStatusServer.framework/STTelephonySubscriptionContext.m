@interface STTelephonySubscriptionContext
- (BOOL)fakeCellularRegistrationCanceled;
- (BOOL)fakeRegistrationCanceled;
- (BOOL)fakeServiceCanceled;
- (BOOL)isFakingCellularRegistration;
- (BOOL)isFakingRegistration;
- (BOOL)isFakingService;
- (BOOL)isPretendingToSearch;
- (BOOL)isSatelliteSystem;
- (NSArray)statusBarImages;
- (NSString)cachedCTOperatorName;
- (NSString)cachedCTRegistrationCellularStatus;
- (NSString)cachedCTRegistrationDisplayStatus;
- (NSString)debugDescription;
- (NSString)description;
- (STMutableTelephonyCarrierBundleInfo)carrierBundleInfo;
- (STMutableTelephonyMobileEquipmentInfo)mobileEquipmentInfo;
- (STMutableTelephonySubscriptionInfo)subscriptionInfo;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)modemDataConnectionType;
- (void)setCachedCTOperatorName:(id)a3;
- (void)setCachedCTRegistrationCellularStatus:(id)a3;
- (void)setCachedCTRegistrationDisplayStatus:(id)a3;
- (void)setCarrierBundleInfo:(id)a3;
- (void)setFakeCellularRegistrationCanceled:(BOOL *)a3;
- (void)setFakeRegistrationCanceled:(BOOL *)a3;
- (void)setFakeServiceCanceled:(BOOL *)a3;
- (void)setIsSatelliteSystem:(BOOL)a3;
- (void)setMobileEquipmentInfo:(id)a3;
- (void)setModemDataConnectionType:(unint64_t)a3;
- (void)setPretendingToSearch:(BOOL)a3;
- (void)setStatusBarImages:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
@end

@implementation STTelephonySubscriptionContext

- (STMutableTelephonySubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (STMutableTelephonyCarrierBundleInfo)carrierBundleInfo
{
  return self->_carrierBundleInfo;
}

- (BOOL)isFakingService
{
  v2 = [(STTelephonySubscriptionContext *)self fakeServiceCanceled];
  if (v2) {
    LOBYTE(v2) = !*v2;
  }
  return (char)v2;
}

- (BOOL)isFakingRegistration
{
  v2 = [(STTelephonySubscriptionContext *)self fakeRegistrationCanceled];
  if (v2) {
    LOBYTE(v2) = !*v2;
  }
  return (char)v2;
}

- (BOOL)isFakingCellularRegistration
{
  v2 = [(STTelephonySubscriptionContext *)self fakeCellularRegistrationCanceled];
  if (v2) {
    LOBYTE(v2) = !*v2;
  }
  return (char)v2;
}

- (NSString)description
{
  return (NSString *)[(STTelephonySubscriptionContext *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STTelephonySubscriptionContext *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STTelephonySubscriptionContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(STTelephonySubscriptionContext *)self subscriptionInfo];
  v5 = [v4 succinctDescription];
  [v3 appendString:v5 withName:@"subscriptionInfo"];

  v6 = STTelephonyDataConnectionTypeDebugName([(STTelephonySubscriptionContext *)self modemDataConnectionType]);
  [v3 appendString:v6 withName:@"modemDataConnectionType"];

  v7 = [(STTelephonySubscriptionContext *)self cachedCTOperatorName];
  [v3 appendString:v7 withName:@"cachedCTOperatorName"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STTelephonySubscriptionContext *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__STTelephonySubscriptionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AD1EE0;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __72__STTelephonySubscriptionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) subscriptionInfo];
  id v4 = (id)[v2 appendObject:v3 withName:@"subscriptionInfo"];

  id v5 = *(void **)(a1 + 32);
  v6 = STTelephonyDataConnectionTypeDebugName([*(id *)(a1 + 40) modemDataConnectionType]);
  [v5 appendString:v6 withName:@"modemDataConnectionType"];

  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) cachedCTOperatorName];
  [v7 appendString:v8 withName:@"cachedCTOperatorName"];
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = self;
  if (self)
  {
    id v4 = (void *)MEMORY[0x1E4F4F718];
    id v5 = a3;
    v6 = [v4 builderWithObject:v3];
    [v6 setUseDebugDescription:1];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __77__STTelephonySubscriptionContext_debugDescriptionBuilderWithMultilinePrefix___block_invoke;
    v13 = &unk_1E6AD1EE0;
    id v7 = v6;
    id v14 = v7;
    v15 = v3;
    [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:&v10];

    v3 = (STTelephonySubscriptionContext *)v7;
  }
  id v8 = [(STTelephonySubscriptionContext *)v3 build];

  return v8;
}

id __77__STTelephonySubscriptionContext_debugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) subscriptionInfo];
  id v4 = (id)[v2 appendObject:v3 withName:@"subscriptionInfo"];

  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFakingService"), @"fakingService");
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFakingRegistration"), @"fakingRegistration");
  id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFakingCellularRegistration"), @"fakingCellularRegistration");
  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPretendingToSearch"), @"isPretendingToSearch");
  v9 = *(void **)(a1 + 32);
  uint64_t v10 = [*(id *)(a1 + 40) cachedCTRegistrationDisplayStatus];
  [v9 appendString:v10 withName:@"cachedCTRegistrationDisplayStatus"];

  uint64_t v11 = *(void **)(a1 + 32);
  v12 = [*(id *)(a1 + 40) cachedCTRegistrationCellularStatus];
  [v11 appendString:v12 withName:@"cachedCTRegistrationCellularStatus"];

  v13 = *(void **)(a1 + 32);
  id v14 = STTelephonyDataConnectionTypeDebugName([*(id *)(a1 + 40) modemDataConnectionType]);
  [v13 appendString:v14 withName:@"modemDataConnectionType"];

  v15 = *(void **)(a1 + 32);
  v16 = [*(id *)(a1 + 40) cachedCTOperatorName];
  [v15 appendString:v16 withName:@"cachedCTOperatorName"];

  v17 = *(void **)(a1 + 32);
  v18 = [*(id *)(a1 + 40) statusBarImages];
  id v19 = (id)[v17 appendObject:v18 withName:@"statusBarImages"];

  v20 = *(void **)(a1 + 32);
  v21 = [*(id *)(a1 + 40) carrierBundleInfo];
  id v22 = (id)[v20 appendObject:v21 withName:@"carrierBundleInfo"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSatelliteSystem"), @"isSatelliteSystem");
}

- (void)setSubscriptionInfo:(id)a3
{
}

- (BOOL)fakeServiceCanceled
{
  return self->_fakeServiceCanceled;
}

- (void)setFakeServiceCanceled:(BOOL *)a3
{
  self->_fakeServiceCanceled = a3;
}

- (BOOL)fakeRegistrationCanceled
{
  return self->_fakeRegistrationCanceled;
}

- (void)setFakeRegistrationCanceled:(BOOL *)a3
{
  self->_fakeRegistrationCanceled = a3;
}

- (BOOL)fakeCellularRegistrationCanceled
{
  return self->_fakeCellularRegistrationCanceled;
}

- (void)setFakeCellularRegistrationCanceled:(BOOL *)a3
{
  self->_fakeCellularRegistrationCanceled = a3;
}

- (BOOL)isPretendingToSearch
{
  return self->_pretendingToSearch;
}

- (void)setPretendingToSearch:(BOOL)a3
{
  self->_pretendingToSearch = a3;
}

- (NSString)cachedCTRegistrationDisplayStatus
{
  return self->_cachedCTRegistrationDisplayStatus;
}

- (void)setCachedCTRegistrationDisplayStatus:(id)a3
{
}

- (NSString)cachedCTRegistrationCellularStatus
{
  return self->_cachedCTRegistrationCellularStatus;
}

- (void)setCachedCTRegistrationCellularStatus:(id)a3
{
}

- (unint64_t)modemDataConnectionType
{
  return self->_modemDataConnectionType;
}

- (void)setModemDataConnectionType:(unint64_t)a3
{
  self->_modemDataConnectionType = a3;
}

- (NSString)cachedCTOperatorName
{
  return self->_cachedCTOperatorName;
}

- (void)setCachedCTOperatorName:(id)a3
{
}

- (NSArray)statusBarImages
{
  return self->_statusBarImages;
}

- (void)setStatusBarImages:(id)a3
{
}

- (void)setCarrierBundleInfo:(id)a3
{
}

- (STMutableTelephonyMobileEquipmentInfo)mobileEquipmentInfo
{
  return self->_mobileEquipmentInfo;
}

- (void)setMobileEquipmentInfo:(id)a3
{
}

- (BOOL)isSatelliteSystem
{
  return self->_isSatelliteSystem;
}

- (void)setIsSatelliteSystem:(BOOL)a3
{
  self->_isSatelliteSystem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileEquipmentInfo, 0);
  objc_storeStrong((id *)&self->_carrierBundleInfo, 0);
  objc_storeStrong((id *)&self->_statusBarImages, 0);
  objc_storeStrong((id *)&self->_cachedCTOperatorName, 0);
  objc_storeStrong((id *)&self->_cachedCTRegistrationCellularStatus, 0);
  objc_storeStrong((id *)&self->_cachedCTRegistrationDisplayStatus, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
}

@end