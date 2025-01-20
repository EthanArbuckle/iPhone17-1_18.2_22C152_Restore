@interface CRDictationService
+ (id)sharedInstance;
- (AFDictationConnection)dictationConnection;
- (BOOL)dictationAvailable;
- (BOOL)dictationEnabled;
- (BOOL)dictationEnabledInKeyboardSettings;
- (CARDictationResult)result;
- (CRDictationService)init;
- (NSError)error;
- (NSTimer)processingTimer;
- (id)handler;
- (int64_t)state;
- (void)_failWithError:(id)a3;
- (void)_finishIfPossible;
- (void)_fireHandler:(id)a3 withState:(int64_t)a4 result:(id)a5 error:(id)a6;
- (void)_processingTimeLimitReached;
- (void)_transitionToState:(int64_t)a3;
- (void)beginRecordingWithCompletion:(id)a3;
- (void)cancelRecording;
- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5;
- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4;
- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4;
- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3;
- (void)dictationConnectionSpeechRecordingDidBegin:(id)a3;
- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3;
- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3;
- (void)dictationConnectionSpeechRecordingWillBegin:(id)a3;
- (void)reset;
- (void)setDictationConnection:(id)a3;
- (void)setError:(id)a3;
- (void)setHandler:(id)a3;
- (void)setProcessingTimer:(id)a3;
- (void)setResult:(id)a3;
- (void)setState:(int64_t)a3;
- (void)stopRecording;
@end

@implementation CRDictationService

+ (id)sharedInstance
{
  if (qword_1000E3840 != -1) {
    dispatch_once(&qword_1000E3840, &stru_1000BD2C8);
  }
  v2 = (void *)qword_1000E3838;

  return v2;
}

- (CRDictationService)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRDictationService;
  v2 = [(CRDictationService *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)qword_1000E3848;
    uint64_t v13 = qword_1000E3848;
    if (!qword_1000E3848)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000C210;
      v9[3] = &unk_1000BD318;
      v9[4] = &v10;
      sub_10000C210((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (AFDictationConnection *)objc_alloc_init(v4);
    dictationConnection = v2->_dictationConnection;
    v2->_dictationConnection = v5;

    [(AFDictationConnection *)v2->_dictationConnection setDelegate:v2];
    v2->_state = [(CRDictationService *)v2 dictationAvailable] - 1;
  }
  return v2;
}

- (BOOL)dictationEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CAREnableDictationInternal", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (BOOL)dictationEnabledInKeyboardSettings
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 dictationIsEnabled];

  return v3;
}

- (BOOL)dictationAvailable
{
  if (!sub_10000C2A0()
    || !+[AFDictationConnection dictationIsEnabled])
  {
    return 0;
  }
  unsigned __int8 v3 = [(CRDictationService *)self dictationConnection];
  unsigned __int8 v4 = [v3 dictationIsAvailableForLanguage:@"en_US"];

  return v4;
}

- (void)stopRecording
{
  if ([(CRDictationService *)self state] >= 1)
  {
    if ([(CRDictationService *)self state] < 2)
    {
      [(CRDictationService *)self _transitionToState:4];
    }
    else
    {
      id v3 = [(CRDictationService *)self dictationConnection];
      [v3 stopSpeechWithOptions:0];
    }
  }
}

- (void)cancelRecording
{
  if ([(CRDictationService *)self state] >= 1)
  {
    id v3 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancel dictation request", v5, 2u);
    }

    [(CRDictationService *)self setHandler:0];
    if ([(CRDictationService *)self state] < 2)
    {
      [(CRDictationService *)self _transitionToState:4];
    }
    else
    {
      unsigned __int8 v4 = [(CRDictationService *)self dictationConnection];
      [v4 stopSpeechWithOptions:0];
    }
  }
}

- (void)beginRecordingWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(CRDictationService *)self dictationAvailable])
  {
    if ([(CRDictationService *)self state] < 1)
    {
      [(CRDictationService *)self setHandler:v4];
      [(CRDictationService *)self setResult:0];
      [(CRDictationService *)self setError:0];
      [(CRDictationService *)self _transitionToState:1];
      id v8 = objc_alloc_init((Class)AFDictationOptions);
      [v8 setTranscriptionMode:0];
      [v8 setKeyboardType:13];
      [v8 setReturnKeyType:10];
      [v8 setReleaseAudioSessionOnRecordingCompletion:1];
      id v9 = objc_alloc_init((Class)AFSpeechRequestOptions);
      uint64_t v10 = [(CRDictationService *)self dictationConnection];
      [v10 startDictationWithLanguageCode:@"en_US" options:v8 speechOptions:v9];

      goto LABEL_9;
    }
    v5 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      v6 = "Dictation is already in progress.";
      v7 = (uint8_t *)&v11;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    v5 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Dictation is not available.";
      v7 = buf;
      goto LABEL_7;
    }
  }

  [(CRDictationService *)self _fireHandler:v4 withState:-1 result:0 error:0];
LABEL_9:
}

- (void)_fireHandler:(id)a3 withState:(int64_t)a4 result:(id)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000B4DC;
    v12[3] = &unk_1000BD2F0;
    int64_t v16 = a4;
    id v13 = v10;
    id v14 = v11;
    id v15 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
}

