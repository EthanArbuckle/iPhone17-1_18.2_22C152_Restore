@interface SISchemaGradingOptInStateChange
- (BOOL)hasEpochEventTimestampInSeconds;
- (BOOL)hasNewOptInState;
- (BOOL)hasPrevOptInState;
- (BOOL)hasReason;
- (BOOL)hasSource;
- (BOOL)hasSystemBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)reason;
- (NSString)systemBuild;
- (SISchemaGradingOptInStateChange)initWithDictionary:(id)a3;
- (SISchemaGradingOptInStateChange)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (int)newOptInState;
- (int)prevOptInState;
- (int)source;
- (unint64_t)epochEventTimestampInSeconds;
- (unint64_t)hash;
- (void)deleteEpochEventTimestampInSeconds;
- (void)deleteNewOptInState;
- (void)deletePrevOptInState;
- (void)deleteReason;
- (void)deleteSource;
- (void)deleteSystemBuild;
- (void)setEpochEventTimestampInSeconds:(unint64_t)a3;
- (void)setHasEpochEventTimestampInSeconds:(BOOL)a3;
- (void)setHasNewOptInState:(BOOL)a3;
- (void)setHasPrevOptInState:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasSystemBuild:(BOOL)a3;
- (void)setNewOptInState:(int)a3;
- (void)setPrevOptInState:(int)a3;
- (void)setReason:(id)a3;
- (void)setSource:(int)a3;
- (void)setSystemBuild:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaGradingOptInStateChange

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasReason:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)epochEventTimestampInSeconds
{
  return self->_epochEventTimestampInSeconds;
}

- (void)setSystemBuild:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (int)source
{
  return self->_source;
}

- (int)newOptInState
{
  return self->_newOptInState;
}

- (int)prevOptInState
{
  return self->_prevOptInState;
}

- (SISchemaGradingOptInStateChange)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaGradingOptInStateChange;
  v5 = [(SISchemaGradingOptInStateChange *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"prevOptInState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaGradingOptInStateChange setPrevOptInState:](v5, "setPrevOptInState:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"newOptInState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaGradingOptInStateChange setNewOptInState:](v5, "setNewOptInState:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaGradingOptInStateChange setSource:](v5, "setSource:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(SISchemaGradingOptInStateChange *)v5 setReason:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"systemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(SISchemaGradingOptInStateChange *)v5 setSystemBuild:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"epochEventTimestampInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaGradingOptInStateChange setEpochEventTimestampInSeconds:](v5, "setEpochEventTimestampInSeconds:", [v13 unsignedLongLongValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (SISchemaGradingOptInStateChange)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaGradingOptInStateChange *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaGradingOptInStateChange *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SISchemaGradingOptInStateChange epochEventTimestampInSeconds](self, "epochEventTimestampInSeconds"));
    [v3 setObject:v5 forKeyedSubscript:@"epochEventTimestampInSeconds"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v6 = [(SISchemaGradingOptInStateChange *)self newOptInState] - 1;
  if (v6 > 2) {
    uint64_t v7 = @"UNKNOWN";
  }
  else {
    uint64_t v7 = off_1E5EB6C88[v6];
  }
  [v3 setObject:v7 forKeyedSubscript:@"newOptInState"];
  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    unsigned int v8 = [(SISchemaGradingOptInStateChange *)self prevOptInState] - 1;
    if (v8 > 2) {
      v9 = @"UNKNOWN";
    }
    else {
      v9 = off_1E5EB6C88[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"prevOptInState"];
  }
LABEL_14:
  if (self->_reason)
  {
    v10 = [(SISchemaGradingOptInStateChange *)self reason];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"reason"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v12 = [(SISchemaGradingOptInStateChange *)self source] - 1;
    if (v12 > 0xB) {
      v13 = @"GRADINGOPTINSTATECHANGESOURCE_UNKNOWN";
    }
    else {
      v13 = off_1E5EB6CA0[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"source"];
  }
  if (self->_systemBuild)
  {
    v14 = [(SISchemaGradingOptInStateChange *)self systemBuild];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"systemBuild"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_prevOptInState;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_newOptInState;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_source;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_reason hash];
  NSUInteger v7 = [(NSString *)self->_systemBuild hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    unint64_t v8 = 2654435761u * self->_epochEventTimestampInSeconds;
  }
  else {
    unint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  $7B07D830EE19D6A3F3B9660BBAA9E966 has = self->_has;
  unsigned int v6 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&has)
  {
    int prevOptInState = self->_prevOptInState;
    if (prevOptInState != [v4 prevOptInState]) {
      goto LABEL_23;
    }
    $7B07D830EE19D6A3F3B9660BBAA9E966 has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int newOptInState = self->_newOptInState;
      if (newOptInState != [v4 newOptInState]) {
        goto LABEL_23;
      }
      $7B07D830EE19D6A3F3B9660BBAA9E966 has = self->_has;
      unsigned int v6 = v4[48];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 != ((v6 >> 2) & 1)) {
      goto LABEL_23;
    }
    if (v10)
    {
      int source = self->_source;
      if (source != [v4 source]) {
        goto LABEL_23;
      }
    }
    unsigned int v12 = [(SISchemaGradingOptInStateChange *)self reason];
    v13 = [v4 reason];
    if ((v12 == 0) == (v13 != 0)) {
      goto LABEL_22;
    }
    uint64_t v14 = [(SISchemaGradingOptInStateChange *)self reason];
    if (v14)
    {
      v15 = (void *)v14;
      objc_super v16 = [(SISchemaGradingOptInStateChange *)self reason];
      v17 = [v4 reason];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    unsigned int v12 = [(SISchemaGradingOptInStateChange *)self systemBuild];
    v13 = [v4 systemBuild];
    if ((v12 == 0) == (v13 != 0))
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v19 = [(SISchemaGradingOptInStateChange *)self systemBuild];
    if (v19)
    {
      v20 = (void *)v19;
      v21 = [(SISchemaGradingOptInStateChange *)self systemBuild];
      v22 = [v4 systemBuild];
      int v23 = [v21 isEqual:v22];

      if (!v23) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    int v26 = (*(unsigned char *)&self->_has >> 3) & 1;
    if (v26 == ((v4[48] >> 3) & 1))
    {
      if (!v26
        || (unint64_t epochEventTimestampInSeconds = self->_epochEventTimestampInSeconds,
            epochEventTimestampInSeconds == [v4 epochEventTimestampInSeconds]))
      {
        BOOL v24 = 1;
        goto LABEL_24;
      }
    }
  }
LABEL_23:
  BOOL v24 = 0;
LABEL_24:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
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
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  uint64_t v5 = [(SISchemaGradingOptInStateChange *)self reason];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unsigned int v6 = [(SISchemaGradingOptInStateChange *)self systemBuild];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaGradingOptInStateChangeReadFrom(self, (uint64_t)a3);
}

- (void)deleteEpochEventTimestampInSeconds
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasEpochEventTimestampInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEpochEventTimestampInSeconds
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEpochEventTimestampInSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unint64_t epochEventTimestampInSeconds = a3;
}

- (void)deleteSystemBuild
{
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteReason
{
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (void)deleteSource
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int source = a3;
}

- (void)deleteNewOptInState
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNewOptInState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNewOptInState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNewOptInState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int newOptInState = a3;
}

- (void)deletePrevOptInState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPrevOptInState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPrevOptInState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPrevOptInState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int prevOptInState = a3;
}

- (id)qualifiedMessageName
{
  return @"com.apple.aiml.siri.common.GradingOptInStateChange";
}

- (int)getAnyEventType
{
  return 47;
}

@end