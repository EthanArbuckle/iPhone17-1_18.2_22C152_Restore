@interface ODDSiriSchemaODDAnnounceProperties
- (BOOL)hasCarPlayStatus;
- (BOOL)hasIsAnnounceCallsEnabled;
- (BOOL)hasIsAnnounceNotificationsEnabled;
- (BOOL)hasIsCarPlayMuted;
- (BOOL)hasIsEnabledForHeadphones;
- (BOOL)hasIsProximityCardSeen;
- (BOOL)hasIsReplyWithoutConfirmationEnabled;
- (BOOL)hasIsSpokenNotificationsControlCenterModuleEnabled;
- (BOOL)isAnnounceCallsEnabled;
- (BOOL)isAnnounceNotificationsEnabled;
- (BOOL)isCarPlayMuted;
- (BOOL)isEnabledForHeadphones;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProximityCardSeen;
- (BOOL)isReplyWithoutConfirmationEnabled;
- (BOOL)isSpokenNotificationsControlCenterModuleEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDAnnounceProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAnnounceProperties)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)carPlayStatus;
- (unint64_t)hash;
- (void)deleteCarPlayStatus;
- (void)deleteIsAnnounceCallsEnabled;
- (void)deleteIsAnnounceNotificationsEnabled;
- (void)deleteIsCarPlayMuted;
- (void)deleteIsEnabledForHeadphones;
- (void)deleteIsProximityCardSeen;
- (void)deleteIsReplyWithoutConfirmationEnabled;
- (void)deleteIsSpokenNotificationsControlCenterModuleEnabled;
- (void)setCarPlayStatus:(int)a3;
- (void)setHasCarPlayStatus:(BOOL)a3;
- (void)setHasIsAnnounceCallsEnabled:(BOOL)a3;
- (void)setHasIsAnnounceNotificationsEnabled:(BOOL)a3;
- (void)setHasIsCarPlayMuted:(BOOL)a3;
- (void)setHasIsEnabledForHeadphones:(BOOL)a3;
- (void)setHasIsProximityCardSeen:(BOOL)a3;
- (void)setHasIsReplyWithoutConfirmationEnabled:(BOOL)a3;
- (void)setHasIsSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3;
- (void)setIsAnnounceCallsEnabled:(BOOL)a3;
- (void)setIsAnnounceNotificationsEnabled:(BOOL)a3;
- (void)setIsCarPlayMuted:(BOOL)a3;
- (void)setIsEnabledForHeadphones:(BOOL)a3;
- (void)setIsProximityCardSeen:(BOOL)a3;
- (void)setIsReplyWithoutConfirmationEnabled:(BOOL)a3;
- (void)setIsSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAnnounceProperties

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)carPlayStatus
{
  return self->_carPlayStatus;
}

- (BOOL)isCarPlayMuted
{
  return self->_isCarPlayMuted;
}

- (BOOL)isSpokenNotificationsControlCenterModuleEnabled
{
  return self->_isSpokenNotificationsControlCenterModuleEnabled;
}

- (BOOL)isEnabledForHeadphones
{
  return self->_isEnabledForHeadphones;
}

- (BOOL)isReplyWithoutConfirmationEnabled
{
  return self->_isReplyWithoutConfirmationEnabled;
}

- (BOOL)isProximityCardSeen
{
  return self->_isProximityCardSeen;
}

- (BOOL)isAnnounceNotificationsEnabled
{
  return self->_isAnnounceNotificationsEnabled;
}

- (BOOL)isAnnounceCallsEnabled
{
  return self->_isAnnounceCallsEnabled;
}

- (ODDSiriSchemaODDAnnounceProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ODDSiriSchemaODDAnnounceProperties;
  v5 = [(ODDSiriSchemaODDAnnounceProperties *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isAnnounceCallsEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAnnounceProperties setIsAnnounceCallsEnabled:](v5, "setIsAnnounceCallsEnabled:", [v6 BOOLValue]);
    }
    v16 = v6;
    v7 = [v4 objectForKeyedSubscript:@"isAnnounceNotificationsEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAnnounceProperties setIsAnnounceNotificationsEnabled:](v5, "setIsAnnounceNotificationsEnabled:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isProximityCardSeen"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAnnounceProperties setIsProximityCardSeen:](v5, "setIsProximityCardSeen:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isReplyWithoutConfirmationEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAnnounceProperties setIsReplyWithoutConfirmationEnabled:](v5, "setIsReplyWithoutConfirmationEnabled:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isEnabledForHeadphones"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAnnounceProperties setIsEnabledForHeadphones:](v5, "setIsEnabledForHeadphones:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isSpokenNotificationsControlCenterModuleEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAnnounceProperties setIsSpokenNotificationsControlCenterModuleEnabled:](v5, "setIsSpokenNotificationsControlCenterModuleEnabled:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"isCarPlayMuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAnnounceProperties setIsCarPlayMuted:](v5, "setIsCarPlayMuted:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"carPlayStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAnnounceProperties setCarPlayStatus:](v5, "setCarPlayStatus:", [v13 intValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAnnounceProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAnnounceProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAnnounceProperties *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has < 0)
  {
    unsigned int v5 = [(ODDSiriSchemaODDAnnounceProperties *)self carPlayStatus] - 1;
    if (v5 > 3) {
      v6 = @"ODDANNOUNCENOTIFICATIONSCARPLAYSTATUS_UNKNOWN";
    }
    else {
      v6 = off_1E5EBD608[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"carPlayStatus"];
    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isAnnounceCallsEnabled](self, "isAnnounceCallsEnabled"));
    [v3 setObject:v9 forKeyedSubscript:@"isAnnounceCallsEnabled"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_8:
      if ((has & 0x40) == 0) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_8;
  }
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isAnnounceNotificationsEnabled](self, "isAnnounceNotificationsEnabled"));
  [v3 setObject:v10 forKeyedSubscript:@"isAnnounceNotificationsEnabled"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isCarPlayMuted](self, "isCarPlayMuted"));
  [v3 setObject:v11 forKeyedSubscript:@"isCarPlayMuted"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isEnabledForHeadphones](self, "isEnabledForHeadphones"));
  [v3 setObject:v12 forKeyedSubscript:@"isEnabledForHeadphones"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isProximityCardSeen](self, "isProximityCardSeen"));
  [v3 setObject:v13 forKeyedSubscript:@"isProximityCardSeen"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_22:
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isReplyWithoutConfirmationEnabled](self, "isReplyWithoutConfirmationEnabled"));
  [v3 setObject:v14 forKeyedSubscript:@"isReplyWithoutConfirmationEnabled"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_13:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDAnnounceProperties isSpokenNotificationsControlCenterModuleEnabled](self, "isSpokenNotificationsControlCenterModuleEnabled"));
    [v3 setObject:v7 forKeyedSubscript:@"isSpokenNotificationsControlCenterModuleEnabled"];
  }
