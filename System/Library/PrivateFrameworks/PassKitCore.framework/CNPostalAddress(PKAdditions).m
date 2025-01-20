@interface CNPostalAddress(PKAdditions)
+ (__CFString)_ABKeyFromCNKey:()PKAdditions;
+ (id)_CNKeyFromABKey:()PKAdditions;
+ (id)backwardsCompatiblePostalAddressDictionary:()PKAdditions;
+ (id)postalAddressFromWebServiceDictionaryRepresentation:()PKAdditions;
- (id)_countryCodeForCountryName:()PKAdditions;
- (id)backwardsCompatibleDictionaryRepresentation;
- (id)redactedPostalAddress;
- (id)redactedStreetAddress;
- (id)suggestedCountryCode;
- (id)webServiceDictionaryRepresentation;
@end

@implementation CNPostalAddress(PKAdditions)

- (id)backwardsCompatibleDictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v2 = [a1 dictionaryRepresentation];
  v3 = [v1 dictionaryWithDictionary:v2];

  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v3 objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 length];

        if (v12)
        {
          v13 = [MEMORY[0x1E4F1BA80] _ABKeyFromCNKey:v10];
          if (v13)
          {
            v14 = [v3 objectForKeyedSubscript:v10];
            [v4 setObject:v14 forKey:v13];
          }
          v15 = [v3 objectForKeyedSubscript:v10];
          [v4 setObject:v15 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)webServiceDictionaryRepresentation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [a1 street];
  v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v5 = [v3 componentsSeparatedByCharactersInSet:v4];

  if ([v5 count])
  {
    uint64_t v6 = [v5 objectAtIndex:0];
    if (v6) {
      [v2 setObject:v6 forKeyedSubscript:@"addressLine1"];
    }
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    uint64_t v7 = [v5 objectAtIndex:1];
    if (v7) {
      [v2 setObject:v7 forKeyedSubscript:@"addressLine2"];
    }
  }
  uint64_t v8 = [a1 city];
  [v2 setObject:v8 forKeyedSubscript:@"city"];
  v9 = [a1 state];
  [v2 setObject:v9 forKeyedSubscript:@"state"];
  uint64_t v10 = [a1 postalCode];
  [v2 setObject:v10 forKeyedSubscript:@"postalCode"];
  v11 = [a1 country];
  [v2 setObject:v11 forKeyedSubscript:@"country"];
  uint64_t v12 = [a1 ISOCountryCode];
  v13 = [v12 uppercaseString];

  [v2 setObject:v13 forKeyedSubscript:@"countryCode"];
  return v2;
}

- (id)redactedStreetAddress
{
  v1 = (void *)[a1 mutableCopy];
  [v1 setStreet:&stru_1EE0F5368];
  id v2 = (void *)[v1 copy];

  return v2;
}

