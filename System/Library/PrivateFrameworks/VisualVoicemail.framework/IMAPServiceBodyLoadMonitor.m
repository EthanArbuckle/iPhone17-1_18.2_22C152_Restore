@interface IMAPServiceBodyLoadMonitor
+ (id)_headersToPreserve;
- (BOOL)progressiveBodyLoadHasStartedForRecord:(void *)a3;
- (NSMutableData)headerData;
- (id)_createHeaderDictionaryForData:(id)a3;
- (id)contextForLibraryId:(int)a3 create:(BOOL)a4;
- (id)initForService:(id)a3;
- (int)_libraryIdForRemoteUid:(unsigned int)a3 inStore:(id)a4;
- (void)_activityCompleted:(id)a3;
- (void)_postDataAvailableWithUserInfo:(id)a3;
- (void)bodyLoadContinuedForRemoteUid:(unsigned int)a3 inStore:(id)a4 data:(id)a5 section:(id)a6;
- (void)bodyLoadEndedForRemoteUid:(unsigned int)a3 inStore:(id)a4 data:(id)a5 section:(id)a6;
- (void)bodyLoadStartedForRemoteUid:(unsigned int)a3 inStore:(id)a4 data:(id)a5 section:(id)a6;
- (void)dealloc;
- (void)lengthsOfBodyLoadForRecord:(void *)a3 expected:(unsigned int *)a4 current:(unsigned int *)a5;
- (void)progressiveMimeParser:(id)a3 beganDataForMimePart:(id)a4;
- (void)progressiveMimeParser:(id)a3 failedWithError:(id)a4;
- (void)progressiveMimeParser:(id)a3 finishedMimePart:(id)a4;
- (void)setHeaderData:(id)a3;
@end

@implementation IMAPServiceBodyLoadMonitor

+ (id)_headersToPreserve
{
  objc_msgSend(a1, "mf_lock");
  if (!qword_1000E0810)
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"x-applevm-duration", 0);
    v4 = (void *)qword_1000E0810;
    qword_1000E0810 = (uint64_t)v3;
  }
  objc_msgSend(a1, "mf_unlock");
  v5 = (void *)qword_1000E0810;
  return v5;
}

- (id)initForService:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMAPServiceBodyLoadMonitor;
  v5 = [(IMAPServiceBodyLoadMonitor *)&v12 init];
  if (v5)
  {
    v6 = sub_100011098();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      mambaID = v5->mambaID;
      *(_DWORD *)buf = 136315650;
      v14 = mambaID;
      __int16 v15 = 2080;
      v16 = " ";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sIMAPServiceBodyLoadMonitor::initForService: %@", buf, 0x20u);
    }

    objc_storeWeak((id *)&v5->_service, v4);
    v5->mambaID = (const char *)[v4 getServiceObjLogPrefix];
    v8 = +[NSNotificationCenter defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)&v5->_service);
    [v8 addObserver:v5 selector:"_activityCompleted:" name:@"VVServiceTaskEndedNotification" object:WeakRetained];

    id v10 = objc_loadWeakRetained((id *)&v5->_service);
    [v8 addObserver:v5 selector:"_activityCompleted:" name:@"VVServiceTaskCancelledNotification" object:v10];
  }
  return v5;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  loadContextsByLibraryId = self->_loadContextsByLibraryId;
  if (loadContextsByLibraryId) {
    CFRelease(loadContextsByLibraryId);
  }
  v5.receiver = self;
  v5.super_class = (Class)IMAPServiceBodyLoadMonitor;
  [(IMAPServiceBodyLoadMonitor *)&v5 dealloc];
}

- (int)_libraryIdForRemoteUid:(unsigned int)a3 inStore:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = [v6 mailboxUid];
  v8 = [v7 name];
  unsigned __int8 v9 = [v8 isEqualToString:@"Greetings"];

  if (v9)
  {
    int v10 = 0x7FFFFFFF;
  }
  else
  {
    unsigned int v11 = [v7 type];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    v13 = [WeakRetained getAccountStore];
    v14 = v13;
    if (v11 == 7) {
      uint64_t v15 = 24;
    }
    else {
      uint64_t v15 = 16;
    }
    v16 = (const char *)sub_100079A74(v13, v4, 8 * (v11 != 7), v15);

    if (v16)
    {
      CFStringRef v17 = VMStoreRecordCopyDescription((uint64_t)v16);
      id v18 = sub_100011098();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        mambaID = self->mambaID;
        int v27 = 136315906;
        v28 = mambaID;
        __int16 v29 = 2080;
        v30 = " ";
        __int16 v31 = 2112;
        v32 = v7;
        __int16 v33 = 2112;
        CFStringRef v34 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%slibraryIdForRemoteUid for mailbox %@ record is %@", (uint8_t *)&v27, 0x2Au);
      }

      if (v17) {
        CFRelease(v17);
      }
      id v20 = objc_loadWeakRetained((id *)&self->_service);
      v21 = [v20 getAccountStore];
      int v10 = sub_100079014(v21, v16);

      CFRelease(v16);
    }
    else
    {
      v22 = sub_100011098();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->mambaID;
        int v27 = 136315906;
        v28 = v23;
        __int16 v29 = 2080;
        v30 = " ";
        __int16 v31 = 2112;
        v32 = v7;
        __int16 v33 = 2048;
        CFStringRef v34 = (CFStringRef)v4;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I %s%slibraryIdForRemoteUid for mailbox %@ record with UID %lu not found", (uint8_t *)&v27, 0x2Au);
      }

      int v10 = -1;
    }
  }
  v24 = sub_100011098();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = self->mambaID;
    int v27 = 136315906;
    v28 = v25;
    __int16 v29 = 2080;
    v30 = " ";
    __int16 v31 = 2112;
    v32 = v7;
    __int16 v33 = 1024;
    LODWORD(v34) = v10;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#I %s%slibraryIdForRemoteUid for mailbox %@ result is %d", (uint8_t *)&v27, 0x26u);
  }

  return v10;
}

