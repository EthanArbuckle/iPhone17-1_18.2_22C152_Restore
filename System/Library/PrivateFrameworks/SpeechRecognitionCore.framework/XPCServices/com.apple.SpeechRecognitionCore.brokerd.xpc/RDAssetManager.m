@interface RDAssetManager
+ (id)_assetQueryForLanguage:(id)a3;
+ (id)sharedInstance;
- (BOOL)_startedDownloadingEmbeddedSpeechAsset:(id)a3 withUrgency:(BOOL)a4 error:(id *)a5;
- (BOOL)catalogDownloadInProgress;
- (BOOL)sendCallback;
- (NSMutableArray)peersRequestingDownloadProgress;
- (NSMutableArray)requestedLanguagesForDownload;
- (OS_dispatch_queue)queue;
- (RDAssetManager)init;
- (id)_errorStringForCancelDownloadResult:(int64_t)a3;
- (id)_errorStringForDownloadResult:(int64_t)a3;
- (id)_errorStringForMAOperationResult:(int64_t)a3;
- (id)_errorStringForPurgeResult:(int64_t)a3;
- (id)_errorStringForQueryResult:(int64_t)a3;
- (id)_installedAssetForLanguage:(id)a3 error:(id *)a4;
- (id)_installedAssetFromFoundAssets:(id)a3 language:(id)a4 error:(id *)a5;
- (id)_installedLocalAssetForLanguage:(id)a3 error:(id *)a4;
- (id)_stateStringForAsset:(id)a3;
- (id)copyInstallationStatusForLangaugesWithError:(id *)a3;
- (id)copyInstalledAssetPathForLangaugeWithError:(id)a3 error:(id *)a4;
- (id)copyInstalledQuasarModelPathForLanguage:(id)a3 error:(id *)a4;
- (id)installedAssetSizeWithError:(id *)a3;
- (id)purgeInstalledAssetsWithError:(id *)a3;
- (id)queryAndCopyInstallationStatusForLangaugesWithError:(id *)a3;
- (void)_cancelDownloadForLangaugeWithError:(id)a3 withError:(id *)a4;
- (void)_fetchRemoteAssetForLanguage:(id)a3;
- (void)_sendDownloadCallbackDictionaryWithLanguage:(id)a3 downloadPhase:(__CFString *)a4 timeRemaining:(float)a5 bytesWritten:(float)a6 bytesTotal:(float)a7 error:(id)a8;
- (void)addPeerForCallback:(id)a3;
- (void)cancelDownloadForLanguage:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)kickCatalogDownloadWithUrgency:(BOOL)a3;
- (void)removePeerFromCallback:(id)a3;
- (void)sendMessageToClient:(__CFDictionary *)a3;
- (void)setCatalogDownloadInProgress:(BOOL)a3;
- (void)setPeersRequestingDownloadProgress:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestedLanguagesForDownload:(id)a3;
@end

@implementation RDAssetManager

+ (id)sharedInstance
{
  if (qword_10001CE58 != -1) {
    dispatch_once(&qword_10001CE58, &stru_100018818);
  }
  return (id)qword_10001CE50;
}

- (RDAssetManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)RDAssetManager;
  v2 = [(RDAssetManager *)&v5 init];
  if (v2)
  {
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.embeddedspeech.RDAssetManager", 0);
    [(RDAssetManager *)v2 setCatalogDownloadInProgress:0];
    [(RDAssetManager *)v2 setRequestedLanguagesForDownload:+[NSMutableArray array]];
    [(RDAssetManager *)v2 setPeersRequestingDownloadProgress:+[NSMutableArray array]];
    [+[NSDate distantPast] timeIntervalSinceReferenceDate];
    v2->_lastCatalogDownload = v3;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RDAssetManager;
  [(RDAssetManager *)&v3 dealloc];
}

- (void)kickCatalogDownloadWithUrgency:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005BB4;
  v4[3] = &unk_100018890;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)queue, v4);
}

