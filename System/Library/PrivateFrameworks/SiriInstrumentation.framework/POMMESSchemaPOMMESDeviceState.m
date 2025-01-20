@interface POMMESSchemaPOMMESDeviceState
- (BOOL)hasCompanionName;
- (BOOL)hasIsCarDoNotDisturbModeEnabled;
- (BOOL)hasIsCarPlayEnabled;
- (BOOL)hasIsEyesFreeEnabled;
- (BOOL)hasIsLockedWithPasscode;
- (BOOL)hasIsMultiUserDevice;
- (BOOL)hasIsTextToSpeechEnabled;
- (BOOL)hasIsVoiceTriggerEnabled;
- (BOOL)isCarDoNotDisturbModeEnabled;
- (BOOL)isCarPlayEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEyesFreeEnabled;
- (BOOL)isLockedWithPasscode;
- (BOOL)isMultiUserDevice;
- (BOOL)isTextToSpeechEnabled;
- (BOOL)isVoiceTriggerEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)companionName;
- (POMMESSchemaPOMMESDeviceState)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESDeviceState)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCompanionName;
- (void)deleteIsCarDoNotDisturbModeEnabled;
- (void)deleteIsCarPlayEnabled;
- (void)deleteIsEyesFreeEnabled;
- (void)deleteIsLockedWithPasscode;
- (void)deleteIsMultiUserDevice;
- (void)deleteIsTextToSpeechEnabled;
- (void)deleteIsVoiceTriggerEnabled;
- (void)setCompanionName:(id)a3;
- (void)setHasCompanionName:(BOOL)a3;
- (void)setHasIsCarDoNotDisturbModeEnabled:(BOOL)a3;
- (void)setHasIsCarPlayEnabled:(BOOL)a3;
- (void)setHasIsEyesFreeEnabled:(BOOL)a3;
- (void)setHasIsLockedWithPasscode:(BOOL)a3;
- (void)setHasIsMultiUserDevice:(BOOL)a3;
- (void)setHasIsTextToSpeechEnabled:(BOOL)a3;
- (void)setHasIsVoiceTriggerEnabled:(BOOL)a3;
- (void)setIsCarDoNotDisturbModeEnabled:(BOOL)a3;
- (void)setIsCarPlayEnabled:(BOOL)a3;
- (void)setIsEyesFreeEnabled:(BOOL)a3;
- (void)setIsLockedWithPasscode:(BOOL)a3;
- (void)setIsMultiUserDevice:(BOOL)a3;
- (void)setIsTextToSpeechEnabled:(BOOL)a3;
- (void)setIsVoiceTriggerEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESDeviceState

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasCompanionName:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (BOOL)isVoiceTriggerEnabled
{
  return self->_isVoiceTriggerEnabled;
}

- (BOOL)isTextToSpeechEnabled
{
  return self->_isTextToSpeechEnabled;
}

- (BOOL)isMultiUserDevice
{
  return self->_isMultiUserDevice;
}

- (BOOL)isLockedWithPasscode
{
  return self->_isLockedWithPasscode;
}

- (BOOL)isEyesFreeEnabled
{
  return self->_isEyesFreeEnabled;
}

- (BOOL)isCarPlayEnabled
{
  return self->_isCarPlayEnabled;
}

- (BOOL)isCarDoNotDisturbModeEnabled
{
  return self->_isCarDoNotDisturbModeEnabled;
}

- (void)setCompanionName:(id)a3
{
}

- (NSString)companionName
{
  return self->_companionName;
}

