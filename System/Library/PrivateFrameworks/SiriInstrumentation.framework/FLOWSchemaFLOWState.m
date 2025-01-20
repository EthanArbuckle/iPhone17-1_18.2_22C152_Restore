@interface FLOWSchemaFLOWState
- (BOOL)hasCurrentTaskName;
- (BOOL)hasCurrentTaskType;
- (BOOL)hasFlowStateReason;
- (BOOL)hasFlowStateReasonDescription;
- (BOOL)hasFlowStateType;
- (BOOL)hasResolvedSlotName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWState)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWState)initWithJSON:(id)a3;
- (FLOWSchemaFLOWStateReason)flowStateReason;
- (NSData)jsonData;
- (NSString)currentTaskName;
- (NSString)currentTaskType;
- (NSString)flowStateReasonDescription;
- (NSString)resolvedSlotName;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)flowStateType;
- (unint64_t)hash;
- (void)deleteCurrentTaskName;
- (void)deleteCurrentTaskType;
- (void)deleteFlowStateReason;
- (void)deleteFlowStateReasonDescription;
- (void)deleteFlowStateType;
- (void)deleteResolvedSlotName;
- (void)setCurrentTaskName:(id)a3;
- (void)setCurrentTaskType:(id)a3;
- (void)setFlowStateReason:(id)a3;
- (void)setFlowStateReasonDescription:(id)a3;
- (void)setFlowStateType:(int)a3;
- (void)setHasCurrentTaskName:(BOOL)a3;
- (void)setHasCurrentTaskType:(BOOL)a3;
- (void)setHasFlowStateReason:(BOOL)a3;
- (void)setHasFlowStateReasonDescription:(BOOL)a3;
- (void)setHasFlowStateType:(BOOL)a3;
- (void)setHasResolvedSlotName:(BOOL)a3;
- (void)setResolvedSlotName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWState

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FLOWSchemaFLOWState;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWState *)self flowStateReason];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(FLOWSchemaFLOWState *)self deleteFlowStateReason];
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
  objc_storeStrong((id *)&self->_flowStateReasonDescription, 0);
  objc_storeStrong((id *)&self->_resolvedSlotName, 0);
  objc_storeStrong((id *)&self->_flowStateReason, 0);
  objc_storeStrong((id *)&self->_currentTaskType, 0);
  objc_storeStrong((id *)&self->_currentTaskName, 0);
}

- (void)setHasFlowStateReasonDescription:(BOOL)a3
{
  self->_hasCurrentTaskType = a3;
}

- (void)setHasResolvedSlotName:(BOOL)a3
{
  self->_hasCurrentTaskName = a3;
}

- (void)setHasFlowStateReason:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasCurrentTaskType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasCurrentTaskName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setFlowStateReasonDescription:(id)a3
{
}

- (NSString)flowStateReasonDescription
{
  return self->_flowStateReasonDescription;
}

- (void)setResolvedSlotName:(id)a3
{
}

- (NSString)resolvedSlotName
{
  return self->_resolvedSlotName;
}

- (void)setFlowStateReason:(id)a3
{
}

- (FLOWSchemaFLOWStateReason)flowStateReason
{
  return self->_flowStateReason;
}

- (int)flowStateType
{
  return self->_flowStateType;
}

- (void)setCurrentTaskType:(id)a3
{
}

- (NSString)currentTaskType
{
  return self->_currentTaskType;
}

- (void)setCurrentTaskName:(id)a3
{
}

- (NSString)currentTaskName
{
  return self->_currentTaskName;
}

