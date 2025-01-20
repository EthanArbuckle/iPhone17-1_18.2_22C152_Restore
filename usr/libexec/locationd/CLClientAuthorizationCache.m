@interface CLClientAuthorizationCache
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isInitialCache;
- (CLClientAuthorizationCache)init;
- (CLLocation)currentLocation;
- (NSDictionary)clientKeyToAuthContextMap;
- (NSMutableArray)cachePopulationReplyBlocks;
- (NSMutableDictionary)clientKeyToClientInfoMap;
- (id)syncgetAuthorizationContextForClient:(id)a3 at:(id)a4;
- (id)syncgetAuthorizationContextIfClientIsNonZonal:(id)a3;
- (int)syncgetAuthorizationOfClient:(id)a3 forServiceMask:(unint64_t)a4;
- (void)beginService;
- (void)endService;
- (void)getAuthorizationContextOfNonZonalClient:(id)a3 withReply:(id)a4;
- (void)notifyWhenCacheIsPopulatedWithReply:(id)a3;
- (void)setCachePopulationReplyBlocks:(id)a3;
- (void)setClientKeyToAuthContextMap:(id)a3;
- (void)setClientKeyToClientInfoMap:(id)a3;
- (void)setClientsAuthorizationMap:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setIsInitialCache:(BOOL)a3;
- (void)setPersistentStoreDictionary:(id)a3 forClient:(id)a4;
@end

@implementation CLClientAuthorizationCache

- (id)syncgetAuthorizationContextIfClientIsNonZonal:(id)a3
{
  if ([(NSMutableDictionary *)[(CLClientAuthorizationCache *)self clientKeyToClientInfoMap] objectForKeyedSubscript:a3])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10232B450);
    }
    v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      id v14 = [a3 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Zonal client trying to access auth-context via Non-Zonal CLCAC api\", \"Client\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10232B450);
      }
    }
    v6 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      id v7 = [a3 UTF8String];
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2082;
      id v14 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Zonal client trying to access auth-context via Non-Zonal CLCAC api", "{\"msg%{public}.0s\":\"Zonal client trying to access auth-context via Non-Zonal CLCAC api\", \"Client\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x1Cu);
    }
  }
  return [(NSDictionary *)[(CLClientAuthorizationCache *)self clientKeyToAuthContextMap] objectForKeyedSubscript:a3];
}

- (void)getAuthorizationContextOfNonZonalClient:(id)a3 withReply:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006328C;
  v4[3] = &unk_1022F5FB0;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  [(CLClientAuthorizationCache *)self notifyWhenCacheIsPopulatedWithReply:v4];
}

- (void)setClientsAuthorizationMap:(id)a3
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10232B450);
  }
  v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    uint64_t buf = 68289282;
    __int16 v18 = 2082;
    v19 = "";
    __int16 v20 = 2114;
    id v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"setClientsAuthorizationMap\", \"clientToAuthorizationMap\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
  }
  if ([(CLClientAuthorizationCache *)self clientKeyToAuthContextMap]) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = [(CLClientAuthorizationCache *)self clientKeyToClientInfoMap] == 0;
  }
  [(CLClientAuthorizationCache *)self setIsInitialCache:v6];
  [(CLClientAuthorizationCache *)self setClientKeyToAuthContextMap:a3];
  if ([(CLClientAuthorizationCache *)self isInitialCache])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    cachePopulationReplyBlocks = self->_cachePopulationReplyBlocks;
    id v8 = [(NSMutableArray *)cachePopulationReplyBlocks countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(cachePopulationReplyBlocks);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))();
        }
        id v9 = [(NSMutableArray *)cachePopulationReplyBlocks countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    self->_cachePopulationReplyBlocks = 0;
  }
}

- (NSDictionary)clientKeyToAuthContextMap
{
  return self->_clientKeyToAuthContextMap;
}

- (void)setIsInitialCache:(BOOL)a3
{
  self->_isInitialCache = a3;
}

- (void)setClientKeyToAuthContextMap:(id)a3
{
}

