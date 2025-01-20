@interface SetupSchemaProvisionalSiriSetupEnded
- (BOOL)dismissed;
- (BOOL)hasDismissed;
- (BOOL)hasSiriEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)siriEnabled;
- (NSData)jsonData;
- (SetupSchemaProvisionalSiriSetupEnded)initWithDictionary:(id)a3;
- (SetupSchemaProvisionalSiriSetupEnded)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)deleteDismissed;
- (void)deleteSiriEnabled;
- (void)setDismissed:(BOOL)a3;
- (void)setHasDismissed:(BOOL)a3;
- (void)setHasSiriEnabled:(BOOL)a3;
- (void)setSiriEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SetupSchemaProvisionalSiriSetupEnded

- (void)setSiriEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_siriEnabled = a3;
}

- (BOOL)hasSiriEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSiriEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)deleteSiriEnabled
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setDismissed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dismissed = a3;
}

- (BOOL)hasDismissed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDismissed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)deleteDismissed
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (BOOL)readFrom:(id)a3
{
  return SetupSchemaProvisionalSiriSetupEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $799191CF2D2912DAED893BA627C48EF2 has = self->_has;
  int v6 = v4[12];
  if ((v6 & 1) != (*(unsigned char *)&has & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int siriEnabled = self->_siriEnabled;
    if (siriEnabled != [v4 siriEnabled])
    {
LABEL_10:
      BOOL v9 = 0;
      goto LABEL_11;
    }
    $799191CF2D2912DAED893BA627C48EF2 has = self->_has;
    int v6 = v4[12];
  }
  if (((v6 ^ *(_DWORD *)&has) & 2) != 0) {
    goto LABEL_10;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    int dismissed = self->_dismissed;
    if (dismissed != [v4 dismissed]) {
      goto LABEL_10;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_siriEnabled;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_dismissed;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SetupSchemaProvisionalSiriSetupEnded dismissed](self, "dismissed"));
    [v3 setObject:v5 forKeyedSubscript:@"dismissed"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SetupSchemaProvisionalSiriSetupEnded siriEnabled](self, "siriEnabled"));
    [v3 setObject:v6 forKeyedSubscript:@"siriEnabled"];
  }
  [(SetupSchemaProvisionalSiriSetupEnded *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (NSData)jsonData
{
  uint64_t v2 = [(SetupSchemaProvisionalSiriSetupEnded *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    uint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (SetupSchemaProvisionalSiriSetupEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SetupSchemaProvisionalSiriSetupEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (SetupSchemaProvisionalSiriSetupEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SetupSchemaProvisionalSiriSetupEnded;
  v5 = [(SetupSchemaProvisionalSiriSetupEnded *)&v10 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"siriEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SetupSchemaProvisionalSiriSetupEnded setSiriEnabled:](v5, "setSiriEnabled:", [v6 BOOLValue]);
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"dismissed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SetupSchemaProvisionalSiriSetupEnded setDismissed:](v5, "setDismissed:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (BOOL)siriEnabled
{
  return self->_siriEnabled;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

@end