@interface PDPassShareBundle
+ (id)passSharesFromCarKeySharesDictionary:(id)a3;
+ (id)passSharesFromLegacyCarKeySharesDictionary:(id)a3 entitlements:(id)a4;
+ (id)subcredentialEntitlementsFromPassDictionary:(id)a3;
- (NSArray)entitlements;
- (NSArray)shares;
- (PDPassShareBundle)init;
- (PDPassShareBundle)initWithPassURL:(id)a3 passDictionary:(id)a4;
- (id)_initWithCarKeySharesDictionary:(id)a3 passDict:(id)a4;
- (id)_initWithShareBundleDictionary:(id)a3;
- (id)_initWithShares:(id)a3 entitlements:(id)a4;
- (id)description;
- (void)setEntitlements:(id)a3;
- (void)setShares:(id)a3;
@end

@implementation PDPassShareBundle

- (PDPassShareBundle)init
{
  return 0;
}

- (PDPassShareBundle)initWithPassURL:(id)a3 passDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 URLByAppendingPathComponent:PKPassSharingBundleFileName];
  uint64_t v9 = sub_10045938C((uint64_t)v8);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (PDPassShareBundle *)[(PDPassShareBundle *)self _initWithShareBundleDictionary:v9];
  }
  else
  {
    v12 = [v6 URLByAppendingPathComponent:PKCarKeyPassSharingBundleFileName];
    v10 = sub_10045938C((uint64_t)v12);
    if (v10)
    {
      v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PDPassShareBundle: Shares: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    v11 = (PDPassShareBundle *)[(PDPassShareBundle *)self _initWithCarKeySharesDictionary:v10 passDict:v7];
  }
  return v11;
}

- (id)_initWithShareBundleDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  [v3 PKArrayContaining:objc_opt_class() forKey:PKPassSharingBundleSharesKey];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v10 = [objc_alloc((Class)PKPassShare) initWithDictionary:v9];
        if (v10)
        {
          [v4 addObject:v10];
        }
        else
        {
          v11 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            uint64_t v39 = v9;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PDPassShareBundle: Unable to create share from %{private}@", buf, 0xCu);
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v6);
  }
  id v12 = objc_alloc_init((Class)NSMutableArray);
  v27 = v3;
  v13 = [v3 PKArrayContaining:objc_opt_class() forKey:PKPassSharingBundleEntitlementsKey];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
        id v19 = [objc_alloc((Class)PKPassEntitlement) initWithDictionary:v18];
        if (v19)
        {
          [v12 addObject:v19];
        }
        else
        {
          v20 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            uint64_t v39 = v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PDPassShareBundle: Unable to create entitlement from %{private}@", buf, 0xCu);
          }
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v15);
  }
  id v21 = objc_msgSend(v4, "copy", self);
  id v22 = [v12 copy];
  id v23 = [v26 _initWithShares:v21 entitlements:v22];

  return v23;
}

- (id)_initWithShares:(id)a3 entitlements:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDPassShareBundle;
  uint64_t v9 = [(PDPassShareBundle *)&v12 init];
  if (v9)
  {
    if (![v7 count] && !objc_msgSend(v8, "count"))
    {
      id v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v9->_shares, a3);
    objc_storeStrong((id *)&v9->_entitlements, a4);
  }
  id v10 = v9;
LABEL_6:

  return v10;
}

- (id)_initWithCarKeySharesDictionary:(id)a3 passDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 PKStringForKey:@"version"];
  id v9 = [v8 integerValue];

  id v10 = +[PDPassShareBundle subcredentialEntitlementsFromPassDictionary:v7];

  if (v9 != (id)2)
  {
    v11 = [v6 objectForKeyedSubscript:PKPassSharingCarKeyBundleSharesKey];

    if (!v11)
    {
      if (v10)
      {
        objc_super v12 = +[PDPassShareBundle passSharesFromLegacyCarKeySharesDictionary:v6 entitlements:v10];
        goto LABEL_4;
      }
      objc_super v12 = 0;
LABEL_8:

      id v13 = 0;
      goto LABEL_9;
    }
  }
  objc_super v12 = +[PDPassShareBundle passSharesFromCarKeySharesDictionary:v6];
  if (!v10) {
    goto LABEL_8;
  }
LABEL_4:
  id v13 = [(PDPassShareBundle *)self _initWithShares:v12 entitlements:v10];
