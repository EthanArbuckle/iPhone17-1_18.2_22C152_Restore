@interface WISRatRetentionMetric
+ (id)getSharedInstance;
- (BOOL)airplaneModeActive;
- (BOOL)isDataInitSuccess;
- (CTStewieState)stewieState;
- (NSMutableDictionary)contextUUIDToStateMap;
- (NSNumber)radioState;
- (TelephonyStateRelay)ctRelay;
- (WISRatRetentionMetric)init;
- (dispatch_queue_s)queue;
- (id)CTCellularDataTechnologyToString:(int)a3;
- (id)deriveDataIcon:(unint64_t)a3 stewieState:(id)a4;
- (id)deriveRAT:(id)a3 stewieState:(id)a4 isSatelliteSystem:(BOOL)a5 airplaneModeActive:(BOOL)a6 displayStatus:(id)a7;
- (id)deriveRegistrationStatus:(id)a3 airplaneModeActive:(BOOL)a4;
- (id)extractCellInfo:(id)a3 error:(id *)a4;
- (id)findContextsToDelete:(id)a3;
- (id)getFrequencyRangeFromArfcn:(id)a3;
- (id)getNSString:(const char *)a3;
- (id)getRadioStateString:(id)a3;
- (void)airplaneModeStatusChanged:(BOOL)a3;
- (void)buildAndSubmitCAPayload:(id)a3 currentTime:(unint64_t)a4 changedFields:(id)a5;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)currentDataSimChanged:(id)a3;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)handleUpdate:(id)a3 forKey:(int)a4 withState:(id)a5;
- (void)initializeStateForContext:(id)a3 isDataPreferred:(BOOL)a4 currentTime:(unint64_t)a5;
- (void)populateSubscriptionContextsInUse;
- (void)radioStateChangedTo:(id)a3;
- (void)registrationStatusChanged:(id)a3 status:(id)a4;
- (void)satelliteProvisioningStatusForContext:(id)a3 changedTo:(id)a4;
- (void)satelliteRegistrationStatusForContext:(id)a3 changedTo:(BOOL)a4;
- (void)setAirplaneModeActive:(BOOL)a3;
- (void)setContextUUIDToStateMap:(id)a3;
- (void)setCtRelay:(id)a3;
- (void)setError:(id *)a3 code:(int64_t)a4 message:(id)a5;
- (void)setIsDataInitSuccess:(BOOL)a3;
- (void)setLastKnownGCI:(id)a3 forPayload:(id)a4;
- (void)setQueue:(dispatch_queue_s *)a3;
- (void)setRadioState:(id)a3;
- (void)setStewieState:(id)a3;
- (void)stewieStateChangedTo:(id)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation WISRatRetentionMetric

- (id)deriveRegistrationStatus:(id)a3 airplaneModeActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v4)
  {
    id v8 = [(WISRatRetentionMetric *)self getNSString:"AirplaneMode"];
  }
  else
  {
    id v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)deriveDataIcon:(unint64_t)a3 stewieState:(id)a4
{
  id v6 = a4;
  if ([v6 displayStewieInStatusBar]
    && ([v6 displayInactiveSOSInStatusBar] & 1) != 0)
  {
    v7 = "SOS over Satellite";
LABEL_8:
    uint64_t v8 = [(WISRatRetentionMetric *)self getNSString:v7];
    goto LABEL_9;
  }
  if ([v6 displayStewieInStatusBar])
  {
    v7 = "Satellite";
    goto LABEL_8;
  }
  if ([v6 displayInactiveSOSInStatusBar])
  {
    v7 = "SOS";
    goto LABEL_8;
  }
  uint64_t v8 = +[WISSystemStatusSimulacrum WISSSDataConnectionTypeToString:a3];
LABEL_9:
  v9 = (void *)v8;

  return v9;
}

- (id)getRadioStateString:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 intValue];
  if (v5 >= 7) {
    id v6 = "Unknown";
  }
  else {
    id v6 = off_1001BC830[v5];
  }
  v7 = [(WISRatRetentionMetric *)self getNSString:v6];

  return v7;
}

- (void)handleUpdate:(id)a3 forKey:(int)a4 withState:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  v9 = v8;
  switch(a4)
  {
    case 0:
      [(WISRatRetentionMetric *)self cellMonitorUpdate:v10 info:v8];
      break;
    case 3:
      [(WISRatRetentionMetric *)self currentDataSimChanged:v10];
      break;
    case 4:
      [(WISRatRetentionMetric *)self dataStatus:v10 dataStatusInfo:v8];
      break;
    case 6:
      [(WISRatRetentionMetric *)self subscriptionInfoDidChange];
      break;
    case 7:
      -[WISRatRetentionMetric airplaneModeStatusChanged:](self, "airplaneModeStatusChanged:", [v8 BOOLValue]);
      break;
    case 8:
      [(WISRatRetentionMetric *)self registrationStatusChanged:v10 status:v8];
      break;
    case 12:
      [(WISRatRetentionMetric *)self stewieStateChangedTo:v8];
      break;
    case 13:
      -[WISRatRetentionMetric satelliteRegistrationStatusForContext:changedTo:](self, "satelliteRegistrationStatusForContext:changedTo:", v10, [v8 BOOLValue]);
      break;
    case 14:
      [(WISRatRetentionMetric *)self radioStateChangedTo:v8];
      break;
    case 15:
      [(WISRatRetentionMetric *)self satelliteProvisioningStatusForContext:v10 changedTo:v8];
      break;
    default:
      break;
  }
}