- (void)_transitionToState:(int64_t)a3
{
  if (self->_state != a3)
  {
    int64_t v5 = [(CRDictationService *)self state];
    self->_state = a3;
    v6 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(v5 + 1) >= 6)
      {
        v7 = +[NSString stringWithFormat:@"Unknown (%ld)", v5];
      }
      else
      {
        v7 = off_1000BD370[v5 + 1];
      }
      id v8 = v7;
      if ((unint64_t)(a3 + 1) >= 6)
      {
        id v9 = +[NSString stringWithFormat:@"Unknown (%ld)", a3];
      }
      else
      {
        id v9 = off_1000BD370[a3 + 1];
      }
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dictation transitioning from %@ to %@", buf, 0x16u);
    }
    id v10 = [(CRDictationService *)self handler];
    int64_t v11 = [(CRDictationService *)self state];
    uint64_t v12 = [(CRDictationService *)self result];
    id v13 = [(CRDictationService *)self error];
    [(CRDictationService *)self _fireHandler:v10 withState:v11 result:v12 error:v13];

    if (a3 == 3)
    {
      id v14 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_processingTimeLimitReached" selector:0 userInfo:0 repeats:2.0];
      [(CRDictationService *)self setProcessingTimer:v14];
    }
    else
    {
      id v15 = [(CRDictationService *)self processingTimer];
      [v15 invalidate];

      [(CRDictationService *)self setProcessingTimer:0];
      if (a3 == 4)
      {
        [(AFDictationConnection *)self->_dictationConnection stopSpeechWithOptions:0];
        [(CRDictationService *)self reset];
      }
    }
  }
}

- (void)reset
{
  id v3 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting dictation state.", v8, 2u);
  }

  [(NSTimer *)self->_processingTimer invalidate];
  processingTimer = self->_processingTimer;
  self->_processingTimer = 0;

  self->_state = [(CRDictationService *)self dictationAvailable] - 1;
  result = self->_result;
  self->_result = 0;

  id handler = self->_handler;
  self->_id handler = 0;

  error = self->_error;
  self->_error = 0;
}

- (void)_processingTimeLimitReached
{
  [(CRDictationService *)self setProcessingTimer:0];
  if ((id)[(CRDictationService *)self state] == (id)3)
  {
    id v3 = CarDiagnosticsLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dictation maximum processing time reached, stopping dictation", v4, 2u);
    }

    [(AFDictationConnection *)self->_dictationConnection stopSpeechWithOptions:0];
    [(CRDictationService *)self _transitionToState:4];
  }
}

- (void)_finishIfPossible
{
  if ((id)[(CRDictationService *)self state] == (id)3)
  {
    id v3 = [(CRDictationService *)self result];
    id v4 = [v3 transcription];
    id v5 = [v4 length];

    if (v5)
    {
      v6 = CarDiagnosticsLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will finish processing, have valid result", v7, 2u);
      }

      [(CRDictationService *)self _transitionToState:4];
    }
  }
}

- (void)_failWithError:(id)a3
{
  [(CRDictationService *)self setError:a3];

  [(CRDictationService *)self _transitionToState:4];
}

- (void)dictationConnectionSpeechRecordingWillBegin:(id)a3
{
  id v4 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Recording will begin", v5, 2u);
  }

  [(CRDictationService *)self _transitionToState:2];
}

- (void)dictationConnectionSpeechRecordingDidBegin:(id)a3
{
  id v3 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Recording did begin", v4, 2u);
  }
}

- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3
{
  id v4 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Recording did end", v5, 2u);
  }

  [(CRDictationService *)self _transitionToState:3];
}

- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3
{
  id v4 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Speech recognition did succeed", v5, 2u);
  }

  [(CRDictationService *)self _transitionToState:3];
  [(CRDictationService *)self _finishIfPossible];
}

- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5
{
  id v6 = a4;
  if ([(CRDictationService *)self state] >= 2)
  {
    v7 = +[NSMutableString string];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      id v18 = v6;
      id v11 = 0;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          id v14 = v11;
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v8);
          }
          id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (v14
            && ([*(id *)(*((void *)&v19 + 1) + 8 * i) removeSpaceBefore] & 1) == 0
            && ([v14 removeSpaceAfter] & 1) == 0)
          {
            [v7 appendString:@" "];
          }
          int64_t v16 = [v15 text];
          [v7 appendString:v16];

          id v11 = v15;
        }
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);

      id v6 = v18;
    }

    v17 = [[CARDictationResult alloc] initWithText:v7];
    [(CRDictationService *)self setResult:v17];

    [(CRDictationService *)self _finishIfPossible];
  }
}

- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3
{
  id v4 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Speech recording did cancel", v5, 2u);
  }

  [(CRDictationService *)self _transitionToState:4];
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  id v5 = a4;
  id v6 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Speech recording failed with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [(CRDictationService *)self _failWithError:v5];
}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  id v5 = a4;
  id v6 = CarDiagnosticsLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Speech recognition failed with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [(CRDictationService *)self _failWithError:v5];
}

- (AFDictationConnection)dictationConnection
{
  return self->_dictationConnection;
}

- (void)setDictationConnection:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (CARDictationResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSTimer)processingTimer
{
  return self->_processingTimer;
}

- (void)setProcessingTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingTimer, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_dictationConnection, 0);
}

@end