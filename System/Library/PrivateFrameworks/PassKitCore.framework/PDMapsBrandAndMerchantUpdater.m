@interface PDMapsBrandAndMerchantUpdater
+ (BOOL)canUpdateMapsBrandForBrand:(id)a3 outConfiguration:(id *)a4;
+ (BOOL)canUpdateMapsBrandForPayLaterFinancingPlan:(id)a3 outConfiguration:(id *)a4;
+ (BOOL)canUpdateMapsBrandForTransaction:(id)a3 outConfiguration:(id *)a4;
+ (BOOL)canUpdateMapsMerchantForMerchant:(id)a3 outConfiguration:(id *)a4;
+ (BOOL)canUpdateMapsMerchantForPayLaterFinancingPlan:(id)a3 outConfiguration:(id *)a4;
+ (BOOL)canUpdateMapsMerchantForTransaction:(id)a3 outConfiguration:(id *)a4;
+ (id)_configurationForMapsBrand:(id)a3;
+ (id)_configurationForMapsMerchant:(id)a3;
+ (id)oldestPossibleLastProcessedDate;
- (BOOL)_validHeroImageForPhoto:(id)a3;
- (PDMapsBrandAndMerchantUpdater)initWithDataSource:(id)a3;
- (id)_bestHeroImageForMapItem:(id)a3 size:(CGSize)a4 allowSmaller:(BOOL)a5;
- (id)_heroImageProviderNameForMapItem:(id)a3;
- (id)traits;
- (void)_brandAndMerchantInformationForMapItems:(id)a3 completion:(id)a4;
- (void)_executeNextRequestIfPossible;
- (void)_startNextMapsUpdatesRequest:(id)a3 completion:(id)a4;
- (void)beginCoalesingMapsDataRequests;
- (void)endCoalesingMapsDataRequests;
- (void)merchantDataForMapsURL:(id)a3 completion:(id)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)updateMapsDataForConfiguration:(id)a3 completion:(id)a4;
- (void)updateMapsDataForConfigurations:(id)a3;
@end

@implementation PDMapsBrandAndMerchantUpdater

- (PDMapsBrandAndMerchantUpdater)initWithDataSource:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDMapsBrandAndMerchantUpdater;
  v6 = [(PDMapsBrandAndMerchantUpdater *)&v15 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    requests = v6->_requests;
    v6->_requests = v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
    v6->_lock._os_unfair_lock_opaque = 0;
    v9 = (MKMapService *)objc_alloc_init(off_100803DD0());
    mapService = v6->_mapService;
    v6->_mapService = v9;

    v11 = PDDefaultQueue();
    PDScheduledActivityClientRegister();

    v12 = +[NSDate date];
    v13 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v12];

    [v13 setRequireMainsPower:1];
    [v13 setRequireScreenSleep:1];
    [v13 setRequireNetworkConnectivity:1];
    [v13 setRepeating:1];
    [v13 setRepeatInterval:86400.0];
    PDScheduledActivityRegister();
  }
  return v6;
}

+ (id)oldestPossibleLastProcessedDate
{
  v2 = +[NSDate date];
  v3 = [v2 dateByAddingTimeInterval:-2592000.0];

  return v3;
}

+ (BOOL)canUpdateMapsMerchantForTransaction:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  v7 = [v6 merchant];
  v8 = [v7 mapsMerchant];

  id v9 = [v8 identifier];
  unsigned int v10 = [v8 resultProviderIdentifier];
  v11 = [v8 lastProcessedDate];
  v12 = [v6 transactionDate];
  v13 = [a1 oldestPossibleLastProcessedDate];
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v11)
  {
    v16 = [a1 oldestPossibleLastProcessedDate];
    [v11 timeIntervalSinceDate:v16];
    double v18 = v17;

    BOOL v19 = 0;
    if (!v9 || v15 >= 0.0 || v18 >= 0.0) {
      goto LABEL_11;
    }
  }
  else if (!v9)
  {
    BOOL v19 = 0;
    goto LABEL_11;
  }
  if (a4)
  {
    *a4 = [a1 _configurationForMapsMerchant:v8];
  }
  BOOL v19 = 1;
