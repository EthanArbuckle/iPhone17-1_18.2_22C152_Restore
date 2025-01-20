@interface ASRSchemaASRSampledAudioFileStorageFailed
- (ASRSchemaASRSampledAudioFileStorageFailed)initWithDictionary:(id)a3;
- (ASRSchemaASRSampledAudioFileStorageFailed)initWithJSON:(id)a3;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasSampledAudioStorageFailureReason;
- (BOOL)hasUnderlyingErrorCode;
- (BOOL)hasUnderlyingErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)errorDomain;
- (NSString)underlyingErrorDomain;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (int)sampledAudioStorageFailureReason;
- (int)underlyingErrorCode;
- (unint64_t)hash;
- (void)deleteErrorCode;
- (void)deleteErrorDomain;
- (void)deleteSampledAudioStorageFailureReason;
- (void)deleteUnderlyingErrorCode;
- (void)deleteUnderlyingErrorDomain;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)setHasSampledAudioStorageFailureReason:(BOOL)a3;
- (void)setHasUnderlyingErrorCode:(BOOL)a3;
- (void)setHasUnderlyingErrorDomain:(BOOL)a3;
- (void)setSampledAudioStorageFailureReason:(int)a3;
- (void)setUnderlyingErrorCode:(int)a3;
- (void)setUnderlyingErrorDomain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRSampledAudioFileStorageFailed

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
}

- (void)setHasUnderlyingErrorDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)sampledAudioStorageFailureReason
{
  return self->_sampledAudioStorageFailureReason;
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

- (ASRSchemaASRSampledAudioFileStorageFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASRSchemaASRSampledAudioFileStorageFailed;
  v5 = [(ASRSchemaASRSampledAudioFileStorageFailed *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRSampledAudioFileStorageFailed setErrorCode:](v5, "setErrorCode:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(ASRSchemaASRSampledAudioFileStorageFailed *)v5 setErrorDomain:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"underlyingErrorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRSampledAudioFileStorageFailed setUnderlyingErrorCode:](v5, "setUnderlyingErrorCode:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"underlyingErrorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(ASRSchemaASRSampledAudioFileStorageFailed *)v5 setUnderlyingErrorDomain:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"sampledAudioStorageFailureReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRSampledAudioFileStorageFailed setSampledAudioStorageFailureReason:](v5, "setSampledAudioStorageFailureReason:", [v12 intValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (ASRSchemaASRSampledAudioFileStorageFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRSampledAudioFileStorageFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[ASRSchemaASRSampledAudioFileStorageFailed errorCode](self, "errorCode"));
    [v3 setObject:v4 forKeyedSubscript:@"errorCode"];
  }
  if (self->_errorDomain)
  {
    v5 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self errorDomain];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"errorDomain"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    unsigned int v8 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self sampledAudioStorageFailureReason]- 1;
    if (v8 > 3) {
      v9 = @"ASRSAMPLEDAUDIOSTORAGEFAILUREREASON_UNKNOWN";
    }
    else {
      v9 = off_1E5EAC830[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"sampledAudioStorageFailureReason"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithInt:", -[ASRSchemaASRSampledAudioFileStorageFailed underlyingErrorCode](self, "underlyingErrorCode"));
    [v3 setObject:v10 forKeyedSubscript:@"underlyingErrorCode"];
  }
  if (self->_underlyingErrorDomain)
  {
    v11 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self underlyingErrorDomain];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"underlyingErrorDomain"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_errorDomain hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_underlyingErrorCode;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_underlyingErrorDomain hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_sampledAudioStorageFailureReason;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[44] & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_18;
    }
  }
  NSUInteger v6 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self errorDomain];
  uint64_t v7 = [v4 errorDomain];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self errorDomain];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self errorDomain];
    v11 = [v4 errorDomain];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v13 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v13 != ((v4[44] >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v13)
  {
    int underlyingErrorCode = self->_underlyingErrorCode;
    if (underlyingErrorCode != [v4 underlyingErrorCode]) {
      goto LABEL_18;
    }
  }
  NSUInteger v6 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self underlyingErrorDomain];
  uint64_t v7 = [v4 underlyingErrorDomain];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v15 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self underlyingErrorDomain];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self underlyingErrorDomain];
    v18 = [v4 underlyingErrorDomain];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v22 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v22 == ((v4[44] >> 2) & 1))
  {
    if (!v22
      || (int sampledAudioStorageFailureReason = self->_sampledAudioStorageFailureReason,
          sampledAudioStorageFailureReason == [v4 sampledAudioStorageFailureReason]))
    {
      BOOL v20 = 1;
      goto LABEL_19;
    }
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v4 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self errorDomain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v5 = [(ASRSchemaASRSampledAudioFileStorageFailed *)self underlyingErrorDomain];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRSampledAudioFileStorageFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSampledAudioStorageFailureReason
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSampledAudioStorageFailureReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSampledAudioStorageFailureReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSampledAudioStorageFailureReason:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int sampledAudioStorageFailureReason = a3;
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
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
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
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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

@end