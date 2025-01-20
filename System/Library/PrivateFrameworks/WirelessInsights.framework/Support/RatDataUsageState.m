@interface RatDataUsageState
+ (BOOL)calculateDeltaAndUpdateInterfaceInfo:(id)a3 withCounters:(id)a4 withResponseBlock:(id)a5;
+ (BOOL)updateInterfaceInfo:(id)a3 withCounters:(id)a4;
+ (id)deriveCellularRadioTech:(id)a3 andRegistrationState:(id)a4 andIsSatelliteSystem:(BOOL)a5 andIsStewieActive:(BOOL)a6;
+ (id)fetchInterfaceCounters;
- (BOOL)isCellularInterfaceExpensive;
- (BOOL)isCellularLowDataModeEnabled;
- (BOOL)isSatelliteSystem;
- (BOOL)isStewieActive;
- (NSString)cellularRegistrationState;
- (NSString)rawCellularRadioTech;
- (NSUUID)contextUUID;
- (NetworkInterfaceInfo)primary;
- (NetworkInterfaceInfo)secondary;
- (RatDataUsageState)initWithContext:(id)a3 cellularRegistrationState:(id)a4 isCellularLowDataModeEnabled:(BOOL)a5 isCellularInterfaceExpensive:(BOOL)a6 isSatelliteSystem:(BOOL)a7 isStewieActive:(BOOL)a8;
- (unint64_t)startTime;
- (void)submitToCA;
- (void)submitToCAWithCounters:(id)a3;
- (void)updateCellularRadioTechTo:(id)a3;
- (void)updateIsCellularInterfaceExpensiveTo:(BOOL)a3;
- (void)updateIsLowDataModeEnabledTo:(BOOL)a3;
- (void)updateIsSatelliteSystemTo:(BOOL)a3;
- (void)updateIsStewieActiveTo:(BOOL)a3;
- (void)updateNetworkPathsToPrimary:(id)a3 secondary:(id)a4;
- (void)updateRegistrationStateTo:(id)a3;
@end

@implementation RatDataUsageState

- (RatDataUsageState)initWithContext:(id)a3 cellularRegistrationState:(id)a4 isCellularLowDataModeEnabled:(BOOL)a5 isCellularInterfaceExpensive:(BOOL)a6 isSatelliteSystem:(BOOL)a7 isStewieActive:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  v25.receiver = self;
  v25.super_class = (Class)RatDataUsageState;
  v17 = [(RatDataUsageState *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contextUUID, a3);
    __uint64_t v19 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    rawCellularRadioTech = v18->_rawCellularRadioTech;
    v18->_startTime = v19;
    v18->_rawCellularRadioTech = 0;

    objc_storeStrong((id *)&v18->_cellularRegistrationState, a4);
    v18->_isCellularLowDataModeEnabled = a5;
    v18->_isCellularInterfaceExpensive = a6;
    v18->_isSatelliteSystem = a7;
    v18->_isStewieActive = a8;
    primary = v18->_primary;
    v18->_primary = 0;

    secondary = v18->_secondary;
    v18->_secondary = 0;

    v23 = v18;
  }

  return v18;
}

- (void)updateNetworkPathsToPrimary:(id)a3 secondary:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  uint64_t v9 = [(RatDataUsageState *)self primary];
  if (v7 | v9)
  {
    __uint64_t v19 = [(RatDataUsageState *)self primary];
    if (!v7 || !v19) {
      goto LABEL_19;
    }
    v18 = [(RatDataUsageState *)self primary];
    unsigned int v10 = [v18 index];
    if (v10 != [(id)v7 index])
    {
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
  }
  uint64_t v11 = [(RatDataUsageState *)self secondary];
  if (!(v8 | v11))
  {
    if (v7 | v9)
    {
    }
    goto LABEL_15;
  }
  v12 = [(RatDataUsageState *)self secondary];
  v13 = v12;
  if (!v8 || !v12)
  {

    if (!(v7 | v9))
    {
LABEL_20:

LABEL_21:
      id v15 = +[RatDataUsageState fetchInterfaceCounters];
      [(RatDataUsageState *)self submitToCAWithCounters:v15];
      if (v7
        && !+[RatDataUsageState updateInterfaceInfo:v7 withCounters:v15])
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
          sub_100140E04();
        }
      }
      else if (v8 {
             && !+[RatDataUsageState updateInterfaceInfo:v8 withCounters:v15])
      }
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
          sub_100140D90();
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_primary, a3);
        objc_storeStrong((id *)&self->_secondary, a4);
      }

      goto LABEL_31;
    }
    goto LABEL_18;
  }
  v14 = [(RatDataUsageState *)self secondary];
  unsigned int v17 = [v14 index];
  unsigned int v16 = [(id)v8 index];

  if (v7 | v9)
  {
  }
  if (v17 != v16) {
    goto LABEL_21;
  }