LABEL_11:
  v20 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = v9;
    if (v19) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    v22 = [v6 identifier];
    v23 = [v6 serviceIdentifier];
    uint64_t v24 = [v8 name];
    signed int v25 = v10;
    v26 = (void *)v24;
    *(_DWORD *)buf = 138414082;
    CFStringRef v30 = v21;
    __int16 v31 = 2112;
    v32 = v22;
    __int16 v33 = 2112;
    v34 = v23;
    __int16 v35 = 2112;
    uint64_t v36 = v24;
    __int16 v37 = 2112;
    v38 = v11;
    __int16 v39 = 2048;
    id v40 = v28;
    __int16 v41 = 2048;
    uint64_t v42 = v25;
    __int16 v43 = 2112;
    v44 = v12;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Can update maps merchant %@ for identifier %@, serviceIdentifier %@, name %@, mapsMerchantLastProcessedDate %@, mapsMerchantMUID %ld, mapsMerchantResultProviderID %ld, transactionDate %@", buf, 0x52u);
  }
  return v19;
}

+ (BOOL)canUpdateMapsMerchantForPayLaterFinancingPlan:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  v7 = [v6 merchant];
  v8 = [v7 mapsMerchant];
  id v9 = [v8 identifier];
  unsigned int v10 = [v8 resultProviderIdentifier];
  v11 = [v8 lastProcessedDate];
  v12 = [v6 planSummary];
  v13 = [v12 transactionDate];

  double v14 = [a1 oldestPossibleLastProcessedDate];
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v11)
  {
    BOOL v19 = [a1 oldestPossibleLastProcessedDate];
    [v11 timeIntervalSinceDate:v19];
    double v18 = v17;

    LODWORD(v19) = 0;
    if (!v9 || v16 >= 0.0 || v18 >= 0.0) {
      goto LABEL_11;
    }
  }
  else if (!v9)
  {
    LODWORD(v19) = 0;
    goto LABEL_11;
  }
  if (a4)
  {
    *a4 = [a1 _configurationForMapsMerchant:v8];
  }
  LODWORD(v19) = 1;
LABEL_11:
  v20 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v21 = v19 == 0;
    CFStringRef v30 = v13;
    char v22 = (char)v19;
    BOOL v19 = v9;
    v23 = v7;
    if (v21) {
      CFStringRef v24 = @"NO";
    }
    else {
      CFStringRef v24 = @"YES";
    }
    signed int v25 = [v6 planIdentifier];
    uint64_t v26 = [v8 name];
    signed int v27 = v10;
    id v28 = (void *)v26;
    *(_DWORD *)buf = 138413826;
    CFStringRef v32 = v24;
    v7 = v23;
    __int16 v33 = 2112;
    v34 = v25;
    __int16 v35 = 2112;
    uint64_t v36 = v26;
    __int16 v37 = 2112;
    v38 = v11;
    __int16 v39 = 2048;
    id v40 = v19;
    LOBYTE(v19) = v22;
    v13 = v30;
    __int16 v41 = 2048;
    uint64_t v42 = v27;
    __int16 v43 = 2112;
    v44 = v30;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Can update financing plan maps merchant %@ for identifier %@, name %@, mapsMerchantLastProcessedDate %@, mapsMerchantMUID %ld, mapsMerchantResultProviderID %ld, transactionDate %@", buf, 0x48u);
  }
  return (char)v19;
}

+ (BOOL)canUpdateMapsBrandForTransaction:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  v7 = [v6 merchant];
  v8 = [v7 mapsBrand];

  id v9 = [v8 identifier];
  unsigned int v10 = [v8 resultProviderIdentifier];
  v11 = [v8 lastProcessedDate];
  v12 = [v6 transactionDate];
  v13 = [a1 oldestPossibleLastProcessedDate];
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v11)
  {
    double v16 = [a1 oldestPossibleLastProcessedDate];
    [v11 timeIntervalSinceDate:v16];
    double v18 = v17;

    BOOL v19 = 0;
    if (!v9 || v15 >= 0.0 || v18 >= 0.0) {
      goto LABEL_11;
    }
  }
  else if (!v9)
  {
    BOOL v19 = 0;
    goto LABEL_11;
  }
  if (a4)
  {
    *a4 = [a1 _configurationForMapsBrand:v8];
  }
  BOOL v19 = 1;