- (id)extractCellInfo:(id)a3 error:(id *)a4
{
  id v34 = a3;
  id v6 = +[WISTelephonyUtils getServingCellInfo:](WISTelephonyUtils, "getServingCellInfo:");
  v7 = +[WISTelephonyUtils getBandFromCellInfo:v6 error:a4];
  uint64_t v8 = +[WISTelephonyUtils getBandwidthFromCellInfo:v6 error:a4];
  v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    id v11 = 0;
  }
  else
  {
    v12 = +[WISTelephonyUtils getArfcnFromCellInfo:v6 error:a4];
    if (*a4 || !v12)
    {

      *a4 = 0;
      v12 = &off_1001C3BF8;
    }
    v33 = v12;
    v13 = [(WISRatRetentionMetric *)self getNSString:"Unknown"];
    v14 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorCellRadioAccessTechnology expectedClass:objc_opt_class() error:a4];
    id v11 = 0;
    v15 = &off_1001C3BF8;
    if (*a4 || !v14)
    {
      v20 = &off_1001C3BF8;
    }
    else
    {
      v31 = v14;
      v32 = v13;
      v29 = +[WISTelephonyUtils getRATFromCellMonitorString:](WISTelephonyUtils, "getRATFromCellMonitorString:");
      v30 = [(WISRatRetentionMetric *)self getNSString:"Unknown"];
      if (+[WISTelephonyUtils isLteRat:v31])
      {
        id v35 = 0;
        v16 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorDeploymentType expectedClass:objc_opt_class() error:&v35];
        id v27 = v35;
        v28 = v16;
        if (!v27 && v16)
        {
          if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
            sub_100149B6C();
          }
          if (([v16 isEqualToNumber:&off_1001C3BF8] & 1) == 0
            && ([v16 isEqualToNumber:&off_1001C3C10] & 1) == 0)
          {
            uint64_t v17 = [(WISRatRetentionMetric *)self getNSString:"NR_NSA"];

            v29 = (void *)v17;
          }
        }
        v18 = +[WISTelephonyUtils getMAVNRNSANeighborCellInfo:v34];
        if (v18)
        {
          v19 = +[WISTelephonyUtils getBandwidthFromCellInfo:v18 error:a4];
          if (*a4 || !v19)
          {

            *a4 = 0;
          }
          else
          {
            v15 = (_UNKNOWN **)v19;
          }
          v20 = &off_1001C3BF8;
          v22 = +[WISTelephonyUtils getArfcnFromCellInfo:v18 error:a4];
          if (*a4 || !v22)
          {

            *a4 = 0;
          }
          else
          {
            v20 = (_UNKNOWN **)v22;
          }
          uint64_t v23 = [(WISRatRetentionMetric *)self getFrequencyRangeFromArfcn:v20];

          v32 = (void *)v23;
        }
        else
        {
          v20 = &off_1001C3BF8;
        }
      }
      else if (+[WISTelephonyUtils isNrRat:v31])
      {
        uint64_t v21 = [(WISRatRetentionMetric *)self getFrequencyRangeFromArfcn:v33];

        v20 = &off_1001C3BF8;
        v30 = (void *)v21;
      }
      else
      {
        v20 = &off_1001C3BF8;
      }
      v24 = +[WISTelephonyUtils getGciFromCellInfo:v6 error:a4];
      v25 = v24;
      if (*a4)
      {

        v25 = 0;
        *a4 = 0;
      }
      id v11 = [[ExtractedCellInfo alloc] init:v29 band:v7 frequencyRange:v30 nrnsaFrequencyRange:v32 bandwidth:v9 nrnsaBandwidth:v15 arfcn:v33 nrnsaArfcn:v20 gci:v25];
      if (!v11) {
        [(WISRatRetentionMetric *)self setError:a4 code:0 message:@"Could not allocate extracted cell info object"];
      }

      v14 = v31;
      v13 = v32;
    }
  }

  return v11;
}

