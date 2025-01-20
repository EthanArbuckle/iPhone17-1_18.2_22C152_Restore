@interface SMTTCUPackage
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSpeechPackage)speechPackage;
- (BOOL)isEqual:(id)a3;
- (NSArray)prevTCUIds;
- (NSString)requestId;
- (NSString)tcuId;
- (SMTSiriIntendedInfo)siriIntendedInfo;
- (SMTTCUPackage)init;
- (SMTTCUPackage)initWithBuilder:(id)a3;
- (SMTTCUPackage)initWithCoder:(id)a3;
- (SMTTCUPackage)initWithTcuId:(id)a3 requestId:(id)a4 tcuState:(int64_t)a5 speechEvent:(int64_t)a6 voiceTriggerPhraseType:(int64_t)a7 siriIntendedInfo:(id)a8 prevTCUIds:(id)a9 startAudioTimeStampInMs:(double)a10 endAudioTimeStampInMs:(double)a11 speechPackage:(id)a12;
- (double)endAudioTimeStampInMs;
- (double)startAudioTimeStampInMs;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)speechEvent;
- (int64_t)tcuState;
- (int64_t)voiceTriggerPhraseType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMTTCUPackage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechPackage, 0);
  objc_storeStrong((id *)&self->_prevTCUIds, 0);
  objc_storeStrong((id *)&self->_siriIntendedInfo, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_tcuId, 0);
}

- (AFSpeechPackage)speechPackage
{
  return self->_speechPackage;
}

- (double)endAudioTimeStampInMs
{
  return self->_endAudioTimeStampInMs;
}

- (double)startAudioTimeStampInMs
{
  return self->_startAudioTimeStampInMs;
}

- (NSArray)prevTCUIds
{
  return self->_prevTCUIds;
}

- (SMTSiriIntendedInfo)siriIntendedInfo
{
  return self->_siriIntendedInfo;
}

- (int64_t)voiceTriggerPhraseType
{
  return self->_voiceTriggerPhraseType;
}

- (int64_t)speechEvent
{
  return self->_speechEvent;
}

- (int64_t)tcuState
{
  return self->_tcuState;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSString)tcuId
{
  return self->_tcuId;
}

- (void)encodeWithCoder:(id)a3
{
  tcuId = self->_tcuId;
  id v10 = a3;
  [v10 encodeObject:tcuId forKey:@"SMTTCUPackage::tcuId"];
  [v10 encodeObject:self->_requestId forKey:@"SMTTCUPackage::requestId"];
  v5 = [NSNumber numberWithInteger:self->_tcuState];
  [v10 encodeObject:v5 forKey:@"SMTTCUPackage::tcuState"];

  v6 = [NSNumber numberWithInteger:self->_speechEvent];
  [v10 encodeObject:v6 forKey:@"SMTTCUPackage::speechEvent"];

  v7 = [NSNumber numberWithInteger:self->_voiceTriggerPhraseType];
  [v10 encodeObject:v7 forKey:@"SMTTCUPackage::voiceTriggerPhraseType"];

  [v10 encodeObject:self->_siriIntendedInfo forKey:@"SMTTCUPackage::siriIntendedInfo"];
  [v10 encodeObject:self->_prevTCUIds forKey:@"SMTTCUPackage::prevTCUIds"];
  v8 = [NSNumber numberWithDouble:self->_startAudioTimeStampInMs];
  [v10 encodeObject:v8 forKey:@"SMTTCUPackage::startAudioTimeStampInMs"];

  v9 = [NSNumber numberWithDouble:self->_endAudioTimeStampInMs];
  [v10 encodeObject:v9 forKey:@"SMTTCUPackage::endAudioTimeStampInMs"];

  [v10 encodeObject:self->_speechPackage forKey:@"SMTTCUPackage::speechPackage"];
}

