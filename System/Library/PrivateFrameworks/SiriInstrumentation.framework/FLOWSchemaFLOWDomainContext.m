@interface FLOWSchemaFLOWDomainContext
- (BOOL)hasBriefingContext;
- (BOOL)hasHomeAutomationContext;
- (BOOL)hasHomeCommunicationContext;
- (BOOL)hasIdentityContext;
- (BOOL)hasInformationPluginContext;
- (BOOL)hasMediaPlayerContext;
- (BOOL)hasNotificationContext;
- (BOOL)hasPegasusContext;
- (BOOL)hasPhoneCallContext;
- (BOOL)hasPhotosContext;
- (BOOL)hasSmsContext;
- (BOOL)hasVoiceShortcutContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWBriefingContext)briefingContext;
- (FLOWSchemaFLOWDomainContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWDomainContext)initWithJSON:(id)a3;
- (FLOWSchemaFLOWHomeAutomationContext)homeAutomationContext;
- (FLOWSchemaFLOWHomeCommunicationContext)homeCommunicationContext;
- (FLOWSchemaFLOWIdentityContext)identityContext;
- (FLOWSchemaFLOWInformationPluginContext)informationPluginContext;
- (FLOWSchemaFLOWMediaPlayerContext)mediaPlayerContext;
- (FLOWSchemaFLOWNotificationContext)notificationContext;
- (FLOWSchemaFLOWPegasusContext)pegasusContext;
- (FLOWSchemaFLOWPhoneCallContext)phoneCallContext;
- (FLOWSchemaFLOWPhotosContext)photosContext;
- (FLOWSchemaFLOWSmsContext)smsContext;
- (FLOWSchemaFLOWVoiceShortcutContext)voiceShortcutContext;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichDomaincontext;
- (void)deleteBriefingContext;
- (void)deleteHomeAutomationContext;
- (void)deleteHomeCommunicationContext;
- (void)deleteIdentityContext;
- (void)deleteInformationPluginContext;
- (void)deleteMediaPlayerContext;
- (void)deleteNotificationContext;
- (void)deletePegasusContext;
- (void)deletePhoneCallContext;
- (void)deletePhotosContext;
- (void)deleteSmsContext;
- (void)deleteVoiceShortcutContext;
- (void)setBriefingContext:(id)a3;
- (void)setHasBriefingContext:(BOOL)a3;
- (void)setHasHomeAutomationContext:(BOOL)a3;
- (void)setHasHomeCommunicationContext:(BOOL)a3;
- (void)setHasIdentityContext:(BOOL)a3;
- (void)setHasInformationPluginContext:(BOOL)a3;
- (void)setHasMediaPlayerContext:(BOOL)a3;
- (void)setHasNotificationContext:(BOOL)a3;
- (void)setHasPegasusContext:(BOOL)a3;
- (void)setHasPhoneCallContext:(BOOL)a3;
- (void)setHasPhotosContext:(BOOL)a3;
- (void)setHasSmsContext:(BOOL)a3;
- (void)setHasVoiceShortcutContext:(BOOL)a3;
- (void)setHomeAutomationContext:(id)a3;
- (void)setHomeCommunicationContext:(id)a3;
- (void)setIdentityContext:(id)a3;
- (void)setInformationPluginContext:(id)a3;
- (void)setMediaPlayerContext:(id)a3;
- (void)setNotificationContext:(id)a3;
- (void)setPegasusContext:(id)a3;
- (void)setPhoneCallContext:(id)a3;
- (void)setPhotosContext:(id)a3;
- (void)setSmsContext:(id)a3;
- (void)setVoiceShortcutContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWDomainContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)FLOWSchemaFLOWDomainContext;
  v5 = [(SISchemaInstrumentationMessage *)&v43 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWDomainContext *)self voiceShortcutContext];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWDomainContext *)self deleteVoiceShortcutContext];
  }
  v9 = [(FLOWSchemaFLOWDomainContext *)self homeAutomationContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWDomainContext *)self deleteHomeAutomationContext];
  }
  v12 = [(FLOWSchemaFLOWDomainContext *)self phoneCallContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(FLOWSchemaFLOWDomainContext *)self deletePhoneCallContext];
  }
  v15 = [(FLOWSchemaFLOWDomainContext *)self smsContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(FLOWSchemaFLOWDomainContext *)self deleteSmsContext];
  }
  v18 = [(FLOWSchemaFLOWDomainContext *)self mediaPlayerContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(FLOWSchemaFLOWDomainContext *)self deleteMediaPlayerContext];
  }
  v21 = [(FLOWSchemaFLOWDomainContext *)self identityContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(FLOWSchemaFLOWDomainContext *)self deleteIdentityContext];
  }
  v24 = [(FLOWSchemaFLOWDomainContext *)self briefingContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(FLOWSchemaFLOWDomainContext *)self deleteBriefingContext];
  }
  v27 = [(FLOWSchemaFLOWDomainContext *)self pegasusContext];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(FLOWSchemaFLOWDomainContext *)self deletePegasusContext];
  }
  v30 = [(FLOWSchemaFLOWDomainContext *)self informationPluginContext];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(FLOWSchemaFLOWDomainContext *)self deleteInformationPluginContext];
  }
  v33 = [(FLOWSchemaFLOWDomainContext *)self homeCommunicationContext];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(FLOWSchemaFLOWDomainContext *)self deleteHomeCommunicationContext];
  }
  v36 = [(FLOWSchemaFLOWDomainContext *)self notificationContext];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(FLOWSchemaFLOWDomainContext *)self deleteNotificationContext];
  }
  v39 = [(FLOWSchemaFLOWDomainContext *)self photosContext];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(FLOWSchemaFLOWDomainContext *)self deletePhotosContext];
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
  objc_storeStrong((id *)&self->_photosContext, 0);
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_homeCommunicationContext, 0);
  objc_storeStrong((id *)&self->_informationPluginContext, 0);
  objc_storeStrong((id *)&self->_pegasusContext, 0);
  objc_storeStrong((id *)&self->_briefingContext, 0);
  objc_storeStrong((id *)&self->_identityContext, 0);
  objc_storeStrong((id *)&self->_mediaPlayerContext, 0);
  objc_storeStrong((id *)&self->_smsContext, 0);
  objc_storeStrong((id *)&self->_phoneCallContext, 0);
  objc_storeStrong((id *)&self->_homeAutomationContext, 0);
  objc_storeStrong((id *)&self->_voiceShortcutContext, 0);
}

