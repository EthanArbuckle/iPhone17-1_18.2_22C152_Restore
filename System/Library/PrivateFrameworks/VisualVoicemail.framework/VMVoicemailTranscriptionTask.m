@interface VMVoicemailTranscriptionTask
+ (void)resetRetranscriptionTaskState;
- (BOOL)alreadyAttemptedVoicemailTranscriptionForVoicemail:(id)a3;
- (BOOL)confidenceModelExistsOnDevice;
- (BOOL)deviceHasSpeechAssets;
- (BOOL)hasInsomniaAssertion;
- (BOOL)isTaskRunning;
- (BOOL)shouldRunTranscriptionTask;
- (BOOL)speechAssetHasConfidenceModel:(id)a3;
- (BOOL)voicemailWasTranscribedWithoutConfidence:(id)a3;
- (OS_dispatch_queue)taskQueue;
- (VMVoicemailTranscriptionController)transcriptionController;
- (VMVoicemailTranscriptionTask)init;
- (id)allVoicemails;
- (id)allVoicemailsTranscribedWithoutConfidence;
- (id)allVoicemailsWithTranscription;
- (id)allVoicemailsWithoutTranscription;
- (id)lastTaskExecutionDate;
- (id)speechAssetsOnDevice;
- (id)speechAssetsWithConfidenceModelsOnDevice;
- (id)voicemailsMatchingFlags:(unsigned int)a3 withoutFlags:(unsigned int)a4;
- (void)_endRetranscribingTask;
- (void)_startRetranscribingVoicemailsIfNecessaryTranscribingAllVoicemails:(BOOL)a3;
- (void)cancelAttemptedVoicemailTranscriptionForVoicemail:(id)a3;
- (void)dealloc;
- (void)processTranscriptForVoicemail:(id)a3;
- (void)retranscribeAllVoicemails;
- (void)setAttemptedVoicemailTranscriptionForVoicemail:(id)a3;
- (void)setHasInsomniaAssertion:(BOOL)a3;
- (void)setLastExecutionDate:(id)a3;
- (void)setTaskRunning:(BOOL)a3;
- (void)setTranscriptionController:(id)a3;
@end

@implementation VMVoicemailTranscriptionTask

- (VMVoicemailTranscriptionTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)VMVoicemailTranscriptionTask;
  v2 = [(VMVoicemailTranscriptionTask *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.voicemail.retranscribingTaskQueue", 0);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(VMVoicemailTranscriptionTask *)self _endRetranscribingTask];
  v3.receiver = self;
  v3.super_class = (Class)VMVoicemailTranscriptionTask;
  [(VMVoicemailTranscriptionTask *)&v3 dealloc];
}

+ (void)resetRetranscriptionTaskState
{
  v2 = +[NSFileManager defaultManager];
  unsigned int v3 = [v2 fileExistsAtPath:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist"];

  if (v3)
  {
    v4 = +[NSFileManager defaultManager];
    id v8 = 0;
    unsigned __int8 v5 = [v4 removeItemAtPath:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist" error:&v8];
    id v6 = v8;

    if ((v5 & 1) == 0)
    {
      v7 = vm_vmd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100081458();
      }
    }
  }
}

- (void)setLastExecutionDate:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist"];

  if (v6) {
    +[NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist"];
  }
  else {
  v7 = +[NSMutableDictionary dictionary];
  }
  [v7 setObject:v4 forKey:@"VMVoicemailTranscriptionTaskLastExecutionDate"];
  id v14 = 0;
  unsigned int v8 = [v7 writeToFile:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist" options:268435457 error:&v14];
  id v9 = v14;
  v10 = vm_vmd_log();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = NSStringFromSelector(a2);
      v13 = +[NSString stringWithFormat:@"Saved last execution date of %@ to retranscription task plist.", v4];
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_100081508();
  }
}

- (id)lastTaskExecutionDate
{
  unsigned int v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist"];

  if (v4)
  {
    unsigned __int8 v5 = +[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist"];
    unsigned int v6 = [v5 objectForKey:@"VMVoicemailTranscriptionTaskLastExecutionDate"];
    v7 = vm_vmd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = NSStringFromSelector(a2);
      id v9 = +[NSString stringWithFormat:@"Got a last execution date of: %@", v6];
      *(_DWORD *)buf = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
    }
  }
  else
  {
    unsigned __int8 v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromSelector(a2);
      v11 = +[NSString stringWithFormat:@"Returning nil since the task dictionary doesn't exist."];
      *(_DWORD *)buf = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
    }
    unsigned int v6 = 0;
  }

  return v6;
}

- (BOOL)shouldRunTranscriptionTask
{
  return [(VMVoicemailTranscriptionTask *)self confidenceModelExistsOnDevice];
}

- (BOOL)deviceHasSpeechAssets
{
  v2 = [(VMVoicemailTranscriptionTask *)self speechAssetsOnDevice];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)speechAssetsOnDevice
{
  v2 = +[NSFileManager defaultManager];
  id v9 = 0;
  BOOL v3 = [v2 contentsOfDirectoryAtPath:@"/var/MobileAsset/Assets/com_apple_MobileAsset_EmbeddedSpeech" error:&v9];
  id v4 = v9;

  if (v4)
  {
    unsigned __int8 v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000815B8();
    }
  }
  unsigned int v6 = +[NSPredicate predicateWithBlock:&stru_1000C2780];
  v7 = [v3 filteredArrayUsingPredicate:v6];

  return v7;
}

