@interface IFTSchemaIFTCandidatePromptStatus
- (BOOL)confirmed;
- (BOOL)hasConfirmed;
- (BOOL)hasNotPrompted;
- (BOOL)hasPicked;
- (BOOL)isEqual:(id)a3;
- (BOOL)notPrompted;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTCandidatePromptStatus)initWithDictionary:(id)a3;
- (IFTSchemaIFTCandidatePromptStatus)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)picked;
- (unint64_t)hash;
- (unint64_t)whichOneof_Candidatepromptstatus;
- (void)deleteConfirmed;
- (void)deleteNotPrompted;
- (void)deletePicked;
- (void)setConfirmed:(BOOL)a3;
- (void)setHasConfirmed:(BOOL)a3;
- (void)setHasNotPrompted:(BOOL)a3;
- (void)setHasPicked:(BOOL)a3;
- (void)setNotPrompted:(BOOL)a3;
- (void)setPicked:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTCandidatePromptStatus

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void)setHasPicked:(BOOL)a3
{
  self->_hasPicked = a3;
}

- (BOOL)hasPicked
{
  return self->_hasPicked;
}

- (void)setHasConfirmed:(BOOL)a3
{
  self->_hasConfirmed = a3;
}

- (BOOL)hasConfirmed
{
  return self->_hasConfirmed;
}

- (void)setHasNotPrompted:(BOOL)a3
{
  self->_hasNotPrompted = a3;
}

- (BOOL)hasNotPrompted
{
  return self->_hasNotPrompted;
}

- (unint64_t)whichOneof_Candidatepromptstatus
{
  return self->_whichOneof_Candidatepromptstatus;
}

- (IFTSchemaIFTCandidatePromptStatus)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFTSchemaIFTCandidatePromptStatus;
  v5 = [(IFTSchemaIFTCandidatePromptStatus *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"notPrompted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTCandidatePromptStatus setNotPrompted:](v5, "setNotPrompted:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"confirmed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTCandidatePromptStatus setConfirmed:](v5, "setConfirmed:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"picked"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTCandidatePromptStatus setPicked:](v5, "setPicked:", [v8 longLongValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (IFTSchemaIFTCandidatePromptStatus)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTCandidatePromptStatus *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTCandidatePromptStatus *)self dictionaryRepresentation];
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
  unint64_t whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  if (whichOneof_Candidatepromptstatus == 2)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTCandidatePromptStatus confirmed](self, "confirmed"));
    [v3 setObject:v5 forKeyedSubscript:@"confirmed"];

    unint64_t whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  }
  if (whichOneof_Candidatepromptstatus == 1)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTCandidatePromptStatus notPrompted](self, "notPrompted"));
    [v3 setObject:v6 forKeyedSubscript:@"notPrompted"];

    unint64_t whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  }
  if (whichOneof_Candidatepromptstatus == 3)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IFTSchemaIFTCandidatePromptStatus picked](self, "picked"));
    [v3 setObject:v7 forKeyedSubscript:@"picked"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  switch(whichOneof_Candidatepromptstatus)
  {
    case 3uLL:
      return 2654435761 * self->_picked;
    case 2uLL:
      uint64_t v3 = 9;
      return 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + v3);
    case 1uLL:
      uint64_t v3 = 8;
      return 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + v3);
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus,
        whichOneof_Candidatepromptstatus == objc_msgSend(v4, "whichOneof_Candidatepromptstatus"))
    && (int notPrompted = self->_notPrompted, notPrompted == [v4 notPrompted])
    && (int confirmed = self->_confirmed, confirmed == [v4 confirmed]))
  {
    int64_t picked = self->_picked;
    BOOL v9 = picked == [v4 picked];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  unint64_t whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  id v6 = v4;
  if (whichOneof_Candidatepromptstatus == 1)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    unint64_t whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  }
  if (whichOneof_Candidatepromptstatus == 2)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    unint64_t whichOneof_Candidatepromptstatus = self->_whichOneof_Candidatepromptstatus;
  }
  if (whichOneof_Candidatepromptstatus == 3)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTCandidatePromptStatusReadFrom(self, (uint64_t)a3);
}

- (void)deletePicked
{
  if (self->_whichOneof_Candidatepromptstatus == 3)
  {
    self->_unint64_t whichOneof_Candidatepromptstatus = 0;
    self->_int64_t picked = 0;
  }
}

- (int64_t)picked
{
  if (self->_whichOneof_Candidatepromptstatus == 3) {
    return self->_picked;
  }
  else {
    return 0;
  }
}

- (void)setPicked:(int64_t)a3
{
  self->_int notPrompted = 0;
  self->_int confirmed = 0;
  self->_unint64_t whichOneof_Candidatepromptstatus = 3;
  self->_int64_t picked = a3;
}

- (void)deleteConfirmed
{
  if (self->_whichOneof_Candidatepromptstatus == 2)
  {
    self->_unint64_t whichOneof_Candidatepromptstatus = 0;
    self->_int confirmed = 0;
  }
}

- (BOOL)confirmed
{
  return self->_whichOneof_Candidatepromptstatus == 2 && self->_confirmed;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_int notPrompted = 0;
  self->_int64_t picked = 0;
  self->_unint64_t whichOneof_Candidatepromptstatus = 2;
  self->_int confirmed = a3;
}

- (void)deleteNotPrompted
{
  if (self->_whichOneof_Candidatepromptstatus == 1)
  {
    self->_unint64_t whichOneof_Candidatepromptstatus = 0;
    self->_int notPrompted = 0;
  }
}

- (BOOL)notPrompted
{
  return self->_whichOneof_Candidatepromptstatus == 1 && self->_notPrompted;
}

- (void)setNotPrompted:(BOOL)a3
{
  self->_int confirmed = 0;
  self->_int64_t picked = 0;
  self->_unint64_t whichOneof_Candidatepromptstatus = 1;
  self->_int notPrompted = a3;
}

@end