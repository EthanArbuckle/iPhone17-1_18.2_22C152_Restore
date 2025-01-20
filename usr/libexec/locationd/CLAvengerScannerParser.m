@interface CLAvengerScannerParser
+ (id)convertToObjectDiscoveryDataWithAdvertisementData:(id)a3 rssi:(id)a4;
@end

@implementation CLAvengerScannerParser

+ (id)convertToObjectDiscoveryDataWithAdvertisementData:(id)a3 rssi:(id)a4
{
  if (!a3
    || ![a3 objectForKey:CBAdvertisementDataDeviceAddress]
    || ![a3 objectForKey:CBAdvertisementDataTimestamp])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331D00);
    }
    v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing data\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331D00);
      }
    }
    v7 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScannerParser missing data", "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing data\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }
  id v8 = [a3 objectForKey:CBAdvertisementDataDeviceAddressType];
  if (!v8)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331D00);
    }
    v15 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing address type\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331D00);
      }
    }
    v12 = qword_102419398;
    if (!os_signpost_enabled((os_log_t)qword_102419398)) {
      return 0;
    }
    *(_DWORD *)buf = 68289539;
    int v86 = 0;
    __int16 v87 = 2082;
    v88 = "";
    __int16 v89 = 2113;
    id v90 = a3;
    __int16 v91 = 2113;
    id v92 = a4;
    v13 = "CLAvengerScannerParser missing address type";
    v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing address type\", \"advertisementData\":%{private, locatio"
          "n:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
    goto LABEL_35;
  }
  if ([v8 integerValue] != (id)1)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331D00);
    }
    uint64_t v16 = qword_102419398;
    if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    *(_DWORD *)buf = 68289539;
    int v86 = 0;
    __int16 v87 = 2082;
    v88 = "";
    __int16 v89 = 2113;
    id v90 = a3;
    __int16 v91 = 2113;
    id v92 = a4;
    v17 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser address type must be random\", \"advertisementData\":%{private, "
          "location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
    goto LABEL_40;
  }
  if (!_os_feature_enabled_impl()
    || (v9 = CBAdvertisementDataManufacturerDataKey,
        [a3 objectForKey:CBAdvertisementDataManufacturerDataKey])
    || (v10 = CBAdvertisementDataServiceDataKey, ![a3 objectForKey:CBAdvertisementDataServiceDataKey]))
  {
    if (!_os_feature_enabled_impl()
      || (v9 = CBAdvertisementDataManufacturerDataKey,
          ![a3 objectForKey:CBAdvertisementDataManufacturerDataKey])
      || (v10 = CBAdvertisementDataServiceDataKey, [a3 objectForKey:CBAdvertisementDataServiceDataKey]))
    {
      if ((_os_feature_enabled_impl() & 1) != 0
        || (v9 = CBAdvertisementDataManufacturerDataKey,
            ![a3 objectForKey:CBAdvertisementDataManufacturerDataKey])
        || (v10 = CBAdvertisementDataServiceDataKey, [a3 objectForKey:CBAdvertisementDataServiceDataKey]))
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331D00);
        }
        v11 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289539;
          int v86 = 0;
          __int16 v87 = 2082;
          v88 = "";
          __int16 v89 = 2113;
          id v90 = a3;
          __int16 v91 = 2113;
          id v92 = a4;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing data or Posh feature flag needs to be enabled/disabled\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331D00);
          }
        }
        v12 = qword_102419398;
        if (!os_signpost_enabled((os_log_t)qword_102419398)) {
          return 0;
        }
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        v13 = "CLAvengerScannerParser missing data or Posh feature flag needs to be enabled/disabled";
        v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing data or Posh feature flag needs to be enabled/disabl"
              "ed\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
        goto LABEL_35;
      }
    }
  }
  if ([a3 objectForKey:v9])
  {
    id v22 = [a3 objectForKeyedSubscript:v9];
    if ((unint64_t)[v22 length] <= 3)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331D00);
      }
      v23 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser length not long enough to extract preamble\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331D00);
        }
      }
      v12 = qword_102419398;
      if (!os_signpost_enabled((os_log_t)qword_102419398)) {
        return 0;
      }
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      v13 = "CLAvengerScannerParser length not long enough to extract preamble";
      v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser length not long enough to extract preamble\", \"advertisementD"
            "ata\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
      goto LABEL_35;
    }
    v29 = [v22 bytes];
    if (*(_WORD *)v29 == 76 && (v30 = v29, v29[2] == 18))
    {
      id v31 = [v22 length];
      uint64_t v32 = v30[3];
      if (v31 == (id)(v32 + 4))
      {
        if (v32 <= 0x19 && ((1 << v32) & 0x3000004) != 0)
        {
          id v33 = [a3 objectForKeyedSubscript:CBAdvertisementDataDeviceAddress];
          if (v33)
          {
            if (*(unsigned __int8 *)[v33 bytes] > 0xBFu)
            {
              int v34 = v30[3];
              if (v34 != 25)
              {
                if (v34 == 24)
                {
                  v67 = (unsigned __int8 *)[v22 bytes];
                  unsigned int v83 = v67[4];
                  v37 = +[NSMutableData dataWithBytes:v67 + 27 length:1];
                  v38 = +[NSData dataWithBytes:v67 + 5 length:22];
                  id v84 = 0;
                  char v36 = 0;
                  goto LABEL_192;
                }
                if (v34 == 2)
                {
                  v35 = (unsigned __int8 *)[v22 bytes];
                  unsigned int v83 = v35[4];
                  char v36 = 1;
                  v37 = +[NSMutableData dataWithBytes:v35 + 5 length:1];
                  v38 = +[NSData data];
                  id v84 = 0;
LABEL_192:
                  int v60 = 2;
                  goto LABEL_193;
                }
                if (qword_102419390 != -1) {
                  dispatch_once(&qword_102419390, &stru_102331D00);
                }
                uint64_t v81 = qword_102419398;
                if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO)) {
                  return 0;
                }
                *(_DWORD *)buf = 68289539;
                int v86 = 0;
                __int16 v87 = 2082;
                v88 = "";
                __int16 v89 = 2113;
                id v90 = a3;
                __int16 v91 = 2113;
                id v92 = a4;
                v17 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser length check should not have allowed this else case\""
                      ", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
                v18 = v81;
                os_log_type_t v19 = OS_LOG_TYPE_INFO;
                goto LABEL_41;
              }
              v66 = (unsigned __int8 *)[v22 bytes];
              unsigned int v83 = v66[4];
              int v60 = 2;
              v37 = +[NSMutableData dataWithBytes:v66 + 27 length:2];
              v38 = +[NSData dataWithBytes:v66 + 5 length:22];
              id v84 = 0;
              char v36 = 0;
LABEL_193:
              int v61 = 1;
              goto LABEL_194;
            }
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331D00);
            }
            uint64_t v16 = qword_102419398;
            if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG)) {
              return 0;
            }
            *(_DWORD *)buf = 68289539;
            int v86 = 0;
            __int16 v87 = 2082;
            v88 = "";
            __int16 v89 = 2113;
            id v90 = a3;
            __int16 v91 = 2113;
            id v92 = a4;
            v17 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser address type must be random static\", \"advertisementDat"
                  "a\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
