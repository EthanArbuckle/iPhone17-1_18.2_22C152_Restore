@interface CNContact(PKAdditions)
+ (id)contactWithABRecordRef:()PKAdditions;
+ (id)contactWithPkDictionary:()PKAdditions;
+ (id)pkContactWithNameComponents:()PKAdditions labeledValues:;
+ (id)pkContactWithNameComponents:()PKAdditions postalAddresses:emailAddresses:phoneNumbers:;
+ (id)pkContactWithNameFromContact:()PKAdditions labeledValue:property:;
+ (id)pkPassbookRequiredKeys;
+ (uint64_t)pk_predicateForContactsMatchingEmailAddress:()PKAdditions;
+ (uint64_t)pk_predicateForContactsMatchingPhoneNumber:()PKAdditions;
- (BOOL)isSubsetOfMeCard;
- (id)_fullNameFromComponents:()PKAdditions style:;
- (id)_phoneticNameFromComponents:()PKAdditions style:;
- (id)contactWithCleanedUpDistrict;
- (id)nameComponents;
- (id)pkContactWithCleanedUpCountryCode;
- (id)pkDeconstructContactUsingKey:()PKAdditions;
- (id)pkDeconstructContactUsingKey:()PKAdditions substring:;
- (id)pkDictionaryForProperty:()PKAdditions;
- (id)pkFormattedContactAddressIncludingPhoneticName:()PKAdditions showName:;
- (id)pkFullAndPhoneticName;
- (id)pkFullName;
- (id)pkFullyQualifiedName;
- (id)pkPhoneticName;
- (id)pkSingleLineFormattedContactAddressIncludingCountryName:()PKAdditions;
- (id)pk_displayName;
- (id)recentContact;
- (id)sanitizedContact;
- (id)valueSource;
- (uint64_t)ABPerson;
- (uint64_t)contactSource;
- (uint64_t)formattingConstrained;
- (uint64_t)isHideMyEmail;
- (uint64_t)pkFormattedContactAddress;
- (uint64_t)pkFormattedContactAddressIncludingPhoneticName:()PKAdditions;
- (uint64_t)pkFormattedContactAddressWithoutName;
- (uint64_t)pkSingleLineFormattedContactAddress;
- (uint64_t)recentFromContactInformation;
- (uint64_t)representsContact:()PKAdditions forContactKeys:;
- (void)setContactSource:()PKAdditions;
- (void)setFormattingConstrained:()PKAdditions;
- (void)setIsHideMyEmail:()PKAdditions;
- (void)setRecentContact:()PKAdditions;
- (void)setRecentFromContactInformation:()PKAdditions;
- (void)setValueSource:()PKAdditions;
@end

@implementation CNContact(PKAdditions)

+ (id)pkPassbookRequiredKeys
{
  v6[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1ADC8];
  v6[0] = *MEMORY[0x1E4F1AF10];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1ADF0];
  v6[2] = *MEMORY[0x1E4F1AEE0];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADE0];
  v6[4] = *MEMORY[0x1E4F1AEA0];
  v6[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AEF0];
  v6[6] = *MEMORY[0x1E4F1AEF8];
  v6[7] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:8];
  return v4;
}

+ (id)contactWithABRecordRef:()PKAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v5 = [MEMORY[0x1E4F1B8F8] pkPassbookRequiredKeys];
  if (a3)
  {
    a3 = [v4 contactFromPublicABPerson:a3 keysToFetch:v5];
  }

  return a3;
}

