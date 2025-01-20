@interface VMTranscriptionService
+ (BOOL)isSupportedTranscriptionLanguageCode:(id)a3;
+ (BOOL)isTranscriptionAvailable;
+ (NSArray)transcriptionLanguageCodes;
- (BOOL)writeDataToFile:(id)a3 fileData:(id)a4;
- (OS_dispatch_queue)queue;
- (VMTranscriptionService)init;
- (VMVoicemailTranscriptionController)transcriptionController;
- (VMVoicemailTranscriptionTask)transcriptionTask;
- (id)readDataFromFile:(id)a3;
- (unint64_t)languageIDFailureReasonForError:(id)a3;
- (unint64_t)transcriptionFailureReasonForError:(id)a3;
- (void)handleAFLanguageCodeDidChangeNotification:(id)a3;
- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3;
- (void)loadTranscriptionService;
- (void)performSynchronousBlock:(id)a3;
- (void)processTranscriptForRecordWithIdentifier:(int)a3 priority:(int64_t)a4 completion:(id)a5;
- (void)reportTranscriptionProblemForRecord:(void *)a3;
- (void)reportTranscriptionRatedAccurate:(BOOL)a3 forRecord:(void *)a4;
- (void)setTranscriptionController:(id)a3;
- (void)setTranscriptionTask:(id)a3;
- (void)unloadTranscriptionService;
@end

@implementation VMTranscriptionService

- (VMTranscriptionService)init
{
  v9.receiver = self;
  v9.super_class = (Class)VMTranscriptionService;
  id v2 = [(VMTranscriptionService *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.vmd.VMTranscriptionService", 0);
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 3), off_1000E01C0, v2, 0);
    v5 = *((void *)v2 + 3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002C454;
    block[3] = &unk_1000C12C0;
    id v8 = v2;
    dispatch_async(v5, block);
  }
  return (VMTranscriptionService *)v2;
}

+ (NSArray)transcriptionLanguageCodes
{
  return (NSArray *)&off_1000C8810;
}

+ (BOOL)isSupportedTranscriptionLanguageCode:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (_os_feature_enabled_impl())
    {
      v4 = vm_vmd_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "isSupportedTranscriptionLanguageCode: Flag lvmExpansionLiveOnEnabled enabled", buf, 2u);
      }

      v5 = [(id)objc_opt_class() matchLocaleForTranscriptionLanguage];

      if (v5)
      {
        LOBYTE(v6) = 1;
        goto LABEL_25;
      }
      v7 = vm_vmd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18[0] = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "isSupportedTranscriptionLanguageCode: No preferred languages supported by Siri. Returning fallback current %@", buf, 0xCu);
      }
    }
    [(id)objc_opt_class() transcriptionLanguageCodes];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v6)
    {
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(v3, "isEqualToString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
          {
            LODWORD(v6) = 1;
            goto LABEL_21;
          }
        }
        id v6 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
  else
  {
    LODWORD(v6) = 0;
  }
  v11 = vm_vmd_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v18[0]) = v6;
    WORD2(v18[0]) = 2112;
    *(void *)((char *)v18 + 6) = v3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "isSupportedTranscriptionLanguageCode: Supported: %d for language: %@", buf, 0x12u);
  }

LABEL_25:
  return (char)v6;
}

