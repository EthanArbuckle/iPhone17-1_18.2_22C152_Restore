@interface ODDSiriSchemaODDReliabilityCounts
- (BOOL)hasClientErrorCount;
- (BOOL)hasFailureResponseCount;
- (BOOL)hasFatalResponseCount;
- (BOOL)hasReliabilityRequestCount;
- (BOOL)hasReliabilityTurnCount;
- (BOOL)hasSiriUnavailableResponseCount;
- (BOOL)hasUndesiredResponseCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDReliabilityCounts)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDReliabilityCounts)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)clientErrorCount;
- (unsigned)failureResponseCount;
- (unsigned)fatalResponseCount;
- (unsigned)reliabilityRequestCount;
- (unsigned)reliabilityTurnCount;
- (unsigned)siriUnavailableResponseCount;
- (unsigned)undesiredResponseCount;
- (void)deleteClientErrorCount;
- (void)deleteFailureResponseCount;
- (void)deleteFatalResponseCount;
- (void)deleteReliabilityRequestCount;
- (void)deleteReliabilityTurnCount;
- (void)deleteSiriUnavailableResponseCount;
- (void)deleteUndesiredResponseCount;
- (void)setClientErrorCount:(unsigned int)a3;
- (void)setFailureResponseCount:(unsigned int)a3;
- (void)setFatalResponseCount:(unsigned int)a3;
- (void)setHasClientErrorCount:(BOOL)a3;
- (void)setHasFailureResponseCount:(BOOL)a3;
- (void)setHasFatalResponseCount:(BOOL)a3;
- (void)setHasReliabilityRequestCount:(BOOL)a3;
- (void)setHasReliabilityTurnCount:(BOOL)a3;
- (void)setHasSiriUnavailableResponseCount:(BOOL)a3;
- (void)setHasUndesiredResponseCount:(BOOL)a3;
- (void)setReliabilityRequestCount:(unsigned int)a3;
- (void)setReliabilityTurnCount:(unsigned int)a3;
- (void)setSiriUnavailableResponseCount:(unsigned int)a3;
- (void)setUndesiredResponseCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDReliabilityCounts

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)siriUnavailableResponseCount
{
  return self->_siriUnavailableResponseCount;
}

- (unsigned)failureResponseCount
{
  return self->_failureResponseCount;
}

- (unsigned)fatalResponseCount
{
  return self->_fatalResponseCount;
}

- (unsigned)undesiredResponseCount
{
  return self->_undesiredResponseCount;
}

- (unsigned)clientErrorCount
{
  return self->_clientErrorCount;
}

- (unsigned)reliabilityTurnCount
{
  return self->_reliabilityTurnCount;
}

- (unsigned)reliabilityRequestCount
{
  return self->_reliabilityRequestCount;
}

- (ODDSiriSchemaODDReliabilityCounts)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODDSiriSchemaODDReliabilityCounts;
  v5 = [(ODDSiriSchemaODDReliabilityCounts *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"reliabilityRequestCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDReliabilityCounts setReliabilityRequestCount:](v5, "setReliabilityRequestCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"reliabilityTurnCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDReliabilityCounts setReliabilityTurnCount:](v5, "setReliabilityTurnCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"clientErrorCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDReliabilityCounts setClientErrorCount:](v5, "setClientErrorCount:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"undesiredResponseCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDReliabilityCounts setUndesiredResponseCount:](v5, "setUndesiredResponseCount:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"fatalResponseCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDReliabilityCounts setFatalResponseCount:](v5, "setFatalResponseCount:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"failureResponseCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDReliabilityCounts setFailureResponseCount:](v5, "setFailureResponseCount:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"siriUnavailableResponseCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDReliabilityCounts setSiriUnavailableResponseCount:](v5, "setSiriUnavailableResponseCount:", [v12 unsignedIntValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDReliabilityCounts)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDReliabilityCounts *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDReliabilityCounts *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts clientErrorCount](self, "clientErrorCount"));
    [v3 setObject:v7 forKeyedSubscript:@"clientErrorCount"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts failureResponseCount](self, "failureResponseCount"));
  [v3 setObject:v8 forKeyedSubscript:@"failureResponseCount"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts fatalResponseCount](self, "fatalResponseCount"));
  [v3 setObject:v9 forKeyedSubscript:@"fatalResponseCount"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts reliabilityRequestCount](self, "reliabilityRequestCount"));
  [v3 setObject:v10 forKeyedSubscript:@"reliabilityRequestCount"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts reliabilityTurnCount](self, "reliabilityTurnCount"));
  [v3 setObject:v11 forKeyedSubscript:@"reliabilityTurnCount"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts siriUnavailableResponseCount](self, "siriUnavailableResponseCount"));
  [v3 setObject:v12 forKeyedSubscript:@"siriUnavailableResponseCount"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODDSiriSchemaODDReliabilityCounts undesiredResponseCount](self, "undesiredResponseCount"));
    [v3 setObject:v5 forKeyedSubscript:@"undesiredResponseCount"];
  }
