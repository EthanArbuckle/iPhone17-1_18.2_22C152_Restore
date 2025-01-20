@interface CHHandle(TUIntentHandler)
+ (id)tu_normalizedCHHandlesFromTUHandle:()TUIntentHandler isoCountryCodes:;
- (id)tu_tuHandle;
@end

@implementation CHHandle(TUIntentHandler)

- (id)tu_tuHandle
{
  v2 = [a1 value];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    unint64_t v4 = [a1 type];
    if (v4 < 2)
    {
      v8 = [a1 value];
      char v9 = [v8 _appearsToBePhoneNumber];

      if (v9)
      {
        uint64_t v6 = 2;
      }
      else
      {
        v10 = [a1 value];
        int v11 = [v10 _appearsToBeEmail];

        if (v11) {
          uint64_t v6 = 3;
        }
        else {
          uint64_t v6 = 1;
        }
      }
    }
    else
    {
      uint64_t v5 = 1;
      if (v4 == 2) {
        uint64_t v5 = 2;
      }
      if (v4 == 3) {
        uint64_t v6 = 3;
      }
      else {
        uint64_t v6 = v5;
      }
    }
    id v12 = objc_alloc(MEMORY[0x263F7E248]);
    v13 = [a1 value];
    v7 = (void *)[v12 initWithType:v6 value:v13];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)tu_normalizedCHHandlesFromTUHandle:()TUIntentHandler isoCountryCodes:
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = [v5 type];
  switch(v8)
  {
    case 1:
      v18 = (void *)MEMORY[0x263F30578];
      v19 = [v5 value];
      uint64_t v20 = [v18 normalizedGenericHandleForValue:v19];
      break;
    case 3:
      v21 = (void *)MEMORY[0x263F30578];
      v19 = [v5 value];
      uint64_t v20 = [v21 normalizedEmailAddressHandleForValue:v19];
      break;
    case 2:
      if ([v6 count])
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v26 = v6;
        id v9 = v6;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              v15 = (void *)MEMORY[0x263F30578];
              v16 = [v5 value];
              v17 = [v15 normalizedPhoneNumberHandleForValue:v16 isoCountryCode:v14];

              if (v17) {
                [v7 addObject:v17];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v11);
        }

        id v6 = v26;
        goto LABEL_21;
      }
      v22 = (void *)MEMORY[0x263F30578];
      v19 = [v5 value];
      uint64_t v20 = [v22 normalizedPhoneNumberHandleForValue:v19 isoCountryCode:0];
      break;
    default:
      goto LABEL_21;
  }
  v23 = (void *)v20;

  if (v23) {
    [v7 addObject:v23];
  }

LABEL_21:
  v24 = (void *)[v7 copy];

  return v24;
}

@end