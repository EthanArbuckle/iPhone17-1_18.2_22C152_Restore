@interface WISTelephonyUtils
+ (BOOL)isGSMRat:(id)a3;
+ (BOOL)isLteRat:(id)a3;
+ (BOOL)isNrRat:(id)a3;
+ (BOOL)isRegistrationDisplayStatusInService:(id)a3;
+ (BOOL)isRegistrationDisplayStatusOutOfService:(id)a3;
+ (BOOL)isServingCell:(id)a3;
+ (BOOL)isUMTSRat:(id)a3;
+ (BOOL)isValidContext:(id)a3;
+ (id)extractCellInfoValue:(id)a3 key:(id)a4 expectedClass:(Class)a5 error:(id *)a6;
+ (id)getArfcnFromCellInfo:(id)a3 error:(id *)a4;
+ (id)getBandFromCellInfo:(id)a3 error:(id *)a4;
+ (id)getBandwidthFromCellInfo:(id)a3 error:(id *)a4;
+ (id)getGciFromCellInfo:(id)a3 error:(id *)a4;
+ (id)getLacOrTacFromCellInfo:(id)a3 error:(id *)a4;
+ (id)getMAVNRNSANeighborCellInfo:(id)a3;
+ (id)getNSString:(const char *)a3;
+ (id)getPLMNFromMCC:(id)a3 AndMNC:(id)a4;
+ (id)getPciFromCellInfo:(id)a3 error:(id *)a4;
+ (id)getRATFromCellInfo:(id)a3 error:(id *)a4;
+ (id)getRATFromCellMonitorString:(id)a3;
+ (id)getServingCellInfo:(id)a3;
+ (id)getServingCellInfoFromArray:(id)a3;
+ (id)getShortenedRegistrationStateString:(id)a3;
+ (id)sanitizedSubscriptions:(id)a3;
+ (void)setError:(id *)a3 code:(int64_t)a4 message:(id)a5;
@end

@implementation WISTelephonyUtils

+ (BOOL)isValidContext:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    BOOL v5 = [v3 slotID] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)getServingCellInfo:(id)a3
{
  id v3 = [a3 legacyInfo];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = +[WISTelephonyUtils getServingCellInfoFromArray:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)getServingCellInfoFromArray:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1000D04A4;
  v10 = sub_1000D04B4;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000193F8;
  v5[3] = &unk_1001BBDE8;
  v5[4] = &v6;
  [a3 enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)getPciFromCellInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorCellRadioAccessTechnology expectedClass:objc_opt_class() error:a4];
  if (*a4)
  {
    id v8 = 0;
  }
  else if (+[WISTelephonyUtils isLteRat:v7] {
         || +[WISTelephonyUtils isNrRat:v7])
  }
  {
    v9 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorPCI expectedClass:objc_opt_class() error:a4];
    v10 = v9;
    if (*a4)
    {
      id v8 = 0;
    }
    else if ([v9 compare:&off_1001C3AC0] == (id)-1)
    {
      [a1 setError:a4 code:0 message:@"Reported PCI is less than zero"];
      id v8 = 0;
    }
    else
    {
      id v8 = v10;
    }
  }
  else
  {
    +[WISTelephonyUtils setError:a4 code:0 message:@"Cannot extract PCI: RAT is neither LTE nor NR"];
    id v8 = 0;
  }

  return v8;
}

+ (id)getRATFromCellInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorCellRadioAccessTechnology expectedClass:objc_opt_class() error:a4];
  id v8 = (void *)v7;
  v9 = 0;
  if (!*a4)
  {
    if (v7)
    {
      v9 = +[WISTelephonyUtils getRATFromCellMonitorString:v7];
      if (+[WISTelephonyUtils isLteRat:v8])
      {
        id v14 = 0;
        v10 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorDeploymentType expectedClass:objc_opt_class() error:&v14];
        id v11 = v14;
        if (!v11
          && v10
          && ([v10 isEqualToNumber:&off_1001C3AC0] & 1) == 0
          && ([v10 isEqualToNumber:&off_1001C3BC8] & 1) == 0)
        {
          uint64_t v12 = [a1 getNSString:"NR_NSA"];

          v9 = (void *)v12;
        }
      }
    }
  }

  return v9;
}