- (id)copyInstallationStatusForLangaugesWithError:(id *)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = sub_100006194;
  v18 = sub_1000061A4;
  uint64_t v19 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_100006194;
  v12 = sub_1000061A4;
  uint64_t v13 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000061B0;
  block[3] = &unk_1000188B8;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (a3) {
    *a3 = (id)v9[5];
  }
  BOOL v5 = (void *)v15[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)queryAndCopyInstallationStatusForLangaugesWithError:(id *)a3
{
  id v5 = +[RDAssetManager _assetQueryForLanguage:0];
  if (!v5)
  {
    uint64_t v10 = RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not create asset query!", buf, 2u);
    }
    return 0;
  }
  v6 = v5;
  [v5 returnTypes:1];
  [v6 setDoNotBlockBeforeFirstUnlock:1];
  [v6 setDoNotBlockOnNetworkStatus:1];
  id v7 = [v6 queryMetaDataSync];
  if (v7)
  {
    id v8 = v7;
    if (v7 == (id)2)
    {
      v9 = RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Could not find catalog! Attempting to kick off download...", buf, 2u);
      }
      [(RDAssetManager *)self kickCatalogDownloadWithUrgency:1];
    }
    else
    {
      v38 = RXOSLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v50 = [(RDAssetManager *)self _errorStringForQueryResult:v8];
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "MobileAsset query failed : error = %@", buf, 0xCu);
      }
      if (a3)
      {
        CFStringRef v55 = @"MAQueryResult";
        id v56 = [(RDAssetManager *)self _errorStringForQueryResult:v8];
        *a3 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"kRXAssetDownloadErrorDomain", 101, +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1]);
      }
    }

    return 0;
  }
  v11 = RXOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found Catalog!", buf, 2u);
  }
  [(RDAssetManager *)self kickCatalogDownloadWithUrgency:0];
  id v12 = [v6 results];
  id v13 = +[NSMutableDictionary dictionary];
  if (v12)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v14 = [v12 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v46;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v46 != v16) {
            objc_enumerationMutation(v12);
          }
          v18 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v17);
          id v19 = objc_msgSend(v18, "_es_language");
          if ((objc_msgSend(objc_msgSend(v13, "objectForKey:", v19), "hasPrefix:", @"Version:") & 1) == 0)
          {
            id v20 = [v13 objectForKey:v19];
            if (([v20 isEqualToString:@"Installing"] & 1) == 0
              && ([v20 isEqualToString:@"Waiting to Install"] & 1) == 0)
            {
              id v21 = objc_msgSend(v18, "_es_status");
              CFStringRef v22 = @"Installing";
              switch((unint64_t)v21)
              {
                case 0uLL:
                  CFStringRef v22 = @"Not Supported";
                  goto LABEL_25;
                case 1uLL:
                  CFStringRef v22 = @"Not Installing";
                  goto LABEL_25;
                case 2uLL:
                  CFStringRef v22 = @"Waiting to Install";
                  goto LABEL_25;
                case 3uLL:
                  goto LABEL_25;
                case 4uLL:
                  id v40 = objc_msgSend(v18, "_es_quasarDir", @"Installing");
                  id v24 = objc_msgSend(v18, "_es_quasarModelPath");
                  if (objc_msgSend(v18, "_es_isCompatibleWithThisDevice")
                    && sub_1000067F4(v24))
                  {
                    CFStringRef v22 = +[NSString stringWithFormat:@"Version: %@", v40];
LABEL_25:
                    v23 = v13;
                  }
                  else
                  {
                    v23 = v13;
                    CFStringRef v22 = @"Not Supported";
                  }
                  [v23 setObject:v22 forKey:v19];
                  break;
                default:
                  CFStringRef v22 = @"Unknown";
                  goto LABEL_25;
              }
            }
          }
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v25 = [v12 countByEnumeratingWithState:&v45 objects:v54 count:16];
        id v15 = v25;
      }
      while (v25);
    }
  }

  v26 = +[NSUserDefaults standardUserDefaults];
  v27 = [(NSUserDefaults *)v26 stringArrayForKey:@"InstalledLanguages"];
  if (v27) {
    v28 = v27;
  }
  else {
    v28 = (NSArray *)&__NSArray0__struct;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v29 = [(NSArray *)v28 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v29)
  {
    id v30 = v29;
    id v31 = 0;
    uint64_t v32 = *(void *)v42;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(v28);
        }
        uint64_t v34 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        if (![v13 objectForKey:v34])
        {
          if (!v31) {
            id v31 = [(NSArray *)v28 mutableCopy];
          }
          [v31 removeObject:v34];
        }
      }
      id v30 = [(NSArray *)v28 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v30);
    if (v31)
    {
      v35 = RXOSLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [(NSArray *)v28 componentsJoinedByString:@", "];
        id v37 = [v31 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412546;
        v50 = v36;
        __int16 v51 = 2112;
        id v52 = v37;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Previously installed offline language(s) removed; installed list: [%@] -> [%@]",
          buf,
          0x16u);
      }
      [(NSUserDefaults *)v26 setObject:v31 forKey:@"InstalledLanguages"];
      [(NSUserDefaults *)v26 synchronize];
    }
  }
  return v13;
}

