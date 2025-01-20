@interface CNContact(TelephonyUtilities)
- (id)allTUHandles;
- (id)tuHandlesForEmailAddresses;
- (id)tuHandlesForPhoneNumbers;
- (id)tu_labeledValueForEmailAddress:()TelephonyUtilities;
- (id)tu_labeledValueForHandle:()TelephonyUtilities;
- (id)tu_labeledValueForPhoneNumber:()TelephonyUtilities;
- (id)tu_labeledValueForSocialProfileWithUsername:()TelephonyUtilities;
- (id)tu_localizedDisplayStringForHandle:()TelephonyUtilities;
@end

@implementation CNContact(TelephonyUtilities)

- (id)tu_labeledValueForEmailAddress:()TelephonyUtilities
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1ADC8]])
  {
    [a1 emailAddresses];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v9, "tuIsSuggested", (void)v13) & 1) == 0)
          {
            v10 = [v9 value];
            int v11 = [v10 isEqualToString:v4];

            if (v11)
            {
              id v6 = v9;
              goto LABEL_14;
            }
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)tu_labeledValueForHandle:()TelephonyUtilities
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  switch(v5)
  {
    case 1:
      id v6 = [v4 normalizedValue];
      uint64_t v7 = v6;
      if (!v6)
      {
        uint64_t v7 = [v4 value];
      }
      uint64_t v8 = objc_msgSend(a1, "tu_labeledValueForSocialProfileWithUsername:", v7);
LABEL_10:
      v9 = (void *)v8;
      if (v6)
      {
LABEL_16:

        goto LABEL_18;
      }
LABEL_15:

      goto LABEL_16;
    case 2:
      id v6 = [v4 normalizedValue];
      if (v6 || ([v4 value], (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v10 = objc_alloc(MEMORY[0x1E4F1BA70]);
        int v11 = [v4 isoCountryCode];
        uint64_t v7 = (void *)[v10 initWithStringValue:v6 countryCode:v11];

        v9 = objc_msgSend(a1, "tu_labeledValueForPhoneNumber:", v7);
        goto LABEL_15;
      }
      break;
    case 3:
      id v6 = [v4 normalizedValue];
      uint64_t v7 = v6;
      if (!v6)
      {
        uint64_t v7 = [v4 value];
      }
      uint64_t v8 = objc_msgSend(a1, "tu_labeledValueForEmailAddress:", v7);
      goto LABEL_10;
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (id)tu_labeledValueForPhoneNumber:()TelephonyUtilities
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1AEE0]])
  {
    [a1 phoneNumbers];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v9, "tuIsSuggested", (void)v13) & 1) == 0)
          {
            id v10 = [v9 value];
            int v11 = [v10 isLikePhoneNumber:v4];

            if (v11)
            {
              id v6 = v9;
              goto LABEL_14;
            }
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)tu_labeledValueForSocialProfileWithUsername:()TelephonyUtilities
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1AF78]])
  {
    [a1 socialProfiles];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "value", (void)v14);
          int v11 = [v10 username];
          int v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v6 = v9;

            goto LABEL_13;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)tu_localizedDisplayStringForHandle:()TelephonyUtilities
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 1)
  {
    long long v13 = [v4 normalizedValue];
    long long v14 = v13;
    if (!v13)
    {
      long long v14 = [v4 value];
    }
    uint64_t v8 = objc_msgSend(a1, "tu_labeledValueForSocialProfileWithUsername:", v14);
    if (!v13) {

    }
    char v15 = objc_opt_respondsToSelector();
    id v10 = (void *)MEMORY[0x1E4F1BA20];
    int v11 = [v8 label];
    if (v15)
    {
      int v12 = (void *)MEMORY[0x1E4F1AF78];
      goto LABEL_16;
    }
    long long v16 = [v10 localizedStringForLabel:v11];

    if ([v16 length]) {
      goto LABEL_32;
    }
    v23 = TUBundle();
    int v11 = v23;
    v24 = @"CONTACTS_SOCIAL_PROFILE_LABEL";
LABEL_26:
    uint64_t v25 = [v23 localizedStringForKey:v24 value:&stru_1EECEA668 table:@"TelephonyUtilities"];

    long long v16 = (void *)v25;
    goto LABEL_31;
  }
  if (v5 == 2)
  {
    int v11 = [v4 normalizedValue];
    if (!v11)
    {
      int v11 = [v4 value];
      if (!v11) {
        goto LABEL_21;
      }
    }
    id v17 = objc_alloc(MEMORY[0x1E4F1BA70]);
    uint64_t v18 = [v4 isoCountryCode];
    uint64_t v19 = (void *)[v17 initWithStringValue:v11 countryCode:v18];

    uint64_t v8 = objc_msgSend(a1, "tu_labeledValueForPhoneNumber:", v19);
    char v20 = objc_opt_respondsToSelector();
    v21 = (void *)MEMORY[0x1E4F1BA20];
    v22 = [v8 label];
    if (v20)
    {
      long long v16 = [v21 localizedDisplayStringForLabel:v22 propertyName:*MEMORY[0x1E4F1AEE0]];
    }
    else
    {
      long long v16 = [v21 localizedStringForLabel:v22];

      if ([v16 length])
      {
LABEL_30:

        goto LABEL_31;
      }
      v22 = TUBundle();
      uint64_t v26 = [v22 localizedStringForKey:@"CONTACTS_PHONE_LABEL" value:&stru_1EECEA668 table:@"TelephonyUtilities"];

      long long v16 = (void *)v26;
    }

    goto LABEL_30;
  }
  if (v5 != 3)
  {
LABEL_21:
    uint64_t v8 = 0;
    long long v16 = 0;
    goto LABEL_32;
  }
  id v6 = [v4 normalizedValue];
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = [v4 value];
  }
  uint64_t v8 = objc_msgSend(a1, "tu_labeledValueForEmailAddress:", v7);
  if (!v6) {

  }
  char v9 = objc_opt_respondsToSelector();
  id v10 = (void *)MEMORY[0x1E4F1BA20];
  int v11 = [v8 label];
  if ((v9 & 1) == 0)
  {
    long long v16 = [v10 localizedStringForLabel:v11];

    if ([v16 length]) {
      goto LABEL_32;
    }
    v23 = TUBundle();
    int v11 = v23;
    v24 = @"CONTACTS_EMAIL_LABEL";
    goto LABEL_26;
  }
  int v12 = (void *)MEMORY[0x1E4F1ADC8];
LABEL_16:
  long long v16 = [v10 localizedDisplayStringForLabel:v11 propertyName:*v12];
LABEL_31:

LABEL_32:

  return v16;
}

- (id)tuHandlesForPhoneNumbers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = objc_msgSend(a1, "phoneNumbers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) value];
        char v9 = v8;
        if (v8)
        {
          id v10 = [v8 stringValue];
          int v11 = [v9 countryCode];
          int v12 = +[TUHandle normalizedPhoneNumberHandleForValue:v10 isoCountryCode:v11];

          if (v12) {
            [v2 addObject:v12];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  long long v13 = [v2 array];

  return v13;
}

- (id)tuHandlesForEmailAddresses
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a1, "emailAddresses", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) value];
        if ([v8 length])
        {
          char v9 = +[TUHandle normalizedEmailAddressHandleForValue:v8];
          if (v9) {
            [v2 addObject:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v10 = [v2 array];

  return v10;
}

- (id)allTUHandles
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [a1 tuHandlesForPhoneNumbers];
  uint64_t v4 = [a1 tuHandlesForEmailAddresses];
  [v2 addObjectsFromArray:v3];
  [v2 addObjectsFromArray:v4];
  uint64_t v5 = (void *)[v2 copy];

  return v5;
}

@end