+ (id)contactWithPkDictionary:()PKAdditions
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKey:@"label"];
  v5 = [v3 objectForKey:@"address"];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1BA80];
    v7 = [v3 PKDictionaryForKey:@"address"];
    v8 = [v6 backwardsCompatiblePostalAddressDictionary:v7];

    v9 = [MEMORY[0x1E4F1BA80] postalAddressWithDictionaryRepresentation:v8];
    id v10 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    v11 = [v3 PKStringForKey:@"givenName"];
    [v10 setGivenName:v11];

    v12 = [v3 PKStringForKey:@"familyName"];
    [v10 setFamilyName:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    v14 = [v3 PKStringForKey:@"phoneticGivenName"];
    [v13 setGivenName:v14];

    v15 = [v3 PKStringForKey:@"phoneticFamilyName"];
    [v13 setFamilyName:v15];

    [v10 setPhoneticRepresentation:v13];
    v16 = (void *)MEMORY[0x1E4F1B8F8];
    uint64_t v33 = *MEMORY[0x1E4F1AF10];
    v17 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v4 value:v9];
    v34[0] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    v19 = [v16 pkContactWithNameComponents:v10 labeledValues:v18];

LABEL_8:
    goto LABEL_9;
  }
  v20 = [v3 objectForKey:@"email"];

  if (v20)
  {
    v8 = [v3 PKStringForKey:@"email"];
    v21 = (void *)MEMORY[0x1E4F1B8F8];
    uint64_t v31 = *MEMORY[0x1E4F1ADC8];
    v9 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v4 value:v8];
    v32 = v9;
    v22 = (void *)MEMORY[0x1E4F1C9E8];
    v23 = &v32;
    v24 = &v31;
LABEL_7:
    id v10 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    v19 = [v21 pkContactWithNameComponents:0 labeledValues:v10];
    goto LABEL_8;
  }
  v25 = [v3 objectForKey:@"phone"];

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E4F1BA70];
    v27 = [v3 PKStringForKey:@"phone"];
    v8 = [v26 phoneNumberWithStringValue:v27];

    v21 = (void *)MEMORY[0x1E4F1B8F8];
    uint64_t v29 = *MEMORY[0x1E4F1AEE0];
    v9 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v4 value:v8];
    v30 = v9;
    v22 = (void *)MEMORY[0x1E4F1C9E8];
    v23 = &v30;
    v24 = &v29;
    goto LABEL_7;
  }
  v19 = 0;
LABEL_9:

  return v19;
}

- (id)pkDictionaryForProperty:()PKAdditions
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1ADF0]])
  {
    v6 = [a1 givenName];

    if (v6)
    {
      v7 = [a1 givenName];
      [v5 setObject:v7 forKey:@"givenName"];
    }
  }
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1ADE0]])
  {
    v8 = [a1 familyName];

    if (v8)
    {
      v9 = [a1 familyName];
      [v5 setObject:v9 forKey:@"familyName"];
    }
  }
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1AEF8]])
  {
    id v10 = [a1 phoneticGivenName];

    if (v10)
    {
      v11 = [a1 phoneticGivenName];
      [v5 setObject:v11 forKey:@"phoneticGivenName"];
    }
  }
  if ([a1 isKeyAvailable:@"phoneticFamilyName"])
  {
    v12 = [a1 phoneticFamilyName];

    if (v12)
    {
      id v13 = [a1 phoneticFamilyName];
      [v5 setObject:v13 forKey:@"phoneticFamilyName"];
    }
  }
  uint64_t v14 = *MEMORY[0x1E4F1AF10];
  if ([v4 isEqualToString:*MEMORY[0x1E4F1AF10]]
    && [a1 isKeyAvailable:v14])
  {
    v15 = [a1 postalAddresses];
    v16 = [v15 firstObject];

    v17 = [v16 value];
    v18 = [v16 label];

    if (v18)
    {
      v19 = [v16 label];
      [v5 setObject:v19 forKey:@"label"];
    }
    if (!v17) {
      goto LABEL_32;
    }
    v20 = [v17 backwardsCompatibleDictionaryRepresentation];
    v21 = @"address";
    goto LABEL_31;
  }
  uint64_t v22 = *MEMORY[0x1E4F1ADC8];
  if ([v4 isEqualToString:*MEMORY[0x1E4F1ADC8]]
    && [a1 isKeyAvailable:v22])
  {
    v23 = [a1 emailAddresses];
    v16 = [v23 firstObject];

    v24 = [v16 label];

    if (v24)
    {
      v25 = [v16 label];
      [v5 setObject:v25 forKey:@"label"];
    }
    v26 = [v16 value];

    if (!v26) {
      goto LABEL_33;
    }
    v17 = [v16 value];
    [v5 setObject:v17 forKey:@"email"];
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  uint64_t v27 = *MEMORY[0x1E4F1AEE0];
  if ([v4 isEqualToString:*MEMORY[0x1E4F1AEE0]]
    && [a1 isKeyAvailable:v27])
  {
    v28 = [a1 phoneNumbers];
    v16 = [v28 firstObject];

    uint64_t v29 = [v16 label];

    if (v29)
    {
      v30 = [v16 label];
      [v5 setObject:v30 forKey:@"label"];
    }
    uint64_t v31 = [v16 value];

    if (!v31) {
      goto LABEL_33;
    }
    v17 = [v16 value];
    v20 = [v17 stringValue];
    v21 = @"phone";
LABEL_31:
    [v5 setObject:v20 forKey:v21];

    goto LABEL_32;
  }
LABEL_34:
  v32 = (void *)[v5 copy];

  return v32;
}

