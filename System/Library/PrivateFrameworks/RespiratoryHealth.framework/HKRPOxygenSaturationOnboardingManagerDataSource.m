@interface HKRPOxygenSaturationOnboardingManagerDataSource
@end

@implementation HKRPOxygenSaturationOnboardingManagerDataSource

id __79___HKRPOxygenSaturationOnboardingManagerDataSource_featureAvailabilityProvider__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F0A410]);
    id v4 = objc_alloc(MEMORY[0x263F0A3B8]);
    uint64_t v5 = [v4 initWithFeatureIdentifier:*MEMORY[0x263F097B8] healthStore:v3];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }

  return v2;
}

id __76___HKRPOxygenSaturationOnboardingManagerDataSource_oxygenSaturationSettings__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    uint64_t v3 = +[HKRPOxygenSaturationSettings standardSettings];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }

  return v2;
}

id __67___HKRPOxygenSaturationOnboardingManagerDataSource_onboardingCache__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    uint64_t v3 = [HKRPOxygenSaturationOnboardingCache alloc];
    uint64_t v4 = objc_msgSend(MEMORY[0x263EFFA40], "hkrp_respiratoryDefaults");
    uint64_t v5 = [HKRPUserDefaultsSyncProvider alloc];
    uint64_t v6 = [(HKRPUserDefaultsSyncProvider *)v5 initWithUserDefaultsDomain:*MEMORY[0x263F09F70]];
    uint64_t v7 = [(HKRPOxygenSaturationOnboardingCache *)v3 initWithUserDefaults:v4 userDefaultsSyncProvider:v6];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }

  return v2;
}

id __76___HKRPOxygenSaturationOnboardingManagerDataSource_mobileCountryCodeManager__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    uint64_t v3 = HKPreferredRegulatoryDomainProvider();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }

  return v2;
}

@end