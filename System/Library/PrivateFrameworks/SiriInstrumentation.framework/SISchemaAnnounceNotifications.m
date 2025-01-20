@interface SISchemaAnnounceNotifications
- (BOOL)hasCarPlayStatus;
- (BOOL)hasIsCarPlayMuted;
- (BOOL)hasIsEnabled;
- (BOOL)hasIsEnabledForHeadphones;
- (BOOL)hasProxCardSeen;
- (BOOL)hasReplyWithoutConfirmation;
- (BOOL)isCarPlayMuted;
- (BOOL)isEnabled;
- (BOOL)isEnabledForHeadphones;
- (BOOL)isEqual:(id)a3;
- (BOOL)proxCardSeen;
- (BOOL)readFrom:(id)a3;
- (BOOL)replyWithoutConfirmation;
- (NSData)jsonData;
- (SISchemaAnnounceNotifications)initWithDictionary:(id)a3;
- (SISchemaAnnounceNotifications)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)carPlayStatus;
- (unint64_t)hash;
- (void)deleteCarPlayStatus;
- (void)deleteIsCarPlayMuted;
- (void)deleteIsEnabled;
- (void)deleteIsEnabledForHeadphones;
- (void)deleteProxCardSeen;
- (void)deleteReplyWithoutConfirmation;
- (void)setCarPlayStatus:(int)a3;
- (void)setHasCarPlayStatus:(BOOL)a3;
- (void)setHasIsCarPlayMuted:(BOOL)a3;
- (void)setHasIsEnabled:(BOOL)a3;
- (void)setHasIsEnabledForHeadphones:(BOOL)a3;
- (void)setHasProxCardSeen:(BOOL)a3;
- (void)setHasReplyWithoutConfirmation:(BOOL)a3;
- (void)setIsCarPlayMuted:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsEnabledForHeadphones:(BOOL)a3;
- (void)setProxCardSeen:(BOOL)a3;
- (void)setReplyWithoutConfirmation:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaAnnounceNotifications

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isCarPlayMuted
{
  return self->_isCarPlayMuted;
}

- (BOOL)isEnabledForHeadphones
{
  return self->_isEnabledForHeadphones;
}

- (int)carPlayStatus
{
  return self->_carPlayStatus;
}

- (BOOL)replyWithoutConfirmation
{
  return self->_replyWithoutConfirmation;
}

- (BOOL)proxCardSeen
{
  return self->_proxCardSeen;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (SISchemaAnnounceNotifications)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISchemaAnnounceNotifications;
  v5 = [(SISchemaAnnounceNotifications *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAnnounceNotifications setIsEnabled:](v5, "setIsEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"proxCardSeen"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAnnounceNotifications setProxCardSeen:](v5, "setProxCardSeen:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"replyWithoutConfirmation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAnnounceNotifications setReplyWithoutConfirmation:](v5, "setReplyWithoutConfirmation:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"carPlayStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAnnounceNotifications setCarPlayStatus:](v5, "setCarPlayStatus:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isEnabledForHeadphones"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAnnounceNotifications setIsEnabledForHeadphones:](v5, "setIsEnabledForHeadphones:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isCarPlayMuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAnnounceNotifications setIsCarPlayMuted:](v5, "setIsCarPlayMuted:", [v11 BOOLValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (SISchemaAnnounceNotifications)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaAnnounceNotifications *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaAnnounceNotifications *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 8) != 0)
  {
    unsigned int v5 = [(SISchemaAnnounceNotifications *)self carPlayStatus] - 1;
    if (v5 > 3) {
      v6 = @"ANNOUNCENOTIFICATIONSCARPLAYSTATUS_UNKNOWN";
    }
    else {
      v6 = off_1E5EB5160[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"carPlayStatus"];
    char v4 = *(&self->_isCarPlayMuted + 1);
  }
  if ((v4 & 0x20) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaAnnounceNotifications isCarPlayMuted](self, "isCarPlayMuted"));
    [v3 setObject:v9 forKeyedSubscript:@"isCarPlayMuted"];

    char v4 = *(&self->_isCarPlayMuted + 1);
    if ((v4 & 1) == 0)
    {
LABEL_8:
      if ((v4 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_8;
  }
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaAnnounceNotifications isEnabled](self, "isEnabled"));
  [v3 setObject:v10 forKeyedSubscript:@"isEnabled"];

  char v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_9:
    if ((v4 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaAnnounceNotifications isEnabledForHeadphones](self, "isEnabledForHeadphones"));
  [v3 setObject:v11 forKeyedSubscript:@"isEnabledForHeadphones"];

  char v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 2) == 0)
  {
LABEL_10:
    if ((v4 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_18:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaAnnounceNotifications proxCardSeen](self, "proxCardSeen"));
  [v3 setObject:v12 forKeyedSubscript:@"proxCardSeen"];

  if ((*(&self->_isCarPlayMuted + 1) & 4) != 0)
  {
LABEL_11:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaAnnounceNotifications replyWithoutConfirmation](self, "replyWithoutConfirmation"));
    [v3 setObject:v7 forKeyedSubscript:@"replyWithoutConfirmation"];
  }
