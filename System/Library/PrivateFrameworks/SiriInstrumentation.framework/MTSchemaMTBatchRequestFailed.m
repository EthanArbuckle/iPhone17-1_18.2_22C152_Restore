@interface MTSchemaMTBatchRequestFailed
- (BOOL)hasError;
- (BOOL)hasNumParagraphFailures;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTBatchRequestFailed)initWithDictionary:(id)a3;
- (MTSchemaMTBatchRequestFailed)initWithJSON:(id)a3;
- (MTSchemaMTError)error;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)numParagraphFailures;
- (void)deleteError;
- (void)deleteNumParagraphFailures;
- (void)setError:(id)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasNumParagraphFailures:(BOOL)a3;
- (void)setNumParagraphFailures:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTBatchRequestFailed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTSchemaMTBatchRequestFailed;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MTSchemaMTBatchRequestFailed *)self error];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(MTSchemaMTBatchRequestFailed *)self deleteError];
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

- (void)setHasError:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setError:(id)a3
{
}

- (MTSchemaMTError)error
{
  return self->_error;
}

- (unsigned)numParagraphFailures
{
  return self->_numParagraphFailures;
}

- (MTSchemaMTBatchRequestFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTSchemaMTBatchRequestFailed;
  v5 = [(MTSchemaMTBatchRequestFailed *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numParagraphFailures"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTBatchRequestFailed setNumParagraphFailures:](v5, "setNumParagraphFailures:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"error"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[MTSchemaMTError alloc] initWithDictionary:v7];
      [(MTSchemaMTBatchRequestFailed *)v5 setError:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (MTSchemaMTBatchRequestFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTBatchRequestFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTBatchRequestFailed *)self dictionaryRepresentation];
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
  if (self->_error)
  {
    id v4 = [(MTSchemaMTBatchRequestFailed *)self error];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"error"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"error"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MTSchemaMTBatchRequestFailed numParagraphFailures](self, "numParagraphFailures"));
    [v3 setObject:v7 forKeyedSubscript:@"numParagraphFailures"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_numParagraphFailures;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(MTSchemaMTError *)self->_error hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (unsigned int numParagraphFailures = self->_numParagraphFailures,
            numParagraphFailures == [v4 numParagraphFailures]))
      {
        v6 = [(MTSchemaMTBatchRequestFailed *)self error];
        uint64_t v7 = [v4 error];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(MTSchemaMTBatchRequestFailed *)self error];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(MTSchemaMTBatchRequestFailed *)self error];
          v12 = [v4 error];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  id v4 = [(MTSchemaMTBatchRequestFailed *)self error];

  v5 = v7;
  if (v4)
  {
    v6 = [(MTSchemaMTBatchRequestFailed *)self error];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTBatchRequestFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteError
{
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteNumParagraphFailures
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumParagraphFailures:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumParagraphFailures
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumParagraphFailures:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numParagraphFailures = a3;
}

@end