@interface VMSpeechAnalyzerLanguageIDOperation
- (NSURL)dataURL;
- (OS_dispatch_semaphore)semaphore;
- (SFLanguageDetectorResult)languageDetectorResult;
- (VMSpeechAnalyzerLanguageIDOperation)initWithClientIdentifier:(id)a3 transcriberResultDelegate:(id)a4 endpointingResultDelegate:(id)a5 languageDetectorResultDelegate:(id)a6 transcriberOptions:(id)a7 options:(id)a8 languageDetectorOptions:(id)a9 restrictedLogging:(BOOL)a10 didChangeVolatileRange:(id)a11;
- (id)initSpeechAnalyzerForLanguageID:(id)a3;
- (id)languageIDOperationCompletion;
- (void)cancel;
- (void)main;
- (void)setDataURL:(id)a3;
- (void)setLanguageDetectorResult:(id)a3;
- (void)setLanguageIDOperationCompletion:(id)a3;
- (void)setSemaphore:(id)a3;
- (void)speechAnalyzer:(id)a3 didProduceLanguageHypothesis:(id)a4;
- (void)speechAnalyzer:(id)a3 didStopLanguageDetectorWithError:(id)a4;
@end

@implementation VMSpeechAnalyzerLanguageIDOperation

- (VMSpeechAnalyzerLanguageIDOperation)initWithClientIdentifier:(id)a3 transcriberResultDelegate:(id)a4 endpointingResultDelegate:(id)a5 languageDetectorResultDelegate:(id)a6 transcriberOptions:(id)a7 options:(id)a8 languageDetectorOptions:(id)a9 restrictedLogging:(BOOL)a10 didChangeVolatileRange:(id)a11
{
  return 0;
}

- (id)initSpeechAnalyzerForLanguageID:(id)a3
{
  id v5 = a3;
  v6 = @"com.apple.visualvoicemail";
  id v7 = objc_alloc_init((Class)SFSpeechAnalyzerLanguageDetectorOptions);
  [v7 setAlternativeCount:5];
  v12.receiver = self;
  v12.super_class = (Class)VMSpeechAnalyzerLanguageIDOperation;
  char v11 = 1;
  v8 = [(VMSpeechAnalyzerOperation *)&v12 initWithClientIdentifier:v6 transcriberResultDelegate:0 endpointingResultDelegate:0 languageDetectorResultDelegate:self transcriberOptions:0 options:0 languageDetectorOptions:v7 restrictedLogging:v11 didChangeVolatileRange:&stru_1000C2228];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_dataURL, a3);
  }

  return v9;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VMSpeechAnalyzerLanguageIDOperation;
  [(VMSpeechAnalyzerLanguageIDOperation *)&v4 cancel];
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelled LanguageID operation %@.", buf, 0xCu);
  }
}