+ (id)pkContactWithNameComponents:()PKAdditions labeledValues:
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F1BA40];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 populateNamesFromComponents:v7];

  if ([v5 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__CNContact_PKAdditions__pkContactWithNameComponents_labeledValues___block_invoke;
    v11[3] = &unk_1E56D8280;
    id v12 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];
  }
  v9 = (void *)[v8 copy];

  return v9;
}

+ (id)pkContactWithNameFromContact:()PKAdditions labeledValue:property:
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    id v16 = v9;
    v17[0] = v8;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }
  id v12 = (void *)MEMORY[0x1E4F1B8F8];
  id v13 = [v7 nameComponents];
  uint64_t v14 = [v12 pkContactWithNameComponents:v13 labeledValues:v11];

  return v14;
}

+ (id)pkContactWithNameComponents:()PKAdditions postalAddresses:emailAddresses:phoneNumbers:
{
  id v9 = (objc_class *)MEMORY[0x1E4F1BA40];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v9);
  [v14 populateNamesFromComponents:v13];

  [v14 pkAddLabeledValues:v12 withProperty:*MEMORY[0x1E4F1AF10]];
  [v14 pkAddLabeledValues:v11 withProperty:*MEMORY[0x1E4F1ADC8]];

  [v14 pkAddLabeledValues:v10 withProperty:*MEMORY[0x1E4F1AEE0]];
  v15 = (void *)[v14 copy];

  return v15;
}

- (uint64_t)pkFormattedContactAddress
{
  return [a1 pkFormattedContactAddressIncludingPhoneticName:0];
}

- (uint64_t)pkFormattedContactAddressWithoutName
{
  return [a1 pkFormattedContactAddressIncludingPhoneticName:0 showName:0];
}

- (uint64_t)pkFormattedContactAddressIncludingPhoneticName:()PKAdditions
{
  return [a1 pkFormattedContactAddressIncludingPhoneticName:a3 showName:1];
}

- (id)pkFormattedContactAddressIncludingPhoneticName:()PKAdditions showName:
{
  id v7 = [a1 postalAddresses];
  id v8 = [v7 firstObject];
  id v9 = [v8 value];

  if (a3) {
    [a1 pkFullAndPhoneticName];
  }
  else {
  id v10 = [a1 pkFullName];
  }
  id v11 = [v9 country];
  uint64_t v12 = [v11 length];

  if (!v12)
  {
    id v13 = (void *)[v9 mutableCopy];
    id v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    v15 = [v9 ISOCountryCode];
    id v16 = PKLocalizedStringForCountryCode(v14, v15);
    [v13 setCountry:v16];

    uint64_t v17 = [v13 copy];
    id v9 = (void *)v17;
  }
  if ([v10 length] && a4)
  {
    v18 = NSString;
    v19 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v9 style:0];
    v20 = [v18 stringWithFormat:@"%@\n%@", v10, v19];
  }
  else
  {
    v20 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v9 style:0];
  }

  return v20;
}

