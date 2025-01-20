@interface SISchemaUIStateTransition
- (BOOL)hasCurrentState;
- (BOOL)hasDismissalReason;
- (BOOL)hasDismissed;
- (BOOL)hasPresenting;
- (BOOL)hasPreviousState;
- (BOOL)hasSiriPresentationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUIStateDismissed)dismissed;
- (SISchemaUIStatePresenting)presenting;
- (SISchemaUIStateTransition)initWithDictionary:(id)a3;
- (SISchemaUIStateTransition)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)currentState;
- (int)dismissalReason;
- (int)previousState;
- (int)siriPresentationType;
- (unint64_t)hash;
- (unint64_t)whichPresentationstate;
- (void)deleteCurrentState;
- (void)deleteDismissalReason;
- (void)deleteDismissed;
- (void)deletePresenting;
- (void)deletePreviousState;
- (void)deleteSiriPresentationType;
- (void)setCurrentState:(int)a3;
- (void)setDismissalReason:(int)a3;
- (void)setDismissed:(id)a3;
- (void)setHasCurrentState:(BOOL)a3;
- (void)setHasDismissalReason:(BOOL)a3;
- (void)setHasDismissed:(BOOL)a3;
- (void)setHasPresenting:(BOOL)a3;
- (void)setHasPreviousState:(BOOL)a3;
- (void)setHasSiriPresentationType:(BOOL)a3;
- (void)setPresenting:(id)a3;
- (void)setPreviousState:(int)a3;
- (void)setSiriPresentationType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUIStateTransition

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaUIStateTransition;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaUIStateTransition *)self presenting];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaUIStateTransition *)self deletePresenting];
  }
  v9 = [(SISchemaUIStateTransition *)self dismissed];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaUIStateTransition *)self deleteDismissed];
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
  objc_storeStrong((id *)&self->_dismissed, 0);
  objc_storeStrong((id *)&self->_presenting, 0);
}

- (void)setHasDismissed:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasDismissed
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasPresenting:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (BOOL)hasPresenting
{
  return *((unsigned char *)&self->_has + 1);
}

- (int)dismissalReason
{
  return self->_dismissalReason;
}

- (int)siriPresentationType
{
  return self->_siriPresentationType;
}

- (int)previousState
{
  return self->_previousState;
}

- (int)currentState
{
  return self->_currentState;
}

- (unint64_t)whichPresentationstate
{
  return self->_whichPresentationstate;
}

