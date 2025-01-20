@interface SISchemaMultiUserSetup
- (BOOL)hasNumGuestsAccepted;
- (BOOL)hasNumParticipantsWithTrust;
- (BOOL)hasNumUsersWhoSyncedRecognizeMyVoice;
- (BOOL)hasNumUsersWithLocationServicesEnabled;
- (BOOL)hasNumUsersWithMatchingSiriLanguage;
- (BOOL)hasNumUsersWithPersonalRequestsEnabled;
- (BOOL)hasNumUsersWithRecognizeMyVoiceEnabled;
- (BOOL)hasNumUsersWithSiriCloudSyncEnabled;
- (BOOL)hasNumVoiceProfilesAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaMultiUserSetup)initWithDictionary:(id)a3;
- (SISchemaMultiUserSetup)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)numUsersWithLocationServicesEnabled;
- (int)numUsersWithMatchingSiriLanguage;
- (int)numUsersWithPersonalRequestsEnabled;
- (int)numUsersWithSiriCloudSyncEnabled;
- (unint64_t)hash;
- (unsigned)numGuestsAccepted;
- (unsigned)numParticipantsWithTrust;
- (unsigned)numUsersWhoSyncedRecognizeMyVoice;
- (unsigned)numUsersWithRecognizeMyVoiceEnabled;
- (unsigned)numVoiceProfilesAvailable;
- (void)deleteNumGuestsAccepted;
- (void)deleteNumParticipantsWithTrust;
- (void)deleteNumUsersWhoSyncedRecognizeMyVoice;
- (void)deleteNumUsersWithLocationServicesEnabled;
- (void)deleteNumUsersWithMatchingSiriLanguage;
- (void)deleteNumUsersWithPersonalRequestsEnabled;
- (void)deleteNumUsersWithRecognizeMyVoiceEnabled;
- (void)deleteNumUsersWithSiriCloudSyncEnabled;
- (void)deleteNumVoiceProfilesAvailable;
- (void)setHasNumGuestsAccepted:(BOOL)a3;
- (void)setHasNumParticipantsWithTrust:(BOOL)a3;
- (void)setHasNumUsersWhoSyncedRecognizeMyVoice:(BOOL)a3;
- (void)setHasNumUsersWithLocationServicesEnabled:(BOOL)a3;
- (void)setHasNumUsersWithMatchingSiriLanguage:(BOOL)a3;
- (void)setHasNumUsersWithPersonalRequestsEnabled:(BOOL)a3;
- (void)setHasNumUsersWithRecognizeMyVoiceEnabled:(BOOL)a3;
- (void)setHasNumUsersWithSiriCloudSyncEnabled:(BOOL)a3;
- (void)setHasNumVoiceProfilesAvailable:(BOOL)a3;
- (void)setNumGuestsAccepted:(unsigned int)a3;
- (void)setNumParticipantsWithTrust:(unsigned int)a3;
- (void)setNumUsersWhoSyncedRecognizeMyVoice:(unsigned int)a3;
- (void)setNumUsersWithLocationServicesEnabled:(int)a3;
- (void)setNumUsersWithMatchingSiriLanguage:(int)a3;
- (void)setNumUsersWithPersonalRequestsEnabled:(int)a3;
- (void)setNumUsersWithRecognizeMyVoiceEnabled:(unsigned int)a3;
- (void)setNumUsersWithSiriCloudSyncEnabled:(int)a3;
- (void)setNumVoiceProfilesAvailable:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaMultiUserSetup

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)numUsersWithLocationServicesEnabled
{
  return self->_numUsersWithLocationServicesEnabled;
}

- (int)numUsersWithSiriCloudSyncEnabled
{
  return self->_numUsersWithSiriCloudSyncEnabled;
}

- (int)numUsersWithMatchingSiriLanguage
{
  return self->_numUsersWithMatchingSiriLanguage;
}

- (int)numUsersWithPersonalRequestsEnabled
{
  return self->_numUsersWithPersonalRequestsEnabled;
}

- (unsigned)numVoiceProfilesAvailable
{
  return self->_numVoiceProfilesAvailable;
}

- (unsigned)numUsersWithRecognizeMyVoiceEnabled
{
  return self->_numUsersWithRecognizeMyVoiceEnabled;
}

- (unsigned)numUsersWhoSyncedRecognizeMyVoice
{
  return self->_numUsersWhoSyncedRecognizeMyVoice;
}

- (unsigned)numParticipantsWithTrust
{
  return self->_numParticipantsWithTrust;
}

- (unsigned)numGuestsAccepted
{
  return self->_numGuestsAccepted;
}

