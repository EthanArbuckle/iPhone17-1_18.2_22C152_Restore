@interface IFTSchemaASTFlatExprPickVariant
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasPickType;
- (BOOL)hasRawEventId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaASTFlatExprPickVariant)initWithDictionary:(id)a3;
- (IFTSchemaASTFlatExprPickVariant)initWithJSON:(id)a3;
- (IFTSchemaASTPickType)pickType;
- (NSData)jsonData;
- (SISchemaUUID)rawEventId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deletePickType;
- (void)deleteRawEventId;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasPickType:(BOOL)a3;
- (void)setHasRawEventId:(BOOL)a3;
- (void)setPickType:(id)a3;
- (void)setRawEventId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaASTFlatExprPickVariant

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaASTFlatExprPickVariant;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaASTFlatExprPickVariant *)self rawEventId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaASTFlatExprPickVariant *)self deleteRawEventId];
  }
  v9 = [(IFTSchemaASTFlatExprPickVariant *)self pickType];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaASTFlatExprPickVariant *)self deletePickType];
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
  objc_storeStrong((id *)&self->_pickType, 0);
  objc_storeStrong((id *)&self->_rawEventId, 0);
}

- (void)setHasPickType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasRawEventId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setPickType:(id)a3
{
}

- (IFTSchemaASTPickType)pickType
{
  return self->_pickType;
}

- (void)setRawEventId:(id)a3
{
}

- (SISchemaUUID)rawEventId
{
  return self->_rawEventId;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaASTFlatExprPickVariant)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaASTFlatExprPickVariant;
  v5 = [(IFTSchemaASTFlatExprPickVariant *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaASTFlatExprPickVariant setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"rawEventId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[SISchemaUUID alloc] initWithDictionary:v7];
      [(IFTSchemaASTFlatExprPickVariant *)v5 setRawEventId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"pickType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[IFTSchemaASTPickType alloc] initWithDictionary:v9];
      [(IFTSchemaASTFlatExprPickVariant *)v5 setPickType:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (IFTSchemaASTFlatExprPickVariant)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaASTFlatExprPickVariant *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaASTFlatExprPickVariant *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaASTFlatExprPickVariant exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_pickType)
  {
    v5 = [(IFTSchemaASTFlatExprPickVariant *)self pickType];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"pickType"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"pickType"];
    }
  }
  if (self->_rawEventId)
  {
    int v8 = [(IFTSchemaASTFlatExprPickVariant *)self rawEventId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"rawEventId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"rawEventId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SISchemaUUID *)self->_rawEventId hash] ^ v3;
  return v4 ^ [(IFTSchemaASTPickType *)self->_pickType hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_15;
    }
  }
  v6 = [(IFTSchemaASTFlatExprPickVariant *)self rawEventId];
  uint64_t v7 = [v4 rawEventId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(IFTSchemaASTFlatExprPickVariant *)self rawEventId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaASTFlatExprPickVariant *)self rawEventId];
    int v11 = [v4 rawEventId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaASTFlatExprPickVariant *)self pickType];
  uint64_t v7 = [v4 pickType];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(IFTSchemaASTFlatExprPickVariant *)self pickType];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(IFTSchemaASTFlatExprPickVariant *)self pickType];
    v16 = [v4 pickType];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v4 = [(IFTSchemaASTFlatExprPickVariant *)self rawEventId];

  if (v4)
  {
    v5 = [(IFTSchemaASTFlatExprPickVariant *)self rawEventId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(IFTSchemaASTFlatExprPickVariant *)self pickType];

  uint64_t v7 = v9;
  if (v6)
  {
    uint64_t v8 = [(IFTSchemaASTFlatExprPickVariant *)self pickType];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaASTFlatExprPickVariantReadFrom(self, (uint64_t)a3);
}

- (void)deletePickType
{
}

- (BOOL)hasPickType
{
  return self->_pickType != 0;
}

- (void)deleteRawEventId
{
}

- (BOOL)hasRawEventId
{
  return self->_rawEventId != 0;
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