+ (id)getArfcnFromCellInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorCellRadioAccessTechnology expectedClass:objc_opt_class() error:a4];
  if (*a4)
  {
    id v8 = 0;
    goto LABEL_17;
  }
  if (+[WISTelephonyUtils isNrRat:v7])
  {
    uint64_t v9 = objc_opt_class();
    v10 = &kCTCellMonitorNRARFCN;
    goto LABEL_8;
  }
  if (+[WISTelephonyUtils isLteRat:v7]
    || +[WISTelephonyUtils isUMTSRat:v7])
  {
    uint64_t v9 = objc_opt_class();
    v10 = &kCTCellMonitorUARFCN;
    goto LABEL_8;
  }
  if (+[WISTelephonyUtils isGSMRat:v7])
  {
    uint64_t v9 = objc_opt_class();
    v10 = &kCTCellMonitorARFCN;
LABEL_8:
    id v11 = +[WISTelephonyUtils extractCellInfoValue:v6 key:*v10 expectedClass:v9 error:a4];
    uint64_t v12 = v11;
    if (*a4)
    {
      id v8 = 0;
    }
    else if ([v11 compare:&off_1001C3AC0] == (id)-1)
    {
      [a1 setError:a4 code:0 message:@"Reported ARFCN is less than zero"];
      id v8 = 0;
    }
    else
    {
      id v8 = v12;
      uint64_t v12 = v8;
    }
    goto LABEL_16;
  }
  [a1 setError:a4, 0, @"Can only extract ARFCN for GSM, UMTS, LTE and NR cells" code message];
  id v8 = 0;
  uint64_t v12 = 0;
LABEL_16:

LABEL_17:

  return v8;
}

+ (BOOL)isNrRat:(id)a3
{
  return [a3 isEqualToString:kCTCellMonitorRadioAccessTechnologyNR];
}

+ (id)getGciFromCellInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[WISTelephonyUtils extractCellInfoValue:v5 key:kCTCellMonitorMCC expectedClass:objc_opt_class() error:a4];
  uint64_t v7 = +[WISTelephonyUtils extractCellInfoValue:v5 key:kCTCellMonitorMNC expectedClass:objc_opt_class() error:a4];
  id v8 = +[WISTelephonyUtils extractCellInfoValue:v5 key:kCTCellMonitorCellId expectedClass:objc_opt_class() error:a4];
  uint64_t v9 = +[WISTelephonyUtils getLacOrTacFromCellInfo:v5 error:a4];
  v10 = (void *)v9;
  if (v6) {
    BOOL v11 = v7 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || v8 == 0 || v9 == 0)
  {
    v18 = 0;
  }
  else
  {
    id v14 = [v6 stringValue];
    v15 = [v7 stringValue];
    v16 = [v10 stringValue];
    v17 = [v8 stringValue];
    v18 = +[NSString stringWithFormat:@"%@.%@.%@.%@", v14, v15, v16, v17];
  }

  return v18;
}

+ (id)getLacOrTacFromCellInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[WISTelephonyUtils extractCellInfoValue:v5 key:kCTCellMonitorCellRadioAccessTechnology expectedClass:objc_opt_class() error:a4];
  if (*a4)
  {
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  if (+[WISTelephonyUtils isLteRat:v6]
    || +[WISTelephonyUtils isNrRat:v6])
  {
    uint64_t v8 = +[WISTelephonyUtils extractCellInfoValue:v5 key:kCTCellMonitorTAC expectedClass:objc_opt_class() error:a4];
LABEL_6:
    uint64_t v7 = (void *)v8;
    goto LABEL_7;
  }
  if (+[WISTelephonyUtils isGSMRat:v6]
    || +[WISTelephonyUtils isUMTSRat:v6])
  {
    uint64_t v8 = +[WISTelephonyUtils extractCellInfoValue:v5 key:kCTCellMonitorLAC expectedClass:objc_opt_class() error:a4];
    goto LABEL_6;
  }
  +[WISTelephonyUtils setError:a4 code:0 message:@"Cannot extract LAC/TAC: RAT is neither GSM, UMTS, LTE, nor NR"];
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

+ (id)extractCellInfoValue:(id)a3 key:(id)a4 expectedClass:(Class)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = [v8 objectForKey:v9];
    if (v10)
    {
      if (objc_opt_isKindOfClass())
      {
        id v10 = v10;
        BOOL v11 = v10;
        goto LABEL_9;
      }
      uint64_t v12 = +[NSString stringWithFormat:@"Value for key %@ is not of expected class", v9];
      +[WISTelephonyUtils setError:a6 code:0 message:v12];
    }
    else
    {
      uint64_t v12 = +[NSString stringWithFormat:@"Value for key %@ is null", v9];
      +[WISTelephonyUtils setError:a6 code:0 message:v12];
    }

    BOOL v11 = 0;
  }
  else
  {
    id v10 = +[NSString stringWithFormat:@"Cannot extract key %@, cell info is null", v9];
    BOOL v11 = 0;
    +[WISTelephonyUtils setError:a6 code:0 message:v10];
  }
