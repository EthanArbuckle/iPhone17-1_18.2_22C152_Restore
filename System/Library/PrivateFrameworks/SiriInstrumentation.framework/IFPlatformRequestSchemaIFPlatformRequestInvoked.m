@interface IFPlatformRequestSchemaIFPlatformRequestInvoked
- (BOOL)hasClientTraceId;
- (BOOL)hasIfSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFPlatformRequestSchemaIFPlatformRequestInvoked)initWithDictionary:(id)a3;
- (IFPlatformRequestSchemaIFPlatformRequestInvoked)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)clientTraceId;
- (SISchemaUUID)ifSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteClientTraceId;
- (void)deleteIfSessionId;
- (void)setClientTraceId:(id)a3;
- (void)setHasClientTraceId:(BOOL)a3;
- (void)setHasIfSessionId:(BOOL)a3;
- (void)setIfSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFPlatformRequestSchemaIFPlatformRequestInvoked

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFPlatformRequestSchemaIFPlatformRequestInvoked;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self ifSessionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self deleteIfSessionId];
  }
  v9 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self clientTraceId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self deleteClientTraceId];
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
  objc_storeStrong((id *)&self->_clientTraceId, 0);
  objc_storeStrong((id *)&self->_ifSessionId, 0);
}

- (void)setHasClientTraceId:(BOOL)a3
{
  self->_hasClientTraceId = a3;
}

- (void)setHasIfSessionId:(BOOL)a3
{
  self->_hasIfSessionId = a3;
}

- (void)setClientTraceId:(id)a3
{
}

- (SISchemaUUID)clientTraceId
{
  return self->_clientTraceId;
}

- (void)setIfSessionId:(id)a3
{
}

- (SISchemaUUID)ifSessionId
{
  return self->_ifSessionId;
}

- (IFPlatformRequestSchemaIFPlatformRequestInvoked)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFPlatformRequestSchemaIFPlatformRequestInvoked;
  v5 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ifSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)v5 setIfSessionId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"clientTraceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)v5 setClientTraceId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (IFPlatformRequestSchemaIFPlatformRequestInvoked)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self dictionaryRepresentation];
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
  if (self->_clientTraceId)
  {
    id v4 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self clientTraceId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"clientTraceId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"clientTraceId"];
    }
  }
  if (self->_ifSessionId)
  {
    uint64_t v7 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self ifSessionId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"ifSessionId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"ifSessionId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_ifSessionId hash];
  return [(SISchemaUUID *)self->_clientTraceId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self ifSessionId];
  v6 = [v4 ifSessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self ifSessionId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self ifSessionId];
    v10 = [v4 ifSessionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self clientTraceId];
  v6 = [v4 clientTraceId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self clientTraceId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self clientTraceId];
    v15 = [v4 clientTraceId];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self ifSessionId];

  if (v4)
  {
    v5 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self ifSessionId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self clientTraceId];

  if (v6)
  {
    uint64_t v7 = [(IFPlatformRequestSchemaIFPlatformRequestInvoked *)self clientTraceId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFPlatformRequestSchemaIFPlatformRequestInvokedReadFrom(self, (uint64_t)a3);
}

- (void)deleteClientTraceId
{
}

- (BOOL)hasClientTraceId
{
  return self->_clientTraceId != 0;
}

- (void)deleteIfSessionId
{
}

- (BOOL)hasIfSessionId
{
  return self->_ifSessionId != 0;
}

@end