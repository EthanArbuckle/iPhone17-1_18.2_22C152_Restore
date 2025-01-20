@interface _SMTTCUPackageMutation
- (BOOL)isDirty;
- (_SMTTCUPackageMutation)initWithBase:(id)a3;
- (double)getEndAudioTimeStampInMs;
- (double)getStartAudioTimeStampInMs;
- (id)getPrevTCUIds;
- (id)getRequestId;
- (id)getSiriIntendedInfo;
- (id)getSpeechPackage;
- (id)getTcuId;
- (int64_t)getSpeechEvent;
- (int64_t)getTcuState;
- (int64_t)getVoiceTriggerPhraseType;
- (void)setEndAudioTimeStampInMs:(double)a3;
- (void)setPrevTCUIds:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setSiriIntendedInfo:(id)a3;
- (void)setSpeechEvent:(int64_t)a3;
- (void)setSpeechPackage:(id)a3;
- (void)setStartAudioTimeStampInMs:(double)a3;
- (void)setTcuId:(id)a3;
- (void)setTcuState:(int64_t)a3;
- (void)setVoiceTriggerPhraseType:(int64_t)a3;
@end

@implementation _SMTTCUPackageMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechPackage, 0);
  objc_storeStrong((id *)&self->_prevTCUIds, 0);
  objc_storeStrong((id *)&self->_siriIntendedInfo, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_tcuId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setSpeechPackage:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getSpeechPackage
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_speechPackage;
  }
  else
  {
    v2 = [(SMTTCUPackage *)self->_base speechPackage];
  }
  return v2;
}

- (void)setEndAudioTimeStampInMs:(double)a3
{
  self->_endAudioTimeStampInMs = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (double)getEndAudioTimeStampInMs
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0) {
    return self->_endAudioTimeStampInMs;
  }
  [(SMTTCUPackage *)self->_base endAudioTimeStampInMs];
  return result;
}

- (void)setStartAudioTimeStampInMs:(double)a3
{
  self->_startAudioTimeStampInMs = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (double)getStartAudioTimeStampInMs
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    return self->_startAudioTimeStampInMs;
  }
  [(SMTTCUPackage *)self->_base startAudioTimeStampInMs];
  return result;
}

- (void)setPrevTCUIds:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getPrevTCUIds
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_prevTCUIds;
  }
  else
  {
    v2 = [(SMTTCUPackage *)self->_base prevTCUIds];
  }
  return v2;
}

- (void)setSiriIntendedInfo:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getSiriIntendedInfo
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_siriIntendedInfo;
  }
  else
  {
    v2 = [(SMTTCUPackage *)self->_base siriIntendedInfo];
  }
  return v2;
}

- (void)setVoiceTriggerPhraseType:(int64_t)a3
{
  self->_voiceTriggerPhraseType = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (int64_t)getVoiceTriggerPhraseType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0) {
    return self->_voiceTriggerPhraseType;
  }
  else {
    return [(SMTTCUPackage *)self->_base voiceTriggerPhraseType];
  }
}

- (void)setSpeechEvent:(int64_t)a3
{
  self->_speechEvent = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (int64_t)getSpeechEvent
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0) {
    return self->_speechEvent;
  }
  else {
    return [(SMTTCUPackage *)self->_base speechEvent];
  }
}

- (void)setTcuState:(int64_t)a3
{
  self->_tcuState = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (int64_t)getTcuState
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0) {
    return self->_tcuState;
  }
  else {
    return [(SMTTCUPackage *)self->_base tcuState];
  }
}

- (void)setRequestId:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getRequestId
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_requestId;
  }
  else
  {
    v2 = [(SMTTCUPackage *)self->_base requestId];
  }
  return v2;
}

- (void)setTcuId:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getTcuId
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_tcuId;
  }
  else
  {
    v2 = [(SMTTCUPackage *)self->_base tcuId];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_SMTTCUPackageMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SMTTCUPackageMutation;
  v6 = [(_SMTTCUPackageMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end