LABEL_14:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_isAnnounceCallsEnabled;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isAnnounceNotificationsEnabled;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_isProximityCardSeen;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_isReplyWithoutConfirmationEnabled;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_isEnabledForHeadphones;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_isSpokenNotificationsControlCenterModuleEnabled;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_isCarPlayMuted;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_carPlayStatus;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  $36A0953300C39560EC6541B1AA7BC3E6 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&has)
  {
    int isAnnounceCallsEnabled = self->_isAnnounceCallsEnabled;
    if (isAnnounceCallsEnabled != [v4 isAnnounceCallsEnabled]) {
      goto LABEL_34;
    }
    $36A0953300C39560EC6541B1AA7BC3E6 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_34;
  }
  if (v8)
  {
    int isAnnounceNotificationsEnabled = self->_isAnnounceNotificationsEnabled;
    if (isAnnounceNotificationsEnabled != [v4 isAnnounceNotificationsEnabled]) {
      goto LABEL_34;
    }
    $36A0953300C39560EC6541B1AA7BC3E6 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_34;
  }
  if (v10)
  {
    int isProximityCardSeen = self->_isProximityCardSeen;
    if (isProximityCardSeen != [v4 isProximityCardSeen]) {
      goto LABEL_34;
    }
    $36A0953300C39560EC6541B1AA7BC3E6 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_34;
  }
  if (v12)
  {
    int isReplyWithoutConfirmationEnabled = self->_isReplyWithoutConfirmationEnabled;
    if (isReplyWithoutConfirmationEnabled != [v4 isReplyWithoutConfirmationEnabled]) {
      goto LABEL_34;
    }
    $36A0953300C39560EC6541B1AA7BC3E6 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_34;
  }
  if (v14)
  {
    int isEnabledForHeadphones = self->_isEnabledForHeadphones;
    if (isEnabledForHeadphones != [v4 isEnabledForHeadphones]) {
      goto LABEL_34;
    }
    $36A0953300C39560EC6541B1AA7BC3E6 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_34;
  }
  if (v16)
  {
    int isSpokenNotificationsControlCenterModuleEnabled = self->_isSpokenNotificationsControlCenterModuleEnabled;
    if (isSpokenNotificationsControlCenterModuleEnabled != [v4 isSpokenNotificationsControlCenterModuleEnabled])goto LABEL_34; {
    $36A0953300C39560EC6541B1AA7BC3E6 has = self->_has;
    }
    unsigned int v6 = v4[20];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_34;
  }
  if (v18)
  {
    int isCarPlayMuted = self->_isCarPlayMuted;
    if (isCarPlayMuted == [v4 isCarPlayMuted])
    {
      $36A0953300C39560EC6541B1AA7BC3E6 has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_30;
    }
LABEL_34:
    BOOL v21 = 0;
    goto LABEL_35;
  }
LABEL_30:
  if (((v6 ^ *(_DWORD *)&has) & 0x80) != 0) {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    int carPlayStatus = self->_carPlayStatus;
    if (carPlayStatus != [v4 carPlayStatus]) {
      goto LABEL_34;
    }
  }
  BOOL v21 = 1;
LABEL_35:

  return v21;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAnnouncePropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteCarPlayStatus
{
  *(unsigned char *)&self->_has &= ~0x80u;
}

- (void)setHasCarPlayStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasCarPlayStatus
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCarPlayStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_int carPlayStatus = a3;
}

- (void)deleteIsCarPlayMuted
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasIsCarPlayMuted:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsCarPlayMuted
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIsCarPlayMuted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int isCarPlayMuted = a3;
}

- (void)deleteIsSpokenNotificationsControlCenterModuleEnabled
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasIsSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsSpokenNotificationsControlCenterModuleEnabled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsSpokenNotificationsControlCenterModuleEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int isSpokenNotificationsControlCenterModuleEnabled = a3;
}

- (void)deleteIsEnabledForHeadphones
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasIsEnabledForHeadphones:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsEnabledForHeadphones
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsEnabledForHeadphones:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int isEnabledForHeadphones = a3;
}

- (void)deleteIsReplyWithoutConfirmationEnabled
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsReplyWithoutConfirmationEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsReplyWithoutConfirmationEnabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsReplyWithoutConfirmationEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isReplyWithoutConfirmationEnabled = a3;
}

- (void)deleteIsProximityCardSeen
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsProximityCardSeen:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsProximityCardSeen
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsProximityCardSeen:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isProximityCardSeen = a3;
}

- (void)deleteIsAnnounceNotificationsEnabled
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsAnnounceNotificationsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsAnnounceNotificationsEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsAnnounceNotificationsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isAnnounceNotificationsEnabled = a3;
}

- (void)deleteIsAnnounceCallsEnabled
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsAnnounceCallsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAnnounceCallsEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsAnnounceCallsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isAnnounceCallsEnabled = a3;
}

@end