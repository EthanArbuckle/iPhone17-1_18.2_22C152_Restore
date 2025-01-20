@interface ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported
- (BOOL)hasAsrTask;
- (BOOL)hasAudioCodec;
- (BOOL)hasAudioId;
- (BOOL)hasAudioInterfaceVendorId;
- (BOOL)hasAudioSkippedNumSamples;
- (BOOL)hasAudioSource;
- (BOOL)hasDeviceType;
- (BOOL)hasFirstPartyAudioInterfaceProductId;
- (BOOL)hasInvocationSource;
- (BOOL)hasIsDeviceHandHeld;
- (BOOL)hasIsEnrollmentSample;
- (BOOL)hasIsMediaPlaying;
- (BOOL)hasIsPersonalRequest;
- (BOOL)hasIsPersonalizedRequest;
- (BOOL)hasIsWakeFromSleep;
- (BOOL)hasLocation;
- (BOOL)hasMotionActivity;
- (BOOL)hasOrchCancelledReason;
- (BOOL)hasPreItn1Best;
- (BOOL)hasResponseId;
- (BOOL)hasSiriInputLocale;
- (BOOL)hasStartDatestampInDaysSince1970;
- (BOOL)hasSubDomain;
- (BOOL)hasSystemBuild;
- (BOOL)hasTriggerPhrase;
- (BOOL)isDeviceHandHeld;
- (BOOL)isEnrollmentSample;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMediaPlaying;
- (BOOL)isPersonalRequest;
- (BOOL)isPersonalizedRequest;
- (BOOL)isWakeFromSleep;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)audioInterfaceVendorId;
- (NSString)deviceType;
- (NSString)firstPartyAudioInterfaceProductId;
- (NSString)preItn1Best;
- (NSString)responseId;
- (NSString)subDomain;
- (NSString)systemBuild;
- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported)initWithDictionary:(id)a3;
- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported)initWithJSON:(id)a3;
- (SISchemaISOLocale)siriInputLocale;
- (SISchemaLocation)location;
- (SISchemaUUID)audioId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)asrTask;
- (int)audioCodec;
- (int)audioSource;
- (int)invocationSource;
- (int)motionActivity;
- (int)orchCancelledReason;
- (int)triggerPhrase;
- (unint64_t)audioSkippedNumSamples;
- (unint64_t)hash;
- (unint64_t)startDatestampInDaysSince1970;
- (void)deleteAsrTask;
- (void)deleteAudioCodec;
- (void)deleteAudioId;
- (void)deleteAudioInterfaceVendorId;
- (void)deleteAudioSkippedNumSamples;
- (void)deleteAudioSource;
- (void)deleteDeviceType;
- (void)deleteFirstPartyAudioInterfaceProductId;
- (void)deleteInvocationSource;
- (void)deleteIsDeviceHandHeld;
- (void)deleteIsEnrollmentSample;
- (void)deleteIsMediaPlaying;
- (void)deleteIsPersonalRequest;
- (void)deleteIsPersonalizedRequest;
- (void)deleteIsWakeFromSleep;
- (void)deleteLocation;
- (void)deleteMotionActivity;
- (void)deleteOrchCancelledReason;
- (void)deletePreItn1Best;
- (void)deleteResponseId;
- (void)deleteSiriInputLocale;
- (void)deleteStartDatestampInDaysSince1970;
- (void)deleteSubDomain;
- (void)deleteSystemBuild;
- (void)deleteTriggerPhrase;
- (void)setAsrTask:(int)a3;
- (void)setAudioCodec:(int)a3;
- (void)setAudioId:(id)a3;
- (void)setAudioInterfaceVendorId:(id)a3;
- (void)setAudioSkippedNumSamples:(unint64_t)a3;
- (void)setAudioSource:(int)a3;
- (void)setDeviceType:(id)a3;
- (void)setFirstPartyAudioInterfaceProductId:(id)a3;
- (void)setHasAsrTask:(BOOL)a3;
- (void)setHasAudioCodec:(BOOL)a3;
- (void)setHasAudioId:(BOOL)a3;
- (void)setHasAudioInterfaceVendorId:(BOOL)a3;
- (void)setHasAudioSkippedNumSamples:(BOOL)a3;
- (void)setHasAudioSource:(BOOL)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasFirstPartyAudioInterfaceProductId:(BOOL)a3;
- (void)setHasInvocationSource:(BOOL)a3;
- (void)setHasIsDeviceHandHeld:(BOOL)a3;
- (void)setHasIsEnrollmentSample:(BOOL)a3;
- (void)setHasIsMediaPlaying:(BOOL)a3;
- (void)setHasIsPersonalRequest:(BOOL)a3;
- (void)setHasIsPersonalizedRequest:(BOOL)a3;
- (void)setHasIsWakeFromSleep:(BOOL)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setHasMotionActivity:(BOOL)a3;
- (void)setHasOrchCancelledReason:(BOOL)a3;
- (void)setHasPreItn1Best:(BOOL)a3;
- (void)setHasResponseId:(BOOL)a3;
- (void)setHasSiriInputLocale:(BOOL)a3;
- (void)setHasStartDatestampInDaysSince1970:(BOOL)a3;
- (void)setHasSubDomain:(BOOL)a3;
- (void)setHasSystemBuild:(BOOL)a3;
- (void)setHasTriggerPhrase:(BOOL)a3;
- (void)setInvocationSource:(int)a3;
- (void)setIsDeviceHandHeld:(BOOL)a3;
- (void)setIsEnrollmentSample:(BOOL)a3;
- (void)setIsMediaPlaying:(BOOL)a3;
- (void)setIsPersonalRequest:(BOOL)a3;
- (void)setIsPersonalizedRequest:(BOOL)a3;
- (void)setIsWakeFromSleep:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMotionActivity:(int)a3;
- (void)setOrchCancelledReason:(int)a3;
- (void)setPreItn1Best:(id)a3;
- (void)setResponseId:(id)a3;
- (void)setSiriInputLocale:(id)a3;
- (void)setStartDatestampInDaysSince1970:(unint64_t)a3;
- (void)setSubDomain:(id)a3;
- (void)setSystemBuild:(id)a3;
- (void)setTriggerPhrase:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self siriInputLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self deleteSiriInputLocale];
  }
  v9 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self deleteAudioId];
  }
  v12 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self location];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self deleteLocation];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_audioId, 0);
  objc_storeStrong((id *)&self->_responseId, 0);
  objc_storeStrong((id *)&self->_subDomain, 0);
  objc_storeStrong((id *)&self->_preItn1Best, 0);
  objc_storeStrong((id *)&self->_siriInputLocale, 0);
  objc_storeStrong((id *)&self->_firstPartyAudioInterfaceProductId, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasResponseId = a3;
}