- (id)_createHeaderDictionaryForData:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)MFMessageHeaders) initWithHeaderData:v3 encoding:0xFFFFFFFFLL];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v6 = H_CONTENT_TYPE;
  v7 = [v4 firstHeaderForKey:H_CONTENT_TYPE];
  if (v7) {
    [v5 setObject:v7 forKey:v6];
  }
  uint64_t v8 = H_CONTENT_TRANSFER_ENCODING;
  unsigned __int8 v9 = [v4 firstHeaderForKey:H_CONTENT_TRANSFER_ENCODING];

  if (v9) {
    [v5 setObject:v9 forKey:v8];
  }
  int v10 = [(id)objc_opt_class() _headersToPreserve];
  unsigned int v11 = (char *)[v10 count];
  if (v11)
  {
    for (i = 0; i != v11; ++i)
    {
      v13 = [v10 objectAtIndex:i];
      v14 = [v4 firstHeaderForKey:v13];

      if (v14) {
        [v5 setObject:v14 forKey:v13];
      }

      unsigned __int8 v9 = v14;
    }
  }
  else
  {
    v14 = v9;
  }

  return v5;
}

- (void)_activityCompleted:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKey:@"VVTaskType"];
    unsigned int v7 = [v6 intValue];

    uint64_t v8 = (const char *)[v5 objectForKey:@"VVRecord"];
    if (v8 && v7 == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
      unsigned int v11 = [WeakRetained getAccountStore];
      id v12 = sub_100079014(v11, v8);

      [(IMAPServiceBodyLoadMonitor *)self mf_lock];
      if ((int)v12 >= 1)
      {
        v13 = [(IMAPServiceBodyLoadMonitor *)self contextForLibraryId:v12 create:0];
        if (v13)
        {
          v14 = sub_100011098();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            mambaID = self->mambaID;
            int v16 = 136315394;
            CFStringRef v17 = mambaID;
            __int16 v18 = 2080;
            v19 = " ";
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sContext left hanging around after activity completion - time to clean it up.", (uint8_t *)&v16, 0x16u);
          }

          [v13 cleanUpErroredFile];
          CFDictionaryRemoveValue(self->_loadContextsByLibraryId, +[NSNumber numberWithInt:v12]);
        }
      }
      [(IMAPServiceBodyLoadMonitor *)self mf_unlock];
    }
  }
}

- (id)contextForLibraryId:(int)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  loadContextsByLibraryId = self->_loadContextsByLibraryId;
  if (loadContextsByLibraryId) {
    Value = (void *)CFDictionaryGetValue(loadContextsByLibraryId, +[NSNumber numberWithInt:*(void *)&a3]);
  }
  else {
    Value = 0;
  }
  unsigned __int8 v9 = Value;
  if (!v9 && v4)
  {
    int v10 = objc_alloc_init(IMAPServiceBodyLoadContext);
    unsigned __int8 v9 = v10;
    if (!self->_loadContextsByLibraryId) {
      self->_loadContextsByLibraryId = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    v10->_recordLibraryId = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    objc_storeWeak((id *)&v10->_service, WeakRetained);

    v10->_fd = -1;
    CFDictionarySetValue(self->_loadContextsByLibraryId, +[NSNumber numberWithInt:v5], v10);
  }
  return v9;
}