- (uint64_t)pkSingleLineFormattedContactAddress
{
  return [a1 pkSingleLineFormattedContactAddressIncludingCountryName:1];
}

- (id)pkSingleLineFormattedContactAddressIncludingCountryName:()PKAdditions
{
  id v4 = [a1 postalAddresses];
  id v5 = [v4 firstObject];
  v6 = [v5 value];

  if ((a3 & 1) == 0)
  {
    id v7 = (void *)[v6 mutableCopy];
    [v7 setCountry:&stru_1EE0F5368];
    uint64_t v8 = [v7 copy];

    v6 = (void *)v8;
  }
  id v9 = [MEMORY[0x1E4F1BA88] singleLineStringFromPostalAddress:v6 addCountryName:a3];

  return v9;
}

- (void)setRecentContact:()PKAdditions
{
}

- (id)recentContact
{
  return objc_getAssociatedObject(a1, sel_recentContact);
}

- (void)setContactSource:()PKAdditions
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_contactSource, v2, (void *)1);
}

- (uint64_t)contactSource
{
  id v2 = objc_getAssociatedObject(a1, sel_contactSource);
  uint64_t v3 = [v2 unsignedIntegerValue];

  if (v3 == 3)
  {
    if ([a1 isSubsetOfMeCard]) {
      return 1;
    }
    else {
      return 3;
    }
  }
  return v3;
}

- (BOOL)isSubsetOfMeCard
{
  uint64_t v1 = a1;
  v45[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_getAssociatedObject(a1, sel_contactSource);
  uint64_t v3 = [v2 unsignedIntegerValue];

  if (v3 == 1) {
    return 1;
  }
  id v5 = +[PKPaymentOptionsRecents defaultInstance];
  v6 = [v5 meCard];

  if (!v6) {
    goto LABEL_6;
  }
  id v7 = [v1 pkFullName];
  if (![v7 length])
  {

    goto LABEL_8;
  }
  uint64_t v8 = [v1 pkFullName];
  id v9 = [v6 pkFullName];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
LABEL_8:
    uint64_t v12 = *MEMORY[0x1E4F1ADC8];
    v44[0] = *MEMORY[0x1E4F1AF10];
    v44[1] = v12;
    v45[0] = @"postalAddresses";
    v45[1] = @"emailAddresses";
    v44[2] = *MEMORY[0x1E4F1AEE0];
    v45[2] = @"phoneNumbers";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v14 = [v13 allKeys];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      uint64_t v28 = *(void *)v39;
      uint64_t v29 = v1;
      uint64_t v31 = v14;
      v32 = v13;
      do
      {
        uint64_t v18 = 0;
        uint64_t v30 = v16;
        do
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * v18);
          if (objc_msgSend(v1, "isKeyAvailable:", v19, v28, v29))
          {
            v20 = [v13 objectForKey:v19];
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            v21 = [v1 valueForKey:v20];
            uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v35;
              while (2)
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v35 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * i);
                  uint64_t v27 = [v6 valueForKey:v20];
                  v33[0] = MEMORY[0x1E4F143A8];
                  v33[1] = 3221225472;
                  v33[2] = __42__CNContact_PKAdditions__isSubsetOfMeCard__block_invoke;
                  v33[3] = &unk_1E56D82A8;
                  v33[4] = v26;
                  LOBYTE(v26) = objc_msgSend(v27, "pk_containsObjectPassingTest:", v33);

                  if (v26)
                  {

                    int v11 = 1;
                    id v14 = v31;
                    id v13 = v32;
                    goto LABEL_28;
                  }
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
                if (v23) {
                  continue;
                }
                break;
              }
            }

            uint64_t v17 = v28;
            uint64_t v1 = v29;
            id v14 = v31;
            id v13 = v32;
            uint64_t v16 = v30;
          }
          ++v18;
        }
        while (v18 != v16);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
        int v11 = 0;
      }
      while (v16);
    }
    else
    {
      int v11 = 0;
    }