- (SISchemaUIStateTransition)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SISchemaUIStateTransition;
  v5 = [(SISchemaUIStateTransition *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"currentState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUIStateTransition setCurrentState:](v5, "setCurrentState:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"previousState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUIStateTransition setPreviousState:](v5, "setPreviousState:", [v7 intValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"siriPresentationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUIStateTransition setSiriPresentationType:](v5, "setSiriPresentationType:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"dismissalReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUIStateTransition setDismissalReason:](v5, "setDismissalReason:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"presenting"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUIStatePresenting alloc] initWithDictionary:v10];
      [(SISchemaUIStateTransition *)v5 setPresenting:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"dismissed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = [[SISchemaUIStateDismissed alloc] initWithDictionary:v12];
      [(SISchemaUIStateTransition *)v5 setDismissed:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (SISchemaUIStateTransition)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUIStateTransition *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUIStateTransition *)self dictionaryRepresentation];
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
    unsigned int v5 = [(SISchemaUIStateTransition *)self currentState] - 1;
    if (v5 > 4) {
      v6 = @"SIRIUISTATE_UNKNOWN_SIRI_UI_STATE";
    }
    else {
      v6 = off_1E5EB8BC8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"currentState"];
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    unsigned int v7 = [(SISchemaUIStateTransition *)self dismissalReason] - 1;
    if (v7 > 0x31) {
      int v8 = @"DISMISSALREASON_UNKNOWN_DISMISSAL_REASON";
    }
    else {
      int v8 = off_1E5EB8A38[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"dismissalReason"];
  }
  if (self->_dismissed)
  {
    v9 = [(SISchemaUIStateTransition *)self dismissed];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"dismissed"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"dismissed"];
    }
  }
  if (self->_presenting)
  {
    v12 = [(SISchemaUIStateTransition *)self presenting];
    objc_super v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"presenting"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"presenting"];
    }
  }
  char v15 = (char)self->_has;
  if ((v15 & 2) != 0)
  {
    unsigned int v16 = [(SISchemaUIStateTransition *)self previousState] - 1;
    if (v16 > 4) {
      v17 = @"SIRIUISTATE_UNKNOWN_SIRI_UI_STATE";
    }
    else {
      v17 = off_1E5EB8BC8[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"previousState"];
    char v15 = (char)self->_has;
  }
  if ((v15 & 4) != 0)
  {
    unsigned int v18 = [(SISchemaUIStateTransition *)self siriPresentationType] - 1;
    if (v18 > 6) {
      v19 = @"SIRIPRESENTATIONTYPE_UNKNOWN_SIRI_PRESENTATION_TYPE";
    }
    else {
      v19 = off_1E5EB8BF0[v18];
    }
    [v3 setObject:v19 forKeyedSubscript:@"siriPresentationType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_currentState;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_previousState;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_siriPresentationType;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_dismissalReason;
LABEL_10:
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(SISchemaUIStatePresenting *)self->_presenting hash];
  return v7 ^ [(SISchemaUIStateDismissed *)self->_dismissed hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  unint64_t whichPresentationstate = self->_whichPresentationstate;
  if (whichPresentationstate != [v4 whichPresentationstate]) {
    goto LABEL_28;
  }
  $31C648D173A714BF8700D96CFC0F0632 has = self->_has;
  unsigned int v7 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v7 & 1)) {
    goto LABEL_28;
  }
  if (*(unsigned char *)&has)
  {
    int currentState = self->_currentState;
    if (currentState != [v4 currentState]) {
      goto LABEL_28;
    }
    $31C648D173A714BF8700D96CFC0F0632 has = self->_has;
    unsigned int v7 = v4[40];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v7 >> 1) & 1))
  {
    if (v9)
    {
      int previousState = self->_previousState;
      if (previousState != [v4 previousState]) {
        goto LABEL_28;
      }
      $31C648D173A714BF8700D96CFC0F0632 has = self->_has;
      unsigned int v7 = v4[40];
    }
    int v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v7 >> 2) & 1))
    {
      if (v11)
      {
        int siriPresentationType = self->_siriPresentationType;
        if (siriPresentationType != [v4 siriPresentationType]) {
          goto LABEL_28;
        }
        $31C648D173A714BF8700D96CFC0F0632 has = self->_has;
        unsigned int v7 = v4[40];
      }
      int v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 != ((v7 >> 3) & 1)) {
        goto LABEL_28;
      }
      if (v13)
      {
        int dismissalReason = self->_dismissalReason;
        if (dismissalReason != [v4 dismissalReason]) {
          goto LABEL_28;
        }
      }
      char v15 = [(SISchemaUIStateTransition *)self presenting];
      unsigned int v16 = [v4 presenting];
      if ((v15 == 0) == (v16 != 0)) {
        goto LABEL_27;
      }
      uint64_t v17 = [(SISchemaUIStateTransition *)self presenting];
      if (v17)
      {
        unsigned int v18 = (void *)v17;
        v19 = [(SISchemaUIStateTransition *)self presenting];
        v20 = [v4 presenting];
        int v21 = [v19 isEqual:v20];

        if (!v21) {
          goto LABEL_28;
        }
      }
      else
      {
      }
      char v15 = [(SISchemaUIStateTransition *)self dismissed];
      unsigned int v16 = [v4 dismissed];
      if ((v15 == 0) != (v16 != 0))
      {
        uint64_t v22 = [(SISchemaUIStateTransition *)self dismissed];
        if (!v22)
        {

LABEL_31:
          BOOL v27 = 1;
          goto LABEL_29;
        }
        v23 = (void *)v22;
        v24 = [(SISchemaUIStateTransition *)self dismissed];
        v25 = [v4 dismissed];
        char v26 = [v24 isEqual:v25];

        if (v26) {
          goto LABEL_31;
        }
      }
      else
      {
LABEL_27:
      }
    }
  }
LABEL_28:
  BOOL v27 = 0;
LABEL_29:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
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
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  uint64_t v5 = [(SISchemaUIStateTransition *)self presenting];

  if (v5)
  {
    uint64_t v6 = [(SISchemaUIStateTransition *)self presenting];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v7 = [(SISchemaUIStateTransition *)self dismissed];

  int v8 = v10;
  if (v7)
  {
    int v9 = [(SISchemaUIStateTransition *)self dismissed];
    PBDataWriterWriteSubmessage();

    int v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUIStateTransitionReadFrom(self, (uint64_t)a3);
}

- (void)deleteDismissed
{
  if (self->_whichPresentationstate == 6)
  {
    self->_unint64_t whichPresentationstate = 0;
    self->_dismissed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUIStateDismissed)dismissed
{
  if (self->_whichPresentationstate == 6) {
    v2 = self->_dismissed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDismissed:(id)a3
{
  uint64_t v4 = (SISchemaUIStateDismissed *)a3;
  presenting = self->_presenting;
  self->_presenting = 0;

  unint64_t v6 = 6;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichPresentationstate = v6;
  dismissed = self->_dismissed;
  self->_dismissed = v4;
}

- (void)deletePresenting
{
  if (self->_whichPresentationstate == 5)
  {
    self->_unint64_t whichPresentationstate = 0;
    self->_presenting = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaUIStatePresenting)presenting
{
  if (self->_whichPresentationstate == 5) {
    v2 = self->_presenting;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPresenting:(id)a3
{
  uint64_t v4 = (SISchemaUIStatePresenting *)a3;
  dismissed = self->_dismissed;
  self->_dismissed = 0;

  unint64_t v6 = 5;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichPresentationstate = v6;
  presenting = self->_presenting;
  self->_presenting = v4;
}

- (void)deleteDismissalReason
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasDismissalReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDismissalReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDismissalReason:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int dismissalReason = a3;
}

- (void)deleteSiriPresentationType
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSiriPresentationType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSiriPresentationType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSiriPresentationType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int siriPresentationType = a3;
}

- (void)deletePreviousState
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPreviousState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreviousState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPreviousState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int previousState = a3;
}

- (void)deleteCurrentState
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCurrentState:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCurrentState
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCurrentState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int currentState = a3;
}

@end