@interface PFARepackagingExecutionResult
- (BOOL)hasFailure;
- (BOOL)hasSamplingResult;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSData)jsonData;
- (PFARepackagingExecutionFailure)failure;
- (PFARepackagingExecutionResult)initWithDictionary:(id)a3;
- (PFARepackagingExecutionResult)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)samplingResult;
- (unint64_t)hash;
- (unint64_t)whichSuccessorfail;
- (void)deleteFailure;
- (void)deleteSamplingResult;
- (void)deleteSuccess;
- (void)setFailure:(id)a3;
- (void)setHasFailure:(BOOL)a3;
- (void)setHasSamplingResult:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setSamplingResult:(int)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFARepackagingExecutionResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PFARepackagingExecutionResult;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PFARepackagingExecutionResult *)self failure];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PFARepackagingExecutionResult *)self deleteFailure];
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
}

- (void)setHasFailure:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasFailure
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasSuccess:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (BOOL)hasSuccess
{
  return *((unsigned char *)&self->_has + 1);
}

- (int)samplingResult
{
  return self->_samplingResult;
}

- (unint64_t)whichSuccessorfail
{
  return self->_whichSuccessorfail;
}

- (PFARepackagingExecutionResult)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFARepackagingExecutionResult;
  v5 = [(PFARepackagingExecutionResult *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"samplingResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFARepackagingExecutionResult setSamplingResult:](v5, "setSamplingResult:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"success"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFARepackagingExecutionResult setSuccess:](v5, "setSuccess:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"failure"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[PFARepackagingExecutionFailure alloc] initWithDictionary:v8];
      [(PFARepackagingExecutionResult *)v5 setFailure:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PFARepackagingExecutionResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFARepackagingExecutionResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFARepackagingExecutionResult *)self dictionaryRepresentation];
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
  if (self->_failure)
  {
    id v4 = [(PFARepackagingExecutionResult *)self failure];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"failure"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"failure"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    int v7 = [(PFARepackagingExecutionResult *)self samplingResult];
    v8 = @"UNKNOWN";
    if (v7 == 1) {
      v8 = @"Sampled";
    }
    if (v7 == 2) {
      objc_super v9 = @"NotSampled";
    }
    else {
      objc_super v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"samplingResult"];
  }
  if (self->_whichSuccessorfail == 101)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[PFARepackagingExecutionResult success](self, "success"));
    [v3 setObject:v10 forKeyedSubscript:@"success"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_samplingResult;
  }
  else {
    uint64_t v2 = 0;
  }
  if (self->_whichSuccessorfail == 101) {
    uint64_t v3 = 2654435761 * self->_success;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3 ^ v2 ^ [(PFARepackagingExecutionFailure *)self->_failure hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichSuccessorfail = self->_whichSuccessorfail;
    if (whichSuccessorfail == [v4 whichSuccessorfail] && (*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int samplingResult = self->_samplingResult, samplingResult == [v4 samplingResult]))
      {
        int success = self->_success;
        if (success == [v4 success])
        {
          v8 = [(PFARepackagingExecutionResult *)self failure];
          objc_super v9 = [v4 failure];
          v10 = v9;
          if ((v8 == 0) != (v9 != 0))
          {
            uint64_t v11 = [(PFARepackagingExecutionResult *)self failure];
            if (!v11)
            {

LABEL_15:
              BOOL v16 = 1;
              goto LABEL_13;
            }
            objc_super v12 = (void *)v11;
            v13 = [(PFARepackagingExecutionResult *)self failure];
            v14 = [v4 failure];
            char v15 = [v13 isEqual:v14];

            if (v15) {
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
      }
    }
  }
  BOOL v16 = 0;
LABEL_13:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_whichSuccessorfail == 101) {
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(PFARepackagingExecutionResult *)self failure];

  v5 = v7;
  if (v4)
  {
    v6 = [(PFARepackagingExecutionResult *)self failure];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFARepackagingExecutionResultReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailure
{
  if (self->_whichSuccessorfail == 102)
  {
    self->_unint64_t whichSuccessorfail = 0;
    self->_failure = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PFARepackagingExecutionFailure)failure
{
  if (self->_whichSuccessorfail == 102) {
    uint64_t v2 = self->_failure;
  }
  else {
    uint64_t v2 = 0;
  }
  return v2;
}

- (void)setFailure:(id)a3
{
  self->_int success = 0;
  unint64_t v3 = 102;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichSuccessorfail = v3;
  objc_storeStrong((id *)&self->_failure, a3);
}

- (void)deleteSuccess
{
  if (self->_whichSuccessorfail == 101)
  {
    self->_unint64_t whichSuccessorfail = 0;
    self->_int success = 0;
  }
}

- (BOOL)success
{
  return self->_whichSuccessorfail == 101 && self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  failure = self->_failure;
  self->_failure = 0;

  self->_unint64_t whichSuccessorfail = 101;
  self->_int success = a3;
}

- (void)deleteSamplingResult
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSamplingResult:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSamplingResult
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSamplingResult:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int samplingResult = a3;
}

@end