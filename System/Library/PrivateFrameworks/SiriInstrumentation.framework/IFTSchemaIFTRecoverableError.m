@interface IFTSchemaIFTRecoverableError
- (BOOL)hasPlanGenerationError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTPlanGenerationError)planGenerationError;
- (IFTSchemaIFTRecoverableError)initWithDictionary:(id)a3;
- (IFTSchemaIFTRecoverableError)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Recoverableerror;
- (void)deletePlanGenerationError;
- (void)setHasPlanGenerationError:(BOOL)a3;
- (void)setPlanGenerationError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTRecoverableError

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTRecoverableError;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTRecoverableError *)self planGenerationError];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IFTSchemaIFTRecoverableError *)self deletePlanGenerationError];
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

- (void)setHasPlanGenerationError:(BOOL)a3
{
  self->_hasPlanGenerationError = a3;
}

- (BOOL)hasPlanGenerationError
{
  return self->_hasPlanGenerationError;
}

- (unint64_t)whichOneof_Recoverableerror
{
  return self->_whichOneof_Recoverableerror;
}

- (IFTSchemaIFTRecoverableError)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFTSchemaIFTRecoverableError;
  v5 = [(IFTSchemaIFTRecoverableError *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"planGenerationError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTPlanGenerationError alloc] initWithDictionary:v6];
      [(IFTSchemaIFTRecoverableError *)v5 setPlanGenerationError:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (IFTSchemaIFTRecoverableError)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTRecoverableError *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTRecoverableError *)self dictionaryRepresentation];
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
  if (self->_planGenerationError)
  {
    id v4 = [(IFTSchemaIFTRecoverableError *)self planGenerationError];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"planGenerationError"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"planGenerationError"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(IFTSchemaIFTPlanGenerationError *)self->_planGenerationError hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichOneof_Recoverableerror = self->_whichOneof_Recoverableerror;
    if (whichOneof_Recoverableerror == objc_msgSend(v4, "whichOneof_Recoverableerror"))
    {
      v6 = [(IFTSchemaIFTRecoverableError *)self planGenerationError];
      uint64_t v7 = [v4 planGenerationError];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(IFTSchemaIFTRecoverableError *)self planGenerationError];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        objc_super v10 = (void *)v9;
        v11 = [(IFTSchemaIFTRecoverableError *)self planGenerationError];
        v12 = [v4 planGenerationError];
        char v13 = [v11 isEqual:v12];

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(IFTSchemaIFTRecoverableError *)self planGenerationError];

  if (v4)
  {
    v5 = [(IFTSchemaIFTRecoverableError *)self planGenerationError];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTRecoverableErrorReadFrom(self, (uint64_t)a3);
}

- (void)deletePlanGenerationError
{
  if (self->_whichOneof_Recoverableerror == 1)
  {
    self->_unint64_t whichOneof_Recoverableerror = 0;
    self->_planGenerationError = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTPlanGenerationError)planGenerationError
{
  if (self->_whichOneof_Recoverableerror == 1) {
    v2 = self->_planGenerationError;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPlanGenerationError:(id)a3
{
  self->_unint64_t whichOneof_Recoverableerror = a3 != 0;
  objc_storeStrong((id *)&self->_planGenerationError, a3);
}

@end