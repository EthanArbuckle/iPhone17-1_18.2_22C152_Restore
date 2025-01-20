@interface VMVoicemailTranscriptionController
- (BOOL)cache_isTranscribing;
- (BOOL)isDictationModelInstalled;
- (BOOL)isLanguageIDModelInstalled;
- (BOOL)isTranscribing;
- (NSLocale)locale;
- (NSMapTable)delegateToQueue;
- (NSOperationQueue)speechAnalyzerOperationQueue;
- (NSOperationQueue)transcriptionOperationQueue;
- (NSProgress)transcriptionProgress;
- (OS_dispatch_queue)serialDispatchQueue;
- (VMNetworkObserver)networkObserver;
- (VMSpeechRecognizer)speechRecognizer;
- (VMTranscriptionAssetModelOperation)assetModelOperation;
- (VMTranscriptionService)transcriptionService;
- (VMVoicemailTranscriptionController)init;
- (VMVoicemailTranscriptionController)initWithLocale:(id)a3;
- (VMVoicemailTranscriptionController)initWithSpeechRecognizer:(id)a3;
- (id)assetModelOperationWithCompletion:(id)a3;
- (id)getTranscriptionLocaleIdentifier;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)cancelQueuedTranscriptions;
- (void)dealloc;
- (void)handleCPNetworkObserverNetworkReachableNotification:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performSynchronousBlock:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeNetworkReachableObserver;
- (void)reportDictationProblemForFileAtURL:(id)a3;
- (void)requestAssetModelInstallation;
- (void)requestAssetModelOperationWithCompletion:(id)a3;
- (void)requestDatabaseSanitization;
- (void)requestLanguageIDModelOperationWithCompletion:(id)a3;
- (void)retrieveDictationResultForFileAtURL:(id)a3 queuePriority:(int64_t)a4 duration:(double)a5 transcriptionBeginCallback:(id)a6 completion:(id)a7;
- (void)retrieveLanguageIDResultForFileAtURL:(id)a3 queuePriority:(int64_t)a4 completion:(id)a5;
- (void)setAssetModelOperation:(id)a3;
- (void)setNetworkObserver:(id)a3;
- (void)setTranscriptionService:(id)a3;
@end

@implementation VMVoicemailTranscriptionController

- (VMVoicemailTranscriptionController)init
{
  return 0;
}

- (VMVoicemailTranscriptionController)initWithLocale:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SFSpeechRecognizer) initWithLocale:v4];

  if (v5)
  {
    self = [(VMVoicemailTranscriptionController *)self initWithSpeechRecognizer:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (VMVoicemailTranscriptionController)initWithSpeechRecognizer:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VMVoicemailTranscriptionController;
  id v5 = [(VMVoicemailTranscriptionController *)&v22 init];
  if (v5)
  {
    v6 = vm_vmd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v5;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ Creating with Speech Recognizer %@", buf, 0x16u);
    }

    pthread_mutex_init((pthread_mutex_t *)(v5 + 8), 0);
    v5[72] = 0;
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 bundleIdentifier];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = +[NSString stringWithFormat:@"%@.%@", v8, v10];
    v12 = NSStringFromSelector("serialDispatchQueue");
    v13 = +[NSString stringWithFormat:@"%@.%@", v11, v12];

    id v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    v16 = (void *)*((void *)v5 + 17);
    *((void *)v5 + 17) = v15;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v5 + 17), off_1000E0518, v5, 0);
    v17 = *((void *)v5 + 17);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100045324;
    block[3] = &unk_1000C11B8;
    v20 = v5;
    id v21 = v4;
    dispatch_async(v17, block);
  }
  return (VMVoicemailTranscriptionController *)v5;
}

- (void)dealloc
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ Deleting", buf, 0xCu);
  }

  [(VMNetworkObserver *)self->_networkObserver removeNetworkReachableObserver:self];
  [(NSOperationQueue *)self->_transcriptionOperationQueue cancelAllOperations];
  transcriptionOperationQueue = self->_transcriptionOperationQueue;
  id v5 = NSStringFromSelector("operationCount");
  [(NSOperationQueue *)transcriptionOperationQueue removeObserver:self forKeyPath:v5 context:off_1000E0520];

  [(NSOperationQueue *)self->_speechAnalyzerOperationQueue cancelAllOperations];
  transcriptionProgress = self->_transcriptionProgress;
  v7 = NSStringFromSelector("fractionCompleted");
  [(NSProgress *)transcriptionProgress removeObserver:self forKeyPath:v7 context:off_1000E0528];

  v8 = self->_transcriptionProgress;
  v9 = NSStringFromSelector("totalUnitCount");
  [(NSProgress *)v8 removeObserver:self forKeyPath:v9 context:off_1000E0530];

  pthread_mutex_destroy(&self->fCache_lock);
  v10.receiver = self;
  v10.super_class = (Class)VMVoicemailTranscriptionController;
  [(VMVoicemailTranscriptionController *)&v10 dealloc];
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045788;
  block[3] = &unk_1000C11E0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100045890;
  v7[3] = &unk_1000C11B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)getTranscriptionLocaleIdentifier
{
  v2 = [(VMVoicemailTranscriptionController *)self locale];
  v3 = [v2 localeIdentifier];

  return v3;
}