LABEL_11:
  v20 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = v9;
    if (v19) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    char v22 = [v6 identifier];
    v23 = [v6 serviceIdentifier];
    uint64_t v24 = [v8 name];
    signed int v25 = v10;
    uint64_t v26 = (void *)v24;
    *(_DWORD *)buf = 138414082;
    CFStringRef v30 = v21;
    __int16 v31 = 2112;
    CFStringRef v32 = v22;
    __int16 v33 = 2112;
    v34 = v23;
    __int16 v35 = 2112;
    uint64_t v36 = v24;
    __int16 v37 = 2112;
    v38 = v11;
    __int16 v39 = 2048;
    id v40 = v28;
    __int16 v41 = 2048;
    uint64_t v42 = v25;
    __int16 v43 = 2112;
    v44 = v12;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Can update maps brand %@ for identifier %@, serviceIdentifier %@, name %@, mapsBrandLastProcessedDate %@, mapsBrandMUID %ld, mapsMerchantResultProviderID %ld, transactionDate %@", buf, 0x52u);
  }
  return v19;
}

+ (BOOL)canUpdateMapsBrandForPayLaterFinancingPlan:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  v7 = [v6 merchant];
  v8 = [v7 mapsBrand];
  id v9 = [v8 identifier];
  unsigned int v10 = [v8 resultProviderIdentifier];
  v11 = [v8 lastProcessedDate];
  v12 = [v6 planSummary];
  v13 = [v12 transactionDate];

  double v14 = [a1 oldestPossibleLastProcessedDate];
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v11)
  {
    BOOL v19 = [a1 oldestPossibleLastProcessedDate];
    [v11 timeIntervalSinceDate:v19];
    double v18 = v17;

    LODWORD(v19) = 0;
    if (!v9 || v16 >= 0.0 || v18 >= 0.0) {
      goto LABEL_11;
    }
  }
  else if (!v9)
  {
    LODWORD(v19) = 0;
    goto LABEL_11;
  }
  if (a4)
  {
    *a4 = [a1 _configurationForMapsBrand:v8];
  }
  LODWORD(v19) = 1;
LABEL_11:
  v20 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v21 = v19 == 0;
    CFStringRef v30 = v13;
    char v22 = (char)v19;
    BOOL v19 = v9;
    v23 = v7;
    if (v21) {
      CFStringRef v24 = @"NO";
    }
    else {
      CFStringRef v24 = @"YES";
    }
    signed int v25 = [v6 planIdentifier];
    uint64_t v26 = [v8 name];
    signed int v27 = v10;
    id v28 = (void *)v26;
    *(_DWORD *)buf = 138413826;
    CFStringRef v32 = v24;
    v7 = v23;
    __int16 v33 = 2112;
    v34 = v25;
    __int16 v35 = 2112;
    uint64_t v36 = v26;
    __int16 v37 = 2112;
    v38 = v11;
    __int16 v39 = 2048;
    id v40 = v19;
    LOBYTE(v19) = v22;
    v13 = v30;
    __int16 v41 = 2048;
    uint64_t v42 = v27;
    __int16 v43 = 2112;
    v44 = v30;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Can update financing plan merchant maps brand %@ for identifier %@, name %@, mapsBrandLastProcessedDate %@, mapsBrandMUID %ld, mapsMerchantResultProviderID %ld, transactionDate %@", buf, 0x48u);
  }
  return (char)v19;
}

+ (BOOL)canUpdateMapsMerchantForMerchant:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  signed int v8 = [v6 resultProviderIdentifier];
  id v9 = [v6 lastProcessedDate];
  if (v9)
  {
    unsigned int v10 = [a1 oldestPossibleLastProcessedDate];
    [v9 timeIntervalSinceDate:v10];
    BOOL v12 = v11 < 0.0;
  }
  else
  {
    BOOL v12 = 1;
  }
  if (v7) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }
  if (a4 && v13)
  {
    *a4 = [a1 _configurationForMapsMerchant:v6];
  }
  double v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v13) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    double v16 = [v6 name];
    int v18 = 138413314;
    CFStringRef v19 = v15;
    __int16 v20 = 2112;
    BOOL v21 = v16;
    __int16 v22 = 2112;
    v23 = v9;
    __int16 v24 = 2048;
    id v25 = v7;
    __int16 v26 = 2048;
    uint64_t v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Can update maps merchant %@, name %@, mapsMerchantLastProcessedDate %@, mapsMerchantMUID %ld, mapsMerchantResultProviderID %ld", (uint8_t *)&v18, 0x34u);
  }
  return v13;
}

