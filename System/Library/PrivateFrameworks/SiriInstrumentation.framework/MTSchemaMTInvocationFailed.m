@interface MTSchemaMTInvocationFailed
- (BOOL)hasError;
- (BOOL)hasLocalePair;
- (BOOL)hasQssSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTError)error;
- (MTSchemaMTInvocationFailed)initWithDictionary:(id)a3;
- (MTSchemaMTInvocationFailed)initWithJSON:(id)a3;
- (MTSchemaMTLocalePair)localePair;
- (NSData)jsonData;
- (SISchemaUUID)qssSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteError;
- (void)deleteLocalePair;
- (void)deleteQssSessionId;
- (void)setError:(id)a3;
- (void)setHasError:(BOOL)a3;
- (void)setHasLocalePair:(BOOL)a3;
- (void)setHasQssSessionId:(BOOL)a3;
- (void)setLocalePair:(id)a3;
- (void)setQssSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTInvocationFailed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTSchemaMTInvocationFailed;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(MTSchemaMTInvocationFailed *)self error];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MTSchemaMTInvocationFailed *)self deleteError];
  }
  v9 = [(MTSchemaMTInvocationFailed *)self qssSessionId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MTSchemaMTInvocationFailed *)self deleteQssSessionId];
  }
  v12 = [(MTSchemaMTInvocationFailed *)self localePair];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(MTSchemaMTInvocationFailed *)self deleteLocalePair];
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
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setHasLocalePair:(BOOL)a3
{
  self->_hasLocalePair = a3;
}

- (void)setHasQssSessionId:(BOOL)a3
{
  self->_hasQssSessionId = a3;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
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

- (void)setError:(id)a3
{
}

- (MTSchemaMTError)error
{
  return self->_error;
}

- (MTSchemaMTInvocationFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTSchemaMTInvocationFailed;
  v5 = [(MTSchemaMTInvocationFailed *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"error"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[MTSchemaMTError alloc] initWithDictionary:v6];
      [(MTSchemaMTInvocationFailed *)v5 setError:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"qssSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(MTSchemaMTInvocationFailed *)v5 setQssSessionId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"localePair"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[MTSchemaMTLocalePair alloc] initWithDictionary:v10];
      [(MTSchemaMTInvocationFailed *)v5 setLocalePair:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (MTSchemaMTInvocationFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTInvocationFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTInvocationFailed *)self dictionaryRepresentation];
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
    id v4 = [(MTSchemaMTInvocationFailed *)self error];
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
  if (self->_localePair)
  {
    uint64_t v7 = [(MTSchemaMTInvocationFailed *)self localePair];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"localePair"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"localePair"];
    }
  }
  if (self->_qssSessionId)
  {
    v10 = [(MTSchemaMTInvocationFailed *)self qssSessionId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"qssSessionId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"qssSessionId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MTSchemaMTError *)self->_error hash];
  unint64_t v4 = [(SISchemaUUID *)self->_qssSessionId hash] ^ v3;
  return v4 ^ [(MTSchemaMTLocalePair *)self->_localePair hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(MTSchemaMTInvocationFailed *)self error];
  v6 = [v4 error];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(MTSchemaMTInvocationFailed *)self error];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(MTSchemaMTInvocationFailed *)self error];
    v10 = [v4 error];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(MTSchemaMTInvocationFailed *)self qssSessionId];
  v6 = [v4 qssSessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(MTSchemaMTInvocationFailed *)self qssSessionId];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(MTSchemaMTInvocationFailed *)self qssSessionId];
    v15 = [v4 qssSessionId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(MTSchemaMTInvocationFailed *)self localePair];
  v6 = [v4 localePair];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(MTSchemaMTInvocationFailed *)self localePair];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(MTSchemaMTInvocationFailed *)self localePair];
    v20 = [v4 localePair];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(MTSchemaMTInvocationFailed *)self error];

  if (v4)
  {
    v5 = [(MTSchemaMTInvocationFailed *)self error];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(MTSchemaMTInvocationFailed *)self qssSessionId];

  if (v6)
  {
    uint64_t v7 = [(MTSchemaMTInvocationFailed *)self qssSessionId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(MTSchemaMTInvocationFailed *)self localePair];

  if (v8)
  {
    v9 = [(MTSchemaMTInvocationFailed *)self localePair];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTInvocationFailedReadFrom(self, (uint64_t)a3);
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

- (void)deleteError
{
}

- (BOOL)hasError
{
  return self->_error != 0;
}

@end