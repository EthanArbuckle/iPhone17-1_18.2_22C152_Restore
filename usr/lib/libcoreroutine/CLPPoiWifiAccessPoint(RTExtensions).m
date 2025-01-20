@interface CLPPoiWifiAccessPoint(RTExtensions)
- (id)length12StringForMac:()RTExtensions;
- (void)initWithRTWifiAccessPoint:()RTExtensions;
@end

@implementation CLPPoiWifiAccessPoint(RTExtensions)

- (void)initWithRTWifiAccessPoint:()RTExtensions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = objc_opt_new();
    [v4 age];
    [v5 setAge:];
    v6 = [v4 date];
    [v6 timeIntervalSinceReferenceDate];
    [v5 setScanTimestamp:];

    [v5 setChannel:[v4 channel]];
    v7 = [v4 mac];
    v8 = [a1 length12StringForMac:v7];
    if (v8)
    {
      [v5 setMac:v8];
    }
    else
    {
      v10 = [v4 mac];
      [v5 setMac:v10];
    }
    [v5 setRssi:[v4 rssi]];
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      v13 = "-[CLPPoiWifiAccessPoint(RTExtensions) initWithRTWifiAccessPoint:]";
      __int16 v14 = 1024;
      int v15 = 231;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: rtWifiAccessPoint (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }

    v5 = 0;
  }

  return v5;
}

- (id)length12StringForMac:()RTExtensions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [a3 componentsSeparatedByString:@":"];
  if ([v3 count] == 6)
  {
    id v4 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "length", (void)v13) != 2)
          {
            if ([v10 length] != 1)
            {

              id v11 = 0;
              goto LABEL_15;
            }
            [v4 appendString:@"0"];
          }
          [v4 appendString:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v11 = v4;
LABEL_15:
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end