+ (BOOL)canUpdateMapsBrandForBrand:(id)a3 outConfiguration:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  signed int v8 = [v6 resultProviderIdentifier];
  id v9 = [v6 lastProcessedDate];
  if (v9)
  {
    unsigned int v10 = [a1 oldestPossibleLastProcessedDate];
    [v9 timeIntervalSinceDate:v10];
    BOOL v12 = v11 < 0.0;
  }
  else
  {
    BOOL v12 = 1;
  }
  if (v7) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }
  if (a4 && v13)
  {
    *a4 = [a1 _configurationForMapsBrand:v6];
  }
  double v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v13) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    double v16 = [v6 name];
    int v18 = 138413314;
    CFStringRef v19 = v15;
    __int16 v20 = 2112;
    BOOL v21 = v16;
    __int16 v22 = 2112;
    v23 = v9;
    __int16 v24 = 2048;
    id v25 = v7;
    __int16 v26 = 2048;
    uint64_t v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Can update maps brand %@, name %@, mapsBrandLastProcessedDate %@, mapsBrandMUID %ld, mapsMerchantResultProviderID %ld", (uint8_t *)&v18, 0x34u);
  }
  return v13;
}

+ (id)_configurationForMapsMerchant:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  id v5 = [v3 resultProviderIdentifier];
  [v3 locationLatitude];
  CLLocationDegrees v7 = v6;
  [v3 locationLongitude];
  CLLocationDegrees v9 = v8;

  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v7, v9);
  double v11 = -[PDMapsBrandAndMerchantUpdaterConfiguration initWithMUID:resultProviderID:coordinate:]([PDMapsBrandAndMerchantUpdaterConfiguration alloc], "initWithMUID:resultProviderID:coordinate:", v4, v5, v10.latitude, v10.longitude);
  return v11;
}

+ (id)_configurationForMapsBrand:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  id v5 = [v3 resultProviderIdentifier];

  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(0.0, 0.0);
  CLLocationDegrees v7 = -[PDMapsBrandAndMerchantUpdaterConfiguration initWithMUID:resultProviderID:coordinate:]([PDMapsBrandAndMerchantUpdaterConfiguration alloc], "initWithMUID:resultProviderID:coordinate:", v4, v5, v6.latitude, v6.longitude);
  return v7;
}

- (void)beginCoalesingMapsDataRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_coalesingRequests)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Begin coalesing PDMapsBrandAndMerchantUpdater requests.", v5, 2u);
    }

    self->_coalesingRequests = 1;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)endCoalesingMapsDataRequests
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_coalesingRequests)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "End coalesing PDMapsBrandAndMerchantUpdater requests.", v5, 2u);
    }

    self->_coalesingRequests = 0;
    os_unfair_lock_unlock(p_lock);
    [(PDMapsBrandAndMerchantUpdater *)self _executeNextRequestIfPossible];
  }
}

- (void)updateMapsDataForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    double v8 = [PKPaymentTransactionMapsUpdateProcessorRequest alloc];
    id v9 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v7, 0);

    CLLocationCoordinate2D v10 = [(PKPaymentTransactionMapsUpdateProcessorRequest *)v8 initWithConfigurations:v9];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100024110;
    v11[3] = &unk_10072DF88;
    id v12 = v6;
    [(PDMapsBrandAndMerchantUpdater *)self _startNextMapsUpdatesRequest:v10 completion:v11];
  }
}

- (void)merchantDataForMapsURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [objc_alloc(off_100803DD8()) initWithMapsURL:v6];
    if (v8)
    {
      id v9 = [objc_alloc(off_100803DE0()) initWithRequest:v8];
      objc_initWeak(&location, self);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100024334;
      v10[3] = &unk_10072DFB0;
      objc_copyWeak(&v12, &location);
      id v11 = v7;
      [v9 startWithCompletionHandler:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)updateMapsDataForConfigurations:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 mutableCopy];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v6 = self->_requests;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v44;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v43 + 1) + 8 * v10) configurations];
        id v12 = +[NSSet setWithArray:v11];
        [v5 minusSet:v12];

        if (!v5) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if ([v5 count])
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v34 = self;
      BOOL v13 = self->_requests;
      id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v39 objects:v50 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v40;
