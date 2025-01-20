@interface VMAWDReporter
+ (id)sharedInstance;
- (AWDServerConnection)serverConnection;
- (OS_dispatch_queue)queue;
- (VMAWDReporter)init;
- (id)VMAWDTranscriptionFailureReasonAsString:(unint64_t)a3;
- (id)VMLanguageIDFailureReasonAsString:(unint64_t)a3;
- (id)prepareConfidenceValue:(id)a3;
- (void)_reportMetricWithID:(unsigned int)a3 metric:(id)a4;
- (void)powerlog:(id)a3 eventData:(id)a4;
- (void)reportCustomGreetingFailedWithReason:(unint64_t)a3;
- (void)reportCustomGreetingSaved;
- (void)reportServiceAccountStateChanged:(int)a3;
- (void)reportServiceBeaconMaxedOut:(unsigned int)a3 mcc:(id)a4 mnc:(id)a5;
- (void)reportVoicemailDownloadedWithDuration:(int)a3 slotID:(unsigned int)a4 mcc:(id)a5 mnc:(id)a6;
- (void)reportVoicemailProcessed:(id)a3 transcriptionSuccess:(BOOL)a4 transcriptionFailureReason:(id)a5 assetLocale:(id)a6 transcriptionConfidence:(id)a7 lidSuccess:(BOOL)a8 lidFailureReason:(id)a9 isEnglish:(BOOL)a10 dominantLocale:(id)a11 dominantLocaleConfidence:(id)a12 altLocaleDict:(id)a13;
- (void)reportVoicemailReceivedNotification:(unsigned int)a3 mcc:(id)a4 mnc:(id)a5 notificationType:(unsigned int)a6 slotID:(unsigned int)a7;
- (void)reportVoicemailTranscriptionAttempted;
- (void)reportVoicemailTranscriptionCompleted;
- (void)reportVoicemailTranscriptionFailedWithReason:(unint64_t)a3;
- (void)reportVoicemailTranscriptionProcessed:(id)a3 success:(BOOL)a4 reason:(id)a5 assetLocale:(id)a6 confidence:(id)a7;
- (void)reportVoicemailTranscriptionRatedAccurate:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setServerConnection:(id)a3;
@end

@implementation VMAWDReporter

+ (id)sharedInstance
{
  if (qword_1000E0780 != -1) {
    dispatch_once(&qword_1000E0780, &stru_1000C1298);
  }
  v2 = (void *)qword_1000E0778;
  return v2;
}

- (VMAWDReporter)init
{
  v9.receiver = self;
  v9.super_class = (Class)VMAWDReporter;
  v2 = [(VMAWDReporter *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.visualvoicemail.vvm.awdreporter", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = [(VMAWDReporter *)v2 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003C74;
    block[3] = &unk_1000C12C0;
    v8 = v2;
    dispatch_async(v5, block);
  }
  return v2;
}

- (void)powerlog:(id)a3 eventData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  PLLogRegisteredEvent();
  v7 = vm_vmd_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reporting powerlog event %@ with data %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)reportServiceAccountStateChanged:(int)a3
{
  if (!arc4random_uniform(0xAu))
  {
    id v5 = objc_alloc_init(AWDVisualVoicemailServiceAccountStateUpdated);
    [(AWDVisualVoicemailServiceAccountStateUpdated *)v5 setServiceState:a3];
    id v6 = vm_vmd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v10 = a3;
      __int16 v11 = 2048;
      unint64_t v12 = [(AWDVisualVoicemailServiceAccountStateUpdated *)v5 timestamp];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reporting metric for voicemail service account state changed: %d timestamp: %llu", buf, 0x12u);
    }

    [(VMAWDReporter *)self _reportMetricWithID:4718594 metric:v5];
    int v8 = v5;
    v7 = v5;
    AnalyticsSendEventLazy();
  }
}

- (void)reportServiceBeaconMaxedOut:(unsigned int)a3 mcc:(id)a4 mnc:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = objc_alloc_init(AWDVisualVoicemailBeaconMaxedOut);
  __int16 v11 = vm_vmd_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v16 = a3;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2048;
    unint64_t v22 = [(AWDVisualVoicemailBeaconMaxedOut *)v10 timestamp];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Reporting metric for voicemail beacon maxed out for slot: %u mcc: '%@' mnc: '%@' timestamp: %llu", buf, 0x26u);
  }

  [(VMAWDReporter *)self _reportMetricWithID:4718595 metric:v10];
  v14 = v8;
  id v12 = v9;
  id v13 = v8;
  AnalyticsSendEventLazy();
}

- (void)reportCustomGreetingSaved
{
  dispatch_queue_t v3 = objc_alloc_init(AWDVisualVoicemailCustomGreetingUpdated);
  v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = [(AWDVisualVoicemailCustomGreetingUpdated *)v3 timestamp];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reporting metric for voicemail custom greeting saved timestamp: %llu", (uint8_t *)&v5, 0xCu);
  }

  [(VMAWDReporter *)self _reportMetricWithID:4718596 metric:v3];
}

