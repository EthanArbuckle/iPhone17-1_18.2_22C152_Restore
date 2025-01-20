@interface SICSchemaSICInvocationStarted
- (BOOL)hasCallAppType;
- (BOOL)hasCallState;
- (BOOL)hasCallType;
- (BOOL)hasIsMuted;
- (BOOL)hasParticipantCountBucket;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMuted;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SICSchemaSICInvocationStarted)initWithDictionary:(id)a3;
- (SICSchemaSICInvocationStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)callAppType;
- (int)callState;
- (int)callType;
- (int)participantCountBucket;
- (unint64_t)hash;
- (void)deleteCallAppType;
- (void)deleteCallState;
- (void)deleteCallType;
- (void)deleteIsMuted;
- (void)deleteParticipantCountBucket;
- (void)setCallAppType:(int)a3;
- (void)setCallState:(int)a3;
- (void)setCallType:(int)a3;
- (void)setHasCallAppType:(BOOL)a3;
- (void)setHasCallState:(BOOL)a3;
- (void)setHasCallType:(BOOL)a3;
- (void)setHasIsMuted:(BOOL)a3;
- (void)setHasParticipantCountBucket:(BOOL)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setParticipantCountBucket:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SICSchemaSICInvocationStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)participantCountBucket
{
  return self->_participantCountBucket;
}

- (int)callAppType
{
  return self->_callAppType;
}

- (int)callState
{
  return self->_callState;
}

- (int)callType
{
  return self->_callType;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (SICSchemaSICInvocationStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SICSchemaSICInvocationStarted;
  v5 = [(SICSchemaSICInvocationStarted *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isMuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SICSchemaSICInvocationStarted setIsMuted:](v5, "setIsMuted:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"callType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SICSchemaSICInvocationStarted setCallType:](v5, "setCallType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"callState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SICSchemaSICInvocationStarted setCallState:](v5, "setCallState:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"callAppType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SICSchemaSICInvocationStarted setCallAppType:](v5, "setCallAppType:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"participantCountBucket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SICSchemaSICInvocationStarted setParticipantCountBucket:](v5, "setParticipantCountBucket:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (SICSchemaSICInvocationStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SICSchemaSICInvocationStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SICSchemaSICInvocationStarted *)self dictionaryRepresentation];
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
    unsigned int v5 = [(SICSchemaSICInvocationStarted *)self callAppType] - 1;
    if (v5 > 2) {
      v6 = @"CALLAPPTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EB5088[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"callAppType"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v7 = [(SICSchemaSICInvocationStarted *)self callState] - 1;
  if (v7 > 4) {
    v8 = @"CALLSTATE_UNKNOWN";
  }
  else {
    v8 = off_1E5EB50A0[v7];
  }
  [v3 setObject:v8 forKeyedSubscript:@"callState"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_21:
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SICSchemaSICInvocationStarted isMuted](self, "isMuted"));
    [v3 setObject:v12 forKeyedSubscript:@"isMuted"];

    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_26;
    }
LABEL_22:
    unsigned int v13 = [(SICSchemaSICInvocationStarted *)self participantCountBucket] - 1;
    if (v13 > 5) {
      v14 = @"SICPARTICIPANTCOUNTBUCKET_UNKNOWN";
    }
    else {
      v14 = off_1E5EB50C8[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"participantCountBucket"];
    goto LABEL_26;
  }
LABEL_15:
  int v9 = [(SICSchemaSICInvocationStarted *)self callType];
  v10 = @"CALLTYPE_UNKNOWN";
  if (v9 == 1) {
    v10 = @"CALLTYPE_AUDIO";
  }
  if (v9 == 2) {
    v11 = @"CALLTYPE_VIDEO";
  }
  else {
    v11 = v10;
  }
  [v3 setObject:v11 forKeyedSubscript:@"callType"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_21;
  }
LABEL_5:
  if ((has & 0x10) != 0) {
    goto LABEL_22;
  }
LABEL_26:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_isMuted;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_callType;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
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
    uint64_t v4 = 2654435761 * self->_callState;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_callAppType;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_participantCountBucket;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $41D7D76F82648DAA234CB09B73C423E1 has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    int isMuted = self->_isMuted;
    if (isMuted != [v4 isMuted]) {
      goto LABEL_22;
    }
    $41D7D76F82648DAA234CB09B73C423E1 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    int callType = self->_callType;
    if (callType != [v4 callType]) {
      goto LABEL_22;
    }
    $41D7D76F82648DAA234CB09B73C423E1 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v10)
  {
    int callState = self->_callState;
    if (callState != [v4 callState]) {
      goto LABEL_22;
    }
    $41D7D76F82648DAA234CB09B73C423E1 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v12)
  {
    int callAppType = self->_callAppType;
    if (callAppType == [v4 callAppType])
    {
      $41D7D76F82648DAA234CB09B73C423E1 has = self->_has;
      unsigned int v6 = v4[28];
      goto LABEL_18;
    }
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_22;
  }
  if (v14)
  {
    int participantCountBucket = self->_participantCountBucket;
    if (participantCountBucket != [v4 participantCountBucket]) {
      goto LABEL_22;
    }
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return SICSchemaSICInvocationStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteParticipantCountBucket
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasParticipantCountBucket:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasParticipantCountBucket
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setParticipantCountBucket:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int participantCountBucket = a3;
}

- (void)deleteCallAppType
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasCallAppType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCallAppType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCallAppType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int callAppType = a3;
}

- (void)deleteCallState
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCallState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCallState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCallState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int callState = a3;
}

- (void)deleteCallType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCallType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCallType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCallType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int callType = a3;
}

- (void)deleteIsMuted
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsMuted:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsMuted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsMuted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isMuted = a3;
}

@end