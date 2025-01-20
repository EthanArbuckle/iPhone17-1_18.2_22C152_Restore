@interface SVXSpeechSynthesisContext
- (BOOL)handledPresynthesizedAudioRequest;
- (BOOL)handledSpeechRequest;
- (BOOL)isStreamingSynthesisRequest;
- (NSArray)speechWordTimingInfoArray;
- (NSDictionary)analyticsContext;
- (NSString)languageCode;
- (NSString)voiceName;
- (SVXAudioSessionAssertion)audioSessionAssertion;
- (SVXSpeechSynthesisContext)initWithOperationType:(int64_t)a3 request:(id)a4 languageCode:(id)a5 voiceName:(id)a6 gender:(int64_t)a7 audioSessionID:(unsigned int)a8 preparation:(id)a9 audioChunkHandler:(id)a10 finalization:(id)a11 taskTracker:(id)a12 analyticsContext:(id)a13;
- (SVXSpeechSynthesisRequest)request;
- (SVXTaskTracking)taskTracker;
- (SiriTTSAudioRequest)presynthesizedAudioRequest;
- (SiriTTSInstrumentationMetrics)instrumentMetrics;
- (SiriTTSSpeechRequest)speechRequest;
- (SiriTTSSynthesisRequest)synthesisRequest;
- (id)description;
- (int64_t)gender;
- (int64_t)operationType;
- (unsigned)audioSessionID;
- (void)dealloc;
- (void)finalizeWithResultType:(int64_t)a3 utteranceInfo:(id)a4 error:(id)a5;
- (void)handleAudioChunkData:(id)a3;
- (void)prepare;
- (void)setAudioSessionAssertion:(id)a3;
- (void)setHandledPresynthesizedAudioRequest:(BOOL)a3;
- (void)setHandledSpeechRequest:(BOOL)a3;
- (void)setInstrumentMetrics:(id)a3;
- (void)setIsStreamingSynthesisRequest:(BOOL)a3;
- (void)setPresynthesizedAudioRequest:(id)a3;
- (void)setSpeechRequest:(id)a3;
- (void)setSpeechWordTimingInfoArray:(id)a3;
- (void)setSynthesisRequest:(id)a3;
@end

@implementation SVXSpeechSynthesisContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSessionAssertion, 0);
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_speechWordTimingInfoArray, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_synthesisRequest, 0);
  objc_storeStrong((id *)&self->_speechRequest, 0);
  objc_storeStrong((id *)&self->_presynthesizedAudioRequest, 0);
  objc_storeStrong((id *)&self->_analyticsContext, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_finalization, 0);
  objc_storeStrong(&self->_audioChunkHandler, 0);

  objc_storeStrong(&self->_preparation, 0);
}

- (void)setAudioSessionAssertion:(id)a3
{
}

- (SVXAudioSessionAssertion)audioSessionAssertion
{
  return self->_audioSessionAssertion;
}

- (SVXTaskTracking)taskTracker
{
  return self->_taskTracker;
}

- (void)setSpeechWordTimingInfoArray:(id)a3
{
}

- (NSArray)speechWordTimingInfoArray
{
  return self->_speechWordTimingInfoArray;
}

- (void)setInstrumentMetrics:(id)a3
{
}

- (SiriTTSInstrumentationMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setSynthesisRequest:(id)a3
{
}

- (SiriTTSSynthesisRequest)synthesisRequest
{
  return self->_synthesisRequest;
}

- (void)setSpeechRequest:(id)a3
{
}

- (SiriTTSSpeechRequest)speechRequest
{
  return self->_speechRequest;
}

- (void)setPresynthesizedAudioRequest:(id)a3
{
}

- (SiriTTSAudioRequest)presynthesizedAudioRequest
{
  return self->_presynthesizedAudioRequest;
}

- (void)setIsStreamingSynthesisRequest:(BOOL)a3
{
  self->_isStreamingSynthesisRequest = a3;
}

- (BOOL)isStreamingSynthesisRequest
{
  return self->_isStreamingSynthesisRequest;
}

- (void)setHandledSpeechRequest:(BOOL)a3
{
  self->_handledSpeechRequest = a3;
}

- (BOOL)handledSpeechRequest
{
  return self->_handledSpeechRequest;
}

- (void)setHandledPresynthesizedAudioRequest:(BOOL)a3
{
  self->_handledPresynthesizedAudioRequest = a3;
}

- (BOOL)handledPresynthesizedAudioRequest
{
  return self->_handledPresynthesizedAudioRequest;
}

- (NSDictionary)analyticsContext
{
  return self->_analyticsContext;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (SVXSpeechSynthesisRequest)request
{
  return self->_request;
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (void)finalizeWithResultType:(int64_t)a3 utteranceInfo:(id)a4 error:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  id preparation = self->_preparation;
  if (preparation)
  {
    self->_id preparation = 0;
  }
  [(SVXAudioSessionAssertion *)self->_audioSessionAssertion relinquish];
  finalization = (void (**)(id, SVXSpeechSynthesisResult *))self->_finalization;
  if (finalization)
  {
    v11 = [[SVXSpeechSynthesisResult alloc] initWithType:a3 utteranceInfo:v13 error:v8];
    finalization[2](finalization, v11);

    id v12 = self->_finalization;
    self->_finalization = 0;
  }
}

- (void)handleAudioChunkData:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t audioChunkCount = self->_audioChunkCount;
  id audioChunkHandler = self->_audioChunkHandler;
  self->_unint64_t audioChunkCount = audioChunkCount + 1;
  if (audioChunkHandler)
  {
    v7 = [[SVXSpeechSynthesizerAudioData alloc] initWithAudioChunkData:v4 audioChunkIndex:audioChunkCount];
    (*((void (**)(void))self->_audioChunkHandler + 2))();
  }
  else
  {
    id v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "-[SVXSpeechSynthesisContext handleAudioChunkData:]";
      _os_log_error_impl(&dword_220062000, v8, OS_LOG_TYPE_ERROR, "%s AudioChunkData received but no handler is set to take it", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)prepare
{
  id preparation = (void (**)(id, SEL))self->_preparation;
  if (preparation)
  {
    preparation[2](preparation, a2);
    id v4 = self->_preparation;
    self->_id preparation = 0;
  }
}

- (SVXSpeechSynthesisContext)initWithOperationType:(int64_t)a3 request:(id)a4 languageCode:(id)a5 voiceName:(id)a6 gender:(int64_t)a7 audioSessionID:(unsigned int)a8 preparation:(id)a9 audioChunkHandler:(id)a10 finalization:(id)a11 taskTracker:(id)a12 analyticsContext:(id)a13
{
  id v43 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  v44.receiver = self;
  v44.super_class = (Class)SVXSpeechSynthesisContext;
  v24 = [(SVXSpeechSynthesisContext *)&v44 init];
  v25 = v24;
  if (v24)
  {
    v24->_operationType = a3;
    uint64_t v26 = [v43 copy];
    request = v25->_request;
    v25->_request = (SVXSpeechSynthesisRequest *)v26;

    uint64_t v28 = [v17 copy];
    languageCode = v25->_languageCode;
    v25->_languageCode = (NSString *)v28;

    uint64_t v30 = [v18 copy];
    voiceName = v25->_voiceName;
    v25->_voiceName = (NSString *)v30;

    v25->_gender = a7;
    v25->_audioSessionID = a8;
    uint64_t v32 = [v19 copy];
    id preparation = v25->_preparation;
    v25->_id preparation = (id)v32;

    v25->_unint64_t audioChunkCount = 0;
    uint64_t v34 = MEMORY[0x223C65C40](v20);
    id audioChunkHandler = v25->_audioChunkHandler;
    v25->_id audioChunkHandler = (id)v34;

    uint64_t v36 = [v21 copy];
    id finalization = v25->_finalization;
    v25->_id finalization = (id)v36;

    objc_storeStrong((id *)&v25->_taskTracker, a12);
    uint64_t v38 = [v23 copy];
    analyticsContext = v25->_analyticsContext;
    v25->_analyticsContext = (NSDictionary *)v38;
  }
  return v25;
}

- (id)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)SVXSpeechSynthesisContext;
  id v4 = [(SVXSpeechSynthesisContext *)&v15 description];
  unint64_t operationType = self->_operationType;
  if (operationType > 2) {
    v6 = @"(unknown)";
  }
  else {
    v6 = off_264552600[operationType];
  }
  v7 = v6;
  request = self->_request;
  languageCode = self->_languageCode;
  unint64_t gender = self->_gender;
  if (gender > 3) {
    uint64_t v11 = @"(unknown)";
  }
  else {
    uint64_t v11 = off_264552568[gender];
  }
  id v12 = v11;
  id v13 = [v3 stringWithFormat:@"%@ {operationType = %@, request = %@, languageCode = %@, gender = %@, name = %@, audioSessionID = %u, taskTracker = %@}", v4, v7, request, languageCode, v12, self->_voiceName, self->_audioSessionID, self->_taskTracker];

  return v13;
}

- (void)dealloc
{
  [(SVXSpeechSynthesisContext *)self finalizeWithResultType:2 utteranceInfo:0 error:0];
  v3.receiver = self;
  v3.super_class = (Class)SVXSpeechSynthesisContext;
  [(SVXSpeechSynthesisContext *)&v3 dealloc];
}

@end