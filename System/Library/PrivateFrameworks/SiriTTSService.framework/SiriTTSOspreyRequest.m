@interface SiriTTSOspreyRequest
- (BOOL)serverLogs;
- (NSString)appId;
- (NSString)experimentId;
- (NSString)language;
- (NSString)preferredType;
- (NSString)speechId;
- (NSString)text;
- (NSString)voiceName;
- (float)neuralSentenceDuration;
- (float)neuralSentenceEnergy;
- (float)neuralSentencePitch;
- (float)neuralSentencePitchRange;
- (float)neuralSentenceTilt;
- (float)pitch;
- (float)rate;
- (float)volume;
- (id)underlyingRequest;
- (unint64_t)requestCreatedTime;
- (void)setAppId:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setNeuralSentenceDuration:(float)a3;
- (void)setNeuralSentenceEnergy:(float)a3;
- (void)setNeuralSentencePitch:(float)a3;
- (void)setNeuralSentencePitchRange:(float)a3;
- (void)setNeuralSentenceTilt:(float)a3;
- (void)setPitch:(float)a3;
- (void)setPreferredType:(id)a3;
- (void)setRate:(float)a3;
- (void)setRequestCreatedTime:(unint64_t)a3;
- (void)setServerLogs:(BOOL)a3;
- (void)setSpeechId:(id)a3;
- (void)setText:(id)a3;
- (void)setVoiceName:(id)a3;
- (void)setVolume:(float)a3;
@end

@implementation SiriTTSOspreyRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_preferredType, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (void)setServerLogs:(BOOL)a3
{
  self->_serverLogs = a3;
}

- (BOOL)serverLogs
{
  return self->_serverLogs;
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

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)rate
{
  return self->_rate;
}

- (void)setPitch:(float)a3
{
  self->_pitch = a3;
}

- (float)pitch
{
  return self->_pitch;
}

- (void)setRequestCreatedTime:(unint64_t)a3
{
  self->_requestCreatedTime = a3;
}

- (unint64_t)requestCreatedTime
{
  return self->_requestCreatedTime;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setAppId:(id)a3
{
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setSpeechId:(id)a3
{
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setPreferredType:(id)a3
{
}

- (NSString)preferredType
{
  return self->_preferredType;
}

- (void)setVoiceName:(id)a3
{
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (id)underlyingRequest
{
  v3 = objc_alloc_init(OPTTSMutableStartTextToSpeechStreamingRequest);
  v4 = [(SiriTTSOspreyRequest *)self speechId];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setSpeech_id:v4];

  v5 = [MEMORY[0x1E4F29128] UUID];
  v6 = [v5 UUIDString];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setSession_id:v6];

  v7 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = [v7 UUIDString];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setStream_id:v8];

  v9 = [(SiriTTSOspreyRequest *)self language];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setLanguage:v9];

  v10 = [(SiriTTSOspreyRequest *)self voiceName];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setVoice_name:v10];

  v11 = [(SiriTTSOspreyRequest *)self preferredType];
  LOBYTE(v8) = [v11 isEqualToString:@"neural"];

  if (v8)
  {
    uint64_t v12 = 1;
LABEL_5:
    [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setPreferred_voice_type:v12];
    goto LABEL_6;
  }
  v13 = [(SiriTTSOspreyRequest *)self preferredType];
  int v14 = [v13 isEqualToString:@"gryphon"];

  if (v14)
  {
    uint64_t v12 = 2;
    goto LABEL_5;
  }
LABEL_6:
  v15 = objc_alloc_init(OPTTSMutableTextToSpeechRequestProsodyControlConfig);
  [(SiriTTSOspreyRequest *)self neuralSentencePitch];
  -[OPTTSMutableTextToSpeechRequestProsodyControlConfig setGlobal_sent_pitch:](v15, "setGlobal_sent_pitch:");
  [(SiriTTSOspreyRequest *)self neuralSentencePitchRange];
  -[OPTTSMutableTextToSpeechRequestProsodyControlConfig setGlobal_sent_pitchrange:](v15, "setGlobal_sent_pitchrange:");
  [(SiriTTSOspreyRequest *)self neuralSentenceDuration];
  -[OPTTSMutableTextToSpeechRequestProsodyControlConfig setGlobal_sent_duration:](v15, "setGlobal_sent_duration:");
  [(SiriTTSOspreyRequest *)self neuralSentenceEnergy];
  -[OPTTSMutableTextToSpeechRequestProsodyControlConfig setGlobal_sent_energy:](v15, "setGlobal_sent_energy:");
  [(SiriTTSOspreyRequest *)self neuralSentenceTilt];
  -[OPTTSMutableTextToSpeechRequestProsodyControlConfig setGlobal_sent_tilt:](v15, "setGlobal_sent_tilt:");
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setProsody_control_config:v15];
  v16 = [(SiriTTSOspreyRequest *)self text];
  [(SiriTTSOspreyRequest *)self volume];
  if (v17 != 0.8)
  {
    [(SiriTTSOspreyRequest *)self volume];
    if (v18 != 0.0)
    {
      v19 = NSString;
      [(SiriTTSOspreyRequest *)self volume];
      uint64_t v21 = [v19 stringWithFormat:@"\x1B\\vol=%d\\%@", (int)(v20 * 100.0), v16];

      v16 = (void *)v21;
    }
  }
  [(SiriTTSOspreyRequest *)self rate];
  if (v22 != 1.0)
  {
    [(SiriTTSOspreyRequest *)self rate];
    if (v23 != 0.0)
    {
      v24 = NSString;
      [(SiriTTSOspreyRequest *)self rate];
      uint64_t v26 = [v24 stringWithFormat:@"\x1B\\rate=%d\\%@", (int)(v25 * 100.0), v16];

      v16 = (void *)v26;
    }
  }
  [(SiriTTSOspreyRequest *)self pitch];
  if (v27 != 1.0)
  {
    [(SiriTTSOspreyRequest *)self pitch];
    if (v28 != 0.0)
    {
      v29 = NSString;
      [(SiriTTSOspreyRequest *)self pitch];
      uint64_t v31 = [v29 stringWithFormat:@"\x1B\\pitch=%d\\%@", (int)(v30 * 100.0), v16];

      v16 = (void *)v31;
    }
  }
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setText:v16];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setAudio_type:1];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setEnable_word_timing_info:1];
  if ([(SiriTTSOspreyRequest *)self serverLogs])
  {
    v32 = objc_alloc_init(OPTTSMutableTTSRequestFeatureFlags);
    [(OPTTSMutableTTSRequestFeatureFlags *)v32 setFe_feature:1];
    [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setFeature_flags:v32];
  }
  v33 = objc_alloc_init(OPTTSMutableTextToSpeechRequestMeta);
  v34 = [(SiriTTSOspreyRequest *)self appId];
  [(OPTTSMutableTextToSpeechRequestMeta *)v33 setApp_id:v34];

  [(OPTTSMutableTextToSpeechRequestMeta *)v33 setChannel_type:2];
  [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setMeta_info:v33];
  v35 = [(SiriTTSOspreyRequest *)self experimentId];

  if (v35)
  {
    v36 = objc_alloc_init(OPTTSMutableTextToSpeechRequestExperiment);
    v37 = [(SiriTTSOspreyRequest *)self experimentId];
    [(OPTTSMutableTextToSpeechRequestExperiment *)v36 setExperiment_identifier:v37];

    [(OPTTSMutableStartTextToSpeechStreamingRequest *)v3 setExperiment:v36];
  }

  return v3;
}

@end