@interface CompanionDelegate
- (BOOL)hasMsgVersion;
- (BOOL)isConnected;
- (CLSilo)silo;
- (CompanionDelegate)initWithSilo:(id)a3 idsService:(id)a4;
- (IDSDevice)pairedDevice;
- (IDSService)idsService;
- (id)companionStatusHandler;
- (id)downgradeMsgToOlderType:(id)a3 type:(int *)a4;
- (id)messageHandler;
- (id)statusHandler;
- (id)testTriggerHandler;
- (void)dealloc;
- (void)receivedMessage:(int)a3 data:(id)a4 identifierString:(id)a5;
- (void)sendData:(id)a3 type:(int)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setCompanionStatusHandler:(id)a3;
- (void)setHasMsgVersion:(BOOL)a3;
- (void)setIdsService:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setMessageHandler:(id)a3;
- (void)setPairedDevice:(id)a3;
- (void)setSilo:(id)a3;
- (void)setStatusHandler:(id)a3;
- (void)setTestTriggerHandler:(id)a3;
- (void)updateIDSStatus;
@end

@implementation CompanionDelegate

- (CompanionDelegate)initWithSilo:(id)a3 idsService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_idsService, a4);
  idsService = self->_idsService;
  v9 = [v6 queue];
  [(IDSService *)idsService addDelegate:self queue:v9];

  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  v10 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "IDSService Delegate initialized %p", buf, 0xCu);
  }
  self->_hasMsgVersion = 0;
  self->_lastUpdateSpuTs = 0;
  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100315EDC;
  v12[3] = &unk_1003B20C8;
  objc_copyWeak(&v13, (id *)buf);
  [v6 async:v12];
  [(CompanionDelegate *)self setSilo:v6];
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

  return self;
}

- (void)dealloc
{
  id statusHandler = self->_statusHandler;
  self->_id statusHandler = 0;

  id testTriggerHandler = self->_testTriggerHandler;
  self->_id testTriggerHandler = 0;

  id messageHandler = self->_messageHandler;
  self->_id messageHandler = 0;

  id companionStatusHandler = self->_companionStatusHandler;
  self->_id companionStatusHandler = 0;

  self->_lastUpdateSpuTs = 0;
  v7.receiver = self;
  v7.super_class = (Class)CompanionDelegate;
  [(CompanionDelegate *)&v7 dealloc];
}

