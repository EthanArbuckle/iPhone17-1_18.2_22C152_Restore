@interface UAUserActivityAdvertisableItem
- (BOOL)alwaysEligible;
- (BOOL)alwaysPick;
- (BOOL)eligibleInBackground;
- (BOOL)eligibleToAdvertise;
- (BOOL)eligibleToAlwaysAdvertise;
- (BOOL)isDirty;
- (BOOL)needsUpdateBeforeAdvertising;
- (BOOL)requestPayloadWithCompletionHandlerEvenIfClean:(BOOL)a3 withCompletionHandler:(id)a4;
- (BOOL)update:(id)a3;
- (BOOL)wasResumedOnAnotherDeviceWithCompletionHandler:(id)a3;
- (NSString)proxiedBundleIdentifier;
- (UAUserActivityAdvertisableItem)initWithUUID:(id)a3 type:(unint64_t)a4 options:(id)a5 client:(id)a6;
- (UAUserActivityAdvertisableItem)initWithUserActivityInfo:(id)a3 client:(id)a4;
- (UAUserActivityClientProcess)client;
- (id)provenance;
- (id)webpageURL;
- (int64_t)alwaysPickValue;
- (void)setClient:(id)a3;
- (void)setWebpageURL:(id)a3;
@end

@implementation UAUserActivityAdvertisableItem

- (UAUserActivityAdvertisableItem)initWithUserActivityInfo:(id)a3 client:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UAUserActivityAdvertisableItem;
  v7 = [(UAUserActivityAdvertisableItem *)&v10 initWithUserActivityInfo:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_client, v6);
  }

  return v8;
}

- (BOOL)alwaysEligible
{
  v3 = [(UAUserActivityAdvertisableItem *)self options];
  v4 = [v3 objectForKey:UAAlwaysAdvertise];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v4 integerValue])
  {
    v5 = [(UAUserActivityAdvertisableItem *)self client];
    unsigned __int8 v6 = [v5 allowedToUseUAAlwaysAdvertise];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)eligibleInBackground
{
  v3 = [(UAUserActivityAdvertisableItem *)self options];
  v4 = [v3 objectForKey:UAUserActivityEligibleEvenWhenInBackgroundKey];

  if ((uint64_t)[v4 integerValue] >= 1
    && ([(UAUserActivityAdvertisableItem *)self client],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 allowedToUseEligibleEvenWhenInBackground],
        v5,
        v6))
  {
    v7 = [(UAUserActivityAdvertisableItem *)self client];
    unsigned __int8 v8 = [v7 allowedToUseEligibleEvenWhenInBackground];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)eligibleToAdvertise
{
  v3 = [(UAUserActivityAdvertisableItem *)self client];
  v4 = [(UAUserActivityAdvertisableItem *)self uuid];
  unsigned int v5 = [v3 isEligibleToAdvertiseWithUUID:v4];

  if (!v5) {
    return [(UAUserActivityAdvertisableItem *)self eligibleToAlwaysAdvertise] | v5;
  }
  uint64_t v6 = [(UAUserActivityAdvertisableItem *)self expirationDate];
  if (!v6) {
    return [(UAUserActivityAdvertisableItem *)self eligibleToAlwaysAdvertise] | v5;
  }
  v7 = (void *)v6;
  unsigned __int8 v8 = [(UAUserActivityAdvertisableItem *)self expirationDate];
  v9 = +[NSDate date];
  unint64_t v10 = (unint64_t)[v8 compare:v9];

  if ((v10 & 0x8000000000000000) == 0) {
    return [(UAUserActivityAdvertisableItem *)self eligibleToAlwaysAdvertise] | v5;
  }
  v12 = sub_10000BA18(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = [(UAUserActivityAdvertisableItem *)self uuid];
    v14 = [v13 UUIDString];
    v15 = [(UAAdvertisableItem *)self statusString];
    v16 = [(UAUserActivityAdvertisableItem *)self expirationDate];
    int v17 = 138543875;
    v18 = v14;
    __int16 v19 = 2113;
    v20 = v15;
    __int16 v21 = 2114;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "-- item %{public}@/%{private}@ not eligible, because it has expired (on %{public}@)", (uint8_t *)&v17, 0x20u);
  }
  return 0;
}