- (id)copyInstalledAssetPathForLangaugeWithError:(id)a3 error:(id *)a4
{
  id v7 = +[RDAssetManager _assetQueryForLanguage:0];
  [v7 returnTypes:1];
  id v8 = [v7 queryMetaDataSync];
  if (v8)
  {
    id v9 = v8;
    if (v8 != (id)2)
    {
      uint64_t v10 = RXOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = [(RDAssetManager *)self _errorStringForQueryResult:v9];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MobileAsset query failed for copyInstalledAssetPathForLangaugeWithError : error = %@", buf, 0xCu);
      }
      if (a4)
      {
        CFStringRef v28 = @"MAQueryResult";
        id v29 = [(RDAssetManager *)self _errorStringForQueryResult:v9];
        *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"kRXAssetDownloadErrorDomain", 101, +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1]);
      }
    }

    return 0;
  }
  else
  {
    id v12 = [v7 results];
    if (v12
      && (id v13 = v12,
          long long v25 = 0u,
          long long v26 = 0u,
          long long v23 = 0u,
          long long v24 = 0u,
          (id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16]) != 0))
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
LABEL_11:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
        id v19 = objc_msgSend(v18, "_es_language");
        id v20 = objc_msgSend(v18, "_es_status");
        if ([v19 isEqualToString:a3] && v20 == (id)4)
        {
          id v11 = objc_msgSend(v18, "_es_quasarModelPath");
          if (objc_msgSend(v18, "_es_isCompatibleWithThisDevice"))
          {
            if (sub_1000067F4(v11)) {
              break;
            }
          }
        }
        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v15) {
            goto LABEL_11;
          }
          goto LABEL_23;
        }
      }
    }
    else
    {
LABEL_23:
      id v11 = 0;
    }
  }
  return v11;
}

- (void)cancelDownloadForLanguage:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    *(void *)id v12 = 0;
    id v13 = v12;
    uint64_t v14 = 0x3052000000;
    id v15 = sub_100006194;
    uint64_t v16 = sub_1000061A4;
    uint64_t v17 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006E58;
    block[3] = &unk_1000188E0;
    block[4] = self;
    block[5] = v6;
    block[6] = v12;
    dispatch_sync((dispatch_queue_t)queue, block);
    if (a4)
    {
      *a4 = (id)*((void *)v13 + 5);
      id v8 = RXOSLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = *a4;
        *(_DWORD *)buf = 138412290;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error in cancelling download: %@", buf, 0xCu);
      }
    }
    _Block_object_dispose(v12, 8);
  }
  else
  {
    uint64_t v10 = RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Returning nil for nil language", v12, 2u);
    }
  }
}

- (void)_cancelDownloadForLangaugeWithError:(id)a3 withError:(id *)a4
{
  id v7 = +[RDAssetManager _assetQueryForLanguage:](RDAssetManager, "_assetQueryForLanguage:");
  [v7 returnTypes:4];
  id v8 = [v7 queryMetaDataSync];
  id v29 = v7;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = [(RDAssetManager *)self _errorStringForQueryResult:v9];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MobileAsset query failed : error = %@", buf, 0xCu);
    }
    if (a4)
    {
      if ([(RDAssetManager *)self sendCallback])
      {
        id v11 = [(RDAssetManager *)self _errorStringForQueryResult:v9];
        LODWORD(v12) = -1.0;
        LODWORD(v13) = -1.0;
        LODWORD(v14) = -1.0;
        [(RDAssetManager *)self _sendDownloadCallbackDictionaryWithLanguage:a3 downloadPhase:@"CancelFailed" timeRemaining:v11 bytesWritten:v12 bytesTotal:v13 error:v14];
      }
      CFStringRef v35 = @"MAQueryResult";
      id v36 = [(RDAssetManager *)self _errorStringForQueryResult:v9];
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"kRXAssetDownloadErrorDomain", 103, +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1]);
    }
  }
  else
  {
    id v15 = [v7 results];
    if (v15)
    {
      uint64_t v16 = v15;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v31;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (objc_msgSend(v21, "_es_isCompatibleWithThisDevice"))
            {
              [v21 refreshState];
              id v22 = [v21 cancelDownloadSync];
              if (v22) {
                CFStringRef v23 = @"CancelFailed";
              }
              else {
                CFStringRef v23 = @"Cancelled";
              }
              if ([(RDAssetManager *)self sendCallback])
              {
                id v24 = objc_msgSend(v21, "_es_language");
                id v25 = [(RDAssetManager *)self _errorStringForCancelDownloadResult:v22];
                LODWORD(v26) = -1.0;
                LODWORD(v27) = -1.0;
                LODWORD(v28) = -1.0;
                [(RDAssetManager *)self _sendDownloadCallbackDictionaryWithLanguage:v24 downloadPhase:v23 timeRemaining:v25 bytesWritten:v26 bytesTotal:v27 error:v28];
              }
              CFRelease(v23);
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v18);
      }
    }
  }
}

