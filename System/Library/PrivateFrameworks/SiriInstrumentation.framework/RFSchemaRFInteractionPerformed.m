@interface RFSchemaRFInteractionPerformed
- (BOOL)hasActionName;
- (BOOL)hasCommandType;
- (BOOL)hasComponentIndex;
- (BOOL)hasComponentName;
- (BOOL)hasUserInteraction;
- (BOOL)hasVisualComponent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)actionName;
- (NSString)componentIndex;
- (NSString)componentName;
- (RFSchemaRFInteractionPerformed)initWithDictionary:(id)a3;
- (RFSchemaRFInteractionPerformed)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)commandType;
- (int)userInteraction;
- (int)visualComponent;
- (unint64_t)hash;
- (void)deleteActionName;
- (void)deleteCommandType;
- (void)deleteComponentIndex;
- (void)deleteComponentName;
- (void)deleteUserInteraction;
- (void)deleteVisualComponent;
- (void)setActionName:(id)a3;
- (void)setCommandType:(int)a3;
- (void)setComponentIndex:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setHasActionName:(BOOL)a3;
- (void)setHasCommandType:(BOOL)a3;
- (void)setHasComponentIndex:(BOOL)a3;
- (void)setHasComponentName:(BOOL)a3;
- (void)setHasUserInteraction:(BOOL)a3;
- (void)setHasVisualComponent:(BOOL)a3;
- (void)setUserInteraction:(int)a3;
- (void)setVisualComponent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RFSchemaRFInteractionPerformed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentIndex, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
}

- (void)setHasComponentIndex:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasComponentName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasActionName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setComponentIndex:(id)a3
{
}

- (NSString)componentIndex
{
  return self->_componentIndex;
}

- (int)commandType
{
  return self->_commandType;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentName
{
  return self->_componentName;
}

- (int)visualComponent
{
  return self->_visualComponent;
}

- (int)userInteraction
{
  return self->_userInteraction;
}

- (void)setActionName:(id)a3
{
}

- (NSString)actionName
{
  return self->_actionName;
}

- (RFSchemaRFInteractionPerformed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RFSchemaRFInteractionPerformed;
  v5 = [(RFSchemaRFInteractionPerformed *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"actionName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(RFSchemaRFInteractionPerformed *)v5 setActionName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"userInteraction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RFSchemaRFInteractionPerformed setUserInteraction:](v5, "setUserInteraction:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"visualComponent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RFSchemaRFInteractionPerformed setVisualComponent:](v5, "setVisualComponent:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"componentName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(RFSchemaRFInteractionPerformed *)v5 setComponentName:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"commandType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RFSchemaRFInteractionPerformed setCommandType:](v5, "setCommandType:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"componentIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      [(RFSchemaRFInteractionPerformed *)v5 setComponentIndex:v14];
    }
    v15 = v5;
  }
  return v5;
}

- (RFSchemaRFInteractionPerformed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RFSchemaRFInteractionPerformed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RFSchemaRFInteractionPerformed *)self dictionaryRepresentation];
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
  if (self->_actionName)
  {
    id v4 = [(RFSchemaRFInteractionPerformed *)self actionName];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"actionName"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v6 = [(RFSchemaRFInteractionPerformed *)self commandType] - 1;
    if (v6 > 8) {
      uint64_t v7 = @"RFCOMMANDTYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EB4638[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"commandType"];
  }
  if (self->_componentIndex)
  {
    v8 = [(RFSchemaRFInteractionPerformed *)self componentIndex];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"componentIndex"];
  }
  if (self->_componentName)
  {
    v10 = [(RFSchemaRFInteractionPerformed *)self componentName];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"componentName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v13 = [(RFSchemaRFInteractionPerformed *)self userInteraction] - 2;
    if (v13 > 5) {
      v14 = @"RFINTERACTION_UNKNOWN";
    }
    else {
      v14 = off_1E5EB4680[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"userInteraction"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v15 = [(RFSchemaRFInteractionPerformed *)self visualComponent] - 1;
    if (v15 > 0x43) {
      v16 = @"RFCOMPONENT_UNKNOWN";
    }
    else {
      v16 = off_1E5EB46B0[v15];
    }
    [v3 setObject:v16 forKeyedSubscript:@"visualComponent"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_actionName hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_userInteraction;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_visualComponent;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_componentName hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_commandType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_componentIndex hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(RFSchemaRFInteractionPerformed *)self actionName];
  NSUInteger v6 = [v4 actionName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(RFSchemaRFInteractionPerformed *)self actionName];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(RFSchemaRFInteractionPerformed *)self actionName];
    v10 = [v4 actionName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  $4CD892FBF83EF65D204AED565E604B1A has = self->_has;
  unsigned int v13 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&has)
  {
    int userInteraction = self->_userInteraction;
    if (userInteraction != [v4 userInteraction]) {
      goto LABEL_27;
    }
    $4CD892FBF83EF65D204AED565E604B1A has = self->_has;
    unsigned int v13 = v4[48];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_27;
  }
  if (v15)
  {
    int visualComponent = self->_visualComponent;
    if (visualComponent != [v4 visualComponent]) {
      goto LABEL_27;
    }
  }
  uint64_t v5 = [(RFSchemaRFInteractionPerformed *)self componentName];
  NSUInteger v6 = [v4 componentName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(RFSchemaRFInteractionPerformed *)self componentName];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(RFSchemaRFInteractionPerformed *)self componentName];
    v20 = [v4 componentName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  int v22 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v22 != ((v4[48] >> 2) & 1)) {
    goto LABEL_27;
  }
  if (v22)
  {
    int commandType = self->_commandType;
    if (commandType != [v4 commandType]) {
      goto LABEL_27;
    }
  }
  uint64_t v5 = [(RFSchemaRFInteractionPerformed *)self componentIndex];
  NSUInteger v6 = [v4 componentIndex];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v24 = [(RFSchemaRFInteractionPerformed *)self componentIndex];
  if (!v24)
  {

LABEL_30:
    BOOL v29 = 1;
    goto LABEL_28;
  }
  v25 = (void *)v24;
  v26 = [(RFSchemaRFInteractionPerformed *)self componentIndex];
  v27 = [v4 componentIndex];
  char v28 = [v26 isEqual:v27];

  if (v28) {
    goto LABEL_30;
  }
LABEL_27:
  BOOL v29 = 0;
LABEL_28:

  return v29;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(RFSchemaRFInteractionPerformed *)self actionName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v6 = [(RFSchemaRFInteractionPerformed *)self componentName];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(RFSchemaRFInteractionPerformed *)self componentIndex];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return RFSchemaRFInteractionPerformedReadFrom(self, (uint64_t)a3);
}

- (void)deleteComponentIndex
{
}

- (BOOL)hasComponentIndex
{
  return self->_componentIndex != 0;
}

- (void)deleteCommandType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCommandType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCommandType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCommandType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int commandType = a3;
}

- (void)deleteComponentName
{
}

- (BOOL)hasComponentName
{
  return self->_componentName != 0;
}

- (void)deleteVisualComponent
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasVisualComponent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVisualComponent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVisualComponent:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int visualComponent = a3;
}

- (void)deleteUserInteraction
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasUserInteraction:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserInteraction
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUserInteraction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int userInteraction = a3;
}

- (void)deleteActionName
{
}

- (BOOL)hasActionName
{
  return self->_actionName != 0;
}

@end