- (void)setHasAudioId:(BOOL)a3
{
  self->_hasSubDomain = a3;
}

- (void)setHasResponseId:(BOOL)a3
{
  self->_hasPreItn1Best = a3;
}

- (void)setHasSubDomain:(BOOL)a3
{
  self->_hasSiriInputLocale = a3;
}

- (void)setHasPreItn1Best:(BOOL)a3
{
  self->_hasFirstPartyAudioInterfaceProductId = a3;
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  self->_hasAudioInterfaceVendorId = a3;
}

- (void)setHasFirstPartyAudioInterfaceProductId:(BOOL)a3
{
  self->_hasSystemBuild = a3;
}

- (void)setHasAudioInterfaceVendorId:(BOOL)a3
{
  self->_hasDeviceType = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setLocation:(id)a3
{
}

- (SISchemaLocation)location
{
  return self->_location;
}

- (int)triggerPhrase
{
  return self->_triggerPhrase;
}

- (void)setAudioId:(id)a3
{
}

- (SISchemaUUID)audioId
{
  return self->_audioId;
}

- (int)orchCancelledReason
{
  return self->_orchCancelledReason;
}

- (void)setResponseId:(id)a3
{
}

- (NSString)responseId
{
  return self->_responseId;
}

- (BOOL)isPersonalizedRequest
{
  return self->_isPersonalizedRequest;
}

- (BOOL)isPersonalRequest
{
  return self->_isPersonalRequest;
}

- (void)setSubDomain:(id)a3
{
}

- (NSString)subDomain
{
  return self->_subDomain;
}

- (void)setPreItn1Best:(id)a3
{
}

- (NSString)preItn1Best
{
  return self->_preItn1Best;
}

- (unint64_t)audioSkippedNumSamples
{
  return self->_audioSkippedNumSamples;
}

- (int)asrTask
{
  return self->_asrTask;
}

- (int)audioSource
{
  return self->_audioSource;
}

- (int)audioCodec
{
  return self->_audioCodec;
}

- (BOOL)isDeviceHandHeld
{
  return self->_isDeviceHandHeld;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (BOOL)isWakeFromSleep
{
  return self->_isWakeFromSleep;
}

- (int)motionActivity
{
  return self->_motionActivity;
}

- (int)invocationSource
{
  return self->_invocationSource;
}

- (void)setSiriInputLocale:(id)a3
{
}

- (SISchemaISOLocale)siriInputLocale
{
  return self->_siriInputLocale;
}

- (void)setFirstPartyAudioInterfaceProductId:(id)a3
{
}

- (NSString)firstPartyAudioInterfaceProductId
{
  return self->_firstPartyAudioInterfaceProductId;
}

- (void)setAudioInterfaceVendorId:(id)a3
{
}

- (NSString)audioInterfaceVendorId
{
  return self->_audioInterfaceVendorId;
}

- (void)setSystemBuild:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (unint64_t)startDatestampInDaysSince1970
{
  return self->_startDatestampInDaysSince1970;
}

- (BOOL)isEnrollmentSample
{
  return self->_isEnrollmentSample;
}

- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported;
  v5 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)&v61 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isEnrollmentSample"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setIsEnrollmentSample:](v5, "setIsEnrollmentSample:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"startDatestampInDaysSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setStartDatestampInDaysSince1970:](v5, "setStartDatestampInDaysSince1970:", [v7 unsignedLongLongValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"deviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)v5 setDeviceType:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"systemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)v5 setSystemBuild:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"audioInterfaceVendorId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)v5 setAudioInterfaceVendorId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"firstPartyAudioInterfaceProductId"];
    objc_opt_class();
    v60 = v14;
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)v5 setFirstPartyAudioInterfaceProductId:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"siriInputLocale"];
    objc_opt_class();
    v59 = (void *)v16;
    if (objc_opt_isKindOfClass())
    {
      v17 = [[SISchemaISOLocale alloc] initWithDictionary:v16];
      [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)v5 setSiriInputLocale:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"invocationSource"];
    objc_opt_class();
    v58 = v18;
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setInvocationSource:](v5, "setInvocationSource:", [v18 intValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"motionActivity"];
    objc_opt_class();
    v57 = v19;
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setMotionActivity:](v5, "setMotionActivity:", [v19 intValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"isWakeFromSleep"];
    objc_opt_class();
    v56 = v20;
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setIsWakeFromSleep:](v5, "setIsWakeFromSleep:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"isMediaPlaying"];
    objc_opt_class();
    v55 = v21;
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setIsMediaPlaying:](v5, "setIsMediaPlaying:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"isDeviceHandHeld"];
    objc_opt_class();
    v54 = v22;
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setIsDeviceHandHeld:](v5, "setIsDeviceHandHeld:", [v22 BOOLValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"audioCodec"];
    objc_opt_class();
    v53 = v23;
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setAudioCodec:](v5, "setAudioCodec:", [v23 intValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"audioSource"];
    objc_opt_class();
    v52 = v24;
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setAudioSource:](v5, "setAudioSource:", [v24 intValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"asrTask"];
    objc_opt_class();
    v51 = v25;
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setAsrTask:](v5, "setAsrTask:", [v25 intValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"audioSkippedNumSamples"];
    objc_opt_class();
    v50 = v26;
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setAudioSkippedNumSamples:](v5, "setAudioSkippedNumSamples:", [v26 unsignedLongLongValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"preItn1Best"];
    objc_opt_class();
    v49 = v27;
    if (objc_opt_isKindOfClass())
    {
      v28 = (void *)[v27 copy];
      [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)v5 setPreItn1Best:v28];
    }
    v48 = v6;
    v29 = [v4 objectForKeyedSubscript:@"subDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = (void *)[v29 copy];
      [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)v5 setSubDomain:v30];
    }
    v43 = v29;
    v47 = v7;
    v31 = [v4 objectForKeyedSubscript:@"isPersonalRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setIsPersonalRequest:](v5, "setIsPersonalRequest:", [v31 BOOLValue]);
    }
    v46 = v8;
    v32 = [v4 objectForKeyedSubscript:@"isPersonalizedRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setIsPersonalizedRequest:](v5, "setIsPersonalizedRequest:", [v32 BOOLValue]);
    }
    v33 = [v4 objectForKeyedSubscript:@"responseId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = (void *)[v33 copy];
      [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)v5 setResponseId:v34];
    }
    v45 = v10;
    v35 = [v4 objectForKeyedSubscript:@"orchCancelledReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setOrchCancelledReason:](v5, "setOrchCancelledReason:", [v35 intValue]);
    }
    v44 = v12;
    v36 = [v4 objectForKeyedSubscript:@"audioId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[SISchemaUUID alloc] initWithDictionary:v36];
      [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)v5 setAudioId:v37];
    }
    v38 = [v4 objectForKeyedSubscript:@"triggerPhrase"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported setTriggerPhrase:](v5, "setTriggerPhrase:", [v38 intValue]);
    }
    v39 = [v4 objectForKeyedSubscript:@"location"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = [[SISchemaLocation alloc] initWithDictionary:v39];
      [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)v5 setLocation:v40];
    }
    v41 = v5;
  }
  return v5;
}