LABEL_40:
            v18 = v16;
            os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
LABEL_41:
            uint32_t v20 = 38;
LABEL_42:
            _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);
            return 0;
          }
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331D00);
          }
          v62 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68289539;
            int v86 = 0;
            __int16 v87 = 2082;
            v88 = "";
            __int16 v89 = 2113;
            id v90 = a3;
            __int16 v91 = 2113;
            id v92 = a4;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing address\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331D00);
            }
          }
          v12 = qword_102419398;
          if (!os_signpost_enabled((os_log_t)qword_102419398)) {
            return 0;
          }
          *(_DWORD *)buf = 68289539;
          int v86 = 0;
          __int16 v87 = 2082;
          v88 = "";
          __int16 v89 = 2113;
          id v90 = a3;
          __int16 v91 = 2113;
          id v92 = a4;
          v13 = "CLAvengerScannerParser missing address";
          v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing address\", \"advertisementData\":%{private, locati"
                "on:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
        }
        else
        {
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331D00);
          }
          v63 = qword_102419398;
          if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68289539;
            int v86 = 0;
            __int16 v87 = 2082;
            v88 = "";
            __int16 v89 = 2113;
            id v90 = a3;
            __int16 v91 = 2113;
            id v92 = a4;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized length\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
            if (qword_102419390 != -1) {
              dispatch_once(&qword_102419390, &stru_102331D00);
            }
          }
          v12 = qword_102419398;
          if (!os_signpost_enabled((os_log_t)qword_102419398)) {
            return 0;
          }
          *(_DWORD *)buf = 68289539;
          int v86 = 0;
          __int16 v87 = 2082;
          v88 = "";
          __int16 v89 = 2113;
          id v90 = a3;
          __int16 v91 = 2113;
          id v92 = a4;
          v13 = "CLAvengerScannerParser unrecognized length";
          v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized length\", \"advertisementData\":%{private, lo"
                "cation:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
        }
      }
      else
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331D00);
        }
        v53 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289539;
          int v86 = 0;
          __int16 v87 = 2082;
          v88 = "";
          __int16 v89 = 2113;
          id v90 = a3;
          __int16 v91 = 2113;
          id v92 = a4;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser stated length doesnt match actual data length\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331D00);
          }
        }
        v12 = qword_102419398;
        if (!os_signpost_enabled((os_log_t)qword_102419398)) {
          return 0;
        }
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        v13 = "CLAvengerScannerParser stated length doesnt match actual data length";
        v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser stated length doesnt match actual data length\", \"advertise"
              "mentData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
      }
    }
    else
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331D00);
      }
      v39 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser companyID and type mismatch\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331D00);
        }
      }
      v12 = qword_102419398;
      if (!os_signpost_enabled((os_log_t)qword_102419398)) {
        return 0;
      }
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      v13 = "CLAvengerScannerParser companyID and type mismatch";
      v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser companyID and type mismatch\", \"advertisementData\":%{private"
            ", location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
    }