- (id)speechAssetsWithConfidenceModelsOnDevice
{
  BOOL v3 = [(VMVoicemailTranscriptionTask *)self speechAssetsOnDevice];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100054B20;
  v7[3] = &unk_1000C27A8;
  v7[4] = self;
  id v4 = +[NSPredicate predicateWithBlock:v7];
  unsigned __int8 v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (BOOL)speechAssetHasConfidenceModel:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 lastPathComponent];
  unsigned int v6 = [v5 stringByDeletingPathExtension];

  unsigned int v7 = [&off_1000C8840 containsObject:v6];
  unsigned int v8 = vm_vmd_log();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100081668();
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = NSStringFromSelector(a2);
    v11 = +[NSString stringWithFormat:@"It looks like we have a model that supports confidence on this device."];
    int v13 = 138412546;
    id v14 = v10;
    __int16 v15 = 2112;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v13, 0x16u);
  }
  return v7 ^ 1;
}

- (BOOL)confidenceModelExistsOnDevice
{
  v2 = [(VMVoicemailTranscriptionTask *)self speechAssetsWithConfidenceModelsOnDevice];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)setAttemptedVoicemailTranscriptionForVoicemail:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist"];

  if (v6) {
    +[NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist"];
  }
  else {
  unsigned int v7 = +[NSMutableDictionary dictionary];
  }
  unsigned int v8 = [v7 objectForKey:@"VMVoicemailTranscriptionPreviouslyAttemptedVoicemails"];

  if (v8)
  {
    id v9 = [v7 objectForKey:@"VMVoicemailTranscriptionPreviouslyAttemptedVoicemails"];
    id v10 = [v9 mutableCopy];
  }
  else
  {
    id v10 = +[NSMutableArray array];
  }
  v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 identifier]);
  [v10 addObject:v11];

  [v7 setObject:v10 forKey:@"VMVoicemailTranscriptionPreviouslyAttemptedVoicemails"];
  id v18 = 0;
  unsigned int v12 = [v7 writeToFile:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist" options:268435457 error:&v18];
  id v13 = v18;
  id v14 = vm_vmd_log();
  __int16 v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSStringFromSelector(a2);
      __int16 v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Noted in plist that we have attempted to transcribe voicemail with identifier: %lu.", [v4 identifier]);
      *(_DWORD *)buf = 138412546;
      v20 = v16;
      __int16 v21 = 2112;
      v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    sub_100081508();
  }
}

- (void)cancelAttemptedVoicemailTranscriptionForVoicemail:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist"];

  if (v6)
  {
    unsigned int v7 = +[NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist"];
    unsigned int v8 = [v7 objectForKey:@"VMVoicemailTranscriptionPreviouslyAttemptedVoicemails"];
    id v9 = [v8 mutableCopy];

    id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 identifier]);
    unsigned int v11 = [v9 containsObject:v10];

    if (v11)
    {
      unsigned int v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 identifier]);
      [v9 removeObject:v12];

      [v7 setObject:v9 forKey:@"VMVoicemailTranscriptionPreviouslyAttemptedVoicemails"];
      id v19 = 0;
      unsigned int v13 = [v7 writeToFile:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist" options:268435457 error:&v19];
      id v14 = v19;
      __int16 v15 = vm_vmd_log();
      v16 = v15;
      if (v13)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v17 = NSStringFromSelector(a2);
          id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Removing from plist that we have attempted to transcribe voicemail with identifier: %lu.", [v4 identifier]);
          *(_DWORD *)buf = 138412546;
          __int16 v21 = v17;
          __int16 v22 = 2112;
          v23 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        sub_100081508();
      }
    }
  }
}

