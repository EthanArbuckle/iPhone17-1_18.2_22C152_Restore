@interface NLXSchemaCDMUserDialogAct
- (BOOL)hasAccepted;
- (BOOL)hasAcknowledged;
- (BOOL)hasAlignment;
- (BOOL)hasCancelled;
- (BOOL)hasDelegated;
- (BOOL)hasReference;
- (BOOL)hasRejected;
- (BOOL)hasUserStatedTask;
- (BOOL)hasWantedToPause;
- (BOOL)hasWantedToProceed;
- (BOOL)hasWantedToRepeat;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMDelegatedUserDialogAct)delegated;
- (NLXSchemaCDMUserAccepted)accepted;
- (NLXSchemaCDMUserAcknowledged)acknowledged;
- (NLXSchemaCDMUserCancelled)cancelled;
- (NLXSchemaCDMUserDialogAct)initWithDictionary:(id)a3;
- (NLXSchemaCDMUserDialogAct)initWithJSON:(id)a3;
- (NLXSchemaCDMUserRejected)rejected;
- (NLXSchemaCDMUserStatedTask)userStatedTask;
- (NLXSchemaCDMUserWantedToPause)wantedToPause;
- (NLXSchemaCDMUserWantedToProceed)wantedToProceed;
- (NLXSchemaCDMUserWantedToRepeat)wantedToRepeat;
- (NSData)jsonData;
- (USOSchemaUSOGraph)reference;
- (USOSchemaUSOUtteranceAlignment)alignment;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichUserdialogacttype;
- (void)deleteAccepted;
- (void)deleteAcknowledged;
- (void)deleteAlignment;
- (void)deleteCancelled;
- (void)deleteDelegated;
- (void)deleteReference;
- (void)deleteRejected;
- (void)deleteUserStatedTask;
- (void)deleteWantedToPause;
- (void)deleteWantedToProceed;
- (void)deleteWantedToRepeat;
- (void)setAccepted:(id)a3;
- (void)setAcknowledged:(id)a3;
- (void)setAlignment:(id)a3;
- (void)setCancelled:(id)a3;
- (void)setDelegated:(id)a3;
- (void)setHasAccepted:(BOOL)a3;
- (void)setHasAcknowledged:(BOOL)a3;
- (void)setHasAlignment:(BOOL)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setHasDelegated:(BOOL)a3;
- (void)setHasReference:(BOOL)a3;
- (void)setHasRejected:(BOOL)a3;
- (void)setHasUserStatedTask:(BOOL)a3;
- (void)setHasWantedToPause:(BOOL)a3;
- (void)setHasWantedToProceed:(BOOL)a3;
- (void)setHasWantedToRepeat:(BOOL)a3;
- (void)setReference:(id)a3;
- (void)setRejected:(id)a3;
- (void)setUserStatedTask:(id)a3;
- (void)setWantedToPause:(id)a3;
- (void)setWantedToProceed:(id)a3;
- (void)setWantedToRepeat:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMUserDialogAct

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)NLXSchemaCDMUserDialogAct;
  v5 = [(SISchemaInstrumentationMessage *)&v40 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMUserDialogAct *)self alignment];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMUserDialogAct *)self deleteAlignment];
  }
  v9 = [(NLXSchemaCDMUserDialogAct *)self reference];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaCDMUserDialogAct *)self deleteReference];
  }
  v12 = [(NLXSchemaCDMUserDialogAct *)self accepted];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(NLXSchemaCDMUserDialogAct *)self deleteAccepted];
  }
  v15 = [(NLXSchemaCDMUserDialogAct *)self rejected];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(NLXSchemaCDMUserDialogAct *)self deleteRejected];
  }
  v18 = [(NLXSchemaCDMUserDialogAct *)self cancelled];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(NLXSchemaCDMUserDialogAct *)self deleteCancelled];
  }
  v21 = [(NLXSchemaCDMUserDialogAct *)self wantedToRepeat];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(NLXSchemaCDMUserDialogAct *)self deleteWantedToRepeat];
  }
  v24 = [(NLXSchemaCDMUserDialogAct *)self acknowledged];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(NLXSchemaCDMUserDialogAct *)self deleteAcknowledged];
  }
  v27 = [(NLXSchemaCDMUserDialogAct *)self wantedToProceed];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(NLXSchemaCDMUserDialogAct *)self deleteWantedToProceed];
  }
  v30 = [(NLXSchemaCDMUserDialogAct *)self wantedToPause];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(NLXSchemaCDMUserDialogAct *)self deleteWantedToPause];
  }
  v33 = [(NLXSchemaCDMUserDialogAct *)self delegated];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(NLXSchemaCDMUserDialogAct *)self deleteDelegated];
  }
  v36 = [(NLXSchemaCDMUserDialogAct *)self userStatedTask];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(NLXSchemaCDMUserDialogAct *)self deleteUserStatedTask];
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
  objc_storeStrong((id *)&self->_userStatedTask, 0);
  objc_storeStrong((id *)&self->_delegated, 0);
  objc_storeStrong((id *)&self->_wantedToPause, 0);
  objc_storeStrong((id *)&self->_wantedToProceed, 0);
  objc_storeStrong((id *)&self->_acknowledged, 0);
  objc_storeStrong((id *)&self->_wantedToRepeat, 0);
  objc_storeStrong((id *)&self->_cancelled, 0);
  objc_storeStrong((id *)&self->_rejected, 0);
  objc_storeStrong((id *)&self->_accepted, 0);
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_alignment, 0);
}