LABEL_9:

  return v11;
}

+ (BOOL)isLteRat:(id)a3
{
  return [a3 isEqualToString:kCTCellMonitorRadioAccessTechnologyLTE];
}

+ (void)setError:(id *)a3 code:(int64_t)a4 message:(id)a5
{
  id v9 = a5;
  uint64_t v7 = +[NSMutableDictionary dictionary];
  [v7 setValue:v9 forKey:NSLocalizedDescriptionKey];
  id v8 = +[NSString stringWithUTF8String:"WISTelephonyUtils"];
  *a3 = +[NSError errorWithDomain:v8 code:a4 userInfo:v7];
}

+ (id)getBandwidthFromCellInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorCellRadioAccessTechnology expectedClass:objc_opt_class() error:a4];
  if (*a4)
  {
    id v8 = 0;
    goto LABEL_25;
  }
  if (!+[WISTelephonyUtils isLteRat:v7]
    && !+[WISTelephonyUtils isNrRat:v7])
  {
    id v8 = &off_1001C3AC0;
    goto LABEL_25;
  }
  id v9 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorBandwidth expectedClass:objc_opt_class() error:a4];
  id v10 = v9;
  if (!*a4)
  {
    if ([v9 compare:&off_1001C3AC0] == (id)-1)
    {
      CFStringRef v12 = @"Reported bandwidth is less than zero";
    }
    else
    {
      if (+[WISTelephonyUtils isLteRat:v7])
      {
        v16[0] = &off_1001C3AD8;
        v16[1] = &off_1001C3AF0;
        v17[0] = &off_1001C4158;
        v17[1] = &off_1001C3B08;
        v16[2] = &off_1001C3B20;
        v16[3] = &off_1001C3B50;
        v17[2] = &off_1001C3B38;
        v17[3] = &off_1001C3B68;
        v16[4] = &off_1001C3B80;
        v16[5] = &off_1001C3B98;
        v17[4] = &off_1001C3AF0;
        v17[5] = &off_1001C3BB0;
        BOOL v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:6];
        id v8 = [v11 objectForKeyedSubscript:v10];

        goto LABEL_24;
      }
      if (+[WISTelephonyUtils isNrRat:v7])
      {
        v13 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorCellType expectedClass:objc_opt_class() error:a4];
        if (*a4)
        {
          id v8 = 0;
LABEL_20:

          goto LABEL_24;
        }
        if (+[WISTelephonyUtils isServingCell:v13])
        {
          id v14 = v10;
LABEL_19:
          id v8 = v14;
          goto LABEL_20;
        }
        if ([v13 isEqualToString:kCTCellMonitorCellTypeNeighbor])
        {
          +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)[v10 unsignedLongLongValue] / 0xF4240);
          id v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
      CFStringRef v12 = @"Attempting to retrieve bandwidth from NR cell that is neither serving nor neighbor";
    }
    [a1 setError:a4 code:0 message:v12];
    id v8 = 0;
    goto LABEL_24;
  }
  id v8 = 0;
LABEL_24:

LABEL_25:

  return v8;
}

+ (BOOL)isServingCell:(id)a3
{
  return [a3 isEqualToString:kCTCellMonitorCellTypeServing];
}

+ (id)getRATFromCellMonitorString:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kCTCellMonitorRadioAccessTechnologyGSM])
  {
    id v5 = "GSM";
  }
  else if (([v4 isEqualToString:kCTCellMonitorRadioAccessTechnologyUMTS] & 1) != 0 {
         || ([v4 isEqualToString:kCTCellMonitorRadioAccessTechnologyUTRAN] & 1) != 0)
  }
  {
    id v5 = "WCDMA";
  }
  else if (([v4 isEqualToString:kCTCellMonitorRadioAccessTechnologyCDMA1x] & 1) != 0 {
         || ([v4 isEqualToString:kCTCellMonitorRadioAccessTechnologyCDMAEVDO] & 1) != 0)
  }
  {
    id v5 = "CDMA";
  }
  else if ([v4 isEqualToString:kCTCellMonitorRadioAccessTechnologyCDMAHybrid])
  {
    id v5 = "HYBRID";
  }
  else if ([v4 isEqualToString:kCTCellMonitorRadioAccessTechnologyLTE])
  {
    id v5 = "LTE";
  }
  else if ([v4 isEqualToString:kCTCellMonitorRadioAccessTechnologyUTRAN2])
  {
    id v5 = "TDSCDMA";
  }
  else if ([v4 isEqualToString:kCTCellMonitorRadioAccessTechnologyNR])
  {
    id v5 = "NR_SA";
  }
  else
  {
    id v5 = "Unknown";
  }
  id v6 = [a1 getNSString:v5];

  return v6;
}

