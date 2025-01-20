@interface SiriTTSSynthesisEngineRequest
- (BOOL)privacySensitive;
- (NSString)text;
- (float)neuralSentenceDuration;
- (float)neuralSentenceEnergy;
- (float)neuralSentencePitch;
- (float)neuralSentencePitchRange;
- (float)neuralSentenceTilt;
- (float)pitch;
- (float)rate;
- (float)volume;
- (id)audioHandler;
- (id)neuralFallbackHandler;
- (id)promptHandler;
- (id)synthesisIssueHandler;
- (id)useHydraFrontendHandler;
- (id)wordTimingsHandler;
- (unint64_t)profile;
- (void)setAudioHandler:(id)a3;
- (void)setNeuralFallbackHandler:(id)a3;
- (void)setNeuralSentenceDuration:(float)a3;
- (void)setNeuralSentenceEnergy:(float)a3;
- (void)setNeuralSentencePitch:(float)a3;
- (void)setNeuralSentencePitchRange:(float)a3;
- (void)setNeuralSentenceTilt:(float)a3;
- (void)setPitch:(float)a3;
- (void)setPrivacySensitive:(BOOL)a3;
- (void)setProfile:(unint64_t)a3;
- (void)setPromptHandler:(id)a3;
- (void)setRate:(float)a3;
- (void)setSynthesisIssueHandler:(id)a3;
- (void)setText:(id)a3;
- (void)setUseHydraFrontendHandler:(id)a3;
- (void)setVolume:(float)a3;
- (void)setWordTimingsHandler:(id)a3;
@end

@implementation SiriTTSSynthesisEngineRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_synthesisIssueHandler, 0);
  objc_storeStrong(&self->_useHydraFrontendHandler, 0);
  objc_storeStrong(&self->_neuralFallbackHandler, 0);
  objc_storeStrong(&self->_wordTimingsHandler, 0);
  objc_storeStrong(&self->_promptHandler, 0);
  objc_storeStrong(&self->_audioHandler, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setSynthesisIssueHandler:(id)a3
{
}

- (id)synthesisIssueHandler
{
  return self->_synthesisIssueHandler;
}

- (void)setUseHydraFrontendHandler:(id)a3
{
}

- (id)useHydraFrontendHandler
{
  return self->_useHydraFrontendHandler;
}

- (void)setNeuralFallbackHandler:(id)a3
{
}

- (id)neuralFallbackHandler
{
  return self->_neuralFallbackHandler;
}

- (void)setWordTimingsHandler:(id)a3
{
}

- (id)wordTimingsHandler
{
  return self->_wordTimingsHandler;
}

- (void)setPromptHandler:(id)a3
{
}

- (id)promptHandler
{
  return self->_promptHandler;
}

- (void)setAudioHandler:(id)a3
{
}

- (id)audioHandler
{
  return self->_audioHandler;
}

- (void)setNeuralSentenceTilt:(float)a3
{
  self->_neuralSentenceTilt = a3;
}

- (float)neuralSentenceTilt
{
  return self->_neuralSentenceTilt;
}

- (void)setNeuralSentenceEnergy:(float)a3
{
  self->_neuralSentenceEnergy = a3;
}

- (float)neuralSentenceEnergy
{
  return self->_neuralSentenceEnergy;
}

- (void)setNeuralSentenceDuration:(float)a3
{
  self->_neuralSentenceDuration = a3;
}

- (float)neuralSentenceDuration
{
  return self->_neuralSentenceDuration;
}

- (void)setNeuralSentencePitchRange:(float)a3
{
  self->_neuralSentencePitchRange = a3;
}

- (float)neuralSentencePitchRange
{
  return self->_neuralSentencePitchRange;
}

- (void)setNeuralSentencePitch:(float)a3
{
  self->_neuralSentencePitch = a3;
}

- (float)neuralSentencePitch
{
  return self->_neuralSentencePitch;
}

- (void)setProfile:(unint64_t)a3
{
  self->_profile = a3;
}

- (unint64_t)profile
{
  return self->_profile;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setPitch:(float)a3
{
  self->_pitch = a3;
}

- (float)pitch
{
  return self->_pitch;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)rate
{
  return self->_rate;
}

- (void)setPrivacySensitive:(BOOL)a3
{
  self->_privacySensitive = a3;
}

- (BOOL)privacySensitive
{
  return self->_privacySensitive;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

@end