- (void)bodyLoadStartedForRemoteUid:(unsigned int)a3 inStore:(id)a4 data:(id)a5 section:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(IMAPServiceBodyLoadMonitor *)self _libraryIdForRemoteUid:v8 inStore:v10];
  v14 = sub_100011098();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    int v41 = 136316674;
    v42 = mambaID;
    __int16 v43 = 2080;
    v44 = " ";
    __int16 v45 = 1024;
    *(_DWORD *)v46 = v13;
    *(_WORD *)&v46[4] = 2048;
    *(void *)&v46[6] = v8;
    *(_WORD *)&v46[14] = 2048;
    *(void *)&v46[16] = [v11 length];
    __int16 v47 = 2112;
    id v48 = v12;
    __int16 v49 = 2112;
    id v50 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sBODY LOAD STARTED FOR libraryId %d UID %lu WITH DATA OF LENGTH %lu SECTION %@, STORE:%@", (uint8_t *)&v41, 0x44u);
  }

  if ((int)v13 >= 1)
  {
    [(IMAPServiceBodyLoadMonitor *)self mf_lock];
    id v16 = [@"TEXT" isEqualToString:v12];
    unsigned int v17 = [@"HEADER" isEqualToString:v12];
    uint64_t v18 = [(IMAPServiceBodyLoadMonitor *)self contextForLibraryId:v13 create:v16];
    v19 = (void *)v18;
    if (v16)
    {
      id v20 = sub_100011098();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->mambaID;
        int v41 = 136315650;
        v42 = v21;
        __int16 v43 = 2080;
        v44 = " ";
        __int16 v45 = 1024;
        *(_DWORD *)v46 = v8;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I %s%sUID(%d) Started receiving body", (uint8_t *)&v41, 0x1Cu);
      }

      v22 = sub_100011098();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->mambaID;
        id v24 = [v11 length];
        int v41 = 136315906;
        v42 = v23;
        __int16 v43 = 2080;
        v44 = " ";
        __int16 v45 = 1024;
        *(_DWORD *)v46 = v8;
        *(_WORD *)&v46[4] = 2048;
        *(void *)&v46[6] = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I %s%sUID(%d) Appending body data of length %llu", (uint8_t *)&v41, 0x26u);
      }

      v25 = +[NSMutableData dataWithData:v11];
      [v19 setBodyData:v25];

      v26 = [v19 parseWithDelegate:self];
      int v27 = sub_100011098();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v28)
        {
          __int16 v29 = self->mambaID;
          int v41 = 136315906;
          v42 = v29;
          __int16 v43 = 2080;
          v44 = " ";
          __int16 v45 = 2112;
          *(void *)v46 = v19;
          *(_WORD *)&v46[8] = 2112;
          *(void *)&v46[10] = v26;
          v30 = "#I %s%sbodyLoadStartedForRemoteUid, context:%@, parser:%@";
          __int16 v31 = v27;
          uint32_t v32 = 42;
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v41, v32);
        }
      }
      else if (v28)
      {
        v38 = self->mambaID;
        int v41 = 136315650;
        v42 = v38;
        __int16 v43 = 2080;
        v44 = " ";
        __int16 v45 = 2112;
        *(void *)v46 = v19;
        v30 = "#I %s%sbodyLoadStartedForRemoteUid, context:%@, *** NO PARSER";
        __int16 v31 = v27;
        uint32_t v32 = 32;
        goto LABEL_22;
      }

      goto LABEL_27;
    }
    if (v17)
    {
      if (!v18 || !*(void *)(v18 + 16))
      {
        v39 = sub_100011098();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = self->mambaID;
          int v41 = 136315650;
          v42 = v40;
          __int16 v43 = 2080;
          v44 = " ";
          __int16 v45 = 1024;
          *(_DWORD *)v46 = v8;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#I %s%sUID(%d) Started parsing header", (uint8_t *)&v41, 0x1Cu);
        }

        v26 = +[NSMutableData dataWithData:v11];
        [(IMAPServiceBodyLoadMonitor *)self setHeaderData:v26];
        goto LABEL_27;
      }
      v26 = sub_100011098();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v33 = self->mambaID;
        int v41 = 136315650;
        v42 = v33;
        __int16 v43 = 2080;
        v44 = " ";
        __int16 v45 = 1024;
        *(_DWORD *)v46 = v8;
        CFStringRef v34 = "#I %s%sUID(%d) Received headers multiple times, skipping";
        v35 = v26;
        uint32_t v36 = 28;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, (uint8_t *)&v41, v36);
      }
    }
    else
    {
      v26 = sub_100011098();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v37 = self->mambaID;
        int v41 = 136315906;
        v42 = v37;
        __int16 v43 = 2080;
        v44 = " ";
        __int16 v45 = 1024;
        *(_DWORD *)v46 = v8;
        *(_WORD *)&v46[4] = 2112;
        *(void *)&v46[6] = v12;
        CFStringRef v34 = "#I %s%sUID(%d, %@) Received data for an unexpected section";
        v35 = v26;
        uint32_t v36 = 38;
        goto LABEL_19;
      }
    }
LABEL_27:

    [(IMAPServiceBodyLoadMonitor *)self mf_unlock];
  }
}