- (void)setHasUserStatedTask:(BOOL)a3
{
  self->_hasUserStatedTask = a3;
}

- (BOOL)hasUserStatedTask
{
  return self->_hasUserStatedTask;
}

- (void)setHasDelegated:(BOOL)a3
{
  self->_hasDelegated = a3;
}

- (BOOL)hasDelegated
{
  return self->_hasDelegated;
}

- (void)setHasWantedToPause:(BOOL)a3
{
  self->_hasWantedToPause = a3;
}

- (BOOL)hasWantedToPause
{
  return self->_hasWantedToPause;
}

- (void)setHasWantedToProceed:(BOOL)a3
{
  self->_hasWantedToProceed = a3;
}

- (BOOL)hasWantedToProceed
{
  return self->_hasWantedToProceed;
}

- (void)setHasAcknowledged:(BOOL)a3
{
  self->_hasAcknowledged = a3;
}

- (BOOL)hasAcknowledged
{
  return self->_hasAcknowledged;
}

- (void)setHasWantedToRepeat:(BOOL)a3
{
  self->_hasWantedToRepeat = a3;
}

- (BOOL)hasWantedToRepeat
{
  return self->_hasWantedToRepeat;
}

- (void)setHasCancelled:(BOOL)a3
{
  self->_hasCancelled = a3;
}

- (BOOL)hasCancelled
{
  return self->_hasCancelled;
}

- (void)setHasRejected:(BOOL)a3
{
  self->_hasRejected = a3;
}

- (BOOL)hasRejected
{
  return self->_hasRejected;
}

- (void)setHasAccepted:(BOOL)a3
{
  self->_hasAccepted = a3;
}

- (BOOL)hasAccepted
{
  return self->_hasAccepted;
}

- (void)setHasReference:(BOOL)a3
{
  self->_hasReference = a3;
}

- (void)setHasAlignment:(BOOL)a3
{
  self->_hasAlignment = a3;
}

- (void)setReference:(id)a3
{
}

- (USOSchemaUSOGraph)reference
{
  return self->_reference;
}

- (void)setAlignment:(id)a3
{
}

- (USOSchemaUSOUtteranceAlignment)alignment
{
  return self->_alignment;
}

- (unint64_t)whichUserdialogacttype
{
  return self->_whichUserdialogacttype;
}

