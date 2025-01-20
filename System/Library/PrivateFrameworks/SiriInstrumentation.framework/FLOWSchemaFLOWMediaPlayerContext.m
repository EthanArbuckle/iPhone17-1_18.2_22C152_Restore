@interface FLOWSchemaFLOWMediaPlayerContext
- (BOOL)hasAirPlayRouteSettingStatus;
- (BOOL)hasAirPlaySuccessfullyPlayingDevicesCount;
- (BOOL)hasAirPlayTargetedDevicesCount;
- (BOOL)hasAppleMusicVoicePreviewOfferNotShown;
- (BOOL)hasAppleMusicVoiceUserSubscriptionState;
- (BOOL)hasIsAppleMusicVoiceEligible;
- (BOOL)hasIsMusicSubscriber;
- (BOOL)hasIsSiriForAirPlayRequest;
- (BOOL)hasIsWholeHouseAudio;
- (BOOL)hasMediaPlayerPlaybackContext;
- (BOOL)hasMediaType;
- (BOOL)hasTaskType;
- (BOOL)hasUserPersona;
- (BOOL)hasWholeHouseAudioDestinationContext;
- (BOOL)isAppleMusicVoiceEligible;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMusicSubscriber;
- (BOOL)isSiriForAirPlayRequest;
- (BOOL)isWholeHouseAudio;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWMediaPlayerContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWMediaPlayerContext)initWithJSON:(id)a3;
- (FLOWSchemaFLOWMediaPlayerPlaybackContext)mediaPlayerPlaybackContext;
- (FLOWSchemaFLOWholeHouseAudioDestinationContext)wholeHouseAudioDestinationContext;
- (NSArray)activeSubscriptions;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)activeSubscriptionsAtIndex:(unint64_t)a3;
- (int)airPlayRouteSettingStatus;
- (int)appleMusicVoicePreviewOfferNotShown;
- (int)appleMusicVoiceUserSubscriptionState;
- (int)mediaType;
- (int)taskType;
- (int)userPersona;
- (unint64_t)activeSubscriptionsCount;
- (unint64_t)hash;
- (unint64_t)whichMediaplayertaskcontext;
- (unsigned)airPlaySuccessfullyPlayingDevicesCount;
- (unsigned)airPlayTargetedDevicesCount;
- (void)addActiveSubscriptions:(int)a3;
- (void)clearActiveSubscriptions;
- (void)deleteAirPlayRouteSettingStatus;
- (void)deleteAirPlaySuccessfullyPlayingDevicesCount;
- (void)deleteAirPlayTargetedDevicesCount;
- (void)deleteAppleMusicVoicePreviewOfferNotShown;
- (void)deleteAppleMusicVoiceUserSubscriptionState;
- (void)deleteIsAppleMusicVoiceEligible;
- (void)deleteIsMusicSubscriber;
- (void)deleteIsSiriForAirPlayRequest;
- (void)deleteIsWholeHouseAudio;
- (void)deleteMediaPlayerPlaybackContext;
- (void)deleteMediaType;
- (void)deleteTaskType;
- (void)deleteUserPersona;
- (void)deleteWholeHouseAudioDestinationContext;
- (void)setActiveSubscriptions:(id)a3;
- (void)setAirPlayRouteSettingStatus:(int)a3;
- (void)setAirPlaySuccessfullyPlayingDevicesCount:(unsigned int)a3;
- (void)setAirPlayTargetedDevicesCount:(unsigned int)a3;
- (void)setAppleMusicVoicePreviewOfferNotShown:(int)a3;
- (void)setAppleMusicVoiceUserSubscriptionState:(int)a3;
- (void)setHasAirPlayRouteSettingStatus:(BOOL)a3;
- (void)setHasAirPlaySuccessfullyPlayingDevicesCount:(BOOL)a3;
- (void)setHasAirPlayTargetedDevicesCount:(BOOL)a3;
- (void)setHasAppleMusicVoicePreviewOfferNotShown:(BOOL)a3;
- (void)setHasAppleMusicVoiceUserSubscriptionState:(BOOL)a3;
- (void)setHasIsAppleMusicVoiceEligible:(BOOL)a3;
- (void)setHasIsMusicSubscriber:(BOOL)a3;
- (void)setHasIsSiriForAirPlayRequest:(BOOL)a3;
- (void)setHasIsWholeHouseAudio:(BOOL)a3;
- (void)setHasMediaPlayerPlaybackContext:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasTaskType:(BOOL)a3;
- (void)setHasUserPersona:(BOOL)a3;
- (void)setHasWholeHouseAudioDestinationContext:(BOOL)a3;
- (void)setIsAppleMusicVoiceEligible:(BOOL)a3;
- (void)setIsMusicSubscriber:(BOOL)a3;
- (void)setIsSiriForAirPlayRequest:(BOOL)a3;
- (void)setIsWholeHouseAudio:(BOOL)a3;
- (void)setMediaPlayerPlaybackContext:(id)a3;
- (void)setMediaType:(int)a3;
- (void)setTaskType:(int)a3;
- (void)setUserPersona:(int)a3;
- (void)setWholeHouseAudioDestinationContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWMediaPlayerContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLOWSchemaFLOWMediaPlayerContext;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWMediaPlayerContext *)self wholeHouseAudioDestinationContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWMediaPlayerContext *)self deleteWholeHouseAudioDestinationContext];
  }
  v9 = [(FLOWSchemaFLOWMediaPlayerContext *)self mediaPlayerPlaybackContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWMediaPlayerContext *)self deleteMediaPlayerPlaybackContext];
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
  objc_storeStrong((id *)&self->_mediaPlayerPlaybackContext, 0);
  objc_storeStrong((id *)&self->_activeSubscriptions, 0);
  objc_storeStrong((id *)&self->_wholeHouseAudioDestinationContext, 0);
}

- (void)setHasMediaPlayerPlaybackContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (BOOL)hasMediaPlayerPlaybackContext
{
  return *((unsigned char *)&self->_has + 3);
}

- (void)setHasWholeHouseAudioDestinationContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (int)userPersona
{
  return self->_userPersona;
}

- (int)airPlayRouteSettingStatus
{
  return self->_airPlayRouteSettingStatus;
}

- (unsigned)airPlaySuccessfullyPlayingDevicesCount
{
  return self->_airPlaySuccessfullyPlayingDevicesCount;
}

- (unsigned)airPlayTargetedDevicesCount
{
  return self->_airPlayTargetedDevicesCount;
}

- (BOOL)isSiriForAirPlayRequest
{
  return self->_isSiriForAirPlayRequest;
}

- (BOOL)isAppleMusicVoiceEligible
{
  return self->_isAppleMusicVoiceEligible;
}

- (int)appleMusicVoicePreviewOfferNotShown
{
  return self->_appleMusicVoicePreviewOfferNotShown;
}

- (int)appleMusicVoiceUserSubscriptionState
{
  return self->_appleMusicVoiceUserSubscriptionState;
}

- (void)setActiveSubscriptions:(id)a3
{
}

- (NSArray)activeSubscriptions
{
  return self->_activeSubscriptions;
}

- (BOOL)isMusicSubscriber
{
  return self->_isMusicSubscriber;
}

- (void)setWholeHouseAudioDestinationContext:(id)a3
{
}

- (FLOWSchemaFLOWholeHouseAudioDestinationContext)wholeHouseAudioDestinationContext
{
  return self->_wholeHouseAudioDestinationContext;
}

