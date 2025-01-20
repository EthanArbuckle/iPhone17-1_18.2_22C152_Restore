@interface LRSchemaLRRedactionSignal
- (BOOL)hasComponentId;
- (BOOL)hasIsEntireClockAffected;
- (BOOL)hasSensitivityState;
- (BOOL)hasSignalTimeNanosecondsSinceBoot;
- (BOOL)hasTimeSpan;
- (BOOL)isEntireClockAffected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LRSchemaLRComponentIdentifierRedactionSignal)componentId;
- (LRSchemaLRRedactionSignal)initWithDictionary:(id)a3;
- (LRSchemaLRRedactionSignal)initWithJSON:(id)a3;
- (LRSchemaLRTimespanRedactionSignal)timeSpan;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)sensitivityState;
- (unint64_t)hash;
- (unint64_t)signalTimeNanosecondsSinceBoot;
- (unint64_t)whichSignal;
- (void)deleteComponentId;
- (void)deleteIsEntireClockAffected;
- (void)deleteSensitivityState;
- (void)deleteSignalTimeNanosecondsSinceBoot;
- (void)deleteTimeSpan;
- (void)setComponentId:(id)a3;
- (void)setHasComponentId:(BOOL)a3;
- (void)setHasIsEntireClockAffected:(BOOL)a3;
- (void)setHasSensitivityState:(BOOL)a3;
- (void)setHasSignalTimeNanosecondsSinceBoot:(BOOL)a3;
- (void)setHasTimeSpan:(BOOL)a3;
- (void)setIsEntireClockAffected:(BOOL)a3;
- (void)setSensitivityState:(int)a3;
- (void)setSignalTimeNanosecondsSinceBoot:(unint64_t)a3;
- (void)setTimeSpan:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LRSchemaLRRedactionSignal

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LRSchemaLRRedactionSignal;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(LRSchemaLRRedactionSignal *)self timeSpan];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(LRSchemaLRRedactionSignal *)self deleteTimeSpan];
  }
  v9 = [(LRSchemaLRRedactionSignal *)self componentId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(LRSchemaLRRedactionSignal *)self deleteComponentId];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentId, 0);
  objc_storeStrong((id *)&self->_timeSpan, 0);
}

- (void)setHasComponentId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (BOOL)hasComponentId
{
  return *((unsigned char *)&self->_has + 3);
}

- (void)setHasTimeSpan:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasTimeSpan
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasIsEntireClockAffected:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (BOOL)hasIsEntireClockAffected
{
  return *((unsigned char *)&self->_has + 1);
}

- (unint64_t)signalTimeNanosecondsSinceBoot
{
  return self->_signalTimeNanosecondsSinceBoot;
}

- (int)sensitivityState
{
  return self->_sensitivityState;
}

- (unint64_t)whichSignal
{
  return self->_whichSignal;
}

- (LRSchemaLRRedactionSignal)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)LRSchemaLRRedactionSignal;
  v5 = [(LRSchemaLRRedactionSignal *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sensitivityState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRRedactionSignal setSensitivityState:](v5, "setSensitivityState:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"signalTimeNanosecondsSinceBoot"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRRedactionSignal setSignalTimeNanosecondsSinceBoot:](v5, "setSignalTimeNanosecondsSinceBoot:", [v7 unsignedLongLongValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"isEntireClockAffected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[LRSchemaLRRedactionSignal setIsEntireClockAffected:](v5, "setIsEntireClockAffected:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"timeSpan"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[LRSchemaLRTimespanRedactionSignal alloc] initWithDictionary:v9];
      [(LRSchemaLRRedactionSignal *)v5 setTimeSpan:v10];
    }
    int v11 = [v4 objectForKeyedSubscript:@"componentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[LRSchemaLRComponentIdentifierRedactionSignal alloc] initWithDictionary:v11];
      [(LRSchemaLRRedactionSignal *)v5 setComponentId:v12];
    }
    objc_super v13 = v5;
  }
  return v5;
}

- (LRSchemaLRRedactionSignal)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(LRSchemaLRRedactionSignal *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(LRSchemaLRRedactionSignal *)self dictionaryRepresentation];
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
  if (self->_componentId)
  {
    id v4 = [(LRSchemaLRRedactionSignal *)self componentId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"componentId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"componentId"];
    }
  }
  if (self->_whichSignal == 101)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[LRSchemaLRRedactionSignal isEntireClockAffected](self, "isEntireClockAffected"));
    [v3 setObject:v7 forKeyedSubscript:@"isEntireClockAffected"];
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v9 = [(LRSchemaLRRedactionSignal *)self sensitivityState] - 1;
    if (v9 > 9) {
      v10 = @"DEVICE_SENSITIVITY_STATE_DEFAULT";
    }
    else {
      v10 = off_1E5EBB920[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"sensitivityState"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[LRSchemaLRRedactionSignal signalTimeNanosecondsSinceBoot](self, "signalTimeNanosecondsSinceBoot"));
    [v3 setObject:v11 forKeyedSubscript:@"signalTimeNanosecondsSinceBoot"];
  }
  if (self->_timeSpan)
  {
    v12 = [(LRSchemaLRRedactionSignal *)self timeSpan];
    objc_super v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"timeSpan"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"timeSpan"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_sensitivityState;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_signalTimeNanosecondsSinceBoot;
      goto LABEL_6;
    }
  }
  unint64_t v4 = 0;