- (FLOWSchemaFLOWState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FLOWSchemaFLOWState;
  v5 = [(FLOWSchemaFLOWState *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"currentTaskName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(FLOWSchemaFLOWState *)v5 setCurrentTaskName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"currentTaskType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(FLOWSchemaFLOWState *)v5 setCurrentTaskType:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"flowStateType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWState setFlowStateType:](v5, "setFlowStateType:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"flowStateReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[FLOWSchemaFLOWStateReason alloc] initWithDictionary:v11];
      [(FLOWSchemaFLOWState *)v5 setFlowStateReason:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"resolvedSlotName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      [(FLOWSchemaFLOWState *)v5 setResolvedSlotName:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"flowStateReasonDescription"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(FLOWSchemaFLOWState *)v5 setFlowStateReasonDescription:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWState)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWState *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWState *)self dictionaryRepresentation];
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
  if (self->_currentTaskName)
  {
    id v4 = [(FLOWSchemaFLOWState *)self currentTaskName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"currentTaskName"];
  }
  if (self->_currentTaskType)
  {
    v6 = [(FLOWSchemaFLOWState *)self currentTaskType];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"currentTaskType"];
  }
  if (self->_flowStateReason)
  {
    v8 = [(FLOWSchemaFLOWState *)self flowStateReason];
    objc_super v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"flowStateReason"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"flowStateReason"];
    }
  }
  if (self->_flowStateReasonDescription)
  {
    v11 = [(FLOWSchemaFLOWState *)self flowStateReasonDescription];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"flowStateReasonDescription"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v13 = [(FLOWSchemaFLOWState *)self flowStateType] - 1;
    if (v13 > 0xCF) {
      v14 = @"FLOWSTATETYPE_UNKNOWN";
    }
    else {
      v14 = off_1E5EAFBE8[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"flowStateType"];
  }
  if (self->_resolvedSlotName)
  {
    v15 = [(FLOWSchemaFLOWState *)self resolvedSlotName];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"resolvedSlotName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_currentTaskName hash];
  NSUInteger v4 = [(NSString *)self->_currentTaskType hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_flowStateType;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(FLOWSchemaFLOWStateReason *)self->_flowStateReason hash];
  NSUInteger v7 = [(NSString *)self->_resolvedSlotName hash];
  return v6 ^ v7 ^ [(NSString *)self->_flowStateReasonDescription hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  uint64_t v5 = [(FLOWSchemaFLOWState *)self currentTaskName];
  unint64_t v6 = [v4 currentTaskName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v7 = [(FLOWSchemaFLOWState *)self currentTaskName];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(FLOWSchemaFLOWState *)self currentTaskName];
    v10 = [v4 currentTaskName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWState *)self currentTaskType];
  unint64_t v6 = [v4 currentTaskType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v12 = [(FLOWSchemaFLOWState *)self currentTaskType];
  if (v12)
  {
    unsigned int v13 = (void *)v12;
    v14 = [(FLOWSchemaFLOWState *)self currentTaskType];
    v15 = [v4 currentTaskType];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    int flowStateType = self->_flowStateType;
    if (flowStateType != [v4 flowStateType]) {
      goto LABEL_30;
    }
  }
  uint64_t v5 = [(FLOWSchemaFLOWState *)self flowStateReason];
  unint64_t v6 = [v4 flowStateReason];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v18 = [(FLOWSchemaFLOWState *)self flowStateReason];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(FLOWSchemaFLOWState *)self flowStateReason];
    v21 = [v4 flowStateReason];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWState *)self resolvedSlotName];
  unint64_t v6 = [v4 resolvedSlotName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v23 = [(FLOWSchemaFLOWState *)self resolvedSlotName];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(FLOWSchemaFLOWState *)self resolvedSlotName];
    v26 = [v4 resolvedSlotName];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWState *)self flowStateReasonDescription];
  unint64_t v6 = [v4 flowStateReasonDescription];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v28 = [(FLOWSchemaFLOWState *)self flowStateReasonDescription];
    if (!v28)
    {

LABEL_33:
      BOOL v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    v30 = [(FLOWSchemaFLOWState *)self flowStateReasonDescription];
    v31 = [v4 flowStateReasonDescription];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_33;
    }
  }
  else
  {
LABEL_29:
  }
LABEL_30:
  BOOL v33 = 0;
LABEL_31:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  NSUInteger v4 = [(FLOWSchemaFLOWState *)self currentTaskName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(FLOWSchemaFLOWState *)self currentTaskType];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v6 = [(FLOWSchemaFLOWState *)self flowStateReason];

  if (v6)
  {
    uint64_t v7 = [(FLOWSchemaFLOWState *)self flowStateReason];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(FLOWSchemaFLOWState *)self resolvedSlotName];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  objc_super v9 = [(FLOWSchemaFLOWState *)self flowStateReasonDescription];

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWStateReadFrom(self, (uint64_t)a3);
}

- (void)deleteFlowStateReasonDescription
{
}

- (BOOL)hasFlowStateReasonDescription
{
  return self->_flowStateReasonDescription != 0;
}

- (void)deleteResolvedSlotName
{
}

- (BOOL)hasResolvedSlotName
{
  return self->_resolvedSlotName != 0;
}

- (void)deleteFlowStateReason
{
}

- (BOOL)hasFlowStateReason
{
  return self->_flowStateReason != 0;
}

- (void)deleteFlowStateType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasFlowStateType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFlowStateType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFlowStateType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int flowStateType = a3;
}

- (void)deleteCurrentTaskType
{
}

- (BOOL)hasCurrentTaskType
{
  return self->_currentTaskType != 0;
}

- (void)deleteCurrentTaskName
{
}

- (BOOL)hasCurrentTaskName
{
  return self->_currentTaskName != 0;
}

@end