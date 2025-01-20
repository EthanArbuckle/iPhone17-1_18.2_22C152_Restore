@interface IFPlatformRequestSchemaIFPlatformRequestEnded
- (BOOL)hasHandledError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFPlatformRequestSchemaIFPlatformRequestEnded)initWithDictionary:(id)a3;
- (IFPlatformRequestSchemaIFPlatformRequestEnded)initWithJSON:(id)a3;
- (IFTSchemaIFTIntelligenceFlowError)handledError;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteHandledError;
- (void)setHandledError:(id)a3;
- (void)setHasHandledError:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFPlatformRequestSchemaIFPlatformRequestEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFPlatformRequestSchemaIFPlatformRequestEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFPlatformRequestSchemaIFPlatformRequestEnded *)self handledError];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IFPlatformRequestSchemaIFPlatformRequestEnded *)self deleteHandledError];
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

- (void)setHasHandledError:(BOOL)a3
{
  self->_hasHandledError = a3;
}

- (void)setHandledError:(id)a3
{
}

- (IFTSchemaIFTIntelligenceFlowError)handledError
{
  return self->_handledError;
}

- (IFPlatformRequestSchemaIFPlatformRequestEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFPlatformRequestSchemaIFPlatformRequestEnded;
  v5 = [(IFPlatformRequestSchemaIFPlatformRequestEnded *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"handledError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTIntelligenceFlowError alloc] initWithDictionary:v6];
      [(IFPlatformRequestSchemaIFPlatformRequestEnded *)v5 setHandledError:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (IFPlatformRequestSchemaIFPlatformRequestEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFPlatformRequestSchemaIFPlatformRequestEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFPlatformRequestSchemaIFPlatformRequestEnded *)self dictionaryRepresentation];
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
  if (self->_handledError)
  {
    id v4 = [(IFPlatformRequestSchemaIFPlatformRequestEnded *)self handledError];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"handledError"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"handledError"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(IFTSchemaIFTIntelligenceFlowError *)self->_handledError hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(IFPlatformRequestSchemaIFPlatformRequestEnded *)self handledError];
    v6 = [v4 handledError];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(IFPlatformRequestSchemaIFPlatformRequestEnded *)self handledError];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      objc_super v9 = (void *)v8;
      objc_super v10 = [(IFPlatformRequestSchemaIFPlatformRequestEnded *)self handledError];
      v11 = [v4 handledError];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(IFPlatformRequestSchemaIFPlatformRequestEnded *)self handledError];

  if (v4)
  {
    v5 = [(IFPlatformRequestSchemaIFPlatformRequestEnded *)self handledError];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFPlatformRequestSchemaIFPlatformRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteHandledError
{
}

- (BOOL)hasHandledError
{
  return self->_handledError != 0;
}

@end