- (ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    unsigned int v5 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self asrTask] - 1;
    if (v5 > 7) {
      v6 = @"ASRDATAPACKTASK_UNKNOWN";
    }
    else {
      v6 = off_1E5EC0FB8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"asrTask"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    unsigned int v7 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioCodec] - 1;
    if (v7 > 0xA) {
      int v8 = @"MHASRAUDIOCODEC_UNKNOWN";
    }
    else {
      int v8 = off_1E5EC0FF8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"audioCodec"];
  }
  if (self->_audioId)
  {
    v9 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"audioId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"audioId"];
    }
  }
  if (self->_audioInterfaceVendorId)
  {
    v12 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioInterfaceVendorId];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"audioInterfaceVendorId"];
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x400) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported audioSkippedNumSamples](self, "audioSkippedNumSamples"));
    [v3 setObject:v15 forKeyedSubscript:@"audioSkippedNumSamples"];

    __int16 v14 = (__int16)self->_has;
  }
  if ((v14 & 0x100) != 0)
  {
    unsigned int v16 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioSource] - 1;
    if (v16 > 7) {
      v17 = @"MHASSISTANTDAEMONAUDIOSOURCE_UNKNOWN";
    }
    else {
      v17 = off_1E5EC1050[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"audioSource"];
  }
  if (self->_deviceType)
  {
    v18 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self deviceType];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"deviceType"];
  }
  if (self->_firstPartyAudioInterfaceProductId)
  {
    v20 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self firstPartyAudioInterfaceProductId];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"firstPartyAudioInterfaceProductId"];
  }
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 4) != 0)
  {
    unsigned int v26 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self invocationSource] - 1;
    if (v26 > 0x62) {
      v27 = @"INVOCATIONSOURCE_UNKNOWN_INVOCATION_SOURCE";
    }
    else {
      v27 = off_1E5EC1090[v26];
    }
    [v3 setObject:v27 forKeyedSubscript:@"invocationSource"];
    __int16 v22 = (__int16)self->_has;
    if ((v22 & 0x40) == 0)
    {
LABEL_31:
      if ((v22 & 1) == 0) {
        goto LABEL_32;
      }
      goto LABEL_50;
    }
  }
  else if ((v22 & 0x40) == 0)
  {
    goto LABEL_31;
  }
  v32 = objc_msgSend(NSNumber, "numberWithBool:", -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported isDeviceHandHeld](self, "isDeviceHandHeld"));
  [v3 setObject:v32 forKeyedSubscript:@"isDeviceHandHeld"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 1) == 0)
  {
LABEL_32:
    if ((v22 & 0x20) == 0) {
      goto LABEL_33;
    }
    goto LABEL_51;
  }