- (void)bodyLoadContinuedForRemoteUid:(unsigned int)a3 inStore:(id)a4 data:(id)a5 section:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = +[MFActivityMonitor currentTracebleMonitor];
  v14 = [v13 error];

  if (!v14)
  {
    uint64_t v15 = [(IMAPServiceBodyLoadMonitor *)self _libraryIdForRemoteUid:v8 inStore:v10];
    id v16 = sub_100011098();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      mambaID = self->mambaID;
      *(_DWORD *)buf = 136316674;
      v56 = mambaID;
      __int16 v57 = 2080;
      v58 = " ";
      __int16 v59 = 1024;
      *(_DWORD *)v60 = v15;
      *(_WORD *)&v60[4] = 2048;
      *(void *)&v60[6] = v8;
      *(_WORD *)&v60[14] = 2048;
      *(void *)&v60[16] = [v11 length];
      *(_WORD *)&v60[24] = 2112;
      *(void *)&v60[26] = v12;
      *(_WORD *)&v60[34] = 2112;
      *(void *)&v60[36] = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s%sBODY LOAD CONTINUED FOR libraryId %d UID %lu WITH DATA OF LENGTH %lu SECTION %@, STORE:%@", buf, 0x44u);
    }

    if ((int)v15 >= 1)
    {
      [(IMAPServiceBodyLoadMonitor *)self mf_lock];
      id v18 = [@"TEXT" isEqualToString:v12];
      unsigned int v19 = [@"HEADER" isEqualToString:v12];
      uint64_t v54 = [(IMAPServiceBodyLoadMonitor *)self contextForLibraryId:v15 create:v18];
      if (v18)
      {
        id v20 = sub_100011098();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = self->mambaID;
          id v22 = [v11 length];
          v23 = [(id)v54 bodyData];
          id v24 = [v23 length];
          *(_DWORD *)buf = 136316162;
          v56 = v21;
          __int16 v57 = 2080;
          v58 = " ";
          __int16 v59 = 1024;
          *(_DWORD *)v60 = v8;
          *(_WORD *)&v60[4] = 2048;
          *(void *)&v60[6] = v22;
          *(_WORD *)&v60[14] = 2048;
          *(void *)&v60[16] = v24;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I %s%sUID(%d) Appending body data of length %llu to previous length %llu", buf, 0x30u);
        }
        v25 = [(id)v54 bodyData];
        [v25 appendData:v11];

        v26 = [(id)v54 parseWithDelegate:self];
        int v27 = sub_100011098();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        if (v26)
        {
          if (v28)
          {
            __int16 v29 = self->mambaID;
            *(_DWORD *)buf = 136315906;
            v56 = v29;
            __int16 v57 = 2080;
            v58 = " ";
            __int16 v59 = 2112;
            *(void *)v60 = v54;
            *(_WORD *)&v60[8] = 2112;
            *(void *)&v60[10] = v26;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I %s%sbodyLoadContinuedForRemoteUid, context:%@, parser:%@", buf, 0x2Au);
          }

          v30 = [(id)v54 bodyData];
          -[NSObject noteDataLengthChanged:](v26, "noteDataLengthChanged:", sub_100019990((unint64_t)[v30 length]));

          __int16 v31 = [(id)v54 bodyData];
          id v32 = [v31 length];
          __int16 v33 = [v26 data];
          BOOL v34 = v32 == [v33 length];

          if (!v34)
          {
            v35 = sub_100011098();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v53 = self->mambaID;
              uint32_t v36 = [(id)v54 bodyData];
              id v52 = [v36 length];
              v51 = [v26 data];
              id v50 = [v51 length];
              v37 = [(id)v54 bodyData];
              v38 = [v26 data];
              *(_DWORD *)buf = 136316418;
              v56 = v53;
              __int16 v57 = 2080;
              v58 = " ";
              __int16 v59 = 2048;
              *(void *)v60 = v52;
              *(_WORD *)&v60[8] = 2048;
              *(void *)&v60[10] = v50;
              *(_WORD *)&v60[18] = 2112;
              *(void *)&v60[20] = v37;
              *(_WORD *)&v60[28] = 2112;
              *(void *)&v60[30] = v38;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#I %s%sAppend: Context body data length %lu does not match parser length %lu. %@ vs %@", buf, 0x3Eu);
            }
            v39 = +[VMABCReporter sharedInstance];
            [v39 reportIssueType:@"Incorrect body data size" description:@"Incorrect body data size on Continue"];
          }
          if ((*(_DWORD *)(v54 + 28) & 0x80000000) == 0)
          {
            v40 = [v13 error];
            BOOL v41 = v40 == 0;

            if (v41) {
              [(id)v54 writeDataIfNeeded];
            }
          }
        }
        else
        {
          if (v28)
          {
            __int16 v47 = self->mambaID;
            *(_DWORD *)buf = 136315650;
            v56 = v47;
            __int16 v57 = 2080;
            v58 = " ";
            __int16 v59 = 2112;
            *(void *)v60 = v54;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I %s%sbodyLoadContinuedForRemoteUid, context:%@, *** NO PARSER", buf, 0x20u);
          }
        }
        goto LABEL_32;
      }
      if (v19)
      {
        if (!v54 || !*(void *)(v54 + 16))
        {
          id v48 = sub_100011098();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v49 = self->mambaID;
            *(_DWORD *)buf = 136315650;
            v56 = v49;
            __int16 v57 = 2080;
            v58 = " ";
            __int16 v59 = 1024;
            *(_DWORD *)v60 = v8;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "#I %s%sUID(%d) Header load continued", buf, 0x1Cu);
          }

          v26 = [(IMAPServiceBodyLoadMonitor *)self headerData];
          [v26 appendData:v11];
          goto LABEL_32;
        }
        v26 = sub_100011098();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v42 = self->mambaID;
          *(_DWORD *)buf = 136315650;
          v56 = v42;
          __int16 v57 = 2080;
          v58 = " ";
          __int16 v59 = 1024;
          *(_DWORD *)v60 = v8;
          __int16 v43 = "#I %s%sUID(%d) Continued receiving skipped additional headers";
          v44 = v26;
          uint32_t v45 = 28;
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
        }
      }
      else
      {
        v26 = sub_100011098();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v46 = self->mambaID;
          *(_DWORD *)buf = 136315906;
          v56 = v46;
          __int16 v57 = 2080;
          v58 = " ";
          __int16 v59 = 1024;
          *(_DWORD *)v60 = v8;
          *(_WORD *)&v60[4] = 2112;
          *(void *)&v60[6] = v12;
          __int16 v43 = "#I %s%sUID(%d, %@) Received data for an unexpected section";
          v44 = v26;
          uint32_t v45 = 38;
          goto LABEL_25;
        }
      }