LABEL_15:
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_100140D5C();
  }
LABEL_31:
}

- (void)updateCellularRadioTechTo:(id)a3
{
  id v5 = a3;
  v6 = [(RatDataUsageState *)self rawCellularRadioTech];
  if (!v6
    || ([(RatDataUsageState *)self rawCellularRadioTech],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v5 isEqualToString:v7],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
      sub_100140E78();
    }
    uint64_t v9 = [(RatDataUsageState *)self rawCellularRadioTech];
    unsigned int v10 = [(RatDataUsageState *)self cellularRegistrationState];
    uint64_t v11 = +[RatDataUsageState deriveCellularRadioTech:v9 andRegistrationState:v10 andIsSatelliteSystem:[(RatDataUsageState *)self isSatelliteSystem] andIsStewieActive:[(RatDataUsageState *)self isStewieActive]];

    v12 = [(RatDataUsageState *)self cellularRegistrationState];
    v13 = +[RatDataUsageState deriveCellularRadioTech:v5 andRegistrationState:v12 andIsSatelliteSystem:[(RatDataUsageState *)self isSatelliteSystem] andIsStewieActive:[(RatDataUsageState *)self isStewieActive]];

    if (([v11 isEqualToString:v13] & 1) == 0) {
      [(RatDataUsageState *)self submitToCA];
    }
    objc_storeStrong((id *)&self->_rawCellularRadioTech, a3);
  }
}

- (void)updateRegistrationStateTo:(id)a3
{
  id v5 = a3;
  v6 = [(RatDataUsageState *)self cellularRegistrationState];
  unsigned __int8 v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
      sub_100140EE4();
    }
    unsigned __int8 v8 = [(RatDataUsageState *)self rawCellularRadioTech];
    uint64_t v9 = [(RatDataUsageState *)self cellularRegistrationState];
    unsigned int v10 = +[RatDataUsageState deriveCellularRadioTech:v8 andRegistrationState:v9 andIsSatelliteSystem:[(RatDataUsageState *)self isSatelliteSystem] andIsStewieActive:[(RatDataUsageState *)self isStewieActive]];

    uint64_t v11 = [(RatDataUsageState *)self rawCellularRadioTech];
    v12 = +[RatDataUsageState deriveCellularRadioTech:v11 andRegistrationState:v5 andIsSatelliteSystem:[(RatDataUsageState *)self isSatelliteSystem] andIsStewieActive:[(RatDataUsageState *)self isStewieActive]];

    if (([v10 isEqualToString:v12] & 1) == 0) {
      [(RatDataUsageState *)self submitToCA];
    }
    objc_storeStrong((id *)&self->_cellularRegistrationState, a3);
  }
}

- (void)updateIsLowDataModeEnabledTo:(BOOL)a3
{
  if ([(RatDataUsageState *)self isCellularLowDataModeEnabled] != a3)
  {
    [(RatDataUsageState *)self submitToCA];
    self->_isCellularLowDataModeEnabled = a3;
  }
}

- (void)updateIsCellularInterfaceExpensiveTo:(BOOL)a3
{
  if ([(RatDataUsageState *)self isCellularInterfaceExpensive] != a3)
  {
    [(RatDataUsageState *)self submitToCA];
    self->_isCellularInterfaceExpensive = a3;
  }
}