LABEL_28:

    goto LABEL_29;
  }
LABEL_6:
  int v11 = 0;
LABEL_29:

  return v11 != 0;
}

- (void)setRecentFromContactInformation:()PKAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_recentFromContactInformation, v2, (void *)1);
}

- (uint64_t)recentFromContactInformation
{
  uint64_t v1 = objc_getAssociatedObject(a1, sel_recentFromContactInformation);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setValueSource:()PKAdditions
{
}

- (id)valueSource
{
  return objc_getAssociatedObject(a1, sel_valueSource);
}

- (void)setFormattingConstrained:()PKAdditions
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_formattingConstrained, v2, (void *)1);
}

- (uint64_t)formattingConstrained
{
  uint64_t v1 = objc_getAssociatedObject(a1, sel_formattingConstrained);
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (void)setIsHideMyEmail:()PKAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_isHideMyEmail, v2, (void *)1);
}

- (uint64_t)isHideMyEmail
{
  uint64_t v1 = objc_getAssociatedObject(a1, sel_isHideMyEmail);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (id)pkFullyQualifiedName
{
  uint64_t v2 = [a1 nameComponents];
  uint64_t v3 = [a1 _fullNameFromComponents:v2 style:3];

  return v3;
}

- (id)pkFullName
{
  uint64_t v2 = [a1 nameComponents];
  uint64_t v3 = [a1 _fullNameFromComponents:v2 style:2];

  return v3;
}

- (id)pkPhoneticName
{
  uint64_t v2 = [a1 nameComponents];
  uint64_t v3 = [a1 _phoneticNameFromComponents:v2 style:2];

  return v3;
}

- (id)pkFullAndPhoneticName
{
  uint64_t v2 = [a1 pkPhoneticName];
  uint64_t v3 = [a1 pkFullName];
  if (![v2 length])
  {
    id v8 = v3;
    goto LABEL_13;
  }
  if (![v3 length]) {
    goto LABEL_10;
  }
  id v4 = v3;
  id v5 = v2;
  v6 = v5;
  if (v4 == v5)
  {

LABEL_10:
    id v8 = v2;
    goto LABEL_13;
  }
  if (v5 && v4)
  {
    uint64_t v7 = [v4 caseInsensitiveCompare:v5];

    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v8 = [NSString stringWithFormat:@"%@\n%@", v4, v6];
LABEL_13:
  id v9 = v8;

  return v9;
}

- (id)_fullNameFromComponents:()PKAdditions style:
{
  id v5 = a3;
  v6 = [v5 givenName];
  if (v6)
  {

LABEL_4:
    id v8 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    [v8 setStyle:a4];
    id v9 = [v8 stringFromPersonNameComponents:v5];

    goto LABEL_5;
  }
  uint64_t v7 = [v5 familyName];

  if (v7) {
    goto LABEL_4;
  }
  id v9 = 0;
LABEL_5:

  return v9;
}

- (id)_phoneticNameFromComponents:()PKAdditions style:
{
  id v5 = a3;
  v6 = [v5 phoneticRepresentation];
  uint64_t v7 = [v6 givenName];
  if (v7)
  {

LABEL_4:
    id v9 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    [v9 setPhonetic:1];
    [v9 setStyle:a4];
    int v10 = [v9 stringFromPersonNameComponents:v5];

    goto LABEL_5;
  }
  id v8 = [v6 familyName];

  if (v8) {
    goto LABEL_4;
  }
  int v10 = 0;
LABEL_5:

  return v10;
}

- (id)nameComponents
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1AEB0]])
  {
    id v4 = [a1 namePrefix];
    [v2 setNamePrefix:v4];
  }
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1ADF0]])
  {
    id v5 = [a1 givenName];
    [v2 setGivenName:v5];
  }
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1AEA0]])
  {
    v6 = [a1 middleName];
    [v2 setMiddleName:v6];
  }
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1ADE0]])
  {
    uint64_t v7 = [a1 familyName];
    [v2 setFamilyName:v7];
  }
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1AEB8]])
  {
    id v8 = [a1 nameSuffix];
    [v2 setNameSuffix:v8];
  }
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1AEC0]])
  {
    id v9 = [a1 nickname];
    [v2 setNickname:v9];
  }
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1AEF8]])
  {
    int v10 = [a1 phoneticGivenName];
    [v3 setGivenName:v10];
  }
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1AF00]])
  {
    int v11 = [a1 phoneticMiddleName];
    [v3 setMiddleName:v11];
  }
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1AEF0]])
  {
    uint64_t v12 = [a1 phoneticFamilyName];
    [v3 setFamilyName:v12];
  }
  id v13 = [v3 givenName];
  if (v13 || ([v3 familyName], (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_22:
    [v2 setPhoneticRepresentation:v3];
    goto LABEL_23;
  }
  uint64_t v15 = [v3 middleName];

  if (v15) {
    goto LABEL_22;
  }
LABEL_23:

  return v2;
}

- (id)sanitizedContact
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v25 = (void *)[a1 mutableCopy];
  uint64_t v1 = [v25 postalAddresses];
  uint64_t v27 = [MEMORY[0x1E4F1CA20] ISOCountryCodes];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v1;
  uint64_t v2 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v35 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = [*(id *)(*((void *)&v34 + 1) + 8 * i) value];
        uint64_t v7 = [v6 ISOCountryCode];
        if (![v7 length]) {
          goto LABEL_24;
        }
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __42__CNContact_PKAdditions__sanitizedContact__block_invoke;
        v32[3] = &unk_1E56D82D0;
        id v8 = v7;
        id v33 = v8;
        uint64_t v9 = [v27 indexOfObjectPassingTest:v32];

        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_24:
          id v8 = [v6 suggestedCountryCode];

          if (v8) {
            [v6 setISOCountryCode:v8];
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v3);
  }

  int v10 = [v25 phoneNumbers];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        uint64_t v18 = [v17 value];
        uint64_t v19 = [v18 digits];
        v20 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v19];
        v21 = [v17 labeledValueBySettingValue:v20];
        [v11 addObject:v21];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v14);
  }

  uint64_t v22 = (void *)[v11 copy];
  [v25 setPhoneNumbers:v22];

  uint64_t v23 = (void *)[v25 copy];
  return v23;
}

