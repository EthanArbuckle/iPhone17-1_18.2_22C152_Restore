@interface WifiScannerCommonDarwin
+ (id)channelDictsForChannels:(id)a3 withSupportedChannelDicts:(id)a4;
+ (id)commonNetworkResultsToScanResults:(id)a3 withConverter:(id)a4;
+ (id)dictionaryToScanSettings:(id)a3;
+ (id)findChannel:(int)a3 in:(id)a4;
+ (id)networkResultsToScanResults:(id)a3;
+ (id)scanResultWithAge:(id)a3 bssid:(id)a4 ssid:(id)a5 channel:(id)a6 rssi:(id)a7 flags:(id)a8 adHoc:(BOOL)a9 captive:(BOOL)a10 mode:(id)a11 personalHotspot:(BOOL)a12;
+ (id)scanSettingsToDictionary:(id)a3 usingSupportedChannels:(id)a4 logTo:(id)a5;
@end

@implementation WifiScannerCommonDarwin

+ (id)scanSettingsToDictionary:(id)a3 usingSupportedChannels:(id)a4 logTo:(id)a5
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
  [v8 setObject:&__kCFBooleanFalse forKey:@"SCAN_MERGE"];
  if (!v6)
  {
    [v8 setObject:&off_10046F178 forKey:@"SCAN_TYPE"];
    [v8 setObject:&off_10046F190 forKey:@"SCAN_DWELL_TIME"];
    goto LABEL_29;
  }
  unsigned int v9 = [v6 scanType];
  if (v9)
  {
    if (v9 == 1)
    {
      v10 = &off_10046F1A8;
      goto LABEL_8;
    }
    if (v9 == 2)
    {
      v10 = &off_10046F178;
LABEL_8:
      [v8 setObject:v10 forKey:@"SCAN_TYPE"];
      goto LABEL_14;
    }
    if (qword_10047BED8 != -1) {
      dispatch_once(&qword_10047BED8, &stru_100468490);
    }
    v11 = (id)qword_10047BEE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v20 = 67109120;
      LODWORD(v21) = [v6 scanType];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unsupported scan type %d", (uint8_t *)&v20, 8u);
    }
  }
LABEL_14:
  if ([v6 lowPriorityScan]) {
    [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SCAN_LOW_PRIORITY"];
  }
  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SCAN_TRIM_RESULTS"];
  uint64_t v12 = (uint64_t)[v6 dwell];
  if (v12 >= 1)
  {
    v13 = +[NSNumber numberWithLongLong:v12];
    [v8 setObject:v13 forKey:@"SCAN_DWELL_TIME"];

    goto LABEL_21;
  }
  if (qword_10047BED8 == -1)
  {
    v14 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  dispatch_once(&qword_10047BED8, &stru_100468490);
  v14 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR))
  {
LABEL_20:
    int v20 = 134217984;
    uint64_t v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid dwell duration of %lld ms specified.  Default well time will be used", (uint8_t *)&v20, 0xCu);
  }
LABEL_21:
  if ([v6 includeOffChannelResults]) {
    [v8 setObject:&__kCFBooleanTrue forKey:@"SCAN_INC_OFFCHANNEL_BSS"];
  }
  v15 = [v6 channels];
  v16 = v7[2](v7);
  v17 = +[WifiScannerCommonDarwin channelDictsForChannels:v15 withSupportedChannelDicts:v16];

  if (!v17)
  {
    if (qword_10047BED8 == -1)
    {
      v18 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
    }
    else
    {
      dispatch_once(&qword_10047BED8, &stru_100468490);
      v18 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
    }
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "No WiFi channels are specified to scan.  Will scan all channels", (uint8_t *)&v20, 2u);
    goto LABEL_28;
  }
  [v8 setObject:v17 forKeyedSubscript:@"SCAN_CHANNELS"];
LABEL_28:

LABEL_29:

  return v8;
}

+ (id)channelDictsForChannels:(id)a3 withSupportedChannelDicts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 count];
    id v8 = 0;
    if (v6 && v7)
    {
      id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v5 count]];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v16;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = [WifiScannerCommonDarwin findChannel:[*(id *)(*((void *)&v15 + 1) + 8 * i) intValue] in:v6];
            if (v13) {
              [v8 addObject:v13];
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)findChannel:(int)a3 in:(id)a4
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 objectForKeyedSubscript:@"SUP_CHANNEL"];
        uint64_t v11 = v10;
        if (v10 && [v10 intValue] == a3)
        {
          v19[0] = @"CHANNEL";
          v19[1] = @"CHANNEL_FLAGS";
          v20[0] = v11;
          v13 = [v9 objectForKeyedSubscript:@"SUP_CHANNEL_FLAGS"];
          v20[1] = v13;
          uint64_t v12 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

          goto LABEL_12;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_12:

  return v12;
}

