@interface RDXPCHandler
- (RDCachedData)dataCache;
- (RDXPCHandler)init;
- (_TtC8countryd14RDStatusSharer)sharer;
- (void)clearStatusSharedWithPeers;
- (void)createCacheDirAtPath:(id)a3;
- (void)createNewDataCache;
- (void)ping;
- (void)setCacheLockState:(BOOL)a3;
- (void)setDataCache:(id)a3;
- (void)setSharer:(id)a3;
- (void)shareStatusWithPeers;
- (void)triggerUpdateToEligibilityEngine;
- (void)update:(int64_t)a3 withCountryCode:(id)a4;
- (void)update:(int64_t)a3 withDict:(id)a4;
- (void)update:(int64_t)a3 withListOfCountryCodes:(id)a4;
- (void)updatePeer:(id)a3 withCountryCode:(id)a4 priority:(int)a5 andTimestamp:(id)a6;
- (void)updatePeer:(id)a3 withEstimate:(id)a4;
- (void)updatePeer:(id)a3 withInfo:(id)a4;
@end

@implementation RDXPCHandler

- (void)createNewDataCache
{
  dataCache = self->_dataCache;
  self->_dataCache = 0;

  v4 = (RDCachedData *)objc_alloc_init((Class)RDCachedData);
  v5 = self->_dataCache;
  self->_dataCache = v4;

  v6 = self->_dataCache;

  [(RDCachedData *)v6 saveCache];
}

- (RDXPCHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)RDXPCHandler;
  v2 = [(RDXPCHandler *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[RDCachedData loadCache];
    dataCache = v2->_dataCache;
    v2->_dataCache = (RDCachedData *)v3;

    if (!v3)
    {
      if (qword_1000193A8 != -1) {
        dispatch_once(&qword_1000193A8, &stru_100014A78);
      }
      v5 = qword_1000193B0;
      if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v11 = 0;
        __int16 v12 = 2082;
        v13 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Cache load failed, perhaps because it was never set before. Starting a new one\"}", buf, 0x12u);
      }
      [(RDXPCHandler *)v2 createNewDataCache];
    }
    if (+[RDSharerAvailability hasLocalStatusKit])
    {
      v6 = objc_alloc_init(_TtC8countryd14RDStatusSharer);
      sharer = v2->_sharer;
      v2->_sharer = v6;
    }
  }
  return v2;
}

