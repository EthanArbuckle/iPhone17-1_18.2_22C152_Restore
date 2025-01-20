@interface SRUIFSpeechSynthesisRequest
- (BOOL)canUseServerTTS;
- (BOOL)delayed;
- (BOOL)eligibleAfterDuration;
- (BOOL)isPhonetic;
- (BOOL)provisional;
- (NSDictionary)analyticsContext;
- (NSDictionary)speakableContextInfo;
- (NSString)gender;
- (NSString)identifier;
- (NSString)language;
- (NSString)preparationIdentifier;
- (NSString)sessionId;
- (NSString)text;
- (NSString)voiceName;
- (SAUIAudioData)audioData;
- (SRUIFSpeechSynthesisRequest)initWithAudioData:(id)a3 identifier:(id)a4 sessionId:(id)a5 provisionally:(BOOL)a6 eligibleAfterDuration:(double)a7 canUseServerTTS:(BOOL)a8 completion:(id)a9;
- (SRUIFSpeechSynthesisRequest)initWithText:(id)a3 audioData:(id)a4 identifier:(id)a5 sessionId:(id)a6 language:(id)a7 gender:(id)a8 voiceName:(id)a9 provisional:(BOOL)a10 eligibleAfterDuration:(double)a11 delayed:(BOOL)a12 preparationIdentifier:(id)a13 completion:(id)a14 analyticsContext:(id)a15 speakableContextInfo:(id)a16 canUseServerTTS:(BOOL)a17;
- (SRUIFSpeechSynthesisRequest)initWithText:(id)a3 identifier:(id)a4 sessionId:(id)a5 language:(id)a6 gender:(id)a7 voiceName:(id)a8 canUseServerTTS:(BOOL)a9 completion:(id)a10;
- (id)completion;
@end

@implementation SRUIFSpeechSynthesisRequest

- (SRUIFSpeechSynthesisRequest)initWithText:(id)a3 audioData:(id)a4 identifier:(id)a5 sessionId:(id)a6 language:(id)a7 gender:(id)a8 voiceName:(id)a9 provisional:(BOOL)a10 eligibleAfterDuration:(double)a11 delayed:(BOOL)a12 preparationIdentifier:(id)a13 completion:(id)a14 analyticsContext:(id)a15 speakableContextInfo:(id)a16 canUseServerTTS:(BOOL)a17
{
  id v58 = a3;
  id v57 = a4;
  id v56 = a5;
  id v55 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  v59.receiver = self;
  v59.super_class = (Class)SRUIFSpeechSynthesisRequest;
  v30 = [(SRUIFSpeechSynthesisRequest *)&v59 init];
  if (v30)
  {
    uint64_t v31 = [v58 copy];
    text = v30->_text;
    v30->_text = (NSString *)v31;

    uint64_t v33 = [v56 copy];
    identifier = v30->_identifier;
    v30->_identifier = (NSString *)v33;

    uint64_t v35 = [v55 copy];
    sessionId = v30->_sessionId;
    v30->_sessionId = (NSString *)v35;

    v30->_provisional = a10;
    v30->_delayed = a12;
    v30->_canUseServerTTS = a17;
    uint64_t v37 = MEMORY[0x22A643DA0](v27);
    id completion = v30->_completion;
    v30->_id completion = (id)v37;

    uint64_t v39 = [v28 copy];
    analyticsContext = v30->_analyticsContext;
    v30->_analyticsContext = (NSDictionary *)v39;

    uint64_t v41 = [v29 copy];
    speakableContextInfo = v30->_speakableContextInfo;
    v30->_speakableContextInfo = (NSDictionary *)v41;

    uint64_t v43 = [v23 copy];
    language = v30->_language;
    v30->_language = (NSString *)v43;

    uint64_t v45 = [v24 copy];
    gender = v30->_gender;
    v30->_gender = (NSString *)v45;

    uint64_t v47 = [v25 copy];
    voiceName = v30->_voiceName;
    v30->_voiceName = (NSString *)v47;

    uint64_t v49 = [v57 copy];
    audioData = v30->_audioData;
    v30->_audioData = (SAUIAudioData *)v49;

    v30->_eligibleAfterDuration = a11 != 0.0;
    objc_storeStrong((id *)&v30->_preparationIdentifier, a13);
    uint64_t v51 = MEMORY[0x22A643DA0](v27);
    id v52 = v30->_completion;
    v30->_id completion = (id)v51;
  }
  return v30;
}

- (SRUIFSpeechSynthesisRequest)initWithText:(id)a3 identifier:(id)a4 sessionId:(id)a5 language:(id)a6 gender:(id)a7 voiceName:(id)a8 canUseServerTTS:(BOOL)a9 completion:(id)a10
{
  LOBYTE(v12) = a9;
  LOWORD(v11) = 0;
  return -[SRUIFSpeechSynthesisRequest initWithText:audioData:identifier:sessionId:language:gender:voiceName:provisional:eligibleAfterDuration:delayed:preparationIdentifier:completion:analyticsContext:speakableContextInfo:canUseServerTTS:](self, "initWithText:audioData:identifier:sessionId:language:gender:voiceName:provisional:eligibleAfterDuration:delayed:preparationIdentifier:completion:analyticsContext:speakableContextInfo:canUseServerTTS:", a3, 0, a4, a5, a6, a7, 0.0, a8, v11, 0, a10, 0, 0, v12);
}

- (SRUIFSpeechSynthesisRequest)initWithAudioData:(id)a3 identifier:(id)a4 sessionId:(id)a5 provisionally:(BOOL)a6 eligibleAfterDuration:(double)a7 canUseServerTTS:(BOOL)a8 completion:(id)a9
{
  LOBYTE(v11) = a8;
  LOWORD(v10) = a6;
  return -[SRUIFSpeechSynthesisRequest initWithText:audioData:identifier:sessionId:language:gender:voiceName:provisional:eligibleAfterDuration:delayed:preparationIdentifier:completion:analyticsContext:speakableContextInfo:canUseServerTTS:](self, "initWithText:audioData:identifier:sessionId:language:gender:voiceName:provisional:eligibleAfterDuration:delayed:preparationIdentifier:completion:analyticsContext:speakableContextInfo:canUseServerTTS:", 0, a3, a4, a5, 0, 0, a7, 0, v10, 0, a9, 0, 0, v11);
}

- (NSString)text
{
  return self->_text;
}

- (SAUIAudioData)audioData
{
  return self->_audioData;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)gender
{
  return self->_gender;
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (BOOL)isPhonetic
{
  return self->_isPhonetic;
}

- (BOOL)provisional
{
  return self->_provisional;
}

- (BOOL)delayed
{
  return self->_delayed;
}

- (BOOL)eligibleAfterDuration
{
  return self->_eligibleAfterDuration;
}

- (BOOL)canUseServerTTS
{
  return self->_canUseServerTTS;
}

- (NSDictionary)analyticsContext
{
  return self->_analyticsContext;
}

- (NSDictionary)speakableContextInfo
{
  return self->_speakableContextInfo;
}

- (NSString)preparationIdentifier
{
  return self->_preparationIdentifier;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_preparationIdentifier, 0);
  objc_storeStrong((id *)&self->_speakableContextInfo, 0);
  objc_storeStrong((id *)&self->_analyticsContext, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end