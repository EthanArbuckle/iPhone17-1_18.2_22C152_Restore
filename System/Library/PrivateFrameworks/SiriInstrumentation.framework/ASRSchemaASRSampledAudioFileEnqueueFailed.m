@interface ASRSchemaASRSampledAudioFileEnqueueFailed
- (ASRSchemaASRSampledAudioFileEnqueueFailed)initWithDictionary:(id)a3;
- (ASRSchemaASRSampledAudioFileEnqueueFailed)initWithJSON:(id)a3;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasOriginalAsrId;
- (BOOL)hasUnderlyingErrorCode;
- (BOOL)hasUnderlyingErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)errorDomain;
- (NSString)underlyingErrorDomain;
- (SISchemaUUID)originalAsrId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (int)underlyingErrorCode;
- (unint64_t)hash;
- (void)deleteErrorCode;
- (void)deleteErrorDomain;
- (void)deleteOriginalAsrId;
- (void)deleteUnderlyingErrorCode;
- (void)deleteUnderlyingErrorDomain;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)setHasOriginalAsrId:(BOOL)a3;
- (void)setHasUnderlyingErrorCode:(BOOL)a3;
- (void)setHasUnderlyingErrorDomain:(BOOL)a3;
- (void)setOriginalAsrId:(id)a3;
- (void)setUnderlyingErrorCode:(int)a3;
- (void)setUnderlyingErrorDomain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRSampledAudioFileEnqueueFailed

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASRSchemaASRSampledAudioFileEnqueueFailed;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self originalAsrId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self deleteOriginalAsrId];
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
  objc_storeStrong((id *)&self->_underlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_originalAsrId, 0);
}

- (void)setHasUnderlyingErrorDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasOriginalAsrId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setUnderlyingErrorDomain:(id)a3
{
}

- (NSString)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (int)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setOriginalAsrId:(id)a3
{
}

- (SISchemaUUID)originalAsrId
{
  return self->_originalAsrId;
}

- (ASRSchemaASRSampledAudioFileEnqueueFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASRSchemaASRSampledAudioFileEnqueueFailed;
  v5 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalAsrId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ASRSchemaASRSampledAudioFileEnqueueFailed *)v5 setOriginalAsrId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRSampledAudioFileEnqueueFailed setErrorCode:](v5, "setErrorCode:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(ASRSchemaASRSampledAudioFileEnqueueFailed *)v5 setErrorDomain:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"underlyingErrorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRSampledAudioFileEnqueueFailed setUnderlyingErrorCode:](v5, "setUnderlyingErrorCode:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"underlyingErrorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(ASRSchemaASRSampledAudioFileEnqueueFailed *)v5 setUnderlyingErrorDomain:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (ASRSchemaASRSampledAudioFileEnqueueFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[ASRSchemaASRSampledAudioFileEnqueueFailed errorCode](self, "errorCode"));
    [v3 setObject:v4 forKeyedSubscript:@"errorCode"];
  }
  if (self->_errorDomain)
  {
    v5 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self errorDomain];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"errorDomain"];
  }
  if (self->_originalAsrId)
  {
    uint64_t v7 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self originalAsrId];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"originalAsrId"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"originalAsrId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithInt:", -[ASRSchemaASRSampledAudioFileEnqueueFailed underlyingErrorCode](self, "underlyingErrorCode"));
    [v3 setObject:v10 forKeyedSubscript:@"underlyingErrorCode"];
  }
  if (self->_underlyingErrorDomain)
  {
    v11 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self underlyingErrorDomain];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"underlyingErrorDomain"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalAsrId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_errorDomain hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_underlyingErrorCode;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_underlyingErrorDomain hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  NSUInteger v5 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self originalAsrId];
  uint64_t v6 = [v4 originalAsrId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_22;
  }
  uint64_t v7 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self originalAsrId];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self originalAsrId];
    v10 = [v4 originalAsrId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_23;
    }
  }
  NSUInteger v5 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self errorDomain];
  uint64_t v6 = [v4 errorDomain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self errorDomain];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self errorDomain];
    objc_super v16 = [v4 errorDomain];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  int v18 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v18 != ((v4[48] >> 1) & 1)) {
    goto LABEL_23;
  }
  if (v18)
  {
    int underlyingErrorCode = self->_underlyingErrorCode;
    if (underlyingErrorCode != [v4 underlyingErrorCode]) {
      goto LABEL_23;
    }
  }
  NSUInteger v5 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self underlyingErrorDomain];
  uint64_t v6 = [v4 underlyingErrorDomain];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v20 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self underlyingErrorDomain];
    if (!v20)
    {

LABEL_26:
      BOOL v25 = 1;
      goto LABEL_24;
    }
    v21 = (void *)v20;
    v22 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self underlyingErrorDomain];
    v23 = [v4 underlyingErrorDomain];
    char v24 = [v22 isEqual:v23];

    if (v24) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_22:
  }
LABEL_23:
  BOOL v25 = 0;
LABEL_24:

  return v25;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self originalAsrId];

  if (v4)
  {
    NSUInteger v5 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self originalAsrId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v6 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self errorDomain];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(ASRSchemaASRSampledAudioFileEnqueueFailed *)self underlyingErrorDomain];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRSampledAudioFileEnqueueFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteUnderlyingErrorDomain
{
}

- (BOOL)hasUnderlyingErrorDomain
{
  return self->_underlyingErrorDomain != 0;
}

- (void)deleteUnderlyingErrorCode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUnderlyingErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUnderlyingErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUnderlyingErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int underlyingErrorCode = a3;
}

- (void)deleteErrorDomain
{
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int errorCode = a3;
}

- (void)deleteOriginalAsrId
{
}

- (BOOL)hasOriginalAsrId
{
  return self->_originalAsrId != 0;
}

@end