- (void)setHasPhotosContext:(BOOL)a3
{
  self->_hasPhotosContext = a3;
}

- (BOOL)hasPhotosContext
{
  return self->_hasPhotosContext;
}

- (void)setHasNotificationContext:(BOOL)a3
{
  self->_hasNotificationContext = a3;
}

- (BOOL)hasNotificationContext
{
  return self->_hasNotificationContext;
}

- (void)setHasHomeCommunicationContext:(BOOL)a3
{
  self->_hasHomeCommunicationContext = a3;
}

- (BOOL)hasHomeCommunicationContext
{
  return self->_hasHomeCommunicationContext;
}

- (void)setHasInformationPluginContext:(BOOL)a3
{
  self->_hasInformationPluginContext = a3;
}

- (BOOL)hasInformationPluginContext
{
  return self->_hasInformationPluginContext;
}

- (void)setHasPegasusContext:(BOOL)a3
{
  self->_hasPegasusContext = a3;
}

- (BOOL)hasPegasusContext
{
  return self->_hasPegasusContext;
}

- (void)setHasBriefingContext:(BOOL)a3
{
  self->_hasBriefingContext = a3;
}

- (BOOL)hasBriefingContext
{
  return self->_hasBriefingContext;
}

- (void)setHasIdentityContext:(BOOL)a3
{
  self->_hasIdentityContext = a3;
}

- (BOOL)hasIdentityContext
{
  return self->_hasIdentityContext;
}

- (void)setHasMediaPlayerContext:(BOOL)a3
{
  self->_hasMediaPlayerContext = a3;
}

- (BOOL)hasMediaPlayerContext
{
  return self->_hasMediaPlayerContext;
}

- (void)setHasSmsContext:(BOOL)a3
{
  self->_hasSmsContext = a3;
}

- (BOOL)hasSmsContext
{
  return self->_hasSmsContext;
}

- (void)setHasPhoneCallContext:(BOOL)a3
{
  self->_hasPhoneCallContext = a3;
}

- (BOOL)hasPhoneCallContext
{
  return self->_hasPhoneCallContext;
}

