@interface SISchemaAnnounceEnabledStatus
- (BOOL)announceCallsEnabled;
- (BOOL)announceMessagesEnabled;
- (BOOL)hasAnnounceCallsEnabled;
- (BOOL)hasAnnounceMessagesEnabled;
- (BOOL)hasAnnounceNotifications;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaAnnounceEnabledStatus)initWithDictionary:(id)a3;
- (SISchemaAnnounceEnabledStatus)initWithJSON:(id)a3;
- (SISchemaAnnounceNotifications)announceNotifications;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAnnounceCallsEnabled;
- (void)deleteAnnounceMessagesEnabled;
- (void)deleteAnnounceNotifications;
- (void)setAnnounceCallsEnabled:(BOOL)a3;
- (void)setAnnounceMessagesEnabled:(BOOL)a3;
- (void)setAnnounceNotifications:(id)a3;
- (void)setHasAnnounceCallsEnabled:(BOOL)a3;
- (void)setHasAnnounceMessagesEnabled:(BOOL)a3;
- (void)setHasAnnounceNotifications:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaAnnounceEnabledStatus

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaAnnounceEnabledStatus;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaAnnounceEnabledStatus *)self announceNotifications];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaAnnounceEnabledStatus *)self deleteAnnounceNotifications];
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
}

- (void)setHasAnnounceNotifications:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setAnnounceNotifications:(id)a3
{
}

- (SISchemaAnnounceNotifications)announceNotifications
{
  return self->_announceNotifications;
}

- (BOOL)announceCallsEnabled
{
  return self->_announceCallsEnabled;
}

- (BOOL)announceMessagesEnabled
{
  return self->_announceMessagesEnabled;
}

- (SISchemaAnnounceEnabledStatus)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaAnnounceEnabledStatus;
  v5 = [(SISchemaAnnounceEnabledStatus *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"announceMessagesEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAnnounceEnabledStatus setAnnounceMessagesEnabled:](v5, "setAnnounceMessagesEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"announceCallsEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAnnounceEnabledStatus setAnnounceCallsEnabled:](v5, "setAnnounceCallsEnabled:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"announceNotifications"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaAnnounceNotifications alloc] initWithDictionary:v8];
      [(SISchemaAnnounceEnabledStatus *)v5 setAnnounceNotifications:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaAnnounceEnabledStatus)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaAnnounceEnabledStatus *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaAnnounceEnabledStatus *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaAnnounceEnabledStatus announceCallsEnabled](self, "announceCallsEnabled"));
    [v3 setObject:v5 forKeyedSubscript:@"announceCallsEnabled"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaAnnounceEnabledStatus announceMessagesEnabled](self, "announceMessagesEnabled"));
    [v3 setObject:v6 forKeyedSubscript:@"announceMessagesEnabled"];
  }
  if (self->_announceNotifications)
  {
    uint64_t v7 = [(SISchemaAnnounceEnabledStatus *)self announceNotifications];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"announceNotifications"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"announceNotifications"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_announceMessagesEnabled;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(SISchemaAnnounceNotifications *)self->_announceNotifications hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_announceCallsEnabled;
  return v3 ^ v2 ^ [(SISchemaAnnounceNotifications *)self->_announceNotifications hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $0E26709199269C303023536CD5EB10D4 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int announceMessagesEnabled = self->_announceMessagesEnabled;
    if (announceMessagesEnabled != [v4 announceMessagesEnabled]) {
      goto LABEL_14;
    }
    $0E26709199269C303023536CD5EB10D4 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (int announceCallsEnabled = self->_announceCallsEnabled,
          announceCallsEnabled == [v4 announceCallsEnabled]))
    {
      v10 = [(SISchemaAnnounceEnabledStatus *)self announceNotifications];
      v11 = [v4 announceNotifications];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(SISchemaAnnounceEnabledStatus *)self announceNotifications];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(SISchemaAnnounceEnabledStatus *)self announceNotifications];
        v16 = [v4 announceNotifications];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  v5 = [(SISchemaAnnounceEnabledStatus *)self announceNotifications];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(SISchemaAnnounceEnabledStatus *)self announceNotifications];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaAnnounceEnabledStatusReadFrom(self, (uint64_t)a3);
}

- (void)deleteAnnounceNotifications
{
}

- (BOOL)hasAnnounceNotifications
{
  return self->_announceNotifications != 0;
}

- (void)deleteAnnounceCallsEnabled
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAnnounceCallsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAnnounceCallsEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAnnounceCallsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int announceCallsEnabled = a3;
}

- (void)deleteAnnounceMessagesEnabled
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAnnounceMessagesEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnnounceMessagesEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAnnounceMessagesEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int announceMessagesEnabled = a3;
}

@end