- (BOOL)isWholeHouseAudio
{
  return self->_isWholeHouseAudio;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (int)taskType
{
  return self->_taskType;
}

- (unint64_t)whichMediaplayertaskcontext
{
  return *(void *)&self->_hasWholeHouseAudioDestinationContext;
}

- (FLOWSchemaFLOWMediaPlayerContext)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)FLOWSchemaFLOWMediaPlayerContext;
  v5 = [(FLOWSchemaFLOWMediaPlayerContext *)&v44 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"taskType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setTaskType:](v5, "setTaskType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"mediaType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setMediaType:](v5, "setMediaType:", [v7 intValue]);
    }
    v36 = v7;
    v37 = v6;
    int v8 = [v4 objectForKeyedSubscript:@"isWholeHouseAudio"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setIsWholeHouseAudio:](v5, "setIsWholeHouseAudio:", [v8 BOOLValue]);
    }
    v35 = v8;
    uint64_t v9 = [v4 objectForKeyedSubscript:@"wholeHouseAudioDestinationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[FLOWSchemaFLOWholeHouseAudioDestinationContext alloc] initWithDictionary:v9];
      [(FLOWSchemaFLOWMediaPlayerContext *)v5 setWholeHouseAudioDestinationContext:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"isMusicSubscriber"];
    objc_opt_class();
    v39 = v11;
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setIsMusicSubscriber:](v5, "setIsMusicSubscriber:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"activeSubscriptions"];
    objc_opt_class();
    v38 = v12;
    if (objc_opt_isKindOfClass())
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v41 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[FLOWSchemaFLOWMediaPlayerContext addActiveSubscriptions:](v5, "addActiveSubscriptions:", [v18 intValue]);
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v15);
      }
    }
    v19 = [v4 objectForKeyedSubscript:@"appleMusicVoiceUserSubscriptionState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setAppleMusicVoiceUserSubscriptionState:](v5, "setAppleMusicVoiceUserSubscriptionState:", [v19 intValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"appleMusicVoicePreviewOfferNotShown"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setAppleMusicVoicePreviewOfferNotShown:](v5, "setAppleMusicVoicePreviewOfferNotShown:", [v20 intValue]);
    }
    v33 = v20;
    v21 = [v4 objectForKeyedSubscript:@"isAppleMusicVoiceEligible"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setIsAppleMusicVoiceEligible:](v5, "setIsAppleMusicVoiceEligible:", [v21 BOOLValue]);
    }
    v22 = objc_msgSend(v4, "objectForKeyedSubscript:", @"mediaPlayerPlaybackContext", v21);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [[FLOWSchemaFLOWMediaPlayerPlaybackContext alloc] initWithDictionary:v22];
      [(FLOWSchemaFLOWMediaPlayerContext *)v5 setMediaPlayerPlaybackContext:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"isSiriForAirPlayRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setIsSiriForAirPlayRequest:](v5, "setIsSiriForAirPlayRequest:", [v24 BOOLValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"airPlayTargetedDevicesCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setAirPlayTargetedDevicesCount:](v5, "setAirPlayTargetedDevicesCount:", [v25 unsignedIntValue]);
    }
    v34 = v19;
    v26 = [v4 objectForKeyedSubscript:@"airPlaySuccessfullyPlayingDevicesCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setAirPlaySuccessfullyPlayingDevicesCount:](v5, "setAirPlaySuccessfullyPlayingDevicesCount:", [v26 unsignedIntValue]);
    }
    v27 = (void *)v9;
    v28 = [v4 objectForKeyedSubscript:@"airPlayRouteSettingStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setAirPlayRouteSettingStatus:](v5, "setAirPlayRouteSettingStatus:", [v28 intValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"userPersona"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerContext setUserPersona:](v5, "setUserPersona:", [v29 intValue]);
    }
    v30 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWMediaPlayerContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWMediaPlayerContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWMediaPlayerContext *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_activeSubscriptions count])
  {
    id v4 = [(FLOWSchemaFLOWMediaPlayerContext *)self activeSubscriptions];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"activeSubscriptions"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    unsigned int v7 = [(FLOWSchemaFLOWMediaPlayerContext *)self airPlayRouteSettingStatus] - 1;
    if (v7 > 5) {
      int v8 = @"FLOWMEDIAPLAYERSETAIRPLAYROUTESSTATUS_UNKNOWN";
    }
    else {
      int v8 = off_1E5EAF4B8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"airPlayRouteSettingStatus"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWMediaPlayerContext airPlaySuccessfullyPlayingDevicesCount](self, "airPlaySuccessfullyPlayingDevicesCount"));
    [v3 setObject:v12 forKeyedSubscript:@"airPlaySuccessfullyPlayingDevicesCount"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 0x100) == 0)
  {
    goto LABEL_10;
  }
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWMediaPlayerContext airPlayTargetedDevicesCount](self, "airPlayTargetedDevicesCount"));
  [v3 setObject:v13 forKeyedSubscript:@"airPlayTargetedDevicesCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_22:
  unsigned int v14 = [(FLOWSchemaFLOWMediaPlayerContext *)self appleMusicVoicePreviewOfferNotShown]- 1;
  if (v14 > 0x15) {
    uint64_t v15 = @"FLOWAPPLEMUSICVOICEPREVIEWOFFERNOTSHOWNREASON_UNKNOWN";
  }
  else {
    uint64_t v15 = off_1E5EAF4E8[v14];
  }
  [v3 setObject:v15 forKeyedSubscript:@"appleMusicVoicePreviewOfferNotShown"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_34:
  unsigned int v20 = [(FLOWSchemaFLOWMediaPlayerContext *)self appleMusicVoiceUserSubscriptionState]- 1;
  if (v20 > 3) {
    v21 = @"FLOWAPPLEMUSICVOICEUSERSUBSCRIPTIONSTATE_UNKNOWN";
  }
  else {
    v21 = off_1E5EAF598[v20];
  }
  [v3 setObject:v21 forKeyedSubscript:@"appleMusicVoiceUserSubscriptionState"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerContext isAppleMusicVoiceEligible](self, "isAppleMusicVoiceEligible"));
  [v3 setObject:v24 forKeyedSubscript:@"isAppleMusicVoiceEligible"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerContext isMusicSubscriber](self, "isMusicSubscriber"));
  [v3 setObject:v25 forKeyedSubscript:@"isMusicSubscriber"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_15:
    if ((has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_44:
  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerContext isSiriForAirPlayRequest](self, "isSiriForAirPlayRequest"));
  [v3 setObject:v26 forKeyedSubscript:@"isSiriForAirPlayRequest"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerContext isWholeHouseAudio](self, "isWholeHouseAudio"));
    [v3 setObject:v9 forKeyedSubscript:@"isWholeHouseAudio"];
  }