- (void)reportDictationProblemForFileAtURL:(id)a3
{
  id v4 = a3;
  id v5 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000459E4;
  v7[3] = &unk_1000C11B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)retrieveDictationResultForFileAtURL:(id)a3 queuePriority:(int64_t)a4 duration:(double)a5 transcriptionBeginCallback:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100045C28;
  v28[3] = &unk_1000C24F0;
  v28[4] = self;
  id v15 = v12;
  id v29 = v15;
  int64_t v32 = a4;
  double v33 = a5;
  id v16 = v14;
  id v30 = v16;
  id v31 = v13;
  id v17 = v13;
  v18 = objc_retainBlock(v28);
  v19 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100045D80;
  v23[3] = &unk_1000C2540;
  id v24 = v15;
  __int16 v25 = self;
  id v26 = v18;
  id v27 = v16;
  id v20 = v16;
  id v21 = v18;
  id v22 = v15;
  dispatch_async(v19, v23);
}

- (void)retrieveLanguageIDResultForFileAtURL:(id)a3 queuePriority:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000462C0;
  v22[3] = &unk_1000C2568;
  id v10 = v8;
  id v23 = v10;
  int64_t v26 = a4;
  id v11 = v9;
  id v24 = self;
  id v25 = v11;
  id v12 = objc_retainBlock(v22);
  id v13 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100046344;
  v17[3] = &unk_1000C2540;
  id v18 = v10;
  v19 = self;
  id v20 = v12;
  id v21 = v11;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(v13, v17);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000467F4;
  v14[3] = &unk_1000C25B0;
  id v15 = v10;
  id v16 = self;
  id v17 = v9;
  id v18 = a6;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, v14);
}