LABEL_35:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v13, v14, buf, 0x26u);
    return 0;
  }
  if (!_os_feature_enabled_impl())
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331D00);
    }
    v40 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser advertisement type check should not have allowed this else case\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331D00);
      }
    }
    v12 = qword_102419398;
    if (!os_signpost_enabled((os_log_t)qword_102419398)) {
      return 0;
    }
    *(_DWORD *)buf = 68289539;
    int v86 = 0;
    __int16 v87 = 2082;
    v88 = "";
    __int16 v89 = 2113;
    id v90 = a3;
    __int16 v91 = 2113;
    id v92 = a4;
    v13 = "CLAvengerScannerParser advertisement type check should not have allowed this else case";
    v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser advertisement type check should not have allowed this else case\""
          ", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
    goto LABEL_35;
  }
  id v24 = [a3 objectForKey:v10];
  v25 = +[CBUUID UUIDWithString:@"FCB2"];
  v26 = +[CBUUID UUIDWithString:@"FEAA"];
  id v27 = [v24 objectForKey:v25];
  if (v27)
  {
    v28 = (NSMutableData *)[v24 objectForKey:v25];
  }
  else
  {
    if (![v24 objectForKey:v26])
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331D00);
      }
      v54 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing posh service data\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331D00);
        }
      }
      v12 = qword_102419398;
      if (!os_signpost_enabled((os_log_t)qword_102419398)) {
        return 0;
      }
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      v13 = "CLAvengerScannerParser missing posh service data";
      v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing posh service data\", \"advertisementData\":%{private, "
            "location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
      goto LABEL_35;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331D00);
    }
    v41 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScannerParser parsing backwardsPosh service data\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    v28 = +[NSMutableData dataWithBytes:&unk_101E31350 length:1];
    -[NSMutableData appendData:](v28, "appendData:", [v24 objectForKey:v26]);
  }
  if ([(NSMutableData *)v28 length] <= 1)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331D00);
    }
    v42 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser length not long enough to extract posh preamble\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331D00);
      }
    }
    v12 = qword_102419398;
    if (!os_signpost_enabled((os_log_t)qword_102419398)) {
      return 0;
    }
    *(_DWORD *)buf = 68289539;
    int v86 = 0;
    __int16 v87 = 2082;
    v88 = "";
    __int16 v89 = 2113;
    id v90 = a3;
    __int16 v91 = 2113;
    id v92 = a4;
    v13 = "CLAvengerScannerParser length not long enough to extract posh preamble";
    v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser length not long enough to extract posh preamble\", \"advertiseme"
          "ntData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
    goto LABEL_35;
  }
  v43 = (unsigned __int8 *)[(NSMutableData *)v28 bytes];
  id v44 = [objc_alloc((Class)NSNumber) initWithInt:*v43];
  int v45 = *v43;
  id v46 = [(NSMutableData *)v28 length];
  if (v45 == 1)
  {
    if (v46 != (id)4 && (id)[(NSMutableData *)v28 length] != (id)27)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331D00);
      }
      v47 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized Apple Posh service data length\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331D00);
        }
      }
      v12 = qword_102419398;
      if (!os_signpost_enabled((os_log_t)qword_102419398)) {
        return 0;
      }
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      v13 = "CLAvengerScannerParser unrecognized Apple Posh service data length";
      v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized Apple Posh service data length\", \"advertisement"
            "Data\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
      goto LABEL_35;
    }
  }
  else if ((unint64_t)v46 >= 0x1C)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331D00);
    }
    v48 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 2113;
      id v90 = a3;
      __int16 v91 = 2113;
      id v92 = a4;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized non-Apple Posh service data length\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331D00);
      }
    }
    v12 = qword_102419398;
    if (!os_signpost_enabled((os_log_t)qword_102419398)) {
      return 0;
    }
    *(_DWORD *)buf = 68289539;
    int v86 = 0;
    __int16 v87 = 2082;
    v88 = "";
    __int16 v89 = 2113;
    id v90 = a3;
    __int16 v91 = 2113;
    id v92 = a4;
    v13 = "CLAvengerScannerParser unrecognized non-Apple Posh service data length";
    v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized non-Apple Posh service data length\", \"advertiseme"
          "ntData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
    goto LABEL_35;
  }
  if (v27) {
    char v36 = v43[1];
  }
  else {
    char v36 = (v43[1] & 1) == 0;
  }
  if (v45 == 1)
  {
    id v49 = [(NSMutableData *)v28 length];
    if (v36)
    {
      if (v49 != (id)4)
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331D00);
        }
        v64 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289539;
          int v86 = 0;
          __int16 v87 = 2082;
          v88 = "";
          __int16 v89 = 2113;
          id v90 = a3;
          __int16 v91 = 2113;
          id v92 = a4;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser incorrect posh service data length for Apple near owner type\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331D00);
          }
        }
        v12 = qword_102419398;
        if (!os_signpost_enabled((os_log_t)qword_102419398)) {
          return 0;
        }
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        v13 = "CLAvengerScannerParser incorrect posh service data length for Apple near owner type";
        v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser incorrect posh service data length for Apple near owner type"
              "\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
        goto LABEL_35;
      }
      id v84 = v44;
      v50 = (unsigned __int8 *)[(NSMutableData *)v28 bytes];
      unsigned int v51 = v50[2];
      v37 = +[NSMutableData dataWithBytes:v50 + 3 length:1];
      v52 = +[NSData data];
    }
    else
    {
      if (v49 != (id)27)
      {
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331D00);
        }
        v65 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289539;
          int v86 = 0;
          __int16 v87 = 2082;
          v88 = "";
          __int16 v89 = 2113;
          id v90 = a3;
          __int16 v91 = 2113;
          id v92 = a4;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser incorrect posh service data length for Apple wild type\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
          if (qword_102419390 != -1) {
            dispatch_once(&qword_102419390, &stru_102331D00);
          }
        }
        v12 = qword_102419398;
        if (!os_signpost_enabled((os_log_t)qword_102419398)) {
          return 0;
        }
        *(_DWORD *)buf = 68289539;
        int v86 = 0;
        __int16 v87 = 2082;
        v88 = "";
        __int16 v89 = 2113;
        id v90 = a3;
        __int16 v91 = 2113;
        id v92 = a4;
        v13 = "CLAvengerScannerParser incorrect posh service data length for Apple wild type";
        v14 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser incorrect posh service data length for Apple wild type\", \""
              "advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
        goto LABEL_35;
      }
      id v84 = v44;
      v56 = (unsigned __int8 *)[(NSMutableData *)v28 bytes];
      unsigned int v51 = v56[2];
      v37 = +[NSMutableData dataWithBytes:v56 + 25 length:2];
      v52 = +[NSData dataWithBytes:v56 + 3 length:22];
    }
    v38 = v52;
  }
  else
  {
    if ((v36 & 1) != 0 || (_os_feature_enabled_impl() & 1) == 0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331D00);
      }
      uint64_t v55 = qword_102419398;
      if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG)) {
        return 0;
      }
      *(_DWORD *)buf = 68289283;
      int v86 = 0;
      __int16 v87 = 2082;
      v88 = "";
      __int16 v89 = 1025;
      LODWORD(v90) = v36 & 1;
      v17 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser ignoring non apple posh\", \"isNearOwner\":%{private}hhd}";
      v18 = v55;
      os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
      uint32_t v20 = 24;
      goto LABEL_42;
    }
    id v84 = v44;
    v37 = (NSMutableData *)+[NSMutableData data];
    v38 = +[NSData data];
    unsigned int v51 = 0;
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331D00);
  }
  v57 = qword_102419398;
  unsigned int v83 = v51;
  if (!os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_INFO))
  {
    if (v45 != 1)
    {
      int v61 = 0;
      int v60 = 1;
      goto LABEL_194;
    }
LABEL_170:
    int v60 = 3;
    goto LABEL_193;
  }
  v58 = "NO";
  *(_DWORD *)buf = 68290562;
  int v86 = 0;
  __int16 v87 = 2082;
  v88 = "";
  if (v45 == 1) {
    v59 = "YES";
  }
  else {
    v59 = "NO";
  }
  __int16 v89 = 2114;
  if (v36) {
    v58 = "YES";
  }
  id v90 = v28;
  __int16 v91 = 2082;
  id v92 = (id)v59;
  __int16 v93 = 2082;
  v94 = v58;
  __int16 v95 = 2050;
  uint64_t v96 = v51;
  __int16 v97 = 2114;
  v98 = v37;
  __int16 v99 = 2114;
  v100 = v38;
  int v60 = 1;
  _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScannerParser posh\", \"data\":%{public, location:escape_only}@, \"isApple\":%{public, location:escape_only}s, \"isNearOwner\":%{public, location:escape_only}s, \"status\":%{public}lu, \"reserved\":%{public, location:escape_only}@, \"pubKey2\":%{public, location:escape_only}@}", buf, 0x4Eu);
  if (v45 == 1) {
    goto LABEL_170;
  }
  int v61 = 0;
