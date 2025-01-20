@interface RDSAPIObjCSpeechAnalyzer
- (NSLocale)locale;
- (RDSAPICSpeechAnalyzerDelegate)delegate;
- (RDSAPIObjCSpeechAnalyzer)initWithLocale:(id)a3;
- (RDSAPIObjCSpeechAnalyzerAudioBuffer)speechAnalyzerAudioBuffer;
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)swiftSpeechAnalyzer;
- (id)getJitProfileData;
- (id)getUserProfileData;
- (unsigned)farField;
- (unsigned)highPriority;
- (void)createRecognitionBufferWithDelegate:(RDSAPICSpeechAnalyzerDelegate *)a3 task:(id)a4;
- (void)dealloc;
- (void)didFinishRecognitionWithError:(id)a3;
- (void)didGetUtteranceBoundary:(int64_t)a3 utteranceEndSampleNumber:(int64_t)a4 totalSamplesSentToASR:(int64_t)a5;
- (void)didRecognizeFinalResults:(id)a3 nBestResults:(id)a4 firstBestResult:(id)a5;
- (void)didRecognizePartialResultTokens:(id)a3;
- (void)setDelegate:(RDSAPICSpeechAnalyzerDelegate *)a3;
- (void)setFarField:(unsigned __int8)a3;
- (void)setHighPriority:(unsigned __int8)a3;
- (void)setJitProfileData:(id)a3;
- (void)setLeftContextText:(id)a3;
- (void)setLocale:(id)a3;
- (void)setRecognitionReplacements:(BOOL)a3;
- (void)setSpeechAnalyzerAudioBuffer:(id)a3;
- (void)setSwiftSpeechAnalyzer:(id)a3;
- (void)setUserProfileData:(id)a3;
@end

@implementation RDSAPIObjCSpeechAnalyzer

- (RDSAPIObjCSpeechAnalyzer)initWithLocale:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RDSAPIObjCSpeechAnalyzer;
  v5 = [(RDSAPIObjCSpeechAnalyzer *)&v10 init];
  v6 = v5;
  if (v5) {
    [(RDSAPIObjCSpeechAnalyzer *)v5 setLocale:v4];
  }
  v7 = [[_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer alloc] initWithDelegate:v6 locale:v6->_locale highPriority:v6->_highPriority != 0 farField:v6->_farField != 0 supportEmojiRecognition:CFPreferencesGetAppBooleanValue(@"UseAssetSupportForEmojiNameRecogition", @"com.apple.SpeechRecognitionCore", 0) != 0];
  [(RDSAPIObjCSpeechAnalyzer *)v6 setSwiftSpeechAnalyzer:v7];

  v8 = [(RDSAPIObjCSpeechAnalyzer *)v6 swiftSpeechAnalyzer];
  [v8 attachAnalysisContextWithCompletionHandler:&stru_1000EDC08];

  return v6;
}

- (void)setHighPriority:(unsigned __int8)a3
{
}

- (void)setFarField:(unsigned __int8)a3
{
}

- (void)createRecognitionBufferWithDelegate:(RDSAPICSpeechAnalyzerDelegate *)a3 task:(id)a4
{
  id v6 = a4;
  [(RDSAPIObjCSpeechAnalyzer *)self setDelegate:a3];
  v7 = [RDSAPIObjCSpeechAnalyzerAudioBuffer alloc];
  speechAnalyzerAudioBuffer = self->_speechAnalyzerAudioBuffer;
  self->_speechAnalyzerAudioBuffer = v7;

  v9 = self->_speechAnalyzerAudioBuffer;
  objc_super v10 = [(RDSAPIObjCSpeechAnalyzer *)self swiftSpeechAnalyzer];
  v11 = [(RDSAPIObjCSpeechAnalyzerAudioBuffer *)v9 initWithSwiftSpeechAnalyzer:v10 task:v6];

  v12 = self->_speechAnalyzerAudioBuffer;
  self->_speechAnalyzerAudioBuffer = v11;

  v13 = self->_speechAnalyzerAudioBuffer;
  v14 = RXOSLog();
  v15 = v14;
  if (v13)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    __int16 v23 = 0;
    v16 = "SpeechAnalyzerObjC transcriber initialized";
    v17 = (uint8_t *)&v23;
    v18 = v15;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v22 = 0;
    v16 = "SpeechAnalyzerObjC transcriber could not be initialized";
    v17 = (uint8_t *)&v22;
    v18 = v15;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl((void *)&_mh_execute_header, v18, v19, v16, v17, 2u);
LABEL_7:

  v20 = self->_speechAnalyzerAudioBuffer;
  return v20;
}