- (void)updateIsSatelliteSystemTo:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RatDataUsageState *)self isSatelliteSystem] != a3)
  {
    id v5 = [(RatDataUsageState *)self rawCellularRadioTech];
    v6 = [(RatDataUsageState *)self cellularRegistrationState];
    id v10 = +[RatDataUsageState deriveCellularRadioTech:v5 andRegistrationState:v6 andIsSatelliteSystem:[(RatDataUsageState *)self isSatelliteSystem] andIsStewieActive:[(RatDataUsageState *)self isStewieActive]];

    unsigned __int8 v7 = [(RatDataUsageState *)self rawCellularRadioTech];
    unsigned __int8 v8 = [(RatDataUsageState *)self cellularRegistrationState];
    uint64_t v9 = +[RatDataUsageState deriveCellularRadioTech:v7 andRegistrationState:v8 andIsSatelliteSystem:v3 andIsStewieActive:[(RatDataUsageState *)self isStewieActive]];

    if (([v10 isEqualToString:v9] & 1) == 0) {
      [(RatDataUsageState *)self submitToCA];
    }
    self->_isSatelliteSystem = v3;
  }
}

- (void)updateIsStewieActiveTo:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RatDataUsageState *)self isStewieActive] != a3)
  {
    id v5 = [(RatDataUsageState *)self rawCellularRadioTech];
    v6 = [(RatDataUsageState *)self cellularRegistrationState];
    id v10 = +[RatDataUsageState deriveCellularRadioTech:v5 andRegistrationState:v6 andIsSatelliteSystem:[(RatDataUsageState *)self isSatelliteSystem] andIsStewieActive:[(RatDataUsageState *)self isStewieActive]];

    unsigned __int8 v7 = [(RatDataUsageState *)self rawCellularRadioTech];
    unsigned __int8 v8 = [(RatDataUsageState *)self cellularRegistrationState];
    uint64_t v9 = +[RatDataUsageState deriveCellularRadioTech:v7 andRegistrationState:v8 andIsSatelliteSystem:[(RatDataUsageState *)self isSatelliteSystem] andIsStewieActive:v3];

    if (([v10 isEqualToString:v9] & 1) == 0) {
      [(RatDataUsageState *)self submitToCA];
    }
    self->_isStewieActive = v3;
  }
}

- (void)submitToCA
{
  id v3 = +[RatDataUsageState fetchInterfaceCounters];
  -[RatDataUsageState submitToCAWithCounters:](self, "submitToCAWithCounters:");
}

- (void)submitToCAWithCounters:(id)a3
{
  id v4 = a3;
  __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  if (v5 < [(RatDataUsageState *)self startTime])
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
      sub_100140F50();
    }
