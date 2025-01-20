@interface LRSchemaLRTimespanRedactionSignal
- (BOOL)hasEndTimeInNs;
- (BOOL)hasStartTimeInNs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LRSchemaLRTimespanRedactionSignal)initWithDictionary:(id)a3;
- (LRSchemaLRTimespanRedactionSignal)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)endTimeInNs;
- (unint64_t)hash;
- (unint64_t)startTimeInNs;
- (void)deleteEndTimeInNs;
- (void)deleteStartTimeInNs;
- (void)setEndTimeInNs:(unint64_t)a3;
- (void)setHasEndTimeInNs:(BOOL)a3;
- (void)setHasStartTimeInNs:(BOOL)a3;
- (void)setStartTimeInNs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation LRSchemaLRTimespanRedactionSignal

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)endTimeInNs
{
  return self->_endTimeInNs;
}

- (unint64_t)startTimeInNs
{
  return self->_startTimeInNs;
}

- (LRSchemaLRTimespanRedactionSignal)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LRSchemaLRTimespanRedactionSignal;
  v5 = [(LRSchemaLRTimespanRedactionSignal *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRTimespanRedactionSignal setStartTimeInNs:](v5, "setStartTimeInNs:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"endTimeInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRTimespanRedactionSignal setEndTimeInNs:](v5, "setEndTimeInNs:", [v7 unsignedLongLongValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (LRSchemaLRTimespanRedactionSignal)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LRSchemaLRTimespanRedactionSignal *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LRSchemaLRTimespanRedactionSignal *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[LRSchemaLRTimespanRedactionSignal endTimeInNs](self, "endTimeInNs"));
    [v3 setObject:v5 forKeyedSubscript:@"endTimeInNs"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[LRSchemaLRTimespanRedactionSignal startTimeInNs](self, "startTimeInNs"));
    [v3 setObject:v6 forKeyedSubscript:@"startTimeInNs"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_startTimeInNs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_endTimeInNs;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $F60B79F1AEB0D1197C1771A21EE4FA2C has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t startTimeInNs = self->_startTimeInNs;
    if (startTimeInNs != [v4 startTimeInNs])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $F60B79F1AEB0D1197C1771A21EE4FA2C has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unint64_t endTimeInNs = self->_endTimeInNs;
    if (endTimeInNs != [v4 endTimeInNs]) {
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
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return LRSchemaLRTimespanRedactionSignalReadFrom(self, (uint64_t)a3);
}

- (void)deleteEndTimeInNs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEndTimeInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndTimeInNs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t endTimeInNs = a3;
}

- (void)deleteStartTimeInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStartTimeInNs:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTimeInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStartTimeInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t startTimeInNs = a3;
}

@end