LABEL_32:

      [(IMAPServiceBodyLoadMonitor *)self mf_unlock];
    }
  }
}

- (void)bodyLoadEndedForRemoteUid:(unsigned int)a3 inStore:(id)a4 data:(id)a5 section:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(IMAPServiceBodyLoadMonitor *)self _libraryIdForRemoteUid:v8 inStore:v10];
  v14 = sub_100011098();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    *(_DWORD *)buf = 136316674;
    v71 = mambaID;
    __int16 v72 = 2080;
    v73 = " ";
    __int16 v74 = 1024;
    *(_DWORD *)v75 = v13;
    *(_WORD *)&v75[4] = 2048;
    *(void *)&v75[6] = v8;
    *(_WORD *)&v75[14] = 2048;
    *(void *)&v75[16] = [v11 length];
    *(_WORD *)&v75[24] = 2112;
    *(void *)&v75[26] = v12;
    *(_WORD *)&v75[34] = 2112;
    *(void *)&v75[36] = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sBODY LOAD ENDED FOR libraryId %d UID %lu WITH DATA OF LENGTH %lu SECTION %@, STORE:%@", buf, 0x44u);
  }

  if ((int)v13 >= 1)
  {
    [(IMAPServiceBodyLoadMonitor *)self mf_lock];
    id v16 = +[MFActivityMonitor currentTracebleMonitor];
    v69 = [v16 error];

    unsigned int v17 = [@"TEXT" isEqualToString:v12];
    unsigned int v18 = [@"HEADER" isEqualToString:v12];
    uint64_t v19 = [(IMAPServiceBodyLoadMonitor *)self contextForLibraryId:v13 create:v18 | v17];
    id v20 = (void *)v19;
    if (v69)
    {
      v21 = sub_100011098();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = self->mambaID;
        CFStringRef v23 = @"Unknown";
        *(_DWORD *)buf = 136316162;
        if (v17) {
          CFStringRef v23 = @"Body";
        }
        v71 = v22;
        __int16 v72 = 2080;
        v73 = " ";
        CFStringRef v24 = @"Header";
        __int16 v74 = 1024;
        if (!v18) {
          CFStringRef v24 = v23;
        }
        *(_DWORD *)v75 = v8;
        *(_WORD *)&v75[4] = 2112;
        *(void *)&v75[6] = v24;
        *(_WORD *)&v75[14] = 2112;
        *(void *)&v75[16] = v69;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#W %s%sUID(%d) %@ load ended with error %@", buf, 0x30u);
      }

      [v20 cleanUpErroredFile];
      goto LABEL_41;
    }
    if (v18)
    {
      uint64_t v25 = *(void *)(v19 + 16);
      v26 = sub_100011098();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (!v25)
      {
        if (v27)
        {
          id v48 = self->mambaID;
          *(_DWORD *)buf = 136315650;
          v71 = v48;
          __int16 v72 = 2080;
          v73 = " ";
          __int16 v74 = 1024;
          *(_DWORD *)v75 = v8;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#I %s%sUID(%d) Header load ended", buf, 0x1Cu);
        }

        __int16 v49 = [(IMAPServiceBodyLoadMonitor *)self headerData];
        [v49 appendData:v11];

        id v50 = [(IMAPServiceBodyLoadMonitor *)self headerData];
        id v51 = [(IMAPServiceBodyLoadMonitor *)self _createHeaderDictionaryForData:v50];
        id v52 = (void *)v20[2];
        v20[2] = v51;

        v53 = sub_100011098();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v54 = self->mambaID;
          v55 = [(IMAPServiceBodyLoadMonitor *)self headerData];
          uint64_t v56 = v20[2];
          *(_DWORD *)buf = 136316162;
          v71 = v54;
          __int16 v72 = 2080;
          v73 = " ";
          __int16 v74 = 1024;
          *(_DWORD *)v75 = v8;
          *(_WORD *)&v75[4] = 2112;
          *(void *)&v75[6] = v55;
          *(_WORD *)&v75[14] = 2112;
          *(void *)&v75[16] = v56;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "#I %s%sUID(%d) Finished receiving header data: %@ dict: %@", buf, 0x30u);
        }
        [(IMAPServiceBodyLoadMonitor *)self setHeaderData:0];
        id v57 = [v20 parseWithDelegate:self];
        goto LABEL_41;
      }
      if (!v27) {
        goto LABEL_40;
      }
      BOOL v28 = self->mambaID;
      *(_DWORD *)buf = 136315650;
      v71 = v28;
      __int16 v72 = 2080;
      v73 = " ";
      __int16 v74 = 1024;
      *(_DWORD *)v75 = v8;
      __int16 v29 = "#I %s%sUID(%d) Finished receiving skipped additional headers";
      v30 = v26;
      uint32_t v31 = 28;
      goto LABEL_28;
    }
    v26 = sub_100011098();
    BOOL v32 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (!v17)
    {
      if (!v32)
      {
LABEL_40:

LABEL_41:
        if ([v20 mimePartFinishedLoading]) {
          CFDictionaryRemoveValue(self->_loadContextsByLibraryId, +[NSNumber numberWithInt:v13]);
        }
        [(IMAPServiceBodyLoadMonitor *)self mf_unlock];

        goto LABEL_44;
      }
      __int16 v47 = self->mambaID;
      *(_DWORD *)buf = 136315906;
      v71 = v47;
      __int16 v72 = 2080;
      v73 = " ";
      __int16 v74 = 1024;
      *(_DWORD *)v75 = v8;
      *(_WORD *)&v75[4] = 2112;
      *(void *)&v75[6] = v12;
      __int16 v29 = "#I %s%sUID(%d, %@) Finished receiving data for an unexpected section";
      v30 = v26;
      uint32_t v31 = 38;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
      goto LABEL_40;
    }
    if (v32)
    {
      __int16 v33 = self->mambaID;
      id v67 = [v11 length];
      BOOL v34 = [v20 bodyData];
      id v35 = [v34 length];
      *(_DWORD *)buf = 136316162;
      v71 = v33;
      __int16 v72 = 2080;
      v73 = " ";
      __int16 v74 = 1024;
      *(_DWORD *)v75 = v8;
      *(_WORD *)&v75[4] = 2048;
      *(void *)&v75[6] = v67;
      *(_WORD *)&v75[14] = 2048;
      *(void *)&v75[16] = v35;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#I %s%sUID(%d) Appending body data of length %llu to previous length %llu", buf, 0x30u);
    }
    uint32_t v36 = [v20 bodyData];
    [v36 appendData:v11];

    v26 = [v20 parseWithDelegate:self];
    v37 = sub_100011098();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v38)
      {
        v39 = self->mambaID;
        *(_DWORD *)buf = 136315906;
        v71 = v39;
        __int16 v72 = 2080;
        v73 = " ";
        __int16 v74 = 2112;
        *(void *)v75 = v20;
        *(_WORD *)&v75[8] = 2112;
        *(void *)&v75[10] = v26;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#I %s%sbodyLoadEndedForRemoteUid, context:%@, parser:%@", buf, 0x2Au);
      }

      v40 = [v20 bodyData];
      -[NSObject noteDataLengthChanged:](v26, "noteDataLengthChanged:", sub_100019990((unint64_t)[v40 length]));

      BOOL v41 = [v20 bodyData];
      id v42 = [v41 length];
      __int16 v43 = [v26 data];
      LOBYTE(v42) = v42 == [v43 length];

      if (v42) {
        goto LABEL_37;
      }
      v44 = sub_100011098();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v68 = self->mambaID;
        v66 = [v20 bodyData];
        id v65 = [v66 length];
        v64 = [v26 data];
        id v63 = [v64 length];
        uint32_t v45 = [v20 bodyData];
        v46 = [v26 data];
        *(_DWORD *)buf = 136316418;
        v71 = v68;
        __int16 v72 = 2080;
        v73 = " ";
        __int16 v74 = 2048;
        *(void *)v75 = v65;
        *(_WORD *)&v75[8] = 2048;
        *(void *)&v75[10] = v63;
        *(_WORD *)&v75[18] = 2112;
        *(void *)&v75[20] = v45;
        *(_WORD *)&v75[28] = 2112;
        *(void *)&v75[30] = v46;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "#I %s%sEnd: Context body data length %lu does not match parser length %lu. %@ vs %@", buf, 0x3Eu);
      }
      v37 = +[VMABCReporter sharedInstance];
      [v37 reportIssueType:@"Incorrect body data size" description:@"Incorrect body data size on Ended"];
    }
    else if (v38)
    {
      v58 = self->mambaID;
      *(_DWORD *)buf = 136315650;
      v71 = v58;
      __int16 v72 = 2080;
      v73 = " ";
      __int16 v74 = 2112;
      *(void *)v75 = v20;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#I %s%sbodyLoadEndedForRemoteUid, context:%@, *** NO PARSER", buf, 0x20u);
    }