LABEL_17:
  if (self->_mediaPlayerPlaybackContext)
  {
    v10 = [(FLOWSchemaFLOWMediaPlayerContext *)self mediaPlayerPlaybackContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"mediaPlayerPlaybackContext"];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"mediaPlayerPlaybackContext"];
    }
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 2) != 0)
  {
    unsigned int v18 = [(FLOWSchemaFLOWMediaPlayerContext *)self mediaType] - 1;
    if (v18 > 0x1B) {
      v19 = @"FLOWMEDIATYPE_UNKNOWN";
    }
    else {
      v19 = off_1E5EAF5B8[v18];
    }
    [v3 setObject:v19 forKeyedSubscript:@"mediaType"];
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 1) == 0)
    {
LABEL_28:
      if ((v17 & 0x800) == 0) {
        goto LABEL_52;
      }
      goto LABEL_48;
    }
  }
  else if ((v17 & 1) == 0)
  {
    goto LABEL_28;
  }
  unsigned int v22 = [(FLOWSchemaFLOWMediaPlayerContext *)self taskType] - 1;
  if (v22 > 0x22) {
    v23 = @"FLOWMEDIAPLAYERTASKTYPE_UNKNOWN";
  }
  else {
    v23 = off_1E5EAF698[v22];
  }
  [v3 setObject:v23 forKeyedSubscript:@"taskType"];
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_48:
    unsigned int v27 = [(FLOWSchemaFLOWMediaPlayerContext *)self userPersona] - 1;
    if (v27 > 5) {
      v28 = @"INFERENCEAPPSELECTIONUSERPERSONA_UNKNOWN";
    }
    else {
      v28 = off_1E5EAF7B0[v27];
    }
    [v3 setObject:v28 forKeyedSubscript:@"userPersona"];
  }