- (id)copyInstalledQuasarModelPathForLanguage:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    *(void *)buf = 0;
    id v20 = buf;
    uint64_t v21 = 0x3052000000;
    id v22 = sub_100006194;
    CFStringRef v23 = sub_1000061A4;
    uint64_t v24 = 0;
    uint64_t v13 = 0;
    double v14 = &v13;
    uint64_t v15 = 0x3052000000;
    uint64_t v16 = sub_100006194;
    id v17 = sub_1000061A4;
    uint64_t v18 = 0;
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000073B4;
    v12[3] = &unk_100018908;
    v12[4] = self;
    v12[5] = v6;
    v12[6] = buf;
    v12[7] = &v13;
    dispatch_sync((dispatch_queue_t)queue, v12);
    id v8 = v20;
    id v9 = (void *)*((void *)v20 + 5);
    if (a4 && !v9)
    {
      *a4 = (id)v14[5];
      id v9 = (void *)*((void *)v8 + 5);
    }
    if (v9)
    {
      if (a4)
      {
        *a4 = 0;
        id v9 = (void *)*((void *)v8 + 5);
      }
    }
    else if (a4)
    {
      NSErrorUserInfoKey v25 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v26 = @"No models installed yet";
      id v9 = 0;
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"kRXAssetDownloadErrorDomain", 100, +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1]);
    }
    else
    {
      id v9 = 0;
    }
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v10 = RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Returning no model path for nil language", buf, 2u);
    }
    return 0;
  }
  return v9;
}

- (void)_fetchRemoteAssetForLanguage:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = +[RDAssetManager _assetQueryForLanguage:a3];
  [v5 returnTypes:2];
  id v6 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000075E8;
  v7[3] = &unk_100018958;
  v7[4] = self;
  v7[5] = v5;
  v7[6] = a3;
  [v5 queryMetaData:v7];
}

- (id)_installedAssetForLanguage:(id)a3 error:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!a3)
  {
    uint64_t v15 = RXOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Returning no installed asset for nil language", (uint8_t *)&v20, 2u);
    }
    return 0;
  }
  id v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = [(NSUserDefaults *)v7 stringArrayForKey:@"InstalledLanguages"];
  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = (NSArray *)&__NSArray0__struct;
  }
  id v10 = [(RDAssetManager *)self _installedLocalAssetForLanguage:a3 error:a4];
  unsigned int v11 = objc_msgSend(v10, "_es_isInstalled");
  unsigned int v12 = [(NSArray *)v9 containsObject:a3];
  if (!v11)
  {
    if (v12)
    {
      id v16 = [(NSArray *)v9 mutableCopy];
      [v16 removeObject:a3];
      id v17 = RXOSLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412546;
        id v21 = a3;
        __int16 v22 = 2112;
        CFStringRef v23 = (NSString *)[v16 componentsJoinedByString:@", "];
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Previously installed offline language (%@) removed; installed list is now: [%@]",
          (uint8_t *)&v20,
          0x16u);
      }
      [(NSUserDefaults *)v7 setObject:v16 forKey:@"InstalledLanguages"];

      [(NSUserDefaults *)v7 synchronize];
    }
    if (objc_msgSend(v10, "_es_isDownloading"))
    {
      if (!a4) {
        return 0;
      }
    }
    else
    {
      unsigned __int8 v18 = [(RDAssetManager *)self _startedDownloadingEmbeddedSpeechAsset:v10 withUrgency:1 error:a4];
      id v10 = 0;
      if (!a4 || (v18 & 1) == 0) {
        return v10;
      }
    }
    id v10 = 0;
    *a4 = +[NSError errorWithDomain:@"kRXAssetDownloadErrorDomain" code:100 userInfo:0];
    return v10;
  }
  if ((v12 & 1) == 0)
  {
    uint64_t v13 = [(NSArray *)v9 arrayByAddingObject:a3];
    double v14 = RXOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = a3;
      __int16 v22 = 2112;
      CFStringRef v23 = [(NSArray *)v13 componentsJoinedByString:@", "];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Recording newly installed offline language (%@) installed list is now: [%@]", (uint8_t *)&v20, 0x16u);
    }
    [(NSUserDefaults *)v7 setObject:v13 forKey:@"InstalledLanguages"];
    [(NSUserDefaults *)v7 synchronize];
  }
  return v10;
}