- (void)main
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(VMSpeechAnalyzerLanguageIDOperation *)self dataURL];
    id v5 = [(VMSpeechAnalyzerLanguageIDOperation *)self queuePriority];
    v6 = +[MFPowerController sharedInstance];
    unsigned int v7 = [v6 isPluggedIn];
    CFStringRef v8 = @" not";
    *(_DWORD *)buf = 138413058;
    v32 = self;
    __int16 v33 = 2112;
    if (v7) {
      CFStringRef v8 = &stru_1000C35D8;
    }
    v34 = v4;
    __int16 v35 = 2048;
    id v36 = v5;
    __int16 v37 = 2112;
    CFStringRef v38 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting LanguageID operation %@ for %@. Priority is %ld and device is %@ charging.", buf, 0x2Au);
  }
  if ([(VMSpeechAnalyzerLanguageIDOperation *)self isCancelled])
  {
    uint64_t v9 = kVVErrorDomain;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    CFStringRef v30 = @"Language ID operation was cancelled.";
    v10 = &v30;
    char v11 = &v29;
    goto LABEL_17;
  }
  if ([(VMSpeechAnalyzerLanguageIDOperation *)self queuePriority] == (id)-4)
  {
    objc_super v12 = +[MFPowerController sharedInstance];
    unsigned __int8 v13 = [v12 isPluggedIn];

    if ((v13 & 1) == 0)
    {
      uint64_t v9 = kVVErrorDomain;
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      CFStringRef v28 = @"Low priority Language ID operation cancelled. The device is no longer connected to a power source.";
      v10 = &v28;
      char v11 = &v27;
LABEL_17:
      v22 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:1];
      v20 = +[NSError errorWithDomain:v9 code:1041 userInfo:v22];

      if (!v20) {
        goto LABEL_20;
      }
      goto LABEL_18;
    }
  }
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  [(VMSpeechAnalyzerLanguageIDOperation *)self setSemaphore:v14];

  v15 = [(VMSpeechAnalyzerLanguageIDOperation *)self dataURL];
  unsigned int v16 = [(VMSpeechAnalyzerOperation *)self submitAudioToAnalyzer:v15 sampleRate:0 useFloat:16000.0];

  if (v16)
  {
    v17 = vm_vmd_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(VMSpeechAnalyzerLanguageIDOperation *)self dataURL];
      *(_DWORD *)buf = 138412290;
      v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "VMSpeechAnalyzerLanguageIDOperation: Submitted URL %@ for Language ID", buf, 0xCu);
    }
    v19 = [(VMSpeechAnalyzerLanguageIDOperation *)self semaphore];
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    v20 = 0;
  }
  else
  {
    uint64_t v21 = kVVErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"Audio was not submitted to speech analyzer successfully.";
    v19 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v20 = +[NSError errorWithDomain:v21 code:1042 userInfo:v19];
  }

  [(VMSpeechAnalyzerLanguageIDOperation *)self cancel];
  if (v20)
  {
LABEL_18:
    v23 = [(VMSpeechAnalyzerLanguageIDOperation *)self languageIDOperationCompletion];

    if (v23)
    {
      v24 = [(VMSpeechAnalyzerLanguageIDOperation *)self languageIDOperationCompletion];
      ((void (**)(void, void, void *))v24)[2](v24, 0, v20);
    }
  }
LABEL_20:
}

- (void)speechAnalyzer:(id)a3 didProduceLanguageHypothesis:(id)a4
{
  id v5 = a4;
  v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v5 dominantLocale];
    CFStringRef v8 = [v7 localeIdentifier];
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "VMSpeechAnalyzerLanguageIDOperation Dominant Locale detected: <%@>", (uint8_t *)&v9, 0xCu);
  }
  [(VMSpeechAnalyzerLanguageIDOperation *)self setLanguageDetectorResult:v5];
}

- (void)speechAnalyzer:(id)a3 didStopLanguageDetectorWithError:(id)a4
{
  id v5 = a4;
  v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "VMSpeechAnalyzerLanguageIDOperation didStopLanguageDetectorWithError. Error? %@", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v7 = [(VMSpeechAnalyzerLanguageIDOperation *)self languageIDOperationCompletion];

  if (v7)
  {
    CFStringRef v8 = [(VMSpeechAnalyzerLanguageIDOperation *)self languageIDOperationCompletion];
    int v9 = [(VMSpeechAnalyzerLanguageIDOperation *)self languageDetectorResult];
    ((void (**)(void, void *, id))v8)[2](v8, v9, v5);
  }
  v10 = [(VMSpeechAnalyzerLanguageIDOperation *)self semaphore];
  dispatch_semaphore_signal(v10);
}

- (id)languageIDOperationCompletion
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setLanguageIDOperationCompletion:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (SFLanguageDetectorResult)languageDetectorResult
{
  return self->_languageDetectorResult;
}

- (void)setLanguageDetectorResult:(id)a3
{
}

- (NSURL)dataURL
{
  return self->_dataURL;
}

- (void)setDataURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataURL, 0);
  objc_storeStrong((id *)&self->_languageDetectorResult, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong(&self->_languageIDOperationCompletion, 0);
}

@end