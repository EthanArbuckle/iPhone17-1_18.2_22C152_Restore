@interface POMMESSchemaPOMMESCacheLookupEnded
- (BOOL)hasResult;
- (BOOL)hasResultDomain;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)resultDomain;
- (POMMESSchemaPOMMESCacheEntry)result;
- (POMMESSchemaPOMMESCacheLookupEnded)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESCacheLookupEnded)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)status;
- (unint64_t)hash;
- (void)deleteResult;
- (void)deleteResultDomain;
- (void)deleteStatus;
- (void)setHasResult:(BOOL)a3;
- (void)setHasResultDomain:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setResult:(id)a3;
- (void)setResultDomain:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESCacheLookupEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESCacheLookupEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESCacheLookupEnded *)self result];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(POMMESSchemaPOMMESCacheLookupEnded *)self deleteResult];
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
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_resultDomain, 0);
}

- (void)setHasResult:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasResultDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setResult:(id)a3
{
}

- (POMMESSchemaPOMMESCacheEntry)result
{
  return self->_result;
}

- (void)setResultDomain:(id)a3
{
}

- (NSString)resultDomain
{
  return self->_resultDomain;
}

- (int)status
{
  return self->_status;
}

- (POMMESSchemaPOMMESCacheLookupEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)POMMESSchemaPOMMESCacheLookupEnded;
  v5 = [(POMMESSchemaPOMMESCacheLookupEnded *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheLookupEnded setStatus:](v5, "setStatus:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"resultDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(POMMESSchemaPOMMESCacheLookupEnded *)v5 setResultDomain:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"result"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[POMMESSchemaPOMMESCacheEntry alloc] initWithDictionary:v9];
      [(POMMESSchemaPOMMESCacheLookupEnded *)v5 setResult:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESCacheLookupEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESCacheLookupEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESCacheLookupEnded *)self dictionaryRepresentation];
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
  if (self->_result)
  {
    id v4 = [(POMMESSchemaPOMMESCacheLookupEnded *)self result];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"result"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"result"];
    }
  }
  if (self->_resultDomain)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESCacheLookupEnded *)self resultDomain];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"resultDomain"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v9 = [(POMMESSchemaPOMMESCacheLookupEnded *)self status] - 1;
    if (v9 > 2) {
      v10 = @"POMMESCACHELOOKUPENDEDSTATUS_UNKNOWN";
    }
    else {
      v10 = off_1E5EBBD18[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"status"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_status;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_resultDomain hash] ^ v3;
  return v4 ^ [(POMMESSchemaPOMMESCacheEntry *)self->_result hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int status = self->_status;
    if (status != [v4 status]) {
      goto LABEL_15;
    }
  }
  v6 = [(POMMESSchemaPOMMESCacheLookupEnded *)self resultDomain];
  uint64_t v7 = [v4 resultDomain];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(POMMESSchemaPOMMESCacheLookupEnded *)self resultDomain];
  if (v8)
  {
    unsigned int v9 = (void *)v8;
    v10 = [(POMMESSchemaPOMMESCacheLookupEnded *)self resultDomain];
    v11 = [v4 resultDomain];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(POMMESSchemaPOMMESCacheLookupEnded *)self result];
  uint64_t v7 = [v4 result];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(POMMESSchemaPOMMESCacheLookupEnded *)self result];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(POMMESSchemaPOMMESCacheLookupEnded *)self result];
    v16 = [v4 result];
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
  id v8 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v4 = [(POMMESSchemaPOMMESCacheLookupEnded *)self resultDomain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(POMMESSchemaPOMMESCacheLookupEnded *)self result];

  v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESCacheLookupEnded *)self result];
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESCacheLookupEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteResult
{
}

- (BOOL)hasResult
{
  return self->_result != 0;
}

- (void)deleteResultDomain
{
}

- (BOOL)hasResultDomain
{
  return self->_resultDomain != 0;
}

- (void)deleteStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int status = a3;
}

@end