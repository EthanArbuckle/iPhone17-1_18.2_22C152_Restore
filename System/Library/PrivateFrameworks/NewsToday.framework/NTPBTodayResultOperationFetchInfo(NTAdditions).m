@interface NTPBTodayResultOperationFetchInfo(NTAdditions)
- (id)CTRByPersonalizationFeatureID;
- (id)appConfigTreatmentID;
- (id)locale;
- (uint64_t)setAppConfigTreatmentID:()NTAdditions;
- (uint64_t)setUserSegmentationSegmentSetIDs:()NTAdditions;
- (uint64_t)setUserSegmentationTreatmentIDs:()NTAdditions;
- (void)setCTRByPersonalizationFeatureID:()NTAdditions;
- (void)setLocale:()NTAdditions;
@end

@implementation NTPBTodayResultOperationFetchInfo(NTAdditions)

- (id)appConfigTreatmentID
{
  if ([a1 hasAppConfigTreatmentIDInteger])
  {
    v2 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a1, "appConfigTreatmentIDInteger"));
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)setAppConfigTreatmentID:()NTAdditions
{
  uint64_t v4 = [a3 integerValue];

  return [a1 setAppConfigTreatmentIDInteger:v4];
}

- (id)CTRByPersonalizationFeatureID
{
  v1 = [a1 clickThroughRateByPersonalizationFeatureIDData];
  if (v1)
  {
    v2 = (void *)MEMORY[0x263F08928];
    v3 = (void *)MEMORY[0x263EFFA08];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
    v7 = objc_msgSend(v2, "nf_securelyUnarchiveObjectOfClasses:withData:", v6, v1);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setCTRByPersonalizationFeatureID:()NTAdditions
{
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  [a1 setClickThroughRateByPersonalizationFeatureIDData:v4];
}

- (void)setLocale:()NTAdditions
{
  id v4 = [a3 localeIdentifier];
  [a1 setLocaleIdentifier:v4];
}

- (id)locale
{
  v1 = [a1 localeIdentifier];
  if (v1) {
    v2 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v1];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)setUserSegmentationSegmentSetIDs:()NTAdditions
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __83__NTPBTodayResultOperationFetchInfo_NTAdditions__setUserSegmentationSegmentSetIDs___block_invoke;
  v4[3] = &unk_26475D7C0;
  v4[4] = a1;
  return [a3 enumerateObjectsUsingBlock:v4];
}

- (uint64_t)setUserSegmentationTreatmentIDs:()NTAdditions
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __82__NTPBTodayResultOperationFetchInfo_NTAdditions__setUserSegmentationTreatmentIDs___block_invoke;
  v4[3] = &unk_26475D7C0;
  v4[4] = a1;
  return [a3 enumerateObjectsUsingBlock:v4];
}

@end