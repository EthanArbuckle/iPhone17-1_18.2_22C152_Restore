@interface PFAClockEnvelopeStatistics
- (BOOL)hasMessageCount;
- (BOOL)hasTotalBytes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PFAClockEnvelopeStatistics)initWithDictionary:(id)a3;
- (PFAClockEnvelopeStatistics)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)totalBytes;
- (unsigned)messageCount;
- (void)deleteMessageCount;
- (void)deleteTotalBytes;
- (void)setHasMessageCount:(BOOL)a3;
- (void)setHasTotalBytes:(BOOL)a3;
- (void)setMessageCount:(unsigned int)a3;
- (void)setTotalBytes:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFAClockEnvelopeStatistics

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)totalBytes
{
  return self->_totalBytes;
}

- (unsigned)messageCount
{
  return self->_messageCount;
}

- (PFAClockEnvelopeStatistics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PFAClockEnvelopeStatistics;
  v5 = [(PFAClockEnvelopeStatistics *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"messageCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAClockEnvelopeStatistics setMessageCount:](v5, "setMessageCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"totalBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAClockEnvelopeStatistics setTotalBytes:](v5, "setTotalBytes:", [v7 unsignedLongLongValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (PFAClockEnvelopeStatistics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFAClockEnvelopeStatistics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFAClockEnvelopeStatistics *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PFAClockEnvelopeStatistics messageCount](self, "messageCount"));
    [v3 setObject:v5 forKeyedSubscript:@"messageCount"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PFAClockEnvelopeStatistics totalBytes](self, "totalBytes"));
    [v3 setObject:v6 forKeyedSubscript:@"totalBytes"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_messageCount;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_totalBytes;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $4D5295558B0207EDD266CC06BD601025 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int messageCount = self->_messageCount;
    if (messageCount != [v4 messageCount])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $4D5295558B0207EDD266CC06BD601025 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unint64_t totalBytes = self->_totalBytes;
    if (totalBytes != [v4 totalBytes]) {
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
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFAClockEnvelopeStatisticsReadFrom(self, (uint64_t)a3);
}

- (void)deleteTotalBytes
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTotalBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalBytes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t totalBytes = a3;
}

- (void)deleteMessageCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMessageCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMessageCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMessageCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int messageCount = a3;
}

@end