- (id)_installedAssetFromFoundAssets:(id)a3 language:(id)a4 error:(id *)a5
{
  id v41 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (!v6)
  {
    id v8 = 0;
    id v9 = 0;
    goto LABEL_22;
  }
  id v7 = v6;
  id v8 = 0;
  id v9 = 0;
  uint64_t v10 = *(void *)v50;
  do
  {
    unsigned int v11 = 0;
    do
    {
      if (*(void *)v50 != v10) {
        objc_enumerationMutation(a3);
      }
      unsigned int v12 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v11);
      if (objc_msgSend(v12, "_es_isCompatibleWithThisDevice", v41))
      {
        uint64_t v13 = v12;
        if (v8)
        {
          if (objc_msgSend(v8, "_es_compareByVersion:", v12) == (id)-1) {
            uint64_t v13 = v12;
          }
          else {
            uint64_t v13 = v8;
          }
        }
        if (!objc_msgSend(v12, "_es_isInstalled")) {
          goto LABEL_15;
        }
        if (v9)
        {
          if (objc_msgSend(v9, "_es_compareByVersion:", v12) == (id)-1) {
            id v9 = v12;
          }
LABEL_15:
          id v8 = v13;
          goto LABEL_16;
        }
        id v8 = v13;
        id v9 = v12;
      }
LABEL_16:
      unsigned int v11 = (char *)v11 + 1;
    }
    while (v7 != v11);
    id v14 = [a3 countByEnumeratingWithState:&v49 objects:v62 count:16];
    id v7 = v14;
  }
  while (v14);
LABEL_22:
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v61, 16, v41);
  if (!v15) {
    goto LABEL_43;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v46;
  while (2)
  {
    uint64_t v18 = 0;
    while (2)
    {
      if (*(void *)v46 != v17) {
        objc_enumerationMutation(a3);
      }
      uint64_t v19 = *(void **)(*((void *)&v45 + 1) + 8 * v18);
      BOOL v20 = v19 == v8 || v19 == v9;
      if (!v20
        && objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * v18), "_es_isCompatibleWithThisDevice"))
      {
        if (objc_msgSend(v19, "_es_isDownloading"))
        {
          id v21 = [v19 cancelDownloadSync];
          if (v21)
          {
            id v22 = v21;
            CFStringRef v23 = RXOSLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              id v24 = objc_msgSend(v19, "_es_description");
              id v25 = [(RDAssetManager *)self _errorStringForCancelDownloadResult:v22];
              *(_DWORD *)buf = 138412546;
              id v56 = v24;
              __int16 v57 = 2112;
              id v58 = v25;
              CFStringRef v26 = v23;
              double v27 = "Error canceling download of (%@) before fetching newer version: %@";
              goto LABEL_40;
            }
          }
        }
        else if (objc_msgSend(v19, "_es_isInstalled"))
        {
          id v28 = [v19 purgeSync];
          if (v28)
          {
            id v29 = v28;
            long long v30 = RXOSLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              id v31 = objc_msgSend(v19, "_es_description");
              id v32 = [(RDAssetManager *)self _errorStringForPurgeResult:v29];
              *(_DWORD *)buf = 138412546;
              id v56 = v31;
              __int16 v57 = 2112;
              id v58 = v32;
              CFStringRef v26 = v30;
              double v27 = "Error purging (%@) before fetching newer version: %@";
LABEL_40:
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x16u);
            }
          }
        }
      }
      if (v16 != (id)++v18) {
        continue;
      }
      break;
    }
    id v16 = [a3 countByEnumeratingWithState:&v45 objects:v61 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_43:
  long long v33 = RXOSLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = [a3 count];
    id v35 = objc_msgSend(v8, "_es_description");
    *(_DWORD *)buf = 134218498;
    id v56 = v34;
    __int16 v57 = 2112;
    id v58 = v42;
    __int16 v59 = 2112;
    id v60 = v35;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Found %lu asset(s) for %@, with latest being (%@)", buf, 0x20u);
  }
  if (v8 && v8 != v9)
  {
    id v36 = RXOSLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v56 = v8;
      __int16 v57 = 2048;
      id v58 = v9;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Starting a download because %p != %p", buf, 0x16u);
    }
    if ([(RDAssetManager *)self _startedDownloadingEmbeddedSpeechAsset:v8 withUrgency:v9 == 0 error:a5])
    {
      if (a5)
      {
        uint64_t v37 = 100;
        id v38 = 0;
        goto LABEL_57;
      }
    }
    else if (a5)
    {
      id v39 = *a5;
      if (*a5)
      {
        NSErrorUserInfoKey v53 = NSUnderlyingErrorKey;
        id v54 = v39;
        id v38 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      }
      else
      {
        id v38 = 0;
      }
      uint64_t v37 = 101;
LABEL_57:
      *a5 = +[NSError errorWithDomain:@"kRXAssetDownloadErrorDomain" code:v37 userInfo:v38];
    }
  }
  return v9;
}