LABEL_4:
    self->_startTime = v5;
    primary = self->_primary;
    self->_primary = 0;

    secondary = self->_secondary;
    self->_secondary = 0;

    goto LABEL_47;
  }
  if (!v4)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
      sub_100140F84();
    }
    goto LABEL_4;
  }
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  unsigned __int8 v8 = [(RatDataUsageState *)self primary];
  BOOL v9 = v8 == 0;

  if (!v9)
  {
    id v10 = [(RatDataUsageState *)self primary];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100025068;
    v52[3] = &unk_1001B5E90;
    v52[4] = &v81;
    v52[5] = &v77;
    v52[6] = &v73;
    v52[7] = &v69;
    unsigned __int8 v11 = +[RatDataUsageState calculateDeltaAndUpdateInterfaceInfo:v10 withCounters:v4 withResponseBlock:v52];

    if ((v11 & 1) == 0)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
        sub_10014108C();
      }
      v12 = self->_primary;
      self->_primary = 0;
    }
  }
  v13 = [(RatDataUsageState *)self secondary];
  BOOL v14 = v13 == 0;

  if (!v14)
  {
    id v15 = [(RatDataUsageState *)self secondary];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10002509C;
    v51[3] = &unk_1001B5E90;
    v51[4] = &v65;
    v51[5] = &v61;
    v51[6] = &v57;
    v51[7] = &v53;
    unsigned __int8 v16 = +[RatDataUsageState calculateDeltaAndUpdateInterfaceInfo:v15 withCounters:v4 withResponseBlock:v51];

    if ((v16 & 1) == 0)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
        sub_100141058();
      }
      unsigned int v17 = self->_secondary;
      self->_secondary = 0;
    }
  }
  unint64_t v18 = v5 - [(RatDataUsageState *)self startTime];
  unint64_t v19 = v18 / 0xF4240;
  self->_startTime = v5;
  if (v18 > 0x5F5E0FF)
  {
    if ([(RatDataUsageState *)self isCellularInterfaceExpensive]
      || ![(RatDataUsageState *)self isCellularLowDataModeEnabled])
    {
      if ([(RatDataUsageState *)self isCellularInterfaceExpensive])
      {
        unsigned int v20 = [(RatDataUsageState *)self isCellularLowDataModeEnabled];
        v21 = @"Standard";
        if (v20) {
          v21 = @"Low";
        }
      }
      else
      {
        v21 = @"Allow More";
      }
      v46 = v21;
      v22 = [(RatDataUsageState *)self rawCellularRadioTech];
      v23 = [(RatDataUsageState *)self cellularRegistrationState];
      v47 = +[RatDataUsageState deriveCellularRadioTech:v22 andRegistrationState:v23 andIsSatelliteSystem:[(RatDataUsageState *)self isSatelliteSystem] andIsStewieActive:[(RatDataUsageState *)self isStewieActive]];

      if (v47)
      {
        v85[0] = @"cellular_radio_tech";
        v85[1] = @"data_mode_switch_status";
        v86[0] = v47;
        v86[1] = v46;
        v85[2] = @"primary_network_path";
        v44 = [(RatDataUsageState *)self primary];
        if (v44)
        {
          v24 = [(RatDataUsageState *)self primary];
          uint64_t v25 = [v24 typeAsString];
        }
        else
        {
          uint64_t v25 = +[NSNull null];
          v24 = (void *)v25;
        }
        v38 = (void *)v25;
        v86[2] = v25;
        v85[3] = @"secondary_network_path";
        v42 = v24;
        v45 = [(RatDataUsageState *)self secondary];
        if (v45)
        {
          v43 = [(RatDataUsageState *)self secondary];
          uint64_t v27 = [v43 typeAsString];
        }
        else
        {
          uint64_t v27 = +[NSNull null];
          v43 = (void *)v27;
        }
        v86[3] = v27;
        v85[4] = @"duration_ms";
        v41 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v19, v27);
        v86[4] = v41;
        v85[5] = @"rx_primary_bytes";
        v40 = +[NSNumber numberWithUnsignedLongLong:v82[3]];
        v86[5] = v40;
        v85[6] = @"tx_primary_bytes";
        v28 = +[NSNumber numberWithUnsignedLongLong:v78[3]];
        v86[6] = v28;
        v85[7] = @"rx_primary_packets";
        v29 = +[NSNumber numberWithUnsignedLongLong:v74[3]];
        v86[7] = v29;
        v85[8] = @"tx_primary_packets";
        v30 = +[NSNumber numberWithUnsignedLongLong:v70[3]];
        v86[8] = v30;
        v85[9] = @"rx_secondary_bytes";
        v31 = +[NSNumber numberWithUnsignedLongLong:v66[3]];
        v86[9] = v31;
        v85[10] = @"tx_secondary_bytes";
        v32 = +[NSNumber numberWithUnsignedLongLong:v62[3]];
        v86[10] = v32;
        v85[11] = @"rx_secondary_packets";
        v33 = +[NSNumber numberWithUnsignedLongLong:v58[3]];
        v86[11] = v33;
        v85[12] = @"tx_secondary_packets";
        v34 = +[NSNumber numberWithUnsignedLongLong:v54[3]];
        v86[12] = v34;
        v39 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:13];

        if (v45) {
        if (v44)
        }

        v35 = +[NSString stringWithUTF8String:"com.apple.Telephony.ratDataUsage"];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_1000250D0;
        v48[3] = &unk_1001B5EB8;
        id v36 = v39;
        id v49 = v36;
        sub_100005B9C(v35, v48);
      }
      else
      {
        v26 = *(NSObject **)(qword_1001D8080 + 48);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "RatDataUsageMetric:#I cellularRadioTech not available yet, skipping submission", buf, 2u);
        }
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      sub_100141024();
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
  {
    sub_100140FB8();
  }
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);
LABEL_47:
}

