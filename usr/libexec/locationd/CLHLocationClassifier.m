@interface CLHLocationClassifier
- (BOOL)shouldFetchLocationsOfInterest;
- (BOOL)valid;
- (CLHLocationClassifier)init;
- (NSArray)gymLocations;
- (NSArray)homeLocations;
- (NSArray)schoolLocations;
- (NSArray)workLocations;
- (double)getLocationsOfInterestFetchTimeInterval;
- (id)initInUniverse:(id)a3;
- (id)jsonObject;
- (int64_t)loiTypeForLocation:(id)a3;
- (void)dealloc;
- (void)fetchLocationsOfInterestIfPossibleWithCompletionHandler:(id)a3;
- (void)setGymLocations:(id)a3;
- (void)setHomeLocations:(id)a3;
- (void)setSchoolLocations:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)setWorkLocations:(id)a3;
- (void)updateLocationsOfInterestFetchTimestamp;
@end

@implementation CLHLocationClassifier

- (CLHLocationClassifier)init
{
  self->_lastLocationsOfInterestFetchDate = 0;
  self->_locationsOfInterestFetchError = 0;
  self->_numConsecutiveFetchErrors = 0;
  self->_numFetchesOfLocationsOfInterest = 0;
  return 0;
}

- (id)initInUniverse:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLHLocationClassifier;
  v4 = [(CLHLocationClassifier *)&v7 init];
  if (v4)
  {
    v4->_universe = (CLIntersiloUniverse *)a3;
    [(CLHLocationClassifier *)v4 setValid:1];
    v5 = (CLRoutineMonitorServiceProtocol *)[objc_msgSend(objc_msgSend(a3, "vendor"), "proxyForService:", @"CLRoutineMonitor")];
    v4->_routineMonitor = v5;
    -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](v5, "registerDelegate:inSilo:", v4, [a3 silo]);
    [(CLRoutineMonitorServiceProtocol *)v4->_routineMonitor setDelegateEntityName:"CLHLocationClassifier"];
  }
  return v4;
}

- (double)getLocationsOfInterestFetchTimeInterval
{
  double result = 86400.0;
  if (self->_locationsOfInterestFetchError) {
    return 10.0;
  }
  return result;
}

- (BOOL)shouldFetchLocationsOfInterest
{
  if (!self->_lastLocationsOfInterestFetchDate) {
    return 1;
  }
  [(CLHLocationClassifier *)self getLocationsOfInterestFetchTimeInterval];
  id v4 = [objc_alloc((Class)NSDate) initWithTimeInterval:self->_lastLocationsOfInterestFetchDate sinceDate:v3];
  BOOL v5 = [[v4 compare:[+[NSDate date](NSDate, "date")]];

  return v5;
}

- (void)updateLocationsOfInterestFetchTimestamp
{
  lastLocationsOfInterestFetchDate = self->_lastLocationsOfInterestFetchDate;
  if (lastLocationsOfInterestFetchDate)
  {

    self->_lastLocationsOfInterestFetchDate = 0;
  }
  self->_lastLocationsOfInterestFetchDate = (NSDate *)objc_alloc_init((Class)NSDate);
}

- (void)fetchLocationsOfInterestIfPossibleWithCompletionHandler:(id)a3
{
  if (!a3) {
    sub_101AB57E4();
  }
  if ([(CLHLocationClassifier *)self shouldFetchLocationsOfInterest])
  {
    ++self->_numFetchesOfLocationsOfInterest;
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_102326640);
    }
    BOOL v5 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t numFetchesOfLocationsOfInterest = self->_numFetchesOfLocationsOfInterest;
      *(void *)buf = 68289282;
      *(_WORD *)v19 = 2082;
      *(void *)&v19[2] = "";
      *(_WORD *)&v19[10] = 2050;
      *(void *)&v19[12] = numFetchesOfLocationsOfInterest;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Fetching locations of interest\", \"NumFetches\":%{public}ld}", buf, 0x1Cu);
    }
    [(CLHLocationClassifier *)self updateLocationsOfInterestFetchTimestamp];
    self->_locationsOfInterestFetchError = 0;
    *(void *)buf = 0;
    *(void *)v19 = buf;
    *(void *)&v19[8] = 0x3052000000;
    *(void *)&v19[16] = sub_100177FB0;
    v20 = sub_10017770C;
    dispatch_group_t v21 = 0;
    dispatch_group_t v21 = dispatch_group_create();
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)v19 + 40));
    routineMonitor = self->_routineMonitor;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_101446D74;
    v17[3] = &unk_102326600;
    v17[4] = self;
    v17[5] = buf;
    [(CLRoutineMonitorServiceProtocol *)routineMonitor fetchLocationsOfInterestOfType:0 withReply:v17];
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)v19 + 40));
    v8 = self->_routineMonitor;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_101446F64;
    v16[3] = &unk_102326600;
    v16[4] = self;
    v16[5] = buf;
    [(CLRoutineMonitorServiceProtocol *)v8 fetchLocationsOfInterestOfType:1 withReply:v16];
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)v19 + 40));
    v9 = self->_routineMonitor;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_101447154;
    v15[3] = &unk_102326600;
    v15[4] = self;
    v15[5] = buf;
    [(CLRoutineMonitorServiceProtocol *)v9 fetchLocationsOfInterestOfType:2 withReply:v15];
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)v19 + 40));
    v10 = self->_routineMonitor;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_101447344;
    v14[3] = &unk_102326600;
    v14[4] = self;
    v14[5] = buf;
    [(CLRoutineMonitorServiceProtocol *)v10 fetchLocationsOfInterestOfType:3 withReply:v14];
    v11 = *(NSObject **)(*(void *)v19 + 40);
    v12 = [[-[CLIntersiloUniverse silo](self->_universe, "silo") queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_101447534;
    block[3] = &unk_10230F2F0;
    block[4] = self;
    block[5] = a3;
    block[6] = buf;
    dispatch_group_notify(v11, v12, block);
    _Block_object_dispose(buf, 8);
  }
}