- (void)loadTranscriptionService
{
  id v3 = [(VMTranscriptionService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C7BC;
  block[3] = &unk_1000C12C0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)unloadTranscriptionService
{
  id v3 = [(VMTranscriptionService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CB58;
  block[3] = &unk_1000C12C0;
  void block[4] = self;
  dispatch_async(v3, block);
}

+ (BOOL)isTranscriptionAvailable
{
  id v2 = +[VMPreferences sharedInstance];
  unsigned int v3 = [v2 transcriptionEnabled];

  if (!v3) {
    return 0;
  }
  v4 = +[NSLocale currentLocale];
  v5 = [v4 languageIdentifier];

  if (AFOfflineDictationCapable()) {
    unsigned __int8 v6 = [(id)objc_opt_class() isSupportedTranscriptionLanguageCode:v5];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)processTranscriptForRecordWithIdentifier:(int)a3 priority:(int64_t)a4 completion:(id)a5
{
  id v8 = [a5 copy];
  uint64_t v9 = [(VMTranscriptionService *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002CDB4;
  v11[3] = &unk_1000C1DA8;
  int v14 = a3;
  id v12 = v8;
  int64_t v13 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(v9, v11);
}

- (unint64_t)transcriptionFailureReasonForError:(id)a3
{
  id v4 = a3;
  v5 = [(VMTranscriptionService *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    unsigned __int8 v6 = (char *)[v4 code];
    if ((unint64_t)(v6 - 1038) > 2) {
      unint64_t v7 = 5;
    }
    else {
      unint64_t v7 = qword_1000A7220[(void)(v6 - 1038)];
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)languageIDFailureReasonForError:(id)a3
{
  id v4 = a3;
  v5 = [(VMTranscriptionService *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    unsigned __int8 v6 = (char *)[v4 code];
    if ((unint64_t)(v6 - 1041) > 3) {
      unint64_t v7 = 5;
    }
    else {
      unint64_t v7 = qword_1000A7238[(void)(v6 - 1041)];
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)reportTranscriptionProblemForRecord:(void *)a3
{
  CFRetain(a3);
  v5 = [(VMTranscriptionService *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002E408;
  v6[3] = &unk_1000C1DD0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)reportTranscriptionRatedAccurate:(BOOL)a3 forRecord:(void *)a4
{
  CFRetain(a4);
  unint64_t v7 = [(VMTranscriptionService *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002E550;
  v8[3] = &unk_1000C1DF0;
  BOOL v9 = a3;
  v8[4] = a4;
  dispatch_async(v7, v8);
}

- (void)handleAFLanguageCodeDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [(VMTranscriptionService *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E734;
  v7[3] = &unk_1000C11B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [(VMTranscriptionService *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E8E8;
  v7[3] = &unk_1000C11B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific(off_1000E01C0) == self)
  {
    id v6 = (void (*)(void))*((void *)a3 + 2);
    unint64_t v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    unint64_t v7 = [(VMTranscriptionService *)self queue];
    dispatch_sync(v7, v5);
  }
}

- (id)readDataFromFile:(id)a3
{
  id v3 = a3;
  if (![v3 length])
  {
    id v4 = vm_vmd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100080BB4(v4, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_13;
  }
  id v4 = +[NSURL fileURLWithPath:v3 isDirectory:0];
  id v31 = 0;
  id v5 = +[NSData dataWithContentsOfURL:v4 options:1 error:&v31];
  id v6 = v31;
  unint64_t v7 = v6;
  if (!v5)
  {
    v26 = [v6 localizedDescription];
    id v27 = +[NSString stringWithFormat:@"readDataFromFile: error %@\n", v26];
    v28 = (const char *)[v27 UTF8String];
    fputs(v28, __stderrp);

LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  id v30 = v7;
  id v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v5 error:&v30];
  id v13 = v30;

  if (v13)
  {
    int v14 = vm_vmd_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100080BEC();
    }
  }
  long long v15 = vm_vmd_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v33 = v3;
    __int16 v34 = 2112;
    v35 = v16;
    id v17 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "For file %@, unarchived object class: %@", buf, 0x16u);
  }
  v18 = v12;

  id v4 = v18;
LABEL_14:

  return v18;
}

- (BOOL)writeDataToFile:(id)a3 fileData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    unint64_t v7 = +[NSURL fileURLWithPath:v5 isDirectory:0];
    if (!v7)
    {
      id v17 = vm_vmd_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100080C8C((uint64_t)v5, v17, v26, v27, v28, v29, v30, v31);
      }
      BOOL v25 = 0;
      goto LABEL_21;
    }
    id v36 = 0;
    uint64_t v8 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v36];
    id v9 = v36;
    if (v9)
    {
      uint64_t v10 = vm_vmd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100080D60((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
      }
      id v17 = 0;
    }
    else
    {
      id v35 = 0;
      unsigned int v32 = [v8 writeToURL:v7 options:268435457 error:&v35];
      id v17 = v35;
      id v33 = vm_vmd_log();
      uint64_t v10 = v33;
      if (v32)
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v38 = v6;
          __int16 v39 = 2112;
          v40 = v7;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "File data %@ written to location: %@", buf, 0x16u);
        }
        BOOL v25 = 1;
        goto LABEL_20;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100080CF8();
      }
    }
    BOOL v25 = 0;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  unint64_t v7 = vm_vmd_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100080C54(v7, v18, v19, v20, v21, v22, v23, v24);
  }
  BOOL v25 = 0;
LABEL_22:

  return v25;
}

- (VMVoicemailTranscriptionTask)transcriptionTask
{
  return self->_transcriptionTask;
}

- (void)setTranscriptionTask:(id)a3
{
}

- (VMVoicemailTranscriptionController)transcriptionController
{
  return self->_transcriptionController;
}

- (void)setTranscriptionController:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transcriptionController, 0);
  objc_storeStrong((id *)&self->_transcriptionTask, 0);
}

@end