- (void)update:(int64_t)a3 withDict:(id)a4
{
  id v6 = a4;
  if (sub_10000B7F4())
  {
    if (sub_10000BA2C())
    {
      if (qword_1000193A8 != -1) {
        dispatch_once(&qword_1000193A8, &stru_100014A78);
      }
      v7 = qword_1000193B0;
      if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 68289026;
        int v25 = 0;
        __int16 v26 = 2082;
        v27 = "";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}", (uint8_t *)&v24, 0x12u);
      }
    }
    else
    {
      v8 = [v6 objectForKeyedSubscript:kRDUpdateKeyCountryCodes];
      objc_super v9 = [v6 objectForKeyedSubscript:kRDUpdateKeyInDisputedArea];
      id v10 = [v9 BOOLValueSafe];

      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (qword_1000193A8 != -1) {
          dispatch_once(&qword_1000193A8, &stru_100014A78);
        }
        v14 = (void *)qword_1000193B0;
        if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
        {
          v15 = v14;
          int v24 = 68289538;
          int v25 = 0;
          __int16 v26 = 2082;
          v27 = "";
          __int16 v28 = 2114;
          id v29 = v8;
          __int16 v30 = 2114;
          id v31 = (id)objc_opt_class();
          id v16 = v31;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"update from peer had malformed country codes entry\", \"countryCodes\":%{public, location:escape_only}@, \"class\":%{public, location:escape_only}@}", (uint8_t *)&v24, 0x26u);

          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
        }
        v17 = (void *)qword_1000193B0;
        if (os_signpost_enabled((os_log_t)qword_1000193B0))
        {
          v18 = v17;
          v19 = objc_opt_class();
          int v24 = 68289538;
          int v25 = 0;
          __int16 v26 = 2082;
          v27 = "";
          __int16 v28 = 2114;
          id v29 = v8;
          __int16 v30 = 2114;
          id v31 = v19;
          id v20 = v19;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "update from peer had malformed country codes entry", "{\"msg%{public}.0s\":\"update from peer had malformed country codes entry\", \"countryCodes\":%{public, location:escape_only}@, \"class\":%{public, location:escape_only}@}", (uint8_t *)&v24, 0x26u);
        }
      }
      else
      {
        id v11 = v8;
        switch(a3)
        {
          case 0:
            if (qword_1000193A8 != -1) {
              dispatch_once(&qword_1000193A8, &stru_100014A78);
            }
            __int16 v12 = qword_1000193B0;
            if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = 68289538;
              int v25 = 0;
              __int16 v26 = 2082;
              v27 = "";
              __int16 v28 = 2114;
              id v29 = v11;
              __int16 v30 = 1026;
              LODWORD(v31) = v10;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Location info update\", \"countryCodes\":%{public, location:escape_only}@, \"isDisputed\":%{public}hhd}", (uint8_t *)&v24, 0x22u);
            }
            v13 = [(RDXPCHandler *)self dataCache];
            [v13 setCountriesFromLocation:v11 isInDisputedArea:v10];
            goto LABEL_37;
          case 1:
            if (qword_1000193A8 != -1) {
              dispatch_once(&qword_1000193A8, &stru_100014A78);
            }
            v21 = qword_1000193B0;
            if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = 68289282;
              int v25 = 0;
              __int16 v26 = 2082;
              v27 = "";
              __int16 v28 = 2114;
              id v29 = v11;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"NearbyCell info update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v24, 0x1Cu);
            }
            v13 = [(RDXPCHandler *)self dataCache];
            [v13 setCountriesFromNearbyCells:v11];
            goto LABEL_37;
          case 2:
            if (qword_1000193A8 != -1) {
              dispatch_once(&qword_1000193A8, &stru_100014A78);
            }
            v22 = qword_1000193B0;
            if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = 68289282;
              int v25 = 0;
              __int16 v26 = 2082;
              v27 = "";
              __int16 v28 = 2114;
              id v29 = v11;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"ServingCell info update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v24, 0x1Cu);
            }
            v13 = [(RDXPCHandler *)self dataCache];
            [v13 setCountriesFromServingCell:v11];
            goto LABEL_37;
          case 3:
            if (qword_1000193A8 != -1) {
              dispatch_once(&qword_1000193A8, &stru_100014A78);
            }
            v23 = qword_1000193B0;
            if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = 68289282;
              int v25 = 0;
              __int16 v26 = 2082;
              v27 = "";
              __int16 v28 = 2114;
              id v29 = v11;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"WiFi AP info update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v24, 0x1Cu);
            }
            v13 = [(RDXPCHandler *)self dataCache];
            [v13 setCountriesFromWiFiAPs:v11];
LABEL_37:

            break;
          default:
            break;
        }
      }
    }
  }
}