+ (id)deriveCellularRadioTech:(id)a3 andRegistrationState:(id)a4 andIsSatelliteSystem:(BOOL)a5 andIsStewieActive:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  if (v6) {
    unsigned __int8 v11 = @"Satellite";
  }
  else {
    unsigned __int8 v11 = @"LTE NTN";
  }
  if (!v6 && !a5)
  {
    if (+[WISTelephonyUtils isRegistrationDisplayStatusOutOfService:v10])
    {
      unsigned __int8 v11 = @"NoService";
    }
    else
    {
      unsigned __int8 v11 = (__CFString *)v9;
    }
  }

  return v11;
}

+ (id)fetchInterfaceCounters
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  *(_OWORD *)v38 = xmmword_1001740C0;
  uint64_t v39 = 6;
  size_t size = 0;
  if (sysctl(v38, 6u, 0, &size, 0, 0) < 0) {
    goto LABEL_18;
  }
  id v3 = (unsigned __int16 *)malloc_type_malloc(size, 0x4FC80337uLL);
  if (!v3) {
    goto LABEL_19;
  }
  if (sysctl(v38, 6u, v3, &size, 0, 0) < 0)
  {
    free(v3);
LABEL_18:
    id v3 = 0;
    goto LABEL_19;
  }
  uint64_t v27 = v3;
  v29 = v2;
  if ((uint64_t)size < 1)
  {
LABEL_16:
    free(v27);
    id v2 = v29;
    id v3 = (unsigned __int16 *)[objc_alloc((Class)NSDictionary) initWithDictionary:v29];
  }
  else
  {
    __uint64_t v5 = v3;
    unint64_t v32 = (unint64_t)v3 + size;
    *(void *)&long long v4 = 138412290;
    long long v26 = v4;
    while (1)
    {
      uint64_t v6 = *v5;
      if (!*v5) {
        break;
      }
      if (*((unsigned char *)v5 + 3) == 18 && *((unsigned char *)v5 + 161) == 18 && v5[81])
      {
        uint64_t v8 = *((void *)v5 + 12);
        uint64_t v7 = *((void *)v5 + 13);
        uint64_t v9 = *((void *)v5 + 7);
        uint64_t v28 = *((void *)v5 + 9);
        v30 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:");
        id v10 = objc_msgSend(v29, "objectForKey:");
        v31 = v10;
        if (v10)
        {
          unsigned __int8 v11 = *(NSObject **)(qword_1001D8080 + 48);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v37 = v30;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "RatDataUsageMetric:#N Duplicate byte counter entry for index %@", buf, 0xCu);
          }
          v12 = objc_msgSend(v10, "objectForKey:", @"rx_bytes", v26);
          id v13 = [v12 unsignedLongLongValue];

          BOOL v14 = [v10 objectForKey:@"tx_bytes"];
          id v15 = [v14 unsignedLongLongValue];

          unsigned __int8 v16 = [v10 objectForKey:@"rx_packets"];
          id v17 = [v16 unsignedLongLongValue];

          unint64_t v18 = [v31 objectForKey:@"tx_packets"];
          id v19 = [v18 unsignedLongLongValue];

          v8 += (uint64_t)v13;
          v7 += (uint64_t)v15;
          v9 += (uint64_t)v17;
          v28 += (uint64_t)v19;
        }
        v34[0] = @"rx_bytes";
        unsigned int v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v8, v26);
        v35[0] = v20;
        v34[1] = @"tx_bytes";
        v21 = +[NSNumber numberWithUnsignedLongLong:v7];
        v35[1] = v21;
        v34[2] = @"rx_packets";
        v22 = +[NSNumber numberWithUnsignedLongLong:v9];
        v35[2] = v22;
        v34[3] = @"tx_packets";
        v23 = +[NSNumber numberWithUnsignedLongLong:v28];
        v35[3] = v23;
        v24 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
        [v29 setObject:v24 forKey:v30];
      }
      __uint64_t v5 = (unsigned __int16 *)((char *)v5 + v6);
      if ((unint64_t)v5 >= v32) {
        goto LABEL_16;
      }
    }
    free(v27);
    id v3 = 0;
    id v2 = v29;
  }
LABEL_19:

  return v3;
}

