@interface AMSBag(MetricsKit)
+ (id)metricsAMSBagWithProfileName:()MetricsKit profileVersion:;
- (uint64_t)mescalCertificateURL;
- (uint64_t)mescalPrimingURL;
- (uint64_t)mescalSetupURL;
- (uint64_t)mescalSignSapRequests;
- (uint64_t)mescalSignSapResponses;
- (uint64_t)mescalSignedActions;
- (uint64_t)metricsDictionary;
- (uint64_t)trustedDomains;
@end

@implementation AMSBag(MetricsKit)

+ (id)metricsAMSBagWithProfileName:()MetricsKit profileVersion:
{
  if (a3) {
    v5 = a3;
  }
  else {
    v5 = @"MTMetricsKit";
  }
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = @"1";
  }
  v7 = (void *)MEMORY[0x263F27B30];
  v8 = a4;
  v9 = a3;
  v10 = [v7 bagForProfile:v5 profileVersion:v6];

  return v10;
}

- (uint64_t)metricsDictionary
{
  return [a1 dictionaryForKey:@"metrics"];
}

- (uint64_t)trustedDomains
{
  return [a1 arrayForKey:@"trustedDomains"];
}

- (uint64_t)mescalCertificateURL
{
  return [a1 URLForKey:@"sign-sap-setup-cert"];
}

- (uint64_t)mescalSetupURL
{
  return [a1 URLForKey:@"sign-sap-setup"];
}

- (uint64_t)mescalPrimingURL
{
  return [a1 URLForKey:@"primeUrl"];
}

- (uint64_t)mescalSignedActions
{
  return [a1 dictionaryForKey:@"signed-actions"];
}

- (uint64_t)mescalSignSapRequests
{
  return [a1 dictionaryForKey:@"sign-sap-request"];
}

- (uint64_t)mescalSignSapResponses
{
  return [a1 dictionaryForKey:@"sign-sap-response"];
}

@end