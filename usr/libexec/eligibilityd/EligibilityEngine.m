@interface EligibilityEngine
+ (id)sharedInstance;
- (BOOL)_onQueue_saveDomainAnswerOutputsWithError:(id *)a3;
- (BOOL)_onQueue_saveDomainsWithError:(id *)a3;
- (BOOL)_onQueue_serializeInternalDomainStateToDiskWithError:(id *)a3;
- (BOOL)_onQueue_serializeOverrideDataToDiskWithError:(id *)a3;
- (BOOL)_sendNotification:(id)a3;
- (BOOL)_serializeObject:(id)a3 toURL:(id)a4 withError:(id *)a5;
- (BOOL)dumpToDirectory:(id)a3 withError:(id *)a4;
- (BOOL)forceDomainAnswer:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5 withError:(id *)a6;
- (BOOL)forceDomainSetAnswers:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5 withError:(id *)a6;
- (BOOL)resetAllDomainsWithError:(id *)a3;
- (BOOL)resetDomain:(unint64_t)a3 withError:(id *)a4;
- (BOOL)setInput:(unint64_t)a3 to:(id)a4 status:(unint64_t)a5 fromProcess:(id)a6 withError:(id *)a7;
- (EligibilityEngine)init;
- (EligibilityOverride)eligibilityOverrides;
- (NSDictionary)domains;
- (NSMutableSet)notificationsToSend;
- (OS_dispatch_queue)internalQueue;
- (id)_createDefaultDomains;
- (id)_decodeObjectOfClasses:(id)a3 atURL:(id)a4 withError:(id *)a5;
- (id)_loadDomainsWithError:(id *)a3;
- (id)_loadOverridesWithError:(id *)a3;
- (id)_onQueue_finalEligibilityDictionaryForDomain:(id)a3;
- (id)_onQueue_urlToDomainData;
- (id)internalStateWithError:(id *)a3;
- (id)mappingByRemovingEphemeralDomains:(id)a3;
- (id)stateDumpWithError:(id *)a3;
- (void)_onQueue_handleRecompute:(id)a3;
- (void)_onQueue_notifySADSupportFramework;
- (void)_onQueue_recomputeAllDomainAnswers;
- (void)_onQueue_sendNotifications;
- (void)asyncUpdateAndRecomputeAllAnswers;
- (void)recomputeAllDomainAnswers;
- (void)scheduleDailyRecompute;
- (void)setDomains:(id)a3;
- (void)setEligibilityOverrides:(id)a3;
- (void)setNotificationsToSend:(id)a3;
@end

@implementation EligibilityEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_eligibilityOverrides, 0);
  objc_storeStrong((id *)&self->_notificationsToSend, 0);

  objc_storeStrong((id *)&self->_domains, 0);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setEligibilityOverrides:(id)a3
{
}

- (EligibilityOverride)eligibilityOverrides
{
  return self->_eligibilityOverrides;
}

- (void)setNotificationsToSend:(id)a3
{
}

- (NSMutableSet)notificationsToSend
{
  return self->_notificationsToSend;
}

- (void)setDomains:(id)a3
{
}

- (NSDictionary)domains
{
  return self->_domains;
}