LABEL_13:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * v17) coalesceWithConfigurations:v5];
          if (!v5) {
            break;
          }
          if (v15 == (id)++v17)
          {
            id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v39 objects:v50 count:16];
            if (v15) {
              goto LABEL_13;
            }
            break;
          }
        }
      }

      if ([v5 count])
      {
        int v18 = [v5 allObjects];
        uint64_t v19 = (uint64_t)[v18 count];
        id v20 = objc_alloc_init((Class)NSMutableArray);
        if (v19 >= 1)
        {
          uint64_t v21 = 0;
          uint64_t v22 = v19;
          do
          {
            uint64_t v23 = v22 - 100;
            if (v22 >= 100) {
              uint64_t v24 = 100;
            }
            else {
              uint64_t v24 = v22;
            }
            id v25 = objc_msgSend(v18, "subarrayWithRange:", v21, v24);
            [v20 addObject:v25];

            v21 += 100;
            uint64_t v22 = v23;
          }
          while (v21 < v19);
        }
        id v26 = objc_alloc_init((Class)NSMutableArray);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v27 = v20;
        id v28 = [v27 countByEnumeratingWithState:&v35 objects:v49 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v36;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v36 != v30) {
                objc_enumerationMutation(v27);
              }
              CFStringRef v32 = [[PKPaymentTransactionMapsUpdateProcessorRequest alloc] initWithConfigurations:*(void *)(*((void *)&v35 + 1) + 8 * i)];
              [v26 addObject:v32];
            }
            id v29 = [v27 countByEnumeratingWithState:&v35 objects:v49 count:16];
          }
          while (v29);
        }

        os_unfair_lock_lock(&v34->_lock);
        [(NSMutableArray *)v34->_requests addObjectsFromArray:v26];
        __int16 v33 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v48 = v26;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Maps update requests queued %@", buf, 0xCu);
        }

        os_unfair_lock_unlock(&v34->_lock);
        [(PDMapsBrandAndMerchantUpdater *)v34 _executeNextRequestIfPossible];
      }
    }
  }
}

- (void)_startNextMapsUpdatesRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  mapService = self->_mapService;
  id v8 = [a3 mapIdentifiers];
  uint64_t v9 = [(PDMapsBrandAndMerchantUpdater *)self traits];
  uint64_t v10 = [(MKMapService *)mapService ticketForIdentifiers:v8 traits:v9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002498C;
  v12[3] = &unk_10072DFD8;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v10 submitWithHandler:v12 networkActivity:0];
}

- (void)_brandAndMerchantInformationForMapItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  long long v42 = (void (**)(id, id, id))a4;
  id v44 = objc_alloc_init((Class)NSMutableArray);
  id v43 = objc_alloc_init((Class)NSMutableArray);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v6;
  id v47 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v51;
    id v48 = self;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v51 != v46) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v9 = [v8 _geoMapItem];
        uint64_t v10 = [v9 _mapsCategoryId];
        uint64_t v11 = [v9 _walletCategoryIdentifier];
        id v12 = objc_alloc(off_100803DE8());
        id v13 = [v9 _walletPlaceStyling];
        id v14 = [v12 initWithStyleAttributes:v13];

        v49 = (void *)v11;
        uint64_t v15 = PKMerchantCategoryFromString();
        uint64_t v16 = objc_msgSend(v8, "_bestWalletHeroImageForSize:allowSmaller:", 1, 1.79769313e308, 1.79769313e308);
        uint64_t v17 = [v8 _walletHeroImageProviderName];
        if (!v16)
        {
          uint64_t v16 = -[PDMapsBrandAndMerchantUpdater _bestHeroImageForMapItem:size:allowSmaller:](self, "_bestHeroImageForMapItem:size:allowSmaller:", v9, 1, 1.79769313e308, 1.79769313e308);
          uint64_t v18 = [(PDMapsBrandAndMerchantUpdater *)self _heroImageProviderNameForMapItem:v9];

          uint64_t v17 = (void *)v18;
          self = v48;
        }
        unsigned int v19 = [v8 _isMapItemTypeBrand];
        dataSource = self->_dataSource;
        id v21 = [v8 _muid];
        if (v19)
        {
          id v22 = [(PDMapsBrandAndMerchantUpdaterDataSource *)dataSource mapsBrandWithIdentifier:v21];
          if (!v22) {
            id v22 = objc_alloc_init((Class)PKMapsBrand);
          }
          objc_msgSend(v22, "setIdentifier:", objc_msgSend(v8, "_muid"));
          objc_msgSend(v22, "setResultProviderIdentifier:", objc_msgSend(v8, "_resultProviderID"));
          uint64_t v23 = [v8 name];
          [v22 setName:v23];

          uint64_t v24 = [v8 phoneNumber];
          [v22 setPhoneNumber:v24];

          id v25 = [v8 url];
          [v22 setURL:v25];

          id v26 = objc_msgSend(v8, "_bestBrandIconURLForSize:allowSmaller:", 1, 500.0, 500.0);
          [v22 setLogoURL:v26];

          [v22 setCategory:v15];
          [v22 setDetailedCategory:v10];
          if (v14)
          {
            id v27 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
            [v22 setStylingInfoData:v27];
          }
          [v22 setHeroImageURL:v16];
          [v22 setHeroImageAttributionName:v17];
          id v28 = +[NSDate date];
          [v22 setLastProcessedDate:v28];

          id v29 = v49;
          if ([v22 isValid])
          {
            uint64_t v30 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v55 = v22;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Updating maps brand %@", buf, 0xCu);
            }

            [(PDMapsBrandAndMerchantUpdaterDataSource *)v48->_dataSource updateMapsBrand:v22];
            [v43 addObject:v22];
          }
        }
        else
        {
          id v22 = [(PDMapsBrandAndMerchantUpdaterDataSource *)dataSource mapsMerchantWithIdentifier:v21];
          if (!v22) {
            id v22 = objc_alloc_init((Class)PKMapsMerchant);
          }
          objc_msgSend(v22, "setIdentifier:", objc_msgSend(v8, "_muid"));
          objc_msgSend(v22, "setResultProviderIdentifier:", objc_msgSend(v8, "_resultProviderID"));
          __int16 v31 = [v8 name];
          [v22 setName:v31];

          CFStringRef v32 = [v8 phoneNumber];
          [v22 setPhoneNumber:v32];

          __int16 v33 = [v8 url];
          [v22 setURL:v33];

          v34 = [v8 placemark];
          long long v35 = [v34 location];
          [v22 setLocation:v35];

          long long v36 = [v34 postalAddress];
          [v22 setPostalAddress:v36];

          [v22 setCategory:v15];
          [v22 setDetailedCategory:v10];
          if (v14)
          {
            long long v37 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
            [v22 setStylingInfoData:v37];
          }
          [v22 setHeroImageURL:v16];
          [v22 setHeroImageAttributionName:v17];
          long long v38 = +[NSDate date];
          [v22 setLastProcessedDate:v38];

          if ([v22 isValid])
          {
            long long v39 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v55 = v22;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Updating maps merchant %@", buf, 0xCu);
            }

            [(PDMapsBrandAndMerchantUpdaterDataSource *)v48->_dataSource updateMapsMerchant:v22];
            [v44 addObject:v22];
          }

          id v29 = v49;
        }

        self = v48;
      }
      id v47 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v47);
  }

  if (v42)
  {
    id v40 = [v44 copy];
    id v41 = [v43 copy];
    v42[2](v42, v40, v41);
  }
}

- (id)traits
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_traits)
  {
    id v4 = [(MKMapService *)self->_mapService defaultTraits];
    traits = self->_traits;
    self->_traits = v4;

    [(GEOMapServiceTraits *)self->_traits setWantsBrandIcon:1];
    [(GEOMapServiceTraits *)self->_traits setSupportsBrandFallback:1];
  }
  os_unfair_lock_unlock(p_lock);
  id v6 = self->_traits;
  return v6;
}

- (id)_bestHeroImageForMapItem:(id)a3 size:(CGSize)a4 allowSmaller:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  uint64_t v10 = [v9 _photos];
  uint64_t v11 = [v10 firstObject];

  if ([(PDMapsBrandAndMerchantUpdater *)self _validHeroImageForPhoto:v11])
  {
    id v12 = objc_msgSend(v11, "bestPhotoForSize:allowSmaller:", v5, width, height);
    id v13 = [v12 url];

    if (v13)
    {
      id v14 = [v12 url];

      goto LABEL_6;
    }
  }
  id v14 = objc_msgSend(v9, "_bestHeroBrandIconURLForSize:allowSmaller:", v5, width, height);