LABEL_50:
  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported isEnrollmentSample](self, "isEnrollmentSample"));
  [v3 setObject:v33 forKeyedSubscript:@"isEnrollmentSample"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x20) == 0)
  {
LABEL_33:
    if ((v22 & 0x800) == 0) {
      goto LABEL_34;
    }
    goto LABEL_52;
  }
LABEL_51:
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported isMediaPlaying](self, "isMediaPlaying"));
  [v3 setObject:v34 forKeyedSubscript:@"isMediaPlaying"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x800) == 0)
  {
LABEL_34:
    if ((v22 & 0x1000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_53;
  }
LABEL_52:
  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported isPersonalRequest](self, "isPersonalRequest"));
  [v3 setObject:v35 forKeyedSubscript:@"isPersonalRequest"];

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x1000) == 0)
  {
LABEL_35:
    if ((v22 & 0x10) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_53:
  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported isPersonalizedRequest](self, "isPersonalizedRequest"));
  [v3 setObject:v36 forKeyedSubscript:@"isPersonalizedRequest"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_36:
    v23 = objc_msgSend(NSNumber, "numberWithBool:", -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported isWakeFromSleep](self, "isWakeFromSleep"));
    [v3 setObject:v23 forKeyedSubscript:@"isWakeFromSleep"];
  }
LABEL_37:
  if (self->_location)
  {
    v24 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self location];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"location"];
    }
    else
    {
      v28 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v28 forKeyedSubscript:@"location"];
    }
  }
  __int16 v29 = (__int16)self->_has;
  if ((v29 & 8) != 0)
  {
    unsigned int v30 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self motionActivity] - 1;
    if (v30 > 4) {
      v31 = @"ORCHMOTIONACTIVITY_UNKNOWN";
    }
    else {
      v31 = off_1E5EC13A8[v30];
    }
    [v3 setObject:v31 forKeyedSubscript:@"motionActivity"];
    __int16 v29 = (__int16)self->_has;
  }
  if ((v29 & 0x2000) != 0)
  {
    int v37 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self orchCancelledReason];
    v38 = @"ORCHREQUESTCANCELLATIONREASON_UNKNOWN";
    if (v37 == 1) {
      v38 = @"ORCHREQUESTCANCELLATIONREASON_MITIGATED";
    }
    if (v37 == 2) {
      v39 = @"ORCHREQUESTCANCELLATIONREASON_CANCEL_COMMAND";
    }
    else {
      v39 = v38;
    }
    [v3 setObject:v39 forKeyedSubscript:@"orchCancelledReason"];
  }
  if (self->_preItn1Best)
  {
    v40 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self preItn1Best];
    v41 = (void *)[v40 copy];
    [v3 setObject:v41 forKeyedSubscript:@"preItn1Best"];
  }
  if (self->_responseId)
  {
    v42 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self responseId];
    v43 = (void *)[v42 copy];
    [v3 setObject:v43 forKeyedSubscript:@"responseId"];
  }
  if (self->_siriInputLocale)
  {
    v44 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self siriInputLocale];
    v45 = [v44 dictionaryRepresentation];
    if (v45)
    {
      [v3 setObject:v45 forKeyedSubscript:@"siriInputLocale"];
    }
    else
    {
      v46 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v46 forKeyedSubscript:@"siriInputLocale"];
    }
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v47 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported startDatestampInDaysSince1970](self, "startDatestampInDaysSince1970"));
    [v3 setObject:v47 forKeyedSubscript:@"startDatestampInDaysSince1970"];
  }
  if (self->_subDomain)
  {
    v48 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self subDomain];
    v49 = (void *)[v48 copy];
    [v3 setObject:v49 forKeyedSubscript:@"subDomain"];
  }
  if (self->_systemBuild)
  {
    v50 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self systemBuild];
    v51 = (void *)[v50 copy];
    [v3 setObject:v51 forKeyedSubscript:@"systemBuild"];
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    int v52 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self triggerPhrase];
    v53 = @"TRIGGERPHRASE_UNKNOWN";
    if (v52 == 1) {
      v53 = @"TRIGGERPHRASE_HEY_SIRI";
    }
    if (v52 == 2) {
      v54 = @"TRIGGERPHRASE_SIRI";
    }
    else {
      v54 = v53;
    }
    [v3 setObject:v54 forKeyedSubscript:@"triggerPhrase"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v55 = v3;

  return v55;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v29 = 2654435761 * self->_isEnrollmentSample;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v28 = 2654435761u * self->_startDatestampInDaysSince1970;
      goto LABEL_6;
    }
  }
  unint64_t v28 = 0;