LABEL_37:
    __int16 v59 = sub_100011098();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v60 = self->mambaID;
      v61 = [v20 bodyData];
      id v62 = [v61 length];
      *(_DWORD *)buf = 136315650;
      v71 = v60;
      __int16 v72 = 2080;
      v73 = " ";
      __int16 v74 = 2048;
      *(void *)v75 = v62;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "#I %s%sFinished loading body data, total bytes = %llu", buf, 0x20u);
    }
    goto LABEL_40;
  }
LABEL_44:
}

- (BOOL)progressiveBodyLoadHasStartedForRecord:(void *)a3
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    uint64_t v6 = [WeakRetained getAccountStore];
    uint64_t v7 = (uint64_t)sub_100079014(v6, (const char *)a3);

    if ((int)v7 < 1) {
      return 0;
    }
  }
  else
  {
    uint64_t v7 = 0x7FFFFFFFLL;
  }
  [(IMAPServiceBodyLoadMonitor *)self mf_lock];
  unsigned __int8 v9 = [(IMAPServiceBodyLoadMonitor *)self contextForLibraryId:v7 create:0];
  id v10 = v9;
  if (v9) {
    unsigned __int8 v8 = [v9 loadHasStarted];
  }
  else {
    unsigned __int8 v8 = 0;
  }
  [(IMAPServiceBodyLoadMonitor *)self mf_unlock];

  return v8;
}