- (void)update:(int64_t)a3 withListOfCountryCodes:(id)a4
{
  id v6 = a4;
  if (sub_10000B7F4())
  {
    if (!sub_10000BA2C())
    {
      switch(a3)
      {
        case 0:
          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
          objc_super v9 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 68289282;
            int v16 = 0;
            __int16 v17 = 2082;
            v18 = "";
            __int16 v19 = 2114;
            id v20 = v6;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Location update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
          }
          id v10 = [(RDXPCHandler *)self dataCache];
          [v10 setCountriesFromLocation:v6];
          goto LABEL_38;
        case 1:
          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
          id v11 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 68289282;
            int v16 = 0;
            __int16 v17 = 2082;
            v18 = "";
            __int16 v19 = 2114;
            id v20 = v6;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"NearbyCell update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
          }
          id v10 = [(RDXPCHandler *)self dataCache];
          [v10 setCountriesFromNearbyCells:v6];
          goto LABEL_38;
        case 2:
          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
          __int16 v12 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 68289282;
            int v16 = 0;
            __int16 v17 = 2082;
            v18 = "";
            __int16 v19 = 2114;
            id v20 = v6;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"ServingCell update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
          }
          id v10 = [(RDXPCHandler *)self dataCache];
          [v10 setCountriesFromServingCell:v6];
          goto LABEL_38;
        case 3:
          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
          v13 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 68289282;
            int v16 = 0;
            __int16 v17 = 2082;
            v18 = "";
            __int16 v19 = 2114;
            id v20 = v6;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"WiFi AP update\", \"countryCodes\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
          }
          id v10 = [(RDXPCHandler *)self dataCache];
          [v10 setCountriesFromWiFiAPs:v6];
          goto LABEL_38;
        case 4:
          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
          v7 = qword_1000193B0;
          if (!os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_39;
          }
          int v15 = 68289026;
          int v16 = 0;
          __int16 v17 = 2082;
          v18 = "";
          v8 = "{\"msg%{public}.0s\":\"clearing state\"}";
          goto LABEL_7;
        case 5:
          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
          v14 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 68289026;
            int v16 = 0;
            __int16 v17 = 2082;
            v18 = "";
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"forcing a recompute\"}", (uint8_t *)&v15, 0x12u);
          }
          id v10 = [(RDXPCHandler *)self dataCache];
          [v10 recompute];
LABEL_38:

          goto LABEL_39;
        default:
          goto LABEL_39;
      }
    }
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
    v7 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      v18 = "";
      v8 = "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0x12u);
    }
  }
LABEL_39:
}

- (void)update:(int64_t)a3 withCountryCode:(id)a4
{
  id v6 = a4;
  if (sub_10000B7F4())
  {
    if (!sub_10000BA2C())
    {
      switch(a3)
      {
        case 0:
          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
          objc_super v9 = (void *)qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = v6;
            id v11 = v9;
            int v20 = 68289282;
            int v21 = 0;
            __int16 v22 = 2082;
            v23 = "";
            __int16 v24 = 2082;
            id v25 = [v10 UTF8String];
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Location update\", \"countryCode\":%{public, location:escape_only}s}", (uint8_t *)&v20, 0x1Cu);
          }
          __int16 v12 = [(RDXPCHandler *)self dataCache];
          [v12 setCountryFromLocation:v6];
          goto LABEL_33;
        case 2:
          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
          v13 = (void *)qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = v6;
            int v15 = v13;
            int v20 = 68289282;
            int v21 = 0;
            __int16 v22 = 2082;
            v23 = "";
            __int16 v24 = 2082;
            id v25 = [v14 UTF8String];
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MCC update\", \"countryCode\":%{public, location:escape_only}s}", (uint8_t *)&v20, 0x1Cu);
          }
          __int16 v12 = [(RDXPCHandler *)self dataCache];
          [v12 setCountryFromMCC:v6];
          goto LABEL_33;
        case 3:
          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
          int v16 = (void *)qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = v6;
            v18 = v16;
            int v20 = 68289282;
            int v21 = 0;
            __int16 v22 = 2082;
            v23 = "";
            __int16 v24 = 2082;
            id v25 = [v17 UTF8String];
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"WiFi AP update\", \"countryCode\":%{public, location:escape_only}s}", (uint8_t *)&v20, 0x1Cu);
          }
          __int16 v12 = [(RDXPCHandler *)self dataCache];
          [v12 setCountryFromWiFiAPs:v6];
          goto LABEL_33;
        case 4:
          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
          v7 = qword_1000193B0;
          if (!os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_34;
          }
          int v20 = 68289026;
          int v21 = 0;
          __int16 v22 = 2082;
          v23 = "";
          v8 = "{\"msg%{public}.0s\":\"clearing state\"}";
          goto LABEL_7;
        case 5:
          if (qword_1000193A8 != -1) {
            dispatch_once(&qword_1000193A8, &stru_100014A78);
          }
          __int16 v19 = qword_1000193B0;
          if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = 68289026;
            int v21 = 0;
            __int16 v22 = 2082;
            v23 = "";
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"forcing a recompute\"}", (uint8_t *)&v20, 0x12u);
          }
          __int16 v12 = [(RDXPCHandler *)self dataCache];
          [v12 recompute];
