@interface VMTranscriptionTranscribeOperation
- (BOOL)processOnServer;
- (OS_dispatch_semaphore)semaphore;
- (VMTranscriptionTranscribeOperation)initWithSpeechRecognizer:(id)a3 speechURLRecognitionRequest:(id)a4;
- (VMVoicemailTranscript)transcript;
- (double)duration;
- (double)timeout;
- (id)transcribeOperationBeginCallback;
- (id)transcribeOperationCompletion;
- (void)cancel;
- (void)main;
- (void)setDuration:(double)a3;
- (void)setProcessOnServer:(BOOL)a3;
- (void)setSemaphore:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTranscribeOperationBeginCallback:(id)a3;
- (void)setTranscribeOperationCompletion:(id)a3;
- (void)setTranscript:(id)a3;
- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4;
- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)speechRecognitionTask:(id)a3 didProcessAudioDuration:(double)a4;
- (void)speechRecognitionTaskWasCancelled:(id)a3;
@end

@implementation VMTranscriptionTranscribeOperation

- (VMTranscriptionTranscribeOperation)initWithSpeechRecognizer:(id)a3 speechURLRecognitionRequest:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)VMTranscriptionTranscribeOperation;
  v7 = [(VMSpeechURLRecognitionRequestOperation *)&v10 initWithSpeechRecognizer:a3 speechURLRecognitionRequest:v6];
  v8 = v7;
  if (v7)
  {
    v7->_timeout = 60.0;
    [v6 _setForceOfflineRecognition:1];
  }

  return v8;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VMTranscriptionTranscribeOperation;
  [(VMTranscriptionTranscribeOperation *)&v4 cancel];
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelled transcribe operation %@.", buf, 0xCu);
  }
}

- (void)main
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(VMSpeechURLRecognitionRequestOperation *)self URL];
    id v5 = [(VMTranscriptionTranscribeOperation *)self queuePriority];
    id v6 = +[MFPowerController sharedInstance];
    unsigned int v7 = [v6 isPluggedIn];
    CFStringRef v8 = @" not";
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    if (v7) {
      CFStringRef v8 = &stru_1000C35D8;
    }
    *(void *)&buf[14] = v4;
    __int16 v31 = 2048;
    id v32 = v5;
    __int16 v33 = 2112;
    CFStringRef v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting transcription operation %@ for %@. Priority is %ld and device is %@ charging.", buf, 0x2Au);
  }
  v9 = [(VMTranscriptionTranscribeOperation *)self transcribeOperationBeginCallback];

  if (v9)
  {
    objc_super v10 = [(VMTranscriptionTranscribeOperation *)self transcribeOperationBeginCallback];
    v10[2]();
  }
  if ([(VMTranscriptionTranscribeOperation *)self isCancelled])
  {
    uint64_t v11 = kVVErrorDomain;
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    CFStringRef v29 = @"Transcription operation was cancelled.";
    v12 = &v29;
    v13 = &v28;
  }
  else
  {
    if ([(VMTranscriptionTranscribeOperation *)self queuePriority] != (id)-4
      || (+[MFPowerController sharedInstance],
          v14 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v15 = [v14 isPluggedIn],
          v14,
          (v15 & 1) != 0))
    {
      dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
      [(VMTranscriptionTranscribeOperation *)self setSemaphore:v16];

      v17 = [(VMSpeechRecognizerOperation *)self speechRecognizer];
      v18 = [(VMSpeechRecognitionRequestOperation *)self speechRecognitionRequest];
      v19 = [v17 recognitionTaskWithRequest:v18 delegate:self];

      v20 = vm_vmd_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [(VMSpeechRecognitionRequestOperation *)self speechRecognitionRequest];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Created speech recognition task %@ with speech recognition request %@.", buf, 0x16u);
      }
      v22 = [(VMTranscriptionTranscribeOperation *)self semaphore];
      dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

      v23 = 0;
      goto LABEL_18;
    }
    uint64_t v11 = kVVErrorDomain;
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = @"Low priority transcription operation cancelled. The device is no longer connected to a power source.";
    v12 = &v27;
    v13 = &v26;
  }
  v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v13, 1, v26, v27, v28, v29, *(_OWORD *)buf);
  v23 = +[NSError errorWithDomain:v11 code:1038 userInfo:v24];

  if (v23)
  {
    v25 = [(VMTranscriptionTranscribeOperation *)self transcribeOperationCompletion];

    if (v25)
    {
      v19 = [(VMTranscriptionTranscribeOperation *)self transcribeOperationCompletion];
      ((void (**)(void, void, void *))v19)[2](v19, 0, v23);
LABEL_18:
    }
  }
}