- (BOOL)alreadyAttemptedVoicemailTranscriptionForVoicemail:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist"];

  if (v6)
  {
    unsigned int v7 = +[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Voicemail/com.apple.voicemail.transcriptiontask.plist"];
    unsigned int v8 = [v7 objectForKey:@"VMVoicemailTranscriptionPreviouslyAttemptedVoicemails"];
    id v9 = vm_vmd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = NSStringFromSelector(a2);
      unsigned int v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Got previous attempts of: %@, will check to see if %lu is in it.", v8, [v4 identifier]);
      *(_DWORD *)buf = 138412546;
      id v18 = v10;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
    }
    unsigned int v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 identifier]);
    unsigned __int8 v13 = [v8 containsObject:v12];
  }
  else
  {
    unsigned int v7 = vm_vmd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = NSStringFromSelector(a2);
      __int16 v15 = +[NSString stringWithFormat:@"Returning NO since the task dictionary doesn't exist."];
      *(_DWORD *)buf = 138412546;
      id v18 = v14;
      __int16 v19 = 2112;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
    }
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)voicemailsMatchingFlags:(unsigned int)a3 withoutFlags:(unsigned int)a4
{
  id v4 = (void *)VMStoreCopyOfAllRecordsWithFlags(a3, a4, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005551C;
  v8[3] = &unk_1000C27D0;
  id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v5 = v9;
  [v4 enumerateObjectsUsingBlock:v8];
  unsigned int v6 = +[NSArray arrayWithArray:v5];

  return v6;
}

- (id)allVoicemails
{
  return [(VMVoicemailTranscriptionTask *)self voicemailsMatchingFlags:0 withoutFlags:0];
}

- (id)allVoicemailsWithTranscription
{
  return [(VMVoicemailTranscriptionTask *)self voicemailsMatchingFlags:256 withoutFlags:0];
}

- (id)allVoicemailsWithoutTranscription
{
  return [(VMVoicemailTranscriptionTask *)self voicemailsMatchingFlags:0 withoutFlags:33536];
}

- (BOOL)voicemailWasTranscribedWithoutConfidence:(id)a3
{
  BOOL v3 = [a3 transcript];
  [v3 confidence];
  BOOL v5 = v4 <= 0.00000011921;

  return v5;
}

- (id)allVoicemailsTranscribedWithoutConfidence
{
  BOOL v3 = [(VMVoicemailTranscriptionTask *)self allVoicemailsWithTranscription];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000556C0;
  v7[3] = &unk_1000C27F8;
  v7[4] = self;
  float v4 = +[NSPredicate predicateWithBlock:v7];
  BOOL v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (void)processTranscriptForVoicemail:(id)a3
{
  id v5 = a3;
  unsigned int v6 = [(VMVoicemailTranscriptionTask *)self transcriptionController];
  unsigned int v7 = [v6 transcriptionService];
  id v8 = [v5 identifier];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000557B4;
  v10[3] = &unk_1000C2820;
  unsigned int v12 = self;
  SEL v13 = a2;
  id v11 = v5;
  id v9 = v5;
  [v7 processTranscriptForRecordWithIdentifier:v8 priority:-4 completion:v10];
}

- (void)_startRetranscribingVoicemailsIfNecessaryTranscribingAllVoicemails:(BOOL)a3
{
  unsigned __int8 v6 = [(VMVoicemailTranscriptionTask *)self isTaskRunning];
  unsigned int v7 = vm_vmd_log();
  id v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromSelector(a2);
      id v10 = +[NSString stringWithFormat:@"Starting task to retranscribe voicemails"];
      *(_DWORD *)buf = 138412546;
      v23 = v9;
      __int16 v24 = 2112;
      v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
    }
    [(VMVoicemailTranscriptionTask *)self setTaskRunning:1];
    if (!self->_hasInsomniaAssertion)
    {
      id v11 = vm_vmd_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = NSStringFromSelector(a2);
        SEL v13 = +[NSString stringWithFormat:@"Taking an insomnia assertion until we complete the task."];
        *(_DWORD *)buf = 138412546;
        v23 = v12;
        __int16 v24 = 2112;
        v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
      }
      +[VVService obtainInsomniaAssertion];
      self->_hasInsomniaAssertion = 1;
    }
    if ([(VMVoicemailTranscriptionTask *)self deviceHasSpeechAssets])
    {
      if (a3)
      {
        id v14 = +[NSDate date];
        [(VMVoicemailTranscriptionTask *)self setLastExecutionDate:v14];

        __int16 v15 = [(VMVoicemailTranscriptionTask *)self allVoicemails];
        v16 = vm_vmd_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v17 = NSStringFromSelector(a2);
          id v18 = +[NSString stringWithFormat:@"Found %lu voicemails on device, and we were asked to transcribe all of them.", [v15 count]];
          *(_DWORD *)buf = 138412546;
          v23 = v17;
          __int16 v24 = 2112;
          v25 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
        }
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100055D10;
        v21[3] = &unk_1000C2848;
        v21[4] = self;
        v21[5] = a2;
        [v15 enumerateObjectsUsingBlock:v21];
        goto LABEL_23;
      }
      if ([(VMVoicemailTranscriptionTask *)self shouldRunTranscriptionTask])
      {
        __int16 v15 = +[NSDate date];
        [(VMVoicemailTranscriptionTask *)self setLastExecutionDate:v15];
        goto LABEL_23;
      }
      __int16 v15 = vm_vmd_log();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      __int16 v19 = NSStringFromSelector(a2);
      v20 = +[NSString stringWithFormat:@"Cancelling retranscription task since we were told not to run it."];
      *(_DWORD *)buf = 138412546;
      v23 = v19;
      __int16 v24 = 2112;
      v25 = v20;
    }
    else
    {
      __int16 v15 = vm_vmd_log();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        [(VMVoicemailTranscriptionTask *)self _endRetranscribingTask];
        return;
      }
      __int16 v19 = NSStringFromSelector(a2);
      v20 = +[NSString stringWithFormat:@"Cancelling retranscription task since our device has no speech assets downloaded."];
      *(_DWORD *)buf = 138412546;
      v23 = v19;
      __int16 v24 = 2112;
      v25 = v20;
    }
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

    goto LABEL_23;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100081718(a2);
  }
}