LABEL_9:

  return v13;
}

+ (id)passSharesFromLegacyCarKeySharesDictionary:(id)a3 entitlements:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 PKArrayContaining:objc_opt_class() forKey:@"sharedKeysData"];
  id v8 = objc_msgSend(v7, "pk_groupDictionaryByApplyingBlock:", &stru_100752BD0);
  id v9 = [v6 PKStringForKey:@"keyID"];

  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = objc_alloc_init((Class)NSMutableArray);
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  id v22 = sub_100459BCC;
  id v23 = &unk_100734388;
  id v24 = v9;
  id v25 = v5;
  id v12 = v10;
  id v26 = v12;
  id v13 = v11;
  id v27 = v13;
  id v14 = v5;
  id v15 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:&v20];
  if (objc_msgSend(v12, "count", v20, v21, v22, v23))
  {
    uint64_t v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PDPassShareBundle: dropped friend credentials with these identifiers: %@", buf, 0xCu);
    }
  }
  v17 = v27;
  id v18 = v13;

  return v18;
}

+ (id)passSharesFromCarKeySharesDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [v3 PKArrayContaining:objc_opt_class() forKey:PKPassSharingCarKeyBundleSharesKey];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [objc_alloc((Class)PKPassShare) initWithSubcredentialDictionary:v10];
        if (v11)
        {
          [v4 addObject:v11];
        }
        else
        {
          id v12 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            uint64_t v20 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDPassShareBundle: Unable to create share from %{private}@", buf, 0xCu);
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }
  id v13 = [v4 copy];

  return v13;
}

+ (id)subcredentialEntitlementsFromPassDictionary:(id)a3
{
  id v3 = a3;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10045A4B8;
  v39[3] = &unk_100752C60;
  id v23 = objc_alloc_init((Class)NSMutableArray);
  id v40 = v23;
  id v4 = objc_retainBlock(v39);
  id v5 = +[PKSecureElement primarySecureElementIdentifier];
  id v24 = v3;
  [v3 PKArrayContaining:objc_opt_class() forKey:PKPassKeyPaymentApplications];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v30 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v36;
    uint64_t v28 = PKPassPaymentApplicationsKeySEID;
    uint64_t v26 = PKPassPaymentApplicationsKeySubcredential;
    uint64_t v6 = PKPassPaymentApplicationsKeySubcredentials;
    id v25 = v5;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "PKStringForKey:", v28, v23);
        id v10 = v5;
        id v11 = v9;
        if (v10 == v11)
        {

LABEL_12:
          id v12 = [v8 PKDictionaryForKey:v26];
          ((void (*)(void *, void *))v4[2])(v4, v12);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v14 = v6;
          long long v15 = [v8 PKArrayContaining:objc_opt_class() forKey:v6];
          id v16 = [v15 countByEnumeratingWithState:&v31 objects:v41 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v32;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v32 != v18) {
                  objc_enumerationMutation(v15);
                }
                ((void (*)(void *, void))v4[2])(v4, *(void *)(*((void *)&v31 + 1) + 8 * (void)j));
              }
              id v17 = [v15 countByEnumeratingWithState:&v31 objects:v41 count:16];
            }
            while (v17);
          }

          uint64_t v6 = v14;
          id v10 = [v8 PKDictionaryForKey:v14];
          if (v10) {
            ((void (*)(void *, id))v4[2])(v4, v10);
          }
          id v5 = v25;
LABEL_23:

          continue;
        }
        id v12 = v11;
        if (!v5 || !v11)
        {

          goto LABEL_23;
        }
        unsigned int v13 = [v10 isEqualToString:v11];

        if (v13) {
          goto LABEL_12;
        }
      }
      id v30 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v30);
  }
  uint64_t v20 = v23;
  id v21 = objc_msgSend(v23, "copy", v23);

  return v21;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = +[NSMutableString stringWithFormat:@"<%@: %p; ", v4, self];

  [v5 appendFormat:@"entitlements: '%@'; ", self->_entitlements];
  [v5 appendFormat:@"shares: '%@'; ", self->_shares];
  [v5 appendFormat:@">"];
  id v6 = [v5 copy];

  return v6;
}

- (NSArray)shares
{
  return self->_shares;
}

- (void)setShares:(id)a3
{
}

- (NSArray)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_shares, 0);
}

@end