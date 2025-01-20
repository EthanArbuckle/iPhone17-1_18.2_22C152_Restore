@interface FLOWSchemaFLOWHomeAutomationCommand
- (BOOL)hasCommandDuration;
- (BOOL)hasCommandErrorReason;
- (BOOL)hasCommandId;
- (BOOL)hasCommandOutcome;
- (BOOL)hasCommandType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWHomeAutomationCommand)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWHomeAutomationCommand)initWithJSON:(id)a3;
- (NSArray)homeAutomationRequests;
- (NSData)jsonData;
- (SISchemaUUID)commandId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)homeAutomationRequestsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)commandErrorReason;
- (int)commandOutcome;
- (int)commandType;
- (unint64_t)hash;
- (unint64_t)homeAutomationRequestsCount;
- (unsigned)commandDuration;
- (void)addHomeAutomationRequests:(id)a3;
- (void)clearHomeAutomationRequests;
- (void)deleteCommandDuration;
- (void)deleteCommandErrorReason;
- (void)deleteCommandId;
- (void)deleteCommandOutcome;
- (void)deleteCommandType;
- (void)setCommandDuration:(unsigned int)a3;
- (void)setCommandErrorReason:(int)a3;
- (void)setCommandId:(id)a3;
- (void)setCommandOutcome:(int)a3;
- (void)setCommandType:(int)a3;
- (void)setHasCommandDuration:(BOOL)a3;
- (void)setHasCommandErrorReason:(BOOL)a3;
- (void)setHasCommandId:(BOOL)a3;
- (void)setHasCommandOutcome:(BOOL)a3;
- (void)setHasCommandType:(BOOL)a3;
- (void)setHomeAutomationRequests:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWHomeAutomationCommand

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWSchemaFLOWHomeAutomationCommand;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWHomeAutomationCommand *)self commandId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWHomeAutomationCommand *)self deleteCommandId];
  }
  v9 = [(FLOWSchemaFLOWHomeAutomationCommand *)self homeAutomationRequests];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(FLOWSchemaFLOWHomeAutomationCommand *)self setHomeAutomationRequests:v10];

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
  objc_storeStrong((id *)&self->_homeAutomationRequests, 0);
  objc_storeStrong((id *)&self->_commandId, 0);
}

- (void)setHasCommandId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHomeAutomationRequests:(id)a3
{
}

- (NSArray)homeAutomationRequests
{
  return self->_homeAutomationRequests;
}

- (unsigned)commandDuration
{
  return self->_commandDuration;
}

- (int)commandErrorReason
{
  return self->_commandErrorReason;
}

- (int)commandOutcome
{
  return self->_commandOutcome;
}

- (int)commandType
{
  return self->_commandType;
}

- (void)setCommandId:(id)a3
{
}

- (SISchemaUUID)commandId
{
  return self->_commandId;
}