- (void)setHasHomeAutomationContext:(BOOL)a3
{
  self->_hasHomeAutomationContext = a3;
}

- (BOOL)hasHomeAutomationContext
{
  return self->_hasHomeAutomationContext;
}

- (void)setHasVoiceShortcutContext:(BOOL)a3
{
  self->_hasVoiceShortcutContext = a3;
}

- (BOOL)hasVoiceShortcutContext
{
  return self->_hasVoiceShortcutContext;
}

- (unint64_t)whichDomaincontext
{
  return self->_whichDomaincontext;
}

- (FLOWSchemaFLOWDomainContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)FLOWSchemaFLOWDomainContext;
  v5 = [(FLOWSchemaFLOWDomainContext *)&v38 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"voiceShortcutContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[FLOWSchemaFLOWVoiceShortcutContext alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWDomainContext *)v5 setVoiceShortcutContext:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"homeAutomationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[FLOWSchemaFLOWHomeAutomationContext alloc] initWithDictionary:v8];
      [(FLOWSchemaFLOWDomainContext *)v5 setHomeAutomationContext:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"phoneCallContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[FLOWSchemaFLOWPhoneCallContext alloc] initWithDictionary:v10];
      [(FLOWSchemaFLOWDomainContext *)v5 setPhoneCallContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"smsContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[FLOWSchemaFLOWSmsContext alloc] initWithDictionary:v12];
      [(FLOWSchemaFLOWDomainContext *)v5 setSmsContext:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"mediaPlayerContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[FLOWSchemaFLOWMediaPlayerContext alloc] initWithDictionary:v14];
      [(FLOWSchemaFLOWDomainContext *)v5 setMediaPlayerContext:v15];
    }
    v34 = (void *)v14;
    uint64_t v16 = [v4 objectForKeyedSubscript:@"identityContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[FLOWSchemaFLOWIdentityContext alloc] initWithDictionary:v16];
      [(FLOWSchemaFLOWDomainContext *)v5 setIdentityContext:v17];
    }
    v33 = (void *)v16;
    v18 = [v4 objectForKeyedSubscript:@"briefingContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[FLOWSchemaFLOWBriefingContext alloc] initWithDictionary:v18];
      [(FLOWSchemaFLOWDomainContext *)v5 setBriefingContext:v19];
    }
    v37 = (void *)v6;
    int v20 = [v4 objectForKeyedSubscript:@"pegasusContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[FLOWSchemaFLOWPegasusContext alloc] initWithDictionary:v20];
      [(FLOWSchemaFLOWDomainContext *)v5 setPegasusContext:v21];
    }
    int v35 = (void *)v12;
    v36 = (void *)v8;
    v22 = [v4 objectForKeyedSubscript:@"informationPluginContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[FLOWSchemaFLOWInformationPluginContext alloc] initWithDictionary:v22];
      [(FLOWSchemaFLOWDomainContext *)v5 setInformationPluginContext:v23];
    }
    v24 = (void *)v10;
    v25 = [v4 objectForKeyedSubscript:@"homeCommunicationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[FLOWSchemaFLOWHomeCommunicationContext alloc] initWithDictionary:v25];
      [(FLOWSchemaFLOWDomainContext *)v5 setHomeCommunicationContext:v26];
    }
    v27 = [v4 objectForKeyedSubscript:@"notificationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[FLOWSchemaFLOWNotificationContext alloc] initWithDictionary:v27];
      [(FLOWSchemaFLOWDomainContext *)v5 setNotificationContext:v28];
    }
    int v29 = [v4 objectForKeyedSubscript:@"photosContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [[FLOWSchemaFLOWPhotosContext alloc] initWithDictionary:v29];
      [(FLOWSchemaFLOWDomainContext *)v5 setPhotosContext:v30];
    }
    v31 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWDomainContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWDomainContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWDomainContext *)self dictionaryRepresentation];
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
  if (self->_briefingContext)
  {
    id v4 = [(FLOWSchemaFLOWDomainContext *)self briefingContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"briefingContext"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"briefingContext"];
    }
  }
  if (self->_homeAutomationContext)
  {
    uint64_t v7 = [(FLOWSchemaFLOWDomainContext *)self homeAutomationContext];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"homeAutomationContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"homeAutomationContext"];
    }
  }
  if (self->_homeCommunicationContext)
  {
    uint64_t v10 = [(FLOWSchemaFLOWDomainContext *)self homeCommunicationContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"homeCommunicationContext"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"homeCommunicationContext"];
    }
  }
  if (self->_identityContext)
  {
    v13 = [(FLOWSchemaFLOWDomainContext *)self identityContext];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"identityContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"identityContext"];
    }
  }
  if (self->_informationPluginContext)
  {
    uint64_t v16 = [(FLOWSchemaFLOWDomainContext *)self informationPluginContext];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"informationPluginContext"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"informationPluginContext"];
    }
  }
  if (self->_mediaPlayerContext)
  {
    v19 = [(FLOWSchemaFLOWDomainContext *)self mediaPlayerContext];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"mediaPlayerContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"mediaPlayerContext"];
    }
  }
  if (self->_notificationContext)
  {
    v22 = [(FLOWSchemaFLOWDomainContext *)self notificationContext];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"notificationContext"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"notificationContext"];
    }
  }
  if (self->_pegasusContext)
  {
    v25 = [(FLOWSchemaFLOWDomainContext *)self pegasusContext];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"pegasusContext"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"pegasusContext"];
    }
  }
  if (self->_phoneCallContext)
  {
    v28 = [(FLOWSchemaFLOWDomainContext *)self phoneCallContext];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"phoneCallContext"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"phoneCallContext"];
    }
  }
  if (self->_photosContext)
  {
    v31 = [(FLOWSchemaFLOWDomainContext *)self photosContext];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"photosContext"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"photosContext"];
    }
  }
  if (self->_smsContext)
  {
    v34 = [(FLOWSchemaFLOWDomainContext *)self smsContext];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"smsContext"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"smsContext"];
    }
  }
  if (self->_voiceShortcutContext)
  {
    v37 = [(FLOWSchemaFLOWDomainContext *)self voiceShortcutContext];
    objc_super v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"voiceShortcutContext"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"voiceShortcutContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(FLOWSchemaFLOWVoiceShortcutContext *)self->_voiceShortcutContext hash];
  unint64_t v4 = [(FLOWSchemaFLOWHomeAutomationContext *)self->_homeAutomationContext hash] ^ v3;
  unint64_t v5 = [(FLOWSchemaFLOWPhoneCallContext *)self->_phoneCallContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(FLOWSchemaFLOWSmsContext *)self->_smsContext hash];
  unint64_t v7 = [(FLOWSchemaFLOWMediaPlayerContext *)self->_mediaPlayerContext hash];
  unint64_t v8 = v7 ^ [(FLOWSchemaFLOWIdentityContext *)self->_identityContext hash];
  unint64_t v9 = v6 ^ v8 ^ [(FLOWSchemaFLOWBriefingContext *)self->_briefingContext hash];
  unint64_t v10 = [(FLOWSchemaFLOWPegasusContext *)self->_pegasusContext hash];
  unint64_t v11 = v10 ^ [(FLOWSchemaFLOWInformationPluginContext *)self->_informationPluginContext hash];
  unint64_t v12 = v11 ^ [(FLOWSchemaFLOWHomeCommunicationContext *)self->_homeCommunicationContext hash];
  unint64_t v13 = v9 ^ v12 ^ [(FLOWSchemaFLOWNotificationContext *)self->_notificationContext hash];
  return v13 ^ [(FLOWSchemaFLOWPhotosContext *)self->_photosContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_63;
  }
  unint64_t whichDomaincontext = self->_whichDomaincontext;
  if (whichDomaincontext != [v4 whichDomaincontext]) {
    goto LABEL_63;
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self voiceShortcutContext];
  unint64_t v7 = [v4 voiceShortcutContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_62;
  }
  uint64_t v8 = [(FLOWSchemaFLOWDomainContext *)self voiceShortcutContext];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(FLOWSchemaFLOWDomainContext *)self voiceShortcutContext];
    unint64_t v11 = [v4 voiceShortcutContext];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self homeAutomationContext];
  unint64_t v7 = [v4 homeAutomationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_62;
  }
  uint64_t v13 = [(FLOWSchemaFLOWDomainContext *)self homeAutomationContext];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    v15 = [(FLOWSchemaFLOWDomainContext *)self homeAutomationContext];
    uint64_t v16 = [v4 homeAutomationContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self phoneCallContext];
  unint64_t v7 = [v4 phoneCallContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_62;
  }
  uint64_t v18 = [(FLOWSchemaFLOWDomainContext *)self phoneCallContext];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(FLOWSchemaFLOWDomainContext *)self phoneCallContext];
    v21 = [v4 phoneCallContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self smsContext];
  unint64_t v7 = [v4 smsContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_62;
  }
  uint64_t v23 = [(FLOWSchemaFLOWDomainContext *)self smsContext];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(FLOWSchemaFLOWDomainContext *)self smsContext];
    int v26 = [v4 smsContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self mediaPlayerContext];
  unint64_t v7 = [v4 mediaPlayerContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_62;
  }
  uint64_t v28 = [(FLOWSchemaFLOWDomainContext *)self mediaPlayerContext];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(FLOWSchemaFLOWDomainContext *)self mediaPlayerContext];
    v31 = [v4 mediaPlayerContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self identityContext];
  unint64_t v7 = [v4 identityContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_62;
  }
  uint64_t v33 = [(FLOWSchemaFLOWDomainContext *)self identityContext];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(FLOWSchemaFLOWDomainContext *)self identityContext];
    v36 = [v4 identityContext];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self briefingContext];
  unint64_t v7 = [v4 briefingContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_62;
  }
  uint64_t v38 = [(FLOWSchemaFLOWDomainContext *)self briefingContext];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(FLOWSchemaFLOWDomainContext *)self briefingContext];
    int v41 = [v4 briefingContext];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self pegasusContext];
  unint64_t v7 = [v4 pegasusContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_62;
  }
  uint64_t v43 = [(FLOWSchemaFLOWDomainContext *)self pegasusContext];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(FLOWSchemaFLOWDomainContext *)self pegasusContext];
    v46 = [v4 pegasusContext];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self informationPluginContext];
  unint64_t v7 = [v4 informationPluginContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_62;
  }
  uint64_t v48 = [(FLOWSchemaFLOWDomainContext *)self informationPluginContext];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(FLOWSchemaFLOWDomainContext *)self informationPluginContext];
    v51 = [v4 informationPluginContext];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self homeCommunicationContext];
  unint64_t v7 = [v4 homeCommunicationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_62;
  }
  uint64_t v53 = [(FLOWSchemaFLOWDomainContext *)self homeCommunicationContext];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(FLOWSchemaFLOWDomainContext *)self homeCommunicationContext];
    v56 = [v4 homeCommunicationContext];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self notificationContext];
  unint64_t v7 = [v4 notificationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_62;
  }
  uint64_t v58 = [(FLOWSchemaFLOWDomainContext *)self notificationContext];
  if (v58)
  {
    v59 = (void *)v58;
    v60 = [(FLOWSchemaFLOWDomainContext *)self notificationContext];
    v61 = [v4 notificationContext];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self photosContext];
  unint64_t v7 = [v4 photosContext];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v63 = [(FLOWSchemaFLOWDomainContext *)self photosContext];
    if (!v63)
    {

LABEL_66:
      BOOL v68 = 1;
      goto LABEL_64;
    }
    v64 = (void *)v63;
    v65 = [(FLOWSchemaFLOWDomainContext *)self photosContext];
    v66 = [v4 photosContext];
    char v67 = [v65 isEqual:v66];

    if (v67) {
      goto LABEL_66;
    }
  }
  else
  {
LABEL_62:
  }