- (NLXSchemaCDMUserDialogAct)initWithDictionary:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)NLXSchemaCDMUserDialogAct;
  v5 = [(NLXSchemaCDMUserDialogAct *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"alignment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[USOSchemaUSOUtteranceAlignment alloc] initWithDictionary:v6];
      [(NLXSchemaCDMUserDialogAct *)v5 setAlignment:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"reference"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[USOSchemaUSOGraph alloc] initWithDictionary:v8];
      [(NLXSchemaCDMUserDialogAct *)v5 setReference:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"accepted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[NLXSchemaCDMUserAccepted alloc] initWithDictionary:v10];
      [(NLXSchemaCDMUserDialogAct *)v5 setAccepted:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"rejected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[NLXSchemaCDMUserRejected alloc] initWithDictionary:v12];
      [(NLXSchemaCDMUserDialogAct *)v5 setRejected:v13];
    }
    int v32 = (void *)v12;
    uint64_t v14 = [v4 objectForKeyedSubscript:@"cancelled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[NLXSchemaCDMUserCancelled alloc] initWithDictionary:v14];
      [(NLXSchemaCDMUserDialogAct *)v5 setCancelled:v15];
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"wantedToRepeat", v14);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[NLXSchemaCDMUserWantedToRepeat alloc] initWithDictionary:v16];
      [(NLXSchemaCDMUserDialogAct *)v5 setWantedToRepeat:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"acknowledged"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[NLXSchemaCDMUserAcknowledged alloc] initWithDictionary:v18];
      [(NLXSchemaCDMUserDialogAct *)v5 setAcknowledged:v19];
    }
    v33 = (void *)v10;
    v34 = (void *)v6;
    int v20 = [v4 objectForKeyedSubscript:@"wantedToProceed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[NLXSchemaCDMUserWantedToProceed alloc] initWithDictionary:v20];
      [(NLXSchemaCDMUserDialogAct *)v5 setWantedToProceed:v21];
    }
    v22 = (void *)v8;
    int v23 = [v4 objectForKeyedSubscript:@"wantedToPause"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[NLXSchemaCDMUserWantedToPause alloc] initWithDictionary:v23];
      [(NLXSchemaCDMUserDialogAct *)v5 setWantedToPause:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"delegated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[NLXSchemaCDMDelegatedUserDialogAct alloc] initWithDictionary:v25];
      [(NLXSchemaCDMUserDialogAct *)v5 setDelegated:v26];
    }
    v27 = [v4 objectForKeyedSubscript:@"userStatedTask"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[NLXSchemaCDMUserStatedTask alloc] initWithDictionary:v27];
      [(NLXSchemaCDMUserDialogAct *)v5 setUserStatedTask:v28];
    }
    int v29 = v5;
  }
  return v5;
}