- (id)_installedLocalAssetForLanguage:(id)a3 error:(id *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = RXOSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v22 = 138412290;
    *(void *)&v22[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", v22, 0xCu);
  }
  id v8 = +[RDAssetManager _assetQueryForLanguage:a3];
  [v8 returnTypes:2];
  [v8 setDoNotBlockOnNetworkStatus:1];
  [v8 setDoNotBlockBeforeFirstUnlock:1];
  id v9 = [v8 queryMetaDataSync];
  if (v9)
  {
    id v10 = v9;
    unsigned int v11 = RXOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(RDAssetManager *)self _errorStringForQueryResult:v10];
      *(_DWORD *)id v22 = 138412290;
      *(void *)&v22[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MobileAsset is having trouble with queryMetaDataSync: %@", v22, 0xCu);
    }
    if (a4)
    {
      CFStringRef v25 = @"MAQueryResult";
      id v26 = [(RDAssetManager *)self _errorStringForQueryResult:v10];
      uint64_t v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"kRXAssetDownloadErrorDomain", 101, +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1]);
      id result = 0;
LABEL_8:
      *a4 = v13;
      return result;
    }
    return 0;
  }
  id v15 = [v8 results];
  if (!v15)
  {
    uint64_t v17 = RXOSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v22 = 138543618;
      *(void *)&v22[4] = a3;
      __int16 v23 = 2114;
      id v24 = v8;
      uint64_t v18 = "MobileAsset said it succeeded but it didn't for %{public}@: query=%{public}@";
      uint64_t v19 = v17;
      uint32_t v20 = 22;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, v22, v20);
    }
    return 0;
  }
  id v16 = v15;
  if (![v15 count])
  {
    id v21 = RXOSLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v22 = 138412290;
      *(void *)&v22[4] = v8;
      uint64_t v18 = "No assets were found for query: %@";
      uint64_t v19 = v21;
      uint32_t v20 = 12;
      goto LABEL_18;
    }
    return 0;
  }
  *(void *)id v22 = 0;
  id result = [(RDAssetManager *)self _installedAssetFromFoundAssets:v16 language:a3 error:v22];
  if (a4 && !result)
  {
    uint64_t v13 = *(NSError **)v22;
    goto LABEL_8;
  }
  return result;
}

+ (id)_assetQueryForLanguage:(id)a3
{
  v4 = RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
  id v5 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.EmbeddedSpeech"];
  id v6 = v5;
  if (a3) {
    [v5 addKeyValuePair:@"Language" with:a3];
  }
  return v6;
}

- (BOOL)_startedDownloadingEmbeddedSpeechAsset:(id)a3 withUrgency:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = RXOSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = objc_msgSend(a3, "_es_description");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Downloading %@", buf, 0xCu);
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000873C;
  v31[3] = &unk_100018980;
  v31[4] = self;
  v31[5] = a3;
  if (objc_msgSend(a3, "_es_isInstalled"))
  {
    id v10 = RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Asset is already installed, no need to start download", buf, 2u);
    }
    LOBYTE(v11) = 1;
  }
  else
  {
    id v12 = [a3 state];
    unsigned int v11 = 0;
    uint64_t v13 = 0;
    switch((unint64_t)v12)
    {
      case 1uLL:
        long long v30 = 0;
        unsigned int v11 = [a3 spaceCheck:&v30];
        id v14 = RXOSLog();
        id v15 = v14;
        if (v11)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            id v33 = v30;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Asset requires %lld bytes, starting download", buf, 0xCu);
          }
          [a3 attachProgressCallBack:v31];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_100008930;
          v29[3] = &unk_1000189A8;
          v29[4] = self;
          v29[5] = a3;
          [a3 startDownload:sub_100005DAC(v6) then:v29];
          goto LABEL_18;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          id v33 = v30;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Not enough space to download asset, size=%{public}lld", buf, 0xCu);
        }
        uint64_t v13 = +[NSError errorWithDomain:@"kRXAssetDownloadErrorDomain" code:101 userInfo:&off_10001A080];
        if ([(RDAssetManager *)self sendCallback])
        {
          id v24 = objc_msgSend(a3, "_es_language");
          LODWORD(v25) = -1.0;
          LODWORD(v26) = -1.0;
          LODWORD(v27) = -1.0;
          [(RDAssetManager *)self _sendDownloadCallbackDictionaryWithLanguage:v24 downloadPhase:@"DownloadFailed" timeRemaining:@"Not enough space" bytesWritten:v25 bytesTotal:v26 error:v27];
        }
        break;
      case 2uLL:
        break;
      case 3uLL:
        uint64_t v18 = RXOSLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Asset is no longer in the catalog, purging", buf, 2u);
        }
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100008AA8;
        v28[3] = &unk_1000189A8;
        v28[4] = [a3 description];
        v28[5] = self;
        [a3 purge:v28];
        goto LABEL_17;
      case 4uLL:
        uint64_t v19 = RXOSLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Asset download is already queued and in progress", buf, 2u);
        }
        uint64_t v13 = 0;
        unsigned int v11 = 1;
        break;
      default:
        id v16 = v12;
        uint64_t v17 = RXOSLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          id v33 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unexpected asset state %ld", buf, 0xCu);
        }