LABEL_6:
  NSUInteger v27 = [(NSString *)self->_deviceType hash];
  NSUInteger v26 = [(NSString *)self->_systemBuild hash];
  NSUInteger v25 = [(NSString *)self->_audioInterfaceVendorId hash];
  NSUInteger v24 = [(NSString *)self->_firstPartyAudioInterfaceProductId hash];
  unint64_t v23 = [(SISchemaISOLocale *)self->_siriInputLocale hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 4) != 0)
  {
    uint64_t v22 = 2654435761 * self->_invocationSource;
    if ((v4 & 8) != 0)
    {
LABEL_8:
      uint64_t v21 = 2654435761 * self->_motionActivity;
      if ((v4 & 0x10) != 0) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if ((v4 & 8) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v21 = 0;
  if ((v4 & 0x10) != 0)
  {
LABEL_9:
    uint64_t v20 = 2654435761 * self->_isWakeFromSleep;
    if ((v4 & 0x20) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v20 = 0;
  if ((v4 & 0x20) != 0)
  {
LABEL_10:
    uint64_t v19 = 2654435761 * self->_isMediaPlaying;
    if ((v4 & 0x40) != 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v19 = 0;
  if ((v4 & 0x40) != 0)
  {
LABEL_11:
    uint64_t v18 = 2654435761 * self->_isDeviceHandHeld;
    if ((v4 & 0x80) != 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v18 = 0;
  if ((v4 & 0x80) != 0)
  {
LABEL_12:
    uint64_t v17 = 2654435761 * self->_audioCodec;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v17 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_13:
    uint64_t v16 = 2654435761 * self->_audioSource;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_14;
    }
LABEL_23:
    uint64_t v15 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_15;
    }
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v16 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_23;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_asrTask;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_15:
    unint64_t v5 = 2654435761u * self->_audioSkippedNumSamples;
    goto LABEL_25;
  }
LABEL_24:
  unint64_t v5 = 0;
LABEL_25:
  NSUInteger v6 = [(NSString *)self->_preItn1Best hash];
  NSUInteger v7 = [(NSString *)self->_subDomain hash];
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    uint64_t v8 = 2654435761 * self->_isPersonalRequest;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_27:
      uint64_t v9 = 2654435761 * self->_isPersonalizedRequest;
      goto LABEL_30;
    }
  }
  uint64_t v9 = 0;
LABEL_30:
  NSUInteger v10 = [(NSString *)self->_responseId hash];
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    uint64_t v11 = 2654435761 * self->_orchCancelledReason;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = [(SISchemaUUID *)self->_audioId hash];
  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
    uint64_t v13 = 2654435761 * self->_triggerPhrase;
  }
  else {
    uint64_t v13 = 0;
  }
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(SISchemaLocation *)self->_location hash];
}

- (BOOL)isEqual:(id)a3
{
  __int16 v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_107;
  }
  $B0B2AB75AD7DC0C9CB4CD45691D0A193 has = self->_has;
  unsigned int v6 = v4[80];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_107;
  }
  if (*(unsigned char *)&has)
  {
    int isEnrollmentSample = self->_isEnrollmentSample;
    if (isEnrollmentSample != [v4 isEnrollmentSample]) {
      goto LABEL_107;
    }
    $B0B2AB75AD7DC0C9CB4CD45691D0A193 has = self->_has;
    unsigned int v6 = v4[80];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_107;
  }
  if (v8)
  {
    unint64_t startDatestampInDaysSince1970 = self->_startDatestampInDaysSince1970;
    if (startDatestampInDaysSince1970 != [v4 startDatestampInDaysSince1970]) {
      goto LABEL_107;
    }
  }
  NSUInteger v10 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self deviceType];
  uint64_t v11 = [v4 deviceType];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_106;
  }
  uint64_t v12 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self deviceType];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    __int16 v14 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self deviceType];
    uint64_t v15 = [v4 deviceType];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  NSUInteger v10 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self systemBuild];
  uint64_t v11 = [v4 systemBuild];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_106;
  }
  uint64_t v17 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self systemBuild];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self systemBuild];
    uint64_t v20 = [v4 systemBuild];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  NSUInteger v10 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioInterfaceVendorId];
  uint64_t v11 = [v4 audioInterfaceVendorId];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_106;
  }
  uint64_t v22 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioInterfaceVendorId];
  if (v22)
  {
    unint64_t v23 = (void *)v22;
    NSUInteger v24 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioInterfaceVendorId];
    NSUInteger v25 = [v4 audioInterfaceVendorId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  NSUInteger v10 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self firstPartyAudioInterfaceProductId];
  uint64_t v11 = [v4 firstPartyAudioInterfaceProductId];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_106;
  }
  uint64_t v27 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self firstPartyAudioInterfaceProductId];
  if (v27)
  {
    unint64_t v28 = (void *)v27;
    uint64_t v29 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self firstPartyAudioInterfaceProductId];
    unsigned int v30 = [v4 firstPartyAudioInterfaceProductId];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  NSUInteger v10 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self siriInputLocale];
  uint64_t v11 = [v4 siriInputLocale];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_106;
  }
  uint64_t v32 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self siriInputLocale];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self siriInputLocale];
    v35 = [v4 siriInputLocale];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  $B0B2AB75AD7DC0C9CB4CD45691D0A193 v37 = self->_has;
  int v38 = (*(unsigned int *)&v37 >> 2) & 1;
  unsigned int v39 = v4[80];
  if (v38 != ((v39 >> 2) & 1)) {
    goto LABEL_107;
  }
  if (v38)
  {
    int invocationSource = self->_invocationSource;
    if (invocationSource != [v4 invocationSource]) {
      goto LABEL_107;
    }
    $B0B2AB75AD7DC0C9CB4CD45691D0A193 v37 = self->_has;
    unsigned int v39 = v4[80];
  }
  int v41 = (*(unsigned int *)&v37 >> 3) & 1;
  if (v41 != ((v39 >> 3) & 1)) {
    goto LABEL_107;
  }
  if (v41)
  {
    int motionActivity = self->_motionActivity;
    if (motionActivity != [v4 motionActivity]) {
      goto LABEL_107;
    }
    $B0B2AB75AD7DC0C9CB4CD45691D0A193 v37 = self->_has;
    unsigned int v39 = v4[80];
  }
  int v43 = (*(unsigned int *)&v37 >> 4) & 1;
  if (v43 != ((v39 >> 4) & 1)) {
    goto LABEL_107;
  }
  if (v43)
  {
    int isWakeFromSleep = self->_isWakeFromSleep;
    if (isWakeFromSleep != [v4 isWakeFromSleep]) {
      goto LABEL_107;
    }
    $B0B2AB75AD7DC0C9CB4CD45691D0A193 v37 = self->_has;
    unsigned int v39 = v4[80];
  }
  int v45 = (*(unsigned int *)&v37 >> 5) & 1;
  if (v45 != ((v39 >> 5) & 1)) {
    goto LABEL_107;
  }
  if (v45)
  {
    int isMediaPlaying = self->_isMediaPlaying;
    if (isMediaPlaying != [v4 isMediaPlaying]) {
      goto LABEL_107;
    }
    $B0B2AB75AD7DC0C9CB4CD45691D0A193 v37 = self->_has;
    unsigned int v39 = v4[80];
  }
  int v47 = (*(unsigned int *)&v37 >> 6) & 1;
  if (v47 != ((v39 >> 6) & 1)) {
    goto LABEL_107;
  }
  if (v47)
  {
    int isDeviceHandHeld = self->_isDeviceHandHeld;
    if (isDeviceHandHeld != [v4 isDeviceHandHeld]) {
      goto LABEL_107;
    }
    $B0B2AB75AD7DC0C9CB4CD45691D0A193 v37 = self->_has;
    unsigned int v39 = v4[80];
  }
  int v49 = (*(unsigned int *)&v37 >> 7) & 1;
  if (v49 != ((v39 >> 7) & 1)) {
    goto LABEL_107;
  }
  if (v49)
  {
    int audioCodec = self->_audioCodec;
    if (audioCodec != [v4 audioCodec]) {
      goto LABEL_107;
    }
    $B0B2AB75AD7DC0C9CB4CD45691D0A193 v37 = self->_has;
    unsigned int v39 = v4[80];
  }
  int v51 = (*(unsigned int *)&v37 >> 8) & 1;
  if (v51 != ((v39 >> 8) & 1)) {
    goto LABEL_107;
  }
  if (v51)
  {
    int audioSource = self->_audioSource;
    if (audioSource != [v4 audioSource]) {
      goto LABEL_107;
    }
    $B0B2AB75AD7DC0C9CB4CD45691D0A193 v37 = self->_has;
    unsigned int v39 = v4[80];
  }
  int v53 = (*(unsigned int *)&v37 >> 9) & 1;
  if (v53 != ((v39 >> 9) & 1)) {
    goto LABEL_107;
  }
  if (v53)
  {
    int asrTask = self->_asrTask;
    if (asrTask != [v4 asrTask]) {
      goto LABEL_107;
    }
    $B0B2AB75AD7DC0C9CB4CD45691D0A193 v37 = self->_has;
    unsigned int v39 = v4[80];
  }
  int v55 = (*(unsigned int *)&v37 >> 10) & 1;
  if (v55 != ((v39 >> 10) & 1)) {
    goto LABEL_107;
  }
  if (v55)
  {
    unint64_t audioSkippedNumSamples = self->_audioSkippedNumSamples;
    if (audioSkippedNumSamples != [v4 audioSkippedNumSamples]) {
      goto LABEL_107;
    }
  }
  NSUInteger v10 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self preItn1Best];
  uint64_t v11 = [v4 preItn1Best];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_106;
  }
  uint64_t v57 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self preItn1Best];
  if (v57)
  {
    v58 = (void *)v57;
    v59 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self preItn1Best];
    v60 = [v4 preItn1Best];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  NSUInteger v10 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self subDomain];
  uint64_t v11 = [v4 subDomain];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_106;
  }
  uint64_t v62 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self subDomain];
  if (v62)
  {
    v63 = (void *)v62;
    v64 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self subDomain];
    v65 = [v4 subDomain];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  $B0B2AB75AD7DC0C9CB4CD45691D0A193 v67 = self->_has;
  int v68 = (*(unsigned int *)&v67 >> 11) & 1;
  unsigned int v69 = v4[80];
  if (v68 != ((v69 >> 11) & 1)) {
    goto LABEL_107;
  }
  if (v68)
  {
    int isPersonalRequest = self->_isPersonalRequest;
    if (isPersonalRequest != [v4 isPersonalRequest]) {
      goto LABEL_107;
    }
    $B0B2AB75AD7DC0C9CB4CD45691D0A193 v67 = self->_has;
    unsigned int v69 = v4[80];
  }
  int v71 = (*(unsigned int *)&v67 >> 12) & 1;
  if (v71 != ((v69 >> 12) & 1)) {
    goto LABEL_107;
  }
  if (v71)
  {
    int isPersonalizedRequest = self->_isPersonalizedRequest;
    if (isPersonalizedRequest != [v4 isPersonalizedRequest]) {
      goto LABEL_107;
    }
  }
  NSUInteger v10 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self responseId];
  uint64_t v11 = [v4 responseId];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_106;
  }
  uint64_t v73 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self responseId];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self responseId];
    v76 = [v4 responseId];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  int v78 = (*(_WORD *)&self->_has >> 13) & 1;
  if (v78 != ((v4[80] >> 13) & 1)) {
    goto LABEL_107;
  }
  if (v78)
  {
    int orchCancelledReason = self->_orchCancelledReason;
    if (orchCancelledReason != [v4 orchCancelledReason]) {
      goto LABEL_107;
    }
  }
  NSUInteger v10 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioId];
  uint64_t v11 = [v4 audioId];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_106;
  }
  uint64_t v80 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioId];
  if (v80)
  {
    v81 = (void *)v80;
    v82 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioId];
    v83 = [v4 audioId];
    int v84 = [v82 isEqual:v83];

    if (!v84) {
      goto LABEL_107;
    }
  }
  else
  {
  }
  int v85 = (*(_WORD *)&self->_has >> 14) & 1;
  if (v85 != ((v4[80] >> 14) & 1)) {
    goto LABEL_107;
  }
  if (v85)
  {
    int triggerPhrase = self->_triggerPhrase;
    if (triggerPhrase != [v4 triggerPhrase]) {
      goto LABEL_107;
    }
  }
  NSUInteger v10 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self location];
  uint64_t v11 = [v4 location];
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_106:

    goto LABEL_107;
  }
  uint64_t v87 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self location];
  if (!v87)
  {

LABEL_110:
    BOOL v92 = 1;
    goto LABEL_108;
  }
  v88 = (void *)v87;
  v89 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self location];
  v90 = [v4 location];
  char v91 = [v89 isEqual:v90];

  if (v91) {
    goto LABEL_110;
  }
