@interface ORCHSchemaORCHExecutionRequestReceived
- (BOOL)executionForRSKE;
- (BOOL)hasCommandSource;
- (BOOL)hasExecutionForRSKE;
- (BOOL)hasPreExecutionDecision;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHExecutionRequestReceived)initWithDictionary:(id)a3;
- (ORCHSchemaORCHExecutionRequestReceived)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)commandSource;
- (int)preExecutionDecision;
- (unint64_t)hash;
- (void)deleteCommandSource;
- (void)deleteExecutionForRSKE;
- (void)deletePreExecutionDecision;
- (void)setCommandSource:(int)a3;
- (void)setExecutionForRSKE:(BOOL)a3;
- (void)setHasCommandSource:(BOOL)a3;
- (void)setHasExecutionForRSKE:(BOOL)a3;
- (void)setHasPreExecutionDecision:(BOOL)a3;
- (void)setPreExecutionDecision:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHExecutionRequestReceived

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)commandSource
{
  return self->_commandSource;
}

- (BOOL)executionForRSKE
{
  return self->_executionForRSKE;
}

- (int)preExecutionDecision
{
  return self->_preExecutionDecision;
}

- (ORCHSchemaORCHExecutionRequestReceived)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ORCHSchemaORCHExecutionRequestReceived;
  v5 = [(ORCHSchemaORCHExecutionRequestReceived *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"preExecutionDecision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHExecutionRequestReceived setPreExecutionDecision:](v5, "setPreExecutionDecision:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"executionForRSKE"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHExecutionRequestReceived setExecutionForRSKE:](v5, "setExecutionForRSKE:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"commandSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ORCHSchemaORCHExecutionRequestReceived setCommandSource:](v5, "setCommandSource:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHExecutionRequestReceived)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHExecutionRequestReceived *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHExecutionRequestReceived *)self dictionaryRepresentation];
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
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ORCHSchemaORCHExecutionRequestReceived executionForRSKE](self, "executionForRSKE"));
    [v3 setObject:v7 forKeyedSubscript:@"executionForRSKE"];

    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_14;
    }
LABEL_10:
    unsigned int v8 = [(ORCHSchemaORCHExecutionRequestReceived *)self preExecutionDecision] - 1;
    if (v8 > 9) {
      v9 = @"ORCHPREEXECUTIONDECISION_UNKNOWN";
    }
    else {
      v9 = off_1E5EB39B8[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"preExecutionDecision"];
    goto LABEL_14;
  }
  unsigned int v5 = [(ORCHSchemaORCHExecutionRequestReceived *)self commandSource] - 1;
  if (v5 > 2) {
    v6 = @"ORCHRSKESOURCE_UNKNOWN";
  }
  else {
    v6 = off_1E5EB39A0[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"commandSource"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_3:
  if (has) {
    goto LABEL_10;
  }
LABEL_14:
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
  uint64_t v2 = 2654435761 * self->_preExecutionDecision;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_executionForRSKE;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_commandSource;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $B28626E3F0729D227D6F79B851EC94A2 has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int preExecutionDecision = self->_preExecutionDecision;
    if (preExecutionDecision != [v4 preExecutionDecision]) {
      goto LABEL_14;
    }
    $B28626E3F0729D227D6F79B851EC94A2 has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int executionForRSKE = self->_executionForRSKE;
    if (executionForRSKE == [v4 executionForRSKE])
    {
      $B28626E3F0729D227D6F79B851EC94A2 has = self->_has;
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
    int commandSource = self->_commandSource;
    if (commandSource != [v4 commandSource]) {
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
  PBDataWriterWriteBOOLField();
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
  return ORCHSchemaORCHExecutionRequestReceivedReadFrom(self, (uint64_t)a3);
}

- (void)deleteCommandSource
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCommandSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCommandSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCommandSource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int commandSource = a3;
}

- (void)deleteExecutionForRSKE
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasExecutionForRSKE:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExecutionForRSKE
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setExecutionForRSKE:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int executionForRSKE = a3;
}

- (void)deletePreExecutionDecision
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPreExecutionDecision:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPreExecutionDecision
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPreExecutionDecision:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int preExecutionDecision = a3;
}

@end