LABEL_33:

          goto LABEL_34;
        default:
          goto LABEL_34;
      }
    }
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
    v7 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 68289026;
      int v21 = 0;
      __int16 v22 = 2082;
      v23 = "";
      v8 = "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v20, 0x12u);
    }
  }
LABEL_34:
}

- (void)updatePeer:(id)a3 withCountryCode:(id)a4 priority:(int)a5 andTimestamp:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (sub_10000BA2C())
  {
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
    v13 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 68289026;
      v17[1] = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}", (uint8_t *)v17, 0x12u);
    }
  }
  else
  {
    if (kRDPrioritySingleLocation + 1 < a5) {
      unsigned int v14 = kRDPrioritySingleLocation + 1;
    }
    else {
      unsigned int v14 = a5;
    }
    if (a5 >= 0) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = [objc_alloc((Class)RDEstimate) initWithCountryCode:v11 priority:v15 timestamp:v12 inDisputedArea:0];
    [(RDXPCHandler *)self updatePeer:v10 withEstimate:v16];
  }
}

- (void)updatePeer:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_10000BA2C())
  {
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
    v8 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v32 = 0;
      __int16 v33 = 2082;
      v34 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}", buf, 0x12u);
    }
  }
  else if (v6)
  {
    if (sub_10000B7F4())
    {
      objc_super v9 = [v7 firstObject];
      id v10 = [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.priority"];
      id v11 = [v10 integerValue];

      if (kRDPrioritySingleLocation + 1 < v11) {
        unsigned int v12 = kRDPrioritySingleLocation + 1;
      }
      else {
        unsigned int v12 = v11;
      }
      if ((uint64_t)v11 >= 0) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      if (qword_1000193A8 != -1) {
        dispatch_once(&qword_1000193A8, &stru_100014A78);
      }
      unsigned int v14 = (void *)qword_1000193B0;
      if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
      {
        log = v14;
        v27 = [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.priority"];
        id v29 = [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.priority"];
        id v15 = [v29 integerValue];
        [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.isDisputed"];
        id v16 = v30 = v13;
        unsigned int v17 = [v16 BOOLValue];
        __int16 v18 = [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.countryCode"];
        __int16 v19 = [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.timestamp"];
        *(_DWORD *)buf = 68290562;
        int v32 = 0;
        __int16 v33 = 2082;
        v34 = "";
        __int16 v35 = 2114;
        v36 = v9;
        __int16 v37 = 2114;
        v38 = v27;
        __int16 v39 = 2050;
        id v40 = v15;
        __int16 v41 = 1026;
        unsigned int v42 = v17;
        __int16 v43 = 2114;
        v44 = v18;
        __int16 v45 = 2114;
        v46 = v19;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"peer update received\", \"dict\":%{public, location:escape_only}@, \"prio\":%{public, location:escape_only}@, \"prioVal\":%{public}ld, \"disputed?\":%{public}hhd, \"countryCode\":%{public, location:escape_only}@, \"timestamp\":%{public, location:escape_only}@}", buf, 0x4Au);

        uint64_t v13 = v30;
      }
      id v20 = objc_alloc((Class)RDEstimate);
      int v21 = [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.countryCode"];
      __int16 v22 = [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.timestamp"];
      v23 = [v9 objectForKeyedSubscript:@"com.apple.RegulatoryDomain.peer_status.isDisputed"];
      id v24 = [v20 initWithCountryCode:v21 priority:v13 timestamp:v22 inDisputedArea:[v23 BOOLValue]];

      [(RDXPCHandler *)self updatePeer:v6 withEstimate:v24];
    }
  }
  else
  {
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
    id v25 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v32 = 0;
      __int16 v33 = 2082;
      v34 = "";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"got nil peer UUID!\"}", buf, 0x12u);
      if (qword_1000193A8 != -1) {
        dispatch_once(&qword_1000193A8, &stru_100014A78);
      }
    }
    __int16 v26 = qword_1000193B0;
    if (os_signpost_enabled((os_log_t)qword_1000193B0))
    {
      *(_DWORD *)buf = 68289026;
      int v32 = 0;
      __int16 v33 = 2082;
      v34 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "got nil peer UUID!", "{\"msg%{public}.0s\":\"got nil peer UUID!\"}", buf, 0x12u);
    }
  }
}

- (void)updatePeer:(id)a3 withEstimate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_10000BA2C())
  {
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
    v8 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"updates are currently disabled, ignoring\"}", buf, 0x12u);
    }
  }
  else if (v6)
  {
    if (sub_10000B7F4())
    {
      if (qword_100019630 != -1) {
        dispatch_once(&qword_100019630, &stru_100014A98);
      }
      objc_super v9 = qword_100019628;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000CD74;
      block[3] = &unk_1000149F8;
      id v13 = v7;
      unsigned int v14 = self;
      id v15 = v6;
      dispatch_async(v9, block);
    }
  }
  else
  {
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
    id v10 = qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"got nil peer UUID!\"}", buf, 0x12u);
      if (qword_1000193A8 != -1) {
        dispatch_once(&qword_1000193A8, &stru_100014A78);
      }
    }
    id v11 = qword_1000193B0;
    if (os_signpost_enabled((os_log_t)qword_1000193B0))
    {
      *(_DWORD *)buf = 68289026;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "got nil peer UUID!", "{\"msg%{public}.0s\":\"got nil peer UUID!\"}", buf, 0x12u);
    }
  }
}

