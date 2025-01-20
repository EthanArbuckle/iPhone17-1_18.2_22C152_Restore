@interface APIDAccount
+ (BOOL)supportsSecureCoding;
- (APIDAccount)initWithCoder:(id)a3;
- (APIDAccount)initWithIDAccountsRecord:(id)a3 storefront:(id)a4 monthlyIDResetCount:(id)a5;
- (BOOL)ageUnknown;
- (BOOL)isAdolescent;
- (BOOL)isAdult;
- (BOOL)isChild;
- (BOOL)isManagedAccount;
- (BOOL)isNoServicesRegion;
- (BOOL)isiCloudLoggedIn;
- (BOOL)isiCloudSameAsiTunes;
- (BOOL)isiTunesLoggedIn;
- (BOOL)sensitiveContentEligible;
- (NSNumber)iTunesDSID;
- (NSNumber)monthlyIDResetCount;
- (NSString)DPID;
- (NSString)storefront;
- (NSUUID)anonymousDemandID;
- (NSUUID)contentID;
- (NSUUID)deviceNewsPlusSubscriberID;
- (NSUUID)iAdID;
- (NSUUID)toroID;
- (id)_fakeID;
- (void)_performForceReconcile;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APIDAccount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  [v13 encodeBool:-[APIDAccount ageUnknown](self, "ageUnknown") forKey:@"ageUnknown"];
  v4 = [(APIDAccount *)self deviceNewsPlusSubscriberID];
  [v13 encodeObject:v4 forKey:@"deviceNewsPlusSubscriberID"];

  v5 = [(APIDAccount *)self anonymousDemandID];
  [v13 encodeObject:v5 forKey:@"anonymousDemandID"];

  v6 = [(APIDAccount *)self contentID];
  [v13 encodeObject:v6 forKey:@"contentID"];

  v7 = [(APIDAccount *)self DPID];
  [v13 encodeObject:v7 forKey:@"DPID"];

  v8 = [(APIDAccount *)self iAdID];
  [v13 encodeObject:v8 forKey:@"iAdID"];

  [v13 encodeBool:-[APIDAccount isAdolescent](self, "isAdolescent") forKey:@"isAdolescent"];
  [v13 encodeBool:-[APIDAccount isAdult](self, "isAdult") forKey:@"isAdult"];
  [v13 encodeBool:-[APIDAccount isChild](self, "isChild") forKey:@"isChild"];
  [v13 encodeBool:-[APIDAccount sensitiveContentEligible](self, "sensitiveContentEligible") forKey:@"sensitiveContentEligible"];
  [v13 encodeBool:-[APIDAccount isiCloudLoggedIn](self, "isiCloudLoggedIn") forKey:@"isiCloudLoggedIn"];
  [v13 encodeBool:-[APIDAccount isiCloudSameAsiTunes](self, "isiCloudSameAsiTunes") forKey:@"isiCloudSameAsiTunes"];
  [v13 encodeBool:-[APIDAccount isiTunesLoggedIn](self, "isiTunesLoggedIn") forKey:@"isiTunesLoggedIn"];
  [v13 encodeBool:-[APIDAccount isManagedAccount](self, "isManagedAccount") forKey:@"isManagedAccount"];
  v9 = [(APIDAccount *)self iTunesDSID];
  [v13 encodeObject:v9 forKey:@"iTunesDSID"];

  v10 = [(APIDAccount *)self monthlyIDResetCount];
  [v13 encodeObject:v10 forKey:@"monthlyIDResetCount"];

  v11 = [(APIDAccount *)self storefront];
  [v13 encodeObject:v11 forKey:@"storefront"];

  v12 = [(APIDAccount *)self toroID];
  [v13 encodeObject:v12 forKey:@"toroID"];

  [v13 encodeBool:-[APIDAccount isNoServicesRegion](self, "isNoServicesRegion") forKey:@"isNoServicesRegion"];
}

