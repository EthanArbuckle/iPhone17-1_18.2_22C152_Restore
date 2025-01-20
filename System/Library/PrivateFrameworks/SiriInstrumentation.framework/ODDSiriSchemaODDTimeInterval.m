@interface ODDSiriSchemaODDTimeInterval
- (BOOL)hasNumberOfSeconds;
- (BOOL)hasStartTimestampInSecondsSince1970;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDTimeInterval)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDTimeInterval)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)startTimestampInSecondsSince1970;
- (unsigned)numberOfSeconds;
- (void)deleteNumberOfSeconds;
- (void)deleteStartTimestampInSecondsSince1970;
- (void)setHasNumberOfSeconds:(BOOL)a3;
- (void)setHasStartTimestampInSecondsSince1970:(BOOL)a3;
- (void)setNumberOfSeconds:(unsigned int)a3;
- (void)setStartTimestampInSecondsSince1970:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDTimeInterval

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)numberOfSeconds
{
  return self->_numberOfSeconds;
}

- (unint64_t)startTimestampInSecondsSince1970
{
  return self->_startTimestampInSecondsSince1970;
}

- (ODDSiriSchemaODDTimeInterval)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ODDSiriSchemaODDTimeInterval;
  v5 = [(ODDSiriSchemaODDTimeInterval *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startTimestampInSecondsSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDTimeInterval setStartTimestampInSecondsSince1970:](v5, "setStartTimestampInSecondsSince1970:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numberOfSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDTimeInterval setNumberOfSeconds:](v5, "setNumberOfSeconds:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDTimeInterval)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDTimeInterval *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDTimeInterval *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDTimeInterval numberOfSeconds](self, "numberOfSeconds"));
    [v3 setObject:v5 forKeyedSubscript:@"numberOfSeconds"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ODDSiriSchemaODDTimeInterval startTimestampInSecondsSince1970](self, "startTimestampInSecondsSince1970"));
    [v3 setObject:v6 forKeyedSubscript:@"startTimestampInSecondsSince1970"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_startTimestampInSecondsSince1970;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_numberOfSeconds;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $7B6F2B709614655EDE4CAE247D9987DB has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t startTimestampInSecondsSince1970 = self->_startTimestampInSecondsSince1970;
    if (startTimestampInSecondsSince1970 != [v4 startTimestampInSecondsSince1970])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $7B6F2B709614655EDE4CAE247D9987DB has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int numberOfSeconds = self->_numberOfSeconds;
    if (numberOfSeconds != [v4 numberOfSeconds]) {
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
    PBDataWriterWriteUint64Field();
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
  return ODDSiriSchemaODDTimeIntervalReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumberOfSeconds
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumberOfSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumberOfSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numberOfSeconds = a3;
}

- (void)deleteStartTimestampInSecondsSince1970
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStartTimestampInSecondsSince1970:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimestampInSecondsSince1970
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStartTimestampInSecondsSince1970:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t startTimestampInSecondsSince1970 = a3;
}

@end