- (BOOL)isDictationModelInstalled
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100047014;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  v4[5] = &v5;
  [(VMVoicemailTranscriptionController *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isLanguageIDModelInstalled
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004712C;
  v4[3] = &unk_1000C25D8;
  v4[4] = &v5;
  [(VMVoicemailTranscriptionController *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)cache_isTranscribing
{
  char v2 = self;
  p_fCache_lock = &self->fCache_lock;
  pthread_mutex_lock(&self->fCache_lock);
  LOBYTE(v2) = v2->fCache_IsTranscribing;
  pthread_mutex_unlock(p_fCache_lock);
  return (char)v2;
}

- (BOOL)isTranscribing
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004725C;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  void v4[5] = &v5;
  [(VMVoicemailTranscriptionController *)self performSynchronousBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)cancelQueuedTranscriptions
{
  v3 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000472F8;
  block[3] = &unk_1000C12C0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)requestAssetModelInstallation
{
  v3 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000473E8;
  block[3] = &unk_1000C12C0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)requestDatabaseSanitization
{
  v3 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000476B4;
  block[3] = &unk_1000C12C0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (VMTranscriptionAssetModelOperation)assetModelOperation
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = sub_10004781C;
  id v9 = sub_10004782C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100047834;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  void v4[5] = &v5;
  [(VMVoicemailTranscriptionController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (VMTranscriptionAssetModelOperation *)v2;
}

- (NSLocale)locale
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = sub_10004781C;
  id v9 = sub_10004782C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100047980;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  void v4[5] = &v5;
  [(VMVoicemailTranscriptionController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSLocale *)v2;
}

- (VMNetworkObserver)networkObserver
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = sub_10004781C;
  id v9 = sub_10004782C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100047A94;
  v4[3] = &unk_1000C1230;
  v4[4] = self;
  void v4[5] = &v5;
  [(VMVoicemailTranscriptionController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (VMNetworkObserver *)v2;
}

- (void)setNetworkObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047BB8;
  v7[3] = &unk_1000C11B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (VMSpeechRecognizer)speechRecognizer
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10004781C;
  id v9 = sub_10004782C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100047DEC;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  void v4[5] = &v5;
  [(VMVoicemailTranscriptionController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (VMSpeechRecognizer *)v2;
}

- (NSOperationQueue)transcriptionOperationQueue
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10004781C;
  id v9 = sub_10004782C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100047F00;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  void v4[5] = &v5;
  [(VMVoicemailTranscriptionController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSOperationQueue *)v2;
}

- (NSOperationQueue)speechAnalyzerOperationQueue
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10004781C;
  id v9 = sub_10004782C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100048014;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  void v4[5] = &v5;
  [(VMVoicemailTranscriptionController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSOperationQueue *)v2;
}

- (NSProgress)transcriptionProgress
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10004781C;
  id v9 = sub_10004782C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100048128;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  void v4[5] = &v5;
  [(VMVoicemailTranscriptionController *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSProgress *)v2;
}

- (void)removeNetworkReachableObserver
{
  v3 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    networkObserver = self->_networkObserver;
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = networkObserver;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Removing network observer %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = self->_networkObserver;
  if (v6) {
    [(VMNetworkObserver *)v6 removeNetworkReachableObserver:self];
  }
}

- (void)handleCPNetworkObserverNetworkReachableNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (VMVoicemailTranscriptionController *)objc_opt_class();
    int v7 = v6;
    id v8 = [v4 name];
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    CFStringRef v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v17, 0x16u);
  }
  __int16 v9 = [v4 name];
  unsigned int v10 = [v9 isEqualToString:CPNetworkObserverNetworkReachableNotification];

  if (v10)
  {
    id v11 = [v4 userInfo];
    id v12 = [v11 objectForKeyedSubscript:CPNetworkObserverReachable];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
      id v14 = vm_vmd_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v15 = [v13 BOOLValue];
        CFStringRef v16 = @"not reachable";
        if (v15) {
          CFStringRef v16 = @"reachable";
        }
        int v17 = 138412546;
        id v18 = self;
        __int16 v19 = 2112;
        CFStringRef v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: Network observer is %@", (uint8_t *)&v17, 0x16u);
      }

      if ([v13 BOOLValue]) {
        [(VMVoicemailTranscriptionController *)self requestAssetModelInstallation];
      }
    }
  }
}

- (id)assetModelOperationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [VMTranscriptionAssetModelOperation alloc];
  id v6 = [(VMVoicemailTranscriptionController *)self locale];
  int v7 = [(VMSpeechRecognizerOperation *)v5 initWithLocale:v6];

  [(VMTranscriptionAssetModelOperation *)v7 setOperationCompletion:v4];
  return v7;
}

- (void)requestAssetModelOperationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initiating request to install asset model.", (uint8_t *)&v18, 2u);
  }

  [(VMVoicemailTranscriptionController *)self removeNetworkReachableObserver];
  int v7 = [(VMVoicemailTranscriptionController *)self assetModelOperation];
  if (v7)
  {
    id v8 = vm_vmd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isExecuting]);
      int v18 = 138412546;
      __int16 v19 = v7;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asset model operation exists %@ and is executing (%@).", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    unsigned int v10 = [(VMVoicemailTranscriptionController *)self networkObserver];
    unsigned int v11 = [v10 isNetworkReachable];

    if (v11)
    {
      id v12 = [(VMVoicemailTranscriptionController *)self assetModelOperationWithCompletion:v4];
      [(VMVoicemailTranscriptionController *)self setAssetModelOperation:v12];
      id v13 = [(VMVoicemailTranscriptionController *)self transcriptionProgress];
      objc_msgSend(v13, "setTotalUnitCount:", (char *)objc_msgSend(v13, "totalUnitCount") + 1);

      id v14 = [(VMVoicemailTranscriptionController *)self transcriptionProgress];
      unsigned int v15 = [v12 progress];
      [v14 addChild:v15 withPendingUnitCount:1];

      CFStringRef v16 = [(VMVoicemailTranscriptionController *)self transcriptionOperationQueue];
      [v16 addOperation:v12];
    }
    else
    {
      int v17 = vm_vmd_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Suspending request for asset model operation due to network being unreachable.", (uint8_t *)&v18, 2u);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

- (void)requestLanguageIDModelOperationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initiating request to install Language ID model.", buf, 2u);
  }

  int v7 = [(VMVoicemailTranscriptionController *)self networkObserver];
  unsigned int v8 = [v7 isNetworkReachable];

  if (v8)
  {
    __int16 v9 = [(VMVoicemailTranscriptionController *)self assetModelOperationWithCompletion:v4];
    [v9 setIsLID:1];
    unsigned int v10 = [(VMVoicemailTranscriptionController *)self speechAnalyzerOperationQueue];
    [v10 addOperation:v9];
  }
  else
  {
    unsigned int v11 = vm_vmd_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Suspending request for asset model operation due to network being unreachable.", v12, 2u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific(off_1000E0518) == self)
  {
    id v6 = (void (*)(void))*((void *)a3 + 2);
    int v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    int v7 = [(VMVoicemailTranscriptionController *)self serialDispatchQueue];
    dispatch_sync(v7, v5);
  }
}

- (void)setAssetModelOperation:(id)a3
{
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (VMTranscriptionService)transcriptionService
{
  return self->_transcriptionService;
}

- (void)setTranscriptionService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptionService, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_speechAnalyzerOperationQueue, 0);
  objc_storeStrong((id *)&self->_transcriptionProgress, 0);
  objc_storeStrong((id *)&self->_transcriptionOperationQueue, 0);
  objc_storeStrong((id *)&self->_speechRecognizer, 0);
  objc_storeStrong((id *)&self->_networkObserver, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_destroyWeak((id *)&self->_assetModelOperation);
}

@end