- (void)buildAndSubmitCAPayload:(id)a3 currentTime:(unint64_t)a4 changedFields:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((unint64_t)[v8 startTime] > a4)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
      sub_100149D8C();
    }
    goto LABEL_19;
  }
  unint64_t v10 = a4 - (void)[v8 startTime];
  unint64_t v11 = v10 / 0xF4240;
  if (v10 <= 0x5F5E0FF)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
      sub_100149DC0();
    }
    goto LABEL_19;
  }
  v12 = [v8 displayStatus];
  v90 = [(WISRatRetentionMetric *)self deriveRegistrationStatus:v12 airplaneModeActive:[(WISRatRetentionMetric *)self airplaneModeActive]];

  v13 = [v8 rat];
  v14 = [(WISRatRetentionMetric *)self stewieState];
  id v15 = [v8 isSatelliteSystem];
  BOOL v16 = [(WISRatRetentionMetric *)self airplaneModeActive];
  uint64_t v17 = [v8 displayStatus];
  v18 = [(WISRatRetentionMetric *)self deriveRAT:v13 stewieState:v14 isSatelliteSystem:v15 airplaneModeActive:v16 displayStatus:v17];

  id v19 = [v8 dataConnectionType];
  v20 = [(WISRatRetentionMetric *)self stewieState];
  v88 = [(WISRatRetentionMetric *)self deriveDataIcon:v19 stewieState:v20];

  uint64_t v21 = [(WISRatRetentionMetric *)self radioState];
  v89 = [(WISRatRetentionMetric *)self getRadioStateString:v21];

  v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isSatelliteProvisioned]);
  id v23 = objc_alloc_init((Class)NSMutableDictionary);
  v24 = [(WISRatRetentionMetric *)self getNSString:"registration_state"];
  [v23 setObject:v90 forKey:v24];

  v25 = [(WISRatRetentionMetric *)self getNSString:"new_registration_state"];
  [v23 setObject:v90 forKey:v25];

  v26 = [(WISRatRetentionMetric *)self getNSString:"radio_access_technology"];
  [v23 setObject:v18 forKey:v26];

  id v27 = [(WISRatRetentionMetric *)self getNSString:"new_radio_access_technology"];
  [v23 setObject:v18 forKey:v27];

  v28 = [v8 dataBearerTechnology];
  v29 = [(WISRatRetentionMetric *)self getNSString:"data_bearer_technology"];
  [v23 setObject:v28 forKey:v29];

  v30 = [v8 dataBearerTechnology];
  v31 = [(WISRatRetentionMetric *)self getNSString:"new_data_bearer_technology"];
  [v23 setObject:v30 forKey:v31];

  v32 = [v8 band];
  v33 = [(WISRatRetentionMetric *)self getNSString:"band"];
  [v23 setObject:v32 forKey:v33];

  id v34 = [v8 band];
  id v35 = [(WISRatRetentionMetric *)self getNSString:"new_band"];
  [v23 setObject:v34 forKey:v35];

  v36 = [v8 bandwidth];
  v37 = [(WISRatRetentionMetric *)self getNSString:"bandwidth"];
  [v23 setObject:v36 forKey:v37];

  v38 = [v8 bandwidth];
  v39 = [(WISRatRetentionMetric *)self getNSString:"new_bandwidth"];
  [v23 setObject:v38 forKey:v39];

  v40 = [v8 frequencyRange];
  v41 = [(WISRatRetentionMetric *)self getNSString:"frequency_range"];
  [v23 setObject:v40 forKey:v41];

  v42 = [v8 frequencyRange];
  v43 = [(WISRatRetentionMetric *)self getNSString:"new_frequency_range"];
  [v23 setObject:v42 forKey:v43];

  v44 = [v8 arfcn];
  v45 = [(WISRatRetentionMetric *)self getNSString:"arfcn"];
  [v23 setObject:v44 forKey:v45];

  v46 = [v8 arfcn];
  v47 = [(WISRatRetentionMetric *)self getNSString:"new_arfcn"];
  [v23 setObject:v46 forKey:v47];

  v48 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 dataPreferred]);
  v49 = [(WISRatRetentionMetric *)self getNSString:"is_data_preferred"];
  [v23 setObject:v48 forKey:v49];

  v50 = [v8 subsId];
  v51 = [(WISRatRetentionMetric *)self getNSString:"subs_id"];
  [v23 setObject:v50 forKey:v51];

  v52 = [(WISRatRetentionMetric *)self getNSString:"baseband_operating_mode"];
  [v23 setObject:v89 forKey:v52];

  v53 = [(WISRatRetentionMetric *)self getNSString:"new_baseband_operating_mode"];
  [v23 setObject:v89 forKey:v53];

  v54 = [(WISRatRetentionMetric *)self getNSString:"cellular_icon"];
  [v23 setObject:v88 forKey:v54];

  v55 = [(WISRatRetentionMetric *)self getNSString:"new_cellular_icon"];
  [v23 setObject:v88 forKey:v55];

  v56 = [(WISRatRetentionMetric *)self getNSString:"is_sim_present"];
  [v23 setObject:&__kCFBooleanTrue forKey:v56];

  v57 = [(WISRatRetentionMetric *)self getNSString:"is_sat_provisioned"];
  [v23 setObject:v22 forKey:v57];

  v58 = [(WISRatRetentionMetric *)self getNSString:"new_is_sat_provisioned"];
  [v23 setObject:v22 forKey:v58];

  v59 = +[NSNumber numberWithUnsignedLongLong:v11];
  v60 = [(WISRatRetentionMetric *)self getNSString:"duration_ms"];
  [v23 setObject:v59 forKey:v60];

  v61 = [v8 dataBearerTechnology];
  v62 = [(WISRatRetentionMetric *)self getNSString:"NRNSA"];
  LODWORD(v14) = [v61 isEqualToString:v62];

  if (v14)
  {
    v63 = [v8 nrnsaBandwidth];
    v64 = [(WISRatRetentionMetric *)self getNSString:"bandwidth"];
    [v23 setObject:v63 forKey:v64];

    v65 = [v8 nrnsaBandwidth];
    v66 = [(WISRatRetentionMetric *)self getNSString:"new_bandwidth"];
    [v23 setObject:v65 forKey:v66];

    v67 = [v8 nrnsaArfcn];
    v68 = [(WISRatRetentionMetric *)self getNSString:"arfcn"];
    [v23 setObject:v67 forKey:v68];

    v69 = [v8 nrnsaArfcn];
    v70 = [(WISRatRetentionMetric *)self getNSString:"new_arfcn"];
    [v23 setObject:v69 forKey:v70];

    v71 = [v8 nrnsaFrequencyRange];
    v72 = [(WISRatRetentionMetric *)self getNSString:"frequency_range"];
    [v23 setObject:v71 forKey:v72];

    v73 = [v8 nrnsaFrequencyRange];
    v74 = [(WISRatRetentionMetric *)self getNSString:"new_frequency_range"];
    [v23 setObject:v73 forKey:v74];
  }
  [v23 addEntriesFromDictionary:v9];
  v75 = [(WISRatRetentionMetric *)self getNSString:"new_registration_state"];
  v76 = [v23 valueForKey:v75];
  if (![v76 isEqualToString:kCTRegistrationStatusNotRegistered])
  {

    goto LABEL_13;
  }
  unsigned __int8 v77 = [(WISRatRetentionMetric *)self airplaneModeActive];

  if ((v77 & 1) == 0)
  {
    v75 = [v8 lastKnownGci];
    [(WISRatRetentionMetric *)self setLastKnownGCI:v75 forPayload:v23];
LABEL_13:
  }
  v78 = [(WISRatRetentionMetric *)self getNSString:"registration_state"];
  v79 = [v23 valueForKey:v78];
  v80 = +[WISTelephonyUtils getShortenedRegistrationStateString:v79];

  if (v80)
  {
    v81 = [(WISRatRetentionMetric *)self getNSString:"registration_state"];
    [v23 setValue:v80 forKey:v81];
  }
  v82 = [(WISRatRetentionMetric *)self getNSString:"new_registration_state"];
  v83 = [v23 valueForKey:v82];
  v84 = +[WISTelephonyUtils getShortenedRegistrationStateString:v83];

  if (v84)
  {
    v85 = [(WISRatRetentionMetric *)self getNSString:"new_registration_state"];
    [v23 setValue:v84 forKey:v85];
  }
  v86 = [(WISRatRetentionMetric *)self getNSString:"com.apple.Telephony.apRatRetention"];
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_10001E0C8;
  v91[3] = &unk_1001BC770;
  id v87 = v23;
  id v92 = v87;
  sub_100005B9C(v86, v91);