LABEL_9:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_reliabilityRequestCount;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_reliabilityTurnCount;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
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
    uint64_t v4 = 2654435761 * self->_clientErrorCount;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_undesiredResponseCount;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_fatalResponseCount;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_failureResponseCount;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_siriUnavailableResponseCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  $EAE7B07C6F5D12679B0F4499A534C794 has = self->_has;
  unsigned int v6 = v4[36];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int reliabilityRequestCount = self->_reliabilityRequestCount;
    if (reliabilityRequestCount != [v4 reliabilityRequestCount]) {
      goto LABEL_30;
    }
    $EAE7B07C6F5D12679B0F4499A534C794 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_30;
  }
  if (v8)
  {
    unsigned int reliabilityTurnCount = self->_reliabilityTurnCount;
    if (reliabilityTurnCount != [v4 reliabilityTurnCount]) {
      goto LABEL_30;
    }
    $EAE7B07C6F5D12679B0F4499A534C794 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_30;
  }
  if (v10)
  {
    unsigned int clientErrorCount = self->_clientErrorCount;
    if (clientErrorCount != [v4 clientErrorCount]) {
      goto LABEL_30;
    }
    $EAE7B07C6F5D12679B0F4499A534C794 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_30;
  }
  if (v12)
  {
    unsigned int undesiredResponseCount = self->_undesiredResponseCount;
    if (undesiredResponseCount != [v4 undesiredResponseCount]) {
      goto LABEL_30;
    }
    $EAE7B07C6F5D12679B0F4499A534C794 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_30;
  }
  if (v14)
  {
    unsigned int fatalResponseCount = self->_fatalResponseCount;
    if (fatalResponseCount != [v4 fatalResponseCount]) {
      goto LABEL_30;
    }
    $EAE7B07C6F5D12679B0F4499A534C794 has = self->_has;
    unsigned int v6 = v4[36];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_30;
  }
  if (v16)
  {
    unsigned int failureResponseCount = self->_failureResponseCount;
    if (failureResponseCount == [v4 failureResponseCount])
    {
      $EAE7B07C6F5D12679B0F4499A534C794 has = self->_has;
      unsigned int v6 = v4[36];
      goto LABEL_26;
    }
LABEL_30:
    BOOL v20 = 0;
    goto LABEL_31;
  }
LABEL_26:
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_30;
  }
  if (v18)
  {
    unsigned int siriUnavailableResponseCount = self->_siriUnavailableResponseCount;
    if (siriUnavailableResponseCount != [v4 siriUnavailableResponseCount]) {
      goto LABEL_30;
    }
  }
  BOOL v20 = 1;
LABEL_31:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDReliabilityCountsReadFrom(self, (uint64_t)a3);
}

- (void)deleteSiriUnavailableResponseCount
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setHasSiriUnavailableResponseCount:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSiriUnavailableResponseCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setSiriUnavailableResponseCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_unsigned int siriUnavailableResponseCount = a3;
}

- (void)deleteFailureResponseCount
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasFailureResponseCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFailureResponseCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setFailureResponseCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int failureResponseCount = a3;
}

- (void)deleteFatalResponseCount
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasFatalResponseCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFatalResponseCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setFatalResponseCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int fatalResponseCount = a3;
}

- (void)deleteUndesiredResponseCount
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasUndesiredResponseCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUndesiredResponseCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setUndesiredResponseCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int undesiredResponseCount = a3;
}

- (void)deleteClientErrorCount
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasClientErrorCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasClientErrorCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setClientErrorCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int clientErrorCount = a3;
}

- (void)deleteReliabilityTurnCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasReliabilityTurnCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReliabilityTurnCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setReliabilityTurnCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int reliabilityTurnCount = a3;
}

- (void)deleteReliabilityRequestCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasReliabilityRequestCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReliabilityRequestCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReliabilityRequestCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int reliabilityRequestCount = a3;
}

@end