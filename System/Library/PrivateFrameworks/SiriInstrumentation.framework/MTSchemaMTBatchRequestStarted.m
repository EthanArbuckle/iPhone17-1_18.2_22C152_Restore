@interface MTSchemaMTBatchRequestStarted
- (BOOL)hasNumParagraphs;
- (BOOL)hasSequenceNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTBatchRequestStarted)initWithDictionary:(id)a3;
- (MTSchemaMTBatchRequestStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)sequenceNumber;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)numParagraphs;
- (void)deleteNumParagraphs;
- (void)deleteSequenceNumber;
- (void)setHasNumParagraphs:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setNumParagraphs:(unsigned int)a3;
- (void)setSequenceNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTBatchRequestStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setSequenceNumber:(id)a3
{
}

- (NSString)sequenceNumber
{
  return self->_sequenceNumber;
}

- (unsigned)numParagraphs
{
  return self->_numParagraphs;
}

- (MTSchemaMTBatchRequestStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTSchemaMTBatchRequestStarted;
  v5 = [(MTSchemaMTBatchRequestStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numParagraphs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTBatchRequestStarted setNumParagraphs:](v5, "setNumParagraphs:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"sequenceNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(MTSchemaMTBatchRequestStarted *)v5 setSequenceNumber:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (MTSchemaMTBatchRequestStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTBatchRequestStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTBatchRequestStarted *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MTSchemaMTBatchRequestStarted numParagraphs](self, "numParagraphs"));
    [v3 setObject:v4 forKeyedSubscript:@"numParagraphs"];
  }
  if (self->_sequenceNumber)
  {
    v5 = [(MTSchemaMTBatchRequestStarted *)self sequenceNumber];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"sequenceNumber"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_numParagraphs;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_sequenceNumber hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (unsigned int numParagraphs = self->_numParagraphs, numParagraphs == [v4 numParagraphs]))
      {
        v6 = [(MTSchemaMTBatchRequestStarted *)self sequenceNumber];
        uint64_t v7 = [v4 sequenceNumber];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(MTSchemaMTBatchRequestStarted *)self sequenceNumber];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(MTSchemaMTBatchRequestStarted *)self sequenceNumber];
          v12 = [v4 sequenceNumber];
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
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  id v4 = [(MTSchemaMTBatchRequestStarted *)self sequenceNumber];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTBatchRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSequenceNumber
{
}

- (BOOL)hasSequenceNumber
{
  return self->_sequenceNumber != 0;
}

- (void)deleteNumParagraphs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumParagraphs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumParagraphs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumParagraphs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numParagraphs = a3;
}

@end