LABEL_19:
}

- (id)getNSString:(const char *)a3
{
  v3 = +[NSString stringWithUTF8String:a3];
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = v3;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
      sub_10014A7D8();
    }
    unsigned int v5 = @"ERROR";
  }

  return v5;
}

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = +[WISTelephonyUtils isValidContext:v6];
  if (v7) {
    unsigned __int8 v9 = v8;
  }
  else {
    unsigned __int8 v9 = 0;
  }
  if (v9)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      [v6 uuid];
      objc_claimAutoreleasedReturnValue();
      sub_10014A258();
    }
    unint64_t v10 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
    unint64_t v11 = [v6 uuid];
    v12 = [v10 objectForKey:v11];

    if (!v12)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
      {
        [v6 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_10014A0E0();
      }
      goto LABEL_55;
    }
    id v73 = 0;
    v13 = [(WISRatRetentionMetric *)self extractCellInfo:v7 error:&v73];
    id v72 = v73;
    if (v72 || !v13)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
      {
        [v6 uuid];
        objc_claimAutoreleasedReturnValue();
        [v72 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_10014A204();
      }
      goto LABEL_54;
    }
    v14 = [v13 gci];
    BOOL v15 = v14 == 0;

    if (!v15)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
      {
        [v6 uuid];
        objc_claimAutoreleasedReturnValue();
        [v13 gci];
        objc_claimAutoreleasedReturnValue();
        sub_10014A1AC();
      }
      BOOL v16 = [v13 gci];
      [v12 setLastKnownGci:v16];
    }
    uint64_t v17 = [v13 rat];
    v18 = [(WISRatRetentionMetric *)self stewieState];
    id v19 = [v12 isSatelliteSystem];
    BOOL v20 = [(WISRatRetentionMetric *)self airplaneModeActive];
    uint64_t v21 = [v12 displayStatus];
    v71 = [(WISRatRetentionMetric *)self deriveRAT:v17 stewieState:v18 isSatelliteSystem:v19 airplaneModeActive:v20 displayStatus:v21];

    __uint64_t v70 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v22 = [v12 rat];
    id v23 = [v13 rat];
    unsigned __int8 v24 = [v22 isEqual:v23];
    if ((v24 & 1) == 0)
    {
      v69 = [v13 rat];
      if ([v69 isEqualToString:v71]) {
        goto LABEL_29;
      }
    }
    v25 = [v12 band];
    v26 = [v13 band];
    if ([v25 isEqual:v26])
    {
      v68 = [v12 frequencyRange];
      v67 = v25;
      v66 = [v13 frequencyRange];
      if (objc_msgSend(v68, "isEqual:"))
      {
        v65 = [v12 bandwidth];
        v64 = [v13 bandwidth];
        if (objc_msgSend(v65, "isEqual:"))
        {
          v63 = [v12 arfcn];
          v62 = [v13 arfcn];
          if (objc_msgSend(v63, "isEqual:"))
          {
            v61 = [v12 dataBearerTechnology];
            v60 = [(WISRatRetentionMetric *)self getNSString:"NRNSA"];
            if (objc_msgSend(v61, "isEqualToString:"))
            {
              v59 = [v12 nrnsaBandwidth];
              v58 = [v13 nrnsaBandwidth];
              if (objc_msgSend(v59, "isEqual:"))
              {
                v57 = [v12 nrnsaArfcn];
                v56 = [v13 nrnsaArfcn];
                if (objc_msgSend(v57, "isEqual:"))
                {
                  v55 = [v12 nrnsaFrequencyRange];
                  id v27 = [v13 nrnsaFrequencyRange];
                  unsigned __int8 v54 = [v55 isEqualToString:v27];

                  char v28 = v54 ^ 1;
                }
                else
                {
                  char v28 = 1;
                }
              }
              else
              {
                char v28 = 1;
              }
            }
            else
            {
              char v28 = 0;
            }
          }
          else
          {
            char v28 = 1;
          }
        }
        else
        {
          char v28 = 1;
        }
      }
      else
      {
        char v28 = 1;
      }

      if ((v24 & 1) == 0) {
      if ((v28 & 1) == 0)
      }
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
        {
          [v6 uuid];
          objc_claimAutoreleasedReturnValue();
          sub_10014A168();
        }
        goto LABEL_53;
      }
LABEL_45:
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
      {
        [v6 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_10014A124();
      }
      if ([v12 dataPreferred])
      {
        id v29 = objc_alloc_init((Class)NSMutableDictionary);
        v30 = [(WISRatRetentionMetric *)self getNSString:"new_radio_access_technology"];
        [v29 setObject:v71 forKey:v30];

        v31 = [v13 band];
        v32 = [(WISRatRetentionMetric *)self getNSString:"new_band"];
        [v29 setObject:v31 forKey:v32];

        v33 = [v12 dataBearerTechnology];
        id v34 = [(WISRatRetentionMetric *)self getNSString:"NRNSA"];
        unsigned int v35 = [v33 isEqualToString:v34];

        if (v35)
        {
          v36 = [v13 nrnsaBandwidth];
          v37 = [(WISRatRetentionMetric *)self getNSString:"new_bandwidth"];
          [v29 setObject:v36 forKey:v37];

          v38 = [v13 nrnsaArfcn];
          v39 = [(WISRatRetentionMetric *)self getNSString:"new_arfcn"];
          [v29 setObject:v38 forKey:v39];

          [v13 nrnsaFrequencyRange];
        }
        else
        {
          v42 = [v13 bandwidth];
          v43 = [(WISRatRetentionMetric *)self getNSString:"new_bandwidth"];
          [v29 setObject:v42 forKey:v43];

          v44 = [v13 arfcn];
          v45 = [(WISRatRetentionMetric *)self getNSString:"new_arfcn"];
          [v29 setObject:v44 forKey:v45];

          [v13 frequencyRange];
        v40 = };
        v41 = [(WISRatRetentionMetric *)self getNSString:"new_frequency_range"];
        [v29 setObject:v40 forKey:v41];

        [(WISRatRetentionMetric *)self buildAndSubmitCAPayload:v12 currentTime:v70 changedFields:v29];
      }
      v46 = [v13 rat];
      [v12 setRat:v46];

      v47 = [v13 band];
      [v12 setBand:v47];

      v48 = [v13 frequencyRange];
      [v12 setFrequencyRange:v48];

      v49 = [v13 bandwidth];
      [v12 setBandwidth:v49];

      v50 = [v13 arfcn];
      [v12 setArfcn:v50];

      [v12 setStartTime:v70];
LABEL_53:
      v51 = [v13 nrnsaBandwidth];
      [v12 setNrnsaBandwidth:v51];

      v52 = [v13 nrnsaArfcn];
      [v12 setNrnsaArfcn:v52];

      v53 = [v13 nrnsaFrequencyRange];
      [v12 setNrnsaFrequencyRange:v53];

LABEL_54:
LABEL_55:

      goto LABEL_56;
    }

    if ((v24 & 1) == 0) {
LABEL_29:
    }

    goto LABEL_45;
  }