- (void)lengthsOfBodyLoadForRecord:(void *)a3 expected:(unsigned int *)a4 current:(unsigned int *)a5
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    unsigned __int8 v9 = [WeakRetained getAccountStore];
    uint64_t v10 = (uint64_t)sub_100079014(v9, (const char *)a3);

    if ((int)v10 < 1) {
      return;
    }
  }
  else
  {
    uint64_t v10 = 0x7FFFFFFFLL;
  }
  [(IMAPServiceBodyLoadMonitor *)self mf_lock];
  id v12 = [(IMAPServiceBodyLoadMonitor *)self contextForLibraryId:v10 create:0];
  if (v12)
  {
    if (a4) {
      *a4 = [v12 expectedLength];
    }
    if (a5) {
      *a5 = [v12 currentOffset];
    }
  }
  [(IMAPServiceBodyLoadMonitor *)self mf_unlock];
}

- (void)progressiveMimeParser:(id)a3 beganDataForMimePart:(id)a4
{
  id v56 = a3;
  id v6 = a4;
  uint64_t v7 = sub_100011098();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    *(_DWORD *)buf = 136315394;
    v58 = mambaID;
    __int16 v59 = 2080;
    v60 = " ";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sVVPARSE BEGIN DATA", buf, 0x16u);
  }

  unsigned __int8 v9 = [v6 type];
  if ([v9 isEqualToString:@"audio"])
  {
    uint64_t v10 = [v6 subtype];
    unsigned __int8 v11 = [v10 isEqualToString:@"amr"];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  id v12 = +[MFAttachmentManager defaultManager];
  uint64_t v13 = [v6 attachmentURLs];
  v14 = [v13 firstObject];
  uint64_t v15 = [v12 attachmentForURL:v14 error:0];

  if ((v11 & 1) != 0
    || [v6 isAttachment]
    && ([v15 inferredMimeType],
        __int16 v29 = objc_claimAutoreleasedReturnValue(),
        unsigned int v30 = [v29 isEqualToString:@"audio/amr"],
        v29,
        v30))
  {
    uint64_t v16 = [v56 context];
    unsigned int v17 = [v6 contentTransferEncoding];
    v55 = [v6 dispositionParameterForKey:@"size"];
    uint64_t v54 = [v6 preservedHeaderValueForKey:@"x-applevm-duration"];
    unsigned int v18 = [v17 isEqualToString:@"base64"];
    *(unsigned char *)(v16 + 64) = *(unsigned char *)(v16 + 64) & 0xFE | v18;
    if (v17) {
      int v19 = v18;
    }
    else {
      int v19 = 1;
    }
    if (v19 != 1)
    {
      BOOL v27 = sub_100011098();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v31 = self->mambaID;
        *(_DWORD *)buf = 136315394;
        v58 = v31;
        __int16 v59 = 2080;
        v60 = " ";
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I %s%sBad content transfer encoding; skipping body load",
          buf,
          0x16u);
      }
      goto LABEL_42;
    }
    BOOL v20 = *(_DWORD *)(v16 + 24) == 0x7FFFFFFF;
    p_service = &self->_service;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    id v23 = WeakRetained;
    if (v20)
    {
      CFStringRef v24 = [WeakRetained accountDir];
      v26 = sub_10006D9E8(v24, v25);
      BOOL v27 = [v26 path];

      id v28 = 0;
    }
    else
    {
      BOOL v32 = [WeakRetained getAccountStore];
      id v28 = sub_100079A6C(v32, *(unsigned int *)(v16 + 24));

      if (!v28)
      {
        BOOL v27 = 0;
LABEL_42:

        goto LABEL_43;
      }
      id v33 = [v54 intValue];
      if (v33)
      {
        id v34 = objc_loadWeakRetained((id *)&self->_service);
        id v35 = [v34 getAccountStore];
        sub_1000791D4(v35, (uint64_t)v28, (uint64_t)v33);

        id v36 = objc_loadWeakRetained((id *)&self->_service);
        v37 = [v36 getAccountStore];
        [v37 save];
      }
      id v23 = objc_loadWeakRetained((id *)&self->_service);
      CFStringRef v24 = [v23 getAccountStore];
      BOOL v27 = sub_10007966C(v24, (uint64_t)v28);
    }

    if (v27)
    {
      BOOL v38 = sub_100011098();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = self->mambaID;
        *(_DWORD *)buf = 136315650;
        v58 = v39;
        __int16 v59 = 2080;
        v60 = " ";
        __int16 v61 = 2112;
        id v62 = v27;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "#I %s%sVVPARSE COPYING DATA TO %@", buf, 0x20u);
      }

      v53 = v27;
      int v40 = open((const char *)[v53 fileSystemRepresentation], 1538, 448);
      *(_DWORD *)(v16 + 28) = v40;
      if (v40 < 0)
      {
        id v46 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to open file for writing: %@", v53];
        __int16 v47 = +[NSError errorWithDomain:kVVErrorDomain code:1010 localizedDescription:v46];
        id v48 = +[MFActivityMonitor currentTracebleMonitor];
        [v48 setError:v47];
      }
      else
      {
        if ([v55 length])
        {
          id v41 = objc_alloc_init((Class)NSMutableDictionary);
          id v42 = *(void **)(v16 + 48);
          *(void *)(v16 + 48) = v41;

          id v43 = objc_alloc((Class)NSNumber);
          id v44 = objc_loadWeakRetained((id *)&self->_service);
          if (v44)
          {
            BOOL v38 = objc_loadWeakRetained((id *)p_service);
            id v45 = [v38 currentTaskType];
          }
          else
          {
            id v45 = 0;
          }
          __int16 v49 = [v43 initWithInt:v45];
          if (v44) {

          }
          [*(id *)(v16 + 48) setObject:v49 forKey:@"VVTaskType"];
          id v51 = [v55 intValue];
          id v52 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:v51];
          [*(id *)(v16 + 48) setObject:v52 forKey:@"VVExpectedDataLength"];
          [(id)v16 setExpectedLength:v51];
          if (v28) {
            [*(id *)(v16 + 48) setObject:v28 forKey:@"VVRecord"];
          }
        }
        else
        {
          __int16 v49 = sub_100011098();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            id v50 = self->mambaID;
            *(_DWORD *)buf = 136315394;
            v58 = v50;
            __int16 v59 = 2080;
            v60 = " ";
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "#I %s%sNo size value; streaming disabled",
              buf,
              0x16u);
          }
        }

        [(id)v16 writeDataIfNeeded];
      }
    }
    if (v28) {
      CFRelease(v28);
    }
    goto LABEL_42;
  }