LABEL_52:
  if (self->_wholeHouseAudioDestinationContext)
  {
    v29 = [(FLOWSchemaFLOWMediaPlayerContext *)self wholeHouseAudioDestinationContext];
    v30 = [v29 dictionaryRepresentation];
    if (v30)
    {
      [v3 setObject:v30 forKeyedSubscript:@"wholeHouseAudioDestinationContext"];
    }
    else
    {
      v31 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v31 forKeyedSubscript:@"wholeHouseAudioDestinationContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v32 = v3;

  return v32;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    uint64_t v21 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v19 = 0;
    if ((has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v21 = 2654435761 * self->_taskType;
  if ((has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v19 = 2654435761 * self->_mediaType;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_isWholeHouseAudio;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v4 = 0;
LABEL_8:
  unint64_t v5 = [(FLOWSchemaFLOWholeHouseAudioDestinationContext *)self->_wholeHouseAudioDestinationContext hash];
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v6 = 2654435761 * self->_isMusicSubscriber;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSArray *)self->_activeSubscriptions hash];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
    uint64_t v9 = 0;
    if ((v8 & 0x20) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v10 = 0;
    if ((v8 & 0x40) != 0) {
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  uint64_t v9 = 2654435761 * self->_appleMusicVoiceUserSubscriptionState;
  if ((v8 & 0x20) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v10 = 2654435761 * self->_appleMusicVoicePreviewOfferNotShown;
  if ((v8 & 0x40) != 0)
  {
LABEL_14:
    uint64_t v11 = 2654435761 * self->_isAppleMusicVoiceEligible;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v11 = 0;
LABEL_18:
  unint64_t v12 = [(FLOWSchemaFLOWMediaPlayerPlaybackContext *)self->_mediaPlayerPlaybackContext hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    uint64_t v13 = 2654435761 * self->_isSiriForAirPlayRequest;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_20:
      uint64_t v14 = 2654435761 * self->_airPlayTargetedDevicesCount;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_21;
      }
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_20;
    }
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_21:
    uint64_t v15 = 2654435761 * self->_airPlaySuccessfullyPlayingDevicesCount;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_22;
    }
LABEL_27:
    uint64_t v16 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_23;
    }
LABEL_28:
    uint64_t v17 = 0;
    return v20 ^ v21 ^ v4 ^ v6 ^ v5 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_26:
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_27;
  }
LABEL_22:
  uint64_t v16 = 2654435761 * self->_airPlayRouteSettingStatus;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_28;
  }
LABEL_23:
  uint64_t v17 = 2654435761 * self->_userPersona;
  return v20 ^ v21 ^ v4 ^ v6 ^ v5 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  uint64_t v5 = *(void *)&self->_hasWholeHouseAudioDestinationContext;
  if (v5 != [v4 whichMediaplayertaskcontext]) {
    goto LABEL_43;
  }
  $9FB5FD0850FC83E4B9739053CE807413 has = self->_has;
  unsigned int v7 = v4[46];
  if ((*(unsigned char *)&has & 1) != (v7 & 1)) {
    goto LABEL_43;
  }
  if (*(unsigned char *)&has)
  {
    int taskType = self->_taskType;
    if (taskType != [v4 taskType]) {
      goto LABEL_43;
    }
    $9FB5FD0850FC83E4B9739053CE807413 has = self->_has;
    unsigned int v7 = v4[46];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1)) {
    goto LABEL_43;
  }
  if (v9)
  {
    int mediaType = self->_mediaType;
    if (mediaType != [v4 mediaType]) {
      goto LABEL_43;
    }
    $9FB5FD0850FC83E4B9739053CE807413 has = self->_has;
    unsigned int v7 = v4[46];
  }
  int v11 = (*(unsigned int *)&has >> 2) & 1;
  if (v11 != ((v7 >> 2) & 1)) {
    goto LABEL_43;
  }
  if (v11)
  {
    int isWholeHouseAudio = self->_isWholeHouseAudio;
    if (isWholeHouseAudio != [v4 isWholeHouseAudio]) {
      goto LABEL_43;
    }
  }
  uint64_t v13 = [(FLOWSchemaFLOWMediaPlayerContext *)self wholeHouseAudioDestinationContext];
  uint64_t v14 = [v4 wholeHouseAudioDestinationContext];
  if ((v13 == 0) == (v14 != 0)) {
    goto LABEL_42;
  }
  uint64_t v15 = [(FLOWSchemaFLOWMediaPlayerContext *)self wholeHouseAudioDestinationContext];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    uint64_t v17 = [(FLOWSchemaFLOWMediaPlayerContext *)self wholeHouseAudioDestinationContext];
    unsigned int v18 = [v4 wholeHouseAudioDestinationContext];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  int v20 = (*(_WORD *)&self->_has >> 3) & 1;
  if (v20 != ((v4[46] >> 3) & 1)) {
    goto LABEL_43;
  }
  if (v20)
  {
    int isMusicSubscriber = self->_isMusicSubscriber;
    if (isMusicSubscriber != [v4 isMusicSubscriber]) {
      goto LABEL_43;
    }
  }
  uint64_t v13 = [(FLOWSchemaFLOWMediaPlayerContext *)self activeSubscriptions];
  uint64_t v14 = [v4 activeSubscriptions];
  if ((v13 == 0) == (v14 != 0)) {
    goto LABEL_42;
  }
  uint64_t v22 = [(FLOWSchemaFLOWMediaPlayerContext *)self activeSubscriptions];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(FLOWSchemaFLOWMediaPlayerContext *)self activeSubscriptions];
    v25 = [v4 activeSubscriptions];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  $9FB5FD0850FC83E4B9739053CE807413 v27 = self->_has;
  int v28 = (*(unsigned int *)&v27 >> 4) & 1;
  unsigned int v29 = v4[46];
  if (v28 != ((v29 >> 4) & 1)) {
    goto LABEL_43;
  }
  if (v28)
  {
    int appleMusicVoiceUserSubscriptionState = self->_appleMusicVoiceUserSubscriptionState;
    if (appleMusicVoiceUserSubscriptionState != [v4 appleMusicVoiceUserSubscriptionState]) {
      goto LABEL_43;
    }
    $9FB5FD0850FC83E4B9739053CE807413 v27 = self->_has;
    unsigned int v29 = v4[46];
  }
  int v31 = (*(unsigned int *)&v27 >> 5) & 1;
  if (v31 != ((v29 >> 5) & 1)) {
    goto LABEL_43;
  }
  if (v31)
  {
    int appleMusicVoicePreviewOfferNotShown = self->_appleMusicVoicePreviewOfferNotShown;
    if (appleMusicVoicePreviewOfferNotShown != [v4 appleMusicVoicePreviewOfferNotShown]) {
      goto LABEL_43;
    }
    $9FB5FD0850FC83E4B9739053CE807413 v27 = self->_has;
    unsigned int v29 = v4[46];
  }
  int v33 = (*(unsigned int *)&v27 >> 6) & 1;
  if (v33 != ((v29 >> 6) & 1)) {
    goto LABEL_43;
  }
  if (v33)
  {
    int isAppleMusicVoiceEligible = self->_isAppleMusicVoiceEligible;
    if (isAppleMusicVoiceEligible != [v4 isAppleMusicVoiceEligible]) {
      goto LABEL_43;
    }
  }
  uint64_t v13 = [(FLOWSchemaFLOWMediaPlayerContext *)self mediaPlayerPlaybackContext];
  uint64_t v14 = [v4 mediaPlayerPlaybackContext];
  if ((v13 == 0) == (v14 != 0))
  {
LABEL_42:

    goto LABEL_43;
  }
  uint64_t v35 = [(FLOWSchemaFLOWMediaPlayerContext *)self mediaPlayerPlaybackContext];
  if (v35)
  {
    v36 = (void *)v35;
    v37 = [(FLOWSchemaFLOWMediaPlayerContext *)self mediaPlayerPlaybackContext];
    v38 = [v4 mediaPlayerPlaybackContext];
    int v39 = [v37 isEqual:v38];

    if (!v39) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  $9FB5FD0850FC83E4B9739053CE807413 v42 = self->_has;
  int v43 = (*(unsigned int *)&v42 >> 7) & 1;
  unsigned int v44 = v4[46];
  if (v43 == ((v44 >> 7) & 1))
  {
    if (v43)
    {
      int isSiriForAirPlayRequest = self->_isSiriForAirPlayRequest;
      if (isSiriForAirPlayRequest != [v4 isSiriForAirPlayRequest]) {
        goto LABEL_43;
      }
      $9FB5FD0850FC83E4B9739053CE807413 v42 = self->_has;
      unsigned int v44 = v4[46];
    }
    int v46 = (*(unsigned int *)&v42 >> 8) & 1;
    if (v46 == ((v44 >> 8) & 1))
    {
      if (v46)
      {
        unsigned int airPlayTargetedDevicesCount = self->_airPlayTargetedDevicesCount;
        if (airPlayTargetedDevicesCount != [v4 airPlayTargetedDevicesCount]) {
          goto LABEL_43;
        }
        $9FB5FD0850FC83E4B9739053CE807413 v42 = self->_has;
        unsigned int v44 = v4[46];
      }
      int v48 = (*(unsigned int *)&v42 >> 9) & 1;
      if (v48 == ((v44 >> 9) & 1))
      {
        if (v48)
        {
          unsigned int airPlaySuccessfullyPlayingDevicesCount = self->_airPlaySuccessfullyPlayingDevicesCount;
          if (airPlaySuccessfullyPlayingDevicesCount != [v4 airPlaySuccessfullyPlayingDevicesCount])goto LABEL_43; {
          $9FB5FD0850FC83E4B9739053CE807413 v42 = self->_has;
          }
          unsigned int v44 = v4[46];
        }
        int v50 = (*(unsigned int *)&v42 >> 10) & 1;
        if (v50 == ((v44 >> 10) & 1))
        {
          if (v50)
          {
            int airPlayRouteSettingStatus = self->_airPlayRouteSettingStatus;
            if (airPlayRouteSettingStatus != [v4 airPlayRouteSettingStatus]) {
              goto LABEL_43;
            }
            $9FB5FD0850FC83E4B9739053CE807413 v42 = self->_has;
            unsigned int v44 = v4[46];
          }
          int v52 = (*(unsigned int *)&v42 >> 11) & 1;
          if (v52 == ((v44 >> 11) & 1))
          {
            if (!v52
              || (int userPersona = self->_userPersona, userPersona == [v4 userPersona]))
            {
              BOOL v40 = 1;
              goto LABEL_44;
            }
          }
        }
      }
    }
  }
LABEL_43:
  BOOL v40 = 0;
LABEL_44:

  return v40;
}

- (void)writeTo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  uint64_t v6 = [(FLOWSchemaFLOWMediaPlayerContext *)self wholeHouseAudioDestinationContext];

  if (v6)
  {
    unsigned int v7 = [(FLOWSchemaFLOWMediaPlayerContext *)self wholeHouseAudioDestinationContext];
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  __int16 v8 = self->_activeSubscriptions;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "intValue", (void)v17);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x20) == 0)
    {
LABEL_18:
      if ((v13 & 0x40) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((v13 & 0x20) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_19:
  }
    PBDataWriterWriteBOOLField();
LABEL_20:
  uint64_t v14 = [(FLOWSchemaFLOWMediaPlayerContext *)self mediaPlayerPlaybackContext];

  if (v14)
  {
    uint64_t v15 = [(FLOWSchemaFLOWMediaPlayerContext *)self mediaPlayerPlaybackContext];
    PBDataWriterWriteSubmessage();
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v16 = (__int16)self->_has;
    if ((v16 & 0x100) == 0)
    {
LABEL_24:
      if ((v16 & 0x200) == 0) {
        goto LABEL_25;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteUint32Field();
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x200) == 0)
  {
LABEL_25:
    if ((v16 & 0x400) == 0) {
      goto LABEL_26;
    }
LABEL_38:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x400) != 0) {
    goto LABEL_38;
  }
LABEL_26:
  if ((v16 & 0x800) != 0) {
LABEL_27:
  }
    PBDataWriterWriteInt32Field();
LABEL_28:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMediaPlayerContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserPersona
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasUserPersona:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUserPersona
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setUserPersona:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_int userPersona = a3;
}

- (void)deleteAirPlayRouteSettingStatus
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasAirPlayRouteSettingStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasAirPlayRouteSettingStatus
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAirPlayRouteSettingStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int airPlayRouteSettingStatus = a3;
}

