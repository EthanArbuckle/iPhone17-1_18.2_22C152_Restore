@interface ANCSchemaANCAppNotificationMetadata
- (ANCSchemaANCAppNotificationMetadata)initWithDictionary:(id)a3;
- (ANCSchemaANCAppNotificationMetadata)initWithJSON:(id)a3;
- (BOOL)hasCommsNotificationType;
- (BOOL)hasIsAskWithSiriEnabled;
- (BOOL)hasIsSmsEligible;
- (BOOL)isAskWithSiriEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSmsEligible;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)commsNotificationType;
- (unint64_t)hash;
- (void)deleteCommsNotificationType;
- (void)deleteIsAskWithSiriEnabled;
- (void)deleteIsSmsEligible;
- (void)setCommsNotificationType:(int)a3;
- (void)setHasCommsNotificationType:(BOOL)a3;
- (void)setHasIsAskWithSiriEnabled:(BOOL)a3;
- (void)setHasIsSmsEligible:(BOOL)a3;
- (void)setIsAskWithSiriEnabled:(BOOL)a3;
- (void)setIsSmsEligible:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ANCSchemaANCAppNotificationMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isAskWithSiriEnabled
{
  return self->_isAskWithSiriEnabled;
}

- (BOOL)isSmsEligible
{
  return self->_isSmsEligible;
}

- (int)commsNotificationType
{
  return self->_commsNotificationType;
}

- (ANCSchemaANCAppNotificationMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ANCSchemaANCAppNotificationMetadata;
  v5 = [(ANCSchemaANCAppNotificationMetadata *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"commsNotificationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCAppNotificationMetadata setCommsNotificationType:](v5, "setCommsNotificationType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isSmsEligible"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCAppNotificationMetadata setIsSmsEligible:](v5, "setIsSmsEligible:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isAskWithSiriEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ANCSchemaANCAppNotificationMetadata setIsAskWithSiriEnabled:](v5, "setIsAskWithSiriEnabled:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (ANCSchemaANCAppNotificationMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ANCSchemaANCAppNotificationMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ANCSchemaANCAppNotificationMetadata *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isAskWithSiriEnabled + 1);
  if (v4)
  {
    unsigned int v5 = [(ANCSchemaANCAppNotificationMetadata *)self commsNotificationType] - 1;
    if (v5 > 2) {
      v6 = @"ANCCOMMUNICATIONAPINOTIFICATIONTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EB9D40[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"commsNotificationType"];
    char v4 = *(&self->_isAskWithSiriEnabled + 1);
  }
  if ((v4 & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ANCSchemaANCAppNotificationMetadata isAskWithSiriEnabled](self, "isAskWithSiriEnabled"));
    [v3 setObject:v7 forKeyedSubscript:@"isAskWithSiriEnabled"];

    char v4 = *(&self->_isAskWithSiriEnabled + 1);
  }
  if ((v4 & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ANCSchemaANCAppNotificationMetadata isSmsEligible](self, "isSmsEligible"));
    [v3 setObject:v8 forKeyedSubscript:@"isSmsEligible"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (!*(&self->_isAskWithSiriEnabled + 1))
  {
    uint64_t v2 = 0;
    if ((*(&self->_isAskWithSiriEnabled + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(&self->_isAskWithSiriEnabled + 1) & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_commsNotificationType;
  if ((*(&self->_isAskWithSiriEnabled + 1) & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isSmsEligible;
  if ((*(&self->_isAskWithSiriEnabled + 1) & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isAskWithSiriEnabled;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isAskWithSiriEnabled + 1);
  unsigned int v6 = v4[14];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (v5)
  {
    int commsNotificationType = self->_commsNotificationType;
    if (commsNotificationType != [v4 commsNotificationType]) {
      goto LABEL_14;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isAskWithSiriEnabled + 1);
    unsigned int v6 = v4[14];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int isSmsEligible = self->_isSmsEligible;
    if (isSmsEligible == [v4 isSmsEligible])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isAskWithSiriEnabled + 1);
      unsigned int v6 = v4[14];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int isAskWithSiriEnabled = self->_isAskWithSiriEnabled;
    if (isAskWithSiriEnabled != [v4 isAskWithSiriEnabled]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = *(&self->_isAskWithSiriEnabled + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char v5 = *(&self->_isAskWithSiriEnabled + 1);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(&self->_isAskWithSiriEnabled + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(&self->_isAskWithSiriEnabled + 1) & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return ANCSchemaANCAppNotificationMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsAskWithSiriEnabled
{
  *(&self->_isAskWithSiriEnabled + 1) &= ~4u;
}

- (void)setHasIsAskWithSiriEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isAskWithSiriEnabled + 1) = *(&self->_isAskWithSiriEnabled + 1) & 0xFB | v3;
}

- (BOOL)hasIsAskWithSiriEnabled
{
  return (*((unsigned __int8 *)&self->_isAskWithSiriEnabled + 1) >> 2) & 1;
}

- (void)setIsAskWithSiriEnabled:(BOOL)a3
{
  *(&self->_isAskWithSiriEnabled + 1) |= 4u;
  self->_int isAskWithSiriEnabled = a3;
}

- (void)deleteIsSmsEligible
{
  *(&self->_isAskWithSiriEnabled + 1) &= ~2u;
}

- (void)setHasIsSmsEligible:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isAskWithSiriEnabled + 1) = *(&self->_isAskWithSiriEnabled + 1) & 0xFD | v3;
}

- (BOOL)hasIsSmsEligible
{
  return (*((unsigned __int8 *)&self->_isAskWithSiriEnabled + 1) >> 1) & 1;
}

- (void)setIsSmsEligible:(BOOL)a3
{
  *(&self->_isAskWithSiriEnabled + 1) |= 2u;
  self->_int isSmsEligible = a3;
}

- (void)deleteCommsNotificationType
{
  *(&self->_isAskWithSiriEnabled + 1) &= ~1u;
}

- (void)setHasCommsNotificationType:(BOOL)a3
{
  *(&self->_isAskWithSiriEnabled + 1) = *(&self->_isAskWithSiriEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasCommsNotificationType
{
  return *(&self->_isAskWithSiriEnabled + 1);
}

- (void)setCommsNotificationType:(int)a3
{
  *(&self->_isAskWithSiriEnabled + 1) |= 1u;
  self->_int commsNotificationType = a3;
}

@end