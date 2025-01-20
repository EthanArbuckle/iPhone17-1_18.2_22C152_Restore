@interface PKPeerPaymentCounterpartHandleFormatter
+ (id)displayNameForCounterpartHandle:(id)a3 contact:(id)a4;
+ (id)formatCounterpartHandle:(id)a3;
+ (id)redactedDisplayNameForCounterpartHandle:(id)a3 contact:(id)a4;
+ (id)requiredContactKeys;
@end

@implementation PKPeerPaymentCounterpartHandleFormatter

+ (id)displayNameForCounterpartHandle:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [MEMORY[0x1E4F1B910] stringFromContact:v7 style:0];
  }
  else
  {
    v8 = 0;
  }
  if (![v8 length])
  {
    uint64_t v9 = [a1 formatCounterpartHandle:v6];

    v8 = (void *)v9;
  }

  return v8;
}

+ (id)formatCounterpartHandle:(id)a3
{
  id v3 = a3;
  if ([v3 length] && objc_msgSend(v3, "hasPrefix:", @"+"))
  {
    v4 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v3];
    id v5 = [v4 pkFormattedStringValue];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

+ (id)requiredContactKeys
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v3 = *MEMORY[0x1E4F1ADC8];
  v6[0] = v2;
  v6[1] = v3;
  v6[2] = *MEMORY[0x1E4F1AEE0];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];

  return v4;
}

+ (id)redactedDisplayNameForCounterpartHandle:(id)a3 contact:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1B910]);
    [v7 setStyle:1000];
    v8 = [v7 stringFromContact:v6];
    if (![v8 length])
    {
      uint64_t v9 = [v6 givenName];
      v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [v6 familyName];
      }
      id v12 = v11;

      v8 = v12;
    }
  }
  else
  {
    v8 = 0;
  }
  if (![v8 length])
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v5];
    if (v13)
    {
      v14 = (void *)[v5 mutableCopy];
      v15 = [v13 localPart];
      v16 = (void *)[v15 mutableCopy];

      uint64_t v17 = [v5 rangeOfString:v16];
      uint64_t v19 = v18;
      uint64_t v20 = [v16 length];
      uint64_t v21 = v20 - 2;
      if (v20 < 2) {
        objc_msgSend(v16, "appendString:", @"***", v21);
      }
      else {
        objc_msgSend(v16, "replaceCharactersInRange:withString:", 1, v21, @"***");
      }
      objc_msgSend(v14, "replaceCharactersInRange:withString:", v17, v19, v16);
      uint64_t v22 = [v14 copy];

      v8 = (void *)v22;
    }
  }
  if (![v8 length])
  {
    v23 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v5];
    if (v23)
    {
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"***"];
      v25 = [v23 lastFourDigits];
      [v24 appendString:v25];

      uint64_t v26 = [v24 copy];
      v8 = (void *)v26;
    }
  }
  return v8;
}

@end