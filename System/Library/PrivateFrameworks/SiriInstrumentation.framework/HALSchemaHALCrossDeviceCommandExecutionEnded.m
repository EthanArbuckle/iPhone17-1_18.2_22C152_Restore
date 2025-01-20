@interface HALSchemaHALCrossDeviceCommandExecutionEnded
- (BOOL)hasAction;
- (BOOL)hasActionResult;
- (BOOL)hasHomeKitTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HALSchemaHALCrossDeviceCommandExecutionEnded)initWithDictionary:(id)a3;
- (HALSchemaHALCrossDeviceCommandExecutionEnded)initWithJSON:(id)a3;
- (NSArray)selecteds;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)selectedAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)action;
- (int)actionResult;
- (int)homeKitTarget;
- (unint64_t)hash;
- (unint64_t)selectedCount;
- (void)addSelected:(id)a3;
- (void)clearSelected;
- (void)deleteAction;
- (void)deleteActionResult;
- (void)deleteHomeKitTarget;
- (void)setAction:(int)a3;
- (void)setActionResult:(int)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasActionResult:(BOOL)a3;
- (void)setHasHomeKitTarget:(BOOL)a3;
- (void)setHomeKitTarget:(int)a3;
- (void)setSelecteds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HALSchemaHALCrossDeviceCommandExecutionEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HALSchemaHALCrossDeviceCommandExecutionEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(HALSchemaHALCrossDeviceCommandExecutionEnded *)self selecteds];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(HALSchemaHALCrossDeviceCommandExecutionEnded *)self setSelecteds:v7];
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
}

- (int)homeKitTarget
{
  return self->_homeKitTarget;
}

- (int)actionResult
{
  return self->_actionResult;
}

- (int)action
{
  return self->_action;
}

- (void)setSelecteds:(id)a3
{
}

- (NSArray)selecteds
{
  return self->_selecteds;
}

- (HALSchemaHALCrossDeviceCommandExecutionEnded)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HALSchemaHALCrossDeviceCommandExecutionEnded;
  v5 = [(HALSchemaHALCrossDeviceCommandExecutionEnded *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"selected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [HALSchemaHALDevice alloc];
              v14 = -[HALSchemaHALDevice initWithDictionary:](v13, "initWithDictionary:", v12, (void)v20);
              [(HALSchemaHALCrossDeviceCommandExecutionEnded *)v5 addSelected:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"action", (void)v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALCrossDeviceCommandExecutionEnded setAction:](v5, "setAction:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"actionResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALCrossDeviceCommandExecutionEnded setActionResult:](v5, "setActionResult:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"homeKitTarget"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALCrossDeviceCommandExecutionEnded setHomeKitTarget:](v5, "setHomeKitTarget:", [v17 intValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (HALSchemaHALCrossDeviceCommandExecutionEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(HALSchemaHALCrossDeviceCommandExecutionEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HALSchemaHALCrossDeviceCommandExecutionEnded *)self dictionaryRepresentation];
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v5 = [(HALSchemaHALCrossDeviceCommandExecutionEnded *)self action] - 1;
    if (v5 > 0x14) {
      v6 = @"HALACTION_UNKNOWN";
    }
    else {
      v6 = off_1E5EB06A0[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"action"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  unsigned int v7 = [(HALSchemaHALCrossDeviceCommandExecutionEnded *)self actionResult] - 1;
  if (v7 > 2) {
    uint64_t v8 = @"HALACTIONRESULT_UNKNOWN";
  }
  else {
    uint64_t v8 = off_1E5EB0748[v7];
  }
  [v3 setObject:v8 forKeyedSubscript:@"actionResult"];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_13:
    unsigned int v9 = [(HALSchemaHALCrossDeviceCommandExecutionEnded *)self homeKitTarget] - 1;
    if (v9 > 6) {
      uint64_t v10 = @"HALHOMEKITTARGET_UNKNOWN";
    }
    else {
      uint64_t v10 = off_1E5EB0760[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"homeKitTarget"];
  }
LABEL_17:
  if ([(NSArray *)self->_selecteds count])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v12 = self->_selecteds;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          if (v17)
          {
            [v11 addObject:v17];
          }
          else
          {
            v18 = [MEMORY[0x1E4F1CA98] null];
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"selected"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v20);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_selecteds hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_action;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_actionResult;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_homeKitTarget;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(HALSchemaHALCrossDeviceCommandExecutionEnded *)self selecteds];
  uint64_t v6 = [v4 selecteds];
  unsigned int v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_20;
  }
  uint64_t v8 = [(HALSchemaHALCrossDeviceCommandExecutionEnded *)self selecteds];
  if (v8)
  {
    unsigned int v9 = (void *)v8;
    uint64_t v10 = [(HALSchemaHALCrossDeviceCommandExecutionEnded *)self selecteds];
    uint64_t v11 = [v4 selecteds];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $B585B9BC5008A5A5C2A2D99DD92E089F has = self->_has;
  unsigned int v14 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&has)
  {
    int action = self->_action;
    if (action != [v4 action]) {
      goto LABEL_20;
    }
    $B585B9BC5008A5A5C2A2D99DD92E089F has = self->_has;
    unsigned int v14 = v4[28];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_20;
  }
  if (v16)
  {
    int actionResult = self->_actionResult;
    if (actionResult == [v4 actionResult])
    {
      $B585B9BC5008A5A5C2A2D99DD92E089F has = self->_has;
      unsigned int v14 = v4[28];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_16:
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_20;
  }
  if (v18)
  {
    int homeKitTarget = self->_homeKitTarget;
    if (homeKitTarget != [v4 homeKitTarget]) {
      goto LABEL_20;
    }
  }
  BOOL v20 = 1;
LABEL_21:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_selecteds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if ((has & 4) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALCrossDeviceCommandExecutionEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteHomeKitTarget
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasHomeKitTarget:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHomeKitTarget
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHomeKitTarget:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int homeKitTarget = a3;
}

- (void)deleteActionResult
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasActionResult:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasActionResult
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setActionResult:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int actionResult = a3;
}

- (void)deleteAction
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int action = a3;
}

- (id)selectedAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_selecteds objectAtIndexedSubscript:a3];
}

- (unint64_t)selectedCount
{
  return [(NSArray *)self->_selecteds count];
}

- (void)addSelected:(id)a3
{
  id v4 = a3;
  selecteds = self->_selecteds;
  id v8 = v4;
  if (!selecteds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_selecteds;
    self->_selecteds = v6;

    id v4 = v8;
    selecteds = self->_selecteds;
  }
  [(NSArray *)selecteds addObject:v4];
}

- (void)clearSelected
{
}

@end