LABEL_56:
}

- (NSMutableDictionary)contextUUIDToStateMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (CTStewieState)stewieState
{
  return (CTStewieState *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)airplaneModeActive
{
  return self->_airplaneModeActive;
}

- (id)deriveRAT:(id)a3 stewieState:(id)a4 isSatelliteSystem:(BOOL)a5 airplaneModeActive:(BOOL)a6 displayStatus:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (a6)
  {
    BOOL v15 = "AirplaneMode";
LABEL_11:
    id v17 = [(WISRatRetentionMetric *)self getNSString:v15];
    goto LABEL_12;
  }
  unsigned int v16 = [v13 isStewieActive];
  if (v16) {
    BOOL v15 = "Satellite";
  }
  else {
    BOOL v15 = "LTE NTN";
  }
  if ((v16 | a5)) {
    goto LABEL_11;
  }
  if ([v14 isEqualToString:kCTRegistrationStatusEmergencyOnly])
  {
    BOOL v15 = "EmergencyOnly";
    goto LABEL_11;
  }
  if ([v14 isEqualToString:kCTRegistrationStatusNotRegistered])
  {
    BOOL v15 = "NoService";
    goto LABEL_11;
  }
  id v17 = v12;
LABEL_12:
  v18 = v17;

  return v18;
}

- (NSNumber)radioState
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

+ (id)getSharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EC11C;
  block[3] = &unk_1001B5ED8;
  block[4] = a1;
  if (qword_1001D7E80 != -1) {
    dispatch_once(&qword_1001D7E80, block);
  }
  v2 = (void *)qword_1001D7E78;

  return v2;
}

- (WISRatRetentionMetric)init
{
  v10.receiver = self;
  v10.super_class = (Class)WISRatRetentionMetric;
  v2 = [(WISRatRetentionMetric *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    [(WISRatRetentionMetric *)v2 setContextUUIDToStateMap:v3];

    [(WISRatRetentionMetric *)v2 setQueue:dispatch_queue_create("com.apple.wirelessinsightsd.RatRetentionMetric", 0)];
    id v4 = [(WISRatRetentionMetric *)v2 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EC28C;
    block[3] = &unk_1001B5F28;
    unsigned int v5 = v2;
    unsigned __int8 v9 = v5;
    dispatch_async(v4, block);
    id v6 = v5;
  }
  return v2;
}

- (void)populateSubscriptionContextsInUse
{
  id v3 = [(WISRatRetentionMetric *)self ctRelay];
  id v4 = [v3 coreTelephonyClient];
  id v33 = 0;
  unsigned __int8 v24 = [v4 getSubscriptionInfoWithError:&v33];
  id v25 = v33;

  if (v25)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
    {
      [v25 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100149D48();
    }
  }
  else
  {
    unsigned int v5 = [v24 subscriptionsInUse];
    id v23 = +[WISTelephonyUtils sanitizedSubscriptions:v5];

    if (v23)
    {
      id v6 = [(WISRatRetentionMetric *)self ctRelay];
      id v7 = [v6 coreTelephonyClient];
      id v32 = 0;
      v22 = [v7 getCurrentDataSubscriptionContextSync:&v32];
      id v25 = v32;

      if (v25)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
        {
          [v25 localizedDescription];
          objc_claimAutoreleasedReturnValue();
          sub_100149D04();
        }
      }
      else
      {
        [(WISRatRetentionMetric *)self setIsDataInitSuccess:1];
        id v27 = [v22 uuid];
        __uint64_t v26 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        uint64_t v21 = [(WISRatRetentionMetric *)self findContextsToDelete:v23];
        unsigned __int8 v8 = *(NSObject **)(qword_1001D8080 + 48);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          sub_100149CB8((uint64_t)v35, (uint64_t)[v21 count], (uint64_t)objc_msgSend(v23, "count"), v8);
        }
        unsigned __int8 v9 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
        [v9 removeObjectsForKeys:v21];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v10 = v23;
        id v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v29;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v29 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              BOOL v15 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
              unsigned int v16 = [v14 uuid];
              id v17 = [v15 objectForKey:v16];
              BOOL v18 = v17 == 0;

              BOOL v19 = os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG);
              if (v18)
              {
                if (v19)
                {
                  [v14 uuid];
                  objc_claimAutoreleasedReturnValue();
                  sub_100149C18();
                }
                BOOL v20 = [v14 uuid];
                -[WISRatRetentionMetric initializeStateForContext:isDataPreferred:currentTime:](self, "initializeStateForContext:isDataPreferred:currentTime:", v14, [v27 isEqual:v20], v26);
              }
              else if (v19)
              {
                [v14 uuid];
                objc_claimAutoreleasedReturnValue();
                sub_100149C68();
              }
            }
            id v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
          }
          while (v11);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
        sub_100149BD8();
      }
      id v25 = 0;
    }
  }
}

