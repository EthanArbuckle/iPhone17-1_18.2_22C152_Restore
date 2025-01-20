@interface SIServiceInstrumentationBatchResponse
- (BOOL)hasBatch_id;
- (BOOL)hasMessage;
- (BOOL)hasStatus_code;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)batch_id;
- (NSData)jsonData;
- (NSString)message;
- (SIServiceInstrumentationBatchResponse)initWithDictionary:(id)a3;
- (SIServiceInstrumentationBatchResponse)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)status_code;
- (unint64_t)hash;
- (void)deleteBatch_id;
- (void)deleteMessage;
- (void)deleteStatus_code;
- (void)setBatch_id:(id)a3;
- (void)setHasBatch_id:(BOOL)a3;
- (void)setHasMessage:(BOOL)a3;
- (void)setHasStatus_code:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setStatus_code:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIServiceInstrumentationBatchResponse

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_batch_id, 0);
}

- (void)setHasMessage:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasBatch_id:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (int)status_code
{
  return self->_status_code;
}

- (void)setBatch_id:(id)a3
{
}

- (NSData)batch_id
{
  return self->_batch_id;
}

- (SIServiceInstrumentationBatchResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIServiceInstrumentationBatchResponse;
  v5 = [(SIServiceInstrumentationBatchResponse *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"batchId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      [(SIServiceInstrumentationBatchResponse *)v5 setBatch_id:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"statusCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIServiceInstrumentationBatchResponse setStatus_code:](v5, "setStatus_code:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"message"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(SIServiceInstrumentationBatchResponse *)v5 setMessage:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (SIServiceInstrumentationBatchResponse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SIServiceInstrumentationBatchResponse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SIServiceInstrumentationBatchResponse *)self dictionaryRepresentation];
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
  if (self->_batch_id)
  {
    id v4 = [(SIServiceInstrumentationBatchResponse *)self batch_id];
    v5 = [v4 base64EncodedStringWithOptions:0];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"batchId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"batchId"];
    }
  }
  if (self->_message)
  {
    uint64_t v7 = [(SIServiceInstrumentationBatchResponse *)self message];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"message"];
  }
  if (*(unsigned char *)&self->_has)
  {
    if ([(SIServiceInstrumentationBatchResponse *)self status_code] == 1) {
      v9 = @"FAILURE";
    }
    else {
      v9 = @"SUCCESS";
    }
    [v3 setObject:v9 forKeyedSubscript:@"statusCode"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_batch_id hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_status_code;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_message hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(SIServiceInstrumentationBatchResponse *)self batch_id];
  v6 = objc_msgSend(v4, "batch_id");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(SIServiceInstrumentationBatchResponse *)self batch_id];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SIServiceInstrumentationBatchResponse *)self batch_id];
    v10 = objc_msgSend(v4, "batch_id");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int status_code = self->_status_code;
    if (status_code != objc_msgSend(v4, "status_code")) {
      goto LABEL_15;
    }
  }
  v5 = [(SIServiceInstrumentationBatchResponse *)self message];
  v6 = [v4 message];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(SIServiceInstrumentationBatchResponse *)self message];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(SIServiceInstrumentationBatchResponse *)self message];
    v16 = [v4 message];
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
  id v7 = a3;
  uint64_t v4 = [(SIServiceInstrumentationBatchResponse *)self batch_id];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(SIServiceInstrumentationBatchResponse *)self message];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIServiceInstrumentationBatchResponseReadFrom(self, (uint64_t)a3);
}

- (void)deleteMessage
{
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (void)deleteStatus_code
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStatus_code:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus_code
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatus_code:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int status_code = a3;
}

- (void)deleteBatch_id
{
}

- (BOOL)hasBatch_id
{
  return self->_batch_id != 0;
}

@end