LABEL_194:
  if (v36) {
    int v68 = v60 | 4;
  }
  else {
    int v68 = v60;
  }
  v69 = +[NSMutableData dataWithData:](NSMutableData, "dataWithData:", [a3 objectForKeyedSubscript:CBAdvertisementDataDeviceAddress]);
  [objc_msgSend(a3, "objectForKeyedSubscript:", CBAdvertisementDataTimestamp) doubleValue];
  v70 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  v71 = (_UNKNOWN **)[a3 objectForKeyedSubscript:CBAdvertisementDataChannel];
  if (v61)
  {
    v72 = [(NSMutableData *)v37 mutableBytes];
    char v73 = *v72;
    *v72 &= 0xFCu;
    v74 = [(NSMutableData *)v69 mutableBytes];
    unsigned char *v74 = *v74 & 0x3F | (v73 << 6);
  }
  id v75 = [a3 objectForKeyedSubscript:CBAdvertisementDataHostWakeEvent];
  if (v75) {
    BOOL v76 = (uint64_t)[v75 integerValue] > 0;
  }
  else {
    BOOL v76 = 0;
  }
  v77 = [CLAvengerScannerClientObjectDiscoveryData alloc];
  v78 = +[NSData dataWithData:v69];
  id v79 = [a4 integerValue];
  v80 = &off_102395288;
  if (v71) {
    v80 = v71;
  }
  HIDWORD(v82) = v68;
  LOBYTE(v82) = v76;
  return -[CLAvengerScannerClientObjectDiscoveryData initWithAddress:advertisementData:status:reserved:rssi:scanDate:channel:didCauseWake:detailsBitmask:protocolID:](v77, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:channel:didCauseWake:detailsBitmask:protocolID:", v78, v38, v83, v37, v79, v70, v80, v82, v84);
}

@end