- (void)didRecognizeFinalResults:(id)a3 nBestResults:(id)a4 firstBestResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = RXOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Calling didRecognizeFinalResults", v12, 2u);
  }

  if (*((void *)[(RDSAPIObjCSpeechAnalyzer *)self delegate] + 5)) {
    (*((void (**)(void, id, id, id, id, id, id))[(RDSAPIObjCSpeechAnalyzer *)self delegate] + 5))(*(void *)[(RDSAPIObjCSpeechAnalyzer *)self delegate], v8, v8, v9, v8, v8, v10);
  }
}

- (void)didGetUtteranceBoundary:(int64_t)a3 utteranceEndSampleNumber:(int64_t)a4 totalSamplesSentToASR:(int64_t)a5
{
  if (*((void *)[(RDSAPIObjCSpeechAnalyzer *)self delegate] + 6))
  {
    id v10 = (void (*)(uint64_t, int64_t, int64_t, int64_t))*((void *)[(RDSAPIObjCSpeechAnalyzer *)self delegate]
                                                                                        + 6);
    uint64_t v9 = *(void *)[(RDSAPIObjCSpeechAnalyzer *)self delegate];
    v10(v9, a3, a4, a5);
  }
}

- (void)didRecognizePartialResultTokens:(id)a3
{
  id v4 = a3;
  v5 = RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Calling didRecognizePartialResultTokens", v6, 2u);
  }

  if (*((void *)[(RDSAPIObjCSpeechAnalyzer *)self delegate] + 2)) {
    (*((void (**)(void, id))[(RDSAPIObjCSpeechAnalyzer *)self delegate] + 2))(*(void *)[(RDSAPIObjCSpeechAnalyzer *)self delegate], v4);
  }
}

- (void)didFinishRecognitionWithError:(id)a3
{
  id v4 = RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Recognition Error", v6, 2u);
  }

  if (*((void *)[(RDSAPIObjCSpeechAnalyzer *)self delegate] + 3))
  {
    id v5 = [objc_alloc((Class)NSError) initWithDomain:@"SpeechAPIErrorDomain" code:0 userInfo:0];
    (*((void (**)(void, id))[(RDSAPIObjCSpeechAnalyzer *)self delegate] + 3))(*(void *)[(RDSAPIObjCSpeechAnalyzer *)self delegate], v5);
  }
}

- (void)setLeftContextText:(id)a3
{
  id v4 = a3;
  id v5 = [(RDSAPIObjCSpeechAnalyzer *)self swiftSpeechAnalyzer];
  [v5 setTextWithLeftContextText:v4];
}

- (id)getUserProfileData
{
  v2 = [(RDSAPIObjCSpeechAnalyzer *)self swiftSpeechAnalyzer];
  v3 = [v2 getUserProfileData];

  return v3;
}

- (void)setUserProfileData:(id)a3
{
  id v4 = a3;
  id v5 = [(RDSAPIObjCSpeechAnalyzer *)self swiftSpeechAnalyzer];
  [v5 setContextWithUserProfileData:v4];
}

- (id)getJitProfileData
{
  v2 = [(RDSAPIObjCSpeechAnalyzer *)self swiftSpeechAnalyzer];
  v3 = [v2 getJitProfileData];

  return v3;
}

- (void)setJitProfileData:(id)a3
{
  id v4 = a3;
  id v5 = [(RDSAPIObjCSpeechAnalyzer *)self swiftSpeechAnalyzer];
  [v5 setContextWithJitProfileData:v4];
}

- (void)setRecognitionReplacements:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RDSAPIObjCSpeechAnalyzer *)self speechAnalyzerAudioBuffer];
  [v4 setRecognitionReplacements:v3];
}

- (void)dealloc
{
  BOOL v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SpeechAnalyzerObjC deallocated", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)RDSAPIObjCSpeechAnalyzer;
  [(RDSAPIObjCSpeechAnalyzer *)&v4 dealloc];
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (RDSAPICSpeechAnalyzerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(RDSAPICSpeechAnalyzerDelegate *)a3
{
  self->_delegate = a3;
}

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond25RDSAPISwiftSpeechAnalyzer)swiftSpeechAnalyzer
{
  return self->_swiftSpeechAnalyzer;
}

- (void)setSwiftSpeechAnalyzer:(id)a3
{
}

- (unsigned)highPriority
{
  return self->_highPriority;
}

- (unsigned)farField
{
  return self->_farField;
}

- (RDSAPIObjCSpeechAnalyzerAudioBuffer)speechAnalyzerAudioBuffer
{
  return self->_speechAnalyzerAudioBuffer;
}

- (void)setSpeechAnalyzerAudioBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechAnalyzerAudioBuffer, 0);
  objc_storeStrong((id *)&self->_swiftSpeechAnalyzer, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end