- (APIDAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(APIDAccount *)self init];
  if (v5)
  {
    v5->_ageUnknown = [v4 decodeBoolForKey:@"ageUnknown"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceNewsPlusSubscriberID"];
    deviceNewsPlusSubscriberID = v5->_deviceNewsPlusSubscriberID;
    v5->_deviceNewsPlusSubscriberID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anonymousDemandID"];
    anonymousDemandID = v5->_anonymousDemandID;
    v5->_anonymousDemandID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DPID"];
    DPID = v5->_DPID;
    v5->_DPID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iAdID"];
    iAdID = v5->_iAdID;
    v5->_iAdID = (NSUUID *)v14;

    v5->_isAdolescent = [v4 decodeBoolForKey:@"isAdolescent"];
    v5->_isAdult = [v4 decodeBoolForKey:@"isAdult"];
    v5->_isChild = [v4 decodeBoolForKey:@"isChild"];
    v5->_sensitiveContentEligible = [v4 decodeBoolForKey:@"sensitiveContentEligible"];
    v5->_isiCloudLoggedIn = [v4 decodeBoolForKey:@"isiCloudLoggedIn"];
    v5->_isiCloudSameAsiTunes = [v4 decodeBoolForKey:@"isiCloudSameAsiTunes"];
    v5->_isiTunesLoggedIn = [v4 decodeBoolForKey:@"isiTunesLoggedIn"];
    v5->_isManagedAccount = [v4 decodeBoolForKey:@"isManagedAccount"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iTunesDSID"];
    iTunesDSID = v5->_iTunesDSID;
    v5->_iTunesDSID = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"monthlyIDResetCount"];
    monthlyIDResetCount = v5->_monthlyIDResetCount;
    v5->_monthlyIDResetCount = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storefront"];
    storefront = v5->_storefront;
    v5->_storefront = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"toroID"];
    toroID = v5->_toroID;
    v5->_toroID = (NSUUID *)v22;

    v5->_isNoServicesRegion = [v4 decodeBoolForKey:@"isNoServicesRegion"];
  }

  return v5;
}

- (APIDAccount)initWithIDAccountsRecord:(id)a3 storefront:(id)a4 monthlyIDResetCount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(APIDAccount *)self init];
  if (v11)
  {
    id obj = a5;
    id v66 = v10;
    v64 = [v8 objectForKeyedSubscript:@"iTunesDSID"];
    uint64_t v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v64 integerValue]);
    iTunesDSID = v11->_iTunesDSID;
    v11->_iTunesDSID = (NSNumber *)v12;

    uint64_t v14 = [v8 objectForKeyedSubscript:@"isChild"];
    v11->_isChild = [v14 BOOLValue];

    v15 = [v8 objectForKeyedSubscript:@"isAdolescent"];
    v11->_isAdolescent = [v15 BOOLValue];

    uint64_t v16 = [v8 objectForKeyedSubscript:@"isAdult"];
    v11->_isAdult = [v16 BOOLValue];

    v17 = [v8 objectForKeyedSubscript:@"ageUnknown"];
    v11->_ageUnknown = [v17 BOOLValue];

    uint64_t v18 = [v8 objectForKeyedSubscript:@"sensitiveContentEligible"];
    v11->_sensitiveContentEligible = [v18 BOOLValue];

    v19 = [v8 objectForKeyedSubscript:@"isManagedAccount"];
    v11->_isManagedAccount = [v19 BOOLValue];

    uint64_t v20 = [v8 objectForKeyedSubscript:@"isiCloudLoggedIn"];
    v11->_isiCloudLoggedIn = [v20 BOOLValue];

    v21 = [v8 objectForKeyedSubscript:@"isiTunesLoggedIn"];
    v11->_isiTunesLoggedIn = [v21 BOOLValue];

    uint64_t v22 = [v8 objectForKeyedSubscript:@"isiCloudSameAsiTunes"];
    v11->_isiCloudSameAsiTunes = [v22 BOOLValue];

    v23 = [v8 objectForKeyedSubscript:@"isNoServicesRegion"];
    v11->_isNoServicesRegion = [v23 BOOLValue];

    v24 = [v8 objectForKeyedSubscript:@"deviceNewsPlusSubscriberID"];
    v25 = [v8 objectForKeyedSubscript:@"anonymousDemandID"];
    v26 = [v8 objectForKeyedSubscript:@"contentID"];
    v27 = [v8 objectForKeyedSubscript:@"toroID"];
    v28 = [v8 objectForKeyedSubscript:@"iAdID"];
    id v29 = objc_alloc((Class)NSUUID);
    v30 = v29;
    id v67 = v9;
    if (v25 && v26 && v27 && v28)
    {
      v31 = (NSUUID *)[v29 initWithUUIDString:v25];
      anonymousDemandID = v11->_anonymousDemandID;
      v11->_anonymousDemandID = v31;

      v33 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v26];
      contentID = v11->_contentID;
      v11->_contentID = v33;

      v35 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v27];
      toroID = v11->_toroID;
      v11->_toroID = v35;

      v37 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v28];
      iAdID = v11->_iAdID;
      v11->_iAdID = v37;

      if (!v11->_anonymousDemandID || !v11->_contentID || !v11->_toroID || !v11->_iAdID)
      {
        v68[0] = @"anonymousDemandIDRead";
        v68[1] = @"contentIDRead";
        v69[0] = v25;
        v69[1] = v26;
        v68[2] = @"toroIDRead";
        v68[3] = @"iAdIDRead";
        v69[2] = v27;
        v69[3] = v28;
        v39 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];
        CreateDiagnosticReport();
      }
    }
    else
    {
      v40 = [(APIDAccount *)v11 _fakeID];
      v41 = (NSUUID *)[v30 initWithUUIDString:v40];
      v42 = v11->_anonymousDemandID;
      v11->_anonymousDemandID = v41;

      id v43 = objc_alloc((Class)NSUUID);
      v44 = [(APIDAccount *)v11 _fakeID];
      v45 = (NSUUID *)[v43 initWithUUIDString:v44];
      v46 = v11->_contentID;
      v11->_contentID = v45;

      id v47 = objc_alloc((Class)NSUUID);
      v48 = [(APIDAccount *)v11 _fakeID];
      v49 = (NSUUID *)[v47 initWithUUIDString:v48];
      v50 = v11->_toroID;
      v11->_toroID = v49;

      id v51 = objc_alloc((Class)NSUUID);
      v52 = [(APIDAccount *)v11 _fakeID];
      v53 = (NSUUID *)[v51 initWithUUIDString:v52];
      v54 = v11->_iAdID;
      v11->_iAdID = v53;

      [(APIDAccount *)v11 _performForceReconcile];
    }
    id v55 = objc_alloc((Class)NSUUID);
    v56 = v55;
    if (v24)
    {
      v57 = (NSUUID *)[v55 initWithUUIDString:v24];
      deviceNewsPlusSubscriberID = v11->_deviceNewsPlusSubscriberID;
      v11->_deviceNewsPlusSubscriberID = v57;
    }
    else
    {
      deviceNewsPlusSubscriberID = [(APIDAccount *)v11 _fakeID];
      v59 = (NSUUID *)[v56 initWithUUIDString:deviceNewsPlusSubscriberID];
      v60 = v11->_deviceNewsPlusSubscriberID;
      v11->_deviceNewsPlusSubscriberID = v59;
    }
    uint64_t v61 = [v8 objectForKeyedSubscript:@"DPID"];
    DPID = v11->_DPID;
    v11->_DPID = (NSString *)v61;

    objc_storeStrong((id *)&v11->_storefront, a4);
    objc_storeStrong((id *)&v11->_monthlyIDResetCount, obj);

    id v10 = v66;
    id v9 = v67;
  }

  return v11;
}

