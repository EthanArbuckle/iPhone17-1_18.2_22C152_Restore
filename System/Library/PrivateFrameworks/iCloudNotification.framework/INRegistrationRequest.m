@interface INRegistrationRequest
+ (Class)responseClass;
+ (id)bodyParameterValueForRegistrationReason:(unint64_t)a3;
- (id)_audioAccessoryInfo;
- (id)addBodyParameters:(id)a3;
- (id)urlString;
- (unint64_t)registrationReason;
- (void)setRegistrationReason:(unint64_t)a3;
@end

@implementation INRegistrationRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 registerDeviceURL];

  return v3;
}

+ (id)bodyParameterValueForRegistrationReason:(unint64_t)a3
{
  if (a3 > 9) {
    return @"unknown";
  }
  else {
    return *(&off_100040DB8 + a3);
  }
}

- (id)addBodyParameters:(id)a3
{
  id v49 = a3;
  id v63 = [v49 mutableCopy];
  v65 = self;
  v61 = +[INRegistrationRequest bodyParameterValueForRegistrationReason:self->_registrationReason];
  [v63 setObject:v61 forKeyedSubscript:@"cause"];
  v4 = [(INRequest *)self account];
  v5 = [v4 enabledDataclasses];
  v6 = [v5 allObjects];
  id v7 = [v6 mutableCopy];

  [v7 sortUsingComparator:&stru_100040D10];
  if (v7) {
    [v63 setObject:v7 forKeyedSubscript:@"enabledDataClasses"];
  }
  id v64 = [v63 objectForKeyedSubscript:@"deviceInfo"];
  if (!v64) {
    id v64 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v8 = [(INRequest *)self deviceInfoProvider];
  v60 = [v8 productVersion];

  if (v60) {
    [v64 setObject:v60 forKeyedSubscript:@"productVersion"];
  }
  v9 = [(INRequest *)self deviceInfoProvider];
  v59 = [v9 productType];

  if (v59) {
    [v64 setObject:v59 forKeyedSubscript:@"productType"];
  }
  v10 = [(INRequest *)self deviceInfoProvider];
  v58 = [v10 deviceClass];

  if (v58) {
    [v64 setObject:v58 forKeyedSubscript:@"deviceClass"];
  }
  v11 = [(INRequest *)self deviceInfoProvider];
  v57 = [v11 deviceName];

  if (v57) {
    [v64 setObject:v57 forKeyedSubscript:@"deviceName"];
  }
  v12 = [(INRequest *)self deviceInfoProvider];
  v13 = [v12 storageCapacity];
  v56 = [v13 stringValue];

  if (v56) {
    [v64 setObject:v56 forKeyedSubscript:@"storageCapacity"];
  }
  v14 = [(INRequest *)self deviceInfoProvider];
  unsigned int v15 = [v14 hasCellularCapability];

  if (v15)
  {
    v16 = +[NSNumber numberWithBool:1];
    [v64 setObject:v16 forKeyedSubscript:@"hasCellularCapability"];
  }
  v17 = +[INCachedDeviceInfo currentDeviceInfo];
  v18 = [v17 mobileEquipmentIdentifier];

  if (v18) {
    [v64 setObject:v18 forKeyedSubscript:@"meid"];
  }
  v19 = [(INRequest *)self deviceInfoProvider];
  v55 = [v19 internationalMobileEquipmentIdentity];

  if (v55) {
    [v64 setObject:v55 forKeyedSubscript:@"imei"];
  }
  v20 = [(INRequest *)self deviceInfoProvider];
  v54 = [v20 deviceColor];

  if (v54) {
    [v64 setObject:v54 forKeyedSubscript:@"deviceColor"];
  }
  v21 = +[INCachedDeviceInfo currentDeviceInfo];
  v53 = [v21 deviceEnclosureColor];

  if (v53) {
    [v64 setObject:v53 forKeyedSubscript:@"enclosureColor"];
  }
  v22 = [(INRequest *)self deviceInfoProvider];
  v52 = [v22 deviceCoverGlassColor];

  if (v52) {
    [v64 setObject:v52 forKeyedSubscript:@"deviceCoverGlassColor"];
  }
  v23 = [(INRequest *)self deviceInfoProvider];
  v51 = [v23 deviceHousingColor];

  if (v51) {
    [v64 setObject:v51 forKeyedSubscript:@"deviceHousingColor"];
  }
  v24 = [(INRequest *)self deviceInfoProvider];
  v50 = [v24 deviceBackingColor];

  if (v50) {
    [v64 setObject:v50 forKeyedSubscript:@"deviceBackingColor"];
  }
  [v63 setObject:v64 forKeyedSubscript:@"deviceInfo"];
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2050000000;
  v25 = (void *)qword_10004E440;
  uint64_t v79 = qword_10004E440;
  if (!qword_10004E440)
  {
    v71 = _NSConcreteStackBlock;
    uint64_t v72 = 3221225472;
    v73 = sub_100005384;
    v74 = &unk_100040D60;
    v75 = &v76;
    sub_100005384((uint64_t)&v71);
    v25 = (void *)v77[3];
  }
  id v26 = v25;
  _Block_object_dispose(&v76, 8);
  v27 = [v26 sharedInstance];
  v62 = [v27 getDevices];

  if ([v62 count])
  {
    id v66 = objc_alloc_init((Class)NSMutableArray);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v28 = v62;
    id v29 = [v28 countByEnumeratingWithState:&v67 objects:v81 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v68;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v68 != v30) {
            objc_enumerationMutation(v28);
          }
          v32 = v18;
          id v33 = v7;
          v34 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          uint64_t v76 = 0;
          v77 = &v76;
          uint64_t v78 = 0x2020000000;
          v35 = (void *)qword_10004E450;
          uint64_t v79 = qword_10004E450;
          if (!qword_10004E450)
          {
            v71 = _NSConcreteStackBlock;
            uint64_t v72 = 3221225472;
            v73 = sub_100005550;
            v74 = &unk_100040D60;
            v75 = &v76;
            v36 = (void *)sub_1000053DC();
            v37 = dlsym(v36, "NRDevicePropertyUDID");
            *(void *)(v75[1] + 24) = v37;
            qword_10004E450 = *(void *)(v75[1] + 24);
            v35 = (void *)v77[3];
          }
          _Block_object_dispose(&v76, 8);
          if (!v35)
          {
            sub_1000261F0();
            __break(1u);
          }
          v38 = [v34 valueForProperty:*v35];
          id v7 = v33;
          v18 = v32;
          if (v38) {
            [v66 addObject:v38];
          }
        }
        id v29 = [v28 countByEnumeratingWithState:&v67 objects:v81 count:16];
      }
      while (v29);
    }

    [v63 setObject:v66 forKeyedSubscript:@"pairedUDIDs"];
  }
  v39 = [(INRegistrationRequest *)v65 _audioAccessoryInfo];
  if ([v39 count]) {
    [v63 setObject:v39 forKeyedSubscript:@"audioAccessoryInfo"];
  }
  v40 = [(INRequest *)v65 account];
  id v41 = objc_msgSend(v40, "aa_isSuspended");

  v42 = +[NSNumber numberWithBool:v41];
  [v63 setObject:v42 forKeyedSubscript:@"isAccountInGrayMode"];

  if (v41)
  {
    id v43 = objc_alloc_init((Class)AAFollowUpController);
    uint64_t v80 = AAFollowUpIdentifierVerifyTerms;
    v44 = +[NSArray arrayWithObjects:&v80 count:1];
    v45 = [v43 creationDateOfOldestFollowUpWithIdentifiers:v44];

    [v45 timeIntervalSince1970];
    if (v46 == 0.0) {
      double v46 = -1.0;
    }
    v47 = +[NSNumber numberWithDouble:v46];
    [v63 setObject:v47 forKeyedSubscript:@"verifyTermsCFUTimestamp"];
  }
  return v63;
}

- (id)_audioAccessoryInfo
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[FMDFMIPManager sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005160;
  v11[3] = &unk_100040D38;
  id v5 = v3;
  id v12 = v5;
  dispatch_semaphore_t v13 = v2;
  v6 = v2;
  [v4 audioAccessorySerialNumbersWithCompletion:v11];

  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v6, v7);
  dispatch_semaphore_t v8 = v13;
  id v9 = v5;

  return v9;
}

- (unint64_t)registrationReason
{
  return self->_registrationReason;
}

- (void)setRegistrationReason:(unint64_t)a3
{
  self->_registrationReason = a3;
}

@end