LABEL_63:
  BOOL v68 = 0;
LABEL_64:

  return v68;
}

- (void)writeTo:(id)a3
{
  id v28 = a3;
  id v4 = [(FLOWSchemaFLOWDomainContext *)self voiceShortcutContext];

  if (v4)
  {
    unint64_t v5 = [(FLOWSchemaFLOWDomainContext *)self voiceShortcutContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(FLOWSchemaFLOWDomainContext *)self homeAutomationContext];

  if (v6)
  {
    unint64_t v7 = [(FLOWSchemaFLOWDomainContext *)self homeAutomationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(FLOWSchemaFLOWDomainContext *)self phoneCallContext];

  if (v8)
  {
    unint64_t v9 = [(FLOWSchemaFLOWDomainContext *)self phoneCallContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(FLOWSchemaFLOWDomainContext *)self smsContext];

  if (v10)
  {
    unint64_t v11 = [(FLOWSchemaFLOWDomainContext *)self smsContext];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(FLOWSchemaFLOWDomainContext *)self mediaPlayerContext];

  if (v12)
  {
    uint64_t v13 = [(FLOWSchemaFLOWDomainContext *)self mediaPlayerContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v14 = [(FLOWSchemaFLOWDomainContext *)self identityContext];

  if (v14)
  {
    v15 = [(FLOWSchemaFLOWDomainContext *)self identityContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v16 = [(FLOWSchemaFLOWDomainContext *)self briefingContext];

  if (v16)
  {
    int v17 = [(FLOWSchemaFLOWDomainContext *)self briefingContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(FLOWSchemaFLOWDomainContext *)self pegasusContext];

  if (v18)
  {
    v19 = [(FLOWSchemaFLOWDomainContext *)self pegasusContext];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(FLOWSchemaFLOWDomainContext *)self informationPluginContext];

  if (v20)
  {
    v21 = [(FLOWSchemaFLOWDomainContext *)self informationPluginContext];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(FLOWSchemaFLOWDomainContext *)self homeCommunicationContext];

  if (v22)
  {
    uint64_t v23 = [(FLOWSchemaFLOWDomainContext *)self homeCommunicationContext];
    PBDataWriterWriteSubmessage();
  }
  v24 = [(FLOWSchemaFLOWDomainContext *)self notificationContext];

  if (v24)
  {
    v25 = [(FLOWSchemaFLOWDomainContext *)self notificationContext];
    PBDataWriterWriteSubmessage();
  }
  int v26 = [(FLOWSchemaFLOWDomainContext *)self photosContext];

  if (v26)
  {
    int v27 = [(FLOWSchemaFLOWDomainContext *)self photosContext];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWDomainContextReadFrom(self, (uint64_t)a3);
}

- (void)deletePhotosContext
{
  if (self->_whichDomaincontext == 12)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_photosContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWPhotosContext)photosContext
{
  if (self->_whichDomaincontext == 12) {
    v2 = self->_photosContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPhotosContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWPhotosContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  unint64_t v16 = 12;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichDomaincontext = v16;
  photosContext = self->_photosContext;
  self->_photosContext = v4;
}

- (void)deleteNotificationContext
{
  if (self->_whichDomaincontext == 11)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_notificationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWNotificationContext)notificationContext
{
  if (self->_whichDomaincontext == 11) {
    v2 = self->_notificationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNotificationContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWNotificationContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  photosContext = self->_photosContext;
  self->_photosContext = 0;

  unint64_t v16 = 11;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichDomaincontext = v16;
  notificationContext = self->_notificationContext;
  self->_notificationContext = v4;
}

- (void)deleteHomeCommunicationContext
{
  if (self->_whichDomaincontext == 10)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_homeCommunicationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWHomeCommunicationContext)homeCommunicationContext
{
  if (self->_whichDomaincontext == 10) {
    v2 = self->_homeCommunicationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setHomeCommunicationContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWHomeCommunicationContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  photosContext = self->_photosContext;
  self->_photosContext = 0;

  unint64_t v16 = 10;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichDomaincontext = v16;
  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = v4;
}

- (void)deleteInformationPluginContext
{
  if (self->_whichDomaincontext == 9)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_informationPluginContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWInformationPluginContext)informationPluginContext
{
  if (self->_whichDomaincontext == 9) {
    v2 = self->_informationPluginContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setInformationPluginContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWInformationPluginContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  photosContext = self->_photosContext;
  self->_photosContext = 0;

  unint64_t v16 = 9;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichDomaincontext = v16;
  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = v4;
}

- (void)deletePegasusContext
{
  if (self->_whichDomaincontext == 8)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_pegasusContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWPegasusContext)pegasusContext
{
  if (self->_whichDomaincontext == 8) {
    v2 = self->_pegasusContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWPegasusContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  photosContext = self->_photosContext;
  self->_photosContext = 0;

  self->_unint64_t whichDomaincontext = 8 * (v4 != 0);
  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = v4;
}

- (void)deleteBriefingContext
{
  if (self->_whichDomaincontext == 7)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_briefingContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWBriefingContext)briefingContext
{
  if (self->_whichDomaincontext == 7) {
    v2 = self->_briefingContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setBriefingContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWBriefingContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  photosContext = self->_photosContext;
  self->_photosContext = 0;

  unint64_t v16 = 7;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichDomaincontext = v16;
  briefingContext = self->_briefingContext;
  self->_briefingContext = v4;
}

- (void)deleteIdentityContext
{
  if (self->_whichDomaincontext == 6)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_identityContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWIdentityContext)identityContext
{
  if (self->_whichDomaincontext == 6) {
    v2 = self->_identityContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIdentityContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWIdentityContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  photosContext = self->_photosContext;
  self->_photosContext = 0;

  unint64_t v16 = 6;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichDomaincontext = v16;
  identityContext = self->_identityContext;
  self->_identityContext = v4;
}

- (void)deleteMediaPlayerContext
{
  if (self->_whichDomaincontext == 5)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_mediaPlayerContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWMediaPlayerContext)mediaPlayerContext
{
  if (self->_whichDomaincontext == 5) {
    v2 = self->_mediaPlayerContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMediaPlayerContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWMediaPlayerContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  photosContext = self->_photosContext;
  self->_photosContext = 0;

  unint64_t v16 = 5;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichDomaincontext = v16;
  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = v4;
}

- (void)deleteSmsContext
{
  if (self->_whichDomaincontext == 4)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_smsContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWSmsContext)smsContext
{
  if (self->_whichDomaincontext == 4) {
    v2 = self->_smsContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSmsContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWSmsContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  photosContext = self->_photosContext;
  self->_photosContext = 0;

  self->_unint64_t whichDomaincontext = 4 * (v4 != 0);
  smsContext = self->_smsContext;
  self->_smsContext = v4;
}

- (void)deletePhoneCallContext
{
  if (self->_whichDomaincontext == 3)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_phoneCallContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWPhoneCallContext)phoneCallContext
{
  if (self->_whichDomaincontext == 3) {
    v2 = self->_phoneCallContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPhoneCallContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWPhoneCallContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  photosContext = self->_photosContext;
  self->_photosContext = 0;

  unint64_t v16 = 3;
  if (!v4) {
    unint64_t v16 = 0;
  }
  self->_unint64_t whichDomaincontext = v16;
  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = v4;
}

- (void)deleteHomeAutomationContext
{
  if (self->_whichDomaincontext == 2)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_homeAutomationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWHomeAutomationContext)homeAutomationContext
{
  if (self->_whichDomaincontext == 2) {
    v2 = self->_homeAutomationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setHomeAutomationContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWHomeAutomationContext *)a3;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  photosContext = self->_photosContext;
  self->_photosContext = 0;

  self->_unint64_t whichDomaincontext = 2 * (v4 != 0);
  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = v4;
}

- (void)deleteVoiceShortcutContext
{
  if (self->_whichDomaincontext == 1)
  {
    self->_unint64_t whichDomaincontext = 0;
    self->_voiceShortcutContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (FLOWSchemaFLOWVoiceShortcutContext)voiceShortcutContext
{
  if (self->_whichDomaincontext == 1) {
    v2 = self->_voiceShortcutContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVoiceShortcutContext:(id)a3
{
  id v4 = (FLOWSchemaFLOWVoiceShortcutContext *)a3;
  homeAutomationContext = self->_homeAutomationContext;
  self->_homeAutomationContext = 0;

  phoneCallContext = self->_phoneCallContext;
  self->_phoneCallContext = 0;

  smsContext = self->_smsContext;
  self->_smsContext = 0;

  mediaPlayerContext = self->_mediaPlayerContext;
  self->_mediaPlayerContext = 0;

  identityContext = self->_identityContext;
  self->_identityContext = 0;

  briefingContext = self->_briefingContext;
  self->_briefingContext = 0;

  pegasusContext = self->_pegasusContext;
  self->_pegasusContext = 0;

  informationPluginContext = self->_informationPluginContext;
  self->_informationPluginContext = 0;

  homeCommunicationContext = self->_homeCommunicationContext;
  self->_homeCommunicationContext = 0;

  notificationContext = self->_notificationContext;
  self->_notificationContext = 0;

  photosContext = self->_photosContext;
  self->_photosContext = 0;

  self->_unint64_t whichDomaincontext = v4 != 0;
  voiceShortcutContext = self->_voiceShortcutContext;
  self->_voiceShortcutContext = v4;
}

@end