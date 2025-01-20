@interface RDSpeechSynthesis
+ (id)sharedManager;
- (AVSpeechSynthesizer)m_synth;
- (RDSpeechSynthesis)init;
- (void)_waitAndFinishSpeaking;
- (void)dealloc;
- (void)setM_synth:(id)a3;
- (void)speakString:(id)a3 toURL:(id)a4 withLanguageCode:(id)a5 withCallback:(RDSpeechSynthesisCallback *)a6;
@end

@implementation RDSpeechSynthesis

+ (id)sharedManager
{
  if (qword_1000FEAB0 != -1) {
    dispatch_once(&qword_1000FEAB0, &stru_1000EE168);
  }
  return (id)qword_1000FEAB8;
}

- (RDSpeechSynthesis)init
{
  v5.receiver = self;
  v5.super_class = (Class)RDSpeechSynthesis;
  v2 = [(RDSpeechSynthesis *)&v5 init];
  if (v2)
  {
    v3 = (AVSpeechSynthesizer *)objc_alloc_init((Class)AVSpeechSynthesizer);
    v2->_m_synth = v3;
    [(AVSpeechSynthesizer *)v3 setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RDSpeechSynthesis;
  [(RDSpeechSynthesis *)&v3 dealloc];
}

- (void)speakString:(id)a3 toURL:(id)a4 withLanguageCode:(id)a5 withCallback:(RDSpeechSynthesisCallback *)a6
{
  self->m_callback = *a6;
  v9 = +[AVSpeechUtterance speechUtteranceWithString:a3];
  [(AVSpeechUtterance *)v9 setVoice:+[AVSpeechSynthesisVoice voiceWithLanguage:a5]];
  LODWORD(v10) = 0.5;
  [(AVSpeechUtterance *)v9 setRate:v10];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = sub_10000A49C;
  v17 = sub_10000A4AC;
  uint64_t v18 = 0;
  m_synth = self->_m_synth;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000A4B8;
  v12[3] = &unk_1000EE190;
  v12[4] = a4;
  v12[5] = &v13;
  [(AVSpeechSynthesizer *)m_synth writeUtterance:v9 toBufferCallback:v12];
  [(RDSpeechSynthesis *)self _waitAndFinishSpeaking];

  v14[5] = 0;
  _Block_object_dispose(&v13, 8);
}

- (void)_waitAndFinishSpeaking
{
  usleep(0x7A120u);
  if ([(AVSpeechSynthesizer *)self->_m_synth isSpeaking])
  {
    do
      usleep(0x186A0u);
    while ([(AVSpeechSynthesizer *)self->_m_synth isSpeaking]);
  }
  ctx = self->m_callback.ctx;
  DidFinishSpeaking = (void (*)(void *))self->m_callback.DidFinishSpeaking;
  DidFinishSpeaking(ctx);
}

- (AVSpeechSynthesizer)m_synth
{
  return self->_m_synth;
}

- (void)setM_synth:(id)a3
{
}

@end