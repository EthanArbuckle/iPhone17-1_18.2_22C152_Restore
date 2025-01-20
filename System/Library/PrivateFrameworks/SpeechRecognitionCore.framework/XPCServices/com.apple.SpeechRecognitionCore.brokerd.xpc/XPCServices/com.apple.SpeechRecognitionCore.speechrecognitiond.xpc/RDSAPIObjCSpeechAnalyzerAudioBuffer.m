@interface RDSAPIObjCSpeechAnalyzerAudioBuffer
- (NSString)currentTask;
- (RDSAPIObjCSpeechAnalyzerAudioBuffer)initWithSwiftSpeechAnalyzer:(id)a3 task:(id)a4;
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)swiftSpeechAnalyzer;
- (unsigned)useRecognitionReplacements;
- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4;
- (void)cancelRecognition;
- (void)dealloc;
- (void)endAudio;
- (void)newUtteranceBegins;
- (void)setCurrentTask:(id)a3;
- (void)setRecognitionReplacements:(BOOL)a3;
- (void)setSwiftSpeechAnalyzer:(id)a3;
- (void)setUseRecognitionReplacements:(unsigned __int8)a3;
- (void)startRecognition:(id)a3;
@end

@implementation RDSAPIObjCSpeechAnalyzerAudioBuffer

- (RDSAPIObjCSpeechAnalyzerAudioBuffer)initWithSwiftSpeechAnalyzer:(id)a3 task:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)RDSAPIObjCSpeechAnalyzerAudioBuffer;
  v8 = [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)&v28 init];
  v9 = v8;
  if (v8) {
    [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)v8 setSwiftSpeechAnalyzer:v6];
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  id v10 = [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)v9 currentTask];

  if (v10 != v7)
  {
    dispatch_time_t v11 = dispatch_time(0, 10000000000);
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v13 = [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)v9 swiftSpeechAnalyzer];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000057E4;
    v19[3] = &unk_1000EDC30;
    v20 = v9;
    id v21 = v7;
    v23 = &v24;
    v14 = v12;
    v22 = v14;
    [v13 attachTranscriberWithTask:v21 completionHandler:v19];

    if (dispatch_semaphore_wait(v14, v11))
    {
      v15 = RXOSLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Timed out waiting to get attach transcriber. ", (uint8_t *)v18, 2u);
      }

      *((unsigned char *)v25 + 24) = 0;
    }
  }
  if (*((unsigned char *)v25 + 24)) {
    v16 = v9;
  }
  else {
    v16 = 0;
  }
  _Block_object_dispose(&v24, 8);

  return v16;
}

- (void)setRecognitionReplacements:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  if ([(RDSAPIObjCSpeechAnalyzerAudioBuffer *)self useRecognitionReplacements] != a3)
  {
    dispatch_time_t v5 = dispatch_time(0, 10000000000);
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    id v7 = [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)self swiftSpeechAnalyzer];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100005B8C;
    v10[3] = &unk_1000EDC58;
    objc_copyWeak(&v13, &location);
    BOOL v14 = v3;
    dispatch_semaphore_t v12 = &v16;
    v8 = v6;
    dispatch_time_t v11 = v8;
    [v7 setRecognitionReplacementsWithUseRecognitionReplacements:v3 completionHandler:v10];

    if (dispatch_semaphore_wait(v8, v5))
    {
      v9 = RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v21 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Timed out waiting to get attach transcriber for recognition replacements %d", buf, 8u);
      }

      *((unsigned char *)v17 + 24) = 0;
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v16, 8);
}

- (void)startRecognition:(id)a3
{
  id v4 = a3;
  id v5 = [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)self swiftSpeechAnalyzer];
  [v5 startRecognitionWithTranscriberModuleWrapper:v4];
}

- (void)newUtteranceBegins
{
  id v2 = [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)self swiftSpeechAnalyzer];
  [v2 newUtteranceBegins];
}

- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  for (id i = [objc_alloc((Class)NSMutableArray) initWithCapacity:a4]; v4; --v4)
  {
    unsigned int v7 = *a3++;
    v8 = +[NSNumber numberWithInt:v7];
    [i addObject:v8];
  }
  v9 = [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)self swiftSpeechAnalyzer];
  [v9 addAudioSamplesWithAudio:i];
}

- (void)endAudio
{
  id v2 = [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)self swiftSpeechAnalyzer];
  [v2 endAudio];

  BOOL v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ended audio stream", v4, 2u);
  }
}

- (void)cancelRecognition
{
  id v2 = [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)self swiftSpeechAnalyzer];
  [v2 cancelRecognition];

  BOOL v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceled recognition", v4, 2u);
  }
}

- (void)dealloc
{
  BOOL v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SpeechAnalyzerObjC AudioBuffer deallocated", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)RDSAPIObjCSpeechAnalyzerAudioBuffer;
  [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)&v4 dealloc];
}

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)swiftSpeechAnalyzer
{
  return self->_swiftSpeechAnalyzer;
}

- (void)setSwiftSpeechAnalyzer:(id)a3
{
}

- (NSString)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
}

- (unsigned)useRecognitionReplacements
{
  return self->_useRecognitionReplacements;
}

- (void)setUseRecognitionReplacements:(unsigned __int8)a3
{
  self->_useRecognitionReplacements = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_swiftSpeechAnalyzer, 0);
}

@end