LABEL_6:

  return v14;
}

- (id)_heroImageProviderNameForMapItem:(id)a3
{
  id v4 = [a3 _photos];
  BOOL v5 = [v4 firstObject];

  if ([(PDMapsBrandAndMerchantUpdater *)self _validHeroImageForPhoto:v5])
  {
    id v6 = [v5 attribution];
    id v7 = [v6 providerName];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_validHeroImageForPhoto:(id)a3
{
  id v3 = a3;
  int BOOL = GEOConfigGetBOOL();
  int v5 = GEOConfigGetBOOL();
  int v6 = v5;
  if (BOOL)
  {
    unsigned int v7 = [v3 highQuality];
    if ((v7 & v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else if (!v5)
  {
    LOBYTE(v7) = 1;
    goto LABEL_7;
  }
  LOBYTE(v7) = [v3 businessProvided];
LABEL_7:

  return v7;
}

- (void)_executeNextRequestIfPossible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_coalesingRequests || self->_currentRequest)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v4 = [(NSMutableArray *)self->_requests firstObject];
    currentRequest = self->_currentRequest;
    self->_currentRequest = v4;

    int v6 = self->_currentRequest;
    if (v6)
    {
      [(NSMutableArray *)self->_requests removeObjectAtIndex:0];
      int v6 = self->_currentRequest;
    }
    unsigned int v7 = v6;
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(PKPaymentTransactionMapsUpdateProcessorRequest *)v7 configurations];
        *(_DWORD *)buf = 138412546;
        id v12 = v7;
        __int16 v13 = 2048;
        id v14 = [v9 count];
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting maps update request %@ with %ld items", buf, 0x16u);
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000255A4;
      v10[3] = &unk_10072E000;
      void v10[4] = self;
      [(PDMapsBrandAndMerchantUpdater *)self _startNextMapsUpdatesRequest:v7 completion:v10];
    }
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (__CFString *)v6;
  id v9 = v8;
  if (v8 == @"PDMapsBrandAndMerchantUpdaterActivityIdentifier"
    || v8
    && (unsigned int v10 = [(__CFString *)v8 isEqualToString:@"PDMapsBrandAndMerchantUpdaterActivityIdentifier"], v9, v10))
  {
    uint64_t v11 = +[NSDate date];
    id v12 = [v11 dateByAddingTimeInterval:-2592000.0];

    __int16 v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Starting maps merchant brand and merchant updater scheduled activity for maps data last updated prior to %@.", buf, 0xCu);
    }

    id v14 = [(PDMapsBrandAndMerchantUpdaterDataSource *)self->_dataSource mapsMerchantsWithLastUpdatedDateFromStartDate:0 endDate:v12 limit:50];
    uint64_t v15 = [(PDMapsBrandAndMerchantUpdaterDataSource *)self->_dataSource mapsBrandsWithLastUpdatedDateFromStartDate:0 endDate:v12 limit:50];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v15 count];
      id v17 = [v14 count];
      *(_DWORD *)buf = 134218240;
      id v44 = v16;
      __int16 v45 = 2048;
      id v46 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating %ld maps brands and %ld maps merchants", buf, 0x16u);
    }
    id v32 = v7;

    id v18 = objc_alloc_init((Class)NSMutableSet);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v19 = v14;
    id v20 = [v19 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v38;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = [(id)objc_opt_class() _configurationForMapsMerchant:*(void *)(*((void *)&v37 + 1) + 8 * (void)v23)];
          [v18 addObject:v24];

          uint64_t v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v21);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v25 = v15;
    id v26 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v34;
      do
      {
        id v29 = 0;
        do
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = [(id)objc_opt_class() _configurationForMapsBrand:*(void *)(*((void *)&v33 + 1) + 8 * (void)v29)];
          [v18 addObject:v30];

          id v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v27 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v27);
    }

    if ([v18 count])
    {
      id v31 = [v18 copy];
      [(PDMapsBrandAndMerchantUpdater *)self updateMapsDataForConfigurations:v31];
    }
    id v7 = v32;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_mapService, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

@end