+ (id)dictionaryToScanSettings:(id)a3
{
  id v3 = a3;
  v27 = [v3 objectForKeyedSubscript:@"SCAN_CHANNELS"];
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v27 count]];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v27;
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)v29;
  do
  {
    id v8 = 0;
    do
    {
      if (*(void *)v29 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)v8) objectForKeyedSubscript:@"CHANNEL"];
      if (!v9)
      {
        sub_1000AE4B0(v33, "");
        sub_10024F040("Cannot find channel in settings dictionary", &v36);
        sub_10016A2C4((uint64_t)v33, (uint64_t)&v36, 1);
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v36.__r_.__value_.__l.__data_);
          if (v34 < 0) {
            goto LABEL_13;
          }
        }
        else
        {
          if ((v34 & 0x80000000) == 0) {
            goto LABEL_11;
          }
LABEL_13:
          operator delete(v33[0]);
        }
LABEL_11:
        sub_1000D11E0((uint64_t)&__p);
      }
      [v4 addObject:v9];

      id v8 = (char *)v8 + 1;
    }
    while (v6 != v8);
    id v10 = [v5 countByEnumeratingWithState:&v28 objects:v35 count:16];
    id v6 = v10;
  }
  while (v10);
LABEL_15:

  uint64_t v11 = [v3 objectForKeyedSubscript:@"SCAN_DWELL_TIME"];
  signed int v12 = [v11 intValue];

  v13 = [v3 objectForKeyedSubscript:@"SCAN_INC_OFFCHANNEL_BSS"];
  v14 = v13;
  if (v13) {
    id v15 = [v13 BOOLValue];
  }
  else {
    id v15 = 0;
  }
  long long v16 = [v3 objectForKeyedSubscript:@"SCAN_TYPE"];
  long long v17 = v16;
  if (v16)
  {
    unsigned int v18 = [v16 intValue];
    if (v18 == 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 2 * (v18 == 2);
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  int v20 = [v3 objectForKeyedSubscript:@"SCAN_LOW_PRIORITY"];
  uint64_t v21 = v20;
  if (v20) {
    id v22 = [v20 BOOLValue];
  }
  else {
    id v22 = 0;
  }
  v23 = [WifiScannerSettings alloc];
  LODWORD(v24) = 2141192192;
  v25 = [(WifiScannerSettings *)v23 initWithChannels:v4 dwell:v12 scanType:v19 includingOffChannelResults:v15 atDutyCycle:v22 asLowPriority:v24];

  return v25;
}

+ (id)scanResultWithAge:(id)a3 bssid:(id)a4 ssid:(id)a5 channel:(id)a6 rssi:(id)a7 flags:(id)a8 adHoc:(BOOL)a9 captive:(BOOL)a10 mode:(id)a11 personalHotspot:(BOOL)a12
{
  id v17 = a3;
  id v33 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a11;
  v23 = [WifiScanResult alloc];
  if (v17)
  {
    [v17 floatValue];
    float v25 = v24;
    if (v19) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v26 = 4294966296;
    if (v20) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  float v25 = NAN;
  if (!v19) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v26 = (uint64_t)[v19 intValue];
  if (v20)
  {
LABEL_4:
    uint64_t v27 = (uint64_t)[v20 intValue];
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v27 = 2000000000;
LABEL_8:
  id v28 = [v21 unsignedIntValue];
  if (v22) {
    unsigned int v29 = [v22 intValue];
  }
  else {
    unsigned int v29 = -2000000000;
  }
  HIDWORD(v32) = v29;
  BYTE2(v32) = a10;
  BYTE1(v32) = a12;
  LOBYTE(v32) = a9;
  long long v30 = -[WifiScanResult initWithAge:bssid:ssid:channel:rssi:flags:adHoc:personalHotspot:captive:mode:](v23, "initWithAge:bssid:ssid:channel:rssi:flags:adHoc:personalHotspot:captive:mode:", (uint64_t)(v25 * 1000000.0), v33, v18, v26, v27, v28, v32);

  return v30;
}

+ (id)networkResultsToScanResults:(id)a3
{
  id v3 = +[WifiScannerCommonDarwin commonNetworkResultsToScanResults:a3 withConverter:&stru_100468470];

  return v3;
}

+ (id)commonNetworkResultsToScanResults:(id)a3 withConverter:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v5 count]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        signed int v12 = v6[2](v6, *(void *)(*((void *)&v14 + 1) + 8 * i));
        [v7 addObject:v12];
      }
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v7;
}

@end