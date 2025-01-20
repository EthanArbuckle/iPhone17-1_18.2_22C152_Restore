@interface FLSchemaFLInteractionDonationEnded
- (BOOL)hasAbsoluteTime;
- (BOOL)hasActionStatementId;
- (BOOL)hasDonationTime;
- (BOOL)hasDonationTrigger;
- (BOOL)hasIfSessionId;
- (BOOL)hasTuple;
- (BOOL)hasWasTupleDonated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasTupleDonated;
- (FLSchemaFLInteractionDonationEnded)initWithDictionary:(id)a3;
- (FLSchemaFLInteractionDonationEnded)initWithJSON:(id)a3;
- (FLSchemaFLTupleInteraction)tuple;
- (NSArray)candidates;
- (NSData)jsonData;
- (SISchemaUUID)ifSessionId;
- (double)absoluteTime;
- (double)donationTime;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)candidatesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)donationTrigger;
- (unint64_t)candidatesCount;
- (unint64_t)hash;
- (unsigned)actionStatementId;
- (void)addCandidates:(id)a3;
- (void)clearCandidates;
- (void)deleteAbsoluteTime;
- (void)deleteActionStatementId;
- (void)deleteDonationTime;
- (void)deleteDonationTrigger;
- (void)deleteIfSessionId;
- (void)deleteTuple;
- (void)deleteWasTupleDonated;
- (void)setAbsoluteTime:(double)a3;
- (void)setActionStatementId:(unsigned int)a3;
- (void)setCandidates:(id)a3;
- (void)setDonationTime:(double)a3;
- (void)setDonationTrigger:(int)a3;
- (void)setHasAbsoluteTime:(BOOL)a3;
- (void)setHasActionStatementId:(BOOL)a3;
- (void)setHasDonationTime:(BOOL)a3;
- (void)setHasDonationTrigger:(BOOL)a3;
- (void)setHasIfSessionId:(BOOL)a3;
- (void)setHasTuple:(BOOL)a3;
- (void)setHasWasTupleDonated:(BOOL)a3;
- (void)setIfSessionId:(id)a3;
- (void)setTuple:(id)a3;
- (void)setWasTupleDonated:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLSchemaFLInteractionDonationEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FLSchemaFLInteractionDonationEnded;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(FLSchemaFLInteractionDonationEnded *)self ifSessionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLSchemaFLInteractionDonationEnded *)self deleteIfSessionId];
  }
  v9 = [(FLSchemaFLInteractionDonationEnded *)self tuple];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLSchemaFLInteractionDonationEnded *)self deleteTuple];
  }
  v12 = [(FLSchemaFLInteractionDonationEnded *)self candidates];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(FLSchemaFLInteractionDonationEnded *)self setCandidates:v13];

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
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_tuple, 0);
  objc_storeStrong((id *)&self->_ifSessionId, 0);
}

- (void)setHasTuple:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasIfSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setCandidates:(id)a3
{
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setTuple:(id)a3
{
}

- (FLSchemaFLTupleInteraction)tuple
{
  return self->_tuple;
}

- (BOOL)wasTupleDonated
{
  return self->_wasTupleDonated;
}

- (int)donationTrigger
{
  return self->_donationTrigger;
}

- (unsigned)actionStatementId
{
  return self->_actionStatementId;
}

- (void)setIfSessionId:(id)a3
{
}

- (SISchemaUUID)ifSessionId
{
  return self->_ifSessionId;
}

- (double)donationTime
{
  return self->_donationTime;
}

- (double)absoluteTime
{
  return self->_absoluteTime;
}

- (FLSchemaFLInteractionDonationEnded)initWithDictionary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)FLSchemaFLInteractionDonationEnded;
  v5 = [(FLSchemaFLInteractionDonationEnded *)&v38 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"absoluteTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[FLSchemaFLInteractionDonationEnded setAbsoluteTime:](v5, "setAbsoluteTime:");
    }
    v7 = [v4 objectForKeyedSubscript:@"donationTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[FLSchemaFLInteractionDonationEnded setDonationTime:](v5, "setDonationTime:");
    }
    int v8 = [v4 objectForKeyedSubscript:@"ifSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(FLSchemaFLInteractionDonationEnded *)v5 setIfSessionId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"actionStatementId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLInteractionDonationEnded setActionStatementId:](v5, "setActionStatementId:", [v10 unsignedIntValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"donationTrigger"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLInteractionDonationEnded setDonationTrigger:](v5, "setDonationTrigger:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"wasTupleDonated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLInteractionDonationEnded setWasTupleDonated:](v5, "setWasTupleDonated:", [v12 BOOLValue]);
    }
    v33 = v12;
    v13 = [v4 objectForKeyedSubscript:@"tuple"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [[FLSchemaFLTupleInteraction alloc] initWithDictionary:v13];
      objc_super v15 = v13;
      v16 = v11;
      v17 = v14;
      [(FLSchemaFLInteractionDonationEnded *)v5 setTuple:v14];

      int v11 = v16;
      v13 = v15;
    }
    v18 = [v4 objectForKeyedSubscript:@"candidates"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = v13;
      v29 = v11;
      v30 = v10;
      v31 = v7;
      v32 = v6;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v25 = [[FLSchemaFLCandidateInteraction alloc] initWithDictionary:v24];
              [(FLSchemaFLInteractionDonationEnded *)v5 addCandidates:v25];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v21);
      }

      v7 = v31;
      v6 = v32;
      v10 = v30;
      v13 = v28;
      int v11 = v29;
    }
    v26 = v5;
  }
  return v5;
}

- (FLSchemaFLInteractionDonationEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLSchemaFLInteractionDonationEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLSchemaFLInteractionDonationEnded *)self dictionaryRepresentation];
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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = NSNumber;
    [(FLSchemaFLInteractionDonationEnded *)self absoluteTime];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"absoluteTime"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLSchemaFLInteractionDonationEnded actionStatementId](self, "actionStatementId"));
    [v3 setObject:v7 forKeyedSubscript:@"actionStatementId"];
  }
  if ([(NSArray *)self->_candidates count])
  {
    int v8 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v9 = self->_candidates;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            objc_super v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"candidates"];
  }
  char v16 = (char)self->_has;
  if ((v16 & 2) != 0)
  {
    v17 = NSNumber;
    [(FLSchemaFLInteractionDonationEnded *)self donationTime];
    v18 = objc_msgSend(v17, "numberWithDouble:");
    [v3 setObject:v18 forKeyedSubscript:@"donationTime"];

    char v16 = (char)self->_has;
  }
  if ((v16 & 8) != 0)
  {
    unsigned int v19 = [(FLSchemaFLInteractionDonationEnded *)self donationTrigger] - 1;
    if (v19 > 2) {
      uint64_t v20 = @"FLTRIGGER_UNKNOWN";
    }
    else {
      uint64_t v20 = off_1E5EC04D8[v19];
    }
    [v3 setObject:v20 forKeyedSubscript:@"donationTrigger"];
  }
  if (self->_ifSessionId)
  {
    uint64_t v21 = [(FLSchemaFLInteractionDonationEnded *)self ifSessionId];
    uint64_t v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"ifSessionId"];
    }
    else
    {
      v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"ifSessionId"];
    }
  }
  if (self->_tuple)
  {
    uint64_t v24 = [(FLSchemaFLInteractionDonationEnded *)self tuple];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"tuple"];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"tuple"];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v27 = objc_msgSend(NSNumber, "numberWithBool:", -[FLSchemaFLInteractionDonationEnded wasTupleDonated](self, "wasTupleDonated"));
    [v3 setObject:v27 forKeyedSubscript:@"wasTupleDonated"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double absoluteTime = self->_absoluteTime;
    double v6 = -absoluteTime;
    if (absoluteTime >= 0.0) {
      double v6 = self->_absoluteTime;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    double donationTime = self->_donationTime;
    double v11 = -donationTime;
    if (donationTime >= 0.0) {
      double v11 = self->_donationTime;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v14 = [(SISchemaUUID *)self->_ifSessionId hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_19;
    }
LABEL_22:
    uint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_20;
    }
LABEL_23:
    uint64_t v17 = 0;
    goto LABEL_24;
  }
  uint64_t v15 = 2654435761 * self->_actionStatementId;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v16 = 2654435761 * self->_donationTrigger;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_23;
  }
LABEL_20:
  uint64_t v17 = 2654435761 * self->_wasTupleDonated;