- (void)notifyWhenCacheIsPopulatedWithReply:(id)a3
{
  if ([(CLClientAuthorizationCache *)self clientKeyToAuthContextMap]
    || [(CLClientAuthorizationCache *)self clientKeyToClientInfoMap])
  {
    v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
  else
  {
    cachePopulationReplyBlocks = self->_cachePopulationReplyBlocks;
    id v7 = [a3 copy];
    [(NSMutableArray *)cachePopulationReplyBlocks addObject:v7];
  }
}

- (BOOL)isInitialCache
{
  return self->_isInitialCache;
}

- (NSMutableDictionary)clientKeyToClientInfoMap
{
  return self->_clientKeyToClientInfoMap;
}

- (void)setCurrentLocation:(id)a3
{
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (id)getSilo
{
  if (qword_102488578 != -1) {
    dispatch_once(&qword_102488578, &stru_10232B430);
  }
  return (id)qword_102488570;
}

- (CLClientAuthorizationCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLClientAuthorizationCache;
  return [(CLClientAuthorizationCache *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLClientAuthorizationCacheProtocol outboundProtocol:&OBJC_PROTOCOL___CLClientAuthorizationCacheClientProtocol];
}

- (void)beginService
{
  self->_cachePopulationReplyBlocks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
}

- (void)endService
{
  [(CLClientAuthorizationCache *)self setClientKeyToAuthContextMap:0];

  self->_cachePopulationReplyBlocks = 0;

  [(CLClientAuthorizationCache *)self setClientKeyToClientInfoMap:0];
}

- (int)syncgetAuthorizationOfClient:(id)a3 forServiceMask:(unint64_t)a4
{
  id v6 = [(NSDictionary *)[(CLClientAuthorizationCache *)self clientKeyToAuthContextMap] objectForKeyedSubscript:a3];
  if (v6)
  {
    unsigned int v7 = [v6 transientAwareRegistrationResult];
    if ((a4 & 0xFFFFFFFFFFFF7380) != 0) {
      int v8 = 2;
    }
    else {
      int v8 = v7;
    }
  }
  else
  {
    int v8 = 4;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10232B450);
  }
  id v9 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 136315650;
    id v13 = [a3 UTF8String];
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    __int16 v16 = 1024;
    int v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "syncgetAuthorizationOfClient, %s, forServiceMask, %lx, authorized, %d", buf, 0x1Cu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10232B450);
    }
    [a3 UTF8String];
    __int16 v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLClientAuthorizationCache syncgetAuthorizationOfClient:forServiceMask:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  return v8;
}