- (void)deleteAirPlaySuccessfullyPlayingDevicesCount
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasAirPlaySuccessfullyPlayingDevicesCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasAirPlaySuccessfullyPlayingDevicesCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAirPlaySuccessfullyPlayingDevicesCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unsigned int airPlaySuccessfullyPlayingDevicesCount = a3;
}

- (void)deleteAirPlayTargetedDevicesCount
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasAirPlayTargetedDevicesCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasAirPlayTargetedDevicesCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAirPlayTargetedDevicesCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int airPlayTargetedDevicesCount = a3;
}

- (void)deleteIsSiriForAirPlayRequest
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasIsSiriForAirPlayRequest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsSiriForAirPlayRequest
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsSiriForAirPlayRequest:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int isSiriForAirPlayRequest = a3;
}

- (void)deleteMediaPlayerPlaybackContext
{
  if (*(void *)&self->_hasWholeHouseAudioDestinationContext == 11)
  {
    *(void *)&self->_hasWholeHouseAudioDestinationContext = 0;
    self->_mediaPlayerPlaybackContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWMediaPlayerPlaybackContext)mediaPlayerPlaybackContext
{
  if (*(void *)&self->_hasWholeHouseAudioDestinationContext == 11) {
    v2 = self->_mediaPlayerPlaybackContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMediaPlayerPlaybackContext:(id)a3
{
  uint64_t v3 = 11;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_hasWholeHouseAudioDestinationContext = v3;
  objc_storeStrong((id *)&self->_mediaPlayerPlaybackContext, a3);
}

- (void)deleteIsAppleMusicVoiceEligible
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasIsAppleMusicVoiceEligible:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsAppleMusicVoiceEligible
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsAppleMusicVoiceEligible:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int isAppleMusicVoiceEligible = a3;
}

- (void)deleteAppleMusicVoicePreviewOfferNotShown
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasAppleMusicVoicePreviewOfferNotShown:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAppleMusicVoicePreviewOfferNotShown
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAppleMusicVoicePreviewOfferNotShown:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int appleMusicVoicePreviewOfferNotShown = a3;
}

- (void)deleteAppleMusicVoiceUserSubscriptionState
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasAppleMusicVoiceUserSubscriptionState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAppleMusicVoiceUserSubscriptionState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAppleMusicVoiceUserSubscriptionState:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int appleMusicVoiceUserSubscriptionState = a3;
}