- (void)reportCustomGreetingFailedWithReason:(unint64_t)a3
{
  int v5 = objc_alloc_init(AWDVisualVoicemailCustomGreetingUpdated);
  [(AWDVisualVoicemailCustomGreetingUpdated *)v5 setFailureReason:a3];
  unint64_t v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    unint64_t v8 = [(AWDVisualVoicemailCustomGreetingUpdated *)v5 failureReason];
    __int16 v9 = 2048;
    unint64_t v10 = [(AWDVisualVoicemailCustomGreetingUpdated *)v5 timestamp];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reporting metric for voicemail custom greeting failed with reason: %llu timestamp: %llu", (uint8_t *)&v7, 0x16u);
  }

  [(VMAWDReporter *)self _reportMetricWithID:4718596 metric:v5];
}

- (void)reportVoicemailDownloadedWithDuration:(int)a3 slotID:(unsigned int)a4 mcc:(id)a5 mnc:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init(AWDVisualVoicemailDownloaded);
  [(AWDVisualVoicemailDownloaded *)v12 setLengthInSeconds:(int)v8];
  id v13 = vm_vmd_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    unint64_t v19 = [(AWDVisualVoicemailDownloaded *)v12 lengthInSeconds];
    __int16 v20 = 1024;
    unsigned int v21 = a4;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2048;
    unint64_t v27 = [(AWDVisualVoicemailDownloaded *)v12 timestamp];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Reporting metric for voicemail download length: %llu for slot: %u mcc: '%@' mnc: '%@' timestamp: %llu", buf, 0x30u);
  }

  [(VMAWDReporter *)self _reportMetricWithID:4718592 metric:v12];
  AnalyticsSendEventLazy();
  CFStringRef v16 = @"duration";
  v14 = +[NSNumber numberWithInt:v8];
  __int16 v17 = v14;
  v15 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [(VMAWDReporter *)self powerlog:@"VoicemailDuration" eventData:v15];
}

- (void)reportVoicemailReceivedNotification:(unsigned int)a3 mcc:(id)a4 mnc:(id)a5 notificationType:(unsigned int)a6 slotID:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a5;
  v14 = objc_alloc_init(AWDVisualVoicemailReceivedNotification);
  [(AWDVisualVoicemailReceivedNotification *)v14 setAccountType:v10];
  [(AWDVisualVoicemailReceivedNotification *)v14 setMcc:v12];
  [(AWDVisualVoicemailReceivedNotification *)v14 setMnc:v13];
  [(AWDVisualVoicemailReceivedNotification *)v14 setNotificationType:v8];
  [(AWDVisualVoicemailReceivedNotification *)v14 setSubsid:v7];
  v15 = vm_vmd_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110402;
    int v18 = v10;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v13;
    __int16 v23 = 1024;
    int v24 = v8;
    __int16 v25 = 1024;
    int v26 = v7;
    __int16 v27 = 2048;
    unint64_t v28 = [(AWDVisualVoicemailReceivedNotification *)v14 timestamp];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Reporting metric for voicemail notification accauntState: %u mcc: '%@' mnc: '%@' notificationType: %u slot: %u timestamp: %llu", buf, 0x32u);
  }

  [(VMAWDReporter *)self _reportMetricWithID:4718598 metric:v14];
  CFStringRef v16 = v14;
  AnalyticsSendEventLazy();
}

- (void)_reportMetricWithID:(unsigned int)a3 metric:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(VMAWDReporter *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A84;
  block[3] = &unk_1000C1358;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)reportVoicemailTranscriptionRatedAccurate:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = objc_alloc_init(AWDVisualVoicemailTranscriptionRated);
  [(AWDVisualVoicemailTranscriptionRated *)v5 setAccurate:v3];
  id v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reporting metric for transcription accuracy rating", buf, 2u);
  }

  [(VMAWDReporter *)self _reportMetricWithID:4718593 metric:v5];
  id v8 = v5;
  uint64_t v7 = v5;
  AnalyticsSendEventLazy();
}

- (void)reportVoicemailTranscriptionAttempted
{
  BOOL v3 = objc_alloc_init(AWDVisualVoicemailTranscriptionStatusChanged);
  [(AWDVisualVoicemailTranscriptionStatusChanged *)v3 setStatus:1];
  v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reporting metric for transcription attempted", buf, 2u);
  }

  [(VMAWDReporter *)self _reportMetricWithID:4718597 metric:v3];
  id v6 = v3;
  int v5 = v3;
  AnalyticsSendEventLazy();
}