- (BOOL)eligibleToAlwaysAdvertise
{
  v3 = [(UAUserActivityAdvertisableItem *)self client];
  v4 = [(UAUserActivityAdvertisableItem *)self uuid];
  unsigned __int8 v5 = [v3 isEligibleToAlwaysAdvertiseWithUUID:v4];

  return v5;
}

- (BOOL)alwaysPick
{
  v3 = [(UAUserActivityAdvertisableItem *)self client];
  unsigned int v4 = [v3 allowedToUseLSAlwaysPick];

  if (!v4) {
    return 0;
  }
  unsigned __int8 v5 = [(UAUserActivityAdvertisableItem *)self options];
  uint64_t v6 = [v5 objectForKey:UAUserActivityAlwaysPickKey];

  if (v6) {
    BOOL v7 = (uint64_t)[v6 integerValue] > 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (UAUserActivityClientProcess)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  return (UAUserActivityClientProcess *)WeakRetained;
}

- (id)webpageURL
{
  v4.receiver = self;
  v4.super_class = (Class)UAUserActivityAdvertisableItem;
  v2 = [(UAUserActivityAdvertisableItem *)&v4 webpageURL];

  return v2;
}

- (BOOL)update:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 title];
  [(UAUserActivityAdvertisableItem *)self setTitle:v5];

  uint64_t v6 = [v4 payloads];
  [(UAUserActivityAdvertisableItem *)self setPayloads:v6];

  BOOL v7 = [v4 expirationDate];
  [(UAUserActivityAdvertisableItem *)self setExpirationDate:v7];

  unsigned __int8 v8 = [v4 webpageURL];
  [(UAUserActivityAdvertisableItem *)self setWebpageURL:v8];

  v9 = [v4 referrerURL];
  [(UAUserActivityAdvertisableItem *)self setReferrerURL:v9];

  unint64_t v10 = [v4 targetContentIdentifier];
  [(UAUserActivityAdvertisableItem *)self setTargetContentIdentifier:v10];

  v11 = [v4 persistentIdentifier];
  [(UAUserActivityAdvertisableItem *)self setPersistentIdentifier:v11];

  v12 = [v4 options];
  [(UAUserActivityAdvertisableItem *)self setOptions:v12];

  v13 = [v4 when];
  [(UAUserActivityAdvertisableItem *)self setWhen:v13];

  -[UAUserActivityAdvertisableItem setEligibleForHandoff:](self, "setEligibleForHandoff:", [v4 eligibleForHandoff]);
  -[UAUserActivityAdvertisableItem setEligibleForSearch:](self, "setEligibleForSearch:", [v4 eligibleForSearch]);
  id v14 = [v4 eligibleForPublicIndexing];

  [(UAUserActivityAdvertisableItem *)self setEligibleForPublicIndexing:v14];
  return 1;
}

- (void)setWebpageURL:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(UAUserActivityAdvertisableItem *)self webpageURL],
        unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v4 isEqual:v5],
        v5,
        (v6 & 1) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)UAUserActivityAdvertisableItem;
    [(UAUserActivityAdvertisableItem *)&v7 setWebpageURL:v4];
  }
}

- (NSString)proxiedBundleIdentifier
{
  v3 = [(UAUserActivityAdvertisableItem *)self options];
  id v4 = [v3 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"];

  if (v4)
  {
    unsigned __int8 v5 = [(UAUserActivityAdvertisableItem *)self options];
    unsigned __int8 v6 = [v5 objectForKeyedSubscript:@"UAProxiedBundleIdentifier"];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return (NSString *)v6;
}

- (UAUserActivityAdvertisableItem)initWithUUID:(id)a3 type:(unint64_t)a4 options:(id)a5 client:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)UAUserActivityAdvertisableItem;
  v11 = [(UAUserActivityAdvertisableItem *)&v15 initWithUUID:a3 type:a4 options:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_client, v10);
    v13 = [v10 teamID];
    [(UAUserActivityAdvertisableItem *)v12 setTeamIdentifier:v13];
  }
  return v12;
}