- (void)updateIDSStatus
{
  unint64_t v55 = +[CSTimeManager SPU_estimate_current_timestamp];
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL isConnected = self->_isConnected;
  self->_BOOL isConnected = 0;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v57 = self;
  id obj = [(IDSService *)self->_idsService devices];
  id v4 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (!v4) {
    goto LABEL_50;
  }
  uint64_t v5 = *(void *)v61;
  p_pairedDevice = &self->_pairedDevice;
  while (2)
  {
    id v6 = 0;
    do
    {
      if (*(void *)v61 != v5) {
        objc_enumerationMutation(obj);
      }
      objc_super v7 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v6);
      if (qword_1003DB710 != -1) {
        dispatch_once(&qword_1003DB710, &stru_1003BAF80);
      }
      v8 = (id)qword_1003DB718;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = [v7 modelIdentifier];
        v10 = [v7 productBuildVersion];
        unsigned int v11 = [v7 isNearby];
        unsigned int v12 = [v7 isConnected];
        unsigned int v13 = [v7 isLocallyPaired];
        *(_DWORD *)buf = 68290307;
        *(_DWORD *)v65 = 0;
        *(_WORD *)&v65[4] = 2082;
        *(void *)&v65[6] = "";
        *(_WORD *)&v65[14] = 2113;
        *(void *)&v65[16] = v9;
        *(_WORD *)&v65[24] = 2113;
        *(void *)&v65[26] = v10;
        *(_WORD *)&v65[34] = 1026;
        *(_DWORD *)&v65[36] = v11;
        __int16 v66 = 1026;
        unsigned int v67 = v12;
        __int16 v68 = 1026;
        unsigned int v69 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"updateIDSStatus:\", \"model\":%{private, location:escape_only}@, \"build\":%{private, location:escape_only}@, \"isNearby\":%{public}hhd, \"isConnected\":%{public}hhd, \"isLocallyPaired\":%{public}hhd}", buf, 0x38u);
      }
      if ([v7 isDefaultPairedDevice] && objc_msgSend(v7, "isNearby"))
      {
        v57->_BOOL isConnected = 1;
        objc_storeStrong((id *)p_pairedDevice, v7);
        if (qword_1003DB710 != -1) {
          dispatch_once(&qword_1003DB710, &stru_1003BAF80);
        }
        v14 = (id)qword_1003DB718;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          id v15 = [(IDSDevice *)*p_pairedDevice modelIdentifier];
          id v16 = [v15 UTF8String];
          *(_DWORD *)buf = 136315138;
          *(void *)v65 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Companion model is %s", buf, 0xCu);
        }
        if (!_companionCompatibility)
        {
          if (v57->_hasMsgVersion)
          {
            _companionCompatibility = 1;
            goto LABEL_50;
          }
          v17 = [(IDSDevice *)*p_pairedDevice productBuildVersion];
          v18 = +[NSCharacterSet uppercaseLetterCharacterSet];
          v19 = [v17 componentsSeparatedByCharactersInSet:v18];

          v20 = [v19 objectAtIndexedSubscript:0];
          v21 = [NSString stringWithFormat:@"%c", [v17 characterAtIndex:[v20 length]]];

          if (qword_1003DB710 != -1) {
            dispatch_once(&qword_1003DB710, &stru_1003BAF80);
          }
          v22 = (id)qword_1003DB718;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            id v23 = [(IDSDevice *)*p_pairedDevice modelIdentifier];
            id v24 = [v23 UTF8String];
            v25 = [v19 objectAtIndexedSubscript:0];
            v26 = [v19 objectAtIndexedSubscript:1];
            *(_DWORD *)buf = 136315906;
            *(void *)v65 = v24;
            *(_WORD *)&v65[8] = 2112;
            *(void *)&v65[10] = v25;
            *(_WORD *)&v65[18] = 2112;
            *(void *)&v65[20] = v26;
            *(_WORD *)&v65[28] = 2112;
            *(void *)&v65[30] = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "build %s, number %@ %@, letter %@", buf, 0x2Au);
          }
          if ([(IDSDevice *)*p_pairedDevice deviceType] == (id)2)
          {
            v27 = [v19 objectAtIndexedSubscript:0];
            BOOL v28 = (int)[v27 intValue] > 20;

            if (!v28)
            {
              v29 = [v19 objectAtIndexedSubscript:0];
              BOOL v30 = (int)[v29 intValue] < 20;

              if (v30) {
                goto LABEL_43;
              }
              if ([@"D" compare:v21] == (id)1)
              {
                id v31 = [@"C" compare:v21];
                if (v31 != (id)1)
                {
                  if (!v31)
                  {
                    int v32 = 3;
LABEL_44:
                    _companionCompatibility = v32;
                  }
LABEL_45:
                  if (qword_1003DB710 != -1) {
                    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
                  }
                  v42 = qword_1003DB718;
                  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
                  {
                    BOOL hasMsgVersion = v57->_hasMsgVersion;
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v65 = hasMsgVersion;
                    *(_WORD *)&v65[4] = 1024;
                    *(_DWORD *)&v65[6] = _companionCompatibility;
                    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Companion hasMsgVersion:%d, companionCompatibility:%d", buf, 0xEu);
                  }

                  goto LABEL_50;
                }
LABEL_43:
                int v32 = 2;
                goto LABEL_44;
              }
            }
          }
          else
          {
            if ([(IDSDevice *)*p_pairedDevice deviceType] != (id)6) {
              goto LABEL_45;
            }
            v33 = [v19 objectAtIndexedSubscript:0];
            BOOL v34 = (int)[v33 intValue] > 20;

            if (!v34)
            {
              v35 = [v19 objectAtIndexedSubscript:0];
              BOOL v36 = (int)[v35 intValue] < 20;

              if (v36) {
                goto LABEL_43;
              }
              id v37 = [@"S" compare:v21];
              if (v37 == (id)1) {
                goto LABEL_43;
              }
              if (v37 != (id)-1)
              {
                v38 = [v19 objectAtIndexedSubscript:1];
                BOOL v39 = (int)[v38 intValue] < 601;

                if (v39)
                {
                  v40 = [v19 objectAtIndexedSubscript:1];
                  BOOL v41 = (int)[v40 intValue] < 301;

                  if (v41) {
                    int v32 = 2;
                  }
                  else {
                    int v32 = 3;
                  }
                  goto LABEL_44;
                }
              }
            }
          }
          int v32 = 1;
          v57->_BOOL hasMsgVersion = 1;
          goto LABEL_44;
        }
      }
      id v6 = (char *)v6 + 1;
    }
    while (v4 != v6);
    id v4 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v4) {
      continue;
    }
    break;
  }
