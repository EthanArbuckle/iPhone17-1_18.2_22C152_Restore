@interface MHSchemaMHSiriDirectedSpeechDetectionFailed
- (BOOL)hasErrorCode;
- (BOOL)hasErrorMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHSiriDirectedSpeechDetectionFailed)initWithDictionary:(id)a3;
- (MHSchemaMHSiriDirectedSpeechDetectionFailed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)errorMessage;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)errorCode;
- (void)deleteErrorCode;
- (void)deleteErrorMessage;
- (void)setErrorCode:(unsigned int)a3;
- (void)setErrorMessage:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorMessage:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHSiriDirectedSpeechDetectionFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasErrorMessage:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (MHSchemaMHSiriDirectedSpeechDetectionFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaMHSiriDirectedSpeechDetectionFailed;
  v5 = [(MHSchemaMHSiriDirectedSpeechDetectionFailed *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"errorMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaMHSiriDirectedSpeechDetectionFailed *)v5 setErrorMessage:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHSiriDirectedSpeechDetectionFailed setErrorCode:](v5, "setErrorCode:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (MHSchemaMHSiriDirectedSpeechDetectionFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHSiriDirectedSpeechDetectionFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHSiriDirectedSpeechDetectionFailed *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHSiriDirectedSpeechDetectionFailed errorCode](self, "errorCode"));
    [v3 setObject:v4 forKeyedSubscript:@"errorCode"];
  }
  if (self->_errorMessage)
  {
    v5 = [(MHSchemaMHSiriDirectedSpeechDetectionFailed *)self errorMessage];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"errorMessage"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorMessage hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(MHSchemaMHSiriDirectedSpeechDetectionFailed *)self errorMessage];
  v6 = [v4 errorMessage];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(MHSchemaMHSiriDirectedSpeechDetectionFailed *)self errorMessage];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(MHSchemaMHSiriDirectedSpeechDetectionFailed *)self errorMessage];
    objc_super v11 = [v4 errorMessage];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(MHSchemaMHSiriDirectedSpeechDetectionFailed *)self errorMessage];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHSiriDirectedSpeechDetectionFailedReadFrom(self, (uint64_t)a3);
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

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int errorCode = a3;
}

- (void)deleteErrorMessage
{
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

@end