LABEL_6:
  if (self->_whichSignal == 101) {
    uint64_t v5 = 2654435761 * self->_isEntireClockAffected;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(LRSchemaLRTimespanRedactionSignal *)self->_timeSpan hash];
  return v6 ^ [(LRSchemaLRComponentIdentifierRedactionSignal *)self->_componentId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  unint64_t whichSignal = self->_whichSignal;
  if (whichSignal != [v4 whichSignal]) {
    goto LABEL_21;
  }
  $4D05DE1613F598723D23BFC31ECB1551 has = self->_has;
  unsigned int v7 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v7 & 1)) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&has)
  {
    int sensitivityState = self->_sensitivityState;
    if (sensitivityState != [v4 sensitivityState]) {
      goto LABEL_21;
    }
    $4D05DE1613F598723D23BFC31ECB1551 has = self->_has;
    unsigned int v7 = v4[48];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1)) {
    goto LABEL_21;
  }
  if (v9)
  {
    unint64_t signalTimeNanosecondsSinceBoot = self->_signalTimeNanosecondsSinceBoot;
    if (signalTimeNanosecondsSinceBoot != [v4 signalTimeNanosecondsSinceBoot]) {
      goto LABEL_21;
    }
  }
  int isEntireClockAffected = self->_isEntireClockAffected;
  if (isEntireClockAffected != [v4 isEntireClockAffected]) {
    goto LABEL_21;
  }
  v12 = [(LRSchemaLRRedactionSignal *)self timeSpan];
  objc_super v13 = [v4 timeSpan];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(LRSchemaLRRedactionSignal *)self timeSpan];
  if (v14)
  {
    objc_super v15 = (void *)v14;
    v16 = [(LRSchemaLRRedactionSignal *)self timeSpan];
    v17 = [v4 timeSpan];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v12 = [(LRSchemaLRRedactionSignal *)self componentId];
  objc_super v13 = [v4 componentId];
  if ((v12 == 0) != (v13 != 0))
  {
    uint64_t v19 = [(LRSchemaLRRedactionSignal *)self componentId];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    v21 = [(LRSchemaLRRedactionSignal *)self componentId];
    v22 = [v4 componentId];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_whichSignal == 101) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v5 = [(LRSchemaLRRedactionSignal *)self timeSpan];

  if (v5)
  {
    unint64_t v6 = [(LRSchemaLRRedactionSignal *)self timeSpan];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v7 = [(LRSchemaLRRedactionSignal *)self componentId];

  int v8 = v10;
  if (v7)
  {
    int v9 = [(LRSchemaLRRedactionSignal *)self componentId];
    PBDataWriterWriteSubmessage();

    int v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return LRSchemaLRRedactionSignalReadFrom(self, (uint64_t)a3);
}

- (void)deleteComponentId
{
  if (self->_whichSignal == 103)
  {
    self->_unint64_t whichSignal = 0;
    self->_componentId = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (LRSchemaLRComponentIdentifierRedactionSignal)componentId
{
  if (self->_whichSignal == 103) {
    v2 = self->_componentId;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setComponentId:(id)a3
{
  unint64_t v4 = (LRSchemaLRComponentIdentifierRedactionSignal *)a3;
  self->_int isEntireClockAffected = 0;
  timeSpan = self->_timeSpan;
  self->_timeSpan = 0;

  unint64_t v6 = 103;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichSignal = v6;
  componentId = self->_componentId;
  self->_componentId = v4;
}

- (void)deleteTimeSpan
{
  if (self->_whichSignal == 102)
  {
    self->_unint64_t whichSignal = 0;
    self->_timeSpan = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (LRSchemaLRTimespanRedactionSignal)timeSpan
{
  if (self->_whichSignal == 102) {
    v2 = self->_timeSpan;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTimeSpan:(id)a3
{
  unint64_t v4 = (LRSchemaLRTimespanRedactionSignal *)a3;
  self->_int isEntireClockAffected = 0;
  componentId = self->_componentId;
  self->_componentId = 0;

  unint64_t v6 = 102;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichSignal = v6;
  timeSpan = self->_timeSpan;
  self->_timeSpan = v4;
}

- (void)deleteIsEntireClockAffected
{
  if (self->_whichSignal == 101)
  {
    self->_unint64_t whichSignal = 0;
    self->_int isEntireClockAffected = 0;
  }
}

- (BOOL)isEntireClockAffected
{
  return self->_whichSignal == 101 && self->_isEntireClockAffected;
}

- (void)setIsEntireClockAffected:(BOOL)a3
{
  timeSpan = self->_timeSpan;
  self->_timeSpan = 0;

  componentId = self->_componentId;
  self->_componentId = 0;

  self->_unint64_t whichSignal = 101;
  self->_int isEntireClockAffected = a3;
}

- (void)deleteSignalTimeNanosecondsSinceBoot
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSignalTimeNanosecondsSinceBoot:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignalTimeNanosecondsSinceBoot
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSignalTimeNanosecondsSinceBoot:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t signalTimeNanosecondsSinceBoot = a3;
}

- (void)deleteSensitivityState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSensitivityState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSensitivityState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSensitivityState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int sensitivityState = a3;
}

@end