LABEL_50:

  v44 = v57;
  if (isConnected != v57->_isConnected)
  {
    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003BAF80);
    }
    v45 = qword_1003DB718;
    if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v46 = v57->_isConnected;
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)v65 = isConnected;
      *(_WORD *)&v65[4] = 1026;
      *(_DWORD *)&v65[6] = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Paired device connection changed: before: %{public}d, after: %{public}d", buf, 0xEu);
    }
    id statusHandler = (void (**)(id, BOOL, IDSDevice *, CFAbsoluteTime))v57->_statusHandler;
    if (statusHandler)
    {
      BOOL v48 = v57->_isConnected;
      pairedDevice = v57->_pairedDevice;
      CFAbsoluteTime v50 = CFAbsoluteTimeGetCurrent();
      statusHandler[2](statusHandler, v48, pairedDevice, v50);
      v44 = v57;
    }
    else
    {
      if (qword_1003DB710 != -1) {
        dispatch_once(&qword_1003DB710, &stru_1003BAF80);
      }
      v51 = qword_1003DB718;
      if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "Status handler is nil", buf, 2u);
      }
    }
  }
  id companionStatusHandler = (void (**)(double))v44->_companionStatusHandler;
  if (companionStatusHandler)
  {
    if (v44->_isConnected) {
      uint64_t v53 = 1;
    }
    else {
      uint64_t v53 = 0xFFFFFFFFLL;
    }
    if (isConnected == v44->_isConnected)
    {
      if (v55 - v44->_lastUpdateSpuTs >= 0xF4241)
      {
        companionStatusHandler[2](Current);
        goto LABEL_73;
      }
    }
    else
    {
      ((void (*)(void (**)(double), unint64_t, uint64_t, double))companionStatusHandler[2])(companionStatusHandler, v55, v53, Current);
LABEL_73:
      v57->_lastUpdateSpuTs = v55;
    }
  }
  else
  {
    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003BAF80);
    }
    v54 = qword_1003DB718;
    if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "companionStatusHandler is nil", buf, 2u);
    }
  }
}

- (id)downgradeMsgToOlderType:(id)a3 type:(int *)a4
{
  id v5 = a3;
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  id v6 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    int v7 = *a4;
    *(_DWORD *)buf = 67109120;
    int v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "downgradeMsgToOlderType - msg type to downgrade: %d", buf, 8u);
  }
  if ((*a4 - 101) > 1)
  {
    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003BAF80);
    }
    uint64_t v10 = qword_1003DB718;
    if (!os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
    int v11 = *a4;
    *(_DWORD *)buf = 67109120;
    int v26 = v11;
    unsigned int v12 = "No downgrade needed for this message type: %d";
    unsigned int v13 = buf;
    v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    uint32_t v16 = 8;
    goto LABEL_21;
  }
  if (*a4 == 101) {
    int v8 = 4;
  }
  else {
    int v8 = 5;
  }
  *a4 = v8;
  *(_DWORD *)buf = 1;
  [v5 getBytes:buf length:40];
  if (_companionCompatibility == 3)
  {
    int v20 = v26;
    long long v21 = v27;
    int v22 = v28;
    uint64_t v23 = v29;
    int v24 = v30;
    id v9 = +[NSData dataWithBytes:&v20 length:36];
    goto LABEL_23;
  }
  if (_companionCompatibility == 2)
  {
    int v20 = v26;
    long long v21 = v27;
    int v22 = v28;
    LODWORD(v23) = v29;
    id v9 = +[NSData dataWithBytes:&v20 length:28];
    goto LABEL_23;
  }
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  uint64_t v17 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v20) = 0;
    unsigned int v12 = "Unknown companion compatibility";
    unsigned int v13 = (uint8_t *)&v20;
    v14 = v17;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 2;
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v12, v13, v16);
  }
LABEL_22:
  id v9 = v5;
LABEL_23:
  v18 = v9;

  return v18;
}

- (void)sendData:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(CompanionDelegate *)self updateIDSStatus];
  if (self->_isConnected)
  {
    unsigned int v22 = v4;
    if ((int)v4 < 101 || self->_hasMsgVersion)
    {
      id v7 = v6;
    }
    else
    {
      id v7 = [(CompanionDelegate *)self downgradeMsgToOlderType:v6 type:&v22];
      uint64_t v4 = v22;
    }
    v33[0] = @"type";
    int v8 = +[NSNumber numberWithInt:v4];
    v33[1] = @"payload";
    v34[0] = v8;
    v34[1] = v7;
    id v9 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

    v31[0] = IDSSendMessageOptionTimeoutKey;
    uint64_t v10 = +[NSNumber numberWithDouble:2.0];
    v32[0] = v10;
    v32[1] = &__kCFBooleanTrue;
    v31[1] = IDSSendMessageOptionLocalDeliveryKey;
    v31[2] = IDSSendMessageOptionEncryptPayloadKey;
    v32[2] = &__kCFBooleanTrue;
    int v11 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

    idsService = self->_idsService;
    unsigned int v13 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v20 = 0;
    id v21 = 0;
    unsigned int v14 = [(IDSService *)idsService sendMessage:v9 toDestinations:v13 priority:300 options:v11 identifier:&v21 error:&v20];
    id v15 = v21;
    id v16 = v20;

    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003BAF80);
    }
    uint64_t v17 = (id)qword_1003DB718;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = [v15 UTF8String];
      id v19 = [v7 length];
      *(_DWORD *)buf = 136315906;
      id v24 = v18;
      __int16 v25 = 2048;
      id v26 = v19;
      __int16 v27 = 1024;
      unsigned int v28 = v22;
      __int16 v29 = 1024;
      unsigned int v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Sending message: ID:%s size: %lu type: %d over IDSService - Status %d", buf, 0x22u);
    }
  }
}