LABEL_12:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isCarPlayMuted + 1))
  {
    uint64_t v2 = 2654435761 * self->_isEnabled;
    if ((*(&self->_isCarPlayMuted + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_proxCardSeen;
      if ((*(&self->_isCarPlayMuted + 1) & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(&self->_isCarPlayMuted + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(&self->_isCarPlayMuted + 1) & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_replyWithoutConfirmation;
    if ((*(&self->_isCarPlayMuted + 1) & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(&self->_isCarPlayMuted + 1) & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_carPlayStatus;
    if ((*(&self->_isCarPlayMuted + 1) & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(&self->_isCarPlayMuted + 1) & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(&self->_isCarPlayMuted + 1) & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_isEnabledForHeadphones;
  if ((*(&self->_isCarPlayMuted + 1) & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_isCarPlayMuted;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
  unsigned int v6 = v4[18];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (v5)
  {
    int isEnabled = self->_isEnabled;
    if (isEnabled != [v4 isEnabled]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
    unsigned int v6 = v4[18];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_26;
  }
  if (v8)
  {
    int proxCardSeen = self->_proxCardSeen;
    if (proxCardSeen != [v4 proxCardSeen]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
    unsigned int v6 = v4[18];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_26;
  }
  if (v10)
  {
    int replyWithoutConfirmation = self->_replyWithoutConfirmation;
    if (replyWithoutConfirmation != [v4 replyWithoutConfirmation]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
    unsigned int v6 = v4[18];
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_26;
  }
  if (v12)
  {
    int carPlayStatus = self->_carPlayStatus;
    if (carPlayStatus != [v4 carPlayStatus]) {
      goto LABEL_26;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
    unsigned int v6 = v4[18];
  }
  int v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_26;
  }
  if (v14)
  {
    int isEnabledForHeadphones = self->_isEnabledForHeadphones;
    if (isEnabledForHeadphones == [v4 isEnabledForHeadphones])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isCarPlayMuted + 1);
      unsigned int v6 = v4[18];
      goto LABEL_22;
    }
LABEL_26:
    BOOL v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  int v16 = (v5 >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_26;
  }
  if (v16)
  {
    int isCarPlayMuted = self->_isCarPlayMuted;
    if (isCarPlayMuted != [v4 isCarPlayMuted]) {
      goto LABEL_26;
    }
  }
  BOOL v18 = 1;
LABEL_27:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char v4 = *(&self->_isCarPlayMuted + 1);
  if (v4)
  {
    PBDataWriterWriteBOOLField();
    char v4 = *(&self->_isCarPlayMuted + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(&self->_isCarPlayMuted + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char v4 = *(&self->_isCarPlayMuted + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if ((*(&self->_isCarPlayMuted + 1) & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaAnnounceNotificationsReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsCarPlayMuted
{
  *(&self->_isCarPlayMuted + 1) &= ~0x20u;
}

- (void)setHasIsCarPlayMuted:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xDF | v3;
}

- (BOOL)hasIsCarPlayMuted
{
  return (*((unsigned __int8 *)&self->_isCarPlayMuted + 1) >> 5) & 1;
}

- (void)setIsCarPlayMuted:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) |= 0x20u;
  self->_int isCarPlayMuted = a3;
}

- (void)deleteIsEnabledForHeadphones
{
  *(&self->_isCarPlayMuted + 1) &= ~0x10u;
}

- (void)setHasIsEnabledForHeadphones:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xEF | v3;
}

- (BOOL)hasIsEnabledForHeadphones
{
  return (*((unsigned __int8 *)&self->_isCarPlayMuted + 1) >> 4) & 1;
}

- (void)setIsEnabledForHeadphones:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) |= 0x10u;
  self->_int isEnabledForHeadphones = a3;
}

- (void)deleteCarPlayStatus
{
  *(&self->_isCarPlayMuted + 1) &= ~8u;
}

- (void)setHasCarPlayStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xF7 | v3;
}

- (BOOL)hasCarPlayStatus
{
  return (*((unsigned __int8 *)&self->_isCarPlayMuted + 1) >> 3) & 1;
}

- (void)setCarPlayStatus:(int)a3
{
  *(&self->_isCarPlayMuted + 1) |= 8u;
  self->_int carPlayStatus = a3;
}

- (void)deleteReplyWithoutConfirmation
{
  *(&self->_isCarPlayMuted + 1) &= ~4u;
}

- (void)setHasReplyWithoutConfirmation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xFB | v3;
}

- (BOOL)hasReplyWithoutConfirmation
{
  return (*((unsigned __int8 *)&self->_isCarPlayMuted + 1) >> 2) & 1;
}

- (void)setReplyWithoutConfirmation:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) |= 4u;
  self->_int replyWithoutConfirmation = a3;
}

- (void)deleteProxCardSeen
{
  *(&self->_isCarPlayMuted + 1) &= ~2u;
}

- (void)setHasProxCardSeen:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xFD | v3;
}

- (BOOL)hasProxCardSeen
{
  return (*((unsigned __int8 *)&self->_isCarPlayMuted + 1) >> 1) & 1;
}

- (void)setProxCardSeen:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) |= 2u;
  self->_int proxCardSeen = a3;
}

- (void)deleteIsEnabled
{
  *(&self->_isCarPlayMuted + 1) &= ~1u;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) = *(&self->_isCarPlayMuted + 1) & 0xFE | a3;
}

- (BOOL)hasIsEnabled
{
  return *(&self->_isCarPlayMuted + 1);
}

- (void)setIsEnabled:(BOOL)a3
{
  *(&self->_isCarPlayMuted + 1) |= 1u;
  self->_int isEnabled = a3;
}

@end