- (SMTTCUPackage)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTCUPackage::tcuId"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTCUPackage::requestId"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTCUPackage::tcuState"];
  uint64_t v25 = [v6 integerValue];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTCUPackage::speechEvent"];
  uint64_t v8 = [v7 integerValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTCUPackage::voiceTriggerPhraseType"];
  uint64_t v10 = [v9 integerValue];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTCUPackage::siriIntendedInfo"];
  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v15 = [v3 decodeObjectOfClasses:v14 forKey:@"SMTTCUPackage::prevTCUIds"];

  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTCUPackage::startAudioTimeStampInMs"];
  [v16 doubleValue];
  double v18 = v17;

  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTCUPackage::endAudioTimeStampInMs"];
  [v19 doubleValue];
  double v21 = v20;

  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SMTTCUPackage::speechPackage"];

  v23 = [(SMTTCUPackage *)self initWithTcuId:v4 requestId:v5 tcuState:v25 speechEvent:v8 voiceTriggerPhraseType:v10 siriIntendedInfo:v11 prevTCUIds:v18 startAudioTimeStampInMs:v21 endAudioTimeStampInMs:v15 speechPackage:v22];
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SMTTCUPackage *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t tcuState = self->_tcuState;
      if (tcuState == [(SMTTCUPackage *)v5 tcuState]
        && (int64_t speechEvent = self->_speechEvent, speechEvent == [(SMTTCUPackage *)v5 speechEvent])
        && (int64_t voiceTriggerPhraseType = self->_voiceTriggerPhraseType,
            voiceTriggerPhraseType == [(SMTTCUPackage *)v5 voiceTriggerPhraseType])
        && (double startAudioTimeStampInMs = self->_startAudioTimeStampInMs,
            [(SMTTCUPackage *)v5 startAudioTimeStampInMs],
            startAudioTimeStampInMs == v10)
        && (double endAudioTimeStampInMs = self->_endAudioTimeStampInMs,
            [(SMTTCUPackage *)v5 endAudioTimeStampInMs],
            endAudioTimeStampInMs == v12))
      {
        v15 = [(SMTTCUPackage *)v5 tcuId];
        tcuId = self->_tcuId;
        if (tcuId == v15 || [(NSString *)tcuId isEqual:v15])
        {
          double v17 = [(SMTTCUPackage *)v5 requestId];
          requestId = self->_requestId;
          if (requestId == v17 || [(NSString *)requestId isEqual:v17])
          {
            v19 = [(SMTTCUPackage *)v5 siriIntendedInfo];
            siriIntendedInfo = self->_siriIntendedInfo;
            if (siriIntendedInfo == v19 || [(SMTSiriIntendedInfo *)siriIntendedInfo isEqual:v19])
            {
              double v21 = [(SMTTCUPackage *)v5 prevTCUIds];
              prevTCUIds = self->_prevTCUIds;
              if (prevTCUIds == v21 || [(NSArray *)prevTCUIds isEqual:v21])
              {
                v23 = [(SMTTCUPackage *)v5 speechPackage];
                speechPackage = self->_speechPackage;
                BOOL v13 = speechPackage == v23 || [(AFSpeechPackage *)speechPackage isEqual:v23];
              }
              else
              {
                BOOL v13 = 0;
              }
            }
            else
            {
              BOOL v13 = 0;
            }
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_tcuId hash];
  NSUInteger v4 = [(NSString *)self->_requestId hash] ^ v3;
  v5 = [NSNumber numberWithInteger:self->_tcuState];
  uint64_t v6 = v4 ^ [v5 hash];
  v7 = [NSNumber numberWithInteger:self->_speechEvent];
  uint64_t v8 = [v7 hash];
  v9 = [NSNumber numberWithInteger:self->_voiceTriggerPhraseType];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  unint64_t v11 = [(SMTSiriIntendedInfo *)self->_siriIntendedInfo hash];
  uint64_t v12 = v11 ^ [(NSArray *)self->_prevTCUIds hash];
  BOOL v13 = [NSNumber numberWithDouble:self->_startAudioTimeStampInMs];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [NSNumber numberWithDouble:self->_endAudioTimeStampInMs];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  unint64_t v17 = v16 ^ [(AFSpeechPackage *)self->_speechPackage hash];

  return v17;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v17.receiver = self;
  v17.super_class = (Class)SMTTCUPackage;
  v5 = [(SMTTCUPackage *)&v17 description];
  unint64_t tcuState = self->_tcuState;
  if (tcuState > 4) {
    v7 = @"(unknown)";
  }
  else {
    v7 = off_265503E28[tcuState];
  }
  tcuId = self->_tcuId;
  requestId = self->_requestId;
  uint64_t v10 = v7;
  int64_t speechEvent = self->_speechEvent;
  unint64_t voiceTriggerPhraseType = self->_voiceTriggerPhraseType;
  if (voiceTriggerPhraseType > 2) {
    BOOL v13 = @"(unknown)";
  }
  else {
    BOOL v13 = off_265503FA8[voiceTriggerPhraseType];
  }
  uint64_t v14 = v13;
  v15 = (void *)[v4 initWithFormat:@"%@ {tcuId = %@, requestId = %@, unint64_t tcuState = %@, speechEvent = %lld, voiceTriggerPhraseType = %@, siriIntendedInfo = %@, prevTCUIds = %@, startAudioTimeStampInMs = %f, endAudioTimeStampInMs = %f, speechPackage = %@}", v5, tcuId, requestId, v10, speechEvent, v14, self->_siriIntendedInfo, self->_prevTCUIds, *(void *)&self->_startAudioTimeStampInMs, *(void *)&self->_endAudioTimeStampInMs, self->_speechPackage];

  return v15;
}

- (id)description
{
  return [(SMTTCUPackage *)self _descriptionWithIndent:0];
}

- (SMTTCUPackage)initWithTcuId:(id)a3 requestId:(id)a4 tcuState:(int64_t)a5 speechEvent:(int64_t)a6 voiceTriggerPhraseType:(int64_t)a7 siriIntendedInfo:(id)a8 prevTCUIds:(id)a9 startAudioTimeStampInMs:(double)a10 endAudioTimeStampInMs:(double)a11 speechPackage:(id)a12
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a8;
  id v23 = a9;
  id v24 = a12;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __173__SMTTCUPackage_initWithTcuId_requestId_tcuState_speechEvent_voiceTriggerPhraseType_siriIntendedInfo_prevTCUIds_startAudioTimeStampInMs_endAudioTimeStampInMs_speechPackage___block_invoke;
  v32[3] = &unk_265503E08;
  id v33 = v20;
  id v34 = v21;
  int64_t v39 = a6;
  int64_t v40 = a7;
  id v35 = v22;
  id v36 = v23;
  double v41 = a10;
  double v42 = a11;
  id v37 = v24;
  int64_t v38 = a5;
  id v25 = v24;
  id v26 = v23;
  id v27 = v22;
  id v28 = v21;
  id v29 = v20;
  v30 = [(SMTTCUPackage *)self initWithBuilder:v32];

  return v30;
}

void __173__SMTTCUPackage_initWithTcuId_requestId_tcuState_speechEvent_voiceTriggerPhraseType_siriIntendedInfo_prevTCUIds_startAudioTimeStampInMs_endAudioTimeStampInMs_speechPackage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTcuId:v3];
  [v4 setRequestId:*(void *)(a1 + 40)];
  [v4 setTcuState:*(void *)(a1 + 72)];
  [v4 setSpeechEvent:*(void *)(a1 + 80)];
  [v4 setVoiceTriggerPhraseType:*(void *)(a1 + 88)];
  [v4 setSiriIntendedInfo:*(void *)(a1 + 48)];
  [v4 setPrevTCUIds:*(void *)(a1 + 56)];
  [v4 setStartAudioTimeStampInMs:*(double *)(a1 + 96)];
  [v4 setEndAudioTimeStampInMs:*(double *)(a1 + 104)];
  [v4 setSpeechPackage:*(void *)(a1 + 64)];
}