- (void)stewieStateChangedTo:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_100149E2C();
  }
  __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v6 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ECA90;
  v8[3] = &unk_1001BC798;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  __uint64_t v10 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];

  [(WISRatRetentionMetric *)self setStewieState:v7];
}

- (void)radioStateChangedTo:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_100149E98();
  }
  __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v6 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ECDEC;
  v8[3] = &unk_1001BC798;
  v8[4] = self;
  __uint64_t v10 = v5;
  id v7 = v4;
  id v9 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];

  [(WISRatRetentionMetric *)self setRadioState:v7];
}

- (void)airplaneModeStatusChanged:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(WISRatRetentionMetric *)self airplaneModeActive];
  id v6 = *(NSObject **)(qword_1001D8080 + 48);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == v3)
  {
    if (v7) {
      sub_100149F8C();
    }
  }
  else
  {
    if (v7) {
      sub_100149F04(v3, v6, v8);
    }
    __uint64_t v9 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    __uint64_t v10 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000ED04C;
    v11[3] = &unk_1001BC7C0;
    BOOL v12 = v3;
    v11[4] = self;
    v11[5] = v9;
    [v10 enumerateKeysAndObjectsUsingBlock:v11];

    [(WISRatRetentionMetric *)self setAirplaneModeActive:v3];
  }
}

- (void)currentDataSimChanged:(id)a3
{
  id v4 = a3;
  if (+[WISTelephonyUtils isValidContext:v4])
  {
    if ([(WISRatRetentionMetric *)self isDataInitSuccess])
    {
      __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
      {
        [v4 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_100149FC0();
      }
      id v6 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000ED4D0;
      v9[3] = &unk_1001BC798;
      v9[4] = self;
      __uint64_t v11 = v5;
      id v10 = v4;
      [v6 enumerateKeysAndObjectsUsingBlock:v9];
    }
    else
    {
      BOOL v7 = *(NSObject **)(qword_1001D8080 + 48);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = [v4 uuid];
        *(_DWORD *)buf = 138412290;
        id v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "RatRetentionMetric:#I Current data context changed to %@, but we did not successfully initialize. Running initialization", buf, 0xCu);
      }
      [(WISRatRetentionMetric *)self populateSubscriptionContextsInUse];
    }
  }
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = +[WISTelephonyUtils isValidContext:v6];
  if (v7) {
    unsigned __int8 v9 = v8;
  }
  else {
    unsigned __int8 v9 = 0;
  }
  if (v9)
  {
    id v10 = -[WISRatRetentionMetric CTCellularDataTechnologyToString:](self, "CTCellularDataTechnologyToString:", [v7 dataBearerTechnology]);
    unint64_t v11 = +[WISSystemStatusSimulacrum deriveConnectionTypeForDataStatus:v7];
    BOOL v12 = *(NSObject **)(qword_1001D8080 + 48);
    if (!v10)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
      {
        [v7 dataBearerTechnology];
        [v6 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_10014A004();
      }
      goto LABEL_25;
    }
    id v13 = (id)v11;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      v36 = [v6 uuid];
      *(_DWORD *)buf = 138412802;
      v39 = v36;
      __int16 v40 = 2112;
      v41 = v10;
      __int16 v42 = 2048;
      id v43 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "RatRetentionMetric:#D Data status of context %@ changed. New Data Bearer Technology: %@, new data connection type %lu", buf, 0x20u);
    }
    id v14 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
    BOOL v15 = [v6 uuid];
    unsigned int v16 = [v14 objectForKey:v15];

    if (!v16)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
      {
        [v6 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_10014A058();
      }
      goto LABEL_24;
    }
    id v17 = [v16 dataBearerTechnology];
    if ([v17 isEqualToString:v10])
    {
      BOOL v18 = [v16 dataConnectionType] == v13;

      if (v18)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
        {
          [v6 uuid];
          objc_claimAutoreleasedReturnValue();
          sub_10014A09C();
        }
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }
    else
    {
    }
    __uint64_t v19 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    if ([v16 dataPreferred])
    {
      __uint64_t v37 = v19;
      id v20 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v21 = [(WISRatRetentionMetric *)self getNSString:"new_data_bearer_technology"];
      [v20 setObject:v10 forKey:v21];

      v22 = [(WISRatRetentionMetric *)self stewieState];
      id v23 = [(WISRatRetentionMetric *)self deriveDataIcon:v13 stewieState:v22];
      unsigned __int8 v24 = [(WISRatRetentionMetric *)self getNSString:"new_cellular_icon"];
      [v20 setObject:v23 forKey:v24];

      id v25 = [(WISRatRetentionMetric *)self getNSString:"NRNSA"];
      LODWORD(v22) = [v10 isEqualToString:v25];

      if (v22)
      {
        __uint64_t v26 = [v16 nrnsaBandwidth];
        id v27 = [(WISRatRetentionMetric *)self getNSString:"new_bandwidth"];
        [v20 setObject:v26 forKey:v27];

        long long v28 = [v16 nrnsaArfcn];
        long long v29 = [(WISRatRetentionMetric *)self getNSString:"new_arfcn"];
        [v20 setObject:v28 forKey:v29];

        [v16 nrnsaFrequencyRange];
      }
      else
      {
        id v32 = [v16 bandwidth];
        id v33 = [(WISRatRetentionMetric *)self getNSString:"new_bandwidth"];
        [v20 setObject:v32 forKey:v33];

        id v34 = [v16 arfcn];
        unsigned int v35 = [(WISRatRetentionMetric *)self getNSString:"new_arfcn"];
        [v20 setObject:v34 forKey:v35];

        [v16 frequencyRange];
      long long v30 = };
      long long v31 = [(WISRatRetentionMetric *)self getNSString:"new_frequency_range"];
      [v20 setObject:v30 forKey:v31];

      [(WISRatRetentionMetric *)self buildAndSubmitCAPayload:v16 currentTime:v37 changedFields:v20];
      __uint64_t v19 = v37;
    }
    [v16 setStartTime:v19];
    [v16 setDataBearerTechnology:v10];
    [v16 setDataConnectionType:v13];
    goto LABEL_24;
  }