- (int64_t)alwaysPickValue
{
  v3 = [(UAUserActivityAdvertisableItem *)self options];
  id v4 = [v3 objectForKey:UAUserActivityAlwaysPickKey];

  if (v4
    && ([(UAUserActivityAdvertisableItem *)self client],
        unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 allowedToUseLSAlwaysPick],
        v5,
        v6))
  {
    id v7 = [v4 integerValue];
  }
  else
  {
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (id)provenance
{
  v3 = [(UAUserActivityAdvertisableItem *)self client];
  id v4 = [(UAUserActivityAdvertisableItem *)self uuid];
  if (v3)
  {
    unsigned __int8 v5 = [(UAUserActivityAdvertisableItem *)self client];
    unsigned int v6 = [v5 auditToken];
    id v7 = [v6 pid];
    unsigned __int8 v8 = [(UAUserActivityAdvertisableItem *)self activityType];
    uint64_t v9 = [(UAUserActivityAdvertisableItem *)self dynamicActivityType];
    id v10 = (void *)v9;
    CFStringRef v11 = &stru_1000C6800;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    v12 = +[NSString stringWithFormat:@"UA:%@-%d/%@-%@", v4, v7, v8, v11];
  }
  else
  {
    unsigned __int8 v5 = [(UAUserActivityAdvertisableItem *)self activityType];
    uint64_t v13 = [(UAUserActivityAdvertisableItem *)self dynamicActivityType];
    unsigned int v6 = (void *)v13;
    CFStringRef v14 = &stru_1000C6800;
    if (v13) {
      CFStringRef v14 = (const __CFString *)v13;
    }
    v12 = +[NSString stringWithFormat:@"UA:%@/%@-%@", v4, v5, v14];
  }

  return v12;
}

- (BOOL)isDirty
{
  v3 = [(UAUserActivityAdvertisableItem *)self client];
  id v4 = [(UAUserActivityAdvertisableItem *)self uuid];
  unsigned __int8 v5 = [v3 isDirtyActivityWithUUID:v4];

  return v5;
}

- (BOOL)needsUpdateBeforeAdvertising
{
  return 0;
}

- (BOOL)requestPayloadWithCompletionHandlerEvenIfClean:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = sub_10000BA18(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v8 = [(UAUserActivityAdvertisableItem *)self uuid];
    uint64_t v9 = [v8 UUIDString];
    id v10 = [(UAUserActivityAdvertisableItem *)self client];
    CFStringRef v11 = [v10 auditToken];
    int v17 = 138543618;
    v18 = v9;
    __int16 v19 = 2114;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "requestPayload...:, %{public}@ from client application %{public}@", (uint8_t *)&v17, 0x16u);
  }
  v12 = [(UAUserActivityAdvertisableItem *)self client];
  if (v12)
  {
    uint64_t v13 = [(UAUserActivityAdvertisableItem *)self client];
    CFStringRef v14 = [(UAUserActivityAdvertisableItem *)self uuid];
    unsigned __int8 v15 = [v13 askSourceProcessToUpdateActivityWithUUID:v14 evenIfClean:v4 completionHandler:v6];
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (BOOL)wasResumedOnAnotherDeviceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(UAUserActivityAdvertisableItem *)self uuid];
    id v7 = [v6 UUIDString];
    unsigned __int8 v8 = [(UAUserActivityAdvertisableItem *)self client];
    uint64_t v9 = [v8 auditToken];
    int v15 = 138543618;
    v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = (int)[v9 pid];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "wasResumedOnAnotherDevice, %{public}@ to client pid=%ld", (uint8_t *)&v15, 0x16u);
  }
  id v10 = [(UAUserActivityAdvertisableItem *)self client];
  if (v10)
  {
    CFStringRef v11 = [(UAUserActivityAdvertisableItem *)self client];
    v12 = [(UAUserActivityAdvertisableItem *)self uuid];
    unsigned __int8 v13 = [v11 didResumeUserActivityWithUUID:v12 completionHandler:v4];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end