- (int)activeSubscriptionsAtIndex:(unint64_t)a3
{
  __int16 v3 = [(NSArray *)self->_activeSubscriptions objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)activeSubscriptionsCount
{
  return [(NSArray *)self->_activeSubscriptions count];
}

- (void)addActiveSubscriptions:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  activeSubscriptions = self->_activeSubscriptions;
  if (!activeSubscriptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    unsigned int v7 = self->_activeSubscriptions;
    self->_activeSubscriptions = v6;

    activeSubscriptions = self->_activeSubscriptions;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)activeSubscriptions addObject:v8];
}

- (void)clearActiveSubscriptions
{
}

- (void)deleteIsMusicSubscriber
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasIsMusicSubscriber:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsMusicSubscriber
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIsMusicSubscriber:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int isMusicSubscriber = a3;
}

- (void)deleteWholeHouseAudioDestinationContext
{
}

- (BOOL)hasWholeHouseAudioDestinationContext
{
  return self->_wholeHouseAudioDestinationContext != 0;
}

- (void)deleteIsWholeHouseAudio
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasIsWholeHouseAudio:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasIsWholeHouseAudio
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIsWholeHouseAudio:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int isWholeHouseAudio = a3;
}

- (void)deleteMediaType
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasMediaType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMediaType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMediaType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int mediaType = a3;
}

- (void)deleteTaskType
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasTaskType:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTaskType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTaskType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int taskType = a3;
}

@end