- (void)receivedMessage:(int)a3 data:(id)a4 identifierString:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  uint64_t v10 = (id)qword_1003DB718;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 136315650;
    id v21 = [v9 UTF8String];
    __int16 v22 = 1024;
    int v23 = v6;
    __int16 v24 = 2048;
    id v25 = [v8 length];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Received message: ID:%s, type:%d, size %lu", (uint8_t *)&v20, 0x1Cu);
  }

  if (v6)
  {
    id messageHandler = (void (**)(id, void, id, double))self->_messageHandler;
    if (messageHandler)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      messageHandler[2](messageHandler, v6, v8, Current);
      if (v6 == 11 && !self->_hasMsgVersion) {
        self->_BOOL hasMsgVersion = 1;
      }
      goto LABEL_21;
    }
    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003BAF80);
    }
    uint64_t v15 = qword_1003DB718;
    if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      id v16 = "Message handler is nil";
      uint64_t v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v20, 2u);
    }
  }
  else
  {
    id testTriggerHandler = (void (**)(id, double))self->_testTriggerHandler;
    if (testTriggerHandler)
    {
      CFAbsoluteTime v14 = CFAbsoluteTimeGetCurrent();
      testTriggerHandler[2](testTriggerHandler, v14);
      goto LABEL_21;
    }
    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003BAF80);
    }
    uint64_t v19 = qword_1003DB718;
    if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      id v16 = "Test trigger handler is nil";
      uint64_t v17 = v19;
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  unsigned int v13 = [v10 valueForKey:@"type"];
  id v14 = [v13 intValue];

  uint64_t v15 = [v10 valueForKey:@"payload"];
  id v16 = [objc_alloc((Class)NSString) initWithData:v15 encoding:4];
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  uint64_t v17 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138413314;
    id v20 = v16;
    __int16 v21 = 2112;
    __int16 v22 = v15;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 1024;
    int v28 = (int)v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Received string: %@ data: %@ from: %@ context: %@ type: %d", (uint8_t *)&v19, 0x30u);
  }
  os_log_type_t v18 = [v12 outgoingResponseIdentifier];
  [(CompanionDelegate *)self receivedMessage:v14 data:v15 identifierString:v18];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  id v12 = a5;
  id v13 = a7;
  id v14 = a8;
  unint64_t v15 = +[CSTimeManager SPU_estimate_current_timestamp];
  double Current = CFAbsoluteTimeGetCurrent();
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  uint64_t v17 = (id)qword_1003DB718;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    os_log_type_t v18 = +[NSNumber numberWithBool:v10];
    int v21 = 138413058;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v18;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Did send message %@ success %@ error %@ context %@", (uint8_t *)&v21, 0x2Au);
  }
  id companionStatusHandler = (void (**)(id, unint64_t, uint64_t, double))self->_companionStatusHandler;
  if (companionStatusHandler)
  {
    if (v10) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = 4294967294;
    }
    companionStatusHandler[2](companionStatusHandler, v15, v20, Current);
  }
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_BOOL isConnected = a3;
}

- (BOOL)hasMsgVersion
{
  return self->_hasMsgVersion;
}

- (void)setHasMsgVersion:(BOOL)a3
{
  self->_BOOL hasMsgVersion = a3;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (IDSDevice)pairedDevice
{
  return self->_pairedDevice;
}

- (void)setPairedDevice:(id)a3
{
}

- (CLSilo)silo
{
  return self->_silo;
}

- (void)setSilo:(id)a3
{
}

- (id)statusHandler
{
  return self->_statusHandler;
}

- (void)setStatusHandler:(id)a3
{
}

- (id)testTriggerHandler
{
  return self->_testTriggerHandler;
}

- (void)setTestTriggerHandler:(id)a3
{
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
}

- (id)companionStatusHandler
{
  return self->_companionStatusHandler;
}

- (void)setCompanionStatusHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_companionStatusHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_testTriggerHandler, 0);
  objc_storeStrong(&self->_statusHandler, 0);
  objc_storeStrong((id *)&self->_silo, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end