+ (id)getNSString:(const char *)a3
{
  id v3 = +[NSString stringWithUTF8String:a3];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = @"ERROR";
  }

  return v5;
}

+ (id)getBandFromCellInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[WISTelephonyUtils extractCellInfoValue:v5 key:kCTCellMonitorBandInfo expectedClass:objc_opt_class() error:a4];
  uint64_t v7 = v6;
  if (*a4)
  {
    id v8 = 0;
  }
  else if ([v6 compare:&off_1001C3AC0] == (id)-1)
  {
    +[WISTelephonyUtils setError:a4 code:0 message:@"Band info is less than zero"];
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

+ (id)getMAVNRNSANeighborCellInfo:(id)a3
{
  id v3 = [a3 legacyInfo];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = sub_1000D04A4;
    BOOL v11 = sub_1000D04B4;
    id v12 = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100007C34;
    v6[3] = &unk_1001BBDE8;
    v6[4] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)getShortenedRegistrationStateString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 isEqualToString:kCTRegistrationStatusUnknown])
    {
      id v6 = "Unknown";
LABEL_16:
      uint64_t v7 = [a1 getNSString:v6];
      goto LABEL_18;
    }
    if ([v5 isEqualToString:kCTRegistrationStatusDenied])
    {
      id v6 = "Denied";
      goto LABEL_16;
    }
    if ([v5 isEqualToString:kCTRegistrationStatusRegisteredHome])
    {
      id v6 = "RegisteredHome";
      goto LABEL_16;
    }
    if ([v5 isEqualToString:kCTRegistrationStatusRegisteredRoaming])
    {
      id v6 = "RegisteredRoaming";
      goto LABEL_16;
    }
    if ([v5 isEqualToString:kCTRegistrationStatusNotRegistered])
    {
      id v6 = "NotRegistered";
      goto LABEL_16;
    }
    if ([v5 isEqualToString:kCTRegistrationStatusSearching])
    {
      id v6 = "Searching";
      goto LABEL_16;
    }
    if ([v5 isEqualToString:kCTRegistrationStatusEmergencyOnly])
    {
      id v6 = "EmergencyOnly";
      goto LABEL_16;
    }
  }
  uint64_t v7 = 0;
LABEL_18:

  return v7;
}

+ (id)sanitizedSubscriptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (+[WISTelephonyUtils isValidContext:](WISTelephonyUtils, "isValidContext:", v9, (void)v12)) {
          [v4 addObject:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v4 copy];

  return v10;
}

+ (BOOL)isUMTSRat:(id)a3
{
  return [a3 isEqualToString:kCTCellMonitorRadioAccessTechnologyUMTS];
}

+ (BOOL)isGSMRat:(id)a3
{
  return [a3 isEqualToString:kCTCellMonitorRadioAccessTechnologyGSM];
}

+ (BOOL)isRegistrationDisplayStatusInService:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:kCTRegistrationStatusRegisteredHome] & 1) != 0
    || ([v3 isEqualToString:kCTRegistrationStatusRegisteredRoaming] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:kCTRegistrationStatusEmergencyOnly];
  }

  return v4;
}

+ (BOOL)isRegistrationDisplayStatusOutOfService:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kCTRegistrationStatusNotRegistered]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:kCTRegistrationStatusSearching];
  }

  return v4;
}

+ (id)getPLMNFromMCC:(id)a3 AndMNC:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSNumberFormatter);
  [v7 setMinimumIntegerDigits:3];
  id v8 = [v7 stringFromNumber:v5];
  uint64_t v9 = [v7 stringFromNumber:v6];
  id v10 = +[NSString stringWithFormat:@"%@%@", v8, v9];

  return v10;
}

@end