- (void)reportVoicemailTranscriptionCompleted
{
  BOOL v3 = objc_alloc_init(AWDVisualVoicemailTranscriptionStatusChanged);
  [(AWDVisualVoicemailTranscriptionStatusChanged *)v3 setStatus:2];
  v4 = vm_vmd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reporting metric for transcription completed", buf, 2u);
  }

  [(VMAWDReporter *)self _reportMetricWithID:4718597 metric:v3];
  id v6 = v3;
  int v5 = v3;
  AnalyticsSendEventLazy();
}

- (void)reportVoicemailTranscriptionFailedWithReason:(unint64_t)a3
{
  int v5 = objc_alloc_init(AWDVisualVoicemailTranscriptionStatusChanged);
  [(AWDVisualVoicemailTranscriptionStatusChanged *)v5 setStatus:3];
  [(AWDVisualVoicemailTranscriptionStatusChanged *)v5 setFailureReason:a3];
  id v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reporting metric for transcription failed with reason %lu", buf, 0xCu);
  }

  [(VMAWDReporter *)self _reportMetricWithID:4718597 metric:v5];
  id v8 = v5;
  uint64_t v7 = v5;
  AnalyticsSendEventLazy();
}

- (void)reportVoicemailTranscriptionProcessed:(id)a3 success:(BOOL)a4 reason:(id)a5 assetLocale:(id)a6 confidence:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  CFStringRef v16 = vm_vmd_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Reporting metric for voicemail transcription processed", buf, 2u);
  }

  id v17 = v12;
  id v22 = v17;
  LOBYTE(v27) = a4;
  id v18 = v13;
  __int16 v23 = v18;
  int v24 = self;
  id v19 = v14;
  __int16 v25 = v19;
  id v20 = v15;
  int v26 = v20;
  AnalyticsSendEventLazy();
  if (v18
    && !a4
    && objc_msgSend(v18, "intValue", _NSConcreteStackBlock, 3221225472, sub_100005468, &unk_1000C1380, v17, v18, v24, v19, v20, v27) == 5)
  {
    __int16 v21 = +[VMABCReporter sharedInstance];
    [v21 reportIssueType:@"VoicemailTranscription" description:@"VMTranscriptionFailureReasonOther"];
  }
}

- (void)reportVoicemailProcessed:(id)a3 transcriptionSuccess:(BOOL)a4 transcriptionFailureReason:(id)a5 assetLocale:(id)a6 transcriptionConfidence:(id)a7 lidSuccess:(BOOL)a8 lidFailureReason:(id)a9 isEnglish:(BOOL)a10 dominantLocale:(id)a11 dominantLocaleConfidence:(id)a12 altLocaleDict:(id)a13
{
  id v30 = a3;
  id v29 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a11;
  id v20 = a12;
  id v21 = a13;
  id v22 = vm_vmd_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Reporting metric for voicemail processed", buf, 2u);
  }

  if (v21 && (unint64_t)[v21 count] >= 4)
  {
    __int16 v23 = [v21 keysSortedByValueWithOptions:16 usingComparator:&stru_1000C13C0];
    id v38 = v30;
    id v39 = v29;
    id v40 = v16;
    id v41 = v17;
    BOOL v24 = a8;
    id v42 = v18;
    id v43 = v19;
    id v44 = v20;
    id v45 = v21;
    id v25 = v23;
    AnalyticsSendEventLazy();
  }
  else
  {
    id v31 = v30;
    id v32 = v29;
    id v33 = v16;
    id v34 = v17;
    BOOL v24 = a8;
    id v35 = v18;
    id v36 = v19;
    id v37 = v20;
    AnalyticsSendEventLazy();

    id v25 = v31;
  }

  if (v18 && !v24)
  {
    if ([v18 intValue] == 5)
    {
      int v26 = +[VMABCReporter sharedInstance];
      [v26 reportIssueType:@"VoicemailLanguageID" description:@"VMLanguageIDFailureReasonOther"];
    }
    if ([v18 intValue] == 1)
    {
      uint64_t v27 = +[VMABCReporter sharedInstance];
      [v27 reportIssueType:@"VoicemailLanguageID" description:@"VMLanguageIDFailureReasonMissingModelAsset"];
    }
  }
}

- (id)prepareConfidenceValue:(id)a3
{
  if (a3)
  {
    [a3 floatValue];
    int v5 = +[NSNumber numberWithInt:(int)(float)(v4 * 1000000.0)];
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (id)VMAWDTranscriptionFailureReasonAsString:(unint64_t)a3
{
  if (a3 >= 6)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(Unknown VMTranscriptionFailureReason: %lu)", a3];
  }
  else
  {
    uint64_t v3 = *(&off_1000C1478 + a3);
  }
  return v3;
}

- (id)VMLanguageIDFailureReasonAsString:(unint64_t)a3
{
  if (a3 >= 6)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(Unknown VMLanguageIDFailureReason: %lu)", a3];
  }
  else
  {
    uint64_t v3 = *(&off_1000C14A8 + a3);
  }
  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (AWDServerConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end