@interface TTSAUSSEWrapper
+ (id)makeAU:(id)a3;
- (AUAudioUnit)audioUnit;
- (TTSAUSSEWrapper)initWithAudioUnit:(id)a3;
- (void)cancelSpeechRequest;
- (void)setAudioUnit:(id)a3;
- (void)synthesizeSpeechRequest:(id)a3;
@end

@implementation TTSAUSSEWrapper

+ (id)makeAU:(id)a3
{
  id v3 = a3;

  return v3;
}

- (TTSAUSSEWrapper)initWithAudioUnit:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTSAUSSEWrapper;
  v6 = [(TTSAUSSEWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioUnit, a3);
  }

  return v7;
}

- (void)cancelSpeechRequest
{
}

- (void)synthesizeSpeechRequest:(id)a3
{
}

- (AUAudioUnit)audioUnit
{
  return self->_audioUnit;
}

- (void)setAudioUnit:(id)a3
{
}

- (void).cxx_destruct
{
}

@end