@interface IFTSchemaIFTActionFailure
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasFailure;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTActionFailure)initWithDictionary:(id)a3;
- (IFTSchemaIFTActionFailure)initWithJSON:(id)a3;
- (IFTSchemaIFTActionFailureFailure)failure;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteFailure;
- (void)setExists:(BOOL)a3;
- (void)setFailure:(id)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasFailure:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTActionFailure

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTActionFailure;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTActionFailure *)self failure];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IFTSchemaIFTActionFailure *)self deleteFailure];
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
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setFailure:(id)a3
{
}

- (IFTSchemaIFTActionFailureFailure)failure
{
  return self->_failure;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaIFTActionFailure)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFTSchemaIFTActionFailure;
  v5 = [(IFTSchemaIFTActionFailure *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionFailure setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"failure"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[IFTSchemaIFTActionFailureFailure alloc] initWithDictionary:v7];
      [(IFTSchemaIFTActionFailure *)v5 setFailure:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (IFTSchemaIFTActionFailure)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTActionFailure *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTActionFailure *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionFailure exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_failure)
  {
    v5 = [(IFTSchemaIFTActionFailure *)self failure];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"failure"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"failure"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(IFTSchemaIFTActionFailureFailure *)self->_failure hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int exists = self->_exists, exists == [v4 exists]))
      {
        v6 = [(IFTSchemaIFTActionFailure *)self failure];
        uint64_t v7 = [v4 failure];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(IFTSchemaIFTActionFailure *)self failure];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(IFTSchemaIFTActionFailure *)self failure];
          v12 = [v4 failure];
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
    PBDataWriterWriteBOOLField();
  }
  id v4 = [(IFTSchemaIFTActionFailure *)self failure];

  v5 = v7;
  if (v4)
  {
    v6 = [(IFTSchemaIFTActionFailure *)self failure];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionFailureReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailure
{
}

- (BOOL)hasFailure
{
  return self->_failure != 0;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end