LABEL_43:
}

- (void)progressiveMimeParser:(id)a3 finishedMimePart:(id)a4
{
  id v5 = a3;
  id v6 = sub_100011098();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    int v13 = 136315394;
    v14 = mambaID;
    __int16 v15 = 2080;
    uint64_t v16 = " ";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sVVPARSE FINISH", (uint8_t *)&v13, 0x16u);
  }

  unsigned __int8 v8 = [v5 context];
  unsigned __int8 v9 = v8;
  if (v8 && (v8[7] & 0x80000000) == 0)
  {
    [v8 setMimePartFinishedLoading:1];
    [v9 writeDataIfNeeded];
    close(v9[7]);
    v9[7] = -1;
    BOOL v10 = v9[6] == 0x7FFFFFFF;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    id v12 = WeakRetained;
    if (v10) {
      [WeakRetained _setGreetingCached:1];
    }
    else {
      [WeakRetained _setDataForRecordWithIdentifier:v9[6]];
    }
  }
}

- (void)_postDataAvailableWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = sub_100011098();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    int v10 = 136315906;
    unsigned __int8 v11 = mambaID;
    __int16 v12 = 2080;
    int v13 = " ";
    __int16 v14 = 2112;
    id v15 = WeakRetained;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sPosting VVServiceDataAvailableNotification service %@ with userInfo %@", (uint8_t *)&v10, 0x2Au);
  }
  unsigned __int8 v8 = +[NSNotificationCenter defaultCenter];
  id v9 = objc_loadWeakRetained((id *)&self->_service);
  [v8 postNotificationName:@"VVServiceDataAvailableNotification" object:v9 userInfo:v4];
}

- (void)progressiveMimeParser:(id)a3 failedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = sub_100011098();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    mambaID = self->mambaID;
    int v13 = 136315394;
    __int16 v14 = mambaID;
    __int16 v15 = 2080;
    __int16 v16 = " ";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sVVPARSE FAIL", (uint8_t *)&v13, 0x16u);
  }

  int v10 = +[MFActivityMonitor currentTracebleMonitor];
  [v10 setError:v7];

  unsigned __int8 v11 = [v6 context];
  __int16 v12 = v11;
  if (v11 && (v11[7] & 0x80000000) == 0) {
    [v11 cleanUpErroredFile];
  }
}

- (NSMutableData)headerData
{
  return (NSMutableData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHeaderData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerData, 0);
  objc_destroyWeak((id *)&self->_service);
}

@end