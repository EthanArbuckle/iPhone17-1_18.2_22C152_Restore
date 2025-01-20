@interface SISchemaHomeKitAccessoryResponse
- (BOOL)hasHomeKitAccessoryType;
- (BOOL)hasNumAccessoriesCompleted;
- (BOOL)hasNumAccessoriesNotCompleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaHomeKitAccessoryResponse)initWithDictionary:(id)a3;
- (SISchemaHomeKitAccessoryResponse)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)homeKitAccessoryType;
- (int)numAccessoriesCompleted;
- (int)numAccessoriesNotCompleted;
- (unint64_t)hash;
- (void)deleteHomeKitAccessoryType;
- (void)deleteNumAccessoriesCompleted;
- (void)deleteNumAccessoriesNotCompleted;
- (void)setHasHomeKitAccessoryType:(BOOL)a3;
- (void)setHasNumAccessoriesCompleted:(BOOL)a3;
- (void)setHasNumAccessoriesNotCompleted:(BOOL)a3;
- (void)setHomeKitAccessoryType:(int)a3;
- (void)setNumAccessoriesCompleted:(int)a3;
- (void)setNumAccessoriesNotCompleted:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaHomeKitAccessoryResponse

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)numAccessoriesNotCompleted
{
  return self->_numAccessoriesNotCompleted;
}

- (int)numAccessoriesCompleted
{
  return self->_numAccessoriesCompleted;
}

- (int)homeKitAccessoryType
{
  return self->_homeKitAccessoryType;
}

- (SISchemaHomeKitAccessoryResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaHomeKitAccessoryResponse;
  v5 = [(SISchemaHomeKitAccessoryResponse *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"homeKitAccessoryType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaHomeKitAccessoryResponse setHomeKitAccessoryType:](v5, "setHomeKitAccessoryType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numAccessoriesCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaHomeKitAccessoryResponse setNumAccessoriesCompleted:](v5, "setNumAccessoriesCompleted:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"numAccessoriesNotCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaHomeKitAccessoryResponse setNumAccessoriesNotCompleted:](v5, "setNumAccessoriesNotCompleted:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (SISchemaHomeKitAccessoryResponse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaHomeKitAccessoryResponse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaHomeKitAccessoryResponse *)self dictionaryRepresentation];
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
  if (has)
  {
    unsigned int v5 = [(SISchemaHomeKitAccessoryResponse *)self homeKitAccessoryType] - 1;
    if (v5 > 0x26) {
      v6 = @"HOMEKITACCESSORYTYPE_UNKNOWN_HOMEKIT_ACCESSORY_TYPE";
    }
    else {
      v6 = off_1E5EB6D18[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"homeKitAccessoryType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaHomeKitAccessoryResponse numAccessoriesCompleted](self, "numAccessoriesCompleted"));
    [v3 setObject:v7 forKeyedSubscript:@"numAccessoriesCompleted"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaHomeKitAccessoryResponse numAccessoriesNotCompleted](self, "numAccessoriesNotCompleted"));
    [v3 setObject:v8 forKeyedSubscript:@"numAccessoriesNotCompleted"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_homeKitAccessoryType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_numAccessoriesCompleted;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_numAccessoriesNotCompleted;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $6012249D6A301411187F53AB58DFD71A has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int homeKitAccessoryType = self->_homeKitAccessoryType;
    if (homeKitAccessoryType != [v4 homeKitAccessoryType]) {
      goto LABEL_14;
    }
    $6012249D6A301411187F53AB58DFD71A has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int numAccessoriesCompleted = self->_numAccessoriesCompleted;
    if (numAccessoriesCompleted == [v4 numAccessoriesCompleted])
    {
      $6012249D6A301411187F53AB58DFD71A has = self->_has;
      unsigned int v6 = v4[20];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    int numAccessoriesNotCompleted = self->_numAccessoriesNotCompleted;
    if (numAccessoriesNotCompleted != [v4 numAccessoriesNotCompleted]) {
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
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaHomeKitAccessoryResponseReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumAccessoriesNotCompleted
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumAccessoriesNotCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumAccessoriesNotCompleted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumAccessoriesNotCompleted:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int numAccessoriesNotCompleted = a3;
}

- (void)deleteNumAccessoriesCompleted
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumAccessoriesCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumAccessoriesCompleted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumAccessoriesCompleted:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int numAccessoriesCompleted = a3;
}

- (void)deleteHomeKitAccessoryType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHomeKitAccessoryType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHomeKitAccessoryType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHomeKitAccessoryType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int homeKitAccessoryType = a3;
}

@end