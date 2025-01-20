@interface VMTranscriptionAssetModelOperation
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isLID;
- (VMTranscriptionAssetModelOperation)initWithSpeechRecognizer:(id)a3;
- (id)operationCompletion;
- (void)cancel;
- (void)dealloc;
- (void)downloadAsset:(id)a3;
- (void)downloadAssetCatalog;
- (void)downloadAssetCatalogComplete:(BOOL)a3;
- (void)downloadAssetCatalogWithCompletion:(id)a3;
- (void)downloadAssetComplete:(BOOL)a3;
- (void)downloadComplete:(BOOL)a3;
- (void)install;
- (void)installAssetCatalogAndLanguages;
- (void)installAssetLanguages;
- (void)installLIDAsset;
- (void)setIsLID:(BOOL)a3;
- (void)setOperationCompletion:(id)a3;
- (void)start;
@end

@implementation VMTranscriptionAssetModelOperation

- (VMTranscriptionAssetModelOperation)initWithSpeechRecognizer:(id)a3
{
  id v4 = a3;
  v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Init transcription model install operation.", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)VMTranscriptionAssetModelOperation;
  v6 = [(VMSpeechRecognizerOperation *)&v8 initWithSpeechRecognizer:v4];

  if (v6)
  {
    [(VMTranscriptionAssetModelOperation *)v6 configureProgressWithUnitCount:1];
    v6->_isLID = 0;
  }
  return v6;
}

- (void)dealloc
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc transcription model install operation.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)VMTranscriptionAssetModelOperation;
  [(VMTranscriptionAssetModelOperation *)&v4 dealloc];
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)start
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting AssetModelOperation - begin", buf, 2u);
  }

  if ([(VMTranscriptionAssetModelOperation *)self isCancelled])
  {
    objc_super v4 = vm_vmd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting AssetModelOperation - cancelled", v7, 2u);
    }

    [(VMTranscriptionAssetModelOperation *)self willChangeValueForKey:@"isFinished"];
    self->_isFinished = 1;
    [(VMTranscriptionAssetModelOperation *)self didChangeValueForKey:@"isFinished"];
  }
  else
  {
    [(VMTranscriptionAssetModelOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_isExecuting = 1;
    [(VMTranscriptionAssetModelOperation *)self didChangeValueForKey:@"isExecuting"];
    if (self->_isLID) {
      [(VMTranscriptionAssetModelOperation *)self installLIDAsset];
    }
    else {
      [(VMTranscriptionAssetModelOperation *)self install];
    }
    v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting AssetModelOperation - end", v6, 2u);
    }
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VMTranscriptionAssetModelOperation;
  [(VMTranscriptionAssetModelOperation *)&v4 cancel];
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelled transcription model install operation %@.", buf, 0xCu);
  }
}

- (void)install
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting transcription model install operation.", buf, 2u);
  }

  id v4 = [(VMSpeechRecognizerOperation *)self speechRecognizer];
  if (v4
    || (id v5 = objc_alloc((Class)SFSpeechRecognizer),
        [(VMSpeechRecognizerOperation *)self locale],
        v6 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v5 initWithLocale:v6],
        v6,
        v4))
  {
    v7 = vm_vmd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [v4 supportsOnDeviceRecognition];
      CFStringRef v9 = @"NO";
      if (v8) {
        CFStringRef v9 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "supportsOnDeviceRecognition %@", buf, 0xCu);
    }

    if ([v4 supportsOnDeviceRecognition])
    {
      v10 = vm_vmd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Speech dictation model is available already.", buf, 2u);
      }

      v11 = [(VMTranscriptionAssetModelOperation *)self operationCompletion];

      if (v11)
      {
        v12 = [(VMTranscriptionAssetModelOperation *)self operationCompletion];
        v12[2](v12, 1, 0);
      }
    }
    else
    {
      objc_initWeak(&location, self);
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
      if (_os_feature_enabled_impl())
      {
        v14 = vm_vmd_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "VMTranscriptionAssetModelOperation.install: Flag lvmExpansionLiveOnEnabled enabled", buf, 2u);
        }

        v15 = [(VMSpeechRecognizerOperation *)self speechRecognizer];
        v16 = [v15 locale];
        v17 = [v16 languageIdentifier];
      }
      else
      {
        v17 = @"en-US";
      }
      v18 = vm_vmd_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v32 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "VMTranscriptionAssetModelOperation.install: Fetching assets for %@", buf, 0xCu);
      }

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000390EC;
      v28[3] = &unk_1000C20A0;
      v29 = v17;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000391AC;
      v23[3] = &unk_1000C20C8;
      v19 = v29;
      v24 = v19;
      objc_copyWeak(&v27, &location);
      v25 = self;
      v20 = v13;
      v26 = v20;
      +[SFSpeechAssetManager fetchAssetsForLanguage:v19 progress:v28 completion:v23];
      dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v4 = [(VMTranscriptionAssetModelOperation *)self operationCompletion];

    if (v4)
    {
      v22 = [(VMTranscriptionAssetModelOperation *)self operationCompletion];
      v22[2](v22, 0, 0);

      id v4 = 0;
    }
  }
  v21 = vm_vmd_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Finished transcription model install operation.", buf, 2u);
  }
}