- (int64_t)loiTypeForLocation:(id)a3
{
  [(CLHLocationClassifier *)self fetchLocationsOfInterestIfPossibleWithCompletionHandler:&stru_102326620];
  HIDWORD(v5) = -286331153 * rand() + 143165576;
  LODWORD(v5) = HIDWORD(v5);
  if ((v5 >> 1) <= 0x8888888)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_102326640);
    }
    v6 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v7 = [(NSArray *)self->_homeLocations count];
      NSUInteger v8 = [(NSArray *)self->_workLocations count];
      NSUInteger v9 = [(NSArray *)self->_schoolLocations count];
      NSUInteger v10 = [(NSArray *)self->_gymLocations count];
      uint64_t buf = 68290050;
      __int16 v54 = 2082;
      v55 = "";
      __int16 v56 = 2050;
      NSUInteger v57 = v7;
      __int16 v58 = 2050;
      NSUInteger v59 = v8;
      __int16 v60 = 2050;
      NSUInteger v61 = v9;
      __int16 v62 = 2050;
      NSUInteger v63 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"fetched locations of interest\", \"Home\":%{public}ld, \"Work\":%{public}ld, \"School\":%{public}ld, \"Gym\":%{public}ld}", (uint8_t *)&buf, 0x3Au);
    }
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  homeLocations = self->_homeLocations;
  id v12 = [(NSArray *)homeLocations countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v46;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(homeLocations);
        }
        if (sub_101446790(*(void **)(*((void *)&v45 + 1) + 8 * i), a3)) {
          return 0;
        }
      }
      id v13 = [(NSArray *)homeLocations countByEnumeratingWithState:&v45 objects:v52 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  workLocations = self->_workLocations;
  id v17 = [(NSArray *)workLocations countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v42;
    int64_t v20 = 1;
LABEL_16:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v42 != v19) {
        objc_enumerationMutation(workLocations);
      }
      if (sub_101446790(*(void **)(*((void *)&v41 + 1) + 8 * v21), a3)) {
        break;
      }
      if (v18 == (id)++v21)
      {
        id v18 = [(NSArray *)workLocations countByEnumeratingWithState:&v41 objects:v51 count:16];
        if (v18) {
          goto LABEL_16;
        }
        goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_22:
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    schoolLocations = self->_schoolLocations;
    id v23 = [(NSArray *)schoolLocations countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v38;
      int64_t v20 = 2;
LABEL_24:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(schoolLocations);
        }
        if (sub_101446790(*(void **)(*((void *)&v37 + 1) + 8 * v26), a3)) {
          break;
        }
        if (v24 == (id)++v26)
        {
          id v24 = [(NSArray *)schoolLocations countByEnumeratingWithState:&v37 objects:v50 count:16];
          if (v24) {
            goto LABEL_24;
          }
          goto LABEL_30;
        }
      }
    }
    else
    {
LABEL_30:
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      gymLocations = self->_gymLocations;
      id v28 = [(NSArray *)gymLocations countByEnumeratingWithState:&v33 objects:v49 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v34;
        while (2)
        {
          for (j = 0; j != v29; j = (char *)j + 1)
          {
            if (*(void *)v34 != v30) {
              objc_enumerationMutation(gymLocations);
            }
            if (sub_101446790(*(void **)(*((void *)&v33 + 1) + 8 * (void)j), a3)) {
              return 3;
            }
          }
          id v29 = [(NSArray *)gymLocations countByEnumeratingWithState:&v33 objects:v49 count:16];
          int64_t v20 = -1;
          if (v29) {
            continue;
          }
          break;
        }
      }
      else
      {
        return -1;
      }
    }
  }
  return v20;
}