- (id)contactWithCleanedUpDistrict
{
  uint64_t v1 = (void *)[a1 mutableCopy];
  if ([v1 isKeyAvailable:*MEMORY[0x1E4F1AF10]])
  {
    uint64_t v2 = [v1 postalAddresses];
    uint64_t v3 = [v2 firstObject];
    uint64_t v4 = [v3 value];
    id v5 = (void *)[v4 mutableCopy];

    if ([v1 isKeyAvailable:*MEMORY[0x1E4F1AED0]]) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      uint64_t v7 = [v1 note];
      [v5 setSubLocality:v7];

      [v1 setNote:&stru_1EE0F5368];
    }
  }
  return v1;
}

- (id)pkContactWithCleanedUpCountryCode
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)[a1 mutableCopy];
  uint64_t v2 = [v1 postalAddresses];
  uint64_t v3 = [v2 firstObject];

  uint64_t v4 = [v3 value];
  id v5 = [v4 ISOCountryCode];
  if ([v5 length] == 2)
  {
    BOOL v6 = [v5 uppercaseString];
    char v7 = [v5 isEqualToString:v6];

    if (v7) {
      goto LABEL_7;
    }
    uint64_t v8 = [v5 uppercaseString];
  }
  else
  {
    uint64_t v8 = [v4 suggestedCountryCode];
  }
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    int v10 = (void *)[v4 mutableCopy];
    [v10 setISOCountryCode:v9];
    id v11 = objc_alloc(MEMORY[0x1E4F1BA20]);
    id v12 = [v3 label];
    uint64_t v13 = (void *)[v10 copy];
    uint64_t v14 = (void *)[v11 initWithLabel:v12 value:v13];
    v18[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v1 setPostalAddresses:v15];
  }