LABEL_24:
  unint64_t v18 = v9 ^ v4 ^ v15 ^ v16 ^ v17 ^ v14;
  unint64_t v19 = [(FLSchemaFLTupleInteraction *)self->_tuple hash];
  return v18 ^ v19 ^ [(NSArray *)self->_candidates hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  $58D47CF7ED429C729BAD667AF3A171CD has = self->_has;
  unsigned int v6 = v4[64];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_35;
  }
  if (*(unsigned char *)&has)
  {
    double absoluteTime = self->_absoluteTime;
    [v4 absoluteTime];
    if (absoluteTime != v8) {
      goto LABEL_35;
    }
    $58D47CF7ED429C729BAD667AF3A171CD has = self->_has;
    unsigned int v6 = v4[64];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_35;
  }
  if (v9)
  {
    double donationTime = self->_donationTime;
    [v4 donationTime];
    if (donationTime != v11) {
      goto LABEL_35;
    }
  }
  long double v12 = [(FLSchemaFLInteractionDonationEnded *)self ifSessionId];
  double v13 = [v4 ifSessionId];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_34;
  }
  uint64_t v14 = [(FLSchemaFLInteractionDonationEnded *)self ifSessionId];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = [(FLSchemaFLInteractionDonationEnded *)self ifSessionId];
    uint64_t v17 = [v4 ifSessionId];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  $58D47CF7ED429C729BAD667AF3A171CD v19 = self->_has;
  int v20 = (*(unsigned int *)&v19 >> 2) & 1;
  unsigned int v21 = v4[64];
  if (v20 != ((v21 >> 2) & 1)) {
    goto LABEL_35;
  }
  if (v20)
  {
    unsigned int actionStatementId = self->_actionStatementId;
    if (actionStatementId != [v4 actionStatementId]) {
      goto LABEL_35;
    }
    $58D47CF7ED429C729BAD667AF3A171CD v19 = self->_has;
    unsigned int v21 = v4[64];
  }
  int v23 = (*(unsigned int *)&v19 >> 3) & 1;
  if (v23 != ((v21 >> 3) & 1)) {
    goto LABEL_35;
  }
  if (v23)
  {
    int donationTrigger = self->_donationTrigger;
    if (donationTrigger != [v4 donationTrigger]) {
      goto LABEL_35;
    }
    $58D47CF7ED429C729BAD667AF3A171CD v19 = self->_has;
    unsigned int v21 = v4[64];
  }
  int v25 = (*(unsigned int *)&v19 >> 4) & 1;
  if (v25 != ((v21 >> 4) & 1)) {
    goto LABEL_35;
  }
  if (v25)
  {
    int wasTupleDonated = self->_wasTupleDonated;
    if (wasTupleDonated != [v4 wasTupleDonated]) {
      goto LABEL_35;
    }
  }
  long double v12 = [(FLSchemaFLInteractionDonationEnded *)self tuple];
  double v13 = [v4 tuple];
  if ((v12 == 0) == (v13 != 0)) {
    goto LABEL_34;
  }
  uint64_t v27 = [(FLSchemaFLInteractionDonationEnded *)self tuple];
  if (v27)
  {
    v28 = (void *)v27;
    long long v29 = [(FLSchemaFLInteractionDonationEnded *)self tuple];
    long long v30 = [v4 tuple];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  long double v12 = [(FLSchemaFLInteractionDonationEnded *)self candidates];
  double v13 = [v4 candidates];
  if ((v12 == 0) == (v13 != 0))
  {
LABEL_34:

    goto LABEL_35;
  }
  uint64_t v32 = [(FLSchemaFLInteractionDonationEnded *)self candidates];
  if (!v32)
  {

LABEL_38:
    BOOL v37 = 1;
    goto LABEL_36;
  }
  v33 = (void *)v32;
  uint64_t v34 = [(FLSchemaFLInteractionDonationEnded *)self candidates];
  long long v35 = [v4 candidates];
  char v36 = [v34 isEqual:v35];

  if (v36) {
    goto LABEL_38;
  }
LABEL_35:
  BOOL v37 = 0;
LABEL_36:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  unsigned int v6 = [(FLSchemaFLInteractionDonationEnded *)self ifSessionId];

  if (v6)
  {
    long double v7 = [(FLSchemaFLInteractionDonationEnded *)self ifSessionId];
    PBDataWriterWriteSubmessage();
  }
  char v8 = (char)self->_has;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v8 = (char)self->_has;
    if ((v8 & 8) == 0)
    {
LABEL_9:
      if ((v8 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
  int v9 = [(FLSchemaFLInteractionDonationEnded *)self tuple];

  if (v9)
  {
    uint64_t v10 = [(FLSchemaFLInteractionDonationEnded *)self tuple];
    PBDataWriterWriteSubmessage();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v11 = self->_candidates;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLSchemaFLInteractionDonationEndedReadFrom(self, (uint64_t)a3);
}

- (id)candidatesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_candidates objectAtIndexedSubscript:a3];
}

- (unint64_t)candidatesCount
{
  return [(NSArray *)self->_candidates count];
}

- (void)addCandidates:(id)a3
{
  id v4 = a3;
  candidates = self->_candidates;
  id v8 = v4;
  if (!candidates)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    long double v7 = self->_candidates;
    self->_candidates = v6;

    id v4 = v8;
    candidates = self->_candidates;
  }
  [(NSArray *)candidates addObject:v4];
}

- (void)clearCandidates
{
}

- (void)deleteTuple
{
}

- (BOOL)hasTuple
{
  return self->_tuple != 0;
}

- (void)deleteWasTupleDonated
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasWasTupleDonated:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWasTupleDonated
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setWasTupleDonated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int wasTupleDonated = a3;
}

- (void)deleteDonationTrigger
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasDonationTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDonationTrigger
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDonationTrigger:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int donationTrigger = a3;
}

- (void)deleteActionStatementId
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasActionStatementId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasActionStatementId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setActionStatementId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int actionStatementId = a3;
}

- (void)deleteIfSessionId
{
}

- (BOOL)hasIfSessionId
{
  return self->_ifSessionId != 0;
}

- (void)deleteDonationTime
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDonationTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDonationTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDonationTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double donationTime = a3;
}

- (void)deleteAbsoluteTime
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAbsoluteTime:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAbsoluteTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double absoluteTime = a3;
}

@end