LABEL_107:
  BOOL v92 = 0;
LABEL_108:

  return v92;
}

- (void)writeTo:(id)a3
{
  id v21 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  unint64_t v5 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self deviceType];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unsigned int v6 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self systemBuild];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v7 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioInterfaceVendorId];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  int v8 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self firstPartyAudioInterfaceProductId];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  uint64_t v9 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self siriInputLocale];

  if (v9)
  {
    NSUInteger v10 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self siriInputLocale];
    PBDataWriterWriteSubmessage();
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_17:
      if ((v11 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_48;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x10) == 0)
  {
LABEL_18:
    if ((v11 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteBOOLField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x20) == 0)
  {
LABEL_19:
    if ((v11 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) == 0)
  {
LABEL_20:
    if ((v11 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x80) == 0)
  {
LABEL_21:
    if ((v11 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x100) == 0)
  {
LABEL_22:
    if ((v11 & 0x200) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_23:
    if ((v11 & 0x400) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint64Field();
LABEL_25:
  uint64_t v12 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self preItn1Best];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  uint64_t v13 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self subDomain];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v14 = (__int16)self->_has;
  }
  if ((v14 & 0x1000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v15 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self responseId];

  if (v15) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  int v16 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioId];

  if (v16)
  {
    uint64_t v17 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self audioId];
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v18 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self location];

  uint64_t v19 = v21;
  if (v18)
  {
    uint64_t v20 = [(ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReported *)self location];
    PBDataWriterWriteSubmessage();

    uint64_t v19 = v21;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODSAMPLESiriSchemaODSAMPLESpeakerIdModelSampleReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLocation
{
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)deleteTriggerPhrase
{
  *(_WORD *)&self->_has &= ~0x4000u;
}

- (void)setHasTriggerPhrase:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasTriggerPhrase
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setTriggerPhrase:(int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_int triggerPhrase = a3;
}

- (void)deleteAudioId
{
}

- (BOOL)hasAudioId
{
  return self->_audioId != 0;
}

- (void)deleteOrchCancelledReason
{
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (void)setHasOrchCancelledReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasOrchCancelledReason
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setOrchCancelledReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_int orchCancelledReason = a3;
}

- (void)deleteResponseId
{
}

- (BOOL)hasResponseId
{
  return self->_responseId != 0;
}

- (void)deleteIsPersonalizedRequest
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasIsPersonalizedRequest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasIsPersonalizedRequest
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setIsPersonalizedRequest:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_int isPersonalizedRequest = a3;
}

- (void)deleteIsPersonalRequest
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasIsPersonalRequest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsPersonalRequest
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setIsPersonalRequest:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_int isPersonalRequest = a3;
}

- (void)deleteSubDomain
{
}

- (BOOL)hasSubDomain
{
  return self->_subDomain != 0;
}

- (void)deletePreItn1Best
{
}

- (BOOL)hasPreItn1Best
{
  return self->_preItn1Best != 0;
}

- (void)deleteAudioSkippedNumSamples
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasAudioSkippedNumSamples:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasAudioSkippedNumSamples
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAudioSkippedNumSamples:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unint64_t audioSkippedNumSamples = a3;
}

- (void)deleteAsrTask
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasAsrTask:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasAsrTask
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAsrTask:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int asrTask = a3;
}