- (SISchemaMultiUserSetup)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SISchemaMultiUserSetup;
  v5 = [(SISchemaMultiUserSetup *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numGuestsAccepted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaMultiUserSetup setNumGuestsAccepted:](v5, "setNumGuestsAccepted:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numParticipantsWithTrust"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaMultiUserSetup setNumParticipantsWithTrust:](v5, "setNumParticipantsWithTrust:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"numUsersWhoSyncedRecognizeMyVoice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaMultiUserSetup setNumUsersWhoSyncedRecognizeMyVoice:](v5, "setNumUsersWhoSyncedRecognizeMyVoice:", [v8 unsignedIntValue]);
    }
    v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"numUsersWithRecognizeMyVoiceEnabled", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaMultiUserSetup setNumUsersWithRecognizeMyVoiceEnabled:](v5, "setNumUsersWithRecognizeMyVoiceEnabled:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"numVoiceProfilesAvailable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaMultiUserSetup setNumVoiceProfilesAvailable:](v5, "setNumVoiceProfilesAvailable:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"numUsersWithPersonalRequestsEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaMultiUserSetup setNumUsersWithPersonalRequestsEnabled:](v5, "setNumUsersWithPersonalRequestsEnabled:", [v11 intValue]);
    }
    v19 = v7;
    v12 = [v4 objectForKeyedSubscript:@"numUsersWithMatchingSiriLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaMultiUserSetup setNumUsersWithMatchingSiriLanguage:](v5, "setNumUsersWithMatchingSiriLanguage:", [v12 intValue]);
    }
    v13 = v6;
    v14 = [v4 objectForKeyedSubscript:@"numUsersWithSiriCloudSyncEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaMultiUserSetup setNumUsersWithSiriCloudSyncEnabled:](v5, "setNumUsersWithSiriCloudSyncEnabled:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"numUsersWithLocationServicesEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaMultiUserSetup setNumUsersWithLocationServicesEnabled:](v5, "setNumUsersWithLocationServicesEnabled:", [v15 intValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (SISchemaMultiUserSetup)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaMultiUserSetup *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaMultiUserSetup *)self dictionaryRepresentation];
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
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaMultiUserSetup numGuestsAccepted](self, "numGuestsAccepted"));
    [v3 setObject:v7 forKeyedSubscript:@"numGuestsAccepted"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaMultiUserSetup numParticipantsWithTrust](self, "numParticipantsWithTrust"));
  [v3 setObject:v8 forKeyedSubscript:@"numParticipantsWithTrust"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaMultiUserSetup numUsersWhoSyncedRecognizeMyVoice](self, "numUsersWhoSyncedRecognizeMyVoice"));
  [v3 setObject:v9 forKeyedSubscript:@"numUsersWhoSyncedRecognizeMyVoice"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaMultiUserSetup numUsersWithLocationServicesEnabled](self, "numUsersWithLocationServicesEnabled"));
  [v3 setObject:v10 forKeyedSubscript:@"numUsersWithLocationServicesEnabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaMultiUserSetup numUsersWithMatchingSiriLanguage](self, "numUsersWithMatchingSiriLanguage"));
  [v3 setObject:v11 forKeyedSubscript:@"numUsersWithMatchingSiriLanguage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaMultiUserSetup numUsersWithPersonalRequestsEnabled](self, "numUsersWithPersonalRequestsEnabled"));
  [v3 setObject:v12 forKeyedSubscript:@"numUsersWithPersonalRequestsEnabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaMultiUserSetup numUsersWithRecognizeMyVoiceEnabled](self, "numUsersWithRecognizeMyVoiceEnabled"));
  [v3 setObject:v13 forKeyedSubscript:@"numUsersWithRecognizeMyVoiceEnabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaMultiUserSetup numUsersWithSiriCloudSyncEnabled](self, "numUsersWithSiriCloudSyncEnabled"));
  [v3 setObject:v14 forKeyedSubscript:@"numUsersWithSiriCloudSyncEnabled"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaMultiUserSetup numVoiceProfilesAvailable](self, "numVoiceProfilesAvailable"));
    [v3 setObject:v5 forKeyedSubscript:@"numVoiceProfilesAvailable"];
  }
LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v3 = 2654435761 * self->_numGuestsAccepted;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_numParticipantsWithTrust;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_numUsersWhoSyncedRecognizeMyVoice;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_numUsersWithRecognizeMyVoiceEnabled;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_numVoiceProfilesAvailable;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_numUsersWithPersonalRequestsEnabled;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_numUsersWithMatchingSiriLanguage;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_numUsersWithSiriCloudSyncEnabled;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_numUsersWithLocationServicesEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  $0A470813BFCAACBE0680D9256D259B0C has = self->_has;
  unsigned int v6 = v4[22];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_38;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int numGuestsAccepted = self->_numGuestsAccepted;
    if (numGuestsAccepted != [v4 numGuestsAccepted]) {
      goto LABEL_38;
    }
    $0A470813BFCAACBE0680D9256D259B0C has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_38;
  }
  if (v8)
  {
    unsigned int numParticipantsWithTrust = self->_numParticipantsWithTrust;
    if (numParticipantsWithTrust != [v4 numParticipantsWithTrust]) {
      goto LABEL_38;
    }
    $0A470813BFCAACBE0680D9256D259B0C has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_38;
  }
  if (v10)
  {
    unsigned int numUsersWhoSyncedRecognizeMyVoice = self->_numUsersWhoSyncedRecognizeMyVoice;
    if (numUsersWhoSyncedRecognizeMyVoice != [v4 numUsersWhoSyncedRecognizeMyVoice]) {
      goto LABEL_38;
    }
    $0A470813BFCAACBE0680D9256D259B0C has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_38;
  }
  if (v12)
  {
    unsigned int numUsersWithRecognizeMyVoiceEnabled = self->_numUsersWithRecognizeMyVoiceEnabled;
    if (numUsersWithRecognizeMyVoiceEnabled != [v4 numUsersWithRecognizeMyVoiceEnabled]) {
      goto LABEL_38;
    }
    $0A470813BFCAACBE0680D9256D259B0C has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_38;
  }
  if (v14)
  {
    unsigned int numVoiceProfilesAvailable = self->_numVoiceProfilesAvailable;
    if (numVoiceProfilesAvailable != [v4 numVoiceProfilesAvailable]) {
      goto LABEL_38;
    }
    $0A470813BFCAACBE0680D9256D259B0C has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_38;
  }
  if (v16)
  {
    int numUsersWithPersonalRequestsEnabled = self->_numUsersWithPersonalRequestsEnabled;
    if (numUsersWithPersonalRequestsEnabled != [v4 numUsersWithPersonalRequestsEnabled]) {
      goto LABEL_38;
    }
    $0A470813BFCAACBE0680D9256D259B0C has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_38;
  }
  if (v18)
  {
    int numUsersWithMatchingSiriLanguage = self->_numUsersWithMatchingSiriLanguage;
    if (numUsersWithMatchingSiriLanguage != [v4 numUsersWithMatchingSiriLanguage]) {
      goto LABEL_38;
    }
    $0A470813BFCAACBE0680D9256D259B0C has = self->_has;
    unsigned int v6 = v4[22];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_38;
  }
  if (v20)
  {
    int numUsersWithSiriCloudSyncEnabled = self->_numUsersWithSiriCloudSyncEnabled;
    if (numUsersWithSiriCloudSyncEnabled == [v4 numUsersWithSiriCloudSyncEnabled])
    {
      $0A470813BFCAACBE0680D9256D259B0C has = self->_has;
      unsigned int v6 = v4[22];
      goto LABEL_34;
    }
LABEL_38:
    BOOL v24 = 0;
    goto LABEL_39;
  }
LABEL_34:
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_38;
  }
  if (v22)
  {
    int numUsersWithLocationServicesEnabled = self->_numUsersWithLocationServicesEnabled;
    if (numUsersWithLocationServicesEnabled != [v4 numUsersWithLocationServicesEnabled]) {
      goto LABEL_38;
    }
  }
  BOOL v24 = 1;
