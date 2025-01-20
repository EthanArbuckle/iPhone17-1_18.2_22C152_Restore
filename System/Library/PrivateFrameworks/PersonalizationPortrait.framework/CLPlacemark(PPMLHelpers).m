@interface CLPlacemark(PPMLHelpers)
- (id)pp_featureNames;
- (id)pp_featureValueForName:()PPMLHelpers;
- (void)pp_addressSpecificity;
@end

@implementation CLPlacemark(PPMLHelpers)

- (id)pp_featureValueForName:()PPMLHelpers
{
  id v4 = a3;
  if ([v4 isEqualToString:@"name"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [a1 name];
    v7 = (__CFString *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1EDA56F70;
    }
    v9 = v5;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"inlandWater"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v11 = [a1 inlandWater];
LABEL_8:
    v7 = (__CFString *)v11;
    v9 = v10;
    v8 = v7;
LABEL_9:
    v12 = [v9 featureValueWithString:v8];
LABEL_10:

    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"areasOfInterest"])
  {
    v14 = (void *)MEMORY[0x1E4F1E950];
    v15 = (void *)MEMORY[0x1E4F1E9F0];
    uint64_t v16 = [a1 areasOfInterest];
    v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = MEMORY[0x1E4F1CBF0];
    }
    v19 = [v15 sequenceWithStringArray:v18];
    v12 = [v14 featureValueWithSequence:v19];

    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"timezone"])
  {
    v20 = (void *)MEMORY[0x1E4F1E950];
    v7 = [a1 timeZone];
    uint64_t v21 = [(__CFString *)v7 abbreviation];
LABEL_23:
    v22 = (void *)v21;
    v12 = [v20 featureValueWithString:v21];

    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"region"])
  {
    v20 = (void *)MEMORY[0x1E4F1E950];
    v7 = [a1 region];
    uint64_t v21 = [(__CFString *)v7 identifier];
    goto LABEL_23;
  }
  if ([v4 isEqualToString:@"subAdministrativeArea"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v11 = [a1 subAdministrativeArea];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"administrativeArea"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v11 = [a1 administrativeArea];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"thoroughfare"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v11 = [a1 thoroughfare];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"countryCode"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v11 = [a1 ISOcountryCode];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"specificity"])
  {
    v23 = (void *)MEMORY[0x1E4F1E950];
    objc_msgSend(a1, "pp_addressSpecificity");
    v12 = objc_msgSend(v23, "featureValueWithDouble:");
  }
  else
  {
    v12 = 0;
  }
LABEL_11:

  return v12;
}

- (id)pp_featureNames
{
  v0 = (void *)MEMORY[0x192F97350]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"name", @"inlandWater", @"areasOfInterest", @"timezone", @"region", @"subAdministrativeArea", @"administrativeArea", @"countryCode", @"thoroughfare", @"specificity", 0);
  return v1;
}

- (void)pp_addressSpecificity
{
  [a1 thoroughfare];
  [a1 subThoroughfare];

  [a1 locality];
  [a1 subLocality];

  [a1 administrativeArea];
  [a1 subAdministrativeArea];

  [a1 postalCode];
  [a1 ISOcountryCode];
}

@end