@interface HOMESchemaHOMEAssistantDeviceBirthday
- (BOOL)hasMonth;
- (BOOL)hasYear;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HOMESchemaHOMEAssistantDeviceBirthday)initWithDictionary:(id)a3;
- (HOMESchemaHOMEAssistantDeviceBirthday)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)month;
- (unsigned)year;
- (void)deleteMonth;
- (void)deleteYear;
- (void)setHasMonth:(BOOL)a3;
- (void)setHasYear:(BOOL)a3;
- (void)setMonth:(unsigned int)a3;
- (void)setYear:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HOMESchemaHOMEAssistantDeviceBirthday

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)month
{
  return self->_month;
}

- (unsigned)year
{
  return self->_year;
}

- (HOMESchemaHOMEAssistantDeviceBirthday)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HOMESchemaHOMEAssistantDeviceBirthday;
  v5 = [(HOMESchemaHOMEAssistantDeviceBirthday *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"year"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HOMESchemaHOMEAssistantDeviceBirthday setYear:](v5, "setYear:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"month"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HOMESchemaHOMEAssistantDeviceBirthday setMonth:](v5, "setMonth:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (HOMESchemaHOMEAssistantDeviceBirthday)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(HOMESchemaHOMEAssistantDeviceBirthday *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HOMESchemaHOMEAssistantDeviceBirthday *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HOMESchemaHOMEAssistantDeviceBirthday month](self, "month"));
    [v3 setObject:v5 forKeyedSubscript:@"month"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HOMESchemaHOMEAssistantDeviceBirthday year](self, "year"));
    [v3 setObject:v6 forKeyedSubscript:@"year"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_year;
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
  uint64_t v3 = 2654435761 * self->_month;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $2518EB986472F218E90F43EA8F0C5F7B has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int year = self->_year;
    if (year != [v4 year])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $2518EB986472F218E90F43EA8F0C5F7B has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int month = self->_month;
    if (month != [v4 month]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HOMESchemaHOMEAssistantDeviceBirthdayReadFrom(self, (uint64_t)a3);
}

- (void)deleteMonth
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMonth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMonth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMonth:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int month = a3;
}

- (void)deleteYear
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasYear:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasYear
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setYear:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int year = a3;
}

@end