LABEL_17:
        unsigned int v11 = 0;
LABEL_18:
        uint64_t v13 = 0;
        break;
    }
    if (a5) {
      *a5 = v13;
    }
    uint32_t v20 = RXOSLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [a3 state];
      *(_DWORD *)buf = 134218498;
      if (v11) {
        id v22 = 0;
      }
      else {
        id v22 = v13;
      }
      id v33 = v21;
      __int16 v34 = 1024;
      unsigned int v35 = v11;
      __int16 v36 = 2112;
      uint64_t v37 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Asset download state=%ld, success=%d, error=%@", buf, 0x1Cu);
    }
  }
  return v11;
}

- (id)installedAssetSizeWithError:(id *)a3
{
  return sub_100008BC0(a3, (uint64_t)&stru_1000189E8);
}

- (id)purgeInstalledAssetsWithError:(id *)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000;
  unsigned int v11 = sub_100006194;
  id v12 = sub_1000061A4;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008F0C;
  v7[3] = &unk_100018A10;
  v7[4] = &v8;
  v4 = sub_100008BC0(a3, (uint64_t)v7);
  if (a3)
  {
    id v5 = (void *)v9[5];
    if (v5) {
      *a3 = v5;
    }
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)addPeerForCallback:(id)a3
{
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  [(NSMutableArray *)[(RDAssetManager *)self peersRequestingDownloadProgress] addObject:a3];
  objc_sync_exit(peersRequestingDownloadProgress);
}

- (void)removePeerFromCallback:(id)a3
{
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  [(NSMutableArray *)[(RDAssetManager *)self peersRequestingDownloadProgress] removeObject:a3];
  objc_sync_exit(peersRequestingDownloadProgress);
}

- (BOOL)sendCallback
{
  v2 = self;
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  LOBYTE(v2) = [(NSMutableArray *)[(RDAssetManager *)v2 peersRequestingDownloadProgress] count] != 0;
  objc_sync_exit(peersRequestingDownloadProgress);
  return (char)v2;
}

- (void)_sendDownloadCallbackDictionaryWithLanguage:(id)a3 downloadPhase:(__CFString *)a4 timeRemaining:(float)a5 bytesWritten:(float)a6 bytesTotal:(float)a7 error:(id)a8
{
  float v41 = a6;
  float valuePtr = a5;
  float v40 = a7;
  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    uint64_t v13 = Mutable;
    if (a3)
    {
      CFArrayAppendValue(Mutable, a3);
      CFDictionaryRef v14 = (const __CFDictionary *)RXGetAssetFallbackLocales();
      CFIndex Count = CFDictionaryGetCount(v14);
      if (Count >= 1)
      {
        CFIndex v16 = Count;
        uint64_t v17 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
        CFDictionaryGetKeysAndValues(v14, v17, 0);
        uint64_t v18 = 0;
        CFIndex v39 = v16;
        do
        {
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v14, v17[v18]);
          if (Value)
          {
            CFStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, Value);
            if (MutableCopy)
            {
              id v21 = (__CFString *)MutableCopy;
              CFDictionaryRef v22 = v14;
              id v23 = a8;
              id v24 = self;
              double v25 = a4;
              v43.length = CFStringGetLength(MutableCopy);
              v43.location = 0;
              CFStringFindAndReplace(v21, @"_", @"-", v43, 0);
              id v26 = a3;
              if (CFEqual(v21, (CFStringRef)a3))
              {
                CFStringRef v27 = CFStringCreateMutableCopy(0, 0, (CFStringRef)v17[v18]);
                if (v27)
                {
                  id v28 = (__CFString *)v27;
                  v44.length = CFStringGetLength(v27);
                  v44.location = 0;
                  CFStringFindAndReplace(v28, @"_", @"-", v44, 0);
                  CFArrayAppendValue(v13, v28);
                  CFRelease(v28);
                }
              }
              CFRelease(v21);
              a3 = v26;
              a4 = v25;
              self = v24;
              a8 = v23;
              CFDictionaryRef v14 = v22;
              CFIndex v16 = v39;
            }
          }
          ++v18;
        }
        while (v16 != v18);
        free(v17);
      }
    }
    else
    {
      CFArrayAppendValue(Mutable, &stru_100019158);
    }
    CFIndex v29 = CFArrayGetCount(v13);
    if (v29 >= 1)
    {
      CFIndex v30 = v29;
      for (CFIndex i = 0; i != v30; ++i)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v13, i);
        id v33 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (CFStringCompare(ValueAtIndex, &stru_100019158, 0))
        {
          CFStringRef Copy = CFStringCreateCopy(0, ValueAtIndex);
          CFDictionaryAddValue(v33, @"Language", Copy);
          CFRelease(Copy);
        }
        else
        {
          CFDictionaryAddValue(v33, @"Language", kCFNull);
        }
        CFDictionaryAddValue(v33, @"Phase", a4);
        CFNumberRef v35 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
        CFDictionaryAddValue(v33, @"TimeRemaining", v35);
        CFRelease(v35);
        CFNumberRef v36 = CFNumberCreate(0, kCFNumberFloatType, &v41);
        CFDictionaryAddValue(v33, @"BytesWritten", v36);
        CFRelease(v36);
        CFNumberRef v37 = CFNumberCreate(0, kCFNumberFloatType, &v40);
        CFDictionaryAddValue(v33, @"BytesTotal", v37);
        CFRelease(v37);
        if (a8)
        {
          CFStringRef v38 = CFStringCreateCopy(0, (CFStringRef)a8);
          CFDictionaryAddValue(v33, @"Error", v38);
          CFRelease(v38);
        }
        else
        {
          CFDictionaryAddValue(v33, @"Error", kCFNull);
        }
        [(RDAssetManager *)self sendMessageToClient:v33];
        CFRelease(v33);
      }
    }
    CFRelease(v13);
  }
}