- (id)syncgetAuthorizationContextForClient:(id)a3 at:(id)a4
{
  unsigned int v7 = [(NSDictionary *)[(CLClientAuthorizationCache *)self clientKeyToAuthContextMap] objectForKeyedSubscript:a3];
  if (v7)
  {
    int v8 = v7;
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10232B450);
    }
    uint64_t v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = [a3 UTF8String];
      uint64_t v10 = "{\"msg%{public}.0s\":\"#clcac fetching auth-context from non-zonal cache\", \"Client\":%{public, location:escape_only}s}";
      __int16 v11 = buf;
      long long v12 = v9;
      uint32_t v13 = 28;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, v10, v11, v13);
    }
  }
  else if ([(NSMutableDictionary *)[(CLClientAuthorizationCache *)self clientKeyToClientInfoMap] objectForKeyedSubscript:a3])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10232B450);
    }
    __int16 v14 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = [a3 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#clcac computing auth-context from clientInfo in zonal cache\", \"Client\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    unint64_t v15 = (NSMutableDictionary *)[(NSMutableDictionary *)[(CLClientAuthorizationCache *)self clientKeyToClientInfoMap] objectForKeyedSubscript:a3];
    id v16 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:@"BigSwitchState"];
    int v17 = sub_100122E44(v15, 0, v16 != 0, 0);
    unsigned int v18 = [[-[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 1) intValue];
    unsigned int v19 = [[-[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", 2) intValue];
    if (a4)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10232B450);
      }
      __int16 v20 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
      {
        id v21 = [a3 UTF8String];
        *(_DWORD *)uint64_t buf = 68289282;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#clcac location specified by zonal-client. Skip showing location-arrow\", \"Client\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
      [a4 clientLocation];
      return sub_10010758C(v15, v18, v19, v16 != 0, (uint64_t)v52);
    }
    else
    {
      v51[6] = xmmword_101D21660;
      v51[7] = unk_101D21670;
      memset(&v51[8], 0, 28);
      v51[2] = xmmword_101D21620;
      v51[3] = unk_101D21630;
      v51[4] = xmmword_101D21640;
      v51[5] = unk_101D21650;
      v51[0] = xmmword_101D21600;
      v51[1] = unk_101D21610;
      v26 = sub_10010758C(v15, v18, v19, v16 != 0, (uint64_t)v51);
      long long v72 = 0u;
      memset(v73, 0, 28);
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v67 = 0u;
      memset(buf, 0, sizeof(buf));
      v27 = [(CLClientAuthorizationCache *)self currentLocation];
      if (v27)
      {
        [(CLLocation *)v27 clientLocation];
      }
      else
      {
        long long v72 = 0u;
        memset(v73, 0, 28);
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v67 = 0u;
        memset(buf, 0, sizeof(buf));
      }
      v49[6] = v71;
      v49[7] = v72;
      v50[0] = v73[0];
      *(_OWORD *)((char *)v50 + 12) = *(_OWORD *)((char *)v73 + 12);
      v49[2] = v67;
      v49[3] = v68;
      v49[4] = v69;
      v49[5] = v70;
      v49[0] = *(_OWORD *)buf;
      v49[1] = *(_OWORD *)&buf[16];
      int v8 = sub_10010758C(v15, v18, v19, v16 != 0, (uint64_t)v49);
      if ([(CLClientManagerAuthorizationContext *)v26 isEqual:v8])
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10232B450);
        }
        uint64_t v28 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
        {
          id v29 = [a3 UTF8String];
          *(_DWORD *)v53 = 68289795;
          *(_DWORD *)&v53[4] = 0;
          __int16 v54 = 2082;
          v55 = "";
          __int16 v56 = 2082;
          id v57 = v29;
          __int16 v58 = 1040;
          int v59 = 156;
          __int16 v60 = 2097;
          v61 = buf;
          uint64_t v10 = "{\"msg%{public}.0s\":\"#clcac location not specified. NonZonal-AC is same as Zonal-AC at current-locatio"
                "n. Skip showing location-arrow\", \"Client\":%{public, location:escape_only}s, \"CLCAC-currentLocation\""
                ":%{private, location:CLClientLocation}.*P}";
          __int16 v11 = v53;
          long long v12 = v28;
          uint32_t v13 = 44;
          goto LABEL_6;
        }
      }
      else
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10232B450);
        }
        v30 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
        {
          id v31 = [a3 UTF8String];
          *(_DWORD *)v53 = 68290307;
          *(_DWORD *)&v53[4] = 0;
          __int16 v54 = 2082;
          v55 = "";
          __int16 v56 = 2082;
          id v57 = v31;
          __int16 v58 = 1040;
          int v59 = 156;
          __int16 v60 = 2097;
          v61 = buf;
          __int16 v62 = 2114;
          v63 = v26;
          __int16 v64 = 2114;
          v65 = v8;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#clcac location not specified. NonZonal-AC differs from Zonal-AC at current-location. Showing location-arrow\", \"Client\":%{public, location:escape_only}s, \"CLCAC-currentLocation\":%{private, location:CLClientLocation}.*P, \"NonZonalAC\":%{public, location:escape_only}@, \"ZonalAC\":%{public, location:escape_only}@}", v53, 0x40u);
        }
        id v32 = [[-[CLClientAuthorizationCache vendor](self, "vendor") proxyForService:@"CLClientManager" forClient:@"CLClientAuthorizationCache"];
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10232B450);
        }
        v33 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
        {
          id v34 = [a3 UTF8String];
          *(_DWORD *)v53 = 68289282;
          *(_DWORD *)&v53[4] = 0;
          __int16 v54 = 2082;
          v55 = "";
          __int16 v56 = 2082;
          id v57 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"markReceivingLocationInformation\", \"Client\":%{public, location:escape_only}s}", v53, 0x1Cu);
        }
        sub_100134750(v53, (char *)[a3 UTF8String]);
        sub_10000FF54((std::string *)v53, (uint64_t)v35);
        [v32 markReceivingLocationInformation:sub_1000376D4((long long *)v35)];
        if (v48 < 0) {
          operator delete(__p);
        }
        if (v46 < 0) {
          operator delete(v45);
        }
        if (v44 < 0) {
          operator delete(v43);
        }
        if (v42 < 0) {
          operator delete(v41);
        }
        if (v40 < 0) {
          operator delete(v39);
        }
        if (v38 < 0) {
          operator delete(v37);
        }
        if (v36 < 0) {
          operator delete(v35[0]);
        }
        if (SBYTE3(v57) < 0) {
          operator delete(*(void **)v53);
        }
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10232B450);
    }
    v22 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = [a3 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to find client in both non-zonal and zonal cache #clcac\", \"Client\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10232B450);
      }
    }
    v23 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      id v24 = [a3 UTF8String];
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = v24;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unable to find client in both non-zonal and zonal cache #clcac", "{\"msg%{public}.0s\":\"Unable to find client in both non-zonal and zonal cache #clcac\", \"Client\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    return 0;
  }
  return v8;
}

