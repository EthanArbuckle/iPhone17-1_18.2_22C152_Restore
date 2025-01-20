@interface CLNanoRegistry
- (BOOL)isAFire6OrOlderWatchPaired;
- (BOOL)isWatchPaired;
@end

@implementation CLNanoRegistry

- (BOOL)isWatchPaired
{
  unsigned int v2 = [+[NRPairedDeviceRegistry sharedInstance] isPaired];
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022E9D00);
  }
  v3 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67174657;
    unsigned int v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLNR,isWatchPaired,%{private}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022E9D00);
    }
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNanoRegistry isWatchPaired]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  return v2;
}

- (BOOL)isAFire6OrOlderWatchPaired
{
  id v2 = [+[NRPairedDeviceRegistry sharedInstance] getPairedDevices];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (!v3)
  {
    BOOL v29 = 0;
    goto LABEL_65;
  }
  id v4 = v3;
  BOOL v29 = 0;
  uint64_t v5 = *(void *)v32;
  uint64_t v6 = NRDevicePropertyProductType;
  id v30 = v2;
  do
  {
    unsigned int v7 = 0;
    do
    {
      if (*(void *)v32 != v5) {
        objc_enumerationMutation(v2);
      }
      id v8 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v7) valueForProperty:v6];
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022E9D00);
      }
      v9 = qword_102419388;
      if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        id v42 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CLNR,pairedDevice,productType,%{private}@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419380 != -1) {
          dispatch_once(&qword_102419380, &stru_1022E9D00);
        }
        int v35 = 138477827;
        id v36 = v8;
        v22 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v22);
        if (v22 != (char *)buf) {
          free(v22);
        }
      }
      id v10 = [v8 componentsSeparatedByString:@","];
      if ((unint64_t)[v10 count] >= 2)
      {
        id v11 = [v10 objectAtIndexedSubscript:0];
        if ([v11 containsString:@"Watch"])
        {
          v12 = (char *)[v11 rangeOfString:@"Watch"];
          if (v13)
          {
            signed int v14 = [[v11 substringFromIndex:&v12[v13]] intValue];
            int v15 = [[v10 objectAtIndexedSubscript:1] intValue];
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022E9D00);
            }
            uint64_t v16 = v14;
            v17 = qword_102419388;
            if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138478339;
              id v42 = v8;
              __int16 v43 = 2049;
              uint64_t v44 = v16;
              __int16 v45 = 2049;
              uint64_t v46 = v15;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "CLNR,pairedDevice,%{private}@,majorVersionInteger,%{private}ld,minorVersionInteger,%{private}ld", buf, 0x20u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419380 != -1) {
                dispatch_once(&qword_102419380, &stru_1022E9D00);
              }
              int v35 = 138478339;
              id v36 = v8;
              __int16 v37 = 2049;
              uint64_t v38 = v16;
              __int16 v39 = 2049;
              uint64_t v40 = v15;
              v23 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v23);
              if (v23 != (char *)buf) {
                free(v23);
              }
            }
            if ((int)v16 > 6)
            {
              id v2 = v30;
              goto LABEL_48;
            }
            if (v16 == 6 && v15 >= 10)
            {
              if (qword_102419380 != -1) {
                dispatch_once(&qword_102419380, &stru_1022E9D00);
              }
              id v2 = v30;
              v18 = qword_102419388;
              if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138477827;
                id v42 = v8;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CLNR,pairedDevice,Fire7OrNewer,%{private}@", buf, 0xCu);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_102419380 != -1) {
                  dispatch_once(&qword_102419380, &stru_1022E9D00);
                }
                int v35 = 138477827;
                id v36 = v8;
                v19 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v19);
LABEL_39:
                if (v19 != (char *)buf) {
                  free(v19);
                }
              }
            }
            else
            {
              if (qword_102419380 != -1) {
                dispatch_once(&qword_102419380, &stru_1022E9D00);
              }
              id v2 = v30;
              v21 = qword_102419388;
              if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138477827;
                id v42 = v8;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CLNR,pairedDevice,Fire6OrOlder,%{private}@", buf, 0xCu);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_102419380 != -1) {
                  dispatch_once(&qword_102419380, &stru_1022E9D00);
                }
                int v35 = 138477827;
                id v36 = v8;
                v24 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v24);
                if (v24 != (char *)buf) {
                  free(v24);
                }
              }
              BOOL v29 = 1;
            }
          }
          else
          {
            if (qword_102419380 != -1) {
              dispatch_once(&qword_102419380, &stru_1022E9D00);
            }
            v20 = qword_102419388;
            if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138477827;
              id v42 = v11;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "CLNR,could not compute cropped major version component,%{private}@,", buf, 0xCu);
            }
            if (sub_10013D1A0(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419380 != -1) {
                dispatch_once(&qword_102419380, &stru_1022E9D00);
              }
              int v35 = 138477827;
              id v36 = v11;
              v19 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 0, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v19);
              goto LABEL_39;
            }
          }
        }
      }
LABEL_48:
      unsigned int v7 = (char *)v7 + 1;
    }
    while (v4 != v7);
    id v25 = [v2 countByEnumeratingWithState:&v31 objects:v47 count:16];
    id v4 = v25;
  }
  while (v25);
LABEL_65:
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022E9D00);
  }
  v26 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67174657;
    LODWORD(v42) = v29;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "CLNR,isAFire6OrOlderWatchPaired,%{private}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022E9D00);
    }
    int v35 = 67174657;
    LODWORD(v36) = v29;
    v28 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v28);
    if (v28 != (char *)buf) {
      free(v28);
    }
  }
  return v29;
}

@end