- (void)scheduleDailyRecompute
{
  v3 = +[BGSystemTaskScheduler sharedScheduler];
  v4 = [(EligibilityEngine *)self internalQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001DE60;
  v5[3] = &unk_100039048;
  v5[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.eligibility.recompute" usingQueue:v4 launchHandler:v5];
}

- (void)_onQueue_handleRecompute:(id)a3
{
  id v4 = a3;
  v5 = [(EligibilityEngine *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  [v4 identifier];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001E23C;
  v23[3] = &unk_100039020;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v6;
  v25 = &v26;
  [v4 setExpirationHandler:v23];
  v7 = sub_10000D0EC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[EligibilityEngine _onQueue_handleRecompute:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Refresh MobileAsset parameters", buf, 0xCu);
  }

  v8 = +[MobileAssetManager sharedInstance];
  [v8 asyncRefetchMobileAsset];

  if (*((unsigned char *)v27 + 24)) {
    goto LABEL_18;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = [(EligibilityEngine *)self domains];
  v10 = [v9 allValues];

  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) updateParameters];
        if (*((unsigned char *)v27 + 24))
        {

          goto LABEL_18;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v19 objects:v34 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v14 = sub_10000D0EC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[EligibilityEngine _onQueue_handleRecompute:]";
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Recomputing eligiblity for %@", buf, 0x16u);
  }

  [(EligibilityEngine *)self _onQueue_recomputeAllDomainAnswers];
  if (*((unsigned char *)v27 + 24)
    || ([(EligibilityEngine *)self _sendNotification:@"com.apple.os-eligibility-domain.input-needed"], *((unsigned char *)v27 + 24)))
  {
LABEL_18:
    id v18 = 0;
    unsigned __int8 v16 = [v4 setTaskExpiredWithRetryAfter:&v18 error:0.0];
    id v15 = v18;
    if ((v16 & 1) == 0)
    {
      v17 = sub_10000D0EC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "-[EligibilityEngine _onQueue_handleRecompute:]";
        __int16 v32 = 2112;
        id v33 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Failed to expire task with error: %@", buf, 0x16u);
      }

      [v4 setTaskCompleted];
    }
  }
  else
  {
    [v4 setTaskCompleted];
    id v15 = 0;
  }

  _Block_object_dispose(&v26, 8);
}

- (void)asyncUpdateAndRecomputeAllAnswers
{
  v3 = [(EligibilityEngine *)self internalQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001E394;
  v4[3] = &unk_100038F30;
  v4[4] = self;
  sub_100018B7C(v3, v4);
}

- (BOOL)dumpToDirectory:(id)a3 withError:(id *)a4
{
  id v6 = [a3 URLByAppendingPathComponent:@"state.plist" isDirectory:0];
  id v16 = 0;
  v7 = [(EligibilityEngine *)self stateDumpWithError:&v16];
  id v8 = v16;
  v9 = v8;
  if (v7)
  {
    id v15 = v8;
    unsigned __int8 v10 = [v7 writeToURL:v6 error:&v15];
    id v11 = v15;

    if (v10)
    {
      BOOL v12 = 1;
      goto LABEL_12;
    }
    v13 = sub_10000D0EC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[EligibilityEngine dumpToDirectory:withError:]";
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Failed to save state dump to disk: %@", buf, 0x16u);
    }
    v9 = v11;
  }
  else
  {
    v13 = sub_10000D0EC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[EligibilityEngine dumpToDirectory:withError:]";
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Failed to generate state dump: %@", buf, 0x16u);
    }
  }

  if (a4)
  {
    id v11 = v9;
    BOOL v12 = 0;
    *a4 = v11;
  }
  else
  {
    BOOL v12 = 0;
    id v11 = v9;
  }
LABEL_12:

  return v12;
}

- (id)stateDumpWithError:(id *)a3
{
  id v4 = objc_opt_new();
  v5 = [(EligibilityEngine *)self internalQueue];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_10001E768;
  BOOL v12 = &unk_100038F58;
  id v13 = v4;
  v14 = self;
  id v6 = v4;
  dispatch_sync(v5, &v9);

  id v7 = [v6 copy:v9, v10, v11, v12];

  return v7;
}

- (id)internalStateWithError:(id *)a3
{
  id v4 = objc_opt_new();
  v5 = [(EligibilityEngine *)self internalQueue];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_10001EA84;
  BOOL v12 = &unk_100038F58;
  id v13 = v4;
  v14 = self;
  id v6 = v4;
  dispatch_sync(v5, &v9);

  id v7 = [v6 copy:v9, v10, v11, v12];

  return v7;
}

- (BOOL)forceDomainSetAnswers:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5 withError:(id *)a6
{
  id v10 = a5;
  id v11 = v10;
  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_10001EF10;
  __int16 v32 = sub_10001EF20;
  id v33 = 0;
  if (!v10)
  {
    id v18 = 0;
    goto LABEL_9;
  }
  xpc_type_t type = xpc_get_type(v10);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v18 = (void *)_CFXPCCreateCFObjectFromXPCObject();
LABEL_9:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v35 = 0;
    __int16 v19 = [(EligibilityEngine *)self internalQueue];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001EF28;
    v22[3] = &unk_100038FF8;
    v22[4] = self;
    unint64_t v26 = a3;
    unint64_t v27 = a4;
    id v17 = v18;
    id v23 = v17;
    id v24 = &v28;
    v25 = buf;
    dispatch_sync(v19, v22);

    BOOL v16 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
    if (!a6) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  id v13 = sub_10000D0EC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    name = xpc_type_get_name(type);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[EligibilityEngine forceDomainSetAnswers:answer:context:withError:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = name;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Expected context to be a dictionary but instead was a %s", buf, 0x16u);
  }

  uint64_t v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  id v15 = (void *)v29[5];
  v29[5] = v14;

  BOOL v16 = 0;
  id v17 = 0;
  if (a6)
  {
LABEL_10:
    if (!v16) {
      *a6 = (id) v29[5];
    }
  }
LABEL_12:

  _Block_object_dispose(&v28, 8);
  return v16;
}

- (BOOL)forceDomainAnswer:(unint64_t)a3 answer:(unint64_t)a4 context:(id)a5 withError:(id *)a6
{
  id v10 = a5;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  char v35 = sub_10001EF10;
  v36 = sub_10001EF20;
  id v37 = 0;
  id v11 = sub_1000057F8(a3);
  if (!a3 || (BOOL v12 = v11) == 0)
  {
    uint64_t v17 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    id v18 = (void *)v33[5];
    v33[5] = v17;

    goto LABEL_9;
  }
  if (!v10)
  {
    long long v21 = 0;
    goto LABEL_13;
  }
  xpc_type_t type = xpc_get_type(v10);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    long long v21 = (void *)_CFXPCCreateCFObjectFromXPCObject();
LABEL_13:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v39 = 0;
    long long v22 = [(EligibilityEngine *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F574;
    block[3] = &unk_100038FD0;
    char v29 = v12;
    unint64_t v30 = a3;
    block[4] = self;
    unint64_t v27 = &v32;
    unint64_t v31 = a4;
    id v20 = v21;
    id v26 = v20;
    uint64_t v28 = buf;
    dispatch_sync(v22, block);

    BOOL v19 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
    if (!a6) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  uint64_t v14 = sub_10000D0EC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    name = xpc_type_get_name(type);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[EligibilityEngine forceDomainAnswer:answer:context:withError:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = name;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Expected context to be a dictionary but instead was a %s", buf, 0x16u);
  }

  uint64_t v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  BOOL v16 = (void *)v33[5];
  v33[5] = v15;

LABEL_9:
  BOOL v19 = 0;
  id v20 = 0;
  if (!a6) {
    goto LABEL_16;
  }
LABEL_14:
  if (!v19) {
    *a6 = (id) v33[5];
  }
LABEL_16:

  _Block_object_dispose(&v32, 8);
  return v19;
}

- (BOOL)resetAllDomainsWithError:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10001EF10;
  uint64_t v14 = sub_10001EF20;
  id v15 = 0;
  v5 = [(EligibilityEngine *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F948;
  block[3] = &unk_100038FA8;
  block[4] = self;
  void block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(v5, block);

  int v6 = *((unsigned __int8 *)v17 + 24);
  if (a3 && !*((unsigned char *)v17 + 24))
  {
    *a3 = (id) v11[5];
    int v6 = *((unsigned __int8 *)v17 + 24);
  }
  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (BOOL)resetDomain:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_10001EF10;
  id v23 = sub_10001EF20;
  id v24 = 0;
  BOOL v7 = sub_1000057F8(a3);
  if (a3 && (id v8 = v7) != 0)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    v9 = [(EligibilityEngine *)self internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001FD54;
    block[3] = &unk_100038F80;
    void block[7] = v8;
    block[8] = a3;
    block[4] = self;
    void block[5] = &v19;
    block[6] = &v15;
    dispatch_sync(v9, block);

    BOOL v10 = *((unsigned char *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
    if (!a4) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    uint64_t v12 = (void *)v20[5];
    v20[5] = v11;

    BOOL v10 = 0;
    if (!a4) {
      goto LABEL_8;
    }
  }
  if (!v10) {
    *a4 = (id) v20[5];
  }
LABEL_8:
  _Block_object_dispose(&v19, 8);

  return v10;
}

- (BOOL)setInput:(unint64_t)a3 to:(id)a4 status:(unint64_t)a5 fromProcess:(id)a6 withError:(id *)a7
{
  id v12 = a4;
  id v13 = a6;
  switch(a3)
  {
    case 1uLL:
      uint64_t v14 = [[LocatedCountryInput alloc] initWithCountryCodes:v12 status:a5 process:v13];
      goto LABEL_10;
    case 2uLL:
      uint64_t v14 = [[CountryBillingInput alloc] initWithBillingCountry:v12 status:a5 process:v13];
      goto LABEL_10;
    case 4uLL:
      uint64_t v14 = [[DeviceLocaleInput alloc] initWithDeviceLocale:v12 status:a5 process:v13];
      goto LABEL_10;
    case 9uLL:
      uint64_t v14 = [[GreymatterQueueInput alloc] initOnQueue:v12 status:a5 process:v13];
      goto LABEL_10;
    case 0xEuLL:
      uint64_t v14 = [[InitialSetupLocationInput alloc] initWithLocations:v12 status:a5 process:v13];
      goto LABEL_10;
    case 0xFuLL:
      uint64_t v14 = [[BirthdateInput alloc] initWithDate:v12 status:a5 process:v13];
LABEL_10:
      uint64_t v19 = v14;
      if (v14)
      {
        id v20 = [(EligibilityEngine *)self internalQueue];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100020314;
        v25[3] = &unk_100038F58;
        id v26 = v19;
        unint64_t v27 = self;
        uint64_t v21 = v19;
        sub_100018B7C(v20, v25);

        id v22 = 0;
        BOOL v23 = 1;
      }
      else
      {
        uint64_t v15 = sub_10000D0EC();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          char v29 = "-[EligibilityEngine setInput:to:status:fromProcess:withError:]";
          uint64_t v16 = "%s: Failed to initalize input type";
          uint64_t v17 = v15;
          uint32_t v18 = 12;
LABEL_18:
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
        }
LABEL_13:

        id v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        if (a7)
        {
          id v22 = v22;
          BOOL v23 = 0;
          *a7 = v22;
        }
        else
        {
          BOOL v23 = 0;
        }
      }

      return v23;
    default:
      uint64_t v15 = sub_10000D0EC();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315394;
      char v29 = "-[EligibilityEngine setInput:to:status:fromProcess:withError:]";
      __int16 v30 = 2048;
      unint64_t v31 = a3;
      uint64_t v16 = "%s: Unsupported eligibility input type %llu";
      uint64_t v17 = v15;
      uint32_t v18 = 22;
      goto LABEL_18;
  }
}

- (void)_onQueue_recomputeAllDomainAnswers
{
  v3 = [(EligibilityEngine *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(EligibilityEngine *)self domains];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100020594;
  v9[3] = &unk_100038EB8;
  v9[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v8 = 0;
  unsigned __int8 v5 = [(EligibilityEngine *)self _onQueue_saveDomainsWithError:&v8];
  id v6 = v8;
  if (v5)
  {
    [(EligibilityEngine *)self _onQueue_sendNotifications];
  }
  else
  {
    BOOL v7 = sub_10000D0EC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[EligibilityEngine _onQueue_recomputeAllDomainAnswers]";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Failed to save domains to disk: %@", buf, 0x16u);
    }
  }
}

- (void)recomputeAllDomainAnswers
{
  v3 = [(EligibilityEngine *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020780;
  block[3] = &unk_100038F30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onQueue_sendNotifications
{
  v3 = [(EligibilityEngine *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(EligibilityEngine *)self notificationsToSend];
  if ([v4 count]) {
    [v4 addObject:@"com.apple.os-eligibility-domain.change"];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 copy];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([(EligibilityEngine *)self _sendNotification:v10]) {
          [v4 removeObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)_sendNotification:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  uint32_t v4 = notify_post(v3);
  if (v4)
  {
    id v5 = sub_10000D0EC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315650;
      uint64_t v8 = "-[EligibilityEngine _sendNotification:]";
      __int16 v9 = 2080;
      uint64_t v10 = v3;
      __int16 v11 = 1024;
      uint32_t v12 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: Could not post domain change notification \"%s\": %u", (uint8_t *)&v7, 0x1Cu);
    }
  }
  return v4 == 0;
}

- (BOOL)_onQueue_saveDomainAnswerOutputsWithError:(id *)a3
{
  id v5 = [(EligibilityEngine *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_10001EF10;
  uint32_t v18 = sub_10001EF20;
  id v19 = 0;
  id v6 = [(EligibilityEngine *)self _onQueue_urlToDomainData];
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100020B40;
  v9[3] = &unk_100038F08;
  v9[4] = &v14;
  void v9[5] = &v10;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  int v7 = *((unsigned __int8 *)v11 + 24);
  if (a3 && !*((unsigned char *)v11 + 24)) {
    *a3 = (id) v15[5];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v14, 8);
  return v7 != 0;
}

- (id)_onQueue_urlToDomainData
{
  v3 = [(EligibilityEngine *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  uint32_t v4 = objc_opt_new();
  id v5 = [(EligibilityEngine *)self domains];
  __int16 v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  __int16 v11 = sub_100020DC4;
  uint64_t v12 = &unk_100038EE0;
  id v13 = v4;
  uint64_t v14 = self;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:&v9];

  id v7 = [v6 copy:v9, v10, v11, v12];

  return v7;
}

- (id)_onQueue_finalEligibilityDictionaryForDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(EligibilityEngine *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(EligibilityEngine *)self eligibilityOverrides];
  id v7 = [v6 overrideResultDictionaryForDomain:[v4 domain]];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v4 serialize];
  }
  __int16 v9 = v8;

  return v9;
}

- (void)_onQueue_notifySADSupportFramework
{
  if (&_SADSEligiblilityDidChange)
  {
    v3 = [(EligibilityEngine *)self internalQueue];
    dispatch_assert_queue_V2(v3);

    id v4 = objc_opt_new();
    id v5 = [(EligibilityEngine *)self domains];
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    uint64_t v10 = sub_1000211FC;
    __int16 v11 = &unk_100038EE0;
    uint64_t v12 = self;
    id v13 = v4;
    id v6 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:&v8];

    id v7 = [v6 copy:v8, v9, v10, v11, v12];
    SADSEligiblilityDidChange();
  }
}

- (BOOL)_onQueue_serializeInternalDomainStateToDiskWithError:(id *)a3
{
  id v5 = [(EligibilityEngine *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v17 = 0;
  if (asprintf(&v17, "%s%s", "/", "/private/var/db/eligibilityd/domains.data") == -1)
  {
    id v6 = sub_10000D0EC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "copy_eligibility_domain_domains_serialization_path";
      __int16 v20 = 2080;
      uint64_t v21 = "/private/var/db/eligibilityd/domains.data";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  id v7 = v17;
  if (v17)
  {
    id v8 = +[NSString stringWithUTF8String:v17];
    uint64_t v9 = +[NSURL fileURLWithPath:v8 isDirectory:0];
    uint64_t v10 = [(EligibilityEngine *)self domains];
    __int16 v11 = [(EligibilityEngine *)self mappingByRemovingEphemeralDomains:v10];

    id v16 = 0;
    LODWORD(v10) = [(EligibilityEngine *)self _serializeObject:v11 toURL:v9 withError:&v16];
    uint64_t v12 = (char *)v16;
    if (v10)
    {
      free(v7);
      BOOL v13 = 1;
      goto LABEL_15;
    }
    uint64_t v14 = sub_10000D0EC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[EligibilityEngine _onQueue_serializeInternalDomainStateToDiskWithError:]";
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Failed to write domain data to disk: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v14 = sub_10000D0EC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[EligibilityEngine _onQueue_serializeInternalDomainStateToDiskWithError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to copy domains serialization path", buf, 0xCu);
    }
    uint64_t v9 = 0;
    id v8 = 0;
    __int16 v11 = 0;
    uint64_t v12 = 0;
  }

  free(v7);
  if (a3)
  {
    uint64_t v12 = v12;
    BOOL v13 = 0;
    *a3 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_15:

  return v13;
}

- (id)mappingByRemovingEphemeralDomains:(id)a3
{
  id v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002163C;
  v7[3] = &unk_100038EB8;
  id v8 = (id)objc_opt_new();
  id v4 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = [v4 copy];

  return v5;
}

- (BOOL)_onQueue_serializeOverrideDataToDiskWithError:(id *)a3
{
  id v5 = [(EligibilityEngine *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v16 = 0;
  id v6 = sub_10001C124(&v16);
  id v7 = v16;
  if (v6)
  {
    id v8 = [v6 URLByAppendingPathComponent:@"Library/Caches/NeverRestore/eligibility_overrides.data" isDirectory:0];
    uint64_t v9 = [(EligibilityEngine *)self eligibilityOverrides];
    id v15 = v7;
    unsigned __int8 v10 = [(EligibilityEngine *)self _serializeObject:v9 toURL:v8 withError:&v15];
    id v11 = v15;

    if (v10)
    {
      BOOL v12 = 1;
      goto LABEL_13;
    }
    BOOL v13 = sub_10000D0EC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint32_t v18 = "-[EligibilityEngine _onQueue_serializeOverrideDataToDiskWithError:]";
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Failed to write eligibility overrides data to disk: %@", buf, 0x16u);
    }
    id v7 = v11;
  }
  else
  {
    BOOL v13 = sub_10000D0EC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint32_t v18 = "-[EligibilityEngine _onQueue_serializeOverrideDataToDiskWithError:]";
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Failed to obtain the URL for our data container: %@", buf, 0x16u);
    }
    id v8 = 0;
  }

  if (a3)
  {
    id v11 = v7;
    BOOL v12 = 0;
    *a3 = v11;
  }
  else
  {
    BOOL v12 = 0;
    id v11 = v7;
  }
LABEL_13:

  return v12;
}

- (BOOL)_serializeObject:(id)a3 toURL:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v9 encodeObject:v7 forKey:NSKeyedArchiveRootObjectKey];
  unsigned __int8 v10 = [v9 encodedData];

  id v17 = 0;
  unsigned __int8 v11 = [v10 writeToURL:v8 options:268435457 error:&v17];
  id v12 = v17;
  if (v11)
  {
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v14 = sub_10000D0EC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v8 path];
      *(_DWORD *)buf = 136315906;
      __int16 v19 = "-[EligibilityEngine _serializeObject:toURL:withError:]";
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      BOOL v23 = v15;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to write data %@ to disk at %@: %@", buf, 0x2Au);
    }
    if (a5)
    {
      id v12 = v12;
      BOOL v13 = 0;
      *a5 = v12;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (BOOL)_onQueue_saveDomainsWithError:(id *)a3
{
  id v5 = [(EligibilityEngine *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  id v16 = 0;
  unsigned int v6 = [(EligibilityEngine *)self _onQueue_serializeInternalDomainStateToDiskWithError:&v16];
  id v7 = v16;
  id v8 = v7;
  if (v6)
  {
    id v15 = v7;
    unsigned int v9 = [(EligibilityEngine *)self _onQueue_saveDomainAnswerOutputsWithError:&v15];
    id v10 = v15;

    if (v9)
    {
      id v14 = v10;
      unsigned int v11 = [(EligibilityEngine *)self _onQueue_serializeOverrideDataToDiskWithError:&v14];
      id v8 = v14;

      if (v11)
      {
        [(EligibilityEngine *)self _onQueue_notifySADSupportFramework];
        BOOL v12 = 1;
        goto LABEL_9;
      }
    }
    else
    {
      id v8 = v10;
    }
  }
  if (a3)
  {
    id v8 = v8;
    BOOL v12 = 0;
    *a3 = v8;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_9:

  return v12;
}

- (id)_loadDomainsWithError:(id *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  __int16 v19 = 0;
  if (asprintf(&v19, "%s%s", "/", "/private/var/db/eligibilityd/domains.data") == -1)
  {
    id v8 = sub_10000D0EC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "copy_eligibility_domain_domains_serialization_path";
      __int16 v22 = 2080;
      BOOL v23 = "/private/var/db/eligibilityd/domains.data";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  unsigned int v9 = v19;
  if (!v19)
  {
    id v15 = sub_10000D0EC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[EligibilityEngine _loadDomainsWithError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Failed to copy domains serialization path", buf, 0xCu);
    }

    unsigned int v11 = 0;
    id v10 = 0;
    BOOL v13 = 0;
    goto LABEL_13;
  }
  id v10 = +[NSString stringWithUTF8String:v19];
  unsigned int v11 = +[NSURL fileURLWithPath:v10 isDirectory:0];
  id v18 = 0;
  BOOL v12 = [(EligibilityEngine *)self _decodeObjectOfClasses:v7 atURL:v11 withError:&v18];
  BOOL v13 = (char *)v18;
  if (!v12)
  {
    id v16 = sub_10000D0EC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "-[EligibilityEngine _loadDomainsWithError:]";
      __int16 v22 = 2112;
      BOOL v23 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Failed to decode domains: %@", buf, 0x16u);
    }

LABEL_13:
    id v14 = 0;
    goto LABEL_14;
  }
  id v14 = v12;
LABEL_14:
  free(v9);
  if (a3 && !v14) {
    *a3 = v13;
  }

  return v14;
}

- (id)_loadOverridesWithError:(id *)a3
{
  id v14 = 0;
  uint64_t v5 = sub_10001C124(&v14);
  id v6 = v14;
  if (v5)
  {
    id v7 = [v5 URLByAppendingPathComponent:@"Library/Caches/NeverRestore/eligibility_overrides.data" isDirectory:0];
    id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    id v13 = v6;
    unsigned int v9 = [(EligibilityEngine *)self _decodeObjectOfClasses:v8 atURL:v7 withError:&v13];
    id v10 = v13;

    if (v9)
    {
      id v6 = v10;
      goto LABEL_13;
    }
    unsigned int v11 = sub_10000D0EC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[EligibilityEngine _loadOverridesWithError:]";
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: Failed to decode eligibility overrides: %@", buf, 0x16u);
    }
    id v6 = v10;
  }
  else
  {
    unsigned int v11 = sub_10000D0EC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[EligibilityEngine _loadOverridesWithError:]";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Failed to obtain the URL for our data container: %@", buf, 0x16u);
    }
    id v7 = 0;
  }

  if (a3)
  {
    id v6 = v6;
    unsigned int v9 = 0;
    *a3 = v6;
  }
  else
  {
    unsigned int v9 = 0;
  }
LABEL_13:

  return v9;
}

- (id)_decodeObjectOfClasses:(id)a3 atURL:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v25 = 0;
  unsigned int v9 = +[NSData dataWithContentsOfURL:v8 options:3 error:&v25];
  id v10 = v25;
  unsigned int v11 = v10;
  if (!v9)
  {
    id v16 = [v10 domain];
    if ([v16 isEqualToString:NSCocoaErrorDomain])
    {
      id v17 = [v11 code];

      if (v17 == (id)260)
      {
        id v18 = sub_10000D0EC();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v19 = [v8 path];
          *(_DWORD *)buf = 136315650;
          unint64_t v27 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
          __int16 v28 = 2112;
          char v29 = v19;
          __int16 v30 = 2112;
          unint64_t v31 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: URL %@ doesn't exist yet: %@", buf, 0x20u);
LABEL_25:

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
    }
    id v18 = sub_10000D0EC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = [v8 path];
      *(_DWORD *)buf = 136315650;
      unint64_t v27 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
      __int16 v28 = 2112;
      char v29 = v19;
      __int16 v30 = 2112;
      unint64_t v31 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: Failed to deserialize data in %@: %@", buf, 0x20u);
      goto LABEL_25;
    }
LABEL_14:
    id v12 = 0;
    goto LABEL_18;
  }
  __int16 v24 = v10;
  id v12 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v9 error:&v24];
  id v13 = v24;

  if (v12)
  {
    uint64_t v14 = [v12 decodeObjectOfClasses:v7 forKey:NSKeyedArchiveRootObjectKey];
    if (v14)
    {
      id v15 = (void *)v14;
      [v12 finishDecoding];
      goto LABEL_21;
    }
    __int16 v20 = sub_10000D0EC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = [v8 path];
      BOOL v23 = [v12 error];
      *(_DWORD *)buf = 136315650;
      unint64_t v27 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
      __int16 v28 = 2112;
      char v29 = v22;
      __int16 v30 = 2112;
      unint64_t v31 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to decode data at %@ : %@", buf, 0x20u);
    }
    unsigned int v11 = [v12 error];
    id v18 = v13;
  }
  else
  {
    id v18 = sub_10000D0EC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v27 = "-[EligibilityEngine _decodeObjectOfClasses:atURL:withError:]";
      __int16 v28 = 2112;
      char v29 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: Failed to create unarchiver: %@", buf, 0x16u);
    }
    id v12 = 0;
    unsigned int v11 = v13;
  }
LABEL_18:

  if (a5)
  {
    id v13 = v11;
    id v15 = 0;
    *a5 = v13;
  }
  else
  {
    id v15 = 0;
    id v13 = v11;
  }
LABEL_21:

  return v15;
}

- (id)_createDefaultDomains
{
  v56[0] = @"OS_ELIGIBILITY_DOMAIN_LOTX";
  v55 = objc_opt_new();
  v57[0] = v55;
  v56[1] = @"OS_ELIGIBILITY_DOMAIN_PODCASTS_TRANSCRIPTS";
  v54 = objc_opt_new();
  v57[1] = v54;
  v56[2] = @"OS_ELIGIBILITY_DOMAIN_GREYMATTER";
  v53 = objc_opt_new();
  v57[2] = v53;
  v56[3] = @"OS_ELIGIBILITY_DOMAIN_XCODE_LLM";
  v52 = objc_opt_new();
  v57[3] = v52;
  v56[4] = @"OS_ELIGIBILITY_DOMAIN_SEARCH_MARKETPLACES";
  v51 = objc_opt_new();
  v57[4] = v51;
  v56[5] = @"OS_ELIGIBILITY_DOMAIN_SWIFT_ASSIST";
  v50 = objc_opt_new();
  v57[5] = v50;
  v56[6] = @"OS_ELIGIBILITY_DOMAIN_HYDROGEN";
  v49 = objc_opt_new();
  v57[6] = v49;
  v56[7] = @"OS_ELIGIBILITY_DOMAIN_HELIUM";
  v48 = objc_opt_new();
  v57[7] = v48;
  v56[8] = @"OS_ELIGIBILITY_DOMAIN_LITHIUM";
  v47 = objc_opt_new();
  v57[8] = v47;
  v56[9] = @"OS_ELIGIBILITY_DOMAIN_BERYLLIUM";
  v46 = objc_opt_new();
  v57[9] = v46;
  v56[10] = @"OS_ELIGIBILITY_DOMAIN_BORON";
  v45 = objc_opt_new();
  v57[10] = v45;
  v56[11] = @"OS_ELIGIBILITY_DOMAIN_CARBON";
  v44 = objc_opt_new();
  v57[11] = v44;
  v56[12] = @"OS_ELIGIBILITY_DOMAIN_NITROGEN";
  v43 = objc_opt_new();
  v57[12] = v43;
  v56[13] = @"OS_ELIGIBILITY_DOMAIN_OXYGEN";
  v42 = objc_opt_new();
  v57[13] = v42;
  v56[14] = @"OS_ELIGIBILITY_DOMAIN_FLUORINE";
  v41 = objc_opt_new();
  v57[14] = v41;
  v56[15] = @"OS_ELIGIBILITY_DOMAIN_NEON";
  v40 = objc_opt_new();
  v57[15] = v40;
  v56[16] = @"OS_ELIGIBILITY_DOMAIN_SODIUM";
  char v39 = objc_opt_new();
  v57[16] = v39;
  v56[17] = @"OS_ELIGIBILITY_DOMAIN_MAGNESIUM";
  v38 = objc_opt_new();
  v57[17] = v38;
  v56[18] = @"OS_ELIGIBILITY_DOMAIN_ALUMINUM";
  id v37 = objc_opt_new();
  v57[18] = v37;
  v56[19] = @"OS_ELIGIBILITY_DOMAIN_SILICON";
  v36 = objc_opt_new();
  v57[19] = v36;
  v56[20] = @"OS_ELIGIBILITY_DOMAIN_PHOSPHORUS";
  char v35 = objc_opt_new();
  v57[20] = v35;
  v56[21] = @"OS_ELIGIBILITY_DOMAIN_SULFUR";
  uint64_t v34 = objc_opt_new();
  v57[21] = v34;
  v56[22] = @"OS_ELIGIBILITY_DOMAIN_CHLORINE";
  id v33 = objc_opt_new();
  v57[22] = v33;
  v56[23] = @"OS_ELIGIBILITY_DOMAIN_ARGON";
  uint64_t v32 = objc_opt_new();
  v57[23] = v32;
  v56[24] = @"OS_ELIGIBILITY_DOMAIN_POTASSIUM";
  unint64_t v31 = objc_opt_new();
  v57[24] = v31;
  v56[25] = @"OS_ELIGIBILITY_DOMAIN_CALCIUM";
  __int16 v30 = objc_opt_new();
  v57[25] = v30;
  v56[26] = @"OS_ELIGIBILITY_DOMAIN_SCANDIUM";
  char v29 = objc_opt_new();
  v57[26] = v29;
  v56[27] = @"OS_ELIGIBILITY_DOMAIN_TITANIUM";
  __int16 v28 = objc_opt_new();
  v57[27] = v28;
  v56[28] = @"OS_ELIGIBILITY_DOMAIN_VANADIUM";
  unint64_t v27 = objc_opt_new();
  v57[28] = v27;
  v56[29] = @"OS_ELIGIBILITY_DOMAIN_CHROMIUM";
  id v26 = objc_opt_new();
  v57[29] = v26;
  v56[30] = @"OS_ELIGIBILITY_DOMAIN_MANGANESE";
  __int16 v24 = objc_opt_new();
  v57[30] = v24;
  v56[31] = @"OS_ELIGIBILITY_DOMAIN_IRON";
  BOOL v23 = objc_opt_new();
  v57[31] = v23;
  v56[32] = @"OS_ELIGIBILITY_DOMAIN_COBALT";
  __int16 v22 = objc_opt_new();
  v57[32] = v22;
  v56[33] = @"OS_ELIGIBILITY_DOMAIN_NICKEL";
  id v21 = objc_opt_new();
  v57[33] = v21;
  v56[34] = @"OS_ELIGIBILITY_DOMAIN_COPPER";
  __int16 v20 = objc_opt_new();
  v57[34] = v20;
  v56[35] = @"OS_ELIGIBILITY_DOMAIN_ZINC";
  __int16 v19 = objc_opt_new();
  v57[35] = v19;
  v56[36] = @"OS_ELIGIBILITY_DOMAIN_GALLIUM";
  id v18 = objc_opt_new();
  v57[36] = v18;
  v56[37] = @"OS_ELIGIBILITY_DOMAIN_GERMANIUM";
  id v17 = objc_opt_new();
  v57[37] = v17;
  v56[38] = @"OS_ELIGIBILITY_DOMAIN_ARSENIC";
  v2 = objc_opt_new();
  v57[38] = v2;
  v56[39] = @"OS_ELIGIBILITY_DOMAIN_SELENIUM";
  id v3 = objc_opt_new();
  v57[39] = v3;
  v56[40] = @"OS_ELIGIBILITY_DOMAIN_BROMINE";
  uint64_t v4 = objc_opt_new();
  v57[40] = v4;
  v56[41] = @"OS_ELIGIBILITY_DOMAIN_KRYPTON";
  uint64_t v5 = objc_opt_new();
  v57[41] = v5;
  v56[42] = @"OS_ELIGIBILITY_DOMAIN_RUBIDIUM";
  id v6 = objc_opt_new();
  v57[42] = v6;
  v56[43] = @"OS_ELIGIBILITY_DOMAIN_STRONTIUM";
  id v7 = objc_opt_new();
  v57[43] = v7;
  v56[44] = @"OS_ELIGIBILITY_DOMAIN_YTTRIUM";
  id v8 = objc_opt_new();
  v57[44] = v8;
  v56[45] = @"OS_ELIGIBILITY_DOMAIN_ZIRCONIUM";
  unsigned int v9 = objc_opt_new();
  v57[45] = v9;
  v56[46] = @"OS_ELIGIBILITY_DOMAIN_NIOBIUM";
  id v10 = objc_opt_new();
  v57[46] = v10;
  v56[47] = @"OS_ELIGIBILITY_DOMAIN_MOLYBDENUM";
  unsigned int v11 = objc_opt_new();
  v57[47] = v11;
  id v25 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:48];

  id v12 = +[GlobalConfiguration sharedInstance];
  LOBYTE(v4) = [v12 hasInternalContent];

  if (v4)
  {
    id v13 = [v25 mutableCopy];
    uint64_t v14 = objc_opt_new();
    [v13 setObject:v14 forKeyedSubscript:@"OS_ELIGIBILITY_DOMAIN_TEST"];

    id v15 = [v13 copy];
  }
  else
  {
    id v15 = v25;
  }

  return v15;
}

- (EligibilityEngine)init
{
  v28.receiver = self;
  v28.super_class = (Class)EligibilityEngine;
  v2 = [(EligibilityEngine *)&v28 init];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(EligibilityEngine *)v2 _createDefaultDomains];
    id v5 = [v4 mutableCopy];

    id v27 = 0;
    id v6 = [(EligibilityEngine *)v3 _loadDomainsWithError:&v27];
    id v7 = v27;
    id v8 = [v6 mutableCopy];

    if (v8)
    {
      unsigned int v9 = [v5 keysOfEntriesPassingTest:&stru_100038E90];
      id v10 = [v9 allObjects];
      [v8 removeObjectsForKeys:v10];

      [v5 addEntriesFromDictionary:v8];
    }
    else
    {
      unsigned int v11 = sub_10000D0EC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v30 = "-[EligibilityEngine init]";
        __int16 v31 = 2112;
        id v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Unable to load serialized domains, initing with empty values: %@", buf, 0x16u);
      }

      unsigned int v9 = v7;
      id v7 = 0;
    }

    id v12 = (NSDictionary *)[v5 copy];
    domains = v3->_domains;
    v3->_domains = v12;

    id v26 = v7;
    uint64_t v14 = [(EligibilityEngine *)v3 _loadOverridesWithError:&v26];
    id v15 = v26;

    if (!v14)
    {
      id v16 = sub_10000D0EC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v30 = "-[EligibilityEngine init]";
        __int16 v31 = 2112;
        id v32 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Unable to load serialized overrides, initing with no overrides: %@", buf, 0x16u);
      }

      uint64_t v14 = (EligibilityOverride *)objc_opt_new();
    }
    eligibilityOverrides = v3->_eligibilityOverrides;
    v3->_eligibilityOverrides = v14;
    id v18 = v14;

    uint64_t v19 = objc_opt_new();
    notificationsToSend = v3->_notificationsToSend;
    v3->_notificationsToSend = (NSMutableSet *)v19;

    id v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.eligibility.EligibilityEngine.internal", v21);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v22;

    __int16 v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v3 selector:"_currentLocaleDidChange:" name:NSCurrentLocaleDidChangeNotification object:0];
  }
  return v3;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023160;
  block[3] = &unk_100038E50;
  block[4] = a1;
  if (qword_10004C858 != -1) {
    dispatch_once(&qword_10004C858, block);
  }
  v2 = (void *)qword_10004C850;

  return v2;
}

@end