- (void)setPersistentStoreDictionary:(id)a3 forClient:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10232B450);
  }
  unsigned int v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 68289538;
    int v23 = 0;
    __int16 v24 = 2082;
    v25 = "";
    __int16 v26 = 2082;
    id v27 = [a4 UTF8String];
    __int16 v28 = 2114;
    id v29 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"setPersistentStoreDictionary\", \"Client\":%{public, location:escape_only}s, \"ClientDictionary\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  if ([(CLClientAuthorizationCache *)self clientKeyToAuthContextMap]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = [(CLClientAuthorizationCache *)self clientKeyToClientInfoMap] == 0;
  }
  [(CLClientAuthorizationCache *)self setIsInitialCache:v8];
  if ([(CLClientAuthorizationCache *)self clientKeyToClientInfoMap])
  {
    if (!a3) {
      goto LABEL_14;
    }
  }
  else
  {
    [(CLClientAuthorizationCache *)self setClientKeyToClientInfoMap:objc_alloc_init((Class)NSMutableDictionary)];
    if (!a3) {
      goto LABEL_14;
    }
  }
  if (a4)
  {
    [(NSMutableDictionary *)[(CLClientAuthorizationCache *)self clientKeyToClientInfoMap] setObject:a3 forKeyedSubscript:a4];
    goto LABEL_24;
  }
LABEL_14:
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    if (a3 || !a4)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10232B450);
      }
      uint64_t v9 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "synchronizing clientInfo to CLCAC with invalid combination of arguments", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10232B450);
        }
        __int16 v20 = 0;
        unint64_t v15 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLClientAuthorizationCache setPersistentStoreDictionary:forClient:]", "%s\n", v15);
        if (v15 != (char *)buf) {
          free(v15);
        }
      }
    }
    else
    {
      [(NSMutableDictionary *)[(CLClientAuthorizationCache *)self clientKeyToClientInfoMap] removeObjectForKey:a4];
    }
  }
  else
  {
    [(NSMutableDictionary *)[(CLClientAuthorizationCache *)self clientKeyToClientInfoMap] removeAllObjects];
  }
LABEL_24:
  if ([(CLClientAuthorizationCache *)self isInitialCache])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    cachePopulationReplyBlocks = self->_cachePopulationReplyBlocks;
    id v11 = [(NSMutableArray *)cachePopulationReplyBlocks countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(cachePopulationReplyBlocks);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * i) + 16))();
        }
        id v12 = [(NSMutableArray *)cachePopulationReplyBlocks countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v12);
    }

    self->_cachePopulationReplyBlocks = 0;
  }
}

- (void)setClientKeyToClientInfoMap:(id)a3
{
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (NSMutableArray)cachePopulationReplyBlocks
{
  return self->_cachePopulationReplyBlocks;
}

- (void)setCachePopulationReplyBlocks:(id)a3
{
}

@end