LABEL_7:
  uint64_t v16 = (void *)[v1 copy];

  return v16;
}

- (id)pk_displayName
{
  uint64_t v2 = [a1 pkFullName];
  if (![v2 length])
  {
    uint64_t v3 = [a1 organizationName];

    uint64_t v2 = (void *)v3;
  }
  if (![v2 length])
  {

    uint64_t v2 = 0;
  }
  return v2;
}

- (id)pkDeconstructContactUsingKey:()PKAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([a1 isKeyAvailable:v4])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    BOOL v6 = objc_msgSend(a1, "postalAddresses", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v12 = (void *)[a1 mutableCopy];
          uint64_t v20 = v11;
          uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
          [v12 setValue:v13 forKey:v4];

          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v8);
    }
  }
  uint64_t v14 = (void *)[v5 copy];

  return v14;
}

- (id)pkDeconstructContactUsingKey:()PKAdditions substring:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![a1 isKeyAvailable:v6]) {
    goto LABEL_37;
  }
  uint64_t v8 = [a1 valueForKey:v6];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_36;
  }
  id v40 = v7;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v30 = v8;
  obuint64_t j = v8;
  uint64_t v39 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (!v39) {
    goto LABEL_35;
  }
  uint64_t v9 = *(void *)v43;
  unint64_t v10 = 0x1E4F1B000uLL;
  id v36 = v6;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v43 != v9) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v42 + 1) + 8 * v11);
      uint64_t v13 = objc_msgSend(v12, "value", v30);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v14 = v10;
        uint64_t v15 = v9;
        long long v16 = a1;
        id v17 = v13;
        long long v18 = [v17 street];
        if ([v18 localizedStandardContainsString:v40]) {
          goto LABEL_20;
        }
        long long v19 = [v17 subLocality];
        if ([v19 localizedStandardContainsString:v40]) {
          goto LABEL_19;
        }
        uint64_t v20 = [v17 city];
        if ([v20 localizedStandardContainsString:v40]) {
          goto LABEL_18;
        }
        long long v35 = v19;
        v21 = [v17 subAdministrativeArea];
        if ([v21 localizedStandardContainsString:v40]) {
          goto LABEL_17;
        }
        long long v34 = v21;
        uint64_t v22 = [v17 state];
        if ([v22 localizedStandardContainsString:v40]) {
          goto LABEL_16;
        }
        id v33 = [v17 postalCode];
        if (objc_msgSend(v33, "localizedStandardContainsString:"))
        {

LABEL_16:
          v21 = v34;
LABEL_17:

          long long v19 = v35;
LABEL_18:

LABEL_19:
          id v6 = v36;
LABEL_20:

          a1 = v16;
          uint64_t v9 = v15;
          unint64_t v10 = v14;
LABEL_26:
          v25 = [a1 mutableCopy];
          v46 = v12;
          uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
          [v25 setValue:v26 forKey:v6];

          [v38 addObject:v25];
          goto LABEL_27;
        }
        long long v31 = [v17 country];
        char v32 = [v31 localizedStandardContainsString:v40];

        id v6 = v36;
        a1 = v16;
        uint64_t v9 = v15;
        unint64_t v10 = v14;
        if (v32) {
          goto LABEL_26;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v23 = [v13 stringValue];
            char v24 = [v23 localizedStandardContainsString:v40];

            if ((v24 & 1) == 0) {
              goto LABEL_28;
            }
            goto LABEL_26;
          }
          v25 = PKLogFacilityTypeGetObject(0);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Tried to deconstruct a contact with a CNLabeledValue value class that we don't know how to handle", buf, 2u);
          }