- (BOOL)processOnServer
{
  v2 = [(VMSpeechURLRecognitionRequestOperation *)self speechURLRecognitionRequest];
  char v3 = [v2 _forceOfflineRecognition] ^ 1;

  return v3;
}

- (void)setProcessOnServer:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(VMSpeechURLRecognitionRequestOperation *)self speechURLRecognitionRequest];
  [v4 _setForceOfflineRecognition:v3];
}

- (void)speechRecognitionTaskWasCancelled:(id)a3
{
  id v4 = a3;
  id v5 = [(VMTranscriptionTranscribeOperation *)self transcribeOperationCompletion];

  if (v5)
  {
    id v6 = vm_vmd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Speech task was cancelled %@ for operation, executing result block.", (uint8_t *)&v10, 0xCu);
    }

    unsigned int v7 = [(VMTranscriptionTranscribeOperation *)self transcribeOperationCompletion];
    CFStringRef v8 = [v4 error];
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
  }
  v9 = [(VMTranscriptionTranscribeOperation *)self semaphore];
  dispatch_semaphore_signal(v9);
}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  id v9 = a4;
  if ([v9 isFinal])
  {
    id v5 = objc_alloc((Class)VMVoicemailTranscript);
    id v6 = [v9 bestTranscription];
    id v7 = [v5 initWithTranscription:v6];
    [(VMTranscriptionTranscribeOperation *)self setTranscript:v7];

    CFStringRef v8 = [(VMTranscriptionTranscribeOperation *)self semaphore];
    dispatch_semaphore_signal(v8);
  }
}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v5 = a3;
  [(VMTranscriptionTranscribeOperation *)self duration];
  uint64_t v7 = (uint64_t)v6;
  CFStringRef v8 = [(VMTranscriptionTranscribeOperation *)self progress];
  [v8 setCompletedUnitCount:v7];

  id v9 = [(VMTranscriptionTranscribeOperation *)self transcribeOperationCompletion];

  if (v9)
  {
    int v10 = vm_vmd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      dispatch_semaphore_t v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Finished transcribe operation %@, executing result block.", (uint8_t *)&v15, 0xCu);
    }

    id v11 = [(VMTranscriptionTranscribeOperation *)self transcribeOperationCompletion];
    v12 = [(VMTranscriptionTranscribeOperation *)self transcript];
    v13 = [v5 error];
    ((void (**)(void, void *, void *))v11)[2](v11, v12, v13);
  }
  v14 = [(VMTranscriptionTranscribeOperation *)self semaphore];
  dispatch_semaphore_signal(v14);
}

- (void)speechRecognitionTask:(id)a3 didProcessAudioDuration:(double)a4
{
  uint64_t v4 = (uint64_t)a4;
  id v5 = [(VMTranscriptionTranscribeOperation *)self progress];
  [v5 setCompletedUnitCount:v4];
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)transcribeOperationCompletion
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setTranscribeOperationCompletion:(id)a3
{
}

- (id)transcribeOperationBeginCallback
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setTranscribeOperationBeginCallback:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (VMVoicemailTranscript)transcript
{
  return self->_transcript;
}

- (void)setTranscript:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcript, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong(&self->_transcribeOperationBeginCallback, 0);
  objc_storeStrong(&self->_transcribeOperationCompletion, 0);
}

@end