LABEL_26:
}

- (void)registrationStatusChanged:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[WISTelephonyUtils isValidContext:v6])
  {
    unsigned __int8 v8 = *(NSObject **)(qword_1001D8080 + 48);
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        [v6 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_10014A368();
      }
      unsigned __int8 v9 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
      id v10 = [v6 uuid];
      unint64_t v11 = [v9 objectForKey:v10];

      if (v11)
      {
        BOOL v12 = [v11 displayStatus];
        unsigned int v13 = [v12 isEqualToString:v7];

        if (v13)
        {
          if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
          {
            [v6 uuid];
            objc_claimAutoreleasedReturnValue();
            sub_10014A324();
          }
        }
        else
        {
          if (![(WISRatRetentionMetric *)self airplaneModeActive])
          {
            __uint64_t v14 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
            if ([v11 dataPreferred])
            {
              uint64_t v21 = [(WISRatRetentionMetric *)self getNSString:"new_registration_state"];
              v22[0] = v21;
              id v20 = [(WISRatRetentionMetric *)self deriveRegistrationStatus:v7 airplaneModeActive:[(WISRatRetentionMetric *)self airplaneModeActive]];
              v23[0] = v20;
              BOOL v15 = [(WISRatRetentionMetric *)self getNSString:"new_radio_access_technology"];
              v22[1] = v15;
              unsigned int v16 = [v11 rat];
              id v17 = [(WISRatRetentionMetric *)self stewieState];
              BOOL v18 = -[WISRatRetentionMetric deriveRAT:stewieState:isSatelliteSystem:airplaneModeActive:displayStatus:](self, "deriveRAT:stewieState:isSatelliteSystem:airplaneModeActive:displayStatus:", v16, v17, [v11 isSatelliteSystem], -[WISRatRetentionMetric airplaneModeActive](self, "airplaneModeActive"), v7);
              v23[1] = v18;
              __uint64_t v19 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
              [(WISRatRetentionMetric *)self buildAndSubmitCAPayload:v11 currentTime:v14 changedFields:v19];
            }
            [v11 setStartTime:v14];
          }
          [v11 setDisplayStatus:v7];
        }
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
      {
        [v6 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_10014A2E0();
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [v6 uuid];
      objc_claimAutoreleasedReturnValue();
      sub_10014A29C();
    }
  }
}

- (void)subscriptionInfoDidChange
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_10014A3AC();
  }
  [(WISRatRetentionMetric *)self populateSubscriptionContextsInUse];
}

- (void)satelliteRegistrationStatusForContext:(id)a3 changedTo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (+[WISTelephonyUtils isValidContext:v6])
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      [v6 uuid];
      objc_claimAutoreleasedReturnValue();
      sub_10014A468();
    }
    id v7 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
    unsigned __int8 v8 = [v6 uuid];
    unsigned __int8 v9 = [v7 objectForKey:v8];

    if (v9)
    {
      if ([v9 isSatelliteSystem] == v4)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
        {
          [v6 uuid];
          objc_claimAutoreleasedReturnValue();
          sub_10014A424();
        }
      }
      else
      {
        if (![(WISRatRetentionMetric *)self airplaneModeActive])
        {
          __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
          if ([v9 dataPreferred])
          {
            id v17 = [(WISRatRetentionMetric *)self getNSString:"new_radio_access_technology"];
            BOOL v18 = v17;
            unint64_t v11 = [v9 rat];
            BOOL v12 = [(WISRatRetentionMetric *)self stewieState];
            BOOL v13 = [(WISRatRetentionMetric *)self airplaneModeActive];
            __uint64_t v14 = [v9 displayStatus];
            BOOL v15 = [(WISRatRetentionMetric *)self deriveRAT:v11 stewieState:v12 isSatelliteSystem:v4 airplaneModeActive:v13 displayStatus:v14];
            __uint64_t v19 = v15;
            unsigned int v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
            [(WISRatRetentionMetric *)self buildAndSubmitCAPayload:v9 currentTime:v10 changedFields:v16];
          }
          [v9 setStartTime:v10];
        }
        [v9 setIsSatelliteSystem:v4];
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      [v6 uuid];
      objc_claimAutoreleasedReturnValue();
      sub_10014A3E0();
    }
  }
}

- (void)satelliteProvisioningStatusForContext:(id)a3 changedTo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[WISTelephonyUtils isValidContext:v6])
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      [v6 uuid];
      objc_claimAutoreleasedReturnValue();
      sub_10014A554();
    }
    unsigned __int8 v8 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
    unsigned __int8 v9 = [v6 uuid];
    __uint64_t v10 = [v8 objectForKey:v9];

    if (v10)
    {
      unsigned int v11 = [v10 isSatelliteProvisioned];
      if (v11 == [v7 BOOLValue])
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
        {
          [v6 uuid];
          objc_claimAutoreleasedReturnValue();
          sub_10014A510();
        }
      }
      else
      {
        __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        if ([v10 dataPreferred])
        {
          BOOL v13 = [(WISRatRetentionMetric *)self getNSString:"new_is_sat_provisioned"];
          BOOL v15 = v13;
          id v16 = v7;
          __uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
          [(WISRatRetentionMetric *)self buildAndSubmitCAPayload:v10 currentTime:v12 changedFields:v14];
        }
        [v10 setStartTime:v12];
        objc_msgSend(v10, "setIsSatelliteProvisioned:", objc_msgSend(v7, "BOOLValue"));
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      [v6 uuid];
      objc_claimAutoreleasedReturnValue();
      sub_10014A4CC();
    }
  }
}