LABEL_39:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteInt32Field();
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaMultiUserSetupReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumUsersWithLocationServicesEnabled
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasNumUsersWithLocationServicesEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumUsersWithLocationServicesEnabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumUsersWithLocationServicesEnabled:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int numUsersWithLocationServicesEnabled = a3;
}

- (void)deleteNumUsersWithSiriCloudSyncEnabled
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasNumUsersWithSiriCloudSyncEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumUsersWithSiriCloudSyncEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumUsersWithSiriCloudSyncEnabled:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int numUsersWithSiriCloudSyncEnabled = a3;
}

- (void)deleteNumUsersWithMatchingSiriLanguage
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasNumUsersWithMatchingSiriLanguage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumUsersWithMatchingSiriLanguage
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumUsersWithMatchingSiriLanguage:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int numUsersWithMatchingSiriLanguage = a3;
}

- (void)deleteNumUsersWithPersonalRequestsEnabled
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasNumUsersWithPersonalRequestsEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumUsersWithPersonalRequestsEnabled
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumUsersWithPersonalRequestsEnabled:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int numUsersWithPersonalRequestsEnabled = a3;
}

- (void)deleteNumVoiceProfilesAvailable
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasNumVoiceProfilesAvailable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumVoiceProfilesAvailable
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumVoiceProfilesAvailable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int numVoiceProfilesAvailable = a3;
}

- (void)deleteNumUsersWithRecognizeMyVoiceEnabled
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasNumUsersWithRecognizeMyVoiceEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumUsersWithRecognizeMyVoiceEnabled
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumUsersWithRecognizeMyVoiceEnabled:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int numUsersWithRecognizeMyVoiceEnabled = a3;
}

- (void)deleteNumUsersWhoSyncedRecognizeMyVoice
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasNumUsersWhoSyncedRecognizeMyVoice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumUsersWhoSyncedRecognizeMyVoice
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumUsersWhoSyncedRecognizeMyVoice:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int numUsersWhoSyncedRecognizeMyVoice = a3;
}

- (void)deleteNumParticipantsWithTrust
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasNumParticipantsWithTrust:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasNumParticipantsWithTrust
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumParticipantsWithTrust:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int numParticipantsWithTrust = a3;
}

- (void)deleteNumGuestsAccepted
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasNumGuestsAccepted:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasNumGuestsAccepted
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNumGuestsAccepted:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int numGuestsAccepted = a3;
}

@end