- (void)shareStatusWithPeers
{
  uint64_t v3 = [(RDXPCHandler *)self dataCache];
  id v7 = [v3 getLocalOnlyEstimates];

  v4 = [v7 firstObject];
  v5 = [v4 dictionary];

  if (v5 && [v5 count])
  {
    id v6 = [(RDXPCHandler *)self sharer];
    [v6 shareStatusesWithEstimates:v7 completionHandler:&stru_100014A38];
  }
  else
  {
    [(RDXPCHandler *)self clearStatusSharedWithPeers];
  }
}

- (void)clearStatusSharedWithPeers
{
  id v2 = [(RDXPCHandler *)self sharer];
  [v2 shareStatusWithEstimate:0 completionHandler:&stru_100014A58];
}

- (void)ping
{
  if (qword_100019398 != -1) {
    dispatch_once(&qword_100019398, &stru_100014AB8);
  }
  id v2 = qword_1000193A0;
  if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289026;
    v3[1] = 0;
    __int16 v4 = 2082;
    v5 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"pinged!\"}", (uint8_t *)v3, 0x12u);
  }
}

- (void)createCacheDirAtPath:(id)a3
{
  id v3 = a3;
  if (qword_1000193A8 != -1) {
    dispatch_once(&qword_1000193A8, &stru_100014A78);
  }
  __int16 v4 = qword_1000193B0;
  if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
  {
    int v6 = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    objc_super v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Nothing should have used createCacheDirAtPath!\"}", (uint8_t *)&v6, 0x12u);
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
  }
  v5 = qword_1000193B0;
  if (os_signpost_enabled((os_log_t)qword_1000193B0))
  {
    int v6 = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    objc_super v9 = "";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Nothing should have used createCacheDirAtPath!", "{\"msg%{public}.0s\":\"Nothing should have used createCacheDirAtPath!\"}", (uint8_t *)&v6, 0x12u);
  }
}