- (id)redactedPostalAddress
{
  id v2 = [a1 redactedStreetAddress];
  v3 = (void *)[v2 mutableCopy];

  v4 = [v3 ISOCountryCode];
  if (![v4 length])
  {
    uint64_t v10 = [a1 suggestedCountryCode];

    v4 = (void *)v10;
    if (v10) {
      goto LABEL_3;
    }
LABEL_15:
    v4 = PKCurrentRegion();
    goto LABEL_3;
  }
  if (!v4) {
    goto LABEL_15;
  }
LABEL_3:
  v5 = [v3 postalCode];
  if ([v4 caseInsensitiveCompare:@"US"] || (unint64_t)objc_msgSend(v5, "length") <= 5)
  {
    if ([v4 caseInsensitiveCompare:@"GB"]
      && [v4 caseInsensitiveCompare:@"CA"]
      || (unint64_t)[v5 length] < 5)
    {
      goto LABEL_11;
    }
    uint64_t v6 = [v5 length] - 3;
  }
  else
  {
    uint64_t v6 = 5;
  }
  uint64_t v7 = [v5 substringToIndex:v6];
  [v3 setPostalCode:v7];

LABEL_11:
  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

- (id)suggestedCountryCode
{
  id v2 = [a1 country];
  v3 = [a1 _countryCodeForCountryName:v2];

  return v3;
}

- (id)_countryCodeForCountryName:()PKAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  [MEMORY[0x1E4F1CA20] ISOCountryCodes];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = *MEMORY[0x1E4F1C400];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v4, "displayNameForKey:value:", v9, v11, (void)v15);
        if (![v3 compare:v12 options:129])
        {
          id v13 = v11;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

+ (id)backwardsCompatiblePostalAddressDictionary:()PKAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v3 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v12 = [MEMORY[0x1E4F1BA80] _CNKeyFromABKey:v10];
          if (v12)
          {
            id v13 = [v3 objectForKeyedSubscript:v12];

            if (!v13) {
              [v4 setObject:v11 forKey:v12];
            }
          }
        }
        else
        {
          [v4 removeObjectForKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)postalAddressFromWebServiceDictionaryRepresentation:()PKAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F1BA58];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 PKStringForKey:@"addressLine1"];
  uint64_t v7 = [v4 PKStringForKey:@"addressLine2"];
  uint64_t v8 = [v4 PKStringForKey:@"city"];
  uint64_t v9 = [v4 PKStringForKey:@"state"];
  uint64_t v10 = [v4 PKStringForKey:@"postalCode"];
  v11 = [v4 PKStringForKey:@"countryCode"];
  uint64_t v12 = [v4 PKStringForKey:@"country"];

  if ([v11 length] == 2)
  {
    if (v6 && v7)
    {
      id v13 = [v6 stringByAppendingFormat:@"\n%@", v7];
      [v5 setStreet:v13];
    }
    else if (v6)
    {
      [v5 setStreet:v6];
    }
    if (v8) {
      [v5 setCity:v8];
    }
    if (v9) {
      [v5 setState:v9];
    }
    if (v10) {
      [v5 setPostalCode:v10];
    }
    if (v11)
    {
      long long v16 = [v11 uppercaseString];
      [v5 setISOCountryCode:v16];
    }
    if (v12) {
      [v5 setCountry:v12];
    }
    long long v15 = (void *)[v5 copy];
  }
  else
  {
    v14 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v19 = v11;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "CNPostalAddress+PKAdditions: Cannot create CNPostalAddress from web service dictionary because the countryCode: %@ is invalid", buf, 0xCu);
    }

    long long v15 = 0;
  }

  return v15;
}

+ (__CFString)_ABKeyFromCNKey:()PKAdditions
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F1B7C8]])
  {
    id v4 = @"Street";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B798]])
  {
    id v4 = @"City";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B7C0]])
  {
    id v4 = @"State";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B7B0]])
  {
    id v4 = @"ZIP";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B7A0]])
  {
    id v4 = @"Country";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B7A8]])
  {
    id v4 = @"CountryCode";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B7D8]])
  {
    id v4 = @"SubLocality";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B7D0]])
  {
    id v4 = @"SubAdministrativeArea";
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_CNKeyFromABKey:()PKAdditions
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Street"])
  {
    id v4 = (id *)MEMORY[0x1E4F1B7C8];
LABEL_17:
    id v5 = *v4;
    goto LABEL_18;
  }
  if ([v3 isEqualToString:@"City"])
  {
    id v4 = (id *)MEMORY[0x1E4F1B798];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"State"])
  {
    id v4 = (id *)MEMORY[0x1E4F1B7C0];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"ZIP"])
  {
    id v4 = (id *)MEMORY[0x1E4F1B7B0];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"Country"])
  {
    id v4 = (id *)MEMORY[0x1E4F1B7A0];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"CountryCode"])
  {
    id v4 = (id *)MEMORY[0x1E4F1B7A8];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"SubLocality"])
  {
    id v4 = (id *)MEMORY[0x1E4F1B7D8];
    goto LABEL_17;
  }
  if ([v3 isEqualToString:@"SubAdministrativeArea"])
  {
    id v4 = (id *)MEMORY[0x1E4F1B7D0];
    goto LABEL_17;
  }
  id v5 = 0;
LABEL_18:

  return v5;
}

@end