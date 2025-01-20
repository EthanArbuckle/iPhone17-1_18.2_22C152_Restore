@interface SISchemaPNRFatalErrorInfo
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)errorCode;
- (NSString)errorDomain;
- (SISchemaPNRFatalErrorInfo)initWithDictionary:(id)a3;
- (SISchemaPNRFatalErrorInfo)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteErrorCode;
- (void)deleteErrorDomain;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaPNRFatalErrorInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

- (void)setHasErrorCode:(BOOL)a3
{
  self->_hasErrorCode = a3;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  self->_hasErrorDomain = a3;
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (SISchemaPNRFatalErrorInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaPNRFatalErrorInfo;
  v5 = [(SISchemaPNRFatalErrorInfo *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaPNRFatalErrorInfo *)v5 setErrorDomain:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaPNRFatalErrorInfo *)v5 setErrorCode:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaPNRFatalErrorInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaPNRFatalErrorInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaPNRFatalErrorInfo *)self dictionaryRepresentation];
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
  if (self->_errorCode)
  {
    id v4 = [(SISchemaPNRFatalErrorInfo *)self errorCode];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"errorCode"];
  }
  if (self->_errorDomain)
  {
    v6 = [(SISchemaPNRFatalErrorInfo *)self errorDomain];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"errorDomain"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorDomain hash];
  return [(NSString *)self->_errorCode hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaPNRFatalErrorInfo *)self errorDomain];
  v6 = [v4 errorDomain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaPNRFatalErrorInfo *)self errorDomain];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SISchemaPNRFatalErrorInfo *)self errorDomain];
    v10 = [v4 errorDomain];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SISchemaPNRFatalErrorInfo *)self errorCode];
  v6 = [v4 errorCode];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SISchemaPNRFatalErrorInfo *)self errorCode];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(SISchemaPNRFatalErrorInfo *)self errorCode];
    v15 = [v4 errorCode];
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
  id v6 = a3;
  id v4 = [(SISchemaPNRFatalErrorInfo *)self errorDomain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(SISchemaPNRFatalErrorInfo *)self errorCode];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaPNRFatalErrorInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteErrorCode
{
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (void)deleteErrorDomain
{
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

@end