- (SMTTCUPackage)init
{
  return [(SMTTCUPackage *)self initWithBuilder:0];
}

- (SMTTCUPackage)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SMTTCUPackageMutation *))a3;
  v26.receiver = self;
  v26.super_class = (Class)SMTTCUPackage;
  v5 = [(SMTTCUPackage *)&v26 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_SMTTCUPackageMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SMTTCUPackageMutation *)v7 isDirty])
    {
      uint64_t v8 = [(_SMTTCUPackageMutation *)v7 getTcuId];
      uint64_t v9 = [v8 copy];
      tcuId = v6->_tcuId;
      v6->_tcuId = (NSString *)v9;

      unint64_t v11 = [(_SMTTCUPackageMutation *)v7 getRequestId];
      uint64_t v12 = [v11 copy];
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v12;

      v6->_unint64_t tcuState = [(_SMTTCUPackageMutation *)v7 getTcuState];
      v6->_int64_t speechEvent = [(_SMTTCUPackageMutation *)v7 getSpeechEvent];
      v6->_unint64_t voiceTriggerPhraseType = [(_SMTTCUPackageMutation *)v7 getVoiceTriggerPhraseType];
      uint64_t v14 = [(_SMTTCUPackageMutation *)v7 getSiriIntendedInfo];
      uint64_t v15 = [v14 copy];
      siriIntendedInfo = v6->_siriIntendedInfo;
      v6->_siriIntendedInfo = (SMTSiriIntendedInfo *)v15;

      objc_super v17 = [(_SMTTCUPackageMutation *)v7 getPrevTCUIds];
      uint64_t v18 = [v17 copy];
      prevTCUIds = v6->_prevTCUIds;
      v6->_prevTCUIds = (NSArray *)v18;

      [(_SMTTCUPackageMutation *)v7 getStartAudioTimeStampInMs];
      v6->_double startAudioTimeStampInMs = v20;
      [(_SMTTCUPackageMutation *)v7 getEndAudioTimeStampInMs];
      v6->_double endAudioTimeStampInMs = v21;
      id v22 = [(_SMTTCUPackageMutation *)v7 getSpeechPackage];
      uint64_t v23 = [v22 copy];
      speechPackage = v6->_speechPackage;
      v6->_speechPackage = (AFSpeechPackage *)v23;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SMTTCUPackageMutation *))a3;
  if (v4)
  {
    v5 = [[_SMTTCUPackageMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SMTTCUPackageMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(SMTTCUPackage);
      v7 = [(_SMTTCUPackageMutation *)v5 getTcuId];
      uint64_t v8 = [v7 copy];
      tcuId = v6->_tcuId;
      v6->_tcuId = (NSString *)v8;

      uint64_t v10 = [(_SMTTCUPackageMutation *)v5 getRequestId];
      uint64_t v11 = [v10 copy];
      requestId = v6->_requestId;
      v6->_requestId = (NSString *)v11;

      v6->_unint64_t tcuState = [(_SMTTCUPackageMutation *)v5 getTcuState];
      v6->_int64_t speechEvent = [(_SMTTCUPackageMutation *)v5 getSpeechEvent];
      v6->_unint64_t voiceTriggerPhraseType = [(_SMTTCUPackageMutation *)v5 getVoiceTriggerPhraseType];
      BOOL v13 = [(_SMTTCUPackageMutation *)v5 getSiriIntendedInfo];
      uint64_t v14 = [v13 copy];
      siriIntendedInfo = v6->_siriIntendedInfo;
      v6->_siriIntendedInfo = (SMTSiriIntendedInfo *)v14;

      uint64_t v16 = [(_SMTTCUPackageMutation *)v5 getPrevTCUIds];
      uint64_t v17 = [v16 copy];
      prevTCUIds = v6->_prevTCUIds;
      v6->_prevTCUIds = (NSArray *)v17;

      [(_SMTTCUPackageMutation *)v5 getStartAudioTimeStampInMs];
      v6->_double startAudioTimeStampInMs = v19;
      [(_SMTTCUPackageMutation *)v5 getEndAudioTimeStampInMs];
      v6->_double endAudioTimeStampInMs = v20;
      double v21 = [(_SMTTCUPackageMutation *)v5 getSpeechPackage];
      uint64_t v22 = [v21 copy];
      speechPackage = v6->_speechPackage;
      v6->_speechPackage = (AFSpeechPackage *)v22;
    }
    else
    {
      uint64_t v6 = (SMTTCUPackage *)[(SMTTCUPackage *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (SMTTCUPackage *)[(SMTTCUPackage *)self copy];
  }

  return v6;
}

@end