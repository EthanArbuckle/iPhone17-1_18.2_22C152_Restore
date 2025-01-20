@interface CNVCardADRParser
+ (BOOL)parseNextStringWithParser:(id)a3 components:(id)a4 key:(id)a5;
+ (id)addressValueWithPrimaryAddress:(id)a3 extendedAddress:(id)a4 poBox:(id)a5;
+ (id)countryCodeForLine:(id)a3 validCountryCodes:(id)a4 parser:(id)a5;
+ (id)parseStreetAddressComponentsWithParser:(id)a3;
+ (id)valueWithParser:(id)a3;
+ (void)collectStreetAddressComponentsIntoSingleKeyInAddress:(id)a3;
+ (void)processExtensionValuesForLines:(id)a3 validCountryCodes:(id)a4 parser:(id)a5;
@end

@implementation CNVCardADRParser

+ (id)valueWithParser:(id)a3
{
  v4 = [a1 parseStreetAddressComponentsWithParser:a3];
  [a1 collectStreetAddressComponentsIntoSingleKeyInAddress:v4];
  return v4;
}

+ (id)parseStreetAddressComponentsWithParser:(id)a3
{
  v17[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v17[0] = @"postOfficeBox";
  v17[1] = @"extendedStreet";
  v17[2] = @"street";
  v17[3] = @"city";
  v17[4] = @"state";
  v17[5] = @"postalCode";
  v17[6] = @"country";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:7];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v6);
      }
      if (!objc_msgSend(a1, "parseNextStringWithParser:components:key:", v4, v5, *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12))break; {
      if (v8 == ++v10)
      }
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v5;
}

+ (BOOL)parseNextStringWithParser:(id)a3 components:(id)a4 key:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 parseStringValue];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {

    uint64_t v10 = 0;
  }
  [v7 setObject:v10 forKeyedSubscript:v8];
  char v11 = [v9 advancePastSemicolon];

  return v11;
}

+ (void)collectStreetAddressComponentsIntoSingleKeyInAddress:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"street"];
  id v6 = [v4 objectForKey:@"extendedStreet"];
  id v7 = [v4 objectForKey:@"postOfficeBox"];
  id v8 = [a1 addressValueWithPrimaryAddress:v5 extendedAddress:v6 poBox:v7];
  v10[0] = @"street";
  v10[1] = @"extendedStreet";
  v10[2] = @"postOfficeBox";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  [v4 removeObjectsForKeys:v9];

  [v4 setObject:v8 forKey:@"street"];
}

+ (id)addressValueWithPrimaryAddress:(id)a3 extendedAddress:(id)a4 poBox:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = [v7 array];
  objc_msgSend(v11, "_cn_addNonNilObject:", v8);

  objc_msgSend(v11, "_cn_addNonNilObject:", v10);
  objc_msgSend(v11, "_cn_addNonNilObject:", v9);

  long long v12 = [v11 componentsJoinedByString:@"\n"];

  return v12;
}

+ (void)processExtensionValuesForLines:(id)a3 validCountryCodes:(id)a4 parser:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v23 = a4;
  id v8 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v7;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v13 = [v12 grouping];
        long long v14 = [v8 firstValueForKey:@"X-APPLE-SUBLOCALITY" inExtensionGroup:v13];

        long long v15 = [v12 grouping];
        v16 = [v8 firstValueForKey:@"X-APPLE-SUBADMINISTRATIVEAREA" inExtensionGroup:v15];

        v17 = [a1 countryCodeForLine:v12 validCountryCodes:v23 parser:v8];
        v18 = [v12 value];
        v19 = (void *)[v18 mutableCopy];

        [v19 setObject:v14 forKeyedSubscript:@"subLocality"];
        [v19 setObject:v16 forKeyedSubscript:@"subAdministrativeArea"];
        [v19 setObject:v17 forKeyedSubscript:@"ISOCountryCode"];
        [v12 setValue:v19];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }
}

+ (id)countryCodeForLine:(id)a3 validCountryCodes:(id)a4 parser:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 grouping];
  uint64_t v10 = [v8 firstValueForKey:@"X-ABADR" inExtensionGroup:v9];

  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    id v11 = 0;
  }
  else
  {
    if (v7)
    {
      long long v12 = [v10 lowercaseString];
      char v13 = [v7 containsObject:v12];

      if ((v13 & 1) == 0)
      {

        uint64_t v10 = 0;
      }
    }
    id v11 = v10;
    uint64_t v10 = v11;
  }

  return v11;
}

@end