- (POMMESSchemaPOMMESDeviceState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)POMMESSchemaPOMMESDeviceState;
  v5 = [(POMMESSchemaPOMMESDeviceState *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"companionName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(POMMESSchemaPOMMESDeviceState *)v5 setCompanionName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isCarDoNotDisturbModeEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESDeviceState setIsCarDoNotDisturbModeEnabled:](v5, "setIsCarDoNotDisturbModeEnabled:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isCarPlayEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESDeviceState setIsCarPlayEnabled:](v5, "setIsCarPlayEnabled:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isEyesFreeEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESDeviceState setIsEyesFreeEnabled:](v5, "setIsEyesFreeEnabled:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isLockedWithPasscode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESDeviceState setIsLockedWithPasscode:](v5, "setIsLockedWithPasscode:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"isMultiUserDevice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESDeviceState setIsMultiUserDevice:](v5, "setIsMultiUserDevice:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"isTextToSpeechEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESDeviceState setIsTextToSpeechEnabled:](v5, "setIsTextToSpeechEnabled:", [v13 BOOLValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"isVoiceTriggerEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESDeviceState setIsVoiceTriggerEnabled:](v5, "setIsVoiceTriggerEnabled:", [v14 BOOLValue]);
    }
    v15 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESDeviceState)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESDeviceState *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESDeviceState *)self dictionaryRepresentation];
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
  if (self->_companionName)
  {
    id v4 = [(POMMESSchemaPOMMESDeviceState *)self companionName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"companionName"];
  }
  char v6 = *(&self->_isVoiceTriggerEnabled + 1);
  if (v6)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isCarDoNotDisturbModeEnabled](self, "isCarDoNotDisturbModeEnabled"));
    [v3 setObject:v9 forKeyedSubscript:@"isCarDoNotDisturbModeEnabled"];

    char v6 = *(&self->_isVoiceTriggerEnabled + 1);
    if ((v6 & 2) == 0)
    {
LABEL_5:
      if ((v6 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((*(&self->_isVoiceTriggerEnabled + 1) & 2) == 0)
  {
    goto LABEL_5;
  }
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isCarPlayEnabled](self, "isCarPlayEnabled"));
  [v3 setObject:v10 forKeyedSubscript:@"isCarPlayEnabled"];

  char v6 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v6 & 4) == 0)
  {
LABEL_6:
    if ((v6 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isEyesFreeEnabled](self, "isEyesFreeEnabled"));
  [v3 setObject:v11 forKeyedSubscript:@"isEyesFreeEnabled"];

  char v6 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v6 & 8) == 0)
  {
LABEL_7:
    if ((v6 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isLockedWithPasscode](self, "isLockedWithPasscode"));
  [v3 setObject:v12 forKeyedSubscript:@"isLockedWithPasscode"];

  char v6 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v6 & 0x10) == 0)
  {
LABEL_8:
    if ((v6 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isMultiUserDevice](self, "isMultiUserDevice"));
  [v3 setObject:v13 forKeyedSubscript:@"isMultiUserDevice"];

  char v6 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v6 & 0x20) == 0)
  {
LABEL_9:
    if ((v6 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_19:
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isTextToSpeechEnabled](self, "isTextToSpeechEnabled"));
  [v3 setObject:v14 forKeyedSubscript:@"isTextToSpeechEnabled"];

  if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x40) != 0)
  {
LABEL_10:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESDeviceState isVoiceTriggerEnabled](self, "isVoiceTriggerEnabled"));
    [v3 setObject:v7 forKeyedSubscript:@"isVoiceTriggerEnabled"];
  }
LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_companionName hash];
  if (*(&self->_isVoiceTriggerEnabled + 1))
  {
    uint64_t v4 = 2654435761 * self->_isCarDoNotDisturbModeEnabled;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_isCarPlayEnabled;
      if ((*(&self->_isVoiceTriggerEnabled + 1) & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(&self->_isVoiceTriggerEnabled + 1) & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_isEyesFreeEnabled;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(&self->_isVoiceTriggerEnabled + 1) & 8) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_isLockedWithPasscode;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x10) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_isMultiUserDevice;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v9 = 0;
    if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_13:
  uint64_t v8 = 0;
  if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_isTextToSpeechEnabled;
  if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_isVoiceTriggerEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  uint64_t v5 = [(POMMESSchemaPOMMESDeviceState *)self companionName];
  uint64_t v6 = [v4 companionName];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_36;
  }
  uint64_t v8 = [(POMMESSchemaPOMMESDeviceState *)self companionName];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(POMMESSchemaPOMMESDeviceState *)self companionName];
    v11 = [v4 companionName];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  unsigned int v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
  unsigned int v14 = v4[23];
  if ((v13 & 1) != (v14 & 1))
  {
LABEL_36:
    BOOL v28 = 0;
    goto LABEL_37;
  }
  if (v13)
  {
    int isCarDoNotDisturbModeEnabled = self->_isCarDoNotDisturbModeEnabled;
    if (isCarDoNotDisturbModeEnabled != [v4 isCarDoNotDisturbModeEnabled]) {
      goto LABEL_36;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
    unsigned int v14 = v4[23];
  }
  int v16 = (v13 >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_36;
  }
  if (v16)
  {
    int isCarPlayEnabled = self->_isCarPlayEnabled;
    if (isCarPlayEnabled != [v4 isCarPlayEnabled]) {
      goto LABEL_36;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
    unsigned int v14 = v4[23];
  }
  int v18 = (v13 >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_36;
  }
  if (v18)
  {
    int isEyesFreeEnabled = self->_isEyesFreeEnabled;
    if (isEyesFreeEnabled != [v4 isEyesFreeEnabled]) {
      goto LABEL_36;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
    unsigned int v14 = v4[23];
  }
  int v20 = (v13 >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_36;
  }
  if (v20)
  {
    int isLockedWithPasscode = self->_isLockedWithPasscode;
    if (isLockedWithPasscode != [v4 isLockedWithPasscode]) {
      goto LABEL_36;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
    unsigned int v14 = v4[23];
  }
  int v22 = (v13 >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1)) {
    goto LABEL_36;
  }
  if (v22)
  {
    int isMultiUserDevice = self->_isMultiUserDevice;
    if (isMultiUserDevice != [v4 isMultiUserDevice]) {
      goto LABEL_36;
    }
    unsigned int v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
    unsigned int v14 = v4[23];
  }
  int v24 = (v13 >> 5) & 1;
  if (v24 != ((v14 >> 5) & 1)) {
    goto LABEL_36;
  }
  if (v24)
  {
    int isTextToSpeechEnabled = self->_isTextToSpeechEnabled;
    if (isTextToSpeechEnabled == [v4 isTextToSpeechEnabled])
    {
      unsigned int v13 = *((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1);
      unsigned int v14 = v4[23];
      goto LABEL_32;
    }
    goto LABEL_36;
  }
LABEL_32:
  int v26 = (v13 >> 6) & 1;
  if (v26 != ((v14 >> 6) & 1)) {
    goto LABEL_36;
  }
  if (v26)
  {
    int isVoiceTriggerEnabled = self->_isVoiceTriggerEnabled;
    if (isVoiceTriggerEnabled != [v4 isVoiceTriggerEnabled]) {
      goto LABEL_36;
    }
  }
  BOOL v28 = 1;
LABEL_37:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(POMMESSchemaPOMMESDeviceState *)self companionName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char v5 = *(&self->_isVoiceTriggerEnabled + 1);
  if (v5)
  {
    PBDataWriterWriteBOOLField();
    char v5 = *(&self->_isVoiceTriggerEnabled + 1);
  }
  uint64_t v6 = v7;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v6 = v7;
    char v5 = *(&self->_isVoiceTriggerEnabled + 1);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v6 = v7;
  char v5 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  uint64_t v6 = v7;
  char v5 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  uint64_t v6 = v7;
  char v5 = *(&self->_isVoiceTriggerEnabled + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  uint64_t v6 = v7;
  if ((*(&self->_isVoiceTriggerEnabled + 1) & 0x40) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    uint64_t v6 = v7;
  }
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESDeviceStateReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsVoiceTriggerEnabled
{
  *(&self->_isVoiceTriggerEnabled + 1) &= ~0x40u;
}

- (void)setHasIsVoiceTriggerEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xBF | v3;
}

- (BOOL)hasIsVoiceTriggerEnabled
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 6) & 1;
}

- (void)setIsVoiceTriggerEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 0x40u;
  self->_int isVoiceTriggerEnabled = a3;
}

- (void)deleteIsTextToSpeechEnabled
{
  *(&self->_isVoiceTriggerEnabled + 1) &= ~0x20u;
}

- (void)setHasIsTextToSpeechEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xDF | v3;
}