- (id)_fakeID
{
  id v2 = [@"BAAAAAAD" length];
  v3 = +[NSUUID UUID];
  id v4 = [v3 UUIDString];
  v5 = [v4 stringByReplacingCharactersInRange:0 withString:@"BAAAAAAD"];

  if (!v5)
  {
    uint64_t v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "fakeIDString is nil", v8, 2u);
    }
  }

  return v5;
}

- (void)_performForceReconcile
{
}

- (BOOL)ageUnknown
{
  return self->_ageUnknown;
}

- (NSUUID)deviceNewsPlusSubscriberID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)anonymousDemandID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)contentID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)DPID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)iAdID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isAdolescent
{
  return self->_isAdolescent;
}

- (BOOL)isAdult
{
  return self->_isAdult;
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (BOOL)sensitiveContentEligible
{
  return self->_sensitiveContentEligible;
}

- (BOOL)isiCloudLoggedIn
{
  return self->_isiCloudLoggedIn;
}

- (BOOL)isiCloudSameAsiTunes
{
  return self->_isiCloudSameAsiTunes;
}

- (BOOL)isiTunesLoggedIn
{
  return self->_isiTunesLoggedIn;
}

- (BOOL)isManagedAccount
{
  return self->_isManagedAccount;
}

- (NSNumber)iTunesDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)monthlyIDResetCount
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)storefront
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSUUID)toroID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)isNoServicesRegion
{
  return self->_isNoServicesRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toroID, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_monthlyIDResetCount, 0);
  objc_storeStrong((id *)&self->_iTunesDSID, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_DPID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_anonymousDemandID, 0);

  objc_storeStrong((id *)&self->_deviceNewsPlusSubscriberID, 0);
}

@end