- (void)installLIDAsset
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting LanguageID model install operation.", buf, 2u);
  }

  objc_initWeak(&location, self);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  dispatch_semaphore_t v13 = buf;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100039594;
  v8[3] = &unk_1000C2130;
  objc_copyWeak(&v11, &location);
  v10 = buf;
  v8[4] = self;
  id v5 = v4;
  CFStringRef v9 = v5;
  +[SFSpeechAssetManager fetchLanguageDetectorAssetsForClientIdentifier:@"com.apple.visualvoicemail" progress:&stru_1000C2108 completion:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished LanguageID model install operation.", v7, 2u);
  }

  objc_destroyWeak(&v11);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)downloadComplete:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Download SFSpeechAsset model complete, success %@", (uint8_t *)&v7, 0xCu);
  }

  [(VMTranscriptionAssetModelOperation *)self willChangeValueForKey:@"isExecuting"];
  [(VMTranscriptionAssetModelOperation *)self willChangeValueForKey:@"isFinished"];
  self->_isExecuting = 0;
  self->_isFinished = 1;
  [(VMTranscriptionAssetModelOperation *)self didChangeValueForKey:@"isFinished"];
  [(VMTranscriptionAssetModelOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (void)installAssetLanguages
{
  id v3 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.EmbeddedSpeech"];
  [v3 returnTypes:2];
  [v3 addKeyValuePair:@"Language" with:@"en-US"];
  id v4 = [v3 queryMetaDataSync];
  id v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = [v3 results];
    *(_DWORD *)buf = 134218242;
    id v27 = v4;
    __int16 v28 = 2112;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "installAssetLanguages query result %ld, assets %@", buf, 0x16u);
  }
  if (v4)
  {
    [(VMTranscriptionAssetModelOperation *)self downloadComplete:0];
  }
  else
  {
    v20 = self;
    id v21 = v3;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    int v7 = [v3 results];
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          dispatch_semaphore_t v13 = [v12 assetId];
          uint64_t v14 = [v12 attributes];
          char v15 = [v14 objectForKey:@"Language"];

          unint64_t v16 = (unint64_t)[v12 state];
          unint64_t v17 = v16 & 0xFFFFFFFFFFFFFFFELL;
          v18 = vm_vmd_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            CFStringRef v19 = @"NO";
            if (v17 == 2) {
              CFStringRef v19 = @"YES";
            }
            id v27 = v13;
            __int16 v28 = 2112;
            v29 = v15;
            __int16 v30 = 2048;
            unint64_t v31 = v16;
            __int16 v32 = 2112;
            CFStringRef v33 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Asset %@, language %@, state %ld, installed %@", buf, 0x2Au);
          }

          if (v17 != 2)
          {
            [(VMTranscriptionAssetModelOperation *)v20 downloadAsset:v12];

            goto LABEL_19;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    [(VMTranscriptionAssetModelOperation *)v20 downloadComplete:1];
LABEL_19:
    id v3 = v21;
  }
}

- (void)installAssetCatalogAndLanguages
{
  id v3 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.EmbeddedSpeech"];
  [v3 returnTypes:4];
  id v4 = [v3 queryMetaDataSync];
  id v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "installAssetCatalogAndLanguages query result %ld", (uint8_t *)&v6, 0xCu);
  }

  if (v4 == (id)2) {
    [(VMTranscriptionAssetModelOperation *)self downloadAssetCatalog];
  }
  else {
    [(VMTranscriptionAssetModelOperation *)self installAssetLanguages];
  }
}

- (void)downloadAssetCatalogWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Downloading asset catalog", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100039D3C;
  v6[3] = &unk_1000C2158;
  id v7 = v3;
  id v5 = v3;
  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.EmbeddedSpeech" then:v6];
}

- (void)downloadAssetCatalogComplete:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Download Asset catalog complete, success %@", (uint8_t *)&v7, 0xCu);
  }

  if (v3) {
    [(VMTranscriptionAssetModelOperation *)self installAssetLanguages];
  }
  else {
    [(VMTranscriptionAssetModelOperation *)self downloadComplete:0];
  }
}

- (void)downloadAssetCatalog
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100039F0C;
  v2[3] = &unk_1000C2180;
  v2[4] = self;
  [(VMTranscriptionAssetModelOperation *)self downloadAssetCatalogWithCompletion:v2];
}

- (void)downloadAssetComplete:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Download Asset complete, success %@", (uint8_t *)&v7, 0xCu);
  }

  [(VMTranscriptionAssetModelOperation *)self downloadComplete:v3];
}

- (void)downloadAsset:(id)a3
{
  id v4 = a3;
  id v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Downloading asset %@", buf, 0xCu);
  }

  [v4 attachProgressCallBack:&stru_1000C21C0];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003A254;
  v6[3] = &unk_1000C21E8;
  void v6[4] = self;
  [v4 startDownload:v6];
}

- (id)operationCompletion
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setOperationCompletion:(id)a3
{
}

- (BOOL)isLID
{
  return self->_isLID;
}

- (void)setIsLID:(BOOL)a3
{
  self->_isLID = a3;
}

- (void).cxx_destruct
{
}

@end