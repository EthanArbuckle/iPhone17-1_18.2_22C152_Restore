@interface MTSchemaMTInvocationCancelled
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasLocalePair;
- (BOOL)hasQssSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTInvocationCancelled)initWithDictionary:(id)a3;
- (MTSchemaMTInvocationCancelled)initWithJSON:(id)a3;
- (MTSchemaMTLocalePair)localePair;
- (NSData)jsonData;
- (SISchemaUUID)qssSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteLocalePair;
- (void)deleteQssSessionId;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasLocalePair:(BOOL)a3;
- (void)setHasQssSessionId:(BOOL)a3;
- (void)setLocalePair:(id)a3;
- (void)setQssSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTInvocationCancelled

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTSchemaMTInvocationCancelled;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(MTSchemaMTInvocationCancelled *)self qssSessionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MTSchemaMTInvocationCancelled *)self deleteQssSessionId];
  }
  v9 = [(MTSchemaMTInvocationCancelled *)self localePair];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MTSchemaMTInvocationCancelled *)self deleteLocalePair];
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
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_qssSessionId, 0);
}

- (void)setHasLocalePair:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasQssSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLocalePair:(id)a3
{
}

- (MTSchemaMTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setQssSessionId:(id)a3
{
}

- (SISchemaUUID)qssSessionId
{
  return self->_qssSessionId;
}

- (BOOL)exists
{
  return self->_exists;
}

- (MTSchemaMTInvocationCancelled)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTSchemaMTInvocationCancelled;
  v5 = [(MTSchemaMTInvocationCancelled *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTInvocationCancelled setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"qssSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[SISchemaUUID alloc] initWithDictionary:v7];
      [(MTSchemaMTInvocationCancelled *)v5 setQssSessionId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"localePair"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[MTSchemaMTLocalePair alloc] initWithDictionary:v9];
      [(MTSchemaMTInvocationCancelled *)v5 setLocalePair:v10];
    }
    int v11 = v5;
  }
  return v5;
}

- (MTSchemaMTInvocationCancelled)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTInvocationCancelled *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTInvocationCancelled *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MTSchemaMTInvocationCancelled exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  if (self->_localePair)
  {
    v5 = [(MTSchemaMTInvocationCancelled *)self localePair];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"localePair"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"localePair"];
    }
  }
  if (self->_qssSessionId)
  {
    int v8 = [(MTSchemaMTInvocationCancelled *)self qssSessionId];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"qssSessionId"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"qssSessionId"];
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
  unint64_t v4 = [(SISchemaUUID *)self->_qssSessionId hash] ^ v3;
  return v4 ^ [(MTSchemaMTLocalePair *)self->_localePair hash];
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
  v6 = [(MTSchemaMTInvocationCancelled *)self qssSessionId];
  uint64_t v7 = [v4 qssSessionId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(MTSchemaMTInvocationCancelled *)self qssSessionId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(MTSchemaMTInvocationCancelled *)self qssSessionId];
    int v11 = [v4 qssSessionId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(MTSchemaMTInvocationCancelled *)self localePair];
  uint64_t v7 = [v4 localePair];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(MTSchemaMTInvocationCancelled *)self localePair];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(MTSchemaMTInvocationCancelled *)self localePair];
    v16 = [v4 localePair];
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
  unint64_t v4 = [(MTSchemaMTInvocationCancelled *)self qssSessionId];

  if (v4)
  {
    v5 = [(MTSchemaMTInvocationCancelled *)self qssSessionId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(MTSchemaMTInvocationCancelled *)self localePair];

  uint64_t v7 = v9;
  if (v6)
  {
    uint64_t v8 = [(MTSchemaMTInvocationCancelled *)self localePair];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTInvocationCancelledReadFrom(self, (uint64_t)a3);
}

- (void)deleteLocalePair
{
}

- (BOOL)hasLocalePair
{
  return self->_localePair != 0;
}

- (void)deleteQssSessionId
{
}

- (BOOL)hasQssSessionId
{
  return self->_qssSessionId != 0;
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