- (void)sendMessageToClient:(__CFDictionary *)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  id v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_int64(v4, "msg", 601);
  xpc_dictionary_set_value(v4, "downloadStatus", v5);
  xpc_release(v5);
  peersRequestingDownloadProgress = self->_peersRequestingDownloadProgress;
  objc_sync_enter(peersRequestingDownloadProgress);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(RDAssetManager *)self peersRequestingDownloadProgress];
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      for (CFIndex i = 0; i != v8; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        xpc_connection_send_message(*(xpc_connection_t *)(*((void *)&v11 + 1) + 8 * i), v4);
      }
      id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  objc_sync_exit(peersRequestingDownloadProgress);
  xpc_release(v4);
}

- (id)_errorStringForCancelDownloadResult:(int64_t)a3
{
  if ((unint64_t)a3 >= 8) {
    return +[NSString stringWithFormat:@"Unknown result: %d", a3];
  }
  else {
    return *(&off_100018A30 + a3);
  }
}

- (id)_errorStringForDownloadResult:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x24) {
    return +[NSString stringWithFormat:@"Unknown result: %d", a3];
  }
  else {
    return *(&off_100018A70 + a3);
  }
}

- (id)_errorStringForQueryResult:(int64_t)a3
{
  if (unint64_t)a3 < 0xD && ((0x17FFu >> a3)) {
    return *(&off_100018B90 + a3);
  }
  else {
    return +[NSString stringWithFormat:@"Unknown result: %d", a3];
  }
}

- (id)_errorStringForPurgeResult:(int64_t)a3
{
  if ((unint64_t)a3 >= 0xC) {
    return +[NSString stringWithFormat:@"Unknown result: %d", a3];
  }
  else {
    return *(&off_100018BF8 + a3);
  }
}

- (id)_stateStringForAsset:(id)a3
{
  id v4 = [a3 state];
  if ((unint64_t)v4 >= 7) {
    return +[NSString stringWithFormat:@"Unknown state: %@", a3];
  }
  else {
    return *(&off_100018C58 + (void)v4);
  }
}

- (id)_errorStringForMAOperationResult:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"successful";
  }
  else {
    return *(&off_100018C90 + a3 - 1);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)requestedLanguagesForDownload
{
  return self->_requestedLanguagesForDownload;
}

- (void)setRequestedLanguagesForDownload:(id)a3
{
}

- (BOOL)catalogDownloadInProgress
{
  return self->_catalogDownloadInProgress;
}

- (void)setCatalogDownloadInProgress:(BOOL)a3
{
  self->_catalogDownloadInProgress = a3;
}

- (NSMutableArray)peersRequestingDownloadProgress
{
  return self->_peersRequestingDownloadProgress;
}

- (void)setPeersRequestingDownloadProgress:(id)a3
{
}

@end