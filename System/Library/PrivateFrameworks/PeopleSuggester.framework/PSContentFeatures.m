@interface PSContentFeatures
@end

@implementation PSContentFeatures

id __63___PSContentFeatures_utiTypesFromPredictionContext_candidates___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F4FEE8]);
  v3 = +[_PSContentFeatures preservePrivacyUTIMapping:*(void *)(a1 + 32)];
  v4 = (void *)[v2 initWithIntValue:0 doubleValue:0 stringValue:v3 BOOLValue:0 timeBucketValue:0];

  return v4;
}

id __64___PSContentFeatures_sourceAppFromPredictionContext_candidates___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F4FEE8]);
  v3 = [*(id *)(a1 + 32) bundleID];
  v4 = +[_PSContentFeatures preservePrivacySourceBundleID:v3];
  v5 = (void *)[v2 initWithIntValue:0 doubleValue:0 stringValue:v4 BOOLValue:0 timeBucketValue:0];

  return v5;
}

id __82___PSContentFeatures_numberOfContentFromPredictionContext_contentType_candidates___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F4FEE8]);
  v3 = NSNumber;
  unint64_t v4 = [*(id *)(a1 + 32) count];
  if (v4 >= 0xA) {
    uint64_t v5 = 10;
  }
  else {
    uint64_t v5 = v4;
  }
  v6 = [v3 numberWithUnsignedInteger:v5];
  v7 = (void *)[v2 initWithIntValue:v6 doubleValue:0 stringValue:0 BOOLValue:0 timeBucketValue:0];

  return v7;
}

id __72___PSContentFeatures_urlTopLevelDomainFromPredictionContext_candidates___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F4FEE8]);
  v3 = +[_PSContentFeatures preservePrivacyTopLevelDomain:*(void *)(a1 + 32)];
  unint64_t v4 = (void *)[v2 initWithIntValue:0 doubleValue:0 stringValue:v3 BOOLValue:0 timeBucketValue:0];

  return v4;
}

@end