- (NLXSchemaCDMUserDialogAct)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMUserDialogAct *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMUserDialogAct *)self dictionaryRepresentation];
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
  if (self->_accepted)
  {
    id v4 = [(NLXSchemaCDMUserDialogAct *)self accepted];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"accepted"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"accepted"];
    }
  }
  if (self->_acknowledged)
  {
    uint64_t v7 = [(NLXSchemaCDMUserDialogAct *)self acknowledged];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"acknowledged"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"acknowledged"];
    }
  }
  if (self->_alignment)
  {
    uint64_t v10 = [(NLXSchemaCDMUserDialogAct *)self alignment];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"alignment"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"alignment"];
    }
  }
  if (self->_cancelled)
  {
    v13 = [(NLXSchemaCDMUserDialogAct *)self cancelled];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"cancelled"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"cancelled"];
    }
  }
  if (self->_delegated)
  {
    v16 = [(NLXSchemaCDMUserDialogAct *)self delegated];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"delegated"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"delegated"];
    }
  }
  if (self->_reference)
  {
    v19 = [(NLXSchemaCDMUserDialogAct *)self reference];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"reference"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"reference"];
    }
  }
  if (self->_rejected)
  {
    v22 = [(NLXSchemaCDMUserDialogAct *)self rejected];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"rejected"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"rejected"];
    }
  }
  if (self->_userStatedTask)
  {
    v25 = [(NLXSchemaCDMUserDialogAct *)self userStatedTask];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"userStatedTask"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"userStatedTask"];
    }
  }
  if (self->_wantedToPause)
  {
    v28 = [(NLXSchemaCDMUserDialogAct *)self wantedToPause];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"wantedToPause"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"wantedToPause"];
    }
  }
  if (self->_wantedToProceed)
  {
    v31 = [(NLXSchemaCDMUserDialogAct *)self wantedToProceed];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"wantedToProceed"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"wantedToProceed"];
    }
  }
  if (self->_wantedToRepeat)
  {
    v34 = [(NLXSchemaCDMUserDialogAct *)self wantedToRepeat];
    objc_super v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"wantedToRepeat"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"wantedToRepeat"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(USOSchemaUSOUtteranceAlignment *)self->_alignment hash];
  unint64_t v4 = [(USOSchemaUSOGraph *)self->_reference hash] ^ v3;
  unint64_t v5 = [(NLXSchemaCDMUserAccepted *)self->_accepted hash];
  unint64_t v6 = v4 ^ v5 ^ [(NLXSchemaCDMUserRejected *)self->_rejected hash];
  unint64_t v7 = [(NLXSchemaCDMUserCancelled *)self->_cancelled hash];
  unint64_t v8 = v7 ^ [(NLXSchemaCDMUserWantedToRepeat *)self->_wantedToRepeat hash];
  unint64_t v9 = v6 ^ v8 ^ [(NLXSchemaCDMUserAcknowledged *)self->_acknowledged hash];
  unint64_t v10 = [(NLXSchemaCDMUserWantedToProceed *)self->_wantedToProceed hash];
  unint64_t v11 = v10 ^ [(NLXSchemaCDMUserWantedToPause *)self->_wantedToPause hash];
  unint64_t v12 = v11 ^ [(NLXSchemaCDMDelegatedUserDialogAct *)self->_delegated hash];
  return v9 ^ v12 ^ [(NLXSchemaCDMUserStatedTask *)self->_userStatedTask hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  unint64_t whichUserdialogacttype = self->_whichUserdialogacttype;
  if (whichUserdialogacttype != [v4 whichUserdialogacttype]) {
    goto LABEL_58;
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self alignment];
  unint64_t v7 = [v4 alignment];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v8 = [(NLXSchemaCDMUserDialogAct *)self alignment];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(NLXSchemaCDMUserDialogAct *)self alignment];
    unint64_t v11 = [v4 alignment];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self reference];
  unint64_t v7 = [v4 reference];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v13 = [(NLXSchemaCDMUserDialogAct *)self reference];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    v15 = [(NLXSchemaCDMUserDialogAct *)self reference];
    v16 = [v4 reference];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self accepted];
  unint64_t v7 = [v4 accepted];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v18 = [(NLXSchemaCDMUserDialogAct *)self accepted];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(NLXSchemaCDMUserDialogAct *)self accepted];
    v21 = [v4 accepted];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self rejected];
  unint64_t v7 = [v4 rejected];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v23 = [(NLXSchemaCDMUserDialogAct *)self rejected];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(NLXSchemaCDMUserDialogAct *)self rejected];
    int v26 = [v4 rejected];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self cancelled];
  unint64_t v7 = [v4 cancelled];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v28 = [(NLXSchemaCDMUserDialogAct *)self cancelled];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(NLXSchemaCDMUserDialogAct *)self cancelled];
    v31 = [v4 cancelled];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self wantedToRepeat];
  unint64_t v7 = [v4 wantedToRepeat];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v33 = [(NLXSchemaCDMUserDialogAct *)self wantedToRepeat];
  if (v33)
  {
    v34 = (void *)v33;
    objc_super v35 = [(NLXSchemaCDMUserDialogAct *)self wantedToRepeat];
    v36 = [v4 wantedToRepeat];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self acknowledged];
  unint64_t v7 = [v4 acknowledged];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v38 = [(NLXSchemaCDMUserDialogAct *)self acknowledged];
  if (v38)
  {
    v39 = (void *)v38;
    objc_super v40 = [(NLXSchemaCDMUserDialogAct *)self acknowledged];
    v41 = [v4 acknowledged];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self wantedToProceed];
  unint64_t v7 = [v4 wantedToProceed];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v43 = [(NLXSchemaCDMUserDialogAct *)self wantedToProceed];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(NLXSchemaCDMUserDialogAct *)self wantedToProceed];
    v46 = [v4 wantedToProceed];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self wantedToPause];
  unint64_t v7 = [v4 wantedToPause];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v48 = [(NLXSchemaCDMUserDialogAct *)self wantedToPause];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(NLXSchemaCDMUserDialogAct *)self wantedToPause];
    v51 = [v4 wantedToPause];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self delegated];
  unint64_t v7 = [v4 delegated];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_57;
  }
  uint64_t v53 = [(NLXSchemaCDMUserDialogAct *)self delegated];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(NLXSchemaCDMUserDialogAct *)self delegated];
    v56 = [v4 delegated];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self userStatedTask];
  unint64_t v7 = [v4 userStatedTask];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v58 = [(NLXSchemaCDMUserDialogAct *)self userStatedTask];
    if (!v58)
    {

LABEL_61:
      BOOL v63 = 1;
      goto LABEL_59;
    }
    v59 = (void *)v58;
    v60 = [(NLXSchemaCDMUserDialogAct *)self userStatedTask];
    v61 = [v4 userStatedTask];
    char v62 = [v60 isEqual:v61];

    if (v62) {
      goto LABEL_61;
    }
  }
  else
  {
LABEL_57:
  }