- (void)dealloc
{
  lastLocationsOfInterestFetchDate = self->_lastLocationsOfInterestFetchDate;
  if (lastLocationsOfInterestFetchDate)
  {

    self->_lastLocationsOfInterestFetchDate = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CLHLocationClassifier;
  [(CLHLocationClassifier *)&v4 dealloc];
}

- (id)jsonObject
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  homeLocations = self->_homeLocations;
  id v5 = [(NSArray *)homeLocations countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v42;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(homeLocations);
        }
        [v3 addObject:sub_101447F50(*(void **)(*((void *)&v41 + 1) + 8 * i))];
      }
      id v6 = [(NSArray *)homeLocations countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v6);
  }
  id v9 = objc_alloc_init((Class)NSMutableArray);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  workLocations = self->_workLocations;
  id v11 = [(NSArray *)workLocations countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(workLocations);
        }
        [v9 addObject:sub_101447F50(*(void **)(*((void *)&v37 + 1) + 8 * (void)j))];
      }
      id v12 = [(NSArray *)workLocations countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v12);
  }
  id v15 = objc_alloc_init((Class)NSMutableArray);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  schoolLocations = self->_schoolLocations;
  id v17 = [(NSArray *)schoolLocations countByEnumeratingWithState:&v33 objects:v48 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(schoolLocations);
        }
        [v15 addObject:sub_101447F50(*(void **)(*((void *)&v33 + 1) + 8 * (void)k))];
      }
      id v18 = [(NSArray *)schoolLocations countByEnumeratingWithState:&v33 objects:v48 count:16];
    }
    while (v18);
  }
  id v21 = objc_alloc_init((Class)NSMutableArray);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  gymLocations = self->_gymLocations;
  id v23 = [(NSArray *)gymLocations countByEnumeratingWithState:&v29 objects:v47 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (m = 0; m != v24; m = (char *)m + 1)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(gymLocations);
        }
        [v21 addObject:sub_101447F50(*(void **)(*((void *)&v29 + 1) + 8 * (void)m))];
      }
      id v24 = [(NSArray *)gymLocations countByEnumeratingWithState:&v29 objects:v47 count:16];
    }
    while (v24);
  }
  v45[0] = @"home";
  v45[1] = @"work";
  v46[0] = v3;
  v46[1] = v9;
  v45[2] = @"school";
  v45[3] = @"gym";
  v46[2] = v15;
  v46[3] = v21;
  v27 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:4];

  return v27;
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (NSArray)homeLocations
{
  return self->_homeLocations;
}

- (void)setHomeLocations:(id)a3
{
}

- (NSArray)workLocations
{
  return self->_workLocations;
}

- (void)setWorkLocations:(id)a3
{
}

- (NSArray)schoolLocations
{
  return self->_schoolLocations;
}

- (void)setSchoolLocations:(id)a3
{
}

- (NSArray)gymLocations
{
  return self->_gymLocations;
}

- (void)setGymLocations:(id)a3
{
}

@end