@interface CNMutableContact
+ (id)contactForHandle:(id)a3 isoCountryCode:(id)a4 metadataCache:(id)a5;
+ (id)contactForRecentCall:(id)a3 metadataCache:(id)a4;
+ (id)suggestedContactForHandle:(id)a3 isoCountryCode:(id)a4 metadataCache:(id)a5;
@end

@implementation CNMutableContact

+ (id)contactForHandle:(id)a3 isoCountryCode:(id)a4 metadataCache:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)CNMutableContact);
  v12 = [v8 value];
  if ([v12 length])
  {
    if (v10)
    {
      v13 = [a1 suggestedContactForHandle:v8 isoCountryCode:v9 metadataCache:v10];
      v14 = v13;
      if (v13)
      {
        id v15 = v13;

        id v11 = v15;
      }
      id v16 = [objc_alloc((Class)TUMetadataDestinationID) initWithDestinationID:v12 isoCountryCode:v9];
      if (v16)
      {
        v17 = [v10 metadataForDestinationID:v16];
        v18 = [v17 metadataForProvider:objc_opt_class()];
        if (v18) {
          [v11 setOrganizationName:v18];
        }
      }
    }
    id v19 = v12;
    id v20 = [v8 type];
    if (v20 == (id)2)
    {
      id v21 = +[CNPhoneNumber phoneNumberWithDigits:v19 countryCode:v9];
    }
    else
    {
      if (v20 != (id)1) {
        goto LABEL_15;
      }
      id v21 = [objc_alloc((Class)CNSocialProfile) initWithUrlString:0 username:v19 userIdentifier:0 service:0];
    }
    id v22 = v21;

    id v19 = v22;
LABEL_15:
    v23 = +[CNLabeledValue labeledValueWithLabel:0 value:v19];
    id v24 = [v8 type];
    if (v24 == (id)3)
    {
      v27 = v23;
      v25 = +[NSArray arrayWithObjects:&v27 count:1];
      [v11 setEmailAddresses:v25];
    }
    else if (v24 == (id)2)
    {
      v28 = v23;
      v25 = +[NSArray arrayWithObjects:&v28 count:1];
      [v11 setPhoneNumbers:v25];
    }
    else
    {
      if (v24 != (id)1)
      {
LABEL_22:

        goto LABEL_23;
      }
      v29 = v23;
      v25 = +[NSArray arrayWithObjects:&v29 count:1];
      [v11 setSocialProfiles:v25];
    }

    goto LABEL_22;
  }
LABEL_23:

  return v11;
}

+ (id)contactForRecentCall:(id)a3 metadataCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TUHandle handleForCHRecentCall:v6];
  if (v8)
  {
    id v9 = [v6 isoCountryCode];
    if ([v8 type] == (id)2)
    {
      if (![v9 length])
      {
        [v6 callStatus];
        uint64_t v11 = TUCountryCodeForIncomingCall();

        id v9 = (void *)v11;
      }
      if ([v9 length])
      {
        v12 = TUHomeCountryCode();
        if (([v9 isEqualToString:v12] & 1) == 0)
        {
          v13 = [v8 value];
          v14 = TUNumberToDial();

          id v15 = [objc_alloc((Class)TUHandle) initWithType:[v8 type] value:v14];
          id v8 = v15;
        }
      }
    }
    id v10 = [a1 contactForHandle:v8 isoCountryCode:v9 metadataCache:v7];
    id v16 = [v6 imageURL];

    if (v16)
    {
      v17 = [v6 name];
      [v10 setOrganizationName:v17];

      [v10 setContactType:1];
    }
    else
    {
      [v10 setContactType:[v6 callDirectoryIdentityType] == 2];
      if ([v10 contactType])
      {
        v18 = [v6 fullName];
        [v10 setOrganizationName:v18];
      }
      else
      {
        id v19 = [v6 givenName];
        [v10 setGivenName:v19];

        v18 = [v6 familyName];
        [v10 setFamilyName:v18];
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)suggestedContactForHandle:(id)a3 isoCountryCode:(id)a4 metadataCache:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v9 providers];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v10);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v16 = objc_opt_class();
    v17 = [v7 value:v24];
    id v11 = [v16 newestSuggestedContactForDestinationID:v17];

    if (!v11)
    {
      id v14 = 0;
      goto LABEL_17;
    }
    id v14 = [v11 mutableCopy];
    id v18 = objc_alloc((Class)TUMetadataDestinationID);
    id v19 = [v7 value];
    id v15 = [v18 initWithDestinationID:v19 isoCountryCode:v8];

    if (v15)
    {
      id v20 = [v9 metadataForDestinationID:v15];
      id v21 = [v20 metadataForProvider:objc_opt_class()];
      if ([v21 length])
      {
        [v14 setContactType:1];
        [v14 setOrganizationName:v21];
      }
    }
  }
  else
  {
LABEL_9:
    id v14 = 0;
    id v15 = v10;
  }

LABEL_17:
  id v22 = v14;

  return v22;
}

@end