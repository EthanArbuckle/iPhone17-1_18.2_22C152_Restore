@interface CHHandle
+ (id)tu_normalizedCHHandlesFromTUHandle:(id)a3 isoCountryCodes:(id)a4;
- (TUHandle)tu_tuHandle;
@end

@implementation CHHandle

- (TUHandle)tu_tuHandle
{
  v3 = [(CHHandle *)self value];
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = [(CHHandle *)self type];
    if ((unint64_t)v5 < 2)
    {
      v9 = [(CHHandle *)self value];
      unsigned __int8 v10 = [v9 _appearsToBePhoneNumber];

      if (v10)
      {
        uint64_t v7 = 2;
      }
      else
      {
        v11 = [(CHHandle *)self value];
        unsigned int v12 = [v11 _appearsToBeEmail];

        if (v12) {
          uint64_t v7 = 3;
        }
        else {
          uint64_t v7 = 1;
        }
      }
    }
    else
    {
      uint64_t v6 = 1;
      if (v5 == (id)2) {
        uint64_t v6 = 2;
      }
      if (v5 == (id)3) {
        uint64_t v7 = 3;
      }
      else {
        uint64_t v7 = v6;
      }
    }
    id v13 = objc_alloc((Class)TUHandle);
    v14 = [(CHHandle *)self value];
    id v8 = [v13 initWithType:v7 value:v14];
  }
  else
  {
    id v8 = 0;
  }

  return (TUHandle *)v8;
}

+ (id)tu_normalizedCHHandlesFromTUHandle:(id)a3 isoCountryCodes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [v5 type];
  if (v8 == (id)1)
  {
    v17 = [v5 value];
    uint64_t v18 = +[CHHandle normalizedGenericHandleForValue:v17];
  }
  else if (v8 == (id)3)
  {
    v17 = [v5 value];
    uint64_t v18 = +[CHHandle normalizedEmailAddressHandleForValue:v17];
  }
  else
  {
    if (v8 != (id)2) {
      goto LABEL_21;
    }
    if ([v6 count])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v22 = v6;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            v15 = [v5 value];
            v16 = +[CHHandle normalizedPhoneNumberHandleForValue:v15 isoCountryCode:v14];

            if (v16) {
              [v7 addObject:v16];
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v11);
      }

      id v6 = v22;
      goto LABEL_21;
    }
    v17 = [v5 value];
    uint64_t v18 = +[CHHandle normalizedPhoneNumberHandleForValue:v17 isoCountryCode:0];
  }
  v19 = (void *)v18;

  if (v19) {
    [v7 addObject:v19];
  }

LABEL_21:
  id v20 = [v7 copy];

  return v20;
}

@end