- (void)deleteAudioSource
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasAudioSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasAudioSource
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAudioSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int audioSource = a3;
}

- (void)deleteAudioCodec
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasAudioCodec:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasAudioCodec
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAudioCodec:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int audioCodec = a3;
}

- (void)deleteIsDeviceHandHeld
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasIsDeviceHandHeld:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsDeviceHandHeld
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsDeviceHandHeld:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int isDeviceHandHeld = a3;
}

- (void)deleteIsMediaPlaying
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasIsMediaPlaying:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsMediaPlaying
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int isMediaPlaying = a3;
}

- (void)deleteIsWakeFromSleep
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasIsWakeFromSleep:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsWakeFromSleep
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsWakeFromSleep:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int isWakeFromSleep = a3;
}

- (void)deleteMotionActivity
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasMotionActivity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMotionActivity
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setMotionActivity:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int motionActivity = a3;
}

- (void)deleteInvocationSource
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasInvocationSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInvocationSource
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setInvocationSource:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int invocationSource = a3;
}

- (void)deleteSiriInputLocale
{
}

- (BOOL)hasSiriInputLocale
{
  return self->_siriInputLocale != 0;
}

- (void)deleteFirstPartyAudioInterfaceProductId
{
}

- (BOOL)hasFirstPartyAudioInterfaceProductId
{
  return self->_firstPartyAudioInterfaceProductId != 0;
}

- (void)deleteAudioInterfaceVendorId
{
}

- (BOOL)hasAudioInterfaceVendorId
{
  return self->_audioInterfaceVendorId != 0;
}

- (void)deleteSystemBuild
{
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteDeviceType
{
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteStartDatestampInDaysSince1970
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasStartDatestampInDaysSince1970:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasStartDatestampInDaysSince1970
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setStartDatestampInDaysSince1970:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unint64_t startDatestampInDaysSince1970 = a3;
}

- (void)deleteIsEnrollmentSample
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasIsEnrollmentSample:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasIsEnrollmentSample
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setIsEnrollmentSample:(BOOL)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int isEnrollmentSample = a3;
}

@end