- (void)triggerUpdateToEligibilityEngine
{
  if (qword_100019398 != -1) {
    dispatch_once(&qword_100019398, &stru_100014AB8);
  }
  id v3 = qword_1000193A0;
  if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    int v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"triggering update to eligibility engine\"}", (uint8_t *)v5, 0x12u);
  }
  __int16 v4 = [(RDXPCHandler *)self dataCache];
  [v4 postResultsToEligibilityEngine];
}

- (void)setCacheLockState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSXPCConnection currentConnection];
  v5 = [v4 valueForEntitlement:@"com.apple.countryd.lock"];
  if (!v5
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v5 BOOLValue] & 1) == 0)
  {
    if (qword_1000193A8 != -1) {
      dispatch_once(&qword_1000193A8, &stru_100014A78);
    }
    __int16 v8 = (void *)qword_1000193B0;
    if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_FAULT))
    {
      objc_super v9 = v8;
      int v14 = 68289538;
      int v15 = 0;
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2082;
      __int16 v19 = "com.apple.countryd.lock";
      __int16 v20 = 1026;
      unsigned int v21 = [v4 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"peer process is missing entitlement lock our cache\", \"entitlement\":%{public, location:escape_only}s, \"process\":%{public}d}", (uint8_t *)&v14, 0x22u);

      if (qword_1000193A8 != -1) {
        dispatch_once(&qword_1000193A8, &stru_100014A78);
      }
    }
    id v10 = (void *)qword_1000193B0;
    if (os_signpost_enabled((os_log_t)qword_1000193B0))
    {
      id v11 = v10;
      unsigned int v12 = [v4 processIdentifier];
      int v14 = 68289538;
      int v15 = 0;
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 2082;
      __int16 v19 = "com.apple.countryd.lock";
      __int16 v20 = 1026;
      unsigned int v21 = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "peer process is missing entitlement lock our cache", "{\"msg%{public}.0s\":\"peer process is missing entitlement lock our cache\", \"entitlement\":%{public, location:escape_only}s, \"process\":%{public}d}", (uint8_t *)&v14, 0x22u);
    }
    goto LABEL_20;
  }

  if (!geteuid())
  {
    if (qword_100019398 != -1) {
      dispatch_once(&qword_100019398, &stru_100014AB8);
    }
    id v13 = qword_1000193A0;
    if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      int v17 = "";
      __int16 v18 = 1026;
      LODWORD(v19) = v3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"updating lock state\", \"locked\":%{public}hhd}", (uint8_t *)&v14, 0x18u);
    }
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.RegulatoryDomain"];
    [v4 setBool:v3 forKey:@"UpdatesLocked"];
LABEL_20:

    return;
  }
  if (qword_100019398 != -1) {
    dispatch_once(&qword_100019398, &stru_100014AB8);
  }
  __int16 v6 = qword_1000193A0;
  if (os_log_type_enabled((os_log_t)qword_1000193A0, OS_LOG_TYPE_FAULT))
  {
    int v14 = 68289026;
    int v15 = 0;
    __int16 v16 = 2082;
    int v17 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"lock state can only be modified by root user\"}", (uint8_t *)&v14, 0x12u);
    if (qword_100019398 != -1) {
      dispatch_once(&qword_100019398, &stru_100014AB8);
    }
  }
  int v7 = qword_1000193A0;
  if (os_signpost_enabled((os_log_t)qword_1000193A0))
  {
    int v14 = 68289026;
    int v15 = 0;
    __int16 v16 = 2082;
    int v17 = "";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "lock state can only be modified by root user", "{\"msg%{public}.0s\":\"lock state can only be modified by root user\"}", (uint8_t *)&v14, 0x12u);
  }
}

- (RDCachedData)dataCache
{
  return (RDCachedData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDataCache:(id)a3
{
}

- (_TtC8countryd14RDStatusSharer)sharer
{
  return (_TtC8countryd14RDStatusSharer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharer, 0);

  objc_storeStrong((id *)&self->_dataCache, 0);
}

@end