+ (BOOL)calculateDeltaAndUpdateInterfaceInfo:(id)a3 withCounters:(id)a4 withResponseBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, int64_t, int64_t, int64_t, int64_t))a5;
  if (!v8)
  {
    BOOL v20 = 0;
    goto LABEL_16;
  }
  uint64_t v28 = v9;
  id v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v7 index]);
  unsigned __int8 v11 = [v8 objectForKey:v10];

  v12 = [v11 objectForKey:@"rx_bytes"];
  id v13 = [v11 objectForKey:@"tx_bytes"];
  BOOL v14 = [v11 objectForKey:@"rx_packets"];
  id v15 = [v11 objectForKey:@"tx_packets"];
  unsigned __int8 v16 = [v12 unsignedLongLongValue];
  id v17 = [v13 unsignedLongLongValue];
  uint64_t v27 = [v14 unsignedLongLongValue];
  long long v26 = [v15 unsignedLongLongValue];
  unsigned int v18 = [v7 isCountersSet];
  if (v12) {
    unsigned int v19 = v18;
  }
  else {
    unsigned int v19 = 0;
  }
  if (v19 != 1) {
    goto LABEL_13;
  }
  BOOL v20 = 0;
  if (v16 < [v7 rxByteCounter]) {
    goto LABEL_14;
  }
  if (!v13) {
    goto LABEL_14;
  }
  BOOL v20 = 0;
  if (v17 < [v7 txByteCounter]) {
    goto LABEL_14;
  }
  if (!v14) {
    goto LABEL_14;
  }
  BOOL v20 = 0;
  if (v27 < [v7 rxPacketCounter] || !v15) {
    goto LABEL_14;
  }
  if (v26 >= [v7 txPacketCounter])
  {
    uint64_t v25 = [v7 rxByteCounter];
    v24 = [v7 txByteCounter];
    v23 = [v7 rxPacketCounter];
    v22 = [v7 txPacketCounter];
    [v7 updateRxByteCounterTo:v16 andTxByteCounterTo:v17 andRxPacketCounterTo:v27 andTxPacketCounterTo:v26];
    v28[2](v28, v16 - v25, v17 - v24, v27 - v23, v26 - v22);
    BOOL v20 = 1;
  }
  else
  {
LABEL_13:
    BOOL v20 = 0;
  }
LABEL_14:

  uint64_t v9 = v28;
LABEL_16:

  return v20;
}

+ (BOOL)updateInterfaceInfo:(id)a3 withCounters:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    unsigned int v19 = v5;
    id v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 index]);
    id v8 = [v6 objectForKey:v7];

    uint64_t v9 = [v8 objectForKey:@"rx_bytes"];
    id v10 = [v8 objectForKey:@"tx_bytes"];
    unsigned __int8 v11 = [v8 objectForKey:@"rx_packets"];
    v12 = [v8 objectForKey:@"tx_packets"];
    id v13 = v12;
    if (v9) {
      BOOL v14 = v10 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    BOOL v16 = v14 || v11 == 0 || v12 == 0;
    BOOL v17 = !v16;
    if (!v16) {
      objc_msgSend(v19, "updateRxByteCounterTo:andTxByteCounterTo:andRxPacketCounterTo:andTxPacketCounterTo:", objc_msgSend(v9, "unsignedLongLongValue"), objc_msgSend(v10, "unsignedLongLongValue"), objc_msgSend(v11, "unsignedLongLongValue"), objc_msgSend(v12, "unsignedLongLongValue"));
    }

    id v5 = v19;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (NSUUID)contextUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (NSString)rawCellularRadioTech
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)cellularRegistrationState
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isCellularLowDataModeEnabled
{
  return self->_isCellularLowDataModeEnabled;
}

- (BOOL)isCellularInterfaceExpensive
{
  return self->_isCellularInterfaceExpensive;
}

- (BOOL)isSatelliteSystem
{
  return self->_isSatelliteSystem;
}

- (BOOL)isStewieActive
{
  return self->_isStewieActive;
}

- (NetworkInterfaceInfo)primary
{
  return (NetworkInterfaceInfo *)objc_getProperty(self, a2, 48, 1);
}

- (NetworkInterfaceInfo)secondary
{
  return (NetworkInterfaceInfo *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_primary, 0);
  objc_storeStrong((id *)&self->_cellularRegistrationState, 0);
  objc_storeStrong((id *)&self->_rawCellularRadioTech, 0);

  objc_storeStrong((id *)&self->_contextUUID, 0);
}

@end