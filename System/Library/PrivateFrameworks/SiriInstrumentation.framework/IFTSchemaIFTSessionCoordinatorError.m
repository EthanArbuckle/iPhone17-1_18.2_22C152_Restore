@interface IFTSchemaIFTSessionCoordinatorError
- (BOOL)hasFailedToWriteTranscript;
- (BOOL)hasOther;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTIntelligenceFlowError)failedToWriteTranscript;
- (IFTSchemaIFTIntelligenceFlowError)other;
- (IFTSchemaIFTSessionCoordinatorError)initWithDictionary:(id)a3;
- (IFTSchemaIFTSessionCoordinatorError)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Sessioncoordinatorerror;
- (void)deleteFailedToWriteTranscript;
- (void)deleteOther;
- (void)setFailedToWriteTranscript:(id)a3;
- (void)setHasFailedToWriteTranscript:(BOOL)a3;
- (void)setHasOther:(BOOL)a3;
- (void)setOther:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTSessionCoordinatorError

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTSessionCoordinatorError;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTSessionCoordinatorError *)self other];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTSessionCoordinatorError *)self deleteOther];
  }
  v9 = [(IFTSchemaIFTSessionCoordinatorError *)self failedToWriteTranscript];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTSessionCoordinatorError *)self deleteFailedToWriteTranscript];
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
  objc_storeStrong((id *)&self->_failedToWriteTranscript, 0);
  objc_storeStrong((id *)&self->_other, 0);
}

- (void)setHasFailedToWriteTranscript:(BOOL)a3
{
  self->_hasFailedToWriteTranscript = a3;
}

- (BOOL)hasFailedToWriteTranscript
{
  return self->_hasFailedToWriteTranscript;
}

- (void)setHasOther:(BOOL)a3
{
  self->_hasOther = a3;
}

- (BOOL)hasOther
{
  return self->_hasOther;
}

- (unint64_t)whichOneof_Sessioncoordinatorerror
{
  return self->_whichOneof_Sessioncoordinatorerror;
}

- (IFTSchemaIFTSessionCoordinatorError)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaIFTSessionCoordinatorError;
  v5 = [(IFTSchemaIFTSessionCoordinatorError *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"other"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTIntelligenceFlowError alloc] initWithDictionary:v6];
      [(IFTSchemaIFTSessionCoordinatorError *)v5 setOther:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"failedToWriteTranscript"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaIFTIntelligenceFlowError alloc] initWithDictionary:v8];
      [(IFTSchemaIFTSessionCoordinatorError *)v5 setFailedToWriteTranscript:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (IFTSchemaIFTSessionCoordinatorError)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTSessionCoordinatorError *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTSessionCoordinatorError *)self dictionaryRepresentation];
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
  if (self->_failedToWriteTranscript)
  {
    id v4 = [(IFTSchemaIFTSessionCoordinatorError *)self failedToWriteTranscript];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"failedToWriteTranscript"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"failedToWriteTranscript"];
    }
  }
  if (self->_other)
  {
    uint64_t v7 = [(IFTSchemaIFTSessionCoordinatorError *)self other];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"other"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"other"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTIntelligenceFlowError *)self->_other hash];
  return [(IFTSchemaIFTIntelligenceFlowError *)self->_failedToWriteTranscript hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichOneof_Sessioncoordinatorerror = self->_whichOneof_Sessioncoordinatorerror;
  if (whichOneof_Sessioncoordinatorerror != objc_msgSend(v4, "whichOneof_Sessioncoordinatorerror")) {
    goto LABEL_13;
  }
  v6 = [(IFTSchemaIFTSessionCoordinatorError *)self other];
  uint64_t v7 = [v4 other];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(IFTSchemaIFTSessionCoordinatorError *)self other];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTSessionCoordinatorError *)self other];
    int v11 = [v4 other];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTSessionCoordinatorError *)self failedToWriteTranscript];
  uint64_t v7 = [v4 failedToWriteTranscript];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(IFTSchemaIFTSessionCoordinatorError *)self failedToWriteTranscript];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(IFTSchemaIFTSessionCoordinatorError *)self failedToWriteTranscript];
    v16 = [v4 failedToWriteTranscript];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(IFTSchemaIFTSessionCoordinatorError *)self other];

  if (v4)
  {
    v5 = [(IFTSchemaIFTSessionCoordinatorError *)self other];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(IFTSchemaIFTSessionCoordinatorError *)self failedToWriteTranscript];

  if (v6)
  {
    uint64_t v7 = [(IFTSchemaIFTSessionCoordinatorError *)self failedToWriteTranscript];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTSessionCoordinatorErrorReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailedToWriteTranscript
{
  if (self->_whichOneof_Sessioncoordinatorerror == 2)
  {
    self->_unint64_t whichOneof_Sessioncoordinatorerror = 0;
    self->_failedToWriteTranscript = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTIntelligenceFlowError)failedToWriteTranscript
{
  if (self->_whichOneof_Sessioncoordinatorerror == 2) {
    v2 = self->_failedToWriteTranscript;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFailedToWriteTranscript:(id)a3
{
  id v4 = (IFTSchemaIFTIntelligenceFlowError *)a3;
  other = self->_other;
  self->_other = 0;

  self->_unint64_t whichOneof_Sessioncoordinatorerror = 2 * (v4 != 0);
  failedToWriteTranscript = self->_failedToWriteTranscript;
  self->_failedToWriteTranscript = v4;
}

- (void)deleteOther
{
  if (self->_whichOneof_Sessioncoordinatorerror == 1)
  {
    self->_unint64_t whichOneof_Sessioncoordinatorerror = 0;
    self->_other = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTIntelligenceFlowError)other
{
  if (self->_whichOneof_Sessioncoordinatorerror == 1) {
    v2 = self->_other;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOther:(id)a3
{
  id v4 = (IFTSchemaIFTIntelligenceFlowError *)a3;
  failedToWriteTranscript = self->_failedToWriteTranscript;
  self->_failedToWriteTranscript = 0;

  self->_unint64_t whichOneof_Sessioncoordinatorerror = v4 != 0;
  other = self->_other;
  self->_other = v4;
}

@end