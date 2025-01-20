@interface TTSFirstPartyAudioUnit
+ (BOOL)shouldLogSensitiveSpeech;
- (TTSAUMessagingAU)channel;
- (id)defaultSettingsForVoice:(id)a3;
- (id)echo:(id)a3;
- (id)requireFirstUnlockForVoiceLoad;
- (id)voicesExternallyManaged;
- (void)setChannel:(id)a3;
@end

@implementation TTSFirstPartyAudioUnit

- (TTSAUMessagingAU)channel
{
  channel = self->_channel;
  if (!channel)
  {
    v4 = objc_alloc_init(TTSAUMessagingAU);
    v5 = self->_channel;
    self->_channel = v4;

    objc_msgSend_setOwningAudioUnit_(self->_channel, v6, (uint64_t)self, v7, v8);
    channel = self->_channel;
  }

  return channel;
}

- (id)echo:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)defaultSettingsForVoice:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)requireFirstUnlockForVoiceLoad
{
  return (id)MEMORY[0x1E4F1CC28];
}

- (id)voicesExternallyManaged
{
  return (id)MEMORY[0x1E4F1CC38];
}

+ (BOOL)shouldLogSensitiveSpeech
{
  return _AXSSpeechSynthesisOptions() & 1;
}

- (void)setChannel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end