- (BOOL)hasIsTextToSpeechEnabled
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 5) & 1;
}

- (void)setIsTextToSpeechEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 0x20u;
  self->_int isTextToSpeechEnabled = a3;
}

- (void)deleteIsMultiUserDevice
{
  *(&self->_isVoiceTriggerEnabled + 1) &= ~0x10u;
}

- (void)setHasIsMultiUserDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xEF | v3;
}

- (BOOL)hasIsMultiUserDevice
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 4) & 1;
}

- (void)setIsMultiUserDevice:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 0x10u;
  self->_int isMultiUserDevice = a3;
}

- (void)deleteIsLockedWithPasscode
{
  *(&self->_isVoiceTriggerEnabled + 1) &= ~8u;
}

- (void)setHasIsLockedWithPasscode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xF7 | v3;
}

- (BOOL)hasIsLockedWithPasscode
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 3) & 1;
}

- (void)setIsLockedWithPasscode:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 8u;
  self->_int isLockedWithPasscode = a3;
}

- (void)deleteIsEyesFreeEnabled
{
  *(&self->_isVoiceTriggerEnabled + 1) &= ~4u;
}

- (void)setHasIsEyesFreeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xFB | v3;
}

- (BOOL)hasIsEyesFreeEnabled
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 2) & 1;
}

- (void)setIsEyesFreeEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 4u;
  self->_int isEyesFreeEnabled = a3;
}

- (void)deleteIsCarPlayEnabled
{
  *(&self->_isVoiceTriggerEnabled + 1) &= ~2u;
}

- (void)setHasIsCarPlayEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xFD | v3;
}

- (BOOL)hasIsCarPlayEnabled
{
  return (*((unsigned __int8 *)&self->_isVoiceTriggerEnabled + 1) >> 1) & 1;
}

- (void)setIsCarPlayEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 2u;
  self->_int isCarPlayEnabled = a3;
}

- (void)deleteIsCarDoNotDisturbModeEnabled
{
  *(&self->_isVoiceTriggerEnabled + 1) &= ~1u;
}

- (void)setHasIsCarDoNotDisturbModeEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) = *(&self->_isVoiceTriggerEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasIsCarDoNotDisturbModeEnabled
{
  return *(&self->_isVoiceTriggerEnabled + 1);
}

- (void)setIsCarDoNotDisturbModeEnabled:(BOOL)a3
{
  *(&self->_isVoiceTriggerEnabled + 1) |= 1u;
  self->_int isCarDoNotDisturbModeEnabled = a3;
}

- (void)deleteCompanionName
{
}

- (BOOL)hasCompanionName
{
  return self->_companionName != 0;
}

@end