- (void)initializeStateForContext:(id)a3 isDataPreferred:(BOOL)a4 currentTime:(unint64_t)a5
{
  id v8 = a3;
  unsigned __int8 v9 = [(WISRatRetentionMetric *)self ctRelay];
  __uint64_t v10 = [v9 coreTelephonyClient];
  id v35 = 0;
  id v11 = [v10 copyRegistrationDisplayStatus:v8 error:&v35];
  id v12 = v35;

  if (v12)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
    {
      [v12 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10014A5DC();
    }
  }
  else
  {
    BOOL v13 = [(WISRatRetentionMetric *)self ctRelay];
    __uint64_t v14 = [v13 coreTelephonyClient];
    id v34 = 0;
    BOOL v15 = [v14 getDataStatus:v8 error:&v34];
    id v12 = v34;

    if (v12)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
      {
        [v12 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_10014A598();
      }
    }
    else
    {
      unint64_t v23 = +[WISSystemStatusSimulacrum deriveConnectionTypeForDataStatus:v15];
      id v16 = [(WISRatRetentionMetric *)self ctRelay];
      id v33 = 0;
      unsigned __int8 v17 = [v16 getIsSatelliteProvisioned:v8 error:&v33];
      id v18 = v33;

      if (v18)
      {
        __uint64_t v19 = *(NSObject **)(qword_1001D8080 + 48);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v18 localizedDescription];
          *(_DWORD *)buf = 138412290;
          __uint64_t v37 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "RatRetentionMetric:#N Error while fetching satellite provisioned status: %@", buf, 0xCu);
        }
        unsigned __int8 v17 = 0;
      }
      uint64_t v21 = [(WISRatRetentionMetric *)self ctRelay];
      v22 = [v21 coreTelephonyClient];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000EEA20;
      v24[3] = &unk_1001BC810;
      id v25 = v8;
      __uint64_t v26 = self;
      id v27 = v15;
      unint64_t v29 = a5;
      BOOL v31 = a4;
      unsigned __int8 v32 = v17;
      id v28 = v11;
      unint64_t v30 = v23;
      [v22 copyCellInfo:v25 completion:v24];
    }
  }
}

- (id)CTCellularDataTechnologyToString:(int)a3
{
  if ((a3 - 1) > 5) {
    BOOL v3 = "Unknown";
  }
  else {
    BOOL v3 = off_1001BC868[a3 - 1];
  }
  BOOL v4 = [(WISRatRetentionMetric *)self getNSString:v3];

  return v4;
}

- (id)getFrequencyRangeFromArfcn:(id)a3
{
  id v4 = a3;
  __uint64_t v5 = v4;
  if (!v4 || ([v4 isEqualToNumber:&off_1001C3BF8] & 1) != 0)
  {
    id v6 = "Unknown";
LABEL_4:
    uint64_t v7 = [(WISRatRetentionMetric *)self getNSString:v6];
    goto LABEL_5;
  }
  if ([v5 compare:&off_1001C3C28] == (id)-1)
  {
    id v6 = "FR1";
    goto LABEL_4;
  }
  uint64_t v7 = [(WISRatRetentionMetric *)self getNSString:"FR2"];
LABEL_5:
  id v8 = (void *)v7;

  return v8;
}

- (id)findContextsToDelete:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        __uint64_t v10 = [*(id *)(*((void *)&v22 + 1) + 8 * i) uuid];
        [v5 addObject:v10];
      }
      id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = [(WISRatRetentionMetric *)self contextUUIDToStateMap];
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * (void)j);
        if (([v5 containsObject:v16] & 1) == 0) {
          [v11 addObject:v16];
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  return v11;
}

- (void)setError:(id *)a3 code:(int64_t)a4 message:(id)a5
{
  id v10 = a5;
  uint64_t v8 = +[NSMutableDictionary dictionary];
  [v8 setValue:v10 forKey:NSLocalizedDescriptionKey];
  unsigned __int8 v9 = [(WISRatRetentionMetric *)self getNSString:"RatRetentionMetric"];
  *a3 = +[NSError errorWithDomain:v9 code:a4 userInfo:v8];
}

- (void)setLastKnownGCI:(id)a3 forPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  pthread_mutex_lock(&stru_1001D6738);
  uint64_t v8 = xmmword_1001D6778;
  if (!(void)xmmword_1001D6778)
  {
    sub_10006C024(&v14);
    long long v9 = v14;
    long long v14 = 0uLL;
    id v10 = (std::__shared_weak_count *)*((void *)&xmmword_1001D6778 + 1);
    xmmword_1001D6778 = v9;
    if (v10)
    {
      sub_10000B678(v10);
      if (*((void *)&v14 + 1)) {
        sub_10000B678(*((std::__shared_weak_count **)&v14 + 1));
      }
    }
    uint64_t v8 = xmmword_1001D6778;
  }
  id v11 = (std::__shared_weak_count *)*((void *)&xmmword_1001D6778 + 1);
  if (*((void *)&xmmword_1001D6778 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_1001D6778 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&stru_1001D6738);
  int v12 = sub_10001ECD4(v8);
  if (v11) {
    sub_10000B678(v11);
  }
  if (v12)
  {
    id v13 = [(WISRatRetentionMetric *)self getNSString:"last_known_gci_before_oos"];
    [v7 setObject:v6 forKey:v13];
  }
}

- (TelephonyStateRelay)ctRelay
{
  return (TelephonyStateRelay *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCtRelay:(id)a3
{
}

- (dispatch_queue_s)queue
{
  return self->_queue;
}

- (void)setQueue:(dispatch_queue_s *)a3
{
  self->_queue = a3;
}

- (void)setContextUUIDToStateMap:(id)a3
{
}

- (void)setAirplaneModeActive:(BOOL)a3
{
  self->_airplaneModeActive = a3;
}

- (void)setStewieState:(id)a3
{
}

- (void)setRadioState:(id)a3
{
}

- (BOOL)isDataInitSuccess
{
  return self->_isDataInitSuccess;
}

- (void)setIsDataInitSuccess:(BOOL)a3
{
  self->_isDataInitSuccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioState, 0);
  objc_storeStrong((id *)&self->_stewieState, 0);
  objc_storeStrong((id *)&self->_contextUUIDToStateMap, 0);

  objc_storeStrong((id *)&self->_ctRelay, 0);
}

@end