LABEL_58:
  BOOL v63 = 0;
LABEL_59:

  return v63;
}

- (void)writeTo:(id)a3
{
  id v26 = a3;
  id v4 = [(NLXSchemaCDMUserDialogAct *)self alignment];

  if (v4)
  {
    unint64_t v5 = [(NLXSchemaCDMUserDialogAct *)self alignment];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(NLXSchemaCDMUserDialogAct *)self reference];

  if (v6)
  {
    unint64_t v7 = [(NLXSchemaCDMUserDialogAct *)self reference];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(NLXSchemaCDMUserDialogAct *)self accepted];

  if (v8)
  {
    unint64_t v9 = [(NLXSchemaCDMUserDialogAct *)self accepted];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(NLXSchemaCDMUserDialogAct *)self rejected];

  if (v10)
  {
    unint64_t v11 = [(NLXSchemaCDMUserDialogAct *)self rejected];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(NLXSchemaCDMUserDialogAct *)self cancelled];

  if (v12)
  {
    uint64_t v13 = [(NLXSchemaCDMUserDialogAct *)self cancelled];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v14 = [(NLXSchemaCDMUserDialogAct *)self wantedToRepeat];

  if (v14)
  {
    v15 = [(NLXSchemaCDMUserDialogAct *)self wantedToRepeat];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(NLXSchemaCDMUserDialogAct *)self acknowledged];

  if (v16)
  {
    int v17 = [(NLXSchemaCDMUserDialogAct *)self acknowledged];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(NLXSchemaCDMUserDialogAct *)self wantedToProceed];

  if (v18)
  {
    v19 = [(NLXSchemaCDMUserDialogAct *)self wantedToProceed];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(NLXSchemaCDMUserDialogAct *)self wantedToPause];

  if (v20)
  {
    v21 = [(NLXSchemaCDMUserDialogAct *)self wantedToPause];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(NLXSchemaCDMUserDialogAct *)self delegated];

  if (v22)
  {
    uint64_t v23 = [(NLXSchemaCDMUserDialogAct *)self delegated];
    PBDataWriterWriteSubmessage();
  }
  v24 = [(NLXSchemaCDMUserDialogAct *)self userStatedTask];

  if (v24)
  {
    v25 = [(NLXSchemaCDMUserDialogAct *)self userStatedTask];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMUserDialogActReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserStatedTask
{
  if (self->_whichUserdialogacttype == 11)
  {
    self->_unint64_t whichUserdialogacttype = 0;
    self->_userStatedTask = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMUserStatedTask)userStatedTask
{
  if (self->_whichUserdialogacttype == 11) {
    v2 = self->_userStatedTask;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUserStatedTask:(id)a3
{
  id v4 = (NLXSchemaCDMUserStatedTask *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  unint64_t v13 = 11;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichUserdialogacttype = v13;
  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = v4;
}

- (void)deleteDelegated
{
  if (self->_whichUserdialogacttype == 10)
  {
    self->_unint64_t whichUserdialogacttype = 0;
    self->_delegated = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMDelegatedUserDialogAct)delegated
{
  if (self->_whichUserdialogacttype == 10) {
    v2 = self->_delegated;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setDelegated:(id)a3
{
  id v4 = (NLXSchemaCDMDelegatedUserDialogAct *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  unint64_t v13 = 10;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichUserdialogacttype = v13;
  delegated = self->_delegated;
  self->_delegated = v4;
}

- (void)deleteWantedToPause
{
  if (self->_whichUserdialogacttype == 9)
  {
    self->_unint64_t whichUserdialogacttype = 0;
    self->_wantedToPause = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMUserWantedToPause)wantedToPause
{
  if (self->_whichUserdialogacttype == 9) {
    v2 = self->_wantedToPause;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setWantedToPause:(id)a3
{
  id v4 = (NLXSchemaCDMUserWantedToPause *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  unint64_t v13 = 9;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichUserdialogacttype = v13;
  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = v4;
}

- (void)deleteWantedToProceed
{
  if (self->_whichUserdialogacttype == 8)
  {
    self->_unint64_t whichUserdialogacttype = 0;
    self->_wantedToProceed = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMUserWantedToProceed)wantedToProceed
{
  if (self->_whichUserdialogacttype == 8) {
    v2 = self->_wantedToProceed;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setWantedToProceed:(id)a3
{
  id v4 = (NLXSchemaCDMUserWantedToProceed *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  self->_unint64_t whichUserdialogacttype = 8 * (v4 != 0);
  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = v4;
}

- (void)deleteAcknowledged
{
  if (self->_whichUserdialogacttype == 7)
  {
    self->_unint64_t whichUserdialogacttype = 0;
    self->_acknowledged = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMUserAcknowledged)acknowledged
{
  if (self->_whichUserdialogacttype == 7) {
    v2 = self->_acknowledged;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAcknowledged:(id)a3
{
  id v4 = (NLXSchemaCDMUserAcknowledged *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  unint64_t v13 = 7;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichUserdialogacttype = v13;
  acknowledged = self->_acknowledged;
  self->_acknowledged = v4;
}

- (void)deleteWantedToRepeat
{
  if (self->_whichUserdialogacttype == 6)
  {
    self->_unint64_t whichUserdialogacttype = 0;
    self->_wantedToRepeat = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMUserWantedToRepeat)wantedToRepeat
{
  if (self->_whichUserdialogacttype == 6) {
    v2 = self->_wantedToRepeat;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setWantedToRepeat:(id)a3
{
  id v4 = (NLXSchemaCDMUserWantedToRepeat *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  unint64_t v13 = 6;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichUserdialogacttype = v13;
  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = v4;
}

- (void)deleteCancelled
{
  if (self->_whichUserdialogacttype == 5)
  {
    self->_unint64_t whichUserdialogacttype = 0;
    self->_cancelled = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMUserCancelled)cancelled
{
  if (self->_whichUserdialogacttype == 5) {
    v2 = self->_cancelled;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCancelled:(id)a3
{
  id v4 = (NLXSchemaCDMUserCancelled *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  unint64_t v13 = 5;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichUserdialogacttype = v13;
  cancelled = self->_cancelled;
  self->_cancelled = v4;
}

- (void)deleteRejected
{
  if (self->_whichUserdialogacttype == 4)
  {
    self->_unint64_t whichUserdialogacttype = 0;
    self->_rejected = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMUserRejected)rejected
{
  if (self->_whichUserdialogacttype == 4) {
    v2 = self->_rejected;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRejected:(id)a3
{
  id v4 = (NLXSchemaCDMUserRejected *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  self->_unint64_t whichUserdialogacttype = 4 * (v4 != 0);
  rejected = self->_rejected;
  self->_rejected = v4;
}

- (void)deleteAccepted
{
  if (self->_whichUserdialogacttype == 3)
  {
    self->_unint64_t whichUserdialogacttype = 0;
    self->_accepted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NLXSchemaCDMUserAccepted)accepted
{
  if (self->_whichUserdialogacttype == 3) {
    v2 = self->_accepted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAccepted:(id)a3
{
  id v4 = (NLXSchemaCDMUserAccepted *)a3;
  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  unint64_t v13 = 3;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichUserdialogacttype = v13;
  accepted = self->_accepted;
  self->_accepted = v4;
}

- (void)deleteReference
{
}

- (BOOL)hasReference
{
  return self->_reference != 0;
}

- (void)deleteAlignment
{
}

- (BOOL)hasAlignment
{
  return self->_alignment != 0;
}

@end