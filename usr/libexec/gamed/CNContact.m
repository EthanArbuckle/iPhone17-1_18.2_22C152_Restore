@interface CNContact
+ (id)_gkContactFromCacheObject:(id)a3;
- (id)_gkAllHandles;
@end

@implementation CNContact

- (id)_gkAllHandles
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v4 = [(CNContact *)self phoneNumbers];
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v25 + 1) + 8 * i) value];
        v10 = [v9 stringValue];
        v11 = (void *)IDSCopyIDForPhoneNumber();

        if ([v11 length]) {
          [v3 addObject:v11];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = [(CNContact *)self emailAddresses];
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) value];
        v18 = (void *)IDSCopyBestGuessIDForID();

        if ([v18 length]) {
          [v3 addObject:v18];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  id v19 = [v3 copy];

  return v19;
}

+ (id)_gkContactFromCacheObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CNMutableContact);
  id v5 = [v3 givenName];
  [v4 setGivenName:v5];

  id v6 = [v3 familyName];
  [v4 setFamilyName:v6];

  uint64_t v7 = [v3 namePrefix];
  [v4 setNamePrefix:v7];

  v8 = [v3 nameSuffix];
  [v4 setNameSuffix:v8];

  v9 = [v3 nickname];
  [v4 setNickname:v9];

  v10 = [v3 handle];

  v11 = +[IDSURI URIWithPrefixedURI:v10];

  v12 = [v11 unprefixedURI];
  id v13 = [v11 IDSIDType];
  if (v13 == (id)1)
  {
    id v15 = [objc_alloc((Class)CNLabeledValue) initWithLabel:0 value:v12];
    id v22 = v15;
    id v16 = +[NSArray arrayWithObjects:&v22 count:1];
    [v4 setEmailAddresses:v16];
    goto LABEL_5;
  }
  uint64_t v14 = (uint64_t)v13;
  if (!v13)
  {
    id v15 = [objc_alloc((Class)CNPhoneNumber) initWithStringValue:v12];
    id v16 = [objc_alloc((Class)CNLabeledValue) initWithLabel:0 value:v15];
    id v23 = v16;
    v17 = +[NSArray arrayWithObjects:&v23 count:1];
    [v4 setPhoneNumbers:v17];

LABEL_5:
    goto LABEL_10;
  }
  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers();
  }
  id v19 = os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_100143EDC(v14, v19);
  }
LABEL_10:
  id v20 = [v4 copy];

  return v20;
}

@end