- (FLOWSchemaFLOWHomeAutomationCommand)initWithDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FLOWSchemaFLOWHomeAutomationCommand;
  v5 = [(FLOWSchemaFLOWHomeAutomationCommand *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"commandId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWHomeAutomationCommand *)v5 setCommandId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"commandType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationCommand setCommandType:](v5, "setCommandType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"commandOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationCommand setCommandOutcome:](v5, "setCommandOutcome:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"commandErrorReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationCommand setCommandErrorReason:](v5, "setCommandErrorReason:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"commandDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeAutomationCommand setCommandDuration:](v5, "setCommandDuration:", [v11 unsignedIntValue]);
    }
    objc_super v12 = [v4 objectForKeyedSubscript:@"homeAutomationRequests"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v11;
      v23 = v10;
      v24 = v9;
      v25 = v6;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [[FLOWSchemaFLOWHomeAutomationRequest alloc] initWithDictionary:v18];
              [(FLOWSchemaFLOWHomeAutomationCommand *)v5 addHomeAutomationRequests:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v15);
      }

      v6 = v25;
      v10 = v23;
      v9 = v24;
      v11 = v22;
    }
    v20 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWHomeAutomationCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWHomeAutomationCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWHomeAutomationCommand *)self dictionaryRepresentation];
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
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeAutomationCommand commandDuration](self, "commandDuration"));
    [v3 setObject:v5 forKeyedSubscript:@"commandDuration"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    unsigned int v6 = [(FLOWSchemaFLOWHomeAutomationCommand *)self commandErrorReason] - 1;
    if (v6 > 9) {
      uint64_t v7 = @"FLOWHOMEAUTOMATIONCOMMANDERRORREASON_UNKOWN";
    }
    else {
      uint64_t v7 = off_1E5EAEC08[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"commandErrorReason"];
  }
  if (self->_commandId)
  {
    int v8 = [(FLOWSchemaFLOWHomeAutomationCommand *)self commandId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"commandId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"commandId"];
    }
  }
  char v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    unsigned int v12 = [(FLOWSchemaFLOWHomeAutomationCommand *)self commandOutcome] - 1;
    if (v12 > 2) {
      id v13 = @"FLOWHOMEAUTOMATIONOUTCOME_UNKOWN";
    }
    else {
      id v13 = off_1E5EAEC58[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"commandOutcome"];
    char v11 = (char)self->_has;
  }
  if (v11)
  {
    unsigned int v14 = [(FLOWSchemaFLOWHomeAutomationCommand *)self commandType] - 1;
    if (v14 > 3) {
      uint64_t v15 = @"FLOWHOMEAUTOMATIONCOMMANDTYPE_UNKNOWN";
    }
    else {
      uint64_t v15 = off_1E5EAEC70[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"commandType"];
  }
  if ([(NSArray *)self->_homeAutomationRequests count])
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v17 = self->_homeAutomationRequests;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "dictionaryRepresentation", (void)v25);
          if (v22)
          {
            [v16 addObject:v22];
          }
          else
          {
            v23 = [MEMORY[0x1E4F1CA98] null];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"homeAutomationRequests"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v25);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_commandId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_commandType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_commandOutcome;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSArray *)self->_homeAutomationRequests hash];
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_commandErrorReason;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_commandDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSArray *)self->_homeAutomationRequests hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(FLOWSchemaFLOWHomeAutomationCommand *)self commandId];
  uint64_t v6 = [v4 commandId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(FLOWSchemaFLOWHomeAutomationCommand *)self commandId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(FLOWSchemaFLOWHomeAutomationCommand *)self commandId];
    v10 = [v4 commandId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  $A809843C742EF03E8E450DB41C62EA87 has = self->_has;
  unsigned int v13 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_27;
  }
  if (*(unsigned char *)&has)
  {
    int commandType = self->_commandType;
    if (commandType != [v4 commandType]) {
      goto LABEL_27;
    }
    $A809843C742EF03E8E450DB41C62EA87 has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_27;
  }
  if (v15)
  {
    int commandOutcome = self->_commandOutcome;
    if (commandOutcome != [v4 commandOutcome]) {
      goto LABEL_27;
    }
    $A809843C742EF03E8E450DB41C62EA87 has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1)) {
    goto LABEL_27;
  }
  if (v17)
  {
    int commandErrorReason = self->_commandErrorReason;
    if (commandErrorReason != [v4 commandErrorReason]) {
      goto LABEL_27;
    }
    $A809843C742EF03E8E450DB41C62EA87 has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1)) {
    goto LABEL_27;
  }
  if (v19)
  {
    unsigned int commandDuration = self->_commandDuration;
    if (commandDuration != [v4 commandDuration]) {
      goto LABEL_27;
    }
  }
  uint64_t v5 = [(FLOWSchemaFLOWHomeAutomationCommand *)self homeAutomationRequests];
  uint64_t v6 = [v4 homeAutomationRequests];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v21 = [(FLOWSchemaFLOWHomeAutomationCommand *)self homeAutomationRequests];
  if (!v21)
  {

LABEL_30:
    BOOL v26 = 1;
    goto LABEL_28;
  }
  v22 = (void *)v21;
  v23 = [(FLOWSchemaFLOWHomeAutomationCommand *)self homeAutomationRequests];
  v24 = [v4 homeAutomationRequests];
  char v25 = [v23 isEqual:v24];

  if (v25) {
    goto LABEL_30;
  }
LABEL_27:
  BOOL v26 = 0;
LABEL_28:

  return v26;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(FLOWSchemaFLOWHomeAutomationCommand *)self commandId];

  if (v5)
  {
    uint64_t v6 = [(FLOWSchemaFLOWHomeAutomationCommand *)self commandId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v8 = self->_homeAutomationRequests;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeAutomationCommandReadFrom(self, (uint64_t)a3);
}

- (id)homeAutomationRequestsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_homeAutomationRequests objectAtIndexedSubscript:a3];
}

- (unint64_t)homeAutomationRequestsCount
{
  return [(NSArray *)self->_homeAutomationRequests count];
}

- (void)addHomeAutomationRequests:(id)a3
{
  id v4 = a3;
  homeAutomationRequests = self->_homeAutomationRequests;
  id v8 = v4;
  if (!homeAutomationRequests)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_homeAutomationRequests;
    self->_homeAutomationRequests = v6;

    id v4 = v8;
    homeAutomationRequests = self->_homeAutomationRequests;
  }
  [(NSArray *)homeAutomationRequests addObject:v4];
}

- (void)clearHomeAutomationRequests
{
}

- (void)deleteCommandDuration
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasCommandDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCommandDuration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCommandDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int commandDuration = a3;
}

- (void)deleteCommandErrorReason
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCommandErrorReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCommandErrorReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCommandErrorReason:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int commandErrorReason = a3;
}

- (void)deleteCommandOutcome
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCommandOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCommandOutcome
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCommandOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int commandOutcome = a3;
}

- (void)deleteCommandType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCommandType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCommandType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCommandType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int commandType = a3;
}

- (void)deleteCommandId
{
}

- (BOOL)hasCommandId
{
  return self->_commandId != 0;
}

@end