- (void)_endRetranscribingTask
{
  unsigned int v4 = [(VMVoicemailTranscriptionTask *)self isTaskRunning];
  id v5 = vm_vmd_log();
  unsigned __int8 v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = NSStringFromSelector(a2);
      id v8 = +[NSString stringWithFormat:@"Ending task to retranscribe voicemails"];
      int v12 = 138412546;
      SEL v13 = v7;
      __int16 v14 = 2112;
      __int16 v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v12, 0x16u);
    }
    self->_taskRunning = 0;
    if (self->_hasInsomniaAssertion)
    {
      id v9 = vm_vmd_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = NSStringFromSelector(a2);
        id v11 = +[NSString stringWithFormat:@"Releasing insomnia assertion so we can exit vmd if necessary."];
        int v12 = 138412546;
        SEL v13 = v10;
        __int16 v14 = 2112;
        __int16 v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v12, 0x16u);
      }
      +[VVService releaseInsomniaAssertion];
      self->_hasInsomniaAssertion = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000817C4(a2);
    }
  }
}

- (void)retranscribeAllVoicemails
{
  taskQueue = self->_taskQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056068;
  block[3] = &unk_1000C12C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)taskQueue, block);
}

- (VMVoicemailTranscriptionController)transcriptionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transcriptionController);
  return (VMVoicemailTranscriptionController *)WeakRetained;
}

- (void)setTranscriptionController:(id)a3
{
}

- (OS_dispatch_queue)taskQueue
{
  return self->_taskQueue;
}

- (BOOL)isTaskRunning
{
  return self->_taskRunning;
}

- (void)setTaskRunning:(BOOL)a3
{
  self->_taskRunning = a3;
}

- (BOOL)hasInsomniaAssertion
{
  return self->_hasInsomniaAssertion;
}

- (void)setHasInsomniaAssertion:(BOOL)a3
{
  self->_hasInsomniaAssertion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_destroyWeak((id *)&self->_transcriptionController);
}

@end