LABEL_27:

          goto LABEL_28;
        }
        if ([v13 localizedStandardContainsString:v40]) {
          goto LABEL_26;
        }
      }
LABEL_28:

      ++v11;
    }
    while (v39 != v11);
    uint64_t v27 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    uint64_t v39 = v27;
  }
  while (v27);
LABEL_35:

  id v7 = v40;
  uint64_t v8 = v30;
LABEL_36:

LABEL_37:
  long long v28 = objc_msgSend(v38, "copy", v30);

  return v28;
}

+ (uint64_t)pk_predicateForContactsMatchingEmailAddress:()PKAdditions
{
  return objc_msgSend(MEMORY[0x1E4F1B8F8], "predicateForContactsMatchingEmailAddress:");
}

+ (uint64_t)pk_predicateForContactsMatchingPhoneNumber:()PKAdditions
{
  return objc_msgSend(MEMORY[0x1E4F1B8F8], "predicateForContactsMatchingPhoneNumber:");
}

- (uint64_t)representsContact:()PKAdditions forContactKeys:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 pkFullName];
  uint64_t v9 = [v8 length];

  if (!v9) {
    goto LABEL_15;
  }
  unint64_t v10 = [a1 givenName];
  uint64_t v11 = [v6 givenName];
  id v12 = v10;
  id v13 = v11;
  unint64_t v14 = v13;
  if (v12 == v13)
  {
  }
  else
  {
    if (!v12 || !v13)
    {

LABEL_38:
LABEL_39:
      uint64_t v39 = 0;
      goto LABEL_40;
    }
    int v15 = [v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_38;
    }
  }
  long long v16 = [a1 familyName];
  id v17 = [v6 familyName];
  id v18 = v16;
  id v19 = v17;
  if (v18 == v19)
  {

    goto LABEL_15;
  }
  uint64_t v20 = v19;
  if (!v18 || !v19)
  {

    goto LABEL_38;
  }
  char v21 = [v18 isEqualToString:v19];

  if ((v21 & 1) == 0) {
    goto LABEL_39;
  }
LABEL_15:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v7;
  uint64_t v22 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    id v41 = v7;
    uint64_t v24 = *(void *)v44;
    unint64_t v25 = 0x1E4F1C000uLL;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        long long v28 = objc_msgSend(a1, "valueForKey:", v27, v41);
        long long v29 = [v6 valueForKey:v27];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v30 = [v28 firstObject];
          [v30 value];
          long long v31 = a1;
          id v32 = v6;
          v34 = unint64_t v33 = v25;

          long long v35 = [v29 firstObject];
          uint64_t v36 = [v35 value];

          long long v28 = (void *)v34;
          unint64_t v25 = v33;
          id v6 = v32;
          a1 = v31;
          long long v29 = (void *)v36;
        }
        if (v28) {
          BOOL v37 = v29 == 0;
        }
        else {
          BOOL v37 = 1;
        }
        if (v37)
        {

          if (v28 != v29) {
            goto LABEL_33;
          }
        }
        else
        {
          char v38 = [v28 isEqual:v29];

          if ((v38 & 1) == 0)
          {
LABEL_33:
            uint64_t v39 = 0;
            goto LABEL_34;
          }
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v23) {
        continue;
      }
      break;
    }
    uint64_t v39 = 1;
LABEL_34:
    id v7 = v41;
  }
  else
  {
    uint64_t v39 = 1;
  }

LABEL_40:
  return v39;
}

- (uint64_t)ABPerson
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  uint64_t v3 = [v2 publicABPersonFromContact:a1 publicAddressBook:0];

  return v3;
}

@end